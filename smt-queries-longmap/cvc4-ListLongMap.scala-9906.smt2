; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117414 () Bool)

(assert start!117414)

(declare-fun res!922100 () Bool)

(declare-fun e!782051 () Bool)

(assert (=> start!117414 (=> (not res!922100) (not e!782051))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93915 0))(
  ( (array!93916 (arr!45353 (Array (_ BitVec 32) (_ BitVec 64))) (size!45904 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93915)

(assert (=> start!117414 (= res!922100 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45904 a!4094))))))

(assert (=> start!117414 e!782051))

(assert (=> start!117414 true))

(declare-fun array_inv!34634 (array!93915) Bool)

(assert (=> start!117414 (array_inv!34634 a!4094)))

(declare-fun b!1380355 () Bool)

(declare-fun e!782050 () Bool)

(assert (=> b!1380355 (= e!782051 e!782050)))

(declare-fun res!922104 () Bool)

(assert (=> b!1380355 (=> (not res!922104) (not e!782050))))

(declare-fun lt!607558 () (_ BitVec 32))

(declare-fun lt!607560 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1380355 (= res!922104 (and (= lt!607560 (bvsub lt!607558 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607561 () array!93915)

(declare-fun arrayCountValidKeys!0 (array!93915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380355 (= lt!607560 (arrayCountValidKeys!0 lt!607561 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380355 (= lt!607558 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1380355 (= lt!607561 (array!93916 (store (arr!45353 a!4094) i!1451 k!2953) (size!45904 a!4094)))))

(declare-fun b!1380356 () Bool)

(declare-fun res!922103 () Bool)

(assert (=> b!1380356 (=> (not res!922103) (not e!782051))))

(assert (=> b!1380356 (= res!922103 (and (bvslt (size!45904 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45904 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380357 () Bool)

(declare-fun res!922102 () Bool)

(assert (=> b!1380357 (=> (not res!922102) (not e!782051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380357 (= res!922102 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380358 () Bool)

(assert (=> b!1380358 (= e!782050 (not true))))

(assert (=> b!1380358 (= (bvadd (arrayCountValidKeys!0 lt!607561 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607560) (arrayCountValidKeys!0 lt!607561 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45766 0))(
  ( (Unit!45767) )
))
(declare-fun lt!607559 () Unit!45766)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45766)

(assert (=> b!1380358 (= lt!607559 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607561 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1380358 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607558) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607557 () Unit!45766)

(assert (=> b!1380358 (= lt!607557 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380359 () Bool)

(declare-fun res!922101 () Bool)

(assert (=> b!1380359 (=> (not res!922101) (not e!782051))))

(assert (=> b!1380359 (= res!922101 (validKeyInArray!0 (select (arr!45353 a!4094) i!1451)))))

(assert (= (and start!117414 res!922100) b!1380359))

(assert (= (and b!1380359 res!922101) b!1380357))

(assert (= (and b!1380357 res!922102) b!1380356))

(assert (= (and b!1380356 res!922103) b!1380355))

(assert (= (and b!1380355 res!922104) b!1380358))

(declare-fun m!1265529 () Bool)

(assert (=> start!117414 m!1265529))

(declare-fun m!1265531 () Bool)

(assert (=> b!1380357 m!1265531))

(declare-fun m!1265533 () Bool)

(assert (=> b!1380355 m!1265533))

(declare-fun m!1265535 () Bool)

(assert (=> b!1380355 m!1265535))

(declare-fun m!1265537 () Bool)

(assert (=> b!1380355 m!1265537))

(declare-fun m!1265539 () Bool)

(assert (=> b!1380359 m!1265539))

(assert (=> b!1380359 m!1265539))

(declare-fun m!1265541 () Bool)

(assert (=> b!1380359 m!1265541))

(declare-fun m!1265543 () Bool)

(assert (=> b!1380358 m!1265543))

(declare-fun m!1265545 () Bool)

(assert (=> b!1380358 m!1265545))

(declare-fun m!1265547 () Bool)

(assert (=> b!1380358 m!1265547))

(declare-fun m!1265549 () Bool)

(assert (=> b!1380358 m!1265549))

(declare-fun m!1265551 () Bool)

(assert (=> b!1380358 m!1265551))

(declare-fun m!1265553 () Bool)

(assert (=> b!1380358 m!1265553))

(push 1)

(assert (not b!1380358))

(assert (not b!1380359))

(assert (not b!1380357))

(assert (not b!1380355))

(assert (not start!117414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

