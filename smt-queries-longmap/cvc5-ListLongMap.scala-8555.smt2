; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104458 () Bool)

(assert start!104458)

(declare-fun b!1246591 () Bool)

(declare-fun e!707009 () Bool)

(declare-datatypes ((array!80250 0))(
  ( (array!80251 (arr!38702 (Array (_ BitVec 32) (_ BitVec 64))) (size!39238 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80250)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27505 0))(
  ( (Nil!27502) (Cons!27501 (h!28710 (_ BitVec 64)) (t!40974 List!27505)) )
))
(declare-fun arrayNoDuplicates!0 (array!80250 (_ BitVec 32) List!27505) Bool)

(assert (=> b!1246591 (= e!707009 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27502)))))

(declare-fun b!1246592 () Bool)

(declare-fun res!831883 () Bool)

(declare-fun e!707006 () Bool)

(assert (=> b!1246592 (=> (not res!831883) (not e!707006))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246592 (= res!831883 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39238 a!3892)) (not (= newFrom!287 (size!39238 a!3892)))))))

(declare-fun b!1246593 () Bool)

(declare-fun res!831881 () Bool)

(assert (=> b!1246593 (=> (not res!831881) (not e!707006))))

(assert (=> b!1246593 (= res!831881 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27502))))

(declare-fun res!831880 () Bool)

(assert (=> start!104458 (=> (not res!831880) (not e!707006))))

(assert (=> start!104458 (= res!831880 (and (bvslt (size!39238 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39238 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39238 a!3892))))))

(assert (=> start!104458 e!707006))

(declare-fun array_inv!29550 (array!80250) Bool)

(assert (=> start!104458 (array_inv!29550 a!3892)))

(assert (=> start!104458 true))

(declare-fun b!1246594 () Bool)

(declare-datatypes ((Unit!41438 0))(
  ( (Unit!41439) )
))
(declare-fun e!707007 () Unit!41438)

(declare-fun Unit!41440 () Unit!41438)

(assert (=> b!1246594 (= e!707007 Unit!41440)))

(declare-fun b!1246595 () Bool)

(assert (=> b!1246595 (= e!707006 e!707009)))

(declare-fun res!831882 () Bool)

(assert (=> b!1246595 (=> (not res!831882) (not e!707009))))

(assert (=> b!1246595 (= res!831882 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563141 () Unit!41438)

(assert (=> b!1246595 (= lt!563141 e!707007)))

(declare-fun c!122040 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246595 (= c!122040 (validKeyInArray!0 (select (arr!38702 a!3892) from!3270)))))

(declare-fun b!1246596 () Bool)

(declare-fun lt!563142 () Unit!41438)

(assert (=> b!1246596 (= e!707007 lt!563142)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80250 List!27505 List!27505 (_ BitVec 32)) Unit!41438)

(assert (=> b!1246596 (= lt!563142 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27501 (select (arr!38702 a!3892) from!3270) Nil!27502) Nil!27502 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246596 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27502)))

(assert (= (and start!104458 res!831880) b!1246593))

(assert (= (and b!1246593 res!831881) b!1246592))

(assert (= (and b!1246592 res!831883) b!1246595))

(assert (= (and b!1246595 c!122040) b!1246596))

(assert (= (and b!1246595 (not c!122040)) b!1246594))

(assert (= (and b!1246595 res!831882) b!1246591))

(declare-fun m!1148393 () Bool)

(assert (=> b!1246595 m!1148393))

(assert (=> b!1246595 m!1148393))

(declare-fun m!1148395 () Bool)

(assert (=> b!1246595 m!1148395))

(declare-fun m!1148397 () Bool)

(assert (=> b!1246593 m!1148397))

(assert (=> b!1246596 m!1148393))

(declare-fun m!1148399 () Bool)

(assert (=> b!1246596 m!1148399))

(declare-fun m!1148401 () Bool)

(assert (=> b!1246596 m!1148401))

(declare-fun m!1148403 () Bool)

(assert (=> start!104458 m!1148403))

(assert (=> b!1246591 m!1148401))

(push 1)

(assert (not b!1246596))

(assert (not start!104458))

(assert (not b!1246593))

(assert (not b!1246591))

(assert (not b!1246595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137655 () Bool)

(assert (=> d!137655 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27502)))

(declare-fun lt!563157 () Unit!41438)

(declare-fun choose!80 (array!80250 List!27505 List!27505 (_ BitVec 32)) Unit!41438)

