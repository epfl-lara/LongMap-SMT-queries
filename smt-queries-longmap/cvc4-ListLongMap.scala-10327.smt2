; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121450 () Bool)

(assert start!121450)

(declare-fun b!1411120 () Bool)

(declare-fun res!948355 () Bool)

(declare-fun e!798550 () Bool)

(assert (=> b!1411120 (=> (not res!948355) (not e!798550))))

(declare-datatypes ((array!96451 0))(
  ( (array!96452 (arr!46564 (Array (_ BitVec 32) (_ BitVec 64))) (size!47114 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96451)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96451 (_ BitVec 32)) Bool)

(assert (=> b!1411120 (= res!948355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411121 () Bool)

(declare-fun res!948353 () Bool)

(assert (=> b!1411121 (=> (not res!948353) (not e!798550))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411121 (= res!948353 (validKeyInArray!0 (select (arr!46564 a!2901) i!1037)))))

(declare-fun b!1411122 () Bool)

(declare-fun e!798551 () Bool)

(declare-fun e!798548 () Bool)

(assert (=> b!1411122 (= e!798551 e!798548)))

(declare-fun res!948352 () Bool)

(assert (=> b!1411122 (=> res!948352 e!798548)))

(declare-datatypes ((SeekEntryResult!10875 0))(
  ( (MissingZero!10875 (index!45877 (_ BitVec 32))) (Found!10875 (index!45878 (_ BitVec 32))) (Intermediate!10875 (undefined!11687 Bool) (index!45879 (_ BitVec 32)) (x!127470 (_ BitVec 32))) (Undefined!10875) (MissingVacant!10875 (index!45880 (_ BitVec 32))) )
))
(declare-fun lt!621531 () SeekEntryResult!10875)

(declare-fun lt!621534 () SeekEntryResult!10875)

(assert (=> b!1411122 (= res!948352 (or (= lt!621531 lt!621534) (not (is-Intermediate!10875 lt!621534))))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96451 (_ BitVec 32)) SeekEntryResult!10875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411122 (= lt!621534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46564 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46564 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96452 (store (arr!46564 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47114 a!2901)) mask!2840))))

(declare-fun b!1411123 () Bool)

(declare-fun res!948348 () Bool)

(assert (=> b!1411123 (=> (not res!948348) (not e!798550))))

(assert (=> b!1411123 (= res!948348 (and (= (size!47114 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47114 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47114 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411124 () Bool)

(assert (=> b!1411124 (= e!798548 true)))

(assert (=> b!1411124 (and (not (undefined!11687 lt!621534)) (= (index!45879 lt!621534) i!1037) (bvslt (x!127470 lt!621534) (x!127470 lt!621531)))))

(declare-fun lt!621533 () (_ BitVec 32))

(declare-datatypes ((Unit!47724 0))(
  ( (Unit!47725) )
))
(declare-fun lt!621530 () Unit!47724)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47724)

(assert (=> b!1411124 (= lt!621530 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621533 (x!127470 lt!621531) (index!45879 lt!621531) (x!127470 lt!621534) (index!45879 lt!621534) (undefined!11687 lt!621534) mask!2840))))

(declare-fun res!948350 () Bool)

(assert (=> start!121450 (=> (not res!948350) (not e!798550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121450 (= res!948350 (validMask!0 mask!2840))))

(assert (=> start!121450 e!798550))

(assert (=> start!121450 true))

(declare-fun array_inv!35592 (array!96451) Bool)

(assert (=> start!121450 (array_inv!35592 a!2901)))

(declare-fun e!798547 () Bool)

(declare-fun b!1411125 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96451 (_ BitVec 32)) SeekEntryResult!10875)

(assert (=> b!1411125 (= e!798547 (= (seekEntryOrOpen!0 (select (arr!46564 a!2901) j!112) a!2901 mask!2840) (Found!10875 j!112)))))

(declare-fun b!1411126 () Bool)

(assert (=> b!1411126 (= e!798550 (not e!798551))))

(declare-fun res!948354 () Bool)

(assert (=> b!1411126 (=> res!948354 e!798551)))

(assert (=> b!1411126 (= res!948354 (or (not (is-Intermediate!10875 lt!621531)) (undefined!11687 lt!621531)))))

(assert (=> b!1411126 e!798547))

(declare-fun res!948349 () Bool)

(assert (=> b!1411126 (=> (not res!948349) (not e!798547))))

(assert (=> b!1411126 (= res!948349 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621532 () Unit!47724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47724)

(assert (=> b!1411126 (= lt!621532 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411126 (= lt!621531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621533 (select (arr!46564 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411126 (= lt!621533 (toIndex!0 (select (arr!46564 a!2901) j!112) mask!2840))))

(declare-fun b!1411127 () Bool)

(declare-fun res!948347 () Bool)

(assert (=> b!1411127 (=> (not res!948347) (not e!798550))))

(assert (=> b!1411127 (= res!948347 (validKeyInArray!0 (select (arr!46564 a!2901) j!112)))))

(declare-fun b!1411128 () Bool)

(declare-fun res!948351 () Bool)

(assert (=> b!1411128 (=> (not res!948351) (not e!798550))))

(declare-datatypes ((List!33083 0))(
  ( (Nil!33080) (Cons!33079 (h!34351 (_ BitVec 64)) (t!47777 List!33083)) )
))
(declare-fun arrayNoDuplicates!0 (array!96451 (_ BitVec 32) List!33083) Bool)

(assert (=> b!1411128 (= res!948351 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33080))))

(assert (= (and start!121450 res!948350) b!1411123))

(assert (= (and b!1411123 res!948348) b!1411121))

(assert (= (and b!1411121 res!948353) b!1411127))

(assert (= (and b!1411127 res!948347) b!1411120))

(assert (= (and b!1411120 res!948355) b!1411128))

(assert (= (and b!1411128 res!948351) b!1411126))

(assert (= (and b!1411126 res!948349) b!1411125))

(assert (= (and b!1411126 (not res!948354)) b!1411122))

(assert (= (and b!1411122 (not res!948352)) b!1411124))

(declare-fun m!1300857 () Bool)

(assert (=> b!1411122 m!1300857))

(declare-fun m!1300859 () Bool)

(assert (=> b!1411122 m!1300859))

(assert (=> b!1411122 m!1300859))

(declare-fun m!1300861 () Bool)

(assert (=> b!1411122 m!1300861))

(assert (=> b!1411122 m!1300861))

(assert (=> b!1411122 m!1300859))

(declare-fun m!1300863 () Bool)

(assert (=> b!1411122 m!1300863))

(declare-fun m!1300865 () Bool)

(assert (=> b!1411127 m!1300865))

(assert (=> b!1411127 m!1300865))

(declare-fun m!1300867 () Bool)

(assert (=> b!1411127 m!1300867))

(declare-fun m!1300869 () Bool)

(assert (=> b!1411120 m!1300869))

(assert (=> b!1411125 m!1300865))

(assert (=> b!1411125 m!1300865))

(declare-fun m!1300871 () Bool)

(assert (=> b!1411125 m!1300871))

(declare-fun m!1300873 () Bool)

(assert (=> b!1411121 m!1300873))

(assert (=> b!1411121 m!1300873))

(declare-fun m!1300875 () Bool)

(assert (=> b!1411121 m!1300875))

(declare-fun m!1300877 () Bool)

(assert (=> b!1411128 m!1300877))

(assert (=> b!1411126 m!1300865))

(declare-fun m!1300879 () Bool)

(assert (=> b!1411126 m!1300879))

(assert (=> b!1411126 m!1300865))

(declare-fun m!1300881 () Bool)

(assert (=> b!1411126 m!1300881))

(assert (=> b!1411126 m!1300865))

(declare-fun m!1300883 () Bool)

(assert (=> b!1411126 m!1300883))

(declare-fun m!1300885 () Bool)

(assert (=> b!1411126 m!1300885))

(declare-fun m!1300887 () Bool)

(assert (=> start!121450 m!1300887))

(declare-fun m!1300889 () Bool)

(assert (=> start!121450 m!1300889))

(declare-fun m!1300891 () Bool)

(assert (=> b!1411124 m!1300891))

(push 1)

(assert (not b!1411120))

