; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117088 () Bool)

(assert start!117088)

(declare-fun b!1378313 () Bool)

(declare-fun e!780797 () Bool)

(declare-fun e!780796 () Bool)

(assert (=> b!1378313 (= e!780797 e!780796)))

(declare-fun res!920851 () Bool)

(assert (=> b!1378313 (=> (not res!920851) (not e!780796))))

(declare-fun lt!606464 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606465 () (_ BitVec 32))

(assert (=> b!1378313 (= res!920851 (and (= lt!606464 (bvsub lt!606465 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93705 0))(
  ( (array!93706 (arr!45253 (Array (_ BitVec 32) (_ BitVec 64))) (size!45803 (_ BitVec 32))) )
))
(declare-fun lt!606462 () array!93705)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378313 (= lt!606464 (arrayCountValidKeys!0 lt!606462 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93705)

(assert (=> b!1378313 (= lt!606465 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378313 (= lt!606462 (array!93706 (store (arr!45253 a!4094) i!1451 k!2953) (size!45803 a!4094)))))

(declare-fun res!920849 () Bool)

(assert (=> start!117088 (=> (not res!920849) (not e!780797))))

(assert (=> start!117088 (= res!920849 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45803 a!4094))))))

(assert (=> start!117088 e!780797))

(assert (=> start!117088 true))

(declare-fun array_inv!34281 (array!93705) Bool)

(assert (=> start!117088 (array_inv!34281 a!4094)))

(declare-fun b!1378314 () Bool)

(declare-fun res!920848 () Bool)

(assert (=> b!1378314 (=> (not res!920848) (not e!780797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378314 (= res!920848 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378315 () Bool)

(assert (=> b!1378315 (= e!780796 (not true))))

(assert (=> b!1378315 (= (bvadd (arrayCountValidKeys!0 lt!606462 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606464) (arrayCountValidKeys!0 lt!606462 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45769 0))(
  ( (Unit!45770) )
))
(declare-fun lt!606463 () Unit!45769)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45769)

(assert (=> b!1378315 (= lt!606463 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606462 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378315 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606465) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606461 () Unit!45769)

(assert (=> b!1378315 (= lt!606461 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378316 () Bool)

(declare-fun res!920847 () Bool)

(assert (=> b!1378316 (=> (not res!920847) (not e!780797))))

(assert (=> b!1378316 (= res!920847 (and (bvslt (size!45803 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45803 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378317 () Bool)

(declare-fun res!920850 () Bool)

(assert (=> b!1378317 (=> (not res!920850) (not e!780797))))

(assert (=> b!1378317 (= res!920850 (validKeyInArray!0 (select (arr!45253 a!4094) i!1451)))))

(assert (= (and start!117088 res!920849) b!1378317))

(assert (= (and b!1378317 res!920850) b!1378314))

(assert (= (and b!1378314 res!920848) b!1378316))

(assert (= (and b!1378316 res!920847) b!1378313))

(assert (= (and b!1378313 res!920851) b!1378315))

(declare-fun m!1262851 () Bool)

(assert (=> start!117088 m!1262851))

(declare-fun m!1262853 () Bool)

(assert (=> b!1378314 m!1262853))

(declare-fun m!1262855 () Bool)

(assert (=> b!1378315 m!1262855))

(declare-fun m!1262857 () Bool)

(assert (=> b!1378315 m!1262857))

(declare-fun m!1262859 () Bool)

(assert (=> b!1378315 m!1262859))

(declare-fun m!1262861 () Bool)

(assert (=> b!1378315 m!1262861))

(declare-fun m!1262863 () Bool)

(assert (=> b!1378315 m!1262863))

(declare-fun m!1262865 () Bool)

(assert (=> b!1378315 m!1262865))

(declare-fun m!1262867 () Bool)

(assert (=> b!1378313 m!1262867))

(declare-fun m!1262869 () Bool)

(assert (=> b!1378313 m!1262869))

(declare-fun m!1262871 () Bool)

(assert (=> b!1378313 m!1262871))

(declare-fun m!1262873 () Bool)

(assert (=> b!1378317 m!1262873))

(assert (=> b!1378317 m!1262873))

(declare-fun m!1262875 () Bool)

(assert (=> b!1378317 m!1262875))

(push 1)

(assert (not b!1378315))

(assert (not b!1378314))

(assert (not start!117088))

(assert (not b!1378313))

(assert (not b!1378317))

(check-sat)

(pop 1)

(push 1)

