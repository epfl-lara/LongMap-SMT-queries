; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104488 () Bool)

(assert start!104488)

(declare-fun b!1246707 () Bool)

(declare-fun res!831956 () Bool)

(declare-fun e!707091 () Bool)

(assert (=> b!1246707 (=> (not res!831956) (not e!707091))))

(declare-datatypes ((array!80259 0))(
  ( (array!80260 (arr!38705 (Array (_ BitVec 32) (_ BitVec 64))) (size!39241 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80259)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27508 0))(
  ( (Nil!27505) (Cons!27504 (h!28713 (_ BitVec 64)) (t!40977 List!27508)) )
))
(declare-fun arrayNoDuplicates!0 (array!80259 (_ BitVec 32) List!27508) Bool)

(assert (=> b!1246707 (= res!831956 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27505))))

(declare-fun b!1246708 () Bool)

(declare-fun e!707090 () Bool)

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246708 (= e!707090 (bvsge (bvsub newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270)) (bvsub newFrom!287 from!3270)))))

(declare-fun res!831954 () Bool)

(assert (=> start!104488 (=> (not res!831954) (not e!707091))))

(assert (=> start!104488 (= res!831954 (and (bvslt (size!39241 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39241 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39241 a!3892))))))

(assert (=> start!104488 e!707091))

(declare-fun array_inv!29553 (array!80259) Bool)

(assert (=> start!104488 (array_inv!29553 a!3892)))

(assert (=> start!104488 true))

(declare-fun b!1246709 () Bool)

(declare-fun res!831958 () Bool)

(assert (=> b!1246709 (=> (not res!831958) (not e!707091))))

(assert (=> b!1246709 (= res!831958 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39241 a!3892)) (not (= newFrom!287 (size!39241 a!3892)))))))

(declare-fun b!1246710 () Bool)

(declare-fun res!831955 () Bool)

(assert (=> b!1246710 (=> (not res!831955) (not e!707090))))

(assert (=> b!1246710 (= res!831955 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27505))))

(declare-fun b!1246711 () Bool)

(assert (=> b!1246711 (= e!707091 e!707090)))

(declare-fun res!831957 () Bool)

(assert (=> b!1246711 (=> (not res!831957) (not e!707090))))

(assert (=> b!1246711 (= res!831957 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41447 0))(
  ( (Unit!41448) )
))
(declare-fun lt!563169 () Unit!41447)

(declare-fun e!707093 () Unit!41447)

(assert (=> b!1246711 (= lt!563169 e!707093)))

(declare-fun c!122061 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246711 (= c!122061 (validKeyInArray!0 (select (arr!38705 a!3892) from!3270)))))

(declare-fun b!1246712 () Bool)

(declare-fun Unit!41449 () Unit!41447)

(assert (=> b!1246712 (= e!707093 Unit!41449)))

(declare-fun b!1246713 () Bool)

(declare-fun lt!563168 () Unit!41447)

(assert (=> b!1246713 (= e!707093 lt!563168)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80259 List!27508 List!27508 (_ BitVec 32)) Unit!41447)

(assert (=> b!1246713 (= lt!563168 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27504 (select (arr!38705 a!3892) from!3270) Nil!27505) Nil!27505 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246713 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27505)))

(assert (= (and start!104488 res!831954) b!1246707))

(assert (= (and b!1246707 res!831956) b!1246709))

(assert (= (and b!1246709 res!831958) b!1246711))

(assert (= (and b!1246711 c!122061) b!1246713))

(assert (= (and b!1246711 (not c!122061)) b!1246712))

(assert (= (and b!1246711 res!831957) b!1246710))

(assert (= (and b!1246710 res!831955) b!1246708))

(declare-fun m!1148471 () Bool)

(assert (=> b!1246711 m!1148471))

(assert (=> b!1246711 m!1148471))

(declare-fun m!1148473 () Bool)

(assert (=> b!1246711 m!1148473))

(declare-fun m!1148475 () Bool)

(assert (=> b!1246707 m!1148475))

(declare-fun m!1148477 () Bool)

(assert (=> b!1246710 m!1148477))

(declare-fun m!1148479 () Bool)

(assert (=> start!104488 m!1148479))

(assert (=> b!1246713 m!1148471))

(declare-fun m!1148481 () Bool)

(assert (=> b!1246713 m!1148481))

(assert (=> b!1246713 m!1148477))

(push 1)

(assert (not b!1246711))

(assert (not b!1246710))

(assert (not b!1246713))

(assert (not b!1246707))

(assert (not start!104488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

