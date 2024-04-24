; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125886 () Bool)

(assert start!125886)

(declare-fun b!1471730 () Bool)

(declare-fun res!999047 () Bool)

(declare-fun e!826268 () Bool)

(assert (=> b!1471730 (=> (not res!999047) (not e!826268))))

(declare-datatypes ((array!99172 0))(
  ( (array!99173 (arr!47869 (Array (_ BitVec 32) (_ BitVec 64))) (size!48420 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99172)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471730 (= res!999047 (validKeyInArray!0 (select (arr!47869 a!2862) j!93)))))

(declare-fun b!1471731 () Bool)

(declare-fun res!999049 () Bool)

(assert (=> b!1471731 (=> (not res!999049) (not e!826268))))

(declare-datatypes ((List!34357 0))(
  ( (Nil!34354) (Cons!34353 (h!35717 (_ BitVec 64)) (t!49043 List!34357)) )
))
(declare-fun arrayNoDuplicates!0 (array!99172 (_ BitVec 32) List!34357) Bool)

(assert (=> b!1471731 (= res!999049 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34354))))

(declare-fun b!1471732 () Bool)

(declare-fun e!826270 () Bool)

(declare-fun e!826271 () Bool)

(assert (=> b!1471732 (= e!826270 e!826271)))

(declare-fun res!999043 () Bool)

(assert (=> b!1471732 (=> (not res!999043) (not e!826271))))

(declare-datatypes ((SeekEntryResult!12006 0))(
  ( (MissingZero!12006 (index!50416 (_ BitVec 32))) (Found!12006 (index!50417 (_ BitVec 32))) (Intermediate!12006 (undefined!12818 Bool) (index!50418 (_ BitVec 32)) (x!132176 (_ BitVec 32))) (Undefined!12006) (MissingVacant!12006 (index!50419 (_ BitVec 32))) )
))
(declare-fun lt!643389 () SeekEntryResult!12006)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99172 (_ BitVec 32)) SeekEntryResult!12006)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471732 (= res!999043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!643389))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471732 (= lt!643389 (Intermediate!12006 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471733 () Bool)

(declare-fun res!999042 () Bool)

(assert (=> b!1471733 (=> (not res!999042) (not e!826268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99172 (_ BitVec 32)) Bool)

(assert (=> b!1471733 (= res!999042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471734 () Bool)

(assert (=> b!1471734 (= e!826268 e!826270)))

(declare-fun res!999046 () Bool)

(assert (=> b!1471734 (=> (not res!999046) (not e!826270))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471734 (= res!999046 (= (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643392 () array!99172)

(assert (=> b!1471734 (= lt!643392 (array!99173 (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48420 a!2862)))))

(declare-fun b!1471735 () Bool)

(declare-fun e!826269 () Bool)

(assert (=> b!1471735 (= e!826271 e!826269)))

(declare-fun res!999045 () Bool)

(assert (=> b!1471735 (=> (not res!999045) (not e!826269))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!643393 () SeekEntryResult!12006)

(assert (=> b!1471735 (= res!999045 (= lt!643393 (Intermediate!12006 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643391 () (_ BitVec 64))

(assert (=> b!1471735 (= lt!643393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643391 mask!2687) lt!643391 lt!643392 mask!2687))))

(assert (=> b!1471735 (= lt!643391 (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!999048 () Bool)

(assert (=> start!125886 (=> (not res!999048) (not e!826268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125886 (= res!999048 (validMask!0 mask!2687))))

(assert (=> start!125886 e!826268))

(assert (=> start!125886 true))

(declare-fun array_inv!37150 (array!99172) Bool)

(assert (=> start!125886 (array_inv!37150 a!2862)))

(declare-fun b!1471736 () Bool)

(declare-fun res!999052 () Bool)

(assert (=> b!1471736 (=> (not res!999052) (not e!826268))))

(assert (=> b!1471736 (= res!999052 (validKeyInArray!0 (select (arr!47869 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!826272 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1471737 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99172 (_ BitVec 32)) SeekEntryResult!12006)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99172 (_ BitVec 32)) SeekEntryResult!12006)

(assert (=> b!1471737 (= e!826272 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643391 lt!643392 mask!2687) (seekEntryOrOpen!0 lt!643391 lt!643392 mask!2687)))))

(declare-fun b!1471738 () Bool)

(assert (=> b!1471738 (= e!826269 (not (= (seekEntryOrOpen!0 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) (Found!12006 j!93))))))

(assert (=> b!1471738 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49385 0))(
  ( (Unit!49386) )
))
(declare-fun lt!643390 () Unit!49385)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49385)

(assert (=> b!1471738 (= lt!643390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471739 () Bool)

(declare-fun res!999041 () Bool)

(assert (=> b!1471739 (=> (not res!999041) (not e!826269))))

(assert (=> b!1471739 (= res!999041 e!826272)))

(declare-fun c!135865 () Bool)

(assert (=> b!1471739 (= c!135865 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471740 () Bool)

(declare-fun res!999050 () Bool)

(assert (=> b!1471740 (=> (not res!999050) (not e!826271))))

(assert (=> b!1471740 (= res!999050 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!643389))))

(declare-fun b!1471741 () Bool)

(declare-fun res!999044 () Bool)

(assert (=> b!1471741 (=> (not res!999044) (not e!826268))))

(assert (=> b!1471741 (= res!999044 (and (= (size!48420 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48420 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48420 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471742 () Bool)

(assert (=> b!1471742 (= e!826272 (= lt!643393 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643391 lt!643392 mask!2687)))))

(declare-fun b!1471743 () Bool)

(declare-fun res!999053 () Bool)

(assert (=> b!1471743 (=> (not res!999053) (not e!826269))))

(assert (=> b!1471743 (= res!999053 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471744 () Bool)

(declare-fun res!999051 () Bool)

(assert (=> b!1471744 (=> (not res!999051) (not e!826268))))

(assert (=> b!1471744 (= res!999051 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48420 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48420 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48420 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125886 res!999048) b!1471741))

(assert (= (and b!1471741 res!999044) b!1471736))

(assert (= (and b!1471736 res!999052) b!1471730))

(assert (= (and b!1471730 res!999047) b!1471733))

(assert (= (and b!1471733 res!999042) b!1471731))

(assert (= (and b!1471731 res!999049) b!1471744))

(assert (= (and b!1471744 res!999051) b!1471734))

(assert (= (and b!1471734 res!999046) b!1471732))

(assert (= (and b!1471732 res!999043) b!1471740))

(assert (= (and b!1471740 res!999050) b!1471735))

(assert (= (and b!1471735 res!999045) b!1471739))

(assert (= (and b!1471739 c!135865) b!1471742))

(assert (= (and b!1471739 (not c!135865)) b!1471737))

(assert (= (and b!1471739 res!999041) b!1471743))

(assert (= (and b!1471743 res!999053) b!1471738))

(declare-fun m!1358845 () Bool)

(assert (=> b!1471742 m!1358845))

(declare-fun m!1358847 () Bool)

(assert (=> b!1471738 m!1358847))

(assert (=> b!1471738 m!1358847))

(declare-fun m!1358849 () Bool)

(assert (=> b!1471738 m!1358849))

(declare-fun m!1358851 () Bool)

(assert (=> b!1471738 m!1358851))

(declare-fun m!1358853 () Bool)

(assert (=> b!1471738 m!1358853))

(declare-fun m!1358855 () Bool)

(assert (=> start!125886 m!1358855))

(declare-fun m!1358857 () Bool)

(assert (=> start!125886 m!1358857))

(declare-fun m!1358859 () Bool)

(assert (=> b!1471734 m!1358859))

(declare-fun m!1358861 () Bool)

(assert (=> b!1471734 m!1358861))

(declare-fun m!1358863 () Bool)

(assert (=> b!1471735 m!1358863))

(assert (=> b!1471735 m!1358863))

(declare-fun m!1358865 () Bool)

(assert (=> b!1471735 m!1358865))

(assert (=> b!1471735 m!1358859))

(declare-fun m!1358867 () Bool)

(assert (=> b!1471735 m!1358867))

(declare-fun m!1358869 () Bool)

(assert (=> b!1471733 m!1358869))

(assert (=> b!1471740 m!1358847))

(assert (=> b!1471740 m!1358847))

(declare-fun m!1358871 () Bool)

(assert (=> b!1471740 m!1358871))

(assert (=> b!1471730 m!1358847))

(assert (=> b!1471730 m!1358847))

(declare-fun m!1358873 () Bool)

(assert (=> b!1471730 m!1358873))

(declare-fun m!1358875 () Bool)

(assert (=> b!1471736 m!1358875))

(assert (=> b!1471736 m!1358875))

(declare-fun m!1358877 () Bool)

(assert (=> b!1471736 m!1358877))

(assert (=> b!1471732 m!1358847))

(assert (=> b!1471732 m!1358847))

(declare-fun m!1358879 () Bool)

(assert (=> b!1471732 m!1358879))

(assert (=> b!1471732 m!1358879))

(assert (=> b!1471732 m!1358847))

(declare-fun m!1358881 () Bool)

(assert (=> b!1471732 m!1358881))

(declare-fun m!1358883 () Bool)

(assert (=> b!1471737 m!1358883))

(declare-fun m!1358885 () Bool)

(assert (=> b!1471737 m!1358885))

(declare-fun m!1358887 () Bool)

(assert (=> b!1471731 m!1358887))

(check-sat (not b!1471732) (not b!1471733) (not b!1471735) (not start!125886) (not b!1471740) (not b!1471736) (not b!1471738) (not b!1471742) (not b!1471730) (not b!1471737) (not b!1471731))
(check-sat)
(get-model)

(declare-fun b!1471853 () Bool)

(declare-fun lt!643429 () SeekEntryResult!12006)

(assert (=> b!1471853 (and (bvsge (index!50418 lt!643429) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643429) (size!48420 lt!643392)))))

(declare-fun e!826320 () Bool)

(assert (=> b!1471853 (= e!826320 (= (select (arr!47869 lt!643392) (index!50418 lt!643429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471854 () Bool)

(declare-fun e!826322 () SeekEntryResult!12006)

(assert (=> b!1471854 (= e!826322 (Intermediate!12006 false (toIndex!0 lt!643391 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471855 () Bool)

(declare-fun e!826323 () Bool)

(declare-fun e!826321 () Bool)

(assert (=> b!1471855 (= e!826323 e!826321)))

(declare-fun res!999138 () Bool)

(get-info :version)

(assert (=> b!1471855 (= res!999138 (and ((_ is Intermediate!12006) lt!643429) (not (undefined!12818 lt!643429)) (bvslt (x!132176 lt!643429) #b01111111111111111111111111111110) (bvsge (x!132176 lt!643429) #b00000000000000000000000000000000) (bvsge (x!132176 lt!643429) #b00000000000000000000000000000000)))))

(assert (=> b!1471855 (=> (not res!999138) (not e!826321))))

(declare-fun b!1471856 () Bool)

(declare-fun e!826319 () SeekEntryResult!12006)

(assert (=> b!1471856 (= e!826319 (Intermediate!12006 true (toIndex!0 lt!643391 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471857 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471857 (= e!826322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643391 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!643391 lt!643392 mask!2687))))

(declare-fun b!1471858 () Bool)

(assert (=> b!1471858 (and (bvsge (index!50418 lt!643429) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643429) (size!48420 lt!643392)))))

(declare-fun res!999139 () Bool)

(assert (=> b!1471858 (= res!999139 (= (select (arr!47869 lt!643392) (index!50418 lt!643429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471858 (=> res!999139 e!826320)))

(declare-fun d!155795 () Bool)

(assert (=> d!155795 e!826323))

(declare-fun c!135880 () Bool)

(assert (=> d!155795 (= c!135880 (and ((_ is Intermediate!12006) lt!643429) (undefined!12818 lt!643429)))))

(assert (=> d!155795 (= lt!643429 e!826319)))

(declare-fun c!135878 () Bool)

(assert (=> d!155795 (= c!135878 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643428 () (_ BitVec 64))

(assert (=> d!155795 (= lt!643428 (select (arr!47869 lt!643392) (toIndex!0 lt!643391 mask!2687)))))

(assert (=> d!155795 (validMask!0 mask!2687)))

(assert (=> d!155795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643391 mask!2687) lt!643391 lt!643392 mask!2687) lt!643429)))

(declare-fun b!1471859 () Bool)

(assert (=> b!1471859 (= e!826323 (bvsge (x!132176 lt!643429) #b01111111111111111111111111111110))))

(declare-fun b!1471860 () Bool)

(assert (=> b!1471860 (and (bvsge (index!50418 lt!643429) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643429) (size!48420 lt!643392)))))

(declare-fun res!999140 () Bool)

(assert (=> b!1471860 (= res!999140 (= (select (arr!47869 lt!643392) (index!50418 lt!643429)) lt!643391))))

(assert (=> b!1471860 (=> res!999140 e!826320)))

(assert (=> b!1471860 (= e!826321 e!826320)))

(declare-fun b!1471861 () Bool)

(assert (=> b!1471861 (= e!826319 e!826322)))

(declare-fun c!135879 () Bool)

(assert (=> b!1471861 (= c!135879 (or (= lt!643428 lt!643391) (= (bvadd lt!643428 lt!643428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155795 c!135878) b!1471856))

(assert (= (and d!155795 (not c!135878)) b!1471861))

(assert (= (and b!1471861 c!135879) b!1471854))

(assert (= (and b!1471861 (not c!135879)) b!1471857))

(assert (= (and d!155795 c!135880) b!1471859))

(assert (= (and d!155795 (not c!135880)) b!1471855))

(assert (= (and b!1471855 res!999138) b!1471860))

(assert (= (and b!1471860 (not res!999140)) b!1471858))

(assert (= (and b!1471858 (not res!999139)) b!1471853))

(declare-fun m!1358977 () Bool)

(assert (=> b!1471858 m!1358977))

(assert (=> d!155795 m!1358863))

(declare-fun m!1358979 () Bool)

(assert (=> d!155795 m!1358979))

(assert (=> d!155795 m!1358855))

(assert (=> b!1471857 m!1358863))

(declare-fun m!1358981 () Bool)

(assert (=> b!1471857 m!1358981))

(assert (=> b!1471857 m!1358981))

(declare-fun m!1358983 () Bool)

(assert (=> b!1471857 m!1358983))

(assert (=> b!1471853 m!1358977))

(assert (=> b!1471860 m!1358977))

(assert (=> b!1471735 d!155795))

(declare-fun d!155797 () Bool)

(declare-fun lt!643435 () (_ BitVec 32))

(declare-fun lt!643434 () (_ BitVec 32))

(assert (=> d!155797 (= lt!643435 (bvmul (bvxor lt!643434 (bvlshr lt!643434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155797 (= lt!643434 ((_ extract 31 0) (bvand (bvxor lt!643391 (bvlshr lt!643391 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155797 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999141 (let ((h!35720 ((_ extract 31 0) (bvand (bvxor lt!643391 (bvlshr lt!643391 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132180 (bvmul (bvxor h!35720 (bvlshr h!35720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132180 (bvlshr x!132180 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999141 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999141 #b00000000000000000000000000000000))))))

(assert (=> d!155797 (= (toIndex!0 lt!643391 mask!2687) (bvand (bvxor lt!643435 (bvlshr lt!643435 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1471735 d!155797))

(declare-fun b!1471862 () Bool)

(declare-fun lt!643437 () SeekEntryResult!12006)

(assert (=> b!1471862 (and (bvsge (index!50418 lt!643437) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643437) (size!48420 a!2862)))))

(declare-fun e!826325 () Bool)

(assert (=> b!1471862 (= e!826325 (= (select (arr!47869 a!2862) (index!50418 lt!643437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471863 () Bool)

(declare-fun e!826327 () SeekEntryResult!12006)

(assert (=> b!1471863 (= e!826327 (Intermediate!12006 false index!646 x!665))))

(declare-fun b!1471864 () Bool)

(declare-fun e!826328 () Bool)

(declare-fun e!826326 () Bool)

(assert (=> b!1471864 (= e!826328 e!826326)))

(declare-fun res!999142 () Bool)

(assert (=> b!1471864 (= res!999142 (and ((_ is Intermediate!12006) lt!643437) (not (undefined!12818 lt!643437)) (bvslt (x!132176 lt!643437) #b01111111111111111111111111111110) (bvsge (x!132176 lt!643437) #b00000000000000000000000000000000) (bvsge (x!132176 lt!643437) x!665)))))

(assert (=> b!1471864 (=> (not res!999142) (not e!826326))))

(declare-fun b!1471865 () Bool)

(declare-fun e!826324 () SeekEntryResult!12006)

(assert (=> b!1471865 (= e!826324 (Intermediate!12006 true index!646 x!665))))

(declare-fun b!1471866 () Bool)

(assert (=> b!1471866 (= e!826327 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471867 () Bool)

(assert (=> b!1471867 (and (bvsge (index!50418 lt!643437) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643437) (size!48420 a!2862)))))

(declare-fun res!999143 () Bool)

(assert (=> b!1471867 (= res!999143 (= (select (arr!47869 a!2862) (index!50418 lt!643437)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471867 (=> res!999143 e!826325)))

(declare-fun d!155799 () Bool)

(assert (=> d!155799 e!826328))

(declare-fun c!135883 () Bool)

(assert (=> d!155799 (= c!135883 (and ((_ is Intermediate!12006) lt!643437) (undefined!12818 lt!643437)))))

(assert (=> d!155799 (= lt!643437 e!826324)))

(declare-fun c!135881 () Bool)

(assert (=> d!155799 (= c!135881 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643436 () (_ BitVec 64))

(assert (=> d!155799 (= lt!643436 (select (arr!47869 a!2862) index!646))))

(assert (=> d!155799 (validMask!0 mask!2687)))

(assert (=> d!155799 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!643437)))

(declare-fun b!1471868 () Bool)

(assert (=> b!1471868 (= e!826328 (bvsge (x!132176 lt!643437) #b01111111111111111111111111111110))))

(declare-fun b!1471869 () Bool)

(assert (=> b!1471869 (and (bvsge (index!50418 lt!643437) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643437) (size!48420 a!2862)))))

(declare-fun res!999144 () Bool)

(assert (=> b!1471869 (= res!999144 (= (select (arr!47869 a!2862) (index!50418 lt!643437)) (select (arr!47869 a!2862) j!93)))))

(assert (=> b!1471869 (=> res!999144 e!826325)))

(assert (=> b!1471869 (= e!826326 e!826325)))

(declare-fun b!1471870 () Bool)

(assert (=> b!1471870 (= e!826324 e!826327)))

(declare-fun c!135882 () Bool)

(assert (=> b!1471870 (= c!135882 (or (= lt!643436 (select (arr!47869 a!2862) j!93)) (= (bvadd lt!643436 lt!643436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155799 c!135881) b!1471865))

(assert (= (and d!155799 (not c!135881)) b!1471870))

(assert (= (and b!1471870 c!135882) b!1471863))

(assert (= (and b!1471870 (not c!135882)) b!1471866))

(assert (= (and d!155799 c!135883) b!1471868))

(assert (= (and d!155799 (not c!135883)) b!1471864))

(assert (= (and b!1471864 res!999142) b!1471869))

(assert (= (and b!1471869 (not res!999144)) b!1471867))

(assert (= (and b!1471867 (not res!999143)) b!1471862))

(declare-fun m!1358985 () Bool)

(assert (=> b!1471867 m!1358985))

(declare-fun m!1358987 () Bool)

(assert (=> d!155799 m!1358987))

(assert (=> d!155799 m!1358855))

(declare-fun m!1358989 () Bool)

(assert (=> b!1471866 m!1358989))

(assert (=> b!1471866 m!1358989))

(assert (=> b!1471866 m!1358847))

(declare-fun m!1358991 () Bool)

(assert (=> b!1471866 m!1358991))

(assert (=> b!1471862 m!1358985))

(assert (=> b!1471869 m!1358985))

(assert (=> b!1471740 d!155799))

(declare-fun bm!67788 () Bool)

(declare-fun call!67791 () Bool)

(assert (=> bm!67788 (= call!67791 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1471879 () Bool)

(declare-fun e!826335 () Bool)

(assert (=> b!1471879 (= e!826335 call!67791)))

(declare-fun b!1471880 () Bool)

(declare-fun e!826337 () Bool)

(assert (=> b!1471880 (= e!826335 e!826337)))

(declare-fun lt!643444 () (_ BitVec 64))

(assert (=> b!1471880 (= lt!643444 (select (arr!47869 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643445 () Unit!49385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99172 (_ BitVec 64) (_ BitVec 32)) Unit!49385)

(assert (=> b!1471880 (= lt!643445 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643444 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1471880 (arrayContainsKey!0 a!2862 lt!643444 #b00000000000000000000000000000000)))

(declare-fun lt!643446 () Unit!49385)

(assert (=> b!1471880 (= lt!643446 lt!643445)))

(declare-fun res!999149 () Bool)

(assert (=> b!1471880 (= res!999149 (= (seekEntryOrOpen!0 (select (arr!47869 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12006 #b00000000000000000000000000000000)))))

(assert (=> b!1471880 (=> (not res!999149) (not e!826337))))

(declare-fun d!155801 () Bool)

(declare-fun res!999150 () Bool)

(declare-fun e!826336 () Bool)

(assert (=> d!155801 (=> res!999150 e!826336)))

(assert (=> d!155801 (= res!999150 (bvsge #b00000000000000000000000000000000 (size!48420 a!2862)))))

(assert (=> d!155801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!826336)))

(declare-fun b!1471881 () Bool)

(assert (=> b!1471881 (= e!826337 call!67791)))

(declare-fun b!1471882 () Bool)

(assert (=> b!1471882 (= e!826336 e!826335)))

(declare-fun c!135886 () Bool)

(assert (=> b!1471882 (= c!135886 (validKeyInArray!0 (select (arr!47869 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155801 (not res!999150)) b!1471882))

(assert (= (and b!1471882 c!135886) b!1471880))

(assert (= (and b!1471882 (not c!135886)) b!1471879))

(assert (= (and b!1471880 res!999149) b!1471881))

(assert (= (or b!1471881 b!1471879) bm!67788))

(declare-fun m!1358993 () Bool)

(assert (=> bm!67788 m!1358993))

(declare-fun m!1358995 () Bool)

(assert (=> b!1471880 m!1358995))

(declare-fun m!1358997 () Bool)

(assert (=> b!1471880 m!1358997))

(declare-fun m!1358999 () Bool)

(assert (=> b!1471880 m!1358999))

(assert (=> b!1471880 m!1358995))

(declare-fun m!1359001 () Bool)

(assert (=> b!1471880 m!1359001))

(assert (=> b!1471882 m!1358995))

(assert (=> b!1471882 m!1358995))

(declare-fun m!1359003 () Bool)

(assert (=> b!1471882 m!1359003))

(assert (=> b!1471733 d!155801))

(declare-fun b!1471913 () Bool)

(declare-fun e!826355 () SeekEntryResult!12006)

(assert (=> b!1471913 (= e!826355 Undefined!12006)))

(declare-fun b!1471914 () Bool)

(declare-fun e!826353 () SeekEntryResult!12006)

(assert (=> b!1471914 (= e!826355 e!826353)))

(declare-fun lt!643461 () (_ BitVec 64))

(declare-fun lt!643459 () SeekEntryResult!12006)

(assert (=> b!1471914 (= lt!643461 (select (arr!47869 a!2862) (index!50418 lt!643459)))))

(declare-fun c!135904 () Bool)

(assert (=> b!1471914 (= c!135904 (= lt!643461 (select (arr!47869 a!2862) j!93)))))

(declare-fun b!1471915 () Bool)

(declare-fun e!826354 () SeekEntryResult!12006)

(assert (=> b!1471915 (= e!826354 (MissingZero!12006 (index!50418 lt!643459)))))

(declare-fun b!1471916 () Bool)

(assert (=> b!1471916 (= e!826354 (seekKeyOrZeroReturnVacant!0 (x!132176 lt!643459) (index!50418 lt!643459) (index!50418 lt!643459) (select (arr!47869 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471917 () Bool)

(assert (=> b!1471917 (= e!826353 (Found!12006 (index!50418 lt!643459)))))

(declare-fun b!1471918 () Bool)

(declare-fun c!135902 () Bool)

(assert (=> b!1471918 (= c!135902 (= lt!643461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471918 (= e!826353 e!826354)))

(declare-fun d!155805 () Bool)

(declare-fun lt!643460 () SeekEntryResult!12006)

(assert (=> d!155805 (and (or ((_ is Undefined!12006) lt!643460) (not ((_ is Found!12006) lt!643460)) (and (bvsge (index!50417 lt!643460) #b00000000000000000000000000000000) (bvslt (index!50417 lt!643460) (size!48420 a!2862)))) (or ((_ is Undefined!12006) lt!643460) ((_ is Found!12006) lt!643460) (not ((_ is MissingZero!12006) lt!643460)) (and (bvsge (index!50416 lt!643460) #b00000000000000000000000000000000) (bvslt (index!50416 lt!643460) (size!48420 a!2862)))) (or ((_ is Undefined!12006) lt!643460) ((_ is Found!12006) lt!643460) ((_ is MissingZero!12006) lt!643460) (not ((_ is MissingVacant!12006) lt!643460)) (and (bvsge (index!50419 lt!643460) #b00000000000000000000000000000000) (bvslt (index!50419 lt!643460) (size!48420 a!2862)))) (or ((_ is Undefined!12006) lt!643460) (ite ((_ is Found!12006) lt!643460) (= (select (arr!47869 a!2862) (index!50417 lt!643460)) (select (arr!47869 a!2862) j!93)) (ite ((_ is MissingZero!12006) lt!643460) (= (select (arr!47869 a!2862) (index!50416 lt!643460)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12006) lt!643460) (= (select (arr!47869 a!2862) (index!50419 lt!643460)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155805 (= lt!643460 e!826355)))

(declare-fun c!135903 () Bool)

(assert (=> d!155805 (= c!135903 (and ((_ is Intermediate!12006) lt!643459) (undefined!12818 lt!643459)))))

(assert (=> d!155805 (= lt!643459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155805 (validMask!0 mask!2687)))

(assert (=> d!155805 (= (seekEntryOrOpen!0 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!643460)))

(assert (= (and d!155805 c!135903) b!1471913))

(assert (= (and d!155805 (not c!135903)) b!1471914))

(assert (= (and b!1471914 c!135904) b!1471917))

(assert (= (and b!1471914 (not c!135904)) b!1471918))

(assert (= (and b!1471918 c!135902) b!1471915))

(assert (= (and b!1471918 (not c!135902)) b!1471916))

(declare-fun m!1359015 () Bool)

(assert (=> b!1471914 m!1359015))

(assert (=> b!1471916 m!1358847))

(declare-fun m!1359017 () Bool)

(assert (=> b!1471916 m!1359017))

(declare-fun m!1359019 () Bool)

(assert (=> d!155805 m!1359019))

(declare-fun m!1359021 () Bool)

(assert (=> d!155805 m!1359021))

(assert (=> d!155805 m!1358879))

(assert (=> d!155805 m!1358847))

(assert (=> d!155805 m!1358881))

(assert (=> d!155805 m!1358847))

(assert (=> d!155805 m!1358879))

(declare-fun m!1359023 () Bool)

(assert (=> d!155805 m!1359023))

(assert (=> d!155805 m!1358855))

(assert (=> b!1471738 d!155805))

(declare-fun call!67792 () Bool)

(declare-fun bm!67789 () Bool)

(assert (=> bm!67789 (= call!67792 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1471919 () Bool)

(declare-fun e!826356 () Bool)

(assert (=> b!1471919 (= e!826356 call!67792)))

(declare-fun b!1471920 () Bool)

(declare-fun e!826358 () Bool)

(assert (=> b!1471920 (= e!826356 e!826358)))

(declare-fun lt!643462 () (_ BitVec 64))

(assert (=> b!1471920 (= lt!643462 (select (arr!47869 a!2862) j!93))))

(declare-fun lt!643463 () Unit!49385)

(assert (=> b!1471920 (= lt!643463 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643462 j!93))))

(assert (=> b!1471920 (arrayContainsKey!0 a!2862 lt!643462 #b00000000000000000000000000000000)))

(declare-fun lt!643464 () Unit!49385)

(assert (=> b!1471920 (= lt!643464 lt!643463)))

(declare-fun res!999151 () Bool)

(assert (=> b!1471920 (= res!999151 (= (seekEntryOrOpen!0 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) (Found!12006 j!93)))))

(assert (=> b!1471920 (=> (not res!999151) (not e!826358))))

(declare-fun d!155809 () Bool)

(declare-fun res!999152 () Bool)

(declare-fun e!826357 () Bool)

(assert (=> d!155809 (=> res!999152 e!826357)))

(assert (=> d!155809 (= res!999152 (bvsge j!93 (size!48420 a!2862)))))

(assert (=> d!155809 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!826357)))

(declare-fun b!1471921 () Bool)

(assert (=> b!1471921 (= e!826358 call!67792)))

(declare-fun b!1471922 () Bool)

(assert (=> b!1471922 (= e!826357 e!826356)))

(declare-fun c!135905 () Bool)

(assert (=> b!1471922 (= c!135905 (validKeyInArray!0 (select (arr!47869 a!2862) j!93)))))

(assert (= (and d!155809 (not res!999152)) b!1471922))

(assert (= (and b!1471922 c!135905) b!1471920))

(assert (= (and b!1471922 (not c!135905)) b!1471919))

(assert (= (and b!1471920 res!999151) b!1471921))

(assert (= (or b!1471921 b!1471919) bm!67789))

(declare-fun m!1359025 () Bool)

(assert (=> bm!67789 m!1359025))

(assert (=> b!1471920 m!1358847))

(declare-fun m!1359027 () Bool)

(assert (=> b!1471920 m!1359027))

(declare-fun m!1359029 () Bool)

(assert (=> b!1471920 m!1359029))

(assert (=> b!1471920 m!1358847))

(assert (=> b!1471920 m!1358849))

(assert (=> b!1471922 m!1358847))

(assert (=> b!1471922 m!1358847))

(assert (=> b!1471922 m!1358873))

(assert (=> b!1471738 d!155809))

(declare-fun d!155811 () Bool)

(assert (=> d!155811 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643467 () Unit!49385)

(declare-fun choose!38 (array!99172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49385)

(assert (=> d!155811 (= lt!643467 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155811 (validMask!0 mask!2687)))

(assert (=> d!155811 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643467)))

(declare-fun bs!42496 () Bool)

(assert (= bs!42496 d!155811))

(assert (=> bs!42496 m!1358851))

(declare-fun m!1359031 () Bool)

(assert (=> bs!42496 m!1359031))

(assert (=> bs!42496 m!1358855))

(assert (=> b!1471738 d!155811))

(declare-fun b!1471959 () Bool)

(declare-fun e!826377 () SeekEntryResult!12006)

(assert (=> b!1471959 (= e!826377 (Found!12006 index!646))))

(declare-fun e!826379 () SeekEntryResult!12006)

(declare-fun b!1471960 () Bool)

(assert (=> b!1471960 (= e!826379 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!643391 lt!643392 mask!2687))))

(declare-fun b!1471961 () Bool)

(declare-fun e!826378 () SeekEntryResult!12006)

(assert (=> b!1471961 (= e!826378 Undefined!12006)))

(declare-fun b!1471962 () Bool)

(assert (=> b!1471962 (= e!826378 e!826377)))

(declare-fun c!135924 () Bool)

(declare-fun lt!643484 () (_ BitVec 64))

(assert (=> b!1471962 (= c!135924 (= lt!643484 lt!643391))))

(declare-fun b!1471963 () Bool)

(assert (=> b!1471963 (= e!826379 (MissingVacant!12006 intermediateAfterIndex!19))))

(declare-fun lt!643485 () SeekEntryResult!12006)

(declare-fun d!155813 () Bool)

(assert (=> d!155813 (and (or ((_ is Undefined!12006) lt!643485) (not ((_ is Found!12006) lt!643485)) (and (bvsge (index!50417 lt!643485) #b00000000000000000000000000000000) (bvslt (index!50417 lt!643485) (size!48420 lt!643392)))) (or ((_ is Undefined!12006) lt!643485) ((_ is Found!12006) lt!643485) (not ((_ is MissingVacant!12006) lt!643485)) (not (= (index!50419 lt!643485) intermediateAfterIndex!19)) (and (bvsge (index!50419 lt!643485) #b00000000000000000000000000000000) (bvslt (index!50419 lt!643485) (size!48420 lt!643392)))) (or ((_ is Undefined!12006) lt!643485) (ite ((_ is Found!12006) lt!643485) (= (select (arr!47869 lt!643392) (index!50417 lt!643485)) lt!643391) (and ((_ is MissingVacant!12006) lt!643485) (= (index!50419 lt!643485) intermediateAfterIndex!19) (= (select (arr!47869 lt!643392) (index!50419 lt!643485)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155813 (= lt!643485 e!826378)))

(declare-fun c!135925 () Bool)

(assert (=> d!155813 (= c!135925 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155813 (= lt!643484 (select (arr!47869 lt!643392) index!646))))

(assert (=> d!155813 (validMask!0 mask!2687)))

(assert (=> d!155813 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643391 lt!643392 mask!2687) lt!643485)))

(declare-fun b!1471964 () Bool)

(declare-fun c!135926 () Bool)

(assert (=> b!1471964 (= c!135926 (= lt!643484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471964 (= e!826377 e!826379)))

(assert (= (and d!155813 c!135925) b!1471961))

(assert (= (and d!155813 (not c!135925)) b!1471962))

(assert (= (and b!1471962 c!135924) b!1471959))

(assert (= (and b!1471962 (not c!135924)) b!1471964))

(assert (= (and b!1471964 c!135926) b!1471963))

(assert (= (and b!1471964 (not c!135926)) b!1471960))

(assert (=> b!1471960 m!1358989))

(assert (=> b!1471960 m!1358989))

(declare-fun m!1359053 () Bool)

(assert (=> b!1471960 m!1359053))

(declare-fun m!1359055 () Bool)

(assert (=> d!155813 m!1359055))

(declare-fun m!1359057 () Bool)

(assert (=> d!155813 m!1359057))

(declare-fun m!1359059 () Bool)

(assert (=> d!155813 m!1359059))

(assert (=> d!155813 m!1358855))

(assert (=> b!1471737 d!155813))

(declare-fun b!1471965 () Bool)

(declare-fun e!826382 () SeekEntryResult!12006)

(assert (=> b!1471965 (= e!826382 Undefined!12006)))

(declare-fun b!1471966 () Bool)

(declare-fun e!826380 () SeekEntryResult!12006)

(assert (=> b!1471966 (= e!826382 e!826380)))

(declare-fun lt!643488 () (_ BitVec 64))

(declare-fun lt!643486 () SeekEntryResult!12006)

(assert (=> b!1471966 (= lt!643488 (select (arr!47869 lt!643392) (index!50418 lt!643486)))))

(declare-fun c!135929 () Bool)

(assert (=> b!1471966 (= c!135929 (= lt!643488 lt!643391))))

(declare-fun b!1471967 () Bool)

(declare-fun e!826381 () SeekEntryResult!12006)

(assert (=> b!1471967 (= e!826381 (MissingZero!12006 (index!50418 lt!643486)))))

(declare-fun b!1471968 () Bool)

(assert (=> b!1471968 (= e!826381 (seekKeyOrZeroReturnVacant!0 (x!132176 lt!643486) (index!50418 lt!643486) (index!50418 lt!643486) lt!643391 lt!643392 mask!2687))))

(declare-fun b!1471969 () Bool)

(assert (=> b!1471969 (= e!826380 (Found!12006 (index!50418 lt!643486)))))

(declare-fun b!1471970 () Bool)

(declare-fun c!135927 () Bool)

(assert (=> b!1471970 (= c!135927 (= lt!643488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471970 (= e!826380 e!826381)))

(declare-fun d!155821 () Bool)

(declare-fun lt!643487 () SeekEntryResult!12006)

(assert (=> d!155821 (and (or ((_ is Undefined!12006) lt!643487) (not ((_ is Found!12006) lt!643487)) (and (bvsge (index!50417 lt!643487) #b00000000000000000000000000000000) (bvslt (index!50417 lt!643487) (size!48420 lt!643392)))) (or ((_ is Undefined!12006) lt!643487) ((_ is Found!12006) lt!643487) (not ((_ is MissingZero!12006) lt!643487)) (and (bvsge (index!50416 lt!643487) #b00000000000000000000000000000000) (bvslt (index!50416 lt!643487) (size!48420 lt!643392)))) (or ((_ is Undefined!12006) lt!643487) ((_ is Found!12006) lt!643487) ((_ is MissingZero!12006) lt!643487) (not ((_ is MissingVacant!12006) lt!643487)) (and (bvsge (index!50419 lt!643487) #b00000000000000000000000000000000) (bvslt (index!50419 lt!643487) (size!48420 lt!643392)))) (or ((_ is Undefined!12006) lt!643487) (ite ((_ is Found!12006) lt!643487) (= (select (arr!47869 lt!643392) (index!50417 lt!643487)) lt!643391) (ite ((_ is MissingZero!12006) lt!643487) (= (select (arr!47869 lt!643392) (index!50416 lt!643487)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12006) lt!643487) (= (select (arr!47869 lt!643392) (index!50419 lt!643487)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155821 (= lt!643487 e!826382)))

(declare-fun c!135928 () Bool)

(assert (=> d!155821 (= c!135928 (and ((_ is Intermediate!12006) lt!643486) (undefined!12818 lt!643486)))))

(assert (=> d!155821 (= lt!643486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643391 mask!2687) lt!643391 lt!643392 mask!2687))))

(assert (=> d!155821 (validMask!0 mask!2687)))

(assert (=> d!155821 (= (seekEntryOrOpen!0 lt!643391 lt!643392 mask!2687) lt!643487)))

(assert (= (and d!155821 c!135928) b!1471965))

(assert (= (and d!155821 (not c!135928)) b!1471966))

(assert (= (and b!1471966 c!135929) b!1471969))

(assert (= (and b!1471966 (not c!135929)) b!1471970))

(assert (= (and b!1471970 c!135927) b!1471967))

(assert (= (and b!1471970 (not c!135927)) b!1471968))

(declare-fun m!1359061 () Bool)

(assert (=> b!1471966 m!1359061))

(declare-fun m!1359063 () Bool)

(assert (=> b!1471968 m!1359063))

(declare-fun m!1359065 () Bool)

(assert (=> d!155821 m!1359065))

(declare-fun m!1359067 () Bool)

(assert (=> d!155821 m!1359067))

(assert (=> d!155821 m!1358863))

(assert (=> d!155821 m!1358865))

(assert (=> d!155821 m!1358863))

(declare-fun m!1359069 () Bool)

(assert (=> d!155821 m!1359069))

(assert (=> d!155821 m!1358855))

(assert (=> b!1471737 d!155821))

(declare-fun b!1471979 () Bool)

(declare-fun lt!643496 () SeekEntryResult!12006)

(assert (=> b!1471979 (and (bvsge (index!50418 lt!643496) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643496) (size!48420 lt!643392)))))

(declare-fun e!826390 () Bool)

(assert (=> b!1471979 (= e!826390 (= (select (arr!47869 lt!643392) (index!50418 lt!643496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471980 () Bool)

(declare-fun e!826392 () SeekEntryResult!12006)

(assert (=> b!1471980 (= e!826392 (Intermediate!12006 false index!646 x!665))))

(declare-fun b!1471981 () Bool)

(declare-fun e!826393 () Bool)

(declare-fun e!826391 () Bool)

(assert (=> b!1471981 (= e!826393 e!826391)))

(declare-fun res!999157 () Bool)

(assert (=> b!1471981 (= res!999157 (and ((_ is Intermediate!12006) lt!643496) (not (undefined!12818 lt!643496)) (bvslt (x!132176 lt!643496) #b01111111111111111111111111111110) (bvsge (x!132176 lt!643496) #b00000000000000000000000000000000) (bvsge (x!132176 lt!643496) x!665)))))

(assert (=> b!1471981 (=> (not res!999157) (not e!826391))))

(declare-fun b!1471982 () Bool)

(declare-fun e!826389 () SeekEntryResult!12006)

(assert (=> b!1471982 (= e!826389 (Intermediate!12006 true index!646 x!665))))

(declare-fun b!1471983 () Bool)

(assert (=> b!1471983 (= e!826392 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!643391 lt!643392 mask!2687))))

(declare-fun b!1471984 () Bool)

(assert (=> b!1471984 (and (bvsge (index!50418 lt!643496) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643496) (size!48420 lt!643392)))))

(declare-fun res!999158 () Bool)

(assert (=> b!1471984 (= res!999158 (= (select (arr!47869 lt!643392) (index!50418 lt!643496)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471984 (=> res!999158 e!826390)))

(declare-fun d!155823 () Bool)

(assert (=> d!155823 e!826393))

(declare-fun c!135934 () Bool)

(assert (=> d!155823 (= c!135934 (and ((_ is Intermediate!12006) lt!643496) (undefined!12818 lt!643496)))))

(assert (=> d!155823 (= lt!643496 e!826389)))

(declare-fun c!135932 () Bool)

(assert (=> d!155823 (= c!135932 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643495 () (_ BitVec 64))

(assert (=> d!155823 (= lt!643495 (select (arr!47869 lt!643392) index!646))))

(assert (=> d!155823 (validMask!0 mask!2687)))

(assert (=> d!155823 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643391 lt!643392 mask!2687) lt!643496)))

(declare-fun b!1471985 () Bool)

(assert (=> b!1471985 (= e!826393 (bvsge (x!132176 lt!643496) #b01111111111111111111111111111110))))

(declare-fun b!1471986 () Bool)

(assert (=> b!1471986 (and (bvsge (index!50418 lt!643496) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643496) (size!48420 lt!643392)))))

(declare-fun res!999159 () Bool)

(assert (=> b!1471986 (= res!999159 (= (select (arr!47869 lt!643392) (index!50418 lt!643496)) lt!643391))))

(assert (=> b!1471986 (=> res!999159 e!826390)))

(assert (=> b!1471986 (= e!826391 e!826390)))

(declare-fun b!1471987 () Bool)

(assert (=> b!1471987 (= e!826389 e!826392)))

(declare-fun c!135933 () Bool)

(assert (=> b!1471987 (= c!135933 (or (= lt!643495 lt!643391) (= (bvadd lt!643495 lt!643495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155823 c!135932) b!1471982))

(assert (= (and d!155823 (not c!135932)) b!1471987))

(assert (= (and b!1471987 c!135933) b!1471980))

(assert (= (and b!1471987 (not c!135933)) b!1471983))

(assert (= (and d!155823 c!135934) b!1471985))

(assert (= (and d!155823 (not c!135934)) b!1471981))

(assert (= (and b!1471981 res!999157) b!1471986))

(assert (= (and b!1471986 (not res!999159)) b!1471984))

(assert (= (and b!1471984 (not res!999158)) b!1471979))

(declare-fun m!1359071 () Bool)

(assert (=> b!1471984 m!1359071))

(assert (=> d!155823 m!1359059))

(assert (=> d!155823 m!1358855))

(assert (=> b!1471983 m!1358989))

(assert (=> b!1471983 m!1358989))

(declare-fun m!1359073 () Bool)

(assert (=> b!1471983 m!1359073))

(assert (=> b!1471979 m!1359071))

(assert (=> b!1471986 m!1359071))

(assert (=> b!1471742 d!155823))

(declare-fun b!1471988 () Bool)

(declare-fun lt!643498 () SeekEntryResult!12006)

(assert (=> b!1471988 (and (bvsge (index!50418 lt!643498) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643498) (size!48420 a!2862)))))

(declare-fun e!826395 () Bool)

(assert (=> b!1471988 (= e!826395 (= (select (arr!47869 a!2862) (index!50418 lt!643498)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826397 () SeekEntryResult!12006)

(declare-fun b!1471989 () Bool)

(assert (=> b!1471989 (= e!826397 (Intermediate!12006 false (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471990 () Bool)

(declare-fun e!826398 () Bool)

(declare-fun e!826396 () Bool)

(assert (=> b!1471990 (= e!826398 e!826396)))

(declare-fun res!999160 () Bool)

(assert (=> b!1471990 (= res!999160 (and ((_ is Intermediate!12006) lt!643498) (not (undefined!12818 lt!643498)) (bvslt (x!132176 lt!643498) #b01111111111111111111111111111110) (bvsge (x!132176 lt!643498) #b00000000000000000000000000000000) (bvsge (x!132176 lt!643498) #b00000000000000000000000000000000)))))

(assert (=> b!1471990 (=> (not res!999160) (not e!826396))))

(declare-fun b!1471991 () Bool)

(declare-fun e!826394 () SeekEntryResult!12006)

(assert (=> b!1471991 (= e!826394 (Intermediate!12006 true (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471992 () Bool)

(assert (=> b!1471992 (= e!826397 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471993 () Bool)

(assert (=> b!1471993 (and (bvsge (index!50418 lt!643498) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643498) (size!48420 a!2862)))))

(declare-fun res!999161 () Bool)

(assert (=> b!1471993 (= res!999161 (= (select (arr!47869 a!2862) (index!50418 lt!643498)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471993 (=> res!999161 e!826395)))

(declare-fun d!155825 () Bool)

(assert (=> d!155825 e!826398))

(declare-fun c!135937 () Bool)

(assert (=> d!155825 (= c!135937 (and ((_ is Intermediate!12006) lt!643498) (undefined!12818 lt!643498)))))

(assert (=> d!155825 (= lt!643498 e!826394)))

(declare-fun c!135935 () Bool)

(assert (=> d!155825 (= c!135935 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643497 () (_ BitVec 64))

(assert (=> d!155825 (= lt!643497 (select (arr!47869 a!2862) (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687)))))

(assert (=> d!155825 (validMask!0 mask!2687)))

(assert (=> d!155825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!643498)))

(declare-fun b!1471994 () Bool)

(assert (=> b!1471994 (= e!826398 (bvsge (x!132176 lt!643498) #b01111111111111111111111111111110))))

(declare-fun b!1471995 () Bool)

(assert (=> b!1471995 (and (bvsge (index!50418 lt!643498) #b00000000000000000000000000000000) (bvslt (index!50418 lt!643498) (size!48420 a!2862)))))

(declare-fun res!999162 () Bool)

(assert (=> b!1471995 (= res!999162 (= (select (arr!47869 a!2862) (index!50418 lt!643498)) (select (arr!47869 a!2862) j!93)))))

(assert (=> b!1471995 (=> res!999162 e!826395)))

(assert (=> b!1471995 (= e!826396 e!826395)))

(declare-fun b!1471996 () Bool)

(assert (=> b!1471996 (= e!826394 e!826397)))

(declare-fun c!135936 () Bool)

(assert (=> b!1471996 (= c!135936 (or (= lt!643497 (select (arr!47869 a!2862) j!93)) (= (bvadd lt!643497 lt!643497) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155825 c!135935) b!1471991))

(assert (= (and d!155825 (not c!135935)) b!1471996))

(assert (= (and b!1471996 c!135936) b!1471989))

(assert (= (and b!1471996 (not c!135936)) b!1471992))

(assert (= (and d!155825 c!135937) b!1471994))

(assert (= (and d!155825 (not c!135937)) b!1471990))

(assert (= (and b!1471990 res!999160) b!1471995))

(assert (= (and b!1471995 (not res!999162)) b!1471993))

(assert (= (and b!1471993 (not res!999161)) b!1471988))

(declare-fun m!1359075 () Bool)

(assert (=> b!1471993 m!1359075))

(assert (=> d!155825 m!1358879))

(declare-fun m!1359077 () Bool)

(assert (=> d!155825 m!1359077))

(assert (=> d!155825 m!1358855))

(assert (=> b!1471992 m!1358879))

(declare-fun m!1359079 () Bool)

(assert (=> b!1471992 m!1359079))

(assert (=> b!1471992 m!1359079))

(assert (=> b!1471992 m!1358847))

(declare-fun m!1359081 () Bool)

(assert (=> b!1471992 m!1359081))

(assert (=> b!1471988 m!1359075))

(assert (=> b!1471995 m!1359075))

(assert (=> b!1471732 d!155825))

(declare-fun d!155827 () Bool)

(declare-fun lt!643500 () (_ BitVec 32))

(declare-fun lt!643499 () (_ BitVec 32))

(assert (=> d!155827 (= lt!643500 (bvmul (bvxor lt!643499 (bvlshr lt!643499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155827 (= lt!643499 ((_ extract 31 0) (bvand (bvxor (select (arr!47869 a!2862) j!93) (bvlshr (select (arr!47869 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155827 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999141 (let ((h!35720 ((_ extract 31 0) (bvand (bvxor (select (arr!47869 a!2862) j!93) (bvlshr (select (arr!47869 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132180 (bvmul (bvxor h!35720 (bvlshr h!35720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132180 (bvlshr x!132180 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999141 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999141 #b00000000000000000000000000000000))))))

(assert (=> d!155827 (= (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (bvand (bvxor lt!643500 (bvlshr lt!643500 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1471732 d!155827))

(declare-fun d!155829 () Bool)

(assert (=> d!155829 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125886 d!155829))

(declare-fun d!155839 () Bool)

(assert (=> d!155839 (= (array_inv!37150 a!2862) (bvsge (size!48420 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125886 d!155839))

(declare-fun d!155841 () Bool)

(assert (=> d!155841 (= (validKeyInArray!0 (select (arr!47869 a!2862) j!93)) (and (not (= (select (arr!47869 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47869 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1471730 d!155841))

(declare-fun d!155843 () Bool)

(declare-fun res!999171 () Bool)

(declare-fun e!826421 () Bool)

(assert (=> d!155843 (=> res!999171 e!826421)))

(assert (=> d!155843 (= res!999171 (bvsge #b00000000000000000000000000000000 (size!48420 a!2862)))))

(assert (=> d!155843 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34354) e!826421)))

(declare-fun b!1472029 () Bool)

(declare-fun e!826422 () Bool)

(declare-fun e!826419 () Bool)

(assert (=> b!1472029 (= e!826422 e!826419)))

(declare-fun c!135950 () Bool)

(assert (=> b!1472029 (= c!135950 (validKeyInArray!0 (select (arr!47869 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67795 () Bool)

(declare-fun call!67798 () Bool)

(assert (=> bm!67795 (= call!67798 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135950 (Cons!34353 (select (arr!47869 a!2862) #b00000000000000000000000000000000) Nil!34354) Nil!34354)))))

(declare-fun b!1472030 () Bool)

(assert (=> b!1472030 (= e!826421 e!826422)))

(declare-fun res!999172 () Bool)

(assert (=> b!1472030 (=> (not res!999172) (not e!826422))))

(declare-fun e!826420 () Bool)

(assert (=> b!1472030 (= res!999172 (not e!826420))))

(declare-fun res!999173 () Bool)

(assert (=> b!1472030 (=> (not res!999173) (not e!826420))))

(assert (=> b!1472030 (= res!999173 (validKeyInArray!0 (select (arr!47869 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1472031 () Bool)

(assert (=> b!1472031 (= e!826419 call!67798)))

(declare-fun b!1472032 () Bool)

(assert (=> b!1472032 (= e!826419 call!67798)))

(declare-fun b!1472033 () Bool)

(declare-fun contains!9942 (List!34357 (_ BitVec 64)) Bool)

(assert (=> b!1472033 (= e!826420 (contains!9942 Nil!34354 (select (arr!47869 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155843 (not res!999171)) b!1472030))

(assert (= (and b!1472030 res!999173) b!1472033))

(assert (= (and b!1472030 res!999172) b!1472029))

(assert (= (and b!1472029 c!135950) b!1472032))

(assert (= (and b!1472029 (not c!135950)) b!1472031))

(assert (= (or b!1472032 b!1472031) bm!67795))

(assert (=> b!1472029 m!1358995))

(assert (=> b!1472029 m!1358995))

(assert (=> b!1472029 m!1359003))

(assert (=> bm!67795 m!1358995))

(declare-fun m!1359101 () Bool)

(assert (=> bm!67795 m!1359101))

(assert (=> b!1472030 m!1358995))

(assert (=> b!1472030 m!1358995))

(assert (=> b!1472030 m!1359003))

(assert (=> b!1472033 m!1358995))

(assert (=> b!1472033 m!1358995))

(declare-fun m!1359103 () Bool)

(assert (=> b!1472033 m!1359103))

(assert (=> b!1471731 d!155843))

(declare-fun d!155845 () Bool)

(assert (=> d!155845 (= (validKeyInArray!0 (select (arr!47869 a!2862) i!1006)) (and (not (= (select (arr!47869 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47869 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1471736 d!155845))

(check-sat (not b!1471920) (not b!1471857) (not d!155811) (not b!1471882) (not b!1471916) (not d!155823) (not bm!67788) (not b!1471960) (not b!1471992) (not b!1471922) (not b!1471880) (not d!155805) (not d!155799) (not bm!67789) (not b!1472030) (not b!1471983) (not bm!67795) (not d!155825) (not b!1472033) (not d!155795) (not d!155821) (not b!1471968) (not b!1471866) (not b!1472029) (not d!155813))
(check-sat)
