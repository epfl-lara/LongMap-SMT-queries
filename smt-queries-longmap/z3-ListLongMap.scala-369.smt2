; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7060 () Bool)

(assert start!7060)

(declare-fun res!26628 () Bool)

(declare-fun e!28889 () Bool)

(assert (=> start!7060 (=> (not res!26628) (not e!28889))))

(declare-datatypes ((array!3043 0))(
  ( (array!3044 (arr!1462 (Array (_ BitVec 32) (_ BitVec 64))) (size!1684 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3043)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7060 (= res!26628 (and (bvslt (size!1684 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1684 a!4401)) (= (select (arr!1462 a!4401) i!1488) k0!2989)))))

(assert (=> start!7060 e!28889))

(declare-fun array_inv!874 (array!3043) Bool)

(assert (=> start!7060 (array_inv!874 a!4401)))

(assert (=> start!7060 true))

(declare-fun b!45428 () Bool)

(declare-fun res!26627 () Bool)

(assert (=> b!45428 (=> (not res!26627) (not e!28889))))

(declare-fun arrayContainsKey!0 (array!3043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45428 (= res!26627 (arrayContainsKey!0 a!4401 k0!2989 i!1488))))

(declare-fun b!45429 () Bool)

(assert (=> b!45429 (= e!28889 (not true))))

(assert (=> b!45429 (arrayContainsKey!0 a!4401 k0!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1287 0))(
  ( (Unit!1288) )
))
(declare-fun lt!20149 () Unit!1287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3043 (_ BitVec 64) (_ BitVec 32)) Unit!1287)

(assert (=> b!45429 (= lt!20149 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k0!2989 i!1488))))

(assert (= (and start!7060 res!26628) b!45428))

(assert (= (and b!45428 res!26627) b!45429))

(declare-fun m!39969 () Bool)

(assert (=> start!7060 m!39969))

(declare-fun m!39971 () Bool)

(assert (=> start!7060 m!39971))

(declare-fun m!39973 () Bool)

(assert (=> b!45428 m!39973))

(declare-fun m!39975 () Bool)

(assert (=> b!45429 m!39975))

(declare-fun m!39977 () Bool)

(assert (=> b!45429 m!39977))

(check-sat (not b!45428) (not b!45429) (not start!7060))
