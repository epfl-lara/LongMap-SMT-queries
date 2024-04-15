; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126362 () Bool)

(assert start!126362)

(declare-fun b!1481963 () Bool)

(declare-fun res!1007411 () Bool)

(declare-fun e!831017 () Bool)

(assert (=> b!1481963 (=> (not res!1007411) (not e!831017))))

(declare-fun e!831019 () Bool)

(assert (=> b!1481963 (= res!1007411 e!831019)))

(declare-fun c!136801 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481963 (= c!136801 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481964 () Bool)

(declare-fun res!1007422 () Bool)

(declare-fun e!831014 () Bool)

(assert (=> b!1481964 (=> (not res!1007422) (not e!831014))))

(declare-datatypes ((array!99379 0))(
  ( (array!99380 (arr!47968 (Array (_ BitVec 32) (_ BitVec 64))) (size!48520 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99379)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481964 (= res!1007422 (validKeyInArray!0 (select (arr!47968 a!2862) i!1006)))))

(declare-fun b!1481965 () Bool)

(declare-fun res!1007410 () Bool)

(assert (=> b!1481965 (=> (not res!1007410) (not e!831014))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1481965 (= res!1007410 (and (= (size!48520 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48520 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48520 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!646739 () (_ BitVec 64))

(declare-fun b!1481966 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646737 () array!99379)

(declare-datatypes ((SeekEntryResult!12233 0))(
  ( (MissingZero!12233 (index!51324 (_ BitVec 32))) (Found!12233 (index!51325 (_ BitVec 32))) (Intermediate!12233 (undefined!13045 Bool) (index!51326 (_ BitVec 32)) (x!132901 (_ BitVec 32))) (Undefined!12233) (MissingVacant!12233 (index!51327 (_ BitVec 32))) )
))
(declare-fun lt!646735 () SeekEntryResult!12233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99379 (_ BitVec 32)) SeekEntryResult!12233)

(assert (=> b!1481966 (= e!831019 (= lt!646735 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646739 lt!646737 mask!2687)))))

(declare-fun b!1481967 () Bool)

(declare-fun res!1007409 () Bool)

(assert (=> b!1481967 (=> (not res!1007409) (not e!831014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99379 (_ BitVec 32)) Bool)

(assert (=> b!1481967 (= res!1007409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481968 () Bool)

(declare-fun res!1007421 () Bool)

(assert (=> b!1481968 (=> (not res!1007421) (not e!831017))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481968 (= res!1007421 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481969 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99379 (_ BitVec 32)) SeekEntryResult!12233)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99379 (_ BitVec 32)) SeekEntryResult!12233)

(assert (=> b!1481969 (= e!831019 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646739 lt!646737 mask!2687) (seekEntryOrOpen!0 lt!646739 lt!646737 mask!2687)))))

(declare-fun b!1481970 () Bool)

(declare-fun res!1007412 () Bool)

(declare-fun e!831016 () Bool)

(assert (=> b!1481970 (=> (not res!1007412) (not e!831016))))

(assert (=> b!1481970 (= res!1007412 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) (Found!12233 j!93)))))

(declare-fun b!1481971 () Bool)

(assert (=> b!1481971 (= e!831017 (not true))))

(assert (=> b!1481971 e!831016))

(declare-fun res!1007416 () Bool)

(assert (=> b!1481971 (=> (not res!1007416) (not e!831016))))

(assert (=> b!1481971 (= res!1007416 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49647 0))(
  ( (Unit!49648) )
))
(declare-fun lt!646736 () Unit!49647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49647)

(assert (=> b!1481971 (= lt!646736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481972 () Bool)

(declare-fun res!1007408 () Bool)

(assert (=> b!1481972 (=> (not res!1007408) (not e!831014))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481972 (= res!1007408 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48520 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48520 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48520 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481973 () Bool)

(declare-fun res!1007414 () Bool)

(assert (=> b!1481973 (=> (not res!1007414) (not e!831014))))

(declare-datatypes ((List!34547 0))(
  ( (Nil!34544) (Cons!34543 (h!35914 (_ BitVec 64)) (t!49233 List!34547)) )
))
(declare-fun arrayNoDuplicates!0 (array!99379 (_ BitVec 32) List!34547) Bool)

(assert (=> b!1481973 (= res!1007414 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34544))))

(declare-fun res!1007413 () Bool)

(assert (=> start!126362 (=> (not res!1007413) (not e!831014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126362 (= res!1007413 (validMask!0 mask!2687))))

(assert (=> start!126362 e!831014))

(assert (=> start!126362 true))

(declare-fun array_inv!37201 (array!99379) Bool)

(assert (=> start!126362 (array_inv!37201 a!2862)))

(declare-fun b!1481974 () Bool)

(declare-fun res!1007418 () Bool)

(assert (=> b!1481974 (=> (not res!1007418) (not e!831014))))

(assert (=> b!1481974 (= res!1007418 (validKeyInArray!0 (select (arr!47968 a!2862) j!93)))))

(declare-fun b!1481975 () Bool)

(declare-fun e!831020 () Bool)

(assert (=> b!1481975 (= e!831020 e!831017)))

(declare-fun res!1007419 () Bool)

(assert (=> b!1481975 (=> (not res!1007419) (not e!831017))))

(assert (=> b!1481975 (= res!1007419 (= lt!646735 (Intermediate!12233 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481975 (= lt!646735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646739 mask!2687) lt!646739 lt!646737 mask!2687))))

(assert (=> b!1481975 (= lt!646739 (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481976 () Bool)

(assert (=> b!1481976 (= e!831016 (and (or (= (select (arr!47968 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47968 a!2862) intermediateBeforeIndex!19) (select (arr!47968 a!2862) j!93))) (or (and (= (select (arr!47968 a!2862) index!646) (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47968 a!2862) index!646) (select (arr!47968 a!2862) j!93))) (= (select (arr!47968 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481977 () Bool)

(declare-fun e!831015 () Bool)

(assert (=> b!1481977 (= e!831015 e!831020)))

(declare-fun res!1007417 () Bool)

(assert (=> b!1481977 (=> (not res!1007417) (not e!831020))))

(declare-fun lt!646738 () SeekEntryResult!12233)

(assert (=> b!1481977 (= res!1007417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646738))))

(assert (=> b!1481977 (= lt!646738 (Intermediate!12233 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481978 () Bool)

(assert (=> b!1481978 (= e!831014 e!831015)))

(declare-fun res!1007420 () Bool)

(assert (=> b!1481978 (=> (not res!1007420) (not e!831015))))

(assert (=> b!1481978 (= res!1007420 (= (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481978 (= lt!646737 (array!99380 (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48520 a!2862)))))

(declare-fun b!1481979 () Bool)

(declare-fun res!1007415 () Bool)

(assert (=> b!1481979 (=> (not res!1007415) (not e!831020))))

(assert (=> b!1481979 (= res!1007415 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646738))))

(assert (= (and start!126362 res!1007413) b!1481965))

(assert (= (and b!1481965 res!1007410) b!1481964))

(assert (= (and b!1481964 res!1007422) b!1481974))

(assert (= (and b!1481974 res!1007418) b!1481967))

(assert (= (and b!1481967 res!1007409) b!1481973))

(assert (= (and b!1481973 res!1007414) b!1481972))

(assert (= (and b!1481972 res!1007408) b!1481978))

(assert (= (and b!1481978 res!1007420) b!1481977))

(assert (= (and b!1481977 res!1007417) b!1481979))

(assert (= (and b!1481979 res!1007415) b!1481975))

(assert (= (and b!1481975 res!1007419) b!1481963))

(assert (= (and b!1481963 c!136801) b!1481966))

(assert (= (and b!1481963 (not c!136801)) b!1481969))

(assert (= (and b!1481963 res!1007411) b!1481968))

(assert (= (and b!1481968 res!1007421) b!1481971))

(assert (= (and b!1481971 res!1007416) b!1481970))

(assert (= (and b!1481970 res!1007412) b!1481976))

(declare-fun m!1367151 () Bool)

(assert (=> b!1481975 m!1367151))

(assert (=> b!1481975 m!1367151))

(declare-fun m!1367153 () Bool)

(assert (=> b!1481975 m!1367153))

(declare-fun m!1367155 () Bool)

(assert (=> b!1481975 m!1367155))

(declare-fun m!1367157 () Bool)

(assert (=> b!1481975 m!1367157))

(declare-fun m!1367159 () Bool)

(assert (=> b!1481977 m!1367159))

(assert (=> b!1481977 m!1367159))

(declare-fun m!1367161 () Bool)

(assert (=> b!1481977 m!1367161))

(assert (=> b!1481977 m!1367161))

(assert (=> b!1481977 m!1367159))

(declare-fun m!1367163 () Bool)

(assert (=> b!1481977 m!1367163))

(declare-fun m!1367165 () Bool)

(assert (=> b!1481966 m!1367165))

(declare-fun m!1367167 () Bool)

(assert (=> b!1481971 m!1367167))

(declare-fun m!1367169 () Bool)

(assert (=> b!1481971 m!1367169))

(declare-fun m!1367171 () Bool)

(assert (=> b!1481973 m!1367171))

(assert (=> b!1481970 m!1367159))

(assert (=> b!1481970 m!1367159))

(declare-fun m!1367173 () Bool)

(assert (=> b!1481970 m!1367173))

(declare-fun m!1367175 () Bool)

(assert (=> b!1481967 m!1367175))

(assert (=> b!1481978 m!1367155))

(declare-fun m!1367177 () Bool)

(assert (=> b!1481978 m!1367177))

(assert (=> b!1481974 m!1367159))

(assert (=> b!1481974 m!1367159))

(declare-fun m!1367179 () Bool)

(assert (=> b!1481974 m!1367179))

(declare-fun m!1367181 () Bool)

(assert (=> b!1481964 m!1367181))

(assert (=> b!1481964 m!1367181))

(declare-fun m!1367183 () Bool)

(assert (=> b!1481964 m!1367183))

(declare-fun m!1367185 () Bool)

(assert (=> start!126362 m!1367185))

(declare-fun m!1367187 () Bool)

(assert (=> start!126362 m!1367187))

(declare-fun m!1367189 () Bool)

(assert (=> b!1481969 m!1367189))

(declare-fun m!1367191 () Bool)

(assert (=> b!1481969 m!1367191))

(assert (=> b!1481979 m!1367159))

(assert (=> b!1481979 m!1367159))

(declare-fun m!1367193 () Bool)

(assert (=> b!1481979 m!1367193))

(assert (=> b!1481976 m!1367155))

(declare-fun m!1367195 () Bool)

(assert (=> b!1481976 m!1367195))

(declare-fun m!1367197 () Bool)

(assert (=> b!1481976 m!1367197))

(declare-fun m!1367199 () Bool)

(assert (=> b!1481976 m!1367199))

(assert (=> b!1481976 m!1367159))

(check-sat (not b!1481974) (not b!1481970) (not b!1481979) (not b!1481973) (not b!1481969) (not b!1481967) (not b!1481966) (not b!1481971) (not b!1481977) (not b!1481975) (not b!1481964) (not start!126362))
(check-sat)
