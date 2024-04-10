; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121990 () Bool)

(assert start!121990)

(declare-fun b!1415831 () Bool)

(declare-fun e!801342 () Bool)

(declare-fun e!801340 () Bool)

(assert (=> b!1415831 (= e!801342 (not e!801340))))

(declare-fun res!951883 () Bool)

(assert (=> b!1415831 (=> res!951883 e!801340)))

(declare-datatypes ((SeekEntryResult!10980 0))(
  ( (MissingZero!10980 (index!46312 (_ BitVec 32))) (Found!10980 (index!46313 (_ BitVec 32))) (Intermediate!10980 (undefined!11792 Bool) (index!46314 (_ BitVec 32)) (x!127915 (_ BitVec 32))) (Undefined!10980) (MissingVacant!10980 (index!46315 (_ BitVec 32))) )
))
(declare-fun lt!624420 () SeekEntryResult!10980)

(assert (=> b!1415831 (= res!951883 (or (not (is-Intermediate!10980 lt!624420)) (undefined!11792 lt!624420)))))

(declare-fun e!801339 () Bool)

(assert (=> b!1415831 e!801339))

(declare-fun res!951874 () Bool)

(assert (=> b!1415831 (=> (not res!951874) (not e!801339))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96676 0))(
  ( (array!96677 (arr!46669 (Array (_ BitVec 32) (_ BitVec 64))) (size!47219 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96676)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96676 (_ BitVec 32)) Bool)

(assert (=> b!1415831 (= res!951874 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47934 0))(
  ( (Unit!47935) )
))
(declare-fun lt!624415 () Unit!47934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47934)

(assert (=> b!1415831 (= lt!624415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624414 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96676 (_ BitVec 32)) SeekEntryResult!10980)

(assert (=> b!1415831 (= lt!624420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624414 (select (arr!46669 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415831 (= lt!624414 (toIndex!0 (select (arr!46669 a!2901) j!112) mask!2840))))

(declare-fun b!1415832 () Bool)

(declare-fun res!951881 () Bool)

(assert (=> b!1415832 (=> (not res!951881) (not e!801342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415832 (= res!951881 (validKeyInArray!0 (select (arr!46669 a!2901) j!112)))))

(declare-fun b!1415833 () Bool)

(declare-fun res!951873 () Bool)

(assert (=> b!1415833 (=> (not res!951873) (not e!801342))))

(assert (=> b!1415833 (= res!951873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415834 () Bool)

(declare-fun e!801343 () Bool)

(assert (=> b!1415834 (= e!801340 e!801343)))

(declare-fun res!951880 () Bool)

(assert (=> b!1415834 (=> res!951880 e!801343)))

(declare-fun lt!624417 () SeekEntryResult!10980)

(assert (=> b!1415834 (= res!951880 (or (= lt!624420 lt!624417) (not (is-Intermediate!10980 lt!624417))))))

(declare-fun lt!624419 () array!96676)

(declare-fun lt!624413 () (_ BitVec 64))

(assert (=> b!1415834 (= lt!624417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624413 mask!2840) lt!624413 lt!624419 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415834 (= lt!624413 (select (store (arr!46669 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415834 (= lt!624419 (array!96677 (store (arr!46669 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47219 a!2901)))))

(declare-fun b!1415836 () Bool)

(declare-fun res!951882 () Bool)

(assert (=> b!1415836 (=> (not res!951882) (not e!801342))))

(assert (=> b!1415836 (= res!951882 (and (= (size!47219 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47219 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47219 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415837 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96676 (_ BitVec 32)) SeekEntryResult!10980)

(assert (=> b!1415837 (= e!801339 (= (seekEntryOrOpen!0 (select (arr!46669 a!2901) j!112) a!2901 mask!2840) (Found!10980 j!112)))))

(declare-fun b!1415838 () Bool)

(declare-fun e!801341 () Bool)

(assert (=> b!1415838 (= e!801341 true)))

(declare-fun lt!624416 () SeekEntryResult!10980)

(assert (=> b!1415838 (= lt!624416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624414 lt!624413 lt!624419 mask!2840))))

(declare-fun b!1415839 () Bool)

(declare-fun res!951875 () Bool)

(assert (=> b!1415839 (=> (not res!951875) (not e!801342))))

(declare-datatypes ((List!33188 0))(
  ( (Nil!33185) (Cons!33184 (h!34471 (_ BitVec 64)) (t!47882 List!33188)) )
))
(declare-fun arrayNoDuplicates!0 (array!96676 (_ BitVec 32) List!33188) Bool)

(assert (=> b!1415839 (= res!951875 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33185))))

(declare-fun e!801338 () Bool)

(declare-fun b!1415835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96676 (_ BitVec 32)) SeekEntryResult!10980)

(assert (=> b!1415835 (= e!801338 (= (seekEntryOrOpen!0 lt!624413 lt!624419 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127915 lt!624417) (index!46314 lt!624417) (index!46314 lt!624417) (select (arr!46669 a!2901) j!112) lt!624419 mask!2840)))))

(declare-fun res!951878 () Bool)

(assert (=> start!121990 (=> (not res!951878) (not e!801342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121990 (= res!951878 (validMask!0 mask!2840))))

(assert (=> start!121990 e!801342))

(assert (=> start!121990 true))

(declare-fun array_inv!35697 (array!96676) Bool)

(assert (=> start!121990 (array_inv!35697 a!2901)))

(declare-fun b!1415840 () Bool)

(declare-fun res!951876 () Bool)

(assert (=> b!1415840 (=> (not res!951876) (not e!801342))))

(assert (=> b!1415840 (= res!951876 (validKeyInArray!0 (select (arr!46669 a!2901) i!1037)))))

(declare-fun b!1415841 () Bool)

(assert (=> b!1415841 (= e!801343 e!801341)))

(declare-fun res!951879 () Bool)

(assert (=> b!1415841 (=> res!951879 e!801341)))

(assert (=> b!1415841 (= res!951879 (or (bvslt (x!127915 lt!624420) #b00000000000000000000000000000000) (bvsgt (x!127915 lt!624420) #b01111111111111111111111111111110) (bvslt (x!127915 lt!624417) #b00000000000000000000000000000000) (bvsgt (x!127915 lt!624417) #b01111111111111111111111111111110) (bvslt lt!624414 #b00000000000000000000000000000000) (bvsge lt!624414 (size!47219 a!2901)) (bvslt (index!46314 lt!624420) #b00000000000000000000000000000000) (bvsge (index!46314 lt!624420) (size!47219 a!2901)) (bvslt (index!46314 lt!624417) #b00000000000000000000000000000000) (bvsge (index!46314 lt!624417) (size!47219 a!2901)) (not (= lt!624420 (Intermediate!10980 false (index!46314 lt!624420) (x!127915 lt!624420)))) (not (= lt!624417 (Intermediate!10980 false (index!46314 lt!624417) (x!127915 lt!624417))))))))

(assert (=> b!1415841 e!801338))

(declare-fun res!951877 () Bool)

(assert (=> b!1415841 (=> (not res!951877) (not e!801338))))

(assert (=> b!1415841 (= res!951877 (and (not (undefined!11792 lt!624417)) (= (index!46314 lt!624417) i!1037) (bvslt (x!127915 lt!624417) (x!127915 lt!624420)) (= (select (store (arr!46669 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46314 lt!624417)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624418 () Unit!47934)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47934)

(assert (=> b!1415841 (= lt!624418 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624414 (x!127915 lt!624420) (index!46314 lt!624420) (x!127915 lt!624417) (index!46314 lt!624417) (undefined!11792 lt!624417) mask!2840))))

(assert (= (and start!121990 res!951878) b!1415836))

(assert (= (and b!1415836 res!951882) b!1415840))

(assert (= (and b!1415840 res!951876) b!1415832))

(assert (= (and b!1415832 res!951881) b!1415833))

(assert (= (and b!1415833 res!951873) b!1415839))

(assert (= (and b!1415839 res!951875) b!1415831))

(assert (= (and b!1415831 res!951874) b!1415837))

(assert (= (and b!1415831 (not res!951883)) b!1415834))

(assert (= (and b!1415834 (not res!951880)) b!1415841))

(assert (= (and b!1415841 res!951877) b!1415835))

(assert (= (and b!1415841 (not res!951879)) b!1415838))

(declare-fun m!1306255 () Bool)

(assert (=> b!1415839 m!1306255))

(declare-fun m!1306257 () Bool)

(assert (=> b!1415841 m!1306257))

(declare-fun m!1306259 () Bool)

(assert (=> b!1415841 m!1306259))

(declare-fun m!1306261 () Bool)

(assert (=> b!1415841 m!1306261))

(declare-fun m!1306263 () Bool)

(assert (=> b!1415832 m!1306263))

(assert (=> b!1415832 m!1306263))

(declare-fun m!1306265 () Bool)

(assert (=> b!1415832 m!1306265))

(declare-fun m!1306267 () Bool)

(assert (=> b!1415835 m!1306267))

(assert (=> b!1415835 m!1306263))

(assert (=> b!1415835 m!1306263))

(declare-fun m!1306269 () Bool)

(assert (=> b!1415835 m!1306269))

(assert (=> b!1415831 m!1306263))

(declare-fun m!1306271 () Bool)

(assert (=> b!1415831 m!1306271))

(assert (=> b!1415831 m!1306263))

(declare-fun m!1306273 () Bool)

(assert (=> b!1415831 m!1306273))

(assert (=> b!1415831 m!1306263))

(declare-fun m!1306275 () Bool)

(assert (=> b!1415831 m!1306275))

(declare-fun m!1306277 () Bool)

(assert (=> b!1415831 m!1306277))

(declare-fun m!1306279 () Bool)

(assert (=> b!1415840 m!1306279))

(assert (=> b!1415840 m!1306279))

(declare-fun m!1306281 () Bool)

(assert (=> b!1415840 m!1306281))

(declare-fun m!1306283 () Bool)

(assert (=> b!1415834 m!1306283))

(assert (=> b!1415834 m!1306283))

(declare-fun m!1306285 () Bool)

(assert (=> b!1415834 m!1306285))

(assert (=> b!1415834 m!1306257))

(declare-fun m!1306287 () Bool)

(assert (=> b!1415834 m!1306287))

(declare-fun m!1306289 () Bool)

(assert (=> start!121990 m!1306289))

(declare-fun m!1306291 () Bool)

(assert (=> start!121990 m!1306291))

(declare-fun m!1306293 () Bool)

(assert (=> b!1415838 m!1306293))

(assert (=> b!1415837 m!1306263))

(assert (=> b!1415837 m!1306263))

(declare-fun m!1306295 () Bool)

(assert (=> b!1415837 m!1306295))

(declare-fun m!1306297 () Bool)

(assert (=> b!1415833 m!1306297))

(push 1)

