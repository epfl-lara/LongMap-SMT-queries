; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126062 () Bool)

(assert start!126062)

(declare-fun res!1002423 () Bool)

(declare-fun e!828032 () Bool)

(assert (=> start!126062 (=> (not res!1002423) (not e!828032))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126062 (= res!1002423 (validMask!0 mask!2687))))

(assert (=> start!126062 e!828032))

(assert (=> start!126062 true))

(declare-datatypes ((array!99225 0))(
  ( (array!99226 (arr!47893 (Array (_ BitVec 32) (_ BitVec 64))) (size!48443 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99225)

(declare-fun array_inv!36921 (array!99225) Bool)

(assert (=> start!126062 (array_inv!36921 a!2862)))

(declare-fun b!1475875 () Bool)

(declare-fun e!828028 () Bool)

(declare-fun e!828033 () Bool)

(assert (=> b!1475875 (= e!828028 e!828033)))

(declare-fun res!1002428 () Bool)

(assert (=> b!1475875 (=> (not res!1002428) (not e!828033))))

(declare-datatypes ((SeekEntryResult!12133 0))(
  ( (MissingZero!12133 (index!50924 (_ BitVec 32))) (Found!12133 (index!50925 (_ BitVec 32))) (Intermediate!12133 (undefined!12945 Bool) (index!50926 (_ BitVec 32)) (x!132515 (_ BitVec 32))) (Undefined!12133) (MissingVacant!12133 (index!50927 (_ BitVec 32))) )
))
(declare-fun lt!644795 () SeekEntryResult!12133)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475875 (= res!1002428 (= lt!644795 (Intermediate!12133 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644797 () (_ BitVec 64))

(declare-fun lt!644799 () array!99225)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99225 (_ BitVec 32)) SeekEntryResult!12133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475875 (= lt!644795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644797 mask!2687) lt!644797 lt!644799 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1475875 (= lt!644797 (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475876 () Bool)

(declare-fun res!1002431 () Bool)

(assert (=> b!1475876 (=> (not res!1002431) (not e!828033))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475876 (= res!1002431 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475877 () Bool)

(declare-fun res!1002436 () Bool)

(assert (=> b!1475877 (=> (not res!1002436) (not e!828032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475877 (= res!1002436 (validKeyInArray!0 (select (arr!47893 a!2862) i!1006)))))

(declare-fun b!1475878 () Bool)

(declare-fun res!1002426 () Bool)

(assert (=> b!1475878 (=> (not res!1002426) (not e!828032))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1475878 (= res!1002426 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48443 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48443 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48443 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475879 () Bool)

(declare-fun e!828027 () Bool)

(declare-fun e!828029 () Bool)

(assert (=> b!1475879 (= e!828027 e!828029)))

(declare-fun res!1002421 () Bool)

(assert (=> b!1475879 (=> (not res!1002421) (not e!828029))))

(declare-fun lt!644796 () SeekEntryResult!12133)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99225 (_ BitVec 32)) SeekEntryResult!12133)

(assert (=> b!1475879 (= res!1002421 (= lt!644796 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47893 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475880 () Bool)

(declare-fun e!828031 () Bool)

(assert (=> b!1475880 (= e!828032 e!828031)))

(declare-fun res!1002422 () Bool)

(assert (=> b!1475880 (=> (not res!1002422) (not e!828031))))

(assert (=> b!1475880 (= res!1002422 (= (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475880 (= lt!644799 (array!99226 (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48443 a!2862)))))

(declare-fun b!1475881 () Bool)

(declare-fun res!1002424 () Bool)

(assert (=> b!1475881 (=> (not res!1002424) (not e!828033))))

(declare-fun e!828030 () Bool)

(assert (=> b!1475881 (= res!1002424 e!828030)))

(declare-fun c!136245 () Bool)

(assert (=> b!1475881 (= c!136245 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475882 () Bool)

(declare-fun e!828034 () Bool)

(assert (=> b!1475882 (= e!828034 e!828027)))

(declare-fun res!1002427 () Bool)

(assert (=> b!1475882 (=> res!1002427 e!828027)))

(assert (=> b!1475882 (= res!1002427 (or (and (= (select (arr!47893 a!2862) index!646) (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47893 a!2862) index!646) (select (arr!47893 a!2862) j!93))) (not (= (select (arr!47893 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1475883 () Bool)

(declare-fun res!1002432 () Bool)

(assert (=> b!1475883 (=> (not res!1002432) (not e!828028))))

(declare-fun lt!644798 () SeekEntryResult!12133)

(assert (=> b!1475883 (= res!1002432 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!644798))))

(declare-fun b!1475884 () Bool)

(assert (=> b!1475884 (= e!828031 e!828028)))

(declare-fun res!1002433 () Bool)

(assert (=> b!1475884 (=> (not res!1002433) (not e!828028))))

(assert (=> b!1475884 (= res!1002433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!644798))))

(assert (=> b!1475884 (= lt!644798 (Intermediate!12133 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475885 () Bool)

(assert (=> b!1475885 (= e!828033 (not (or (and (= (select (arr!47893 a!2862) index!646) (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47893 a!2862) index!646) (select (arr!47893 a!2862) j!93))) (not (= (select (arr!47893 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= x!665 intermediateBeforeX!19))))))

(assert (=> b!1475885 e!828034))

(declare-fun res!1002434 () Bool)

(assert (=> b!1475885 (=> (not res!1002434) (not e!828034))))

(assert (=> b!1475885 (= res!1002434 (and (= lt!644796 (Found!12133 j!93)) (or (= (select (arr!47893 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47893 a!2862) intermediateBeforeIndex!19) (select (arr!47893 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99225 (_ BitVec 32)) SeekEntryResult!12133)

(assert (=> b!1475885 (= lt!644796 (seekEntryOrOpen!0 (select (arr!47893 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99225 (_ BitVec 32)) Bool)

(assert (=> b!1475885 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49606 0))(
  ( (Unit!49607) )
))
(declare-fun lt!644794 () Unit!49606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49606)

(assert (=> b!1475885 (= lt!644794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475886 () Bool)

(declare-fun res!1002430 () Bool)

(assert (=> b!1475886 (=> (not res!1002430) (not e!828032))))

(assert (=> b!1475886 (= res!1002430 (validKeyInArray!0 (select (arr!47893 a!2862) j!93)))))

(declare-fun b!1475887 () Bool)

(assert (=> b!1475887 (= e!828030 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644797 lt!644799 mask!2687) (seekEntryOrOpen!0 lt!644797 lt!644799 mask!2687)))))

(declare-fun b!1475888 () Bool)

(assert (=> b!1475888 (= e!828030 (= lt!644795 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644797 lt!644799 mask!2687)))))

(declare-fun b!1475889 () Bool)

(assert (=> b!1475889 (= e!828029 (= index!646 intermediateBeforeIndex!19))))

(declare-fun b!1475890 () Bool)

(declare-fun res!1002429 () Bool)

(assert (=> b!1475890 (=> (not res!1002429) (not e!828032))))

(declare-datatypes ((List!34394 0))(
  ( (Nil!34391) (Cons!34390 (h!35755 (_ BitVec 64)) (t!49088 List!34394)) )
))
(declare-fun arrayNoDuplicates!0 (array!99225 (_ BitVec 32) List!34394) Bool)

(assert (=> b!1475890 (= res!1002429 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34391))))

(declare-fun b!1475891 () Bool)

(declare-fun res!1002435 () Bool)

(assert (=> b!1475891 (=> (not res!1002435) (not e!828032))))

(assert (=> b!1475891 (= res!1002435 (and (= (size!48443 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48443 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48443 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475892 () Bool)

(declare-fun res!1002425 () Bool)

(assert (=> b!1475892 (=> (not res!1002425) (not e!828032))))

(assert (=> b!1475892 (= res!1002425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126062 res!1002423) b!1475891))

(assert (= (and b!1475891 res!1002435) b!1475877))

(assert (= (and b!1475877 res!1002436) b!1475886))

(assert (= (and b!1475886 res!1002430) b!1475892))

(assert (= (and b!1475892 res!1002425) b!1475890))

(assert (= (and b!1475890 res!1002429) b!1475878))

(assert (= (and b!1475878 res!1002426) b!1475880))

(assert (= (and b!1475880 res!1002422) b!1475884))

(assert (= (and b!1475884 res!1002433) b!1475883))

(assert (= (and b!1475883 res!1002432) b!1475875))

(assert (= (and b!1475875 res!1002428) b!1475881))

(assert (= (and b!1475881 c!136245) b!1475888))

(assert (= (and b!1475881 (not c!136245)) b!1475887))

(assert (= (and b!1475881 res!1002424) b!1475876))

(assert (= (and b!1475876 res!1002431) b!1475885))

(assert (= (and b!1475885 res!1002434) b!1475882))

(assert (= (and b!1475882 (not res!1002427)) b!1475879))

(assert (= (and b!1475879 res!1002421) b!1475889))

(declare-fun m!1362015 () Bool)

(assert (=> b!1475879 m!1362015))

(assert (=> b!1475879 m!1362015))

(declare-fun m!1362017 () Bool)

(assert (=> b!1475879 m!1362017))

(declare-fun m!1362019 () Bool)

(assert (=> b!1475887 m!1362019))

(declare-fun m!1362021 () Bool)

(assert (=> b!1475887 m!1362021))

(declare-fun m!1362023 () Bool)

(assert (=> b!1475880 m!1362023))

(declare-fun m!1362025 () Bool)

(assert (=> b!1475880 m!1362025))

(declare-fun m!1362027 () Bool)

(assert (=> b!1475892 m!1362027))

(assert (=> b!1475884 m!1362015))

(assert (=> b!1475884 m!1362015))

(declare-fun m!1362029 () Bool)

(assert (=> b!1475884 m!1362029))

(assert (=> b!1475884 m!1362029))

(assert (=> b!1475884 m!1362015))

(declare-fun m!1362031 () Bool)

(assert (=> b!1475884 m!1362031))

(declare-fun m!1362033 () Bool)

(assert (=> b!1475875 m!1362033))

(assert (=> b!1475875 m!1362033))

(declare-fun m!1362035 () Bool)

(assert (=> b!1475875 m!1362035))

(assert (=> b!1475875 m!1362023))

(declare-fun m!1362037 () Bool)

(assert (=> b!1475875 m!1362037))

(assert (=> b!1475886 m!1362015))

(assert (=> b!1475886 m!1362015))

(declare-fun m!1362039 () Bool)

(assert (=> b!1475886 m!1362039))

(declare-fun m!1362041 () Bool)

(assert (=> b!1475885 m!1362041))

(assert (=> b!1475885 m!1362023))

(declare-fun m!1362043 () Bool)

(assert (=> b!1475885 m!1362043))

(declare-fun m!1362045 () Bool)

(assert (=> b!1475885 m!1362045))

(declare-fun m!1362047 () Bool)

(assert (=> b!1475885 m!1362047))

(assert (=> b!1475885 m!1362015))

(declare-fun m!1362049 () Bool)

(assert (=> b!1475885 m!1362049))

(declare-fun m!1362051 () Bool)

(assert (=> b!1475885 m!1362051))

(assert (=> b!1475885 m!1362015))

(declare-fun m!1362053 () Bool)

(assert (=> b!1475888 m!1362053))

(declare-fun m!1362055 () Bool)

(assert (=> b!1475877 m!1362055))

(assert (=> b!1475877 m!1362055))

(declare-fun m!1362057 () Bool)

(assert (=> b!1475877 m!1362057))

(declare-fun m!1362059 () Bool)

(assert (=> b!1475890 m!1362059))

(declare-fun m!1362061 () Bool)

(assert (=> start!126062 m!1362061))

(declare-fun m!1362063 () Bool)

(assert (=> start!126062 m!1362063))

(assert (=> b!1475882 m!1362047))

(assert (=> b!1475882 m!1362023))

(assert (=> b!1475882 m!1362045))

(assert (=> b!1475882 m!1362015))

(assert (=> b!1475883 m!1362015))

(assert (=> b!1475883 m!1362015))

(declare-fun m!1362065 () Bool)

(assert (=> b!1475883 m!1362065))

(push 1)

(assert (not b!1475877))

(assert (not b!1475879))

(assert (not b!1475890))

(assert (not b!1475885))

(assert (not b!1475888))

(assert (not b!1475887))

(assert (not b!1475886))

(assert (not b!1475875))

(assert (not b!1475892))

(assert (not b!1475884))

(assert (not start!126062))

(assert (not b!1475883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1476016 () Bool)

(declare-fun e!828108 () SeekEntryResult!12133)

(assert (=> b!1476016 (= e!828108 (Found!12133 index!646))))

(declare-fun b!1476017 () Bool)

(declare-fun e!828106 () SeekEntryResult!12133)

(assert (=> b!1476017 (= e!828106 Undefined!12133)))

(declare-fun d!155905 () Bool)

(declare-fun lt!644848 () SeekEntryResult!12133)

(assert (=> d!155905 (and (or (is-Undefined!12133 lt!644848) (not (is-Found!12133 lt!644848)) (and (bvsge (index!50925 lt!644848) #b00000000000000000000000000000000) (bvslt (index!50925 lt!644848) (size!48443 lt!644799)))) (or (is-Undefined!12133 lt!644848) (is-Found!12133 lt!644848) (not (is-MissingVacant!12133 lt!644848)) (not (= (index!50927 lt!644848) intermediateAfterIndex!19)) (and (bvsge (index!50927 lt!644848) #b00000000000000000000000000000000) (bvslt (index!50927 lt!644848) (size!48443 lt!644799)))) (or (is-Undefined!12133 lt!644848) (ite (is-Found!12133 lt!644848) (= (select (arr!47893 lt!644799) (index!50925 lt!644848)) lt!644797) (and (is-MissingVacant!12133 lt!644848) (= (index!50927 lt!644848) intermediateAfterIndex!19) (= (select (arr!47893 lt!644799) (index!50927 lt!644848)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155905 (= lt!644848 e!828106)))

(declare-fun c!136298 () Bool)

(assert (=> d!155905 (= c!136298 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644847 () (_ BitVec 64))

(assert (=> d!155905 (= lt!644847 (select (arr!47893 lt!644799) index!646))))

(assert (=> d!155905 (validMask!0 mask!2687)))

(assert (=> d!155905 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644797 lt!644799 mask!2687) lt!644848)))

(declare-fun b!1476018 () Bool)

(declare-fun c!136297 () Bool)

(assert (=> b!1476018 (= c!136297 (= lt!644847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828107 () SeekEntryResult!12133)

(assert (=> b!1476018 (= e!828108 e!828107)))

(declare-fun b!1476019 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476019 (= e!828107 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644797 lt!644799 mask!2687))))

(declare-fun b!1476020 () Bool)

(assert (=> b!1476020 (= e!828106 e!828108)))

(declare-fun c!136299 () Bool)

(assert (=> b!1476020 (= c!136299 (= lt!644847 lt!644797))))

(declare-fun b!1476021 () Bool)

(assert (=> b!1476021 (= e!828107 (MissingVacant!12133 intermediateAfterIndex!19))))

(assert (= (and d!155905 c!136298) b!1476017))

(assert (= (and d!155905 (not c!136298)) b!1476020))

(assert (= (and b!1476020 c!136299) b!1476016))

(assert (= (and b!1476020 (not c!136299)) b!1476018))

(assert (= (and b!1476018 c!136297) b!1476021))

(assert (= (and b!1476018 (not c!136297)) b!1476019))

(declare-fun m!1362111 () Bool)

(assert (=> d!155905 m!1362111))

(declare-fun m!1362113 () Bool)

(assert (=> d!155905 m!1362113))

(declare-fun m!1362115 () Bool)

(assert (=> d!155905 m!1362115))

(assert (=> d!155905 m!1362061))

(declare-fun m!1362117 () Bool)

(assert (=> b!1476019 m!1362117))

(assert (=> b!1476019 m!1362117))

(declare-fun m!1362119 () Bool)

(assert (=> b!1476019 m!1362119))

(assert (=> b!1475887 d!155905))

(declare-fun b!1476110 () Bool)

(declare-fun e!828159 () SeekEntryResult!12133)

(declare-fun lt!644888 () SeekEntryResult!12133)

(assert (=> b!1476110 (= e!828159 (Found!12133 (index!50926 lt!644888)))))

(declare-fun b!1476111 () Bool)

(declare-fun c!136334 () Bool)

(declare-fun lt!644887 () (_ BitVec 64))

(assert (=> b!1476111 (= c!136334 (= lt!644887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828157 () SeekEntryResult!12133)

(assert (=> b!1476111 (= e!828159 e!828157)))

(declare-fun b!1476112 () Bool)

(assert (=> b!1476112 (= e!828157 (seekKeyOrZeroReturnVacant!0 (x!132515 lt!644888) (index!50926 lt!644888) (index!50926 lt!644888) lt!644797 lt!644799 mask!2687))))

(declare-fun b!1476113 () Bool)

(declare-fun e!828158 () SeekEntryResult!12133)

(assert (=> b!1476113 (= e!828158 Undefined!12133)))

(declare-fun b!1476115 () Bool)

(assert (=> b!1476115 (= e!828158 e!828159)))

(assert (=> b!1476115 (= lt!644887 (select (arr!47893 lt!644799) (index!50926 lt!644888)))))

(declare-fun c!136336 () Bool)

(assert (=> b!1476115 (= c!136336 (= lt!644887 lt!644797))))

(declare-fun d!155907 () Bool)

(declare-fun lt!644886 () SeekEntryResult!12133)

(assert (=> d!155907 (and (or (is-Undefined!12133 lt!644886) (not (is-Found!12133 lt!644886)) (and (bvsge (index!50925 lt!644886) #b00000000000000000000000000000000) (bvslt (index!50925 lt!644886) (size!48443 lt!644799)))) (or (is-Undefined!12133 lt!644886) (is-Found!12133 lt!644886) (not (is-MissingZero!12133 lt!644886)) (and (bvsge (index!50924 lt!644886) #b00000000000000000000000000000000) (bvslt (index!50924 lt!644886) (size!48443 lt!644799)))) (or (is-Undefined!12133 lt!644886) (is-Found!12133 lt!644886) (is-MissingZero!12133 lt!644886) (not (is-MissingVacant!12133 lt!644886)) (and (bvsge (index!50927 lt!644886) #b00000000000000000000000000000000) (bvslt (index!50927 lt!644886) (size!48443 lt!644799)))) (or (is-Undefined!12133 lt!644886) (ite (is-Found!12133 lt!644886) (= (select (arr!47893 lt!644799) (index!50925 lt!644886)) lt!644797) (ite (is-MissingZero!12133 lt!644886) (= (select (arr!47893 lt!644799) (index!50924 lt!644886)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12133 lt!644886) (= (select (arr!47893 lt!644799) (index!50927 lt!644886)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155907 (= lt!644886 e!828158)))

(declare-fun c!136335 () Bool)

(assert (=> d!155907 (= c!136335 (and (is-Intermediate!12133 lt!644888) (undefined!12945 lt!644888)))))

(assert (=> d!155907 (= lt!644888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644797 mask!2687) lt!644797 lt!644799 mask!2687))))

(assert (=> d!155907 (validMask!0 mask!2687)))

(assert (=> d!155907 (= (seekEntryOrOpen!0 lt!644797 lt!644799 mask!2687) lt!644886)))

(declare-fun b!1476114 () Bool)

(assert (=> b!1476114 (= e!828157 (MissingZero!12133 (index!50926 lt!644888)))))

(assert (= (and d!155907 c!136335) b!1476113))

(assert (= (and d!155907 (not c!136335)) b!1476115))

(assert (= (and b!1476115 c!136336) b!1476110))

(assert (= (and b!1476115 (not c!136336)) b!1476111))

(assert (= (and b!1476111 c!136334) b!1476114))

(assert (= (and b!1476111 (not c!136334)) b!1476112))

(declare-fun m!1362181 () Bool)

(assert (=> b!1476112 m!1362181))

(declare-fun m!1362183 () Bool)

(assert (=> b!1476115 m!1362183))

(declare-fun m!1362185 () Bool)

(assert (=> d!155907 m!1362185))

(declare-fun m!1362187 () Bool)

(assert (=> d!155907 m!1362187))

(declare-fun m!1362189 () Bool)

(assert (=> d!155907 m!1362189))

(assert (=> d!155907 m!1362033))

(assert (=> d!155907 m!1362061))

(assert (=> d!155907 m!1362033))

(assert (=> d!155907 m!1362035))

(assert (=> b!1475887 d!155907))

(declare-fun d!155929 () Bool)

(assert (=> d!155929 (= (validKeyInArray!0 (select (arr!47893 a!2862) j!93)) (and (not (= (select (arr!47893 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47893 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475886 d!155929))

(declare-fun b!1476152 () Bool)

(declare-fun e!828182 () SeekEntryResult!12133)

(assert (=> b!1476152 (= e!828182 (Intermediate!12133 true index!646 x!665))))

(declare-fun b!1476153 () Bool)

(declare-fun e!828184 () SeekEntryResult!12133)

(assert (=> b!1476153 (= e!828184 (Intermediate!12133 false index!646 x!665))))

(declare-fun b!1476155 () Bool)

(assert (=> b!1476155 (= e!828184 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644797 lt!644799 mask!2687))))

(declare-fun b!1476156 () Bool)

(declare-fun lt!644903 () SeekEntryResult!12133)

(assert (=> b!1476156 (and (bvsge (index!50926 lt!644903) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644903) (size!48443 lt!644799)))))

(declare-fun res!1002494 () Bool)

(assert (=> b!1476156 (= res!1002494 (= (select (arr!47893 lt!644799) (index!50926 lt!644903)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828180 () Bool)

(assert (=> b!1476156 (=> res!1002494 e!828180)))

(declare-fun b!1476157 () Bool)

(assert (=> b!1476157 (and (bvsge (index!50926 lt!644903) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644903) (size!48443 lt!644799)))))

(assert (=> b!1476157 (= e!828180 (= (select (arr!47893 lt!644799) (index!50926 lt!644903)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476158 () Bool)

(assert (=> b!1476158 (and (bvsge (index!50926 lt!644903) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644903) (size!48443 lt!644799)))))

(declare-fun res!1002492 () Bool)

(assert (=> b!1476158 (= res!1002492 (= (select (arr!47893 lt!644799) (index!50926 lt!644903)) lt!644797))))

(assert (=> b!1476158 (=> res!1002492 e!828180)))

(declare-fun e!828181 () Bool)

(assert (=> b!1476158 (= e!828181 e!828180)))

(declare-fun d!155931 () Bool)

(declare-fun e!828183 () Bool)

(assert (=> d!155931 e!828183))

(declare-fun c!136349 () Bool)

(assert (=> d!155931 (= c!136349 (and (is-Intermediate!12133 lt!644903) (undefined!12945 lt!644903)))))

(assert (=> d!155931 (= lt!644903 e!828182)))

(declare-fun c!136351 () Bool)

(assert (=> d!155931 (= c!136351 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644904 () (_ BitVec 64))

(assert (=> d!155931 (= lt!644904 (select (arr!47893 lt!644799) index!646))))

(assert (=> d!155931 (validMask!0 mask!2687)))

(assert (=> d!155931 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644797 lt!644799 mask!2687) lt!644903)))

(declare-fun b!1476154 () Bool)

(assert (=> b!1476154 (= e!828183 e!828181)))

(declare-fun res!1002493 () Bool)

(assert (=> b!1476154 (= res!1002493 (and (is-Intermediate!12133 lt!644903) (not (undefined!12945 lt!644903)) (bvslt (x!132515 lt!644903) #b01111111111111111111111111111110) (bvsge (x!132515 lt!644903) #b00000000000000000000000000000000) (bvsge (x!132515 lt!644903) x!665)))))

(assert (=> b!1476154 (=> (not res!1002493) (not e!828181))))

(declare-fun b!1476159 () Bool)

(assert (=> b!1476159 (= e!828182 e!828184)))

(declare-fun c!136350 () Bool)

(assert (=> b!1476159 (= c!136350 (or (= lt!644904 lt!644797) (= (bvadd lt!644904 lt!644904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476160 () Bool)

(assert (=> b!1476160 (= e!828183 (bvsge (x!132515 lt!644903) #b01111111111111111111111111111110))))

(assert (= (and d!155931 c!136351) b!1476152))

(assert (= (and d!155931 (not c!136351)) b!1476159))

(assert (= (and b!1476159 c!136350) b!1476153))

(assert (= (and b!1476159 (not c!136350)) b!1476155))

(assert (= (and d!155931 c!136349) b!1476160))

(assert (= (and d!155931 (not c!136349)) b!1476154))

(assert (= (and b!1476154 res!1002493) b!1476158))

(assert (= (and b!1476158 (not res!1002492)) b!1476156))

(assert (= (and b!1476156 (not res!1002494)) b!1476157))

(declare-fun m!1362203 () Bool)

(assert (=> b!1476157 m!1362203))

(assert (=> d!155931 m!1362115))

(assert (=> d!155931 m!1362061))

(assert (=> b!1476158 m!1362203))

(assert (=> b!1476156 m!1362203))

(assert (=> b!1476155 m!1362117))

(assert (=> b!1476155 m!1362117))

(declare-fun m!1362205 () Bool)

(assert (=> b!1476155 m!1362205))

(assert (=> b!1475888 d!155931))

(declare-fun d!155947 () Bool)

(assert (=> d!155947 (= (validKeyInArray!0 (select (arr!47893 a!2862) i!1006)) (and (not (= (select (arr!47893 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47893 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475877 d!155947))

(declare-fun e!828187 () SeekEntryResult!12133)

(declare-fun b!1476161 () Bool)

(assert (=> b!1476161 (= e!828187 (Intermediate!12133 true (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476162 () Bool)

(declare-fun e!828189 () SeekEntryResult!12133)

(assert (=> b!1476162 (= e!828189 (Intermediate!12133 false (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476164 () Bool)

(assert (=> b!1476164 (= e!828189 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47893 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476165 () Bool)

(declare-fun lt!644905 () SeekEntryResult!12133)

(assert (=> b!1476165 (and (bvsge (index!50926 lt!644905) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644905) (size!48443 a!2862)))))

(declare-fun res!1002497 () Bool)

(assert (=> b!1476165 (= res!1002497 (= (select (arr!47893 a!2862) (index!50926 lt!644905)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828185 () Bool)

(assert (=> b!1476165 (=> res!1002497 e!828185)))

(declare-fun b!1476166 () Bool)

(assert (=> b!1476166 (and (bvsge (index!50926 lt!644905) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644905) (size!48443 a!2862)))))

(assert (=> b!1476166 (= e!828185 (= (select (arr!47893 a!2862) (index!50926 lt!644905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476167 () Bool)

(assert (=> b!1476167 (and (bvsge (index!50926 lt!644905) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644905) (size!48443 a!2862)))))

(declare-fun res!1002495 () Bool)

(assert (=> b!1476167 (= res!1002495 (= (select (arr!47893 a!2862) (index!50926 lt!644905)) (select (arr!47893 a!2862) j!93)))))

(assert (=> b!1476167 (=> res!1002495 e!828185)))

(declare-fun e!828186 () Bool)

(assert (=> b!1476167 (= e!828186 e!828185)))

(declare-fun d!155949 () Bool)

(declare-fun e!828188 () Bool)

(assert (=> d!155949 e!828188))

(declare-fun c!136352 () Bool)

(assert (=> d!155949 (= c!136352 (and (is-Intermediate!12133 lt!644905) (undefined!12945 lt!644905)))))

(assert (=> d!155949 (= lt!644905 e!828187)))

(declare-fun c!136354 () Bool)

(assert (=> d!155949 (= c!136354 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644906 () (_ BitVec 64))

(assert (=> d!155949 (= lt!644906 (select (arr!47893 a!2862) (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687)))))

(assert (=> d!155949 (validMask!0 mask!2687)))

(assert (=> d!155949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!644905)))

(declare-fun b!1476163 () Bool)

(assert (=> b!1476163 (= e!828188 e!828186)))

(declare-fun res!1002496 () Bool)

(assert (=> b!1476163 (= res!1002496 (and (is-Intermediate!12133 lt!644905) (not (undefined!12945 lt!644905)) (bvslt (x!132515 lt!644905) #b01111111111111111111111111111110) (bvsge (x!132515 lt!644905) #b00000000000000000000000000000000) (bvsge (x!132515 lt!644905) #b00000000000000000000000000000000)))))

(assert (=> b!1476163 (=> (not res!1002496) (not e!828186))))

(declare-fun b!1476168 () Bool)

(assert (=> b!1476168 (= e!828187 e!828189)))

(declare-fun c!136353 () Bool)

(assert (=> b!1476168 (= c!136353 (or (= lt!644906 (select (arr!47893 a!2862) j!93)) (= (bvadd lt!644906 lt!644906) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476169 () Bool)

(assert (=> b!1476169 (= e!828188 (bvsge (x!132515 lt!644905) #b01111111111111111111111111111110))))

(assert (= (and d!155949 c!136354) b!1476161))

(assert (= (and d!155949 (not c!136354)) b!1476168))

(assert (= (and b!1476168 c!136353) b!1476162))

(assert (= (and b!1476168 (not c!136353)) b!1476164))

(assert (= (and d!155949 c!136352) b!1476169))

(assert (= (and d!155949 (not c!136352)) b!1476163))

(assert (= (and b!1476163 res!1002496) b!1476167))

(assert (= (and b!1476167 (not res!1002495)) b!1476165))

(assert (= (and b!1476165 (not res!1002497)) b!1476166))

(declare-fun m!1362207 () Bool)

(assert (=> b!1476166 m!1362207))

(assert (=> d!155949 m!1362029))

(declare-fun m!1362209 () Bool)

(assert (=> d!155949 m!1362209))

(assert (=> d!155949 m!1362061))

(assert (=> b!1476167 m!1362207))

(assert (=> b!1476165 m!1362207))

(assert (=> b!1476164 m!1362029))

(declare-fun m!1362211 () Bool)

(assert (=> b!1476164 m!1362211))

(assert (=> b!1476164 m!1362211))

(assert (=> b!1476164 m!1362015))

(declare-fun m!1362213 () Bool)

(assert (=> b!1476164 m!1362213))

(assert (=> b!1475884 d!155949))

(declare-fun d!155951 () Bool)

(declare-fun lt!644918 () (_ BitVec 32))

(declare-fun lt!644917 () (_ BitVec 32))

(assert (=> d!155951 (= lt!644918 (bvmul (bvxor lt!644917 (bvlshr lt!644917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155951 (= lt!644917 ((_ extract 31 0) (bvand (bvxor (select (arr!47893 a!2862) j!93) (bvlshr (select (arr!47893 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155951 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002498 (let ((h!35758 ((_ extract 31 0) (bvand (bvxor (select (arr!47893 a!2862) j!93) (bvlshr (select (arr!47893 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132524 (bvmul (bvxor h!35758 (bvlshr h!35758 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132524 (bvlshr x!132524 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002498 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002498 #b00000000000000000000000000000000))))))

(assert (=> d!155951 (= (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) (bvand (bvxor lt!644918 (bvlshr lt!644918 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475884 d!155951))

(declare-fun b!1476178 () Bool)

(declare-fun e!828198 () SeekEntryResult!12133)

(assert (=> b!1476178 (= e!828198 (Intermediate!12133 true (toIndex!0 lt!644797 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476179 () Bool)

(declare-fun e!828200 () SeekEntryResult!12133)

(assert (=> b!1476179 (= e!828200 (Intermediate!12133 false (toIndex!0 lt!644797 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476181 () Bool)

(assert (=> b!1476181 (= e!828200 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644797 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644797 lt!644799 mask!2687))))

(declare-fun b!1476182 () Bool)

(declare-fun lt!644919 () SeekEntryResult!12133)

(assert (=> b!1476182 (and (bvsge (index!50926 lt!644919) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644919) (size!48443 lt!644799)))))

(declare-fun res!1002505 () Bool)

(assert (=> b!1476182 (= res!1002505 (= (select (arr!47893 lt!644799) (index!50926 lt!644919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828196 () Bool)

(assert (=> b!1476182 (=> res!1002505 e!828196)))

(declare-fun b!1476183 () Bool)

(assert (=> b!1476183 (and (bvsge (index!50926 lt!644919) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644919) (size!48443 lt!644799)))))

(assert (=> b!1476183 (= e!828196 (= (select (arr!47893 lt!644799) (index!50926 lt!644919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476184 () Bool)

(assert (=> b!1476184 (and (bvsge (index!50926 lt!644919) #b00000000000000000000000000000000) (bvslt (index!50926 lt!644919) (size!48443 lt!644799)))))

(declare-fun res!1002503 () Bool)

(assert (=> b!1476184 (= res!1002503 (= (select (arr!47893 lt!644799) (index!50926 lt!644919)) lt!644797))))

(assert (=> b!1476184 (=> res!1002503 e!828196)))

(declare-fun e!828197 () Bool)

(assert (=> b!1476184 (= e!828197 e!828196)))

(declare-fun d!155953 () Bool)

(declare-fun e!828199 () Bool)

(assert (=> d!155953 e!828199))

(declare-fun c!136357 () Bool)

(assert (=> d!155953 (= c!136357 (and (is-Intermediate!12133 lt!644919) (undefined!12945 lt!644919)))))

(assert (=> d!155953 (= lt!644919 e!828198)))

(declare-fun c!136359 () Bool)

(assert (=> d!155953 (= c!136359 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644920 () (_ BitVec 64))

(assert (=> d!155953 (= lt!644920 (select (arr!47893 lt!644799) (toIndex!0 lt!644797 mask!2687)))))

(assert (=> d!155953 (validMask!0 mask!2687)))

(assert (=> d!155953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644797 mask!2687) lt!644797 lt!644799 mask!2687) lt!644919)))

(declare-fun b!1476180 () Bool)

(assert (=> b!1476180 (= e!828199 e!828197)))

(declare-fun res!1002504 () Bool)

(assert (=> b!1476180 (= res!1002504 (and (is-Intermediate!12133 lt!644919) (not (undefined!12945 lt!644919)) (bvslt (x!132515 lt!644919) #b01111111111111111111111111111110) (bvsge (x!132515 lt!644919) #b00000000000000000000000000000000) (bvsge (x!132515 lt!644919) #b00000000000000000000000000000000)))))

(assert (=> b!1476180 (=> (not res!1002504) (not e!828197))))

(declare-fun b!1476185 () Bool)

(assert (=> b!1476185 (= e!828198 e!828200)))

(declare-fun c!136358 () Bool)

(assert (=> b!1476185 (= c!136358 (or (= lt!644920 lt!644797) (= (bvadd lt!644920 lt!644920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476186 () Bool)

(assert (=> b!1476186 (= e!828199 (bvsge (x!132515 lt!644919) #b01111111111111111111111111111110))))

(assert (= (and d!155953 c!136359) b!1476178))

(assert (= (and d!155953 (not c!136359)) b!1476185))

(assert (= (and b!1476185 c!136358) b!1476179))

(assert (= (and b!1476185 (not c!136358)) b!1476181))

(assert (= (and d!155953 c!136357) b!1476186))

(assert (= (and d!155953 (not c!136357)) b!1476180))

(assert (= (and b!1476180 res!1002504) b!1476184))

(assert (= (and b!1476184 (not res!1002503)) b!1476182))

(assert (= (and b!1476182 (not res!1002505)) b!1476183))

(declare-fun m!1362215 () Bool)

(assert (=> b!1476183 m!1362215))

