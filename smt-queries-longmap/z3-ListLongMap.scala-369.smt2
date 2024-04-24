; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7062 () Bool)

(assert start!7062)

(declare-fun res!26596 () Bool)

(declare-fun e!28845 () Bool)

(assert (=> start!7062 (=> (not res!26596) (not e!28845))))

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(declare-datatypes ((array!3027 0))(
  ( (array!3028 (arr!1454 (Array (_ BitVec 32) (_ BitVec 64))) (size!1676 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3027)

(assert (=> start!7062 (= res!26596 (and (bvslt (size!1676 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1676 a!4401)) (= (select (arr!1454 a!4401) i!1488) k0!2989)))))

(assert (=> start!7062 e!28845))

(declare-fun array_inv!857 (array!3027) Bool)

(assert (=> start!7062 (array_inv!857 a!4401)))

(assert (=> start!7062 true))

(declare-fun b!45365 () Bool)

(declare-fun res!26597 () Bool)

(assert (=> b!45365 (=> (not res!26597) (not e!28845))))

(declare-fun arrayContainsKey!0 (array!3027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45365 (= res!26597 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45366 () Bool)

(assert (=> b!45366 (= e!28845 (not true))))

(assert (=> b!45366 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1296 0))(
  ( (Unit!1297) )
))
(declare-fun lt!20103 () Unit!1296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3027 (_ BitVec 64) (_ BitVec 32)) Unit!1296)

(assert (=> b!45366 (= lt!20103 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7062 res!26596) b!45365))

(assert (= (and b!45365 res!26597) b!45366))

(declare-fun m!39835 () Bool)

(assert (=> start!7062 m!39835))

(declare-fun m!39837 () Bool)

(assert (=> start!7062 m!39837))

(declare-fun m!39839 () Bool)

(assert (=> b!45365 m!39839))

(declare-fun m!39841 () Bool)

(assert (=> b!45366 m!39841))

(declare-fun m!39843 () Bool)

(assert (=> b!45366 m!39843))

(check-sat (not b!45365) (not b!45366) (not start!7062))
(check-sat)
