; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36328 () Bool)

(assert start!36328)

(declare-fun b!363355 () Bool)

(declare-fun res!202660 () Bool)

(declare-fun e!222467 () Bool)

(assert (=> b!363355 (=> (not res!202660) (not e!222467))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20604 0))(
  ( (array!20605 (arr!9781 (Array (_ BitVec 32) (_ BitVec 64))) (size!10134 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20604)

(assert (=> b!363355 (= res!202660 (and (bvslt (size!10134 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10134 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363356 () Bool)

(declare-fun res!202663 () Bool)

(assert (=> b!363356 (=> (not res!202663) (not e!222467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363356 (= res!202663 (not (validKeyInArray!0 (select (arr!9781 a!4289) i!1472))))))

(declare-fun res!202661 () Bool)

(assert (=> start!36328 (=> (not res!202661) (not e!222467))))

(assert (=> start!36328 (= res!202661 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10134 a!4289))))))

(assert (=> start!36328 e!222467))

(assert (=> start!36328 true))

(declare-fun array_inv!7230 (array!20604) Bool)

(assert (=> start!36328 (array_inv!7230 a!4289)))

(declare-fun b!363357 () Bool)

(declare-fun res!202658 () Bool)

(declare-fun e!222468 () Bool)

(assert (=> b!363357 (=> (not res!202658) (not e!222468))))

(assert (=> b!363357 (= res!202658 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!363358 () Bool)

(assert (=> b!363358 (= e!222468 (not true))))

(declare-fun lt!167551 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20604 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363358 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167551) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11228 0))(
  ( (Unit!11229) )
))
(declare-fun lt!167550 () Unit!11228)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11228)

(assert (=> b!363358 (= lt!167550 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363359 () Bool)

(declare-fun res!202659 () Bool)

(assert (=> b!363359 (=> (not res!202659) (not e!222467))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363359 (= res!202659 (validKeyInArray!0 k0!2974))))

(declare-fun b!363360 () Bool)

(assert (=> b!363360 (= e!222467 e!222468)))

(declare-fun res!202662 () Bool)

(assert (=> b!363360 (=> (not res!202662) (not e!222468))))

(assert (=> b!363360 (= res!202662 (= (arrayCountValidKeys!0 (array!20605 (store (arr!9781 a!4289) i!1472 k0!2974) (size!10134 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!167551)))))

(assert (=> b!363360 (= lt!167551 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36328 res!202661) b!363356))

(assert (= (and b!363356 res!202663) b!363359))

(assert (= (and b!363359 res!202659) b!363355))

(assert (= (and b!363355 res!202660) b!363360))

(assert (= (and b!363360 res!202662) b!363357))

(assert (= (and b!363357 res!202658) b!363358))

(declare-fun m!360025 () Bool)

(assert (=> b!363358 m!360025))

(declare-fun m!360027 () Bool)

(assert (=> b!363358 m!360027))

(declare-fun m!360029 () Bool)

(assert (=> b!363358 m!360029))

(declare-fun m!360031 () Bool)

(assert (=> b!363359 m!360031))

(declare-fun m!360033 () Bool)

(assert (=> b!363360 m!360033))

(declare-fun m!360035 () Bool)

(assert (=> b!363360 m!360035))

(declare-fun m!360037 () Bool)

(assert (=> b!363360 m!360037))

(declare-fun m!360039 () Bool)

(assert (=> b!363356 m!360039))

(assert (=> b!363356 m!360039))

(declare-fun m!360041 () Bool)

(assert (=> b!363356 m!360041))

(declare-fun m!360043 () Bool)

(assert (=> start!36328 m!360043))

(check-sat (not b!363356) (not b!363359) (not start!36328) (not b!363358) (not b!363360))
(check-sat)
