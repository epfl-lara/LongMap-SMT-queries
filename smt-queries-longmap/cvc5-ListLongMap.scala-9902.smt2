; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117392 () Bool)

(assert start!117392)

(declare-fun res!921919 () Bool)

(declare-fun e!781961 () Bool)

(assert (=> start!117392 (=> (not res!921919) (not e!781961))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93893 0))(
  ( (array!93894 (arr!45342 (Array (_ BitVec 32) (_ BitVec 64))) (size!45893 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93893)

(assert (=> start!117392 (= res!921919 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45893 a!4094))))))

(assert (=> start!117392 e!781961))

(assert (=> start!117392 true))

(declare-fun array_inv!34623 (array!93893) Bool)

(assert (=> start!117392 (array_inv!34623 a!4094)))

(declare-fun b!1380175 () Bool)

(declare-fun res!921920 () Bool)

(assert (=> b!1380175 (=> (not res!921920) (not e!781961))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1380175 (= res!921920 (and (bvslt (size!45893 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45893 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380174 () Bool)

(declare-fun res!921921 () Bool)

(assert (=> b!1380174 (=> (not res!921921) (not e!781961))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380174 (= res!921921 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380176 () Bool)

(assert (=> b!1380176 (= e!781961 false)))

(declare-fun lt!607494 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93893 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380176 (= lt!607494 (arrayCountValidKeys!0 (array!93894 (store (arr!45342 a!4094) i!1451 k!2953) (size!45893 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607495 () (_ BitVec 32))

(assert (=> b!1380176 (= lt!607495 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380173 () Bool)

(declare-fun res!921918 () Bool)

(assert (=> b!1380173 (=> (not res!921918) (not e!781961))))

(assert (=> b!1380173 (= res!921918 (validKeyInArray!0 (select (arr!45342 a!4094) i!1451)))))

(assert (= (and start!117392 res!921919) b!1380173))

(assert (= (and b!1380173 res!921918) b!1380174))

(assert (= (and b!1380174 res!921921) b!1380175))

(assert (= (and b!1380175 res!921920) b!1380176))

(declare-fun m!1265327 () Bool)

(assert (=> start!117392 m!1265327))

(declare-fun m!1265329 () Bool)

(assert (=> b!1380174 m!1265329))

(declare-fun m!1265331 () Bool)

(assert (=> b!1380176 m!1265331))

(declare-fun m!1265333 () Bool)

(assert (=> b!1380176 m!1265333))

(declare-fun m!1265335 () Bool)

(assert (=> b!1380176 m!1265335))

(declare-fun m!1265337 () Bool)

(assert (=> b!1380173 m!1265337))

(assert (=> b!1380173 m!1265337))

(declare-fun m!1265339 () Bool)

(assert (=> b!1380173 m!1265339))

(push 1)

(assert (not b!1380173))

(assert (not b!1380174))

(assert (not b!1380176))

(assert (not start!117392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

