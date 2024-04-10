; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118460 () Bool)

(assert start!118460)

(declare-fun b!1385352 () Bool)

(declare-fun e!784946 () Bool)

(assert (=> b!1385352 (= e!784946 false)))

(declare-fun lt!609222 () Bool)

(declare-datatypes ((array!94736 0))(
  ( (array!94737 (arr!45744 (Array (_ BitVec 32) (_ BitVec 64))) (size!46294 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94736)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94736 (_ BitVec 32)) Bool)

(assert (=> b!1385352 (= lt!609222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385349 () Bool)

(declare-fun res!926601 () Bool)

(assert (=> b!1385349 (=> (not res!926601) (not e!784946))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385349 (= res!926601 (and (= (size!46294 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46294 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46294 a!2938))))))

(declare-fun b!1385351 () Bool)

(declare-fun res!926599 () Bool)

(assert (=> b!1385351 (=> (not res!926599) (not e!784946))))

(declare-datatypes ((List!32272 0))(
  ( (Nil!32269) (Cons!32268 (h!33477 (_ BitVec 64)) (t!46966 List!32272)) )
))
(declare-fun arrayNoDuplicates!0 (array!94736 (_ BitVec 32) List!32272) Bool)

(assert (=> b!1385351 (= res!926599 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32269))))

(declare-fun b!1385350 () Bool)

(declare-fun res!926602 () Bool)

(assert (=> b!1385350 (=> (not res!926602) (not e!784946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385350 (= res!926602 (validKeyInArray!0 (select (arr!45744 a!2938) i!1065)))))

(declare-fun res!926600 () Bool)

(assert (=> start!118460 (=> (not res!926600) (not e!784946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118460 (= res!926600 (validMask!0 mask!2987))))

(assert (=> start!118460 e!784946))

(assert (=> start!118460 true))

(declare-fun array_inv!34772 (array!94736) Bool)

(assert (=> start!118460 (array_inv!34772 a!2938)))

(assert (= (and start!118460 res!926600) b!1385349))

(assert (= (and b!1385349 res!926601) b!1385350))

(assert (= (and b!1385350 res!926602) b!1385351))

(assert (= (and b!1385351 res!926599) b!1385352))

(declare-fun m!1270641 () Bool)

(assert (=> b!1385352 m!1270641))

(declare-fun m!1270643 () Bool)

(assert (=> b!1385351 m!1270643))

(declare-fun m!1270645 () Bool)

(assert (=> b!1385350 m!1270645))

(assert (=> b!1385350 m!1270645))

(declare-fun m!1270647 () Bool)

(assert (=> b!1385350 m!1270647))

(declare-fun m!1270649 () Bool)

(assert (=> start!118460 m!1270649))

(declare-fun m!1270651 () Bool)

(assert (=> start!118460 m!1270651))

(check-sat (not b!1385351) (not start!118460) (not b!1385352) (not b!1385350))
