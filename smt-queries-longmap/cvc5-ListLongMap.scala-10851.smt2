; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127018 () Bool)

(assert start!127018)

(declare-fun b!1492897 () Bool)

(declare-fun res!1015682 () Bool)

(declare-fun e!836330 () Bool)

(assert (=> b!1492897 (=> (not res!1015682) (not e!836330))))

(declare-fun e!836336 () Bool)

(assert (=> b!1492897 (= res!1015682 e!836336)))

(declare-fun c!138141 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492897 (= c!138141 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492898 () Bool)

(declare-fun e!836335 () Bool)

(assert (=> b!1492898 (= e!836335 e!836330)))

(declare-fun res!1015673 () Bool)

(assert (=> b!1492898 (=> (not res!1015673) (not e!836330))))

(declare-datatypes ((SeekEntryResult!12374 0))(
  ( (MissingZero!12374 (index!51888 (_ BitVec 32))) (Found!12374 (index!51889 (_ BitVec 32))) (Intermediate!12374 (undefined!13186 Bool) (index!51890 (_ BitVec 32)) (x!133482 (_ BitVec 32))) (Undefined!12374) (MissingVacant!12374 (index!51891 (_ BitVec 32))) )
))
(declare-fun lt!650808 () SeekEntryResult!12374)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492898 (= res!1015673 (= lt!650808 (Intermediate!12374 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99728 0))(
  ( (array!99729 (arr!48134 (Array (_ BitVec 32) (_ BitVec 64))) (size!48684 (_ BitVec 32))) )
))
(declare-fun lt!650804 () array!99728)

(declare-fun lt!650803 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99728 (_ BitVec 32)) SeekEntryResult!12374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492898 (= lt!650808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650803 mask!2687) lt!650803 lt!650804 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99728)

