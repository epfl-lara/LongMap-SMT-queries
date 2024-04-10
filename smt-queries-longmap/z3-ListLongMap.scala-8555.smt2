; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104460 () Bool)

(assert start!104460)

(declare-fun res!831895 () Bool)

(declare-fun e!707018 () Bool)

(assert (=> start!104460 (=> (not res!831895) (not e!707018))))

(declare-datatypes ((array!80252 0))(
  ( (array!80253 (arr!38703 (Array (_ BitVec 32) (_ BitVec 64))) (size!39239 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80252)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104460 (= res!831895 (and (bvslt (size!39239 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39239 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39239 a!3892))))))

(assert (=> start!104460 e!707018))

(declare-fun array_inv!29551 (array!80252) Bool)

(assert (=> start!104460 (array_inv!29551 a!3892)))

(assert (=> start!104460 true))

(declare-fun b!1246609 () Bool)

(declare-datatypes ((Unit!41441 0))(
  ( (Unit!41442) )
))
(declare-fun e!707021 () Unit!41441)

(declare-fun Unit!41443 () Unit!41441)

(assert (=> b!1246609 (= e!707021 Unit!41443)))

(declare-fun b!1246610 () Bool)

(declare-fun res!831893 () Bool)

(assert (=> b!1246610 (=> (not res!831893) (not e!707018))))

(declare-datatypes ((List!27506 0))(
  ( (Nil!27503) (Cons!27502 (h!28711 (_ BitVec 64)) (t!40975 List!27506)) )
))
(declare-fun arrayNoDuplicates!0 (array!80252 (_ BitVec 32) List!27506) Bool)

(assert (=> b!1246610 (= res!831893 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27503))))

(declare-fun b!1246611 () Bool)

(declare-fun e!707020 () Bool)

(assert (=> b!1246611 (= e!707018 e!707020)))

(declare-fun res!831892 () Bool)

(assert (=> b!1246611 (=> (not res!831892) (not e!707020))))

(assert (=> b!1246611 (= res!831892 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563147 () Unit!41441)

(assert (=> b!1246611 (= lt!563147 e!707021)))

(declare-fun c!122043 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246611 (= c!122043 (validKeyInArray!0 (select (arr!38703 a!3892) from!3270)))))

(declare-fun b!1246612 () Bool)

(declare-fun lt!563148 () Unit!41441)

(assert (=> b!1246612 (= e!707021 lt!563148)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80252 List!27506 List!27506 (_ BitVec 32)) Unit!41441)

(assert (=> b!1246612 (= lt!563148 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27502 (select (arr!38703 a!3892) from!3270) Nil!27503) Nil!27503 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246612 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27503)))

(declare-fun b!1246613 () Bool)

(declare-fun res!831894 () Bool)

(assert (=> b!1246613 (=> (not res!831894) (not e!707018))))

(assert (=> b!1246613 (= res!831894 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39239 a!3892)) (not (= newFrom!287 (size!39239 a!3892)))))))

(declare-fun b!1246614 () Bool)

(assert (=> b!1246614 (= e!707020 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27503)))))

(assert (= (and start!104460 res!831895) b!1246610))

(assert (= (and b!1246610 res!831893) b!1246613))

(assert (= (and b!1246613 res!831894) b!1246611))

(assert (= (and b!1246611 c!122043) b!1246612))

(assert (= (and b!1246611 (not c!122043)) b!1246609))

(assert (= (and b!1246611 res!831892) b!1246614))

(declare-fun m!1148405 () Bool)

(assert (=> start!104460 m!1148405))

(declare-fun m!1148407 () Bool)

(assert (=> b!1246614 m!1148407))

(declare-fun m!1148409 () Bool)

(assert (=> b!1246610 m!1148409))

(declare-fun m!1148411 () Bool)

(assert (=> b!1246612 m!1148411))

(declare-fun m!1148413 () Bool)

(assert (=> b!1246612 m!1148413))

(assert (=> b!1246612 m!1148407))

