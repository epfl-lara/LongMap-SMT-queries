; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117146 () Bool)

(assert start!117146)

(declare-fun res!920840 () Bool)

(declare-fun e!781194 () Bool)

(assert (=> start!117146 (=> (not res!920840) (not e!781194))))

(declare-fun to!375 () (_ BitVec 32))

(declare-datatypes ((array!93701 0))(
  ( (array!93702 (arr!45249 (Array (_ BitVec 32) (_ BitVec 64))) (size!45800 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93701)

(declare-fun from!3579 () (_ BitVec 32))

(assert (=> start!117146 (= res!920840 (and (bvslt (size!45800 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45800 a!4212))))))

(assert (=> start!117146 e!781194))

(declare-fun array_inv!34530 (array!93701) Bool)

(assert (=> start!117146 (array_inv!34530 a!4212)))

(assert (=> start!117146 true))

(declare-fun b!1378910 () Bool)

(declare-fun res!920841 () Bool)

(assert (=> b!1378910 (=> (not res!920841) (not e!781194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378910 (= res!920841 (not (validKeyInArray!0 (select (arr!45249 a!4212) to!375))))))

(declare-fun b!1378911 () Bool)

(declare-fun res!920839 () Bool)

(assert (=> b!1378911 (=> (not res!920839) (not e!781194))))

(assert (=> b!1378911 (= res!920839 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1378912 () Bool)

(assert (=> b!1378912 (= e!781194 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93701 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378912 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45636 0))(
  ( (Unit!45637) )
))
(declare-fun lt!606585 () Unit!45636)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45636)

(assert (=> b!1378912 (= lt!606585 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!117146 res!920840) b!1378910))

(assert (= (and b!1378910 res!920841) b!1378911))

(assert (= (and b!1378911 res!920839) b!1378912))

(declare-fun m!1263583 () Bool)

(assert (=> start!117146 m!1263583))

(declare-fun m!1263585 () Bool)

(assert (=> b!1378910 m!1263585))

(assert (=> b!1378910 m!1263585))

(declare-fun m!1263587 () Bool)

(assert (=> b!1378910 m!1263587))

(declare-fun m!1263589 () Bool)

(assert (=> b!1378912 m!1263589))

(declare-fun m!1263591 () Bool)

(assert (=> b!1378912 m!1263591))

(declare-fun m!1263593 () Bool)

(assert (=> b!1378912 m!1263593))

(declare-fun m!1263595 () Bool)

(assert (=> b!1378912 m!1263595))

(push 1)

(assert (not b!1378910))

(assert (not b!1378912))

(assert (not start!117146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

