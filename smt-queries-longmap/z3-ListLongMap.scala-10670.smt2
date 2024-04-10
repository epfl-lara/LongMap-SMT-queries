; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125160 () Bool)

(assert start!125160)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!820552 () Bool)

(declare-fun lt!639234 () (_ BitVec 64))

(declare-fun b!1458924 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11844 0))(
  ( (MissingZero!11844 (index!49768 (_ BitVec 32))) (Found!11844 (index!49769 (_ BitVec 32))) (Intermediate!11844 (undefined!12656 Bool) (index!49770 (_ BitVec 32)) (x!131381 (_ BitVec 32))) (Undefined!11844) (MissingVacant!11844 (index!49771 (_ BitVec 32))) )
))
(declare-fun lt!639235 () SeekEntryResult!11844)

(declare-fun lt!639232 () (_ BitVec 32))

(declare-datatypes ((array!98608 0))(
  ( (array!98609 (arr!47592 (Array (_ BitVec 32) (_ BitVec 64))) (size!48142 (_ BitVec 32))) )
))
(declare-fun lt!639238 () array!98608)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98608 (_ BitVec 32)) SeekEntryResult!11844)

(assert (=> b!1458924 (= e!820552 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639232 intermediateAfterIndex!19 lt!639234 lt!639238 mask!2687) lt!639235)))))

(declare-fun b!1458925 () Bool)

(declare-fun res!988965 () Bool)

(declare-fun e!820551 () Bool)

(assert (=> b!1458925 (=> (not res!988965) (not e!820551))))

(declare-fun e!820550 () Bool)

(assert (=> b!1458925 (= res!988965 e!820550)))

(declare-fun c!134496 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458925 (= c!134496 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458926 () Bool)

(declare-fun res!988959 () Bool)

(assert (=> b!1458926 (=> (not res!988959) (not e!820551))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458926 (= res!988959 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458927 () Bool)

(declare-fun e!820553 () Bool)

(declare-fun e!820554 () Bool)

(assert (=> b!1458927 (= e!820553 e!820554)))

(declare-fun res!988955 () Bool)

(assert (=> b!1458927 (=> (not res!988955) (not e!820554))))

(declare-fun lt!639239 () SeekEntryResult!11844)

(declare-fun a!2862 () array!98608)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98608 (_ BitVec 32)) SeekEntryResult!11844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458927 (= res!988955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47592 a!2862) j!93) mask!2687) (select (arr!47592 a!2862) j!93) a!2862 mask!2687) lt!639239))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1458927 (= lt!639239 (Intermediate!11844 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!639237 () SeekEntryResult!11844)

(declare-fun b!1458928 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1458928 (= e!820550 (= lt!639237 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639234 lt!639238 mask!2687)))))

(declare-fun b!1458929 () Bool)

(declare-fun res!988956 () Bool)

(declare-fun e!820555 () Bool)

(assert (=> b!1458929 (=> res!988956 e!820555)))

