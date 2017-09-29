module ApplicationHelper

  def box_tag options={}
    %Q(
    <div class='col-md-#{options[:width]}'>
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">#{options[:title]}</h3>
        </div>
        #{yield}
      </div>
    </div>
    ).html_safe
  end
end
