; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36354 () Bool)

(assert start!36354)

(declare-fun b!363779 () Bool)

(declare-fun e!222728 () Bool)

(assert (=> b!363779 (= e!222728 (not true))))

(declare-fun lt!167981 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((array!20629 0))(
  ( (array!20630 (arr!9793 (Array (_ BitVec 32) (_ BitVec 64))) (size!10145 (_ BitVec 32))) )
))
(declare-fun lt!167979 () array!20629)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20629 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363779 (= (bvadd (arrayCountValidKeys!0 lt!167979 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167981) (arrayCountValidKeys!0 lt!167979 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11265 0))(
  ( (Unit!11266) )
))
(declare-fun lt!167977 () Unit!11265)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11265)

(assert (=> b!363779 (= lt!167977 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167979 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167980 () (_ BitVec 32))

(declare-fun a!4289 () array!20629)

(assert (=> b!363779 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167980) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167978 () Unit!11265)

(assert (=> b!363779 (= lt!167978 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202987 () Bool)

(declare-fun e!222726 () Bool)

(assert (=> start!36354 (=> (not res!202987) (not e!222726))))

(assert (=> start!36354 (= res!202987 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10145 a!4289))))))

(assert (=> start!36354 e!222726))

(assert (=> start!36354 true))

(declare-fun array_inv!7265 (array!20629) Bool)

(assert (=> start!36354 (array_inv!7265 a!4289)))

(declare-fun b!363780 () Bool)

(declare-fun res!202989 () Bool)

(assert (=> b!363780 (=> (not res!202989) (not e!222726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363780 (= res!202989 (not (validKeyInArray!0 (select (arr!9793 a!4289) i!1472))))))

(declare-fun b!363781 () Bool)

(declare-fun res!202988 () Bool)

(assert (=> b!363781 (=> (not res!202988) (not e!222726))))

(assert (=> b!363781 (= res!202988 (and (bvslt (size!10145 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10145 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363782 () Bool)

(assert (=> b!363782 (= e!222726 e!222728)))

(declare-fun res!202990 () Bool)

(assert (=> b!363782 (=> (not res!202990) (not e!222728))))

(assert (=> b!363782 (= res!202990 (and (= lt!167981 (bvadd #b00000000000000000000000000000001 lt!167980)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363782 (= lt!167981 (arrayCountValidKeys!0 lt!167979 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363782 (= lt!167980 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363782 (= lt!167979 (array!20630 (store (arr!9793 a!4289) i!1472 k!2974) (size!10145 a!4289)))))

(declare-fun b!363783 () Bool)

(declare-fun res!202986 () Bool)

(assert (=> b!363783 (=> (not res!202986) (not e!222726))))

(assert (=> b!363783 (= res!202986 (validKeyInArray!0 k!2974))))

(assert (= (and start!36354 res!202987) b!363780))

(assert (= (and b!363780 res!202989) b!363783))

(assert (= (and b!363783 res!202986) b!363781))

(assert (= (and b!363781 res!202988) b!363782))

(assert (= (and b!363782 res!202990) b!363779))

(declare-fun m!361299 () Bool)

(assert (=> start!36354 m!361299))

(declare-fun m!361301 () Bool)

(assert (=> b!363783 m!361301))

(declare-fun m!361303 () Bool)

(assert (=> b!363780 m!361303))

(assert (=> b!363780 m!361303))

(declare-fun m!361305 () Bool)

(assert (=> b!363780 m!361305))

(declare-fun m!361307 () Bool)

(assert (=> b!363782 m!361307))

(declare-fun m!361309 () Bool)

(assert (=> b!363782 m!361309))

(declare-fun m!361311 () Bool)

(assert (=> b!363782 m!361311))

(declare-fun m!361313 () Bool)

(assert (=> b!363779 m!361313))

(declare-fun m!361315 () Bool)

(assert (=> b!363779 m!361315))

(declare-fun m!361317 () Bool)

(assert (=> b!363779 m!361317))

(declare-fun m!361319 () Bool)

(assert (=> b!363779 m!361319))

(declare-fun m!361321 () Bool)

(assert (=> b!363779 m!361321))

(declare-fun m!361323 () Bool)

(assert (=> b!363779 m!361323))

(push 1)

(assert (not b!363779))

(assert (not b!363782))

(assert (not start!36354))

(assert (not b!363783))

(assert (not b!363780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

