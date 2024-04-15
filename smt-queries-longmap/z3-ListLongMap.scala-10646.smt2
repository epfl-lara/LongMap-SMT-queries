; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124984 () Bool)

(assert start!124984)

(declare-fun b!1453911 () Bool)

(declare-fun e!818256 () Bool)

(declare-fun e!818264 () Bool)

(assert (=> b!1453911 (= e!818256 e!818264)))

(declare-fun res!984949 () Bool)

(assert (=> b!1453911 (=> (not res!984949) (not e!818264))))

(declare-datatypes ((array!98410 0))(
  ( (array!98411 (arr!47494 (Array (_ BitVec 32) (_ BitVec 64))) (size!48046 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98410)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11771 0))(
  ( (MissingZero!11771 (index!49476 (_ BitVec 32))) (Found!11771 (index!49477 (_ BitVec 32))) (Intermediate!11771 (undefined!12583 Bool) (index!49478 (_ BitVec 32)) (x!131111 (_ BitVec 32))) (Undefined!11771) (MissingVacant!11771 (index!49479 (_ BitVec 32))) )
))
(declare-fun lt!637238 () SeekEntryResult!11771)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98410 (_ BitVec 32)) SeekEntryResult!11771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453911 (= res!984949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47494 a!2862) j!93) mask!2687) (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!637238))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453911 (= lt!637238 (Intermediate!11771 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453912 () Bool)

(declare-fun res!984939 () Bool)

(declare-fun e!818262 () Bool)

(assert (=> b!1453912 (=> (not res!984939) (not e!818262))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453912 (= res!984939 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!637234 () (_ BitVec 32))

(declare-fun lt!637233 () (_ BitVec 64))

(declare-fun e!818258 () Bool)

(declare-fun lt!637232 () array!98410)

(declare-fun b!1453913 () Bool)

(declare-fun lt!637239 () SeekEntryResult!11771)

(assert (=> b!1453913 (= e!818258 (not (= lt!637239 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637234 lt!637233 lt!637232 mask!2687))))))

(declare-fun b!1453914 () Bool)

(declare-fun res!984941 () Bool)

(declare-fun e!818257 () Bool)

(assert (=> b!1453914 (=> (not res!984941) (not e!818257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453914 (= res!984941 (validKeyInArray!0 (select (arr!47494 a!2862) j!93)))))

(declare-fun b!1453915 () Bool)

(declare-fun res!984942 () Bool)

(assert (=> b!1453915 (=> (not res!984942) (not e!818264))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1453915 (= res!984942 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!637238))))

(declare-fun b!1453916 () Bool)

(declare-fun res!984936 () Bool)

(assert (=> b!1453916 (=> (not res!984936) (not e!818262))))

(declare-fun e!818263 () Bool)

(assert (=> b!1453916 (= res!984936 e!818263)))

(declare-fun c!134002 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453916 (= c!134002 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453917 () Bool)

(declare-fun res!984945 () Bool)

(declare-fun e!818259 () Bool)

(assert (=> b!1453917 (=> res!984945 e!818259)))

(assert (=> b!1453917 (= res!984945 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637234 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!637238)))))

(declare-fun b!1453918 () Bool)

(declare-fun res!984940 () Bool)

(assert (=> b!1453918 (=> (not res!984940) (not e!818257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98410 (_ BitVec 32)) Bool)

(assert (=> b!1453918 (= res!984940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453919 () Bool)

(assert (=> b!1453919 (= e!818263 (= lt!637239 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637233 lt!637232 mask!2687)))))

(declare-fun b!1453920 () Bool)

(declare-fun res!984950 () Bool)

(assert (=> b!1453920 (=> (not res!984950) (not e!818257))))

(assert (=> b!1453920 (= res!984950 (validKeyInArray!0 (select (arr!47494 a!2862) i!1006)))))

(declare-fun b!1453921 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98410 (_ BitVec 32)) SeekEntryResult!11771)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98410 (_ BitVec 32)) SeekEntryResult!11771)

(assert (=> b!1453921 (= e!818263 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637233 lt!637232 mask!2687) (seekEntryOrOpen!0 lt!637233 lt!637232 mask!2687)))))

(declare-fun b!1453922 () Bool)

(declare-fun lt!637237 () SeekEntryResult!11771)

(assert (=> b!1453922 (= e!818258 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637234 intermediateAfterIndex!19 lt!637233 lt!637232 mask!2687) lt!637237)))))

(declare-fun res!984944 () Bool)

