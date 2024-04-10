; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125070 () Bool)

(assert start!125070)

(declare-fun b!1455954 () Bool)

(declare-fun res!986540 () Bool)

(declare-fun e!819219 () Bool)

(assert (=> b!1455954 (=> (not res!986540) (not e!819219))))

(declare-datatypes ((array!98518 0))(
  ( (array!98519 (arr!47547 (Array (_ BitVec 32) (_ BitVec 64))) (size!48097 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98518)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455954 (= res!986540 (validKeyInArray!0 (select (arr!47547 a!2862) i!1006)))))

(declare-fun b!1455955 () Bool)

(declare-fun res!986535 () Bool)

(declare-fun e!819212 () Bool)

(assert (=> b!1455955 (=> res!986535 e!819212)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638145 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11799 0))(
  ( (MissingZero!11799 (index!49588 (_ BitVec 32))) (Found!11799 (index!49589 (_ BitVec 32))) (Intermediate!11799 (undefined!12611 Bool) (index!49590 (_ BitVec 32)) (x!131216 (_ BitVec 32))) (Undefined!11799) (MissingVacant!11799 (index!49591 (_ BitVec 32))) )
))
(declare-fun lt!638142 () SeekEntryResult!11799)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98518 (_ BitVec 32)) SeekEntryResult!11799)

(assert (=> b!1455955 (= res!986535 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638145 (select (arr!47547 a!2862) j!93) a!2862 mask!2687) lt!638142)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1455956 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!819216 () Bool)

