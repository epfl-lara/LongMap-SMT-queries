; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117000 () Bool)

(assert start!117000)

(declare-fun res!920526 () Bool)

(declare-fun e!780543 () Bool)

(assert (=> start!117000 (=> (not res!920526) (not e!780543))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93642 0))(
  ( (array!93643 (arr!45223 (Array (_ BitVec 32) (_ BitVec 64))) (size!45773 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93642)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117000 (= res!920526 (and (bvslt (size!45773 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45773 a!4197))))))

(assert (=> start!117000 e!780543))

(declare-fun array_inv!34251 (array!93642) Bool)

(assert (=> start!117000 (array_inv!34251 a!4197)))

(assert (=> start!117000 true))

(declare-fun b!1377899 () Bool)

(declare-fun res!920525 () Bool)

(assert (=> b!1377899 (=> (not res!920525) (not e!780543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377899 (= res!920525 (validKeyInArray!0 (select (arr!45223 a!4197) to!360)))))

(declare-fun b!1377900 () Bool)

(declare-fun res!920527 () Bool)

(assert (=> b!1377900 (=> (not res!920527) (not e!780543))))

(assert (=> b!1377900 (= res!920527 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377901 () Bool)

(assert (=> b!1377901 (= e!780543 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93642 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377901 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45739 0))(
  ( (Unit!45740) )
))
(declare-fun lt!606226 () Unit!45739)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45739)

(assert (=> b!1377901 (= lt!606226 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117000 res!920526) b!1377899))

(assert (= (and b!1377899 res!920525) b!1377900))

(assert (= (and b!1377900 res!920527) b!1377901))

(declare-fun m!1262343 () Bool)

(assert (=> start!117000 m!1262343))

(declare-fun m!1262345 () Bool)

(assert (=> b!1377899 m!1262345))

(assert (=> b!1377899 m!1262345))

(declare-fun m!1262347 () Bool)

(assert (=> b!1377899 m!1262347))

(declare-fun m!1262349 () Bool)

(assert (=> b!1377901 m!1262349))

(declare-fun m!1262351 () Bool)

(assert (=> b!1377901 m!1262351))

(declare-fun m!1262353 () Bool)

(assert (=> b!1377901 m!1262353))

(declare-fun m!1262355 () Bool)

(assert (=> b!1377901 m!1262355))

(push 1)

(assert (not start!117000))

(assert (not b!1377901))

(assert (not b!1377899))

(check-sat)

