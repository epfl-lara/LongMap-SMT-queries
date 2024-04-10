; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36474 () Bool)

(assert start!36474)

(declare-fun b!364650 () Bool)

(declare-fun res!203815 () Bool)

(declare-fun e!223218 () Bool)

(assert (=> b!364650 (=> (not res!203815) (not e!223218))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364650 (= res!203815 (validKeyInArray!0 k!2974))))

(declare-fun b!364651 () Bool)

(declare-fun e!223219 () Bool)

(assert (=> b!364651 (= e!223218 e!223219)))

(declare-fun res!203813 () Bool)

(assert (=> b!364651 (=> (not res!203813) (not e!223219))))

(declare-fun lt!168665 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168666 () (_ BitVec 32))

(assert (=> b!364651 (= res!203813 (and (= lt!168665 (bvadd #b00000000000000000000000000000001 lt!168666)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20754 0))(
  ( (array!20755 (arr!9856 (Array (_ BitVec 32) (_ BitVec 64))) (size!10208 (_ BitVec 32))) )
))
(declare-fun lt!168664 () array!20754)

(declare-fun arrayCountValidKeys!0 (array!20754 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364651 (= lt!168665 (arrayCountValidKeys!0 lt!168664 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20754)

(assert (=> b!364651 (= lt!168666 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364651 (= lt!168664 (array!20755 (store (arr!9856 a!4289) i!1472 k!2974) (size!10208 a!4289)))))

(declare-fun b!364652 () Bool)

(declare-fun res!203811 () Bool)

(assert (=> b!364652 (=> (not res!203811) (not e!223218))))

(assert (=> b!364652 (= res!203811 (and (bvslt (size!10208 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10208 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203812 () Bool)

(assert (=> start!36474 (=> (not res!203812) (not e!223218))))

(assert (=> start!36474 (= res!203812 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10208 a!4289))))))

(assert (=> start!36474 e!223218))

(assert (=> start!36474 true))

(declare-fun array_inv!7298 (array!20754) Bool)

(assert (=> start!36474 (array_inv!7298 a!4289)))

(declare-fun b!364653 () Bool)

(declare-fun res!203814 () Bool)

(assert (=> b!364653 (=> (not res!203814) (not e!223218))))

(assert (=> b!364653 (= res!203814 (not (validKeyInArray!0 (select (arr!9856 a!4289) i!1472))))))

(declare-fun b!364654 () Bool)

(assert (=> b!364654 (= e!223219 (not true))))

(assert (=> b!364654 (= (bvadd (arrayCountValidKeys!0 lt!168664 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168665) (arrayCountValidKeys!0 lt!168664 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11346 0))(
  ( (Unit!11347) )
))
(declare-fun lt!168663 () Unit!11346)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11346)

(assert (=> b!364654 (= lt!168663 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168664 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364654 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168666) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168667 () Unit!11346)

(assert (=> b!364654 (= lt!168667 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36474 res!203812) b!364653))

(assert (= (and b!364653 res!203814) b!364650))

(assert (= (and b!364650 res!203815) b!364652))

(assert (= (and b!364652 res!203811) b!364651))

(assert (= (and b!364651 res!203813) b!364654))

(declare-fun m!362267 () Bool)

(assert (=> b!364651 m!362267))

(declare-fun m!362269 () Bool)

(assert (=> b!364651 m!362269))

(declare-fun m!362271 () Bool)

(assert (=> b!364651 m!362271))

(declare-fun m!362273 () Bool)

(assert (=> b!364650 m!362273))

(declare-fun m!362275 () Bool)

(assert (=> b!364653 m!362275))

(assert (=> b!364653 m!362275))

(declare-fun m!362277 () Bool)

(assert (=> b!364653 m!362277))

(declare-fun m!362279 () Bool)

(assert (=> start!36474 m!362279))

(declare-fun m!362281 () Bool)

(assert (=> b!364654 m!362281))

(declare-fun m!362283 () Bool)

(assert (=> b!364654 m!362283))

(declare-fun m!362285 () Bool)

(assert (=> b!364654 m!362285))

(declare-fun m!362287 () Bool)

(assert (=> b!364654 m!362287))

(declare-fun m!362289 () Bool)

(assert (=> b!364654 m!362289))

(declare-fun m!362291 () Bool)

(assert (=> b!364654 m!362291))

(push 1)

(assert (not b!364650))

(assert (not b!364651))

(assert (not start!36474))

(assert (not b!364653))

(assert (not b!364654))

(check-sat)

