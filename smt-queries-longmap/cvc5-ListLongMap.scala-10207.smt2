; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120294 () Bool)

(assert start!120294)

(declare-fun b!1399859 () Bool)

(declare-fun e!792532 () Bool)

(declare-fun e!792530 () Bool)

(assert (=> b!1399859 (= e!792532 (not e!792530))))

(declare-fun res!938378 () Bool)

(assert (=> b!1399859 (=> res!938378 e!792530)))

(declare-datatypes ((SeekEntryResult!10519 0))(
  ( (MissingZero!10519 (index!44453 (_ BitVec 32))) (Found!10519 (index!44454 (_ BitVec 32))) (Intermediate!10519 (undefined!11331 Bool) (index!44455 (_ BitVec 32)) (x!126106 (_ BitVec 32))) (Undefined!10519) (MissingVacant!10519 (index!44456 (_ BitVec 32))) )
))
(declare-fun lt!615784 () SeekEntryResult!10519)

(assert (=> b!1399859 (= res!938378 (or (not (is-Intermediate!10519 lt!615784)) (undefined!11331 lt!615784)))))

(declare-fun e!792533 () Bool)

(assert (=> b!1399859 e!792533))

(declare-fun res!938370 () Bool)

(assert (=> b!1399859 (=> (not res!938370) (not e!792533))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95703 0))(
  ( (array!95704 (arr!46202 (Array (_ BitVec 32) (_ BitVec 64))) (size!46752 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95703)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95703 (_ BitVec 32)) Bool)

(assert (=> b!1399859 (= res!938370 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47042 0))(
  ( (Unit!47043) )
))
(declare-fun lt!615785 () Unit!47042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47042)

(assert (=> b!1399859 (= lt!615785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615783 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95703 (_ BitVec 32)) SeekEntryResult!10519)

(assert (=> b!1399859 (= lt!615784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615783 (select (arr!46202 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399859 (= lt!615783 (toIndex!0 (select (arr!46202 a!2901) j!112) mask!2840))))

(declare-fun b!1399860 () Bool)

(declare-fun res!938373 () Bool)

(assert (=> b!1399860 (=> (not res!938373) (not e!792532))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399860 (= res!938373 (and (= (size!46752 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46752 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46752 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399861 () Bool)

(declare-fun res!938375 () Bool)

(assert (=> b!1399861 (=> (not res!938375) (not e!792532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399861 (= res!938375 (validKeyInArray!0 (select (arr!46202 a!2901) j!112)))))

(declare-fun e!792527 () Bool)

(declare-fun lt!615789 () array!95703)

(declare-fun b!1399862 () Bool)

(declare-fun lt!615788 () SeekEntryResult!10519)

(declare-fun lt!615782 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95703 (_ BitVec 32)) SeekEntryResult!10519)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95703 (_ BitVec 32)) SeekEntryResult!10519)

(assert (=> b!1399862 (= e!792527 (= (seekEntryOrOpen!0 lt!615782 lt!615789 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126106 lt!615788) (index!44455 lt!615788) (index!44455 lt!615788) (select (arr!46202 a!2901) j!112) lt!615789 mask!2840)))))

(declare-fun b!1399863 () Bool)

(declare-fun e!792531 () Bool)

(assert (=> b!1399863 (= e!792530 e!792531)))

(declare-fun res!938380 () Bool)

(assert (=> b!1399863 (=> res!938380 e!792531)))

(assert (=> b!1399863 (= res!938380 (or (= lt!615784 lt!615788) (not (is-Intermediate!10519 lt!615788))))))

(assert (=> b!1399863 (= lt!615788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615782 mask!2840) lt!615782 lt!615789 mask!2840))))

(assert (=> b!1399863 (= lt!615782 (select (store (arr!46202 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399863 (= lt!615789 (array!95704 (store (arr!46202 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46752 a!2901)))))

(declare-fun b!1399864 () Bool)

(declare-fun res!938379 () Bool)

(assert (=> b!1399864 (=> (not res!938379) (not e!792532))))

(assert (=> b!1399864 (= res!938379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938372 () Bool)

(assert (=> start!120294 (=> (not res!938372) (not e!792532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120294 (= res!938372 (validMask!0 mask!2840))))

(assert (=> start!120294 e!792532))

(assert (=> start!120294 true))

(declare-fun array_inv!35230 (array!95703) Bool)

(assert (=> start!120294 (array_inv!35230 a!2901)))

(declare-fun b!1399865 () Bool)

(declare-fun res!938377 () Bool)

(assert (=> b!1399865 (=> (not res!938377) (not e!792532))))

(assert (=> b!1399865 (= res!938377 (validKeyInArray!0 (select (arr!46202 a!2901) i!1037)))))

(declare-fun b!1399866 () Bool)

(declare-fun e!792528 () Bool)

(assert (=> b!1399866 (= e!792528 true)))

(declare-fun lt!615786 () SeekEntryResult!10519)

(assert (=> b!1399866 (= lt!615786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615783 lt!615782 lt!615789 mask!2840))))

(declare-fun b!1399867 () Bool)

(assert (=> b!1399867 (= e!792533 (= (seekEntryOrOpen!0 (select (arr!46202 a!2901) j!112) a!2901 mask!2840) (Found!10519 j!112)))))

(declare-fun b!1399868 () Bool)

(assert (=> b!1399868 (= e!792531 e!792528)))

(declare-fun res!938374 () Bool)

(assert (=> b!1399868 (=> res!938374 e!792528)))

(assert (=> b!1399868 (= res!938374 (or (bvslt (x!126106 lt!615784) #b00000000000000000000000000000000) (bvsgt (x!126106 lt!615784) #b01111111111111111111111111111110) (bvslt (x!126106 lt!615788) #b00000000000000000000000000000000) (bvsgt (x!126106 lt!615788) #b01111111111111111111111111111110) (bvslt lt!615783 #b00000000000000000000000000000000) (bvsge lt!615783 (size!46752 a!2901)) (bvslt (index!44455 lt!615784) #b00000000000000000000000000000000) (bvsge (index!44455 lt!615784) (size!46752 a!2901)) (bvslt (index!44455 lt!615788) #b00000000000000000000000000000000) (bvsge (index!44455 lt!615788) (size!46752 a!2901)) (not (= lt!615784 (Intermediate!10519 false (index!44455 lt!615784) (x!126106 lt!615784)))) (not (= lt!615788 (Intermediate!10519 false (index!44455 lt!615788) (x!126106 lt!615788))))))))

(assert (=> b!1399868 e!792527))

(declare-fun res!938376 () Bool)

(assert (=> b!1399868 (=> (not res!938376) (not e!792527))))

(assert (=> b!1399868 (= res!938376 (and (not (undefined!11331 lt!615788)) (= (index!44455 lt!615788) i!1037) (bvslt (x!126106 lt!615788) (x!126106 lt!615784)) (= (select (store (arr!46202 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44455 lt!615788)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615787 () Unit!47042)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47042)

(assert (=> b!1399868 (= lt!615787 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615783 (x!126106 lt!615784) (index!44455 lt!615784) (x!126106 lt!615788) (index!44455 lt!615788) (undefined!11331 lt!615788) mask!2840))))

(declare-fun b!1399869 () Bool)

(declare-fun res!938371 () Bool)

(assert (=> b!1399869 (=> (not res!938371) (not e!792532))))

(declare-datatypes ((List!32721 0))(
  ( (Nil!32718) (Cons!32717 (h!33965 (_ BitVec 64)) (t!47415 List!32721)) )
))
(declare-fun arrayNoDuplicates!0 (array!95703 (_ BitVec 32) List!32721) Bool)

(assert (=> b!1399869 (= res!938371 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32718))))

(assert (= (and start!120294 res!938372) b!1399860))

(assert (= (and b!1399860 res!938373) b!1399865))

(assert (= (and b!1399865 res!938377) b!1399861))

(assert (= (and b!1399861 res!938375) b!1399864))

(assert (= (and b!1399864 res!938379) b!1399869))

(assert (= (and b!1399869 res!938371) b!1399859))

(assert (= (and b!1399859 res!938370) b!1399867))

(assert (= (and b!1399859 (not res!938378)) b!1399863))

(assert (= (and b!1399863 (not res!938380)) b!1399868))

(assert (= (and b!1399868 res!938376) b!1399862))

(assert (= (and b!1399868 (not res!938374)) b!1399866))

(declare-fun m!1287117 () Bool)

(assert (=> b!1399864 m!1287117))

(declare-fun m!1287119 () Bool)

(assert (=> b!1399861 m!1287119))

(assert (=> b!1399861 m!1287119))

(declare-fun m!1287121 () Bool)

(assert (=> b!1399861 m!1287121))

(assert (=> b!1399867 m!1287119))

(assert (=> b!1399867 m!1287119))

(declare-fun m!1287123 () Bool)

(assert (=> b!1399867 m!1287123))

(declare-fun m!1287125 () Bool)

(assert (=> start!120294 m!1287125))

(declare-fun m!1287127 () Bool)

(assert (=> start!120294 m!1287127))

(declare-fun m!1287129 () Bool)

(assert (=> b!1399862 m!1287129))

(assert (=> b!1399862 m!1287119))

(assert (=> b!1399862 m!1287119))

(declare-fun m!1287131 () Bool)

(assert (=> b!1399862 m!1287131))

(declare-fun m!1287133 () Bool)

(assert (=> b!1399865 m!1287133))

(assert (=> b!1399865 m!1287133))

(declare-fun m!1287135 () Bool)

(assert (=> b!1399865 m!1287135))

(declare-fun m!1287137 () Bool)

(assert (=> b!1399868 m!1287137))

(declare-fun m!1287139 () Bool)

(assert (=> b!1399868 m!1287139))

(declare-fun m!1287141 () Bool)

(assert (=> b!1399868 m!1287141))

(declare-fun m!1287143 () Bool)

(assert (=> b!1399863 m!1287143))

(assert (=> b!1399863 m!1287143))

(declare-fun m!1287145 () Bool)

(assert (=> b!1399863 m!1287145))

(assert (=> b!1399863 m!1287137))

(declare-fun m!1287147 () Bool)

(assert (=> b!1399863 m!1287147))

(declare-fun m!1287149 () Bool)

(assert (=> b!1399866 m!1287149))

(declare-fun m!1287151 () Bool)

(assert (=> b!1399869 m!1287151))

(assert (=> b!1399859 m!1287119))

(declare-fun m!1287153 () Bool)

(assert (=> b!1399859 m!1287153))

(assert (=> b!1399859 m!1287119))

(declare-fun m!1287155 () Bool)

(assert (=> b!1399859 m!1287155))

(declare-fun m!1287157 () Bool)

(assert (=> b!1399859 m!1287157))

(assert (=> b!1399859 m!1287119))

(declare-fun m!1287159 () Bool)

(assert (=> b!1399859 m!1287159))

(push 1)

