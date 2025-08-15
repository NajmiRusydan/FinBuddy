<?php
session_start();
include 'db_connect.php';

$sql = "SELECT * FROM USER WHERE USER_TYPE = 'customer' ";
$result = mysqli_query($conn, $sql);
?>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="userListStyle.css">
</head>
<body>
    <a href="adminDashboard.php" class="dashboard-btn-float">Back to Dashboard</a>
    <?php if (isset($_GET['msg'])): ?>
    <div id="notif" class="notif"><?= htmlspecialchars($_GET['msg']) ?></div>
    <script>
        setTimeout(() => {
            document.getElementById('notif').style.display = 'none';
        }, 3000);
    </script>
    <?php endif; ?>
    <h2>User List</h2>
<table border="1">
<tr>
  <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Username</th><th>Status</th><th>Action</th>
</tr>
<?php while($row = mysqli_fetch_assoc($result)): ?>
<tr>
  <td><?= $row['USER_ID'] ?></td>
  <td><?= htmlspecialchars($row['USER_FULLNAME']) ?></td>
  <td><?= htmlspecialchars($row['USER_EMAIL']) ?></td>
  <td><?= htmlspecialchars($row['USER_PHONE_NO']) ?></td>
  <td><?= htmlspecialchars($row['USERNAME']) ?></td>
  <td><?= htmlspecialchars($row['USER_STATUS']) ?></td>
  <td>
    <a href="updateUserStats.php?id=<?= $row['USER_ID'] ?>&status=<?= $row['USER_STATUS'] == 'Active' ? 'Inactive' : 'Active' ?>">
      <?= $row['USER_STATUS'] == 'Active' ? 'Deactivate' : 'Activate' ?>
    </a>
  </td>
</tr>
<?php endwhile; ?>
</table>
</body>
</html>