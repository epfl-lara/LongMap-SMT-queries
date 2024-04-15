; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36454 () Bool)

(assert start!36454)

(declare-fun b!364334 () Bool)

(declare-fun res!203640 () Bool)

(declare-fun e!223017 () Bool)

(assert (=> b!364334 (=> (not res!203640) (not e!223017))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364334 (= res!203640 (validKeyInArray!0 k0!2974))))

(declare-fun b!364335 () Bool)

(declare-fun e!223018 () Bool)

(assert (=> b!364335 (= e!223018 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168388 () (_ BitVec 32))

(declare-datatypes ((array!20730 0))(
  ( (array!20731 (arr!9844 (Array (_ BitVec 32) (_ BitVec 64))) (size!10197 (_ BitVec 32))) )
))
(declare-fun lt!168386 () array!20730)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20730 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364335 (= (bvadd (arrayCountValidKeys!0 lt!168386 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168388) (arrayCountValidKeys!0 lt!168386 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11318 0))(
  ( (Unit!11319) )
))
(declare-fun lt!168385 () Unit!11318)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11318)

(assert (=> b!364335 (= lt!168385 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168386 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168384 () (_ BitVec 32))

(declare-fun a!4289 () array!20730)

(assert (=> b!364335 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168384) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168387 () Unit!11318)

(assert (=> b!364335 (= lt!168387 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364336 () Bool)

(assert (=> b!364336 (= e!223017 e!223018)))

(declare-fun res!203638 () Bool)

(assert (=> b!364336 (=> (not res!203638) (not e!223018))))

(assert (=> b!364336 (= res!203638 (and (= lt!168388 (bvadd #b00000000000000000000000000000001 lt!168384)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364336 (= lt!168388 (arrayCountValidKeys!0 lt!168386 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364336 (= lt!168384 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364336 (= lt!168386 (array!20731 (store (arr!9844 a!4289) i!1472 k0!2974) (size!10197 a!4289)))))

(declare-fun res!203637 () Bool)

(assert (=> start!36454 (=> (not res!203637) (not e!223017))))

(assert (=> start!36454 (= res!203637 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10197 a!4289))))))

(assert (=> start!36454 e!223017))

(assert (=> start!36454 true))

(declare-fun array_inv!7293 (array!20730) Bool)

(assert (=> start!36454 (array_inv!7293 a!4289)))

(declare-fun b!364337 () Bool)

(declare-fun res!203641 () Bool)

(assert (=> b!364337 (=> (not res!203641) (not e!223017))))

(assert (=> b!364337 (= res!203641 (not (validKeyInArray!0 (select (arr!9844 a!4289) i!1472))))))

(declare-fun b!364338 () Bool)

(declare-fun res!203639 () Bool)

(assert (=> b!364338 (=> (not res!203639) (not e!223017))))

(assert (=> b!364338 (= res!203639 (and (bvslt (size!10197 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10197 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36454 res!203637) b!364337))

(assert (= (and b!364337 res!203641) b!364334))

(assert (= (and b!364334 res!203640) b!364338))

(assert (= (and b!364338 res!203639) b!364336))

(assert (= (and b!364336 res!203638) b!364335))

(declare-fun m!361465 () Bool)

(assert (=> start!36454 m!361465))

(declare-fun m!361467 () Bool)

(assert (=> b!364335 m!361467))

(declare-fun m!361469 () Bool)

(assert (=> b!364335 m!361469))

(declare-fun m!361471 () Bool)

(assert (=> b!364335 m!361471))

(declare-fun m!361473 () Bool)

(assert (=> b!364335 m!361473))

(declare-fun m!361475 () Bool)

(assert (=> b!364335 m!361475))

(declare-fun m!361477 () Bool)

(assert (=> b!364335 m!361477))

(declare-fun m!361479 () Bool)

(assert (=> b!364336 m!361479))

(declare-fun m!361481 () Bool)

(assert (=> b!364336 m!361481))

(declare-fun m!361483 () Bool)

(assert (=> b!364336 m!361483))

(declare-fun m!361485 () Bool)

(assert (=> b!364334 m!361485))

(declare-fun m!361487 () Bool)

(assert (=> b!364337 m!361487))

(assert (=> b!364337 m!361487))

(declare-fun m!361489 () Bool)

(assert (=> b!364337 m!361489))

(check-sat (not b!364335) (not b!364334) (not b!364337) (not start!36454) (not b!364336))
(check-sat)
