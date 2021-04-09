<?php
namespace App\Controllers;

/**
 *  TtController
 */

class TtController extends BaseController 
{
    public function index($request, $response, $args)
    {
        return $this->view()->display('tt/tt.tpl');
    }
    
    public function vttwin($request, $response, $args)
    {
        return $this->view()->display('tt/vttwin.tpl');
    }
    
    public function vttandr($request, $response, $args)
    {
        return $this->view()->display('tt/vttandr_1.tpl');
    }
    
    public function vttios($request, $response, $args)
    {
        return $this->view()->display('tt/vttios.tpl');
    }
    
    public function vttmacos($request, $response, $args)
    {
        return $this->view()->display('tt/vttmacos.tpl');
    }
    
    
    //ss turtorial
    public function ss($request, $response, $args)
    {
        return $this->view()->display('tt/ss.tpl');
    }
    
    public function sswin($request, $response, $args)
    {
        return $this->view()->display('tt/sswin.tpl');
    }
    
    public function ssandr($request, $response, $args)
    {
        return $this->view()->display('tt/ssandr.tpl');
    }
    
    public function ssios($request, $response, $args)
    {
        return $this->view()->display('tt/ssios.tpl');
    }
    
    public function ssmacos($request, $response, $args)
    {
        return $this->view()->display('tt/ssosx.tpl');
    }
    
}