(assert (=> start!124984 (=> (not res!984944) (not e!818257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124984 (= res!984944 (validMask!0 mask!2687))))

(assert (=> start!124984 e!818257))

(assert (=> start!124984 true))

(declare-fun array_inv!36727 (array!98410) Bool)

(assert (=> start!124984 (array_inv!36727 a!2862)))

(declare-fun b!1453923 () Bool)

(declare-fun res!984952 () Bool)

(declare-fun e!818265 () Bool)

(assert (=> b!1453923 (=> (not res!984952) (not e!818265))))

(assert (=> b!1453923 (= res!984952 (= (seekEntryOrOpen!0 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) (Found!11771 j!93)))))

(declare-fun b!1453924 () Bool)

(declare-fun res!984946 () Bool)

(assert (=> b!1453924 (=> (not res!984946) (not e!818257))))

(assert (=> b!1453924 (= res!984946 (and (= (size!48046 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48046 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48046 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453925 () Bool)

(declare-fun e!818261 () Bool)

(assert (=> b!1453925 (= e!818261 e!818259)))

(declare-fun res!984948 () Bool)

(assert (=> b!1453925 (=> res!984948 e!818259)))

(assert (=> b!1453925 (= res!984948 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637234 #b00000000000000000000000000000000) (bvsge lt!637234 (size!48046 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453925 (= lt!637234 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453925 (= lt!637237 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637233 lt!637232 mask!2687))))

(assert (=> b!1453925 (= lt!637237 (seekEntryOrOpen!0 lt!637233 lt!637232 mask!2687))))

(declare-fun b!1453926 () Bool)

(declare-fun res!984943 () Bool)

(assert (=> b!1453926 (=> (not res!984943) (not e!818257))))

(declare-datatypes ((List!34073 0))(
  ( (Nil!34070) (Cons!34069 (h!35419 (_ BitVec 64)) (t!48759 List!34073)) )
))
(declare-fun arrayNoDuplicates!0 (array!98410 (_ BitVec 32) List!34073) Bool)

(assert (=> b!1453926 (= res!984943 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34070))))

(declare-fun b!1453927 () Bool)

(assert (=> b!1453927 (= e!818257 e!818256)))

(declare-fun res!984947 () Bool)

(assert (=> b!1453927 (=> (not res!984947) (not e!818256))))

(assert (=> b!1453927 (= res!984947 (= (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453927 (= lt!637232 (array!98411 (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48046 a!2862)))))

(declare-fun b!1453928 () Bool)

(assert (=> b!1453928 (= e!818264 e!818262)))

(declare-fun res!984938 () Bool)

(assert (=> b!1453928 (=> (not res!984938) (not e!818262))))

(assert (=> b!1453928 (= res!984938 (= lt!637239 (Intermediate!11771 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453928 (= lt!637239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637233 mask!2687) lt!637233 lt!637232 mask!2687))))

(assert (=> b!1453928 (= lt!637233 (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453929 () Bool)

(assert (=> b!1453929 (= e!818265 (and (or (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) (select (arr!47494 a!2862) j!93))) (let ((bdg!53035 (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47494 a!2862) index!646) bdg!53035) (= (select (arr!47494 a!2862) index!646) (select (arr!47494 a!2862) j!93))) (= (select (arr!47494 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53035 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453930 () Bool)

(declare-fun res!984937 () Bool)

(assert (=> b!1453930 (=> (not res!984937) (not e!818257))))

(assert (=> b!1453930 (= res!984937 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48046 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48046 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48046 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453931 () Bool)

(assert (=> b!1453931 (= e!818262 (not e!818261))))

(declare-fun res!984951 () Bool)

(assert (=> b!1453931 (=> res!984951 e!818261)))

(assert (=> b!1453931 (= res!984951 (or (and (= (select (arr!47494 a!2862) index!646) (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47494 a!2862) index!646) (select (arr!47494 a!2862) j!93))) (= (select (arr!47494 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453931 e!818265))

(declare-fun res!984935 () Bool)

(assert (=> b!1453931 (=> (not res!984935) (not e!818265))))

(assert (=> b!1453931 (= res!984935 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48879 0))(
  ( (Unit!48880) )
))
(declare-fun lt!637235 () Unit!48879)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48879)

(assert (=> b!1453931 (= lt!637235 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453932 () Bool)

(assert (=> b!1453932 (= e!818259 true)))

(declare-fun lt!637236 () Bool)

(assert (=> b!1453932 (= lt!637236 e!818258)))

(declare-fun c!134001 () Bool)

(assert (=> b!1453932 (= c!134001 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!124984 res!984944) b!1453924))

(assert (= (and b!1453924 res!984946) b!1453920))

(assert (= (and b!1453920 res!984950) b!1453914))

(assert (= (and b!1453914 res!984941) b!1453918))

(assert (= (and b!1453918 res!984940) b!1453926))

(assert (= (and b!1453926 res!984943) b!1453930))

(assert (= (and b!1453930 res!984937) b!1453927))

(assert (= (and b!1453927 res!984947) b!1453911))

(assert (= (and b!1453911 res!984949) b!1453915))

(assert (= (and b!1453915 res!984942) b!1453928))

(assert (= (and b!1453928 res!984938) b!1453916))

(assert (= (and b!1453916 c!134002) b!1453919))

(assert (= (and b!1453916 (not c!134002)) b!1453921))

(assert (= (and b!1453916 res!984936) b!1453912))

(assert (= (and b!1453912 res!984939) b!1453931))

(assert (= (and b!1453931 res!984935) b!1453923))

(assert (= (and b!1453923 res!984952) b!1453929))

(assert (= (and b!1453931 (not res!984951)) b!1453925))

(assert (= (and b!1453925 (not res!984948)) b!1453917))

(assert (= (and b!1453917 (not res!984945)) b!1453932))

(assert (= (and b!1453932 c!134001) b!1453913))

(assert (= (and b!1453932 (not c!134001)) b!1453922))

(declare-fun m!1341813 () Bool)

(assert (=> b!1453922 m!1341813))

(declare-fun m!1341815 () Bool)

(assert (=> b!1453915 m!1341815))

(assert (=> b!1453915 m!1341815))

(declare-fun m!1341817 () Bool)

(assert (=> b!1453915 m!1341817))

(declare-fun m!1341819 () Bool)

(assert (=> start!124984 m!1341819))

(declare-fun m!1341821 () Bool)

(assert (=> start!124984 m!1341821))

(declare-fun m!1341823 () Bool)

(assert (=> b!1453927 m!1341823))

(declare-fun m!1341825 () Bool)

(assert (=> b!1453927 m!1341825))

(assert (=> b!1453923 m!1341815))

(assert (=> b!1453923 m!1341815))

(declare-fun m!1341827 () Bool)

(assert (=> b!1453923 m!1341827))

(declare-fun m!1341829 () Bool)

(assert (=> b!1453926 m!1341829))

(declare-fun m!1341831 () Bool)

(assert (=> b!1453931 m!1341831))

(assert (=> b!1453931 m!1341823))

(declare-fun m!1341833 () Bool)

(assert (=> b!1453931 m!1341833))

(declare-fun m!1341835 () Bool)

(assert (=> b!1453931 m!1341835))

(declare-fun m!1341837 () Bool)

(assert (=> b!1453931 m!1341837))

(assert (=> b!1453931 m!1341815))

(declare-fun m!1341839 () Bool)

(assert (=> b!1453928 m!1341839))

(assert (=> b!1453928 m!1341839))

(declare-fun m!1341841 () Bool)

(assert (=> b!1453928 m!1341841))

(assert (=> b!1453928 m!1341823))

(declare-fun m!1341843 () Bool)

(assert (=> b!1453928 m!1341843))

(declare-fun m!1341845 () Bool)

(assert (=> b!1453920 m!1341845))

(assert (=> b!1453920 m!1341845))

(declare-fun m!1341847 () Bool)

(assert (=> b!1453920 m!1341847))

(declare-fun m!1341849 () Bool)

(assert (=> b!1453925 m!1341849))

(declare-fun m!1341851 () Bool)

(assert (=> b!1453925 m!1341851))

(declare-fun m!1341853 () Bool)

(assert (=> b!1453925 m!1341853))

(declare-fun m!1341855 () Bool)

(assert (=> b!1453919 m!1341855))

(assert (=> b!1453911 m!1341815))

(assert (=> b!1453911 m!1341815))

(declare-fun m!1341857 () Bool)

(assert (=> b!1453911 m!1341857))

(assert (=> b!1453911 m!1341857))

(assert (=> b!1453911 m!1341815))

(declare-fun m!1341859 () Bool)

(assert (=> b!1453911 m!1341859))

(assert (=> b!1453921 m!1341851))

(assert (=> b!1453921 m!1341853))

(assert (=> b!1453929 m!1341823))

(declare-fun m!1341861 () Bool)

(assert (=> b!1453929 m!1341861))

(assert (=> b!1453929 m!1341833))

(assert (=> b!1453929 m!1341835))

(assert (=> b!1453929 m!1341815))

(assert (=> b!1453914 m!1341815))

(assert (=> b!1453914 m!1341815))

(declare-fun m!1341863 () Bool)

(assert (=> b!1453914 m!1341863))

(declare-fun m!1341865 () Bool)

(assert (=> b!1453918 m!1341865))

(assert (=> b!1453917 m!1341815))

(assert (=> b!1453917 m!1341815))

(declare-fun m!1341867 () Bool)

(assert (=> b!1453917 m!1341867))

(declare-fun m!1341869 () Bool)

(assert (=> b!1453913 m!1341869))

(check-sat (not b!1453913) (not b!1453918) (not start!124984) (not b!1453919) (not b!1453920) (not b!1453915) (not b!1453922) (not b!1453921) (not b!1453925) (not b!1453911) (not b!1453923) (not b!1453926) (not b!1453928) (not b!1453914) (not b!1453931) (not b!1453917))
(check-sat)
