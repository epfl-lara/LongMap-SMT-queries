; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125098 () Bool)

(assert start!125098)

(declare-fun b!1456878 () Bool)

(declare-fun res!987281 () Bool)

(declare-fun e!819633 () Bool)

(assert (=> b!1456878 (=> (not res!987281) (not e!819633))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1456878 (= res!987281 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1456879 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98546 0))(
  ( (array!98547 (arr!47561 (Array (_ BitVec 32) (_ BitVec 64))) (size!48111 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98546)

(declare-fun e!819638 () Bool)

(assert (=> b!1456879 (= e!819638 (and (or (= (select (arr!47561 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47561 a!2862) intermediateBeforeIndex!19) (select (arr!47561 a!2862) j!93))) (let ((bdg!53287 (select (store (arr!47561 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47561 a!2862) index!646) bdg!53287) (= (select (arr!47561 a!2862) index!646) (select (arr!47561 a!2862) j!93))) (= (select (arr!47561 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53287 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456880 () Bool)

(declare-fun res!987294 () Bool)

(declare-fun e!819634 () Bool)

(assert (=> b!1456880 (=> (not res!987294) (not e!819634))))

(declare-datatypes ((List!34062 0))(
  ( (Nil!34059) (Cons!34058 (h!35408 (_ BitVec 64)) (t!48756 List!34062)) )
))
(declare-fun arrayNoDuplicates!0 (array!98546 (_ BitVec 32) List!34062) Bool)

(assert (=> b!1456880 (= res!987294 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34059))))

(declare-fun b!1456882 () Bool)

(declare-fun e!819637 () Bool)

(declare-fun e!819639 () Bool)

(assert (=> b!1456882 (= e!819637 e!819639)))

(declare-fun res!987298 () Bool)

(assert (=> b!1456882 (=> res!987298 e!819639)))

(declare-fun lt!638475 () (_ BitVec 32))

(assert (=> b!1456882 (= res!987298 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638475 #b00000000000000000000000000000000) (bvsge lt!638475 (size!48111 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456882 (= lt!638475 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638479 () (_ BitVec 64))

(declare-fun lt!638477 () array!98546)

(declare-datatypes ((SeekEntryResult!11813 0))(
  ( (MissingZero!11813 (index!49644 (_ BitVec 32))) (Found!11813 (index!49645 (_ BitVec 32))) (Intermediate!11813 (undefined!12625 Bool) (index!49646 (_ BitVec 32)) (x!131270 (_ BitVec 32))) (Undefined!11813) (MissingVacant!11813 (index!49647 (_ BitVec 32))) )
))
(declare-fun lt!638480 () SeekEntryResult!11813)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98546 (_ BitVec 32)) SeekEntryResult!11813)

(assert (=> b!1456882 (= lt!638480 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638479 lt!638477 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98546 (_ BitVec 32)) SeekEntryResult!11813)

(assert (=> b!1456882 (= lt!638480 (seekEntryOrOpen!0 lt!638479 lt!638477 mask!2687))))

(declare-fun b!1456883 () Bool)

(declare-fun res!987295 () Bool)

(assert (=> b!1456883 (=> (not res!987295) (not e!819634))))

(assert (=> b!1456883 (= res!987295 (and (= (size!48111 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48111 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48111 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456884 () Bool)

(declare-fun res!987291 () Bool)

(declare-fun e!819640 () Bool)

(assert (=> b!1456884 (=> (not res!987291) (not e!819640))))

(declare-fun lt!638481 () SeekEntryResult!11813)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98546 (_ BitVec 32)) SeekEntryResult!11813)

(assert (=> b!1456884 (= res!987291 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47561 a!2862) j!93) a!2862 mask!2687) lt!638481))))

(declare-fun b!1456885 () Bool)

(declare-fun e!819632 () Bool)

(assert (=> b!1456885 (= e!819632 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638475 intermediateAfterIndex!19 lt!638479 lt!638477 mask!2687) lt!638480)))))

(declare-fun b!1456886 () Bool)

(declare-fun res!987285 () Bool)

(assert (=> b!1456886 (=> (not res!987285) (not e!819633))))

(declare-fun e!819635 () Bool)

(assert (=> b!1456886 (= res!987285 e!819635)))

(declare-fun c!134309 () Bool)

(assert (=> b!1456886 (= c!134309 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456887 () Bool)

(declare-fun e!819641 () Bool)

(assert (=> b!1456887 (= e!819634 e!819641)))

(declare-fun res!987286 () Bool)

(assert (=> b!1456887 (=> (not res!987286) (not e!819641))))

(assert (=> b!1456887 (= res!987286 (= (select (store (arr!47561 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456887 (= lt!638477 (array!98547 (store (arr!47561 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48111 a!2862)))))

(declare-fun res!987289 () Bool)

(assert (=> start!125098 (=> (not res!987289) (not e!819634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125098 (= res!987289 (validMask!0 mask!2687))))

(assert (=> start!125098 e!819634))

(assert (=> start!125098 true))

(declare-fun array_inv!36589 (array!98546) Bool)

(assert (=> start!125098 (array_inv!36589 a!2862)))

(declare-fun b!1456881 () Bool)

(declare-fun res!987284 () Bool)

(assert (=> b!1456881 (=> (not res!987284) (not e!819634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456881 (= res!987284 (validKeyInArray!0 (select (arr!47561 a!2862) j!93)))))

(declare-fun b!1456888 () Bool)

(declare-fun lt!638476 () SeekEntryResult!11813)

(assert (=> b!1456888 (= e!819632 (not (= lt!638476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638475 lt!638479 lt!638477 mask!2687))))))

(declare-fun b!1456889 () Bool)

(declare-fun res!987288 () Bool)

(assert (=> b!1456889 (=> (not res!987288) (not e!819634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98546 (_ BitVec 32)) Bool)

(assert (=> b!1456889 (= res!987288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456890 () Bool)

(assert (=> b!1456890 (= e!819635 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638479 lt!638477 mask!2687) (seekEntryOrOpen!0 lt!638479 lt!638477 mask!2687)))))

(declare-fun b!1456891 () Bool)

(declare-fun res!987293 () Bool)

(assert (=> b!1456891 (=> (not res!987293) (not e!819634))))

(assert (=> b!1456891 (= res!987293 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48111 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48111 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48111 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456892 () Bool)

(declare-fun res!987287 () Bool)

(assert (=> b!1456892 (=> res!987287 e!819639)))

(assert (=> b!1456892 (= res!987287 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638475 (select (arr!47561 a!2862) j!93) a!2862 mask!2687) lt!638481)))))

(declare-fun b!1456893 () Bool)

(declare-fun res!987292 () Bool)

(assert (=> b!1456893 (=> (not res!987292) (not e!819634))))

(assert (=> b!1456893 (= res!987292 (validKeyInArray!0 (select (arr!47561 a!2862) i!1006)))))

(declare-fun b!1456894 () Bool)

(assert (=> b!1456894 (= e!819635 (= lt!638476 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638479 lt!638477 mask!2687)))))

(declare-fun b!1456895 () Bool)

(assert (=> b!1456895 (= e!819639 true)))

(declare-fun lt!638474 () Bool)

(assert (=> b!1456895 (= lt!638474 e!819632)))

(declare-fun c!134310 () Bool)

(assert (=> b!1456895 (= c!134310 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456896 () Bool)

(assert (=> b!1456896 (= e!819641 e!819640)))

(declare-fun res!987296 () Bool)

(assert (=> b!1456896 (=> (not res!987296) (not e!819640))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456896 (= res!987296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47561 a!2862) j!93) mask!2687) (select (arr!47561 a!2862) j!93) a!2862 mask!2687) lt!638481))))

(assert (=> b!1456896 (= lt!638481 (Intermediate!11813 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456897 () Bool)

(assert (=> b!1456897 (= e!819640 e!819633)))

(declare-fun res!987297 () Bool)

(assert (=> b!1456897 (=> (not res!987297) (not e!819633))))

(assert (=> b!1456897 (= res!987297 (= lt!638476 (Intermediate!11813 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456897 (= lt!638476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638479 mask!2687) lt!638479 lt!638477 mask!2687))))

(assert (=> b!1456897 (= lt!638479 (select (store (arr!47561 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456898 () Bool)

(assert (=> b!1456898 (= e!819633 (not e!819637))))

(declare-fun res!987282 () Bool)

(assert (=> b!1456898 (=> res!987282 e!819637)))

(assert (=> b!1456898 (= res!987282 (or (and (= (select (arr!47561 a!2862) index!646) (select (store (arr!47561 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47561 a!2862) index!646) (select (arr!47561 a!2862) j!93))) (= (select (arr!47561 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456898 e!819638))

(declare-fun res!987283 () Bool)

(assert (=> b!1456898 (=> (not res!987283) (not e!819638))))

(assert (=> b!1456898 (= res!987283 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49122 0))(
  ( (Unit!49123) )
))
(declare-fun lt!638478 () Unit!49122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49122)

(assert (=> b!1456898 (= lt!638478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456899 () Bool)

(declare-fun res!987290 () Bool)

(assert (=> b!1456899 (=> (not res!987290) (not e!819638))))

(assert (=> b!1456899 (= res!987290 (= (seekEntryOrOpen!0 (select (arr!47561 a!2862) j!93) a!2862 mask!2687) (Found!11813 j!93)))))

(assert (= (and start!125098 res!987289) b!1456883))

(assert (= (and b!1456883 res!987295) b!1456893))

(assert (= (and b!1456893 res!987292) b!1456881))

(assert (= (and b!1456881 res!987284) b!1456889))

(assert (= (and b!1456889 res!987288) b!1456880))

(assert (= (and b!1456880 res!987294) b!1456891))

(assert (= (and b!1456891 res!987293) b!1456887))

(assert (= (and b!1456887 res!987286) b!1456896))

(assert (= (and b!1456896 res!987296) b!1456884))

(assert (= (and b!1456884 res!987291) b!1456897))

(assert (= (and b!1456897 res!987297) b!1456886))

(assert (= (and b!1456886 c!134309) b!1456894))

(assert (= (and b!1456886 (not c!134309)) b!1456890))

(assert (= (and b!1456886 res!987285) b!1456878))

(assert (= (and b!1456878 res!987281) b!1456898))

(assert (= (and b!1456898 res!987283) b!1456899))

(assert (= (and b!1456899 res!987290) b!1456879))

(assert (= (and b!1456898 (not res!987282)) b!1456882))

(assert (= (and b!1456882 (not res!987298)) b!1456892))

(assert (= (and b!1456892 (not res!987287)) b!1456895))

(assert (= (and b!1456895 c!134310) b!1456888))

(assert (= (and b!1456895 (not c!134310)) b!1456885))

(declare-fun m!1344925 () Bool)

(assert (=> b!1456888 m!1344925))

(declare-fun m!1344927 () Bool)

(assert (=> b!1456887 m!1344927))

(declare-fun m!1344929 () Bool)

(assert (=> b!1456887 m!1344929))

(declare-fun m!1344931 () Bool)

(assert (=> b!1456894 m!1344931))

(declare-fun m!1344933 () Bool)

(assert (=> b!1456899 m!1344933))

(assert (=> b!1456899 m!1344933))

(declare-fun m!1344935 () Bool)

(assert (=> b!1456899 m!1344935))

(assert (=> b!1456896 m!1344933))

(assert (=> b!1456896 m!1344933))

(declare-fun m!1344937 () Bool)

(assert (=> b!1456896 m!1344937))

(assert (=> b!1456896 m!1344937))

(assert (=> b!1456896 m!1344933))

(declare-fun m!1344939 () Bool)

(assert (=> b!1456896 m!1344939))

(declare-fun m!1344941 () Bool)

(assert (=> b!1456880 m!1344941))

(assert (=> b!1456884 m!1344933))

(assert (=> b!1456884 m!1344933))

(declare-fun m!1344943 () Bool)

(assert (=> b!1456884 m!1344943))

(declare-fun m!1344945 () Bool)

(assert (=> start!125098 m!1344945))

(declare-fun m!1344947 () Bool)

(assert (=> start!125098 m!1344947))

(assert (=> b!1456879 m!1344927))

(declare-fun m!1344949 () Bool)

(assert (=> b!1456879 m!1344949))

(declare-fun m!1344951 () Bool)

(assert (=> b!1456879 m!1344951))

(declare-fun m!1344953 () Bool)

(assert (=> b!1456879 m!1344953))

(assert (=> b!1456879 m!1344933))

(declare-fun m!1344955 () Bool)

(assert (=> b!1456898 m!1344955))

(assert (=> b!1456898 m!1344927))

(assert (=> b!1456898 m!1344951))

(assert (=> b!1456898 m!1344953))

(declare-fun m!1344957 () Bool)

(assert (=> b!1456898 m!1344957))

(assert (=> b!1456898 m!1344933))

(declare-fun m!1344959 () Bool)

(assert (=> b!1456885 m!1344959))

(declare-fun m!1344961 () Bool)

(assert (=> b!1456897 m!1344961))

(assert (=> b!1456897 m!1344961))

(declare-fun m!1344963 () Bool)

(assert (=> b!1456897 m!1344963))

(assert (=> b!1456897 m!1344927))

(declare-fun m!1344965 () Bool)

(assert (=> b!1456897 m!1344965))

(declare-fun m!1344967 () Bool)

(assert (=> b!1456893 m!1344967))

(assert (=> b!1456893 m!1344967))

(declare-fun m!1344969 () Bool)

(assert (=> b!1456893 m!1344969))

(declare-fun m!1344971 () Bool)

(assert (=> b!1456889 m!1344971))

(assert (=> b!1456892 m!1344933))

(assert (=> b!1456892 m!1344933))

(declare-fun m!1344973 () Bool)

(assert (=> b!1456892 m!1344973))

(declare-fun m!1344975 () Bool)

(assert (=> b!1456890 m!1344975))

(declare-fun m!1344977 () Bool)

(assert (=> b!1456890 m!1344977))

(declare-fun m!1344979 () Bool)

(assert (=> b!1456882 m!1344979))

(assert (=> b!1456882 m!1344975))

(assert (=> b!1456882 m!1344977))

(assert (=> b!1456881 m!1344933))

(assert (=> b!1456881 m!1344933))

(declare-fun m!1344981 () Bool)

(assert (=> b!1456881 m!1344981))

(push 1)

