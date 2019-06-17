<?php

class ControllerInformationInformation extends Controller
{
    public function index()
    {
        $this->load->language('information/information');

        $this->load->model('catalog/information');
        $data['emailto'] = $this->config->get('config_email');
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => 'Главная',
            'href' => $this->url->link('common/home')
        );

        // if page review
        if (isset($_REQUEST['_route_']) && $_REQUEST['_route_'] == 'reviews') {


            $this->load->model('tool/image');
            $this->load->model('catalog/news');
            $filter_data = array(
                'sort' => 'n.date_added',
                'order' => 'DESC',
                'start' => '0',
                'limit' => '6'
            );
            $news_list = $this->model_catalog_news->getNews($filter_data);

            $data['news_list'] = array();


            if ($news_list) {

                $news_setting = array();

                if ($this->config->get('news_setting')) {
                    $news_setting = $this->config->get('news_setting');
                }else{
                    $news_setting['description_limit'] = '300';
                    $news_setting['news_thumb_width'] = '220';
                    $news_setting['news_thumb_height'] = '220';
                }

                foreach ($news_list as $result) {

                    if($result['image']){
                        $image = $this->model_tool_image->resize($result['image'], '260', '230');
                    }else{
                        $image = false;
                    }

                    $data['news_list'][] = array(
                        'title'         => $result['title'],
                        'thumb'         => $image,
                        'position'      => $result['position'],
                        'description'   => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES,
                            'UTF-8')), 0, $news_setting['description_limit'])
                    );
                }

            }


        }

        if (isset($this->request->get['information_id'])) {
            $information_id = (int)$this->request->get['information_id'];
        } else {
            $information_id = 0;
        }

        $information_info = $this->model_catalog_information->getInformation($information_id);

        if ($information_info) {

            if ($information_info['meta_title']) {
                $this->document->setTitle($information_info['meta_title']);
            } else {
                $this->document->setTitle($information_info['title']);
            }

            $this->document->setDescription($information_info['meta_description']);
            $this->document->setKeywords($information_info['meta_keyword']);

            $data['breadcrumbs'][] = array(
                'text' => $information_info['title'],
                'href' => $this->url->link('information/information', 'information_id=' . $information_id)
            );

            if ($information_info['meta_h1']) {
                $data['heading_title'] = $information_info['meta_h1'];
            } else {
                $data['heading_title'] = $information_info['title'];
            }

            $data['button_continue'] = $this->language->get('button_continue');

            $data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('information/information', $data));
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('information/information', 'information_id=' . $information_id)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }

    public function agree()
    {
        $this->load->model('catalog/information');

        if (isset($this->request->get['information_id'])) {
            $information_id = (int)$this->request->get['information_id'];
        } else {
            $information_id = 0;
        }

        $output = '';

        $information_info = $this->model_catalog_information->getInformation($information_id);

        if ($information_info) {
            $output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
        }

        $this->response->setOutput($output);
    }
}