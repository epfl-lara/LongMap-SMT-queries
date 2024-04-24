; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7050 () Bool)

(assert start!7050)

(declare-fun res!26560 () Bool)

(declare-fun e!28809 () Bool)

(assert (=> start!7050 (=> (not res!26560) (not e!28809))))

(declare-datatypes ((array!3015 0))(
  ( (array!3016 (arr!1448 (Array (_ BitVec 32) (_ BitVec 64))) (size!1670 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3015)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7050 (= res!26560 (and (bvslt (size!1670 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1670 a!4401)) (= (select (arr!1448 a!4401) i!1488) k0!2989)))))

(assert (=> start!7050 e!28809))

(declare-fun array_inv!851 (array!3015) Bool)

(assert (=> start!7050 (array_inv!851 a!4401)))

(assert (=> start!7050 true))

(declare-fun b!45329 () Bool)

(declare-fun res!26561 () Bool)

(assert (=> b!45329 (=> (not res!26561) (not e!28809))))

(declare-fun arrayContainsKey!0 (array!3015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45329 (= res!26561 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45330 () Bool)

(assert (=> b!45330 (= e!28809 (not true))))

(assert (=> b!45330 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1284 0))(
  ( (Unit!1285) )
))
(declare-fun lt!20085 () Unit!1284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3015 (_ BitVec 64) (_ BitVec 32)) Unit!1284)

(assert (=> b!45330 (= lt!20085 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7050 res!26560) b!45329))

(assert (= (and b!45329 res!26561) b!45330))

(declare-fun m!39775 () Bool)

(assert (=> start!7050 m!39775))

(declare-fun m!39777 () Bool)

(assert (=> start!7050 m!39777))

(declare-fun m!39779 () Bool)

(assert (=> b!45329 m!39779))

(declare-fun m!39781 () Bool)

(assert (=> b!45330 m!39781))

(declare-fun m!39783 () Bool)

(assert (=> b!45330 m!39783))

(check-sat (not b!45330) (not start!7050) (not b!45329))
(check-sat)
