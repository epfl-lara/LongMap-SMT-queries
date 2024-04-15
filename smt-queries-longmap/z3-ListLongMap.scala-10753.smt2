; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125746 () Bool)

(assert start!125746)

(declare-fun b!1471763 () Bool)

(declare-fun res!999611 () Bool)

(declare-fun e!826039 () Bool)

(assert (=> b!1471763 (=> (not res!999611) (not e!826039))))

(declare-datatypes ((array!99058 0))(
  ( (array!99059 (arr!47815 (Array (_ BitVec 32) (_ BitVec 64))) (size!48367 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99058)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12080 0))(
  ( (MissingZero!12080 (index!50712 (_ BitVec 32))) (Found!12080 (index!50713 (_ BitVec 32))) (Intermediate!12080 (undefined!12892 Bool) (index!50714 (_ BitVec 32)) (x!132294 (_ BitVec 32))) (Undefined!12080) (MissingVacant!12080 (index!50715 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!12080)

(assert (=> b!1471763 (= res!999611 (= (seekEntryOrOpen!0 (select (arr!47815 a!2862) j!93) a!2862 mask!2687) (Found!12080 j!93)))))

(declare-fun b!1471764 () Bool)

(declare-fun e!826035 () Bool)

(declare-fun e!826037 () Bool)

(assert (=> b!1471764 (= e!826035 e!826037)))

(declare-fun res!999601 () Bool)

(assert (=> b!1471764 (=> (not res!999601) (not e!826037))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!643199 () SeekEntryResult!12080)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471764 (= res!999601 (= lt!643199 (Intermediate!12080 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643198 () (_ BitVec 64))

(declare-fun lt!643197 () array!99058)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!12080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471764 (= lt!643199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643198 mask!2687) lt!643198 lt!643197 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471764 (= lt!643198 (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471765 () Bool)

(declare-fun res!999612 () Bool)

(assert (=> b!1471765 (=> (not res!999612) (not e!826035))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643196 () SeekEntryResult!12080)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1471765 (= res!999612 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47815 a!2862) j!93) a!2862 mask!2687) lt!643196))))

(declare-fun b!1471766 () Bool)

(declare-fun e!826040 () Bool)

(declare-fun e!826041 () Bool)

(assert (=> b!1471766 (= e!826040 e!826041)))

(declare-fun res!999613 () Bool)

(assert (=> b!1471766 (=> (not res!999613) (not e!826041))))

(assert (=> b!1471766 (= res!999613 (= (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471766 (= lt!643197 (array!99059 (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48367 a!2862)))))

(declare-fun res!999607 () Bool)

(assert (=> start!125746 (=> (not res!999607) (not e!826040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125746 (= res!999607 (validMask!0 mask!2687))))

(assert (=> start!125746 e!826040))

(assert (=> start!125746 true))

(declare-fun array_inv!37048 (array!99058) Bool)

(assert (=> start!125746 (array_inv!37048 a!2862)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1471767 () Bool)

(assert (=> b!1471767 (= e!826039 (or (= (select (arr!47815 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47815 a!2862) intermediateBeforeIndex!19) (select (arr!47815 a!2862) j!93))))))

(declare-fun b!1471768 () Bool)

(declare-fun res!999602 () Bool)

(assert (=> b!1471768 (=> (not res!999602) (not e!826040))))

(declare-datatypes ((List!34394 0))(
  ( (Nil!34391) (Cons!34390 (h!35746 (_ BitVec 64)) (t!49080 List!34394)) )
))
(declare-fun arrayNoDuplicates!0 (array!99058 (_ BitVec 32) List!34394) Bool)

(assert (=> b!1471768 (= res!999602 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34391))))

(declare-fun b!1471769 () Bool)

(declare-fun res!999608 () Bool)

(assert (=> b!1471769 (=> (not res!999608) (not e!826040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99058 (_ BitVec 32)) Bool)

(assert (=> b!1471769 (= res!999608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!826036 () Bool)

(declare-fun b!1471770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!12080)

(assert (=> b!1471770 (= e!826036 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643198 lt!643197 mask!2687) (seekEntryOrOpen!0 lt!643198 lt!643197 mask!2687)))))

(declare-fun b!1471771 () Bool)

(declare-fun res!999606 () Bool)

(assert (=> b!1471771 (=> (not res!999606) (not e!826037))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471771 (= res!999606 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471772 () Bool)

(declare-fun res!999599 () Bool)

(assert (=> b!1471772 (=> (not res!999599) (not e!826037))))

(assert (=> b!1471772 (= res!999599 e!826036)))

(declare-fun c!135598 () Bool)

(assert (=> b!1471772 (= c!135598 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471773 () Bool)

(declare-fun res!999609 () Bool)

(assert (=> b!1471773 (=> (not res!999609) (not e!826040))))

(assert (=> b!1471773 (= res!999609 (and (= (size!48367 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48367 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48367 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471774 () Bool)

(declare-fun res!999610 () Bool)

(assert (=> b!1471774 (=> (not res!999610) (not e!826040))))

(assert (=> b!1471774 (= res!999610 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48367 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48367 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48367 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471775 () Bool)

(assert (=> b!1471775 (= e!826036 (= lt!643199 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643198 lt!643197 mask!2687)))))

(declare-fun b!1471776 () Bool)

(assert (=> b!1471776 (= e!826041 e!826035)))

(declare-fun res!999603 () Bool)

(assert (=> b!1471776 (=> (not res!999603) (not e!826035))))

(assert (=> b!1471776 (= res!999603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47815 a!2862) j!93) mask!2687) (select (arr!47815 a!2862) j!93) a!2862 mask!2687) lt!643196))))

(assert (=> b!1471776 (= lt!643196 (Intermediate!12080 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471777 () Bool)

(declare-fun res!999600 () Bool)

(assert (=> b!1471777 (=> (not res!999600) (not e!826040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471777 (= res!999600 (validKeyInArray!0 (select (arr!47815 a!2862) j!93)))))

(declare-fun b!1471778 () Bool)

(assert (=> b!1471778 (= e!826037 (not true))))

(assert (=> b!1471778 e!826039))

(declare-fun res!999605 () Bool)

(assert (=> b!1471778 (=> (not res!999605) (not e!826039))))

(assert (=> b!1471778 (= res!999605 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49341 0))(
  ( (Unit!49342) )
))
(declare-fun lt!643200 () Unit!49341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49341)

(assert (=> b!1471778 (= lt!643200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471779 () Bool)

(declare-fun res!999604 () Bool)

(assert (=> b!1471779 (=> (not res!999604) (not e!826040))))

(assert (=> b!1471779 (= res!999604 (validKeyInArray!0 (select (arr!47815 a!2862) i!1006)))))

(assert (= (and start!125746 res!999607) b!1471773))

(assert (= (and b!1471773 res!999609) b!1471779))

(assert (= (and b!1471779 res!999604) b!1471777))

(assert (= (and b!1471777 res!999600) b!1471769))

(assert (= (and b!1471769 res!999608) b!1471768))

(assert (= (and b!1471768 res!999602) b!1471774))

(assert (= (and b!1471774 res!999610) b!1471766))

(assert (= (and b!1471766 res!999613) b!1471776))

(assert (= (and b!1471776 res!999603) b!1471765))

(assert (= (and b!1471765 res!999612) b!1471764))

(assert (= (and b!1471764 res!999601) b!1471772))

(assert (= (and b!1471772 c!135598) b!1471775))

(assert (= (and b!1471772 (not c!135598)) b!1471770))

(assert (= (and b!1471772 res!999599) b!1471771))

(assert (= (and b!1471771 res!999606) b!1471778))

(assert (= (and b!1471778 res!999605) b!1471763))

(assert (= (and b!1471763 res!999611) b!1471767))

(declare-fun m!1358043 () Bool)

(assert (=> start!125746 m!1358043))

(declare-fun m!1358045 () Bool)

(assert (=> start!125746 m!1358045))

(declare-fun m!1358047 () Bool)

(assert (=> b!1471767 m!1358047))

(declare-fun m!1358049 () Bool)

(assert (=> b!1471767 m!1358049))

(declare-fun m!1358051 () Bool)

(assert (=> b!1471770 m!1358051))

(declare-fun m!1358053 () Bool)

(assert (=> b!1471770 m!1358053))

(declare-fun m!1358055 () Bool)

(assert (=> b!1471775 m!1358055))

(assert (=> b!1471776 m!1358049))

(assert (=> b!1471776 m!1358049))

(declare-fun m!1358057 () Bool)

(assert (=> b!1471776 m!1358057))

(assert (=> b!1471776 m!1358057))

(assert (=> b!1471776 m!1358049))

(declare-fun m!1358059 () Bool)

(assert (=> b!1471776 m!1358059))

(assert (=> b!1471765 m!1358049))

(assert (=> b!1471765 m!1358049))

(declare-fun m!1358061 () Bool)

(assert (=> b!1471765 m!1358061))

(declare-fun m!1358063 () Bool)

(assert (=> b!1471779 m!1358063))

(assert (=> b!1471779 m!1358063))

(declare-fun m!1358065 () Bool)

(assert (=> b!1471779 m!1358065))

(declare-fun m!1358067 () Bool)

(assert (=> b!1471769 m!1358067))

(declare-fun m!1358069 () Bool)

(assert (=> b!1471766 m!1358069))

(declare-fun m!1358071 () Bool)

(assert (=> b!1471766 m!1358071))

(declare-fun m!1358073 () Bool)

(assert (=> b!1471778 m!1358073))

(declare-fun m!1358075 () Bool)

(assert (=> b!1471778 m!1358075))

(declare-fun m!1358077 () Bool)

(assert (=> b!1471764 m!1358077))

(assert (=> b!1471764 m!1358077))

(declare-fun m!1358079 () Bool)

(assert (=> b!1471764 m!1358079))

(assert (=> b!1471764 m!1358069))

(declare-fun m!1358081 () Bool)

(assert (=> b!1471764 m!1358081))

(assert (=> b!1471777 m!1358049))

(assert (=> b!1471777 m!1358049))

(declare-fun m!1358083 () Bool)

(assert (=> b!1471777 m!1358083))

(declare-fun m!1358085 () Bool)

(assert (=> b!1471768 m!1358085))

(assert (=> b!1471763 m!1358049))

(assert (=> b!1471763 m!1358049))

(declare-fun m!1358087 () Bool)

(assert (=> b!1471763 m!1358087))

(check-sat (not b!1471765) (not start!125746) (not b!1471779) (not b!1471770) (not b!1471764) (not b!1471769) (not b!1471777) (not b!1471763) (not b!1471778) (not b!1471776) (not b!1471768) (not b!1471775))
(check-sat)
