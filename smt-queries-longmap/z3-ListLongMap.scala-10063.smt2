; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118514 () Bool)

(assert start!118514)

(declare-fun b!1385673 () Bool)

(declare-fun res!926923 () Bool)

(declare-fun e!785108 () Bool)

(assert (=> b!1385673 (=> (not res!926923) (not e!785108))))

(declare-datatypes ((array!94790 0))(
  ( (array!94791 (arr!45771 (Array (_ BitVec 32) (_ BitVec 64))) (size!46321 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94790)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385673 (= res!926923 (and (= (size!46321 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46321 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46321 a!2938))))))

(declare-fun b!1385675 () Bool)

(declare-fun res!926926 () Bool)

(assert (=> b!1385675 (=> (not res!926926) (not e!785108))))

(declare-datatypes ((List!32299 0))(
  ( (Nil!32296) (Cons!32295 (h!33504 (_ BitVec 64)) (t!46993 List!32299)) )
))
(declare-fun arrayNoDuplicates!0 (array!94790 (_ BitVec 32) List!32299) Bool)

(assert (=> b!1385675 (= res!926926 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32296))))

(declare-fun res!926924 () Bool)

(assert (=> start!118514 (=> (not res!926924) (not e!785108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118514 (= res!926924 (validMask!0 mask!2987))))

(assert (=> start!118514 e!785108))

(assert (=> start!118514 true))

(declare-fun array_inv!34799 (array!94790) Bool)

(assert (=> start!118514 (array_inv!34799 a!2938)))

(declare-fun b!1385676 () Bool)

(assert (=> b!1385676 (= e!785108 false)))

(declare-fun lt!609303 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94790 (_ BitVec 32)) Bool)

(assert (=> b!1385676 (= lt!609303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385674 () Bool)

(declare-fun res!926925 () Bool)

(assert (=> b!1385674 (=> (not res!926925) (not e!785108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385674 (= res!926925 (validKeyInArray!0 (select (arr!45771 a!2938) i!1065)))))

(assert (= (and start!118514 res!926924) b!1385673))

(assert (= (and b!1385673 res!926923) b!1385674))

(assert (= (and b!1385674 res!926925) b!1385675))

(assert (= (and b!1385675 res!926926) b!1385676))

(declare-fun m!1270965 () Bool)

(assert (=> b!1385675 m!1270965))

(declare-fun m!1270967 () Bool)

(assert (=> start!118514 m!1270967))

(declare-fun m!1270969 () Bool)

(assert (=> start!118514 m!1270969))

(declare-fun m!1270971 () Bool)

(assert (=> b!1385676 m!1270971))

(declare-fun m!1270973 () Bool)

(assert (=> b!1385674 m!1270973))

(assert (=> b!1385674 m!1270973))

(declare-fun m!1270975 () Bool)

(assert (=> b!1385674 m!1270975))

(check-sat (not b!1385674) (not start!118514) (not b!1385675) (not b!1385676))
