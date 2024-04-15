; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7050 () Bool)

(assert start!7050)

(declare-fun res!26578 () Bool)

(declare-fun e!28816 () Bool)

(assert (=> start!7050 (=> (not res!26578) (not e!28816))))

(declare-datatypes ((array!3009 0))(
  ( (array!3010 (arr!1445 (Array (_ BitVec 32) (_ BitVec 64))) (size!1668 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3009)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7050 (= res!26578 (and (bvslt (size!1668 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1668 a!4401)) (= (select (arr!1445 a!4401) i!1488) k0!2989)))))

(assert (=> start!7050 e!28816))

(declare-fun array_inv!868 (array!3009) Bool)

(assert (=> start!7050 (array_inv!868 a!4401)))

(assert (=> start!7050 true))

(declare-fun b!45332 () Bool)

(declare-fun res!26577 () Bool)

(assert (=> b!45332 (=> (not res!26577) (not e!28816))))

(declare-fun arrayContainsKey!0 (array!3009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45332 (= res!26577 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45333 () Bool)

(assert (=> b!45333 (= e!28816 (not (bvslt #b00000000000000000000000000000000 (size!1668 a!4401))))))

(assert (=> b!45333 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1284 0))(
  ( (Unit!1285) )
))
(declare-fun lt!20121 () Unit!1284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3009 (_ BitVec 64) (_ BitVec 32)) Unit!1284)

(assert (=> b!45333 (= lt!20121 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7050 res!26578) b!45332))

(assert (= (and b!45332 res!26577) b!45333))

(declare-fun m!39845 () Bool)

(assert (=> start!7050 m!39845))

(declare-fun m!39847 () Bool)

(assert (=> start!7050 m!39847))

(declare-fun m!39849 () Bool)

(assert (=> b!45332 m!39849))

(declare-fun m!39851 () Bool)

(assert (=> b!45333 m!39851))

(declare-fun m!39853 () Bool)

(assert (=> b!45333 m!39853))

(check-sat (not start!7050) (not b!45332) (not b!45333))
(check-sat)
