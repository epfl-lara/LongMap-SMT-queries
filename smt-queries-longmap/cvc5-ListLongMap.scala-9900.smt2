; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117144 () Bool)

(assert start!117144)

(declare-fun res!921297 () Bool)

(declare-fun e!781064 () Bool)

(assert (=> start!117144 (=> (not res!921297) (not e!781064))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93761 0))(
  ( (array!93762 (arr!45281 (Array (_ BitVec 32) (_ BitVec 64))) (size!45831 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93761)

(assert (=> start!117144 (= res!921297 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45831 a!4094))))))

(assert (=> start!117144 e!781064))

(assert (=> start!117144 true))

(declare-fun array_inv!34309 (array!93761) Bool)

(assert (=> start!117144 (array_inv!34309 a!4094)))

(declare-fun b!1378760 () Bool)

(declare-fun res!921295 () Bool)

(assert (=> b!1378760 (=> (not res!921295) (not e!781064))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378760 (= res!921295 (and (bvslt (size!45831 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45831 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378761 () Bool)

(declare-fun res!921296 () Bool)

(assert (=> b!1378761 (=> (not res!921296) (not e!781064))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378761 (= res!921296 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378762 () Bool)

(declare-fun res!921294 () Bool)

(assert (=> b!1378762 (=> (not res!921294) (not e!781064))))

(assert (=> b!1378762 (= res!921294 (validKeyInArray!0 (select (arr!45281 a!4094) i!1451)))))

(declare-fun b!1378763 () Bool)

(assert (=> b!1378763 (= e!781064 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1378764 () Bool)

(declare-fun res!921298 () Bool)

(assert (=> b!1378764 (=> (not res!921298) (not e!781064))))

(declare-fun arrayCountValidKeys!0 (array!93761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378764 (= res!921298 (= (arrayCountValidKeys!0 (array!93762 (store (arr!45281 a!4094) i!1451 k!2953) (size!45831 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(assert (= (and start!117144 res!921297) b!1378762))

(assert (= (and b!1378762 res!921294) b!1378761))

(assert (= (and b!1378761 res!921296) b!1378760))

(assert (= (and b!1378760 res!921295) b!1378764))

(assert (= (and b!1378764 res!921298) b!1378763))

(declare-fun m!1263579 () Bool)

(assert (=> start!117144 m!1263579))

(declare-fun m!1263581 () Bool)

(assert (=> b!1378761 m!1263581))

(declare-fun m!1263583 () Bool)

(assert (=> b!1378762 m!1263583))

(assert (=> b!1378762 m!1263583))

(declare-fun m!1263585 () Bool)

(assert (=> b!1378762 m!1263585))

(declare-fun m!1263587 () Bool)

(assert (=> b!1378764 m!1263587))

(declare-fun m!1263589 () Bool)

(assert (=> b!1378764 m!1263589))

(declare-fun m!1263591 () Bool)

(assert (=> b!1378764 m!1263591))

(push 1)

(assert (not b!1378762))

(assert (not b!1378761))

(assert (not start!117144))

(assert (not b!1378764))

(check-sat)

