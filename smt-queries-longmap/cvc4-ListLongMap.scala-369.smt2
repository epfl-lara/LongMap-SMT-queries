; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7058 () Bool)

(assert start!7058)

(declare-fun res!26602 () Bool)

(declare-fun e!28839 () Bool)

(assert (=> start!7058 (=> (not res!26602) (not e!28839))))

(declare-datatypes ((array!3017 0))(
  ( (array!3018 (arr!1449 (Array (_ BitVec 32) (_ BitVec 64))) (size!1672 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3017)

(declare-fun k!2989 () (_ BitVec 64))

(declare-fun i!1488 () (_ BitVec 32))

(assert (=> start!7058 (= res!26602 (and (bvslt (size!1672 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1672 a!4401)) (= (select (arr!1449 a!4401) i!1488) k!2989)))))

(assert (=> start!7058 e!28839))

(declare-fun array_inv!872 (array!3017) Bool)

(assert (=> start!7058 (array_inv!872 a!4401)))

(assert (=> start!7058 true))

(declare-fun b!45356 () Bool)

(declare-fun res!26601 () Bool)

(assert (=> b!45356 (=> (not res!26601) (not e!28839))))

(declare-fun arrayContainsKey!0 (array!3017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45356 (= res!26601 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45357 () Bool)

(assert (=> b!45357 (= e!28839 (not true))))

(assert (=> b!45357 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1292 0))(
  ( (Unit!1293) )
))
(declare-fun lt!20133 () Unit!1292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3017 (_ BitVec 64) (_ BitVec 32)) Unit!1292)

(assert (=> b!45357 (= lt!20133 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7058 res!26602) b!45356))

(assert (= (and b!45356 res!26601) b!45357))

(declare-fun m!39885 () Bool)

(assert (=> start!7058 m!39885))

(declare-fun m!39887 () Bool)

(assert (=> start!7058 m!39887))

(declare-fun m!39889 () Bool)

(assert (=> b!45356 m!39889))

(declare-fun m!39891 () Bool)

(assert (=> b!45357 m!39891))

(declare-fun m!39893 () Bool)

(assert (=> b!45357 m!39893))

(push 1)

(assert (not start!7058))

(assert (not b!45357))

(assert (not b!45356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

