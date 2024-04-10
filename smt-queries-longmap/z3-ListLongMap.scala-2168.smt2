; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36344 () Bool)

(assert start!36344)

(declare-fun b!363644 () Bool)

(declare-fun e!222652 () Bool)

(assert (=> b!363644 (= e!222652 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!167791 () (_ BitVec 32))

(declare-datatypes ((array!20624 0))(
  ( (array!20625 (arr!9791 (Array (_ BitVec 32) (_ BitVec 64))) (size!10143 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20624)

(declare-fun arrayCountValidKeys!0 (array!20624 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363644 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167791) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11252 0))(
  ( (Unit!11253) )
))
(declare-fun lt!167790 () Unit!11252)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11252)

(assert (=> b!363644 (= lt!167790 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363645 () Bool)

(declare-fun res!202808 () Bool)

(declare-fun e!222650 () Bool)

(assert (=> b!363645 (=> (not res!202808) (not e!222650))))

(assert (=> b!363645 (= res!202808 (and (bvslt (size!10143 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10143 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363647 () Bool)

(declare-fun res!202809 () Bool)

(assert (=> b!363647 (=> (not res!202809) (not e!222650))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363647 (= res!202809 (validKeyInArray!0 k0!2974))))

(declare-fun res!202807 () Bool)

(assert (=> start!36344 (=> (not res!202807) (not e!222650))))

(assert (=> start!36344 (= res!202807 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10143 a!4289))))))

(assert (=> start!36344 e!222650))

(assert (=> start!36344 true))

(declare-fun array_inv!7233 (array!20624) Bool)

(assert (=> start!36344 (array_inv!7233 a!4289)))

(declare-fun b!363646 () Bool)

(declare-fun res!202805 () Bool)

(assert (=> b!363646 (=> (not res!202805) (not e!222652))))

(assert (=> b!363646 (= res!202805 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!363648 () Bool)

(declare-fun res!202806 () Bool)

(assert (=> b!363648 (=> (not res!202806) (not e!222650))))

(assert (=> b!363648 (= res!202806 (not (validKeyInArray!0 (select (arr!9791 a!4289) i!1472))))))

(declare-fun b!363649 () Bool)

(assert (=> b!363649 (= e!222650 e!222652)))

(declare-fun res!202810 () Bool)

(assert (=> b!363649 (=> (not res!202810) (not e!222652))))

(assert (=> b!363649 (= res!202810 (= (arrayCountValidKeys!0 (array!20625 (store (arr!9791 a!4289) i!1472 k0!2974) (size!10143 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!167791)))))

(assert (=> b!363649 (= lt!167791 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36344 res!202807) b!363648))

(assert (= (and b!363648 res!202806) b!363647))

(assert (= (and b!363647 res!202809) b!363645))

(assert (= (and b!363645 res!202808) b!363649))

(assert (= (and b!363649 res!202810) b!363646))

(assert (= (and b!363646 res!202805) b!363644))

(declare-fun m!360769 () Bool)

(assert (=> start!36344 m!360769))

(declare-fun m!360771 () Bool)

(assert (=> b!363649 m!360771))

(declare-fun m!360773 () Bool)

(assert (=> b!363649 m!360773))

(declare-fun m!360775 () Bool)

(assert (=> b!363649 m!360775))

(declare-fun m!360777 () Bool)

(assert (=> b!363648 m!360777))

(assert (=> b!363648 m!360777))

(declare-fun m!360779 () Bool)

(assert (=> b!363648 m!360779))

(declare-fun m!360781 () Bool)

(assert (=> b!363647 m!360781))

(declare-fun m!360783 () Bool)

(assert (=> b!363644 m!360783))

(declare-fun m!360785 () Bool)

(assert (=> b!363644 m!360785))

(declare-fun m!360787 () Bool)

(assert (=> b!363644 m!360787))

(check-sat (not start!36344) (not b!363647) (not b!363648) (not b!363649) (not b!363644))
(check-sat)
