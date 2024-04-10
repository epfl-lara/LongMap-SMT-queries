; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104452 () Bool)

(assert start!104452)

(declare-fun b!1246544 () Bool)

(declare-fun res!831851 () Bool)

(declare-fun e!706979 () Bool)

(assert (=> b!1246544 (=> (not res!831851) (not e!706979))))

(declare-datatypes ((array!80244 0))(
  ( (array!80245 (arr!38699 (Array (_ BitVec 32) (_ BitVec 64))) (size!39235 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80244)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27502 0))(
  ( (Nil!27499) (Cons!27498 (h!28707 (_ BitVec 64)) (t!40971 List!27502)) )
))
(declare-fun arrayNoDuplicates!0 (array!80244 (_ BitVec 32) List!27502) Bool)

(assert (=> b!1246544 (= res!831851 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27499))))

(declare-fun res!831852 () Bool)

(assert (=> start!104452 (=> (not res!831852) (not e!706979))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104452 (= res!831852 (and (bvslt (size!39235 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39235 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39235 a!3892))))))

(assert (=> start!104452 e!706979))

(declare-fun array_inv!29547 (array!80244) Bool)

(assert (=> start!104452 (array_inv!29547 a!3892)))

(assert (=> start!104452 true))

(declare-fun b!1246545 () Bool)

(declare-datatypes ((Unit!41429 0))(
  ( (Unit!41430) )
))
(declare-fun e!706977 () Unit!41429)

(declare-fun Unit!41431 () Unit!41429)

(assert (=> b!1246545 (= e!706977 Unit!41431)))

(declare-fun b!1246546 () Bool)

(declare-fun lt!563123 () Unit!41429)

(assert (=> b!1246546 (= e!706977 lt!563123)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80244 List!27502 List!27502 (_ BitVec 32)) Unit!41429)

(assert (=> b!1246546 (= lt!563123 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27498 (select (arr!38699 a!3892) from!3270) Nil!27499) Nil!27499 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246546 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27499)))

(declare-fun b!1246547 () Bool)

(assert (=> b!1246547 (= e!706979 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvslt newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563124 () Unit!41429)

(assert (=> b!1246547 (= lt!563124 e!706977)))

(declare-fun c!122031 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246547 (= c!122031 (validKeyInArray!0 (select (arr!38699 a!3892) from!3270)))))

(declare-fun b!1246548 () Bool)

(declare-fun res!831853 () Bool)

(assert (=> b!1246548 (=> (not res!831853) (not e!706979))))

(assert (=> b!1246548 (= res!831853 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39235 a!3892)) (not (= newFrom!287 (size!39235 a!3892)))))))

(assert (= (and start!104452 res!831852) b!1246544))

(assert (= (and b!1246544 res!831851) b!1246548))

(assert (= (and b!1246548 res!831853) b!1246547))

(assert (= (and b!1246547 c!122031) b!1246546))

(assert (= (and b!1246547 (not c!122031)) b!1246545))

(declare-fun m!1148357 () Bool)

(assert (=> b!1246544 m!1148357))

(declare-fun m!1148359 () Bool)

(assert (=> start!104452 m!1148359))

(declare-fun m!1148361 () Bool)

(assert (=> b!1246546 m!1148361))

(declare-fun m!1148363 () Bool)

(assert (=> b!1246546 m!1148363))

(declare-fun m!1148365 () Bool)

(assert (=> b!1246546 m!1148365))

(assert (=> b!1246547 m!1148361))

(assert (=> b!1246547 m!1148361))

(declare-fun m!1148367 () Bool)

(assert (=> b!1246547 m!1148367))

(push 1)

(assert (not b!1246547))

(assert (not start!104452))

(assert (not b!1246544))

(assert (not b!1246546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

