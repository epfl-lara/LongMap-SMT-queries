; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116914 () Bool)

(assert start!116914)

(declare-fun res!920302 () Bool)

(declare-fun e!780322 () Bool)

(assert (=> start!116914 (=> (not res!920302) (not e!780322))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93537 0))(
  ( (array!93538 (arr!45172 (Array (_ BitVec 32) (_ BitVec 64))) (size!45724 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93537)

(assert (=> start!116914 (= res!920302 (and (bvslt (size!45724 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45724 a!4212))))))

(assert (=> start!116914 e!780322))

(declare-fun array_inv!34405 (array!93537) Bool)

(assert (=> start!116914 (array_inv!34405 a!4212)))

(assert (=> start!116914 true))

(declare-fun b!1377544 () Bool)

(declare-fun res!920301 () Bool)

(assert (=> b!1377544 (=> (not res!920301) (not e!780322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377544 (= res!920301 (not (validKeyInArray!0 (select (arr!45172 a!4212) to!375))))))

(declare-fun b!1377545 () Bool)

(declare-fun res!920303 () Bool)

(assert (=> b!1377545 (=> (not res!920303) (not e!780322))))

(assert (=> b!1377545 (= res!920303 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377546 () Bool)

(assert (=> b!1377546 (= e!780322 (not (bvsle to!375 (size!45724 a!4212))))))

(declare-fun arrayCountValidKeys!0 (array!93537 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377546 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45540 0))(
  ( (Unit!45541) )
))
(declare-fun lt!605924 () Unit!45540)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45540)

(assert (=> b!1377546 (= lt!605924 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116914 res!920302) b!1377544))

(assert (= (and b!1377544 res!920301) b!1377545))

(assert (= (and b!1377545 res!920303) b!1377546))

(declare-fun m!1261463 () Bool)

(assert (=> start!116914 m!1261463))

(declare-fun m!1261465 () Bool)

(assert (=> b!1377544 m!1261465))

(assert (=> b!1377544 m!1261465))

(declare-fun m!1261467 () Bool)

(assert (=> b!1377544 m!1261467))

(declare-fun m!1261469 () Bool)

(assert (=> b!1377546 m!1261469))

(declare-fun m!1261471 () Bool)

(assert (=> b!1377546 m!1261471))

(declare-fun m!1261473 () Bool)

(assert (=> b!1377546 m!1261473))

(declare-fun m!1261475 () Bool)

(assert (=> b!1377546 m!1261475))

(check-sat (not b!1377544) (not start!116914) (not b!1377546))
(check-sat)
