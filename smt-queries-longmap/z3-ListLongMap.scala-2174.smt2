; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36364 () Bool)

(assert start!36364)

(declare-fun b!363854 () Bool)

(declare-fun e!222773 () Bool)

(declare-fun e!222772 () Bool)

(assert (=> b!363854 (= e!222773 e!222772)))

(declare-fun res!203061 () Bool)

(assert (=> b!363854 (=> (not res!203061) (not e!222772))))

(declare-fun lt!168055 () (_ BitVec 32))

(declare-fun lt!168054 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363854 (= res!203061 (and (= lt!168054 (bvadd #b00000000000000000000000000000001 lt!168055)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20639 0))(
  ( (array!20640 (arr!9798 (Array (_ BitVec 32) (_ BitVec 64))) (size!10150 (_ BitVec 32))) )
))
(declare-fun lt!168053 () array!20639)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363854 (= lt!168054 (arrayCountValidKeys!0 lt!168053 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20639)

(assert (=> b!363854 (= lt!168055 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363854 (= lt!168053 (array!20640 (store (arr!9798 a!4289) i!1472 k0!2974) (size!10150 a!4289)))))

(declare-fun b!363855 () Bool)

(declare-fun res!203062 () Bool)

(assert (=> b!363855 (=> (not res!203062) (not e!222773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363855 (= res!203062 (validKeyInArray!0 k0!2974))))

(declare-fun res!203064 () Bool)

(assert (=> start!36364 (=> (not res!203064) (not e!222773))))

(assert (=> start!36364 (= res!203064 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10150 a!4289))))))

(assert (=> start!36364 e!222773))

(assert (=> start!36364 true))

(declare-fun array_inv!7270 (array!20639) Bool)

(assert (=> start!36364 (array_inv!7270 a!4289)))

(declare-fun b!363856 () Bool)

(assert (=> b!363856 (= e!222772 (not true))))

(assert (=> b!363856 (= (bvadd (arrayCountValidKeys!0 lt!168053 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168054) (arrayCountValidKeys!0 lt!168053 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11275 0))(
  ( (Unit!11276) )
))
(declare-fun lt!168052 () Unit!11275)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11275)

(assert (=> b!363856 (= lt!168052 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168053 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363856 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168055) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168056 () Unit!11275)

(assert (=> b!363856 (= lt!168056 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363857 () Bool)

(declare-fun res!203065 () Bool)

(assert (=> b!363857 (=> (not res!203065) (not e!222773))))

(assert (=> b!363857 (= res!203065 (not (validKeyInArray!0 (select (arr!9798 a!4289) i!1472))))))

(declare-fun b!363858 () Bool)

(declare-fun res!203063 () Bool)

(assert (=> b!363858 (=> (not res!203063) (not e!222773))))

(assert (=> b!363858 (= res!203063 (and (bvslt (size!10150 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10150 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36364 res!203064) b!363857))

(assert (= (and b!363857 res!203065) b!363855))

(assert (= (and b!363855 res!203062) b!363858))

(assert (= (and b!363858 res!203063) b!363854))

(assert (= (and b!363854 res!203061) b!363856))

(declare-fun m!361429 () Bool)

(assert (=> b!363856 m!361429))

(declare-fun m!361431 () Bool)

(assert (=> b!363856 m!361431))

(declare-fun m!361433 () Bool)

(assert (=> b!363856 m!361433))

(declare-fun m!361435 () Bool)

(assert (=> b!363856 m!361435))

(declare-fun m!361437 () Bool)

(assert (=> b!363856 m!361437))

(declare-fun m!361439 () Bool)

(assert (=> b!363856 m!361439))

(declare-fun m!361441 () Bool)

(assert (=> start!36364 m!361441))

(declare-fun m!361443 () Bool)

(assert (=> b!363855 m!361443))

(declare-fun m!361445 () Bool)

(assert (=> b!363854 m!361445))

(declare-fun m!361447 () Bool)

(assert (=> b!363854 m!361447))

(declare-fun m!361449 () Bool)

(assert (=> b!363854 m!361449))

(declare-fun m!361451 () Bool)

(assert (=> b!363857 m!361451))

(assert (=> b!363857 m!361451))

(declare-fun m!361453 () Bool)

(assert (=> b!363857 m!361453))

(check-sat (not b!363855) (not b!363856) (not b!363857) (not b!363854) (not start!36364))
(check-sat)
