<?php
namespace App\Controllers;

/**
 *  TtController
 */

class TtController extends BaseController 
{
    public function index($request, $response, $args)
    {
        return $this->view()->display('tt/vtt.tpl');
    }
    
    public function vttwin($request, $response, $args)
    {
        return $this->view()->display('tt/vttwin.tpl');
    }
}