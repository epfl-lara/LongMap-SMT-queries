; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125006 () Bool)

(assert start!125006)

(declare-fun b!1453842 () Bool)

(declare-fun res!984804 () Bool)

(declare-fun e!818259 () Bool)

(assert (=> b!1453842 (=> (not res!984804) (not e!818259))))

(declare-fun e!818261 () Bool)

(assert (=> b!1453842 (= res!984804 e!818261)))

(declare-fun c!134033 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453842 (= c!134033 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453843 () Bool)

(declare-fun e!818253 () Bool)

(declare-fun e!818258 () Bool)

(assert (=> b!1453843 (= e!818253 e!818258)))

(declare-fun res!984799 () Bool)

(assert (=> b!1453843 (=> (not res!984799) (not e!818258))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98454 0))(
  ( (array!98455 (arr!47515 (Array (_ BitVec 32) (_ BitVec 64))) (size!48065 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98454)

(assert (=> b!1453843 (= res!984799 (= (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637375 () array!98454)

(assert (=> b!1453843 (= lt!637375 (array!98455 (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48065 a!2862)))))

(declare-fun b!1453844 () Bool)

(declare-fun res!984814 () Bool)

(assert (=> b!1453844 (=> (not res!984814) (not e!818253))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453844 (= res!984814 (validKeyInArray!0 (select (arr!47515 a!2862) j!93)))))

(declare-fun b!1453845 () Bool)

(declare-fun res!984801 () Bool)

(declare-fun e!818255 () Bool)

(assert (=> b!1453845 (=> res!984801 e!818255)))

(declare-datatypes ((SeekEntryResult!11767 0))(
  ( (MissingZero!11767 (index!49460 (_ BitVec 32))) (Found!11767 (index!49461 (_ BitVec 32))) (Intermediate!11767 (undefined!12579 Bool) (index!49462 (_ BitVec 32)) (x!131096 (_ BitVec 32))) (Undefined!11767) (MissingVacant!11767 (index!49463 (_ BitVec 32))) )
))
(declare-fun lt!637376 () SeekEntryResult!11767)

(declare-fun lt!637377 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98454 (_ BitVec 32)) SeekEntryResult!11767)

(assert (=> b!1453845 (= res!984801 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637377 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!637376)))))

(declare-fun b!1453846 () Bool)

(declare-fun res!984806 () Bool)

(assert (=> b!1453846 (=> (not res!984806) (not e!818259))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453846 (= res!984806 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453847 () Bool)

(declare-fun e!818254 () Bool)

(assert (=> b!1453847 (= e!818259 (not e!818254))))

(declare-fun res!984797 () Bool)

(assert (=> b!1453847 (=> res!984797 e!818254)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1453847 (= res!984797 (or (and (= (select (arr!47515 a!2862) index!646) (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47515 a!2862) index!646) (select (arr!47515 a!2862) j!93))) (= (select (arr!47515 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818257 () Bool)

(assert (=> b!1453847 e!818257))

(declare-fun res!984810 () Bool)

(assert (=> b!1453847 (=> (not res!984810) (not e!818257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98454 (_ BitVec 32)) Bool)

(assert (=> b!1453847 (= res!984810 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49030 0))(
  ( (Unit!49031) )
))
(declare-fun lt!637373 () Unit!49030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49030)

(assert (=> b!1453847 (= lt!637373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453848 () Bool)

(declare-fun res!984809 () Bool)

(assert (=> b!1453848 (=> (not res!984809) (not e!818253))))

(declare-datatypes ((List!34016 0))(
  ( (Nil!34013) (Cons!34012 (h!35362 (_ BitVec 64)) (t!48710 List!34016)) )
))
(declare-fun arrayNoDuplicates!0 (array!98454 (_ BitVec 32) List!34016) Bool)

(assert (=> b!1453848 (= res!984809 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34013))))

(declare-fun e!818252 () Bool)

(declare-fun b!1453849 () Bool)

(declare-fun lt!637371 () SeekEntryResult!11767)

(declare-fun lt!637370 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98454 (_ BitVec 32)) SeekEntryResult!11767)

(assert (=> b!1453849 (= e!818252 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637377 intermediateAfterIndex!19 lt!637370 lt!637375 mask!2687) lt!637371)))))

(declare-fun b!1453850 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453850 (= e!818257 (and (or (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) (select (arr!47515 a!2862) j!93))) (let ((bdg!53005 (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47515 a!2862) index!646) bdg!53005) (= (select (arr!47515 a!2862) index!646) (select (arr!47515 a!2862) j!93))) (= (select (arr!47515 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53005 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453851 () Bool)

(declare-fun lt!637372 () SeekEntryResult!11767)

(assert (=> b!1453851 (= e!818261 (= lt!637372 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637370 lt!637375 mask!2687)))))

(declare-fun b!1453852 () Bool)

(declare-fun e!818260 () Bool)

(assert (=> b!1453852 (= e!818260 e!818259)))

(declare-fun res!984807 () Bool)

(assert (=> b!1453852 (=> (not res!984807) (not e!818259))))

(assert (=> b!1453852 (= res!984807 (= lt!637372 (Intermediate!11767 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453852 (= lt!637372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637370 mask!2687) lt!637370 lt!637375 mask!2687))))

(assert (=> b!1453852 (= lt!637370 (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453853 () Bool)

(assert (=> b!1453853 (= e!818258 e!818260)))

(declare-fun res!984802 () Bool)

(assert (=> b!1453853 (=> (not res!984802) (not e!818260))))

(assert (=> b!1453853 (= res!984802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47515 a!2862) j!93) mask!2687) (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!637376))))

(assert (=> b!1453853 (= lt!637376 (Intermediate!11767 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453854 () Bool)

(assert (=> b!1453854 (= e!818254 e!818255)))

(declare-fun res!984808 () Bool)

(assert (=> b!1453854 (=> res!984808 e!818255)))

(assert (=> b!1453854 (= res!984808 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637377 #b00000000000000000000000000000000) (bvsge lt!637377 (size!48065 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453854 (= lt!637377 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453854 (= lt!637371 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637370 lt!637375 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98454 (_ BitVec 32)) SeekEntryResult!11767)

(assert (=> b!1453854 (= lt!637371 (seekEntryOrOpen!0 lt!637370 lt!637375 mask!2687))))

(declare-fun b!1453856 () Bool)

(assert (=> b!1453856 (= e!818255 true)))

(declare-fun lt!637374 () Bool)

(assert (=> b!1453856 (= lt!637374 e!818252)))

(declare-fun c!134034 () Bool)

(assert (=> b!1453856 (= c!134034 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453857 () Bool)

(declare-fun res!984811 () Bool)

(assert (=> b!1453857 (=> (not res!984811) (not e!818257))))

(assert (=> b!1453857 (= res!984811 (= (seekEntryOrOpen!0 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) (Found!11767 j!93)))))

(declare-fun b!1453858 () Bool)

(assert (=> b!1453858 (= e!818261 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637370 lt!637375 mask!2687) (seekEntryOrOpen!0 lt!637370 lt!637375 mask!2687)))))

(declare-fun b!1453859 () Bool)

(declare-fun res!984798 () Bool)

(assert (=> b!1453859 (=> (not res!984798) (not e!818260))))

(assert (=> b!1453859 (= res!984798 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!637376))))

(declare-fun b!1453860 () Bool)

(declare-fun res!984803 () Bool)

(assert (=> b!1453860 (=> (not res!984803) (not e!818253))))

(assert (=> b!1453860 (= res!984803 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48065 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48065 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48065 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453861 () Bool)

(assert (=> b!1453861 (= e!818252 (not (= lt!637372 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637377 lt!637370 lt!637375 mask!2687))))))

(declare-fun b!1453862 () Bool)

(declare-fun res!984813 () Bool)

(assert (=> b!1453862 (=> (not res!984813) (not e!818253))))

(assert (=> b!1453862 (= res!984813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453863 () Bool)

(declare-fun res!984805 () Bool)

(assert (=> b!1453863 (=> (not res!984805) (not e!818253))))

(assert (=> b!1453863 (= res!984805 (and (= (size!48065 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48065 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48065 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!984800 () Bool)

(assert (=> start!125006 (=> (not res!984800) (not e!818253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125006 (= res!984800 (validMask!0 mask!2687))))

(assert (=> start!125006 e!818253))

(assert (=> start!125006 true))

(declare-fun array_inv!36543 (array!98454) Bool)

(assert (=> start!125006 (array_inv!36543 a!2862)))

(declare-fun b!1453855 () Bool)

(declare-fun res!984812 () Bool)

(assert (=> b!1453855 (=> (not res!984812) (not e!818253))))

(assert (=> b!1453855 (= res!984812 (validKeyInArray!0 (select (arr!47515 a!2862) i!1006)))))

(assert (= (and start!125006 res!984800) b!1453863))

(assert (= (and b!1453863 res!984805) b!1453855))

(assert (= (and b!1453855 res!984812) b!1453844))

(assert (= (and b!1453844 res!984814) b!1453862))

(assert (= (and b!1453862 res!984813) b!1453848))

(assert (= (and b!1453848 res!984809) b!1453860))

(assert (= (and b!1453860 res!984803) b!1453843))

(assert (= (and b!1453843 res!984799) b!1453853))

(assert (= (and b!1453853 res!984802) b!1453859))

(assert (= (and b!1453859 res!984798) b!1453852))

(assert (= (and b!1453852 res!984807) b!1453842))

(assert (= (and b!1453842 c!134033) b!1453851))

(assert (= (and b!1453842 (not c!134033)) b!1453858))

(assert (= (and b!1453842 res!984804) b!1453846))

(assert (= (and b!1453846 res!984806) b!1453847))

(assert (= (and b!1453847 res!984810) b!1453857))

(assert (= (and b!1453857 res!984811) b!1453850))

(assert (= (and b!1453847 (not res!984797)) b!1453854))

(assert (= (and b!1453854 (not res!984808)) b!1453845))

(assert (= (and b!1453845 (not res!984801)) b!1453856))

(assert (= (and b!1453856 c!134034) b!1453861))

(assert (= (and b!1453856 (not c!134034)) b!1453849))

(declare-fun m!1342257 () Bool)

(assert (=> start!125006 m!1342257))

(declare-fun m!1342259 () Bool)

(assert (=> start!125006 m!1342259))

(declare-fun m!1342261 () Bool)

(assert (=> b!1453844 m!1342261))

(assert (=> b!1453844 m!1342261))

(declare-fun m!1342263 () Bool)

(assert (=> b!1453844 m!1342263))

(declare-fun m!1342265 () Bool)

(assert (=> b!1453849 m!1342265))

(assert (=> b!1453853 m!1342261))

(assert (=> b!1453853 m!1342261))

(declare-fun m!1342267 () Bool)

(assert (=> b!1453853 m!1342267))

(assert (=> b!1453853 m!1342267))

(assert (=> b!1453853 m!1342261))

(declare-fun m!1342269 () Bool)

(assert (=> b!1453853 m!1342269))

(declare-fun m!1342271 () Bool)

(assert (=> b!1453862 m!1342271))

(declare-fun m!1342273 () Bool)

(assert (=> b!1453861 m!1342273))

(declare-fun m!1342275 () Bool)

(assert (=> b!1453848 m!1342275))

(declare-fun m!1342277 () Bool)

(assert (=> b!1453850 m!1342277))

(declare-fun m!1342279 () Bool)

(assert (=> b!1453850 m!1342279))

(declare-fun m!1342281 () Bool)

(assert (=> b!1453850 m!1342281))

(declare-fun m!1342283 () Bool)

(assert (=> b!1453850 m!1342283))

(assert (=> b!1453850 m!1342261))

(declare-fun m!1342285 () Bool)

(assert (=> b!1453855 m!1342285))

(assert (=> b!1453855 m!1342285))

(declare-fun m!1342287 () Bool)

(assert (=> b!1453855 m!1342287))

(assert (=> b!1453857 m!1342261))

(assert (=> b!1453857 m!1342261))

(declare-fun m!1342289 () Bool)

(assert (=> b!1453857 m!1342289))

(assert (=> b!1453859 m!1342261))

(assert (=> b!1453859 m!1342261))

(declare-fun m!1342291 () Bool)

(assert (=> b!1453859 m!1342291))

(assert (=> b!1453843 m!1342277))

(declare-fun m!1342293 () Bool)

(assert (=> b!1453843 m!1342293))

(declare-fun m!1342295 () Bool)

(assert (=> b!1453851 m!1342295))

(declare-fun m!1342297 () Bool)

(assert (=> b!1453854 m!1342297))

(declare-fun m!1342299 () Bool)

(assert (=> b!1453854 m!1342299))

(declare-fun m!1342301 () Bool)

(assert (=> b!1453854 m!1342301))

(assert (=> b!1453845 m!1342261))

(assert (=> b!1453845 m!1342261))

(declare-fun m!1342303 () Bool)

(assert (=> b!1453845 m!1342303))

(assert (=> b!1453858 m!1342299))

(assert (=> b!1453858 m!1342301))

(declare-fun m!1342305 () Bool)

(assert (=> b!1453852 m!1342305))

(assert (=> b!1453852 m!1342305))

(declare-fun m!1342307 () Bool)

(assert (=> b!1453852 m!1342307))

(assert (=> b!1453852 m!1342277))

(declare-fun m!1342309 () Bool)

(assert (=> b!1453852 m!1342309))

(declare-fun m!1342311 () Bool)

(assert (=> b!1453847 m!1342311))

(assert (=> b!1453847 m!1342277))

(assert (=> b!1453847 m!1342281))

(assert (=> b!1453847 m!1342283))

(declare-fun m!1342313 () Bool)

(assert (=> b!1453847 m!1342313))

(assert (=> b!1453847 m!1342261))

(push 1)

