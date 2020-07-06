<?php
namespace app\Admin\controller;

class Index
{
    public function index()
    {
        return '<h1>PHPTHINK5.1</h1>';
    }

    public function hello($name = 'ThinkPHP5')
    {
        return 'hello,' . $name;
    }
}