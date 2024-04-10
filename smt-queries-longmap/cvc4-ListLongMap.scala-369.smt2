; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7062 () Bool)

(assert start!7062)

(declare-fun res!26634 () Bool)

(declare-fun e!28895 () Bool)

(assert (=> start!7062 (=> (not res!26634) (not e!28895))))

(declare-datatypes ((array!3045 0))(
  ( (array!3046 (arr!1463 (Array (_ BitVec 32) (_ BitVec 64))) (size!1685 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3045)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7062 (= res!26634 (and (bvslt (size!1685 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1685 a!4401)) (= (select (arr!1463 a!4401) i!1488) k!2989)))))

(assert (=> start!7062 e!28895))

(declare-fun array_inv!875 (array!3045) Bool)

(assert (=> start!7062 (array_inv!875 a!4401)))

(assert (=> start!7062 true))

(declare-fun b!45434 () Bool)

(declare-fun res!26633 () Bool)

(assert (=> b!45434 (=> (not res!26633) (not e!28895))))

(declare-fun arrayContainsKey!0 (array!3045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45434 (= res!26633 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45435 () Bool)

(assert (=> b!45435 (= e!28895 (not true))))

(assert (=> b!45435 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1289 0))(
  ( (Unit!1290) )
))
(declare-fun lt!20152 () Unit!1289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3045 (_ BitVec 64) (_ BitVec 32)) Unit!1289)

(assert (=> b!45435 (= lt!20152 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7062 res!26634) b!45434))

(assert (= (and b!45434 res!26633) b!45435))

(declare-fun m!39979 () Bool)

(assert (=> start!7062 m!39979))

(declare-fun m!39981 () Bool)

(assert (=> start!7062 m!39981))

(declare-fun m!39983 () Bool)

(assert (=> b!45434 m!39983))

(declare-fun m!39985 () Bool)

(assert (=> b!45435 m!39985))

(declare-fun m!39987 () Bool)

(assert (=> b!45435 m!39987))

(push 1)

(assert (not b!45434))

(assert (not b!45435))

(assert (not start!7062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

