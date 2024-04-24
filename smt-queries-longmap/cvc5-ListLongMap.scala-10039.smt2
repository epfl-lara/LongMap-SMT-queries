; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118554 () Bool)

(assert start!118554)

(declare-fun b!1385449 () Bool)

(declare-fun e!785212 () Bool)

(declare-datatypes ((array!94755 0))(
  ( (array!94756 (arr!45753 (Array (_ BitVec 32) (_ BitVec 64))) (size!46304 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94755)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385449 (= e!785212 (validKeyInArray!0 (select (arr!45753 a!2938) startIndex!16)))))

(declare-fun b!1385450 () Bool)

(declare-fun res!926168 () Bool)

(declare-fun e!785213 () Bool)

(assert (=> b!1385450 (=> (not res!926168) (not e!785213))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385450 (= res!926168 (and (= (size!46304 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46304 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46304 a!2938))))))

(declare-fun b!1385451 () Bool)

(declare-datatypes ((Unit!46076 0))(
  ( (Unit!46077) )
))
(declare-fun e!785215 () Unit!46076)

(declare-fun Unit!46078 () Unit!46076)

(assert (=> b!1385451 (= e!785215 Unit!46078)))

(declare-fun b!1385452 () Bool)

(declare-fun res!926170 () Bool)

(assert (=> b!1385452 (=> (not res!926170) (not e!785213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94755 (_ BitVec 32)) Bool)

(assert (=> b!1385452 (= res!926170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385453 () Bool)

(declare-fun res!926164 () Bool)

(assert (=> b!1385453 (=> (not res!926164) (not e!785213))))

(declare-datatypes ((List!32268 0))(
  ( (Nil!32265) (Cons!32264 (h!33482 (_ BitVec 64)) (t!46954 List!32268)) )
))
(declare-fun arrayNoDuplicates!0 (array!94755 (_ BitVec 32) List!32268) Bool)

(assert (=> b!1385453 (= res!926164 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32265))))

(declare-fun b!1385454 () Bool)

(declare-fun res!926167 () Bool)

(assert (=> b!1385454 (=> (not res!926167) (not e!785213))))

(assert (=> b!1385454 (= res!926167 (and (not (= (select (arr!45753 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45753 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385455 () Bool)

(declare-fun lt!609273 () Unit!46076)

(assert (=> b!1385455 (= e!785215 lt!609273)))

(declare-fun lt!609272 () Unit!46076)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46076)

(assert (=> b!1385455 (= lt!609272 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10049 0))(
  ( (MissingZero!10049 (index!42567 (_ BitVec 32))) (Found!10049 (index!42568 (_ BitVec 32))) (Intermediate!10049 (undefined!10861 Bool) (index!42569 (_ BitVec 32)) (x!124224 (_ BitVec 32))) (Undefined!10049) (MissingVacant!10049 (index!42570 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94755 (_ BitVec 32)) SeekEntryResult!10049)

(assert (=> b!1385455 (= (seekEntryOrOpen!0 (select (arr!45753 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45753 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94756 (store (arr!45753 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46304 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46076)

(assert (=> b!1385455 (= lt!609273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385455 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385456 () Bool)

(assert (=> b!1385456 (= e!785213 false)))

(declare-fun lt!609271 () Unit!46076)

(assert (=> b!1385456 (= lt!609271 e!785215)))

(declare-fun c!129090 () Bool)

(assert (=> b!1385456 (= c!129090 e!785212)))

(declare-fun res!926169 () Bool)

(assert (=> b!1385456 (=> (not res!926169) (not e!785212))))

(assert (=> b!1385456 (= res!926169 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385457 () Bool)

(declare-fun res!926165 () Bool)

(assert (=> b!1385457 (=> (not res!926165) (not e!785213))))

(assert (=> b!1385457 (= res!926165 (validKeyInArray!0 (select (arr!45753 a!2938) i!1065)))))

(declare-fun res!926166 () Bool)

(assert (=> start!118554 (=> (not res!926166) (not e!785213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118554 (= res!926166 (validMask!0 mask!2987))))

(assert (=> start!118554 e!785213))

(assert (=> start!118554 true))

(declare-fun array_inv!35034 (array!94755) Bool)

(assert (=> start!118554 (array_inv!35034 a!2938)))

(assert (= (and start!118554 res!926166) b!1385450))

(assert (= (and b!1385450 res!926168) b!1385457))

(assert (= (and b!1385457 res!926165) b!1385453))

(assert (= (and b!1385453 res!926164) b!1385452))

(assert (= (and b!1385452 res!926170) b!1385454))

(assert (= (and b!1385454 res!926167) b!1385456))

(assert (= (and b!1385456 res!926169) b!1385449))

(assert (= (and b!1385456 c!129090) b!1385455))

(assert (= (and b!1385456 (not c!129090)) b!1385451))

(declare-fun m!1270983 () Bool)

(assert (=> start!118554 m!1270983))

(declare-fun m!1270985 () Bool)

(assert (=> start!118554 m!1270985))

(declare-fun m!1270987 () Bool)

(assert (=> b!1385457 m!1270987))

(assert (=> b!1385457 m!1270987))

(declare-fun m!1270989 () Bool)

(assert (=> b!1385457 m!1270989))

(assert (=> b!1385454 m!1270987))

(declare-fun m!1270991 () Bool)

(assert (=> b!1385452 m!1270991))

(declare-fun m!1270993 () Bool)

(assert (=> b!1385449 m!1270993))

(assert (=> b!1385449 m!1270993))

(declare-fun m!1270995 () Bool)

(assert (=> b!1385449 m!1270995))

(declare-fun m!1270997 () Bool)

(assert (=> b!1385455 m!1270997))

(declare-fun m!1270999 () Bool)

(assert (=> b!1385455 m!1270999))

(assert (=> b!1385455 m!1270999))

(declare-fun m!1271001 () Bool)

(assert (=> b!1385455 m!1271001))

(declare-fun m!1271003 () Bool)

(assert (=> b!1385455 m!1271003))

(declare-fun m!1271005 () Bool)

(assert (=> b!1385455 m!1271005))

(assert (=> b!1385455 m!1270993))

(declare-fun m!1271007 () Bool)

(assert (=> b!1385455 m!1271007))

(assert (=> b!1385455 m!1270993))

(declare-fun m!1271009 () Bool)

(assert (=> b!1385455 m!1271009))

(declare-fun m!1271011 () Bool)

(assert (=> b!1385453 m!1271011))

(push 1)

(assert (not b!1385455))

(assert (not b!1385449))

(assert (not b!1385453))

(assert (not b!1385457))

(assert (not b!1385452))

(assert (not start!118554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

