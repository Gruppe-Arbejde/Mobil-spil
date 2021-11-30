// Compiled shader for Android

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/BLUR" {
Properties {
 _Color ("Main Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _BumpAmt ("Distortion", Range(0.000000,128.000000)) = 10.000000
 _MainTex ("Tint Color (RGB)", 2D) = "white" { }
 _BumpMap ("Normalmap", 2D) = "bump" { }
 _Size ("Size", Range(0.000000,20.000000)) = 1.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
 GrabPass {
  Tags { "LIGHTMODE"="ALWAYS" }
 }
 Pass {
  Tags { "LIGHTMODE"="ALWAYS" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_GrabTexture" to slot 0

Constant Buffer "$Globals" (20 bytes) {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "$Globals" (128 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat6;
void main()
{
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat1.x = _GrabTexture_TexelSize.x * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(3.0, -4.0, -3.0, -2.0) + vs_TEXCOORD0.xxxx;
    u_xlat0.xz = u_xlat2.yz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat0.zw);
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.x = u_xlat2.w;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat3.z = (-_GrabTexture_TexelSize.x) * _Size + vs_TEXCOORD0.x;
    u_xlat6.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat3.x = _GrabTexture_TexelSize.x * _Size + vs_TEXCOORD0.x;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat3.z = u_xlat1.x * 2.0 + vs_TEXCOORD0.x;
    u_xlat2.z = u_xlat1.x * 4.0 + vs_TEXCOORD0.x;
    u_xlat1.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat1 = u_xlat2 / vs_TEXCOORD0.wwww;
    u_xlat16_2 = texture(_GrabTexture, u_xlat1.zw);
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_GrabTexture" to slot 0

Constant Buffer "$Globals" (20 bytes) {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "$Globals" (128 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat6;
void main()
{
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat1.x = _GrabTexture_TexelSize.x * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(3.0, -4.0, -3.0, -2.0) + vs_TEXCOORD0.xxxx;
    u_xlat0.xz = u_xlat2.yz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat0.zw);
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.x = u_xlat2.w;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat3.z = (-_GrabTexture_TexelSize.x) * _Size + vs_TEXCOORD0.x;
    u_xlat6.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat3.x = _GrabTexture_TexelSize.x * _Size + vs_TEXCOORD0.x;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat3.z = u_xlat1.x * 2.0 + vs_TEXCOORD0.x;
    u_xlat2.z = u_xlat1.x * 4.0 + vs_TEXCOORD0.x;
    u_xlat1.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat1 = u_xlat2 / vs_TEXCOORD0.wwww;
    u_xlat16_2 = texture(_GrabTexture, u_xlat1.zw);
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_GrabTexture" to slot 0

Constant Buffer "$Globals" (20 bytes) {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "$Globals" (128 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat6;
void main()
{
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat1.x = _GrabTexture_TexelSize.x * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(3.0, -4.0, -3.0, -2.0) + vs_TEXCOORD0.xxxx;
    u_xlat0.xz = u_xlat2.yz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat0.zw);
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.x = u_xlat2.w;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat3.z = (-_GrabTexture_TexelSize.x) * _Size + vs_TEXCOORD0.x;
    u_xlat6.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat3.x = _GrabTexture_TexelSize.x * _Size + vs_TEXCOORD0.x;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat3.z = u_xlat1.x * 2.0 + vs_TEXCOORD0.x;
    u_xlat2.z = u_xlat1.x * 4.0 + vs_TEXCOORD0.x;
    u_xlat1.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat1 = u_xlat2 / vs_TEXCOORD0.wwww;
    u_xlat16_2 = texture(_GrabTexture, u_xlat1.zw);
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_GrabTexture" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals3896912194" (20 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "VGlobals3896912194" (128 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 125

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95
                              Name 95  "vs_TEXCOORD0"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 6(float)
             113:             TypePointer Function 7(fvec4)
             115:             TypeVector 21(int) 4
             116:             TypePointer Function 115(ivec4)
             118:             TypeBool
             119:             TypeVector 118(bool) 4
             120:             TypePointer Function 119(bvec4)
             122:             TypeVector 14(int) 4
             123:             TypePointer Function 122(ivec4)
               4:           2 Function None 3
               5:             Label
             114:    113(ptr) Variable Function
             117:    116(ptr) Variable Function
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             108:    107(ptr) AccessChain 79 22 75
             109:    6(float) Load 108
             110:    6(float) FNegate 109
             111:    107(ptr) AccessChain 79 22 75
                              Store 111 110
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 263

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 248
                              ExecutionMode 4 OriginUpperLeft
                              Name 11  "vs_TEXCOORD0"
                              Decorate 11(vs_TEXCOORD0) Location 0
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 0
                              Decorate 54 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 57 DescriptorSet 0
                              Decorate 57 Binding 1
                              Decorate 58 RelaxedPrecision
                              Decorate 61 RelaxedPrecision
                              Decorate 61 DescriptorSet 0
                              Decorate 61 Binding 0
                              Decorate 62 RelaxedPrecision
                              Decorate 68 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 70 RelaxedPrecision
                              Decorate 76 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 101 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 107 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 130 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 135 RelaxedPrecision
                              Decorate 138 RelaxedPrecision
                              Decorate 146 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 151 RelaxedPrecision
                              Decorate 154 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 176 RelaxedPrecision
                              Decorate 180 RelaxedPrecision
                              Decorate 181 RelaxedPrecision
                              Decorate 207 RelaxedPrecision
                              Decorate 208 RelaxedPrecision
                              Decorate 209 RelaxedPrecision
                              Decorate 214 RelaxedPrecision
                              Decorate 215 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 227 RelaxedPrecision
                              Decorate 228 RelaxedPrecision
                              Decorate 233 RelaxedPrecision
                              Decorate 234 RelaxedPrecision
                              Decorate 239 RelaxedPrecision
                              Decorate 240 RelaxedPrecision
                              Decorate 243 RelaxedPrecision
                              Decorate 244 RelaxedPrecision
                              Decorate 248 RelaxedPrecision
                              Decorate 248 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
11(vs_TEXCOORD0):     10(ptr) Variable Input
              12:             TypeVector 6(float) 2
              17:      8(ptr) Variable Private
              18:             TypeStruct 7(fvec4) 6(float)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:             TypeInt 32 0
              24:     23(int) Constant 0
              25:             TypePointer Uniform 6(float)
              28:     21(int) Constant 1
              32:             TypePointer Private 6(float)
              34:      8(ptr) Variable Private
              37:    6(float) Constant 1077936128
              38:    6(float) Constant 3229614080
              39:    6(float) Constant 3225419776
              40:    6(float) Constant 3221225472
              41:    7(fvec4) ConstantComposite 37 38 39 40
              54:      8(ptr) Variable Private
              55:             TypeImage 6(float) 2D sampled format:Unknown
              56:             TypePointer UniformConstant 55
              57:     56(ptr) Variable UniformConstant
              59:             TypeSampler
              60:             TypePointer UniformConstant 59
              61:     60(ptr) Variable UniformConstant
              63:             TypeSampledImage 55
              68:      8(ptr) Variable Private
              75:      8(ptr) Variable Private
              77:    6(float) Constant 1035489772
              78:    7(fvec4) ConstantComposite 77 77 77 77
              81:    6(float) Constant 1028443341
              82:    7(fvec4) ConstantComposite 81 81 81 81
              86:     23(int) Constant 3
              94:             TypePointer Private 12(fvec2)
              95:     94(ptr) Variable Private
             101:      8(ptr) Variable Private
             108:    6(float) Constant 1039516303
             109:    7(fvec4) ConstantComposite 108 108 108 108
             119:             TypePointer Input 6(float)
             123:     23(int) Constant 2
             136:    6(float) Constant 1041865114
             137:    7(fvec4) ConstantComposite 136 136 136 136
             152:    6(float) Constant 1043878380
             153:    7(fvec4) ConstantComposite 152 152 152 152
             186:    6(float) Constant 1073741824
             194:    6(float) Constant 1082130432
             207:      8(ptr) Variable Private
             226:      8(ptr) Variable Private
             247:             TypePointer Output 7(fvec4)
             248:    247(ptr) Variable Output
             251:             TypePointer Function 7(fvec4)
             253:             TypeVector 21(int) 4
             254:             TypePointer Function 253(ivec4)
             256:             TypeBool
             257:             TypeVector 256(bool) 4
             258:             TypePointer Function 257(bvec4)
             260:             TypeVector 23(int) 4
             261:             TypePointer Function 260(ivec4)
               4:           2 Function None 3
               5:             Label
             252:    251(ptr) Variable Function
             255:    254(ptr) Variable Function
             259:    258(ptr) Variable Function
             262:    261(ptr) Variable Function
              13:    7(fvec4) Load 11(vs_TEXCOORD0)
              14:   12(fvec2) VectorShuffle 13 13 1 1
              15:    7(fvec4) Load 9
              16:    7(fvec4) VectorShuffle 15 14 0 4 2 5
                              Store 9 16
              26:     25(ptr) AccessChain 20 22 24
              27:    6(float) Load 26
              29:     25(ptr) AccessChain 20 28
              30:    6(float) Load 29
              31:    6(float) FMul 27 30
              33:     32(ptr) AccessChain 17 24
                              Store 33 31
              35:    7(fvec4) Load 17
              36:    7(fvec4) VectorShuffle 35 35 0 0 0 0
              42:    7(fvec4) FMul 36 41
              43:    7(fvec4) Load 11(vs_TEXCOORD0)
              44:    7(fvec4) VectorShuffle 43 43 0 0 0 0
              45:    7(fvec4) FAdd 42 44
                              Store 34 45
              46:    7(fvec4) Load 34
              47:   12(fvec2) VectorShuffle 46 46 1 2
              48:    7(fvec4) Load 9
              49:    7(fvec4) VectorShuffle 48 47 4 1 5 3
                              Store 9 49
              50:    7(fvec4) Load 9
              51:    7(fvec4) Load 11(vs_TEXCOORD0)
              52:    7(fvec4) VectorShuffle 51 51 3 3 3 3
              53:    7(fvec4) FDiv 50 52
                              Store 9 53
              58:          55 Load 57
              62:          59 Load 61
              64:          63 SampledImage 58 62
              65:    7(fvec4) Load 9
              66:   12(fvec2) VectorShuffle 65 65 2 3
              67:    7(fvec4) ImageSampleImplicitLod 64 66
                              Store 54 67
              69:          55 Load 57
              70:          59 Load 61
              71:          63 SampledImage 69 70
              72:    7(fvec4) Load 9
              73:   12(fvec2) VectorShuffle 72 72 0 1
              74:    7(fvec4) ImageSampleImplicitLod 71 73
                              Store 68 74
              76:    7(fvec4) Load 54
              79:    7(fvec4) FMul 76 78
                              Store 75 79
              80:    7(fvec4) Load 68
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 75
              85:    7(fvec4) FAdd 83 84
                              Store 9 85
              87:     32(ptr) AccessChain 34 86
              88:    6(float) Load 87
              89:     32(ptr) AccessChain 75 24
                              Store 89 88
              90:    7(fvec4) Load 11(vs_TEXCOORD0)
              91:   12(fvec2) VectorShuffle 90 90 1 1
              92:    7(fvec4) Load 75
              93:    7(fvec4) VectorShuffle 92 91 0 4 2 5
                              Store 75 93
              96:    7(fvec4) Load 75
              97:   12(fvec2) VectorShuffle 96 96 0 1
              98:    7(fvec4) Load 11(vs_TEXCOORD0)
              99:   12(fvec2) VectorShuffle 98 98 3 3
             100:   12(fvec2) FDiv 97 99
                              Store 95 100
             102:          55 Load 57
             103:          59 Load 61
             104:          63 SampledImage 102 103
             105:   12(fvec2) Load 95
             106:    7(fvec4) ImageSampleImplicitLod 104 105
                              Store 101 106
             107:    7(fvec4) Load 101
             110:    7(fvec4) FMul 107 109
             111:    7(fvec4) Load 9
             112:    7(fvec4) FAdd 110 111
                              Store 9 112
             113:     25(ptr) AccessChain 20 22 24
             114:    6(float) Load 113
             115:    6(float) FNegate 114
             116:     25(ptr) AccessChain 20 28
             117:    6(float) Load 116
             118:    6(float) FMul 115 117
             120:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             121:    6(float) Load 120
             122:    6(float) FAdd 118 121
             124:     32(ptr) AccessChain 75 123
                              Store 124 122
             125:    7(fvec4) Load 75
             126:   12(fvec2) VectorShuffle 125 125 2 3
             127:    7(fvec4) Load 11(vs_TEXCOORD0)
             128:   12(fvec2) VectorShuffle 127 127 3 3
             129:   12(fvec2) FDiv 126 128
                              Store 95 129
             130:          55 Load 57
             131:          59 Load 61
             132:          63 SampledImage 130 131
             133:   12(fvec2) Load 95
             134:    7(fvec4) ImageSampleImplicitLod 132 133
                              Store 54 134
             135:    7(fvec4) Load 54
             138:    7(fvec4) FMul 135 137
             139:    7(fvec4) Load 9
             140:    7(fvec4) FAdd 138 139
                              Store 9 140
             141:    7(fvec4) Load 11(vs_TEXCOORD0)
             142:   12(fvec2) VectorShuffle 141 141 0 1
             143:    7(fvec4) Load 11(vs_TEXCOORD0)
             144:   12(fvec2) VectorShuffle 143 143 3 3
             145:   12(fvec2) FDiv 142 144
                              Store 95 145
             146:          55 Load 57
             147:          59 Load 61
             148:          63 SampledImage 146 147
             149:   12(fvec2) Load 95
             150:    7(fvec4) ImageSampleImplicitLod 148 149
                              Store 54 150
             151:    7(fvec4) Load 54
             154:    7(fvec4) FMul 151 153
             155:    7(fvec4) Load 9
             156:    7(fvec4) FAdd 154 155
                              Store 9 156
             157:     25(ptr) AccessChain 20 22 24
             158:    6(float) Load 157
             159:     25(ptr) AccessChain 20 28
             160:    6(float) Load 159
             161:    6(float) FMul 158 160
             162:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             163:    6(float) Load 162
             164:    6(float) FAdd 161 163
             165:     32(ptr) AccessChain 75 24
                              Store 165 164
             166:    7(fvec4) Load 11(vs_TEXCOORD0)
             167:   12(fvec2) VectorShuffle 166 166 1 1
             168:    7(fvec4) Load 75
             169:    7(fvec4) VectorShuffle 168 167 0 4 2 5
                              Store 75 169
             170:    7(fvec4) Load 75
             171:   12(fvec2) VectorShuffle 170 170 0 1
             172:    7(fvec4) Load 11(vs_TEXCOORD0)
             173:   12(fvec2) VectorShuffle 172 172 3 3
             174:   12(fvec2) FDiv 171 173
                              Store 95 174
             175:          55 Load 57
             176:          59 Load 61
             177:          63 SampledImage 175 176
             178:   12(fvec2) Load 95
             179:    7(fvec4) ImageSampleImplicitLod 177 178
                              Store 101 179
             180:    7(fvec4) Load 101
             181:    7(fvec4) FMul 180 137
             182:    7(fvec4) Load 9
             183:    7(fvec4) FAdd 181 182
                              Store 9 183
             184:     32(ptr) AccessChain 17 24
             185:    6(float) Load 184
             187:    6(float) FMul 185 186
             188:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             189:    6(float) Load 188
             190:    6(float) FAdd 187 189
             191:     32(ptr) AccessChain 75 123
                              Store 191 190
             192:     32(ptr) AccessChain 17 24
             193:    6(float) Load 192
             195:    6(float) FMul 193 194
             196:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             197:    6(float) Load 196
             198:    6(float) FAdd 195 197
             199:     32(ptr) AccessChain 34 123
                              Store 199 198
             200:    7(fvec4) Load 75
             201:   12(fvec2) VectorShuffle 200 200 2 3
             202:    7(fvec4) Load 11(vs_TEXCOORD0)
             203:   12(fvec2) VectorShuffle 202 202 3 3
             204:   12(fvec2) FDiv 201 203
             205:    7(fvec4) Load 17
             206:    7(fvec4) VectorShuffle 205 204 4 5 2 3
                              Store 17 206
             208:          55 Load 57
             209:          59 Load 61
             210:          63 SampledImage 208 209
             211:    7(fvec4) Load 17
             212:   12(fvec2) VectorShuffle 211 211 0 1
             213:    7(fvec4) ImageSampleImplicitLod 210 212
                              Store 207 213
             214:    7(fvec4) Load 207
             215:    7(fvec4) FMul 214 109
             216:    7(fvec4) Load 9
             217:    7(fvec4) FAdd 215 216
                              Store 9 217
             218:    7(fvec4) Load 11(vs_TEXCOORD0)
             219:   12(fvec2) VectorShuffle 218 218 1 1
             220:    7(fvec4) Load 34
             221:    7(fvec4) VectorShuffle 220 219 0 4 2 5
                              Store 34 221
             222:    7(fvec4) Load 34
             223:    7(fvec4) Load 11(vs_TEXCOORD0)
             224:    7(fvec4) VectorShuffle 223 223 3 3 3 3
             225:    7(fvec4) FDiv 222 224
                              Store 17 225
             227:          55 Load 57
             228:          59 Load 61
             229:          63 SampledImage 227 228
             230:    7(fvec4) Load 17
             231:   12(fvec2) VectorShuffle 230 230 2 3
             232:    7(fvec4) ImageSampleImplicitLod 229 231
                              Store 226 232
             233:          55 Load 57
             234:          59 Load 61
             235:          63 SampledImage 233 234
             236:    7(fvec4) Load 17
             237:   12(fvec2) VectorShuffle 236 236 0 1
             238:    7(fvec4) ImageSampleImplicitLod 235 237
                              Store 207 238
             239:    7(fvec4) Load 207
             240:    7(fvec4) FMul 239 78
             241:    7(fvec4) Load 9
             242:    7(fvec4) FAdd 240 241
                              Store 9 242
             243:    7(fvec4) Load 226
             244:    7(fvec4) FMul 243 82
             245:    7(fvec4) Load 9
             246:    7(fvec4) FAdd 244 245
                              Store 9 246
             249:    7(fvec4) Load 9
                              Store 248 249
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_GrabTexture" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals3896912194" (20 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "VGlobals3896912194" (128 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 125

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95
                              Name 95  "vs_TEXCOORD0"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 6(float)
             113:             TypePointer Function 7(fvec4)
             115:             TypeVector 21(int) 4
             116:             TypePointer Function 115(ivec4)
             118:             TypeBool
             119:             TypeVector 118(bool) 4
             120:             TypePointer Function 119(bvec4)
             122:             TypeVector 14(int) 4
             123:             TypePointer Function 122(ivec4)
               4:           2 Function None 3
               5:             Label
             114:    113(ptr) Variable Function
             117:    116(ptr) Variable Function
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             108:    107(ptr) AccessChain 79 22 75
             109:    6(float) Load 108
             110:    6(float) FNegate 109
             111:    107(ptr) AccessChain 79 22 75
                              Store 111 110
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 263

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 248
                              ExecutionMode 4 OriginUpperLeft
                              Name 11  "vs_TEXCOORD0"
                              Decorate 11(vs_TEXCOORD0) Location 0
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 0
                              Decorate 54 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 57 DescriptorSet 0
                              Decorate 57 Binding 1
                              Decorate 58 RelaxedPrecision
                              Decorate 61 RelaxedPrecision
                              Decorate 61 DescriptorSet 0
                              Decorate 61 Binding 0
                              Decorate 62 RelaxedPrecision
                              Decorate 68 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 70 RelaxedPrecision
                              Decorate 76 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 101 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 107 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 130 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 135 RelaxedPrecision
                              Decorate 138 RelaxedPrecision
                              Decorate 146 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 151 RelaxedPrecision
                              Decorate 154 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 176 RelaxedPrecision
                              Decorate 180 RelaxedPrecision
                              Decorate 181 RelaxedPrecision
                              Decorate 207 RelaxedPrecision
                              Decorate 208 RelaxedPrecision
                              Decorate 209 RelaxedPrecision
                              Decorate 214 RelaxedPrecision
                              Decorate 215 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 227 RelaxedPrecision
                              Decorate 228 RelaxedPrecision
                              Decorate 233 RelaxedPrecision
                              Decorate 234 RelaxedPrecision
                              Decorate 239 RelaxedPrecision
                              Decorate 240 RelaxedPrecision
                              Decorate 243 RelaxedPrecision
                              Decorate 244 RelaxedPrecision
                              Decorate 248 RelaxedPrecision
                              Decorate 248 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
11(vs_TEXCOORD0):     10(ptr) Variable Input
              12:             TypeVector 6(float) 2
              17:      8(ptr) Variable Private
              18:             TypeStruct 7(fvec4) 6(float)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:             TypeInt 32 0
              24:     23(int) Constant 0
              25:             TypePointer Uniform 6(float)
              28:     21(int) Constant 1
              32:             TypePointer Private 6(float)
              34:      8(ptr) Variable Private
              37:    6(float) Constant 1077936128
              38:    6(float) Constant 3229614080
              39:    6(float) Constant 3225419776
              40:    6(float) Constant 3221225472
              41:    7(fvec4) ConstantComposite 37 38 39 40
              54:      8(ptr) Variable Private
              55:             TypeImage 6(float) 2D sampled format:Unknown
              56:             TypePointer UniformConstant 55
              57:     56(ptr) Variable UniformConstant
              59:             TypeSampler
              60:             TypePointer UniformConstant 59
              61:     60(ptr) Variable UniformConstant
              63:             TypeSampledImage 55
              68:      8(ptr) Variable Private
              75:      8(ptr) Variable Private
              77:    6(float) Constant 1035489772
              78:    7(fvec4) ConstantComposite 77 77 77 77
              81:    6(float) Constant 1028443341
              82:    7(fvec4) ConstantComposite 81 81 81 81
              86:     23(int) Constant 3
              94:             TypePointer Private 12(fvec2)
              95:     94(ptr) Variable Private
             101:      8(ptr) Variable Private
             108:    6(float) Constant 1039516303
             109:    7(fvec4) ConstantComposite 108 108 108 108
             119:             TypePointer Input 6(float)
             123:     23(int) Constant 2
             136:    6(float) Constant 1041865114
             137:    7(fvec4) ConstantComposite 136 136 136 136
             152:    6(float) Constant 1043878380
             153:    7(fvec4) ConstantComposite 152 152 152 152
             186:    6(float) Constant 1073741824
             194:    6(float) Constant 1082130432
             207:      8(ptr) Variable Private
             226:      8(ptr) Variable Private
             247:             TypePointer Output 7(fvec4)
             248:    247(ptr) Variable Output
             251:             TypePointer Function 7(fvec4)
             253:             TypeVector 21(int) 4
             254:             TypePointer Function 253(ivec4)
             256:             TypeBool
             257:             TypeVector 256(bool) 4
             258:             TypePointer Function 257(bvec4)
             260:             TypeVector 23(int) 4
             261:             TypePointer Function 260(ivec4)
               4:           2 Function None 3
               5:             Label
             252:    251(ptr) Variable Function
             255:    254(ptr) Variable Function
             259:    258(ptr) Variable Function
             262:    261(ptr) Variable Function
              13:    7(fvec4) Load 11(vs_TEXCOORD0)
              14:   12(fvec2) VectorShuffle 13 13 1 1
              15:    7(fvec4) Load 9
              16:    7(fvec4) VectorShuffle 15 14 0 4 2 5
                              Store 9 16
              26:     25(ptr) AccessChain 20 22 24
              27:    6(float) Load 26
              29:     25(ptr) AccessChain 20 28
              30:    6(float) Load 29
              31:    6(float) FMul 27 30
              33:     32(ptr) AccessChain 17 24
                              Store 33 31
              35:    7(fvec4) Load 17
              36:    7(fvec4) VectorShuffle 35 35 0 0 0 0
              42:    7(fvec4) FMul 36 41
              43:    7(fvec4) Load 11(vs_TEXCOORD0)
              44:    7(fvec4) VectorShuffle 43 43 0 0 0 0
              45:    7(fvec4) FAdd 42 44
                              Store 34 45
              46:    7(fvec4) Load 34
              47:   12(fvec2) VectorShuffle 46 46 1 2
              48:    7(fvec4) Load 9
              49:    7(fvec4) VectorShuffle 48 47 4 1 5 3
                              Store 9 49
              50:    7(fvec4) Load 9
              51:    7(fvec4) Load 11(vs_TEXCOORD0)
              52:    7(fvec4) VectorShuffle 51 51 3 3 3 3
              53:    7(fvec4) FDiv 50 52
                              Store 9 53
              58:          55 Load 57
              62:          59 Load 61
              64:          63 SampledImage 58 62
              65:    7(fvec4) Load 9
              66:   12(fvec2) VectorShuffle 65 65 2 3
              67:    7(fvec4) ImageSampleImplicitLod 64 66
                              Store 54 67
              69:          55 Load 57
              70:          59 Load 61
              71:          63 SampledImage 69 70
              72:    7(fvec4) Load 9
              73:   12(fvec2) VectorShuffle 72 72 0 1
              74:    7(fvec4) ImageSampleImplicitLod 71 73
                              Store 68 74
              76:    7(fvec4) Load 54
              79:    7(fvec4) FMul 76 78
                              Store 75 79
              80:    7(fvec4) Load 68
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 75
              85:    7(fvec4) FAdd 83 84
                              Store 9 85
              87:     32(ptr) AccessChain 34 86
              88:    6(float) Load 87
              89:     32(ptr) AccessChain 75 24
                              Store 89 88
              90:    7(fvec4) Load 11(vs_TEXCOORD0)
              91:   12(fvec2) VectorShuffle 90 90 1 1
              92:    7(fvec4) Load 75
              93:    7(fvec4) VectorShuffle 92 91 0 4 2 5
                              Store 75 93
              96:    7(fvec4) Load 75
              97:   12(fvec2) VectorShuffle 96 96 0 1
              98:    7(fvec4) Load 11(vs_TEXCOORD0)
              99:   12(fvec2) VectorShuffle 98 98 3 3
             100:   12(fvec2) FDiv 97 99
                              Store 95 100
             102:          55 Load 57
             103:          59 Load 61
             104:          63 SampledImage 102 103
             105:   12(fvec2) Load 95
             106:    7(fvec4) ImageSampleImplicitLod 104 105
                              Store 101 106
             107:    7(fvec4) Load 101
             110:    7(fvec4) FMul 107 109
             111:    7(fvec4) Load 9
             112:    7(fvec4) FAdd 110 111
                              Store 9 112
             113:     25(ptr) AccessChain 20 22 24
             114:    6(float) Load 113
             115:    6(float) FNegate 114
             116:     25(ptr) AccessChain 20 28
             117:    6(float) Load 116
             118:    6(float) FMul 115 117
             120:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             121:    6(float) Load 120
             122:    6(float) FAdd 118 121
             124:     32(ptr) AccessChain 75 123
                              Store 124 122
             125:    7(fvec4) Load 75
             126:   12(fvec2) VectorShuffle 125 125 2 3
             127:    7(fvec4) Load 11(vs_TEXCOORD0)
             128:   12(fvec2) VectorShuffle 127 127 3 3
             129:   12(fvec2) FDiv 126 128
                              Store 95 129
             130:          55 Load 57
             131:          59 Load 61
             132:          63 SampledImage 130 131
             133:   12(fvec2) Load 95
             134:    7(fvec4) ImageSampleImplicitLod 132 133
                              Store 54 134
             135:    7(fvec4) Load 54
             138:    7(fvec4) FMul 135 137
             139:    7(fvec4) Load 9
             140:    7(fvec4) FAdd 138 139
                              Store 9 140
             141:    7(fvec4) Load 11(vs_TEXCOORD0)
             142:   12(fvec2) VectorShuffle 141 141 0 1
             143:    7(fvec4) Load 11(vs_TEXCOORD0)
             144:   12(fvec2) VectorShuffle 143 143 3 3
             145:   12(fvec2) FDiv 142 144
                              Store 95 145
             146:          55 Load 57
             147:          59 Load 61
             148:          63 SampledImage 146 147
             149:   12(fvec2) Load 95
             150:    7(fvec4) ImageSampleImplicitLod 148 149
                              Store 54 150
             151:    7(fvec4) Load 54
             154:    7(fvec4) FMul 151 153
             155:    7(fvec4) Load 9
             156:    7(fvec4) FAdd 154 155
                              Store 9 156
             157:     25(ptr) AccessChain 20 22 24
             158:    6(float) Load 157
             159:     25(ptr) AccessChain 20 28
             160:    6(float) Load 159
             161:    6(float) FMul 158 160
             162:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             163:    6(float) Load 162
             164:    6(float) FAdd 161 163
             165:     32(ptr) AccessChain 75 24
                              Store 165 164
             166:    7(fvec4) Load 11(vs_TEXCOORD0)
             167:   12(fvec2) VectorShuffle 166 166 1 1
             168:    7(fvec4) Load 75
             169:    7(fvec4) VectorShuffle 168 167 0 4 2 5
                              Store 75 169
             170:    7(fvec4) Load 75
             171:   12(fvec2) VectorShuffle 170 170 0 1
             172:    7(fvec4) Load 11(vs_TEXCOORD0)
             173:   12(fvec2) VectorShuffle 172 172 3 3
             174:   12(fvec2) FDiv 171 173
                              Store 95 174
             175:          55 Load 57
             176:          59 Load 61
             177:          63 SampledImage 175 176
             178:   12(fvec2) Load 95
             179:    7(fvec4) ImageSampleImplicitLod 177 178
                              Store 101 179
             180:    7(fvec4) Load 101
             181:    7(fvec4) FMul 180 137
             182:    7(fvec4) Load 9
             183:    7(fvec4) FAdd 181 182
                              Store 9 183
             184:     32(ptr) AccessChain 17 24
             185:    6(float) Load 184
             187:    6(float) FMul 185 186
             188:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             189:    6(float) Load 188
             190:    6(float) FAdd 187 189
             191:     32(ptr) AccessChain 75 123
                              Store 191 190
             192:     32(ptr) AccessChain 17 24
             193:    6(float) Load 192
             195:    6(float) FMul 193 194
             196:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             197:    6(float) Load 196
             198:    6(float) FAdd 195 197
             199:     32(ptr) AccessChain 34 123
                              Store 199 198
             200:    7(fvec4) Load 75
             201:   12(fvec2) VectorShuffle 200 200 2 3
             202:    7(fvec4) Load 11(vs_TEXCOORD0)
             203:   12(fvec2) VectorShuffle 202 202 3 3
             204:   12(fvec2) FDiv 201 203
             205:    7(fvec4) Load 17
             206:    7(fvec4) VectorShuffle 205 204 4 5 2 3
                              Store 17 206
             208:          55 Load 57
             209:          59 Load 61
             210:          63 SampledImage 208 209
             211:    7(fvec4) Load 17
             212:   12(fvec2) VectorShuffle 211 211 0 1
             213:    7(fvec4) ImageSampleImplicitLod 210 212
                              Store 207 213
             214:    7(fvec4) Load 207
             215:    7(fvec4) FMul 214 109
             216:    7(fvec4) Load 9
             217:    7(fvec4) FAdd 215 216
                              Store 9 217
             218:    7(fvec4) Load 11(vs_TEXCOORD0)
             219:   12(fvec2) VectorShuffle 218 218 1 1
             220:    7(fvec4) Load 34
             221:    7(fvec4) VectorShuffle 220 219 0 4 2 5
                              Store 34 221
             222:    7(fvec4) Load 34
             223:    7(fvec4) Load 11(vs_TEXCOORD0)
             224:    7(fvec4) VectorShuffle 223 223 3 3 3 3
             225:    7(fvec4) FDiv 222 224
                              Store 17 225
             227:          55 Load 57
             228:          59 Load 61
             229:          63 SampledImage 227 228
             230:    7(fvec4) Load 17
             231:   12(fvec2) VectorShuffle 230 230 2 3
             232:    7(fvec4) ImageSampleImplicitLod 229 231
                              Store 226 232
             233:          55 Load 57
             234:          59 Load 61
             235:          63 SampledImage 233 234
             236:    7(fvec4) Load 17
             237:   12(fvec2) VectorShuffle 236 236 0 1
             238:    7(fvec4) ImageSampleImplicitLod 235 237
                              Store 207 238
             239:    7(fvec4) Load 207
             240:    7(fvec4) FMul 239 78
             241:    7(fvec4) Load 9
             242:    7(fvec4) FAdd 240 241
                              Store 9 242
             243:    7(fvec4) Load 226
             244:    7(fvec4) FMul 243 82
             245:    7(fvec4) Load 9
             246:    7(fvec4) FAdd 244 245
                              Store 9 246
             249:    7(fvec4) Load 9
                              Store 248 249
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_GrabTexture" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals3896912194" (20 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "VGlobals3896912194" (128 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 125

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95
                              Name 95  "vs_TEXCOORD0"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 6(float)
             113:             TypePointer Function 7(fvec4)
             115:             TypeVector 21(int) 4
             116:             TypePointer Function 115(ivec4)
             118:             TypeBool
             119:             TypeVector 118(bool) 4
             120:             TypePointer Function 119(bvec4)
             122:             TypeVector 14(int) 4
             123:             TypePointer Function 122(ivec4)
               4:           2 Function None 3
               5:             Label
             114:    113(ptr) Variable Function
             117:    116(ptr) Variable Function
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             108:    107(ptr) AccessChain 79 22 75
             109:    6(float) Load 108
             110:    6(float) FNegate 109
             111:    107(ptr) AccessChain 79 22 75
                              Store 111 110
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 263

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 248
                              ExecutionMode 4 OriginUpperLeft
                              Name 11  "vs_TEXCOORD0"
                              Decorate 11(vs_TEXCOORD0) Location 0
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 0
                              Decorate 54 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 57 DescriptorSet 0
                              Decorate 57 Binding 1
                              Decorate 58 RelaxedPrecision
                              Decorate 61 RelaxedPrecision
                              Decorate 61 DescriptorSet 0
                              Decorate 61 Binding 0
                              Decorate 62 RelaxedPrecision
                              Decorate 68 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 70 RelaxedPrecision
                              Decorate 76 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 101 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 107 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 130 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 135 RelaxedPrecision
                              Decorate 138 RelaxedPrecision
                              Decorate 146 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 151 RelaxedPrecision
                              Decorate 154 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 176 RelaxedPrecision
                              Decorate 180 RelaxedPrecision
                              Decorate 181 RelaxedPrecision
                              Decorate 207 RelaxedPrecision
                              Decorate 208 RelaxedPrecision
                              Decorate 209 RelaxedPrecision
                              Decorate 214 RelaxedPrecision
                              Decorate 215 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 227 RelaxedPrecision
                              Decorate 228 RelaxedPrecision
                              Decorate 233 RelaxedPrecision
                              Decorate 234 RelaxedPrecision
                              Decorate 239 RelaxedPrecision
                              Decorate 240 RelaxedPrecision
                              Decorate 243 RelaxedPrecision
                              Decorate 244 RelaxedPrecision
                              Decorate 248 RelaxedPrecision
                              Decorate 248 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
11(vs_TEXCOORD0):     10(ptr) Variable Input
              12:             TypeVector 6(float) 2
              17:      8(ptr) Variable Private
              18:             TypeStruct 7(fvec4) 6(float)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:             TypeInt 32 0
              24:     23(int) Constant 0
              25:             TypePointer Uniform 6(float)
              28:     21(int) Constant 1
              32:             TypePointer Private 6(float)
              34:      8(ptr) Variable Private
              37:    6(float) Constant 1077936128
              38:    6(float) Constant 3229614080
              39:    6(float) Constant 3225419776
              40:    6(float) Constant 3221225472
              41:    7(fvec4) ConstantComposite 37 38 39 40
              54:      8(ptr) Variable Private
              55:             TypeImage 6(float) 2D sampled format:Unknown
              56:             TypePointer UniformConstant 55
              57:     56(ptr) Variable UniformConstant
              59:             TypeSampler
              60:             TypePointer UniformConstant 59
              61:     60(ptr) Variable UniformConstant
              63:             TypeSampledImage 55
              68:      8(ptr) Variable Private
              75:      8(ptr) Variable Private
              77:    6(float) Constant 1035489772
              78:    7(fvec4) ConstantComposite 77 77 77 77
              81:    6(float) Constant 1028443341
              82:    7(fvec4) ConstantComposite 81 81 81 81
              86:     23(int) Constant 3
              94:             TypePointer Private 12(fvec2)
              95:     94(ptr) Variable Private
             101:      8(ptr) Variable Private
             108:    6(float) Constant 1039516303
             109:    7(fvec4) ConstantComposite 108 108 108 108
             119:             TypePointer Input 6(float)
             123:     23(int) Constant 2
             136:    6(float) Constant 1041865114
             137:    7(fvec4) ConstantComposite 136 136 136 136
             152:    6(float) Constant 1043878380
             153:    7(fvec4) ConstantComposite 152 152 152 152
             186:    6(float) Constant 1073741824
             194:    6(float) Constant 1082130432
             207:      8(ptr) Variable Private
             226:      8(ptr) Variable Private
             247:             TypePointer Output 7(fvec4)
             248:    247(ptr) Variable Output
             251:             TypePointer Function 7(fvec4)
             253:             TypeVector 21(int) 4
             254:             TypePointer Function 253(ivec4)
             256:             TypeBool
             257:             TypeVector 256(bool) 4
             258:             TypePointer Function 257(bvec4)
             260:             TypeVector 23(int) 4
             261:             TypePointer Function 260(ivec4)
               4:           2 Function None 3
               5:             Label
             252:    251(ptr) Variable Function
             255:    254(ptr) Variable Function
             259:    258(ptr) Variable Function
             262:    261(ptr) Variable Function
              13:    7(fvec4) Load 11(vs_TEXCOORD0)
              14:   12(fvec2) VectorShuffle 13 13 1 1
              15:    7(fvec4) Load 9
              16:    7(fvec4) VectorShuffle 15 14 0 4 2 5
                              Store 9 16
              26:     25(ptr) AccessChain 20 22 24
              27:    6(float) Load 26
              29:     25(ptr) AccessChain 20 28
              30:    6(float) Load 29
              31:    6(float) FMul 27 30
              33:     32(ptr) AccessChain 17 24
                              Store 33 31
              35:    7(fvec4) Load 17
              36:    7(fvec4) VectorShuffle 35 35 0 0 0 0
              42:    7(fvec4) FMul 36 41
              43:    7(fvec4) Load 11(vs_TEXCOORD0)
              44:    7(fvec4) VectorShuffle 43 43 0 0 0 0
              45:    7(fvec4) FAdd 42 44
                              Store 34 45
              46:    7(fvec4) Load 34
              47:   12(fvec2) VectorShuffle 46 46 1 2
              48:    7(fvec4) Load 9
              49:    7(fvec4) VectorShuffle 48 47 4 1 5 3
                              Store 9 49
              50:    7(fvec4) Load 9
              51:    7(fvec4) Load 11(vs_TEXCOORD0)
              52:    7(fvec4) VectorShuffle 51 51 3 3 3 3
              53:    7(fvec4) FDiv 50 52
                              Store 9 53
              58:          55 Load 57
              62:          59 Load 61
              64:          63 SampledImage 58 62
              65:    7(fvec4) Load 9
              66:   12(fvec2) VectorShuffle 65 65 2 3
              67:    7(fvec4) ImageSampleImplicitLod 64 66
                              Store 54 67
              69:          55 Load 57
              70:          59 Load 61
              71:          63 SampledImage 69 70
              72:    7(fvec4) Load 9
              73:   12(fvec2) VectorShuffle 72 72 0 1
              74:    7(fvec4) ImageSampleImplicitLod 71 73
                              Store 68 74
              76:    7(fvec4) Load 54
              79:    7(fvec4) FMul 76 78
                              Store 75 79
              80:    7(fvec4) Load 68
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 75
              85:    7(fvec4) FAdd 83 84
                              Store 9 85
              87:     32(ptr) AccessChain 34 86
              88:    6(float) Load 87
              89:     32(ptr) AccessChain 75 24
                              Store 89 88
              90:    7(fvec4) Load 11(vs_TEXCOORD0)
              91:   12(fvec2) VectorShuffle 90 90 1 1
              92:    7(fvec4) Load 75
              93:    7(fvec4) VectorShuffle 92 91 0 4 2 5
                              Store 75 93
              96:    7(fvec4) Load 75
              97:   12(fvec2) VectorShuffle 96 96 0 1
              98:    7(fvec4) Load 11(vs_TEXCOORD0)
              99:   12(fvec2) VectorShuffle 98 98 3 3
             100:   12(fvec2) FDiv 97 99
                              Store 95 100
             102:          55 Load 57
             103:          59 Load 61
             104:          63 SampledImage 102 103
             105:   12(fvec2) Load 95
             106:    7(fvec4) ImageSampleImplicitLod 104 105
                              Store 101 106
             107:    7(fvec4) Load 101
             110:    7(fvec4) FMul 107 109
             111:    7(fvec4) Load 9
             112:    7(fvec4) FAdd 110 111
                              Store 9 112
             113:     25(ptr) AccessChain 20 22 24
             114:    6(float) Load 113
             115:    6(float) FNegate 114
             116:     25(ptr) AccessChain 20 28
             117:    6(float) Load 116
             118:    6(float) FMul 115 117
             120:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             121:    6(float) Load 120
             122:    6(float) FAdd 118 121
             124:     32(ptr) AccessChain 75 123
                              Store 124 122
             125:    7(fvec4) Load 75
             126:   12(fvec2) VectorShuffle 125 125 2 3
             127:    7(fvec4) Load 11(vs_TEXCOORD0)
             128:   12(fvec2) VectorShuffle 127 127 3 3
             129:   12(fvec2) FDiv 126 128
                              Store 95 129
             130:          55 Load 57
             131:          59 Load 61
             132:          63 SampledImage 130 131
             133:   12(fvec2) Load 95
             134:    7(fvec4) ImageSampleImplicitLod 132 133
                              Store 54 134
             135:    7(fvec4) Load 54
             138:    7(fvec4) FMul 135 137
             139:    7(fvec4) Load 9
             140:    7(fvec4) FAdd 138 139
                              Store 9 140
             141:    7(fvec4) Load 11(vs_TEXCOORD0)
             142:   12(fvec2) VectorShuffle 141 141 0 1
             143:    7(fvec4) Load 11(vs_TEXCOORD0)
             144:   12(fvec2) VectorShuffle 143 143 3 3
             145:   12(fvec2) FDiv 142 144
                              Store 95 145
             146:          55 Load 57
             147:          59 Load 61
             148:          63 SampledImage 146 147
             149:   12(fvec2) Load 95
             150:    7(fvec4) ImageSampleImplicitLod 148 149
                              Store 54 150
             151:    7(fvec4) Load 54
             154:    7(fvec4) FMul 151 153
             155:    7(fvec4) Load 9
             156:    7(fvec4) FAdd 154 155
                              Store 9 156
             157:     25(ptr) AccessChain 20 22 24
             158:    6(float) Load 157
             159:     25(ptr) AccessChain 20 28
             160:    6(float) Load 159
             161:    6(float) FMul 158 160
             162:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             163:    6(float) Load 162
             164:    6(float) FAdd 161 163
             165:     32(ptr) AccessChain 75 24
                              Store 165 164
             166:    7(fvec4) Load 11(vs_TEXCOORD0)
             167:   12(fvec2) VectorShuffle 166 166 1 1
             168:    7(fvec4) Load 75
             169:    7(fvec4) VectorShuffle 168 167 0 4 2 5
                              Store 75 169
             170:    7(fvec4) Load 75
             171:   12(fvec2) VectorShuffle 170 170 0 1
             172:    7(fvec4) Load 11(vs_TEXCOORD0)
             173:   12(fvec2) VectorShuffle 172 172 3 3
             174:   12(fvec2) FDiv 171 173
                              Store 95 174
             175:          55 Load 57
             176:          59 Load 61
             177:          63 SampledImage 175 176
             178:   12(fvec2) Load 95
             179:    7(fvec4) ImageSampleImplicitLod 177 178
                              Store 101 179
             180:    7(fvec4) Load 101
             181:    7(fvec4) FMul 180 137
             182:    7(fvec4) Load 9
             183:    7(fvec4) FAdd 181 182
                              Store 9 183
             184:     32(ptr) AccessChain 17 24
             185:    6(float) Load 184
             187:    6(float) FMul 185 186
             188:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             189:    6(float) Load 188
             190:    6(float) FAdd 187 189
             191:     32(ptr) AccessChain 75 123
                              Store 191 190
             192:     32(ptr) AccessChain 17 24
             193:    6(float) Load 192
             195:    6(float) FMul 193 194
             196:    119(ptr) AccessChain 11(vs_TEXCOORD0) 24
             197:    6(float) Load 196
             198:    6(float) FAdd 195 197
             199:     32(ptr) AccessChain 34 123
                              Store 199 198
             200:    7(fvec4) Load 75
             201:   12(fvec2) VectorShuffle 200 200 2 3
             202:    7(fvec4) Load 11(vs_TEXCOORD0)
             203:   12(fvec2) VectorShuffle 202 202 3 3
             204:   12(fvec2) FDiv 201 203
             205:    7(fvec4) Load 17
             206:    7(fvec4) VectorShuffle 205 204 4 5 2 3
                              Store 17 206
             208:          55 Load 57
             209:          59 Load 61
             210:          63 SampledImage 208 209
             211:    7(fvec4) Load 17
             212:   12(fvec2) VectorShuffle 211 211 0 1
             213:    7(fvec4) ImageSampleImplicitLod 210 212
                              Store 207 213
             214:    7(fvec4) Load 207
             215:    7(fvec4) FMul 214 109
             216:    7(fvec4) Load 9
             217:    7(fvec4) FAdd 215 216
                              Store 9 217
             218:    7(fvec4) Load 11(vs_TEXCOORD0)
             219:   12(fvec2) VectorShuffle 218 218 1 1
             220:    7(fvec4) Load 34
             221:    7(fvec4) VectorShuffle 220 219 0 4 2 5
                              Store 34 221
             222:    7(fvec4) Load 34
             223:    7(fvec4) Load 11(vs_TEXCOORD0)
             224:    7(fvec4) VectorShuffle 223 223 3 3 3 3
             225:    7(fvec4) FDiv 222 224
                              Store 17 225
             227:          55 Load 57
             228:          59 Load 61
             229:          63 SampledImage 227 228
             230:    7(fvec4) Load 17
             231:   12(fvec2) VectorShuffle 230 230 2 3
             232:    7(fvec4) ImageSampleImplicitLod 229 231
                              Store 226 232
             233:          55 Load 57
             234:          59 Load 61
             235:          63 SampledImage 233 234
             236:    7(fvec4) Load 17
             237:   12(fvec2) VectorShuffle 236 236 0 1
             238:    7(fvec4) ImageSampleImplicitLod 235 237
                              Store 207 238
             239:    7(fvec4) Load 207
             240:    7(fvec4) FMul 239 78
             241:    7(fvec4) Load 9
             242:    7(fvec4) FAdd 240 241
                              Store 9 242
             243:    7(fvec4) Load 226
             244:    7(fvec4) FMul 243 82
             245:    7(fvec4) Load 9
             246:    7(fvec4) FAdd 244 245
                              Store 9 246
             249:    7(fvec4) Load 9
                              Store 248 249
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



 }
 GrabPass {
  Tags { "LIGHTMODE"="ALWAYS" }
 }
 Pass {
  Tags { "LIGHTMODE"="ALWAYS" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_GrabTexture" to slot 0

Constant Buffer "$Globals" (20 bytes) {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "$Globals" (128 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat6;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx;
    u_xlat1.x = _GrabTexture_TexelSize.y * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, 3.0, -3.0, -2.0) + vs_TEXCOORD0.yyyy;
    u_xlat0.yw = u_xlat2.xz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat0.zw);
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.y = u_xlat2.w;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat3.w = (-_GrabTexture_TexelSize.y) * _Size + vs_TEXCOORD0.y;
    u_xlat6.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat3.y = _GrabTexture_TexelSize.y * _Size + vs_TEXCOORD0.y;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat3.w = u_xlat1.x * 2.0 + vs_TEXCOORD0.y;
    u_xlat2.w = u_xlat1.x * 4.0 + vs_TEXCOORD0.y;
    u_xlat1.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat2.xz = vs_TEXCOORD0.xx;
    u_xlat1 = u_xlat2 / vs_TEXCOORD0.wwww;
    u_xlat16_2 = texture(_GrabTexture, u_xlat1.zw);
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_GrabTexture" to slot 0

Constant Buffer "$Globals" (20 bytes) {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "$Globals" (128 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat6;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx;
    u_xlat1.x = _GrabTexture_TexelSize.y * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, 3.0, -3.0, -2.0) + vs_TEXCOORD0.yyyy;
    u_xlat0.yw = u_xlat2.xz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat0.zw);
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.y = u_xlat2.w;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat3.w = (-_GrabTexture_TexelSize.y) * _Size + vs_TEXCOORD0.y;
    u_xlat6.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat3.y = _GrabTexture_TexelSize.y * _Size + vs_TEXCOORD0.y;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat3.w = u_xlat1.x * 2.0 + vs_TEXCOORD0.y;
    u_xlat2.w = u_xlat1.x * 4.0 + vs_TEXCOORD0.y;
    u_xlat1.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat2.xz = vs_TEXCOORD0.xx;
    u_xlat1 = u_xlat2 / vs_TEXCOORD0.wwww;
    u_xlat16_2 = texture(_GrabTexture, u_xlat1.zw);
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_GrabTexture" to slot 0

Constant Buffer "$Globals" (20 bytes) {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "$Globals" (128 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat6;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx;
    u_xlat1.x = _GrabTexture_TexelSize.y * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, 3.0, -3.0, -2.0) + vs_TEXCOORD0.yyyy;
    u_xlat0.yw = u_xlat2.xz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat0.zw);
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.y = u_xlat2.w;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat3.w = (-_GrabTexture_TexelSize.y) * _Size + vs_TEXCOORD0.y;
    u_xlat6.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_3 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat3.y = _GrabTexture_TexelSize.y * _Size + vs_TEXCOORD0.y;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat6.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat16_4 = texture(_GrabTexture, u_xlat6.xy);
    u_xlat0 = u_xlat16_4 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat3.w = u_xlat1.x * 2.0 + vs_TEXCOORD0.y;
    u_xlat2.w = u_xlat1.x * 4.0 + vs_TEXCOORD0.y;
    u_xlat1.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat2.xz = vs_TEXCOORD0.xx;
    u_xlat1 = u_xlat2 / vs_TEXCOORD0.wwww;
    u_xlat16_2 = texture(_GrabTexture, u_xlat1.zw);
    u_xlat16_1 = texture(_GrabTexture, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_GrabTexture" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2648740900" (20 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "VGlobals2648740900" (128 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 125

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95
                              Name 95  "vs_TEXCOORD0"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 6(float)
             113:             TypePointer Function 7(fvec4)
             115:             TypeVector 21(int) 4
             116:             TypePointer Function 115(ivec4)
             118:             TypeBool
             119:             TypeVector 118(bool) 4
             120:             TypePointer Function 119(bvec4)
             122:             TypeVector 14(int) 4
             123:             TypePointer Function 122(ivec4)
               4:           2 Function None 3
               5:             Label
             114:    113(ptr) Variable Function
             117:    116(ptr) Variable Function
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             108:    107(ptr) AccessChain 79 22 75
             109:    6(float) Load 108
             110:    6(float) FNegate 109
             111:    107(ptr) AccessChain 79 22 75
                              Store 111 110
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 263

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 248
                              ExecutionMode 4 OriginUpperLeft
                              Name 11  "vs_TEXCOORD0"
                              Decorate 11(vs_TEXCOORD0) Location 0
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 0
                              Decorate 55 RelaxedPrecision
                              Decorate 58 RelaxedPrecision
                              Decorate 58 DescriptorSet 0
                              Decorate 58 Binding 1
                              Decorate 59 RelaxedPrecision
                              Decorate 62 RelaxedPrecision
                              Decorate 62 DescriptorSet 0
                              Decorate 62 Binding 0
                              Decorate 63 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 70 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 81 RelaxedPrecision
                              Decorate 84 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 104 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 111 RelaxedPrecision
                              Decorate 130 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 135 RelaxedPrecision
                              Decorate 138 RelaxedPrecision
                              Decorate 146 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 151 RelaxedPrecision
                              Decorate 154 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 176 RelaxedPrecision
                              Decorate 180 RelaxedPrecision
                              Decorate 181 RelaxedPrecision
                              Decorate 207 RelaxedPrecision
                              Decorate 208 RelaxedPrecision
                              Decorate 209 RelaxedPrecision
                              Decorate 214 RelaxedPrecision
                              Decorate 215 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 227 RelaxedPrecision
                              Decorate 228 RelaxedPrecision
                              Decorate 233 RelaxedPrecision
                              Decorate 234 RelaxedPrecision
                              Decorate 239 RelaxedPrecision
                              Decorate 240 RelaxedPrecision
                              Decorate 243 RelaxedPrecision
                              Decorate 244 RelaxedPrecision
                              Decorate 248 RelaxedPrecision
                              Decorate 248 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
11(vs_TEXCOORD0):     10(ptr) Variable Input
              12:             TypeVector 6(float) 2
              17:      8(ptr) Variable Private
              18:             TypeStruct 7(fvec4) 6(float)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:             TypeInt 32 0
              24:     23(int) Constant 1
              25:             TypePointer Uniform 6(float)
              28:     21(int) Constant 1
              32:     23(int) Constant 0
              33:             TypePointer Private 6(float)
              35:      8(ptr) Variable Private
              38:    6(float) Constant 3229614080
              39:    6(float) Constant 1077936128
              40:    6(float) Constant 3225419776
              41:    6(float) Constant 3221225472
              42:    7(fvec4) ConstantComposite 38 39 40 41
              55:      8(ptr) Variable Private
              56:             TypeImage 6(float) 2D sampled format:Unknown
              57:             TypePointer UniformConstant 56
              58:     57(ptr) Variable UniformConstant
              60:             TypeSampler
              61:             TypePointer UniformConstant 60
              62:     61(ptr) Variable UniformConstant
              64:             TypeSampledImage 56
              69:      8(ptr) Variable Private
              76:      8(ptr) Variable Private
              78:    6(float) Constant 1035489772
              79:    7(fvec4) ConstantComposite 78 78 78 78
              82:    6(float) Constant 1028443341
              83:    7(fvec4) ConstantComposite 82 82 82 82
              87:     23(int) Constant 3
              95:             TypePointer Private 12(fvec2)
              96:     95(ptr) Variable Private
             102:      8(ptr) Variable Private
             109:    6(float) Constant 1039516303
             110:    7(fvec4) ConstantComposite 109 109 109 109
             120:             TypePointer Input 6(float)
             136:    6(float) Constant 1041865114
             137:    7(fvec4) ConstantComposite 136 136 136 136
             152:    6(float) Constant 1043878380
             153:    7(fvec4) ConstantComposite 152 152 152 152
             186:    6(float) Constant 1073741824
             194:    6(float) Constant 1082130432
             207:      8(ptr) Variable Private
             226:      8(ptr) Variable Private
             247:             TypePointer Output 7(fvec4)
             248:    247(ptr) Variable Output
             251:             TypePointer Function 7(fvec4)
             253:             TypeVector 21(int) 4
             254:             TypePointer Function 253(ivec4)
             256:             TypeBool
             257:             TypeVector 256(bool) 4
             258:             TypePointer Function 257(bvec4)
             260:             TypeVector 23(int) 4
             261:             TypePointer Function 260(ivec4)
               4:           2 Function None 3
               5:             Label
             252:    251(ptr) Variable Function
             255:    254(ptr) Variable Function
             259:    258(ptr) Variable Function
             262:    261(ptr) Variable Function
              13:    7(fvec4) Load 11(vs_TEXCOORD0)
              14:   12(fvec2) VectorShuffle 13 13 0 0
              15:    7(fvec4) Load 9
              16:    7(fvec4) VectorShuffle 15 14 4 1 5 3
                              Store 9 16
              26:     25(ptr) AccessChain 20 22 24
              27:    6(float) Load 26
              29:     25(ptr) AccessChain 20 28
              30:    6(float) Load 29
              31:    6(float) FMul 27 30
              34:     33(ptr) AccessChain 17 32
                              Store 34 31
              36:    7(fvec4) Load 17
              37:    7(fvec4) VectorShuffle 36 36 0 0 0 0
              43:    7(fvec4) FMul 37 42
              44:    7(fvec4) Load 11(vs_TEXCOORD0)
              45:    7(fvec4) VectorShuffle 44 44 1 1 1 1
              46:    7(fvec4) FAdd 43 45
                              Store 35 46
              47:    7(fvec4) Load 35
              48:   12(fvec2) VectorShuffle 47 47 0 2
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 48 0 4 2 5
                              Store 9 50
              51:    7(fvec4) Load 9
              52:    7(fvec4) Load 11(vs_TEXCOORD0)
              53:    7(fvec4) VectorShuffle 52 52 3 3 3 3
              54:    7(fvec4) FDiv 51 53
                              Store 9 54
              59:          56 Load 58
              63:          60 Load 62
              65:          64 SampledImage 59 63
              66:    7(fvec4) Load 9
              67:   12(fvec2) VectorShuffle 66 66 2 3
              68:    7(fvec4) ImageSampleImplicitLod 65 67
                              Store 55 68
              70:          56 Load 58
              71:          60 Load 62
              72:          64 SampledImage 70 71
              73:    7(fvec4) Load 9
              74:   12(fvec2) VectorShuffle 73 73 0 1
              75:    7(fvec4) ImageSampleImplicitLod 72 74
                              Store 69 75
              77:    7(fvec4) Load 55
              80:    7(fvec4) FMul 77 79
                              Store 76 80
              81:    7(fvec4) Load 69
              84:    7(fvec4) FMul 81 83
              85:    7(fvec4) Load 76
              86:    7(fvec4) FAdd 84 85
                              Store 9 86
              88:     33(ptr) AccessChain 35 87
              89:    6(float) Load 88
              90:     33(ptr) AccessChain 76 24
                              Store 90 89
              91:    7(fvec4) Load 11(vs_TEXCOORD0)
              92:   12(fvec2) VectorShuffle 91 91 0 0
              93:    7(fvec4) Load 76
              94:    7(fvec4) VectorShuffle 93 92 4 1 5 3
                              Store 76 94
              97:    7(fvec4) Load 76
              98:   12(fvec2) VectorShuffle 97 97 0 1
              99:    7(fvec4) Load 11(vs_TEXCOORD0)
             100:   12(fvec2) VectorShuffle 99 99 3 3
             101:   12(fvec2) FDiv 98 100
                              Store 96 101
             103:          56 Load 58
             104:          60 Load 62
             105:          64 SampledImage 103 104
             106:   12(fvec2) Load 96
             107:    7(fvec4) ImageSampleImplicitLod 105 106
                              Store 102 107
             108:    7(fvec4) Load 102
             111:    7(fvec4) FMul 108 110
             112:    7(fvec4) Load 9
             113:    7(fvec4) FAdd 111 112
                              Store 9 113
             114:     25(ptr) AccessChain 20 22 24
             115:    6(float) Load 114
             116:    6(float) FNegate 115
             117:     25(ptr) AccessChain 20 28
             118:    6(float) Load 117
             119:    6(float) FMul 116 118
             121:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             122:    6(float) Load 121
             123:    6(float) FAdd 119 122
             124:     33(ptr) AccessChain 76 87
                              Store 124 123
             125:    7(fvec4) Load 76
             126:   12(fvec2) VectorShuffle 125 125 2 3
             127:    7(fvec4) Load 11(vs_TEXCOORD0)
             128:   12(fvec2) VectorShuffle 127 127 3 3
             129:   12(fvec2) FDiv 126 128
                              Store 96 129
             130:          56 Load 58
             131:          60 Load 62
             132:          64 SampledImage 130 131
             133:   12(fvec2) Load 96
             134:    7(fvec4) ImageSampleImplicitLod 132 133
                              Store 55 134
             135:    7(fvec4) Load 55
             138:    7(fvec4) FMul 135 137
             139:    7(fvec4) Load 9
             140:    7(fvec4) FAdd 138 139
                              Store 9 140
             141:    7(fvec4) Load 11(vs_TEXCOORD0)
             142:   12(fvec2) VectorShuffle 141 141 0 1
             143:    7(fvec4) Load 11(vs_TEXCOORD0)
             144:   12(fvec2) VectorShuffle 143 143 3 3
             145:   12(fvec2) FDiv 142 144
                              Store 96 145
             146:          56 Load 58
             147:          60 Load 62
             148:          64 SampledImage 146 147
             149:   12(fvec2) Load 96
             150:    7(fvec4) ImageSampleImplicitLod 148 149
                              Store 55 150
             151:    7(fvec4) Load 55
             154:    7(fvec4) FMul 151 153
             155:    7(fvec4) Load 9
             156:    7(fvec4) FAdd 154 155
                              Store 9 156
             157:     25(ptr) AccessChain 20 22 24
             158:    6(float) Load 157
             159:     25(ptr) AccessChain 20 28
             160:    6(float) Load 159
             161:    6(float) FMul 158 160
             162:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             163:    6(float) Load 162
             164:    6(float) FAdd 161 163
             165:     33(ptr) AccessChain 76 24
                              Store 165 164
             166:    7(fvec4) Load 11(vs_TEXCOORD0)
             167:   12(fvec2) VectorShuffle 166 166 0 0
             168:    7(fvec4) Load 76
             169:    7(fvec4) VectorShuffle 168 167 4 1 5 3
                              Store 76 169
             170:    7(fvec4) Load 76
             171:   12(fvec2) VectorShuffle 170 170 0 1
             172:    7(fvec4) Load 11(vs_TEXCOORD0)
             173:   12(fvec2) VectorShuffle 172 172 3 3
             174:   12(fvec2) FDiv 171 173
                              Store 96 174
             175:          56 Load 58
             176:          60 Load 62
             177:          64 SampledImage 175 176
             178:   12(fvec2) Load 96
             179:    7(fvec4) ImageSampleImplicitLod 177 178
                              Store 102 179
             180:    7(fvec4) Load 102
             181:    7(fvec4) FMul 180 137
             182:    7(fvec4) Load 9
             183:    7(fvec4) FAdd 181 182
                              Store 9 183
             184:     33(ptr) AccessChain 17 32
             185:    6(float) Load 184
             187:    6(float) FMul 185 186
             188:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             189:    6(float) Load 188
             190:    6(float) FAdd 187 189
             191:     33(ptr) AccessChain 76 87
                              Store 191 190
             192:     33(ptr) AccessChain 17 32
             193:    6(float) Load 192
             195:    6(float) FMul 193 194
             196:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             197:    6(float) Load 196
             198:    6(float) FAdd 195 197
             199:     33(ptr) AccessChain 35 87
                              Store 199 198
             200:    7(fvec4) Load 76
             201:   12(fvec2) VectorShuffle 200 200 2 3
             202:    7(fvec4) Load 11(vs_TEXCOORD0)
             203:   12(fvec2) VectorShuffle 202 202 3 3
             204:   12(fvec2) FDiv 201 203
             205:    7(fvec4) Load 17
             206:    7(fvec4) VectorShuffle 205 204 4 5 2 3
                              Store 17 206
             208:          56 Load 58
             209:          60 Load 62
             210:          64 SampledImage 208 209
             211:    7(fvec4) Load 17
             212:   12(fvec2) VectorShuffle 211 211 0 1
             213:    7(fvec4) ImageSampleImplicitLod 210 212
                              Store 207 213
             214:    7(fvec4) Load 207
             215:    7(fvec4) FMul 214 110
             216:    7(fvec4) Load 9
             217:    7(fvec4) FAdd 215 216
                              Store 9 217
             218:    7(fvec4) Load 11(vs_TEXCOORD0)
             219:   12(fvec2) VectorShuffle 218 218 0 0
             220:    7(fvec4) Load 35
             221:    7(fvec4) VectorShuffle 220 219 4 1 5 3
                              Store 35 221
             222:    7(fvec4) Load 35
             223:    7(fvec4) Load 11(vs_TEXCOORD0)
             224:    7(fvec4) VectorShuffle 223 223 3 3 3 3
             225:    7(fvec4) FDiv 222 224
                              Store 17 225
             227:          56 Load 58
             228:          60 Load 62
             229:          64 SampledImage 227 228
             230:    7(fvec4) Load 17
             231:   12(fvec2) VectorShuffle 230 230 2 3
             232:    7(fvec4) ImageSampleImplicitLod 229 231
                              Store 226 232
             233:          56 Load 58
             234:          60 Load 62
             235:          64 SampledImage 233 234
             236:    7(fvec4) Load 17
             237:   12(fvec2) VectorShuffle 236 236 0 1
             238:    7(fvec4) ImageSampleImplicitLod 235 237
                              Store 207 238
             239:    7(fvec4) Load 207
             240:    7(fvec4) FMul 239 79
             241:    7(fvec4) Load 9
             242:    7(fvec4) FAdd 240 241
                              Store 9 242
             243:    7(fvec4) Load 226
             244:    7(fvec4) FMul 243 83
             245:    7(fvec4) Load 9
             246:    7(fvec4) FAdd 244 245
                              Store 9 246
             249:    7(fvec4) Load 9
                              Store 248 249
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_GrabTexture" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2648740900" (20 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "VGlobals2648740900" (128 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 125

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95
                              Name 95  "vs_TEXCOORD0"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 6(float)
             113:             TypePointer Function 7(fvec4)
             115:             TypeVector 21(int) 4
             116:             TypePointer Function 115(ivec4)
             118:             TypeBool
             119:             TypeVector 118(bool) 4
             120:             TypePointer Function 119(bvec4)
             122:             TypeVector 14(int) 4
             123:             TypePointer Function 122(ivec4)
               4:           2 Function None 3
               5:             Label
             114:    113(ptr) Variable Function
             117:    116(ptr) Variable Function
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             108:    107(ptr) AccessChain 79 22 75
             109:    6(float) Load 108
             110:    6(float) FNegate 109
             111:    107(ptr) AccessChain 79 22 75
                              Store 111 110
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 263

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 248
                              ExecutionMode 4 OriginUpperLeft
                              Name 11  "vs_TEXCOORD0"
                              Decorate 11(vs_TEXCOORD0) Location 0
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 0
                              Decorate 55 RelaxedPrecision
                              Decorate 58 RelaxedPrecision
                              Decorate 58 DescriptorSet 0
                              Decorate 58 Binding 1
                              Decorate 59 RelaxedPrecision
                              Decorate 62 RelaxedPrecision
                              Decorate 62 DescriptorSet 0
                              Decorate 62 Binding 0
                              Decorate 63 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 70 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 81 RelaxedPrecision
                              Decorate 84 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 104 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 111 RelaxedPrecision
                              Decorate 130 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 135 RelaxedPrecision
                              Decorate 138 RelaxedPrecision
                              Decorate 146 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 151 RelaxedPrecision
                              Decorate 154 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 176 RelaxedPrecision
                              Decorate 180 RelaxedPrecision
                              Decorate 181 RelaxedPrecision
                              Decorate 207 RelaxedPrecision
                              Decorate 208 RelaxedPrecision
                              Decorate 209 RelaxedPrecision
                              Decorate 214 RelaxedPrecision
                              Decorate 215 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 227 RelaxedPrecision
                              Decorate 228 RelaxedPrecision
                              Decorate 233 RelaxedPrecision
                              Decorate 234 RelaxedPrecision
                              Decorate 239 RelaxedPrecision
                              Decorate 240 RelaxedPrecision
                              Decorate 243 RelaxedPrecision
                              Decorate 244 RelaxedPrecision
                              Decorate 248 RelaxedPrecision
                              Decorate 248 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
11(vs_TEXCOORD0):     10(ptr) Variable Input
              12:             TypeVector 6(float) 2
              17:      8(ptr) Variable Private
              18:             TypeStruct 7(fvec4) 6(float)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:             TypeInt 32 0
              24:     23(int) Constant 1
              25:             TypePointer Uniform 6(float)
              28:     21(int) Constant 1
              32:     23(int) Constant 0
              33:             TypePointer Private 6(float)
              35:      8(ptr) Variable Private
              38:    6(float) Constant 3229614080
              39:    6(float) Constant 1077936128
              40:    6(float) Constant 3225419776
              41:    6(float) Constant 3221225472
              42:    7(fvec4) ConstantComposite 38 39 40 41
              55:      8(ptr) Variable Private
              56:             TypeImage 6(float) 2D sampled format:Unknown
              57:             TypePointer UniformConstant 56
              58:     57(ptr) Variable UniformConstant
              60:             TypeSampler
              61:             TypePointer UniformConstant 60
              62:     61(ptr) Variable UniformConstant
              64:             TypeSampledImage 56
              69:      8(ptr) Variable Private
              76:      8(ptr) Variable Private
              78:    6(float) Constant 1035489772
              79:    7(fvec4) ConstantComposite 78 78 78 78
              82:    6(float) Constant 1028443341
              83:    7(fvec4) ConstantComposite 82 82 82 82
              87:     23(int) Constant 3
              95:             TypePointer Private 12(fvec2)
              96:     95(ptr) Variable Private
             102:      8(ptr) Variable Private
             109:    6(float) Constant 1039516303
             110:    7(fvec4) ConstantComposite 109 109 109 109
             120:             TypePointer Input 6(float)
             136:    6(float) Constant 1041865114
             137:    7(fvec4) ConstantComposite 136 136 136 136
             152:    6(float) Constant 1043878380
             153:    7(fvec4) ConstantComposite 152 152 152 152
             186:    6(float) Constant 1073741824
             194:    6(float) Constant 1082130432
             207:      8(ptr) Variable Private
             226:      8(ptr) Variable Private
             247:             TypePointer Output 7(fvec4)
             248:    247(ptr) Variable Output
             251:             TypePointer Function 7(fvec4)
             253:             TypeVector 21(int) 4
             254:             TypePointer Function 253(ivec4)
             256:             TypeBool
             257:             TypeVector 256(bool) 4
             258:             TypePointer Function 257(bvec4)
             260:             TypeVector 23(int) 4
             261:             TypePointer Function 260(ivec4)
               4:           2 Function None 3
               5:             Label
             252:    251(ptr) Variable Function
             255:    254(ptr) Variable Function
             259:    258(ptr) Variable Function
             262:    261(ptr) Variable Function
              13:    7(fvec4) Load 11(vs_TEXCOORD0)
              14:   12(fvec2) VectorShuffle 13 13 0 0
              15:    7(fvec4) Load 9
              16:    7(fvec4) VectorShuffle 15 14 4 1 5 3
                              Store 9 16
              26:     25(ptr) AccessChain 20 22 24
              27:    6(float) Load 26
              29:     25(ptr) AccessChain 20 28
              30:    6(float) Load 29
              31:    6(float) FMul 27 30
              34:     33(ptr) AccessChain 17 32
                              Store 34 31
              36:    7(fvec4) Load 17
              37:    7(fvec4) VectorShuffle 36 36 0 0 0 0
              43:    7(fvec4) FMul 37 42
              44:    7(fvec4) Load 11(vs_TEXCOORD0)
              45:    7(fvec4) VectorShuffle 44 44 1 1 1 1
              46:    7(fvec4) FAdd 43 45
                              Store 35 46
              47:    7(fvec4) Load 35
              48:   12(fvec2) VectorShuffle 47 47 0 2
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 48 0 4 2 5
                              Store 9 50
              51:    7(fvec4) Load 9
              52:    7(fvec4) Load 11(vs_TEXCOORD0)
              53:    7(fvec4) VectorShuffle 52 52 3 3 3 3
              54:    7(fvec4) FDiv 51 53
                              Store 9 54
              59:          56 Load 58
              63:          60 Load 62
              65:          64 SampledImage 59 63
              66:    7(fvec4) Load 9
              67:   12(fvec2) VectorShuffle 66 66 2 3
              68:    7(fvec4) ImageSampleImplicitLod 65 67
                              Store 55 68
              70:          56 Load 58
              71:          60 Load 62
              72:          64 SampledImage 70 71
              73:    7(fvec4) Load 9
              74:   12(fvec2) VectorShuffle 73 73 0 1
              75:    7(fvec4) ImageSampleImplicitLod 72 74
                              Store 69 75
              77:    7(fvec4) Load 55
              80:    7(fvec4) FMul 77 79
                              Store 76 80
              81:    7(fvec4) Load 69
              84:    7(fvec4) FMul 81 83
              85:    7(fvec4) Load 76
              86:    7(fvec4) FAdd 84 85
                              Store 9 86
              88:     33(ptr) AccessChain 35 87
              89:    6(float) Load 88
              90:     33(ptr) AccessChain 76 24
                              Store 90 89
              91:    7(fvec4) Load 11(vs_TEXCOORD0)
              92:   12(fvec2) VectorShuffle 91 91 0 0
              93:    7(fvec4) Load 76
              94:    7(fvec4) VectorShuffle 93 92 4 1 5 3
                              Store 76 94
              97:    7(fvec4) Load 76
              98:   12(fvec2) VectorShuffle 97 97 0 1
              99:    7(fvec4) Load 11(vs_TEXCOORD0)
             100:   12(fvec2) VectorShuffle 99 99 3 3
             101:   12(fvec2) FDiv 98 100
                              Store 96 101
             103:          56 Load 58
             104:          60 Load 62
             105:          64 SampledImage 103 104
             106:   12(fvec2) Load 96
             107:    7(fvec4) ImageSampleImplicitLod 105 106
                              Store 102 107
             108:    7(fvec4) Load 102
             111:    7(fvec4) FMul 108 110
             112:    7(fvec4) Load 9
             113:    7(fvec4) FAdd 111 112
                              Store 9 113
             114:     25(ptr) AccessChain 20 22 24
             115:    6(float) Load 114
             116:    6(float) FNegate 115
             117:     25(ptr) AccessChain 20 28
             118:    6(float) Load 117
             119:    6(float) FMul 116 118
             121:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             122:    6(float) Load 121
             123:    6(float) FAdd 119 122
             124:     33(ptr) AccessChain 76 87
                              Store 124 123
             125:    7(fvec4) Load 76
             126:   12(fvec2) VectorShuffle 125 125 2 3
             127:    7(fvec4) Load 11(vs_TEXCOORD0)
             128:   12(fvec2) VectorShuffle 127 127 3 3
             129:   12(fvec2) FDiv 126 128
                              Store 96 129
             130:          56 Load 58
             131:          60 Load 62
             132:          64 SampledImage 130 131
             133:   12(fvec2) Load 96
             134:    7(fvec4) ImageSampleImplicitLod 132 133
                              Store 55 134
             135:    7(fvec4) Load 55
             138:    7(fvec4) FMul 135 137
             139:    7(fvec4) Load 9
             140:    7(fvec4) FAdd 138 139
                              Store 9 140
             141:    7(fvec4) Load 11(vs_TEXCOORD0)
             142:   12(fvec2) VectorShuffle 141 141 0 1
             143:    7(fvec4) Load 11(vs_TEXCOORD0)
             144:   12(fvec2) VectorShuffle 143 143 3 3
             145:   12(fvec2) FDiv 142 144
                              Store 96 145
             146:          56 Load 58
             147:          60 Load 62
             148:          64 SampledImage 146 147
             149:   12(fvec2) Load 96
             150:    7(fvec4) ImageSampleImplicitLod 148 149
                              Store 55 150
             151:    7(fvec4) Load 55
             154:    7(fvec4) FMul 151 153
             155:    7(fvec4) Load 9
             156:    7(fvec4) FAdd 154 155
                              Store 9 156
             157:     25(ptr) AccessChain 20 22 24
             158:    6(float) Load 157
             159:     25(ptr) AccessChain 20 28
             160:    6(float) Load 159
             161:    6(float) FMul 158 160
             162:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             163:    6(float) Load 162
             164:    6(float) FAdd 161 163
             165:     33(ptr) AccessChain 76 24
                              Store 165 164
             166:    7(fvec4) Load 11(vs_TEXCOORD0)
             167:   12(fvec2) VectorShuffle 166 166 0 0
             168:    7(fvec4) Load 76
             169:    7(fvec4) VectorShuffle 168 167 4 1 5 3
                              Store 76 169
             170:    7(fvec4) Load 76
             171:   12(fvec2) VectorShuffle 170 170 0 1
             172:    7(fvec4) Load 11(vs_TEXCOORD0)
             173:   12(fvec2) VectorShuffle 172 172 3 3
             174:   12(fvec2) FDiv 171 173
                              Store 96 174
             175:          56 Load 58
             176:          60 Load 62
             177:          64 SampledImage 175 176
             178:   12(fvec2) Load 96
             179:    7(fvec4) ImageSampleImplicitLod 177 178
                              Store 102 179
             180:    7(fvec4) Load 102
             181:    7(fvec4) FMul 180 137
             182:    7(fvec4) Load 9
             183:    7(fvec4) FAdd 181 182
                              Store 9 183
             184:     33(ptr) AccessChain 17 32
             185:    6(float) Load 184
             187:    6(float) FMul 185 186
             188:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             189:    6(float) Load 188
             190:    6(float) FAdd 187 189
             191:     33(ptr) AccessChain 76 87
                              Store 191 190
             192:     33(ptr) AccessChain 17 32
             193:    6(float) Load 192
             195:    6(float) FMul 193 194
             196:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             197:    6(float) Load 196
             198:    6(float) FAdd 195 197
             199:     33(ptr) AccessChain 35 87
                              Store 199 198
             200:    7(fvec4) Load 76
             201:   12(fvec2) VectorShuffle 200 200 2 3
             202:    7(fvec4) Load 11(vs_TEXCOORD0)
             203:   12(fvec2) VectorShuffle 202 202 3 3
             204:   12(fvec2) FDiv 201 203
             205:    7(fvec4) Load 17
             206:    7(fvec4) VectorShuffle 205 204 4 5 2 3
                              Store 17 206
             208:          56 Load 58
             209:          60 Load 62
             210:          64 SampledImage 208 209
             211:    7(fvec4) Load 17
             212:   12(fvec2) VectorShuffle 211 211 0 1
             213:    7(fvec4) ImageSampleImplicitLod 210 212
                              Store 207 213
             214:    7(fvec4) Load 207
             215:    7(fvec4) FMul 214 110
             216:    7(fvec4) Load 9
             217:    7(fvec4) FAdd 215 216
                              Store 9 217
             218:    7(fvec4) Load 11(vs_TEXCOORD0)
             219:   12(fvec2) VectorShuffle 218 218 0 0
             220:    7(fvec4) Load 35
             221:    7(fvec4) VectorShuffle 220 219 4 1 5 3
                              Store 35 221
             222:    7(fvec4) Load 35
             223:    7(fvec4) Load 11(vs_TEXCOORD0)
             224:    7(fvec4) VectorShuffle 223 223 3 3 3 3
             225:    7(fvec4) FDiv 222 224
                              Store 17 225
             227:          56 Load 58
             228:          60 Load 62
             229:          64 SampledImage 227 228
             230:    7(fvec4) Load 17
             231:   12(fvec2) VectorShuffle 230 230 2 3
             232:    7(fvec4) ImageSampleImplicitLod 229 231
                              Store 226 232
             233:          56 Load 58
             234:          60 Load 62
             235:          64 SampledImage 233 234
             236:    7(fvec4) Load 17
             237:   12(fvec2) VectorShuffle 236 236 0 1
             238:    7(fvec4) ImageSampleImplicitLod 235 237
                              Store 207 238
             239:    7(fvec4) Load 207
             240:    7(fvec4) FMul 239 79
             241:    7(fvec4) Load 9
             242:    7(fvec4) FAdd 240 241
                              Store 9 242
             243:    7(fvec4) Load 226
             244:    7(fvec4) FMul 243 83
             245:    7(fvec4) Load 9
             246:    7(fvec4) FAdd 244 245
                              Store 9 246
             249:    7(fvec4) Load 9
                              Store 248 249
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_GrabTexture" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2648740900" (20 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _GrabTexture_TexelSize at 0
  Float _Size at 16
}
Constant Buffer "VGlobals2648740900" (128 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 125

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95
                              Name 95  "vs_TEXCOORD0"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 6(float)
             113:             TypePointer Function 7(fvec4)
             115:             TypeVector 21(int) 4
             116:             TypePointer Function 115(ivec4)
             118:             TypeBool
             119:             TypeVector 118(bool) 4
             120:             TypePointer Function 119(bvec4)
             122:             TypeVector 14(int) 4
             123:             TypePointer Function 122(ivec4)
               4:           2 Function None 3
               5:             Label
             114:    113(ptr) Variable Function
             117:    116(ptr) Variable Function
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             108:    107(ptr) AccessChain 79 22 75
             109:    6(float) Load 108
             110:    6(float) FNegate 109
             111:    107(ptr) AccessChain 79 22 75
                              Store 111 110
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 263

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 248
                              ExecutionMode 4 OriginUpperLeft
                              Name 11  "vs_TEXCOORD0"
                              Decorate 11(vs_TEXCOORD0) Location 0
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 0
                              Decorate 55 RelaxedPrecision
                              Decorate 58 RelaxedPrecision
                              Decorate 58 DescriptorSet 0
                              Decorate 58 Binding 1
                              Decorate 59 RelaxedPrecision
                              Decorate 62 RelaxedPrecision
                              Decorate 62 DescriptorSet 0
                              Decorate 62 Binding 0
                              Decorate 63 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 70 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 81 RelaxedPrecision
                              Decorate 84 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 104 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 111 RelaxedPrecision
                              Decorate 130 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 135 RelaxedPrecision
                              Decorate 138 RelaxedPrecision
                              Decorate 146 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 151 RelaxedPrecision
                              Decorate 154 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 176 RelaxedPrecision
                              Decorate 180 RelaxedPrecision
                              Decorate 181 RelaxedPrecision
                              Decorate 207 RelaxedPrecision
                              Decorate 208 RelaxedPrecision
                              Decorate 209 RelaxedPrecision
                              Decorate 214 RelaxedPrecision
                              Decorate 215 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 227 RelaxedPrecision
                              Decorate 228 RelaxedPrecision
                              Decorate 233 RelaxedPrecision
                              Decorate 234 RelaxedPrecision
                              Decorate 239 RelaxedPrecision
                              Decorate 240 RelaxedPrecision
                              Decorate 243 RelaxedPrecision
                              Decorate 244 RelaxedPrecision
                              Decorate 248 RelaxedPrecision
                              Decorate 248 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
11(vs_TEXCOORD0):     10(ptr) Variable Input
              12:             TypeVector 6(float) 2
              17:      8(ptr) Variable Private
              18:             TypeStruct 7(fvec4) 6(float)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:             TypeInt 32 0
              24:     23(int) Constant 1
              25:             TypePointer Uniform 6(float)
              28:     21(int) Constant 1
              32:     23(int) Constant 0
              33:             TypePointer Private 6(float)
              35:      8(ptr) Variable Private
              38:    6(float) Constant 3229614080
              39:    6(float) Constant 1077936128
              40:    6(float) Constant 3225419776
              41:    6(float) Constant 3221225472
              42:    7(fvec4) ConstantComposite 38 39 40 41
              55:      8(ptr) Variable Private
              56:             TypeImage 6(float) 2D sampled format:Unknown
              57:             TypePointer UniformConstant 56
              58:     57(ptr) Variable UniformConstant
              60:             TypeSampler
              61:             TypePointer UniformConstant 60
              62:     61(ptr) Variable UniformConstant
              64:             TypeSampledImage 56
              69:      8(ptr) Variable Private
              76:      8(ptr) Variable Private
              78:    6(float) Constant 1035489772
              79:    7(fvec4) ConstantComposite 78 78 78 78
              82:    6(float) Constant 1028443341
              83:    7(fvec4) ConstantComposite 82 82 82 82
              87:     23(int) Constant 3
              95:             TypePointer Private 12(fvec2)
              96:     95(ptr) Variable Private
             102:      8(ptr) Variable Private
             109:    6(float) Constant 1039516303
             110:    7(fvec4) ConstantComposite 109 109 109 109
             120:             TypePointer Input 6(float)
             136:    6(float) Constant 1041865114
             137:    7(fvec4) ConstantComposite 136 136 136 136
             152:    6(float) Constant 1043878380
             153:    7(fvec4) ConstantComposite 152 152 152 152
             186:    6(float) Constant 1073741824
             194:    6(float) Constant 1082130432
             207:      8(ptr) Variable Private
             226:      8(ptr) Variable Private
             247:             TypePointer Output 7(fvec4)
             248:    247(ptr) Variable Output
             251:             TypePointer Function 7(fvec4)
             253:             TypeVector 21(int) 4
             254:             TypePointer Function 253(ivec4)
             256:             TypeBool
             257:             TypeVector 256(bool) 4
             258:             TypePointer Function 257(bvec4)
             260:             TypeVector 23(int) 4
             261:             TypePointer Function 260(ivec4)
               4:           2 Function None 3
               5:             Label
             252:    251(ptr) Variable Function
             255:    254(ptr) Variable Function
             259:    258(ptr) Variable Function
             262:    261(ptr) Variable Function
              13:    7(fvec4) Load 11(vs_TEXCOORD0)
              14:   12(fvec2) VectorShuffle 13 13 0 0
              15:    7(fvec4) Load 9
              16:    7(fvec4) VectorShuffle 15 14 4 1 5 3
                              Store 9 16
              26:     25(ptr) AccessChain 20 22 24
              27:    6(float) Load 26
              29:     25(ptr) AccessChain 20 28
              30:    6(float) Load 29
              31:    6(float) FMul 27 30
              34:     33(ptr) AccessChain 17 32
                              Store 34 31
              36:    7(fvec4) Load 17
              37:    7(fvec4) VectorShuffle 36 36 0 0 0 0
              43:    7(fvec4) FMul 37 42
              44:    7(fvec4) Load 11(vs_TEXCOORD0)
              45:    7(fvec4) VectorShuffle 44 44 1 1 1 1
              46:    7(fvec4) FAdd 43 45
                              Store 35 46
              47:    7(fvec4) Load 35
              48:   12(fvec2) VectorShuffle 47 47 0 2
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 48 0 4 2 5
                              Store 9 50
              51:    7(fvec4) Load 9
              52:    7(fvec4) Load 11(vs_TEXCOORD0)
              53:    7(fvec4) VectorShuffle 52 52 3 3 3 3
              54:    7(fvec4) FDiv 51 53
                              Store 9 54
              59:          56 Load 58
              63:          60 Load 62
              65:          64 SampledImage 59 63
              66:    7(fvec4) Load 9
              67:   12(fvec2) VectorShuffle 66 66 2 3
              68:    7(fvec4) ImageSampleImplicitLod 65 67
                              Store 55 68
              70:          56 Load 58
              71:          60 Load 62
              72:          64 SampledImage 70 71
              73:    7(fvec4) Load 9
              74:   12(fvec2) VectorShuffle 73 73 0 1
              75:    7(fvec4) ImageSampleImplicitLod 72 74
                              Store 69 75
              77:    7(fvec4) Load 55
              80:    7(fvec4) FMul 77 79
                              Store 76 80
              81:    7(fvec4) Load 69
              84:    7(fvec4) FMul 81 83
              85:    7(fvec4) Load 76
              86:    7(fvec4) FAdd 84 85
                              Store 9 86
              88:     33(ptr) AccessChain 35 87
              89:    6(float) Load 88
              90:     33(ptr) AccessChain 76 24
                              Store 90 89
              91:    7(fvec4) Load 11(vs_TEXCOORD0)
              92:   12(fvec2) VectorShuffle 91 91 0 0
              93:    7(fvec4) Load 76
              94:    7(fvec4) VectorShuffle 93 92 4 1 5 3
                              Store 76 94
              97:    7(fvec4) Load 76
              98:   12(fvec2) VectorShuffle 97 97 0 1
              99:    7(fvec4) Load 11(vs_TEXCOORD0)
             100:   12(fvec2) VectorShuffle 99 99 3 3
             101:   12(fvec2) FDiv 98 100
                              Store 96 101
             103:          56 Load 58
             104:          60 Load 62
             105:          64 SampledImage 103 104
             106:   12(fvec2) Load 96
             107:    7(fvec4) ImageSampleImplicitLod 105 106
                              Store 102 107
             108:    7(fvec4) Load 102
             111:    7(fvec4) FMul 108 110
             112:    7(fvec4) Load 9
             113:    7(fvec4) FAdd 111 112
                              Store 9 113
             114:     25(ptr) AccessChain 20 22 24
             115:    6(float) Load 114
             116:    6(float) FNegate 115
             117:     25(ptr) AccessChain 20 28
             118:    6(float) Load 117
             119:    6(float) FMul 116 118
             121:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             122:    6(float) Load 121
             123:    6(float) FAdd 119 122
             124:     33(ptr) AccessChain 76 87
                              Store 124 123
             125:    7(fvec4) Load 76
             126:   12(fvec2) VectorShuffle 125 125 2 3
             127:    7(fvec4) Load 11(vs_TEXCOORD0)
             128:   12(fvec2) VectorShuffle 127 127 3 3
             129:   12(fvec2) FDiv 126 128
                              Store 96 129
             130:          56 Load 58
             131:          60 Load 62
             132:          64 SampledImage 130 131
             133:   12(fvec2) Load 96
             134:    7(fvec4) ImageSampleImplicitLod 132 133
                              Store 55 134
             135:    7(fvec4) Load 55
             138:    7(fvec4) FMul 135 137
             139:    7(fvec4) Load 9
             140:    7(fvec4) FAdd 138 139
                              Store 9 140
             141:    7(fvec4) Load 11(vs_TEXCOORD0)
             142:   12(fvec2) VectorShuffle 141 141 0 1
             143:    7(fvec4) Load 11(vs_TEXCOORD0)
             144:   12(fvec2) VectorShuffle 143 143 3 3
             145:   12(fvec2) FDiv 142 144
                              Store 96 145
             146:          56 Load 58
             147:          60 Load 62
             148:          64 SampledImage 146 147
             149:   12(fvec2) Load 96
             150:    7(fvec4) ImageSampleImplicitLod 148 149
                              Store 55 150
             151:    7(fvec4) Load 55
             154:    7(fvec4) FMul 151 153
             155:    7(fvec4) Load 9
             156:    7(fvec4) FAdd 154 155
                              Store 9 156
             157:     25(ptr) AccessChain 20 22 24
             158:    6(float) Load 157
             159:     25(ptr) AccessChain 20 28
             160:    6(float) Load 159
             161:    6(float) FMul 158 160
             162:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             163:    6(float) Load 162
             164:    6(float) FAdd 161 163
             165:     33(ptr) AccessChain 76 24
                              Store 165 164
             166:    7(fvec4) Load 11(vs_TEXCOORD0)
             167:   12(fvec2) VectorShuffle 166 166 0 0
             168:    7(fvec4) Load 76
             169:    7(fvec4) VectorShuffle 168 167 4 1 5 3
                              Store 76 169
             170:    7(fvec4) Load 76
             171:   12(fvec2) VectorShuffle 170 170 0 1
             172:    7(fvec4) Load 11(vs_TEXCOORD0)
             173:   12(fvec2) VectorShuffle 172 172 3 3
             174:   12(fvec2) FDiv 171 173
                              Store 96 174
             175:          56 Load 58
             176:          60 Load 62
             177:          64 SampledImage 175 176
             178:   12(fvec2) Load 96
             179:    7(fvec4) ImageSampleImplicitLod 177 178
                              Store 102 179
             180:    7(fvec4) Load 102
             181:    7(fvec4) FMul 180 137
             182:    7(fvec4) Load 9
             183:    7(fvec4) FAdd 181 182
                              Store 9 183
             184:     33(ptr) AccessChain 17 32
             185:    6(float) Load 184
             187:    6(float) FMul 185 186
             188:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             189:    6(float) Load 188
             190:    6(float) FAdd 187 189
             191:     33(ptr) AccessChain 76 87
                              Store 191 190
             192:     33(ptr) AccessChain 17 32
             193:    6(float) Load 192
             195:    6(float) FMul 193 194
             196:    120(ptr) AccessChain 11(vs_TEXCOORD0) 24
             197:    6(float) Load 196
             198:    6(float) FAdd 195 197
             199:     33(ptr) AccessChain 35 87
                              Store 199 198
             200:    7(fvec4) Load 76
             201:   12(fvec2) VectorShuffle 200 200 2 3
             202:    7(fvec4) Load 11(vs_TEXCOORD0)
             203:   12(fvec2) VectorShuffle 202 202 3 3
             204:   12(fvec2) FDiv 201 203
             205:    7(fvec4) Load 17
             206:    7(fvec4) VectorShuffle 205 204 4 5 2 3
                              Store 17 206
             208:          56 Load 58
             209:          60 Load 62
             210:          64 SampledImage 208 209
             211:    7(fvec4) Load 17
             212:   12(fvec2) VectorShuffle 211 211 0 1
             213:    7(fvec4) ImageSampleImplicitLod 210 212
                              Store 207 213
             214:    7(fvec4) Load 207
             215:    7(fvec4) FMul 214 110
             216:    7(fvec4) Load 9
             217:    7(fvec4) FAdd 215 216
                              Store 9 217
             218:    7(fvec4) Load 11(vs_TEXCOORD0)
             219:   12(fvec2) VectorShuffle 218 218 0 0
             220:    7(fvec4) Load 35
             221:    7(fvec4) VectorShuffle 220 219 4 1 5 3
                              Store 35 221
             222:    7(fvec4) Load 35
             223:    7(fvec4) Load 11(vs_TEXCOORD0)
             224:    7(fvec4) VectorShuffle 223 223 3 3 3 3
             225:    7(fvec4) FDiv 222 224
                              Store 17 225
             227:          56 Load 58
             228:          60 Load 62
             229:          64 SampledImage 227 228
             230:    7(fvec4) Load 17
             231:   12(fvec2) VectorShuffle 230 230 2 3
             232:    7(fvec4) ImageSampleImplicitLod 229 231
                              Store 226 232
             233:          56 Load 58
             234:          60 Load 62
             235:          64 SampledImage 233 234
             236:    7(fvec4) Load 17
             237:   12(fvec2) VectorShuffle 236 236 0 1
             238:    7(fvec4) ImageSampleImplicitLod 235 237
                              Store 207 238
             239:    7(fvec4) Load 207
             240:    7(fvec4) FMul 239 79
             241:    7(fvec4) Load 9
             242:    7(fvec4) FAdd 240 241
                              Store 9 242
             243:    7(fvec4) Load 226
             244:    7(fvec4) FMul 243 83
             245:    7(fvec4) Load 9
             246:    7(fvec4) FAdd 244 245
                              Store 9 246
             249:    7(fvec4) Load 9
                              Store 248 249
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



 }
 GrabPass {
  Tags { "LIGHTMODE"="ALWAYS" }
 }
 Pass {
  Tags { "LIGHTMODE"="ALWAYS" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_BumpMap" to slot 0
Set 2D Texture "_GrabTexture" to slot 1
Set 2D Texture "_MainTex" to slot 2

Constant Buffer "$Globals" (48 bytes) {
  Float _BumpAmt at 0
  Vector4 _Color at 16
  Vector4 _GrabTexture_TexelSize at 32
}
Constant Buffer "$Globals" (160 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
  Vector4 _BumpMap_ST at 128
  Vector4 _MainTex_ST at 144
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BumpMap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _BumpAmt;
uniform 	mediump vec4 _Color;
uniform 	vec4 _GrabTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xy = texture(_BumpMap, vs_TEXCOORD1.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_BumpAmt);
    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    SV_Target0 = u_xlat16_0 * u_xlat1;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_BumpMap" to slot 0
Set 2D Texture "_GrabTexture" to slot 1
Set 2D Texture "_MainTex" to slot 2

Constant Buffer "$Globals" (48 bytes) {
  Float _BumpAmt at 0
  Vector4 _Color at 16
  Vector4 _GrabTexture_TexelSize at 32
}
Constant Buffer "$Globals" (160 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
  Vector4 _BumpMap_ST at 128
  Vector4 _MainTex_ST at 144
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BumpMap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _BumpAmt;
uniform 	mediump vec4 _Color;
uniform 	vec4 _GrabTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xy = texture(_BumpMap, vs_TEXCOORD1.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_BumpAmt);
    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    SV_Target0 = u_xlat16_0 * u_xlat1;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_BumpMap" to slot 0
Set 2D Texture "_GrabTexture" to slot 1
Set 2D Texture "_MainTex" to slot 2

Constant Buffer "$Globals" (48 bytes) {
  Float _BumpAmt at 0
  Vector4 _Color at 16
  Vector4 _GrabTexture_TexelSize at 32
}
Constant Buffer "$Globals" (160 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
  Vector4 _BumpMap_ST at 128
  Vector4 _MainTex_ST at 144
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BumpMap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _BumpAmt;
uniform 	mediump vec4 _Color;
uniform 	vec4 _GrabTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xy = texture(_BumpMap, vs_TEXCOORD1.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_BumpAmt);
    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    SV_Target0 = u_xlat16_0 * u_xlat1;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_BumpMap" to set: 0, binding: 3, used in: Fragment  using sampler in set: 0, binding: 1, used in: Fragment 
Set 2D Texture "_GrabTexture" to set: 0, binding: 4, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 
Set 2D Texture "_MainTex" to set: 0, binding: 5, used in: Fragment  using sampler in set: 0, binding: 2, used in: Fragment 

Constant Buffer "PGlobals2882018188" (48 bytes) on set: 1, binding: 0, used in: Fragment  {
  Float _BumpAmt at 0
  Vector4 _Color at 16
  Vector4 _GrabTexture_TexelSize at 32
}
Constant Buffer "VGlobals2882018188" (160 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
  Vector4 _BumpMap_ST at 128
  Vector4 _MainTex_ST at 144
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 148

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95 108 110 120
                              Name 95  "vs_TEXCOORD0"
                              Name 108  "vs_TEXCOORD1"
                              Name 120  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              MemberDecorate 18 2 Offset 128
                              MemberDecorate 18 3 Offset 144
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
                              Decorate 108(vs_TEXCOORD1) Location 1
                              Decorate 110 Location 1
                              Decorate 120(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17 7(fvec4) 7(fvec4)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 83(fvec2)
108(vs_TEXCOORD1):    107(ptr) Variable Output
             109:             TypePointer Input 83(fvec2)
             110:    109(ptr) Variable Input
120(vs_TEXCOORD2):    107(ptr) Variable Output
             130:             TypePointer Output 6(float)
             136:             TypePointer Function 7(fvec4)
             138:             TypeVector 21(int) 4
             139:             TypePointer Function 138(ivec4)
             141:             TypeBool
             142:             TypeVector 141(bool) 4
             143:             TypePointer Function 142(bvec4)
             145:             TypeVector 14(int) 4
             146:             TypePointer Function 145(ivec4)
               4:           2 Function None 3
               5:             Label
             137:    136(ptr) Variable Function
             140:    139(ptr) Variable Function
             144:    143(ptr) Variable Function
             147:    146(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             111:   83(fvec2) Load 110
             112:     24(ptr) AccessChain 20 35
             113:    7(fvec4) Load 112
             114:   83(fvec2) VectorShuffle 113 113 0 1
             115:   83(fvec2) FMul 111 114
             116:     24(ptr) AccessChain 20 35
             117:    7(fvec4) Load 116
             118:   83(fvec2) VectorShuffle 117 117 2 3
             119:   83(fvec2) FAdd 115 118
                              Store 108(vs_TEXCOORD1) 119
             121:   83(fvec2) Load 110
             122:     24(ptr) AccessChain 20 44
             123:    7(fvec4) Load 122
             124:   83(fvec2) VectorShuffle 123 123 0 1
             125:   83(fvec2) FMul 121 124
             126:     24(ptr) AccessChain 20 44
             127:    7(fvec4) Load 126
             128:   83(fvec2) VectorShuffle 127 127 2 3
             129:   83(fvec2) FAdd 125 128
                              Store 120(vs_TEXCOORD2) 129
             131:    130(ptr) AccessChain 79 22 75
             132:    6(float) Load 131
             133:    6(float) FNegate 132
             134:    130(ptr) AccessChain 79 22 75
                              Store 134 133
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 113

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 22 62 85 95
                              ExecutionMode 4 OriginUpperLeft
                              Name 22  "vs_TEXCOORD1"
                              Name 62  "vs_TEXCOORD0"
                              Name 85  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 12 RelaxedPrecision
                              Decorate 12 DescriptorSet 0
                              Decorate 12 Binding 3
                              Decorate 13 RelaxedPrecision
                              Decorate 16 RelaxedPrecision
                              Decorate 16 DescriptorSet 0
                              Decorate 16 Binding 1
                              Decorate 17 RelaxedPrecision
                              Decorate 22(vs_TEXCOORD1) Location 1
                              Decorate 25 RelaxedPrecision
                              Decorate 28 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 30 RelaxedPrecision
                              Decorate 33 RelaxedPrecision
                              Decorate 36 RelaxedPrecision
                              Decorate 41 RelaxedPrecision
                              Decorate 42 RelaxedPrecision
                              MemberDecorate 43 0 Offset 0
                              MemberDecorate 43 1 RelaxedPrecision
                              MemberDecorate 43 1 Offset 16
                              MemberDecorate 43 2 Offset 32
                              Decorate 43 Block
                              Decorate 45 DescriptorSet 1
                              Decorate 45 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 62(vs_TEXCOORD0) Location 0
                              Decorate 73 RelaxedPrecision
                              Decorate 73 DescriptorSet 0
                              Decorate 73 Binding 4
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 75 DescriptorSet 0
                              Decorate 75 Binding 0
                              Decorate 76 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 80 DescriptorSet 0
                              Decorate 80 Binding 5
                              Decorate 81 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 82 DescriptorSet 0
                              Decorate 82 Binding 2
                              Decorate 83 RelaxedPrecision
                              Decorate 85(vs_TEXCOORD2) Location 2
                              Decorate 89 RelaxedPrecision
                              Decorate 92 RelaxedPrecision
                              Decorate 93 RelaxedPrecision
                              Decorate 95 RelaxedPrecision
                              Decorate 95 Location 0
                              Decorate 96 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeImage 6(float) 2D sampled format:Unknown
              11:             TypePointer UniformConstant 10
              12:     11(ptr) Variable UniformConstant
              14:             TypeSampler
              15:             TypePointer UniformConstant 14
              16:     15(ptr) Variable UniformConstant
              18:             TypeSampledImage 10
              20:             TypeVector 6(float) 2
              21:             TypePointer Input 20(fvec2)
22(vs_TEXCOORD1):     21(ptr) Variable Input
              28:      8(ptr) Variable Private
              31:    6(float) Constant 1073741824
              32:   20(fvec2) ConstantComposite 31 31
              34:    6(float) Constant 3212836864
              35:   20(fvec2) ConstantComposite 34 34
              39:             TypePointer Private 20(fvec2)
              40:     39(ptr) Variable Private
              43:             TypeStruct 6(float) 7(fvec4) 7(fvec4)
              44:             TypePointer Uniform 43(struct)
              45:     44(ptr) Variable Uniform
              46:             TypeInt 32 1
              47:     46(int) Constant 0
              48:             TypePointer Uniform 6(float)
              54:     46(int) Constant 2
              55:             TypePointer Uniform 7(fvec4)
              61:             TypePointer Input 7(fvec4)
62(vs_TEXCOORD0):     61(ptr) Variable Input
              73:     11(ptr) Variable UniformConstant
              75:     15(ptr) Variable UniformConstant
              80:     11(ptr) Variable UniformConstant
              82:     15(ptr) Variable UniformConstant
85(vs_TEXCOORD2):     21(ptr) Variable Input
              88:      8(ptr) Variable Private
              90:     46(int) Constant 1
              94:             TypePointer Output 7(fvec4)
              95:     94(ptr) Variable Output
             100:             TypePointer Function 7(fvec4)
             102:             TypeVector 46(int) 4
             103:             TypePointer Function 102(ivec4)
             105:             TypeBool
             106:             TypeVector 105(bool) 4
             107:             TypePointer Function 106(bvec4)
             109:             TypeInt 32 0
             110:             TypeVector 109(int) 4
             111:             TypePointer Function 110(ivec4)
               4:           2 Function None 3
               5:             Label
             101:    100(ptr) Variable Function
             104:    103(ptr) Variable Function
             108:    107(ptr) Variable Function
             112:    111(ptr) Variable Function
              13:          10 Load 12
              17:          14 Load 16
              19:          18 SampledImage 13 17
              23:   20(fvec2) Load 22(vs_TEXCOORD1)
              24:    7(fvec4) ImageSampleImplicitLod 19 23
              25:   20(fvec2) VectorShuffle 24 24 0 1
              26:    7(fvec4) Load 9
              27:    7(fvec4) VectorShuffle 26 25 4 5 2 3
                              Store 9 27
              29:    7(fvec4) Load 9
              30:   20(fvec2) VectorShuffle 29 29 0 1
              33:   20(fvec2) FMul 30 32
              36:   20(fvec2) FAdd 33 35
              37:    7(fvec4) Load 28
              38:    7(fvec4) VectorShuffle 37 36 4 5 2 3
                              Store 28 38
              41:    7(fvec4) Load 28
              42:   20(fvec2) VectorShuffle 41 41 0 1
              49:     48(ptr) AccessChain 45 47
              50:    6(float) Load 49
              51:   20(fvec2) CompositeConstruct 50 50
              52:   20(fvec2) FMul 42 51
                              Store 40 52
              53:   20(fvec2) Load 40
              56:     55(ptr) AccessChain 45 54
              57:    7(fvec4) Load 56
              58:   20(fvec2) VectorShuffle 57 57 0 1
              59:   20(fvec2) FMul 53 58
                              Store 40 59
              60:   20(fvec2) Load 40
              63:    7(fvec4) Load 62(vs_TEXCOORD0)
              64:   20(fvec2) VectorShuffle 63 63 2 2
              65:   20(fvec2) FMul 60 64
              66:    7(fvec4) Load 62(vs_TEXCOORD0)
              67:   20(fvec2) VectorShuffle 66 66 0 1
              68:   20(fvec2) FAdd 65 67
                              Store 40 68
              69:   20(fvec2) Load 40
              70:    7(fvec4) Load 62(vs_TEXCOORD0)
              71:   20(fvec2) VectorShuffle 70 70 3 3
              72:   20(fvec2) FDiv 69 71
                              Store 40 72
              74:          10 Load 73
              76:          14 Load 75
              77:          18 SampledImage 74 76
              78:   20(fvec2) Load 40
              79:    7(fvec4) ImageSampleImplicitLod 77 78
                              Store 9 79
              81:          10 Load 80
              83:          14 Load 82
              84:          18 SampledImage 81 83
              86:   20(fvec2) Load 85(vs_TEXCOORD2)
              87:    7(fvec4) ImageSampleImplicitLod 84 86
                              Store 28 87
              89:    7(fvec4) Load 28
              91:     55(ptr) AccessChain 45 90
              92:    7(fvec4) Load 91
              93:    7(fvec4) FMul 89 92
                              Store 88 93
              96:    7(fvec4) Load 9
              97:    7(fvec4) Load 88
              98:    7(fvec4) FMul 96 97
                              Store 95 98
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_BumpMap" to set: 0, binding: 3, used in: Fragment  using sampler in set: 0, binding: 1, used in: Fragment 
Set 2D Texture "_GrabTexture" to set: 0, binding: 4, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 
Set 2D Texture "_MainTex" to set: 0, binding: 5, used in: Fragment  using sampler in set: 0, binding: 2, used in: Fragment 

Constant Buffer "PGlobals2882018188" (48 bytes) on set: 1, binding: 0, used in: Fragment  {
  Float _BumpAmt at 0
  Vector4 _Color at 16
  Vector4 _GrabTexture_TexelSize at 32
}
Constant Buffer "VGlobals2882018188" (160 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
  Vector4 _BumpMap_ST at 128
  Vector4 _MainTex_ST at 144
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 148

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95 108 110 120
                              Name 95  "vs_TEXCOORD0"
                              Name 108  "vs_TEXCOORD1"
                              Name 120  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              MemberDecorate 18 2 Offset 128
                              MemberDecorate 18 3 Offset 144
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
                              Decorate 108(vs_TEXCOORD1) Location 1
                              Decorate 110 Location 1
                              Decorate 120(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17 7(fvec4) 7(fvec4)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 83(fvec2)
108(vs_TEXCOORD1):    107(ptr) Variable Output
             109:             TypePointer Input 83(fvec2)
             110:    109(ptr) Variable Input
120(vs_TEXCOORD2):    107(ptr) Variable Output
             130:             TypePointer Output 6(float)
             136:             TypePointer Function 7(fvec4)
             138:             TypeVector 21(int) 4
             139:             TypePointer Function 138(ivec4)
             141:             TypeBool
             142:             TypeVector 141(bool) 4
             143:             TypePointer Function 142(bvec4)
             145:             TypeVector 14(int) 4
             146:             TypePointer Function 145(ivec4)
               4:           2 Function None 3
               5:             Label
             137:    136(ptr) Variable Function
             140:    139(ptr) Variable Function
             144:    143(ptr) Variable Function
             147:    146(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             111:   83(fvec2) Load 110
             112:     24(ptr) AccessChain 20 35
             113:    7(fvec4) Load 112
             114:   83(fvec2) VectorShuffle 113 113 0 1
             115:   83(fvec2) FMul 111 114
             116:     24(ptr) AccessChain 20 35
             117:    7(fvec4) Load 116
             118:   83(fvec2) VectorShuffle 117 117 2 3
             119:   83(fvec2) FAdd 115 118
                              Store 108(vs_TEXCOORD1) 119
             121:   83(fvec2) Load 110
             122:     24(ptr) AccessChain 20 44
             123:    7(fvec4) Load 122
             124:   83(fvec2) VectorShuffle 123 123 0 1
             125:   83(fvec2) FMul 121 124
             126:     24(ptr) AccessChain 20 44
             127:    7(fvec4) Load 126
             128:   83(fvec2) VectorShuffle 127 127 2 3
             129:   83(fvec2) FAdd 125 128
                              Store 120(vs_TEXCOORD2) 129
             131:    130(ptr) AccessChain 79 22 75
             132:    6(float) Load 131
             133:    6(float) FNegate 132
             134:    130(ptr) AccessChain 79 22 75
                              Store 134 133
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 113

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 22 62 85 95
                              ExecutionMode 4 OriginUpperLeft
                              Name 22  "vs_TEXCOORD1"
                              Name 62  "vs_TEXCOORD0"
                              Name 85  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 12 RelaxedPrecision
                              Decorate 12 DescriptorSet 0
                              Decorate 12 Binding 3
                              Decorate 13 RelaxedPrecision
                              Decorate 16 RelaxedPrecision
                              Decorate 16 DescriptorSet 0
                              Decorate 16 Binding 1
                              Decorate 17 RelaxedPrecision
                              Decorate 22(vs_TEXCOORD1) Location 1
                              Decorate 25 RelaxedPrecision
                              Decorate 28 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 30 RelaxedPrecision
                              Decorate 33 RelaxedPrecision
                              Decorate 36 RelaxedPrecision
                              Decorate 41 RelaxedPrecision
                              Decorate 42 RelaxedPrecision
                              MemberDecorate 43 0 Offset 0
                              MemberDecorate 43 1 RelaxedPrecision
                              MemberDecorate 43 1 Offset 16
                              MemberDecorate 43 2 Offset 32
                              Decorate 43 Block
                              Decorate 45 DescriptorSet 1
                              Decorate 45 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 62(vs_TEXCOORD0) Location 0
                              Decorate 73 RelaxedPrecision
                              Decorate 73 DescriptorSet 0
                              Decorate 73 Binding 4
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 75 DescriptorSet 0
                              Decorate 75 Binding 0
                              Decorate 76 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 80 DescriptorSet 0
                              Decorate 80 Binding 5
                              Decorate 81 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 82 DescriptorSet 0
                              Decorate 82 Binding 2
                              Decorate 83 RelaxedPrecision
                              Decorate 85(vs_TEXCOORD2) Location 2
                              Decorate 89 RelaxedPrecision
                              Decorate 92 RelaxedPrecision
                              Decorate 93 RelaxedPrecision
                              Decorate 95 RelaxedPrecision
                              Decorate 95 Location 0
                              Decorate 96 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeImage 6(float) 2D sampled format:Unknown
              11:             TypePointer UniformConstant 10
              12:     11(ptr) Variable UniformConstant
              14:             TypeSampler
              15:             TypePointer UniformConstant 14
              16:     15(ptr) Variable UniformConstant
              18:             TypeSampledImage 10
              20:             TypeVector 6(float) 2
              21:             TypePointer Input 20(fvec2)
22(vs_TEXCOORD1):     21(ptr) Variable Input
              28:      8(ptr) Variable Private
              31:    6(float) Constant 1073741824
              32:   20(fvec2) ConstantComposite 31 31
              34:    6(float) Constant 3212836864
              35:   20(fvec2) ConstantComposite 34 34
              39:             TypePointer Private 20(fvec2)
              40:     39(ptr) Variable Private
              43:             TypeStruct 6(float) 7(fvec4) 7(fvec4)
              44:             TypePointer Uniform 43(struct)
              45:     44(ptr) Variable Uniform
              46:             TypeInt 32 1
              47:     46(int) Constant 0
              48:             TypePointer Uniform 6(float)
              54:     46(int) Constant 2
              55:             TypePointer Uniform 7(fvec4)
              61:             TypePointer Input 7(fvec4)
62(vs_TEXCOORD0):     61(ptr) Variable Input
              73:     11(ptr) Variable UniformConstant
              75:     15(ptr) Variable UniformConstant
              80:     11(ptr) Variable UniformConstant
              82:     15(ptr) Variable UniformConstant
85(vs_TEXCOORD2):     21(ptr) Variable Input
              88:      8(ptr) Variable Private
              90:     46(int) Constant 1
              94:             TypePointer Output 7(fvec4)
              95:     94(ptr) Variable Output
             100:             TypePointer Function 7(fvec4)
             102:             TypeVector 46(int) 4
             103:             TypePointer Function 102(ivec4)
             105:             TypeBool
             106:             TypeVector 105(bool) 4
             107:             TypePointer Function 106(bvec4)
             109:             TypeInt 32 0
             110:             TypeVector 109(int) 4
             111:             TypePointer Function 110(ivec4)
               4:           2 Function None 3
               5:             Label
             101:    100(ptr) Variable Function
             104:    103(ptr) Variable Function
             108:    107(ptr) Variable Function
             112:    111(ptr) Variable Function
              13:          10 Load 12
              17:          14 Load 16
              19:          18 SampledImage 13 17
              23:   20(fvec2) Load 22(vs_TEXCOORD1)
              24:    7(fvec4) ImageSampleImplicitLod 19 23
              25:   20(fvec2) VectorShuffle 24 24 0 1
              26:    7(fvec4) Load 9
              27:    7(fvec4) VectorShuffle 26 25 4 5 2 3
                              Store 9 27
              29:    7(fvec4) Load 9
              30:   20(fvec2) VectorShuffle 29 29 0 1
              33:   20(fvec2) FMul 30 32
              36:   20(fvec2) FAdd 33 35
              37:    7(fvec4) Load 28
              38:    7(fvec4) VectorShuffle 37 36 4 5 2 3
                              Store 28 38
              41:    7(fvec4) Load 28
              42:   20(fvec2) VectorShuffle 41 41 0 1
              49:     48(ptr) AccessChain 45 47
              50:    6(float) Load 49
              51:   20(fvec2) CompositeConstruct 50 50
              52:   20(fvec2) FMul 42 51
                              Store 40 52
              53:   20(fvec2) Load 40
              56:     55(ptr) AccessChain 45 54
              57:    7(fvec4) Load 56
              58:   20(fvec2) VectorShuffle 57 57 0 1
              59:   20(fvec2) FMul 53 58
                              Store 40 59
              60:   20(fvec2) Load 40
              63:    7(fvec4) Load 62(vs_TEXCOORD0)
              64:   20(fvec2) VectorShuffle 63 63 2 2
              65:   20(fvec2) FMul 60 64
              66:    7(fvec4) Load 62(vs_TEXCOORD0)
              67:   20(fvec2) VectorShuffle 66 66 0 1
              68:   20(fvec2) FAdd 65 67
                              Store 40 68
              69:   20(fvec2) Load 40
              70:    7(fvec4) Load 62(vs_TEXCOORD0)
              71:   20(fvec2) VectorShuffle 70 70 3 3
              72:   20(fvec2) FDiv 69 71
                              Store 40 72
              74:          10 Load 73
              76:          14 Load 75
              77:          18 SampledImage 74 76
              78:   20(fvec2) Load 40
              79:    7(fvec4) ImageSampleImplicitLod 77 78
                              Store 9 79
              81:          10 Load 80
              83:          14 Load 82
              84:          18 SampledImage 81 83
              86:   20(fvec2) Load 85(vs_TEXCOORD2)
              87:    7(fvec4) ImageSampleImplicitLod 84 86
                              Store 28 87
              89:    7(fvec4) Load 28
              91:     55(ptr) AccessChain 45 90
              92:    7(fvec4) Load 91
              93:    7(fvec4) FMul 89 92
                              Store 88 93
              96:    7(fvec4) Load 9
              97:    7(fvec4) Load 88
              98:    7(fvec4) FMul 96 97
                              Store 95 98
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_BumpMap" to set: 0, binding: 3, used in: Fragment  using sampler in set: 0, binding: 1, used in: Fragment 
Set 2D Texture "_GrabTexture" to set: 0, binding: 4, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 
Set 2D Texture "_MainTex" to set: 0, binding: 5, used in: Fragment  using sampler in set: 0, binding: 2, used in: Fragment 

Constant Buffer "PGlobals2882018188" (48 bytes) on set: 1, binding: 0, used in: Fragment  {
  Float _BumpAmt at 0
  Vector4 _Color at 16
  Vector4 _GrabTexture_TexelSize at 32
}
Constant Buffer "VGlobals2882018188" (160 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_MatrixVP at 64
  Matrix4x4 unity_ObjectToWorld at 0
  Vector4 _BumpMap_ST at 128
  Vector4 _MainTex_ST at 144
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 148

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 79 95 108 110 120
                              Name 95  "vs_TEXCOORD0"
                              Name 108  "vs_TEXCOORD1"
                              Name 120  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 64
                              MemberDecorate 18 2 Offset 128
                              MemberDecorate 18 3 Offset 144
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              MemberDecorate 77 0 BuiltIn Position
                              MemberDecorate 77 1 BuiltIn PointSize
                              MemberDecorate 77 2 BuiltIn ClipDistance
                              Decorate 77 Block
                              Decorate 95(vs_TEXCOORD0) Location 0
                              Decorate 108(vs_TEXCOORD1) Location 1
                              Decorate 110 Location 1
                              Decorate 120(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeStruct 16 17 7(fvec4) 7(fvec4)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:             TypeInt 32 1
              22:     21(int) Constant 0
              23:     21(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              35:     21(int) Constant 2
              44:     21(int) Constant 3
              48:      8(ptr) Variable Private
              75:     14(int) Constant 1
              76:             TypeArray 6(float) 75
              77:             TypeStruct 7(fvec4) 6(float) 76
              78:             TypePointer Output 77(struct)
              79:     78(ptr) Variable Output
              81:             TypePointer Output 7(fvec4)
              83:             TypeVector 6(float) 2
              86:    6(float) Constant 1065353216
              87:    6(float) Constant 3212836864
              88:   83(fvec2) ConstantComposite 86 87
95(vs_TEXCOORD0):     81(ptr) Variable Output
             102:    6(float) Constant 1056964608
             103:   83(fvec2) ConstantComposite 102 102
             107:             TypePointer Output 83(fvec2)
108(vs_TEXCOORD1):    107(ptr) Variable Output
             109:             TypePointer Input 83(fvec2)
             110:    109(ptr) Variable Input
120(vs_TEXCOORD2):    107(ptr) Variable Output
             130:             TypePointer Output 6(float)
             136:             TypePointer Function 7(fvec4)
             138:             TypeVector 21(int) 4
             139:             TypePointer Function 138(ivec4)
             141:             TypeBool
             142:             TypeVector 141(bool) 4
             143:             TypePointer Function 142(bvec4)
             145:             TypeVector 14(int) 4
             146:             TypePointer Function 145(ivec4)
               4:           2 Function None 3
               5:             Label
             137:    136(ptr) Variable Function
             140:    139(ptr) Variable Function
             144:    143(ptr) Variable Function
             147:    146(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 20 22 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              28:     24(ptr) AccessChain 20 22 22
              29:    7(fvec4) Load 28
              30:    7(fvec4) Load 11
              31:    7(fvec4) VectorShuffle 30 30 0 0 0 0
              32:    7(fvec4) FMul 29 31
              33:    7(fvec4) Load 9
              34:    7(fvec4) FAdd 32 33
                              Store 9 34
              36:     24(ptr) AccessChain 20 22 35
              37:    7(fvec4) Load 36
              38:    7(fvec4) Load 11
              39:    7(fvec4) VectorShuffle 38 38 2 2 2 2
              40:    7(fvec4) FMul 37 39
              41:    7(fvec4) Load 9
              42:    7(fvec4) FAdd 40 41
                              Store 9 42
              43:    7(fvec4) Load 9
              45:     24(ptr) AccessChain 20 22 44
              46:    7(fvec4) Load 45
              47:    7(fvec4) FAdd 43 46
                              Store 9 47
              49:    7(fvec4) Load 9
              50:    7(fvec4) VectorShuffle 49 49 1 1 1 1
              51:     24(ptr) AccessChain 20 23 23
              52:    7(fvec4) Load 51
              53:    7(fvec4) FMul 50 52
                              Store 48 53
              54:     24(ptr) AccessChain 20 23 22
              55:    7(fvec4) Load 54
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 56 0 0 0 0
              58:    7(fvec4) FMul 55 57
              59:    7(fvec4) Load 48
              60:    7(fvec4) FAdd 58 59
                              Store 48 60
              61:     24(ptr) AccessChain 20 23 35
              62:    7(fvec4) Load 61
              63:    7(fvec4) Load 9
              64:    7(fvec4) VectorShuffle 63 63 2 2 2 2
              65:    7(fvec4) FMul 62 64
              66:    7(fvec4) Load 48
              67:    7(fvec4) FAdd 65 66
                              Store 48 67
              68:     24(ptr) AccessChain 20 23 44
              69:    7(fvec4) Load 68
              70:    7(fvec4) Load 9
              71:    7(fvec4) VectorShuffle 70 70 3 3 3 3
              72:    7(fvec4) FMul 69 71
              73:    7(fvec4) Load 48
              74:    7(fvec4) FAdd 72 73
                              Store 9 74
              80:    7(fvec4) Load 9
              82:     81(ptr) AccessChain 79 22
                              Store 82 80
              84:    7(fvec4) Load 9
              85:   83(fvec2) VectorShuffle 84 84 0 1
              89:   83(fvec2) FMul 85 88
              90:    7(fvec4) Load 9
              91:   83(fvec2) VectorShuffle 90 90 3 3
              92:   83(fvec2) FAdd 89 91
              93:    7(fvec4) Load 9
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 9 94
              96:    7(fvec4) Load 9
              97:   83(fvec2) VectorShuffle 96 96 2 3
              98:    7(fvec4) Load 95(vs_TEXCOORD0)
              99:    7(fvec4) VectorShuffle 98 97 0 1 4 5
                              Store 95(vs_TEXCOORD0) 99
             100:    7(fvec4) Load 9
             101:   83(fvec2) VectorShuffle 100 100 0 1
             104:   83(fvec2) FMul 101 103
             105:    7(fvec4) Load 95(vs_TEXCOORD0)
             106:    7(fvec4) VectorShuffle 105 104 4 5 2 3
                              Store 95(vs_TEXCOORD0) 106
             111:   83(fvec2) Load 110
             112:     24(ptr) AccessChain 20 35
             113:    7(fvec4) Load 112
             114:   83(fvec2) VectorShuffle 113 113 0 1
             115:   83(fvec2) FMul 111 114
             116:     24(ptr) AccessChain 20 35
             117:    7(fvec4) Load 116
             118:   83(fvec2) VectorShuffle 117 117 2 3
             119:   83(fvec2) FAdd 115 118
                              Store 108(vs_TEXCOORD1) 119
             121:   83(fvec2) Load 110
             122:     24(ptr) AccessChain 20 44
             123:    7(fvec4) Load 122
             124:   83(fvec2) VectorShuffle 123 123 0 1
             125:   83(fvec2) FMul 121 124
             126:     24(ptr) AccessChain 20 44
             127:    7(fvec4) Load 126
             128:   83(fvec2) VectorShuffle 127 127 2 3
             129:   83(fvec2) FAdd 125 128
                              Store 120(vs_TEXCOORD2) 129
             131:    130(ptr) AccessChain 79 22 75
             132:    6(float) Load 131
             133:    6(float) FNegate 132
             134:    130(ptr) AccessChain 79 22 75
                              Store 134 133
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 113

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 22 62 85 95
                              ExecutionMode 4 OriginUpperLeft
                              Name 22  "vs_TEXCOORD1"
                              Name 62  "vs_TEXCOORD0"
                              Name 85  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 12 RelaxedPrecision
                              Decorate 12 DescriptorSet 0
                              Decorate 12 Binding 3
                              Decorate 13 RelaxedPrecision
                              Decorate 16 RelaxedPrecision
                              Decorate 16 DescriptorSet 0
                              Decorate 16 Binding 1
                              Decorate 17 RelaxedPrecision
                              Decorate 22(vs_TEXCOORD1) Location 1
                              Decorate 25 RelaxedPrecision
                              Decorate 28 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 30 RelaxedPrecision
                              Decorate 33 RelaxedPrecision
                              Decorate 36 RelaxedPrecision
                              Decorate 41 RelaxedPrecision
                              Decorate 42 RelaxedPrecision
                              MemberDecorate 43 0 Offset 0
                              MemberDecorate 43 1 RelaxedPrecision
                              MemberDecorate 43 1 Offset 16
                              MemberDecorate 43 2 Offset 32
                              Decorate 43 Block
                              Decorate 45 DescriptorSet 1
                              Decorate 45 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 62(vs_TEXCOORD0) Location 0
                              Decorate 73 RelaxedPrecision
                              Decorate 73 DescriptorSet 0
                              Decorate 73 Binding 4
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 75 DescriptorSet 0
                              Decorate 75 Binding 0
                              Decorate 76 RelaxedPrecision
                              Decorate 80 RelaxedPrecision
                              Decorate 80 DescriptorSet 0
                              Decorate 80 Binding 5
                              Decorate 81 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 82 DescriptorSet 0
                              Decorate 82 Binding 2
                              Decorate 83 RelaxedPrecision
                              Decorate 85(vs_TEXCOORD2) Location 2
                              Decorate 89 RelaxedPrecision
                              Decorate 92 RelaxedPrecision
                              Decorate 93 RelaxedPrecision
                              Decorate 95 RelaxedPrecision
                              Decorate 95 Location 0
                              Decorate 96 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeImage 6(float) 2D sampled format:Unknown
              11:             TypePointer UniformConstant 10
              12:     11(ptr) Variable UniformConstant
              14:             TypeSampler
              15:             TypePointer UniformConstant 14
              16:     15(ptr) Variable UniformConstant
              18:             TypeSampledImage 10
              20:             TypeVector 6(float) 2
              21:             TypePointer Input 20(fvec2)
22(vs_TEXCOORD1):     21(ptr) Variable Input
              28:      8(ptr) Variable Private
              31:    6(float) Constant 1073741824
              32:   20(fvec2) ConstantComposite 31 31
              34:    6(float) Constant 3212836864
              35:   20(fvec2) ConstantComposite 34 34
              39:             TypePointer Private 20(fvec2)
              40:     39(ptr) Variable Private
              43:             TypeStruct 6(float) 7(fvec4) 7(fvec4)
              44:             TypePointer Uniform 43(struct)
              45:     44(ptr) Variable Uniform
              46:             TypeInt 32 1
              47:     46(int) Constant 0
              48:             TypePointer Uniform 6(float)
              54:     46(int) Constant 2
              55:             TypePointer Uniform 7(fvec4)
              61:             TypePointer Input 7(fvec4)
62(vs_TEXCOORD0):     61(ptr) Variable Input
              73:     11(ptr) Variable UniformConstant
              75:     15(ptr) Variable UniformConstant
              80:     11(ptr) Variable UniformConstant
              82:     15(ptr) Variable UniformConstant
85(vs_TEXCOORD2):     21(ptr) Variable Input
              88:      8(ptr) Variable Private
              90:     46(int) Constant 1
              94:             TypePointer Output 7(fvec4)
              95:     94(ptr) Variable Output
             100:             TypePointer Function 7(fvec4)
             102:             TypeVector 46(int) 4
             103:             TypePointer Function 102(ivec4)
             105:             TypeBool
             106:             TypeVector 105(bool) 4
             107:             TypePointer Function 106(bvec4)
             109:             TypeInt 32 0
             110:             TypeVector 109(int) 4
             111:             TypePointer Function 110(ivec4)
               4:           2 Function None 3
               5:             Label
             101:    100(ptr) Variable Function
             104:    103(ptr) Variable Function
             108:    107(ptr) Variable Function
             112:    111(ptr) Variable Function
              13:          10 Load 12
              17:          14 Load 16
              19:          18 SampledImage 13 17
              23:   20(fvec2) Load 22(vs_TEXCOORD1)
              24:    7(fvec4) ImageSampleImplicitLod 19 23
              25:   20(fvec2) VectorShuffle 24 24 0 1
              26:    7(fvec4) Load 9
              27:    7(fvec4) VectorShuffle 26 25 4 5 2 3
                              Store 9 27
              29:    7(fvec4) Load 9
              30:   20(fvec2) VectorShuffle 29 29 0 1
              33:   20(fvec2) FMul 30 32
              36:   20(fvec2) FAdd 33 35
              37:    7(fvec4) Load 28
              38:    7(fvec4) VectorShuffle 37 36 4 5 2 3
                              Store 28 38
              41:    7(fvec4) Load 28
              42:   20(fvec2) VectorShuffle 41 41 0 1
              49:     48(ptr) AccessChain 45 47
              50:    6(float) Load 49
              51:   20(fvec2) CompositeConstruct 50 50
              52:   20(fvec2) FMul 42 51
                              Store 40 52
              53:   20(fvec2) Load 40
              56:     55(ptr) AccessChain 45 54
              57:    7(fvec4) Load 56
              58:   20(fvec2) VectorShuffle 57 57 0 1
              59:   20(fvec2) FMul 53 58
                              Store 40 59
              60:   20(fvec2) Load 40
              63:    7(fvec4) Load 62(vs_TEXCOORD0)
              64:   20(fvec2) VectorShuffle 63 63 2 2
              65:   20(fvec2) FMul 60 64
              66:    7(fvec4) Load 62(vs_TEXCOORD0)
              67:   20(fvec2) VectorShuffle 66 66 0 1
              68:   20(fvec2) FAdd 65 67
                              Store 40 68
              69:   20(fvec2) Load 40
              70:    7(fvec4) Load 62(vs_TEXCOORD0)
              71:   20(fvec2) VectorShuffle 70 70 3 3
              72:   20(fvec2) FDiv 69 71
                              Store 40 72
              74:          10 Load 73
              76:          14 Load 75
              77:          18 SampledImage 74 76
              78:   20(fvec2) Load 40
              79:    7(fvec4) ImageSampleImplicitLod 77 78
                              Store 9 79
              81:          10 Load 80
              83:          14 Load 82
              84:          18 SampledImage 81 83
              86:   20(fvec2) Load 85(vs_TEXCOORD2)
              87:    7(fvec4) ImageSampleImplicitLod 84 86
                              Store 28 87
              89:    7(fvec4) Load 28
              91:     55(ptr) AccessChain 45 90
              92:    7(fvec4) Load 91
              93:    7(fvec4) FMul 89 92
                              Store 88 93
              96:    7(fvec4) Load 9
              97:    7(fvec4) Load 88
              98:    7(fvec4) FMul 96 97
                              Store 95 98
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



 }
}
}