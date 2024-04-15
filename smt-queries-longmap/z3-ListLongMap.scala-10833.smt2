; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126794 () Bool)

(assert start!126794)

(declare-fun b!1489095 () Bool)

(declare-fun e!834549 () Bool)

(assert (=> b!1489095 (= e!834549 true)))

(declare-datatypes ((SeekEntryResult!12320 0))(
  ( (MissingZero!12320 (index!51672 (_ BitVec 32))) (Found!12320 (index!51673 (_ BitVec 32))) (Intermediate!12320 (undefined!13132 Bool) (index!51674 (_ BitVec 32)) (x!133265 (_ BitVec 32))) (Undefined!12320) (MissingVacant!12320 (index!51675 (_ BitVec 32))) )
))
(declare-fun lt!649260 () SeekEntryResult!12320)

(declare-fun lt!649258 () SeekEntryResult!12320)

(assert (=> b!1489095 (= lt!649260 lt!649258)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((Unit!49821 0))(
  ( (Unit!49822) )
))
(declare-fun lt!649263 () Unit!49821)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lt!649264 () (_ BitVec 32))

(declare-datatypes ((array!99565 0))(
  ( (array!99566 (arr!48055 (Array (_ BitVec 32) (_ BitVec 64))) (size!48607 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99565)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49821)

(assert (=> b!1489095 (= lt!649263 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649264 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489096 () Bool)

(declare-fun res!1012764 () Bool)

(declare-fun e!834553 () Bool)

(assert (=> b!1489096 (=> (not res!1012764) (not e!834553))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649259 () SeekEntryResult!12320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99565 (_ BitVec 32)) SeekEntryResult!12320)

(assert (=> b!1489096 (= res!1012764 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!649259))))

(declare-fun lt!649265 () (_ BitVec 64))

(declare-fun lt!649257 () array!99565)

(declare-fun b!1489097 () Bool)

(declare-fun e!834552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99565 (_ BitVec 32)) SeekEntryResult!12320)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99565 (_ BitVec 32)) SeekEntryResult!12320)

(assert (=> b!1489097 (= e!834552 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649265 lt!649257 mask!2687) (seekEntryOrOpen!0 lt!649265 lt!649257 mask!2687)))))

(declare-fun b!1489098 () Bool)

(declare-fun res!1012765 () Bool)

(declare-fun e!834546 () Bool)

