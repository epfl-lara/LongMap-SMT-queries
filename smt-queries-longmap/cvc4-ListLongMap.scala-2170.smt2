; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36342 () Bool)

(assert start!36342)

(declare-fun b!363467 () Bool)

(declare-fun e!222532 () Bool)

(assert (=> b!363467 (= e!222532 (not true))))

(declare-datatypes ((array!20618 0))(
  ( (array!20619 (arr!9788 (Array (_ BitVec 32) (_ BitVec 64))) (size!10141 (_ BitVec 32))) )
))
(declare-fun lt!167637 () array!20618)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167635 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20618 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363467 (= (bvadd (arrayCountValidKeys!0 lt!167637 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167635) (arrayCountValidKeys!0 lt!167637 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11242 0))(
  ( (Unit!11243) )
))
(declare-fun lt!167636 () Unit!11242)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11242)

(assert (=> b!363467 (= lt!167636 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167637 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun a!4289 () array!20618)

(declare-fun lt!167634 () (_ BitVec 32))

(assert (=> b!363467 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167634) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167638 () Unit!11242)

(assert (=> b!363467 (= lt!167638 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363468 () Bool)

(declare-fun res!202771 () Bool)

(declare-fun e!222531 () Bool)

(assert (=> b!363468 (=> (not res!202771) (not e!222531))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363468 (= res!202771 (validKeyInArray!0 k!2974))))

(declare-fun b!363469 () Bool)

(declare-fun res!202773 () Bool)

(assert (=> b!363469 (=> (not res!202773) (not e!222531))))

(assert (=> b!363469 (= res!202773 (not (validKeyInArray!0 (select (arr!9788 a!4289) i!1472))))))

(declare-fun res!202774 () Bool)

(assert (=> start!36342 (=> (not res!202774) (not e!222531))))

(assert (=> start!36342 (= res!202774 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10141 a!4289))))))

(assert (=> start!36342 e!222531))

(assert (=> start!36342 true))

(declare-fun array_inv!7237 (array!20618) Bool)

(assert (=> start!36342 (array_inv!7237 a!4289)))

(declare-fun b!363470 () Bool)

(assert (=> b!363470 (= e!222531 e!222532)))

(declare-fun res!202770 () Bool)

(assert (=> b!363470 (=> (not res!202770) (not e!222532))))

(assert (=> b!363470 (= res!202770 (and (= lt!167635 (bvadd #b00000000000000000000000000000001 lt!167634)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363470 (= lt!167635 (arrayCountValidKeys!0 lt!167637 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363470 (= lt!167634 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363470 (= lt!167637 (array!20619 (store (arr!9788 a!4289) i!1472 k!2974) (size!10141 a!4289)))))

(declare-fun b!363471 () Bool)

(declare-fun res!202772 () Bool)

(assert (=> b!363471 (=> (not res!202772) (not e!222531))))

(assert (=> b!363471 (= res!202772 (and (bvslt (size!10141 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10141 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36342 res!202774) b!363469))

(assert (= (and b!363469 res!202773) b!363468))

(assert (= (and b!363468 res!202771) b!363471))

(assert (= (and b!363471 res!202772) b!363470))

(assert (= (and b!363470 res!202770) b!363467))

(declare-fun m!360189 () Bool)

(assert (=> b!363467 m!360189))

(declare-fun m!360191 () Bool)

(assert (=> b!363467 m!360191))

(declare-fun m!360193 () Bool)

(assert (=> b!363467 m!360193))

(declare-fun m!360195 () Bool)

(assert (=> b!363467 m!360195))

(declare-fun m!360197 () Bool)

(assert (=> b!363467 m!360197))

(declare-fun m!360199 () Bool)

(assert (=> b!363467 m!360199))

(declare-fun m!360201 () Bool)

(assert (=> b!363468 m!360201))

(declare-fun m!360203 () Bool)

(assert (=> start!36342 m!360203))

(declare-fun m!360205 () Bool)

(assert (=> b!363469 m!360205))

(assert (=> b!363469 m!360205))

(declare-fun m!360207 () Bool)

(assert (=> b!363469 m!360207))

(declare-fun m!360209 () Bool)

(assert (=> b!363470 m!360209))

(declare-fun m!360211 () Bool)

(assert (=> b!363470 m!360211))

(declare-fun m!360213 () Bool)

(assert (=> b!363470 m!360213))

(push 1)

(assert (not b!363470))

(assert (not b!363468))

(assert (not start!36342))

(assert (not b!363467))

(assert (not b!363469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

