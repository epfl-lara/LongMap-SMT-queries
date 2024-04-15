; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7084 () Bool)

(assert start!7084)

(declare-fun res!26653 () Bool)

(declare-fun e!28899 () Bool)

(assert (=> start!7084 (=> (not res!26653) (not e!28899))))

(declare-datatypes ((array!3034 0))(
  ( (array!3035 (arr!1456 (Array (_ BitVec 32) (_ BitVec 64))) (size!1679 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3034)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7084 (= res!26653 (and (bvslt (size!1679 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1679 a!4401)) (= (select (arr!1456 a!4401) i!1488) k!2989)))))

(assert (=> start!7084 e!28899))

(declare-fun array_inv!879 (array!3034) Bool)

(assert (=> start!7084 (array_inv!879 a!4401)))

(assert (=> start!7084 true))

(declare-fun b!45407 () Bool)

(declare-fun res!26652 () Bool)

(assert (=> b!45407 (=> (not res!26652) (not e!28899))))

(declare-fun arrayContainsKey!0 (array!3034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45407 (= res!26652 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45408 () Bool)

(assert (=> b!45408 (= e!28899 (not true))))

(assert (=> b!45408 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1300 0))(
  ( (Unit!1301) )
))
(declare-fun lt!20145 () Unit!1300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3034 (_ BitVec 64) (_ BitVec 32)) Unit!1300)

(assert (=> b!45408 (= lt!20145 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7084 res!26653) b!45407))

(assert (= (and b!45407 res!26652) b!45408))

(declare-fun m!39949 () Bool)

(assert (=> start!7084 m!39949))

(declare-fun m!39951 () Bool)

(assert (=> start!7084 m!39951))

(declare-fun m!39953 () Bool)

(assert (=> b!45407 m!39953))

(declare-fun m!39955 () Bool)

(assert (=> b!45408 m!39955))

(declare-fun m!39957 () Bool)

(assert (=> b!45408 m!39957))

(push 1)

(assert (not b!45408))

(assert (not start!7084))

(assert (not b!45407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

