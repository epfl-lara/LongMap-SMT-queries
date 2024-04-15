; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114506 () Bool)

(assert start!114506)

(declare-fun b!1358980 () Bool)

(declare-fun res!903570 () Bool)

(declare-fun e!771155 () Bool)

(assert (=> b!1358980 (=> (not res!903570) (not e!771155))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92451 0))(
  ( (array!92452 (arr!44668 (Array (_ BitVec 32) (_ BitVec 64))) (size!45220 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92451)

(assert (=> b!1358980 (= res!903570 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45220 a!3742))))))

(declare-fun res!903566 () Bool)

(assert (=> start!114506 (=> (not res!903566) (not e!771155))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114506 (= res!903566 (and (bvslt (size!45220 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45220 a!3742))))))

(assert (=> start!114506 e!771155))

(assert (=> start!114506 true))

(declare-fun array_inv!33901 (array!92451) Bool)

(assert (=> start!114506 (array_inv!33901 a!3742)))

(declare-fun b!1358981 () Bool)

(declare-fun e!771156 () Bool)

(assert (=> b!1358981 (= e!771155 e!771156)))

(declare-fun res!903567 () Bool)

(assert (=> b!1358981 (=> (not res!903567) (not e!771156))))

(assert (=> b!1358981 (= res!903567 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44580 0))(
  ( (Unit!44581) )
))
(declare-fun lt!599320 () Unit!44580)

(declare-fun e!771157 () Unit!44580)

(assert (=> b!1358981 (= lt!599320 e!771157)))

(declare-fun c!127151 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358981 (= c!127151 (validKeyInArray!0 (select (arr!44668 a!3742) from!3120)))))

(declare-fun b!1358982 () Bool)

(declare-fun Unit!44582 () Unit!44580)

(assert (=> b!1358982 (= e!771157 Unit!44582)))

(declare-fun b!1358983 () Bool)

(declare-fun res!903569 () Bool)

(assert (=> b!1358983 (=> (not res!903569) (not e!771155))))

(declare-datatypes ((List!31787 0))(
  ( (Nil!31784) (Cons!31783 (h!32992 (_ BitVec 64)) (t!46449 List!31787)) )
))
(declare-fun acc!759 () List!31787)

(declare-fun contains!9407 (List!31787 (_ BitVec 64)) Bool)

