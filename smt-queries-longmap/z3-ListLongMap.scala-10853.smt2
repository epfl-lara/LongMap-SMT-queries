; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127374 () Bool)

(assert start!127374)

(declare-fun b!1495310 () Bool)

(declare-fun e!837765 () Bool)

(declare-fun e!837764 () Bool)

(assert (=> b!1495310 (= e!837765 e!837764)))

(declare-fun res!1016681 () Bool)

(assert (=> b!1495310 (=> (not res!1016681) (not e!837764))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99859 0))(
  ( (array!99860 (arr!48193 (Array (_ BitVec 32) (_ BitVec 64))) (size!48744 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99859)

(assert (=> b!1495310 (= res!1016681 (= (select (store (arr!48193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651720 () array!99859)

(assert (=> b!1495310 (= lt!651720 (array!99860 (store (arr!48193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48744 a!2862)))))

(declare-fun res!1016689 () Bool)

(assert (=> start!127374 (=> (not res!1016689) (not e!837765))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127374 (= res!1016689 (validMask!0 mask!2687))))

(assert (=> start!127374 e!837765))

(assert (=> start!127374 true))

(declare-fun array_inv!37474 (array!99859) Bool)

(assert (=> start!127374 (array_inv!37474 a!2862)))

(declare-fun b!1495311 () Bool)

(declare-fun e!837762 () Bool)

(assert (=> b!1495311 (= e!837762 true)))

(declare-fun lt!651716 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495311 (= lt!651716 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1495312 () Bool)

(declare-fun res!1016691 () Bool)

(declare-fun e!837767 () Bool)

(assert (=> b!1495312 (=> (not res!1016691) (not e!837767))))

(declare-fun e!837763 () Bool)

(assert (=> b!1495312 (= res!1016691 e!837763)))

(declare-fun c!138856 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495312 (= c!138856 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495313 () Bool)

(declare-fun res!1016680 () Bool)

(assert (=> b!1495313 (=> (not res!1016680) (not e!837767))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495313 (= res!1016680 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495314 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!837761 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1495314 (= e!837761 (or (= (select (arr!48193 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48193 a!2862) intermediateBeforeIndex!19) (select (arr!48193 a!2862) j!93))))))

(declare-fun b!1495315 () Bool)

(declare-fun res!1016684 () Bool)

(assert (=> b!1495315 (=> (not res!1016684) (not e!837765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495315 (= res!1016684 (validKeyInArray!0 (select (arr!48193 a!2862) j!93)))))

(declare-fun b!1495316 () Bool)

(declare-fun lt!651721 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12330 0))(
  ( (MissingZero!12330 (index!51712 (_ BitVec 32))) (Found!12330 (index!51713 (_ BitVec 32))) (Intermediate!12330 (undefined!13142 Bool) (index!51714 (_ BitVec 32)) (x!133499 (_ BitVec 32))) (Undefined!12330) (MissingVacant!12330 (index!51715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99859 (_ BitVec 32)) SeekEntryResult!12330)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99859 (_ BitVec 32)) SeekEntryResult!12330)

(assert (=> b!1495316 (= e!837763 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651721 lt!651720 mask!2687) (seekEntryOrOpen!0 lt!651721 lt!651720 mask!2687)))))

(declare-fun b!1495317 () Bool)

(declare-fun res!1016679 () Bool)

(assert (=> b!1495317 (=> (not res!1016679) (not e!837765))))

(assert (=> b!1495317 (= res!1016679 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48744 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48744 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48744 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495318 () Bool)

(declare-fun res!1016682 () Bool)

(assert (=> b!1495318 (=> (not res!1016682) (not e!837761))))

(assert (=> b!1495318 (= res!1016682 (= (seekEntryOrOpen!0 (select (arr!48193 a!2862) j!93) a!2862 mask!2687) (Found!12330 j!93)))))

(declare-fun lt!651717 () SeekEntryResult!12330)

(declare-fun b!1495319 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99859 (_ BitVec 32)) SeekEntryResult!12330)

(assert (=> b!1495319 (= e!837763 (= lt!651717 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651721 lt!651720 mask!2687)))))

(declare-fun b!1495320 () Bool)

(declare-fun e!837766 () Bool)

(assert (=> b!1495320 (= e!837766 e!837767)))

(declare-fun res!1016687 () Bool)

(assert (=> b!1495320 (=> (not res!1016687) (not e!837767))))

(assert (=> b!1495320 (= res!1016687 (= lt!651717 (Intermediate!12330 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495320 (= lt!651717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651721 mask!2687) lt!651721 lt!651720 mask!2687))))

(assert (=> b!1495320 (= lt!651721 (select (store (arr!48193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495321 () Bool)

(assert (=> b!1495321 (= e!837767 (not e!837762))))

(declare-fun res!1016686 () Bool)

(assert (=> b!1495321 (=> res!1016686 e!837762)))

(assert (=> b!1495321 (= res!1016686 (or (and (= (select (arr!48193 a!2862) index!646) (select (store (arr!48193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48193 a!2862) index!646) (select (arr!48193 a!2862) j!93))) (= (select (arr!48193 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495321 e!837761))

(declare-fun res!1016678 () Bool)

(assert (=> b!1495321 (=> (not res!1016678) (not e!837761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99859 (_ BitVec 32)) Bool)

(assert (=> b!1495321 (= res!1016678 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50033 0))(
  ( (Unit!50034) )
))
(declare-fun lt!651718 () Unit!50033)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50033)

(assert (=> b!1495321 (= lt!651718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495322 () Bool)

(declare-fun res!1016692 () Bool)

(assert (=> b!1495322 (=> (not res!1016692) (not e!837765))))

(declare-datatypes ((List!34681 0))(
  ( (Nil!34678) (Cons!34677 (h!36080 (_ BitVec 64)) (t!49367 List!34681)) )
))
(declare-fun arrayNoDuplicates!0 (array!99859 (_ BitVec 32) List!34681) Bool)

(assert (=> b!1495322 (= res!1016692 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34678))))

(declare-fun b!1495323 () Bool)

(declare-fun res!1016693 () Bool)

(assert (=> b!1495323 (=> (not res!1016693) (not e!837765))))

(assert (=> b!1495323 (= res!1016693 (and (= (size!48744 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48744 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48744 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495324 () Bool)

(declare-fun res!1016685 () Bool)

(assert (=> b!1495324 (=> (not res!1016685) (not e!837766))))

(declare-fun lt!651719 () SeekEntryResult!12330)

(assert (=> b!1495324 (= res!1016685 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48193 a!2862) j!93) a!2862 mask!2687) lt!651719))))

(declare-fun b!1495325 () Bool)

(declare-fun res!1016683 () Bool)

(assert (=> b!1495325 (=> (not res!1016683) (not e!837765))))

(assert (=> b!1495325 (= res!1016683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495326 () Bool)

(declare-fun res!1016690 () Bool)

(assert (=> b!1495326 (=> (not res!1016690) (not e!837765))))

(assert (=> b!1495326 (= res!1016690 (validKeyInArray!0 (select (arr!48193 a!2862) i!1006)))))

(declare-fun b!1495327 () Bool)

(assert (=> b!1495327 (= e!837764 e!837766)))

(declare-fun res!1016688 () Bool)

(assert (=> b!1495327 (=> (not res!1016688) (not e!837766))))

(assert (=> b!1495327 (= res!1016688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48193 a!2862) j!93) mask!2687) (select (arr!48193 a!2862) j!93) a!2862 mask!2687) lt!651719))))

(assert (=> b!1495327 (= lt!651719 (Intermediate!12330 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!127374 res!1016689) b!1495323))

(assert (= (and b!1495323 res!1016693) b!1495326))

(assert (= (and b!1495326 res!1016690) b!1495315))

(assert (= (and b!1495315 res!1016684) b!1495325))

(assert (= (and b!1495325 res!1016683) b!1495322))

(assert (= (and b!1495322 res!1016692) b!1495317))

(assert (= (and b!1495317 res!1016679) b!1495310))

(assert (= (and b!1495310 res!1016681) b!1495327))

(assert (= (and b!1495327 res!1016688) b!1495324))

(assert (= (and b!1495324 res!1016685) b!1495320))

(assert (= (and b!1495320 res!1016687) b!1495312))

(assert (= (and b!1495312 c!138856) b!1495319))

(assert (= (and b!1495312 (not c!138856)) b!1495316))

(assert (= (and b!1495312 res!1016691) b!1495313))

(assert (= (and b!1495313 res!1016680) b!1495321))

(assert (= (and b!1495321 res!1016678) b!1495318))

(assert (= (and b!1495318 res!1016682) b!1495314))

(assert (= (and b!1495321 (not res!1016686)) b!1495311))

(declare-fun m!1379095 () Bool)

(assert (=> b!1495311 m!1379095))

(declare-fun m!1379097 () Bool)

(assert (=> b!1495319 m!1379097))

(declare-fun m!1379099 () Bool)

(assert (=> b!1495320 m!1379099))

(assert (=> b!1495320 m!1379099))

(declare-fun m!1379101 () Bool)

(assert (=> b!1495320 m!1379101))

(declare-fun m!1379103 () Bool)

(assert (=> b!1495320 m!1379103))

(declare-fun m!1379105 () Bool)

(assert (=> b!1495320 m!1379105))

(declare-fun m!1379107 () Bool)

(assert (=> b!1495318 m!1379107))

(assert (=> b!1495318 m!1379107))

(declare-fun m!1379109 () Bool)

(assert (=> b!1495318 m!1379109))

(declare-fun m!1379111 () Bool)

(assert (=> b!1495325 m!1379111))

(assert (=> b!1495315 m!1379107))

(assert (=> b!1495315 m!1379107))

(declare-fun m!1379113 () Bool)

(assert (=> b!1495315 m!1379113))

(declare-fun m!1379115 () Bool)

(assert (=> b!1495316 m!1379115))

(declare-fun m!1379117 () Bool)

(assert (=> b!1495316 m!1379117))

(declare-fun m!1379119 () Bool)

(assert (=> b!1495314 m!1379119))

(assert (=> b!1495314 m!1379107))

(declare-fun m!1379121 () Bool)

(assert (=> b!1495322 m!1379121))

(assert (=> b!1495324 m!1379107))

(assert (=> b!1495324 m!1379107))

(declare-fun m!1379123 () Bool)

(assert (=> b!1495324 m!1379123))

(declare-fun m!1379125 () Bool)

(assert (=> start!127374 m!1379125))

(declare-fun m!1379127 () Bool)

(assert (=> start!127374 m!1379127))

(declare-fun m!1379129 () Bool)

(assert (=> b!1495326 m!1379129))

(assert (=> b!1495326 m!1379129))

(declare-fun m!1379131 () Bool)

(assert (=> b!1495326 m!1379131))

(assert (=> b!1495310 m!1379103))

(declare-fun m!1379133 () Bool)

(assert (=> b!1495310 m!1379133))

(assert (=> b!1495327 m!1379107))

(assert (=> b!1495327 m!1379107))

(declare-fun m!1379135 () Bool)

(assert (=> b!1495327 m!1379135))

(assert (=> b!1495327 m!1379135))

(assert (=> b!1495327 m!1379107))

(declare-fun m!1379137 () Bool)

(assert (=> b!1495327 m!1379137))

(declare-fun m!1379139 () Bool)

(assert (=> b!1495321 m!1379139))

(assert (=> b!1495321 m!1379103))

(declare-fun m!1379141 () Bool)

(assert (=> b!1495321 m!1379141))

(declare-fun m!1379143 () Bool)

(assert (=> b!1495321 m!1379143))

(declare-fun m!1379145 () Bool)

(assert (=> b!1495321 m!1379145))

(assert (=> b!1495321 m!1379107))

(check-sat (not b!1495316) (not b!1495326) (not b!1495318) (not start!127374) (not b!1495311) (not b!1495322) (not b!1495319) (not b!1495324) (not b!1495321) (not b!1495320) (not b!1495315) (not b!1495327) (not b!1495325))
(check-sat)
