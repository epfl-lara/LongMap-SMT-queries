; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116924 () Bool)

(assert start!116924)

(declare-fun res!920346 () Bool)

(declare-fun e!780352 () Bool)

(assert (=> start!116924 (=> (not res!920346) (not e!780352))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93547 0))(
  ( (array!93548 (arr!45177 (Array (_ BitVec 32) (_ BitVec 64))) (size!45729 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93547)

(assert (=> start!116924 (= res!920346 (and (bvslt (size!45729 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45729 a!4212))))))

(assert (=> start!116924 e!780352))

(declare-fun array_inv!34410 (array!93547) Bool)

(assert (=> start!116924 (array_inv!34410 a!4212)))

(assert (=> start!116924 true))

(declare-fun b!1377589 () Bool)

(declare-fun res!920347 () Bool)

(assert (=> b!1377589 (=> (not res!920347) (not e!780352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377589 (= res!920347 (not (validKeyInArray!0 (select (arr!45177 a!4212) to!375))))))

(declare-fun b!1377590 () Bool)

(declare-fun res!920348 () Bool)

(assert (=> b!1377590 (=> (not res!920348) (not e!780352))))

(assert (=> b!1377590 (= res!920348 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377591 () Bool)

(assert (=> b!1377591 (= e!780352 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377591 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45550 0))(
  ( (Unit!45551) )
))
(declare-fun lt!605939 () Unit!45550)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45550)

(assert (=> b!1377591 (= lt!605939 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116924 res!920346) b!1377589))

(assert (= (and b!1377589 res!920347) b!1377590))

(assert (= (and b!1377590 res!920348) b!1377591))

(declare-fun m!1261533 () Bool)

(assert (=> start!116924 m!1261533))

(declare-fun m!1261535 () Bool)

(assert (=> b!1377589 m!1261535))

(assert (=> b!1377589 m!1261535))

(declare-fun m!1261537 () Bool)

(assert (=> b!1377589 m!1261537))

(declare-fun m!1261539 () Bool)

(assert (=> b!1377591 m!1261539))

(declare-fun m!1261541 () Bool)

(assert (=> b!1377591 m!1261541))

(declare-fun m!1261543 () Bool)

(assert (=> b!1377591 m!1261543))

(declare-fun m!1261545 () Bool)

(assert (=> b!1377591 m!1261545))

(push 1)

(assert (not b!1377589))

(assert (not start!116924))

(assert (not b!1377591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

