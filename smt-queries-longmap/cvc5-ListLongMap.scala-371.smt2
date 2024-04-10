; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7078 () Bool)

(assert start!7078)

(declare-fun res!26661 () Bool)

(declare-fun e!28930 () Bool)

(assert (=> start!7078 (=> (not res!26661) (not e!28930))))

(declare-datatypes ((array!3055 0))(
  ( (array!3056 (arr!1467 (Array (_ BitVec 32) (_ BitVec 64))) (size!1689 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3055)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7078 (= res!26661 (and (bvslt (size!1689 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1689 a!4401)) (= (select (arr!1467 a!4401) i!1488) k!2989)))))

(assert (=> start!7078 e!28930))

(declare-fun array_inv!879 (array!3055) Bool)

(assert (=> start!7078 (array_inv!879 a!4401)))

(assert (=> start!7078 true))

(declare-fun b!45461 () Bool)

(declare-fun res!26660 () Bool)

(assert (=> b!45461 (=> (not res!26660) (not e!28930))))

(declare-fun arrayContainsKey!0 (array!3055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45461 (= res!26660 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45462 () Bool)

(assert (=> b!45462 (= e!28930 (not true))))

(assert (=> b!45462 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1291 0))(
  ( (Unit!1292) )
))
(declare-fun lt!20155 () Unit!1291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3055 (_ BitVec 64) (_ BitVec 32)) Unit!1291)

(assert (=> b!45462 (= lt!20155 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7078 res!26661) b!45461))

(assert (= (and b!45461 res!26660) b!45462))

(declare-fun m!40011 () Bool)

(assert (=> start!7078 m!40011))

(declare-fun m!40013 () Bool)

(assert (=> start!7078 m!40013))

(declare-fun m!40015 () Bool)

(assert (=> b!45461 m!40015))

(declare-fun m!40017 () Bool)

(assert (=> b!45462 m!40017))

(declare-fun m!40019 () Bool)

(assert (=> b!45462 m!40019))

(push 1)

(assert (not b!45461))

(assert (not b!45462))

(assert (not start!7078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

