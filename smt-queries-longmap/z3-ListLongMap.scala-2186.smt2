; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36436 () Bool)

(assert start!36436)

(declare-fun b!364414 () Bool)

(declare-fun res!203622 () Bool)

(declare-fun e!223077 () Bool)

(assert (=> b!364414 (=> (not res!203622) (not e!223077))))

(declare-datatypes ((array!20711 0))(
  ( (array!20712 (arr!9834 (Array (_ BitVec 32) (_ BitVec 64))) (size!10186 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20711)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364414 (= res!203622 (not (validKeyInArray!0 (select (arr!9834 a!4289) i!1472))))))

(declare-fun b!364415 () Bool)

(declare-fun res!203623 () Bool)

(assert (=> b!364415 (=> (not res!203623) (not e!223077))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364415 (= res!203623 (and (bvslt (size!10186 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10186 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364416 () Bool)

(declare-fun e!223079 () Bool)

(assert (=> b!364416 (= e!223077 e!223079)))

(declare-fun res!203624 () Bool)

(assert (=> b!364416 (=> (not res!203624) (not e!223079))))

(declare-fun lt!168523 () (_ BitVec 32))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20711 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364416 (= res!203624 (= (arrayCountValidKeys!0 (array!20712 (store (arr!9834 a!4289) i!1472 k0!2974) (size!10186 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168523)))))

(assert (=> b!364416 (= lt!168523 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364417 () Bool)

(declare-fun res!203626 () Bool)

(assert (=> b!364417 (=> (not res!203626) (not e!223077))))

(assert (=> b!364417 (= res!203626 (validKeyInArray!0 k0!2974))))

(declare-fun b!364419 () Bool)

(assert (=> b!364419 (= e!223079 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(assert (=> b!364419 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168523) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11311 0))(
  ( (Unit!11312) )
))
(declare-fun lt!168524 () Unit!11311)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11311)

(assert (=> b!364419 (= lt!168524 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203621 () Bool)

(assert (=> start!36436 (=> (not res!203621) (not e!223077))))

(assert (=> start!36436 (= res!203621 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10186 a!4289))))))

(assert (=> start!36436 e!223077))

(assert (=> start!36436 true))

(declare-fun array_inv!7306 (array!20711) Bool)

(assert (=> start!36436 (array_inv!7306 a!4289)))

(declare-fun b!364418 () Bool)

(declare-fun res!203625 () Bool)

(assert (=> b!364418 (=> (not res!203625) (not e!223079))))

(assert (=> b!364418 (= res!203625 (bvsgt from!3650 #b00000000000000000000000000000000))))

(assert (= (and start!36436 res!203621) b!364414))

(assert (= (and b!364414 res!203622) b!364417))

(assert (= (and b!364417 res!203626) b!364415))

(assert (= (and b!364415 res!203623) b!364416))

(assert (= (and b!364416 res!203624) b!364418))

(assert (= (and b!364418 res!203625) b!364419))

(declare-fun m!362203 () Bool)

(assert (=> b!364414 m!362203))

(assert (=> b!364414 m!362203))

(declare-fun m!362205 () Bool)

(assert (=> b!364414 m!362205))

(declare-fun m!362207 () Bool)

(assert (=> b!364416 m!362207))

(declare-fun m!362209 () Bool)

(assert (=> b!364416 m!362209))

(declare-fun m!362211 () Bool)

(assert (=> b!364416 m!362211))

(declare-fun m!362213 () Bool)

(assert (=> b!364419 m!362213))

(declare-fun m!362215 () Bool)

(assert (=> b!364419 m!362215))

(declare-fun m!362217 () Bool)

(assert (=> b!364419 m!362217))

(declare-fun m!362219 () Bool)

(assert (=> start!36436 m!362219))

(declare-fun m!362221 () Bool)

(assert (=> b!364417 m!362221))

(check-sat (not b!364419) (not b!364414) (not b!364416) (not start!36436) (not b!364417))
(check-sat)
