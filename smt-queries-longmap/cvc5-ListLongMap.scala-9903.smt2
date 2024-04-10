; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117162 () Bool)

(assert start!117162)

(declare-fun res!921414 () Bool)

(declare-fun e!781117 () Bool)

(assert (=> start!117162 (=> (not res!921414) (not e!781117))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93779 0))(
  ( (array!93780 (arr!45290 (Array (_ BitVec 32) (_ BitVec 64))) (size!45840 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93779)

(assert (=> start!117162 (= res!921414 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45840 a!4094))))))

(assert (=> start!117162 e!781117))

(assert (=> start!117162 true))

(declare-fun array_inv!34318 (array!93779) Bool)

(assert (=> start!117162 (array_inv!34318 a!4094)))

(declare-fun b!1378877 () Bool)

(declare-fun res!921413 () Bool)

(assert (=> b!1378877 (=> (not res!921413) (not e!781117))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93779 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378877 (= res!921413 (= (arrayCountValidKeys!0 (array!93780 (store (arr!45290 a!4094) i!1451 k!2953) (size!45840 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378878 () Bool)

(declare-fun res!921412 () Bool)

(assert (=> b!1378878 (=> (not res!921412) (not e!781117))))

(assert (=> b!1378878 (= res!921412 (and (bvslt (size!45840 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45840 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378879 () Bool)

(declare-fun res!921411 () Bool)

(assert (=> b!1378879 (=> (not res!921411) (not e!781117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378879 (= res!921411 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378880 () Bool)

(assert (=> b!1378880 (= e!781117 (and (bvsgt from!3466 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvslt from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(declare-fun b!1378881 () Bool)

(declare-fun res!921415 () Bool)

(assert (=> b!1378881 (=> (not res!921415) (not e!781117))))

(assert (=> b!1378881 (= res!921415 (validKeyInArray!0 (select (arr!45290 a!4094) i!1451)))))

(assert (= (and start!117162 res!921414) b!1378881))

(assert (= (and b!1378881 res!921415) b!1378879))

(assert (= (and b!1378879 res!921411) b!1378878))

(assert (= (and b!1378878 res!921412) b!1378877))

(assert (= (and b!1378877 res!921413) b!1378880))

(declare-fun m!1263705 () Bool)

(assert (=> start!117162 m!1263705))

(declare-fun m!1263707 () Bool)

(assert (=> b!1378877 m!1263707))

(declare-fun m!1263709 () Bool)

(assert (=> b!1378877 m!1263709))

(declare-fun m!1263711 () Bool)

(assert (=> b!1378877 m!1263711))

(declare-fun m!1263713 () Bool)

(assert (=> b!1378879 m!1263713))

(declare-fun m!1263715 () Bool)

(assert (=> b!1378881 m!1263715))

(assert (=> b!1378881 m!1263715))

(declare-fun m!1263717 () Bool)

(assert (=> b!1378881 m!1263717))

(push 1)

(assert (not start!117162))

(assert (not b!1378877))

(assert (not b!1378881))

(assert (not b!1378879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

