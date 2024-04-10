; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104446 () Bool)

(assert start!104446)

(declare-fun b!1246500 () Bool)

(declare-fun res!831825 () Bool)

(declare-fun e!706951 () Bool)

(assert (=> b!1246500 (=> (not res!831825) (not e!706951))))

(declare-datatypes ((array!80238 0))(
  ( (array!80239 (arr!38696 (Array (_ BitVec 32) (_ BitVec 64))) (size!39232 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80238)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246500 (= res!831825 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39232 a!3892)) (not (= newFrom!287 (size!39232 a!3892)))))))

(declare-fun b!1246501 () Bool)

(declare-fun res!831826 () Bool)

(assert (=> b!1246501 (=> (not res!831826) (not e!706951))))

(declare-datatypes ((List!27499 0))(
  ( (Nil!27496) (Cons!27495 (h!28704 (_ BitVec 64)) (t!40968 List!27499)) )
))
(declare-fun arrayNoDuplicates!0 (array!80238 (_ BitVec 32) List!27499) Bool)

(assert (=> b!1246501 (= res!831826 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27496))))

(declare-fun b!1246502 () Bool)

(assert (=> b!1246502 (= e!706951 false)))

(declare-datatypes ((Unit!41420 0))(
  ( (Unit!41421) )
))
(declare-fun lt!563106 () Unit!41420)

(declare-fun e!706952 () Unit!41420)

(assert (=> b!1246502 (= lt!563106 e!706952)))

(declare-fun c!122022 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246502 (= c!122022 (validKeyInArray!0 (select (arr!38696 a!3892) from!3270)))))

(declare-fun b!1246503 () Bool)

(declare-fun Unit!41422 () Unit!41420)

(assert (=> b!1246503 (= e!706952 Unit!41422)))

(declare-fun res!831824 () Bool)

(assert (=> start!104446 (=> (not res!831824) (not e!706951))))

(assert (=> start!104446 (= res!831824 (and (bvslt (size!39232 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39232 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39232 a!3892))))))

(assert (=> start!104446 e!706951))

(declare-fun array_inv!29544 (array!80238) Bool)

(assert (=> start!104446 (array_inv!29544 a!3892)))

(assert (=> start!104446 true))

(declare-fun b!1246499 () Bool)

(declare-fun lt!563105 () Unit!41420)

(assert (=> b!1246499 (= e!706952 lt!563105)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80238 List!27499 List!27499 (_ BitVec 32)) Unit!41420)

(assert (=> b!1246499 (= lt!563105 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27495 (select (arr!38696 a!3892) from!3270) Nil!27496) Nil!27496 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246499 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27496)))

(assert (= (and start!104446 res!831824) b!1246501))

(assert (= (and b!1246501 res!831826) b!1246500))

(assert (= (and b!1246500 res!831825) b!1246502))

(assert (= (and b!1246502 c!122022) b!1246499))

(assert (= (and b!1246502 (not c!122022)) b!1246503))

(declare-fun m!1148321 () Bool)

(assert (=> b!1246501 m!1148321))

(declare-fun m!1148323 () Bool)

(assert (=> b!1246502 m!1148323))

(assert (=> b!1246502 m!1148323))

(declare-fun m!1148325 () Bool)

(assert (=> b!1246502 m!1148325))

(declare-fun m!1148327 () Bool)

(assert (=> start!104446 m!1148327))

(assert (=> b!1246499 m!1148323))

(declare-fun m!1148329 () Bool)

(assert (=> b!1246499 m!1148329))

(declare-fun m!1148331 () Bool)

(assert (=> b!1246499 m!1148331))

(push 1)

(assert (not start!104446))

(assert (not b!1246499))

(assert (not b!1246501))

(assert (not b!1246502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

