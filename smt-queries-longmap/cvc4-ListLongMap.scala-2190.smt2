; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36462 () Bool)

(assert start!36462)

(declare-fun b!364394 () Bool)

(declare-fun res!203698 () Bool)

(declare-fun e!223053 () Bool)

(assert (=> b!364394 (=> (not res!203698) (not e!223053))))

(declare-datatypes ((array!20738 0))(
  ( (array!20739 (arr!9848 (Array (_ BitVec 32) (_ BitVec 64))) (size!10201 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20738)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364394 (= res!203698 (not (validKeyInArray!0 (select (arr!9848 a!4289) i!1472))))))

(declare-fun res!203701 () Bool)

(assert (=> start!36462 (=> (not res!203701) (not e!223053))))

(assert (=> start!36462 (= res!203701 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10201 a!4289))))))

(assert (=> start!36462 e!223053))

(assert (=> start!36462 true))

(declare-fun array_inv!7297 (array!20738) Bool)

(assert (=> start!36462 (array_inv!7297 a!4289)))

(declare-fun b!364395 () Bool)

(declare-fun e!223052 () Bool)

(assert (=> b!364395 (= e!223052 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168446 () (_ BitVec 32))

(declare-fun lt!168448 () array!20738)

(declare-fun arrayCountValidKeys!0 (array!20738 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364395 (= (bvadd (arrayCountValidKeys!0 lt!168448 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168446) (arrayCountValidKeys!0 lt!168448 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11326 0))(
  ( (Unit!11327) )
))
(declare-fun lt!168444 () Unit!11326)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11326)

(assert (=> b!364395 (= lt!168444 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168448 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168447 () (_ BitVec 32))

(assert (=> b!364395 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168447) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168445 () Unit!11326)

(assert (=> b!364395 (= lt!168445 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364396 () Bool)

(declare-fun res!203697 () Bool)

(assert (=> b!364396 (=> (not res!203697) (not e!223053))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364396 (= res!203697 (validKeyInArray!0 k!2974))))

(declare-fun b!364397 () Bool)

(declare-fun res!203699 () Bool)

(assert (=> b!364397 (=> (not res!203699) (not e!223053))))

(assert (=> b!364397 (= res!203699 (and (bvslt (size!10201 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10201 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364398 () Bool)

(assert (=> b!364398 (= e!223053 e!223052)))

(declare-fun res!203700 () Bool)

(assert (=> b!364398 (=> (not res!203700) (not e!223052))))

(assert (=> b!364398 (= res!203700 (and (= lt!168446 (bvadd #b00000000000000000000000000000001 lt!168447)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364398 (= lt!168446 (arrayCountValidKeys!0 lt!168448 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364398 (= lt!168447 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364398 (= lt!168448 (array!20739 (store (arr!9848 a!4289) i!1472 k!2974) (size!10201 a!4289)))))

(assert (= (and start!36462 res!203701) b!364394))

(assert (= (and b!364394 res!203698) b!364396))

(assert (= (and b!364396 res!203697) b!364397))

(assert (= (and b!364397 res!203699) b!364398))

(assert (= (and b!364398 res!203700) b!364395))

(declare-fun m!361569 () Bool)

(assert (=> b!364396 m!361569))

(declare-fun m!361571 () Bool)

(assert (=> start!36462 m!361571))

(declare-fun m!361573 () Bool)

(assert (=> b!364394 m!361573))

(assert (=> b!364394 m!361573))

(declare-fun m!361575 () Bool)

(assert (=> b!364394 m!361575))

(declare-fun m!361577 () Bool)

(assert (=> b!364398 m!361577))

(declare-fun m!361579 () Bool)

(assert (=> b!364398 m!361579))

(declare-fun m!361581 () Bool)

(assert (=> b!364398 m!361581))

(declare-fun m!361583 () Bool)

(assert (=> b!364395 m!361583))

(declare-fun m!361585 () Bool)

(assert (=> b!364395 m!361585))

(declare-fun m!361587 () Bool)

(assert (=> b!364395 m!361587))

(declare-fun m!361589 () Bool)

(assert (=> b!364395 m!361589))

(declare-fun m!361591 () Bool)

(assert (=> b!364395 m!361591))

(declare-fun m!361593 () Bool)

(assert (=> b!364395 m!361593))

(push 1)

(assert (not b!364398))

(assert (not b!364394))

(assert (not b!364395))

(assert (not start!36462))

(assert (not b!364396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

