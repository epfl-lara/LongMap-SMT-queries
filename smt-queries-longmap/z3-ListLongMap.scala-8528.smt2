; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104200 () Bool)

(assert start!104200)

(declare-fun res!830575 () Bool)

(declare-fun e!706181 () Bool)

(assert (=> start!104200 (=> (not res!830575) (not e!706181))))

(declare-datatypes ((array!80091 0))(
  ( (array!80092 (arr!38633 (Array (_ BitVec 32) (_ BitVec 64))) (size!39170 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80091)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104200 (= res!830575 (and (bvslt (size!39170 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39170 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39170 a!3892))))))

(assert (=> start!104200 e!706181))

(declare-fun array_inv!29571 (array!80091) Bool)

(assert (=> start!104200 (array_inv!29571 a!3892)))

(assert (=> start!104200 true))

(declare-fun b!1245699 () Bool)

(declare-datatypes ((Unit!41342 0))(
  ( (Unit!41343) )
))
(declare-fun e!706183 () Unit!41342)

(declare-fun Unit!41344 () Unit!41342)

(assert (=> b!1245699 (= e!706183 Unit!41344)))

(declare-fun b!1245700 () Bool)

(declare-fun e!706182 () Bool)

(assert (=> b!1245700 (= e!706181 e!706182)))

(declare-fun res!830574 () Bool)

(assert (=> b!1245700 (=> (not res!830574) (not e!706182))))

(assert (=> b!1245700 (= res!830574 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563202 () Unit!41342)

(assert (=> b!1245700 (= lt!563202 e!706183)))

(declare-fun c!122255 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245700 (= c!122255 (validKeyInArray!0 (select (arr!38633 a!3892) from!3270)))))

(declare-fun b!1245701 () Bool)

(declare-fun lt!563203 () Unit!41342)

(assert (=> b!1245701 (= e!706183 lt!563203)))

(declare-datatypes ((List!27449 0))(
  ( (Nil!27446) (Cons!27445 (h!28663 (_ BitVec 64)) (t!40910 List!27449)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80091 List!27449 List!27449 (_ BitVec 32)) Unit!41342)

(assert (=> b!1245701 (= lt!563203 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27445 (select (arr!38633 a!3892) from!3270) Nil!27446) Nil!27446 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80091 (_ BitVec 32) List!27449) Bool)

(assert (=> b!1245701 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27446)))

(declare-fun b!1245702 () Bool)

(declare-fun res!830576 () Bool)

(assert (=> b!1245702 (=> (not res!830576) (not e!706181))))

(assert (=> b!1245702 (= res!830576 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27446))))

(declare-fun b!1245703 () Bool)

(declare-fun res!830573 () Bool)

(assert (=> b!1245703 (=> (not res!830573) (not e!706182))))

(assert (=> b!1245703 (= res!830573 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27446))))

(declare-fun b!1245704 () Bool)

(declare-fun res!830577 () Bool)

(assert (=> b!1245704 (=> (not res!830577) (not e!706181))))

(assert (=> b!1245704 (= res!830577 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39170 a!3892)) (not (= newFrom!287 (size!39170 a!3892)))))))

(declare-fun b!1245705 () Bool)

(assert (=> b!1245705 (= e!706182 (not true))))

(assert (=> b!1245705 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27446)))

(declare-fun lt!563204 () Unit!41342)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80091 (_ BitVec 32) (_ BitVec 32)) Unit!41342)

(assert (=> b!1245705 (= lt!563204 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (= (and start!104200 res!830575) b!1245702))

(assert (= (and b!1245702 res!830576) b!1245704))

(assert (= (and b!1245704 res!830577) b!1245700))

(assert (= (and b!1245700 c!122255) b!1245701))

(assert (= (and b!1245700 (not c!122255)) b!1245699))

(assert (= (and b!1245700 res!830574) b!1245703))

(assert (= (and b!1245703 res!830573) b!1245705))

(declare-fun m!1148311 () Bool)

(assert (=> b!1245702 m!1148311))

(declare-fun m!1148313 () Bool)

(assert (=> b!1245700 m!1148313))

(assert (=> b!1245700 m!1148313))

(declare-fun m!1148315 () Bool)

(assert (=> b!1245700 m!1148315))

(assert (=> b!1245701 m!1148313))

(declare-fun m!1148317 () Bool)

(assert (=> b!1245701 m!1148317))

(declare-fun m!1148319 () Bool)

(assert (=> b!1245701 m!1148319))

(assert (=> b!1245703 m!1148319))

(declare-fun m!1148321 () Bool)

(assert (=> b!1245705 m!1148321))

(declare-fun m!1148323 () Bool)

(assert (=> b!1245705 m!1148323))

(declare-fun m!1148325 () Bool)

(assert (=> start!104200 m!1148325))

(check-sat (not b!1245705) (not b!1245703) (not start!104200) (not b!1245701) (not b!1245702) (not b!1245700))
(check-sat)
