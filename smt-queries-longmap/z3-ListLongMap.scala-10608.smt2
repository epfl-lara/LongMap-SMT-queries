; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125004 () Bool)

(assert start!125004)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1448956 () Bool)

(declare-datatypes ((array!98347 0))(
  ( (array!98348 (arr!47458 (Array (_ BitVec 32) (_ BitVec 64))) (size!48009 (_ BitVec 32))) )
))
(declare-fun lt!635711 () array!98347)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!635712 () (_ BitVec 64))

(declare-fun e!816128 () Bool)

(declare-datatypes ((SeekEntryResult!11607 0))(
  ( (MissingZero!11607 (index!48820 (_ BitVec 32))) (Found!11607 (index!48821 (_ BitVec 32))) (Intermediate!11607 (undefined!12419 Bool) (index!48822 (_ BitVec 32)) (x!130672 (_ BitVec 32))) (Undefined!11607) (MissingVacant!11607 (index!48823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98347 (_ BitVec 32)) SeekEntryResult!11607)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98347 (_ BitVec 32)) SeekEntryResult!11607)

(assert (=> b!1448956 (= e!816128 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635712 lt!635711 mask!2687) (seekEntryOrOpen!0 lt!635712 lt!635711 mask!2687)))))

(declare-fun b!1448957 () Bool)

(declare-fun res!979772 () Bool)

(declare-fun e!816130 () Bool)

(assert (=> b!1448957 (=> (not res!979772) (not e!816130))))

(declare-fun a!2862 () array!98347)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98347 (_ BitVec 32)) Bool)

