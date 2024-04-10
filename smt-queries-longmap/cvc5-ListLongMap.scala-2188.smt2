; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36462 () Bool)

(assert start!36462)

(declare-fun b!364560 () Bool)

(declare-fun res!203724 () Bool)

(declare-fun e!223165 () Bool)

(assert (=> b!364560 (=> (not res!203724) (not e!223165))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364560 (= res!203724 (validKeyInArray!0 k!2974))))

(declare-fun b!364561 () Bool)

(declare-fun e!223163 () Bool)

(assert (=> b!364561 (= e!223165 e!223163)))

(declare-fun res!203723 () Bool)

(assert (=> b!364561 (=> (not res!203723) (not e!223163))))

(declare-fun lt!168575 () (_ BitVec 32))

(declare-fun lt!168577 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364561 (= res!203723 (and (= lt!168575 (bvadd #b00000000000000000000000000000001 lt!168577)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20742 0))(
  ( (array!20743 (arr!9850 (Array (_ BitVec 32) (_ BitVec 64))) (size!10202 (_ BitVec 32))) )
))
(declare-fun lt!168574 () array!20742)

(declare-fun arrayCountValidKeys!0 (array!20742 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364561 (= lt!168575 (arrayCountValidKeys!0 lt!168574 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20742)

(assert (=> b!364561 (= lt!168577 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364561 (= lt!168574 (array!20743 (store (arr!9850 a!4289) i!1472 k!2974) (size!10202 a!4289)))))

(declare-fun b!364562 () Bool)

(assert (=> b!364562 (= e!223163 (not true))))

(assert (=> b!364562 (= (bvadd (arrayCountValidKeys!0 lt!168574 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168575) (arrayCountValidKeys!0 lt!168574 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11334 0))(
  ( (Unit!11335) )
))
(declare-fun lt!168576 () Unit!11334)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11334)

(assert (=> b!364562 (= lt!168576 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168574 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364562 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168577) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168573 () Unit!11334)

(assert (=> b!364562 (= lt!168573 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203721 () Bool)

(assert (=> start!36462 (=> (not res!203721) (not e!223165))))

(assert (=> start!36462 (= res!203721 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10202 a!4289))))))

(assert (=> start!36462 e!223165))

(assert (=> start!36462 true))

(declare-fun array_inv!7292 (array!20742) Bool)

(assert (=> start!36462 (array_inv!7292 a!4289)))

(declare-fun b!364563 () Bool)

(declare-fun res!203725 () Bool)

(assert (=> b!364563 (=> (not res!203725) (not e!223165))))

(assert (=> b!364563 (= res!203725 (not (validKeyInArray!0 (select (arr!9850 a!4289) i!1472))))))

(declare-fun b!364564 () Bool)

(declare-fun res!203722 () Bool)

(assert (=> b!364564 (=> (not res!203722) (not e!223165))))

(assert (=> b!364564 (= res!203722 (and (bvslt (size!10202 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10202 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36462 res!203721) b!364563))

(assert (= (and b!364563 res!203725) b!364560))

(assert (= (and b!364560 res!203724) b!364564))

(assert (= (and b!364564 res!203722) b!364561))

(assert (= (and b!364561 res!203723) b!364562))

(declare-fun m!362111 () Bool)

(assert (=> b!364560 m!362111))

(declare-fun m!362113 () Bool)

(assert (=> b!364563 m!362113))

(assert (=> b!364563 m!362113))

(declare-fun m!362115 () Bool)

(assert (=> b!364563 m!362115))

(declare-fun m!362117 () Bool)

(assert (=> start!36462 m!362117))

(declare-fun m!362119 () Bool)

(assert (=> b!364562 m!362119))

(declare-fun m!362121 () Bool)

(assert (=> b!364562 m!362121))

(declare-fun m!362123 () Bool)

(assert (=> b!364562 m!362123))

(declare-fun m!362125 () Bool)

(assert (=> b!364562 m!362125))

(declare-fun m!362127 () Bool)

(assert (=> b!364562 m!362127))

(declare-fun m!362129 () Bool)

(assert (=> b!364562 m!362129))

(declare-fun m!362131 () Bool)

(assert (=> b!364561 m!362131))

(declare-fun m!362133 () Bool)

(assert (=> b!364561 m!362133))

(declare-fun m!362135 () Bool)

(assert (=> b!364561 m!362135))

(push 1)

(assert (not b!364560))

(assert (not start!36462))

(assert (not b!364562))

(assert (not b!364561))

(assert (not b!364563))

(check-sat)

