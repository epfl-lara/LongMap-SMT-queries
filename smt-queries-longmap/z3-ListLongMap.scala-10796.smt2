; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126366 () Bool)

(assert start!126366)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99385 0))(
  ( (array!99386 (arr!47970 (Array (_ BitVec 32) (_ BitVec 64))) (size!48520 (_ BitVec 32))) )
))
(declare-fun lt!646698 () array!99385)

(declare-fun e!830763 () Bool)

(declare-fun b!1481159 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12210 0))(
  ( (MissingZero!12210 (index!51232 (_ BitVec 32))) (Found!12210 (index!51233 (_ BitVec 32))) (Intermediate!12210 (undefined!13022 Bool) (index!51234 (_ BitVec 32)) (x!132821 (_ BitVec 32))) (Undefined!12210) (MissingVacant!12210 (index!51235 (_ BitVec 32))) )
))
(declare-fun lt!646695 () SeekEntryResult!12210)

(declare-fun lt!646696 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99385 (_ BitVec 32)) SeekEntryResult!12210)

(assert (=> b!1481159 (= e!830763 (= lt!646695 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646696 lt!646698 mask!2687)))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1481160 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99385 (_ BitVec 32)) SeekEntryResult!12210)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99385 (_ BitVec 32)) SeekEntryResult!12210)

(assert (=> b!1481160 (= e!830763 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646696 lt!646698 mask!2687) (seekEntryOrOpen!0 lt!646696 lt!646698 mask!2687)))))

(declare-fun b!1481161 () Bool)

(declare-fun res!1006518 () Bool)

(declare-fun e!830760 () Bool)

(assert (=> b!1481161 (=> (not res!1006518) (not e!830760))))

(declare-fun a!2862 () array!99385)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481161 (= res!1006518 (validKeyInArray!0 (select (arr!47970 a!2862) i!1006)))))

(declare-fun b!1481162 () Bool)

(declare-fun res!1006526 () Bool)

(assert (=> b!1481162 (=> (not res!1006526) (not e!830760))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1481162 (= res!1006526 (validKeyInArray!0 (select (arr!47970 a!2862) j!93)))))

(declare-fun res!1006523 () Bool)