(assert (=> b!1458929 (= res!988956 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun res!988972 () Bool)

(declare-fun e!820548 () Bool)

(assert (=> start!125160 (=> (not res!988972) (not e!820548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125160 (= res!988972 (validMask!0 mask!2687))))

(assert (=> start!125160 e!820548))

(assert (=> start!125160 true))

(declare-fun array_inv!36620 (array!98608) Bool)

(assert (=> start!125160 (array_inv!36620 a!2862)))

(declare-fun b!1458930 () Bool)

(declare-fun res!988969 () Bool)

(assert (=> b!1458930 (=> (not res!988969) (not e!820548))))

(declare-datatypes ((List!34093 0))(
  ( (Nil!34090) (Cons!34089 (h!35439 (_ BitVec 64)) (t!48787 List!34093)) )
))
(declare-fun arrayNoDuplicates!0 (array!98608 (_ BitVec 32) List!34093) Bool)

(assert (=> b!1458930 (= res!988969 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34090))))

(declare-fun b!1458931 () Bool)

(declare-fun e!820556 () Bool)

(assert (=> b!1458931 (= e!820556 e!820555)))

(declare-fun res!988957 () Bool)

(assert (=> b!1458931 (=> res!988957 e!820555)))

(assert (=> b!1458931 (= res!988957 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639232 #b00000000000000000000000000000000) (bvsge lt!639232 (size!48142 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458931 (= lt!639232 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458931 (= lt!639235 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639234 lt!639238 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98608 (_ BitVec 32)) SeekEntryResult!11844)

(assert (=> b!1458931 (= lt!639235 (seekEntryOrOpen!0 lt!639234 lt!639238 mask!2687))))

(declare-fun b!1458932 () Bool)

(assert (=> b!1458932 (= e!820555 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!639233 () SeekEntryResult!11844)

(assert (=> b!1458932 (= lt!639233 lt!639235)))

(declare-datatypes ((Unit!49184 0))(
  ( (Unit!49185) )
))
(declare-fun lt!639236 () Unit!49184)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49184)

(assert (=> b!1458932 (= lt!639236 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639232 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458933 () Bool)

(declare-fun res!988960 () Bool)

(assert (=> b!1458933 (=> res!988960 e!820555)))

(assert (=> b!1458933 (= res!988960 e!820552)))

(declare-fun c!134495 () Bool)

(assert (=> b!1458933 (= c!134495 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458934 () Bool)

(assert (=> b!1458934 (= e!820554 e!820551)))

(declare-fun res!988971 () Bool)

(assert (=> b!1458934 (=> (not res!988971) (not e!820551))))

(assert (=> b!1458934 (= res!988971 (= lt!639237 (Intermediate!11844 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458934 (= lt!639237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639234 mask!2687) lt!639234 lt!639238 mask!2687))))

(assert (=> b!1458934 (= lt!639234 (select (store (arr!47592 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458935 () Bool)

(declare-fun res!988961 () Bool)

(assert (=> b!1458935 (=> (not res!988961) (not e!820548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458935 (= res!988961 (validKeyInArray!0 (select (arr!47592 a!2862) i!1006)))))

(declare-fun b!1458936 () Bool)

(declare-fun res!988966 () Bool)

(assert (=> b!1458936 (=> (not res!988966) (not e!820548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98608 (_ BitVec 32)) Bool)

(assert (=> b!1458936 (= res!988966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458937 () Bool)

(assert (=> b!1458937 (= e!820548 e!820553)))

(declare-fun res!988964 () Bool)

(assert (=> b!1458937 (=> (not res!988964) (not e!820553))))

(assert (=> b!1458937 (= res!988964 (= (select (store (arr!47592 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458937 (= lt!639238 (array!98609 (store (arr!47592 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48142 a!2862)))))

(declare-fun b!1458938 () Bool)

(declare-fun res!988958 () Bool)

(assert (=> b!1458938 (=> (not res!988958) (not e!820554))))

(assert (=> b!1458938 (= res!988958 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47592 a!2862) j!93) a!2862 mask!2687) lt!639239))))

(declare-fun b!1458939 () Bool)

(assert (=> b!1458939 (= e!820550 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639234 lt!639238 mask!2687) (seekEntryOrOpen!0 lt!639234 lt!639238 mask!2687)))))

(declare-fun b!1458940 () Bool)

(declare-fun res!988963 () Bool)

(assert (=> b!1458940 (=> (not res!988963) (not e!820548))))

(assert (=> b!1458940 (= res!988963 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48142 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48142 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48142 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458941 () Bool)

(assert (=> b!1458941 (= e!820552 (not (= lt!639237 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639232 lt!639234 lt!639238 mask!2687))))))

(declare-fun b!1458942 () Bool)

(declare-fun res!988967 () Bool)

(assert (=> b!1458942 (=> (not res!988967) (not e!820548))))

(assert (=> b!1458942 (= res!988967 (validKeyInArray!0 (select (arr!47592 a!2862) j!93)))))

(declare-fun b!1458943 () Bool)

(declare-fun res!988968 () Bool)

(assert (=> b!1458943 (=> res!988968 e!820555)))

(assert (=> b!1458943 (= res!988968 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639232 (select (arr!47592 a!2862) j!93) a!2862 mask!2687) lt!639239)))))

(declare-fun b!1458944 () Bool)

(assert (=> b!1458944 (= e!820551 (not e!820556))))

(declare-fun res!988970 () Bool)

(assert (=> b!1458944 (=> res!988970 e!820556)))

(assert (=> b!1458944 (= res!988970 (or (and (= (select (arr!47592 a!2862) index!646) (select (store (arr!47592 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47592 a!2862) index!646) (select (arr!47592 a!2862) j!93))) (= (select (arr!47592 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458944 (and (= lt!639233 (Found!11844 j!93)) (or (= (select (arr!47592 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47592 a!2862) intermediateBeforeIndex!19) (select (arr!47592 a!2862) j!93))) (let ((bdg!53467 (select (store (arr!47592 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47592 a!2862) index!646) bdg!53467) (= (select (arr!47592 a!2862) index!646) (select (arr!47592 a!2862) j!93))) (= (select (arr!47592 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53467 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458944 (= lt!639233 (seekEntryOrOpen!0 (select (arr!47592 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1458944 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639240 () Unit!49184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49184)

(assert (=> b!1458944 (= lt!639240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458945 () Bool)

(declare-fun res!988962 () Bool)

(assert (=> b!1458945 (=> (not res!988962) (not e!820548))))

(assert (=> b!1458945 (= res!988962 (and (= (size!48142 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48142 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48142 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125160 res!988972) b!1458945))

(assert (= (and b!1458945 res!988962) b!1458935))

(assert (= (and b!1458935 res!988961) b!1458942))

(assert (= (and b!1458942 res!988967) b!1458936))

(assert (= (and b!1458936 res!988966) b!1458930))

(assert (= (and b!1458930 res!988969) b!1458940))

(assert (= (and b!1458940 res!988963) b!1458937))

(assert (= (and b!1458937 res!988964) b!1458927))

(assert (= (and b!1458927 res!988955) b!1458938))

(assert (= (and b!1458938 res!988958) b!1458934))

(assert (= (and b!1458934 res!988971) b!1458925))

(assert (= (and b!1458925 c!134496) b!1458928))

(assert (= (and b!1458925 (not c!134496)) b!1458939))

(assert (= (and b!1458925 res!988965) b!1458926))

(assert (= (and b!1458926 res!988959) b!1458944))

(assert (= (and b!1458944 (not res!988970)) b!1458931))

(assert (= (and b!1458931 (not res!988957)) b!1458943))

(assert (= (and b!1458943 (not res!988968)) b!1458933))

(assert (= (and b!1458933 c!134495) b!1458941))

(assert (= (and b!1458933 (not c!134495)) b!1458924))

(assert (= (and b!1458933 (not res!988960)) b!1458929))

(assert (= (and b!1458929 (not res!988956)) b!1458932))

(declare-fun m!1346731 () Bool)

(assert (=> start!125160 m!1346731))

(declare-fun m!1346733 () Bool)

(assert (=> start!125160 m!1346733))

(declare-fun m!1346735 () Bool)

(assert (=> b!1458937 m!1346735))

(declare-fun m!1346737 () Bool)

(assert (=> b!1458937 m!1346737))

(declare-fun m!1346739 () Bool)

(assert (=> b!1458942 m!1346739))

(assert (=> b!1458942 m!1346739))

(declare-fun m!1346741 () Bool)

(assert (=> b!1458942 m!1346741))

(assert (=> b!1458927 m!1346739))

(assert (=> b!1458927 m!1346739))

(declare-fun m!1346743 () Bool)

(assert (=> b!1458927 m!1346743))

(assert (=> b!1458927 m!1346743))

(assert (=> b!1458927 m!1346739))

(declare-fun m!1346745 () Bool)

(assert (=> b!1458927 m!1346745))

(declare-fun m!1346747 () Bool)

(assert (=> b!1458934 m!1346747))

(assert (=> b!1458934 m!1346747))

(declare-fun m!1346749 () Bool)

(assert (=> b!1458934 m!1346749))

(assert (=> b!1458934 m!1346735))

(declare-fun m!1346751 () Bool)

(assert (=> b!1458934 m!1346751))

(declare-fun m!1346753 () Bool)

(assert (=> b!1458941 m!1346753))

(assert (=> b!1458943 m!1346739))

(assert (=> b!1458943 m!1346739))

(declare-fun m!1346755 () Bool)

(assert (=> b!1458943 m!1346755))

(declare-fun m!1346757 () Bool)

(assert (=> b!1458930 m!1346757))

(declare-fun m!1346759 () Bool)

(assert (=> b!1458939 m!1346759))

(declare-fun m!1346761 () Bool)

(assert (=> b!1458939 m!1346761))

(declare-fun m!1346763 () Bool)

(assert (=> b!1458935 m!1346763))

(assert (=> b!1458935 m!1346763))

(declare-fun m!1346765 () Bool)

(assert (=> b!1458935 m!1346765))

(declare-fun m!1346767 () Bool)

(assert (=> b!1458924 m!1346767))

(declare-fun m!1346769 () Bool)

(assert (=> b!1458936 m!1346769))

(declare-fun m!1346771 () Bool)

(assert (=> b!1458932 m!1346771))

(declare-fun m!1346773 () Bool)

(assert (=> b!1458928 m!1346773))

(assert (=> b!1458938 m!1346739))

(assert (=> b!1458938 m!1346739))

(declare-fun m!1346775 () Bool)

(assert (=> b!1458938 m!1346775))

(declare-fun m!1346777 () Bool)

(assert (=> b!1458944 m!1346777))

(assert (=> b!1458944 m!1346735))

(declare-fun m!1346779 () Bool)

(assert (=> b!1458944 m!1346779))

(declare-fun m!1346781 () Bool)

(assert (=> b!1458944 m!1346781))

(declare-fun m!1346783 () Bool)

(assert (=> b!1458944 m!1346783))

(assert (=> b!1458944 m!1346739))

(declare-fun m!1346785 () Bool)

(assert (=> b!1458944 m!1346785))

(declare-fun m!1346787 () Bool)

(assert (=> b!1458944 m!1346787))

(assert (=> b!1458944 m!1346739))

(declare-fun m!1346789 () Bool)

(assert (=> b!1458931 m!1346789))

(assert (=> b!1458931 m!1346759))

(assert (=> b!1458931 m!1346761))

(check-sat (not b!1458927) (not b!1458939) (not b!1458930) (not b!1458932) (not b!1458928) (not b!1458935) (not b!1458934) (not b!1458931) (not b!1458936) (not b!1458943) (not b!1458944) (not b!1458924) (not start!125160) (not b!1458938) (not b!1458941) (not b!1458942))
(check-sat)
