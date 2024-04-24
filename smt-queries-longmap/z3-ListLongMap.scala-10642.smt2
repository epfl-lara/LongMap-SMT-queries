; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125208 () Bool)

(assert start!125208)

(declare-fun b!1454673 () Bool)

(declare-fun res!984877 () Bool)

(declare-fun e!818872 () Bool)

(assert (=> b!1454673 (=> (not res!984877) (not e!818872))))

(declare-datatypes ((array!98551 0))(
  ( (array!98552 (arr!47560 (Array (_ BitVec 32) (_ BitVec 64))) (size!48111 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98551)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454673 (= res!984877 (validKeyInArray!0 (select (arr!47560 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1454674 () Bool)

(declare-fun lt!637691 () array!98551)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11709 0))(
  ( (MissingZero!11709 (index!49228 (_ BitVec 32))) (Found!11709 (index!49229 (_ BitVec 32))) (Intermediate!11709 (undefined!12521 Bool) (index!49230 (_ BitVec 32)) (x!131046 (_ BitVec 32))) (Undefined!11709) (MissingVacant!11709 (index!49231 (_ BitVec 32))) )
))
(declare-fun lt!637692 () SeekEntryResult!11709)

(declare-fun e!818868 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637689 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98551 (_ BitVec 32)) SeekEntryResult!11709)

(assert (=> b!1454674 (= e!818868 (= lt!637692 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637689 lt!637691 mask!2687)))))

(declare-fun b!1454675 () Bool)

(declare-fun e!818867 () Bool)

(declare-fun e!818869 () Bool)

(assert (=> b!1454675 (= e!818867 e!818869)))

(declare-fun res!984879 () Bool)

(assert (=> b!1454675 (=> (not res!984879) (not e!818869))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454675 (= res!984879 (= lt!637692 (Intermediate!11709 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454675 (= lt!637692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637689 mask!2687) lt!637689 lt!637691 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1454675 (= lt!637689 (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454676 () Bool)

(assert (=> b!1454676 (= e!818869 (not (or (and (= (select (arr!47560 a!2862) index!646) (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47560 a!2862) index!646) (select (arr!47560 a!2862) j!93))) (= (select (arr!47560 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!818874 () Bool)

(assert (=> b!1454676 e!818874))

(declare-fun res!984873 () Bool)

(assert (=> b!1454676 (=> (not res!984873) (not e!818874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98551 (_ BitVec 32)) Bool)

(assert (=> b!1454676 (= res!984873 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48947 0))(
  ( (Unit!48948) )
))
(declare-fun lt!637688 () Unit!48947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48947)

(assert (=> b!1454676 (= lt!637688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454677 () Bool)

(declare-fun res!984880 () Bool)

(assert (=> b!1454677 (=> (not res!984880) (not e!818874))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98551 (_ BitVec 32)) SeekEntryResult!11709)

(assert (=> b!1454677 (= res!984880 (= (seekEntryOrOpen!0 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) (Found!11709 j!93)))))

(declare-fun b!1454678 () Bool)

(declare-fun res!984874 () Bool)

(assert (=> b!1454678 (=> (not res!984874) (not e!818867))))

(declare-fun lt!637693 () SeekEntryResult!11709)

(assert (=> b!1454678 (= res!984874 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!637693))))

(declare-fun b!1454679 () Bool)

(declare-fun e!818870 () Bool)

(declare-fun e!818866 () Bool)

(assert (=> b!1454679 (= e!818870 e!818866)))

(declare-fun res!984875 () Bool)

(assert (=> b!1454679 (=> (not res!984875) (not e!818866))))

(declare-fun lt!637690 () (_ BitVec 64))

(assert (=> b!1454679 (= res!984875 (and (= index!646 intermediateAfterIndex!19) (= lt!637690 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1454680 () Bool)

(declare-fun res!984881 () Bool)

(assert (=> b!1454680 (=> (not res!984881) (not e!818872))))

(assert (=> b!1454680 (= res!984881 (and (= (size!48111 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48111 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48111 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454681 () Bool)

(declare-fun res!984869 () Bool)

(assert (=> b!1454681 (=> (not res!984869) (not e!818872))))

(assert (=> b!1454681 (= res!984869 (validKeyInArray!0 (select (arr!47560 a!2862) j!93)))))

(declare-fun b!1454682 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98551 (_ BitVec 32)) SeekEntryResult!11709)

(assert (=> b!1454682 (= e!818868 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637689 lt!637691 mask!2687) (seekEntryOrOpen!0 lt!637689 lt!637691 mask!2687)))))

(declare-fun b!1454683 () Bool)

(declare-fun res!984871 () Bool)

(assert (=> b!1454683 (=> (not res!984871) (not e!818872))))

(assert (=> b!1454683 (= res!984871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!984872 () Bool)

(assert (=> start!125208 (=> (not res!984872) (not e!818872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125208 (= res!984872 (validMask!0 mask!2687))))

(assert (=> start!125208 e!818872))

(assert (=> start!125208 true))

(declare-fun array_inv!36841 (array!98551) Bool)

(assert (=> start!125208 (array_inv!36841 a!2862)))

(declare-fun b!1454684 () Bool)

(declare-fun e!818871 () Bool)

(assert (=> b!1454684 (= e!818872 e!818871)))

(declare-fun res!984868 () Bool)

(assert (=> b!1454684 (=> (not res!984868) (not e!818871))))

(assert (=> b!1454684 (= res!984868 (= (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454684 (= lt!637691 (array!98552 (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48111 a!2862)))))

(declare-fun b!1454685 () Bool)

(assert (=> b!1454685 (= e!818866 (= (seekEntryOrOpen!0 lt!637689 lt!637691 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637689 lt!637691 mask!2687)))))

(declare-fun b!1454686 () Bool)

(declare-fun res!984867 () Bool)

(assert (=> b!1454686 (=> (not res!984867) (not e!818869))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454686 (= res!984867 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454687 () Bool)

(declare-fun res!984884 () Bool)

(assert (=> b!1454687 (=> (not res!984884) (not e!818872))))

(declare-datatypes ((List!34048 0))(
  ( (Nil!34045) (Cons!34044 (h!35405 (_ BitVec 64)) (t!48734 List!34048)) )
))
(declare-fun arrayNoDuplicates!0 (array!98551 (_ BitVec 32) List!34048) Bool)

(assert (=> b!1454687 (= res!984884 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34045))))

(declare-fun b!1454688 () Bool)

(declare-fun res!984878 () Bool)

(assert (=> b!1454688 (=> (not res!984878) (not e!818872))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454688 (= res!984878 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48111 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48111 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48111 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454689 () Bool)

(declare-fun res!984883 () Bool)

(assert (=> b!1454689 (=> (not res!984883) (not e!818869))))

(assert (=> b!1454689 (= res!984883 e!818868)))

(declare-fun c!134422 () Bool)

(assert (=> b!1454689 (= c!134422 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454690 () Bool)

(declare-fun res!984882 () Bool)

(assert (=> b!1454690 (=> (not res!984882) (not e!818874))))

(assert (=> b!1454690 (= res!984882 (or (= (select (arr!47560 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47560 a!2862) intermediateBeforeIndex!19) (select (arr!47560 a!2862) j!93))))))

(declare-fun b!1454691 () Bool)

(assert (=> b!1454691 (= e!818874 e!818870)))

(declare-fun res!984876 () Bool)

(assert (=> b!1454691 (=> res!984876 e!818870)))

(assert (=> b!1454691 (= res!984876 (or (and (= (select (arr!47560 a!2862) index!646) lt!637690) (= (select (arr!47560 a!2862) index!646) (select (arr!47560 a!2862) j!93))) (= (select (arr!47560 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454691 (= lt!637690 (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1454692 () Bool)

(assert (=> b!1454692 (= e!818871 e!818867)))

(declare-fun res!984870 () Bool)

(assert (=> b!1454692 (=> (not res!984870) (not e!818867))))

(assert (=> b!1454692 (= res!984870 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47560 a!2862) j!93) mask!2687) (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!637693))))

(assert (=> b!1454692 (= lt!637693 (Intermediate!11709 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125208 res!984872) b!1454680))

(assert (= (and b!1454680 res!984881) b!1454673))

(assert (= (and b!1454673 res!984877) b!1454681))

(assert (= (and b!1454681 res!984869) b!1454683))

(assert (= (and b!1454683 res!984871) b!1454687))

(assert (= (and b!1454687 res!984884) b!1454688))

(assert (= (and b!1454688 res!984878) b!1454684))

(assert (= (and b!1454684 res!984868) b!1454692))

(assert (= (and b!1454692 res!984870) b!1454678))

(assert (= (and b!1454678 res!984874) b!1454675))

(assert (= (and b!1454675 res!984879) b!1454689))

(assert (= (and b!1454689 c!134422) b!1454674))

(assert (= (and b!1454689 (not c!134422)) b!1454682))

(assert (= (and b!1454689 res!984883) b!1454686))

(assert (= (and b!1454686 res!984867) b!1454676))

(assert (= (and b!1454676 res!984873) b!1454677))

(assert (= (and b!1454677 res!984880) b!1454690))

(assert (= (and b!1454690 res!984882) b!1454691))

(assert (= (and b!1454691 (not res!984876)) b!1454679))

(assert (= (and b!1454679 res!984875) b!1454685))

(declare-fun m!1343281 () Bool)

(assert (=> b!1454673 m!1343281))

(assert (=> b!1454673 m!1343281))

(declare-fun m!1343283 () Bool)

(assert (=> b!1454673 m!1343283))

(declare-fun m!1343285 () Bool)

(assert (=> b!1454691 m!1343285))

(declare-fun m!1343287 () Bool)

(assert (=> b!1454691 m!1343287))

(declare-fun m!1343289 () Bool)

(assert (=> b!1454691 m!1343289))

(declare-fun m!1343291 () Bool)

(assert (=> b!1454691 m!1343291))

(assert (=> b!1454678 m!1343287))

(assert (=> b!1454678 m!1343287))

(declare-fun m!1343293 () Bool)

(assert (=> b!1454678 m!1343293))

(declare-fun m!1343295 () Bool)

(assert (=> b!1454690 m!1343295))

(assert (=> b!1454690 m!1343287))

(assert (=> b!1454681 m!1343287))

(assert (=> b!1454681 m!1343287))

(declare-fun m!1343297 () Bool)

(assert (=> b!1454681 m!1343297))

(declare-fun m!1343299 () Bool)

(assert (=> start!125208 m!1343299))

(declare-fun m!1343301 () Bool)

(assert (=> start!125208 m!1343301))

(declare-fun m!1343303 () Bool)

(assert (=> b!1454675 m!1343303))

(assert (=> b!1454675 m!1343303))

(declare-fun m!1343305 () Bool)

(assert (=> b!1454675 m!1343305))

(assert (=> b!1454675 m!1343289))

(declare-fun m!1343307 () Bool)

(assert (=> b!1454675 m!1343307))

(assert (=> b!1454692 m!1343287))

(assert (=> b!1454692 m!1343287))

(declare-fun m!1343309 () Bool)

(assert (=> b!1454692 m!1343309))

(assert (=> b!1454692 m!1343309))

(assert (=> b!1454692 m!1343287))

(declare-fun m!1343311 () Bool)

(assert (=> b!1454692 m!1343311))

(declare-fun m!1343313 () Bool)

(assert (=> b!1454687 m!1343313))

(declare-fun m!1343315 () Bool)

(assert (=> b!1454682 m!1343315))

(declare-fun m!1343317 () Bool)

(assert (=> b!1454682 m!1343317))

(declare-fun m!1343319 () Bool)

(assert (=> b!1454683 m!1343319))

(assert (=> b!1454677 m!1343287))

(assert (=> b!1454677 m!1343287))

(declare-fun m!1343321 () Bool)

(assert (=> b!1454677 m!1343321))

(assert (=> b!1454685 m!1343317))

(assert (=> b!1454685 m!1343315))

(declare-fun m!1343323 () Bool)

(assert (=> b!1454674 m!1343323))

(assert (=> b!1454684 m!1343289))

(declare-fun m!1343325 () Bool)

(assert (=> b!1454684 m!1343325))

(declare-fun m!1343327 () Bool)

(assert (=> b!1454676 m!1343327))

(assert (=> b!1454676 m!1343289))

(assert (=> b!1454676 m!1343291))

(assert (=> b!1454676 m!1343285))

(declare-fun m!1343329 () Bool)

(assert (=> b!1454676 m!1343329))

(assert (=> b!1454676 m!1343287))

(check-sat (not b!1454675) (not b!1454677) (not b!1454692) (not b!1454687) (not b!1454673) (not b!1454676) (not start!125208) (not b!1454678) (not b!1454674) (not b!1454685) (not b!1454681) (not b!1454683) (not b!1454682))
(check-sat)
