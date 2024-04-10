; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36482 () Bool)

(assert start!36482)

(declare-fun e!223253 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((array!20762 0))(
  ( (array!20763 (arr!9860 (Array (_ BitVec 32) (_ BitVec 64))) (size!10212 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20762)

(declare-fun b!364710 () Bool)

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364710 (= e!223253 (not (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (size!10212 a!4289)) (bvsge i!1472 (bvsub from!3650 #b00000000000000000000000000000001)))))))

(declare-fun lt!168726 () array!20762)

(declare-fun lt!168727 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20762 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364710 (= (bvadd (arrayCountValidKeys!0 lt!168726 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168727) (arrayCountValidKeys!0 lt!168726 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11354 0))(
  ( (Unit!11355) )
))
(declare-fun lt!168725 () Unit!11354)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11354)

(assert (=> b!364710 (= lt!168725 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168726 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168724 () (_ BitVec 32))

(assert (=> b!364710 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168724) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168723 () Unit!11354)

(assert (=> b!364710 (= lt!168723 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364711 () Bool)

(declare-fun e!223255 () Bool)

(assert (=> b!364711 (= e!223255 e!223253)))

(declare-fun res!203875 () Bool)

(assert (=> b!364711 (=> (not res!203875) (not e!223253))))

(assert (=> b!364711 (= res!203875 (and (= lt!168727 (bvadd #b00000000000000000000000000000001 lt!168724)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364711 (= lt!168727 (arrayCountValidKeys!0 lt!168726 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364711 (= lt!168724 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364711 (= lt!168726 (array!20763 (store (arr!9860 a!4289) i!1472 k0!2974) (size!10212 a!4289)))))

(declare-fun b!364712 () Bool)

(declare-fun res!203872 () Bool)

(assert (=> b!364712 (=> (not res!203872) (not e!223255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364712 (= res!203872 (not (validKeyInArray!0 (select (arr!9860 a!4289) i!1472))))))

(declare-fun b!364713 () Bool)

(declare-fun res!203873 () Bool)

(assert (=> b!364713 (=> (not res!203873) (not e!223255))))

(assert (=> b!364713 (= res!203873 (and (bvslt (size!10212 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10212 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203871 () Bool)

(assert (=> start!36482 (=> (not res!203871) (not e!223255))))

(assert (=> start!36482 (= res!203871 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10212 a!4289))))))

(assert (=> start!36482 e!223255))

(assert (=> start!36482 true))

(declare-fun array_inv!7302 (array!20762) Bool)

(assert (=> start!36482 (array_inv!7302 a!4289)))

(declare-fun b!364714 () Bool)

(declare-fun res!203874 () Bool)

(assert (=> b!364714 (=> (not res!203874) (not e!223255))))

(assert (=> b!364714 (= res!203874 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36482 res!203871) b!364712))

(assert (= (and b!364712 res!203872) b!364714))

(assert (= (and b!364714 res!203874) b!364713))

(assert (= (and b!364713 res!203873) b!364711))

(assert (= (and b!364711 res!203875) b!364710))

(declare-fun m!362371 () Bool)

(assert (=> b!364710 m!362371))

(declare-fun m!362373 () Bool)

(assert (=> b!364710 m!362373))

(declare-fun m!362375 () Bool)

(assert (=> b!364710 m!362375))

(declare-fun m!362377 () Bool)

(assert (=> b!364710 m!362377))

(declare-fun m!362379 () Bool)

(assert (=> b!364710 m!362379))

(declare-fun m!362381 () Bool)

(assert (=> b!364710 m!362381))

(declare-fun m!362383 () Bool)

(assert (=> b!364711 m!362383))

(declare-fun m!362385 () Bool)

(assert (=> b!364711 m!362385))

(declare-fun m!362387 () Bool)

(assert (=> b!364711 m!362387))

(declare-fun m!362389 () Bool)

(assert (=> b!364714 m!362389))

(declare-fun m!362391 () Bool)

(assert (=> start!36482 m!362391))

(declare-fun m!362393 () Bool)

(assert (=> b!364712 m!362393))

(assert (=> b!364712 m!362393))

(declare-fun m!362395 () Bool)

(assert (=> b!364712 m!362395))

(check-sat (not start!36482) (not b!364712) (not b!364711) (not b!364714) (not b!364710))
(check-sat)
