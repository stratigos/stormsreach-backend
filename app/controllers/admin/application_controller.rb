class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin/admin".freeze

  private

    # Redirect to an Active Record instance's #show Action, and set a
    #  successful flash message.
    def redirect_to_model_save(model)
      redirect_to [:admin, model],
        notice: I18n.t(:successful_model_save, scope: [:admin, :crud], model_name: model.class.name)
    end

    # Redirect to a Active Record nested association's #show Action, and set a
    #  successful flash message.
    # @param models Array
    #  * Pass an array of models that represent a nested hierarchy of
    #   associations, or just a single model.
    #  * E.g., `[@avatar]` or `[@avatar, @vendor]`
    def redirect_to_nested_model_save(models)
      redirect_to [:admin, *models],
        notice: I18n.t(:successful_model_save, scope: [:admin, :crud], model_name: models.last.class.name)
    end

end
