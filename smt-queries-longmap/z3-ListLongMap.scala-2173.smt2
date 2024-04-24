; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36358 () Bool)

(assert start!36358)

(declare-fun b!363809 () Bool)

(declare-fun res!203020 () Bool)

(declare-fun e!222746 () Bool)

(assert (=> b!363809 (=> (not res!203020) (not e!222746))))

(declare-datatypes ((array!20633 0))(
  ( (array!20634 (arr!9795 (Array (_ BitVec 32) (_ BitVec 64))) (size!10147 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20633)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363809 (= res!203020 (not (validKeyInArray!0 (select (arr!9795 a!4289) i!1472))))))

(declare-fun b!363810 () Bool)

(declare-fun res!203019 () Bool)

(assert (=> b!363810 (=> (not res!203019) (not e!222746))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363810 (= res!203019 (validKeyInArray!0 k0!2974))))

(declare-fun res!203018 () Bool)

(assert (=> start!36358 (=> (not res!203018) (not e!222746))))

(assert (=> start!36358 (= res!203018 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10147 a!4289))))))

(assert (=> start!36358 e!222746))

(assert (=> start!36358 true))

(declare-fun array_inv!7267 (array!20633) Bool)

(assert (=> start!36358 (array_inv!7267 a!4289)))

(declare-fun b!363811 () Bool)

(declare-fun res!203017 () Bool)

(assert (=> b!363811 (=> (not res!203017) (not e!222746))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363811 (= res!203017 (and (bvslt (size!10147 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10147 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363812 () Bool)

(declare-fun e!222745 () Bool)

(assert (=> b!363812 (= e!222746 e!222745)))

(declare-fun res!203016 () Bool)

(assert (=> b!363812 (=> (not res!203016) (not e!222745))))

(declare-fun lt!168007 () (_ BitVec 32))

(declare-fun lt!168011 () (_ BitVec 32))

(assert (=> b!363812 (= res!203016 (and (= lt!168007 (bvadd #b00000000000000000000000000000001 lt!168011)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168010 () array!20633)

(declare-fun arrayCountValidKeys!0 (array!20633 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363812 (= lt!168007 (arrayCountValidKeys!0 lt!168010 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363812 (= lt!168011 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363812 (= lt!168010 (array!20634 (store (arr!9795 a!4289) i!1472 k0!2974) (size!10147 a!4289)))))

(declare-fun b!363813 () Bool)

(assert (=> b!363813 (= e!222745 (not true))))

(assert (=> b!363813 (= (bvadd (arrayCountValidKeys!0 lt!168010 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168007) (arrayCountValidKeys!0 lt!168010 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11269 0))(
  ( (Unit!11270) )
))
(declare-fun lt!168009 () Unit!11269)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11269)

(assert (=> b!363813 (= lt!168009 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168010 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363813 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168011) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168008 () Unit!11269)

(assert (=> b!363813 (= lt!168008 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36358 res!203018) b!363809))

(assert (= (and b!363809 res!203020) b!363810))

(assert (= (and b!363810 res!203019) b!363811))

(assert (= (and b!363811 res!203017) b!363812))

(assert (= (and b!363812 res!203016) b!363813))

(declare-fun m!361351 () Bool)

(assert (=> b!363813 m!361351))

(declare-fun m!361353 () Bool)

(assert (=> b!363813 m!361353))

(declare-fun m!361355 () Bool)

(assert (=> b!363813 m!361355))

(declare-fun m!361357 () Bool)

(assert (=> b!363813 m!361357))

(declare-fun m!361359 () Bool)

(assert (=> b!363813 m!361359))

(declare-fun m!361361 () Bool)

(assert (=> b!363813 m!361361))

(declare-fun m!361363 () Bool)

(assert (=> start!36358 m!361363))

(declare-fun m!361365 () Bool)

(assert (=> b!363809 m!361365))

(assert (=> b!363809 m!361365))

(declare-fun m!361367 () Bool)

(assert (=> b!363809 m!361367))

(declare-fun m!361369 () Bool)

(assert (=> b!363810 m!361369))

(declare-fun m!361371 () Bool)

(assert (=> b!363812 m!361371))

(declare-fun m!361373 () Bool)

(assert (=> b!363812 m!361373))

(declare-fun m!361375 () Bool)

(assert (=> b!363812 m!361375))

(check-sat (not start!36358) (not b!363810) (not b!363813) (not b!363812) (not b!363809))
(check-sat)
