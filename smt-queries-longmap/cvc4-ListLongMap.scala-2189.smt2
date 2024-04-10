; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36472 () Bool)

(assert start!36472)

(declare-fun b!364635 () Bool)

(declare-fun e!223209 () Bool)

(declare-fun e!223208 () Bool)

(assert (=> b!364635 (= e!223209 e!223208)))

(declare-fun res!203796 () Bool)

(assert (=> b!364635 (=> (not res!203796) (not e!223208))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168651 () (_ BitVec 32))

(declare-fun lt!168650 () (_ BitVec 32))

(assert (=> b!364635 (= res!203796 (and (= lt!168650 (bvadd #b00000000000000000000000000000001 lt!168651)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20752 0))(
  ( (array!20753 (arr!9855 (Array (_ BitVec 32) (_ BitVec 64))) (size!10207 (_ BitVec 32))) )
))
(declare-fun lt!168652 () array!20752)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20752 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364635 (= lt!168650 (arrayCountValidKeys!0 lt!168652 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20752)

(assert (=> b!364635 (= lt!168651 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364635 (= lt!168652 (array!20753 (store (arr!9855 a!4289) i!1472 k!2974) (size!10207 a!4289)))))

(declare-fun res!203798 () Bool)

(assert (=> start!36472 (=> (not res!203798) (not e!223209))))

(assert (=> start!36472 (= res!203798 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10207 a!4289))))))

(assert (=> start!36472 e!223209))

(assert (=> start!36472 true))

(declare-fun array_inv!7297 (array!20752) Bool)

(assert (=> start!36472 (array_inv!7297 a!4289)))

(declare-fun b!364636 () Bool)

(declare-fun res!203800 () Bool)

(assert (=> b!364636 (=> (not res!203800) (not e!223209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364636 (= res!203800 (not (validKeyInArray!0 (select (arr!9855 a!4289) i!1472))))))

(declare-fun b!364637 () Bool)

(declare-fun res!203799 () Bool)

(assert (=> b!364637 (=> (not res!203799) (not e!223209))))

(assert (=> b!364637 (= res!203799 (and (bvslt (size!10207 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10207 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364638 () Bool)

(assert (=> b!364638 (= e!223208 (not true))))

(assert (=> b!364638 (= (bvadd (arrayCountValidKeys!0 lt!168652 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168650) (arrayCountValidKeys!0 lt!168652 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11344 0))(
  ( (Unit!11345) )
))
(declare-fun lt!168648 () Unit!11344)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11344)

(assert (=> b!364638 (= lt!168648 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168652 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364638 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168651) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168649 () Unit!11344)

(assert (=> b!364638 (= lt!168649 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364639 () Bool)

(declare-fun res!203797 () Bool)

(assert (=> b!364639 (=> (not res!203797) (not e!223209))))

(assert (=> b!364639 (= res!203797 (validKeyInArray!0 k!2974))))

(assert (= (and start!36472 res!203798) b!364636))

(assert (= (and b!364636 res!203800) b!364639))

(assert (= (and b!364639 res!203797) b!364637))

(assert (= (and b!364637 res!203799) b!364635))

(assert (= (and b!364635 res!203796) b!364638))

(declare-fun m!362241 () Bool)

(assert (=> b!364635 m!362241))

(declare-fun m!362243 () Bool)

(assert (=> b!364635 m!362243))

(declare-fun m!362245 () Bool)

(assert (=> b!364635 m!362245))

(declare-fun m!362247 () Bool)

(assert (=> b!364638 m!362247))

(declare-fun m!362249 () Bool)

(assert (=> b!364638 m!362249))

(declare-fun m!362251 () Bool)

(assert (=> b!364638 m!362251))

(declare-fun m!362253 () Bool)

(assert (=> b!364638 m!362253))

(declare-fun m!362255 () Bool)

(assert (=> b!364638 m!362255))

(declare-fun m!362257 () Bool)

(assert (=> b!364638 m!362257))

(declare-fun m!362259 () Bool)

(assert (=> b!364636 m!362259))

(assert (=> b!364636 m!362259))

(declare-fun m!362261 () Bool)

(assert (=> b!364636 m!362261))

(declare-fun m!362263 () Bool)

(assert (=> start!36472 m!362263))

(declare-fun m!362265 () Bool)

(assert (=> b!364639 m!362265))

(push 1)

(assert (not b!364638))

(assert (not start!36472))

(assert (not b!364635))

(assert (not b!364636))

(assert (not b!364639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

