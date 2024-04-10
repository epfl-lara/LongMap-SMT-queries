; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36342 () Bool)

(assert start!36342)

(declare-fun b!363626 () Bool)

(declare-fun res!202792 () Bool)

(declare-fun e!222643 () Bool)

(assert (=> b!363626 (=> (not res!202792) (not e!222643))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363626 (= res!202792 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!363627 () Bool)

(declare-fun res!202791 () Bool)

(declare-fun e!222641 () Bool)

(assert (=> b!363627 (=> (not res!202791) (not e!222641))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363627 (= res!202791 (validKeyInArray!0 k!2974))))

(declare-fun b!363628 () Bool)

(declare-fun res!202789 () Bool)

(assert (=> b!363628 (=> (not res!202789) (not e!222641))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20622 0))(
  ( (array!20623 (arr!9790 (Array (_ BitVec 32) (_ BitVec 64))) (size!10142 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20622)

(assert (=> b!363628 (= res!202789 (and (bvslt (size!10142 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10142 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363629 () Bool)

(declare-fun res!202787 () Bool)

(assert (=> b!363629 (=> (not res!202787) (not e!222641))))

(assert (=> b!363629 (= res!202787 (not (validKeyInArray!0 (select (arr!9790 a!4289) i!1472))))))

(declare-fun b!363630 () Bool)

(assert (=> b!363630 (= e!222641 e!222643)))

(declare-fun res!202790 () Bool)

(assert (=> b!363630 (=> (not res!202790) (not e!222643))))

(declare-fun lt!167784 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20622 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363630 (= res!202790 (= (arrayCountValidKeys!0 (array!20623 (store (arr!9790 a!4289) i!1472 k!2974) (size!10142 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!167784)))))

(assert (=> b!363630 (= lt!167784 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!363631 () Bool)

(assert (=> b!363631 (= e!222643 (not true))))

(assert (=> b!363631 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167784) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11250 0))(
  ( (Unit!11251) )
))
(declare-fun lt!167785 () Unit!11250)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11250)

(assert (=> b!363631 (= lt!167785 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202788 () Bool)

(assert (=> start!36342 (=> (not res!202788) (not e!222641))))

(assert (=> start!36342 (= res!202788 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10142 a!4289))))))

(assert (=> start!36342 e!222641))

(assert (=> start!36342 true))

(declare-fun array_inv!7232 (array!20622) Bool)

(assert (=> start!36342 (array_inv!7232 a!4289)))

(assert (= (and start!36342 res!202788) b!363629))

(assert (= (and b!363629 res!202787) b!363627))

(assert (= (and b!363627 res!202791) b!363628))

(assert (= (and b!363628 res!202789) b!363630))

(assert (= (and b!363630 res!202790) b!363626))

(assert (= (and b!363626 res!202792) b!363631))

(declare-fun m!360749 () Bool)

(assert (=> b!363630 m!360749))

(declare-fun m!360751 () Bool)

(assert (=> b!363630 m!360751))

(declare-fun m!360753 () Bool)

(assert (=> b!363630 m!360753))

(declare-fun m!360755 () Bool)

(assert (=> b!363631 m!360755))

(declare-fun m!360757 () Bool)

(assert (=> b!363631 m!360757))

(declare-fun m!360759 () Bool)

(assert (=> b!363631 m!360759))

(declare-fun m!360761 () Bool)

(assert (=> start!36342 m!360761))

(declare-fun m!360763 () Bool)

(assert (=> b!363627 m!360763))

(declare-fun m!360765 () Bool)

(assert (=> b!363629 m!360765))

(assert (=> b!363629 m!360765))

(declare-fun m!360767 () Bool)

(assert (=> b!363629 m!360767))

(push 1)

(assert (not b!363631))

(assert (not b!363630))

(assert (not b!363627))

(assert (not start!36342))

(assert (not b!363629))

(check-sat)

