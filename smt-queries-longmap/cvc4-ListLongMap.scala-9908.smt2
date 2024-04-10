; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117196 () Bool)

(assert start!117196)

(declare-fun b!1379150 () Bool)

(declare-fun e!781265 () Bool)

(assert (=> b!1379150 (= e!781265 (not true))))

(declare-datatypes ((array!93813 0))(
  ( (array!93814 (arr!45307 (Array (_ BitVec 32) (_ BitVec 64))) (size!45857 (_ BitVec 32))) )
))
(declare-fun lt!607181 () array!93813)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607185 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93813 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379150 (= (bvadd (arrayCountValidKeys!0 lt!607181 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607185) (arrayCountValidKeys!0 lt!607181 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45841 0))(
  ( (Unit!45842) )
))
(declare-fun lt!607182 () Unit!45841)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45841)

(assert (=> b!1379150 (= lt!607182 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607181 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun a!4094 () array!93813)

(declare-fun lt!607183 () (_ BitVec 32))

(assert (=> b!1379150 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607183) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607184 () Unit!45841)

(assert (=> b!1379150 (= lt!607184 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921685 () Bool)

(declare-fun e!781263 () Bool)

(assert (=> start!117196 (=> (not res!921685) (not e!781263))))

(assert (=> start!117196 (= res!921685 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45857 a!4094))))))

(assert (=> start!117196 e!781263))

(assert (=> start!117196 true))

(declare-fun array_inv!34335 (array!93813) Bool)

(assert (=> start!117196 (array_inv!34335 a!4094)))

(declare-fun b!1379151 () Bool)

(declare-fun res!921688 () Bool)

(assert (=> b!1379151 (=> (not res!921688) (not e!781263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379151 (= res!921688 (validKeyInArray!0 (select (arr!45307 a!4094) i!1451)))))

(declare-fun b!1379152 () Bool)

(assert (=> b!1379152 (= e!781263 e!781265)))

(declare-fun res!921686 () Bool)

(assert (=> b!1379152 (=> (not res!921686) (not e!781265))))

(assert (=> b!1379152 (= res!921686 (and (= lt!607185 (bvsub lt!607183 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379152 (= lt!607185 (arrayCountValidKeys!0 lt!607181 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379152 (= lt!607183 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379152 (= lt!607181 (array!93814 (store (arr!45307 a!4094) i!1451 k!2953) (size!45857 a!4094)))))

(declare-fun b!1379153 () Bool)

(declare-fun res!921684 () Bool)

(assert (=> b!1379153 (=> (not res!921684) (not e!781263))))

(assert (=> b!1379153 (= res!921684 (and (bvslt (size!45857 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45857 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379154 () Bool)

(declare-fun res!921687 () Bool)

(assert (=> b!1379154 (=> (not res!921687) (not e!781263))))

(assert (=> b!1379154 (= res!921687 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117196 res!921685) b!1379151))

(assert (= (and b!1379151 res!921688) b!1379154))

(assert (= (and b!1379154 res!921687) b!1379153))

(assert (= (and b!1379153 res!921684) b!1379152))

(assert (= (and b!1379152 res!921686) b!1379150))

(declare-fun m!1264075 () Bool)

(assert (=> b!1379150 m!1264075))

(declare-fun m!1264077 () Bool)

(assert (=> b!1379150 m!1264077))

(declare-fun m!1264079 () Bool)

(assert (=> b!1379150 m!1264079))

(declare-fun m!1264081 () Bool)

(assert (=> b!1379150 m!1264081))

(declare-fun m!1264083 () Bool)

(assert (=> b!1379150 m!1264083))

(declare-fun m!1264085 () Bool)

(assert (=> b!1379150 m!1264085))

(declare-fun m!1264087 () Bool)

(assert (=> start!117196 m!1264087))

(declare-fun m!1264089 () Bool)

(assert (=> b!1379151 m!1264089))

(assert (=> b!1379151 m!1264089))

(declare-fun m!1264091 () Bool)

(assert (=> b!1379151 m!1264091))

(declare-fun m!1264093 () Bool)

(assert (=> b!1379152 m!1264093))

(declare-fun m!1264095 () Bool)

(assert (=> b!1379152 m!1264095))

(declare-fun m!1264097 () Bool)

(assert (=> b!1379152 m!1264097))

(declare-fun m!1264099 () Bool)

(assert (=> b!1379154 m!1264099))

(push 1)

(assert (not b!1379154))

(assert (not b!1379150))

(assert (not start!117196))

(assert (not b!1379151))

(assert (not b!1379152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

