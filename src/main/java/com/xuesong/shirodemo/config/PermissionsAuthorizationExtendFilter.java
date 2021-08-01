package com.xuesong.shirodemo.config;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author xuesong_qin
 * @version 1.0
 * @date 2021/7/31 17:31
 */
public class PermissionsAuthorizationExtendFilter extends PermissionsAuthorizationFilter {
    /**
     * 判断是否拦截(false为拦截,true为放行)
     * @param request
     * @param response
     * @param mappedValue
     * @return
     * @throws IOException
     */
    @Override
    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws IOException {
        return super.isAccessAllowed(request, response, mappedValue);
    }

    /**
     * 当上面的方法isAccessAllowed()返回false后拦截,这个方法返回false表示处理完毕(不放行),返回true 表示需要继续处理(放行)
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String requestURI = httpServletRequest.getRequestURI();
        Subject subject = this.getSubject(httpServletRequest, httpServletResponse);
        AjaxResult ajaxResult;
        String string = "XMLHttpRequest";
        String header = httpServletRequest.getHeader("X-Requested-With");
        if (subject.getPrincipal() == null) {
            // 判断该请求是否为Ajax请求
            if (string.equals(header)) {
                // 执行Ajax请求返回的错误返回值
                ajaxResult = AjaxResult.error("您尚未登录或登录时间过长,请重新登录!!");
                return false;
            } else {
                this.saveRequestAndRedirectToLogin(httpServletRequest, httpServletResponse);
            }
        } else if (string.equals(header)) {
            // 执行ajax请求返回的错误返回值
            ajaxResult = AjaxResult.error("你没有操作权限!");
            return false;
        } else {
            String unauthorizedUrl = this.getUnauthorizedUrl();
            if (!StringUtils.isEmpty(unauthorizedUrl)) {
                WebUtils.issueRedirect(httpServletRequest, httpServletResponse, unauthorizedUrl);
            }else {
                WebUtils.toHttp(httpServletResponse).setStatus(401);
            }
        }
        ///return super.onAccessDenied(request, response);
        return false;
    }
}
