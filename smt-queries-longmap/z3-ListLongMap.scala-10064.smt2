; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118520 () Bool)

(assert start!118520)

(declare-fun b!1385725 () Bool)

(declare-fun res!926976 () Bool)

(declare-fun e!785125 () Bool)

(assert (=> b!1385725 (=> (not res!926976) (not e!785125))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94796 0))(
  ( (array!94797 (arr!45774 (Array (_ BitVec 32) (_ BitVec 64))) (size!46324 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94796)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385725 (= res!926976 (and (= (size!46324 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46324 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46324 a!2938))))))

(declare-fun b!1385726 () Bool)

(declare-fun res!926980 () Bool)

(assert (=> b!1385726 (=> (not res!926980) (not e!785125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94796 (_ BitVec 32)) Bool)

(assert (=> b!1385726 (= res!926980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385727 () Bool)

(declare-fun res!926974 () Bool)

(assert (=> b!1385727 (=> (not res!926974) (not e!785125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385727 (= res!926974 (validKeyInArray!0 (select (arr!45774 a!2938) startIndex!16)))))

(declare-fun b!1385728 () Bool)

(declare-fun res!926975 () Bool)

(assert (=> b!1385728 (=> (not res!926975) (not e!785125))))

(assert (=> b!1385728 (= res!926975 (validKeyInArray!0 (select (arr!45774 a!2938) i!1065)))))

(declare-fun res!926979 () Bool)

(assert (=> start!118520 (=> (not res!926979) (not e!785125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118520 (= res!926979 (validMask!0 mask!2987))))

(assert (=> start!118520 e!785125))

(assert (=> start!118520 true))

(declare-fun array_inv!34802 (array!94796) Bool)

(assert (=> start!118520 (array_inv!34802 a!2938)))

(declare-fun b!1385724 () Bool)

(assert (=> b!1385724 (= e!785125 (= i!1065 startIndex!16))))

(declare-fun b!1385729 () Bool)

(declare-fun res!926978 () Bool)

(assert (=> b!1385729 (=> (not res!926978) (not e!785125))))

(declare-datatypes ((List!32302 0))(
  ( (Nil!32299) (Cons!32298 (h!33507 (_ BitVec 64)) (t!46996 List!32302)) )
))
(declare-fun arrayNoDuplicates!0 (array!94796 (_ BitVec 32) List!32302) Bool)

(assert (=> b!1385729 (= res!926978 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32299))))

(declare-fun b!1385730 () Bool)

(declare-fun res!926977 () Bool)

(assert (=> b!1385730 (=> (not res!926977) (not e!785125))))

(assert (=> b!1385730 (= res!926977 (and (not (= (select (arr!45774 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45774 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118520 res!926979) b!1385725))

(assert (= (and b!1385725 res!926976) b!1385728))

(assert (= (and b!1385728 res!926975) b!1385729))

(assert (= (and b!1385729 res!926978) b!1385726))

(assert (= (and b!1385726 res!926980) b!1385730))

(assert (= (and b!1385730 res!926977) b!1385727))

(assert (= (and b!1385727 res!926974) b!1385724))

(declare-fun m!1271005 () Bool)

(assert (=> b!1385729 m!1271005))

(declare-fun m!1271007 () Bool)

(assert (=> start!118520 m!1271007))

(declare-fun m!1271009 () Bool)

(assert (=> start!118520 m!1271009))

(declare-fun m!1271011 () Bool)

(assert (=> b!1385727 m!1271011))

(assert (=> b!1385727 m!1271011))

(declare-fun m!1271013 () Bool)

(assert (=> b!1385727 m!1271013))

(declare-fun m!1271015 () Bool)

(assert (=> b!1385726 m!1271015))

(declare-fun m!1271017 () Bool)

(assert (=> b!1385728 m!1271017))

(assert (=> b!1385728 m!1271017))

(declare-fun m!1271019 () Bool)

(assert (=> b!1385728 m!1271019))

(assert (=> b!1385730 m!1271017))

(check-sat (not b!1385728) (not b!1385729) (not b!1385727) (not start!118520) (not b!1385726))
