; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117140 () Bool)

(assert start!117140)

(declare-fun b!1378691 () Bool)

(declare-fun res!921272 () Bool)

(declare-fun e!781033 () Bool)

(assert (=> b!1378691 (=> (not res!921272) (not e!781033))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378691 (= res!921272 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921268 () Bool)

(assert (=> start!117140 (=> (not res!921268) (not e!781033))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93711 0))(
  ( (array!93712 (arr!45256 (Array (_ BitVec 32) (_ BitVec 64))) (size!45808 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93711)

(assert (=> start!117140 (= res!921268 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45808 a!4094))))))

(assert (=> start!117140 e!781033))

(assert (=> start!117140 true))

(declare-fun array_inv!34489 (array!93711) Bool)

(assert (=> start!117140 (array_inv!34489 a!4094)))

(declare-fun b!1378692 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378692 (= e!781033 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1378693 () Bool)

(declare-fun res!921269 () Bool)

(assert (=> b!1378693 (=> (not res!921269) (not e!781033))))

(declare-fun arrayCountValidKeys!0 (array!93711 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378693 (= res!921269 (= (arrayCountValidKeys!0 (array!93712 (store (arr!45256 a!4094) i!1451 k0!2953) (size!45808 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378694 () Bool)

(declare-fun res!921271 () Bool)

(assert (=> b!1378694 (=> (not res!921271) (not e!781033))))

(assert (=> b!1378694 (= res!921271 (validKeyInArray!0 (select (arr!45256 a!4094) i!1451)))))

(declare-fun b!1378695 () Bool)

(declare-fun res!921270 () Bool)

(assert (=> b!1378695 (=> (not res!921270) (not e!781033))))

(assert (=> b!1378695 (= res!921270 (and (bvslt (size!45808 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45808 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117140 res!921268) b!1378694))

(assert (= (and b!1378694 res!921271) b!1378691))

(assert (= (and b!1378691 res!921272) b!1378695))

(assert (= (and b!1378695 res!921270) b!1378693))

(assert (= (and b!1378693 res!921269) b!1378692))

(declare-fun m!1263075 () Bool)

(assert (=> b!1378691 m!1263075))

(declare-fun m!1263077 () Bool)

(assert (=> start!117140 m!1263077))

(declare-fun m!1263079 () Bool)

(assert (=> b!1378693 m!1263079))

(declare-fun m!1263081 () Bool)

(assert (=> b!1378693 m!1263081))

(declare-fun m!1263083 () Bool)

(assert (=> b!1378693 m!1263083))

(declare-fun m!1263085 () Bool)

(assert (=> b!1378694 m!1263085))

(assert (=> b!1378694 m!1263085))

(declare-fun m!1263087 () Bool)

(assert (=> b!1378694 m!1263087))

(check-sat (not b!1378693) (not b!1378694) (not start!117140) (not b!1378691))
(check-sat)
