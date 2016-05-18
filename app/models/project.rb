class Project < ActiveRecord::Base
  belongs_to :tenant
  has_many :arifacts, dependent: :destroy
  has_many :user_projects
  has_many :projects, through: :user_projects
  validate :free_plan_can_only_have_one_project
  validates_uniqueness_of :title

  def free_plan_can_only_have_one_project
    if self.new_record? && (tenant.projects.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free accounts can only have one project.")
    end
  end

  def self.by_user_plan_and_tenant(tenant_id, user)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      if user.is_admin?
        tenant.projects
      else
        user.projects.where(tenant_id: tenant.id)
      end
    else
      if user.is_admin?
        tenant.projects.order(:id).limit(1)
      else
        user.projects.where(tenant_id: tenant.id).order(:id).limit(1)
      end
    end
  end
end
