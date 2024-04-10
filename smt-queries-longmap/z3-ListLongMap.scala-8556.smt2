; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104490 () Bool)

(assert start!104490)

(declare-fun b!1246728 () Bool)

(declare-fun e!707104 () Bool)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246728 (= e!707104 (bvsge (bvsub newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270)) (bvsub newFrom!287 from!3270)))))

(declare-fun b!1246729 () Bool)

(declare-datatypes ((Unit!41450 0))(
  ( (Unit!41451) )
))
(declare-fun e!707103 () Unit!41450)

(declare-fun lt!563175 () Unit!41450)

(assert (=> b!1246729 (= e!707103 lt!563175)))

(declare-datatypes ((array!80261 0))(
  ( (array!80262 (arr!38706 (Array (_ BitVec 32) (_ BitVec 64))) (size!39242 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80261)

(declare-datatypes ((List!27509 0))(
  ( (Nil!27506) (Cons!27505 (h!28714 (_ BitVec 64)) (t!40978 List!27509)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80261 List!27509 List!27509 (_ BitVec 32)) Unit!41450)

(assert (=> b!1246729 (= lt!563175 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27505 (select (arr!38706 a!3892) from!3270) Nil!27506) Nil!27506 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80261 (_ BitVec 32) List!27509) Bool)

(assert (=> b!1246729 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27506)))

(declare-fun b!1246730 () Bool)

(declare-fun res!831971 () Bool)

(declare-fun e!707102 () Bool)

(assert (=> b!1246730 (=> (not res!831971) (not e!707102))))

(assert (=> b!1246730 (= res!831971 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39242 a!3892)) (not (= newFrom!287 (size!39242 a!3892)))))))

(declare-fun b!1246731 () Bool)

(declare-fun res!831969 () Bool)

(assert (=> b!1246731 (=> (not res!831969) (not e!707104))))

(assert (=> b!1246731 (= res!831969 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27506))))

(declare-fun res!831972 () Bool)

(assert (=> start!104490 (=> (not res!831972) (not e!707102))))

(assert (=> start!104490 (= res!831972 (and (bvslt (size!39242 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39242 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39242 a!3892))))))

(assert (=> start!104490 e!707102))

(declare-fun array_inv!29554 (array!80261) Bool)

(assert (=> start!104490 (array_inv!29554 a!3892)))

(assert (=> start!104490 true))

(declare-fun b!1246732 () Bool)

(declare-fun res!831973 () Bool)

(assert (=> b!1246732 (=> (not res!831973) (not e!707102))))

(assert (=> b!1246732 (= res!831973 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27506))))

(declare-fun b!1246733 () Bool)

(declare-fun Unit!41452 () Unit!41450)

(assert (=> b!1246733 (= e!707103 Unit!41452)))

(declare-fun b!1246734 () Bool)

(assert (=> b!1246734 (= e!707102 e!707104)))

(declare-fun res!831970 () Bool)

(assert (=> b!1246734 (=> (not res!831970) (not e!707104))))

(assert (=> b!1246734 (= res!831970 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563174 () Unit!41450)

(assert (=> b!1246734 (= lt!563174 e!707103)))

(declare-fun c!122064 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246734 (= c!122064 (validKeyInArray!0 (select (arr!38706 a!3892) from!3270)))))

(assert (= (and start!104490 res!831972) b!1246732))

(assert (= (and b!1246732 res!831973) b!1246730))

(assert (= (and b!1246730 res!831971) b!1246734))

(assert (= (and b!1246734 c!122064) b!1246729))

(assert (= (and b!1246734 (not c!122064)) b!1246733))

(assert (= (and b!1246734 res!831970) b!1246731))

(assert (= (and b!1246731 res!831969) b!1246728))

(declare-fun m!1148483 () Bool)

(assert (=> b!1246734 m!1148483))

(assert (=> b!1246734 m!1148483))

(declare-fun m!1148485 () Bool)

(assert (=> b!1246734 m!1148485))

(declare-fun m!1148487 () Bool)

(assert (=> b!1246732 m!1148487))

(declare-fun m!1148489 () Bool)

(assert (=> b!1246731 m!1148489))

(declare-fun m!1148491 () Bool)

(assert (=> start!104490 m!1148491))

(assert (=> b!1246729 m!1148483))

(declare-fun m!1148493 () Bool)

(assert (=> b!1246729 m!1148493))

(assert (=> b!1246729 m!1148489))

(check-sat (not start!104490) (not b!1246731) (not b!1246732) (not b!1246729) (not b!1246734))
(check-sat)
