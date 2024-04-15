; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36360 () Bool)

(assert start!36360)

(declare-fun res!202905 () Bool)

(declare-fun e!222613 () Bool)

(assert (=> start!36360 (=> (not res!202905) (not e!222613))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20636 0))(
  ( (array!20637 (arr!9797 (Array (_ BitVec 32) (_ BitVec 64))) (size!10150 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20636)

(assert (=> start!36360 (= res!202905 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10150 a!4289))))))

(assert (=> start!36360 e!222613))

(assert (=> start!36360 true))

(declare-fun array_inv!7246 (array!20636) Bool)

(assert (=> start!36360 (array_inv!7246 a!4289)))

(declare-fun b!363602 () Bool)

(declare-fun res!202907 () Bool)

(assert (=> b!363602 (=> (not res!202907) (not e!222613))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363602 (= res!202907 (and (bvslt (size!10150 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10150 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363603 () Bool)

(declare-fun res!202906 () Bool)

(assert (=> b!363603 (=> (not res!202906) (not e!222613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363603 (= res!202906 (not (validKeyInArray!0 (select (arr!9797 a!4289) i!1472))))))

(declare-fun b!363604 () Bool)

(declare-fun e!222612 () Bool)

(assert (=> b!363604 (= e!222613 e!222612)))

(declare-fun res!202908 () Bool)

(assert (=> b!363604 (=> (not res!202908) (not e!222612))))

(declare-fun lt!167771 () (_ BitVec 32))

(declare-fun lt!167772 () (_ BitVec 32))

(assert (=> b!363604 (= res!202908 (and (= lt!167772 (bvadd #b00000000000000000000000000000001 lt!167771)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167773 () array!20636)

(declare-fun arrayCountValidKeys!0 (array!20636 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363604 (= lt!167772 (arrayCountValidKeys!0 lt!167773 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363604 (= lt!167771 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363604 (= lt!167773 (array!20637 (store (arr!9797 a!4289) i!1472 k!2974) (size!10150 a!4289)))))

(declare-fun b!363605 () Bool)

(assert (=> b!363605 (= e!222612 (not true))))

(assert (=> b!363605 (= (bvadd (arrayCountValidKeys!0 lt!167773 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167772) (arrayCountValidKeys!0 lt!167773 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11260 0))(
  ( (Unit!11261) )
))
(declare-fun lt!167769 () Unit!11260)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11260)

(assert (=> b!363605 (= lt!167769 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167773 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363605 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167771) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167770 () Unit!11260)

(assert (=> b!363605 (= lt!167770 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363606 () Bool)

(declare-fun res!202909 () Bool)

(assert (=> b!363606 (=> (not res!202909) (not e!222613))))

(assert (=> b!363606 (= res!202909 (validKeyInArray!0 k!2974))))

(assert (= (and start!36360 res!202905) b!363603))

(assert (= (and b!363603 res!202906) b!363606))

(assert (= (and b!363606 res!202909) b!363602))

(assert (= (and b!363602 res!202907) b!363604))

(assert (= (and b!363604 res!202908) b!363605))

(declare-fun m!360423 () Bool)

(assert (=> b!363605 m!360423))

(declare-fun m!360425 () Bool)

(assert (=> b!363605 m!360425))

(declare-fun m!360427 () Bool)

(assert (=> b!363605 m!360427))

(declare-fun m!360429 () Bool)

(assert (=> b!363605 m!360429))

(declare-fun m!360431 () Bool)

(assert (=> b!363605 m!360431))

(declare-fun m!360433 () Bool)

(assert (=> b!363605 m!360433))

(declare-fun m!360435 () Bool)

(assert (=> b!363603 m!360435))

(assert (=> b!363603 m!360435))

(declare-fun m!360437 () Bool)

(assert (=> b!363603 m!360437))

(declare-fun m!360439 () Bool)

(assert (=> b!363606 m!360439))

(declare-fun m!360441 () Bool)

(assert (=> start!36360 m!360441))

(declare-fun m!360443 () Bool)

(assert (=> b!363604 m!360443))

(declare-fun m!360445 () Bool)

(assert (=> b!363604 m!360445))

(declare-fun m!360447 () Bool)

(assert (=> b!363604 m!360447))

(push 1)

(assert (not b!363603))

(assert (not b!363606))

(assert (not b!363604))

(assert (not b!363605))

(assert (not start!36360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

