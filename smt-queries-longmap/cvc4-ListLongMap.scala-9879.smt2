; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116994 () Bool)

(assert start!116994)

(declare-fun res!920499 () Bool)

(declare-fun e!780526 () Bool)

(assert (=> start!116994 (=> (not res!920499) (not e!780526))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93636 0))(
  ( (array!93637 (arr!45220 (Array (_ BitVec 32) (_ BitVec 64))) (size!45770 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93636)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116994 (= res!920499 (and (bvslt (size!45770 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45770 a!4197))))))

(assert (=> start!116994 e!780526))

(declare-fun array_inv!34248 (array!93636) Bool)

(assert (=> start!116994 (array_inv!34248 a!4197)))

(assert (=> start!116994 true))

(declare-fun b!1377872 () Bool)

(declare-fun res!920498 () Bool)

(assert (=> b!1377872 (=> (not res!920498) (not e!780526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377872 (= res!920498 (validKeyInArray!0 (select (arr!45220 a!4197) to!360)))))

(declare-fun b!1377873 () Bool)

(declare-fun res!920500 () Bool)

(assert (=> b!1377873 (=> (not res!920500) (not e!780526))))

(assert (=> b!1377873 (= res!920500 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377874 () Bool)

(assert (=> b!1377874 (= e!780526 (not (bvsle to!360 (size!45770 a!4197))))))

(declare-fun arrayCountValidKeys!0 (array!93636 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377874 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45733 0))(
  ( (Unit!45734) )
))
(declare-fun lt!606217 () Unit!45733)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45733)

(assert (=> b!1377874 (= lt!606217 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116994 res!920499) b!1377872))

(assert (= (and b!1377872 res!920498) b!1377873))

(assert (= (and b!1377873 res!920500) b!1377874))

(declare-fun m!1262301 () Bool)

(assert (=> start!116994 m!1262301))

(declare-fun m!1262303 () Bool)

(assert (=> b!1377872 m!1262303))

(assert (=> b!1377872 m!1262303))

(declare-fun m!1262305 () Bool)

(assert (=> b!1377872 m!1262305))

(declare-fun m!1262307 () Bool)

(assert (=> b!1377874 m!1262307))

(declare-fun m!1262309 () Bool)

(assert (=> b!1377874 m!1262309))

(declare-fun m!1262311 () Bool)

(assert (=> b!1377874 m!1262311))

(declare-fun m!1262313 () Bool)

(assert (=> b!1377874 m!1262313))

(push 1)

(assert (not b!1377872))

(assert (not b!1377874))

(assert (not start!116994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