(assert (=> b!1246611 m!1148411))

(assert (=> b!1246611 m!1148411))

(declare-fun m!1148415 () Bool)

(assert (=> b!1246611 m!1148415))

(check-sat (not start!104460) (not b!1246610) (not b!1246611) (not b!1246614) (not b!1246612))
(check-sat)
(get-model)

(declare-fun d!137653 () Bool)

(declare-fun res!831915 () Bool)

(declare-fun e!707045 () Bool)

(assert (=> d!137653 (=> res!831915 e!707045)))

(assert (=> d!137653 (= res!831915 (bvsge from!3270 (size!39239 a!3892)))))

(assert (=> d!137653 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27503) e!707045)))

(declare-fun b!1246643 () Bool)

(declare-fun e!707042 () Bool)

(assert (=> b!1246643 (= e!707045 e!707042)))

(declare-fun res!831916 () Bool)

(assert (=> b!1246643 (=> (not res!831916) (not e!707042))))

(declare-fun e!707043 () Bool)

(assert (=> b!1246643 (= res!831916 (not e!707043))))

(declare-fun res!831914 () Bool)

(assert (=> b!1246643 (=> (not res!831914) (not e!707043))))

(assert (=> b!1246643 (= res!831914 (validKeyInArray!0 (select (arr!38703 a!3892) from!3270)))))

(declare-fun b!1246644 () Bool)

(declare-fun e!707044 () Bool)

(declare-fun call!61530 () Bool)

(assert (=> b!1246644 (= e!707044 call!61530)))

(declare-fun b!1246645 () Bool)

(assert (=> b!1246645 (= e!707044 call!61530)))

(declare-fun b!1246646 () Bool)

(declare-fun contains!7459 (List!27506 (_ BitVec 64)) Bool)

(assert (=> b!1246646 (= e!707043 (contains!7459 Nil!27503 (select (arr!38703 a!3892) from!3270)))))

(declare-fun c!122049 () Bool)

(declare-fun bm!61527 () Bool)

(assert (=> bm!61527 (= call!61530 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122049 (Cons!27502 (select (arr!38703 a!3892) from!3270) Nil!27503) Nil!27503)))))

(declare-fun b!1246647 () Bool)

(assert (=> b!1246647 (= e!707042 e!707044)))

(assert (=> b!1246647 (= c!122049 (validKeyInArray!0 (select (arr!38703 a!3892) from!3270)))))

(assert (= (and d!137653 (not res!831915)) b!1246643))

(assert (= (and b!1246643 res!831914) b!1246646))

(assert (= (and b!1246643 res!831916) b!1246647))

(assert (= (and b!1246647 c!122049) b!1246644))

(assert (= (and b!1246647 (not c!122049)) b!1246645))

(assert (= (or b!1246644 b!1246645) bm!61527))

(assert (=> b!1246643 m!1148411))

(assert (=> b!1246643 m!1148411))

(assert (=> b!1246643 m!1148415))

(assert (=> b!1246646 m!1148411))

(assert (=> b!1246646 m!1148411))

(declare-fun m!1148431 () Bool)

(assert (=> b!1246646 m!1148431))

(assert (=> bm!61527 m!1148411))

(declare-fun m!1148433 () Bool)

(assert (=> bm!61527 m!1148433))

(assert (=> b!1246647 m!1148411))

(assert (=> b!1246647 m!1148411))

(assert (=> b!1246647 m!1148415))

(assert (=> b!1246610 d!137653))

(declare-fun d!137661 () Bool)

(declare-fun res!831918 () Bool)

(declare-fun e!707049 () Bool)

(assert (=> d!137661 (=> res!831918 e!707049)))

(assert (=> d!137661 (= res!831918 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39239 a!3892)))))

(assert (=> d!137661 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27503) e!707049)))

(declare-fun b!1246648 () Bool)

(declare-fun e!707046 () Bool)

(assert (=> b!1246648 (= e!707049 e!707046)))

(declare-fun res!831919 () Bool)

