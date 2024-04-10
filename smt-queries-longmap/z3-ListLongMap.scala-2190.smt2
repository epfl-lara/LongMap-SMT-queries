; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36476 () Bool)

(assert start!36476)

(declare-fun res!203829 () Bool)

(declare-fun e!223227 () Bool)

(assert (=> start!36476 (=> (not res!203829) (not e!223227))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20756 0))(
  ( (array!20757 (arr!9857 (Array (_ BitVec 32) (_ BitVec 64))) (size!10209 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20756)

(assert (=> start!36476 (= res!203829 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10209 a!4289))))))

(assert (=> start!36476 e!223227))

(assert (=> start!36476 true))

(declare-fun array_inv!7299 (array!20756) Bool)

(assert (=> start!36476 (array_inv!7299 a!4289)))

(declare-fun b!364665 () Bool)

(declare-fun res!203830 () Bool)

(assert (=> b!364665 (=> (not res!203830) (not e!223227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364665 (= res!203830 (not (validKeyInArray!0 (select (arr!9857 a!4289) i!1472))))))

(declare-fun b!364666 () Bool)

(declare-fun e!223228 () Bool)

(assert (=> b!364666 (= e!223227 e!223228)))

(declare-fun res!203826 () Bool)

(assert (=> b!364666 (=> (not res!203826) (not e!223228))))

(declare-fun lt!168679 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168678 () (_ BitVec 32))

(assert (=> b!364666 (= res!203826 (and (= lt!168678 (bvadd #b00000000000000000000000000000001 lt!168679)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168681 () array!20756)

(declare-fun arrayCountValidKeys!0 (array!20756 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364666 (= lt!168678 (arrayCountValidKeys!0 lt!168681 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364666 (= lt!168679 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364666 (= lt!168681 (array!20757 (store (arr!9857 a!4289) i!1472 k0!2974) (size!10209 a!4289)))))

(declare-fun b!364667 () Bool)

(declare-fun res!203828 () Bool)

(assert (=> b!364667 (=> (not res!203828) (not e!223227))))

(assert (=> b!364667 (= res!203828 (and (bvslt (size!10209 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10209 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364668 () Bool)

(assert (=> b!364668 (= e!223228 (not true))))

(assert (=> b!364668 (= (bvadd (arrayCountValidKeys!0 lt!168681 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168678) (arrayCountValidKeys!0 lt!168681 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11348 0))(
  ( (Unit!11349) )
))
(declare-fun lt!168680 () Unit!11348)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11348)

(assert (=> b!364668 (= lt!168680 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168681 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364668 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168679) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168682 () Unit!11348)

(assert (=> b!364668 (= lt!168682 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364669 () Bool)

(declare-fun res!203827 () Bool)

(assert (=> b!364669 (=> (not res!203827) (not e!223227))))

(assert (=> b!364669 (= res!203827 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36476 res!203829) b!364665))

(assert (= (and b!364665 res!203830) b!364669))

(assert (= (and b!364669 res!203827) b!364667))

(assert (= (and b!364667 res!203828) b!364666))

(assert (= (and b!364666 res!203826) b!364668))

(declare-fun m!362293 () Bool)

(assert (=> b!364668 m!362293))

(declare-fun m!362295 () Bool)

(assert (=> b!364668 m!362295))

(declare-fun m!362297 () Bool)

(assert (=> b!364668 m!362297))

(declare-fun m!362299 () Bool)

(assert (=> b!364668 m!362299))

(declare-fun m!362301 () Bool)

(assert (=> b!364668 m!362301))

(declare-fun m!362303 () Bool)

(assert (=> b!364668 m!362303))

(declare-fun m!362305 () Bool)

(assert (=> start!36476 m!362305))

(declare-fun m!362307 () Bool)

(assert (=> b!364665 m!362307))

(assert (=> b!364665 m!362307))

(declare-fun m!362309 () Bool)

(assert (=> b!364665 m!362309))

(declare-fun m!362311 () Bool)

(assert (=> b!364666 m!362311))

(declare-fun m!362313 () Bool)

(assert (=> b!364666 m!362313))

(declare-fun m!362315 () Bool)

(assert (=> b!364666 m!362315))

(declare-fun m!362317 () Bool)

(assert (=> b!364669 m!362317))

(check-sat (not b!364666) (not b!364669) (not b!364665) (not b!364668) (not start!36476))
(check-sat)
