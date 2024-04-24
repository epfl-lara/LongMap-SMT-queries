; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7056 () Bool)

(assert start!7056)

(declare-fun res!26578 () Bool)

(declare-fun e!28827 () Bool)

(assert (=> start!7056 (=> (not res!26578) (not e!28827))))

(declare-datatypes ((array!3021 0))(
  ( (array!3022 (arr!1451 (Array (_ BitVec 32) (_ BitVec 64))) (size!1673 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3021)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7056 (= res!26578 (and (bvslt (size!1673 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1673 a!4401)) (= (select (arr!1451 a!4401) i!1488) k0!2989)))))

(assert (=> start!7056 e!28827))

(declare-fun array_inv!854 (array!3021) Bool)

(assert (=> start!7056 (array_inv!854 a!4401)))

(assert (=> start!7056 true))

(declare-fun b!45347 () Bool)

(declare-fun res!26579 () Bool)

(assert (=> b!45347 (=> (not res!26579) (not e!28827))))

(declare-fun arrayContainsKey!0 (array!3021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45347 (= res!26579 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45348 () Bool)

(assert (=> b!45348 (= e!28827 (not (bvslt #b00000000000000000000000000000000 (size!1673 a!4401))))))

(assert (=> b!45348 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1290 0))(
  ( (Unit!1291) )
))
(declare-fun lt!20094 () Unit!1290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3021 (_ BitVec 64) (_ BitVec 32)) Unit!1290)

(assert (=> b!45348 (= lt!20094 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7056 res!26578) b!45347))

(assert (= (and b!45347 res!26579) b!45348))

(declare-fun m!39805 () Bool)

(assert (=> start!7056 m!39805))

(declare-fun m!39807 () Bool)

(assert (=> start!7056 m!39807))

(declare-fun m!39809 () Bool)

(assert (=> b!45347 m!39809))

(declare-fun m!39811 () Bool)

(assert (=> b!45348 m!39811))

(declare-fun m!39813 () Bool)

(assert (=> b!45348 m!39813))

(check-sat (not b!45347) (not start!7056) (not b!45348))
(check-sat)
