; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7086 () Bool)

(assert start!7086)

(declare-fun res!26642 () Bool)

(declare-fun e!28899 () Bool)

(assert (=> start!7086 (=> (not res!26642) (not e!28899))))

(declare-datatypes ((array!3044 0))(
  ( (array!3045 (arr!1461 (Array (_ BitVec 32) (_ BitVec 64))) (size!1683 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3044)

(declare-fun k!2989 () (_ BitVec 64))

(declare-fun i!1488 () (_ BitVec 32))

(assert (=> start!7086 (= res!26642 (and (bvslt (size!1683 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1683 a!4401)) (= (select (arr!1461 a!4401) i!1488) k!2989)))))

(assert (=> start!7086 e!28899))

(declare-fun array_inv!864 (array!3044) Bool)

(assert (=> start!7086 (array_inv!864 a!4401)))

(assert (=> start!7086 true))

(declare-fun b!45410 () Bool)

(declare-fun res!26641 () Bool)

(assert (=> b!45410 (=> (not res!26641) (not e!28899))))

(declare-fun arrayContainsKey!0 (array!3044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45410 (= res!26641 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45411 () Bool)

(assert (=> b!45411 (= e!28899 (not true))))

(assert (=> b!45411 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1304 0))(
  ( (Unit!1305) )
))
(declare-fun lt!20115 () Unit!1304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3044 (_ BitVec 64) (_ BitVec 32)) Unit!1304)

(assert (=> b!45411 (= lt!20115 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7086 res!26642) b!45410))

(assert (= (and b!45410 res!26641) b!45411))

(declare-fun m!39897 () Bool)

(assert (=> start!7086 m!39897))

(declare-fun m!39899 () Bool)

(assert (=> start!7086 m!39899))

(declare-fun m!39901 () Bool)

(assert (=> b!45410 m!39901))

(declare-fun m!39903 () Bool)

(assert (=> b!45411 m!39903))

(declare-fun m!39905 () Bool)

(assert (=> b!45411 m!39905))

(push 1)

(assert (not b!45411))

(assert (not start!7086))

(assert (not b!45410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