(assert (=> d!137655 (= lt!563157 (choose!80 a!3892 (Cons!27501 (select (arr!38702 a!3892) from!3270) Nil!27502) Nil!27502 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137655 (bvslt (size!39238 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137655 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27501 (select (arr!38702 a!3892) from!3270) Nil!27502) Nil!27502 (bvadd #b00000000000000000000000000000001 from!3270)) lt!563157)))

(declare-fun bs!35129 () Bool)

(assert (= bs!35129 d!137655))

(assert (=> bs!35129 m!1148401))

(declare-fun m!1148429 () Bool)

(assert (=> bs!35129 m!1148429))

(assert (=> b!1246596 d!137655))

(declare-fun b!1246678 () Bool)

(declare-fun e!707072 () Bool)

(declare-fun call!61537 () Bool)

(assert (=> b!1246678 (= e!707072 call!61537)))

(declare-fun b!1246679 () Bool)

(declare-fun e!707071 () Bool)

(declare-fun contains!7460 (List!27505 (_ BitVec 64)) Bool)

(assert (=> b!1246679 (= e!707071 (contains!7460 Nil!27502 (select (arr!38702 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246680 () Bool)

(assert (=> b!1246680 (= e!707072 call!61537)))

(declare-fun bm!61534 () Bool)

(declare-fun c!122056 () Bool)

(assert (=> bm!61534 (= call!61537 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122056 (Cons!27501 (select (arr!38702 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27502) Nil!27502)))))

(declare-fun b!1246681 () Bool)

(declare-fun e!707073 () Bool)

(assert (=> b!1246681 (= e!707073 e!707072)))

(assert (=> b!1246681 (= c!122056 (validKeyInArray!0 (select (arr!38702 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137657 () Bool)

(declare-fun res!831936 () Bool)

(declare-fun e!707070 () Bool)

(assert (=> d!137657 (=> res!831936 e!707070)))

(assert (=> d!137657 (= res!831936 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39238 a!3892)))))

(assert (=> d!137657 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27502) e!707070)))

(declare-fun b!1246682 () Bool)

(assert (=> b!1246682 (= e!707070 e!707073)))

(declare-fun res!831935 () Bool)

(assert (=> b!1246682 (=> (not res!831935) (not e!707073))))

(assert (=> b!1246682 (= res!831935 (not e!707071))))

(declare-fun res!831937 () Bool)

(assert (=> b!1246682 (=> (not res!831937) (not e!707071))))

(assert (=> b!1246682 (= res!831937 (validKeyInArray!0 (select (arr!38702 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137657 (not res!831936)) b!1246682))

(assert (= (and b!1246682 res!831937) b!1246679))

(assert (= (and b!1246682 res!831935) b!1246681))

(assert (= (and b!1246681 c!122056) b!1246680))

(assert (= (and b!1246681 (not c!122056)) b!1246678))

(assert (= (or b!1246680 b!1246678) bm!61534))

(declare-fun m!1148453 () Bool)

(assert (=> b!1246679 m!1148453))

(assert (=> b!1246679 m!1148453))

(declare-fun m!1148455 () Bool)

(assert (=> b!1246679 m!1148455))

(assert (=> bm!61534 m!1148453))

(declare-fun m!1148457 () Bool)

(assert (=> bm!61534 m!1148457))

(assert (=> b!1246681 m!1148453))

(assert (=> b!1246681 m!1148453))

(declare-fun m!1148459 () Bool)

(assert (=> b!1246681 m!1148459))

(assert (=> b!1246682 m!1148453))

(assert (=> b!1246682 m!1148453))

(assert (=> b!1246682 m!1148459))

(assert (=> b!1246596 d!137657))

(declare-fun d!137673 () Bool)

(assert (=> d!137673 (= (validKeyInArray!0 (select (arr!38702 a!3892) from!3270)) (and (not (= (select (arr!38702 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38702 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246595 d!137673))

(declare-fun d!137677 () Bool)

(assert (=> d!137677 (= (array_inv!29550 a!3892) (bvsge (size!39238 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104458 d!137677))

(declare-fun b!1246688 () Bool)

(declare-fun e!707080 () Bool)

(declare-fun call!61539 () Bool)

(assert (=> b!1246688 (= e!707080 call!61539)))

(declare-fun b!1246689 () Bool)

(declare-fun e!707079 () Bool)

(assert (=> b!1246689 (= e!707079 (contains!7460 Nil!27502 (select (arr!38702 a!3892) from!3270)))))

(declare-fun b!1246690 () Bool)

(assert (=> b!1246690 (= e!707080 call!61539)))

(declare-fun bm!61536 () Bool)

(declare-fun c!122058 () Bool)

(assert (=> bm!61536 (= call!61539 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122058 (Cons!27501 (select (arr!38702 a!3892) from!3270) Nil!27502) Nil!27502)))))

(declare-fun b!1246691 () Bool)

(declare-fun e!707081 () Bool)

(assert (=> b!1246691 (= e!707081 e!707080)))

(assert (=> b!1246691 (= c!122058 (validKeyInArray!0 (select (arr!38702 a!3892) from!3270)))))

(declare-fun d!137681 () Bool)

(declare-fun res!831942 () Bool)

(declare-fun e!707078 () Bool)

(assert (=> d!137681 (=> res!831942 e!707078)))

(assert (=> d!137681 (= res!831942 (bvsge from!3270 (size!39238 a!3892)))))

(assert (=> d!137681 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27502) e!707078)))

(declare-fun b!1246692 () Bool)

(assert (=> b!1246692 (= e!707078 e!707081)))

(declare-fun res!831941 () Bool)

(assert (=> b!1246692 (=> (not res!831941) (not e!707081))))

(assert (=> b!1246692 (= res!831941 (not e!707079))))

