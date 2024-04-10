; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121126 () Bool)

(assert start!121126)

(declare-fun res!946080 () Bool)

(declare-fun e!797056 () Bool)

(assert (=> start!121126 (=> (not res!946080) (not e!797056))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121126 (= res!946080 (validMask!0 mask!2840))))

(assert (=> start!121126 e!797056))

(assert (=> start!121126 true))

(declare-datatypes ((array!96280 0))(
  ( (array!96281 (arr!46483 (Array (_ BitVec 32) (_ BitVec 64))) (size!47033 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96280)

(declare-fun array_inv!35511 (array!96280) Bool)

(assert (=> start!121126 (array_inv!35511 a!2901)))

(declare-fun b!1408357 () Bool)

(declare-fun e!797057 () Bool)

(assert (=> b!1408357 (= e!797057 true)))

(declare-fun lt!620313 () (_ BitVec 64))

(declare-fun lt!620317 () array!96280)

(declare-datatypes ((SeekEntryResult!10794 0))(
  ( (MissingZero!10794 (index!45553 (_ BitVec 32))) (Found!10794 (index!45554 (_ BitVec 32))) (Intermediate!10794 (undefined!11606 Bool) (index!45555 (_ BitVec 32)) (x!127155 (_ BitVec 32))) (Undefined!10794) (MissingVacant!10794 (index!45556 (_ BitVec 32))) )
))
(declare-fun lt!620315 () SeekEntryResult!10794)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96280 (_ BitVec 32)) SeekEntryResult!10794)

(assert (=> b!1408357 (= lt!620315 (seekEntryOrOpen!0 lt!620313 lt!620317 mask!2840))))

(declare-datatypes ((Unit!47562 0))(
  ( (Unit!47563) )
))
(declare-fun lt!620316 () Unit!47562)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620314 () (_ BitVec 32))

(declare-fun lt!620319 () SeekEntryResult!10794)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47562)

(assert (=> b!1408357 (= lt!620316 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620314 (x!127155 lt!620319) (index!45555 lt!620319) mask!2840))))

(declare-fun b!1408358 () Bool)

(declare-fun e!797054 () Bool)

(assert (=> b!1408358 (= e!797056 (not e!797054))))

(declare-fun res!946083 () Bool)

(assert (=> b!1408358 (=> res!946083 e!797054)))

(assert (=> b!1408358 (= res!946083 (or (not (is-Intermediate!10794 lt!620319)) (undefined!11606 lt!620319)))))

(assert (=> b!1408358 (= lt!620315 (Found!10794 j!112))))

