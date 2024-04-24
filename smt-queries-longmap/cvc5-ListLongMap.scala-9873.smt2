; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117158 () Bool)

(assert start!117158)

(declare-fun res!920895 () Bool)

(declare-fun e!781231 () Bool)

(assert (=> start!117158 (=> (not res!920895) (not e!781231))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93713 0))(
  ( (array!93714 (arr!45255 (Array (_ BitVec 32) (_ BitVec 64))) (size!45806 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93713)

(assert (=> start!117158 (= res!920895 (and (bvslt (size!45806 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45806 a!4212))))))

(assert (=> start!117158 e!781231))

(declare-fun array_inv!34536 (array!93713) Bool)

(assert (=> start!117158 (array_inv!34536 a!4212)))

(assert (=> start!117158 true))

(declare-fun b!1378964 () Bool)

(declare-fun res!920894 () Bool)

(assert (=> b!1378964 (=> (not res!920894) (not e!781231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378964 (= res!920894 (not (validKeyInArray!0 (select (arr!45255 a!4212) to!375))))))

(declare-fun b!1378965 () Bool)

(declare-fun res!920893 () Bool)

(assert (=> b!1378965 (=> (not res!920893) (not e!781231))))

(assert (=> b!1378965 (= res!920893 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1378966 () Bool)

(assert (=> b!1378966 (= e!781231 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93713 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378966 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45648 0))(
  ( (Unit!45649) )
))
(declare-fun lt!606603 () Unit!45648)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45648)

(assert (=> b!1378966 (= lt!606603 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!117158 res!920895) b!1378964))

(assert (= (and b!1378964 res!920894) b!1378965))

(assert (= (and b!1378965 res!920893) b!1378966))

(declare-fun m!1263667 () Bool)

(assert (=> start!117158 m!1263667))

(declare-fun m!1263669 () Bool)

(assert (=> b!1378964 m!1263669))

(assert (=> b!1378964 m!1263669))

(declare-fun m!1263671 () Bool)

(assert (=> b!1378964 m!1263671))

(declare-fun m!1263673 () Bool)

(assert (=> b!1378966 m!1263673))

(declare-fun m!1263675 () Bool)

(assert (=> b!1378966 m!1263675))

(declare-fun m!1263677 () Bool)

(assert (=> b!1378966 m!1263677))

(declare-fun m!1263679 () Bool)

(assert (=> b!1378966 m!1263679))

(push 1)

(assert (not b!1378964))

(assert (not start!117158))

(assert (not b!1378966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

