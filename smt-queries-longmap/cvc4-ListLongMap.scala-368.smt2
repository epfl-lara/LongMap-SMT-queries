; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7056 () Bool)

(assert start!7056)

(declare-fun res!26616 () Bool)

(declare-fun e!28877 () Bool)

(assert (=> start!7056 (=> (not res!26616) (not e!28877))))

(declare-datatypes ((array!3039 0))(
  ( (array!3040 (arr!1460 (Array (_ BitVec 32) (_ BitVec 64))) (size!1682 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3039)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7056 (= res!26616 (and (bvslt (size!1682 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1682 a!4401)) (= (select (arr!1460 a!4401) i!1488) k!2989)))))

(assert (=> start!7056 e!28877))

(declare-fun array_inv!872 (array!3039) Bool)

(assert (=> start!7056 (array_inv!872 a!4401)))

(assert (=> start!7056 true))

(declare-fun b!45416 () Bool)

(declare-fun res!26615 () Bool)

(assert (=> b!45416 (=> (not res!26615) (not e!28877))))

(declare-fun arrayContainsKey!0 (array!3039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45416 (= res!26615 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45417 () Bool)

(assert (=> b!45417 (= e!28877 (not (bvslt #b00000000000000000000000000000000 (size!1682 a!4401))))))

(assert (=> b!45417 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1283 0))(
  ( (Unit!1284) )
))
(declare-fun lt!20143 () Unit!1283)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3039 (_ BitVec 64) (_ BitVec 32)) Unit!1283)

(assert (=> b!45417 (= lt!20143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7056 res!26616) b!45416))

(assert (= (and b!45416 res!26615) b!45417))

(declare-fun m!39949 () Bool)

(assert (=> start!7056 m!39949))

(declare-fun m!39951 () Bool)

(assert (=> start!7056 m!39951))

(declare-fun m!39953 () Bool)

(assert (=> b!45416 m!39953))

(declare-fun m!39955 () Bool)

(assert (=> b!45417 m!39955))

(declare-fun m!39957 () Bool)

(assert (=> b!45417 m!39957))

(push 1)

(assert (not b!45416))

(assert (not b!45417))

(assert (not start!7056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

