<#import "./shared_macros.ftl" as shared>
apply plugin: 'com.android.feature'

<@shared.androidConfig isBaseFeature=true canUseProguard=true/>

dependencies {
  application project(':${monolithicAppProjectName}')
  feature project(':${projectName}')
}
