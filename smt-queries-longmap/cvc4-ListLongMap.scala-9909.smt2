; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117432 () Bool)

(assert start!117432)

(declare-fun res!922237 () Bool)

(declare-fun e!782132 () Bool)

(assert (=> start!117432 (=> (not res!922237) (not e!782132))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93933 0))(
  ( (array!93934 (arr!45362 (Array (_ BitVec 32) (_ BitVec 64))) (size!45913 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93933)

(assert (=> start!117432 (= res!922237 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45913 a!4094))))))

(assert (=> start!117432 e!782132))

(assert (=> start!117432 true))

(declare-fun array_inv!34643 (array!93933) Bool)

(assert (=> start!117432 (array_inv!34643 a!4094)))

(declare-fun b!1380490 () Bool)

(declare-fun res!922235 () Bool)

(assert (=> b!1380490 (=> (not res!922235) (not e!782132))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380490 (= res!922235 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380491 () Bool)

(declare-fun e!782131 () Bool)

(assert (=> b!1380491 (= e!782132 e!782131)))

(declare-fun res!922239 () Bool)

(assert (=> b!1380491 (=> (not res!922239) (not e!782131))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607695 () (_ BitVec 32))

(declare-fun lt!607692 () (_ BitVec 32))

(assert (=> b!1380491 (= res!922239 (and (= lt!607695 (bvsub lt!607692 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607694 () array!93933)

(declare-fun arrayCountValidKeys!0 (array!93933 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380491 (= lt!607695 (arrayCountValidKeys!0 lt!607694 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380491 (= lt!607692 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380491 (= lt!607694 (array!93934 (store (arr!45362 a!4094) i!1451 k!2953) (size!45913 a!4094)))))

(declare-fun b!1380492 () Bool)

(declare-fun res!922236 () Bool)

(assert (=> b!1380492 (=> (not res!922236) (not e!782132))))

(assert (=> b!1380492 (= res!922236 (and (bvslt (size!45913 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45913 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380493 () Bool)

(assert (=> b!1380493 (= e!782131 (not true))))

(assert (=> b!1380493 (= (bvadd (arrayCountValidKeys!0 lt!607694 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607695) (arrayCountValidKeys!0 lt!607694 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45784 0))(
  ( (Unit!45785) )
))
(declare-fun lt!607693 () Unit!45784)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45784)

(assert (=> b!1380493 (= lt!607693 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607694 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1380493 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607692) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607696 () Unit!45784)

(assert (=> b!1380493 (= lt!607696 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380494 () Bool)

(declare-fun res!922238 () Bool)

(assert (=> b!1380494 (=> (not res!922238) (not e!782132))))

(assert (=> b!1380494 (= res!922238 (validKeyInArray!0 (select (arr!45362 a!4094) i!1451)))))

(assert (= (and start!117432 res!922237) b!1380494))

(assert (= (and b!1380494 res!922238) b!1380490))

(assert (= (and b!1380490 res!922235) b!1380492))

(assert (= (and b!1380492 res!922236) b!1380491))

(assert (= (and b!1380491 res!922239) b!1380493))

(declare-fun m!1265763 () Bool)

(assert (=> start!117432 m!1265763))

(declare-fun m!1265765 () Bool)

(assert (=> b!1380490 m!1265765))

(declare-fun m!1265767 () Bool)

(assert (=> b!1380491 m!1265767))

(declare-fun m!1265769 () Bool)

(assert (=> b!1380491 m!1265769))

(declare-fun m!1265771 () Bool)

(assert (=> b!1380491 m!1265771))

(declare-fun m!1265773 () Bool)

(assert (=> b!1380494 m!1265773))

(assert (=> b!1380494 m!1265773))

(declare-fun m!1265775 () Bool)

(assert (=> b!1380494 m!1265775))

(declare-fun m!1265777 () Bool)

(assert (=> b!1380493 m!1265777))

(declare-fun m!1265779 () Bool)

(assert (=> b!1380493 m!1265779))

(declare-fun m!1265781 () Bool)

(assert (=> b!1380493 m!1265781))

(declare-fun m!1265783 () Bool)

(assert (=> b!1380493 m!1265783))

(declare-fun m!1265785 () Bool)

(assert (=> b!1380493 m!1265785))

(declare-fun m!1265787 () Bool)

(assert (=> b!1380493 m!1265787))

(push 1)

(assert (not start!117432))

(assert (not b!1380491))

(assert (not b!1380493))

(assert (not b!1380494))

(assert (not b!1380490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

