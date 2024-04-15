; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124642 () Bool)

(assert start!124642)

(declare-fun b!1444397 () Bool)

(declare-fun res!976500 () Bool)

(declare-fun e!813781 () Bool)

(assert (=> b!1444397 (=> (not res!976500) (not e!813781))))

(declare-fun e!813783 () Bool)

(assert (=> b!1444397 (= res!976500 e!813783)))

(declare-fun c!133468 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444397 (= c!133468 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444398 () Bool)

(declare-fun res!976495 () Bool)

(declare-fun e!813780 () Bool)

(assert (=> b!1444398 (=> (not res!976495) (not e!813780))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98068 0))(
  ( (array!98069 (arr!47323 (Array (_ BitVec 32) (_ BitVec 64))) (size!47875 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98068)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444398 (= res!976495 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47875 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47875 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47875 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444399 () Bool)

(declare-fun e!813777 () Bool)

(declare-fun e!813778 () Bool)

(assert (=> b!1444399 (= e!813777 e!813778)))

(declare-fun res!976488 () Bool)

(assert (=> b!1444399 (=> (not res!976488) (not e!813778))))

(declare-datatypes ((SeekEntryResult!11600 0))(
  ( (MissingZero!11600 (index!48792 (_ BitVec 32))) (Found!11600 (index!48793 (_ BitVec 32))) (Intermediate!11600 (undefined!12412 Bool) (index!48794 (_ BitVec 32)) (x!130484 (_ BitVec 32))) (Undefined!11600) (MissingVacant!11600 (index!48795 (_ BitVec 32))) )
))
(declare-fun lt!634014 () SeekEntryResult!11600)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98068 (_ BitVec 32)) SeekEntryResult!11600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444399 (= res!976488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47323 a!2862) j!93) mask!2687) (select (arr!47323 a!2862) j!93) a!2862 mask!2687) lt!634014))))

