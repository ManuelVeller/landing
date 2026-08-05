// Configuración de Integraciones del Proyecto (Plantilla)
window.ENV = {
    // URL del webhook de n8n para el formulario de contacto principal en index.html
    N8N_WEBHOOK_URL: '${N8N_WEBHOOK_URL}',

    // URL del webhook de n8n para la demo interactiva de pedidos en demos.html
    DEMOS_N8N_WEBHOOK_URL: '${DEMOS_N8N_WEBHOOK_URL}',

    // URL del webhook de n8n para la demo interactiva de reservas (Google Maps + Calendar) en demos.html
    DEMOS_BOOKING_N8N_WEBHOOK_URL: '${DEMOS_BOOKING_N8N_WEBHOOK_URL}',

    // Credenciales de conexión para Supabase
    SUPABASE_URL: '${SUPABASE_URL}',
    SUPABASE_ANON_KEY: '${SUPABASE_ANON_KEY}'
};
