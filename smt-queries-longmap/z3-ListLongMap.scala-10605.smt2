; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124738 () Bool)

(assert start!124738)

(declare-fun b!1446921 () Bool)

(declare-fun res!978732 () Bool)

(declare-fun e!814901 () Bool)

(assert (=> b!1446921 (=> (not res!978732) (not e!814901))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98164 0))(
  ( (array!98165 (arr!47371 (Array (_ BitVec 32) (_ BitVec 64))) (size!47923 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98164)

(assert (=> b!1446921 (= res!978732 (and (= (size!47923 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47923 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47923 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634811 () array!98164)

(declare-datatypes ((SeekEntryResult!11648 0))(
  ( (MissingZero!11648 (index!48984 (_ BitVec 32))) (Found!11648 (index!48985 (_ BitVec 32))) (Intermediate!11648 (undefined!12460 Bool) (index!48986 (_ BitVec 32)) (x!130660 (_ BitVec 32))) (Undefined!11648) (MissingVacant!11648 (index!48987 (_ BitVec 32))) )
))
(declare-fun lt!634812 () SeekEntryResult!11648)

(declare-fun e!814899 () Bool)

(declare-fun lt!634810 () (_ BitVec 64))

(declare-fun b!1446922 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98164 (_ BitVec 32)) SeekEntryResult!11648)

(assert (=> b!1446922 (= e!814899 (= lt!634812 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634810 lt!634811 mask!2687)))))

(declare-fun b!1446923 () Bool)

(declare-fun res!978733 () Bool)

(assert (=> b!1446923 (=> (not res!978733) (not e!814901))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446923 (= res!978733 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47923 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47923 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47923 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446924 () Bool)

(declare-fun e!814902 () Bool)

(assert (=> b!1446924 (= e!814902 true)))

(declare-fun lt!634814 () SeekEntryResult!11648)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98164 (_ BitVec 32)) SeekEntryResult!11648)

(assert (=> b!1446924 (= lt!634814 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47371 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446926 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98164 (_ BitVec 32)) SeekEntryResult!11648)

(assert (=> b!1446926 (= e!814899 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634810 lt!634811 mask!2687) (seekEntryOrOpen!0 lt!634810 lt!634811 mask!2687)))))

(declare-fun b!1446927 () Bool)

(declare-fun res!978735 () Bool)

(assert (=> b!1446927 (=> (not res!978735) (not e!814901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446927 (= res!978735 (validKeyInArray!0 (select (arr!47371 a!2862) i!1006)))))

(declare-fun b!1446928 () Bool)

(declare-fun e!814905 () Bool)

(assert (=> b!1446928 (= e!814905 (not e!814902))))

(declare-fun res!978738 () Bool)

(assert (=> b!1446928 (=> res!978738 e!814902)))

(assert (=> b!1446928 (= res!978738 (or (and (= (select (arr!47371 a!2862) index!646) (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47371 a!2862) index!646) (select (arr!47371 a!2862) j!93))) (not (= (select (arr!47371 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814904 () Bool)

(assert (=> b!1446928 e!814904))

(declare-fun res!978729 () Bool)

(assert (=> b!1446928 (=> (not res!978729) (not e!814904))))

(declare-fun lt!634809 () SeekEntryResult!11648)

(assert (=> b!1446928 (= res!978729 (and (= lt!634809 (Found!11648 j!93)) (or (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) (select (arr!47371 a!2862) j!93)))))))

(assert (=> b!1446928 (= lt!634809 (seekEntryOrOpen!0 (select (arr!47371 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98164 (_ BitVec 32)) Bool)

(assert (=> b!1446928 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48633 0))(
  ( (Unit!48634) )
))
(declare-fun lt!634813 () Unit!48633)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48633)

(assert (=> b!1446928 (= lt!634813 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446929 () Bool)

(declare-fun res!978730 () Bool)

(assert (=> b!1446929 (=> (not res!978730) (not e!814901))))

(declare-datatypes ((List!33950 0))(
  ( (Nil!33947) (Cons!33946 (h!35296 (_ BitVec 64)) (t!48636 List!33950)) )
))
(declare-fun arrayNoDuplicates!0 (array!98164 (_ BitVec 32) List!33950) Bool)

(assert (=> b!1446929 (= res!978730 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33947))))

(declare-fun e!814903 () Bool)

(declare-fun b!1446930 () Bool)

(assert (=> b!1446930 (= e!814903 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446931 () Bool)

(declare-fun res!978739 () Bool)

(declare-fun e!814906 () Bool)

(assert (=> b!1446931 (=> (not res!978739) (not e!814906))))

(declare-fun lt!634815 () SeekEntryResult!11648)

(assert (=> b!1446931 (= res!978739 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47371 a!2862) j!93) a!2862 mask!2687) lt!634815))))

(declare-fun b!1446932 () Bool)

(declare-fun res!978724 () Bool)

(assert (=> b!1446932 (=> (not res!978724) (not e!814905))))

(assert (=> b!1446932 (= res!978724 e!814899)))

(declare-fun c!133612 () Bool)

(assert (=> b!1446932 (= c!133612 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446933 () Bool)

(declare-fun e!814908 () Bool)

(assert (=> b!1446933 (= e!814901 e!814908)))

(declare-fun res!978727 () Bool)

(assert (=> b!1446933 (=> (not res!978727) (not e!814908))))

(assert (=> b!1446933 (= res!978727 (= (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446933 (= lt!634811 (array!98165 (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47923 a!2862)))))

(declare-fun b!1446934 () Bool)

(declare-fun res!978731 () Bool)

(assert (=> b!1446934 (=> (not res!978731) (not e!814901))))

(assert (=> b!1446934 (= res!978731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446935 () Bool)

(declare-fun e!814900 () Bool)

(assert (=> b!1446935 (= e!814904 e!814900)))

(declare-fun res!978736 () Bool)

(assert (=> b!1446935 (=> res!978736 e!814900)))

(assert (=> b!1446935 (= res!978736 (or (and (= (select (arr!47371 a!2862) index!646) (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47371 a!2862) index!646) (select (arr!47371 a!2862) j!93))) (not (= (select (arr!47371 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!978737 () Bool)

(assert (=> start!124738 (=> (not res!978737) (not e!814901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124738 (= res!978737 (validMask!0 mask!2687))))

(assert (=> start!124738 e!814901))

(assert (=> start!124738 true))

(declare-fun array_inv!36604 (array!98164) Bool)

(assert (=> start!124738 (array_inv!36604 a!2862)))

(declare-fun b!1446925 () Bool)

(declare-fun res!978726 () Bool)

(assert (=> b!1446925 (=> (not res!978726) (not e!814905))))

(assert (=> b!1446925 (= res!978726 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446936 () Bool)

(assert (=> b!1446936 (= e!814906 e!814905)))

(declare-fun res!978728 () Bool)

(assert (=> b!1446936 (=> (not res!978728) (not e!814905))))

(assert (=> b!1446936 (= res!978728 (= lt!634812 (Intermediate!11648 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446936 (= lt!634812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634810 mask!2687) lt!634810 lt!634811 mask!2687))))

(assert (=> b!1446936 (= lt!634810 (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446937 () Bool)

(assert (=> b!1446937 (= e!814900 e!814903)))

(declare-fun res!978725 () Bool)

(assert (=> b!1446937 (=> (not res!978725) (not e!814903))))

(assert (=> b!1446937 (= res!978725 (= lt!634809 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47371 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446938 () Bool)

(declare-fun res!978723 () Bool)

(assert (=> b!1446938 (=> (not res!978723) (not e!814901))))

(assert (=> b!1446938 (= res!978723 (validKeyInArray!0 (select (arr!47371 a!2862) j!93)))))

(declare-fun b!1446939 () Bool)

(assert (=> b!1446939 (= e!814908 e!814906)))

(declare-fun res!978734 () Bool)

(assert (=> b!1446939 (=> (not res!978734) (not e!814906))))

(assert (=> b!1446939 (= res!978734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47371 a!2862) j!93) mask!2687) (select (arr!47371 a!2862) j!93) a!2862 mask!2687) lt!634815))))

(assert (=> b!1446939 (= lt!634815 (Intermediate!11648 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124738 res!978737) b!1446921))

(assert (= (and b!1446921 res!978732) b!1446927))

(assert (= (and b!1446927 res!978735) b!1446938))

(assert (= (and b!1446938 res!978723) b!1446934))

(assert (= (and b!1446934 res!978731) b!1446929))

(assert (= (and b!1446929 res!978730) b!1446923))

(assert (= (and b!1446923 res!978733) b!1446933))

(assert (= (and b!1446933 res!978727) b!1446939))

(assert (= (and b!1446939 res!978734) b!1446931))

(assert (= (and b!1446931 res!978739) b!1446936))

(assert (= (and b!1446936 res!978728) b!1446932))

(assert (= (and b!1446932 c!133612) b!1446922))

(assert (= (and b!1446932 (not c!133612)) b!1446926))

(assert (= (and b!1446932 res!978724) b!1446925))

(assert (= (and b!1446925 res!978726) b!1446928))

(assert (= (and b!1446928 res!978729) b!1446935))

(assert (= (and b!1446935 (not res!978736)) b!1446937))

(assert (= (and b!1446937 res!978725) b!1446930))

(assert (= (and b!1446928 (not res!978738)) b!1446924))

(declare-fun m!1335273 () Bool)

(assert (=> b!1446938 m!1335273))

(assert (=> b!1446938 m!1335273))

(declare-fun m!1335275 () Bool)

(assert (=> b!1446938 m!1335275))

(declare-fun m!1335277 () Bool)

(assert (=> b!1446928 m!1335277))

(declare-fun m!1335279 () Bool)

(assert (=> b!1446928 m!1335279))

(declare-fun m!1335281 () Bool)

(assert (=> b!1446928 m!1335281))

(declare-fun m!1335283 () Bool)

(assert (=> b!1446928 m!1335283))

(declare-fun m!1335285 () Bool)

(assert (=> b!1446928 m!1335285))

(assert (=> b!1446928 m!1335273))

(declare-fun m!1335287 () Bool)

(assert (=> b!1446928 m!1335287))

(declare-fun m!1335289 () Bool)

(assert (=> b!1446928 m!1335289))

(assert (=> b!1446928 m!1335273))

(declare-fun m!1335291 () Bool)

(assert (=> b!1446927 m!1335291))

(assert (=> b!1446927 m!1335291))

(declare-fun m!1335293 () Bool)

(assert (=> b!1446927 m!1335293))

(assert (=> b!1446937 m!1335273))

(assert (=> b!1446937 m!1335273))

(declare-fun m!1335295 () Bool)

(assert (=> b!1446937 m!1335295))

(assert (=> b!1446924 m!1335273))

(assert (=> b!1446924 m!1335273))

(declare-fun m!1335297 () Bool)

(assert (=> b!1446924 m!1335297))

(declare-fun m!1335299 () Bool)

(assert (=> b!1446922 m!1335299))

(assert (=> b!1446931 m!1335273))

(assert (=> b!1446931 m!1335273))

(declare-fun m!1335301 () Bool)

(assert (=> b!1446931 m!1335301))

(declare-fun m!1335303 () Bool)

(assert (=> b!1446929 m!1335303))

(assert (=> b!1446939 m!1335273))

(assert (=> b!1446939 m!1335273))

(declare-fun m!1335305 () Bool)

(assert (=> b!1446939 m!1335305))

(assert (=> b!1446939 m!1335305))

(assert (=> b!1446939 m!1335273))

(declare-fun m!1335307 () Bool)

(assert (=> b!1446939 m!1335307))

(declare-fun m!1335309 () Bool)

(assert (=> b!1446926 m!1335309))

(declare-fun m!1335311 () Bool)

(assert (=> b!1446926 m!1335311))

(declare-fun m!1335313 () Bool)

(assert (=> start!124738 m!1335313))

(declare-fun m!1335315 () Bool)

(assert (=> start!124738 m!1335315))

(declare-fun m!1335317 () Bool)

(assert (=> b!1446936 m!1335317))

(assert (=> b!1446936 m!1335317))

(declare-fun m!1335319 () Bool)

(assert (=> b!1446936 m!1335319))

(assert (=> b!1446936 m!1335279))

(declare-fun m!1335321 () Bool)

(assert (=> b!1446936 m!1335321))

(assert (=> b!1446933 m!1335279))

(declare-fun m!1335323 () Bool)

(assert (=> b!1446933 m!1335323))

(assert (=> b!1446935 m!1335285))

(assert (=> b!1446935 m!1335279))

(assert (=> b!1446935 m!1335283))

(assert (=> b!1446935 m!1335273))

(declare-fun m!1335325 () Bool)

(assert (=> b!1446934 m!1335325))

(check-sat (not b!1446928) (not b!1446924) (not b!1446929) (not b!1446938) (not b!1446934) (not b!1446922) (not b!1446926) (not b!1446931) (not start!124738) (not b!1446937) (not b!1446927) (not b!1446936) (not b!1446939))
(check-sat)
