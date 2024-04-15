; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116906 () Bool)

(assert start!116906)

(declare-fun res!920266 () Bool)

(declare-fun e!780297 () Bool)

(assert (=> start!116906 (=> (not res!920266) (not e!780297))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93529 0))(
  ( (array!93530 (arr!45168 (Array (_ BitVec 32) (_ BitVec 64))) (size!45720 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93529)

(assert (=> start!116906 (= res!920266 (and (bvslt (size!45720 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45720 a!4212))))))

(assert (=> start!116906 e!780297))

(declare-fun array_inv!34401 (array!93529) Bool)

(assert (=> start!116906 (array_inv!34401 a!4212)))

(assert (=> start!116906 true))

(declare-fun b!1377508 () Bool)

(declare-fun res!920267 () Bool)

(assert (=> b!1377508 (=> (not res!920267) (not e!780297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377508 (= res!920267 (not (validKeyInArray!0 (select (arr!45168 a!4212) to!375))))))

(declare-fun b!1377509 () Bool)

(declare-fun res!920265 () Bool)

(assert (=> b!1377509 (=> (not res!920265) (not e!780297))))

(assert (=> b!1377509 (= res!920265 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377510 () Bool)

(assert (=> b!1377510 (= e!780297 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377510 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45532 0))(
  ( (Unit!45533) )
))
(declare-fun lt!605912 () Unit!45532)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45532)

(assert (=> b!1377510 (= lt!605912 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116906 res!920266) b!1377508))

(assert (= (and b!1377508 res!920267) b!1377509))

(assert (= (and b!1377509 res!920265) b!1377510))

(declare-fun m!1261407 () Bool)

(assert (=> start!116906 m!1261407))

(declare-fun m!1261409 () Bool)

(assert (=> b!1377508 m!1261409))

(assert (=> b!1377508 m!1261409))

(declare-fun m!1261411 () Bool)

(assert (=> b!1377508 m!1261411))

(declare-fun m!1261413 () Bool)

(assert (=> b!1377510 m!1261413))

(declare-fun m!1261415 () Bool)

(assert (=> b!1377510 m!1261415))

(declare-fun m!1261417 () Bool)

(assert (=> b!1377510 m!1261417))

(declare-fun m!1261419 () Bool)

(assert (=> b!1377510 m!1261419))

(push 1)

(assert (not start!116906))

(assert (not b!1377510))

(assert (not b!1377508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

