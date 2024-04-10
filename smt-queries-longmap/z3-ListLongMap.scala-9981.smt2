; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117894 () Bool)

(assert start!117894)

(declare-fun res!923089 () Bool)

(declare-fun e!783095 () Bool)

(assert (=> start!117894 (=> (not res!923089) (not e!783095))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117894 (= res!923089 (validMask!0 mask!3034))))

(assert (=> start!117894 e!783095))

(assert (=> start!117894 true))

(declare-datatypes ((array!94285 0))(
  ( (array!94286 (arr!45525 (Array (_ BitVec 32) (_ BitVec 64))) (size!46075 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94285)

(declare-fun array_inv!34553 (array!94285) Bool)

(assert (=> start!117894 (array_inv!34553 a!2971)))

(declare-fun b!1381459 () Bool)

(declare-fun res!923088 () Bool)

(assert (=> b!1381459 (=> (not res!923088) (not e!783095))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381459 (= res!923088 (and (= (size!46075 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46075 a!2971))))))

(declare-fun b!1381460 () Bool)

(declare-fun res!923087 () Bool)

(assert (=> b!1381460 (=> (not res!923087) (not e!783095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381460 (= res!923087 (validKeyInArray!0 (select (arr!45525 a!2971) i!1094)))))

(declare-fun b!1381461 () Bool)

(assert (=> b!1381461 (= e!783095 false)))

(declare-fun lt!608211 () Bool)

(declare-datatypes ((List!32059 0))(
  ( (Nil!32056) (Cons!32055 (h!33264 (_ BitVec 64)) (t!46753 List!32059)) )
))
(declare-fun arrayNoDuplicates!0 (array!94285 (_ BitVec 32) List!32059) Bool)

(assert (=> b!1381461 (= lt!608211 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32056))))

(assert (= (and start!117894 res!923089) b!1381459))

(assert (= (and b!1381459 res!923088) b!1381460))

(assert (= (and b!1381460 res!923087) b!1381461))

(declare-fun m!1266643 () Bool)

(assert (=> start!117894 m!1266643))

(declare-fun m!1266645 () Bool)

(assert (=> start!117894 m!1266645))

(declare-fun m!1266647 () Bool)

(assert (=> b!1381460 m!1266647))

(assert (=> b!1381460 m!1266647))

(declare-fun m!1266649 () Bool)

(assert (=> b!1381460 m!1266649))

(declare-fun m!1266651 () Bool)

(assert (=> b!1381461 m!1266651))

(check-sat (not start!117894) (not b!1381461) (not b!1381460))
