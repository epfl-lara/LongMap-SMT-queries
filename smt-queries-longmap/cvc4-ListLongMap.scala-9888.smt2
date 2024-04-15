; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117070 () Bool)

(assert start!117070)

(declare-fun b!1378139 () Bool)

(declare-fun e!780701 () Bool)

(declare-fun e!780702 () Bool)

(assert (=> b!1378139 (= e!780701 e!780702)))

(declare-fun res!920716 () Bool)

(assert (=> b!1378139 (=> (not res!920716) (not e!780702))))

(declare-fun lt!606173 () (_ BitVec 32))

(declare-fun lt!606174 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378139 (= res!920716 (and (= lt!606173 (bvsub lt!606174 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93641 0))(
  ( (array!93642 (arr!45221 (Array (_ BitVec 32) (_ BitVec 64))) (size!45773 (_ BitVec 32))) )
))
(declare-fun lt!606175 () array!93641)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93641 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378139 (= lt!606173 (arrayCountValidKeys!0 lt!606175 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93641)

(assert (=> b!1378139 (= lt!606174 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378139 (= lt!606175 (array!93642 (store (arr!45221 a!4094) i!1451 k!2953) (size!45773 a!4094)))))

(declare-fun res!920720 () Bool)

(assert (=> start!117070 (=> (not res!920720) (not e!780701))))

(assert (=> start!117070 (= res!920720 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45773 a!4094))))))

(assert (=> start!117070 e!780701))

(assert (=> start!117070 true))

(declare-fun array_inv!34454 (array!93641) Bool)

(assert (=> start!117070 (array_inv!34454 a!4094)))

(declare-fun b!1378140 () Bool)

(declare-fun res!920719 () Bool)

(assert (=> b!1378140 (=> (not res!920719) (not e!780701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378140 (= res!920719 (validKeyInArray!0 (select (arr!45221 a!4094) i!1451)))))

(declare-fun b!1378141 () Bool)

(declare-fun res!920717 () Bool)

(assert (=> b!1378141 (=> (not res!920717) (not e!780701))))

(assert (=> b!1378141 (= res!920717 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378142 () Bool)

(declare-fun res!920718 () Bool)

(assert (=> b!1378142 (=> (not res!920718) (not e!780701))))

(assert (=> b!1378142 (= res!920718 (and (bvslt (size!45773 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45773 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378143 () Bool)

(assert (=> b!1378143 (= e!780702 (not true))))

(assert (=> b!1378143 (= (bvadd (arrayCountValidKeys!0 lt!606175 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606173) (arrayCountValidKeys!0 lt!606175 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45596 0))(
  ( (Unit!45597) )
))
(declare-fun lt!606172 () Unit!45596)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45596)

(assert (=> b!1378143 (= lt!606172 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606175 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378143 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606174) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606176 () Unit!45596)

(assert (=> b!1378143 (= lt!606176 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117070 res!920720) b!1378140))

(assert (= (and b!1378140 res!920719) b!1378141))

(assert (= (and b!1378141 res!920717) b!1378142))

(assert (= (and b!1378142 res!920718) b!1378139))

(assert (= (and b!1378139 res!920716) b!1378143))

(declare-fun m!1262165 () Bool)

(assert (=> b!1378141 m!1262165))

(declare-fun m!1262167 () Bool)

(assert (=> start!117070 m!1262167))

(declare-fun m!1262169 () Bool)

(assert (=> b!1378140 m!1262169))

(assert (=> b!1378140 m!1262169))

(declare-fun m!1262171 () Bool)

(assert (=> b!1378140 m!1262171))

(declare-fun m!1262173 () Bool)

(assert (=> b!1378143 m!1262173))

(declare-fun m!1262175 () Bool)

(assert (=> b!1378143 m!1262175))

(declare-fun m!1262177 () Bool)

(assert (=> b!1378143 m!1262177))

(declare-fun m!1262179 () Bool)

(assert (=> b!1378143 m!1262179))

(declare-fun m!1262181 () Bool)

(assert (=> b!1378143 m!1262181))

(declare-fun m!1262183 () Bool)

(assert (=> b!1378143 m!1262183))

(declare-fun m!1262185 () Bool)

(assert (=> b!1378139 m!1262185))

(declare-fun m!1262187 () Bool)

(assert (=> b!1378139 m!1262187))

(declare-fun m!1262189 () Bool)

(assert (=> b!1378139 m!1262189))

(push 1)

(assert (not b!1378140))

(assert (not b!1378141))

(assert (not start!117070))

(assert (not b!1378143))

(assert (not b!1378139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

