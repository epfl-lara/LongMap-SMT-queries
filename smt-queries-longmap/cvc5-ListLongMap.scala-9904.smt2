; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117168 () Bool)

(assert start!117168)

(declare-fun b!1378891 () Bool)

(declare-fun e!781124 () Bool)

(declare-fun e!781125 () Bool)

(assert (=> b!1378891 (= e!781124 e!781125)))

(declare-fun res!921469 () Bool)

(assert (=> b!1378891 (=> (not res!921469) (not e!781125))))

(declare-datatypes ((array!93739 0))(
  ( (array!93740 (arr!45270 (Array (_ BitVec 32) (_ BitVec 64))) (size!45822 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93739)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606847 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378891 (= res!921469 (= (arrayCountValidKeys!0 (array!93740 (store (arr!45270 a!4094) i!1451 k!2953) (size!45822 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606847 #b00000000000000000000000000000001)))))

(assert (=> b!1378891 (= lt!606847 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378892 () Bool)

(assert (=> b!1378892 (= e!781125 (not true))))

(assert (=> b!1378892 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606847) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45658 0))(
  ( (Unit!45659) )
))
(declare-fun lt!606848 () Unit!45658)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45658)

(assert (=> b!1378892 (= lt!606848 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921471 () Bool)

(assert (=> start!117168 (=> (not res!921471) (not e!781124))))

(assert (=> start!117168 (= res!921471 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45822 a!4094))))))

(assert (=> start!117168 e!781124))

(assert (=> start!117168 true))

(declare-fun array_inv!34503 (array!93739) Bool)

(assert (=> start!117168 (array_inv!34503 a!4094)))

(declare-fun b!1378893 () Bool)

(declare-fun res!921472 () Bool)

(assert (=> b!1378893 (=> (not res!921472) (not e!781124))))

(assert (=> b!1378893 (= res!921472 (and (bvslt (size!45822 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45822 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378894 () Bool)

(declare-fun res!921473 () Bool)

(assert (=> b!1378894 (=> (not res!921473) (not e!781125))))

(assert (=> b!1378894 (= res!921473 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378895 () Bool)

(declare-fun res!921470 () Bool)

(assert (=> b!1378895 (=> (not res!921470) (not e!781124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378895 (= res!921470 (validKeyInArray!0 (select (arr!45270 a!4094) i!1451)))))

(declare-fun b!1378896 () Bool)

(declare-fun res!921468 () Bool)

(assert (=> b!1378896 (=> (not res!921468) (not e!781124))))

(assert (=> b!1378896 (= res!921468 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117168 res!921471) b!1378895))

(assert (= (and b!1378895 res!921470) b!1378896))

(assert (= (and b!1378896 res!921468) b!1378893))

(assert (= (and b!1378893 res!921472) b!1378891))

(assert (= (and b!1378891 res!921469) b!1378894))

(assert (= (and b!1378894 res!921473) b!1378892))

(declare-fun m!1263283 () Bool)

(assert (=> b!1378892 m!1263283))

(declare-fun m!1263285 () Bool)

(assert (=> b!1378892 m!1263285))

(declare-fun m!1263287 () Bool)

(assert (=> b!1378892 m!1263287))

(declare-fun m!1263289 () Bool)

(assert (=> b!1378891 m!1263289))

(declare-fun m!1263291 () Bool)

(assert (=> b!1378891 m!1263291))

(declare-fun m!1263293 () Bool)

(assert (=> b!1378891 m!1263293))

(declare-fun m!1263295 () Bool)

(assert (=> b!1378896 m!1263295))

(declare-fun m!1263297 () Bool)

(assert (=> start!117168 m!1263297))

(declare-fun m!1263299 () Bool)

(assert (=> b!1378895 m!1263299))

(assert (=> b!1378895 m!1263299))

(declare-fun m!1263301 () Bool)

(assert (=> b!1378895 m!1263301))

(push 1)

(assert (not b!1378896))

(assert (not b!1378892))

(assert (not b!1378895))

(assert (not start!117168))

(assert (not b!1378891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

