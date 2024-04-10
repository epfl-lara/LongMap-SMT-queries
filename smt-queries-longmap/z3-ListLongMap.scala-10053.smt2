; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118454 () Bool)

(assert start!118454)

(declare-fun b!1385309 () Bool)

(declare-fun res!926563 () Bool)

(declare-fun e!784928 () Bool)

(assert (=> b!1385309 (=> (not res!926563) (not e!784928))))

(declare-datatypes ((array!94730 0))(
  ( (array!94731 (arr!45741 (Array (_ BitVec 32) (_ BitVec 64))) (size!46291 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94730)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385309 (= res!926563 (validKeyInArray!0 (select (arr!45741 a!2938) i!1065)))))

(declare-fun b!1385310 () Bool)

(declare-fun res!926561 () Bool)

(assert (=> b!1385310 (=> (not res!926561) (not e!784928))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385310 (= res!926561 (and (= (size!46291 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46291 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46291 a!2938))))))

(declare-fun b!1385311 () Bool)

(declare-fun res!926559 () Bool)

(assert (=> b!1385311 (=> (not res!926559) (not e!784928))))

(declare-datatypes ((List!32269 0))(
  ( (Nil!32266) (Cons!32265 (h!33474 (_ BitVec 64)) (t!46963 List!32269)) )
))
(declare-fun arrayNoDuplicates!0 (array!94730 (_ BitVec 32) List!32269) Bool)

(assert (=> b!1385311 (= res!926559 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32266))))

(declare-fun b!1385312 () Bool)

(declare-fun res!926560 () Bool)

(assert (=> b!1385312 (=> (not res!926560) (not e!784928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94730 (_ BitVec 32)) Bool)

(assert (=> b!1385312 (= res!926560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385313 () Bool)

(assert (=> b!1385313 (= e!784928 (bvslt (bvsub (size!46291 a!2938) startIndex!16) #b00000000000000000000000000000000))))

(declare-fun res!926562 () Bool)

(assert (=> start!118454 (=> (not res!926562) (not e!784928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118454 (= res!926562 (validMask!0 mask!2987))))

(assert (=> start!118454 e!784928))

(assert (=> start!118454 true))

(declare-fun array_inv!34769 (array!94730) Bool)

(assert (=> start!118454 (array_inv!34769 a!2938)))

(assert (= (and start!118454 res!926562) b!1385310))

(assert (= (and b!1385310 res!926561) b!1385309))

(assert (= (and b!1385309 res!926563) b!1385311))

(assert (= (and b!1385311 res!926559) b!1385312))

(assert (= (and b!1385312 res!926560) b!1385313))

(declare-fun m!1270605 () Bool)

(assert (=> b!1385309 m!1270605))

(assert (=> b!1385309 m!1270605))

(declare-fun m!1270607 () Bool)

(assert (=> b!1385309 m!1270607))

(declare-fun m!1270609 () Bool)

(assert (=> b!1385311 m!1270609))

(declare-fun m!1270611 () Bool)

(assert (=> b!1385312 m!1270611))

(declare-fun m!1270613 () Bool)

(assert (=> start!118454 m!1270613))

(declare-fun m!1270615 () Bool)

(assert (=> start!118454 m!1270615))

(check-sat (not b!1385311) (not start!118454) (not b!1385309) (not b!1385312))
(check-sat)
