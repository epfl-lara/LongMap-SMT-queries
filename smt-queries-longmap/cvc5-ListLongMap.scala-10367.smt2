; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122016 () Bool)

(assert start!122016)

(declare-fun b!1416231 () Bool)

(declare-fun res!952281 () Bool)

(declare-fun e!801556 () Bool)

(assert (=> b!1416231 (=> (not res!952281) (not e!801556))))

(declare-datatypes ((array!96702 0))(
  ( (array!96703 (arr!46682 (Array (_ BitVec 32) (_ BitVec 64))) (size!47232 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96702)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416231 (= res!952281 (validKeyInArray!0 (select (arr!46682 a!2901) i!1037)))))

(declare-fun b!1416232 () Bool)

(declare-fun e!801554 () Bool)

(declare-fun e!801553 () Bool)

(assert (=> b!1416232 (= e!801554 e!801553)))

(declare-fun res!952278 () Bool)

(assert (=> b!1416232 (=> res!952278 e!801553)))

(declare-datatypes ((SeekEntryResult!10993 0))(
  ( (MissingZero!10993 (index!46364 (_ BitVec 32))) (Found!10993 (index!46365 (_ BitVec 32))) (Intermediate!10993 (undefined!11805 Bool) (index!46366 (_ BitVec 32)) (x!127968 (_ BitVec 32))) (Undefined!10993) (MissingVacant!10993 (index!46367 (_ BitVec 32))) )
))
(declare-fun lt!624790 () SeekEntryResult!10993)

(declare-fun lt!624789 () (_ BitVec 32))

(declare-fun lt!624792 () SeekEntryResult!10993)

(assert (=> b!1416232 (= res!952278 (or (bvslt (x!127968 lt!624790) #b00000000000000000000000000000000) (bvsgt (x!127968 lt!624790) #b01111111111111111111111111111110) (bvslt (x!127968 lt!624792) #b00000000000000000000000000000000) (bvsgt (x!127968 lt!624792) #b01111111111111111111111111111110) (bvslt lt!624789 #b00000000000000000000000000000000) (bvsge lt!624789 (size!47232 a!2901)) (bvslt (index!46366 lt!624790) #b00000000000000000000000000000000) (bvsge (index!46366 lt!624790) (size!47232 a!2901)) (bvslt (index!46366 lt!624792) #b00000000000000000000000000000000) (bvsge (index!46366 lt!624792) (size!47232 a!2901)) (not (= lt!624790 (Intermediate!10993 false (index!46366 lt!624790) (x!127968 lt!624790)))) (not (= lt!624792 (Intermediate!10993 false (index!46366 lt!624792) (x!127968 lt!624792))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624787 () SeekEntryResult!10993)

(declare-fun lt!624788 () array!96702)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96702 (_ BitVec 32)) SeekEntryResult!10993)

(assert (=> b!1416232 (= lt!624787 (seekKeyOrZeroReturnVacant!0 (x!127968 lt!624792) (index!46366 lt!624792) (index!46366 lt!624792) (select (arr!46682 a!2901) j!112) lt!624788 mask!2840))))

(declare-fun lt!624786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96702 (_ BitVec 32)) SeekEntryResult!10993)

(assert (=> b!1416232 (= lt!624787 (seekEntryOrOpen!0 lt!624786 lt!624788 mask!2840))))

(assert (=> b!1416232 (and (not (undefined!11805 lt!624792)) (= (index!46366 lt!624792) i!1037) (bvslt (x!127968 lt!624792) (x!127968 lt!624790)) (= (select (store (arr!46682 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46366 lt!624792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47960 0))(
  ( (Unit!47961) )
))
(declare-fun lt!624783 () Unit!47960)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47960)

(assert (=> b!1416232 (= lt!624783 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624789 (x!127968 lt!624790) (index!46366 lt!624790) (x!127968 lt!624792) (index!46366 lt!624792) (undefined!11805 lt!624792) mask!2840))))

(declare-fun b!1416233 () Bool)

(assert (=> b!1416233 (= e!801553 true)))

(declare-fun lt!624784 () SeekEntryResult!10993)

(assert (=> b!1416233 (= lt!624784 lt!624787)))

(declare-fun lt!624791 () Unit!47960)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47960)

(assert (=> b!1416233 (= lt!624791 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624789 (x!127968 lt!624790) (index!46366 lt!624790) (x!127968 lt!624792) (index!46366 lt!624792) mask!2840))))

(declare-fun b!1416234 () Bool)

(declare-fun res!952273 () Bool)

(assert (=> b!1416234 (=> (not res!952273) (not e!801556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96702 (_ BitVec 32)) Bool)

(assert (=> b!1416234 (= res!952273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!952279 () Bool)

(assert (=> start!122016 (=> (not res!952279) (not e!801556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122016 (= res!952279 (validMask!0 mask!2840))))

(assert (=> start!122016 e!801556))

(assert (=> start!122016 true))

(declare-fun array_inv!35710 (array!96702) Bool)

(assert (=> start!122016 (array_inv!35710 a!2901)))

(declare-fun b!1416235 () Bool)

(declare-fun res!952280 () Bool)

(assert (=> b!1416235 (=> (not res!952280) (not e!801556))))

(assert (=> b!1416235 (= res!952280 (and (= (size!47232 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47232 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47232 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416236 () Bool)

(declare-fun res!952276 () Bool)

(assert (=> b!1416236 (=> res!952276 e!801553)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96702 (_ BitVec 32)) SeekEntryResult!10993)

(assert (=> b!1416236 (= res!952276 (not (= lt!624792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624789 lt!624786 lt!624788 mask!2840))))))

(declare-fun b!1416237 () Bool)

(declare-fun res!952277 () Bool)

(assert (=> b!1416237 (=> (not res!952277) (not e!801556))))

(assert (=> b!1416237 (= res!952277 (validKeyInArray!0 (select (arr!46682 a!2901) j!112)))))

(declare-fun b!1416238 () Bool)

(declare-fun e!801555 () Bool)

(assert (=> b!1416238 (= e!801555 e!801554)))

(declare-fun res!952274 () Bool)

(assert (=> b!1416238 (=> res!952274 e!801554)))

(assert (=> b!1416238 (= res!952274 (or (= lt!624790 lt!624792) (not (is-Intermediate!10993 lt!624792))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416238 (= lt!624792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624786 mask!2840) lt!624786 lt!624788 mask!2840))))

(assert (=> b!1416238 (= lt!624786 (select (store (arr!46682 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416238 (= lt!624788 (array!96703 (store (arr!46682 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47232 a!2901)))))

(declare-fun b!1416239 () Bool)

(declare-fun res!952275 () Bool)

(assert (=> b!1416239 (=> (not res!952275) (not e!801556))))

(declare-datatypes ((List!33201 0))(
  ( (Nil!33198) (Cons!33197 (h!34484 (_ BitVec 64)) (t!47895 List!33201)) )
))
(declare-fun arrayNoDuplicates!0 (array!96702 (_ BitVec 32) List!33201) Bool)

(assert (=> b!1416239 (= res!952275 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33198))))

(declare-fun b!1416240 () Bool)

(assert (=> b!1416240 (= e!801556 (not e!801555))))

(declare-fun res!952282 () Bool)

(assert (=> b!1416240 (=> res!952282 e!801555)))

(assert (=> b!1416240 (= res!952282 (or (not (is-Intermediate!10993 lt!624790)) (undefined!11805 lt!624790)))))

(assert (=> b!1416240 (= lt!624784 (Found!10993 j!112))))

(assert (=> b!1416240 (= lt!624784 (seekEntryOrOpen!0 (select (arr!46682 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416240 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624785 () Unit!47960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47960)

(assert (=> b!1416240 (= lt!624785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416240 (= lt!624790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624789 (select (arr!46682 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416240 (= lt!624789 (toIndex!0 (select (arr!46682 a!2901) j!112) mask!2840))))

(assert (= (and start!122016 res!952279) b!1416235))

(assert (= (and b!1416235 res!952280) b!1416231))

(assert (= (and b!1416231 res!952281) b!1416237))

(assert (= (and b!1416237 res!952277) b!1416234))

(assert (= (and b!1416234 res!952273) b!1416239))

(assert (= (and b!1416239 res!952275) b!1416240))

(assert (= (and b!1416240 (not res!952282)) b!1416238))

(assert (= (and b!1416238 (not res!952274)) b!1416232))

(assert (= (and b!1416232 (not res!952278)) b!1416236))

(assert (= (and b!1416236 (not res!952276)) b!1416233))

(declare-fun m!1306845 () Bool)

(assert (=> b!1416231 m!1306845))

(assert (=> b!1416231 m!1306845))

(declare-fun m!1306847 () Bool)

(assert (=> b!1416231 m!1306847))

(declare-fun m!1306849 () Bool)

(assert (=> start!122016 m!1306849))

(declare-fun m!1306851 () Bool)

(assert (=> start!122016 m!1306851))

(declare-fun m!1306853 () Bool)

(assert (=> b!1416239 m!1306853))

(declare-fun m!1306855 () Bool)

(assert (=> b!1416240 m!1306855))

(declare-fun m!1306857 () Bool)

(assert (=> b!1416240 m!1306857))

(assert (=> b!1416240 m!1306855))

(declare-fun m!1306859 () Bool)

(assert (=> b!1416240 m!1306859))

(assert (=> b!1416240 m!1306855))

(declare-fun m!1306861 () Bool)

(assert (=> b!1416240 m!1306861))

(declare-fun m!1306863 () Bool)

(assert (=> b!1416240 m!1306863))

(assert (=> b!1416240 m!1306855))

(declare-fun m!1306865 () Bool)

(assert (=> b!1416240 m!1306865))

(declare-fun m!1306867 () Bool)

(assert (=> b!1416236 m!1306867))

(declare-fun m!1306869 () Bool)

(assert (=> b!1416234 m!1306869))

(assert (=> b!1416237 m!1306855))

(assert (=> b!1416237 m!1306855))

(declare-fun m!1306871 () Bool)

(assert (=> b!1416237 m!1306871))

(declare-fun m!1306873 () Bool)

(assert (=> b!1416238 m!1306873))

(assert (=> b!1416238 m!1306873))

(declare-fun m!1306875 () Bool)

(assert (=> b!1416238 m!1306875))

(declare-fun m!1306877 () Bool)

(assert (=> b!1416238 m!1306877))

(declare-fun m!1306879 () Bool)

(assert (=> b!1416238 m!1306879))

(declare-fun m!1306881 () Bool)

(assert (=> b!1416233 m!1306881))

(declare-fun m!1306883 () Bool)

(assert (=> b!1416232 m!1306883))

(declare-fun m!1306885 () Bool)

(assert (=> b!1416232 m!1306885))

(assert (=> b!1416232 m!1306855))

(declare-fun m!1306887 () Bool)

(assert (=> b!1416232 m!1306887))

(assert (=> b!1416232 m!1306855))

(declare-fun m!1306889 () Bool)

(assert (=> b!1416232 m!1306889))

(assert (=> b!1416232 m!1306877))

(push 1)

