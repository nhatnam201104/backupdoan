<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />


    <!-- Bootstrap CSS v5.2.1 -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" media="all">
    <link rel="stylesheet" href="./css/user.css">
    <link rel="stylesheet" href="./css/userAddress.css">
    <link rel="stylesheet" href="./css/userOrderDetail.css">
    <link rel="stylesheet" href="./css/userOrder.css">

</head>

<body>
    <div class="wrapper bg-gray">
        <!-- navbar-top -->
        <div class="container-fluid shadow p-2">
            <nav class="navbar bg-body-tertiary navbar-expand-lg scroll  ">
                <div class="container-fluid">
                    <div class="navLogo d-flex">
                        <button class="navbar-toggler me-sm-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            <h3>logo</h3>
                        </a>
                    </div>

                    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <form class="d-flex formSearch" role="search">
                                        <input class="form-control py-2 px-5 " size="25" type="search" placeholder="Search" aria-label="Search" id="search-bar">
                                        <div class="iconForSearchBar mb-2 ">
                                            <i class="fa-solid fa-magnifying-glass px-2 py-2"></i>
                                        </div>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="navbar-right d-flex align-items-center justify-content-end">
                        <form class="d-flex newformSearch" role="search">
                            <div class="newSearchbar">
                                <input class="form-control py-2 px-5 " size="25" type="search" placeholder="Search" aria-label="Search" id="search-bar">
                                <!-- <div class="iconForSearchBar mb-2 ">
                            <i class="fa-solid fa-magnifying-glass px-2 py-2"></i>
                        </div> -->
                            </div>
                        </form>
                        <div class="info text-center">
                            <a href="#user.php">
                                <?php
                                session_start();
                                echo ($_SESSION["accountCurrent"]["username"]);
                                ?>
                            </a>
                        </div>


                    </div>
                </div>
            </nav>
        </div>

        <!-- end navbar-top -->

        <!-- navbar-controller -->


        <div class="row bg-gray mt-2">
            <div class="col-sm-8 col-md-3 ">
                <div class="container-fluid menu-controller">
                    <div class="infoUser">
                        <div class="name">
                            <p>
                                <?php
                                echo ($_SESSION["accountCurrent"]["username"]);
                                ?></p>
                        </div>
                        <div class="edit">
                            <i class="fa-solid fa-pen"></i>
                            <span>Chỉnh sửa</span>
                        </div>
                    </div>
                    <ul class="nav nav-pills flex-column my-3">
                        <li class="nav-item">
                            <a class="nav-link active" href="#userInfo.php?type=200" data-bs-toggle="collapse" data-bs-target="#userController">Tài khoản của tôi </a>
                        </li>

                        <div id="userController" class="collapse">
                            <ul class="nav flex-column my-3">
                                <li class="nav-item">
                                    <a href="#userInfo.php?type=200" class="nav-link">Hồ sơ</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#userAddress.php?type=199" class="nav-link">Địa chỉ</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#?type=198" class="nav-link">Đổi mật khẩu</a>
                                </li>
                                <li class="nav-item"></li>
                            </ul>

                        </div>
                        <li class="nav-item">
                            <a class="nav-link" href="#userOrder.php">Đơn mua</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-error btn-logout" href="">Đăng xuất</a>
                        </li>


                    </ul>
                </div>
            </div>

            <div class="col-sm-12 col-md-8  ">
                <div class="container-fluid bg-white content shadow-lg rounded showPage">

                </div>
            </div>
        </div>



    </div>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="./js/user.js"></script>

</body>

</html>