(assert (=> start!126366 (=> (not res!1006523) (not e!830760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126366 (= res!1006523 (validMask!0 mask!2687))))

(assert (=> start!126366 e!830760))

(assert (=> start!126366 true))

(declare-fun array_inv!36998 (array!99385) Bool)

(assert (=> start!126366 (array_inv!36998 a!2862)))

(declare-fun b!1481163 () Bool)

(declare-fun res!1006528 () Bool)

(declare-fun e!830759 () Bool)

(assert (=> b!1481163 (=> (not res!1006528) (not e!830759))))

(assert (=> b!1481163 (= res!1006528 e!830763)))

(declare-fun c!136842 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481163 (= c!136842 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481164 () Bool)

(declare-fun res!1006531 () Bool)

(assert (=> b!1481164 (=> (not res!1006531) (not e!830760))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481164 (= res!1006531 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48520 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48520 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48520 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481165 () Bool)

(declare-fun res!1006530 () Bool)

(assert (=> b!1481165 (=> (not res!1006530) (not e!830759))))

(assert (=> b!1481165 (= res!1006530 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481166 () Bool)

(declare-fun res!1006524 () Bool)

(assert (=> b!1481166 (=> (not res!1006524) (not e!830760))))

(declare-datatypes ((List!34471 0))(
  ( (Nil!34468) (Cons!34467 (h!35838 (_ BitVec 64)) (t!49165 List!34471)) )
))
(declare-fun arrayNoDuplicates!0 (array!99385 (_ BitVec 32) List!34471) Bool)

(assert (=> b!1481166 (= res!1006524 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34468))))

(declare-fun b!1481167 () Bool)

(declare-fun e!830764 () Bool)

(assert (=> b!1481167 (= e!830764 (and (or (= (select (arr!47970 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47970 a!2862) intermediateBeforeIndex!19) (select (arr!47970 a!2862) j!93))) (or (and (= (select (arr!47970 a!2862) index!646) (select (store (arr!47970 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47970 a!2862) index!646) (select (arr!47970 a!2862) j!93))) (= (select (arr!47970 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481168 () Bool)

(declare-fun res!1006522 () Bool)

(declare-fun e!830762 () Bool)

(assert (=> b!1481168 (=> (not res!1006522) (not e!830762))))

(declare-fun lt!646697 () SeekEntryResult!12210)

(assert (=> b!1481168 (= res!1006522 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47970 a!2862) j!93) a!2862 mask!2687) lt!646697))))

(declare-fun b!1481169 () Bool)

(declare-fun e!830765 () Bool)

(assert (=> b!1481169 (= e!830765 e!830762)))

(declare-fun res!1006529 () Bool)

(assert (=> b!1481169 (=> (not res!1006529) (not e!830762))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481169 (= res!1006529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47970 a!2862) j!93) mask!2687) (select (arr!47970 a!2862) j!93) a!2862 mask!2687) lt!646697))))

(assert (=> b!1481169 (= lt!646697 (Intermediate!12210 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481170 () Bool)

(assert (=> b!1481170 (= e!830760 e!830765)))

(declare-fun res!1006517 () Bool)

(assert (=> b!1481170 (=> (not res!1006517) (not e!830765))))

(assert (=> b!1481170 (= res!1006517 (= (select (store (arr!47970 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481170 (= lt!646698 (array!99386 (store (arr!47970 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48520 a!2862)))))

(declare-fun b!1481171 () Bool)

(assert (=> b!1481171 (= e!830762 e!830759)))

(declare-fun res!1006525 () Bool)

(assert (=> b!1481171 (=> (not res!1006525) (not e!830759))))

(assert (=> b!1481171 (= res!1006525 (= lt!646695 (Intermediate!12210 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481171 (= lt!646695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646696 mask!2687) lt!646696 lt!646698 mask!2687))))

(assert (=> b!1481171 (= lt!646696 (select (store (arr!47970 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481172 () Bool)

(assert (=> b!1481172 (= e!830759 (not true))))

(assert (=> b!1481172 e!830764))

(declare-fun res!1006521 () Bool)

(assert (=> b!1481172 (=> (not res!1006521) (not e!830764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99385 (_ BitVec 32)) Bool)

(assert (=> b!1481172 (= res!1006521 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49760 0))(
  ( (Unit!49761) )
))
(declare-fun lt!646694 () Unit!49760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49760)

(assert (=> b!1481172 (= lt!646694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481173 () Bool)

(declare-fun res!1006527 () Bool)

(assert (=> b!1481173 (=> (not res!1006527) (not e!830760))))

(assert (=> b!1481173 (= res!1006527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481174 () Bool)

(declare-fun res!1006519 () Bool)

(assert (=> b!1481174 (=> (not res!1006519) (not e!830764))))

(assert (=> b!1481174 (= res!1006519 (= (seekEntryOrOpen!0 (select (arr!47970 a!2862) j!93) a!2862 mask!2687) (Found!12210 j!93)))))

(declare-fun b!1481175 () Bool)

(declare-fun res!1006520 () Bool)

(assert (=> b!1481175 (=> (not res!1006520) (not e!830760))))

(assert (=> b!1481175 (= res!1006520 (and (= (size!48520 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48520 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48520 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126366 res!1006523) b!1481175))

(assert (= (and b!1481175 res!1006520) b!1481161))

(assert (= (and b!1481161 res!1006518) b!1481162))

(assert (= (and b!1481162 res!1006526) b!1481173))

(assert (= (and b!1481173 res!1006527) b!1481166))

(assert (= (and b!1481166 res!1006524) b!1481164))

(assert (= (and b!1481164 res!1006531) b!1481170))

(assert (= (and b!1481170 res!1006517) b!1481169))

(assert (= (and b!1481169 res!1006529) b!1481168))

(assert (= (and b!1481168 res!1006522) b!1481171))

(assert (= (and b!1481171 res!1006525) b!1481163))

(assert (= (and b!1481163 c!136842) b!1481159))

(assert (= (and b!1481163 (not c!136842)) b!1481160))

(assert (= (and b!1481163 res!1006528) b!1481165))

(assert (= (and b!1481165 res!1006530) b!1481172))

(assert (= (and b!1481172 res!1006521) b!1481174))

(assert (= (and b!1481174 res!1006519) b!1481167))

(declare-fun m!1366905 () Bool)

(assert (=> b!1481173 m!1366905))

(declare-fun m!1366907 () Bool)

(assert (=> b!1481170 m!1366907))

(declare-fun m!1366909 () Bool)

(assert (=> b!1481170 m!1366909))

(declare-fun m!1366911 () Bool)

(assert (=> b!1481159 m!1366911))

(declare-fun m!1366913 () Bool)

(assert (=> start!126366 m!1366913))

(declare-fun m!1366915 () Bool)

(assert (=> start!126366 m!1366915))

(declare-fun m!1366917 () Bool)

(assert (=> b!1481169 m!1366917))

(assert (=> b!1481169 m!1366917))

(declare-fun m!1366919 () Bool)

(assert (=> b!1481169 m!1366919))

(assert (=> b!1481169 m!1366919))

(assert (=> b!1481169 m!1366917))

(declare-fun m!1366921 () Bool)

(assert (=> b!1481169 m!1366921))

(assert (=> b!1481174 m!1366917))

(assert (=> b!1481174 m!1366917))

(declare-fun m!1366923 () Bool)

(assert (=> b!1481174 m!1366923))

(assert (=> b!1481162 m!1366917))

(assert (=> b!1481162 m!1366917))

(declare-fun m!1366925 () Bool)

(assert (=> b!1481162 m!1366925))

(declare-fun m!1366927 () Bool)

(assert (=> b!1481161 m!1366927))

(assert (=> b!1481161 m!1366927))

(declare-fun m!1366929 () Bool)

(assert (=> b!1481161 m!1366929))

(declare-fun m!1366931 () Bool)

(assert (=> b!1481172 m!1366931))

(declare-fun m!1366933 () Bool)

(assert (=> b!1481172 m!1366933))

(declare-fun m!1366935 () Bool)

(assert (=> b!1481166 m!1366935))

(assert (=> b!1481167 m!1366907))

(declare-fun m!1366937 () Bool)

(assert (=> b!1481167 m!1366937))

(declare-fun m!1366939 () Bool)

(assert (=> b!1481167 m!1366939))

(declare-fun m!1366941 () Bool)

(assert (=> b!1481167 m!1366941))

(assert (=> b!1481167 m!1366917))

(declare-fun m!1366943 () Bool)

(assert (=> b!1481171 m!1366943))

(assert (=> b!1481171 m!1366943))

(declare-fun m!1366945 () Bool)

(assert (=> b!1481171 m!1366945))

(assert (=> b!1481171 m!1366907))

(declare-fun m!1366947 () Bool)

(assert (=> b!1481171 m!1366947))

(assert (=> b!1481168 m!1366917))

(assert (=> b!1481168 m!1366917))

(declare-fun m!1366949 () Bool)

(assert (=> b!1481168 m!1366949))

(declare-fun m!1366951 () Bool)

(assert (=> b!1481160 m!1366951))

(declare-fun m!1366953 () Bool)

(assert (=> b!1481160 m!1366953))

(check-sat (not b!1481174) (not start!126366) (not b!1481162) (not b!1481173) (not b!1481159) (not b!1481169) (not b!1481160) (not b!1481168) (not b!1481166) (not b!1481161) (not b!1481171) (not b!1481172))
(check-sat)