(assert (=> b!1455956 (= e!819216 (and (or (= (select (arr!47547 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47547 a!2862) intermediateBeforeIndex!19) (select (arr!47547 a!2862) j!93))) (let ((bdg!53200 (select (store (arr!47547 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47547 a!2862) index!646) bdg!53200) (= (select (arr!47547 a!2862) index!646) (select (arr!47547 a!2862) j!93))) (= (select (arr!47547 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53200 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455957 () Bool)

(declare-fun e!819221 () Bool)

(declare-fun e!819214 () Bool)

(assert (=> b!1455957 (= e!819221 e!819214)))

(declare-fun res!986536 () Bool)

(assert (=> b!1455957 (=> (not res!986536) (not e!819214))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455957 (= res!986536 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47547 a!2862) j!93) mask!2687) (select (arr!47547 a!2862) j!93) a!2862 mask!2687) lt!638142))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455957 (= lt!638142 (Intermediate!11799 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455959 () Bool)

(declare-fun e!819218 () Bool)

(assert (=> b!1455959 (= e!819218 e!819212)))

(declare-fun res!986528 () Bool)

(assert (=> b!1455959 (=> res!986528 e!819212)))

(assert (=> b!1455959 (= res!986528 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638145 #b00000000000000000000000000000000) (bvsge lt!638145 (size!48097 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455959 (= lt!638145 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638140 () (_ BitVec 64))

(declare-fun lt!638144 () array!98518)

(declare-fun lt!638141 () SeekEntryResult!11799)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98518 (_ BitVec 32)) SeekEntryResult!11799)

(assert (=> b!1455959 (= lt!638141 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638140 lt!638144 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98518 (_ BitVec 32)) SeekEntryResult!11799)

(assert (=> b!1455959 (= lt!638141 (seekEntryOrOpen!0 lt!638140 lt!638144 mask!2687))))

(declare-fun b!1455960 () Bool)

(declare-fun e!819220 () Bool)

(assert (=> b!1455960 (= e!819220 (not e!819218))))

(declare-fun res!986538 () Bool)

(assert (=> b!1455960 (=> res!986538 e!819218)))

(assert (=> b!1455960 (= res!986538 (or (and (= (select (arr!47547 a!2862) index!646) (select (store (arr!47547 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47547 a!2862) index!646) (select (arr!47547 a!2862) j!93))) (= (select (arr!47547 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455960 e!819216))

(declare-fun res!986532 () Bool)

(assert (=> b!1455960 (=> (not res!986532) (not e!819216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98518 (_ BitVec 32)) Bool)

(assert (=> b!1455960 (= res!986532 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49094 0))(
  ( (Unit!49095) )
))
(declare-fun lt!638138 () Unit!49094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49094)

(assert (=> b!1455960 (= lt!638138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455961 () Bool)

(declare-fun res!986542 () Bool)

(assert (=> b!1455961 (=> (not res!986542) (not e!819220))))

(declare-fun e!819217 () Bool)

(assert (=> b!1455961 (= res!986542 e!819217)))

(declare-fun c!134225 () Bool)

(assert (=> b!1455961 (= c!134225 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455962 () Bool)

(assert (=> b!1455962 (= e!819212 true)))

(declare-fun lt!638139 () Bool)

(declare-fun e!819215 () Bool)

(assert (=> b!1455962 (= lt!638139 e!819215)))

(declare-fun c!134226 () Bool)

(assert (=> b!1455962 (= c!134226 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455963 () Bool)

(declare-fun res!986529 () Bool)

(assert (=> b!1455963 (=> (not res!986529) (not e!819219))))

(assert (=> b!1455963 (= res!986529 (and (= (size!48097 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48097 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48097 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455964 () Bool)

(declare-fun res!986533 () Bool)

(assert (=> b!1455964 (=> (not res!986533) (not e!819220))))

(assert (=> b!1455964 (= res!986533 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455965 () Bool)

(declare-fun res!986531 () Bool)

(assert (=> b!1455965 (=> (not res!986531) (not e!819219))))

(assert (=> b!1455965 (= res!986531 (validKeyInArray!0 (select (arr!47547 a!2862) j!93)))))

(declare-fun b!1455966 () Bool)

(declare-fun lt!638143 () SeekEntryResult!11799)

(assert (=> b!1455966 (= e!819215 (not (= lt!638143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638145 lt!638140 lt!638144 mask!2687))))))

(declare-fun b!1455967 () Bool)

(declare-fun res!986534 () Bool)

(assert (=> b!1455967 (=> (not res!986534) (not e!819219))))

(assert (=> b!1455967 (= res!986534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455968 () Bool)

(assert (=> b!1455968 (= e!819219 e!819221)))

(declare-fun res!986527 () Bool)

(assert (=> b!1455968 (=> (not res!986527) (not e!819221))))

(assert (=> b!1455968 (= res!986527 (= (select (store (arr!47547 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455968 (= lt!638144 (array!98519 (store (arr!47547 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48097 a!2862)))))

(declare-fun b!1455969 () Bool)

(assert (=> b!1455969 (= e!819217 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638140 lt!638144 mask!2687) (seekEntryOrOpen!0 lt!638140 lt!638144 mask!2687)))))

(declare-fun b!1455970 () Bool)

(assert (=> b!1455970 (= e!819214 e!819220)))

(declare-fun res!986539 () Bool)

(assert (=> b!1455970 (=> (not res!986539) (not e!819220))))

(assert (=> b!1455970 (= res!986539 (= lt!638143 (Intermediate!11799 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455970 (= lt!638143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638140 mask!2687) lt!638140 lt!638144 mask!2687))))

(assert (=> b!1455970 (= lt!638140 (select (store (arr!47547 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455971 () Bool)

(declare-fun res!986530 () Bool)

(assert (=> b!1455971 (=> (not res!986530) (not e!819219))))

(assert (=> b!1455971 (= res!986530 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48097 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48097 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48097 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!986537 () Bool)

(assert (=> start!125070 (=> (not res!986537) (not e!819219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125070 (= res!986537 (validMask!0 mask!2687))))

(assert (=> start!125070 e!819219))

(assert (=> start!125070 true))

(declare-fun array_inv!36575 (array!98518) Bool)

(assert (=> start!125070 (array_inv!36575 a!2862)))

(declare-fun b!1455958 () Bool)

(declare-fun res!986526 () Bool)

(assert (=> b!1455958 (=> (not res!986526) (not e!819219))))

(declare-datatypes ((List!34048 0))(
  ( (Nil!34045) (Cons!34044 (h!35394 (_ BitVec 64)) (t!48742 List!34048)) )
))
(declare-fun arrayNoDuplicates!0 (array!98518 (_ BitVec 32) List!34048) Bool)

(assert (=> b!1455958 (= res!986526 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34045))))

(declare-fun b!1455972 () Bool)

(assert (=> b!1455972 (= e!819215 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638145 intermediateAfterIndex!19 lt!638140 lt!638144 mask!2687) lt!638141)))))

(declare-fun b!1455973 () Bool)

(declare-fun res!986541 () Bool)

(assert (=> b!1455973 (=> (not res!986541) (not e!819214))))

(assert (=> b!1455973 (= res!986541 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47547 a!2862) j!93) a!2862 mask!2687) lt!638142))))

(declare-fun b!1455974 () Bool)

(assert (=> b!1455974 (= e!819217 (= lt!638143 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638140 lt!638144 mask!2687)))))

(declare-fun b!1455975 () Bool)

(declare-fun res!986525 () Bool)

(assert (=> b!1455975 (=> (not res!986525) (not e!819216))))

(assert (=> b!1455975 (= res!986525 (= (seekEntryOrOpen!0 (select (arr!47547 a!2862) j!93) a!2862 mask!2687) (Found!11799 j!93)))))

(assert (= (and start!125070 res!986537) b!1455963))

(assert (= (and b!1455963 res!986529) b!1455954))

(assert (= (and b!1455954 res!986540) b!1455965))

(assert (= (and b!1455965 res!986531) b!1455967))

(assert (= (and b!1455967 res!986534) b!1455958))

(assert (= (and b!1455958 res!986526) b!1455971))

(assert (= (and b!1455971 res!986530) b!1455968))

(assert (= (and b!1455968 res!986527) b!1455957))

(assert (= (and b!1455957 res!986536) b!1455973))

(assert (= (and b!1455973 res!986541) b!1455970))

(assert (= (and b!1455970 res!986539) b!1455961))

(assert (= (and b!1455961 c!134225) b!1455974))

(assert (= (and b!1455961 (not c!134225)) b!1455969))

(assert (= (and b!1455961 res!986542) b!1455964))

(assert (= (and b!1455964 res!986533) b!1455960))

(assert (= (and b!1455960 res!986532) b!1455975))

(assert (= (and b!1455975 res!986525) b!1455956))

(assert (= (and b!1455960 (not res!986538)) b!1455959))

(assert (= (and b!1455959 (not res!986528)) b!1455955))

(assert (= (and b!1455955 (not res!986535)) b!1455962))

(assert (= (and b!1455962 c!134226) b!1455966))

(assert (= (and b!1455962 (not c!134226)) b!1455972))

(declare-fun m!1344113 () Bool)

(assert (=> b!1455958 m!1344113))

(declare-fun m!1344115 () Bool)

(assert (=> b!1455973 m!1344115))

(assert (=> b!1455973 m!1344115))

(declare-fun m!1344117 () Bool)

(assert (=> b!1455973 m!1344117))

(assert (=> b!1455957 m!1344115))

(assert (=> b!1455957 m!1344115))

(declare-fun m!1344119 () Bool)

(assert (=> b!1455957 m!1344119))

(assert (=> b!1455957 m!1344119))

(assert (=> b!1455957 m!1344115))

(declare-fun m!1344121 () Bool)

(assert (=> b!1455957 m!1344121))

(declare-fun m!1344123 () Bool)

(assert (=> b!1455968 m!1344123))

(declare-fun m!1344125 () Bool)

(assert (=> b!1455968 m!1344125))

(declare-fun m!1344127 () Bool)

(assert (=> b!1455966 m!1344127))

(declare-fun m!1344129 () Bool)

(assert (=> start!125070 m!1344129))

(declare-fun m!1344131 () Bool)

(assert (=> start!125070 m!1344131))

(declare-fun m!1344133 () Bool)

(assert (=> b!1455967 m!1344133))

(declare-fun m!1344135 () Bool)

(assert (=> b!1455960 m!1344135))

(assert (=> b!1455960 m!1344123))

(declare-fun m!1344137 () Bool)

(assert (=> b!1455960 m!1344137))

(declare-fun m!1344139 () Bool)

(assert (=> b!1455960 m!1344139))

(declare-fun m!1344141 () Bool)

(assert (=> b!1455960 m!1344141))

(assert (=> b!1455960 m!1344115))

(declare-fun m!1344143 () Bool)

(assert (=> b!1455974 m!1344143))

(declare-fun m!1344145 () Bool)

(assert (=> b!1455959 m!1344145))

(declare-fun m!1344147 () Bool)

(assert (=> b!1455959 m!1344147))

(declare-fun m!1344149 () Bool)

(assert (=> b!1455959 m!1344149))

(assert (=> b!1455969 m!1344147))

(assert (=> b!1455969 m!1344149))

(declare-fun m!1344151 () Bool)

(assert (=> b!1455972 m!1344151))

(declare-fun m!1344153 () Bool)

(assert (=> b!1455970 m!1344153))

(assert (=> b!1455970 m!1344153))

(declare-fun m!1344155 () Bool)

(assert (=> b!1455970 m!1344155))

(assert (=> b!1455970 m!1344123))

(declare-fun m!1344157 () Bool)

(assert (=> b!1455970 m!1344157))

(assert (=> b!1455956 m!1344123))

(declare-fun m!1344159 () Bool)

(assert (=> b!1455956 m!1344159))

(assert (=> b!1455956 m!1344137))

(assert (=> b!1455956 m!1344139))

(assert (=> b!1455956 m!1344115))

(assert (=> b!1455955 m!1344115))

(assert (=> b!1455955 m!1344115))

(declare-fun m!1344161 () Bool)

(assert (=> b!1455955 m!1344161))

(declare-fun m!1344163 () Bool)

(assert (=> b!1455954 m!1344163))

(assert (=> b!1455954 m!1344163))

(declare-fun m!1344165 () Bool)

(assert (=> b!1455954 m!1344165))

(assert (=> b!1455975 m!1344115))

(assert (=> b!1455975 m!1344115))

(declare-fun m!1344167 () Bool)

(assert (=> b!1455975 m!1344167))

(assert (=> b!1455965 m!1344115))

(assert (=> b!1455965 m!1344115))

(declare-fun m!1344169 () Bool)

(assert (=> b!1455965 m!1344169))

(check-sat (not b!1455973) (not b!1455974) (not b!1455970) (not b!1455966) (not b!1455960) (not b!1455972) (not b!1455969) (not b!1455958) (not b!1455967) (not b!1455957) (not b!1455959) (not b!1455975) (not b!1455965) (not start!125070) (not b!1455955) (not b!1455954))
