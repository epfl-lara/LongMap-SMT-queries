; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36454 () Bool)

(assert start!36454)

(declare-fun b!364556 () Bool)

(declare-fun res!203765 () Bool)

(declare-fun e!223158 () Bool)

(assert (=> b!364556 (=> (not res!203765) (not e!223158))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20729 0))(
  ( (array!20730 (arr!9843 (Array (_ BitVec 32) (_ BitVec 64))) (size!10195 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20729)

(assert (=> b!364556 (= res!203765 (and (bvslt (size!10195 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10195 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364557 () Bool)

(declare-fun e!223160 () Bool)

(assert (=> b!364557 (= e!223160 (not true))))

(declare-fun lt!168641 () array!20729)

(declare-fun lt!168639 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364557 (= (bvadd (arrayCountValidKeys!0 lt!168641 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168639) (arrayCountValidKeys!0 lt!168641 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11329 0))(
  ( (Unit!11330) )
))
(declare-fun lt!168637 () Unit!11329)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11329)

(assert (=> b!364557 (= lt!168637 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168641 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168640 () (_ BitVec 32))

(assert (=> b!364557 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168640) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168638 () Unit!11329)

(assert (=> b!364557 (= lt!168638 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203763 () Bool)

(assert (=> start!36454 (=> (not res!203763) (not e!223158))))

(assert (=> start!36454 (= res!203763 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10195 a!4289))))))

(assert (=> start!36454 e!223158))

(assert (=> start!36454 true))

(declare-fun array_inv!7315 (array!20729) Bool)

(assert (=> start!36454 (array_inv!7315 a!4289)))

(declare-fun b!364558 () Bool)

(assert (=> b!364558 (= e!223158 e!223160)))

(declare-fun res!203767 () Bool)

(assert (=> b!364558 (=> (not res!203767) (not e!223160))))

(assert (=> b!364558 (= res!203767 (and (= lt!168639 (bvadd #b00000000000000000000000000000001 lt!168640)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364558 (= lt!168639 (arrayCountValidKeys!0 lt!168641 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364558 (= lt!168640 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364558 (= lt!168641 (array!20730 (store (arr!9843 a!4289) i!1472 k0!2974) (size!10195 a!4289)))))

(declare-fun b!364559 () Bool)

(declare-fun res!203766 () Bool)

(assert (=> b!364559 (=> (not res!203766) (not e!223158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364559 (= res!203766 (validKeyInArray!0 k0!2974))))

(declare-fun b!364560 () Bool)

(declare-fun res!203764 () Bool)

(assert (=> b!364560 (=> (not res!203764) (not e!223158))))

(assert (=> b!364560 (= res!203764 (not (validKeyInArray!0 (select (arr!9843 a!4289) i!1472))))))

(assert (= (and start!36454 res!203763) b!364560))

(assert (= (and b!364560 res!203764) b!364559))

(assert (= (and b!364559 res!203766) b!364556))

(assert (= (and b!364556 res!203765) b!364558))

(assert (= (and b!364558 res!203767) b!364557))

(declare-fun m!362419 () Bool)

(assert (=> b!364560 m!362419))

(assert (=> b!364560 m!362419))

(declare-fun m!362421 () Bool)

(assert (=> b!364560 m!362421))

(declare-fun m!362423 () Bool)

(assert (=> b!364559 m!362423))

(declare-fun m!362425 () Bool)

(assert (=> start!36454 m!362425))

(declare-fun m!362427 () Bool)

(assert (=> b!364557 m!362427))

(declare-fun m!362429 () Bool)

(assert (=> b!364557 m!362429))

(declare-fun m!362431 () Bool)

(assert (=> b!364557 m!362431))

(declare-fun m!362433 () Bool)

(assert (=> b!364557 m!362433))

(declare-fun m!362435 () Bool)

(assert (=> b!364557 m!362435))

(declare-fun m!362437 () Bool)

(assert (=> b!364557 m!362437))

(declare-fun m!362439 () Bool)

(assert (=> b!364558 m!362439))

(declare-fun m!362441 () Bool)

(assert (=> b!364558 m!362441))

(declare-fun m!362443 () Bool)

(assert (=> b!364558 m!362443))

(check-sat (not b!364559) (not b!364557) (not b!364560) (not start!36454) (not b!364558))
(check-sat)
