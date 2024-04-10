; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36346 () Bool)

(assert start!36346)

(declare-fun b!363662 () Bool)

(declare-fun e!222659 () Bool)

(assert (=> b!363662 (= e!222659 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!167796 () (_ BitVec 32))

(declare-datatypes ((array!20626 0))(
  ( (array!20627 (arr!9792 (Array (_ BitVec 32) (_ BitVec 64))) (size!10144 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20626)

(declare-fun arrayCountValidKeys!0 (array!20626 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363662 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167796) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11254 0))(
  ( (Unit!11255) )
))
(declare-fun lt!167797 () Unit!11254)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11254)

(assert (=> b!363662 (= lt!167797 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202825 () Bool)

(declare-fun e!222660 () Bool)

(assert (=> start!36346 (=> (not res!202825) (not e!222660))))

(assert (=> start!36346 (= res!202825 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10144 a!4289))))))

(assert (=> start!36346 e!222660))

(assert (=> start!36346 true))

(declare-fun array_inv!7234 (array!20626) Bool)

(assert (=> start!36346 (array_inv!7234 a!4289)))

(declare-fun b!363663 () Bool)

(assert (=> b!363663 (= e!222660 e!222659)))

(declare-fun res!202827 () Bool)

(assert (=> b!363663 (=> (not res!202827) (not e!222659))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363663 (= res!202827 (= (arrayCountValidKeys!0 (array!20627 (store (arr!9792 a!4289) i!1472 k!2974) (size!10144 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!167796)))))

(assert (=> b!363663 (= lt!167796 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!363664 () Bool)

(declare-fun res!202826 () Bool)

(assert (=> b!363664 (=> (not res!202826) (not e!222660))))

(assert (=> b!363664 (= res!202826 (and (bvslt (size!10144 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10144 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363665 () Bool)

(declare-fun res!202824 () Bool)

(assert (=> b!363665 (=> (not res!202824) (not e!222660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363665 (= res!202824 (not (validKeyInArray!0 (select (arr!9792 a!4289) i!1472))))))

(declare-fun b!363666 () Bool)

(declare-fun res!202823 () Bool)

(assert (=> b!363666 (=> (not res!202823) (not e!222660))))

(assert (=> b!363666 (= res!202823 (validKeyInArray!0 k!2974))))

(declare-fun b!363667 () Bool)

(declare-fun res!202828 () Bool)

(assert (=> b!363667 (=> (not res!202828) (not e!222659))))

(assert (=> b!363667 (= res!202828 (bvsgt from!3650 #b00000000000000000000000000000000))))

(assert (= (and start!36346 res!202825) b!363665))

(assert (= (and b!363665 res!202824) b!363666))

(assert (= (and b!363666 res!202823) b!363664))

(assert (= (and b!363664 res!202826) b!363663))

(assert (= (and b!363663 res!202827) b!363667))

(assert (= (and b!363667 res!202828) b!363662))

(declare-fun m!360789 () Bool)

(assert (=> b!363666 m!360789))

(declare-fun m!360791 () Bool)

(assert (=> b!363665 m!360791))

(assert (=> b!363665 m!360791))

(declare-fun m!360793 () Bool)

(assert (=> b!363665 m!360793))

(declare-fun m!360795 () Bool)

(assert (=> b!363663 m!360795))

(declare-fun m!360797 () Bool)

(assert (=> b!363663 m!360797))

(declare-fun m!360799 () Bool)

(assert (=> b!363663 m!360799))

(declare-fun m!360801 () Bool)

(assert (=> start!36346 m!360801))

(declare-fun m!360803 () Bool)

(assert (=> b!363662 m!360803))

(declare-fun m!360805 () Bool)

(assert (=> b!363662 m!360805))

(declare-fun m!360807 () Bool)

(assert (=> b!363662 m!360807))

(push 1)

(assert (not b!363665))

(assert (not start!36346))

(assert (not b!363663))

(assert (not b!363662))

(assert (not b!363666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

