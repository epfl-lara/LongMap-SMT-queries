; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104666 () Bool)

(assert start!104666)

(declare-fun b!1247724 () Bool)

(declare-datatypes ((Unit!41375 0))(
  ( (Unit!41376) )
))
(declare-fun e!707753 () Unit!41375)

(declare-fun Unit!41377 () Unit!41375)

(assert (=> b!1247724 (= e!707753 Unit!41377)))

(declare-fun b!1247725 () Bool)

(declare-fun res!832297 () Bool)

(declare-fun e!707751 () Bool)

(assert (=> b!1247725 (=> (not res!832297) (not e!707751))))

(declare-datatypes ((array!80260 0))(
  ( (array!80261 (arr!38702 (Array (_ BitVec 32) (_ BitVec 64))) (size!39239 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80260)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1247725 (= res!832297 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39239 a!3892)) (not (= newFrom!287 (size!39239 a!3892)))))))

(declare-fun res!832296 () Bool)

(assert (=> start!104666 (=> (not res!832296) (not e!707751))))

(assert (=> start!104666 (= res!832296 (and (bvslt (size!39239 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39239 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39239 a!3892))))))

(assert (=> start!104666 e!707751))

(declare-fun array_inv!29640 (array!80260) Bool)

(assert (=> start!104666 (array_inv!29640 a!3892)))

(assert (=> start!104666 true))

(declare-fun b!1247726 () Bool)

(declare-fun lt!563556 () Unit!41375)

(assert (=> b!1247726 (= e!707753 lt!563556)))

(declare-datatypes ((List!27518 0))(
  ( (Nil!27515) (Cons!27514 (h!28732 (_ BitVec 64)) (t!40979 List!27518)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80260 List!27518 List!27518 (_ BitVec 32)) Unit!41375)

(assert (=> b!1247726 (= lt!563556 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27514 (select (arr!38702 a!3892) from!3270) Nil!27515) Nil!27515 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80260 (_ BitVec 32) List!27518) Bool)

(assert (=> b!1247726 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27515)))

(declare-fun b!1247727 () Bool)

(assert (=> b!1247727 (= e!707751 false)))

(declare-fun lt!563557 () Unit!41375)

(assert (=> b!1247727 (= lt!563557 e!707753)))

(declare-fun c!122406 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247727 (= c!122406 (validKeyInArray!0 (select (arr!38702 a!3892) from!3270)))))

(declare-fun b!1247728 () Bool)

(declare-fun res!832298 () Bool)

(assert (=> b!1247728 (=> (not res!832298) (not e!707751))))

(assert (=> b!1247728 (= res!832298 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27515))))

(assert (= (and start!104666 res!832296) b!1247728))

(assert (= (and b!1247728 res!832298) b!1247725))

(assert (= (and b!1247725 res!832297) b!1247727))

(assert (= (and b!1247727 c!122406) b!1247726))

(assert (= (and b!1247727 (not c!122406)) b!1247724))

(declare-fun m!1149877 () Bool)

(assert (=> start!104666 m!1149877))

(declare-fun m!1149879 () Bool)

(assert (=> b!1247726 m!1149879))

(declare-fun m!1149881 () Bool)

(assert (=> b!1247726 m!1149881))

(declare-fun m!1149883 () Bool)

(assert (=> b!1247726 m!1149883))

(assert (=> b!1247727 m!1149879))

(assert (=> b!1247727 m!1149879))

(declare-fun m!1149885 () Bool)

(assert (=> b!1247727 m!1149885))

(declare-fun m!1149887 () Bool)

(assert (=> b!1247728 m!1149887))

(check-sat (not b!1247727) (not start!104666) (not b!1247728) (not b!1247726))
(check-sat)