(assert (=> b!1408358 (= lt!620315 (seekEntryOrOpen!0 (select (arr!46483 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96280 (_ BitVec 32)) Bool)

(assert (=> b!1408358 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620318 () Unit!47562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47562)

(assert (=> b!1408358 (= lt!620318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96280 (_ BitVec 32)) SeekEntryResult!10794)

(assert (=> b!1408358 (= lt!620319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620314 (select (arr!46483 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408358 (= lt!620314 (toIndex!0 (select (arr!46483 a!2901) j!112) mask!2840))))

(declare-fun b!1408359 () Bool)

(assert (=> b!1408359 (= e!797054 e!797057)))

(declare-fun res!946084 () Bool)

(assert (=> b!1408359 (=> res!946084 e!797057)))

(assert (=> b!1408359 (= res!946084 (not (= lt!620319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620313 mask!2840) lt!620313 lt!620317 mask!2840))))))

(assert (=> b!1408359 (= lt!620313 (select (store (arr!46483 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408359 (= lt!620317 (array!96281 (store (arr!46483 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47033 a!2901)))))

(declare-fun b!1408360 () Bool)

(declare-fun res!946086 () Bool)

(assert (=> b!1408360 (=> (not res!946086) (not e!797056))))

(assert (=> b!1408360 (= res!946086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408361 () Bool)

(declare-fun res!946079 () Bool)

(assert (=> b!1408361 (=> res!946079 e!797057)))

(assert (=> b!1408361 (= res!946079 (or (bvslt (x!127155 lt!620319) #b00000000000000000000000000000000) (bvsgt (x!127155 lt!620319) #b01111111111111111111111111111110) (bvslt lt!620314 #b00000000000000000000000000000000) (bvsge lt!620314 (size!47033 a!2901)) (bvslt (index!45555 lt!620319) #b00000000000000000000000000000000) (bvsge (index!45555 lt!620319) (size!47033 a!2901)) (not (= lt!620319 (Intermediate!10794 false (index!45555 lt!620319) (x!127155 lt!620319))))))))

(declare-fun b!1408362 () Bool)

(declare-fun res!946085 () Bool)

(assert (=> b!1408362 (=> (not res!946085) (not e!797056))))

(assert (=> b!1408362 (= res!946085 (and (= (size!47033 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47033 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47033 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408363 () Bool)

(declare-fun res!946087 () Bool)

(assert (=> b!1408363 (=> (not res!946087) (not e!797056))))

(declare-datatypes ((List!33002 0))(
  ( (Nil!32999) (Cons!32998 (h!34261 (_ BitVec 64)) (t!47696 List!33002)) )
))
(declare-fun arrayNoDuplicates!0 (array!96280 (_ BitVec 32) List!33002) Bool)

(assert (=> b!1408363 (= res!946087 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32999))))

(declare-fun b!1408364 () Bool)

(declare-fun res!946082 () Bool)

(assert (=> b!1408364 (=> (not res!946082) (not e!797056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408364 (= res!946082 (validKeyInArray!0 (select (arr!46483 a!2901) j!112)))))

(declare-fun b!1408365 () Bool)

(declare-fun res!946081 () Bool)

(assert (=> b!1408365 (=> (not res!946081) (not e!797056))))

(assert (=> b!1408365 (= res!946081 (validKeyInArray!0 (select (arr!46483 a!2901) i!1037)))))

(assert (= (and start!121126 res!946080) b!1408362))

(assert (= (and b!1408362 res!946085) b!1408365))

(assert (= (and b!1408365 res!946081) b!1408364))

(assert (= (and b!1408364 res!946082) b!1408360))

(assert (= (and b!1408360 res!946086) b!1408363))

(assert (= (and b!1408363 res!946087) b!1408358))

(assert (= (and b!1408358 (not res!946083)) b!1408359))

(assert (= (and b!1408359 (not res!946084)) b!1408361))

(assert (= (and b!1408361 (not res!946079)) b!1408357))

(declare-fun m!1297621 () Bool)

(assert (=> b!1408364 m!1297621))

(assert (=> b!1408364 m!1297621))

(declare-fun m!1297623 () Bool)

(assert (=> b!1408364 m!1297623))

(declare-fun m!1297625 () Bool)

(assert (=> b!1408363 m!1297625))

(declare-fun m!1297627 () Bool)

(assert (=> start!121126 m!1297627))

(declare-fun m!1297629 () Bool)

(assert (=> start!121126 m!1297629))

(declare-fun m!1297631 () Bool)

(assert (=> b!1408360 m!1297631))

(declare-fun m!1297633 () Bool)

(assert (=> b!1408357 m!1297633))

(declare-fun m!1297635 () Bool)

(assert (=> b!1408357 m!1297635))

(declare-fun m!1297637 () Bool)

(assert (=> b!1408359 m!1297637))

(assert (=> b!1408359 m!1297637))

(declare-fun m!1297639 () Bool)

(assert (=> b!1408359 m!1297639))

(declare-fun m!1297641 () Bool)

(assert (=> b!1408359 m!1297641))

(declare-fun m!1297643 () Bool)

(assert (=> b!1408359 m!1297643))

(assert (=> b!1408358 m!1297621))

(declare-fun m!1297645 () Bool)

(assert (=> b!1408358 m!1297645))

(assert (=> b!1408358 m!1297621))

(declare-fun m!1297647 () Bool)

(assert (=> b!1408358 m!1297647))

(assert (=> b!1408358 m!1297621))

(declare-fun m!1297649 () Bool)

(assert (=> b!1408358 m!1297649))

(assert (=> b!1408358 m!1297621))

(declare-fun m!1297651 () Bool)

(assert (=> b!1408358 m!1297651))

(declare-fun m!1297653 () Bool)

(assert (=> b!1408358 m!1297653))

(declare-fun m!1297655 () Bool)

(assert (=> b!1408365 m!1297655))

(assert (=> b!1408365 m!1297655))

(declare-fun m!1297657 () Bool)

(assert (=> b!1408365 m!1297657))

(push 1)