(assert (=> b!1489098 (=> (not res!1012765) (not e!834546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99565 (_ BitVec 32)) Bool)

(assert (=> b!1489098 (= res!1012765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489099 () Bool)

(declare-fun e!834547 () Bool)

(declare-fun lt!649262 () SeekEntryResult!12320)

(assert (=> b!1489099 (= e!834547 (not (= lt!649262 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649264 lt!649265 lt!649257 mask!2687))))))

(declare-fun b!1489100 () Bool)

(declare-fun e!834550 () Bool)

(declare-fun e!834551 () Bool)

(assert (=> b!1489100 (= e!834550 (not e!834551))))

(declare-fun res!1012773 () Bool)

(assert (=> b!1489100 (=> res!1012773 e!834551)))

(assert (=> b!1489100 (= res!1012773 (or (and (= (select (arr!48055 a!2862) index!646) (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48055 a!2862) index!646) (select (arr!48055 a!2862) j!93))) (= (select (arr!48055 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489100 (and (= lt!649260 (Found!12320 j!93)) (or (= (select (arr!48055 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48055 a!2862) intermediateBeforeIndex!19) (select (arr!48055 a!2862) j!93))) (let ((bdg!54722 (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48055 a!2862) index!646) bdg!54722) (= (select (arr!48055 a!2862) index!646) (select (arr!48055 a!2862) j!93))) (= (select (arr!48055 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54722 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489100 (= lt!649260 (seekEntryOrOpen!0 (select (arr!48055 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489100 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649261 () Unit!49821)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49821)

(assert (=> b!1489100 (= lt!649261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489101 () Bool)

(declare-fun e!834548 () Bool)

(assert (=> b!1489101 (= e!834546 e!834548)))

(declare-fun res!1012761 () Bool)

(assert (=> b!1489101 (=> (not res!1012761) (not e!834548))))

(assert (=> b!1489101 (= res!1012761 (= (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489101 (= lt!649257 (array!99566 (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48607 a!2862)))))

(declare-fun b!1489102 () Bool)

(declare-fun res!1012768 () Bool)

(assert (=> b!1489102 (=> (not res!1012768) (not e!834546))))

(assert (=> b!1489102 (= res!1012768 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48607 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48607 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48607 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489103 () Bool)

(declare-fun res!1012775 () Bool)

(assert (=> b!1489103 (=> (not res!1012775) (not e!834550))))

(assert (=> b!1489103 (= res!1012775 e!834552)))

(declare-fun c!137697 () Bool)

(assert (=> b!1489103 (= c!137697 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489104 () Bool)

(declare-fun res!1012769 () Bool)

(assert (=> b!1489104 (=> (not res!1012769) (not e!834546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489104 (= res!1012769 (validKeyInArray!0 (select (arr!48055 a!2862) i!1006)))))

(declare-fun res!1012770 () Bool)

(assert (=> start!126794 (=> (not res!1012770) (not e!834546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126794 (= res!1012770 (validMask!0 mask!2687))))

(assert (=> start!126794 e!834546))

(assert (=> start!126794 true))

(declare-fun array_inv!37288 (array!99565) Bool)

(assert (=> start!126794 (array_inv!37288 a!2862)))

(declare-fun b!1489105 () Bool)

(assert (=> b!1489105 (= e!834548 e!834553)))

(declare-fun res!1012767 () Bool)

(assert (=> b!1489105 (=> (not res!1012767) (not e!834553))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489105 (= res!1012767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48055 a!2862) j!93) mask!2687) (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!649259))))

(assert (=> b!1489105 (= lt!649259 (Intermediate!12320 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489106 () Bool)

(declare-fun res!1012771 () Bool)

(assert (=> b!1489106 (=> res!1012771 e!834549)))

(assert (=> b!1489106 (= res!1012771 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649264 (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!649259)))))

(declare-fun b!1489107 () Bool)

(declare-fun res!1012776 () Bool)

(assert (=> b!1489107 (=> (not res!1012776) (not e!834546))))

(declare-datatypes ((List!34634 0))(
  ( (Nil!34631) (Cons!34630 (h!36013 (_ BitVec 64)) (t!49320 List!34634)) )
))
(declare-fun arrayNoDuplicates!0 (array!99565 (_ BitVec 32) List!34634) Bool)

(assert (=> b!1489107 (= res!1012776 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34631))))

(declare-fun b!1489108 () Bool)

(assert (=> b!1489108 (= e!834552 (= lt!649262 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649265 lt!649257 mask!2687)))))

(declare-fun b!1489109 () Bool)

(declare-fun res!1012777 () Bool)

(assert (=> b!1489109 (=> res!1012777 e!834549)))

(assert (=> b!1489109 (= res!1012777 e!834547)))

(declare-fun c!137698 () Bool)

(assert (=> b!1489109 (= c!137698 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489110 () Bool)

(assert (=> b!1489110 (= e!834547 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649264 intermediateAfterIndex!19 lt!649265 lt!649257 mask!2687) lt!649258)))))

(declare-fun b!1489111 () Bool)

(assert (=> b!1489111 (= e!834551 e!834549)))

(declare-fun res!1012760 () Bool)

(assert (=> b!1489111 (=> res!1012760 e!834549)))

(assert (=> b!1489111 (= res!1012760 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649264 #b00000000000000000000000000000000) (bvsge lt!649264 (size!48607 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489111 (= lt!649264 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489111 (= lt!649258 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649265 lt!649257 mask!2687))))

(assert (=> b!1489111 (= lt!649258 (seekEntryOrOpen!0 lt!649265 lt!649257 mask!2687))))

(declare-fun b!1489112 () Bool)

(declare-fun res!1012763 () Bool)

(assert (=> b!1489112 (=> res!1012763 e!834549)))

(assert (=> b!1489112 (= res!1012763 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489113 () Bool)

(declare-fun res!1012774 () Bool)

(assert (=> b!1489113 (=> (not res!1012774) (not e!834546))))

(assert (=> b!1489113 (= res!1012774 (validKeyInArray!0 (select (arr!48055 a!2862) j!93)))))

(declare-fun b!1489114 () Bool)

(declare-fun res!1012766 () Bool)

(assert (=> b!1489114 (=> (not res!1012766) (not e!834546))))

(assert (=> b!1489114 (= res!1012766 (and (= (size!48607 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48607 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48607 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489115 () Bool)

(assert (=> b!1489115 (= e!834553 e!834550)))

(declare-fun res!1012772 () Bool)

(assert (=> b!1489115 (=> (not res!1012772) (not e!834550))))

(assert (=> b!1489115 (= res!1012772 (= lt!649262 (Intermediate!12320 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489115 (= lt!649262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649265 mask!2687) lt!649265 lt!649257 mask!2687))))

(assert (=> b!1489115 (= lt!649265 (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489116 () Bool)

(declare-fun res!1012762 () Bool)

(assert (=> b!1489116 (=> (not res!1012762) (not e!834550))))

(assert (=> b!1489116 (= res!1012762 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126794 res!1012770) b!1489114))

(assert (= (and b!1489114 res!1012766) b!1489104))

(assert (= (and b!1489104 res!1012769) b!1489113))

(assert (= (and b!1489113 res!1012774) b!1489098))

(assert (= (and b!1489098 res!1012765) b!1489107))

(assert (= (and b!1489107 res!1012776) b!1489102))

(assert (= (and b!1489102 res!1012768) b!1489101))

(assert (= (and b!1489101 res!1012761) b!1489105))

(assert (= (and b!1489105 res!1012767) b!1489096))

(assert (= (and b!1489096 res!1012764) b!1489115))

(assert (= (and b!1489115 res!1012772) b!1489103))

(assert (= (and b!1489103 c!137697) b!1489108))

(assert (= (and b!1489103 (not c!137697)) b!1489097))

(assert (= (and b!1489103 res!1012775) b!1489116))

(assert (= (and b!1489116 res!1012762) b!1489100))

(assert (= (and b!1489100 (not res!1012773)) b!1489111))

(assert (= (and b!1489111 (not res!1012760)) b!1489106))

(assert (= (and b!1489106 (not res!1012771)) b!1489109))

(assert (= (and b!1489109 c!137698) b!1489099))

(assert (= (and b!1489109 (not c!137698)) b!1489110))

(assert (= (and b!1489109 (not res!1012777)) b!1489112))

(assert (= (and b!1489112 (not res!1012763)) b!1489095))

(declare-fun m!1372791 () Bool)

(assert (=> b!1489097 m!1372791))

(declare-fun m!1372793 () Bool)

(assert (=> b!1489097 m!1372793))

(declare-fun m!1372795 () Bool)

(assert (=> b!1489110 m!1372795))

(declare-fun m!1372797 () Bool)

(assert (=> b!1489100 m!1372797))

(declare-fun m!1372799 () Bool)

(assert (=> b!1489100 m!1372799))

(declare-fun m!1372801 () Bool)

(assert (=> b!1489100 m!1372801))

(declare-fun m!1372803 () Bool)

(assert (=> b!1489100 m!1372803))

(declare-fun m!1372805 () Bool)

(assert (=> b!1489100 m!1372805))

(declare-fun m!1372807 () Bool)

(assert (=> b!1489100 m!1372807))

(declare-fun m!1372809 () Bool)

(assert (=> b!1489100 m!1372809))

(declare-fun m!1372811 () Bool)

(assert (=> b!1489100 m!1372811))

(assert (=> b!1489100 m!1372807))

(assert (=> b!1489113 m!1372807))

(assert (=> b!1489113 m!1372807))

(declare-fun m!1372813 () Bool)

(assert (=> b!1489113 m!1372813))

(declare-fun m!1372815 () Bool)

(assert (=> start!126794 m!1372815))

(declare-fun m!1372817 () Bool)

(assert (=> start!126794 m!1372817))

(declare-fun m!1372819 () Bool)

(assert (=> b!1489111 m!1372819))

(assert (=> b!1489111 m!1372791))

(assert (=> b!1489111 m!1372793))

(declare-fun m!1372821 () Bool)

(assert (=> b!1489107 m!1372821))

(declare-fun m!1372823 () Bool)

(assert (=> b!1489098 m!1372823))

(declare-fun m!1372825 () Bool)

(assert (=> b!1489108 m!1372825))

(assert (=> b!1489096 m!1372807))

(assert (=> b!1489096 m!1372807))

(declare-fun m!1372827 () Bool)

(assert (=> b!1489096 m!1372827))

(assert (=> b!1489101 m!1372799))

(declare-fun m!1372829 () Bool)

(assert (=> b!1489101 m!1372829))

(assert (=> b!1489105 m!1372807))

(assert (=> b!1489105 m!1372807))

(declare-fun m!1372831 () Bool)

(assert (=> b!1489105 m!1372831))

(assert (=> b!1489105 m!1372831))

(assert (=> b!1489105 m!1372807))

(declare-fun m!1372833 () Bool)

(assert (=> b!1489105 m!1372833))

(declare-fun m!1372835 () Bool)

(assert (=> b!1489115 m!1372835))

(assert (=> b!1489115 m!1372835))

(declare-fun m!1372837 () Bool)

(assert (=> b!1489115 m!1372837))

(assert (=> b!1489115 m!1372799))

(declare-fun m!1372839 () Bool)

(assert (=> b!1489115 m!1372839))

(assert (=> b!1489106 m!1372807))

(assert (=> b!1489106 m!1372807))

(declare-fun m!1372841 () Bool)

(assert (=> b!1489106 m!1372841))

(declare-fun m!1372843 () Bool)

(assert (=> b!1489104 m!1372843))

(assert (=> b!1489104 m!1372843))

(declare-fun m!1372845 () Bool)

(assert (=> b!1489104 m!1372845))

(declare-fun m!1372847 () Bool)

(assert (=> b!1489095 m!1372847))

(declare-fun m!1372849 () Bool)

(assert (=> b!1489099 m!1372849))

(check-sat (not b!1489110) (not b!1489104) (not start!126794) (not b!1489108) (not b!1489098) (not b!1489095) (not b!1489097) (not b!1489105) (not b!1489115) (not b!1489096) (not b!1489100) (not b!1489099) (not b!1489107) (not b!1489106) (not b!1489111) (not b!1489113))
(check-sat)