(assert (=> b!1246648 (=> (not res!831919) (not e!707046))))

(declare-fun e!707047 () Bool)

(assert (=> b!1246648 (= res!831919 (not e!707047))))

(declare-fun res!831917 () Bool)

(assert (=> b!1246648 (=> (not res!831917) (not e!707047))))

(assert (=> b!1246648 (= res!831917 (validKeyInArray!0 (select (arr!38703 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246649 () Bool)

(declare-fun e!707048 () Bool)

(declare-fun call!61531 () Bool)

(assert (=> b!1246649 (= e!707048 call!61531)))

(declare-fun b!1246650 () Bool)

(assert (=> b!1246650 (= e!707048 call!61531)))

(declare-fun b!1246651 () Bool)

(assert (=> b!1246651 (= e!707047 (contains!7459 Nil!27503 (select (arr!38703 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun c!122050 () Bool)

(declare-fun bm!61528 () Bool)

(assert (=> bm!61528 (= call!61531 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122050 (Cons!27502 (select (arr!38703 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27503) Nil!27503)))))

(declare-fun b!1246652 () Bool)

(assert (=> b!1246652 (= e!707046 e!707048)))

(assert (=> b!1246652 (= c!122050 (validKeyInArray!0 (select (arr!38703 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137661 (not res!831918)) b!1246648))

(assert (= (and b!1246648 res!831917) b!1246651))

(assert (= (and b!1246648 res!831919) b!1246652))

(assert (= (and b!1246652 c!122050) b!1246649))

(assert (= (and b!1246652 (not c!122050)) b!1246650))

(assert (= (or b!1246649 b!1246650) bm!61528))

(declare-fun m!1148435 () Bool)

(assert (=> b!1246648 m!1148435))

(assert (=> b!1246648 m!1148435))

(declare-fun m!1148437 () Bool)

(assert (=> b!1246648 m!1148437))

(assert (=> b!1246651 m!1148435))

(assert (=> b!1246651 m!1148435))

(declare-fun m!1148439 () Bool)

(assert (=> b!1246651 m!1148439))

(assert (=> bm!61528 m!1148435))

(declare-fun m!1148441 () Bool)

(assert (=> bm!61528 m!1148441))

(assert (=> b!1246652 m!1148435))

(assert (=> b!1246652 m!1148435))

(assert (=> b!1246652 m!1148437))

(assert (=> b!1246614 d!137661))

(declare-fun d!137663 () Bool)

(assert (=> d!137663 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27503)))

(declare-fun lt!563160 () Unit!41441)

(declare-fun choose!80 (array!80252 List!27506 List!27506 (_ BitVec 32)) Unit!41441)

(assert (=> d!137663 (= lt!563160 (choose!80 a!3892 (Cons!27502 (select (arr!38703 a!3892) from!3270) Nil!27503) Nil!27503 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137663 (bvslt (size!39239 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137663 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27502 (select (arr!38703 a!3892) from!3270) Nil!27503) Nil!27503 (bvadd #b00000000000000000000000000000001 from!3270)) lt!563160)))

(declare-fun bs!35130 () Bool)

(assert (= bs!35130 d!137663))

(assert (=> bs!35130 m!1148407))

(declare-fun m!1148443 () Bool)

(assert (=> bs!35130 m!1148443))

(assert (=> b!1246612 d!137663))

(assert (=> b!1246612 d!137661))

(declare-fun d!137665 () Bool)

(assert (=> d!137665 (= (array_inv!29551 a!3892) (bvsge (size!39239 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104460 d!137665))

(declare-fun d!137667 () Bool)

(assert (=> d!137667 (= (validKeyInArray!0 (select (arr!38703 a!3892) from!3270)) (and (not (= (select (arr!38703 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38703 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246611 d!137667))

(check-sat (not b!1246647) (not b!1246651) (not b!1246652) (not d!137663) (not b!1246643) (not bm!61527) (not b!1246648) (not b!1246646) (not bm!61528))
(check-sat)
