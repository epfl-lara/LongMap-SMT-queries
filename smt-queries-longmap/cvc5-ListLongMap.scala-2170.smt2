; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36354 () Bool)

(assert start!36354)

(declare-fun res!202886 () Bool)

(declare-fun e!222697 () Bool)

(assert (=> start!36354 (=> (not res!202886) (not e!222697))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20634 0))(
  ( (array!20635 (arr!9796 (Array (_ BitVec 32) (_ BitVec 64))) (size!10148 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20634)

(assert (=> start!36354 (= res!202886 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10148 a!4289))))))

(assert (=> start!36354 e!222697))

(assert (=> start!36354 true))

(declare-fun array_inv!7238 (array!20634) Bool)

(assert (=> start!36354 (array_inv!7238 a!4289)))

(declare-fun b!363723 () Bool)

(declare-fun res!202885 () Bool)

(assert (=> b!363723 (=> (not res!202885) (not e!222697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363723 (= res!202885 (not (validKeyInArray!0 (select (arr!9796 a!4289) i!1472))))))

(declare-fun b!363724 () Bool)

(declare-fun res!202884 () Bool)

(assert (=> b!363724 (=> (not res!202884) (not e!222697))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363724 (= res!202884 (and (bvslt (size!10148 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10148 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363725 () Bool)

(declare-fun e!222695 () Bool)

(assert (=> b!363725 (= e!222695 (not true))))

(declare-fun lt!167854 () (_ BitVec 32))

(declare-fun lt!167857 () array!20634)

(declare-fun arrayCountValidKeys!0 (array!20634 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363725 (= (bvadd (arrayCountValidKeys!0 lt!167857 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167854) (arrayCountValidKeys!0 lt!167857 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11262 0))(
  ( (Unit!11263) )
))
(declare-fun lt!167856 () Unit!11262)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11262)

(assert (=> b!363725 (= lt!167856 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167857 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167853 () (_ BitVec 32))

(assert (=> b!363725 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167853) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167855 () Unit!11262)

(assert (=> b!363725 (= lt!167855 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363726 () Bool)

(declare-fun res!202888 () Bool)

(assert (=> b!363726 (=> (not res!202888) (not e!222697))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363726 (= res!202888 (validKeyInArray!0 k!2974))))

(declare-fun b!363727 () Bool)

(assert (=> b!363727 (= e!222697 e!222695)))

(declare-fun res!202887 () Bool)

(assert (=> b!363727 (=> (not res!202887) (not e!222695))))

(assert (=> b!363727 (= res!202887 (and (= lt!167854 (bvadd #b00000000000000000000000000000001 lt!167853)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363727 (= lt!167854 (arrayCountValidKeys!0 lt!167857 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363727 (= lt!167853 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363727 (= lt!167857 (array!20635 (store (arr!9796 a!4289) i!1472 k!2974) (size!10148 a!4289)))))

(assert (= (and start!36354 res!202886) b!363723))

(assert (= (and b!363723 res!202885) b!363726))

(assert (= (and b!363726 res!202888) b!363724))

(assert (= (and b!363724 res!202884) b!363727))

(assert (= (and b!363727 res!202887) b!363725))

(declare-fun m!360887 () Bool)

(assert (=> b!363725 m!360887))

(declare-fun m!360889 () Bool)

(assert (=> b!363725 m!360889))

(declare-fun m!360891 () Bool)

(assert (=> b!363725 m!360891))

(declare-fun m!360893 () Bool)

(assert (=> b!363725 m!360893))

(declare-fun m!360895 () Bool)

(assert (=> b!363725 m!360895))

(declare-fun m!360897 () Bool)

(assert (=> b!363725 m!360897))

(declare-fun m!360899 () Bool)

(assert (=> start!36354 m!360899))

(declare-fun m!360901 () Bool)

(assert (=> b!363726 m!360901))

(declare-fun m!360903 () Bool)

(assert (=> b!363723 m!360903))

(assert (=> b!363723 m!360903))

(declare-fun m!360905 () Bool)

(assert (=> b!363723 m!360905))

(declare-fun m!360907 () Bool)

(assert (=> b!363727 m!360907))

(declare-fun m!360909 () Bool)

(assert (=> b!363727 m!360909))

(declare-fun m!360911 () Bool)

(assert (=> b!363727 m!360911))

(push 1)

(assert (not b!363725))

(assert (not b!363727))

(assert (not b!363723))

(assert (not start!36354))

(assert (not b!363726))

(check-sat)

