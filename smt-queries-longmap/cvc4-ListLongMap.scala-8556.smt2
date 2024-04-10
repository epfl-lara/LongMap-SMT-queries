; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104492 () Bool)

(assert start!104492)

(declare-fun b!1246749 () Bool)

(declare-fun res!831986 () Bool)

(declare-fun e!707117 () Bool)

(assert (=> b!1246749 (=> (not res!831986) (not e!707117))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80263 0))(
  ( (array!80264 (arr!38707 (Array (_ BitVec 32) (_ BitVec 64))) (size!39243 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80263)

(assert (=> b!1246749 (= res!831986 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39243 a!3892)) (not (= newFrom!287 (size!39243 a!3892)))))))

(declare-fun res!831988 () Bool)

(assert (=> start!104492 (=> (not res!831988) (not e!707117))))

(assert (=> start!104492 (= res!831988 (and (bvslt (size!39243 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39243 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39243 a!3892))))))

(assert (=> start!104492 e!707117))

(declare-fun array_inv!29555 (array!80263) Bool)

(assert (=> start!104492 (array_inv!29555 a!3892)))

(assert (=> start!104492 true))

(declare-fun b!1246750 () Bool)

(declare-fun res!831985 () Bool)

(declare-fun e!707116 () Bool)

(assert (=> b!1246750 (=> (not res!831985) (not e!707116))))

(declare-datatypes ((List!27510 0))(
  ( (Nil!27507) (Cons!27506 (h!28715 (_ BitVec 64)) (t!40979 List!27510)) )
))
(declare-fun arrayNoDuplicates!0 (array!80263 (_ BitVec 32) List!27510) Bool)

(assert (=> b!1246750 (= res!831985 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27507))))

(declare-fun b!1246751 () Bool)

(declare-datatypes ((Unit!41453 0))(
  ( (Unit!41454) )
))
(declare-fun e!707115 () Unit!41453)

(declare-fun Unit!41455 () Unit!41453)

(assert (=> b!1246751 (= e!707115 Unit!41455)))

(declare-fun b!1246752 () Bool)

(assert (=> b!1246752 (= e!707117 e!707116)))

(declare-fun res!831984 () Bool)

(assert (=> b!1246752 (=> (not res!831984) (not e!707116))))

(assert (=> b!1246752 (= res!831984 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563180 () Unit!41453)

(assert (=> b!1246752 (= lt!563180 e!707115)))

(declare-fun c!122067 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246752 (= c!122067 (validKeyInArray!0 (select (arr!38707 a!3892) from!3270)))))

(declare-fun b!1246753 () Bool)

(declare-fun res!831987 () Bool)

(assert (=> b!1246753 (=> (not res!831987) (not e!707117))))

(assert (=> b!1246753 (= res!831987 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27507))))

(declare-fun b!1246754 () Bool)

(assert (=> b!1246754 (= e!707116 (bvsge (bvsub newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270)) (bvsub newFrom!287 from!3270)))))

(declare-fun b!1246755 () Bool)

(declare-fun lt!563181 () Unit!41453)

(assert (=> b!1246755 (= e!707115 lt!563181)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80263 List!27510 List!27510 (_ BitVec 32)) Unit!41453)

(assert (=> b!1246755 (= lt!563181 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27506 (select (arr!38707 a!3892) from!3270) Nil!27507) Nil!27507 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246755 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27507)))

(assert (= (and start!104492 res!831988) b!1246753))

(assert (= (and b!1246753 res!831987) b!1246749))

(assert (= (and b!1246749 res!831986) b!1246752))

(assert (= (and b!1246752 c!122067) b!1246755))

(assert (= (and b!1246752 (not c!122067)) b!1246751))

(assert (= (and b!1246752 res!831984) b!1246750))

(assert (= (and b!1246750 res!831985) b!1246754))

(declare-fun m!1148495 () Bool)

(assert (=> b!1246755 m!1148495))

(declare-fun m!1148497 () Bool)

(assert (=> b!1246755 m!1148497))

(declare-fun m!1148499 () Bool)

(assert (=> b!1246755 m!1148499))

(assert (=> b!1246750 m!1148499))

(declare-fun m!1148501 () Bool)

(assert (=> start!104492 m!1148501))

(declare-fun m!1148503 () Bool)

(assert (=> b!1246753 m!1148503))

(assert (=> b!1246752 m!1148495))

(assert (=> b!1246752 m!1148495))

(declare-fun m!1148505 () Bool)

(assert (=> b!1246752 m!1148505))

(push 1)

(assert (not b!1246752))

(assert (not start!104492))

(assert (not b!1246753))

(assert (not b!1246755))

(assert (not b!1246750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

