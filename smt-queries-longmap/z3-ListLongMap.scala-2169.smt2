; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36350 () Bool)

(assert start!36350)

(declare-fun b!363693 () Bool)

(declare-fun res!202855 () Bool)

(declare-fun e!222678 () Bool)

(assert (=> b!363693 (=> (not res!202855) (not e!222678))))

(declare-datatypes ((array!20630 0))(
  ( (array!20631 (arr!9794 (Array (_ BitVec 32) (_ BitVec 64))) (size!10146 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20630)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363693 (= res!202855 (not (validKeyInArray!0 (select (arr!9794 a!4289) i!1472))))))

(declare-fun b!363694 () Bool)

(declare-fun e!222679 () Bool)

(assert (=> b!363694 (= e!222679 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167826 () array!20630)

(declare-fun lt!167827 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20630 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363694 (= (bvadd (arrayCountValidKeys!0 lt!167826 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167827) (arrayCountValidKeys!0 lt!167826 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11258 0))(
  ( (Unit!11259) )
))
(declare-fun lt!167824 () Unit!11258)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11258)

(assert (=> b!363694 (= lt!167824 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167826 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167825 () (_ BitVec 32))

(assert (=> b!363694 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167825) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167823 () Unit!11258)

(assert (=> b!363694 (= lt!167823 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202858 () Bool)

(assert (=> start!36350 (=> (not res!202858) (not e!222678))))

(assert (=> start!36350 (= res!202858 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10146 a!4289))))))

(assert (=> start!36350 e!222678))

(assert (=> start!36350 true))

(declare-fun array_inv!7236 (array!20630) Bool)

(assert (=> start!36350 (array_inv!7236 a!4289)))

(declare-fun b!363695 () Bool)

(declare-fun res!202854 () Bool)

(assert (=> b!363695 (=> (not res!202854) (not e!222678))))

(assert (=> b!363695 (= res!202854 (and (bvslt (size!10146 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10146 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363696 () Bool)

(declare-fun res!202857 () Bool)

(assert (=> b!363696 (=> (not res!202857) (not e!222678))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363696 (= res!202857 (validKeyInArray!0 k0!2974))))

(declare-fun b!363697 () Bool)

(assert (=> b!363697 (= e!222678 e!222679)))

(declare-fun res!202856 () Bool)

(assert (=> b!363697 (=> (not res!202856) (not e!222679))))

(assert (=> b!363697 (= res!202856 (and (= lt!167827 (bvadd #b00000000000000000000000000000001 lt!167825)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363697 (= lt!167827 (arrayCountValidKeys!0 lt!167826 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363697 (= lt!167825 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363697 (= lt!167826 (array!20631 (store (arr!9794 a!4289) i!1472 k0!2974) (size!10146 a!4289)))))

(assert (= (and start!36350 res!202858) b!363693))

(assert (= (and b!363693 res!202855) b!363696))

(assert (= (and b!363696 res!202857) b!363695))

(assert (= (and b!363695 res!202854) b!363697))

(assert (= (and b!363697 res!202856) b!363694))

(declare-fun m!360835 () Bool)

(assert (=> b!363694 m!360835))

(declare-fun m!360837 () Bool)

(assert (=> b!363694 m!360837))

(declare-fun m!360839 () Bool)

(assert (=> b!363694 m!360839))

(declare-fun m!360841 () Bool)

(assert (=> b!363694 m!360841))

(declare-fun m!360843 () Bool)

(assert (=> b!363694 m!360843))

(declare-fun m!360845 () Bool)

(assert (=> b!363694 m!360845))

(declare-fun m!360847 () Bool)

(assert (=> start!36350 m!360847))

(declare-fun m!360849 () Bool)

(assert (=> b!363693 m!360849))

(assert (=> b!363693 m!360849))

(declare-fun m!360851 () Bool)

(assert (=> b!363693 m!360851))

(declare-fun m!360853 () Bool)

(assert (=> b!363696 m!360853))

(declare-fun m!360855 () Bool)

(assert (=> b!363697 m!360855))

(declare-fun m!360857 () Bool)

(assert (=> b!363697 m!360857))

(declare-fun m!360859 () Bool)

(assert (=> b!363697 m!360859))

(check-sat (not b!363697) (not b!363694) (not start!36350) (not b!363696) (not b!363693))
(check-sat)
