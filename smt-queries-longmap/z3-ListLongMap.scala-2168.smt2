; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36328 () Bool)

(assert start!36328)

(declare-fun b!363577 () Bool)

(declare-fun res!202789 () Bool)

(declare-fun e!222611 () Bool)

(assert (=> b!363577 (=> (not res!202789) (not e!222611))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20603 0))(
  ( (array!20604 (arr!9780 (Array (_ BitVec 32) (_ BitVec 64))) (size!10132 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20603)

(assert (=> b!363577 (= res!202789 (and (bvslt (size!10132 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10132 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363578 () Bool)

(declare-fun e!222610 () Bool)

(assert (=> b!363578 (= e!222610 (not true))))

(declare-fun lt!167804 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20603 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363578 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167804) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11239 0))(
  ( (Unit!11240) )
))
(declare-fun lt!167803 () Unit!11239)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11239)

(assert (=> b!363578 (= lt!167803 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202786 () Bool)

(assert (=> start!36328 (=> (not res!202786) (not e!222611))))

(assert (=> start!36328 (= res!202786 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10132 a!4289))))))

(assert (=> start!36328 e!222611))

(assert (=> start!36328 true))

(declare-fun array_inv!7252 (array!20603) Bool)

(assert (=> start!36328 (array_inv!7252 a!4289)))

(declare-fun b!363579 () Bool)

(declare-fun res!202788 () Bool)

(assert (=> b!363579 (=> (not res!202788) (not e!222611))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363579 (= res!202788 (validKeyInArray!0 k0!2974))))

(declare-fun b!363580 () Bool)

(declare-fun res!202784 () Bool)

(assert (=> b!363580 (=> (not res!202784) (not e!222610))))

(assert (=> b!363580 (= res!202784 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!363581 () Bool)

(declare-fun res!202785 () Bool)

(assert (=> b!363581 (=> (not res!202785) (not e!222611))))

(assert (=> b!363581 (= res!202785 (not (validKeyInArray!0 (select (arr!9780 a!4289) i!1472))))))

(declare-fun b!363582 () Bool)

(assert (=> b!363582 (= e!222611 e!222610)))

(declare-fun res!202787 () Bool)

(assert (=> b!363582 (=> (not res!202787) (not e!222610))))

(assert (=> b!363582 (= res!202787 (= (arrayCountValidKeys!0 (array!20604 (store (arr!9780 a!4289) i!1472 k0!2974) (size!10132 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!167804)))))

(assert (=> b!363582 (= lt!167804 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36328 res!202786) b!363581))

(assert (= (and b!363581 res!202785) b!363579))

(assert (= (and b!363579 res!202788) b!363577))

(assert (= (and b!363577 res!202789) b!363582))

(assert (= (and b!363582 res!202787) b!363580))

(assert (= (and b!363580 res!202784) b!363578))

(declare-fun m!360979 () Bool)

(assert (=> b!363581 m!360979))

(assert (=> b!363581 m!360979))

(declare-fun m!360981 () Bool)

(assert (=> b!363581 m!360981))

(declare-fun m!360983 () Bool)

(assert (=> b!363578 m!360983))

(declare-fun m!360985 () Bool)

(assert (=> b!363578 m!360985))

(declare-fun m!360987 () Bool)

(assert (=> b!363578 m!360987))

(declare-fun m!360989 () Bool)

(assert (=> b!363582 m!360989))

(declare-fun m!360991 () Bool)

(assert (=> b!363582 m!360991))

(declare-fun m!360993 () Bool)

(assert (=> b!363582 m!360993))

(declare-fun m!360995 () Bool)

(assert (=> start!36328 m!360995))

(declare-fun m!360997 () Bool)

(assert (=> b!363579 m!360997))

(check-sat (not b!363582) (not b!363578) (not b!363579) (not start!36328) (not b!363581))
(check-sat)
