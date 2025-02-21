// Check if we're running on Netlify
if (window.location.hostname.includes('netlify.app')) {
    // Update API endpoints for Netlify
    const apiBase = '/.netlify/functions/api';
    
    // Update form action
    document.getElementById('ttsForm').action = apiBase;
    
    // Update preview endpoint
    window.previewEndpoint = `${apiBase}/api/preview`;
} 