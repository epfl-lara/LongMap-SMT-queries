; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117140 () Bool)

(assert start!117140)

(declare-fun res!920813 () Bool)

(declare-fun e!781176 () Bool)

(assert (=> start!117140 (=> (not res!920813) (not e!781176))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93695 0))(
  ( (array!93696 (arr!45246 (Array (_ BitVec 32) (_ BitVec 64))) (size!45797 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93695)

(assert (=> start!117140 (= res!920813 (and (bvslt (size!45797 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45797 a!4212))))))

(assert (=> start!117140 e!781176))

(declare-fun array_inv!34527 (array!93695) Bool)

(assert (=> start!117140 (array_inv!34527 a!4212)))

(assert (=> start!117140 true))

(declare-fun b!1378883 () Bool)

(declare-fun res!920814 () Bool)

(assert (=> b!1378883 (=> (not res!920814) (not e!781176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378883 (= res!920814 (not (validKeyInArray!0 (select (arr!45246 a!4212) to!375))))))

(declare-fun b!1378884 () Bool)

(declare-fun res!920812 () Bool)

(assert (=> b!1378884 (=> (not res!920812) (not e!781176))))

(assert (=> b!1378884 (= res!920812 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1378885 () Bool)

(assert (=> b!1378885 (= e!781176 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378885 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45630 0))(
  ( (Unit!45631) )
))
(declare-fun lt!606576 () Unit!45630)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45630)

(assert (=> b!1378885 (= lt!606576 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!117140 res!920813) b!1378883))

(assert (= (and b!1378883 res!920814) b!1378884))

(assert (= (and b!1378884 res!920812) b!1378885))

(declare-fun m!1263541 () Bool)

(assert (=> start!117140 m!1263541))

(declare-fun m!1263543 () Bool)

(assert (=> b!1378883 m!1263543))

(assert (=> b!1378883 m!1263543))

(declare-fun m!1263545 () Bool)

(assert (=> b!1378883 m!1263545))

(declare-fun m!1263547 () Bool)

(assert (=> b!1378885 m!1263547))

(declare-fun m!1263549 () Bool)

(assert (=> b!1378885 m!1263549))

(declare-fun m!1263551 () Bool)

(assert (=> b!1378885 m!1263551))

(declare-fun m!1263553 () Bool)

(assert (=> b!1378885 m!1263553))

(push 1)

(assert (not start!117140))

(assert (not b!1378885))

(assert (not b!1378883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

