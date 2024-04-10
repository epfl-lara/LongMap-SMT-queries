; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7054 () Bool)

(assert start!7054)

(declare-fun res!26609 () Bool)

(declare-fun e!28870 () Bool)

(assert (=> start!7054 (=> (not res!26609) (not e!28870))))

(declare-datatypes ((array!3037 0))(
  ( (array!3038 (arr!1459 (Array (_ BitVec 32) (_ BitVec 64))) (size!1681 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3037)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7054 (= res!26609 (and (bvslt (size!1681 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1681 a!4401)) (= (select (arr!1459 a!4401) i!1488) k0!2989)))))

(assert (=> start!7054 e!28870))

(declare-fun array_inv!871 (array!3037) Bool)

(assert (=> start!7054 (array_inv!871 a!4401)))

(assert (=> start!7054 true))

(declare-fun b!45410 () Bool)

(declare-fun res!26610 () Bool)

(assert (=> b!45410 (=> (not res!26610) (not e!28870))))

(declare-fun arrayContainsKey!0 (array!3037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45410 (= res!26610 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45411 () Bool)

(assert (=> b!45411 (= e!28870 (not (bvslt #b00000000000000000000000000000000 (size!1681 a!4401))))))

(assert (=> b!45411 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1281 0))(
  ( (Unit!1282) )
))
(declare-fun lt!20140 () Unit!1281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3037 (_ BitVec 64) (_ BitVec 32)) Unit!1281)

(assert (=> b!45411 (= lt!20140 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7054 res!26609) b!45410))

(assert (= (and b!45410 res!26610) b!45411))

(declare-fun m!39939 () Bool)

(assert (=> start!7054 m!39939))

(declare-fun m!39941 () Bool)

(assert (=> start!7054 m!39941))

(declare-fun m!39943 () Bool)

(assert (=> b!45410 m!39943))

(declare-fun m!39945 () Bool)

(assert (=> b!45411 m!39945))

(declare-fun m!39947 () Bool)

(assert (=> b!45411 m!39947))

(check-sat (not b!45410) (not b!45411) (not start!7054))
(check-sat)
