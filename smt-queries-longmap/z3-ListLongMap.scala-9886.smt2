; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117062 () Bool)

(assert start!117062)

(declare-fun b!1378113 () Bool)

(declare-fun res!920648 () Bool)

(declare-fun e!780682 () Bool)

(assert (=> b!1378113 (=> (not res!920648) (not e!780682))))

(declare-datatypes ((array!93679 0))(
  ( (array!93680 (arr!45240 (Array (_ BitVec 32) (_ BitVec 64))) (size!45790 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93679)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378113 (= res!920648 (validKeyInArray!0 (select (arr!45240 a!4094) i!1451)))))

(declare-fun res!920650 () Bool)

(assert (=> start!117062 (=> (not res!920650) (not e!780682))))

(assert (=> start!117062 (= res!920650 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45790 a!4094))))))

(assert (=> start!117062 e!780682))

(assert (=> start!117062 true))

(declare-fun array_inv!34268 (array!93679) Bool)

(assert (=> start!117062 (array_inv!34268 a!4094)))

(declare-fun b!1378115 () Bool)

(declare-fun res!920649 () Bool)

(assert (=> b!1378115 (=> (not res!920649) (not e!780682))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378115 (= res!920649 (and (bvslt (size!45790 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45790 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378114 () Bool)

(declare-fun res!920647 () Bool)

(assert (=> b!1378114 (=> (not res!920647) (not e!780682))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378114 (= res!920647 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378116 () Bool)

(assert (=> b!1378116 (= e!780682 false)))

(declare-fun lt!606306 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93679 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378116 (= lt!606306 (arrayCountValidKeys!0 (array!93680 (store (arr!45240 a!4094) i!1451 k0!2953) (size!45790 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606305 () (_ BitVec 32))

(assert (=> b!1378116 (= lt!606305 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and start!117062 res!920650) b!1378113))

(assert (= (and b!1378113 res!920648) b!1378114))

(assert (= (and b!1378114 res!920647) b!1378115))

(assert (= (and b!1378115 res!920649) b!1378116))

(declare-fun m!1262555 () Bool)

(assert (=> b!1378113 m!1262555))

(assert (=> b!1378113 m!1262555))

(declare-fun m!1262557 () Bool)

(assert (=> b!1378113 m!1262557))

(declare-fun m!1262559 () Bool)

(assert (=> start!117062 m!1262559))

(declare-fun m!1262561 () Bool)

(assert (=> b!1378114 m!1262561))

(declare-fun m!1262563 () Bool)

(assert (=> b!1378116 m!1262563))

(declare-fun m!1262565 () Bool)

(assert (=> b!1378116 m!1262565))

(declare-fun m!1262567 () Bool)

(assert (=> b!1378116 m!1262567))

(check-sat (not b!1378116) (not b!1378114) (not start!117062) (not b!1378113))
