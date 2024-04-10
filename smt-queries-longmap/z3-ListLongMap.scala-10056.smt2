; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118472 () Bool)

(assert start!118472)

(declare-fun res!926674 () Bool)

(declare-fun e!784982 () Bool)

(assert (=> start!118472 (=> (not res!926674) (not e!784982))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118472 (= res!926674 (validMask!0 mask!2987))))

(assert (=> start!118472 e!784982))

(assert (=> start!118472 true))

(declare-datatypes ((array!94748 0))(
  ( (array!94749 (arr!45750 (Array (_ BitVec 32) (_ BitVec 64))) (size!46300 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94748)

(declare-fun array_inv!34778 (array!94748) Bool)

(assert (=> start!118472 (array_inv!34778 a!2938)))

(declare-fun b!1385423 () Bool)

(declare-fun res!926672 () Bool)

(assert (=> b!1385423 (=> (not res!926672) (not e!784982))))

(declare-datatypes ((List!32278 0))(
  ( (Nil!32275) (Cons!32274 (h!33483 (_ BitVec 64)) (t!46972 List!32278)) )
))
(declare-fun arrayNoDuplicates!0 (array!94748 (_ BitVec 32) List!32278) Bool)

(assert (=> b!1385423 (= res!926672 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32275))))

(declare-fun b!1385424 () Bool)

(assert (=> b!1385424 (= e!784982 false)))

(declare-fun lt!609240 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94748 (_ BitVec 32)) Bool)

(assert (=> b!1385424 (= lt!609240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385422 () Bool)

(declare-fun res!926673 () Bool)

(assert (=> b!1385422 (=> (not res!926673) (not e!784982))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385422 (= res!926673 (validKeyInArray!0 (select (arr!45750 a!2938) i!1065)))))

(declare-fun b!1385421 () Bool)

(declare-fun res!926671 () Bool)

(assert (=> b!1385421 (=> (not res!926671) (not e!784982))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385421 (= res!926671 (and (= (size!46300 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46300 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46300 a!2938))))))

(assert (= (and start!118472 res!926674) b!1385421))

(assert (= (and b!1385421 res!926671) b!1385422))

(assert (= (and b!1385422 res!926673) b!1385423))

(assert (= (and b!1385423 res!926672) b!1385424))

(declare-fun m!1270713 () Bool)

(assert (=> start!118472 m!1270713))

(declare-fun m!1270715 () Bool)

(assert (=> start!118472 m!1270715))

(declare-fun m!1270717 () Bool)

(assert (=> b!1385423 m!1270717))

(declare-fun m!1270719 () Bool)

(assert (=> b!1385424 m!1270719))

(declare-fun m!1270721 () Bool)

(assert (=> b!1385422 m!1270721))

(assert (=> b!1385422 m!1270721))

(declare-fun m!1270723 () Bool)

(assert (=> b!1385422 m!1270723))

(check-sat (not b!1385422) (not b!1385424) (not start!118472) (not b!1385423))
