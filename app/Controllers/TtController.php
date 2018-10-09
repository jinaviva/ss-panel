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
    
    public function vttandr($request, $response, $args)
    {
        return $this->view()->display('tt/vttandr.tpl');
    }
    
    public function vttios($request, $response, $args)
    {
        return $this->view()->display('tt/vttios.tpl');
    }
    
    public function vttmacos($request, $response, $args)
    {
        return $this->view()->display('tt/vttmacos.tpl');
    }
}