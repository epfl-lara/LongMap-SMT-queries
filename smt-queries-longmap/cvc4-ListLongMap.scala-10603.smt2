; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124760 () Bool)

(assert start!124760)

(declare-fun b!1446888 () Bool)

(declare-fun e!814897 () Bool)

(declare-fun e!814899 () Bool)

(assert (=> b!1446888 (= e!814897 e!814899)))

(declare-fun res!978609 () Bool)

(assert (=> b!1446888 (=> (not res!978609) (not e!814899))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98208 0))(
  ( (array!98209 (arr!47392 (Array (_ BitVec 32) (_ BitVec 64))) (size!47942 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98208)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11644 0))(
  ( (MissingZero!11644 (index!48968 (_ BitVec 32))) (Found!11644 (index!48969 (_ BitVec 32))) (Intermediate!11644 (undefined!12456 Bool) (index!48970 (_ BitVec 32)) (x!130645 (_ BitVec 32))) (Undefined!11644) (MissingVacant!11644 (index!48971 (_ BitVec 32))) )
))
(declare-fun lt!634963 () SeekEntryResult!11644)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98208 (_ BitVec 32)) SeekEntryResult!11644)

(assert (=> b!1446888 (= res!978609 (= lt!634963 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47392 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun lt!634960 () SeekEntryResult!11644)

(declare-fun b!1446889 () Bool)

(declare-fun e!814902 () Bool)

(declare-fun lt!634965 () (_ BitVec 64))

(declare-fun lt!634961 () array!98208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98208 (_ BitVec 32)) SeekEntryResult!11644)

(assert (=> b!1446889 (= e!814902 (= lt!634960 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634965 lt!634961 mask!2687)))))

(declare-fun b!1446890 () Bool)

(declare-fun res!978597 () Bool)

(declare-fun e!814896 () Bool)

(assert (=> b!1446890 (=> (not res!978597) (not e!814896))))

(declare-datatypes ((List!33893 0))(
  ( (Nil!33890) (Cons!33889 (h!35239 (_ BitVec 64)) (t!48587 List!33893)) )
))
(declare-fun arrayNoDuplicates!0 (array!98208 (_ BitVec 32) List!33893) Bool)

(assert (=> b!1446890 (= res!978597 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33890))))

(declare-fun b!1446891 () Bool)

(declare-fun e!814901 () Bool)

(assert (=> b!1446891 (= e!814896 e!814901)))

(declare-fun res!978607 () Bool)

