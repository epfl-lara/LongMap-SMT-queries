; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118510 () Bool)

(assert start!118510)

(declare-fun b!1385651 () Bool)

(declare-fun res!926899 () Bool)

(declare-fun e!785095 () Bool)

(assert (=> b!1385651 (=> (not res!926899) (not e!785095))))

(declare-datatypes ((array!94786 0))(
  ( (array!94787 (arr!45769 (Array (_ BitVec 32) (_ BitVec 64))) (size!46319 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94786)

(declare-datatypes ((List!32297 0))(
  ( (Nil!32294) (Cons!32293 (h!33502 (_ BitVec 64)) (t!46991 List!32297)) )
))
(declare-fun arrayNoDuplicates!0 (array!94786 (_ BitVec 32) List!32297) Bool)

(assert (=> b!1385651 (= res!926899 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32294))))

(declare-fun b!1385649 () Bool)

(declare-fun res!926902 () Bool)

(assert (=> b!1385649 (=> (not res!926902) (not e!785095))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385649 (= res!926902 (and (= (size!46319 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46319 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46319 a!2938))))))

(declare-fun b!1385652 () Bool)

(assert (=> b!1385652 (= e!785095 false)))

(declare-fun lt!609297 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94786 (_ BitVec 32)) Bool)

(assert (=> b!1385652 (= lt!609297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385650 () Bool)

(declare-fun res!926901 () Bool)

(assert (=> b!1385650 (=> (not res!926901) (not e!785095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385650 (= res!926901 (validKeyInArray!0 (select (arr!45769 a!2938) i!1065)))))

(declare-fun res!926900 () Bool)

(assert (=> start!118510 (=> (not res!926900) (not e!785095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118510 (= res!926900 (validMask!0 mask!2987))))

(assert (=> start!118510 e!785095))

(assert (=> start!118510 true))

(declare-fun array_inv!34797 (array!94786) Bool)

(assert (=> start!118510 (array_inv!34797 a!2938)))

(assert (= (and start!118510 res!926900) b!1385649))

(assert (= (and b!1385649 res!926902) b!1385650))

(assert (= (and b!1385650 res!926901) b!1385651))

(assert (= (and b!1385651 res!926899) b!1385652))

(declare-fun m!1270941 () Bool)

(assert (=> b!1385651 m!1270941))

(declare-fun m!1270943 () Bool)

(assert (=> b!1385652 m!1270943))

(declare-fun m!1270945 () Bool)

(assert (=> b!1385650 m!1270945))

(assert (=> b!1385650 m!1270945))

(declare-fun m!1270947 () Bool)

(assert (=> b!1385650 m!1270947))

(declare-fun m!1270949 () Bool)

(assert (=> start!118510 m!1270949))

(declare-fun m!1270951 () Bool)

(assert (=> start!118510 m!1270951))

(push 1)

(assert (not b!1385652))

(assert (not b!1385650))

(assert (not b!1385651))

(assert (not start!118510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

