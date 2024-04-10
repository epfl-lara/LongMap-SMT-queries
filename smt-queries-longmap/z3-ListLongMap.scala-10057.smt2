; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118478 () Bool)

(assert start!118478)

(declare-fun b!1385458 () Bool)

(declare-fun res!926709 () Bool)

(declare-fun e!784999 () Bool)

(assert (=> b!1385458 (=> (not res!926709) (not e!784999))))

(declare-datatypes ((array!94754 0))(
  ( (array!94755 (arr!45753 (Array (_ BitVec 32) (_ BitVec 64))) (size!46303 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94754)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385458 (= res!926709 (validKeyInArray!0 (select (arr!45753 a!2938) i!1065)))))

(declare-fun b!1385460 () Bool)

(assert (=> b!1385460 (= e!784999 false)))

(declare-fun lt!609249 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94754 (_ BitVec 32)) Bool)

(assert (=> b!1385460 (= lt!609249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385459 () Bool)

(declare-fun res!926707 () Bool)

(assert (=> b!1385459 (=> (not res!926707) (not e!784999))))

(declare-datatypes ((List!32281 0))(
  ( (Nil!32278) (Cons!32277 (h!33486 (_ BitVec 64)) (t!46975 List!32281)) )
))
(declare-fun arrayNoDuplicates!0 (array!94754 (_ BitVec 32) List!32281) Bool)

(assert (=> b!1385459 (= res!926707 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32278))))

(declare-fun res!926710 () Bool)

(assert (=> start!118478 (=> (not res!926710) (not e!784999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118478 (= res!926710 (validMask!0 mask!2987))))

(assert (=> start!118478 e!784999))

(assert (=> start!118478 true))

(declare-fun array_inv!34781 (array!94754) Bool)

(assert (=> start!118478 (array_inv!34781 a!2938)))

(declare-fun b!1385457 () Bool)

(declare-fun res!926708 () Bool)

(assert (=> b!1385457 (=> (not res!926708) (not e!784999))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385457 (= res!926708 (and (= (size!46303 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46303 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46303 a!2938))))))

(assert (= (and start!118478 res!926710) b!1385457))

(assert (= (and b!1385457 res!926708) b!1385458))

(assert (= (and b!1385458 res!926709) b!1385459))

(assert (= (and b!1385459 res!926707) b!1385460))

(declare-fun m!1270749 () Bool)

(assert (=> b!1385458 m!1270749))

(assert (=> b!1385458 m!1270749))

(declare-fun m!1270751 () Bool)

(assert (=> b!1385458 m!1270751))

(declare-fun m!1270753 () Bool)

(assert (=> b!1385460 m!1270753))

(declare-fun m!1270755 () Bool)

(assert (=> b!1385459 m!1270755))

(declare-fun m!1270757 () Bool)

(assert (=> start!118478 m!1270757))

(declare-fun m!1270759 () Bool)

(assert (=> start!118478 m!1270759))

(check-sat (not b!1385458) (not b!1385459) (not start!118478) (not b!1385460))
