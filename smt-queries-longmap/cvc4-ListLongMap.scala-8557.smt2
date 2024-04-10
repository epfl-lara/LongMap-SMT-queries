; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104498 () Bool)

(assert start!104498)

(declare-fun b!1246812 () Bool)

(declare-fun res!832033 () Bool)

(declare-fun e!707153 () Bool)

(assert (=> b!1246812 (=> (not res!832033) (not e!707153))))

(declare-datatypes ((array!80269 0))(
  ( (array!80270 (arr!38710 (Array (_ BitVec 32) (_ BitVec 64))) (size!39246 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80269)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27513 0))(
  ( (Nil!27510) (Cons!27509 (h!28718 (_ BitVec 64)) (t!40982 List!27513)) )
))
(declare-fun arrayNoDuplicates!0 (array!80269 (_ BitVec 32) List!27513) Bool)

(assert (=> b!1246812 (= res!832033 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27510))))

(declare-fun b!1246813 () Bool)

(declare-fun res!832031 () Bool)

(declare-fun e!707151 () Bool)

(assert (=> b!1246813 (=> (not res!832031) (not e!707151))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246813 (= res!832031 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39246 a!3892)) (not (= newFrom!287 (size!39246 a!3892)))))))

(declare-fun b!1246814 () Bool)

(declare-fun res!832030 () Bool)

(assert (=> b!1246814 (=> (not res!832030) (not e!707151))))

(assert (=> b!1246814 (= res!832030 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27510))))

(declare-fun res!832029 () Bool)

(assert (=> start!104498 (=> (not res!832029) (not e!707151))))

(assert (=> start!104498 (= res!832029 (and (bvslt (size!39246 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39246 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39246 a!3892))))))

(assert (=> start!104498 e!707151))

(declare-fun array_inv!29558 (array!80269) Bool)

(assert (=> start!104498 (array_inv!29558 a!3892)))

(assert (=> start!104498 true))

(declare-fun b!1246815 () Bool)

(declare-datatypes ((Unit!41462 0))(
  ( (Unit!41463) )
))
(declare-fun e!707150 () Unit!41462)

(declare-fun lt!563208 () Unit!41462)

(assert (=> b!1246815 (= e!707150 lt!563208)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80269 List!27513 List!27513 (_ BitVec 32)) Unit!41462)

(assert (=> b!1246815 (= lt!563208 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27509 (select (arr!38710 a!3892) from!3270) Nil!27510) Nil!27510 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246815 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27510)))

(declare-fun b!1246816 () Bool)

(assert (=> b!1246816 (= e!707153 (not true))))

(assert (=> b!1246816 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27510)))

(declare-fun lt!563207 () Unit!41462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80269 (_ BitVec 32) (_ BitVec 32)) Unit!41462)

(assert (=> b!1246816 (= lt!563207 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1246817 () Bool)

(declare-fun Unit!41464 () Unit!41462)

(assert (=> b!1246817 (= e!707150 Unit!41464)))

(declare-fun b!1246818 () Bool)

(assert (=> b!1246818 (= e!707151 e!707153)))

(declare-fun res!832032 () Bool)

(assert (=> b!1246818 (=> (not res!832032) (not e!707153))))

(assert (=> b!1246818 (= res!832032 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563206 () Unit!41462)

(assert (=> b!1246818 (= lt!563206 e!707150)))

(declare-fun c!122076 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246818 (= c!122076 (validKeyInArray!0 (select (arr!38710 a!3892) from!3270)))))

(assert (= (and start!104498 res!832029) b!1246814))

(assert (= (and b!1246814 res!832030) b!1246813))

(assert (= (and b!1246813 res!832031) b!1246818))

(assert (= (and b!1246818 c!122076) b!1246815))

(assert (= (and b!1246818 (not c!122076)) b!1246817))

(assert (= (and b!1246818 res!832032) b!1246812))

(assert (= (and b!1246812 res!832033) b!1246816))

(declare-fun m!1148539 () Bool)

(assert (=> b!1246816 m!1148539))

(declare-fun m!1148541 () Bool)

(assert (=> b!1246816 m!1148541))

(declare-fun m!1148543 () Bool)

(assert (=> b!1246815 m!1148543))

(declare-fun m!1148545 () Bool)

(assert (=> b!1246815 m!1148545))

(declare-fun m!1148547 () Bool)

(assert (=> b!1246815 m!1148547))

(declare-fun m!1148549 () Bool)

(assert (=> b!1246814 m!1148549))

(assert (=> b!1246818 m!1148543))

(assert (=> b!1246818 m!1148543))

(declare-fun m!1148551 () Bool)

(assert (=> b!1246818 m!1148551))

(assert (=> b!1246812 m!1148547))

(declare-fun m!1148553 () Bool)

(assert (=> start!104498 m!1148553))

(push 1)

(assert (not b!1246815))

(assert (not b!1246818))

(assert (not b!1246816))

(assert (not start!104498))

(assert (not b!1246814))

(assert (not b!1246812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

