; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117220 () Bool)

(assert start!117220)

(declare-fun res!921002 () Bool)

(declare-fun e!781362 () Bool)

(assert (=> start!117220 (=> (not res!921002) (not e!781362))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93748 0))(
  ( (array!93749 (arr!45271 (Array (_ BitVec 32) (_ BitVec 64))) (size!45822 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93748)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117220 (= res!921002 (and (bvslt (size!45822 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45822 a!4197))))))

(assert (=> start!117220 e!781362))

(declare-fun array_inv!34552 (array!93748) Bool)

(assert (=> start!117220 (array_inv!34552 a!4197)))

(assert (=> start!117220 true))

(declare-fun b!1379160 () Bool)

(declare-fun res!921001 () Bool)

(assert (=> b!1379160 (=> (not res!921001) (not e!781362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379160 (= res!921001 (validKeyInArray!0 (select (arr!45271 a!4197) to!360)))))

(declare-fun b!1379161 () Bool)

(declare-fun res!921003 () Bool)

(assert (=> b!1379161 (=> (not res!921003) (not e!781362))))

(assert (=> b!1379161 (= res!921003 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1379162 () Bool)

(assert (=> b!1379162 (= e!781362 (not (bvsle to!360 (size!45822 a!4197))))))

(declare-fun arrayCountValidKeys!0 (array!93748 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379162 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45668 0))(
  ( (Unit!45669) )
))
(declare-fun lt!606691 () Unit!45668)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45668)

(assert (=> b!1379162 (= lt!606691 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117220 res!921002) b!1379160))

(assert (= (and b!1379160 res!921001) b!1379161))

(assert (= (and b!1379161 res!921003) b!1379162))

(declare-fun m!1263901 () Bool)

(assert (=> start!117220 m!1263901))

(declare-fun m!1263903 () Bool)

(assert (=> b!1379160 m!1263903))

(assert (=> b!1379160 m!1263903))

(declare-fun m!1263905 () Bool)

(assert (=> b!1379160 m!1263905))

(declare-fun m!1263907 () Bool)

(assert (=> b!1379162 m!1263907))

(declare-fun m!1263909 () Bool)

(assert (=> b!1379162 m!1263909))

(declare-fun m!1263911 () Bool)

(assert (=> b!1379162 m!1263911))

(declare-fun m!1263913 () Bool)

(assert (=> b!1379162 m!1263913))

(check-sat (not b!1379160) (not start!117220) (not b!1379162))
(check-sat)
