; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118598 () Bool)

(assert start!118598)

(declare-fun b!1386499 () Bool)

(declare-fun e!785423 () Bool)

(declare-datatypes ((array!94874 0))(
  ( (array!94875 (arr!45813 (Array (_ BitVec 32) (_ BitVec 64))) (size!46363 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94874)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386499 (= e!785423 (validKeyInArray!0 (select (arr!45813 a!2938) startIndex!16)))))

(declare-fun b!1386500 () Bool)

(declare-fun e!785424 () Bool)

(assert (=> b!1386500 (= e!785424 false)))

(declare-datatypes ((Unit!46310 0))(
  ( (Unit!46311) )
))
(declare-fun lt!609486 () Unit!46310)

(declare-fun e!785425 () Unit!46310)

(assert (=> b!1386500 (= lt!609486 e!785425)))

(declare-fun c!128847 () Bool)

(assert (=> b!1386500 (= c!128847 e!785423)))

(declare-fun res!927686 () Bool)

(assert (=> b!1386500 (=> (not res!927686) (not e!785423))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386500 (= res!927686 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386501 () Bool)

(declare-fun res!927685 () Bool)

(assert (=> b!1386501 (=> (not res!927685) (not e!785424))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94874 (_ BitVec 32)) Bool)

(assert (=> b!1386501 (= res!927685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386502 () Bool)

(declare-fun res!927691 () Bool)

(assert (=> b!1386502 (=> (not res!927691) (not e!785424))))

(assert (=> b!1386502 (= res!927691 (and (= (size!46363 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46363 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46363 a!2938))))))

(declare-fun b!1386503 () Bool)

(declare-fun res!927687 () Bool)

(assert (=> b!1386503 (=> (not res!927687) (not e!785424))))

(assert (=> b!1386503 (= res!927687 (and (not (= (select (arr!45813 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45813 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386504 () Bool)

(declare-fun res!927688 () Bool)

(assert (=> b!1386504 (=> (not res!927688) (not e!785424))))

(declare-datatypes ((List!32341 0))(
  ( (Nil!32338) (Cons!32337 (h!33546 (_ BitVec 64)) (t!47035 List!32341)) )
))
(declare-fun arrayNoDuplicates!0 (array!94874 (_ BitVec 32) List!32341) Bool)

(assert (=> b!1386504 (= res!927688 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32338))))

(declare-fun res!927689 () Bool)

(assert (=> start!118598 (=> (not res!927689) (not e!785424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118598 (= res!927689 (validMask!0 mask!2987))))

(assert (=> start!118598 e!785424))

(assert (=> start!118598 true))

(declare-fun array_inv!34841 (array!94874) Bool)

(assert (=> start!118598 (array_inv!34841 a!2938)))

(declare-fun b!1386505 () Bool)

(declare-fun Unit!46312 () Unit!46310)

(assert (=> b!1386505 (= e!785425 Unit!46312)))

(declare-fun b!1386506 () Bool)

(declare-fun lt!609485 () Unit!46310)

(assert (=> b!1386506 (= e!785425 lt!609485)))

(declare-fun lt!609484 () Unit!46310)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46310)

(assert (=> b!1386506 (= lt!609484 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10156 0))(
  ( (MissingZero!10156 (index!42995 (_ BitVec 32))) (Found!10156 (index!42996 (_ BitVec 32))) (Intermediate!10156 (undefined!10968 Bool) (index!42997 (_ BitVec 32)) (x!124613 (_ BitVec 32))) (Undefined!10156) (MissingVacant!10156 (index!42998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94874 (_ BitVec 32)) SeekEntryResult!10156)

(assert (=> b!1386506 (= (seekEntryOrOpen!0 (select (arr!45813 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45813 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94875 (store (arr!45813 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46310)

(assert (=> b!1386506 (= lt!609485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386506 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386507 () Bool)

(declare-fun res!927690 () Bool)

(assert (=> b!1386507 (=> (not res!927690) (not e!785424))))

(assert (=> b!1386507 (= res!927690 (validKeyInArray!0 (select (arr!45813 a!2938) i!1065)))))

(assert (= (and start!118598 res!927689) b!1386502))

(assert (= (and b!1386502 res!927691) b!1386507))

(assert (= (and b!1386507 res!927690) b!1386504))

(assert (= (and b!1386504 res!927688) b!1386501))

(assert (= (and b!1386501 res!927685) b!1386503))

(assert (= (and b!1386503 res!927687) b!1386500))

(assert (= (and b!1386500 res!927686) b!1386499))

(assert (= (and b!1386500 c!128847) b!1386506))

(assert (= (and b!1386500 (not c!128847)) b!1386505))

(declare-fun m!1271871 () Bool)

(assert (=> b!1386504 m!1271871))

(declare-fun m!1271873 () Bool)

(assert (=> b!1386501 m!1271873))

(declare-fun m!1271875 () Bool)

(assert (=> b!1386506 m!1271875))

(declare-fun m!1271877 () Bool)

(assert (=> b!1386506 m!1271877))

(assert (=> b!1386506 m!1271877))

(declare-fun m!1271879 () Bool)

(assert (=> b!1386506 m!1271879))

(declare-fun m!1271881 () Bool)

(assert (=> b!1386506 m!1271881))

(declare-fun m!1271883 () Bool)

(assert (=> b!1386506 m!1271883))

(declare-fun m!1271885 () Bool)

(assert (=> b!1386506 m!1271885))

(declare-fun m!1271887 () Bool)

(assert (=> b!1386506 m!1271887))

(assert (=> b!1386506 m!1271885))

(declare-fun m!1271889 () Bool)

(assert (=> b!1386506 m!1271889))

(declare-fun m!1271891 () Bool)

(assert (=> start!118598 m!1271891))

(declare-fun m!1271893 () Bool)

(assert (=> start!118598 m!1271893))

(declare-fun m!1271895 () Bool)

(assert (=> b!1386503 m!1271895))

(assert (=> b!1386499 m!1271885))

(assert (=> b!1386499 m!1271885))

(declare-fun m!1271897 () Bool)

(assert (=> b!1386499 m!1271897))

(assert (=> b!1386507 m!1271895))

(assert (=> b!1386507 m!1271895))

(declare-fun m!1271899 () Bool)

(assert (=> b!1386507 m!1271899))

(check-sat (not b!1386499) (not b!1386504) (not b!1386507) (not b!1386506) (not b!1386501) (not start!118598))
