; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36454 () Bool)

(assert start!36454)

(declare-fun b!364499 () Bool)

(declare-fun e!223128 () Bool)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364499 (= e!223128 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun lt!168516 () (_ BitVec 32))

(declare-datatypes ((array!20734 0))(
  ( (array!20735 (arr!9846 (Array (_ BitVec 32) (_ BitVec 64))) (size!10198 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20734)

(declare-fun arrayCountValidKeys!0 (array!20734 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364499 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168516) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11326 0))(
  ( (Unit!11327) )
))
(declare-fun lt!168517 () Unit!11326)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11326)

(assert (=> b!364499 (= lt!168517 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364500 () Bool)

(declare-fun res!203662 () Bool)

(declare-fun e!223127 () Bool)

(assert (=> b!364500 (=> (not res!203662) (not e!223127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364500 (= res!203662 (not (validKeyInArray!0 (select (arr!9846 a!4289) i!1472))))))

(declare-fun res!203660 () Bool)

(assert (=> start!36454 (=> (not res!203660) (not e!223127))))

(assert (=> start!36454 (= res!203660 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10198 a!4289))))))

(assert (=> start!36454 e!223127))

(assert (=> start!36454 true))

(declare-fun array_inv!7288 (array!20734) Bool)

(assert (=> start!36454 (array_inv!7288 a!4289)))

(declare-fun b!364501 () Bool)

(declare-fun res!203663 () Bool)

(assert (=> b!364501 (=> (not res!203663) (not e!223128))))

(assert (=> b!364501 (= res!203663 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!364502 () Bool)

(declare-fun res!203664 () Bool)

(assert (=> b!364502 (=> (not res!203664) (not e!223127))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364502 (= res!203664 (validKeyInArray!0 k!2974))))

(declare-fun b!364503 () Bool)

(assert (=> b!364503 (= e!223127 e!223128)))

(declare-fun res!203661 () Bool)

(assert (=> b!364503 (=> (not res!203661) (not e!223128))))

(assert (=> b!364503 (= res!203661 (= (arrayCountValidKeys!0 (array!20735 (store (arr!9846 a!4289) i!1472 k!2974) (size!10198 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168516)))))

(assert (=> b!364503 (= lt!168516 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364504 () Bool)

(declare-fun res!203665 () Bool)

(assert (=> b!364504 (=> (not res!203665) (not e!223127))))

(assert (=> b!364504 (= res!203665 (and (bvslt (size!10198 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10198 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36454 res!203660) b!364500))

(assert (= (and b!364500 res!203662) b!364502))

(assert (= (and b!364502 res!203664) b!364504))

(assert (= (and b!364504 res!203665) b!364503))

(assert (= (and b!364503 res!203661) b!364501))

(assert (= (and b!364501 res!203663) b!364499))

(declare-fun m!362013 () Bool)

(assert (=> b!364500 m!362013))

(assert (=> b!364500 m!362013))

(declare-fun m!362015 () Bool)

(assert (=> b!364500 m!362015))

(declare-fun m!362017 () Bool)

(assert (=> b!364499 m!362017))

(declare-fun m!362019 () Bool)

(assert (=> b!364499 m!362019))

(declare-fun m!362021 () Bool)

(assert (=> b!364499 m!362021))

(declare-fun m!362023 () Bool)

(assert (=> start!36454 m!362023))

(declare-fun m!362025 () Bool)

(assert (=> b!364502 m!362025))

(declare-fun m!362027 () Bool)

(assert (=> b!364503 m!362027))

(declare-fun m!362029 () Bool)

(assert (=> b!364503 m!362029))

(declare-fun m!362031 () Bool)

(assert (=> b!364503 m!362031))

(push 1)

(assert (not b!364500))

(assert (not b!364499))

(assert (not b!364502))

(assert (not b!364503))

(assert (not start!36454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

