; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104678 () Bool)

(assert start!104678)

(declare-fun res!832352 () Bool)

(declare-fun e!707807 () Bool)

(assert (=> start!104678 (=> (not res!832352) (not e!707807))))

(declare-datatypes ((array!80272 0))(
  ( (array!80273 (arr!38708 (Array (_ BitVec 32) (_ BitVec 64))) (size!39245 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80272)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104678 (= res!832352 (and (bvslt (size!39245 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39245 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39245 a!3892))))))

(assert (=> start!104678 e!707807))

(declare-fun array_inv!29646 (array!80272) Bool)

(assert (=> start!104678 (array_inv!29646 a!3892)))

(assert (=> start!104678 true))

(declare-fun b!1247814 () Bool)

(assert (=> b!1247814 (= e!707807 false)))

(declare-datatypes ((Unit!41393 0))(
  ( (Unit!41394) )
))
(declare-fun lt!563592 () Unit!41393)

(declare-fun e!707806 () Unit!41393)

(assert (=> b!1247814 (= lt!563592 e!707806)))

(declare-fun c!122424 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247814 (= c!122424 (validKeyInArray!0 (select (arr!38708 a!3892) from!3270)))))

(declare-fun b!1247815 () Bool)

(declare-fun Unit!41395 () Unit!41393)

(assert (=> b!1247815 (= e!707806 Unit!41395)))

(declare-fun b!1247816 () Bool)

(declare-fun lt!563593 () Unit!41393)

(assert (=> b!1247816 (= e!707806 lt!563593)))

(declare-datatypes ((List!27524 0))(
  ( (Nil!27521) (Cons!27520 (h!28738 (_ BitVec 64)) (t!40985 List!27524)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80272 List!27524 List!27524 (_ BitVec 32)) Unit!41393)

(assert (=> b!1247816 (= lt!563593 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27520 (select (arr!38708 a!3892) from!3270) Nil!27521) Nil!27521 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80272 (_ BitVec 32) List!27524) Bool)

(assert (=> b!1247816 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27521)))

(declare-fun b!1247817 () Bool)

(declare-fun res!832350 () Bool)

(assert (=> b!1247817 (=> (not res!832350) (not e!707807))))

(assert (=> b!1247817 (= res!832350 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39245 a!3892)) (not (= newFrom!287 (size!39245 a!3892)))))))

(declare-fun b!1247818 () Bool)

(declare-fun res!832351 () Bool)

(assert (=> b!1247818 (=> (not res!832351) (not e!707807))))

(assert (=> b!1247818 (= res!832351 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27521))))

(assert (= (and start!104678 res!832352) b!1247818))

(assert (= (and b!1247818 res!832351) b!1247817))

(assert (= (and b!1247817 res!832350) b!1247814))

(assert (= (and b!1247814 c!122424) b!1247816))

(assert (= (and b!1247814 (not c!122424)) b!1247815))

(declare-fun m!1149949 () Bool)

(assert (=> start!104678 m!1149949))

(declare-fun m!1149951 () Bool)

(assert (=> b!1247814 m!1149951))

(assert (=> b!1247814 m!1149951))

(declare-fun m!1149953 () Bool)

(assert (=> b!1247814 m!1149953))

(assert (=> b!1247816 m!1149951))

(declare-fun m!1149955 () Bool)

(assert (=> b!1247816 m!1149955))

(declare-fun m!1149957 () Bool)

(assert (=> b!1247816 m!1149957))

(declare-fun m!1149959 () Bool)

(assert (=> b!1247818 m!1149959))

(check-sat (not b!1247816) (not b!1247818) (not b!1247814) (not start!104678))
(check-sat)
