; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36352 () Bool)

(assert start!36352)

(declare-fun b!363542 () Bool)

(declare-fun e!222576 () Bool)

(assert (=> b!363542 (= e!222576 (not true))))

(declare-fun lt!167709 () (_ BitVec 32))

(declare-datatypes ((array!20628 0))(
  ( (array!20629 (arr!9793 (Array (_ BitVec 32) (_ BitVec 64))) (size!10146 (_ BitVec 32))) )
))
(declare-fun lt!167712 () array!20628)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20628 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363542 (= (bvadd (arrayCountValidKeys!0 lt!167712 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167709) (arrayCountValidKeys!0 lt!167712 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11252 0))(
  ( (Unit!11253) )
))
(declare-fun lt!167710 () Unit!11252)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11252)

(assert (=> b!363542 (= lt!167710 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167712 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167713 () (_ BitVec 32))

(declare-fun a!4289 () array!20628)

(assert (=> b!363542 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167713) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167711 () Unit!11252)

(assert (=> b!363542 (= lt!167711 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202848 () Bool)

(declare-fun e!222575 () Bool)

(assert (=> start!36352 (=> (not res!202848) (not e!222575))))

(assert (=> start!36352 (= res!202848 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10146 a!4289))))))

(assert (=> start!36352 e!222575))

(assert (=> start!36352 true))

(declare-fun array_inv!7242 (array!20628) Bool)

(assert (=> start!36352 (array_inv!7242 a!4289)))

(declare-fun b!363543 () Bool)

(declare-fun res!202847 () Bool)

(assert (=> b!363543 (=> (not res!202847) (not e!222575))))

(assert (=> b!363543 (= res!202847 (and (bvslt (size!10146 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10146 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363544 () Bool)

(assert (=> b!363544 (= e!222575 e!222576)))

(declare-fun res!202846 () Bool)

(assert (=> b!363544 (=> (not res!202846) (not e!222576))))

(assert (=> b!363544 (= res!202846 (and (= lt!167709 (bvadd #b00000000000000000000000000000001 lt!167713)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363544 (= lt!167709 (arrayCountValidKeys!0 lt!167712 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363544 (= lt!167713 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363544 (= lt!167712 (array!20629 (store (arr!9793 a!4289) i!1472 k0!2974) (size!10146 a!4289)))))

(declare-fun b!363545 () Bool)

(declare-fun res!202849 () Bool)

(assert (=> b!363545 (=> (not res!202849) (not e!222575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363545 (= res!202849 (validKeyInArray!0 k0!2974))))

(declare-fun b!363546 () Bool)

(declare-fun res!202845 () Bool)

(assert (=> b!363546 (=> (not res!202845) (not e!222575))))

(assert (=> b!363546 (= res!202845 (not (validKeyInArray!0 (select (arr!9793 a!4289) i!1472))))))

(assert (= (and start!36352 res!202848) b!363546))

(assert (= (and b!363546 res!202845) b!363545))

(assert (= (and b!363545 res!202849) b!363543))

(assert (= (and b!363543 res!202847) b!363544))

(assert (= (and b!363544 res!202846) b!363542))

(declare-fun m!360319 () Bool)

(assert (=> b!363545 m!360319))

(declare-fun m!360321 () Bool)

(assert (=> b!363544 m!360321))

(declare-fun m!360323 () Bool)

(assert (=> b!363544 m!360323))

(declare-fun m!360325 () Bool)

(assert (=> b!363544 m!360325))

(declare-fun m!360327 () Bool)

(assert (=> b!363546 m!360327))

(assert (=> b!363546 m!360327))

(declare-fun m!360329 () Bool)

(assert (=> b!363546 m!360329))

(declare-fun m!360331 () Bool)

(assert (=> b!363542 m!360331))

(declare-fun m!360333 () Bool)

(assert (=> b!363542 m!360333))

(declare-fun m!360335 () Bool)

(assert (=> b!363542 m!360335))

(declare-fun m!360337 () Bool)

(assert (=> b!363542 m!360337))

(declare-fun m!360339 () Bool)

(assert (=> b!363542 m!360339))

(declare-fun m!360341 () Bool)

(assert (=> b!363542 m!360341))

(declare-fun m!360343 () Bool)

(assert (=> start!36352 m!360343))

(check-sat (not b!363542) (not b!363546) (not b!363545) (not start!36352) (not b!363544))
(check-sat)