(assert (=> b!1492898 (= lt!650803 (select (store (arr!48134 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492899 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1492899 (= e!836336 (= lt!650808 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650803 lt!650804 mask!2687)))))

(declare-fun b!1492900 () Bool)

(declare-fun e!836332 () Bool)

(declare-fun e!836331 () Bool)

(assert (=> b!1492900 (= e!836332 e!836331)))

(declare-fun res!1015675 () Bool)

(assert (=> b!1492900 (=> (not res!1015675) (not e!836331))))

(assert (=> b!1492900 (= res!1015675 (= (select (store (arr!48134 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492900 (= lt!650804 (array!99729 (store (arr!48134 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48684 a!2862)))))

(declare-fun b!1492901 () Bool)

(assert (=> b!1492901 (= e!836331 e!836335)))

(declare-fun res!1015678 () Bool)

(assert (=> b!1492901 (=> (not res!1015678) (not e!836335))))

(declare-fun lt!650807 () SeekEntryResult!12374)

(assert (=> b!1492901 (= res!1015678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) (select (arr!48134 a!2862) j!93) a!2862 mask!2687) lt!650807))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492901 (= lt!650807 (Intermediate!12374 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492902 () Bool)

(declare-fun res!1015679 () Bool)

(assert (=> b!1492902 (=> (not res!1015679) (not e!836330))))

(assert (=> b!1492902 (= res!1015679 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492904 () Bool)

(declare-fun res!1015686 () Bool)

(assert (=> b!1492904 (=> (not res!1015686) (not e!836332))))

(assert (=> b!1492904 (= res!1015686 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48684 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48684 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48684 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492905 () Bool)

(declare-fun res!1015684 () Bool)

(assert (=> b!1492905 (=> (not res!1015684) (not e!836332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99728 (_ BitVec 32)) Bool)

(assert (=> b!1492905 (= res!1015684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492906 () Bool)

(declare-fun res!1015674 () Bool)

(assert (=> b!1492906 (=> (not res!1015674) (not e!836332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492906 (= res!1015674 (validKeyInArray!0 (select (arr!48134 a!2862) j!93)))))

(declare-fun b!1492907 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99728 (_ BitVec 32)) SeekEntryResult!12374)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99728 (_ BitVec 32)) SeekEntryResult!12374)

(assert (=> b!1492907 (= e!836336 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650803 lt!650804 mask!2687) (seekEntryOrOpen!0 lt!650803 lt!650804 mask!2687)))))

(declare-fun b!1492908 () Bool)

(declare-fun res!1015676 () Bool)

(declare-fun e!836329 () Bool)

(assert (=> b!1492908 (=> (not res!1015676) (not e!836329))))

(assert (=> b!1492908 (= res!1015676 (= (seekEntryOrOpen!0 (select (arr!48134 a!2862) j!93) a!2862 mask!2687) (Found!12374 j!93)))))

(declare-fun b!1492909 () Bool)

(declare-fun res!1015672 () Bool)

(assert (=> b!1492909 (=> (not res!1015672) (not e!836332))))

(assert (=> b!1492909 (= res!1015672 (validKeyInArray!0 (select (arr!48134 a!2862) i!1006)))))

(declare-fun b!1492910 () Bool)

(declare-fun res!1015685 () Bool)

(assert (=> b!1492910 (=> (not res!1015685) (not e!836332))))

(declare-datatypes ((List!34635 0))(
  ( (Nil!34632) (Cons!34631 (h!36017 (_ BitVec 64)) (t!49329 List!34635)) )
))
(declare-fun arrayNoDuplicates!0 (array!99728 (_ BitVec 32) List!34635) Bool)

(assert (=> b!1492910 (= res!1015685 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34632))))

(declare-fun b!1492911 () Bool)

(assert (=> b!1492911 (= e!836329 (or (= (select (arr!48134 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48134 a!2862) intermediateBeforeIndex!19) (select (arr!48134 a!2862) j!93))))))

(declare-fun b!1492912 () Bool)

(declare-fun e!836334 () Bool)

(assert (=> b!1492912 (= e!836330 (not e!836334))))

(declare-fun res!1015677 () Bool)

(assert (=> b!1492912 (=> res!1015677 e!836334)))

(assert (=> b!1492912 (= res!1015677 (or (and (= (select (arr!48134 a!2862) index!646) (select (store (arr!48134 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48134 a!2862) index!646) (select (arr!48134 a!2862) j!93))) (= (select (arr!48134 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492912 e!836329))

(declare-fun res!1015681 () Bool)

(assert (=> b!1492912 (=> (not res!1015681) (not e!836329))))

(assert (=> b!1492912 (= res!1015681 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50088 0))(
  ( (Unit!50089) )
))
(declare-fun lt!650805 () Unit!50088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50088)

(assert (=> b!1492912 (= lt!650805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492913 () Bool)

(declare-fun res!1015683 () Bool)

(assert (=> b!1492913 (=> (not res!1015683) (not e!836335))))

(assert (=> b!1492913 (= res!1015683 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48134 a!2862) j!93) a!2862 mask!2687) lt!650807))))

(declare-fun b!1492914 () Bool)

(declare-fun res!1015680 () Bool)

(assert (=> b!1492914 (=> (not res!1015680) (not e!836332))))

(assert (=> b!1492914 (= res!1015680 (and (= (size!48684 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48684 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48684 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492903 () Bool)

(declare-fun lt!650806 () (_ BitVec 32))

(assert (=> b!1492903 (= e!836334 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!650806 #b00000000000000000000000000000000) (bvslt lt!650806 (size!48684 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492903 (= lt!650806 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1015687 () Bool)

(assert (=> start!127018 (=> (not res!1015687) (not e!836332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127018 (= res!1015687 (validMask!0 mask!2687))))

(assert (=> start!127018 e!836332))

(assert (=> start!127018 true))

(declare-fun array_inv!37162 (array!99728) Bool)

(assert (=> start!127018 (array_inv!37162 a!2862)))

(assert (= (and start!127018 res!1015687) b!1492914))

(assert (= (and b!1492914 res!1015680) b!1492909))

(assert (= (and b!1492909 res!1015672) b!1492906))

(assert (= (and b!1492906 res!1015674) b!1492905))

(assert (= (and b!1492905 res!1015684) b!1492910))

(assert (= (and b!1492910 res!1015685) b!1492904))

(assert (= (and b!1492904 res!1015686) b!1492900))

(assert (= (and b!1492900 res!1015675) b!1492901))

(assert (= (and b!1492901 res!1015678) b!1492913))

(assert (= (and b!1492913 res!1015683) b!1492898))

(assert (= (and b!1492898 res!1015673) b!1492897))

(assert (= (and b!1492897 c!138141) b!1492899))

(assert (= (and b!1492897 (not c!138141)) b!1492907))

(assert (= (and b!1492897 res!1015682) b!1492902))

(assert (= (and b!1492902 res!1015679) b!1492912))

(assert (= (and b!1492912 res!1015681) b!1492908))

(assert (= (and b!1492908 res!1015676) b!1492911))

(assert (= (and b!1492912 (not res!1015677)) b!1492903))

(declare-fun m!1376833 () Bool)

(assert (=> b!1492903 m!1376833))

(declare-fun m!1376835 () Bool)

(assert (=> start!127018 m!1376835))

(declare-fun m!1376837 () Bool)

(assert (=> start!127018 m!1376837))

(declare-fun m!1376839 () Bool)

(assert (=> b!1492913 m!1376839))

(assert (=> b!1492913 m!1376839))

(declare-fun m!1376841 () Bool)

(assert (=> b!1492913 m!1376841))

(declare-fun m!1376843 () Bool)

(assert (=> b!1492898 m!1376843))

(assert (=> b!1492898 m!1376843))

(declare-fun m!1376845 () Bool)

(assert (=> b!1492898 m!1376845))

(declare-fun m!1376847 () Bool)

(assert (=> b!1492898 m!1376847))

(declare-fun m!1376849 () Bool)

(assert (=> b!1492898 m!1376849))

(declare-fun m!1376851 () Bool)

(assert (=> b!1492899 m!1376851))

(assert (=> b!1492901 m!1376839))

(assert (=> b!1492901 m!1376839))

(declare-fun m!1376853 () Bool)

(assert (=> b!1492901 m!1376853))

(assert (=> b!1492901 m!1376853))

(assert (=> b!1492901 m!1376839))

(declare-fun m!1376855 () Bool)

(assert (=> b!1492901 m!1376855))

(declare-fun m!1376857 () Bool)

(assert (=> b!1492907 m!1376857))

(declare-fun m!1376859 () Bool)

(assert (=> b!1492907 m!1376859))

(assert (=> b!1492908 m!1376839))

(assert (=> b!1492908 m!1376839))

(declare-fun m!1376861 () Bool)

(assert (=> b!1492908 m!1376861))

(declare-fun m!1376863 () Bool)

(assert (=> b!1492911 m!1376863))

(assert (=> b!1492911 m!1376839))

(declare-fun m!1376865 () Bool)

(assert (=> b!1492910 m!1376865))

(declare-fun m!1376867 () Bool)

(assert (=> b!1492912 m!1376867))

(assert (=> b!1492912 m!1376847))

(declare-fun m!1376869 () Bool)

(assert (=> b!1492912 m!1376869))

(declare-fun m!1376871 () Bool)

(assert (=> b!1492912 m!1376871))

(declare-fun m!1376873 () Bool)

(assert (=> b!1492912 m!1376873))

(assert (=> b!1492912 m!1376839))

(declare-fun m!1376875 () Bool)

(assert (=> b!1492909 m!1376875))

(assert (=> b!1492909 m!1376875))

(declare-fun m!1376877 () Bool)

(assert (=> b!1492909 m!1376877))

(assert (=> b!1492900 m!1376847))

(declare-fun m!1376879 () Bool)

(assert (=> b!1492900 m!1376879))

(assert (=> b!1492906 m!1376839))

(assert (=> b!1492906 m!1376839))

(declare-fun m!1376881 () Bool)

(assert (=> b!1492906 m!1376881))

(declare-fun m!1376883 () Bool)

(assert (=> b!1492905 m!1376883))

(push 1)

(assert (not b!1492907))

(assert (not b!1492898))

(assert (not b!1492903))

(assert (not b!1492913))

(assert (not b!1492908))

(assert (not b!1492901))

(assert (not start!127018))

(assert (not b!1492906))

(assert (not b!1492899))

(assert (not b!1492905))

(assert (not b!1492910))

(assert (not b!1492909))

(assert (not b!1492912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1493105 () Bool)

(declare-fun e!836428 () SeekEntryResult!12374)

(assert (=> b!1493105 (= e!836428 Undefined!12374)))

(declare-fun b!1493106 () Bool)

(declare-fun c!138184 () Bool)

(declare-fun lt!650873 () (_ BitVec 64))

(assert (=> b!1493106 (= c!138184 (= lt!650873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836427 () SeekEntryResult!12374)

(declare-fun e!836429 () SeekEntryResult!12374)

(assert (=> b!1493106 (= e!836427 e!836429)))

(declare-fun b!1493107 () Bool)

(assert (=> b!1493107 (= e!836428 e!836427)))

(declare-fun c!138186 () Bool)

(assert (=> b!1493107 (= c!138186 (= lt!650873 lt!650803))))

(declare-fun b!1493104 () Bool)

(assert (=> b!1493104 (= e!836427 (Found!12374 index!646))))

(declare-fun d!156953 () Bool)

(declare-fun lt!650874 () SeekEntryResult!12374)

(assert (=> d!156953 (and (or (is-Undefined!12374 lt!650874) (not (is-Found!12374 lt!650874)) (and (bvsge (index!51889 lt!650874) #b00000000000000000000000000000000) (bvslt (index!51889 lt!650874) (size!48684 lt!650804)))) (or (is-Undefined!12374 lt!650874) (is-Found!12374 lt!650874) (not (is-MissingVacant!12374 lt!650874)) (not (= (index!51891 lt!650874) intermediateAfterIndex!19)) (and (bvsge (index!51891 lt!650874) #b00000000000000000000000000000000) (bvslt (index!51891 lt!650874) (size!48684 lt!650804)))) (or (is-Undefined!12374 lt!650874) (ite (is-Found!12374 lt!650874) (= (select (arr!48134 lt!650804) (index!51889 lt!650874)) lt!650803) (and (is-MissingVacant!12374 lt!650874) (= (index!51891 lt!650874) intermediateAfterIndex!19) (= (select (arr!48134 lt!650804) (index!51891 lt!650874)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156953 (= lt!650874 e!836428)))

(declare-fun c!138185 () Bool)

(assert (=> d!156953 (= c!138185 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156953 (= lt!650873 (select (arr!48134 lt!650804) index!646))))

(assert (=> d!156953 (validMask!0 mask!2687)))

(assert (=> d!156953 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650803 lt!650804 mask!2687) lt!650874)))

(declare-fun b!1493108 () Bool)

(assert (=> b!1493108 (= e!836429 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650803 lt!650804 mask!2687))))

(declare-fun b!1493109 () Bool)

(assert (=> b!1493109 (= e!836429 (MissingVacant!12374 intermediateAfterIndex!19))))

(assert (= (and d!156953 c!138185) b!1493105))

(assert (= (and d!156953 (not c!138185)) b!1493107))

(assert (= (and b!1493107 c!138186) b!1493104))

(assert (= (and b!1493107 (not c!138186)) b!1493106))

(assert (= (and b!1493106 c!138184) b!1493109))

(assert (= (and b!1493106 (not c!138184)) b!1493108))

(declare-fun m!1377025 () Bool)

(assert (=> d!156953 m!1377025))

(declare-fun m!1377027 () Bool)

(assert (=> d!156953 m!1377027))

(declare-fun m!1377029 () Bool)

(assert (=> d!156953 m!1377029))

(assert (=> d!156953 m!1376835))

(assert (=> b!1493108 m!1376833))

(assert (=> b!1493108 m!1376833))

(declare-fun m!1377031 () Bool)

(assert (=> b!1493108 m!1377031))

(assert (=> b!1492907 d!156953))

(declare-fun b!1493188 () Bool)

(declare-fun c!138213 () Bool)

(declare-fun lt!650910 () (_ BitVec 64))

(assert (=> b!1493188 (= c!138213 (= lt!650910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836477 () SeekEntryResult!12374)

(declare-fun e!836478 () SeekEntryResult!12374)

(assert (=> b!1493188 (= e!836477 e!836478)))

(declare-fun b!1493189 () Bool)

(declare-fun lt!650909 () SeekEntryResult!12374)

(assert (=> b!1493189 (= e!836478 (MissingZero!12374 (index!51890 lt!650909)))))

(declare-fun b!1493190 () Bool)

(declare-fun e!836479 () SeekEntryResult!12374)

(assert (=> b!1493190 (= e!836479 e!836477)))

(assert (=> b!1493190 (= lt!650910 (select (arr!48134 lt!650804) (index!51890 lt!650909)))))

(declare-fun c!138215 () Bool)

(assert (=> b!1493190 (= c!138215 (= lt!650910 lt!650803))))

(declare-fun b!1493191 () Bool)

(assert (=> b!1493191 (= e!836477 (Found!12374 (index!51890 lt!650909)))))

(declare-fun b!1493192 () Bool)

(assert (=> b!1493192 (= e!836478 (seekKeyOrZeroReturnVacant!0 (x!133482 lt!650909) (index!51890 lt!650909) (index!51890 lt!650909) lt!650803 lt!650804 mask!2687))))

(declare-fun b!1493193 () Bool)

(assert (=> b!1493193 (= e!836479 Undefined!12374)))

(declare-fun d!156961 () Bool)

(declare-fun lt!650911 () SeekEntryResult!12374)

(assert (=> d!156961 (and (or (is-Undefined!12374 lt!650911) (not (is-Found!12374 lt!650911)) (and (bvsge (index!51889 lt!650911) #b00000000000000000000000000000000) (bvslt (index!51889 lt!650911) (size!48684 lt!650804)))) (or (is-Undefined!12374 lt!650911) (is-Found!12374 lt!650911) (not (is-MissingZero!12374 lt!650911)) (and (bvsge (index!51888 lt!650911) #b00000000000000000000000000000000) (bvslt (index!51888 lt!650911) (size!48684 lt!650804)))) (or (is-Undefined!12374 lt!650911) (is-Found!12374 lt!650911) (is-MissingZero!12374 lt!650911) (not (is-MissingVacant!12374 lt!650911)) (and (bvsge (index!51891 lt!650911) #b00000000000000000000000000000000) (bvslt (index!51891 lt!650911) (size!48684 lt!650804)))) (or (is-Undefined!12374 lt!650911) (ite (is-Found!12374 lt!650911) (= (select (arr!48134 lt!650804) (index!51889 lt!650911)) lt!650803) (ite (is-MissingZero!12374 lt!650911) (= (select (arr!48134 lt!650804) (index!51888 lt!650911)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12374 lt!650911) (= (select (arr!48134 lt!650804) (index!51891 lt!650911)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156961 (= lt!650911 e!836479)))

(declare-fun c!138214 () Bool)

(assert (=> d!156961 (= c!138214 (and (is-Intermediate!12374 lt!650909) (undefined!13186 lt!650909)))))

(assert (=> d!156961 (= lt!650909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650803 mask!2687) lt!650803 lt!650804 mask!2687))))

(assert (=> d!156961 (validMask!0 mask!2687)))

(assert (=> d!156961 (= (seekEntryOrOpen!0 lt!650803 lt!650804 mask!2687) lt!650911)))

(assert (= (and d!156961 c!138214) b!1493193))

(assert (= (and d!156961 (not c!138214)) b!1493190))

(assert (= (and b!1493190 c!138215) b!1493191))

(assert (= (and b!1493190 (not c!138215)) b!1493188))

(assert (= (and b!1493188 c!138213) b!1493189))

(assert (= (and b!1493188 (not c!138213)) b!1493192))

(declare-fun m!1377061 () Bool)

(assert (=> b!1493190 m!1377061))

(declare-fun m!1377063 () Bool)

(assert (=> b!1493192 m!1377063))

(declare-fun m!1377065 () Bool)

(assert (=> d!156961 m!1377065))

(declare-fun m!1377067 () Bool)

(assert (=> d!156961 m!1377067))

(declare-fun m!1377069 () Bool)

(assert (=> d!156961 m!1377069))

(assert (=> d!156961 m!1376835))

(assert (=> d!156961 m!1376843))

(assert (=> d!156961 m!1376843))

(assert (=> d!156961 m!1376845))

(assert (=> b!1492907 d!156961))

(declare-fun d!156979 () Bool)

(assert (=> d!156979 (= (validKeyInArray!0 (select (arr!48134 a!2862) j!93)) (and (not (= (select (arr!48134 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48134 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492906 d!156979))

(declare-fun d!156981 () Bool)

(assert (=> d!156981 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127018 d!156981))

(declare-fun d!156991 () Bool)

(assert (=> d!156991 (= (array_inv!37162 a!2862) (bvsge (size!48684 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127018 d!156991))

(declare-fun b!1493239 () Bool)

(declare-fun e!836508 () Bool)

(declare-fun e!836510 () Bool)

(assert (=> b!1493239 (= e!836508 e!836510)))

(declare-fun lt!650942 () (_ BitVec 64))

(assert (=> b!1493239 (= lt!650942 (select (arr!48134 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650940 () Unit!50088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99728 (_ BitVec 64) (_ BitVec 32)) Unit!50088)

(assert (=> b!1493239 (= lt!650940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650942 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1493239 (arrayContainsKey!0 a!2862 lt!650942 #b00000000000000000000000000000000)))

(declare-fun lt!650941 () Unit!50088)

(assert (=> b!1493239 (= lt!650941 lt!650940)))

(declare-fun res!1015834 () Bool)

(assert (=> b!1493239 (= res!1015834 (= (seekEntryOrOpen!0 (select (arr!48134 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12374 #b00000000000000000000000000000000)))))

(assert (=> b!1493239 (=> (not res!1015834) (not e!836510))))

(declare-fun b!1493240 () Bool)

(declare-fun call!67967 () Bool)

(assert (=> b!1493240 (= e!836508 call!67967)))

(declare-fun b!1493241 () Bool)

(declare-fun e!836509 () Bool)

(assert (=> b!1493241 (= e!836509 e!836508)))

(declare-fun c!138232 () Bool)

(assert (=> b!1493241 (= c!138232 (validKeyInArray!0 (select (arr!48134 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493242 () Bool)

(assert (=> b!1493242 (= e!836510 call!67967)))

(declare-fun d!156993 () Bool)

(declare-fun res!1015835 () Bool)

(assert (=> d!156993 (=> res!1015835 e!836509)))

(assert (=> d!156993 (= res!1015835 (bvsge #b00000000000000000000000000000000 (size!48684 a!2862)))))

(assert (=> d!156993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836509)))

(declare-fun bm!67964 () Bool)

(assert (=> bm!67964 (= call!67967 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156993 (not res!1015835)) b!1493241))

(assert (= (and b!1493241 c!138232) b!1493239))

(assert (= (and b!1493241 (not c!138232)) b!1493240))

(assert (= (and b!1493239 res!1015834) b!1493242))

(assert (= (or b!1493242 b!1493240) bm!67964))

(declare-fun m!1377101 () Bool)

(assert (=> b!1493239 m!1377101))

(declare-fun m!1377103 () Bool)

(assert (=> b!1493239 m!1377103))

(declare-fun m!1377105 () Bool)

(assert (=> b!1493239 m!1377105))

(assert (=> b!1493239 m!1377101))

(declare-fun m!1377107 () Bool)

(assert (=> b!1493239 m!1377107))

(assert (=> b!1493241 m!1377101))

(assert (=> b!1493241 m!1377101))

(declare-fun m!1377109 () Bool)

(assert (=> b!1493241 m!1377109))

(declare-fun m!1377111 () Bool)

(assert (=> bm!67964 m!1377111))

(assert (=> b!1492905 d!156993))

(declare-fun d!156999 () Bool)

(declare-fun lt!650945 () (_ BitVec 32))

(assert (=> d!156999 (and (bvsge lt!650945 #b00000000000000000000000000000000) (bvslt lt!650945 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156999 (= lt!650945 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156999 (validMask!0 mask!2687)))

(assert (=> d!156999 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650945)))

(declare-fun bs!42877 () Bool)

(assert (= bs!42877 d!156999))

(declare-fun m!1377113 () Bool)

(assert (=> bs!42877 m!1377113))

(assert (=> bs!42877 m!1376835))

(assert (=> b!1492903 d!156999))

(declare-fun b!1493304 () Bool)

(declare-fun e!836548 () SeekEntryResult!12374)

(assert (=> b!1493304 (= e!836548 (Intermediate!12374 false index!646 x!665))))

(declare-fun b!1493305 () Bool)

(declare-fun e!836549 () SeekEntryResult!12374)

(assert (=> b!1493305 (= e!836549 e!836548)))

(declare-fun c!138257 () Bool)

(declare-fun lt!650976 () (_ BitVec 64))

(assert (=> b!1493305 (= c!138257 (or (= lt!650976 (select (arr!48134 a!2862) j!93)) (= (bvadd lt!650976 lt!650976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493306 () Bool)

(assert (=> b!1493306 (= e!836548 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48134 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493307 () Bool)

(declare-fun lt!650977 () SeekEntryResult!12374)

(assert (=> b!1493307 (and (bvsge (index!51890 lt!650977) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650977) (size!48684 a!2862)))))

(declare-fun res!1015855 () Bool)

(assert (=> b!1493307 (= res!1015855 (= (select (arr!48134 a!2862) (index!51890 lt!650977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836547 () Bool)

(assert (=> b!1493307 (=> res!1015855 e!836547)))

(declare-fun b!1493308 () Bool)

(declare-fun e!836550 () Bool)

(declare-fun e!836551 () Bool)

(assert (=> b!1493308 (= e!836550 e!836551)))

(declare-fun res!1015854 () Bool)

(assert (=> b!1493308 (= res!1015854 (and (is-Intermediate!12374 lt!650977) (not (undefined!13186 lt!650977)) (bvslt (x!133482 lt!650977) #b01111111111111111111111111111110) (bvsge (x!133482 lt!650977) #b00000000000000000000000000000000) (bvsge (x!133482 lt!650977) x!665)))))

(assert (=> b!1493308 (=> (not res!1015854) (not e!836551))))

(declare-fun d!157001 () Bool)

(assert (=> d!157001 e!836550))

(declare-fun c!138256 () Bool)

(assert (=> d!157001 (= c!138256 (and (is-Intermediate!12374 lt!650977) (undefined!13186 lt!650977)))))

(assert (=> d!157001 (= lt!650977 e!836549)))

(declare-fun c!138255 () Bool)

(assert (=> d!157001 (= c!138255 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157001 (= lt!650976 (select (arr!48134 a!2862) index!646))))

(assert (=> d!157001 (validMask!0 mask!2687)))

(assert (=> d!157001 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48134 a!2862) j!93) a!2862 mask!2687) lt!650977)))

(declare-fun b!1493309 () Bool)

(assert (=> b!1493309 (= e!836550 (bvsge (x!133482 lt!650977) #b01111111111111111111111111111110))))

(declare-fun b!1493310 () Bool)

(assert (=> b!1493310 (and (bvsge (index!51890 lt!650977) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650977) (size!48684 a!2862)))))

(declare-fun res!1015853 () Bool)

(assert (=> b!1493310 (= res!1015853 (= (select (arr!48134 a!2862) (index!51890 lt!650977)) (select (arr!48134 a!2862) j!93)))))

(assert (=> b!1493310 (=> res!1015853 e!836547)))

(assert (=> b!1493310 (= e!836551 e!836547)))

(declare-fun b!1493311 () Bool)

(assert (=> b!1493311 (and (bvsge (index!51890 lt!650977) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650977) (size!48684 a!2862)))))

(assert (=> b!1493311 (= e!836547 (= (select (arr!48134 a!2862) (index!51890 lt!650977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493312 () Bool)

(assert (=> b!1493312 (= e!836549 (Intermediate!12374 true index!646 x!665))))

(assert (= (and d!157001 c!138255) b!1493312))

(assert (= (and d!157001 (not c!138255)) b!1493305))

(assert (= (and b!1493305 c!138257) b!1493304))

(assert (= (and b!1493305 (not c!138257)) b!1493306))

(assert (= (and d!157001 c!138256) b!1493309))

(assert (= (and d!157001 (not c!138256)) b!1493308))

(assert (= (and b!1493308 res!1015854) b!1493310))

(assert (= (and b!1493310 (not res!1015853)) b!1493307))

(assert (= (and b!1493307 (not res!1015855)) b!1493311))

(declare-fun m!1377149 () Bool)

(assert (=> b!1493307 m!1377149))

(assert (=> b!1493306 m!1376833))

(assert (=> b!1493306 m!1376833))

(assert (=> b!1493306 m!1376839))

(declare-fun m!1377151 () Bool)

(assert (=> b!1493306 m!1377151))

(assert (=> b!1493311 m!1377149))

(assert (=> d!157001 m!1376871))

(assert (=> d!157001 m!1376835))

(assert (=> b!1493310 m!1377149))

(assert (=> b!1492913 d!157001))

(declare-fun b!1493313 () Bool)

(declare-fun e!836552 () Bool)

(declare-fun e!836554 () Bool)

(assert (=> b!1493313 (= e!836552 e!836554)))

(declare-fun lt!650980 () (_ BitVec 64))

(assert (=> b!1493313 (= lt!650980 (select (arr!48134 a!2862) j!93))))

(declare-fun lt!650978 () Unit!50088)

(assert (=> b!1493313 (= lt!650978 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650980 j!93))))

(assert (=> b!1493313 (arrayContainsKey!0 a!2862 lt!650980 #b00000000000000000000000000000000)))

(declare-fun lt!650979 () Unit!50088)

(assert (=> b!1493313 (= lt!650979 lt!650978)))

(declare-fun res!1015856 () Bool)

(assert (=> b!1493313 (= res!1015856 (= (seekEntryOrOpen!0 (select (arr!48134 a!2862) j!93) a!2862 mask!2687) (Found!12374 j!93)))))

(assert (=> b!1493313 (=> (not res!1015856) (not e!836554))))

(declare-fun b!1493314 () Bool)

(declare-fun call!67972 () Bool)

(assert (=> b!1493314 (= e!836552 call!67972)))

(declare-fun b!1493315 () Bool)

(declare-fun e!836553 () Bool)

(assert (=> b!1493315 (= e!836553 e!836552)))

(declare-fun c!138258 () Bool)

(assert (=> b!1493315 (= c!138258 (validKeyInArray!0 (select (arr!48134 a!2862) j!93)))))

(declare-fun b!1493316 () Bool)

(assert (=> b!1493316 (= e!836554 call!67972)))

(declare-fun d!157017 () Bool)

(declare-fun res!1015857 () Bool)

(assert (=> d!157017 (=> res!1015857 e!836553)))

(assert (=> d!157017 (= res!1015857 (bvsge j!93 (size!48684 a!2862)))))

(assert (=> d!157017 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836553)))

(declare-fun bm!67969 () Bool)

(assert (=> bm!67969 (= call!67972 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157017 (not res!1015857)) b!1493315))

(assert (= (and b!1493315 c!138258) b!1493313))

(assert (= (and b!1493315 (not c!138258)) b!1493314))

(assert (= (and b!1493313 res!1015856) b!1493316))

(assert (= (or b!1493316 b!1493314) bm!67969))

(assert (=> b!1493313 m!1376839))

(declare-fun m!1377153 () Bool)

(assert (=> b!1493313 m!1377153))

(declare-fun m!1377155 () Bool)

(assert (=> b!1493313 m!1377155))

(assert (=> b!1493313 m!1376839))

(assert (=> b!1493313 m!1376861))

(assert (=> b!1493315 m!1376839))

(assert (=> b!1493315 m!1376839))

(assert (=> b!1493315 m!1376881))

(declare-fun m!1377157 () Bool)

(assert (=> bm!67969 m!1377157))

(assert (=> b!1492912 d!157017))

(declare-fun d!157019 () Bool)

(assert (=> d!157019 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650990 () Unit!50088)

(declare-fun choose!38 (array!99728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50088)

(assert (=> d!157019 (= lt!650990 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157019 (validMask!0 mask!2687)))

(assert (=> d!157019 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650990)))

(declare-fun bs!42880 () Bool)

(assert (= bs!42880 d!157019))

(assert (=> bs!42880 m!1376873))

(declare-fun m!1377169 () Bool)

(assert (=> bs!42880 m!1377169))

(assert (=> bs!42880 m!1376835))

(assert (=> b!1492912 d!157019))

(declare-fun b!1493326 () Bool)

(declare-fun e!836561 () SeekEntryResult!12374)

(assert (=> b!1493326 (= e!836561 (Intermediate!12374 false (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493327 () Bool)

(declare-fun e!836562 () SeekEntryResult!12374)

(assert (=> b!1493327 (= e!836562 e!836561)))

(declare-fun c!138264 () Bool)

(declare-fun lt!650991 () (_ BitVec 64))

(assert (=> b!1493327 (= c!138264 (or (= lt!650991 (select (arr!48134 a!2862) j!93)) (= (bvadd lt!650991 lt!650991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493328 () Bool)

(assert (=> b!1493328 (= e!836561 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48134 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493329 () Bool)

(declare-fun lt!650992 () SeekEntryResult!12374)

(assert (=> b!1493329 (and (bvsge (index!51890 lt!650992) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650992) (size!48684 a!2862)))))

(declare-fun res!1015863 () Bool)

(assert (=> b!1493329 (= res!1015863 (= (select (arr!48134 a!2862) (index!51890 lt!650992)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836560 () Bool)

(assert (=> b!1493329 (=> res!1015863 e!836560)))

(declare-fun b!1493330 () Bool)

(declare-fun e!836563 () Bool)

(declare-fun e!836564 () Bool)

(assert (=> b!1493330 (= e!836563 e!836564)))

(declare-fun res!1015862 () Bool)

(assert (=> b!1493330 (= res!1015862 (and (is-Intermediate!12374 lt!650992) (not (undefined!13186 lt!650992)) (bvslt (x!133482 lt!650992) #b01111111111111111111111111111110) (bvsge (x!133482 lt!650992) #b00000000000000000000000000000000) (bvsge (x!133482 lt!650992) #b00000000000000000000000000000000)))))

(assert (=> b!1493330 (=> (not res!1015862) (not e!836564))))

(declare-fun d!157027 () Bool)

(assert (=> d!157027 e!836563))

(declare-fun c!138263 () Bool)

(assert (=> d!157027 (= c!138263 (and (is-Intermediate!12374 lt!650992) (undefined!13186 lt!650992)))))

(assert (=> d!157027 (= lt!650992 e!836562)))

(declare-fun c!138262 () Bool)

(assert (=> d!157027 (= c!138262 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157027 (= lt!650991 (select (arr!48134 a!2862) (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687)))))

(assert (=> d!157027 (validMask!0 mask!2687)))

(assert (=> d!157027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) (select (arr!48134 a!2862) j!93) a!2862 mask!2687) lt!650992)))

(declare-fun b!1493331 () Bool)

(assert (=> b!1493331 (= e!836563 (bvsge (x!133482 lt!650992) #b01111111111111111111111111111110))))

(declare-fun b!1493332 () Bool)

(assert (=> b!1493332 (and (bvsge (index!51890 lt!650992) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650992) (size!48684 a!2862)))))

(declare-fun res!1015861 () Bool)

(assert (=> b!1493332 (= res!1015861 (= (select (arr!48134 a!2862) (index!51890 lt!650992)) (select (arr!48134 a!2862) j!93)))))

(assert (=> b!1493332 (=> res!1015861 e!836560)))

(assert (=> b!1493332 (= e!836564 e!836560)))

(declare-fun b!1493333 () Bool)

(assert (=> b!1493333 (and (bvsge (index!51890 lt!650992) #b00000000000000000000000000000000) (bvslt (index!51890 lt!650992) (size!48684 a!2862)))))

(assert (=> b!1493333 (= e!836560 (= (select (arr!48134 a!2862) (index!51890 lt!650992)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493334 () Bool)

(assert (=> b!1493334 (= e!836562 (Intermediate!12374 true (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157027 c!138262) b!1493334))

(assert (= (and d!157027 (not c!138262)) b!1493327))

(assert (= (and b!1493327 c!138264) b!1493326))

(assert (= (and b!1493327 (not c!138264)) b!1493328))

(assert (= (and d!157027 c!138263) b!1493331))

(assert (= (and d!157027 (not c!138263)) b!1493330))

(assert (= (and b!1493330 res!1015862) b!1493332))

(assert (= (and b!1493332 (not res!1015861)) b!1493329))

(assert (= (and b!1493329 (not res!1015863)) b!1493333))

(declare-fun m!1377171 () Bool)

(assert (=> b!1493329 m!1377171))

(assert (=> b!1493328 m!1376853))

(declare-fun m!1377173 () Bool)

(assert (=> b!1493328 m!1377173))

(assert (=> b!1493328 m!1377173))

(assert (=> b!1493328 m!1376839))

(declare-fun m!1377175 () Bool)

(assert (=> b!1493328 m!1377175))

(assert (=> b!1493333 m!1377171))

(assert (=> d!157027 m!1376853))

(declare-fun m!1377177 () Bool)

(assert (=> d!157027 m!1377177))

(assert (=> d!157027 m!1376835))

(assert (=> b!1493332 m!1377171))

(assert (=> b!1492901 d!157027))

(declare-fun d!157029 () Bool)

(declare-fun lt!651003 () (_ BitVec 32))

(declare-fun lt!651002 () (_ BitVec 32))

(assert (=> d!157029 (= lt!651003 (bvmul (bvxor lt!651002 (bvlshr lt!651002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157029 (= lt!651002 ((_ extract 31 0) (bvand (bvxor (select (arr!48134 a!2862) j!93) (bvlshr (select (arr!48134 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157029 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015870 (let ((h!36022 ((_ extract 31 0) (bvand (bvxor (select (arr!48134 a!2862) j!93) (bvlshr (select (arr!48134 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133496 (bvmul (bvxor h!36022 (bvlshr h!36022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133496 (bvlshr x!133496 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015870 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015870 #b00000000000000000000000000000000))))))

(assert (=> d!157029 (= (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) (bvand (bvxor lt!651003 (bvlshr lt!651003 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492901 d!157029))

(declare-fun b!1493375 () Bool)

(declare-fun e!836596 () Bool)

(declare-fun e!836593 () Bool)

(assert (=> b!1493375 (= e!836596 e!836593)))

(declare-fun c!138276 () Bool)

(assert (=> b!1493375 (= c!138276 (validKeyInArray!0 (select (arr!48134 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493376 () Bool)

(declare-fun e!836595 () Bool)

(declare-fun contains!9928 (List!34635 (_ BitVec 64)) Bool)

(assert (=> b!1493376 (= e!836595 (contains!9928 Nil!34632 (select (arr!48134 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493378 () Bool)

(declare-fun call!67978 () Bool)

(assert (=> b!1493378 (= e!836593 call!67978)))

(declare-fun b!1493379 () Bool)

(declare-fun e!836594 () Bool)

(assert (=> b!1493379 (= e!836594 e!836596)))

(declare-fun res!1015883 () Bool)

(assert (=> b!1493379 (=> (not res!1015883) (not e!836596))))

(assert (=> b!1493379 (= res!1015883 (not e!836595))))

(declare-fun res!1015885 () Bool)

(assert (=> b!1493379 (=> (not res!1015885) (not e!836595))))

(assert (=> b!1493379 (= res!1015885 (validKeyInArray!0 (select (arr!48134 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67975 () Bool)

(assert (=> bm!67975 (= call!67978 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138276 (Cons!34631 (select (arr!48134 a!2862) #b00000000000000000000000000000000) Nil!34632) Nil!34632)))))

(declare-fun b!1493377 () Bool)

(assert (=> b!1493377 (= e!836593 call!67978)))

(declare-fun d!157035 () Bool)

(declare-fun res!1015884 () Bool)

(assert (=> d!157035 (=> res!1015884 e!836594)))

(assert (=> d!157035 (= res!1015884 (bvsge #b00000000000000000000000000000000 (size!48684 a!2862)))))

(assert (=> d!157035 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34632) e!836594)))

(assert (= (and d!157035 (not res!1015884)) b!1493379))

(assert (= (and b!1493379 res!1015885) b!1493376))

(assert (= (and b!1493379 res!1015883) b!1493375))

(assert (= (and b!1493375 c!138276) b!1493378))

(assert (= (and b!1493375 (not c!138276)) b!1493377))

(assert (= (or b!1493378 b!1493377) bm!67975))

(assert (=> b!1493375 m!1377101))

(assert (=> b!1493375 m!1377101))

(assert (=> b!1493375 m!1377109))

(assert (=> b!1493376 m!1377101))

(assert (=> b!1493376 m!1377101))

(declare-fun m!1377197 () Bool)

(assert (=> b!1493376 m!1377197))

(assert (=> b!1493379 m!1377101))

(assert (=> b!1493379 m!1377101))

(assert (=> b!1493379 m!1377109))

(assert (=> bm!67975 m!1377101))

(declare-fun m!1377199 () Bool)

(assert (=> bm!67975 m!1377199))

(assert (=> b!1492910 d!157035))

(declare-fun b!1493380 () Bool)

(declare-fun e!836598 () SeekEntryResult!12374)

(assert (=> b!1493380 (= e!836598 (Intermediate!12374 false index!646 x!665))))

(declare-fun b!1493381 () Bool)

(declare-fun e!836599 () SeekEntryResult!12374)

(assert (=> b!1493381 (= e!836599 e!836598)))

(declare-fun c!138279 () Bool)

(declare-fun lt!651004 () (_ BitVec 64))

(assert (=> b!1493381 (= c!138279 (or (= lt!651004 lt!650803) (= (bvadd lt!651004 lt!651004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493382 () Bool)

(assert (=> b!1493382 (= e!836598 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650803 lt!650804 mask!2687))))

(declare-fun b!1493383 () Bool)

(declare-fun lt!651005 () SeekEntryResult!12374)

(assert (=> b!1493383 (and (bvsge (index!51890 lt!651005) #b00000000000000000000000000000000) (bvslt (index!51890 lt!651005) (size!48684 lt!650804)))))

(declare-fun res!1015888 () Bool)

(assert (=> b!1493383 (= res!1015888 (= (select (arr!48134 lt!650804) (index!51890 lt!651005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836597 () Bool)

(assert (=> b!1493383 (=> res!1015888 e!836597)))

(declare-fun b!1493384 () Bool)

(declare-fun e!836600 () Bool)

(declare-fun e!836601 () Bool)

(assert (=> b!1493384 (= e!836600 e!836601)))

(declare-fun res!1015887 () Bool)

(assert (=> b!1493384 (= res!1015887 (and (is-Intermediate!12374 lt!651005) (not (undefined!13186 lt!651005)) (bvslt (x!133482 lt!651005) #b01111111111111111111111111111110) (bvsge (x!133482 lt!651005) #b00000000000000000000000000000000) (bvsge (x!133482 lt!651005) x!665)))))

(assert (=> b!1493384 (=> (not res!1015887) (not e!836601))))

(declare-fun d!157037 () Bool)

(assert (=> d!157037 e!836600))

(declare-fun c!138278 () Bool)

(assert (=> d!157037 (= c!138278 (and (is-Intermediate!12374 lt!651005) (undefined!13186 lt!651005)))))

(assert (=> d!157037 (= lt!651005 e!836599)))

(declare-fun c!138277 () Bool)

(assert (=> d!157037 (= c!138277 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157037 (= lt!651004 (select (arr!48134 lt!650804) index!646))))

(assert (=> d!157037 (validMask!0 mask!2687)))

(assert (=> d!157037 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650803 lt!650804 mask!2687) lt!651005)))

(declare-fun b!1493385 () Bool)

(assert (=> b!1493385 (= e!836600 (bvsge (x!133482 lt!651005) #b01111111111111111111111111111110))))

(declare-fun b!1493386 () Bool)

(assert (=> b!1493386 (and (bvsge (index!51890 lt!651005) #b00000000000000000000000000000000) (bvslt (index!51890 lt!651005) (size!48684 lt!650804)))))

(declare-fun res!1015886 () Bool)

(assert (=> b!1493386 (= res!1015886 (= (select (arr!48134 lt!650804) (index!51890 lt!651005)) lt!650803))))

(assert (=> b!1493386 (=> res!1015886 e!836597)))

(assert (=> b!1493386 (= e!836601 e!836597)))

(declare-fun b!1493387 () Bool)

(assert (=> b!1493387 (and (bvsge (index!51890 lt!651005) #b00000000000000000000000000000000) (bvslt (index!51890 lt!651005) (size!48684 lt!650804)))))

(assert (=> b!1493387 (= e!836597 (= (select (arr!48134 lt!650804) (index!51890 lt!651005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493388 () Bool)

(assert (=> b!1493388 (= e!836599 (Intermediate!12374 true index!646 x!665))))

(assert (= (and d!157037 c!138277) b!1493388))

(assert (= (and d!157037 (not c!138277)) b!1493381))

(assert (= (and b!1493381 c!138279) b!1493380))

(assert (= (and b!1493381 (not c!138279)) b!1493382))

(assert (= (and d!157037 c!138278) b!1493385))

(assert (= (and d!157037 (not c!138278)) b!1493384))

(assert (= (and b!1493384 res!1015887) b!1493386))

(assert (= (and b!1493386 (not res!1015886)) b!1493383))

(assert (= (and b!1493383 (not res!1015888)) b!1493387))

(declare-fun m!1377201 () Bool)

(assert (=> b!1493383 m!1377201))

(assert (=> b!1493382 m!1376833))

(assert (=> b!1493382 m!1376833))

(declare-fun m!1377203 () Bool)

(assert (=> b!1493382 m!1377203))

(assert (=> b!1493387 m!1377201))

(assert (=> d!157037 m!1377029))

(assert (=> d!157037 m!1376835))

(assert (=> b!1493386 m!1377201))

(assert (=> b!1492899 d!157037))

(declare-fun d!157039 () Bool)

(assert (=> d!157039 (= (validKeyInArray!0 (select (arr!48134 a!2862) i!1006)) (and (not (= (select (arr!48134 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48134 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492909 d!157039))

(declare-fun b!1493389 () Bool)

(declare-fun e!836603 () SeekEntryResult!12374)

(assert (=> b!1493389 (= e!836603 (Intermediate!12374 false (toIndex!0 lt!650803 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493390 () Bool)

(declare-fun e!836604 () SeekEntryResult!12374)

(assert (=> b!1493390 (= e!836604 e!836603)))

(declare-fun c!138282 () Bool)

(declare-fun lt!651006 () (_ BitVec 64))

(assert (=> b!1493390 (= c!138282 (or (= lt!651006 lt!650803) (= (bvadd lt!651006 lt!651006) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493391 () Bool)

(assert (=> b!1493391 (= e!836603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650803 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650803 lt!650804 mask!2687))))

(declare-fun b!1493392 () Bool)

(declare-fun lt!651007 () SeekEntryResult!12374)

(assert (=> b!1493392 (and (bvsge (index!51890 lt!651007) #b00000000000000000000000000000000) (bvslt (index!51890 lt!651007) (size!48684 lt!650804)))))

(declare-fun res!1015891 () Bool)

(assert (=> b!1493392 (= res!1015891 (= (select (arr!48134 lt!650804) (index!51890 lt!651007)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836602 () Bool)

(assert (=> b!1493392 (=> res!1015891 e!836602)))

(declare-fun b!1493393 () Bool)

(declare-fun e!836605 () Bool)

(declare-fun e!836606 () Bool)

(assert (=> b!1493393 (= e!836605 e!836606)))

(declare-fun res!1015890 () Bool)

(assert (=> b!1493393 (= res!1015890 (and (is-Intermediate!12374 lt!651007) (not (undefined!13186 lt!651007)) (bvslt (x!133482 lt!651007) #b01111111111111111111111111111110) (bvsge (x!133482 lt!651007) #b00000000000000000000000000000000) (bvsge (x!133482 lt!651007) #b00000000000000000000000000000000)))))

(assert (=> b!1493393 (=> (not res!1015890) (not e!836606))))

(declare-fun d!157041 () Bool)

(assert (=> d!157041 e!836605))

(declare-fun c!138281 () Bool)

(assert (=> d!157041 (= c!138281 (and (is-Intermediate!12374 lt!651007) (undefined!13186 lt!651007)))))

(assert (=> d!157041 (= lt!651007 e!836604)))

(declare-fun c!138280 () Bool)

(assert (=> d!157041 (= c!138280 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157041 (= lt!651006 (select (arr!48134 lt!650804) (toIndex!0 lt!650803 mask!2687)))))

(assert (=> d!157041 (validMask!0 mask!2687)))

(assert (=> d!157041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650803 mask!2687) lt!650803 lt!650804 mask!2687) lt!651007)))

(declare-fun b!1493394 () Bool)

(assert (=> b!1493394 (= e!836605 (bvsge (x!133482 lt!651007) #b01111111111111111111111111111110))))

(declare-fun b!1493395 () Bool)

(assert (=> b!1493395 (and (bvsge (index!51890 lt!651007) #b00000000000000000000000000000000) (bvslt (index!51890 lt!651007) (size!48684 lt!650804)))))

(declare-fun res!1015889 () Bool)

(assert (=> b!1493395 (= res!1015889 (= (select (arr!48134 lt!650804) (index!51890 lt!651007)) lt!650803))))

(assert (=> b!1493395 (=> res!1015889 e!836602)))

(assert (=> b!1493395 (= e!836606 e!836602)))

(declare-fun b!1493396 () Bool)

(assert (=> b!1493396 (and (bvsge (index!51890 lt!651007) #b00000000000000000000000000000000) (bvslt (index!51890 lt!651007) (size!48684 lt!650804)))))

(assert (=> b!1493396 (= e!836602 (= (select (arr!48134 lt!650804) (index!51890 lt!651007)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493397 () Bool)

(assert (=> b!1493397 (= e!836604 (Intermediate!12374 true (toIndex!0 lt!650803 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157041 c!138280) b!1493397))

(assert (= (and d!157041 (not c!138280)) b!1493390))

(assert (= (and b!1493390 c!138282) b!1493389))

(assert (= (and b!1493390 (not c!138282)) b!1493391))

(assert (= (and d!157041 c!138281) b!1493394))

(assert (= (and d!157041 (not c!138281)) b!1493393))

(assert (= (and b!1493393 res!1015890) b!1493395))

(assert (= (and b!1493395 (not res!1015889)) b!1493392))

(assert (= (and b!1493392 (not res!1015891)) b!1493396))

(declare-fun m!1377205 () Bool)

(assert (=> b!1493392 m!1377205))

(assert (=> b!1493391 m!1376843))

(declare-fun m!1377207 () Bool)

(assert (=> b!1493391 m!1377207))

(assert (=> b!1493391 m!1377207))

(declare-fun m!1377209 () Bool)

(assert (=> b!1493391 m!1377209))

(assert (=> b!1493396 m!1377205))

(assert (=> d!157041 m!1376843))

(declare-fun m!1377211 () Bool)

(assert (=> d!157041 m!1377211))

(assert (=> d!157041 m!1376835))

(assert (=> b!1493395 m!1377205))

(assert (=> b!1492898 d!157041))

(declare-fun d!157043 () Bool)

(declare-fun lt!651009 () (_ BitVec 32))

(declare-fun lt!651008 () (_ BitVec 32))

(assert (=> d!157043 (= lt!651009 (bvmul (bvxor lt!651008 (bvlshr lt!651008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157043 (= lt!651008 ((_ extract 31 0) (bvand (bvxor lt!650803 (bvlshr lt!650803 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157043 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015870 (let ((h!36022 ((_ extract 31 0) (bvand (bvxor lt!650803 (bvlshr lt!650803 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133496 (bvmul (bvxor h!36022 (bvlshr h!36022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133496 (bvlshr x!133496 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015870 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015870 #b00000000000000000000000000000000))))))

(assert (=> d!157043 (= (toIndex!0 lt!650803 mask!2687) (bvand (bvxor lt!651009 (bvlshr lt!651009 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492898 d!157043))

(declare-fun b!1493398 () Bool)

(declare-fun c!138283 () Bool)

(declare-fun lt!651011 () (_ BitVec 64))

(assert (=> b!1493398 (= c!138283 (= lt!651011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836607 () SeekEntryResult!12374)

(declare-fun e!836608 () SeekEntryResult!12374)

(assert (=> b!1493398 (= e!836607 e!836608)))

(declare-fun b!1493399 () Bool)

(declare-fun lt!651010 () SeekEntryResult!12374)

(assert (=> b!1493399 (= e!836608 (MissingZero!12374 (index!51890 lt!651010)))))

(declare-fun b!1493400 () Bool)

(declare-fun e!836609 () SeekEntryResult!12374)

(assert (=> b!1493400 (= e!836609 e!836607)))

(assert (=> b!1493400 (= lt!651011 (select (arr!48134 a!2862) (index!51890 lt!651010)))))

(declare-fun c!138285 () Bool)

(assert (=> b!1493400 (= c!138285 (= lt!651011 (select (arr!48134 a!2862) j!93)))))

(declare-fun b!1493401 () Bool)

(assert (=> b!1493401 (= e!836607 (Found!12374 (index!51890 lt!651010)))))

(declare-fun b!1493402 () Bool)

(assert (=> b!1493402 (= e!836608 (seekKeyOrZeroReturnVacant!0 (x!133482 lt!651010) (index!51890 lt!651010) (index!51890 lt!651010) (select (arr!48134 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493403 () Bool)

(assert (=> b!1493403 (= e!836609 Undefined!12374)))

(declare-fun d!157045 () Bool)

(declare-fun lt!651012 () SeekEntryResult!12374)

(assert (=> d!157045 (and (or (is-Undefined!12374 lt!651012) (not (is-Found!12374 lt!651012)) (and (bvsge (index!51889 lt!651012) #b00000000000000000000000000000000) (bvslt (index!51889 lt!651012) (size!48684 a!2862)))) (or (is-Undefined!12374 lt!651012) (is-Found!12374 lt!651012) (not (is-MissingZero!12374 lt!651012)) (and (bvsge (index!51888 lt!651012) #b00000000000000000000000000000000) (bvslt (index!51888 lt!651012) (size!48684 a!2862)))) (or (is-Undefined!12374 lt!651012) (is-Found!12374 lt!651012) (is-MissingZero!12374 lt!651012) (not (is-MissingVacant!12374 lt!651012)) (and (bvsge (index!51891 lt!651012) #b00000000000000000000000000000000) (bvslt (index!51891 lt!651012) (size!48684 a!2862)))) (or (is-Undefined!12374 lt!651012) (ite (is-Found!12374 lt!651012) (= (select (arr!48134 a!2862) (index!51889 lt!651012)) (select (arr!48134 a!2862) j!93)) (ite (is-MissingZero!12374 lt!651012) (= (select (arr!48134 a!2862) (index!51888 lt!651012)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12374 lt!651012) (= (select (arr!48134 a!2862) (index!51891 lt!651012)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157045 (= lt!651012 e!836609)))

(declare-fun c!138284 () Bool)

(assert (=> d!157045 (= c!138284 (and (is-Intermediate!12374 lt!651010) (undefined!13186 lt!651010)))))

(assert (=> d!157045 (= lt!651010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48134 a!2862) j!93) mask!2687) (select (arr!48134 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157045 (validMask!0 mask!2687)))

(assert (=> d!157045 (= (seekEntryOrOpen!0 (select (arr!48134 a!2862) j!93) a!2862 mask!2687) lt!651012)))

(assert (= (and d!157045 c!138284) b!1493403))

(assert (= (and d!157045 (not c!138284)) b!1493400))

(assert (= (and b!1493400 c!138285) b!1493401))

(assert (= (and b!1493400 (not c!138285)) b!1493398))

(assert (= (and b!1493398 c!138283) b!1493399))

(assert (= (and b!1493398 (not c!138283)) b!1493402))

(declare-fun m!1377213 () Bool)

(assert (=> b!1493400 m!1377213))

(assert (=> b!1493402 m!1376839))

(declare-fun m!1377215 () Bool)

(assert (=> b!1493402 m!1377215))

(declare-fun m!1377217 () Bool)

(assert (=> d!157045 m!1377217))

(declare-fun m!1377219 () Bool)

(assert (=> d!157045 m!1377219))

(declare-fun m!1377221 () Bool)

(assert (=> d!157045 m!1377221))

(assert (=> d!157045 m!1376835))

(assert (=> d!157045 m!1376839))

(assert (=> d!157045 m!1376853))

(assert (=> d!157045 m!1376853))

(assert (=> d!157045 m!1376839))

(assert (=> d!157045 m!1376855))

(assert (=> b!1492908 d!157045))

(push 1)

