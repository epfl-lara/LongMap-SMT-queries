; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36446 () Bool)

(assert start!36446)

(declare-fun b!364427 () Bool)

(declare-fun e!223091 () Bool)

(declare-fun e!223093 () Bool)

(assert (=> b!364427 (= e!223091 e!223093)))

(declare-fun res!203588 () Bool)

(assert (=> b!364427 (=> (not res!203588) (not e!223093))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!168492 () (_ BitVec 32))

(declare-datatypes ((array!20726 0))(
  ( (array!20727 (arr!9842 (Array (_ BitVec 32) (_ BitVec 64))) (size!10194 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20726)

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20726 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364427 (= res!203588 (= (arrayCountValidKeys!0 (array!20727 (store (arr!9842 a!4289) i!1472 k0!2974) (size!10194 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168492)))))

(assert (=> b!364427 (= lt!168492 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364428 () Bool)

(declare-fun res!203591 () Bool)

(assert (=> b!364428 (=> (not res!203591) (not e!223091))))

(assert (=> b!364428 (= res!203591 (and (bvslt (size!10194 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10194 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364429 () Bool)

(declare-fun res!203589 () Bool)

(assert (=> b!364429 (=> (not res!203589) (not e!223091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364429 (= res!203589 (validKeyInArray!0 k0!2974))))

(declare-fun res!203593 () Bool)

(assert (=> start!36446 (=> (not res!203593) (not e!223091))))

(assert (=> start!36446 (= res!203593 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10194 a!4289))))))

(assert (=> start!36446 e!223091))

(assert (=> start!36446 true))

(declare-fun array_inv!7284 (array!20726) Bool)

(assert (=> start!36446 (array_inv!7284 a!4289)))

(declare-fun b!364430 () Bool)

(declare-fun res!203592 () Bool)

(assert (=> b!364430 (=> (not res!203592) (not e!223093))))

(assert (=> b!364430 (= res!203592 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!364431 () Bool)

(assert (=> b!364431 (= e!223093 (not true))))

(assert (=> b!364431 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168492) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11318 0))(
  ( (Unit!11319) )
))
(declare-fun lt!168493 () Unit!11318)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11318)

(assert (=> b!364431 (= lt!168493 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364432 () Bool)

(declare-fun res!203590 () Bool)

(assert (=> b!364432 (=> (not res!203590) (not e!223091))))

(assert (=> b!364432 (= res!203590 (not (validKeyInArray!0 (select (arr!9842 a!4289) i!1472))))))

(assert (= (and start!36446 res!203593) b!364432))

(assert (= (and b!364432 res!203590) b!364429))

(assert (= (and b!364429 res!203589) b!364428))

(assert (= (and b!364428 res!203591) b!364427))

(assert (= (and b!364427 res!203588) b!364430))

(assert (= (and b!364430 res!203592) b!364431))

(declare-fun m!361933 () Bool)

(assert (=> start!36446 m!361933))

(declare-fun m!361935 () Bool)

(assert (=> b!364432 m!361935))

(assert (=> b!364432 m!361935))

(declare-fun m!361937 () Bool)

(assert (=> b!364432 m!361937))

(declare-fun m!361939 () Bool)

(assert (=> b!364431 m!361939))

(declare-fun m!361941 () Bool)

(assert (=> b!364431 m!361941))

(declare-fun m!361943 () Bool)

(assert (=> b!364431 m!361943))

(declare-fun m!361945 () Bool)

(assert (=> b!364429 m!361945))

(declare-fun m!361947 () Bool)

(assert (=> b!364427 m!361947))

(declare-fun m!361949 () Bool)

(assert (=> b!364427 m!361949))

(declare-fun m!361951 () Bool)

(assert (=> b!364427 m!361951))

(check-sat (not b!364432) (not b!364427) (not start!36446) (not b!364429) (not b!364431))
(check-sat)