(assert (=> b!1448957 (= res!979772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448958 () Bool)

(declare-fun res!979770 () Bool)

(assert (=> b!1448958 (=> (not res!979770) (not e!816130))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448958 (= res!979770 (validKeyInArray!0 (select (arr!47458 a!2862) i!1006)))))

(declare-fun b!1448959 () Bool)

(declare-fun res!979776 () Bool)

(assert (=> b!1448959 (=> (not res!979776) (not e!816130))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448959 (= res!979776 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48009 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48009 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48009 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448960 () Bool)

(declare-fun e!816124 () Bool)

(declare-fun e!816123 () Bool)

(assert (=> b!1448960 (= e!816124 (not e!816123))))

(declare-fun res!979778 () Bool)

(assert (=> b!1448960 (=> res!979778 e!816123)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1448960 (= res!979778 (or (and (= (select (arr!47458 a!2862) index!646) (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47458 a!2862) index!646) (select (arr!47458 a!2862) j!93))) (not (= (select (arr!47458 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816126 () Bool)

(assert (=> b!1448960 e!816126))

(declare-fun res!979765 () Bool)

(assert (=> b!1448960 (=> (not res!979765) (not e!816126))))

(declare-fun lt!635716 () SeekEntryResult!11607)

(assert (=> b!1448960 (= res!979765 (and (= lt!635716 (Found!11607 j!93)) (or (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) (select (arr!47458 a!2862) j!93)))))))

(assert (=> b!1448960 (= lt!635716 (seekEntryOrOpen!0 (select (arr!47458 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448960 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48743 0))(
  ( (Unit!48744) )
))
(declare-fun lt!635713 () Unit!48743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48743)

(assert (=> b!1448960 (= lt!635713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448961 () Bool)

(declare-fun res!979764 () Bool)

(declare-fun e!816127 () Bool)

(assert (=> b!1448961 (=> (not res!979764) (not e!816127))))

(declare-fun lt!635710 () SeekEntryResult!11607)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98347 (_ BitVec 32)) SeekEntryResult!11607)

(assert (=> b!1448961 (= res!979764 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!635710))))

(declare-fun b!1448962 () Bool)

(declare-fun res!979767 () Bool)

(assert (=> b!1448962 (=> (not res!979767) (not e!816130))))

(assert (=> b!1448962 (= res!979767 (validKeyInArray!0 (select (arr!47458 a!2862) j!93)))))

(declare-fun res!979775 () Bool)

(assert (=> start!125004 (=> (not res!979775) (not e!816130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125004 (= res!979775 (validMask!0 mask!2687))))

(assert (=> start!125004 e!816130))

(assert (=> start!125004 true))

(declare-fun array_inv!36739 (array!98347) Bool)

(assert (=> start!125004 (array_inv!36739 a!2862)))

(declare-fun b!1448963 () Bool)

(declare-fun res!979773 () Bool)

(assert (=> b!1448963 (=> (not res!979773) (not e!816130))))

(declare-datatypes ((List!33946 0))(
  ( (Nil!33943) (Cons!33942 (h!35303 (_ BitVec 64)) (t!48632 List!33946)) )
))
(declare-fun arrayNoDuplicates!0 (array!98347 (_ BitVec 32) List!33946) Bool)

(assert (=> b!1448963 (= res!979773 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33943))))

(declare-fun b!1448964 () Bool)

(declare-fun e!816129 () Bool)

(assert (=> b!1448964 (= e!816129 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun lt!635714 () SeekEntryResult!11607)

(declare-fun b!1448965 () Bool)

(assert (=> b!1448965 (= e!816128 (= lt!635714 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635712 lt!635711 mask!2687)))))

(declare-fun b!1448966 () Bool)

(declare-fun res!979771 () Bool)

(assert (=> b!1448966 (=> (not res!979771) (not e!816124))))

(assert (=> b!1448966 (= res!979771 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448967 () Bool)

(declare-fun e!816125 () Bool)

(assert (=> b!1448967 (= e!816125 e!816129)))

(declare-fun res!979774 () Bool)

(assert (=> b!1448967 (=> (not res!979774) (not e!816129))))

(assert (=> b!1448967 (= res!979774 (= lt!635716 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47458 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448968 () Bool)

(assert (=> b!1448968 (= e!816126 e!816125)))

(declare-fun res!979766 () Bool)

(assert (=> b!1448968 (=> res!979766 e!816125)))

(assert (=> b!1448968 (= res!979766 (or (and (= (select (arr!47458 a!2862) index!646) (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47458 a!2862) index!646) (select (arr!47458 a!2862) j!93))) (not (= (select (arr!47458 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448969 () Bool)

(declare-fun e!816131 () Bool)

(assert (=> b!1448969 (= e!816130 e!816131)))

(declare-fun res!979762 () Bool)

(assert (=> b!1448969 (=> (not res!979762) (not e!816131))))

(assert (=> b!1448969 (= res!979762 (= (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448969 (= lt!635711 (array!98348 (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48009 a!2862)))))

(declare-fun b!1448970 () Bool)

(assert (=> b!1448970 (= e!816127 e!816124)))

(declare-fun res!979769 () Bool)

(assert (=> b!1448970 (=> (not res!979769) (not e!816124))))

(assert (=> b!1448970 (= res!979769 (= lt!635714 (Intermediate!11607 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448970 (= lt!635714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635712 mask!2687) lt!635712 lt!635711 mask!2687))))

(assert (=> b!1448970 (= lt!635712 (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448971 () Bool)

(declare-fun res!979763 () Bool)

(assert (=> b!1448971 (=> (not res!979763) (not e!816124))))

(assert (=> b!1448971 (= res!979763 e!816128)))

(declare-fun c!134116 () Bool)

(assert (=> b!1448971 (= c!134116 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448972 () Bool)

(declare-fun res!979777 () Bool)

(assert (=> b!1448972 (=> (not res!979777) (not e!816130))))

(assert (=> b!1448972 (= res!979777 (and (= (size!48009 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48009 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48009 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448973 () Bool)

(assert (=> b!1448973 (= e!816123 true)))

(declare-fun lt!635715 () SeekEntryResult!11607)

(assert (=> b!1448973 (= lt!635715 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47458 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448974 () Bool)

(assert (=> b!1448974 (= e!816131 e!816127)))

(declare-fun res!979768 () Bool)

(assert (=> b!1448974 (=> (not res!979768) (not e!816127))))

(assert (=> b!1448974 (= res!979768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47458 a!2862) j!93) mask!2687) (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!635710))))

(assert (=> b!1448974 (= lt!635710 (Intermediate!11607 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125004 res!979775) b!1448972))

(assert (= (and b!1448972 res!979777) b!1448958))

(assert (= (and b!1448958 res!979770) b!1448962))

(assert (= (and b!1448962 res!979767) b!1448957))

(assert (= (and b!1448957 res!979772) b!1448963))

(assert (= (and b!1448963 res!979773) b!1448959))

(assert (= (and b!1448959 res!979776) b!1448969))

(assert (= (and b!1448969 res!979762) b!1448974))

(assert (= (and b!1448974 res!979768) b!1448961))

(assert (= (and b!1448961 res!979764) b!1448970))

(assert (= (and b!1448970 res!979769) b!1448971))

(assert (= (and b!1448971 c!134116) b!1448965))

(assert (= (and b!1448971 (not c!134116)) b!1448956))

(assert (= (and b!1448971 res!979763) b!1448966))

(assert (= (and b!1448966 res!979771) b!1448960))

(assert (= (and b!1448960 res!979765) b!1448968))

(assert (= (and b!1448968 (not res!979766)) b!1448967))

(assert (= (and b!1448967 res!979774) b!1448964))

(assert (= (and b!1448960 (not res!979778)) b!1448973))

(declare-fun m!1337875 () Bool)

(assert (=> b!1448958 m!1337875))

(assert (=> b!1448958 m!1337875))

(declare-fun m!1337877 () Bool)

(assert (=> b!1448958 m!1337877))

(declare-fun m!1337879 () Bool)

(assert (=> b!1448957 m!1337879))

(declare-fun m!1337881 () Bool)

(assert (=> b!1448974 m!1337881))

(assert (=> b!1448974 m!1337881))

(declare-fun m!1337883 () Bool)

(assert (=> b!1448974 m!1337883))

(assert (=> b!1448974 m!1337883))

(assert (=> b!1448974 m!1337881))

(declare-fun m!1337885 () Bool)

(assert (=> b!1448974 m!1337885))

(declare-fun m!1337887 () Bool)

(assert (=> b!1448960 m!1337887))

(declare-fun m!1337889 () Bool)

(assert (=> b!1448960 m!1337889))

(declare-fun m!1337891 () Bool)

(assert (=> b!1448960 m!1337891))

(declare-fun m!1337893 () Bool)

(assert (=> b!1448960 m!1337893))

(declare-fun m!1337895 () Bool)

(assert (=> b!1448960 m!1337895))

(assert (=> b!1448960 m!1337881))

(declare-fun m!1337897 () Bool)

(assert (=> b!1448960 m!1337897))

(declare-fun m!1337899 () Bool)

(assert (=> b!1448960 m!1337899))

(assert (=> b!1448960 m!1337881))

(assert (=> b!1448967 m!1337881))

(assert (=> b!1448967 m!1337881))

(declare-fun m!1337901 () Bool)

(assert (=> b!1448967 m!1337901))

(assert (=> b!1448961 m!1337881))

(assert (=> b!1448961 m!1337881))

(declare-fun m!1337903 () Bool)

(assert (=> b!1448961 m!1337903))

(assert (=> b!1448962 m!1337881))

(assert (=> b!1448962 m!1337881))

(declare-fun m!1337905 () Bool)

(assert (=> b!1448962 m!1337905))

(declare-fun m!1337907 () Bool)

(assert (=> b!1448965 m!1337907))

(declare-fun m!1337909 () Bool)

(assert (=> b!1448963 m!1337909))

(assert (=> b!1448969 m!1337889))

(declare-fun m!1337911 () Bool)

(assert (=> b!1448969 m!1337911))

(assert (=> b!1448968 m!1337895))

(assert (=> b!1448968 m!1337889))

(assert (=> b!1448968 m!1337893))

(assert (=> b!1448968 m!1337881))

(declare-fun m!1337913 () Bool)

(assert (=> start!125004 m!1337913))

(declare-fun m!1337915 () Bool)

(assert (=> start!125004 m!1337915))

(declare-fun m!1337917 () Bool)

(assert (=> b!1448956 m!1337917))

(declare-fun m!1337919 () Bool)

(assert (=> b!1448956 m!1337919))

(assert (=> b!1448973 m!1337881))

(assert (=> b!1448973 m!1337881))

(declare-fun m!1337921 () Bool)

(assert (=> b!1448973 m!1337921))

(declare-fun m!1337923 () Bool)

(assert (=> b!1448970 m!1337923))

(assert (=> b!1448970 m!1337923))

(declare-fun m!1337925 () Bool)

(assert (=> b!1448970 m!1337925))

(assert (=> b!1448970 m!1337889))

(declare-fun m!1337927 () Bool)

(assert (=> b!1448970 m!1337927))

(check-sat (not b!1448958) (not b!1448961) (not b!1448974) (not b!1448965) (not b!1448973) (not b!1448960) (not b!1448956) (not b!1448970) (not b!1448963) (not b!1448967) (not start!125004) (not b!1448957) (not b!1448962))
(check-sat)
