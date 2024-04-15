; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125350 () Bool)

(assert start!125350)

(declare-fun b!1465818 () Bool)

(declare-fun e!823568 () Bool)

(declare-fun e!823564 () Bool)

(assert (=> b!1465818 (= e!823568 e!823564)))

(declare-fun res!994725 () Bool)

(assert (=> b!1465818 (=> (not res!994725) (not e!823564))))

(declare-datatypes ((SeekEntryResult!11954 0))(
  ( (MissingZero!11954 (index!50208 (_ BitVec 32))) (Found!11954 (index!50209 (_ BitVec 32))) (Intermediate!11954 (undefined!12766 Bool) (index!50210 (_ BitVec 32)) (x!131782 (_ BitVec 32))) (Undefined!11954) (MissingVacant!11954 (index!50211 (_ BitVec 32))) )
))
(declare-fun lt!641369 () SeekEntryResult!11954)

(declare-datatypes ((array!98776 0))(
  ( (array!98777 (arr!47677 (Array (_ BitVec 32) (_ BitVec 64))) (size!48229 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98776)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98776 (_ BitVec 32)) SeekEntryResult!11954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465818 (= res!994725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47677 a!2862) j!93) mask!2687) (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!641369))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465818 (= lt!641369 (Intermediate!11954 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465819 () Bool)

(declare-fun e!823567 () Bool)

(assert (=> b!1465819 (= e!823567 e!823568)))

(declare-fun res!994721 () Bool)

(assert (=> b!1465819 (=> (not res!994721) (not e!823568))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465819 (= res!994721 (= (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641363 () array!98776)

(assert (=> b!1465819 (= lt!641363 (array!98777 (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48229 a!2862)))))

(declare-fun b!1465820 () Bool)

(declare-fun res!994733 () Bool)

(declare-fun e!823569 () Bool)

(assert (=> b!1465820 (=> (not res!994733) (not e!823569))))

(declare-fun e!823571 () Bool)

(assert (=> b!1465820 (= res!994733 e!823571)))

(declare-fun c!135064 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465820 (= c!135064 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465821 () Bool)

(declare-fun res!994722 () Bool)

(declare-fun e!823565 () Bool)

(assert (=> b!1465821 (=> res!994722 e!823565)))

(declare-fun lt!641365 () (_ BitVec 32))

(assert (=> b!1465821 (= res!994722 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641365 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!641369)))))

(declare-fun b!1465822 () Bool)

(declare-fun res!994727 () Bool)

(assert (=> b!1465822 (=> (not res!994727) (not e!823567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465822 (= res!994727 (validKeyInArray!0 (select (arr!47677 a!2862) i!1006)))))

(declare-fun b!1465824 () Bool)

(declare-fun res!994726 () Bool)

(assert (=> b!1465824 (=> res!994726 e!823565)))

(declare-fun e!823566 () Bool)

(assert (=> b!1465824 (= res!994726 e!823566)))

(declare-fun c!135063 () Bool)

(assert (=> b!1465824 (= c!135063 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465825 () Bool)

(assert (=> b!1465825 (= e!823564 e!823569)))

(declare-fun res!994735 () Bool)

(assert (=> b!1465825 (=> (not res!994735) (not e!823569))))

(declare-fun lt!641367 () SeekEntryResult!11954)

(assert (=> b!1465825 (= res!994735 (= lt!641367 (Intermediate!11954 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641364 () (_ BitVec 64))

(assert (=> b!1465825 (= lt!641367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641364 mask!2687) lt!641364 lt!641363 mask!2687))))

(assert (=> b!1465825 (= lt!641364 (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1465826 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98776 (_ BitVec 32)) SeekEntryResult!11954)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98776 (_ BitVec 32)) SeekEntryResult!11954)

(assert (=> b!1465826 (= e!823571 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641364 lt!641363 mask!2687) (seekEntryOrOpen!0 lt!641364 lt!641363 mask!2687)))))

(declare-fun b!1465827 () Bool)

(declare-fun res!994723 () Bool)

(assert (=> b!1465827 (=> (not res!994723) (not e!823567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98776 (_ BitVec 32)) Bool)

(assert (=> b!1465827 (= res!994723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465828 () Bool)

(declare-fun res!994728 () Bool)

(assert (=> b!1465828 (=> (not res!994728) (not e!823567))))

(declare-datatypes ((List!34256 0))(
  ( (Nil!34253) (Cons!34252 (h!35602 (_ BitVec 64)) (t!48942 List!34256)) )
))
(declare-fun arrayNoDuplicates!0 (array!98776 (_ BitVec 32) List!34256) Bool)

(assert (=> b!1465828 (= res!994728 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34253))))

(declare-fun b!1465829 () Bool)

(declare-fun res!994730 () Bool)

(assert (=> b!1465829 (=> (not res!994730) (not e!823567))))

(assert (=> b!1465829 (= res!994730 (and (= (size!48229 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48229 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48229 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465830 () Bool)

(declare-fun res!994724 () Bool)

(assert (=> b!1465830 (=> (not res!994724) (not e!823567))))

(assert (=> b!1465830 (= res!994724 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48229 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48229 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48229 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465831 () Bool)

(assert (=> b!1465831 (= e!823566 (not (= lt!641367 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641365 lt!641364 lt!641363 mask!2687))))))

(declare-fun b!1465832 () Bool)

(declare-fun e!823572 () Bool)

(assert (=> b!1465832 (= e!823569 (not e!823572))))

(declare-fun res!994719 () Bool)

(assert (=> b!1465832 (=> res!994719 e!823572)))

(assert (=> b!1465832 (= res!994719 (or (and (= (select (arr!47677 a!2862) index!646) (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47677 a!2862) index!646) (select (arr!47677 a!2862) j!93))) (= (select (arr!47677 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641366 () SeekEntryResult!11954)

(assert (=> b!1465832 (and (= lt!641366 (Found!11954 j!93)) (or (= (select (arr!47677 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47677 a!2862) intermediateBeforeIndex!19) (select (arr!47677 a!2862) j!93))))))

(assert (=> b!1465832 (= lt!641366 (seekEntryOrOpen!0 (select (arr!47677 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1465832 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49245 0))(
  ( (Unit!49246) )
))
(declare-fun lt!641370 () Unit!49245)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49245)

(assert (=> b!1465832 (= lt!641370 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465823 () Bool)

(declare-fun res!994729 () Bool)

(assert (=> b!1465823 (=> (not res!994729) (not e!823567))))

(assert (=> b!1465823 (= res!994729 (validKeyInArray!0 (select (arr!47677 a!2862) j!93)))))

(declare-fun res!994732 () Bool)

(assert (=> start!125350 (=> (not res!994732) (not e!823567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125350 (= res!994732 (validMask!0 mask!2687))))

(assert (=> start!125350 e!823567))

(assert (=> start!125350 true))

(declare-fun array_inv!36910 (array!98776) Bool)

(assert (=> start!125350 (array_inv!36910 a!2862)))

(declare-fun b!1465833 () Bool)

(assert (=> b!1465833 (= e!823572 e!823565)))

(declare-fun res!994720 () Bool)

(assert (=> b!1465833 (=> res!994720 e!823565)))

(assert (=> b!1465833 (= res!994720 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641365 #b00000000000000000000000000000000) (bvsge lt!641365 (size!48229 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465833 (= lt!641365 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465834 () Bool)

(declare-fun res!994731 () Bool)

(assert (=> b!1465834 (=> (not res!994731) (not e!823564))))

(assert (=> b!1465834 (= res!994731 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!641369))))

(declare-fun b!1465835 () Bool)

(declare-fun res!994734 () Bool)

(assert (=> b!1465835 (=> res!994734 e!823565)))

(assert (=> b!1465835 (= res!994734 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1465836 () Bool)

(assert (=> b!1465836 (= e!823566 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641365 intermediateAfterIndex!19 lt!641364 lt!641363 mask!2687) (seekEntryOrOpen!0 lt!641364 lt!641363 mask!2687))))))

(declare-fun b!1465837 () Bool)

(assert (=> b!1465837 (= e!823565 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1465837 (= lt!641366 (seekEntryOrOpen!0 lt!641364 lt!641363 mask!2687))))

(declare-fun lt!641368 () Unit!49245)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49245)

(assert (=> b!1465837 (= lt!641368 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641365 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1465838 () Bool)

(assert (=> b!1465838 (= e!823571 (= lt!641367 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641364 lt!641363 mask!2687)))))

(declare-fun b!1465839 () Bool)

(declare-fun res!994718 () Bool)

(assert (=> b!1465839 (=> (not res!994718) (not e!823569))))

(assert (=> b!1465839 (= res!994718 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125350 res!994732) b!1465829))

(assert (= (and b!1465829 res!994730) b!1465822))

(assert (= (and b!1465822 res!994727) b!1465823))

(assert (= (and b!1465823 res!994729) b!1465827))

(assert (= (and b!1465827 res!994723) b!1465828))

(assert (= (and b!1465828 res!994728) b!1465830))

(assert (= (and b!1465830 res!994724) b!1465819))

(assert (= (and b!1465819 res!994721) b!1465818))

(assert (= (and b!1465818 res!994725) b!1465834))

(assert (= (and b!1465834 res!994731) b!1465825))

(assert (= (and b!1465825 res!994735) b!1465820))

(assert (= (and b!1465820 c!135064) b!1465838))

(assert (= (and b!1465820 (not c!135064)) b!1465826))

(assert (= (and b!1465820 res!994733) b!1465839))

(assert (= (and b!1465839 res!994718) b!1465832))

(assert (= (and b!1465832 (not res!994719)) b!1465833))

(assert (= (and b!1465833 (not res!994720)) b!1465821))

(assert (= (and b!1465821 (not res!994722)) b!1465824))

(assert (= (and b!1465824 c!135063) b!1465831))

(assert (= (and b!1465824 (not c!135063)) b!1465836))

(assert (= (and b!1465824 (not res!994726)) b!1465835))

(assert (= (and b!1465835 (not res!994734)) b!1465837))

(declare-fun m!1352367 () Bool)

(assert (=> b!1465836 m!1352367))

(declare-fun m!1352369 () Bool)

(assert (=> b!1465836 m!1352369))

(declare-fun m!1352371 () Bool)

(assert (=> b!1465831 m!1352371))

(declare-fun m!1352373 () Bool)

(assert (=> b!1465826 m!1352373))

(assert (=> b!1465826 m!1352369))

(declare-fun m!1352375 () Bool)

(assert (=> b!1465834 m!1352375))

(assert (=> b!1465834 m!1352375))

(declare-fun m!1352377 () Bool)

(assert (=> b!1465834 m!1352377))

(declare-fun m!1352379 () Bool)

(assert (=> b!1465828 m!1352379))

(assert (=> b!1465821 m!1352375))

(assert (=> b!1465821 m!1352375))

(declare-fun m!1352381 () Bool)

(assert (=> b!1465821 m!1352381))

(assert (=> b!1465837 m!1352369))

(declare-fun m!1352383 () Bool)

(assert (=> b!1465837 m!1352383))

(declare-fun m!1352385 () Bool)

(assert (=> start!125350 m!1352385))

(declare-fun m!1352387 () Bool)

(assert (=> start!125350 m!1352387))

(declare-fun m!1352389 () Bool)

(assert (=> b!1465838 m!1352389))

(declare-fun m!1352391 () Bool)

(assert (=> b!1465832 m!1352391))

(declare-fun m!1352393 () Bool)

(assert (=> b!1465832 m!1352393))

(declare-fun m!1352395 () Bool)

(assert (=> b!1465832 m!1352395))

(declare-fun m!1352397 () Bool)

(assert (=> b!1465832 m!1352397))

(declare-fun m!1352399 () Bool)

(assert (=> b!1465832 m!1352399))

(assert (=> b!1465832 m!1352375))

(declare-fun m!1352401 () Bool)

(assert (=> b!1465832 m!1352401))

(declare-fun m!1352403 () Bool)

(assert (=> b!1465832 m!1352403))

(assert (=> b!1465832 m!1352375))

(assert (=> b!1465819 m!1352393))

(declare-fun m!1352405 () Bool)

(assert (=> b!1465819 m!1352405))

(declare-fun m!1352407 () Bool)

(assert (=> b!1465822 m!1352407))

(assert (=> b!1465822 m!1352407))

(declare-fun m!1352409 () Bool)

(assert (=> b!1465822 m!1352409))

(declare-fun m!1352411 () Bool)

(assert (=> b!1465833 m!1352411))

(declare-fun m!1352413 () Bool)

(assert (=> b!1465825 m!1352413))

(assert (=> b!1465825 m!1352413))

(declare-fun m!1352415 () Bool)

(assert (=> b!1465825 m!1352415))

(assert (=> b!1465825 m!1352393))

(declare-fun m!1352417 () Bool)

(assert (=> b!1465825 m!1352417))

(assert (=> b!1465818 m!1352375))

(assert (=> b!1465818 m!1352375))

(declare-fun m!1352419 () Bool)

(assert (=> b!1465818 m!1352419))

(assert (=> b!1465818 m!1352419))

(assert (=> b!1465818 m!1352375))

(declare-fun m!1352421 () Bool)

(assert (=> b!1465818 m!1352421))

(assert (=> b!1465823 m!1352375))

(assert (=> b!1465823 m!1352375))

(declare-fun m!1352423 () Bool)

(assert (=> b!1465823 m!1352423))

(declare-fun m!1352425 () Bool)

(assert (=> b!1465827 m!1352425))

(check-sat (not b!1465825) (not b!1465833) (not b!1465837) (not b!1465832) (not b!1465838) (not b!1465831) (not b!1465822) (not start!125350) (not b!1465823) (not b!1465827) (not b!1465826) (not b!1465834) (not b!1465828) (not b!1465821) (not b!1465836) (not b!1465818))
(check-sat)
