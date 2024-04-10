; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104496 () Bool)

(assert start!104496)

(declare-fun b!1246791 () Bool)

(declare-fun e!707141 () Bool)

(declare-fun e!707139 () Bool)

(assert (=> b!1246791 (= e!707141 e!707139)))

(declare-fun res!832014 () Bool)

(assert (=> b!1246791 (=> (not res!832014) (not e!707139))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246791 (= res!832014 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41459 0))(
  ( (Unit!41460) )
))
(declare-fun lt!563197 () Unit!41459)

(declare-fun e!707140 () Unit!41459)

(assert (=> b!1246791 (= lt!563197 e!707140)))

(declare-fun c!122073 () Bool)

(declare-datatypes ((array!80267 0))(
  ( (array!80268 (arr!38709 (Array (_ BitVec 32) (_ BitVec 64))) (size!39245 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80267)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246791 (= c!122073 (validKeyInArray!0 (select (arr!38709 a!3892) from!3270)))))

(declare-fun b!1246792 () Bool)

(declare-fun res!832016 () Bool)

(assert (=> b!1246792 (=> (not res!832016) (not e!707141))))

(assert (=> b!1246792 (= res!832016 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39245 a!3892)) (not (= newFrom!287 (size!39245 a!3892)))))))

(declare-fun b!1246793 () Bool)

(declare-fun res!832018 () Bool)

(assert (=> b!1246793 (=> (not res!832018) (not e!707139))))

(declare-datatypes ((List!27512 0))(
  ( (Nil!27509) (Cons!27508 (h!28717 (_ BitVec 64)) (t!40981 List!27512)) )
))
(declare-fun arrayNoDuplicates!0 (array!80267 (_ BitVec 32) List!27512) Bool)

(assert (=> b!1246793 (= res!832018 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27509))))

(declare-fun b!1246795 () Bool)

(declare-fun res!832017 () Bool)

(assert (=> b!1246795 (=> (not res!832017) (not e!707141))))

(assert (=> b!1246795 (= res!832017 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27509))))

(declare-fun b!1246796 () Bool)

(assert (=> b!1246796 (= e!707139 (not true))))

(assert (=> b!1246796 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27509)))

(declare-fun lt!563198 () Unit!41459)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80267 (_ BitVec 32) (_ BitVec 32)) Unit!41459)

(assert (=> b!1246796 (= lt!563198 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1246797 () Bool)

(declare-fun lt!563199 () Unit!41459)

(assert (=> b!1246797 (= e!707140 lt!563199)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80267 List!27512 List!27512 (_ BitVec 32)) Unit!41459)

(assert (=> b!1246797 (= lt!563199 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27508 (select (arr!38709 a!3892) from!3270) Nil!27509) Nil!27509 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246797 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27509)))

(declare-fun res!832015 () Bool)

(assert (=> start!104496 (=> (not res!832015) (not e!707141))))

(assert (=> start!104496 (= res!832015 (and (bvslt (size!39245 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39245 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39245 a!3892))))))

(assert (=> start!104496 e!707141))

(declare-fun array_inv!29557 (array!80267) Bool)

(assert (=> start!104496 (array_inv!29557 a!3892)))

(assert (=> start!104496 true))

(declare-fun b!1246794 () Bool)

(declare-fun Unit!41461 () Unit!41459)

(assert (=> b!1246794 (= e!707140 Unit!41461)))

(assert (= (and start!104496 res!832015) b!1246795))

(assert (= (and b!1246795 res!832017) b!1246792))

(assert (= (and b!1246792 res!832016) b!1246791))

(assert (= (and b!1246791 c!122073) b!1246797))

(assert (= (and b!1246791 (not c!122073)) b!1246794))

(assert (= (and b!1246791 res!832014) b!1246793))

(assert (= (and b!1246793 res!832018) b!1246796))

(declare-fun m!1148523 () Bool)

(assert (=> b!1246795 m!1148523))

(declare-fun m!1148525 () Bool)

(assert (=> b!1246797 m!1148525))

(declare-fun m!1148527 () Bool)

(assert (=> b!1246797 m!1148527))

(declare-fun m!1148529 () Bool)

(assert (=> b!1246797 m!1148529))

(declare-fun m!1148531 () Bool)

(assert (=> start!104496 m!1148531))

(declare-fun m!1148533 () Bool)

(assert (=> b!1246796 m!1148533))

(declare-fun m!1148535 () Bool)

(assert (=> b!1246796 m!1148535))

(assert (=> b!1246793 m!1148529))

(assert (=> b!1246791 m!1148525))

(assert (=> b!1246791 m!1148525))

(declare-fun m!1148537 () Bool)

(assert (=> b!1246791 m!1148537))

(check-sat (not b!1246795) (not b!1246793) (not b!1246797) (not b!1246791) (not b!1246796) (not start!104496))
