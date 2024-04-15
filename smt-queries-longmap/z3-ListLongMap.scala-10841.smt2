; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126842 () Bool)

(assert start!126842)

(declare-fun b!1490527 () Bool)

(declare-fun e!835157 () Bool)

(declare-fun e!835158 () Bool)

(assert (=> b!1490527 (= e!835157 (not e!835158))))

(declare-fun res!1013981 () Bool)

(assert (=> b!1490527 (=> res!1013981 e!835158)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99613 0))(
  ( (array!99614 (arr!48079 (Array (_ BitVec 32) (_ BitVec 64))) (size!48631 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99613)

(assert (=> b!1490527 (= res!1013981 (or (and (= (select (arr!48079 a!2862) index!646) (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48079 a!2862) index!646) (select (arr!48079 a!2862) j!93))) (= (select (arr!48079 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835162 () Bool)

(assert (=> b!1490527 e!835162))

(declare-fun res!1013986 () Bool)

(assert (=> b!1490527 (=> (not res!1013986) (not e!835162))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99613 (_ BitVec 32)) Bool)

(assert (=> b!1490527 (= res!1013986 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49869 0))(
  ( (Unit!49870) )
))
(declare-fun lt!649796 () Unit!49869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49869)

(assert (=> b!1490527 (= lt!649796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490528 () Bool)

(declare-fun res!1013992 () Bool)

(declare-fun e!835159 () Bool)

(assert (=> b!1490528 (=> (not res!1013992) (not e!835159))))

(assert (=> b!1490528 (= res!1013992 (and (= (size!48631 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48631 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48631 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!649792 () array!99613)

(declare-datatypes ((SeekEntryResult!12344 0))(
  ( (MissingZero!12344 (index!51768 (_ BitVec 32))) (Found!12344 (index!51769 (_ BitVec 32))) (Intermediate!12344 (undefined!13156 Bool) (index!51770 (_ BitVec 32)) (x!133353 (_ BitVec 32))) (Undefined!12344) (MissingVacant!12344 (index!51771 (_ BitVec 32))) )
))
(declare-fun lt!649793 () SeekEntryResult!12344)

(declare-fun e!835156 () Bool)

(declare-fun b!1490529 () Bool)

(declare-fun lt!649791 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99613 (_ BitVec 32)) SeekEntryResult!12344)

(assert (=> b!1490529 (= e!835156 (= lt!649793 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649791 lt!649792 mask!2687)))))

(declare-fun b!1490530 () Bool)

(declare-fun e!835163 () Bool)

(declare-fun e!835161 () Bool)

(assert (=> b!1490530 (= e!835163 e!835161)))

(declare-fun res!1013994 () Bool)

(assert (=> b!1490530 (=> (not res!1013994) (not e!835161))))

(declare-fun lt!649795 () SeekEntryResult!12344)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490530 (= res!1013994 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48079 a!2862) j!93) mask!2687) (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!649795))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490530 (= lt!649795 (Intermediate!12344 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490531 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99613 (_ BitVec 32)) SeekEntryResult!12344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99613 (_ BitVec 32)) SeekEntryResult!12344)

(assert (=> b!1490531 (= e!835156 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649791 lt!649792 mask!2687) (seekEntryOrOpen!0 lt!649791 lt!649792 mask!2687)))))

(declare-fun b!1490532 () Bool)

(assert (=> b!1490532 (= e!835161 e!835157)))

(declare-fun res!1013984 () Bool)

(assert (=> b!1490532 (=> (not res!1013984) (not e!835157))))

(assert (=> b!1490532 (= res!1013984 (= lt!649793 (Intermediate!12344 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490532 (= lt!649793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649791 mask!2687) lt!649791 lt!649792 mask!2687))))

(assert (=> b!1490532 (= lt!649791 (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490533 () Bool)

(declare-fun res!1013987 () Bool)

(assert (=> b!1490533 (=> (not res!1013987) (not e!835159))))

(declare-datatypes ((List!34658 0))(
  ( (Nil!34655) (Cons!34654 (h!36037 (_ BitVec 64)) (t!49344 List!34658)) )
))
(declare-fun arrayNoDuplicates!0 (array!99613 (_ BitVec 32) List!34658) Bool)

(assert (=> b!1490533 (= res!1013987 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34655))))

(declare-fun b!1490534 () Bool)

(declare-fun res!1013983 () Bool)

(assert (=> b!1490534 (=> (not res!1013983) (not e!835159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490534 (= res!1013983 (validKeyInArray!0 (select (arr!48079 a!2862) j!93)))))

(declare-fun b!1490535 () Bool)

(declare-fun res!1013982 () Bool)

(assert (=> b!1490535 (=> (not res!1013982) (not e!835162))))

(assert (=> b!1490535 (= res!1013982 (= (seekEntryOrOpen!0 (select (arr!48079 a!2862) j!93) a!2862 mask!2687) (Found!12344 j!93)))))

(declare-fun b!1490536 () Bool)

(declare-fun res!1013993 () Bool)

(assert (=> b!1490536 (=> (not res!1013993) (not e!835159))))

(assert (=> b!1490536 (= res!1013993 (validKeyInArray!0 (select (arr!48079 a!2862) i!1006)))))

(declare-fun b!1490537 () Bool)

(declare-fun res!1013990 () Bool)

(assert (=> b!1490537 (=> (not res!1013990) (not e!835157))))

(assert (=> b!1490537 (= res!1013990 e!835156)))

(declare-fun c!137803 () Bool)

(assert (=> b!1490537 (= c!137803 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1013988 () Bool)

(assert (=> start!126842 (=> (not res!1013988) (not e!835159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126842 (= res!1013988 (validMask!0 mask!2687))))

(assert (=> start!126842 e!835159))

(assert (=> start!126842 true))

(declare-fun array_inv!37312 (array!99613) Bool)

(assert (=> start!126842 (array_inv!37312 a!2862)))

(declare-fun b!1490538 () Bool)

(declare-fun res!1013980 () Bool)

(assert (=> b!1490538 (=> (not res!1013980) (not e!835161))))

(assert (=> b!1490538 (= res!1013980 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!649795))))

(declare-fun b!1490539 () Bool)

(declare-fun res!1013985 () Bool)

(assert (=> b!1490539 (=> (not res!1013985) (not e!835157))))

(assert (=> b!1490539 (= res!1013985 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490540 () Bool)

(assert (=> b!1490540 (= e!835158 true)))

(declare-fun lt!649794 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490540 (= lt!649794 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490541 () Bool)

(assert (=> b!1490541 (= e!835159 e!835163)))

(declare-fun res!1013989 () Bool)

(assert (=> b!1490541 (=> (not res!1013989) (not e!835163))))

(assert (=> b!1490541 (= res!1013989 (= (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490541 (= lt!649792 (array!99614 (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48631 a!2862)))))

(declare-fun b!1490542 () Bool)

(declare-fun res!1013991 () Bool)

(assert (=> b!1490542 (=> (not res!1013991) (not e!835159))))

(assert (=> b!1490542 (= res!1013991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490543 () Bool)

(assert (=> b!1490543 (= e!835162 (or (= (select (arr!48079 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48079 a!2862) intermediateBeforeIndex!19) (select (arr!48079 a!2862) j!93))))))

(declare-fun b!1490544 () Bool)

(declare-fun res!1013995 () Bool)

(assert (=> b!1490544 (=> (not res!1013995) (not e!835159))))

(assert (=> b!1490544 (= res!1013995 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48631 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48631 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48631 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126842 res!1013988) b!1490528))

(assert (= (and b!1490528 res!1013992) b!1490536))

(assert (= (and b!1490536 res!1013993) b!1490534))

(assert (= (and b!1490534 res!1013983) b!1490542))

(assert (= (and b!1490542 res!1013991) b!1490533))

(assert (= (and b!1490533 res!1013987) b!1490544))

(assert (= (and b!1490544 res!1013995) b!1490541))

(assert (= (and b!1490541 res!1013989) b!1490530))

(assert (= (and b!1490530 res!1013994) b!1490538))

(assert (= (and b!1490538 res!1013980) b!1490532))

(assert (= (and b!1490532 res!1013984) b!1490537))

(assert (= (and b!1490537 c!137803) b!1490529))

(assert (= (and b!1490537 (not c!137803)) b!1490531))

(assert (= (and b!1490537 res!1013990) b!1490539))

(assert (= (and b!1490539 res!1013985) b!1490527))

(assert (= (and b!1490527 res!1013986) b!1490535))

(assert (= (and b!1490535 res!1013982) b!1490543))

(assert (= (and b!1490527 (not res!1013981)) b!1490540))

(declare-fun m!1374135 () Bool)

(assert (=> b!1490535 m!1374135))

(assert (=> b!1490535 m!1374135))

(declare-fun m!1374137 () Bool)

(assert (=> b!1490535 m!1374137))

(declare-fun m!1374139 () Bool)

(assert (=> b!1490529 m!1374139))

(declare-fun m!1374141 () Bool)

(assert (=> b!1490540 m!1374141))

(declare-fun m!1374143 () Bool)

(assert (=> b!1490527 m!1374143))

(declare-fun m!1374145 () Bool)

(assert (=> b!1490527 m!1374145))

(declare-fun m!1374147 () Bool)

(assert (=> b!1490527 m!1374147))

(declare-fun m!1374149 () Bool)

(assert (=> b!1490527 m!1374149))

(declare-fun m!1374151 () Bool)

(assert (=> b!1490527 m!1374151))

(assert (=> b!1490527 m!1374135))

(assert (=> b!1490534 m!1374135))

(assert (=> b!1490534 m!1374135))

(declare-fun m!1374153 () Bool)

(assert (=> b!1490534 m!1374153))

(declare-fun m!1374155 () Bool)

(assert (=> b!1490543 m!1374155))

(assert (=> b!1490543 m!1374135))

(declare-fun m!1374157 () Bool)

(assert (=> start!126842 m!1374157))

(declare-fun m!1374159 () Bool)

(assert (=> start!126842 m!1374159))

(declare-fun m!1374161 () Bool)

(assert (=> b!1490533 m!1374161))

(declare-fun m!1374163 () Bool)

(assert (=> b!1490531 m!1374163))

(declare-fun m!1374165 () Bool)

(assert (=> b!1490531 m!1374165))

(declare-fun m!1374167 () Bool)

(assert (=> b!1490536 m!1374167))

(assert (=> b!1490536 m!1374167))

(declare-fun m!1374169 () Bool)

(assert (=> b!1490536 m!1374169))

(assert (=> b!1490538 m!1374135))

(assert (=> b!1490538 m!1374135))

(declare-fun m!1374171 () Bool)

(assert (=> b!1490538 m!1374171))

(assert (=> b!1490530 m!1374135))

(assert (=> b!1490530 m!1374135))

(declare-fun m!1374173 () Bool)

(assert (=> b!1490530 m!1374173))

(assert (=> b!1490530 m!1374173))

(assert (=> b!1490530 m!1374135))

(declare-fun m!1374175 () Bool)

(assert (=> b!1490530 m!1374175))

(declare-fun m!1374177 () Bool)

(assert (=> b!1490532 m!1374177))

(assert (=> b!1490532 m!1374177))

(declare-fun m!1374179 () Bool)

(assert (=> b!1490532 m!1374179))

(assert (=> b!1490532 m!1374145))

(declare-fun m!1374181 () Bool)

(assert (=> b!1490532 m!1374181))

(assert (=> b!1490541 m!1374145))

(declare-fun m!1374183 () Bool)

(assert (=> b!1490541 m!1374183))

(declare-fun m!1374185 () Bool)

(assert (=> b!1490542 m!1374185))

(check-sat (not start!126842) (not b!1490533) (not b!1490532) (not b!1490535) (not b!1490529) (not b!1490527) (not b!1490536) (not b!1490534) (not b!1490540) (not b!1490530) (not b!1490542) (not b!1490538) (not b!1490531))
(check-sat)