(assert (=> b!1444399 (= lt!634014 (Intermediate!11600 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444400 () Bool)

(declare-fun res!976498 () Bool)

(assert (=> b!1444400 (=> (not res!976498) (not e!813780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444400 (= res!976498 (validKeyInArray!0 (select (arr!47323 a!2862) j!93)))))

(declare-fun res!976487 () Bool)

(assert (=> start!124642 (=> (not res!976487) (not e!813780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124642 (= res!976487 (validMask!0 mask!2687))))

(assert (=> start!124642 e!813780))

(assert (=> start!124642 true))

(declare-fun array_inv!36556 (array!98068) Bool)

(assert (=> start!124642 (array_inv!36556 a!2862)))

(declare-fun b!1444401 () Bool)

(declare-fun res!976493 () Bool)

(assert (=> b!1444401 (=> (not res!976493) (not e!813780))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444401 (= res!976493 (and (= (size!47875 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47875 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47875 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444402 () Bool)

(assert (=> b!1444402 (= e!813781 (not true))))

(declare-fun e!813782 () Bool)

(assert (=> b!1444402 e!813782))

(declare-fun res!976501 () Bool)

(assert (=> b!1444402 (=> (not res!976501) (not e!813782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98068 (_ BitVec 32)) Bool)

(assert (=> b!1444402 (= res!976501 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48537 0))(
  ( (Unit!48538) )
))
(declare-fun lt!634016 () Unit!48537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48537)

(assert (=> b!1444402 (= lt!634016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444403 () Bool)

(declare-fun res!976491 () Bool)

(assert (=> b!1444403 (=> (not res!976491) (not e!813778))))

(assert (=> b!1444403 (= res!976491 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47323 a!2862) j!93) a!2862 mask!2687) lt!634014))))

(declare-fun b!1444404 () Bool)

(declare-fun res!976497 () Bool)

(assert (=> b!1444404 (=> (not res!976497) (not e!813780))))

(assert (=> b!1444404 (= res!976497 (validKeyInArray!0 (select (arr!47323 a!2862) i!1006)))))

(declare-fun b!1444405 () Bool)

(declare-fun res!976489 () Bool)

(assert (=> b!1444405 (=> (not res!976489) (not e!813782))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98068 (_ BitVec 32)) SeekEntryResult!11600)

(assert (=> b!1444405 (= res!976489 (= (seekEntryOrOpen!0 (select (arr!47323 a!2862) j!93) a!2862 mask!2687) (Found!11600 j!93)))))

(declare-fun b!1444406 () Bool)

(declare-fun res!976490 () Bool)

(assert (=> b!1444406 (=> (not res!976490) (not e!813780))))

(assert (=> b!1444406 (= res!976490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!634017 () array!98068)

(declare-fun lt!634013 () (_ BitVec 64))

(declare-fun lt!634015 () SeekEntryResult!11600)

(declare-fun b!1444407 () Bool)

(assert (=> b!1444407 (= e!813783 (= lt!634015 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634013 lt!634017 mask!2687)))))

(declare-fun b!1444408 () Bool)

(assert (=> b!1444408 (= e!813780 e!813777)))

(declare-fun res!976499 () Bool)

(assert (=> b!1444408 (=> (not res!976499) (not e!813777))))

(assert (=> b!1444408 (= res!976499 (= (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444408 (= lt!634017 (array!98069 (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47875 a!2862)))))

(declare-fun b!1444409 () Bool)

(assert (=> b!1444409 (= e!813778 e!813781)))

(declare-fun res!976494 () Bool)

(assert (=> b!1444409 (=> (not res!976494) (not e!813781))))

(assert (=> b!1444409 (= res!976494 (= lt!634015 (Intermediate!11600 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444409 (= lt!634015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634013 mask!2687) lt!634013 lt!634017 mask!2687))))

(assert (=> b!1444409 (= lt!634013 (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444410 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98068 (_ BitVec 32)) SeekEntryResult!11600)

(assert (=> b!1444410 (= e!813783 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634013 lt!634017 mask!2687) (seekEntryOrOpen!0 lt!634013 lt!634017 mask!2687)))))

(declare-fun b!1444411 () Bool)

(declare-fun res!976492 () Bool)

(assert (=> b!1444411 (=> (not res!976492) (not e!813780))))

(declare-datatypes ((List!33902 0))(
  ( (Nil!33899) (Cons!33898 (h!35248 (_ BitVec 64)) (t!48588 List!33902)) )
))
(declare-fun arrayNoDuplicates!0 (array!98068 (_ BitVec 32) List!33902) Bool)

(assert (=> b!1444411 (= res!976492 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33899))))

(declare-fun b!1444412 () Bool)

(assert (=> b!1444412 (= e!813782 (or (= (select (arr!47323 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47323 a!2862) intermediateBeforeIndex!19) (select (arr!47323 a!2862) j!93))))))

(declare-fun b!1444413 () Bool)

(declare-fun res!976496 () Bool)

(assert (=> b!1444413 (=> (not res!976496) (not e!813781))))

(assert (=> b!1444413 (= res!976496 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124642 res!976487) b!1444401))

(assert (= (and b!1444401 res!976493) b!1444404))

(assert (= (and b!1444404 res!976497) b!1444400))

(assert (= (and b!1444400 res!976498) b!1444406))

(assert (= (and b!1444406 res!976490) b!1444411))

(assert (= (and b!1444411 res!976492) b!1444398))

(assert (= (and b!1444398 res!976495) b!1444408))

(assert (= (and b!1444408 res!976499) b!1444399))

(assert (= (and b!1444399 res!976488) b!1444403))

(assert (= (and b!1444403 res!976491) b!1444409))

(assert (= (and b!1444409 res!976494) b!1444397))

(assert (= (and b!1444397 c!133468) b!1444407))

(assert (= (and b!1444397 (not c!133468)) b!1444410))

(assert (= (and b!1444397 res!976500) b!1444413))

(assert (= (and b!1444413 res!976496) b!1444402))

(assert (= (and b!1444402 res!976501) b!1444405))

(assert (= (and b!1444405 res!976489) b!1444412))

(declare-fun m!1332933 () Bool)

(assert (=> b!1444399 m!1332933))

(assert (=> b!1444399 m!1332933))

(declare-fun m!1332935 () Bool)

(assert (=> b!1444399 m!1332935))

(assert (=> b!1444399 m!1332935))

(assert (=> b!1444399 m!1332933))

(declare-fun m!1332937 () Bool)

(assert (=> b!1444399 m!1332937))

(assert (=> b!1444400 m!1332933))

(assert (=> b!1444400 m!1332933))

(declare-fun m!1332939 () Bool)

(assert (=> b!1444400 m!1332939))

(assert (=> b!1444405 m!1332933))

(assert (=> b!1444405 m!1332933))

(declare-fun m!1332941 () Bool)

(assert (=> b!1444405 m!1332941))

(declare-fun m!1332943 () Bool)

(assert (=> b!1444408 m!1332943))

(declare-fun m!1332945 () Bool)

(assert (=> b!1444408 m!1332945))

(declare-fun m!1332947 () Bool)

(assert (=> b!1444412 m!1332947))

(assert (=> b!1444412 m!1332933))

(declare-fun m!1332949 () Bool)

(assert (=> start!124642 m!1332949))

(declare-fun m!1332951 () Bool)

(assert (=> start!124642 m!1332951))

(declare-fun m!1332953 () Bool)

(assert (=> b!1444406 m!1332953))

(declare-fun m!1332955 () Bool)

(assert (=> b!1444409 m!1332955))

(assert (=> b!1444409 m!1332955))

(declare-fun m!1332957 () Bool)

(assert (=> b!1444409 m!1332957))

(assert (=> b!1444409 m!1332943))

(declare-fun m!1332959 () Bool)

(assert (=> b!1444409 m!1332959))

(declare-fun m!1332961 () Bool)

(assert (=> b!1444404 m!1332961))

(assert (=> b!1444404 m!1332961))

(declare-fun m!1332963 () Bool)

(assert (=> b!1444404 m!1332963))

(declare-fun m!1332965 () Bool)

(assert (=> b!1444402 m!1332965))

(declare-fun m!1332967 () Bool)

(assert (=> b!1444402 m!1332967))

(declare-fun m!1332969 () Bool)

(assert (=> b!1444411 m!1332969))

(declare-fun m!1332971 () Bool)

(assert (=> b!1444410 m!1332971))

(declare-fun m!1332973 () Bool)

(assert (=> b!1444410 m!1332973))

(assert (=> b!1444403 m!1332933))

(assert (=> b!1444403 m!1332933))

(declare-fun m!1332975 () Bool)

(assert (=> b!1444403 m!1332975))

(declare-fun m!1332977 () Bool)

(assert (=> b!1444407 m!1332977))

(check-sat (not b!1444410) (not b!1444402) (not b!1444404) (not b!1444409) (not b!1444406) (not b!1444411) (not b!1444405) (not b!1444403) (not b!1444400) (not b!1444399) (not b!1444407) (not start!124642))
(check-sat)
