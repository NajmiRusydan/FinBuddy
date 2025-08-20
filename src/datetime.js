function updateDateTime() {
  const now = new Date();
  const options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
  const dateStr = now.toLocaleDateString('en-CA', options);
  const timeStr = now.toLocaleTimeString('en-GB'); 
  document.getElementById('datetime').textContent = `${dateStr} ${timeStr}`;
}
updateDateTime(); 
setInterval(updateDateTime, 1000); 