(assert (=> b!1358983 (= res!903569 (not (contains!9407 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358984 () Bool)

(declare-fun res!903564 () Bool)

(assert (=> b!1358984 (=> (not res!903564) (not e!771155))))

(declare-fun noDuplicate!2322 (List!31787) Bool)

(assert (=> b!1358984 (= res!903564 (noDuplicate!2322 acc!759))))

(declare-fun b!1358985 () Bool)

(declare-fun res!903572 () Bool)

(assert (=> b!1358985 (=> (not res!903572) (not e!771155))))

(assert (=> b!1358985 (= res!903572 (not (contains!9407 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358986 () Bool)

(declare-fun res!903565 () Bool)

(assert (=> b!1358986 (=> (not res!903565) (not e!771155))))

(declare-fun arrayNoDuplicates!0 (array!92451 (_ BitVec 32) List!31787) Bool)

(assert (=> b!1358986 (= res!903565 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358987 () Bool)

(assert (=> b!1358987 (= e!771156 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1358988 () Bool)

(declare-fun res!903563 () Bool)

(assert (=> b!1358988 (=> (not res!903563) (not e!771155))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358988 (= res!903563 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358989 () Bool)

(declare-fun res!903568 () Bool)

(assert (=> b!1358989 (=> (not res!903568) (not e!771155))))

(assert (=> b!1358989 (= res!903568 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31784))))

(declare-fun b!1358990 () Bool)

(declare-fun res!903571 () Bool)

(assert (=> b!1358990 (=> (not res!903571) (not e!771155))))

(assert (=> b!1358990 (= res!903571 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45220 a!3742)))))

(declare-fun b!1358991 () Bool)

(declare-fun lt!599318 () Unit!44580)

(assert (=> b!1358991 (= e!771157 lt!599318)))

(declare-fun lt!599319 () Unit!44580)

(declare-fun lemmaListSubSeqRefl!0 (List!31787) Unit!44580)

(assert (=> b!1358991 (= lt!599319 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!845 (List!31787 List!31787) Bool)

(assert (=> b!1358991 (subseq!845 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92451 List!31787 List!31787 (_ BitVec 32)) Unit!44580)

(declare-fun $colon$colon!850 (List!31787 (_ BitVec 64)) List!31787)

(assert (=> b!1358991 (= lt!599318 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!850 acc!759 (select (arr!44668 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358991 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114506 res!903566) b!1358984))

(assert (= (and b!1358984 res!903564) b!1358983))

(assert (= (and b!1358983 res!903569) b!1358985))

(assert (= (and b!1358985 res!903572) b!1358989))

(assert (= (and b!1358989 res!903568) b!1358986))

(assert (= (and b!1358986 res!903565) b!1358980))

(assert (= (and b!1358980 res!903570) b!1358988))

(assert (= (and b!1358988 res!903563) b!1358990))

(assert (= (and b!1358990 res!903571) b!1358981))

(assert (= (and b!1358981 c!127151) b!1358991))

(assert (= (and b!1358981 (not c!127151)) b!1358982))

(assert (= (and b!1358981 res!903567) b!1358987))

(declare-fun m!1244023 () Bool)

(assert (=> start!114506 m!1244023))

(declare-fun m!1244025 () Bool)

(assert (=> b!1358986 m!1244025))

(declare-fun m!1244027 () Bool)

(assert (=> b!1358984 m!1244027))

(declare-fun m!1244029 () Bool)

(assert (=> b!1358983 m!1244029))

(declare-fun m!1244031 () Bool)

(assert (=> b!1358981 m!1244031))

(assert (=> b!1358981 m!1244031))

(declare-fun m!1244033 () Bool)

(assert (=> b!1358981 m!1244033))

(declare-fun m!1244035 () Bool)

(assert (=> b!1358989 m!1244035))

(declare-fun m!1244037 () Bool)

(assert (=> b!1358985 m!1244037))

(declare-fun m!1244039 () Bool)

(assert (=> b!1358988 m!1244039))

(declare-fun m!1244041 () Bool)

(assert (=> b!1358991 m!1244041))

(assert (=> b!1358991 m!1244031))

(declare-fun m!1244043 () Bool)

(assert (=> b!1358991 m!1244043))

(declare-fun m!1244045 () Bool)

(assert (=> b!1358991 m!1244045))

(declare-fun m!1244047 () Bool)

(assert (=> b!1358991 m!1244047))

(assert (=> b!1358991 m!1244031))

(assert (=> b!1358991 m!1244043))

(declare-fun m!1244049 () Bool)

(assert (=> b!1358991 m!1244049))

(assert (=> b!1358987 m!1244047))

(check-sat (not b!1358983) (not b!1358991) (not b!1358987) (not b!1358989) (not b!1358984) (not start!114506) (not b!1358981) (not b!1358988) (not b!1358986) (not b!1358985))
(check-sat)
(get-model)

(declare-fun d!145341 () Bool)

(assert (=> d!145341 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358988 d!145341))

(declare-fun b!1359074 () Bool)

(declare-fun e!771191 () Bool)

(declare-fun call!65275 () Bool)

(assert (=> b!1359074 (= e!771191 call!65275)))

(declare-fun b!1359075 () Bool)

(declare-fun e!771192 () Bool)

(assert (=> b!1359075 (= e!771192 (contains!9407 acc!759 (select (arr!44668 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65272 () Bool)

(declare-fun c!127160 () Bool)

(assert (=> bm!65272 (= call!65275 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127160 (Cons!31783 (select (arr!44668 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1359076 () Bool)

(declare-fun e!771193 () Bool)

(declare-fun e!771190 () Bool)

(assert (=> b!1359076 (= e!771193 e!771190)))

(declare-fun res!903640 () Bool)

(assert (=> b!1359076 (=> (not res!903640) (not e!771190))))

(assert (=> b!1359076 (= res!903640 (not e!771192))))

(declare-fun res!903641 () Bool)

(assert (=> b!1359076 (=> (not res!903641) (not e!771192))))

(assert (=> b!1359076 (= res!903641 (validKeyInArray!0 (select (arr!44668 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359077 () Bool)

(assert (=> b!1359077 (= e!771190 e!771191)))

(assert (=> b!1359077 (= c!127160 (validKeyInArray!0 (select (arr!44668 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145343 () Bool)

(declare-fun res!903639 () Bool)

(assert (=> d!145343 (=> res!903639 e!771193)))

(assert (=> d!145343 (= res!903639 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45220 a!3742)))))

(assert (=> d!145343 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771193)))

(declare-fun b!1359078 () Bool)

(assert (=> b!1359078 (= e!771191 call!65275)))

(assert (= (and d!145343 (not res!903639)) b!1359076))

(assert (= (and b!1359076 res!903641) b!1359075))

(assert (= (and b!1359076 res!903640) b!1359077))

(assert (= (and b!1359077 c!127160) b!1359074))

(assert (= (and b!1359077 (not c!127160)) b!1359078))

(assert (= (or b!1359074 b!1359078) bm!65272))

(declare-fun m!1244107 () Bool)

(assert (=> b!1359075 m!1244107))

(assert (=> b!1359075 m!1244107))

(declare-fun m!1244109 () Bool)

(assert (=> b!1359075 m!1244109))

(assert (=> bm!65272 m!1244107))

(declare-fun m!1244111 () Bool)

(assert (=> bm!65272 m!1244111))

(assert (=> b!1359076 m!1244107))

(assert (=> b!1359076 m!1244107))

(declare-fun m!1244113 () Bool)

(assert (=> b!1359076 m!1244113))

(assert (=> b!1359077 m!1244107))

(assert (=> b!1359077 m!1244107))

(assert (=> b!1359077 m!1244113))

(assert (=> b!1358987 d!145343))

(declare-fun d!145345 () Bool)

(assert (=> d!145345 (= (array_inv!33901 a!3742) (bvsge (size!45220 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114506 d!145345))

(declare-fun d!145347 () Bool)

(assert (=> d!145347 (= (validKeyInArray!0 (select (arr!44668 a!3742) from!3120)) (and (not (= (select (arr!44668 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44668 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358981 d!145347))

(declare-fun b!1359079 () Bool)

(declare-fun e!771195 () Bool)

(declare-fun call!65276 () Bool)

(assert (=> b!1359079 (= e!771195 call!65276)))

(declare-fun e!771196 () Bool)

(declare-fun b!1359080 () Bool)

(assert (=> b!1359080 (= e!771196 (contains!9407 acc!759 (select (arr!44668 a!3742) from!3120)))))

(declare-fun c!127161 () Bool)

(declare-fun bm!65273 () Bool)

(assert (=> bm!65273 (= call!65276 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127161 (Cons!31783 (select (arr!44668 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1359081 () Bool)

(declare-fun e!771197 () Bool)

(declare-fun e!771194 () Bool)

(assert (=> b!1359081 (= e!771197 e!771194)))

(declare-fun res!903643 () Bool)

(assert (=> b!1359081 (=> (not res!903643) (not e!771194))))

(assert (=> b!1359081 (= res!903643 (not e!771196))))

(declare-fun res!903644 () Bool)

(assert (=> b!1359081 (=> (not res!903644) (not e!771196))))

(assert (=> b!1359081 (= res!903644 (validKeyInArray!0 (select (arr!44668 a!3742) from!3120)))))

(declare-fun b!1359082 () Bool)

(assert (=> b!1359082 (= e!771194 e!771195)))

(assert (=> b!1359082 (= c!127161 (validKeyInArray!0 (select (arr!44668 a!3742) from!3120)))))

(declare-fun d!145349 () Bool)

(declare-fun res!903642 () Bool)

(assert (=> d!145349 (=> res!903642 e!771197)))

(assert (=> d!145349 (= res!903642 (bvsge from!3120 (size!45220 a!3742)))))

(assert (=> d!145349 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771197)))

(declare-fun b!1359083 () Bool)

(assert (=> b!1359083 (= e!771195 call!65276)))

(assert (= (and d!145349 (not res!903642)) b!1359081))

(assert (= (and b!1359081 res!903644) b!1359080))

(assert (= (and b!1359081 res!903643) b!1359082))

(assert (= (and b!1359082 c!127161) b!1359079))

(assert (= (and b!1359082 (not c!127161)) b!1359083))

(assert (= (or b!1359079 b!1359083) bm!65273))

(assert (=> b!1359080 m!1244031))

(assert (=> b!1359080 m!1244031))

(declare-fun m!1244115 () Bool)

(assert (=> b!1359080 m!1244115))

(assert (=> bm!65273 m!1244031))

(declare-fun m!1244117 () Bool)

(assert (=> bm!65273 m!1244117))

(assert (=> b!1359081 m!1244031))

(assert (=> b!1359081 m!1244031))

(assert (=> b!1359081 m!1244033))

(assert (=> b!1359082 m!1244031))

(assert (=> b!1359082 m!1244031))

(assert (=> b!1359082 m!1244033))

(assert (=> b!1358986 d!145349))

(declare-fun d!145351 () Bool)

(assert (=> d!145351 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599341 () Unit!44580)

(declare-fun choose!80 (array!92451 List!31787 List!31787 (_ BitVec 32)) Unit!44580)

(assert (=> d!145351 (= lt!599341 (choose!80 a!3742 ($colon$colon!850 acc!759 (select (arr!44668 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145351 (bvslt (size!45220 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145351 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!850 acc!759 (select (arr!44668 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599341)))

(declare-fun bs!38946 () Bool)

(assert (= bs!38946 d!145351))

(assert (=> bs!38946 m!1244047))

(assert (=> bs!38946 m!1244043))

(declare-fun m!1244119 () Bool)

(assert (=> bs!38946 m!1244119))

(assert (=> b!1358991 d!145351))

(declare-fun b!1359100 () Bool)

(declare-fun e!771215 () Bool)

(declare-fun e!771217 () Bool)

(assert (=> b!1359100 (= e!771215 e!771217)))

(declare-fun res!903661 () Bool)

(assert (=> b!1359100 (=> (not res!903661) (not e!771217))))

(get-info :version)

(assert (=> b!1359100 (= res!903661 ((_ is Cons!31783) acc!759))))

(declare-fun b!1359103 () Bool)

(declare-fun e!771216 () Bool)

(assert (=> b!1359103 (= e!771216 (subseq!845 acc!759 (t!46449 acc!759)))))

(declare-fun b!1359101 () Bool)

(assert (=> b!1359101 (= e!771217 e!771216)))

(declare-fun res!903663 () Bool)

(assert (=> b!1359101 (=> res!903663 e!771216)))

(declare-fun e!771214 () Bool)

(assert (=> b!1359101 (= res!903663 e!771214)))

(declare-fun res!903664 () Bool)

(assert (=> b!1359101 (=> (not res!903664) (not e!771214))))

(assert (=> b!1359101 (= res!903664 (= (h!32992 acc!759) (h!32992 acc!759)))))

(declare-fun d!145355 () Bool)

(declare-fun res!903662 () Bool)

(assert (=> d!145355 (=> res!903662 e!771215)))

(assert (=> d!145355 (= res!903662 ((_ is Nil!31784) acc!759))))

(assert (=> d!145355 (= (subseq!845 acc!759 acc!759) e!771215)))

(declare-fun b!1359102 () Bool)

(assert (=> b!1359102 (= e!771214 (subseq!845 (t!46449 acc!759) (t!46449 acc!759)))))

(assert (= (and d!145355 (not res!903662)) b!1359100))

(assert (= (and b!1359100 res!903661) b!1359101))

(assert (= (and b!1359101 res!903664) b!1359102))

(assert (= (and b!1359101 (not res!903663)) b!1359103))

(declare-fun m!1244123 () Bool)

(assert (=> b!1359103 m!1244123))

(declare-fun m!1244125 () Bool)

(assert (=> b!1359102 m!1244125))

(assert (=> b!1358991 d!145355))

(assert (=> b!1358991 d!145343))

(declare-fun d!145361 () Bool)

(assert (=> d!145361 (= ($colon$colon!850 acc!759 (select (arr!44668 a!3742) from!3120)) (Cons!31783 (select (arr!44668 a!3742) from!3120) acc!759))))

(assert (=> b!1358991 d!145361))

(declare-fun d!145363 () Bool)

(assert (=> d!145363 (subseq!845 acc!759 acc!759)))

(declare-fun lt!599347 () Unit!44580)

(declare-fun choose!36 (List!31787) Unit!44580)

(assert (=> d!145363 (= lt!599347 (choose!36 acc!759))))

(assert (=> d!145363 (= (lemmaListSubSeqRefl!0 acc!759) lt!599347)))

(declare-fun bs!38948 () Bool)

(assert (= bs!38948 d!145363))

(assert (=> bs!38948 m!1244049))

(declare-fun m!1244131 () Bool)

(assert (=> bs!38948 m!1244131))

(assert (=> b!1358991 d!145363))

(declare-fun d!145367 () Bool)

(declare-fun lt!599350 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!684 (List!31787) (InoxSet (_ BitVec 64)))

(assert (=> d!145367 (= lt!599350 (select (content!684 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771243 () Bool)

(assert (=> d!145367 (= lt!599350 e!771243)))

(declare-fun res!903685 () Bool)

(assert (=> d!145367 (=> (not res!903685) (not e!771243))))

(assert (=> d!145367 (= res!903685 ((_ is Cons!31783) acc!759))))

(assert (=> d!145367 (= (contains!9407 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599350)))

(declare-fun b!1359132 () Bool)

(declare-fun e!771242 () Bool)

(assert (=> b!1359132 (= e!771243 e!771242)))

(declare-fun res!903686 () Bool)

(assert (=> b!1359132 (=> res!903686 e!771242)))

(assert (=> b!1359132 (= res!903686 (= (h!32992 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359133 () Bool)

(assert (=> b!1359133 (= e!771242 (contains!9407 (t!46449 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145367 res!903685) b!1359132))

(assert (= (and b!1359132 (not res!903686)) b!1359133))

(declare-fun m!1244133 () Bool)

(assert (=> d!145367 m!1244133))

(declare-fun m!1244135 () Bool)

(assert (=> d!145367 m!1244135))

(declare-fun m!1244137 () Bool)

(assert (=> b!1359133 m!1244137))

(assert (=> b!1358985 d!145367))

(declare-fun d!145369 () Bool)

(declare-fun res!903700 () Bool)

(declare-fun e!771260 () Bool)

(assert (=> d!145369 (=> res!903700 e!771260)))

(assert (=> d!145369 (= res!903700 ((_ is Nil!31784) acc!759))))

(assert (=> d!145369 (= (noDuplicate!2322 acc!759) e!771260)))

(declare-fun b!1359153 () Bool)

(declare-fun e!771261 () Bool)

(assert (=> b!1359153 (= e!771260 e!771261)))

(declare-fun res!903701 () Bool)

(assert (=> b!1359153 (=> (not res!903701) (not e!771261))))

(assert (=> b!1359153 (= res!903701 (not (contains!9407 (t!46449 acc!759) (h!32992 acc!759))))))

(declare-fun b!1359154 () Bool)

(assert (=> b!1359154 (= e!771261 (noDuplicate!2322 (t!46449 acc!759)))))

(assert (= (and d!145369 (not res!903700)) b!1359153))

(assert (= (and b!1359153 res!903701) b!1359154))

(declare-fun m!1244147 () Bool)

(assert (=> b!1359153 m!1244147))

(declare-fun m!1244149 () Bool)

(assert (=> b!1359154 m!1244149))

(assert (=> b!1358984 d!145369))

(declare-fun b!1359155 () Bool)

(declare-fun e!771263 () Bool)

(declare-fun call!65284 () Bool)

(assert (=> b!1359155 (= e!771263 call!65284)))

(declare-fun b!1359156 () Bool)

(declare-fun e!771264 () Bool)

(assert (=> b!1359156 (= e!771264 (contains!9407 Nil!31784 (select (arr!44668 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65281 () Bool)

(declare-fun c!127169 () Bool)

(assert (=> bm!65281 (= call!65284 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127169 (Cons!31783 (select (arr!44668 a!3742) #b00000000000000000000000000000000) Nil!31784) Nil!31784)))))

(declare-fun b!1359157 () Bool)

(declare-fun e!771265 () Bool)

(declare-fun e!771262 () Bool)

(assert (=> b!1359157 (= e!771265 e!771262)))

(declare-fun res!903703 () Bool)

(assert (=> b!1359157 (=> (not res!903703) (not e!771262))))

(assert (=> b!1359157 (= res!903703 (not e!771264))))

(declare-fun res!903704 () Bool)

(assert (=> b!1359157 (=> (not res!903704) (not e!771264))))

(assert (=> b!1359157 (= res!903704 (validKeyInArray!0 (select (arr!44668 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359158 () Bool)

(assert (=> b!1359158 (= e!771262 e!771263)))

(assert (=> b!1359158 (= c!127169 (validKeyInArray!0 (select (arr!44668 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145373 () Bool)

(declare-fun res!903702 () Bool)

(assert (=> d!145373 (=> res!903702 e!771265)))

(assert (=> d!145373 (= res!903702 (bvsge #b00000000000000000000000000000000 (size!45220 a!3742)))))

(assert (=> d!145373 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31784) e!771265)))

(declare-fun b!1359159 () Bool)

(assert (=> b!1359159 (= e!771263 call!65284)))

(assert (= (and d!145373 (not res!903702)) b!1359157))

(assert (= (and b!1359157 res!903704) b!1359156))

(assert (= (and b!1359157 res!903703) b!1359158))

(assert (= (and b!1359158 c!127169) b!1359155))

(assert (= (and b!1359158 (not c!127169)) b!1359159))

(assert (= (or b!1359155 b!1359159) bm!65281))

(declare-fun m!1244161 () Bool)

(assert (=> b!1359156 m!1244161))

(assert (=> b!1359156 m!1244161))

(declare-fun m!1244165 () Bool)

(assert (=> b!1359156 m!1244165))

(assert (=> bm!65281 m!1244161))

(declare-fun m!1244167 () Bool)

(assert (=> bm!65281 m!1244167))

(assert (=> b!1359157 m!1244161))

(assert (=> b!1359157 m!1244161))

(declare-fun m!1244169 () Bool)

(assert (=> b!1359157 m!1244169))

(assert (=> b!1359158 m!1244161))

(assert (=> b!1359158 m!1244161))

(assert (=> b!1359158 m!1244169))

(assert (=> b!1358989 d!145373))

(declare-fun d!145381 () Bool)

(declare-fun lt!599351 () Bool)

(assert (=> d!145381 (= lt!599351 (select (content!684 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771267 () Bool)

(assert (=> d!145381 (= lt!599351 e!771267)))

(declare-fun res!903705 () Bool)

(assert (=> d!145381 (=> (not res!903705) (not e!771267))))

(assert (=> d!145381 (= res!903705 ((_ is Cons!31783) acc!759))))

(assert (=> d!145381 (= (contains!9407 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599351)))

(declare-fun b!1359160 () Bool)

(declare-fun e!771266 () Bool)

(assert (=> b!1359160 (= e!771267 e!771266)))

(declare-fun res!903706 () Bool)

(assert (=> b!1359160 (=> res!903706 e!771266)))

(assert (=> b!1359160 (= res!903706 (= (h!32992 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359161 () Bool)

(assert (=> b!1359161 (= e!771266 (contains!9407 (t!46449 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145381 res!903705) b!1359160))

(assert (= (and b!1359160 (not res!903706)) b!1359161))

(assert (=> d!145381 m!1244133))

(declare-fun m!1244171 () Bool)

(assert (=> d!145381 m!1244171))

(declare-fun m!1244173 () Bool)

(assert (=> b!1359161 m!1244173))

(assert (=> b!1358983 d!145381))

(check-sat (not b!1359154) (not b!1359102) (not bm!65272) (not bm!65273) (not b!1359133) (not d!145381) (not b!1359153) (not d!145351) (not b!1359158) (not b!1359157) (not b!1359156) (not b!1359080) (not b!1359075) (not b!1359076) (not d!145367) (not b!1359103) (not b!1359077) (not d!145363) (not b!1359161) (not b!1359081) (not b!1359082) (not bm!65281))
(check-sat)
