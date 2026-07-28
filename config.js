// Configuración de Integraciones del Proyecto
window.ENV = {
    // URL del webhook de n8n para el formulario de contacto principal en index.html
    N8N_WEBHOOK_URL: 'https://n8n.tu-servidor.com/webhook/contacto-landing',

    // URL del webhook de n8n para la demo interactiva de pedidos en demos.html
    DEMOS_N8N_WEBHOOK_URL: 'https://n8n.tu-servidor.com/webhook/pedidos-demo',

    // URL del webhook de n8n para la demo interactiva de reservas (Google Maps + Calendar) en demos.html
    DEMOS_BOOKING_N8N_WEBHOOK_URL: 'https://n8n.tu-servidor.com/webhook/reserva-demo',

    // Credenciales de conexión para Supabase (Reemplazar con tus credenciales)
    SUPABASE_URL: 'https://tu-proyecto.supabase.co',
    SUPABASE_ANON_KEY: 'tu-anon-key-de-supabase'
};
