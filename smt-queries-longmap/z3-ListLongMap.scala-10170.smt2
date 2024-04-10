; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119894 () Bool)

(assert start!119894)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!790328 () Bool)

(declare-datatypes ((SeekEntryResult!10409 0))(
  ( (MissingZero!10409 (index!44007 (_ BitVec 32))) (Found!10409 (index!44008 (_ BitVec 32))) (Intermediate!10409 (undefined!11221 Bool) (index!44009 (_ BitVec 32)) (x!125673 (_ BitVec 32))) (Undefined!10409) (MissingVacant!10409 (index!44010 (_ BitVec 32))) )
))
(declare-fun lt!613216 () SeekEntryResult!10409)

(declare-fun b!1396016 () Bool)

(declare-fun lt!613218 () SeekEntryResult!10409)

(get-info :version)

(assert (=> b!1396016 (= e!790328 (or (= lt!613218 lt!613216) (not ((_ is Intermediate!10409) lt!613216)) (bvsge mask!2840 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!95474 0))(
  ( (array!95475 (arr!46092 (Array (_ BitVec 32) (_ BitVec 64))) (size!46642 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95474)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95474 (_ BitVec 32)) SeekEntryResult!10409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396016 (= lt!613216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46092 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46092 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95475 (store (arr!46092 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46642 a!2901)) mask!2840))))

(declare-fun b!1396017 () Bool)

(declare-fun e!790329 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95474 (_ BitVec 32)) SeekEntryResult!10409)

(assert (=> b!1396017 (= e!790329 (= (seekEntryOrOpen!0 (select (arr!46092 a!2901) j!112) a!2901 mask!2840) (Found!10409 j!112)))))

(declare-fun b!1396018 () Bool)

(declare-fun res!935095 () Bool)

(declare-fun e!790331 () Bool)

(assert (=> b!1396018 (=> (not res!935095) (not e!790331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396018 (= res!935095 (validKeyInArray!0 (select (arr!46092 a!2901) i!1037)))))

(declare-fun res!935094 () Bool)

(assert (=> start!119894 (=> (not res!935094) (not e!790331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119894 (= res!935094 (validMask!0 mask!2840))))

(assert (=> start!119894 e!790331))

(assert (=> start!119894 true))

(declare-fun array_inv!35120 (array!95474) Bool)

(assert (=> start!119894 (array_inv!35120 a!2901)))

(declare-fun b!1396019 () Bool)

(declare-fun res!935096 () Bool)

(assert (=> b!1396019 (=> (not res!935096) (not e!790331))))

(assert (=> b!1396019 (= res!935096 (and (= (size!46642 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46642 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46642 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396020 () Bool)

(declare-fun res!935098 () Bool)

(assert (=> b!1396020 (=> (not res!935098) (not e!790331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95474 (_ BitVec 32)) Bool)

(assert (=> b!1396020 (= res!935098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396021 () Bool)

(declare-fun res!935099 () Bool)

(assert (=> b!1396021 (=> (not res!935099) (not e!790331))))

(assert (=> b!1396021 (= res!935099 (validKeyInArray!0 (select (arr!46092 a!2901) j!112)))))

(declare-fun b!1396022 () Bool)

(assert (=> b!1396022 (= e!790331 (not e!790328))))

(declare-fun res!935101 () Bool)

(assert (=> b!1396022 (=> res!935101 e!790328)))

(assert (=> b!1396022 (= res!935101 (or (not ((_ is Intermediate!10409) lt!613218)) (undefined!11221 lt!613218)))))

(assert (=> b!1396022 e!790329))

(declare-fun res!935097 () Bool)

(assert (=> b!1396022 (=> (not res!935097) (not e!790329))))

(assert (=> b!1396022 (= res!935097 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46822 0))(
  ( (Unit!46823) )
))
(declare-fun lt!613217 () Unit!46822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46822)

(assert (=> b!1396022 (= lt!613217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396022 (= lt!613218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46092 a!2901) j!112) mask!2840) (select (arr!46092 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396023 () Bool)

(declare-fun res!935100 () Bool)

(assert (=> b!1396023 (=> (not res!935100) (not e!790331))))

(declare-datatypes ((List!32611 0))(
  ( (Nil!32608) (Cons!32607 (h!33846 (_ BitVec 64)) (t!47305 List!32611)) )
))
(declare-fun arrayNoDuplicates!0 (array!95474 (_ BitVec 32) List!32611) Bool)

(assert (=> b!1396023 (= res!935100 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32608))))

(assert (= (and start!119894 res!935094) b!1396019))

(assert (= (and b!1396019 res!935096) b!1396018))

(assert (= (and b!1396018 res!935095) b!1396021))

(assert (= (and b!1396021 res!935099) b!1396020))

(assert (= (and b!1396020 res!935098) b!1396023))

(assert (= (and b!1396023 res!935100) b!1396022))

(assert (= (and b!1396022 res!935097) b!1396017))

(assert (= (and b!1396022 (not res!935101)) b!1396016))

(declare-fun m!1282495 () Bool)

(assert (=> b!1396017 m!1282495))

(assert (=> b!1396017 m!1282495))

(declare-fun m!1282497 () Bool)

(assert (=> b!1396017 m!1282497))

(declare-fun m!1282499 () Bool)

(assert (=> b!1396018 m!1282499))

(assert (=> b!1396018 m!1282499))

(declare-fun m!1282501 () Bool)

(assert (=> b!1396018 m!1282501))

(declare-fun m!1282503 () Bool)

(assert (=> b!1396020 m!1282503))

(assert (=> b!1396022 m!1282495))

(declare-fun m!1282505 () Bool)

(assert (=> b!1396022 m!1282505))

(assert (=> b!1396022 m!1282495))

(declare-fun m!1282507 () Bool)

(assert (=> b!1396022 m!1282507))

(assert (=> b!1396022 m!1282505))

(assert (=> b!1396022 m!1282495))

(declare-fun m!1282509 () Bool)

(assert (=> b!1396022 m!1282509))

(declare-fun m!1282511 () Bool)

(assert (=> b!1396022 m!1282511))

(declare-fun m!1282513 () Bool)

(assert (=> start!119894 m!1282513))

(declare-fun m!1282515 () Bool)

(assert (=> start!119894 m!1282515))

(declare-fun m!1282517 () Bool)

(assert (=> b!1396016 m!1282517))

(declare-fun m!1282519 () Bool)

(assert (=> b!1396016 m!1282519))

(assert (=> b!1396016 m!1282519))

(declare-fun m!1282521 () Bool)

(assert (=> b!1396016 m!1282521))

(assert (=> b!1396016 m!1282521))

(assert (=> b!1396016 m!1282519))

(declare-fun m!1282523 () Bool)

(assert (=> b!1396016 m!1282523))

(assert (=> b!1396021 m!1282495))

(assert (=> b!1396021 m!1282495))

(declare-fun m!1282525 () Bool)

(assert (=> b!1396021 m!1282525))

(declare-fun m!1282527 () Bool)

(assert (=> b!1396023 m!1282527))

(check-sat (not b!1396020) (not b!1396023) (not b!1396018) (not b!1396016) (not b!1396021) (not start!119894) (not b!1396022) (not b!1396017))
(check-sat)
