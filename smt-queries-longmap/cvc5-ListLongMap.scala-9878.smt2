; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117218 () Bool)

(assert start!117218)

(declare-fun res!920994 () Bool)

(declare-fun e!781356 () Bool)

(assert (=> start!117218 (=> (not res!920994) (not e!781356))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93746 0))(
  ( (array!93747 (arr!45270 (Array (_ BitVec 32) (_ BitVec 64))) (size!45821 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93746)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117218 (= res!920994 (and (bvslt (size!45821 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45821 a!4197))))))

(assert (=> start!117218 e!781356))

(declare-fun array_inv!34551 (array!93746) Bool)

(assert (=> start!117218 (array_inv!34551 a!4197)))

(assert (=> start!117218 true))

(declare-fun b!1379151 () Bool)

(declare-fun res!920992 () Bool)

(assert (=> b!1379151 (=> (not res!920992) (not e!781356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379151 (= res!920992 (validKeyInArray!0 (select (arr!45270 a!4197) to!360)))))

(declare-fun b!1379152 () Bool)

(declare-fun res!920993 () Bool)

(assert (=> b!1379152 (=> (not res!920993) (not e!781356))))

(assert (=> b!1379152 (= res!920993 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1379153 () Bool)

(assert (=> b!1379153 (= e!781356 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93746 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379153 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45666 0))(
  ( (Unit!45667) )
))
(declare-fun lt!606688 () Unit!45666)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45666)

(assert (=> b!1379153 (= lt!606688 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117218 res!920994) b!1379151))

(assert (= (and b!1379151 res!920992) b!1379152))

(assert (= (and b!1379152 res!920993) b!1379153))

(declare-fun m!1263887 () Bool)

(assert (=> start!117218 m!1263887))

(declare-fun m!1263889 () Bool)

(assert (=> b!1379151 m!1263889))

(assert (=> b!1379151 m!1263889))

(declare-fun m!1263891 () Bool)

(assert (=> b!1379151 m!1263891))

(declare-fun m!1263893 () Bool)

(assert (=> b!1379153 m!1263893))

(declare-fun m!1263895 () Bool)

(assert (=> b!1379153 m!1263895))

(declare-fun m!1263897 () Bool)

(assert (=> b!1379153 m!1263897))

(declare-fun m!1263899 () Bool)

(assert (=> b!1379153 m!1263899))

(push 1)

(assert (not start!117218))

(assert (not b!1379153))

(assert (not b!1379151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

