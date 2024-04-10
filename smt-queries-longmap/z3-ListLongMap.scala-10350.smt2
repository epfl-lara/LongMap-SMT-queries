; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121652 () Bool)

(assert start!121652)

(declare-fun b!1413396 () Bool)

(declare-fun e!799875 () Bool)

(declare-fun e!799876 () Bool)

(assert (=> b!1413396 (= e!799875 (not e!799876))))

(declare-fun res!950389 () Bool)

(assert (=> b!1413396 (=> res!950389 e!799876)))

(declare-datatypes ((SeekEntryResult!10943 0))(
  ( (MissingZero!10943 (index!46152 (_ BitVec 32))) (Found!10943 (index!46153 (_ BitVec 32))) (Intermediate!10943 (undefined!11755 Bool) (index!46154 (_ BitVec 32)) (x!127734 (_ BitVec 32))) (Undefined!10943) (MissingVacant!10943 (index!46155 (_ BitVec 32))) )
))
(declare-fun lt!623006 () SeekEntryResult!10943)

(get-info :version)

(assert (=> b!1413396 (= res!950389 (or (not ((_ is Intermediate!10943) lt!623006)) (undefined!11755 lt!623006)))))

(declare-fun e!799877 () Bool)

(assert (=> b!1413396 e!799877))

(declare-fun res!950392 () Bool)

