; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117258 () Bool)

(assert start!117258)

(declare-fun b!1379505 () Bool)

(declare-fun e!781479 () Bool)

(assert (=> b!1379505 (= e!781479 false)))

(declare-fun lt!607486 () (_ BitVec 32))

(declare-datatypes ((array!93808 0))(
  ( (array!93809 (arr!45303 (Array (_ BitVec 32) (_ BitVec 64))) (size!45855 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93808)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93808 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379505 (= lt!607486 (arrayCountValidKeys!0 (array!93809 (store (arr!45303 a!4094) i!1451 k!2953) (size!45855 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607487 () (_ BitVec 32))

(assert (=> b!1379505 (= lt!607487 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379504 () Bool)

(declare-fun res!921986 () Bool)

(assert (=> b!1379504 (=> (not res!921986) (not e!781479))))

(assert (=> b!1379504 (= res!921986 (and (bvslt (size!45855 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45855 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379502 () Bool)

(declare-fun res!921983 () Bool)

(assert (=> b!1379502 (=> (not res!921983) (not e!781479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379502 (= res!921983 (validKeyInArray!0 (select (arr!45303 a!4094) i!1451)))))

(declare-fun b!1379503 () Bool)

(declare-fun res!921984 () Bool)

(assert (=> b!1379503 (=> (not res!921984) (not e!781479))))

(assert (=> b!1379503 (= res!921984 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921985 () Bool)

(assert (=> start!117258 (=> (not res!921985) (not e!781479))))

(assert (=> start!117258 (= res!921985 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45855 a!4094))))))

(assert (=> start!117258 e!781479))

(assert (=> start!117258 true))

(declare-fun array_inv!34536 (array!93808) Bool)

(assert (=> start!117258 (array_inv!34536 a!4094)))

(assert (= (and start!117258 res!921985) b!1379502))

(assert (= (and b!1379502 res!921983) b!1379503))

(assert (= (and b!1379503 res!921984) b!1379504))

(assert (= (and b!1379504 res!921986) b!1379505))

(declare-fun m!1264225 () Bool)

(assert (=> b!1379505 m!1264225))

(declare-fun m!1264227 () Bool)

(assert (=> b!1379505 m!1264227))

(declare-fun m!1264229 () Bool)

(assert (=> b!1379505 m!1264229))

(declare-fun m!1264231 () Bool)

(assert (=> b!1379502 m!1264231))

(assert (=> b!1379502 m!1264231))

(declare-fun m!1264233 () Bool)

(assert (=> b!1379502 m!1264233))

(declare-fun m!1264235 () Bool)

(assert (=> b!1379503 m!1264235))

(declare-fun m!1264237 () Bool)

(assert (=> start!117258 m!1264237))

(push 1)

(assert (not b!1379505))

(assert (not b!1379502))

(assert (not start!117258))

(assert (not b!1379503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

