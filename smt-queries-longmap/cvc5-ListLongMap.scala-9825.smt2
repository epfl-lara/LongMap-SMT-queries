; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116618 () Bool)

(assert start!116618)

(declare-fun res!918052 () Bool)

(declare-fun e!778892 () Bool)

(assert (=> start!116618 (=> (not res!918052) (not e!778892))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93303 0))(
  ( (array!93304 (arr!45056 (Array (_ BitVec 32) (_ BitVec 64))) (size!45606 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93303)

(assert (=> start!116618 (= res!918052 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45606 a!4142))))))

(assert (=> start!116618 e!778892))

(assert (=> start!116618 true))

(declare-fun array_inv!34084 (array!93303) Bool)

(assert (=> start!116618 (array_inv!34084 a!4142)))

(declare-fun b!1374920 () Bool)

(declare-fun res!918051 () Bool)

(assert (=> b!1374920 (=> (not res!918051) (not e!778892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374920 (= res!918051 (validKeyInArray!0 (select (arr!45056 a!4142) i!1457)))))

(declare-fun b!1374921 () Bool)

(declare-fun res!918050 () Bool)

(assert (=> b!1374921 (=> (not res!918050) (not e!778892))))

(assert (=> b!1374921 (= res!918050 (bvslt (size!45606 a!4142) #b01111111111111111111111111111111))))

(declare-fun lt!603926 () array!93303)

(declare-fun b!1374922 () Bool)

(declare-fun e!778890 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93303 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374922 (= e!778890 (= (arrayCountValidKeys!0 lt!603926 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1374923 () Bool)

(declare-fun res!918049 () Bool)

(assert (=> b!1374923 (=> (not res!918049) (not e!778892))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374923 (= res!918049 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374924 () Bool)

(assert (=> b!1374924 (= e!778892 (not e!778890))))

(declare-fun res!918048 () Bool)

(assert (=> b!1374924 (=> res!918048 e!778890)))

(assert (=> b!1374924 (= res!918048 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374924 (= (arrayCountValidKeys!0 lt!603926 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374924 (= lt!603926 (array!93304 (store (arr!45056 a!4142) i!1457 k!2959) (size!45606 a!4142)))))

(declare-datatypes ((Unit!45501 0))(
  ( (Unit!45502) )
))
(declare-fun lt!603927 () Unit!45501)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93303 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45501)

(assert (=> b!1374924 (= lt!603927 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116618 res!918052) b!1374920))

(assert (= (and b!1374920 res!918051) b!1374923))

(assert (= (and b!1374923 res!918049) b!1374921))

(assert (= (and b!1374921 res!918050) b!1374924))

(assert (= (and b!1374924 (not res!918048)) b!1374922))

(declare-fun m!1258519 () Bool)

(assert (=> b!1374922 m!1258519))

(declare-fun m!1258521 () Bool)

(assert (=> b!1374922 m!1258521))

(declare-fun m!1258523 () Bool)

(assert (=> b!1374920 m!1258523))

(assert (=> b!1374920 m!1258523))

(declare-fun m!1258525 () Bool)

(assert (=> b!1374920 m!1258525))

(declare-fun m!1258527 () Bool)

(assert (=> b!1374923 m!1258527))

(declare-fun m!1258529 () Bool)

(assert (=> start!116618 m!1258529))

(declare-fun m!1258531 () Bool)

(assert (=> b!1374924 m!1258531))

(declare-fun m!1258533 () Bool)

(assert (=> b!1374924 m!1258533))

(declare-fun m!1258535 () Bool)

(assert (=> b!1374924 m!1258535))

(declare-fun m!1258537 () Bool)

(assert (=> b!1374924 m!1258537))

(push 1)

(assert (not start!116618))

(assert (not b!1374922))

(assert (not b!1374924))

(assert (not b!1374920))

(assert (not b!1374923))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148199 () Bool)

(assert (=> d!148199 (= (validKeyInArray!0 k!2959) (and (not (= k!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374923 d!148199))

(declare-fun d!148201 () Bool)

(assert (=> d!148201 (= (array_inv!34084 a!4142) (bvsge (size!45606 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116618 d!148201))

(declare-fun bm!65662 () Bool)

(declare-fun call!65665 () (_ BitVec 32))

(assert (=> bm!65662 (= call!65665 (arrayCountValidKeys!0 lt!603926 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374990 () Bool)

(declare-fun e!778930 () (_ BitVec 32))

(assert (=> b!1374990 (= e!778930 #b00000000000000000000000000000000)))

(declare-fun b!1374991 () Bool)

(declare-fun e!778931 () (_ BitVec 32))

(assert (=> b!1374991 (= e!778931 call!65665)))

(declare-fun b!1374992 () Bool)

(assert (=> b!1374992 (= e!778931 (bvadd #b00000000000000000000000000000001 call!65665))))

(declare-fun b!1374993 () Bool)

(assert (=> b!1374993 (= e!778930 e!778931)))

(declare-fun c!127893 () Bool)

(assert (=> b!1374993 (= c!127893 (validKeyInArray!0 (select (arr!45056 lt!603926) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun d!148203 () Bool)

(declare-fun lt!603951 () (_ BitVec 32))

(assert (=> d!148203 (and (bvsge lt!603951 #b00000000000000000000000000000000) (bvsle lt!603951 (bvsub (size!45606 lt!603926) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (=> d!148203 (= lt!603951 e!778930)))

(declare-fun c!127892 () Bool)

(assert (=> d!148203 (= c!127892 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148203 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45606 lt!603926)))))

(assert (=> d!148203 (= (arrayCountValidKeys!0 lt!603926 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603951)))

(assert (= (and d!148203 c!127892) b!1374990))

(assert (= (and d!148203 (not c!127892)) b!1374993))

(assert (= (and b!1374993 c!127893) b!1374992))

(assert (= (and b!1374993 (not c!127893)) b!1374991))

(assert (= (or b!1374992 b!1374991) bm!65662))

(declare-fun m!1258609 () Bool)

(assert (=> bm!65662 m!1258609))

(declare-fun m!1258611 () Bool)

(assert (=> b!1374993 m!1258611))

(assert (=> b!1374993 m!1258611))

(declare-fun m!1258613 () Bool)

(assert (=> b!1374993 m!1258613))

(assert (=> b!1374922 d!148203))

(declare-fun bm!65663 () Bool)

(declare-fun call!65666 () (_ BitVec 32))

(assert (=> bm!65663 (= call!65666 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374994 () Bool)

(declare-fun e!778932 () (_ BitVec 32))

(assert (=> b!1374994 (= e!778932 #b00000000000000000000000000000000)))

(declare-fun b!1374995 () Bool)

(declare-fun e!778933 () (_ BitVec 32))

(assert (=> b!1374995 (= e!778933 call!65666)))

(declare-fun b!1374996 () Bool)

(assert (=> b!1374996 (= e!778933 (bvadd #b00000000000000000000000000000001 call!65666))))

(declare-fun b!1374997 () Bool)

(assert (=> b!1374997 (= e!778932 e!778933)))

(declare-fun c!127895 () Bool)

(assert (=> b!1374997 (= c!127895 (validKeyInArray!0 (select (arr!45056 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun d!148211 () Bool)

(declare-fun lt!603952 () (_ BitVec 32))

(assert (=> d!148211 (and (bvsge lt!603952 #b00000000000000000000000000000000) (bvsle lt!603952 (bvsub (size!45606 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (=> d!148211 (= lt!603952 e!778932)))

(declare-fun c!127894 () Bool)

(assert (=> d!148211 (= c!127894 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148211 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45606 a!4142)))))

(assert (=> d!148211 (= (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603952)))

(assert (= (and d!148211 c!127894) b!1374994))

(assert (= (and d!148211 (not c!127894)) b!1374997))

(assert (= (and b!1374997 c!127895) b!1374996))

(assert (= (and b!1374997 (not c!127895)) b!1374995))

(assert (= (or b!1374996 b!1374995) bm!65663))

(declare-fun m!1258615 () Bool)

(assert (=> bm!65663 m!1258615))

(declare-fun m!1258617 () Bool)

(assert (=> b!1374997 m!1258617))

(assert (=> b!1374997 m!1258617))

(declare-fun m!1258619 () Bool)

(assert (=> b!1374997 m!1258619))

(assert (=> b!1374922 d!148211))

(declare-fun d!148213 () Bool)

(assert (=> d!148213 (= (validKeyInArray!0 (select (arr!45056 a!4142) i!1457)) (and (not (= (select (arr!45056 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45056 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374920 d!148213))

(declare-fun bm!65664 () Bool)

(declare-fun call!65667 () (_ BitVec 32))

(assert (=> bm!65664 (= call!65667 (arrayCountValidKeys!0 lt!603926 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374998 () Bool)

(declare-fun e!778934 () (_ BitVec 32))

(assert (=> b!1374998 (= e!778934 #b00000000000000000000000000000000)))

(declare-fun b!1374999 () Bool)

(declare-fun e!778935 () (_ BitVec 32))

(assert (=> b!1374999 (= e!778935 call!65667)))

(declare-fun b!1375000 () Bool)

(assert (=> b!1375000 (= e!778935 (bvadd #b00000000000000000000000000000001 call!65667))))

(declare-fun b!1375001 () Bool)

(assert (=> b!1375001 (= e!778934 e!778935)))

(declare-fun c!127897 () Bool)

(assert (=> b!1375001 (= c!127897 (validKeyInArray!0 (select (arr!45056 lt!603926) #b00000000000000000000000000000000)))))

(declare-fun d!148215 () Bool)

(declare-fun lt!603953 () (_ BitVec 32))

(assert (=> d!148215 (and (bvsge lt!603953 #b00000000000000000000000000000000) (bvsle lt!603953 (bvsub (size!45606 lt!603926) #b00000000000000000000000000000000)))))

(assert (=> d!148215 (= lt!603953 e!778934)))

(declare-fun c!127896 () Bool)

(assert (=> d!148215 (= c!127896 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148215 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45606 lt!603926)))))

(assert (=> d!148215 (= (arrayCountValidKeys!0 lt!603926 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603953)))

(assert (= (and d!148215 c!127896) b!1374998))

(assert (= (and d!148215 (not c!127896)) b!1375001))

(assert (= (and b!1375001 c!127897) b!1375000))

(assert (= (and b!1375001 (not c!127897)) b!1374999))

(assert (= (or b!1375000 b!1374999) bm!65664))

(declare-fun m!1258621 () Bool)

(assert (=> bm!65664 m!1258621))

(declare-fun m!1258623 () Bool)

(assert (=> b!1375001 m!1258623))

(assert (=> b!1375001 m!1258623))

(declare-fun m!1258625 () Bool)

(assert (=> b!1375001 m!1258625))

(assert (=> b!1374924 d!148215))

(declare-fun bm!65665 () Bool)

(declare-fun call!65668 () (_ BitVec 32))

(assert (=> bm!65665 (= call!65668 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375002 () Bool)

(declare-fun e!778936 () (_ BitVec 32))

(assert (=> b!1375002 (= e!778936 #b00000000000000000000000000000000)))

(declare-fun b!1375003 () Bool)

(declare-fun e!778937 () (_ BitVec 32))

(assert (=> b!1375003 (= e!778937 call!65668)))

(declare-fun b!1375004 () Bool)

(assert (=> b!1375004 (= e!778937 (bvadd #b00000000000000000000000000000001 call!65668))))

(declare-fun b!1375005 () Bool)

(assert (=> b!1375005 (= e!778936 e!778937)))

(declare-fun c!127899 () Bool)

(assert (=> b!1375005 (= c!127899 (validKeyInArray!0 (select (arr!45056 a!4142) #b00000000000000000000000000000000)))))

(declare-fun d!148217 () Bool)

(declare-fun lt!603954 () (_ BitVec 32))

(assert (=> d!148217 (and (bvsge lt!603954 #b00000000000000000000000000000000) (bvsle lt!603954 (bvsub (size!45606 a!4142) #b00000000000000000000000000000000)))))

(assert (=> d!148217 (= lt!603954 e!778936)))

(declare-fun c!127898 () Bool)

(assert (=> d!148217 (= c!127898 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148217 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45606 a!4142)))))

(assert (=> d!148217 (= (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603954)))

(assert (= (and d!148217 c!127898) b!1375002))

(assert (= (and d!148217 (not c!127898)) b!1375005))

(assert (= (and b!1375005 c!127899) b!1375004))

(assert (= (and b!1375005 (not c!127899)) b!1375003))

(assert (= (or b!1375004 b!1375003) bm!65665))

(declare-fun m!1258627 () Bool)

(assert (=> bm!65665 m!1258627))

(declare-fun m!1258629 () Bool)

(assert (=> b!1375005 m!1258629))

(assert (=> b!1375005 m!1258629))

(declare-fun m!1258631 () Bool)