(assert (=> b!1413396 (=> (not res!950392) (not e!799877))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96590 0))(
  ( (array!96591 (arr!46632 (Array (_ BitVec 32) (_ BitVec 64))) (size!47182 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96590)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96590 (_ BitVec 32)) Bool)

(assert (=> b!1413396 (= res!950392 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47860 0))(
  ( (Unit!47861) )
))
(declare-fun lt!623005 () Unit!47860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47860)

(assert (=> b!1413396 (= lt!623005 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623007 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96590 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1413396 (= lt!623006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623007 (select (arr!46632 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413396 (= lt!623007 (toIndex!0 (select (arr!46632 a!2901) j!112) mask!2840))))

(declare-fun res!950388 () Bool)

(assert (=> start!121652 (=> (not res!950388) (not e!799875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121652 (= res!950388 (validMask!0 mask!2840))))

(assert (=> start!121652 e!799875))

(assert (=> start!121652 true))

(declare-fun array_inv!35660 (array!96590) Bool)

(assert (=> start!121652 (array_inv!35660 a!2901)))

(declare-fun b!1413397 () Bool)

(declare-fun res!950394 () Bool)

(assert (=> b!1413397 (=> (not res!950394) (not e!799875))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413397 (= res!950394 (and (= (size!47182 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47182 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47182 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413398 () Bool)

(declare-fun res!950393 () Bool)

(assert (=> b!1413398 (=> (not res!950393) (not e!799875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413398 (= res!950393 (validKeyInArray!0 (select (arr!46632 a!2901) i!1037)))))

(declare-fun b!1413399 () Bool)

(declare-fun res!950395 () Bool)

(assert (=> b!1413399 (=> (not res!950395) (not e!799875))))

(assert (=> b!1413399 (= res!950395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413400 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96590 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1413400 (= e!799877 (= (seekEntryOrOpen!0 (select (arr!46632 a!2901) j!112) a!2901 mask!2840) (Found!10943 j!112)))))

(declare-fun lt!623004 () array!96590)

(declare-fun lt!623009 () SeekEntryResult!10943)

(declare-fun b!1413401 () Bool)

(declare-fun lt!623008 () (_ BitVec 64))

(declare-fun e!799878 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96590 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1413401 (= e!799878 (= (seekEntryOrOpen!0 lt!623008 lt!623004 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127734 lt!623009) (index!46154 lt!623009) (index!46154 lt!623009) (select (arr!46632 a!2901) j!112) lt!623004 mask!2840)))))

(declare-fun b!1413402 () Bool)

(declare-fun res!950391 () Bool)

(assert (=> b!1413402 (=> (not res!950391) (not e!799875))))

(assert (=> b!1413402 (= res!950391 (validKeyInArray!0 (select (arr!46632 a!2901) j!112)))))

(declare-fun b!1413403 () Bool)

(declare-fun e!799880 () Bool)

(assert (=> b!1413403 (= e!799876 e!799880)))

(declare-fun res!950387 () Bool)

(assert (=> b!1413403 (=> res!950387 e!799880)))

(assert (=> b!1413403 (= res!950387 (or (= lt!623006 lt!623009) (not ((_ is Intermediate!10943) lt!623009))))))

(assert (=> b!1413403 (= lt!623009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623008 mask!2840) lt!623008 lt!623004 mask!2840))))

(assert (=> b!1413403 (= lt!623008 (select (store (arr!46632 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413403 (= lt!623004 (array!96591 (store (arr!46632 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47182 a!2901)))))

(declare-fun b!1413404 () Bool)

(assert (=> b!1413404 (= e!799880 true)))

(assert (=> b!1413404 e!799878))

(declare-fun res!950386 () Bool)

(assert (=> b!1413404 (=> (not res!950386) (not e!799878))))

(assert (=> b!1413404 (= res!950386 (and (not (undefined!11755 lt!623009)) (= (index!46154 lt!623009) i!1037) (bvslt (x!127734 lt!623009) (x!127734 lt!623006)) (= (select (store (arr!46632 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46154 lt!623009)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623010 () Unit!47860)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47860)

(assert (=> b!1413404 (= lt!623010 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623007 (x!127734 lt!623006) (index!46154 lt!623006) (x!127734 lt!623009) (index!46154 lt!623009) (undefined!11755 lt!623009) mask!2840))))

(declare-fun b!1413405 () Bool)

(declare-fun res!950390 () Bool)

(assert (=> b!1413405 (=> (not res!950390) (not e!799875))))

(declare-datatypes ((List!33151 0))(
  ( (Nil!33148) (Cons!33147 (h!34422 (_ BitVec 64)) (t!47845 List!33151)) )
))
(declare-fun arrayNoDuplicates!0 (array!96590 (_ BitVec 32) List!33151) Bool)

(assert (=> b!1413405 (= res!950390 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33148))))

(assert (= (and start!121652 res!950388) b!1413397))

(assert (= (and b!1413397 res!950394) b!1413398))

(assert (= (and b!1413398 res!950393) b!1413402))

(assert (= (and b!1413402 res!950391) b!1413399))

(assert (= (and b!1413399 res!950395) b!1413405))

(assert (= (and b!1413405 res!950390) b!1413396))

(assert (= (and b!1413396 res!950392) b!1413400))

(assert (= (and b!1413396 (not res!950389)) b!1413403))

(assert (= (and b!1413403 (not res!950387)) b!1413404))

(assert (= (and b!1413404 res!950386) b!1413401))

(declare-fun m!1303803 () Bool)

(assert (=> b!1413404 m!1303803))

(declare-fun m!1303805 () Bool)

(assert (=> b!1413404 m!1303805))

(declare-fun m!1303807 () Bool)

(assert (=> b!1413404 m!1303807))

(declare-fun m!1303809 () Bool)

(assert (=> b!1413402 m!1303809))

(assert (=> b!1413402 m!1303809))

(declare-fun m!1303811 () Bool)

(assert (=> b!1413402 m!1303811))

(declare-fun m!1303813 () Bool)

(assert (=> b!1413398 m!1303813))

(assert (=> b!1413398 m!1303813))

(declare-fun m!1303815 () Bool)

(assert (=> b!1413398 m!1303815))

(assert (=> b!1413396 m!1303809))

(declare-fun m!1303817 () Bool)

(assert (=> b!1413396 m!1303817))

(assert (=> b!1413396 m!1303809))

(assert (=> b!1413396 m!1303809))

(declare-fun m!1303819 () Bool)

(assert (=> b!1413396 m!1303819))

(declare-fun m!1303821 () Bool)

(assert (=> b!1413396 m!1303821))

(declare-fun m!1303823 () Bool)

(assert (=> b!1413396 m!1303823))

(declare-fun m!1303825 () Bool)

(assert (=> start!121652 m!1303825))

(declare-fun m!1303827 () Bool)

(assert (=> start!121652 m!1303827))

(assert (=> b!1413400 m!1303809))

(assert (=> b!1413400 m!1303809))

(declare-fun m!1303829 () Bool)

(assert (=> b!1413400 m!1303829))

(declare-fun m!1303831 () Bool)

(assert (=> b!1413403 m!1303831))

(assert (=> b!1413403 m!1303831))

(declare-fun m!1303833 () Bool)

(assert (=> b!1413403 m!1303833))

(assert (=> b!1413403 m!1303803))

(declare-fun m!1303835 () Bool)

(assert (=> b!1413403 m!1303835))

(declare-fun m!1303837 () Bool)

(assert (=> b!1413399 m!1303837))

(declare-fun m!1303839 () Bool)

(assert (=> b!1413401 m!1303839))

(assert (=> b!1413401 m!1303809))

(assert (=> b!1413401 m!1303809))

(declare-fun m!1303841 () Bool)

(assert (=> b!1413401 m!1303841))

(declare-fun m!1303843 () Bool)

(assert (=> b!1413405 m!1303843))

(check-sat (not b!1413405) (not b!1413403) (not b!1413402) (not b!1413399) (not b!1413400) (not b!1413404) (not b!1413396) (not start!121652) (not b!1413401) (not b!1413398))
(check-sat)
