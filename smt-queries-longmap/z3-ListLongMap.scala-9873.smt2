; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116926 () Bool)

(assert start!116926)

(declare-fun res!920363 () Bool)

(declare-fun e!780372 () Bool)

(assert (=> start!116926 (=> (not res!920363) (not e!780372))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93595 0))(
  ( (array!93596 (arr!45201 (Array (_ BitVec 32) (_ BitVec 64))) (size!45751 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93595)

(assert (=> start!116926 (= res!920363 (and (bvslt (size!45751 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45751 a!4212))))))

(assert (=> start!116926 e!780372))

(declare-fun array_inv!34229 (array!93595) Bool)

(assert (=> start!116926 (array_inv!34229 a!4212)))

(assert (=> start!116926 true))

(declare-fun b!1377641 () Bool)

(declare-fun res!920364 () Bool)

(assert (=> b!1377641 (=> (not res!920364) (not e!780372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377641 (= res!920364 (not (validKeyInArray!0 (select (arr!45201 a!4212) to!375))))))

(declare-fun b!1377642 () Bool)

(declare-fun res!920365 () Bool)

(assert (=> b!1377642 (=> (not res!920365) (not e!780372))))

(assert (=> b!1377642 (= res!920365 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377643 () Bool)

(assert (=> b!1377643 (= e!780372 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377643 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45707 0))(
  ( (Unit!45708) )
))
(declare-fun lt!606118 () Unit!45707)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45707)

(assert (=> b!1377643 (= lt!606118 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116926 res!920363) b!1377641))

(assert (= (and b!1377641 res!920364) b!1377642))

(assert (= (and b!1377642 res!920365) b!1377643))

(declare-fun m!1262017 () Bool)

(assert (=> start!116926 m!1262017))

(declare-fun m!1262019 () Bool)

(assert (=> b!1377641 m!1262019))

(assert (=> b!1377641 m!1262019))

(declare-fun m!1262021 () Bool)

(assert (=> b!1377641 m!1262021))

(declare-fun m!1262023 () Bool)

(assert (=> b!1377643 m!1262023))

(declare-fun m!1262025 () Bool)

(assert (=> b!1377643 m!1262025))

(declare-fun m!1262027 () Bool)

(assert (=> b!1377643 m!1262027))

(declare-fun m!1262029 () Bool)

(assert (=> b!1377643 m!1262029))

(check-sat (not start!116926) (not b!1377643) (not b!1377641))
