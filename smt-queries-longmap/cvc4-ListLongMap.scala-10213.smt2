; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120334 () Bool)

(assert start!120334)

(declare-fun b!1400519 () Bool)

(declare-fun res!939032 () Bool)

(declare-fun e!792949 () Bool)

(assert (=> b!1400519 (=> (not res!939032) (not e!792949))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95743 0))(
  ( (array!95744 (arr!46222 (Array (_ BitVec 32) (_ BitVec 64))) (size!46772 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95743)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400519 (= res!939032 (and (= (size!46772 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46772 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46772 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!939033 () Bool)

(assert (=> start!120334 (=> (not res!939033) (not e!792949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120334 (= res!939033 (validMask!0 mask!2840))))

(assert (=> start!120334 e!792949))

(assert (=> start!120334 true))

(declare-fun array_inv!35250 (array!95743) Bool)

(assert (=> start!120334 (array_inv!35250 a!2901)))

(declare-fun b!1400520 () Bool)

(declare-fun e!792950 () Bool)

(assert (=> b!1400520 (= e!792950 true)))

(declare-fun lt!616265 () (_ BitVec 64))

(declare-fun lt!616264 () array!95743)

(declare-datatypes ((SeekEntryResult!10539 0))(
  ( (MissingZero!10539 (index!44533 (_ BitVec 32))) (Found!10539 (index!44534 (_ BitVec 32))) (Intermediate!10539 (undefined!11351 Bool) (index!44535 (_ BitVec 32)) (x!126174 (_ BitVec 32))) (Undefined!10539) (MissingVacant!10539 (index!44536 (_ BitVec 32))) )
))
(declare-fun lt!616269 () SeekEntryResult!10539)

(declare-fun lt!616262 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95743 (_ BitVec 32)) SeekEntryResult!10539)

(assert (=> b!1400520 (= lt!616269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616262 lt!616265 lt!616264 mask!2840))))

(declare-fun b!1400521 () Bool)

(declare-fun res!939037 () Bool)

(assert (=> b!1400521 (=> (not res!939037) (not e!792949))))

(declare-datatypes ((List!32741 0))(
  ( (Nil!32738) (Cons!32737 (h!33985 (_ BitVec 64)) (t!47435 List!32741)) )
))
(declare-fun arrayNoDuplicates!0 (array!95743 (_ BitVec 32) List!32741) Bool)

(assert (=> b!1400521 (= res!939037 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32738))))

(declare-fun b!1400522 () Bool)

(declare-fun e!792952 () Bool)

(assert (=> b!1400522 (= e!792952 e!792950)))

(declare-fun res!939039 () Bool)

(assert (=> b!1400522 (=> res!939039 e!792950)))

(declare-fun lt!616266 () SeekEntryResult!10539)

(declare-fun lt!616268 () SeekEntryResult!10539)

(assert (=> b!1400522 (= res!939039 (or (bvslt (x!126174 lt!616268) #b00000000000000000000000000000000) (bvsgt (x!126174 lt!616268) #b01111111111111111111111111111110) (bvslt (x!126174 lt!616266) #b00000000000000000000000000000000) (bvsgt (x!126174 lt!616266) #b01111111111111111111111111111110) (bvslt lt!616262 #b00000000000000000000000000000000) (bvsge lt!616262 (size!46772 a!2901)) (bvslt (index!44535 lt!616268) #b00000000000000000000000000000000) (bvsge (index!44535 lt!616268) (size!46772 a!2901)) (bvslt (index!44535 lt!616266) #b00000000000000000000000000000000) (bvsge (index!44535 lt!616266) (size!46772 a!2901)) (not (= lt!616268 (Intermediate!10539 false (index!44535 lt!616268) (x!126174 lt!616268)))) (not (= lt!616266 (Intermediate!10539 false (index!44535 lt!616266) (x!126174 lt!616266))))))))

(declare-fun e!792951 () Bool)

(assert (=> b!1400522 e!792951))

(declare-fun res!939040 () Bool)

(assert (=> b!1400522 (=> (not res!939040) (not e!792951))))

(assert (=> b!1400522 (= res!939040 (and (not (undefined!11351 lt!616266)) (= (index!44535 lt!616266) i!1037) (bvslt (x!126174 lt!616266) (x!126174 lt!616268)) (= (select (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44535 lt!616266)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47082 0))(
  ( (Unit!47083) )
))
(declare-fun lt!616263 () Unit!47082)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47082)

(assert (=> b!1400522 (= lt!616263 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616262 (x!126174 lt!616268) (index!44535 lt!616268) (x!126174 lt!616266) (index!44535 lt!616266) (undefined!11351 lt!616266) mask!2840))))

(declare-fun b!1400523 () Bool)

(declare-fun res!939036 () Bool)

(assert (=> b!1400523 (=> (not res!939036) (not e!792949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400523 (= res!939036 (validKeyInArray!0 (select (arr!46222 a!2901) i!1037)))))

(declare-fun b!1400524 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95743 (_ BitVec 32)) SeekEntryResult!10539)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95743 (_ BitVec 32)) SeekEntryResult!10539)

(assert (=> b!1400524 (= e!792951 (= (seekEntryOrOpen!0 lt!616265 lt!616264 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126174 lt!616266) (index!44535 lt!616266) (index!44535 lt!616266) (select (arr!46222 a!2901) j!112) lt!616264 mask!2840)))))

(declare-fun e!792953 () Bool)

(declare-fun b!1400525 () Bool)

(assert (=> b!1400525 (= e!792953 (= (seekEntryOrOpen!0 (select (arr!46222 a!2901) j!112) a!2901 mask!2840) (Found!10539 j!112)))))

(declare-fun b!1400526 () Bool)

(declare-fun e!792948 () Bool)

(assert (=> b!1400526 (= e!792948 e!792952)))

(declare-fun res!939035 () Bool)

(assert (=> b!1400526 (=> res!939035 e!792952)))

(assert (=> b!1400526 (= res!939035 (or (= lt!616268 lt!616266) (not (is-Intermediate!10539 lt!616266))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400526 (= lt!616266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616265 mask!2840) lt!616265 lt!616264 mask!2840))))

(assert (=> b!1400526 (= lt!616265 (select (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400526 (= lt!616264 (array!95744 (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46772 a!2901)))))

(declare-fun b!1400527 () Bool)

(assert (=> b!1400527 (= e!792949 (not e!792948))))

(declare-fun res!939038 () Bool)

(assert (=> b!1400527 (=> res!939038 e!792948)))

(assert (=> b!1400527 (= res!939038 (or (not (is-Intermediate!10539 lt!616268)) (undefined!11351 lt!616268)))))

(assert (=> b!1400527 e!792953))

(declare-fun res!939030 () Bool)

(assert (=> b!1400527 (=> (not res!939030) (not e!792953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95743 (_ BitVec 32)) Bool)

(assert (=> b!1400527 (= res!939030 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616267 () Unit!47082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47082)

(assert (=> b!1400527 (= lt!616267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400527 (= lt!616268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616262 (select (arr!46222 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400527 (= lt!616262 (toIndex!0 (select (arr!46222 a!2901) j!112) mask!2840))))

(declare-fun b!1400528 () Bool)

(declare-fun res!939031 () Bool)

(assert (=> b!1400528 (=> (not res!939031) (not e!792949))))

(assert (=> b!1400528 (= res!939031 (validKeyInArray!0 (select (arr!46222 a!2901) j!112)))))

(declare-fun b!1400529 () Bool)

(declare-fun res!939034 () Bool)

(assert (=> b!1400529 (=> (not res!939034) (not e!792949))))

(assert (=> b!1400529 (= res!939034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120334 res!939033) b!1400519))

(assert (= (and b!1400519 res!939032) b!1400523))

(assert (= (and b!1400523 res!939036) b!1400528))

(assert (= (and b!1400528 res!939031) b!1400529))

(assert (= (and b!1400529 res!939034) b!1400521))

(assert (= (and b!1400521 res!939037) b!1400527))

(assert (= (and b!1400527 res!939030) b!1400525))

(assert (= (and b!1400527 (not res!939038)) b!1400526))

(assert (= (and b!1400526 (not res!939035)) b!1400522))

(assert (= (and b!1400522 res!939040) b!1400524))

(assert (= (and b!1400522 (not res!939039)) b!1400520))

(declare-fun m!1287997 () Bool)

(assert (=> b!1400520 m!1287997))

(declare-fun m!1287999 () Bool)

(assert (=> b!1400526 m!1287999))

(assert (=> b!1400526 m!1287999))

(declare-fun m!1288001 () Bool)

(assert (=> b!1400526 m!1288001))

(declare-fun m!1288003 () Bool)

(assert (=> b!1400526 m!1288003))

(declare-fun m!1288005 () Bool)

(assert (=> b!1400526 m!1288005))

(declare-fun m!1288007 () Bool)

(assert (=> b!1400528 m!1288007))

(assert (=> b!1400528 m!1288007))

(declare-fun m!1288009 () Bool)

(assert (=> b!1400528 m!1288009))

(declare-fun m!1288011 () Bool)

(assert (=> b!1400529 m!1288011))

(declare-fun m!1288013 () Bool)

(assert (=> b!1400524 m!1288013))

(assert (=> b!1400524 m!1288007))

(assert (=> b!1400524 m!1288007))

(declare-fun m!1288015 () Bool)

(assert (=> b!1400524 m!1288015))

(assert (=> b!1400522 m!1288003))

(declare-fun m!1288017 () Bool)

(assert (=> b!1400522 m!1288017))

(declare-fun m!1288019 () Bool)

(assert (=> b!1400522 m!1288019))

(declare-fun m!1288021 () Bool)

(assert (=> start!120334 m!1288021))

(declare-fun m!1288023 () Bool)

(assert (=> start!120334 m!1288023))

(assert (=> b!1400525 m!1288007))

(assert (=> b!1400525 m!1288007))

(declare-fun m!1288025 () Bool)

(assert (=> b!1400525 m!1288025))

(assert (=> b!1400527 m!1288007))

(declare-fun m!1288027 () Bool)

(assert (=> b!1400527 m!1288027))

(assert (=> b!1400527 m!1288007))

(assert (=> b!1400527 m!1288007))

(declare-fun m!1288029 () Bool)

(assert (=> b!1400527 m!1288029))

(declare-fun m!1288031 () Bool)

(assert (=> b!1400527 m!1288031))

(declare-fun m!1288033 () Bool)

(assert (=> b!1400527 m!1288033))

(declare-fun m!1288035 () Bool)

(assert (=> b!1400523 m!1288035))

(assert (=> b!1400523 m!1288035))

(declare-fun m!1288037 () Bool)

(assert (=> b!1400523 m!1288037))

(declare-fun m!1288039 () Bool)

(assert (=> b!1400521 m!1288039))

(push 1)

