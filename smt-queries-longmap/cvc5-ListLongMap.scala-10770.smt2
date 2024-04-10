; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126058 () Bool)

(assert start!126058)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12131 0))(
  ( (MissingZero!12131 (index!50916 (_ BitVec 32))) (Found!12131 (index!50917 (_ BitVec 32))) (Intermediate!12131 (undefined!12943 Bool) (index!50918 (_ BitVec 32)) (x!132513 (_ BitVec 32))) (Undefined!12131) (MissingVacant!12131 (index!50919 (_ BitVec 32))) )
))
(declare-fun lt!644763 () SeekEntryResult!12131)

(declare-datatypes ((array!99221 0))(
  ( (array!99222 (arr!47891 (Array (_ BitVec 32) (_ BitVec 64))) (size!48441 (_ BitVec 32))) )
))
(declare-fun lt!644760 () array!99221)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1475767 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!644761 () (_ BitVec 64))

(declare-fun e!827977 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99221 (_ BitVec 32)) SeekEntryResult!12131)

(assert (=> b!1475767 (= e!827977 (= lt!644763 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644761 lt!644760 mask!2687)))))

(declare-fun b!1475769 () Bool)

(declare-fun res!1002331 () Bool)

(declare-fun e!827979 () Bool)

(assert (=> b!1475769 (=> (not res!1002331) (not e!827979))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99221)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1475769 (= res!1002331 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48441 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48441 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48441 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475770 () Bool)

(declare-fun res!1002340 () Bool)

(declare-fun e!827974 () Bool)

(assert (=> b!1475770 (=> (not res!1002340) (not e!827974))))

(assert (=> b!1475770 (= res!1002340 e!827977)))

(declare-fun c!136239 () Bool)

(assert (=> b!1475770 (= c!136239 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475771 () Bool)

(declare-fun res!1002336 () Bool)

(declare-fun e!827978 () Bool)

(assert (=> b!1475771 (=> (not res!1002336) (not e!827978))))

(declare-fun lt!644759 () SeekEntryResult!12131)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1475771 (= res!1002336 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47891 a!2862) j!93) a!2862 mask!2687) lt!644759))))

(declare-fun b!1475772 () Bool)

(declare-fun e!827976 () Bool)

(assert (=> b!1475772 (= e!827976 e!827978)))

(declare-fun res!1002330 () Bool)

(assert (=> b!1475772 (=> (not res!1002330) (not e!827978))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475772 (= res!1002330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) (select (arr!47891 a!2862) j!93) a!2862 mask!2687) lt!644759))))