(assert (=> b!1446891 (=> (not res!978607) (not e!814901))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446891 (= res!978607 (= (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446891 (= lt!634961 (array!98209 (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47942 a!2862)))))

(declare-fun b!1446892 () Bool)

(declare-fun res!978612 () Bool)

(declare-fun e!814900 () Bool)

(assert (=> b!1446892 (=> (not res!978612) (not e!814900))))

(assert (=> b!1446892 (= res!978612 e!814902)))

(declare-fun c!133656 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446892 (= c!133656 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!978605 () Bool)

(assert (=> start!124760 (=> (not res!978605) (not e!814896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124760 (= res!978605 (validMask!0 mask!2687))))

(assert (=> start!124760 e!814896))

(assert (=> start!124760 true))

(declare-fun array_inv!36420 (array!98208) Bool)

(assert (=> start!124760 (array_inv!36420 a!2862)))

(declare-fun b!1446893 () Bool)

(declare-fun e!814898 () Bool)

(assert (=> b!1446893 (= e!814898 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!634964 () SeekEntryResult!11644)

(assert (=> b!1446893 (= lt!634964 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47392 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446894 () Bool)

(declare-fun e!814903 () Bool)

(assert (=> b!1446894 (= e!814901 e!814903)))

(declare-fun res!978598 () Bool)

(assert (=> b!1446894 (=> (not res!978598) (not e!814903))))

(declare-fun lt!634959 () SeekEntryResult!11644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446894 (= res!978598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47392 a!2862) j!93) mask!2687) (select (arr!47392 a!2862) j!93) a!2862 mask!2687) lt!634959))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446894 (= lt!634959 (Intermediate!11644 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446895 () Bool)

(declare-fun res!978608 () Bool)

(assert (=> b!1446895 (=> (not res!978608) (not e!814903))))

(assert (=> b!1446895 (= res!978608 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47392 a!2862) j!93) a!2862 mask!2687) lt!634959))))

(declare-fun b!1446896 () Bool)

(declare-fun res!978613 () Bool)

(assert (=> b!1446896 (=> (not res!978613) (not e!814896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446896 (= res!978613 (validKeyInArray!0 (select (arr!47392 a!2862) i!1006)))))

(declare-fun b!1446897 () Bool)

(declare-fun res!978603 () Bool)

(assert (=> b!1446897 (=> (not res!978603) (not e!814896))))

(assert (=> b!1446897 (= res!978603 (and (= (size!47942 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47942 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47942 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446898 () Bool)

(declare-fun res!978602 () Bool)

(assert (=> b!1446898 (=> (not res!978602) (not e!814896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98208 (_ BitVec 32)) Bool)

(assert (=> b!1446898 (= res!978602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446899 () Bool)

(declare-fun e!814904 () Bool)

(assert (=> b!1446899 (= e!814904 e!814897)))

(declare-fun res!978610 () Bool)

(assert (=> b!1446899 (=> res!978610 e!814897)))

(assert (=> b!1446899 (= res!978610 (or (and (= (select (arr!47392 a!2862) index!646) (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47392 a!2862) index!646) (select (arr!47392 a!2862) j!93))) (not (= (select (arr!47392 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446900 () Bool)

(declare-fun res!978606 () Bool)

(assert (=> b!1446900 (=> (not res!978606) (not e!814896))))

(assert (=> b!1446900 (= res!978606 (validKeyInArray!0 (select (arr!47392 a!2862) j!93)))))

(declare-fun b!1446901 () Bool)

(declare-fun res!978601 () Bool)

(assert (=> b!1446901 (=> (not res!978601) (not e!814900))))

(assert (=> b!1446901 (= res!978601 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446902 () Bool)

(assert (=> b!1446902 (= e!814899 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446903 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98208 (_ BitVec 32)) SeekEntryResult!11644)

(assert (=> b!1446903 (= e!814902 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634965 lt!634961 mask!2687) (seekEntryOrOpen!0 lt!634965 lt!634961 mask!2687)))))

(declare-fun b!1446904 () Bool)

(declare-fun res!978611 () Bool)

(assert (=> b!1446904 (=> (not res!978611) (not e!814896))))

(assert (=> b!1446904 (= res!978611 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47942 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47942 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47942 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446905 () Bool)

(assert (=> b!1446905 (= e!814903 e!814900)))

(declare-fun res!978599 () Bool)

(assert (=> b!1446905 (=> (not res!978599) (not e!814900))))

(assert (=> b!1446905 (= res!978599 (= lt!634960 (Intermediate!11644 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446905 (= lt!634960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634965 mask!2687) lt!634965 lt!634961 mask!2687))))

(assert (=> b!1446905 (= lt!634965 (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446906 () Bool)

(assert (=> b!1446906 (= e!814900 (not e!814898))))

(declare-fun res!978600 () Bool)

(assert (=> b!1446906 (=> res!978600 e!814898)))

(assert (=> b!1446906 (= res!978600 (or (and (= (select (arr!47392 a!2862) index!646) (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47392 a!2862) index!646) (select (arr!47392 a!2862) j!93))) (not (= (select (arr!47392 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446906 e!814904))

(declare-fun res!978604 () Bool)

(assert (=> b!1446906 (=> (not res!978604) (not e!814904))))

(assert (=> b!1446906 (= res!978604 (and (= lt!634963 (Found!11644 j!93)) (or (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) (select (arr!47392 a!2862) j!93)))))))

(assert (=> b!1446906 (= lt!634963 (seekEntryOrOpen!0 (select (arr!47392 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1446906 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48784 0))(
  ( (Unit!48785) )
))
(declare-fun lt!634962 () Unit!48784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48784)

(assert (=> b!1446906 (= lt!634962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124760 res!978605) b!1446897))

(assert (= (and b!1446897 res!978603) b!1446896))

(assert (= (and b!1446896 res!978613) b!1446900))

(assert (= (and b!1446900 res!978606) b!1446898))

(assert (= (and b!1446898 res!978602) b!1446890))

(assert (= (and b!1446890 res!978597) b!1446904))

(assert (= (and b!1446904 res!978611) b!1446891))

(assert (= (and b!1446891 res!978607) b!1446894))

(assert (= (and b!1446894 res!978598) b!1446895))

(assert (= (and b!1446895 res!978608) b!1446905))

(assert (= (and b!1446905 res!978599) b!1446892))

(assert (= (and b!1446892 c!133656) b!1446889))

(assert (= (and b!1446892 (not c!133656)) b!1446903))

(assert (= (and b!1446892 res!978612) b!1446901))

(assert (= (and b!1446901 res!978601) b!1446906))

(assert (= (and b!1446906 res!978604) b!1446899))

(assert (= (and b!1446899 (not res!978610)) b!1446888))

(assert (= (and b!1446888 res!978609) b!1446902))

(assert (= (and b!1446906 (not res!978600)) b!1446893))

(declare-fun m!1335733 () Bool)

(assert (=> b!1446888 m!1335733))

(assert (=> b!1446888 m!1335733))

(declare-fun m!1335735 () Bool)

(assert (=> b!1446888 m!1335735))

(declare-fun m!1335737 () Bool)

(assert (=> b!1446896 m!1335737))

(assert (=> b!1446896 m!1335737))

(declare-fun m!1335739 () Bool)

(assert (=> b!1446896 m!1335739))

(assert (=> b!1446900 m!1335733))

(assert (=> b!1446900 m!1335733))

(declare-fun m!1335741 () Bool)

(assert (=> b!1446900 m!1335741))

(declare-fun m!1335743 () Bool)

(assert (=> b!1446890 m!1335743))

(declare-fun m!1335745 () Bool)

(assert (=> b!1446905 m!1335745))

(assert (=> b!1446905 m!1335745))

(declare-fun m!1335747 () Bool)

(assert (=> b!1446905 m!1335747))

(declare-fun m!1335749 () Bool)

(assert (=> b!1446905 m!1335749))

(declare-fun m!1335751 () Bool)

(assert (=> b!1446905 m!1335751))

(assert (=> b!1446895 m!1335733))

(assert (=> b!1446895 m!1335733))

(declare-fun m!1335753 () Bool)

(assert (=> b!1446895 m!1335753))

(declare-fun m!1335755 () Bool)

(assert (=> b!1446889 m!1335755))

(declare-fun m!1335757 () Bool)

(assert (=> b!1446903 m!1335757))

(declare-fun m!1335759 () Bool)

(assert (=> b!1446903 m!1335759))

(declare-fun m!1335761 () Bool)

(assert (=> b!1446899 m!1335761))

(assert (=> b!1446899 m!1335749))

(declare-fun m!1335763 () Bool)

(assert (=> b!1446899 m!1335763))

(assert (=> b!1446899 m!1335733))

(declare-fun m!1335765 () Bool)

(assert (=> b!1446906 m!1335765))

(assert (=> b!1446906 m!1335749))

(declare-fun m!1335767 () Bool)

(assert (=> b!1446906 m!1335767))

(assert (=> b!1446906 m!1335763))

(assert (=> b!1446906 m!1335761))

(assert (=> b!1446906 m!1335733))

(declare-fun m!1335769 () Bool)

(assert (=> b!1446906 m!1335769))

(declare-fun m!1335771 () Bool)

(assert (=> b!1446906 m!1335771))

(assert (=> b!1446906 m!1335733))

(assert (=> b!1446893 m!1335733))

(assert (=> b!1446893 m!1335733))

(declare-fun m!1335773 () Bool)

(assert (=> b!1446893 m!1335773))

(assert (=> b!1446891 m!1335749))

(declare-fun m!1335775 () Bool)

(assert (=> b!1446891 m!1335775))

(declare-fun m!1335777 () Bool)

(assert (=> start!124760 m!1335777))

(declare-fun m!1335779 () Bool)

(assert (=> start!124760 m!1335779))

(declare-fun m!1335781 () Bool)

(assert (=> b!1446898 m!1335781))

(assert (=> b!1446894 m!1335733))

(assert (=> b!1446894 m!1335733))

(declare-fun m!1335783 () Bool)

(assert (=> b!1446894 m!1335783))

(assert (=> b!1446894 m!1335783))

(assert (=> b!1446894 m!1335733))

(declare-fun m!1335785 () Bool)

(assert (=> b!1446894 m!1335785))

(push 1)

(assert (not b!1446893))

(assert (not b!1446888))

(assert (not b!1446889))

(assert (not b!1446905))

(assert (not b!1446894))

(assert (not b!1446896))

(assert (not b!1446890))

(assert (not b!1446900))

(assert (not start!124760))

(assert (not b!1446906))

(assert (not b!1446895))

(assert (not b!1446898))

(assert (not b!1446903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

