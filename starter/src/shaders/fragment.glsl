
void main() {
    vec3 N = normalize(vNormal);
    vec3 E = normalize(vViewPosition);

    // Ambient component (common for both lights)
    float ambientStrength = 0.2;
    vec3 ambient = ambientStrength * uColor;

    // **First Light Calculations**
    vec3 L1 = normalize(vLightDir1);
    vec3 R1 = reflect(-L1, N);
    float diff1 = max(dot(N, L1), 0.0);
    vec3 diffuse1 = diff1 * uColor;
    float spec1 = pow(max(dot(R1, E), 0.0), 32.0); // Shininess
    vec3 specular1 = 0.5 * spec1 * vec3(1.0) * 0.2; // Specular strength

    // **Second Light Calculations**
    vec3 L2 = normalize(vLightDir2);
    vec3 R2 = reflect(-L2, N);
    float diff2 = max(dot(N, L2), 0.0);
    vec3 diffuse2 = diff2 * uColor;
    float spec2 = pow(max(dot(R2, E), 0.0), 32.0); // Shininess
    vec3 specular2 = 0.5 * spec2 * vec3(1.0) * 0.2; // Specular strength

    // Combine contributions from both lights
    vec3 finalColor = (ambient + (diffuse1 + specular1) + (diffuse2 + specular2)) * 0.8;

    gl_FragColor = vec4(finalColor, 1.0); // Output final color
}
