; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116604 () Bool)

(assert start!116604)

(declare-fun b!1374837 () Bool)

(declare-fun e!778847 () Bool)

(assert (=> b!1374837 (= e!778847 (not true))))

(declare-datatypes ((array!93289 0))(
  ( (array!93290 (arr!45049 (Array (_ BitVec 32) (_ BitVec 64))) (size!45599 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93289)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93289 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374837 (= (arrayCountValidKeys!0 (array!93290 (store (arr!45049 a!4142) i!1457 k!2959) (size!45599 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45487 0))(
  ( (Unit!45488) )
))
(declare-fun lt!603903 () Unit!45487)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45487)

(assert (=> b!1374837 (= lt!603903 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917965 () Bool)

(assert (=> start!116604 (=> (not res!917965) (not e!778847))))

(assert (=> start!116604 (= res!917965 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45599 a!4142))))))

(assert (=> start!116604 e!778847))

(assert (=> start!116604 true))

(declare-fun array_inv!34077 (array!93289) Bool)

(assert (=> start!116604 (array_inv!34077 a!4142)))

(declare-fun b!1374836 () Bool)

(declare-fun res!917963 () Bool)

(assert (=> b!1374836 (=> (not res!917963) (not e!778847))))

(assert (=> b!1374836 (= res!917963 (bvslt (size!45599 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374835 () Bool)

(declare-fun res!917962 () Bool)

(assert (=> b!1374835 (=> (not res!917962) (not e!778847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374835 (= res!917962 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374834 () Bool)

(declare-fun res!917964 () Bool)

(assert (=> b!1374834 (=> (not res!917964) (not e!778847))))

(assert (=> b!1374834 (= res!917964 (validKeyInArray!0 (select (arr!45049 a!4142) i!1457)))))

(assert (= (and start!116604 res!917965) b!1374834))

(assert (= (and b!1374834 res!917964) b!1374835))

(assert (= (and b!1374835 res!917962) b!1374836))

(assert (= (and b!1374836 res!917963) b!1374837))

(declare-fun m!1258407 () Bool)

(assert (=> b!1374837 m!1258407))

(declare-fun m!1258409 () Bool)

(assert (=> b!1374837 m!1258409))

(declare-fun m!1258411 () Bool)

(assert (=> b!1374837 m!1258411))

(declare-fun m!1258413 () Bool)

(assert (=> b!1374837 m!1258413))

(declare-fun m!1258415 () Bool)

(assert (=> start!116604 m!1258415))

(declare-fun m!1258417 () Bool)

(assert (=> b!1374835 m!1258417))

(declare-fun m!1258419 () Bool)

(assert (=> b!1374834 m!1258419))

(assert (=> b!1374834 m!1258419))

(declare-fun m!1258421 () Bool)

(assert (=> b!1374834 m!1258421))

(push 1)

(assert (not b!1374835))

(assert (not b!1374834))

(assert (not b!1374837))

(assert (not start!116604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

