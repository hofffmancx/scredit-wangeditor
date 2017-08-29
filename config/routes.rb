Rails.application.routes.draw do

  get "about/index"
  get 'comments', to: 'welcome#index'
  post 'comments', to: 'welcome#create'

  get 'pictures/upload'
  post '/upload', to: 'pictures#upload', as: 'upload'


  root 'welcome#index'


  devise_for :users
  resources :articlealls  # 资讯聚合页
  resources :messages
  resources :stories


  namespace :admin do

    resources :banners
    resources :messages do

      member do
        post :is_read
      end
    end
    resources :article_categories
    resources :country_categories

    resources :products do
       #后台上架网址 admin/products
      resources :projects
      member do
        patch :move_up         #商品位置移动
        patch :move_down       #商品位置移动
      end
    end
    resources :orders do       #管理员查看订单
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :courses do        #后台上架课程 admin/courses
      member do
        patch :move_up           #课程位置移动
        patch :move_down         #课程位置移动
      end
    end
    resources :articles do       #文章后台
      member do
        patch :move_up           #文章位置移动
        patch :move_down         #文章位置移动
        post :publish
        post :hide
      end
    end

    resources :stories do       #成功案例后台
      member do
        patch :move_up           #文章位置移动
        patch :move_down         #文章位置移动
        post :publish
        post :hide
      end
    end

    resources :activities do       #热门活动后台
      member do
        patch :move_up           #文章位置移动
        patch :move_down         #文章位置移动
        post :publish
        post :hide
      end
    end

    resources :companyprofiles do       #公司简介后台

    end

    resources :companyhonors do       #企业荣誉后台

    end

    resources :companycultures do       #企业文化后台

    end

    resources :eliteteams do           #精英团队后台

    end

  end

  resources :products do      #前台product
    member do
      post :add_to_cart       #加入购物车
      post :join              #加入收藏
      post :quit              #取消收藏
    end
    collection do
      get :search             #搜索功能

    end
    resources :reviews
    resources :projects       #国家下的具体移民项目
  end

  resources :courses do         #前台显示课程
    member do
      post :add_to_cart
      post :instant_buy
    end
  end

  resources :carts do         #购物车明细
    collection do
      delete :clean           #清空购物车
      post :checkout          #提交订单
    end
  end

  resources :cart_items       #购物车列表

  resources :orders do        #商品订单
    member do
      post :pay_whit_alipay   #支付宝支付
      post :pay_whit_wechat   #微信支付
      post :apply_to_cancel   #用户申请撤销订单
    end
  end

  resources :course_orders do        #课程订单
    member do
      post :pay_whit_alipay   #支付宝支付
      post :pay_whit_wechat   #微信支付
      post :apply_to_cancel   #用户申请撤销订单
    end
  end

  namespace :account do
    resources :orders          #用户后台查看订单
    resources :collections     #用户商品收藏
    resources :users           #用户编辑个人信息
    resources :article_collections      #用户文章收藏
  end


  resources :articles do         #文章前台
    resources :article_reviews
    member do
      post :join              #加入收藏
      post :quit              #取消收藏
    end
  end

  resources :activities do         #热门活动前台
    resources :activity_reviews
    member do
      post :join              #加入收藏
      post :quit              #取消收藏
    end
  end

  resources :companyprofiles do       #公司简介前台

  end

  resources :companyhonors do       #企业荣誉前台

  end

  resources :companycultures do       #企业文化前台

  end

  resources :eliteteams do           #精英团队前台

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
