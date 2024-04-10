; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36458 () Bool)

(assert start!36458)

(declare-fun b!364530 () Bool)

(declare-fun res!203693 () Bool)

(declare-fun e!223145 () Bool)

(assert (=> b!364530 (=> (not res!203693) (not e!223145))))

(declare-datatypes ((array!20738 0))(
  ( (array!20739 (arr!9848 (Array (_ BitVec 32) (_ BitVec 64))) (size!10200 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20738)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364530 (= res!203693 (not (validKeyInArray!0 (select (arr!9848 a!4289) i!1472))))))

(declare-fun b!364531 () Bool)

(declare-fun res!203694 () Bool)

(assert (=> b!364531 (=> (not res!203694) (not e!223145))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364531 (= res!203694 (validKeyInArray!0 k0!2974))))

(declare-fun b!364532 () Bool)

(declare-fun res!203695 () Bool)

(assert (=> b!364532 (=> (not res!203695) (not e!223145))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364532 (= res!203695 (and (bvslt (size!10200 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10200 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203692 () Bool)

(assert (=> start!36458 (=> (not res!203692) (not e!223145))))

(assert (=> start!36458 (= res!203692 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10200 a!4289))))))

(assert (=> start!36458 e!223145))

(assert (=> start!36458 true))

(declare-fun array_inv!7290 (array!20738) Bool)

(assert (=> start!36458 (array_inv!7290 a!4289)))

(declare-fun b!364533 () Bool)

(declare-fun e!223147 () Bool)

(assert (=> b!364533 (= e!223147 (not true))))

(declare-fun lt!168543 () array!20738)

(declare-fun lt!168545 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20738 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364533 (= (bvadd (arrayCountValidKeys!0 lt!168543 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168545) (arrayCountValidKeys!0 lt!168543 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11330 0))(
  ( (Unit!11331) )
))
(declare-fun lt!168544 () Unit!11330)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11330)

(assert (=> b!364533 (= lt!168544 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168543 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168547 () (_ BitVec 32))

(assert (=> b!364533 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168547) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168546 () Unit!11330)

(assert (=> b!364533 (= lt!168546 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364534 () Bool)

(assert (=> b!364534 (= e!223145 e!223147)))

(declare-fun res!203691 () Bool)

(assert (=> b!364534 (=> (not res!203691) (not e!223147))))

(assert (=> b!364534 (= res!203691 (and (= lt!168545 (bvadd #b00000000000000000000000000000001 lt!168547)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364534 (= lt!168545 (arrayCountValidKeys!0 lt!168543 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364534 (= lt!168547 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364534 (= lt!168543 (array!20739 (store (arr!9848 a!4289) i!1472 k0!2974) (size!10200 a!4289)))))

(assert (= (and start!36458 res!203692) b!364530))

(assert (= (and b!364530 res!203693) b!364531))

(assert (= (and b!364531 res!203694) b!364532))

(assert (= (and b!364532 res!203695) b!364534))

(assert (= (and b!364534 res!203691) b!364533))

(declare-fun m!362059 () Bool)

(assert (=> b!364534 m!362059))

(declare-fun m!362061 () Bool)

(assert (=> b!364534 m!362061))

(declare-fun m!362063 () Bool)

(assert (=> b!364534 m!362063))

(declare-fun m!362065 () Bool)

(assert (=> b!364530 m!362065))

(assert (=> b!364530 m!362065))

(declare-fun m!362067 () Bool)

(assert (=> b!364530 m!362067))

(declare-fun m!362069 () Bool)

(assert (=> b!364533 m!362069))

(declare-fun m!362071 () Bool)

(assert (=> b!364533 m!362071))

(declare-fun m!362073 () Bool)

(assert (=> b!364533 m!362073))

(declare-fun m!362075 () Bool)

(assert (=> b!364533 m!362075))

(declare-fun m!362077 () Bool)

(assert (=> b!364533 m!362077))

(declare-fun m!362079 () Bool)

(assert (=> b!364533 m!362079))

(declare-fun m!362081 () Bool)

(assert (=> start!36458 m!362081))

(declare-fun m!362083 () Bool)

(assert (=> b!364531 m!362083))

(check-sat (not b!364531) (not b!364534) (not start!36458) (not b!364533) (not b!364530))
(check-sat)