(assert (=> b!1475772 (= lt!644759 (Intermediate!12131 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475773 () Bool)

(declare-fun res!1002333 () Bool)

(assert (=> b!1475773 (=> (not res!1002333) (not e!827979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99221 (_ BitVec 32)) Bool)

(assert (=> b!1475773 (= res!1002333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475774 () Bool)

(assert (=> b!1475774 (= e!827978 e!827974)))

(declare-fun res!1002327 () Bool)

(assert (=> b!1475774 (=> (not res!1002327) (not e!827974))))

(assert (=> b!1475774 (= res!1002327 (= lt!644763 (Intermediate!12131 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475774 (= lt!644763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644761 mask!2687) lt!644761 lt!644760 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1475774 (= lt!644761 (select (store (arr!47891 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475775 () Bool)

(declare-fun res!1002334 () Bool)

(assert (=> b!1475775 (=> (not res!1002334) (not e!827979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475775 (= res!1002334 (validKeyInArray!0 (select (arr!47891 a!2862) i!1006)))))

(declare-fun b!1475776 () Bool)

(declare-fun res!1002328 () Bool)

(assert (=> b!1475776 (=> (not res!1002328) (not e!827979))))

(assert (=> b!1475776 (= res!1002328 (validKeyInArray!0 (select (arr!47891 a!2862) j!93)))))

(declare-fun b!1475777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99221 (_ BitVec 32)) SeekEntryResult!12131)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99221 (_ BitVec 32)) SeekEntryResult!12131)

(assert (=> b!1475777 (= e!827977 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644761 lt!644760 mask!2687) (seekEntryOrOpen!0 lt!644761 lt!644760 mask!2687)))))

(declare-fun b!1475778 () Bool)

(assert (=> b!1475778 (= e!827979 e!827976)))

(declare-fun res!1002326 () Bool)

(assert (=> b!1475778 (=> (not res!1002326) (not e!827976))))

(assert (=> b!1475778 (= res!1002326 (= (select (store (arr!47891 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475778 (= lt!644760 (array!99222 (store (arr!47891 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48441 a!2862)))))

(declare-fun b!1475779 () Bool)

(declare-fun e!827981 () Bool)

(declare-fun e!827975 () Bool)

(assert (=> b!1475779 (= e!827981 e!827975)))

(declare-fun res!1002325 () Bool)

(assert (=> b!1475779 (=> (not res!1002325) (not e!827975))))

(declare-fun lt!644762 () SeekEntryResult!12131)

(assert (=> b!1475779 (= res!1002325 (= lt!644762 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47891 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475780 () Bool)

(assert (=> b!1475780 (= e!827974 (not (or (and (= (select (arr!47891 a!2862) index!646) (select (store (arr!47891 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47891 a!2862) index!646) (select (arr!47891 a!2862) j!93))) (not (= (select (arr!47891 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= x!665 intermediateBeforeX!19))))))

(declare-fun e!827973 () Bool)

(assert (=> b!1475780 e!827973))

(declare-fun res!1002329 () Bool)

(assert (=> b!1475780 (=> (not res!1002329) (not e!827973))))

(assert (=> b!1475780 (= res!1002329 (and (= lt!644762 (Found!12131 j!93)) (or (= (select (arr!47891 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47891 a!2862) intermediateBeforeIndex!19) (select (arr!47891 a!2862) j!93)))))))

(assert (=> b!1475780 (= lt!644762 (seekEntryOrOpen!0 (select (arr!47891 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1475780 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49602 0))(
  ( (Unit!49603) )
))
(declare-fun lt!644758 () Unit!49602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49602)

(assert (=> b!1475780 (= lt!644758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475781 () Bool)

(assert (=> b!1475781 (= e!827975 (= index!646 intermediateBeforeIndex!19))))

(declare-fun b!1475782 () Bool)

(declare-fun res!1002335 () Bool)

(assert (=> b!1475782 (=> (not res!1002335) (not e!827974))))

(assert (=> b!1475782 (= res!1002335 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1002339 () Bool)

(assert (=> start!126058 (=> (not res!1002339) (not e!827979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126058 (= res!1002339 (validMask!0 mask!2687))))

(assert (=> start!126058 e!827979))

(assert (=> start!126058 true))

(declare-fun array_inv!36919 (array!99221) Bool)

(assert (=> start!126058 (array_inv!36919 a!2862)))

(declare-fun b!1475768 () Bool)

(declare-fun res!1002338 () Bool)

(assert (=> b!1475768 (=> (not res!1002338) (not e!827979))))

(assert (=> b!1475768 (= res!1002338 (and (= (size!48441 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48441 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48441 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475783 () Bool)

(declare-fun res!1002337 () Bool)

(assert (=> b!1475783 (=> (not res!1002337) (not e!827979))))

(declare-datatypes ((List!34392 0))(
  ( (Nil!34389) (Cons!34388 (h!35753 (_ BitVec 64)) (t!49086 List!34392)) )
))
(declare-fun arrayNoDuplicates!0 (array!99221 (_ BitVec 32) List!34392) Bool)

(assert (=> b!1475783 (= res!1002337 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34389))))

(declare-fun b!1475784 () Bool)

(assert (=> b!1475784 (= e!827973 e!827981)))

(declare-fun res!1002332 () Bool)

(assert (=> b!1475784 (=> res!1002332 e!827981)))

(assert (=> b!1475784 (= res!1002332 (or (and (= (select (arr!47891 a!2862) index!646) (select (store (arr!47891 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47891 a!2862) index!646) (select (arr!47891 a!2862) j!93))) (not (= (select (arr!47891 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!126058 res!1002339) b!1475768))

(assert (= (and b!1475768 res!1002338) b!1475775))

(assert (= (and b!1475775 res!1002334) b!1475776))

(assert (= (and b!1475776 res!1002328) b!1475773))

(assert (= (and b!1475773 res!1002333) b!1475783))

(assert (= (and b!1475783 res!1002337) b!1475769))

(assert (= (and b!1475769 res!1002331) b!1475778))

(assert (= (and b!1475778 res!1002326) b!1475772))

(assert (= (and b!1475772 res!1002330) b!1475771))

(assert (= (and b!1475771 res!1002336) b!1475774))

(assert (= (and b!1475774 res!1002327) b!1475770))

(assert (= (and b!1475770 c!136239) b!1475767))

(assert (= (and b!1475770 (not c!136239)) b!1475777))

(assert (= (and b!1475770 res!1002340) b!1475782))

(assert (= (and b!1475782 res!1002335) b!1475780))

(assert (= (and b!1475780 res!1002329) b!1475784))

(assert (= (and b!1475784 (not res!1002332)) b!1475779))

(assert (= (and b!1475779 res!1002325) b!1475781))

(declare-fun m!1361911 () Bool)

(assert (=> b!1475778 m!1361911))

(declare-fun m!1361913 () Bool)

(assert (=> b!1475778 m!1361913))

(declare-fun m!1361915 () Bool)

(assert (=> start!126058 m!1361915))

(declare-fun m!1361917 () Bool)

(assert (=> start!126058 m!1361917))

(declare-fun m!1361919 () Bool)

(assert (=> b!1475776 m!1361919))

(assert (=> b!1475776 m!1361919))

(declare-fun m!1361921 () Bool)

(assert (=> b!1475776 m!1361921))

(declare-fun m!1361923 () Bool)

(assert (=> b!1475775 m!1361923))

(assert (=> b!1475775 m!1361923))

(declare-fun m!1361925 () Bool)

(assert (=> b!1475775 m!1361925))

(declare-fun m!1361927 () Bool)

(assert (=> b!1475777 m!1361927))

(declare-fun m!1361929 () Bool)

(assert (=> b!1475777 m!1361929))

(declare-fun m!1361931 () Bool)

(assert (=> b!1475774 m!1361931))

(assert (=> b!1475774 m!1361931))

(declare-fun m!1361933 () Bool)

(assert (=> b!1475774 m!1361933))

(assert (=> b!1475774 m!1361911))

(declare-fun m!1361935 () Bool)

(assert (=> b!1475774 m!1361935))

(declare-fun m!1361937 () Bool)

(assert (=> b!1475784 m!1361937))

(assert (=> b!1475784 m!1361911))

(declare-fun m!1361939 () Bool)

(assert (=> b!1475784 m!1361939))

(assert (=> b!1475784 m!1361919))

(assert (=> b!1475771 m!1361919))

(assert (=> b!1475771 m!1361919))

(declare-fun m!1361941 () Bool)

(assert (=> b!1475771 m!1361941))

(assert (=> b!1475779 m!1361919))

(assert (=> b!1475779 m!1361919))

(declare-fun m!1361943 () Bool)

(assert (=> b!1475779 m!1361943))

(declare-fun m!1361945 () Bool)

(assert (=> b!1475783 m!1361945))

(declare-fun m!1361947 () Bool)

(assert (=> b!1475773 m!1361947))

(declare-fun m!1361949 () Bool)

(assert (=> b!1475780 m!1361949))

(assert (=> b!1475780 m!1361911))

(declare-fun m!1361951 () Bool)

(assert (=> b!1475780 m!1361951))

(assert (=> b!1475780 m!1361939))

(assert (=> b!1475780 m!1361937))

(assert (=> b!1475780 m!1361919))

(declare-fun m!1361953 () Bool)

(assert (=> b!1475780 m!1361953))

(declare-fun m!1361955 () Bool)

(assert (=> b!1475780 m!1361955))

(assert (=> b!1475780 m!1361919))

(assert (=> b!1475772 m!1361919))

(assert (=> b!1475772 m!1361919))

(declare-fun m!1361957 () Bool)

(assert (=> b!1475772 m!1361957))

(assert (=> b!1475772 m!1361957))

(assert (=> b!1475772 m!1361919))

(declare-fun m!1361959 () Bool)

(assert (=> b!1475772 m!1361959))

(declare-fun m!1361961 () Bool)

(assert (=> b!1475767 m!1361961))

(push 1)

(assert (not b!1475771))

(assert (not b!1475775))

(assert (not b!1475767))

(assert (not b!1475772))

(assert (not b!1475777))

(assert (not b!1475779))

(assert (not b!1475773))

(assert (not b!1475774))

(assert (not b!1475780))

(assert (not b!1475783))

(assert (not b!1475776))

(assert (not start!126058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1475968 () Bool)

(declare-fun c!136278 () Bool)

(declare-fun lt!644831 () (_ BitVec 64))

(assert (=> b!1475968 (= c!136278 (= lt!644831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828083 () SeekEntryResult!12131)

(declare-fun e!828081 () SeekEntryResult!12131)

(assert (=> b!1475968 (= e!828083 e!828081)))

(declare-fun b!1475969 () Bool)

(declare-fun e!828082 () SeekEntryResult!12131)

(assert (=> b!1475969 (= e!828082 e!828083)))

(declare-fun c!136276 () Bool)

(assert (=> b!1475969 (= c!136276 (= lt!644831 lt!644761))))

(declare-fun b!1475970 () Bool)

(assert (=> b!1475970 (= e!828081 (MissingVacant!12131 intermediateAfterIndex!19))))

(declare-fun b!1475971 () Bool)

(assert (=> b!1475971 (= e!828082 Undefined!12131)))

(declare-fun b!1475972 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475972 (= e!828081 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644761 lt!644760 mask!2687))))

(declare-fun b!1475973 () Bool)

(assert (=> b!1475973 (= e!828083 (Found!12131 index!646))))

(declare-fun d!155895 () Bool)

(declare-fun lt!644832 () SeekEntryResult!12131)

(assert (=> d!155895 (and (or (is-Undefined!12131 lt!644832) (not (is-Found!12131 lt!644832)) (and (bvsge (index!50917 lt!644832) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644832) (size!48441 lt!644760)))) (or (is-Undefined!12131 lt!644832) (is-Found!12131 lt!644832) (not (is-MissingVacant!12131 lt!644832)) (not (= (index!50919 lt!644832) intermediateAfterIndex!19)) (and (bvsge (index!50919 lt!644832) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644832) (size!48441 lt!644760)))) (or (is-Undefined!12131 lt!644832) (ite (is-Found!12131 lt!644832) (= (select (arr!47891 lt!644760) (index!50917 lt!644832)) lt!644761) (and (is-MissingVacant!12131 lt!644832) (= (index!50919 lt!644832) intermediateAfterIndex!19) (= (select (arr!47891 lt!644760) (index!50919 lt!644832)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155895 (= lt!644832 e!828082)))

(declare-fun c!136277 () Bool)

(assert (=> d!155895 (= c!136277 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155895 (= lt!644831 (select (arr!47891 lt!644760) index!646))))

(assert (=> d!155895 (validMask!0 mask!2687)))

(assert (=> d!155895 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644761 lt!644760 mask!2687) lt!644832)))

(assert (= (and d!155895 c!136277) b!1475971))

(assert (= (and d!155895 (not c!136277)) b!1475969))

(assert (= (and b!1475969 c!136276) b!1475973))

(assert (= (and b!1475969 (not c!136276)) b!1475968))

(assert (= (and b!1475968 c!136278) b!1475970))

(assert (= (and b!1475968 (not c!136278)) b!1475972))

(declare-fun m!1362101 () Bool)

(assert (=> b!1475972 m!1362101))

(assert (=> b!1475972 m!1362101))

(declare-fun m!1362103 () Bool)

(assert (=> b!1475972 m!1362103))

(declare-fun m!1362105 () Bool)

(assert (=> d!155895 m!1362105))

(declare-fun m!1362107 () Bool)

(assert (=> d!155895 m!1362107))

(declare-fun m!1362109 () Bool)

(assert (=> d!155895 m!1362109))

(assert (=> d!155895 m!1361915))

(assert (=> b!1475777 d!155895))

(declare-fun lt!644853 () SeekEntryResult!12131)

(declare-fun e!828115 () SeekEntryResult!12131)

(declare-fun b!1476031 () Bool)

(assert (=> b!1476031 (= e!828115 (seekKeyOrZeroReturnVacant!0 (x!132513 lt!644853) (index!50918 lt!644853) (index!50918 lt!644853) lt!644761 lt!644760 mask!2687))))

(declare-fun b!1476032 () Bool)

(declare-fun e!828114 () SeekEntryResult!12131)

(assert (=> b!1476032 (= e!828114 Undefined!12131)))

(declare-fun d!155903 () Bool)

(declare-fun lt!644852 () SeekEntryResult!12131)

(assert (=> d!155903 (and (or (is-Undefined!12131 lt!644852) (not (is-Found!12131 lt!644852)) (and (bvsge (index!50917 lt!644852) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644852) (size!48441 lt!644760)))) (or (is-Undefined!12131 lt!644852) (is-Found!12131 lt!644852) (not (is-MissingZero!12131 lt!644852)) (and (bvsge (index!50916 lt!644852) #b00000000000000000000000000000000) (bvslt (index!50916 lt!644852) (size!48441 lt!644760)))) (or (is-Undefined!12131 lt!644852) (is-Found!12131 lt!644852) (is-MissingZero!12131 lt!644852) (not (is-MissingVacant!12131 lt!644852)) (and (bvsge (index!50919 lt!644852) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644852) (size!48441 lt!644760)))) (or (is-Undefined!12131 lt!644852) (ite (is-Found!12131 lt!644852) (= (select (arr!47891 lt!644760) (index!50917 lt!644852)) lt!644761) (ite (is-MissingZero!12131 lt!644852) (= (select (arr!47891 lt!644760) (index!50916 lt!644852)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12131 lt!644852) (= (select (arr!47891 lt!644760) (index!50919 lt!644852)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155903 (= lt!644852 e!828114)))

(declare-fun c!136304 () Bool)

(assert (=> d!155903 (= c!136304 (and (is-Intermediate!12131 lt!644853) (undefined!12943 lt!644853)))))

(assert (=> d!155903 (= lt!644853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644761 mask!2687) lt!644761 lt!644760 mask!2687))))

(assert (=> d!155903 (validMask!0 mask!2687)))

(assert (=> d!155903 (= (seekEntryOrOpen!0 lt!644761 lt!644760 mask!2687) lt!644852)))

(declare-fun b!1476033 () Bool)

(declare-fun c!136305 () Bool)

(declare-fun lt!644851 () (_ BitVec 64))

(assert (=> b!1476033 (= c!136305 (= lt!644851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828116 () SeekEntryResult!12131)

(assert (=> b!1476033 (= e!828116 e!828115)))

(declare-fun b!1476034 () Bool)

(assert (=> b!1476034 (= e!828114 e!828116)))

(assert (=> b!1476034 (= lt!644851 (select (arr!47891 lt!644760) (index!50918 lt!644853)))))

(declare-fun c!136303 () Bool)

(assert (=> b!1476034 (= c!136303 (= lt!644851 lt!644761))))

(declare-fun b!1476035 () Bool)

(assert (=> b!1476035 (= e!828115 (MissingZero!12131 (index!50918 lt!644853)))))

(declare-fun b!1476036 () Bool)

(assert (=> b!1476036 (= e!828116 (Found!12131 (index!50918 lt!644853)))))

(assert (= (and d!155903 c!136304) b!1476032))

(assert (= (and d!155903 (not c!136304)) b!1476034))

(assert (= (and b!1476034 c!136303) b!1476036))

(assert (= (and b!1476034 (not c!136303)) b!1476033))

(assert (= (and b!1476033 c!136305) b!1476035))

(assert (= (and b!1476033 (not c!136305)) b!1476031))

(declare-fun m!1362127 () Bool)

(assert (=> b!1476031 m!1362127))

(declare-fun m!1362129 () Bool)

(assert (=> d!155903 m!1362129))

(assert (=> d!155903 m!1361931))

(declare-fun m!1362131 () Bool)

(assert (=> d!155903 m!1362131))

(assert (=> d!155903 m!1361915))

(assert (=> d!155903 m!1361931))

(assert (=> d!155903 m!1361933))

(declare-fun m!1362133 () Bool)

(assert (=> d!155903 m!1362133))

(declare-fun m!1362135 () Bool)

(assert (=> b!1476034 m!1362135))

(assert (=> b!1475777 d!155903))

(declare-fun b!1476116 () Bool)

(declare-fun e!828164 () SeekEntryResult!12131)

(assert (=> b!1476116 (= e!828164 (Intermediate!12131 false index!646 x!665))))

(declare-fun d!155913 () Bool)

(declare-fun e!828160 () Bool)

(assert (=> d!155913 e!828160))

(declare-fun c!136338 () Bool)

(declare-fun lt!644890 () SeekEntryResult!12131)

(assert (=> d!155913 (= c!136338 (and (is-Intermediate!12131 lt!644890) (undefined!12943 lt!644890)))))

(declare-fun e!828161 () SeekEntryResult!12131)

(assert (=> d!155913 (= lt!644890 e!828161)))

(declare-fun c!136339 () Bool)

(assert (=> d!155913 (= c!136339 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644889 () (_ BitVec 64))

(assert (=> d!155913 (= lt!644889 (select (arr!47891 lt!644760) index!646))))

(assert (=> d!155913 (validMask!0 mask!2687)))

(assert (=> d!155913 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644761 lt!644760 mask!2687) lt!644890)))

(declare-fun b!1476117 () Bool)

(assert (=> b!1476117 (= e!828164 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644761 lt!644760 mask!2687))))

(declare-fun b!1476118 () Bool)

(assert (=> b!1476118 (and (bvsge (index!50918 lt!644890) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644890) (size!48441 lt!644760)))))

(declare-fun e!828163 () Bool)

(assert (=> b!1476118 (= e!828163 (= (select (arr!47891 lt!644760) (index!50918 lt!644890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476119 () Bool)

(assert (=> b!1476119 (and (bvsge (index!50918 lt!644890) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644890) (size!48441 lt!644760)))))

(declare-fun res!1002481 () Bool)

(assert (=> b!1476119 (= res!1002481 (= (select (arr!47891 lt!644760) (index!50918 lt!644890)) lt!644761))))

(assert (=> b!1476119 (=> res!1002481 e!828163)))

(declare-fun e!828162 () Bool)

(assert (=> b!1476119 (= e!828162 e!828163)))

(declare-fun b!1476120 () Bool)

(assert (=> b!1476120 (= e!828161 (Intermediate!12131 true index!646 x!665))))

(declare-fun b!1476121 () Bool)

(assert (=> b!1476121 (= e!828161 e!828164)))

(declare-fun c!136337 () Bool)

(assert (=> b!1476121 (= c!136337 (or (= lt!644889 lt!644761) (= (bvadd lt!644889 lt!644889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476122 () Bool)

(assert (=> b!1476122 (and (bvsge (index!50918 lt!644890) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644890) (size!48441 lt!644760)))))

(declare-fun res!1002479 () Bool)

(assert (=> b!1476122 (= res!1002479 (= (select (arr!47891 lt!644760) (index!50918 lt!644890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476122 (=> res!1002479 e!828163)))

(declare-fun b!1476123 () Bool)

(assert (=> b!1476123 (= e!828160 (bvsge (x!132513 lt!644890) #b01111111111111111111111111111110))))

(declare-fun b!1476124 () Bool)

(assert (=> b!1476124 (= e!828160 e!828162)))

(declare-fun res!1002480 () Bool)

(assert (=> b!1476124 (= res!1002480 (and (is-Intermediate!12131 lt!644890) (not (undefined!12943 lt!644890)) (bvslt (x!132513 lt!644890) #b01111111111111111111111111111110) (bvsge (x!132513 lt!644890) #b00000000000000000000000000000000) (bvsge (x!132513 lt!644890) x!665)))))

(assert (=> b!1476124 (=> (not res!1002480) (not e!828162))))

(assert (= (and d!155913 c!136339) b!1476120))

(assert (= (and d!155913 (not c!136339)) b!1476121))

(assert (= (and b!1476121 c!136337) b!1476116))

(assert (= (and b!1476121 (not c!136337)) b!1476117))

(assert (= (and d!155913 c!136338) b!1476123))

(assert (= (and d!155913 (not c!136338)) b!1476124))

(assert (= (and b!1476124 res!1002480) b!1476119))

(assert (= (and b!1476119 (not res!1002481)) b!1476122))

(assert (= (and b!1476122 (not res!1002479)) b!1476118))

(assert (=> b!1476117 m!1362101))

(assert (=> b!1476117 m!1362101))

(declare-fun m!1362191 () Bool)

(assert (=> b!1476117 m!1362191))

(declare-fun m!1362193 () Bool)

(assert (=> b!1476118 m!1362193))

(assert (=> d!155913 m!1362109))

(assert (=> d!155913 m!1361915))

(assert (=> b!1476119 m!1362193))

(assert (=> b!1476122 m!1362193))

(assert (=> b!1475767 d!155913))

(declare-fun d!155933 () Bool)

(assert (=> d!155933 (= (validKeyInArray!0 (select (arr!47891 a!2862) j!93)) (and (not (= (select (arr!47891 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47891 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475776 d!155933))

(declare-fun b!1476125 () Bool)

(declare-fun e!828169 () SeekEntryResult!12131)

(assert (=> b!1476125 (= e!828169 (Intermediate!12131 false (toIndex!0 lt!644761 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155935 () Bool)

(declare-fun e!828165 () Bool)

(assert (=> d!155935 e!828165))

(declare-fun c!136341 () Bool)

(declare-fun lt!644892 () SeekEntryResult!12131)

(assert (=> d!155935 (= c!136341 (and (is-Intermediate!12131 lt!644892) (undefined!12943 lt!644892)))))

(declare-fun e!828166 () SeekEntryResult!12131)

(assert (=> d!155935 (= lt!644892 e!828166)))

(declare-fun c!136342 () Bool)

(assert (=> d!155935 (= c!136342 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644891 () (_ BitVec 64))

(assert (=> d!155935 (= lt!644891 (select (arr!47891 lt!644760) (toIndex!0 lt!644761 mask!2687)))))

(assert (=> d!155935 (validMask!0 mask!2687)))

(assert (=> d!155935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644761 mask!2687) lt!644761 lt!644760 mask!2687) lt!644892)))

(declare-fun b!1476126 () Bool)

(assert (=> b!1476126 (= e!828169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644761 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644761 lt!644760 mask!2687))))

(declare-fun b!1476127 () Bool)

(assert (=> b!1476127 (and (bvsge (index!50918 lt!644892) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644892) (size!48441 lt!644760)))))

(declare-fun e!828168 () Bool)

(assert (=> b!1476127 (= e!828168 (= (select (arr!47891 lt!644760) (index!50918 lt!644892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476128 () Bool)

(assert (=> b!1476128 (and (bvsge (index!50918 lt!644892) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644892) (size!48441 lt!644760)))))

(declare-fun res!1002484 () Bool)

(assert (=> b!1476128 (= res!1002484 (= (select (arr!47891 lt!644760) (index!50918 lt!644892)) lt!644761))))

(assert (=> b!1476128 (=> res!1002484 e!828168)))

(declare-fun e!828167 () Bool)

(assert (=> b!1476128 (= e!828167 e!828168)))

(declare-fun b!1476129 () Bool)

(assert (=> b!1476129 (= e!828166 (Intermediate!12131 true (toIndex!0 lt!644761 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476130 () Bool)

(assert (=> b!1476130 (= e!828166 e!828169)))

(declare-fun c!136340 () Bool)

(assert (=> b!1476130 (= c!136340 (or (= lt!644891 lt!644761) (= (bvadd lt!644891 lt!644891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476131 () Bool)

(assert (=> b!1476131 (and (bvsge (index!50918 lt!644892) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644892) (size!48441 lt!644760)))))

(declare-fun res!1002482 () Bool)

(assert (=> b!1476131 (= res!1002482 (= (select (arr!47891 lt!644760) (index!50918 lt!644892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476131 (=> res!1002482 e!828168)))

(declare-fun b!1476132 () Bool)

(assert (=> b!1476132 (= e!828165 (bvsge (x!132513 lt!644892) #b01111111111111111111111111111110))))

(declare-fun b!1476133 () Bool)

(assert (=> b!1476133 (= e!828165 e!828167)))

(declare-fun res!1002483 () Bool)

(assert (=> b!1476133 (= res!1002483 (and (is-Intermediate!12131 lt!644892) (not (undefined!12943 lt!644892)) (bvslt (x!132513 lt!644892) #b01111111111111111111111111111110) (bvsge (x!132513 lt!644892) #b00000000000000000000000000000000) (bvsge (x!132513 lt!644892) #b00000000000000000000000000000000)))))

(assert (=> b!1476133 (=> (not res!1002483) (not e!828167))))

(assert (= (and d!155935 c!136342) b!1476129))

(assert (= (and d!155935 (not c!136342)) b!1476130))

(assert (= (and b!1476130 c!136340) b!1476125))

(assert (= (and b!1476130 (not c!136340)) b!1476126))

(assert (= (and d!155935 c!136341) b!1476132))

(assert (= (and d!155935 (not c!136341)) b!1476133))

(assert (= (and b!1476133 res!1002483) b!1476128))

(assert (= (and b!1476128 (not res!1002484)) b!1476131))

(assert (= (and b!1476131 (not res!1002482)) b!1476127))

(assert (=> b!1476126 m!1361931))

(declare-fun m!1362195 () Bool)

(assert (=> b!1476126 m!1362195))

(assert (=> b!1476126 m!1362195))

(declare-fun m!1362197 () Bool)

(assert (=> b!1476126 m!1362197))

(declare-fun m!1362199 () Bool)

(assert (=> b!1476127 m!1362199))

(assert (=> d!155935 m!1361931))

(declare-fun m!1362201 () Bool)

(assert (=> d!155935 m!1362201))

(assert (=> d!155935 m!1361915))

(assert (=> b!1476128 m!1362199))

(assert (=> b!1476131 m!1362199))

(assert (=> b!1475774 d!155935))

(declare-fun d!155937 () Bool)

(declare-fun lt!644898 () (_ BitVec 32))

(declare-fun lt!644897 () (_ BitVec 32))

(assert (=> d!155937 (= lt!644898 (bvmul (bvxor lt!644897 (bvlshr lt!644897 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155937 (= lt!644897 ((_ extract 31 0) (bvand (bvxor lt!644761 (bvlshr lt!644761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155937 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002485 (let ((h!35757 ((_ extract 31 0) (bvand (bvxor lt!644761 (bvlshr lt!644761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132522 (bvmul (bvxor h!35757 (bvlshr h!35757 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132522 (bvlshr x!132522 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002485 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002485 #b00000000000000000000000000000000))))))

(assert (=> d!155937 (= (toIndex!0 lt!644761 mask!2687) (bvand (bvxor lt!644898 (bvlshr lt!644898 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475774 d!155937))

(declare-fun d!155939 () Bool)

(assert (=> d!155939 (= (validKeyInArray!0 (select (arr!47891 a!2862) i!1006)) (and (not (= (select (arr!47891 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47891 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475775 d!155939))

(declare-fun d!155941 () Bool)

(assert (=> d!155941 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126058 d!155941))

(declare-fun d!155943 () Bool)

(assert (=> d!155943 (= (array_inv!36919 a!2862) (bvsge (size!48441 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126058 d!155943))

(declare-fun b!1476193 () Bool)

(declare-fun e!828204 () Bool)

(declare-fun call!67811 () Bool)

(assert (=> b!1476193 (= e!828204 call!67811)))

(declare-fun b!1476194 () Bool)

(declare-fun e!828205 () Bool)

(assert (=> b!1476194 (= e!828204 e!828205)))

(declare-fun lt!644926 () (_ BitVec 64))

(assert (=> b!1476194 (= lt!644926 (select (arr!47891 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644928 () Unit!49602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99221 (_ BitVec 64) (_ BitVec 32)) Unit!49602)

(assert (=> b!1476194 (= lt!644928 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644926 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1476194 (arrayContainsKey!0 a!2862 lt!644926 #b00000000000000000000000000000000)))

(declare-fun lt!644927 () Unit!49602)

(assert (=> b!1476194 (= lt!644927 lt!644928)))

(declare-fun res!1002506 () Bool)

(assert (=> b!1476194 (= res!1002506 (= (seekEntryOrOpen!0 (select (arr!47891 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12131 #b00000000000000000000000000000000)))))

(assert (=> b!1476194 (=> (not res!1002506) (not e!828205))))

(declare-fun b!1476195 () Bool)

(assert (=> b!1476195 (= e!828205 call!67811)))

(declare-fun d!155945 () Bool)

(declare-fun res!1002507 () Bool)

(declare-fun e!828206 () Bool)

(assert (=> d!155945 (=> res!1002507 e!828206)))

(assert (=> d!155945 (= res!1002507 (bvsge #b00000000000000000000000000000000 (size!48441 a!2862)))))

(assert (=> d!155945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!828206)))

(declare-fun b!1476196 () Bool)

(assert (=> b!1476196 (= e!828206 e!828204)))

(declare-fun c!136363 () Bool)

(assert (=> b!1476196 (= c!136363 (validKeyInArray!0 (select (arr!47891 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67808 () Bool)

(assert (=> bm!67808 (= call!67811 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155945 (not res!1002507)) b!1476196))

(assert (= (and b!1476196 c!136363) b!1476194))

(assert (= (and b!1476196 (not c!136363)) b!1476193))

(assert (= (and b!1476194 res!1002506) b!1476195))

(assert (= (or b!1476195 b!1476193) bm!67808))

(declare-fun m!1362223 () Bool)

(assert (=> b!1476194 m!1362223))

(declare-fun m!1362225 () Bool)

(assert (=> b!1476194 m!1362225))

(declare-fun m!1362227 () Bool)

(assert (=> b!1476194 m!1362227))

(assert (=> b!1476194 m!1362223))

(declare-fun m!1362229 () Bool)

(assert (=> b!1476194 m!1362229))

(assert (=> b!1476196 m!1362223))

(assert (=> b!1476196 m!1362223))

(declare-fun m!1362235 () Bool)

(assert (=> b!1476196 m!1362235))

(declare-fun m!1362239 () Bool)

(assert (=> bm!67808 m!1362239))

(assert (=> b!1475773 d!155945))

(declare-fun e!828211 () SeekEntryResult!12131)

(declare-fun b!1476197 () Bool)

(assert (=> b!1476197 (= e!828211 (Intermediate!12131 false (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155959 () Bool)

(declare-fun e!828207 () Bool)

(assert (=> d!155959 e!828207))

(declare-fun c!136365 () Bool)

(declare-fun lt!644930 () SeekEntryResult!12131)

(assert (=> d!155959 (= c!136365 (and (is-Intermediate!12131 lt!644930) (undefined!12943 lt!644930)))))

(declare-fun e!828208 () SeekEntryResult!12131)

(assert (=> d!155959 (= lt!644930 e!828208)))

(declare-fun c!136366 () Bool)

(assert (=> d!155959 (= c!136366 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644929 () (_ BitVec 64))

(assert (=> d!155959 (= lt!644929 (select (arr!47891 a!2862) (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687)))))

(assert (=> d!155959 (validMask!0 mask!2687)))

(assert (=> d!155959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) (select (arr!47891 a!2862) j!93) a!2862 mask!2687) lt!644930)))

(declare-fun b!1476198 () Bool)

(assert (=> b!1476198 (= e!828211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47891 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476199 () Bool)

(assert (=> b!1476199 (and (bvsge (index!50918 lt!644930) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644930) (size!48441 a!2862)))))

(declare-fun e!828210 () Bool)

(assert (=> b!1476199 (= e!828210 (= (select (arr!47891 a!2862) (index!50918 lt!644930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476200 () Bool)

(assert (=> b!1476200 (and (bvsge (index!50918 lt!644930) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644930) (size!48441 a!2862)))))

(declare-fun res!1002510 () Bool)

(assert (=> b!1476200 (= res!1002510 (= (select (arr!47891 a!2862) (index!50918 lt!644930)) (select (arr!47891 a!2862) j!93)))))

(assert (=> b!1476200 (=> res!1002510 e!828210)))

(declare-fun e!828209 () Bool)

(assert (=> b!1476200 (= e!828209 e!828210)))

(declare-fun b!1476201 () Bool)

(assert (=> b!1476201 (= e!828208 (Intermediate!12131 true (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476202 () Bool)

(assert (=> b!1476202 (= e!828208 e!828211)))

(declare-fun c!136364 () Bool)

(assert (=> b!1476202 (= c!136364 (or (= lt!644929 (select (arr!47891 a!2862) j!93)) (= (bvadd lt!644929 lt!644929) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476203 () Bool)

(assert (=> b!1476203 (and (bvsge (index!50918 lt!644930) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644930) (size!48441 a!2862)))))

(declare-fun res!1002508 () Bool)

(assert (=> b!1476203 (= res!1002508 (= (select (arr!47891 a!2862) (index!50918 lt!644930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476203 (=> res!1002508 e!828210)))

(declare-fun b!1476204 () Bool)

(assert (=> b!1476204 (= e!828207 (bvsge (x!132513 lt!644930) #b01111111111111111111111111111110))))

(declare-fun b!1476205 () Bool)

(assert (=> b!1476205 (= e!828207 e!828209)))

(declare-fun res!1002509 () Bool)

(assert (=> b!1476205 (= res!1002509 (and (is-Intermediate!12131 lt!644930) (not (undefined!12943 lt!644930)) (bvslt (x!132513 lt!644930) #b01111111111111111111111111111110) (bvsge (x!132513 lt!644930) #b00000000000000000000000000000000) (bvsge (x!132513 lt!644930) #b00000000000000000000000000000000)))))

(assert (=> b!1476205 (=> (not res!1002509) (not e!828209))))

(assert (= (and d!155959 c!136366) b!1476201))

(assert (= (and d!155959 (not c!136366)) b!1476202))

(assert (= (and b!1476202 c!136364) b!1476197))

(assert (= (and b!1476202 (not c!136364)) b!1476198))

(assert (= (and d!155959 c!136365) b!1476204))

(assert (= (and d!155959 (not c!136365)) b!1476205))

(assert (= (and b!1476205 res!1002509) b!1476200))

(assert (= (and b!1476200 (not res!1002510)) b!1476203))

(assert (= (and b!1476203 (not res!1002508)) b!1476199))

(assert (=> b!1476198 m!1361957))

(declare-fun m!1362245 () Bool)

(assert (=> b!1476198 m!1362245))

(assert (=> b!1476198 m!1362245))

(assert (=> b!1476198 m!1361919))

(declare-fun m!1362247 () Bool)

(assert (=> b!1476198 m!1362247))

(declare-fun m!1362249 () Bool)

(assert (=> b!1476199 m!1362249))

(assert (=> d!155959 m!1361957))

(declare-fun m!1362251 () Bool)

(assert (=> d!155959 m!1362251))

(assert (=> d!155959 m!1361915))

(assert (=> b!1476200 m!1362249))

(assert (=> b!1476203 m!1362249))

(assert (=> b!1475772 d!155959))

(declare-fun d!155963 () Bool)

(declare-fun lt!644932 () (_ BitVec 32))

(declare-fun lt!644931 () (_ BitVec 32))

(assert (=> d!155963 (= lt!644932 (bvmul (bvxor lt!644931 (bvlshr lt!644931 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155963 (= lt!644931 ((_ extract 31 0) (bvand (bvxor (select (arr!47891 a!2862) j!93) (bvlshr (select (arr!47891 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155963 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002485 (let ((h!35757 ((_ extract 31 0) (bvand (bvxor (select (arr!47891 a!2862) j!93) (bvlshr (select (arr!47891 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132522 (bvmul (bvxor h!35757 (bvlshr h!35757 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132522 (bvlshr x!132522 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002485 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002485 #b00000000000000000000000000000000))))))

(assert (=> d!155963 (= (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) (bvand (bvxor lt!644932 (bvlshr lt!644932 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475772 d!155963))

(declare-fun b!1476224 () Bool)

(declare-fun e!828228 () Bool)

(declare-fun call!67816 () Bool)

(assert (=> b!1476224 (= e!828228 call!67816)))

(declare-fun b!1476225 () Bool)

(declare-fun e!828226 () Bool)

(declare-fun contains!9909 (List!34392 (_ BitVec 64)) Bool)

(assert (=> b!1476225 (= e!828226 (contains!9909 Nil!34389 (select (arr!47891 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1476226 () Bool)

(declare-fun e!828227 () Bool)

(assert (=> b!1476226 (= e!828227 e!828228)))

(declare-fun c!136371 () Bool)

(assert (=> b!1476226 (= c!136371 (validKeyInArray!0 (select (arr!47891 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67813 () Bool)

(assert (=> bm!67813 (= call!67816 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136371 (Cons!34388 (select (arr!47891 a!2862) #b00000000000000000000000000000000) Nil!34389) Nil!34389)))))

(declare-fun b!1476227 () Bool)

(declare-fun e!828229 () Bool)

(assert (=> b!1476227 (= e!828229 e!828227)))

(declare-fun res!1002523 () Bool)

(assert (=> b!1476227 (=> (not res!1002523) (not e!828227))))

(assert (=> b!1476227 (= res!1002523 (not e!828226))))

(declare-fun res!1002522 () Bool)

(assert (=> b!1476227 (=> (not res!1002522) (not e!828226))))

(assert (=> b!1476227 (= res!1002522 (validKeyInArray!0 (select (arr!47891 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1476228 () Bool)

(assert (=> b!1476228 (= e!828228 call!67816)))

(declare-fun d!155965 () Bool)

(declare-fun res!1002521 () Bool)

(assert (=> d!155965 (=> res!1002521 e!828229)))

(assert (=> d!155965 (= res!1002521 (bvsge #b00000000000000000000000000000000 (size!48441 a!2862)))))

(assert (=> d!155965 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34389) e!828229)))

(assert (= (and d!155965 (not res!1002521)) b!1476227))

(assert (= (and b!1476227 res!1002522) b!1476225))

(assert (= (and b!1476227 res!1002523) b!1476226))

(assert (= (and b!1476226 c!136371) b!1476224))

(assert (= (and b!1476226 (not c!136371)) b!1476228))

(assert (= (or b!1476224 b!1476228) bm!67813))

(assert (=> b!1476225 m!1362223))

(assert (=> b!1476225 m!1362223))

(declare-fun m!1362253 () Bool)

(assert (=> b!1476225 m!1362253))

(assert (=> b!1476226 m!1362223))

(assert (=> b!1476226 m!1362223))

(assert (=> b!1476226 m!1362235))

(assert (=> bm!67813 m!1362223))

(declare-fun m!1362255 () Bool)

(assert (=> bm!67813 m!1362255))

(assert (=> b!1476227 m!1362223))

(assert (=> b!1476227 m!1362223))

(assert (=> b!1476227 m!1362235))

(assert (=> b!1475783 d!155965))

(declare-fun b!1476229 () Bool)

(declare-fun e!828234 () SeekEntryResult!12131)

(assert (=> b!1476229 (= e!828234 (Intermediate!12131 false index!646 x!665))))

(declare-fun d!155967 () Bool)

(declare-fun e!828230 () Bool)

(assert (=> d!155967 e!828230))

(declare-fun c!136373 () Bool)

(declare-fun lt!644940 () SeekEntryResult!12131)

(assert (=> d!155967 (= c!136373 (and (is-Intermediate!12131 lt!644940) (undefined!12943 lt!644940)))))

(declare-fun e!828231 () SeekEntryResult!12131)

(assert (=> d!155967 (= lt!644940 e!828231)))

(declare-fun c!136374 () Bool)

(assert (=> d!155967 (= c!136374 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644939 () (_ BitVec 64))

(assert (=> d!155967 (= lt!644939 (select (arr!47891 a!2862) index!646))))

(assert (=> d!155967 (validMask!0 mask!2687)))

(assert (=> d!155967 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47891 a!2862) j!93) a!2862 mask!2687) lt!644940)))

(declare-fun b!1476230 () Bool)

(assert (=> b!1476230 (= e!828234 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47891 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476231 () Bool)

(assert (=> b!1476231 (and (bvsge (index!50918 lt!644940) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644940) (size!48441 a!2862)))))

(declare-fun e!828233 () Bool)

(assert (=> b!1476231 (= e!828233 (= (select (arr!47891 a!2862) (index!50918 lt!644940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476232 () Bool)

(assert (=> b!1476232 (and (bvsge (index!50918 lt!644940) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644940) (size!48441 a!2862)))))

(declare-fun res!1002526 () Bool)

(assert (=> b!1476232 (= res!1002526 (= (select (arr!47891 a!2862) (index!50918 lt!644940)) (select (arr!47891 a!2862) j!93)))))

(assert (=> b!1476232 (=> res!1002526 e!828233)))

(declare-fun e!828232 () Bool)

(assert (=> b!1476232 (= e!828232 e!828233)))

(declare-fun b!1476233 () Bool)

(assert (=> b!1476233 (= e!828231 (Intermediate!12131 true index!646 x!665))))

(declare-fun b!1476234 () Bool)

(assert (=> b!1476234 (= e!828231 e!828234)))

(declare-fun c!136372 () Bool)

(assert (=> b!1476234 (= c!136372 (or (= lt!644939 (select (arr!47891 a!2862) j!93)) (= (bvadd lt!644939 lt!644939) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476235 () Bool)

(assert (=> b!1476235 (and (bvsge (index!50918 lt!644940) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644940) (size!48441 a!2862)))))

(declare-fun res!1002524 () Bool)

(assert (=> b!1476235 (= res!1002524 (= (select (arr!47891 a!2862) (index!50918 lt!644940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476235 (=> res!1002524 e!828233)))

(declare-fun b!1476236 () Bool)

(assert (=> b!1476236 (= e!828230 (bvsge (x!132513 lt!644940) #b01111111111111111111111111111110))))

(declare-fun b!1476237 () Bool)

(assert (=> b!1476237 (= e!828230 e!828232)))

(declare-fun res!1002525 () Bool)

(assert (=> b!1476237 (= res!1002525 (and (is-Intermediate!12131 lt!644940) (not (undefined!12943 lt!644940)) (bvslt (x!132513 lt!644940) #b01111111111111111111111111111110) (bvsge (x!132513 lt!644940) #b00000000000000000000000000000000) (bvsge (x!132513 lt!644940) x!665)))))

(assert (=> b!1476237 (=> (not res!1002525) (not e!828232))))

(assert (= (and d!155967 c!136374) b!1476233))

(assert (= (and d!155967 (not c!136374)) b!1476234))

(assert (= (and b!1476234 c!136372) b!1476229))

(assert (= (and b!1476234 (not c!136372)) b!1476230))

(assert (= (and d!155967 c!136373) b!1476236))

(assert (= (and d!155967 (not c!136373)) b!1476237))

(assert (= (and b!1476237 res!1002525) b!1476232))

(assert (= (and b!1476232 (not res!1002526)) b!1476235))

(assert (= (and b!1476235 (not res!1002524)) b!1476231))

(assert (=> b!1476230 m!1362101))

(assert (=> b!1476230 m!1362101))

(assert (=> b!1476230 m!1361919))

(declare-fun m!1362259 () Bool)

(assert (=> b!1476230 m!1362259))

(declare-fun m!1362263 () Bool)

(assert (=> b!1476231 m!1362263))

(assert (=> d!155967 m!1361937))

(assert (=> d!155967 m!1361915))

(assert (=> b!1476232 m!1362263))

(assert (=> b!1476235 m!1362263))

(assert (=> b!1475771 d!155967))

(declare-fun lt!644946 () SeekEntryResult!12131)

(declare-fun b!1476242 () Bool)

(declare-fun e!828239 () SeekEntryResult!12131)

(assert (=> b!1476242 (= e!828239 (seekKeyOrZeroReturnVacant!0 (x!132513 lt!644946) (index!50918 lt!644946) (index!50918 lt!644946) (select (arr!47891 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476243 () Bool)

(declare-fun e!828238 () SeekEntryResult!12131)

(assert (=> b!1476243 (= e!828238 Undefined!12131)))

(declare-fun d!155971 () Bool)

(declare-fun lt!644945 () SeekEntryResult!12131)

(assert (=> d!155971 (and (or (is-Undefined!12131 lt!644945) (not (is-Found!12131 lt!644945)) (and (bvsge (index!50917 lt!644945) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644945) (size!48441 a!2862)))) (or (is-Undefined!12131 lt!644945) (is-Found!12131 lt!644945) (not (is-MissingZero!12131 lt!644945)) (and (bvsge (index!50916 lt!644945) #b00000000000000000000000000000000) (bvslt (index!50916 lt!644945) (size!48441 a!2862)))) (or (is-Undefined!12131 lt!644945) (is-Found!12131 lt!644945) (is-MissingZero!12131 lt!644945) (not (is-MissingVacant!12131 lt!644945)) (and (bvsge (index!50919 lt!644945) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644945) (size!48441 a!2862)))) (or (is-Undefined!12131 lt!644945) (ite (is-Found!12131 lt!644945) (= (select (arr!47891 a!2862) (index!50917 lt!644945)) (select (arr!47891 a!2862) j!93)) (ite (is-MissingZero!12131 lt!644945) (= (select (arr!47891 a!2862) (index!50916 lt!644945)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12131 lt!644945) (= (select (arr!47891 a!2862) (index!50919 lt!644945)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155971 (= lt!644945 e!828238)))

(declare-fun c!136377 () Bool)

(assert (=> d!155971 (= c!136377 (and (is-Intermediate!12131 lt!644946) (undefined!12943 lt!644946)))))

(assert (=> d!155971 (= lt!644946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47891 a!2862) j!93) mask!2687) (select (arr!47891 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155971 (validMask!0 mask!2687)))

(assert (=> d!155971 (= (seekEntryOrOpen!0 (select (arr!47891 a!2862) j!93) a!2862 mask!2687) lt!644945)))

(declare-fun b!1476244 () Bool)

(declare-fun c!136378 () Bool)

(declare-fun lt!644944 () (_ BitVec 64))

(assert (=> b!1476244 (= c!136378 (= lt!644944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828240 () SeekEntryResult!12131)

(assert (=> b!1476244 (= e!828240 e!828239)))

(declare-fun b!1476245 () Bool)

(assert (=> b!1476245 (= e!828238 e!828240)))

(assert (=> b!1476245 (= lt!644944 (select (arr!47891 a!2862) (index!50918 lt!644946)))))

(declare-fun c!136376 () Bool)

(assert (=> b!1476245 (= c!136376 (= lt!644944 (select (arr!47891 a!2862) j!93)))))

(declare-fun b!1476246 () Bool)

(assert (=> b!1476246 (= e!828239 (MissingZero!12131 (index!50918 lt!644946)))))

(declare-fun b!1476247 () Bool)

(assert (=> b!1476247 (= e!828240 (Found!12131 (index!50918 lt!644946)))))

