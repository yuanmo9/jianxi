<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/7/3
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>考勤管理</title>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 打卡的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">上班打卡</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" id="name" name="xingming" class="form-control" id="empName_add_input" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出勤日期</label>
                        <div class="col-sm-10">
                            <input id="date" class="form-control" type="text"  aria-label="Disabled input example" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">上班时间</label>
                        <div class="col-sm-10">
                            <input id="currentTime" class="form-control" type="text"  aria-label="Disabled input example" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">上班状态</label>
                        <div class="col-sm-10">
                            <input type="text" name="status" class="form-control" id="status" placeholder="正常">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="empAddModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">下班打卡</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" id="name2" name="xingming" class="form-control" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出勤日期</label>
                        <div class="col-sm-10">
                            <input id="date2" class="form-control" type="text"  aria-label="Disabled input example" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">下班时间</label>
                        <div class="col-sm-10">
                            <input id="currentTime2" class="form-control" type="text"  aria-label="Disabled input example" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">上班状态</label>
                        <div class="col-sm-10">
                            <input id="status2" class="form-control" type="text"  aria-label="Disabled input example" placeholder="正常" disabled>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn2">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="empAddModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel3">考勤情况</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover" id="chuqing_table">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>打卡次数</th>
                                <th>出勤率</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>考勤管理</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="shangban">上班打卡</button>
            <button class="btn btn-danger" id="xiaban">下班打卡</button>
            <button class="btn btn-danger" id="chuqing">员工出勤情况</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="kaoqing_table">
                <thead>
                <tr>
                    <th>员工姓名</th>
                    <th>出勤日期</th>
                    <th>上班时间</th>
                    <th>下班时间</th>
                    <th>上班状态</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" style="float: right" id="page_nav_area">

        </div>
    </div>

</div>

<script type="text/javascript">
    let currentPage = 1;
    let countPage = 3;
    let currentTime;
    let date;
    let type;

    function getTime() {
        var t = new Date();//获取当前时间
        var year = t.getFullYear();//获取当前时间年份
        var month = t.getMonth() + 1;//获取当前时间月份
        var day = t.getDate();//获取当前时间日

        var hour = t.getHours();
        var minute = t.getMinutes();
        var second = t.getSeconds();

        date = year + "-" + month + "-" + day;
        currentTime = hour + ":" + minute + ":" + second;

        if(type == "上班") {
            document.getElementById("date").setAttribute("placeholder", date);
            document.getElementById("currentTime").setAttribute("placeholder", currentTime);
        } else {
            document.getElementById("date2").setAttribute("placeholder", date);
            document.getElementById("currentTime2").setAttribute("placeholder", currentTime);
        }
    }

    $(function(){
        getinfo(currentPage);
    });

    function getinfo(pageNum){
        currentPage = pageNum;

        $.ajax({
            url:"http://localhost:3000/kaoqing/getinfo",
            data: {
                "currentPage": pageNum,
            },
            type:"GET",
            success:function(result){
                countPage = Math.ceil(result.count / 5);
                show_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function show_chuqing(result){
        //清空table表格
        let lists = result.list;
        $.each(lists, function(index,item){
            let name = $("<td></td>").append(item.name);
            let count = $("<td></td>").append(item.count);

            let d = (item.chuqing * 100 / item.count).toFixed(2)

            let chuqing = $("<td></td>").append(d + "%");
            $("<tr></tr>")
                .append(name)
                .append(count)
                .append(chuqing)
                .appendTo("#chuqing_table tbody");
        });
    }

    function show_table(result){
        //清空table表格
        $("#kaoqing_table tbody").empty();
        let lists = result.list;
        $.each(lists, function(index,item){
            let name = $("<td></td>").append(item.name);
            let data = $("<td></td>").append(item.data);
            let workHours = $("<td></td>").append(item.work_hours?item.work_hours:"——");
            let closingTime = $("<td></td>").append(item.closing_time?item.closing_time:"——");
            let status = $("<td></td>").append(item.status);
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>")
                .append(name)
                .append(data)
                .append(workHours)
                .append(closingTime)
                .append(status)
                .appendTo("#kaoqing_table tbody");
        });
    }

    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+currentPage+"页,总"+
            Math.ceil(result.count / 5)+"页,总"+
            result.count+"条记录");
    }
    function build_page_nav(result){
        $("#page_nav_area").empty();
        let ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        let prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(currentPage == 1){
            prePageLi.addClass("disabled");
        }else{
            prePageLi.click(function(){
                getinfo(currentPage - 1);
            });
        }

        let nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        if(currentPage == countPage){
            nextPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                getinfo(currentPage +1);
            });
        }


        //添加首页和前一页 的提示
        ul.append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        for (let i = 1; i <= countPage; i ++) {
            let numLi = $("<li></li>").append($("<a></a>").append(i));
            if(currentPage == i){
                numLi.addClass("active");
            }
            numLi.click(function(){
                currentPage = i;
                getinfo(i);
            });
            ul.append(numLi);
        }

        ul.append(nextPageLi);

        //把ul加入到nav
        let navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#shangban").click(function(){
        reset_form("#empAddModal form");
        type = "上班";
        getTime();
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });

    //点击新增按钮弹出模态框。
    $("#xiaban").click(function(){
        reset_form("#empAddModal2 form");
        type = "下班";
        getTime();
        //弹出模态框
        $("#empAddModal2").modal({
            backdrop:"static"
        });
    });

    $("#chuqing").click(function(){
        $("#empAddModal3").modal({
            backdrop:"static"
        });

        $.ajax({
            url:"http://localhost:3000/kaoqing/chuqing",
            type:"GET",
            success:function(result){
                if (result.result == "success") {
                    show_chuqing(result);
                }
            }
        });
    });

    //上班打卡
    $("#emp_save_btn").click(function(){
        let name = document.getElementById("name").value;
        let status = document.getElementById("status").value;
        if (status == "") status = "正常";

        if (name == "") {
            alert("名字不能为空");
            return ;
        }

        console.log(name);

        $.ajax({
            url:"http://localhost:3000/kaoqing/daka",
            data: {
                "type": type,
                "name": name,
                "date": date,
                "currentTime": currentTime,
                "status": status,
            },
            type:"GET",
            success:function(result){
                if (result.result == "success") {
                    alert("打卡成功");
                    $("#empAddModal").modal('hide');
                }
            }
        });
    });

    // 下班打卡
    $("#emp_save_btn2").click(function(){
        let name = document.getElementById("name2").value;
        if (name == "") {
            alert("名字不能为空");
            return ;
        }
        console.log(name);

        $.ajax({
            url:"http://localhost:3000/kaoqing/daka",
            data: {
                "type": type,
                "name": name,
                "date": date,
                "currentTime": currentTime,
                "status": "正常",
            },
            type:"GET",
            success:function(result){
                if (result.result == "success") {
                    alert("打卡成功");
                    $("#empAddModal2").modal('hide');
                }
                else {
                    alert(result.info);
                }
            }
        });
    });

</script>

</body>
</html>
