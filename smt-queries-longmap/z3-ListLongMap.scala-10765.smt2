; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125878 () Bool)

(assert start!125878)

(declare-fun b!1474016 () Bool)

(declare-fun res!1001375 () Bool)

(declare-fun e!827062 () Bool)

(assert (=> b!1474016 (=> (not res!1001375) (not e!827062))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474016 (= res!1001375 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474017 () Bool)

(declare-fun res!1001369 () Bool)

(declare-fun e!827064 () Bool)

(assert (=> b!1474017 (=> (not res!1001369) (not e!827064))))

(declare-datatypes ((array!99133 0))(
  ( (array!99134 (arr!47851 (Array (_ BitVec 32) (_ BitVec 64))) (size!48403 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99133)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474017 (= res!1001369 (validKeyInArray!0 (select (arr!47851 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!827063 () Bool)

(declare-fun b!1474018 () Bool)

(assert (=> b!1474018 (= e!827063 (or (= (select (arr!47851 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47851 a!2862) intermediateBeforeIndex!19) (select (arr!47851 a!2862) j!93))))))

(declare-fun e!827066 () Bool)

(declare-fun lt!643953 () array!99133)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!643952 () (_ BitVec 64))

(declare-fun b!1474019 () Bool)

(declare-datatypes ((SeekEntryResult!12116 0))(
  ( (MissingZero!12116 (index!50856 (_ BitVec 32))) (Found!12116 (index!50857 (_ BitVec 32))) (Intermediate!12116 (undefined!12928 Bool) (index!50858 (_ BitVec 32)) (x!132435 (_ BitVec 32))) (Undefined!12116) (MissingVacant!12116 (index!50859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99133 (_ BitVec 32)) SeekEntryResult!12116)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99133 (_ BitVec 32)) SeekEntryResult!12116)

(assert (=> b!1474019 (= e!827066 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643952 lt!643953 mask!2687) (seekEntryOrOpen!0 lt!643952 lt!643953 mask!2687)))))

(declare-fun b!1474020 () Bool)

(declare-fun res!1001364 () Bool)

(assert (=> b!1474020 (=> (not res!1001364) (not e!827064))))

(declare-datatypes ((List!34430 0))(
  ( (Nil!34427) (Cons!34426 (h!35785 (_ BitVec 64)) (t!49116 List!34430)) )
))
(declare-fun arrayNoDuplicates!0 (array!99133 (_ BitVec 32) List!34430) Bool)

(assert (=> b!1474020 (= res!1001364 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34427))))

(declare-fun b!1474021 () Bool)

(declare-fun lt!643951 () SeekEntryResult!12116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99133 (_ BitVec 32)) SeekEntryResult!12116)

(assert (=> b!1474021 (= e!827066 (= lt!643951 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643952 lt!643953 mask!2687)))))

(declare-fun res!1001367 () Bool)

(assert (=> start!125878 (=> (not res!1001367) (not e!827064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125878 (= res!1001367 (validMask!0 mask!2687))))

(assert (=> start!125878 e!827064))

(assert (=> start!125878 true))

(declare-fun array_inv!37084 (array!99133) Bool)

(assert (=> start!125878 (array_inv!37084 a!2862)))

(declare-fun b!1474022 () Bool)

(declare-fun res!1001373 () Bool)

(assert (=> b!1474022 (=> (not res!1001373) (not e!827063))))

(assert (=> b!1474022 (= res!1001373 (= (seekEntryOrOpen!0 (select (arr!47851 a!2862) j!93) a!2862 mask!2687) (Found!12116 j!93)))))

(declare-fun b!1474023 () Bool)

(declare-fun e!827061 () Bool)

(assert (=> b!1474023 (= e!827061 e!827062)))

(declare-fun res!1001368 () Bool)

(assert (=> b!1474023 (=> (not res!1001368) (not e!827062))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474023 (= res!1001368 (= lt!643951 (Intermediate!12116 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474023 (= lt!643951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643952 mask!2687) lt!643952 lt!643953 mask!2687))))

(assert (=> b!1474023 (= lt!643952 (select (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474024 () Bool)

(declare-fun e!827067 () Bool)

(assert (=> b!1474024 (= e!827067 e!827061)))

(declare-fun res!1001377 () Bool)

(assert (=> b!1474024 (=> (not res!1001377) (not e!827061))))

(declare-fun lt!643950 () SeekEntryResult!12116)

(assert (=> b!1474024 (= res!1001377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47851 a!2862) j!93) mask!2687) (select (arr!47851 a!2862) j!93) a!2862 mask!2687) lt!643950))))

(assert (=> b!1474024 (= lt!643950 (Intermediate!12116 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474025 () Bool)

(declare-fun res!1001372 () Bool)

(assert (=> b!1474025 (=> (not res!1001372) (not e!827064))))

(assert (=> b!1474025 (= res!1001372 (validKeyInArray!0 (select (arr!47851 a!2862) j!93)))))

(declare-fun b!1474026 () Bool)

(declare-fun res!1001370 () Bool)

(assert (=> b!1474026 (=> (not res!1001370) (not e!827062))))

(assert (=> b!1474026 (= res!1001370 e!827066)))

(declare-fun c!135844 () Bool)

(assert (=> b!1474026 (= c!135844 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474027 () Bool)

(assert (=> b!1474027 (= e!827062 (not true))))

(assert (=> b!1474027 e!827063))

(declare-fun res!1001371 () Bool)

(assert (=> b!1474027 (=> (not res!1001371) (not e!827063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99133 (_ BitVec 32)) Bool)

(assert (=> b!1474027 (= res!1001371 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49413 0))(
  ( (Unit!49414) )
))
(declare-fun lt!643949 () Unit!49413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49413)

(assert (=> b!1474027 (= lt!643949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474028 () Bool)

(assert (=> b!1474028 (= e!827064 e!827067)))

(declare-fun res!1001376 () Bool)

(assert (=> b!1474028 (=> (not res!1001376) (not e!827067))))

(assert (=> b!1474028 (= res!1001376 (= (select (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474028 (= lt!643953 (array!99134 (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48403 a!2862)))))

(declare-fun b!1474029 () Bool)

(declare-fun res!1001366 () Bool)

(assert (=> b!1474029 (=> (not res!1001366) (not e!827061))))

(assert (=> b!1474029 (= res!1001366 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47851 a!2862) j!93) a!2862 mask!2687) lt!643950))))

(declare-fun b!1474030 () Bool)

(declare-fun res!1001374 () Bool)

(assert (=> b!1474030 (=> (not res!1001374) (not e!827064))))

(assert (=> b!1474030 (= res!1001374 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48403 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48403 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48403 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474031 () Bool)

(declare-fun res!1001363 () Bool)

(assert (=> b!1474031 (=> (not res!1001363) (not e!827064))))

(assert (=> b!1474031 (= res!1001363 (and (= (size!48403 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48403 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48403 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474032 () Bool)

(declare-fun res!1001365 () Bool)

(assert (=> b!1474032 (=> (not res!1001365) (not e!827064))))

(assert (=> b!1474032 (= res!1001365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125878 res!1001367) b!1474031))

(assert (= (and b!1474031 res!1001363) b!1474017))

(assert (= (and b!1474017 res!1001369) b!1474025))

(assert (= (and b!1474025 res!1001372) b!1474032))

(assert (= (and b!1474032 res!1001365) b!1474020))

(assert (= (and b!1474020 res!1001364) b!1474030))

(assert (= (and b!1474030 res!1001374) b!1474028))

(assert (= (and b!1474028 res!1001376) b!1474024))

(assert (= (and b!1474024 res!1001377) b!1474029))

(assert (= (and b!1474029 res!1001366) b!1474023))

(assert (= (and b!1474023 res!1001368) b!1474026))

(assert (= (and b!1474026 c!135844) b!1474021))

(assert (= (and b!1474026 (not c!135844)) b!1474019))

(assert (= (and b!1474026 res!1001370) b!1474016))

(assert (= (and b!1474016 res!1001375) b!1474027))

(assert (= (and b!1474027 res!1001371) b!1474022))

(assert (= (and b!1474022 res!1001373) b!1474018))

(declare-fun m!1360005 () Bool)

(assert (=> b!1474025 m!1360005))

(assert (=> b!1474025 m!1360005))

(declare-fun m!1360007 () Bool)

(assert (=> b!1474025 m!1360007))

(declare-fun m!1360009 () Bool)

(assert (=> b!1474021 m!1360009))

(assert (=> b!1474024 m!1360005))

(assert (=> b!1474024 m!1360005))

(declare-fun m!1360011 () Bool)

(assert (=> b!1474024 m!1360011))

(assert (=> b!1474024 m!1360011))

(assert (=> b!1474024 m!1360005))

(declare-fun m!1360013 () Bool)

(assert (=> b!1474024 m!1360013))

(declare-fun m!1360015 () Bool)

(assert (=> b!1474019 m!1360015))

(declare-fun m!1360017 () Bool)

(assert (=> b!1474019 m!1360017))

(declare-fun m!1360019 () Bool)

(assert (=> b!1474017 m!1360019))

(assert (=> b!1474017 m!1360019))

(declare-fun m!1360021 () Bool)

(assert (=> b!1474017 m!1360021))

(assert (=> b!1474029 m!1360005))

(assert (=> b!1474029 m!1360005))

(declare-fun m!1360023 () Bool)

(assert (=> b!1474029 m!1360023))

(declare-fun m!1360025 () Bool)

(assert (=> start!125878 m!1360025))

(declare-fun m!1360027 () Bool)

(assert (=> start!125878 m!1360027))

(assert (=> b!1474022 m!1360005))

(assert (=> b!1474022 m!1360005))

(declare-fun m!1360029 () Bool)

(assert (=> b!1474022 m!1360029))

(declare-fun m!1360031 () Bool)

(assert (=> b!1474018 m!1360031))

(assert (=> b!1474018 m!1360005))

(declare-fun m!1360033 () Bool)

(assert (=> b!1474020 m!1360033))

(declare-fun m!1360035 () Bool)

(assert (=> b!1474032 m!1360035))

(declare-fun m!1360037 () Bool)

(assert (=> b!1474027 m!1360037))

(declare-fun m!1360039 () Bool)

(assert (=> b!1474027 m!1360039))

(declare-fun m!1360041 () Bool)

(assert (=> b!1474023 m!1360041))

(assert (=> b!1474023 m!1360041))

(declare-fun m!1360043 () Bool)

(assert (=> b!1474023 m!1360043))

(declare-fun m!1360045 () Bool)

(assert (=> b!1474023 m!1360045))

(declare-fun m!1360047 () Bool)

(assert (=> b!1474023 m!1360047))

(assert (=> b!1474028 m!1360045))

(declare-fun m!1360049 () Bool)

(assert (=> b!1474028 m!1360049))

(check-sat (not b!1474025) (not b!1474027) (not b!1474021) (not b!1474022) (not b!1474029) (not b!1474024) (not b!1474019) (not b!1474032) (not b!1474017) (not b!1474023) (not b!1474020) (not start!125878))
(check-sat)
