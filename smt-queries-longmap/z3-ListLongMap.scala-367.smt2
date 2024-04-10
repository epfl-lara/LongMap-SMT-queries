; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7048 () Bool)

(assert start!7048)

(declare-fun res!26592 () Bool)

(declare-fun e!28852 () Bool)

(assert (=> start!7048 (=> (not res!26592) (not e!28852))))

(declare-datatypes ((array!3031 0))(
  ( (array!3032 (arr!1456 (Array (_ BitVec 32) (_ BitVec 64))) (size!1678 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3031)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7048 (= res!26592 (and (bvslt (size!1678 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1678 a!4401)) (= (select (arr!1456 a!4401) i!1488) k0!2989)))))

(assert (=> start!7048 e!28852))

(declare-fun array_inv!868 (array!3031) Bool)

(assert (=> start!7048 (array_inv!868 a!4401)))

(assert (=> start!7048 true))

(declare-fun b!45392 () Bool)

(declare-fun res!26591 () Bool)

(assert (=> b!45392 (=> (not res!26591) (not e!28852))))

(declare-fun arrayContainsKey!0 (array!3031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45392 (= res!26591 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45393 () Bool)

(assert (=> b!45393 (= e!28852 (not true))))

(assert (=> b!45393 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1275 0))(
  ( (Unit!1276) )
))
(declare-fun lt!20131 () Unit!1275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3031 (_ BitVec 64) (_ BitVec 32)) Unit!1275)

(assert (=> b!45393 (= lt!20131 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7048 res!26592) b!45392))

(assert (= (and b!45392 res!26591) b!45393))

(declare-fun m!39909 () Bool)

(assert (=> start!7048 m!39909))

(declare-fun m!39911 () Bool)

(assert (=> start!7048 m!39911))

(declare-fun m!39913 () Bool)

(assert (=> b!45392 m!39913))

(declare-fun m!39915 () Bool)

(assert (=> b!45393 m!39915))

(declare-fun m!39917 () Bool)

(assert (=> b!45393 m!39917))

(check-sat (not b!45392) (not b!45393) (not start!7048))
