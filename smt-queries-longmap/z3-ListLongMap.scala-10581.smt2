; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124842 () Bool)

(assert start!124842)

(declare-fun b!1444643 () Bool)

(declare-fun res!975949 () Bool)

(declare-fun e!814185 () Bool)

(assert (=> b!1444643 (=> (not res!975949) (not e!814185))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98185 0))(
  ( (array!98186 (arr!47377 (Array (_ BitVec 32) (_ BitVec 64))) (size!47928 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98185)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444643 (= res!975949 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47928 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47928 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47928 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444644 () Bool)

(declare-fun res!975937 () Bool)

(declare-fun e!814186 () Bool)

(assert (=> b!1444644 (=> (not res!975937) (not e!814186))))

(declare-fun e!814189 () Bool)

(assert (=> b!1444644 (= res!975937 e!814189)))

(declare-fun c!133873 () Bool)

(assert (=> b!1444644 (= c!133873 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444645 () Bool)

(declare-fun res!975942 () Bool)

(assert (=> b!1444645 (=> (not res!975942) (not e!814186))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444645 (= res!975942 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444646 () Bool)

(declare-fun e!814190 () Bool)

(assert (=> b!1444646 (= e!814185 e!814190)))

(declare-fun res!975950 () Bool)

(assert (=> b!1444646 (=> (not res!975950) (not e!814190))))

(assert (=> b!1444646 (= res!975950 (= (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634298 () array!98185)

(assert (=> b!1444646 (= lt!634298 (array!98186 (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47928 a!2862)))))

(declare-fun b!1444647 () Bool)

(declare-fun e!814184 () Bool)

(assert (=> b!1444647 (= e!814184 true)))

(declare-datatypes ((SeekEntryResult!11526 0))(
  ( (MissingZero!11526 (index!48496 (_ BitVec 32))) (Found!11526 (index!48497 (_ BitVec 32))) (Intermediate!11526 (undefined!12338 Bool) (index!48498 (_ BitVec 32)) (x!130375 (_ BitVec 32))) (Undefined!11526) (MissingVacant!11526 (index!48499 (_ BitVec 32))) )
))
(declare-fun lt!634300 () SeekEntryResult!11526)

(declare-fun lt!634296 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98185 (_ BitVec 32)) SeekEntryResult!11526)

(assert (=> b!1444647 (= lt!634300 (seekEntryOrOpen!0 lt!634296 lt!634298 mask!2687))))

(declare-fun b!1444648 () Bool)

(declare-fun e!814187 () Bool)

(assert (=> b!1444648 (= e!814190 e!814187)))

(declare-fun res!975944 () Bool)

(assert (=> b!1444648 (=> (not res!975944) (not e!814187))))

(declare-fun lt!634295 () SeekEntryResult!11526)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98185 (_ BitVec 32)) SeekEntryResult!11526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444648 (= res!975944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47377 a!2862) j!93) mask!2687) (select (arr!47377 a!2862) j!93) a!2862 mask!2687) lt!634295))))

(assert (=> b!1444648 (= lt!634295 (Intermediate!11526 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!975946 () Bool)

(assert (=> start!124842 (=> (not res!975946) (not e!814185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124842 (= res!975946 (validMask!0 mask!2687))))

(assert (=> start!124842 e!814185))

(assert (=> start!124842 true))

(declare-fun array_inv!36658 (array!98185) Bool)

(assert (=> start!124842 (array_inv!36658 a!2862)))

(declare-fun b!1444649 () Bool)

(declare-fun res!975939 () Bool)

(assert (=> b!1444649 (=> (not res!975939) (not e!814187))))

(assert (=> b!1444649 (= res!975939 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47377 a!2862) j!93) a!2862 mask!2687) lt!634295))))

(declare-fun lt!634297 () SeekEntryResult!11526)

(declare-fun b!1444650 () Bool)

(assert (=> b!1444650 (= e!814189 (= lt!634297 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634296 lt!634298 mask!2687)))))

(declare-fun b!1444651 () Bool)

(assert (=> b!1444651 (= e!814186 (not e!814184))))

(declare-fun res!975943 () Bool)

(assert (=> b!1444651 (=> res!975943 e!814184)))

(assert (=> b!1444651 (= res!975943 (or (not (= (select (arr!47377 a!2862) index!646) (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47377 a!2862) index!646) (select (arr!47377 a!2862) j!93)))))))

(declare-fun e!814191 () Bool)

(assert (=> b!1444651 e!814191))

(declare-fun res!975945 () Bool)

(assert (=> b!1444651 (=> (not res!975945) (not e!814191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98185 (_ BitVec 32)) Bool)

(assert (=> b!1444651 (= res!975945 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48581 0))(
  ( (Unit!48582) )
))
(declare-fun lt!634299 () Unit!48581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48581)

(assert (=> b!1444651 (= lt!634299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444652 () Bool)

(declare-fun res!975940 () Bool)

(assert (=> b!1444652 (=> (not res!975940) (not e!814185))))

(assert (=> b!1444652 (= res!975940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444653 () Bool)

(declare-fun res!975936 () Bool)

(assert (=> b!1444653 (=> (not res!975936) (not e!814185))))

(declare-datatypes ((List!33865 0))(
  ( (Nil!33862) (Cons!33861 (h!35222 (_ BitVec 64)) (t!48551 List!33865)) )
))
(declare-fun arrayNoDuplicates!0 (array!98185 (_ BitVec 32) List!33865) Bool)

(assert (=> b!1444653 (= res!975936 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33862))))

(declare-fun b!1444654 () Bool)

(declare-fun res!975941 () Bool)

(assert (=> b!1444654 (=> (not res!975941) (not e!814185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444654 (= res!975941 (validKeyInArray!0 (select (arr!47377 a!2862) j!93)))))

(declare-fun b!1444655 () Bool)

(assert (=> b!1444655 (= e!814187 e!814186)))

(declare-fun res!975935 () Bool)

(assert (=> b!1444655 (=> (not res!975935) (not e!814186))))

(assert (=> b!1444655 (= res!975935 (= lt!634297 (Intermediate!11526 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444655 (= lt!634297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634296 mask!2687) lt!634296 lt!634298 mask!2687))))

(assert (=> b!1444655 (= lt!634296 (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444656 () Bool)

(declare-fun res!975947 () Bool)

(assert (=> b!1444656 (=> (not res!975947) (not e!814191))))

(assert (=> b!1444656 (= res!975947 (= (seekEntryOrOpen!0 (select (arr!47377 a!2862) j!93) a!2862 mask!2687) (Found!11526 j!93)))))

(declare-fun b!1444657 () Bool)

(assert (=> b!1444657 (= e!814191 (or (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) (select (arr!47377 a!2862) j!93))))))

(declare-fun b!1444658 () Bool)

(declare-fun res!975938 () Bool)

(assert (=> b!1444658 (=> (not res!975938) (not e!814185))))

(assert (=> b!1444658 (= res!975938 (validKeyInArray!0 (select (arr!47377 a!2862) i!1006)))))

(declare-fun b!1444659 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98185 (_ BitVec 32)) SeekEntryResult!11526)

(assert (=> b!1444659 (= e!814189 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634296 lt!634298 mask!2687) (seekEntryOrOpen!0 lt!634296 lt!634298 mask!2687)))))

(declare-fun b!1444660 () Bool)

(declare-fun res!975948 () Bool)

(assert (=> b!1444660 (=> (not res!975948) (not e!814185))))

(assert (=> b!1444660 (= res!975948 (and (= (size!47928 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47928 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47928 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124842 res!975946) b!1444660))

(assert (= (and b!1444660 res!975948) b!1444658))

(assert (= (and b!1444658 res!975938) b!1444654))

(assert (= (and b!1444654 res!975941) b!1444652))

(assert (= (and b!1444652 res!975940) b!1444653))

(assert (= (and b!1444653 res!975936) b!1444643))

(assert (= (and b!1444643 res!975949) b!1444646))

(assert (= (and b!1444646 res!975950) b!1444648))

(assert (= (and b!1444648 res!975944) b!1444649))

(assert (= (and b!1444649 res!975939) b!1444655))

(assert (= (and b!1444655 res!975935) b!1444644))

(assert (= (and b!1444644 c!133873) b!1444650))

(assert (= (and b!1444644 (not c!133873)) b!1444659))

(assert (= (and b!1444644 res!975937) b!1444645))

(assert (= (and b!1444645 res!975942) b!1444651))

(assert (= (and b!1444651 res!975945) b!1444656))

(assert (= (and b!1444656 res!975947) b!1444657))

(assert (= (and b!1444651 (not res!975943)) b!1444647))

(declare-fun m!1333843 () Bool)

(assert (=> b!1444649 m!1333843))

(assert (=> b!1444649 m!1333843))

(declare-fun m!1333845 () Bool)

(assert (=> b!1444649 m!1333845))

(declare-fun m!1333847 () Bool)

(assert (=> b!1444657 m!1333847))

(assert (=> b!1444657 m!1333843))

(declare-fun m!1333849 () Bool)

(assert (=> b!1444646 m!1333849))

(declare-fun m!1333851 () Bool)

(assert (=> b!1444646 m!1333851))

(declare-fun m!1333853 () Bool)

(assert (=> b!1444658 m!1333853))

(assert (=> b!1444658 m!1333853))

(declare-fun m!1333855 () Bool)

(assert (=> b!1444658 m!1333855))

(declare-fun m!1333857 () Bool)

(assert (=> b!1444651 m!1333857))

(assert (=> b!1444651 m!1333849))

(declare-fun m!1333859 () Bool)

(assert (=> b!1444651 m!1333859))

(declare-fun m!1333861 () Bool)

(assert (=> b!1444651 m!1333861))

(declare-fun m!1333863 () Bool)

(assert (=> b!1444651 m!1333863))

(assert (=> b!1444651 m!1333843))

(assert (=> b!1444654 m!1333843))

(assert (=> b!1444654 m!1333843))

(declare-fun m!1333865 () Bool)

(assert (=> b!1444654 m!1333865))

(declare-fun m!1333867 () Bool)

(assert (=> b!1444650 m!1333867))

(assert (=> b!1444648 m!1333843))

(assert (=> b!1444648 m!1333843))

(declare-fun m!1333869 () Bool)

(assert (=> b!1444648 m!1333869))

(assert (=> b!1444648 m!1333869))

(assert (=> b!1444648 m!1333843))

(declare-fun m!1333871 () Bool)

(assert (=> b!1444648 m!1333871))

(declare-fun m!1333873 () Bool)

(assert (=> b!1444653 m!1333873))

(declare-fun m!1333875 () Bool)

(assert (=> b!1444652 m!1333875))

(declare-fun m!1333877 () Bool)

(assert (=> b!1444647 m!1333877))

(declare-fun m!1333879 () Bool)

(assert (=> b!1444659 m!1333879))

(assert (=> b!1444659 m!1333877))

(assert (=> b!1444656 m!1333843))

(assert (=> b!1444656 m!1333843))

(declare-fun m!1333881 () Bool)

(assert (=> b!1444656 m!1333881))

(declare-fun m!1333883 () Bool)

(assert (=> start!124842 m!1333883))

(declare-fun m!1333885 () Bool)

(assert (=> start!124842 m!1333885))

(declare-fun m!1333887 () Bool)

(assert (=> b!1444655 m!1333887))

(assert (=> b!1444655 m!1333887))

(declare-fun m!1333889 () Bool)

(assert (=> b!1444655 m!1333889))

(assert (=> b!1444655 m!1333849))

(declare-fun m!1333891 () Bool)

(assert (=> b!1444655 m!1333891))

(check-sat (not b!1444652) (not b!1444650) (not b!1444653) (not b!1444651) (not b!1444647) (not b!1444655) (not start!124842) (not b!1444654) (not b!1444649) (not b!1444659) (not b!1444656) (not b!1444658) (not b!1444648))
(check-sat)
