<#import "template.ftl" as layout>
<div class="${properties.customFlex!}">
<div>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
     <#--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  -->
  <#--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  -->
    <script>
    function enableloginbtn(a,b){
        var checkedValue = document.querySelector('#agreecheck').checked;
        if(checkedValue == true){
            document.getElementById("kc-login").disabled = false;
        }
        else{
            document.getElementById("kc-login").disabled = true;
        }
    }

    function myFunction(x) {
        x.classList.toggle("fa-angle-down");
        if (window.getComputedStyle(document.getElementById("demo")).display === 'block') {
		document.getElementById("demo").style.display="none";
		return;
	    }
        document.getElementById("demo").style.display="block"

	// Otherwise, show it
	show(elem);
        }
    </script>
    <#if section = "header">
        <#--  ${msg("doLogIn")}  -->
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <div class="${properties.customFlex!}">
                <div class="${properties.kcFormGroupClass!}">
                    <#--  <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>  -->

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.customInputClass!}" name="username" placeholder="User ID" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.customInputClass!}" name="username" placeholder="User ID" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <#--  <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>  -->
                    <input tabindex="2" id="password" class="${properties.customInputClass!}" placeholder="Password" name="password" type="password" autocomplete="off" />
                </div>
            </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                  </div>
                  <div>
                  <input type="checkbox" id="agreecheck" onclick="enableloginbtn()"  class="${properties.custCheckbox!}"/><span class="${properties.agreeText!}">&nbsp; I agree to the terms and conditions below</span>
                  </div>
                    <br>
                  <div class="${properties.lineThrough!}" >
                  <i  style="font-size:22px" onclick="myFunction(this)" class="fa fa-angle-right"></i>&nbsp;&nbsp; Read terms and conditions
                        <div id="demo" style="display:none">
                            <ul>
                                <li>terms and conditions...1</li>
                                <li>terms and conditions...2</li>
                            </ul>
                        </div>
                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="${properties.kcButtonClass!} ${properties.loginButtonClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" disabled/>
                 </div>

                  <div>&copy; FUJITSU LIMITED 2020.</div>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
</div>
</div>
