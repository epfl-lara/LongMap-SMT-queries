; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123876 () Bool)

(assert start!123876)

(declare-fun b!1435604 () Bool)

(declare-fun res!968613 () Bool)

(declare-fun e!810197 () Bool)

(assert (=> b!1435604 (=> (not res!968613) (not e!810197))))

(declare-datatypes ((array!97620 0))(
  ( (array!97621 (arr!47111 (Array (_ BitVec 32) (_ BitVec 64))) (size!47661 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97620)

(declare-datatypes ((List!33621 0))(
  ( (Nil!33618) (Cons!33617 (h!34952 (_ BitVec 64)) (t!48315 List!33621)) )
))
(declare-fun arrayNoDuplicates!0 (array!97620 (_ BitVec 32) List!33621) Bool)

(assert (=> b!1435604 (= res!968613 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33618))))

(declare-fun b!1435605 () Bool)

(declare-fun res!968623 () Bool)

(assert (=> b!1435605 (=> (not res!968623) (not e!810197))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435605 (= res!968623 (validKeyInArray!0 (select (arr!47111 a!2831) j!81)))))

(declare-fun b!1435606 () Bool)

(declare-fun e!810200 () Bool)

(declare-fun e!810202 () Bool)

(assert (=> b!1435606 (= e!810200 e!810202)))

(declare-fun res!968621 () Bool)

(assert (=> b!1435606 (=> res!968621 e!810202)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!631944 () (_ BitVec 32))

(assert (=> b!1435606 (= res!968621 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631944 #b00000000000000000000000000000000) (bvsge lt!631944 (size!47661 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435606 (= lt!631944 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435607 () Bool)

(declare-fun e!810198 () Bool)

(declare-datatypes ((SeekEntryResult!11390 0))(
  ( (MissingZero!11390 (index!47952 (_ BitVec 32))) (Found!11390 (index!47953 (_ BitVec 32))) (Intermediate!11390 (undefined!12202 Bool) (index!47954 (_ BitVec 32)) (x!129620 (_ BitVec 32))) (Undefined!11390) (MissingVacant!11390 (index!47955 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97620 (_ BitVec 32)) SeekEntryResult!11390)

(assert (=> b!1435607 (= e!810198 (= (seekEntryOrOpen!0 (select (arr!47111 a!2831) j!81) a!2831 mask!2608) (Found!11390 j!81)))))

(declare-fun b!1435609 () Bool)

(declare-fun res!968617 () Bool)

(declare-fun e!810199 () Bool)

(assert (=> b!1435609 (=> (not res!968617) (not e!810199))))

(declare-fun lt!631947 () (_ BitVec 64))

(declare-fun lt!631949 () SeekEntryResult!11390)

(declare-fun lt!631948 () array!97620)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97620 (_ BitVec 32)) SeekEntryResult!11390)

(assert (=> b!1435609 (= res!968617 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631947 lt!631948 mask!2608) lt!631949))))

(declare-fun b!1435610 () Bool)

(declare-fun res!968616 () Bool)

(assert (=> b!1435610 (=> (not res!968616) (not e!810197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97620 (_ BitVec 32)) Bool)

(assert (=> b!1435610 (= res!968616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435611 () Bool)

(declare-fun res!968611 () Bool)

(assert (=> b!1435611 (=> (not res!968611) (not e!810197))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1435611 (= res!968611 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47661 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47661 a!2831))))))

(declare-fun b!1435612 () Bool)

(assert (=> b!1435612 (= e!810199 (not e!810200))))

(declare-fun res!968622 () Bool)

(assert (=> b!1435612 (=> res!968622 e!810200)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435612 (= res!968622 (or (= (select (arr!47111 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47111 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47111 a!2831) index!585) (select (arr!47111 a!2831) j!81)) (= (select (store (arr!47111 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435612 e!810198))

(declare-fun res!968610 () Bool)

(assert (=> b!1435612 (=> (not res!968610) (not e!810198))))

(assert (=> b!1435612 (= res!968610 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48526 0))(
  ( (Unit!48527) )
))
(declare-fun lt!631946 () Unit!48526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48526)

(assert (=> b!1435612 (= lt!631946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435613 () Bool)

(declare-fun res!968624 () Bool)

(assert (=> b!1435613 (=> (not res!968624) (not e!810199))))

(declare-fun lt!631945 () SeekEntryResult!11390)

(assert (=> b!1435613 (= res!968624 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47111 a!2831) j!81) a!2831 mask!2608) lt!631945))))

(declare-fun b!1435614 () Bool)

(declare-fun res!968626 () Bool)

(assert (=> b!1435614 (=> res!968626 e!810202)))

(assert (=> b!1435614 (= res!968626 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631944 lt!631947 lt!631948 mask!2608) lt!631949)))))

(declare-fun b!1435615 () Bool)

(declare-fun res!968620 () Bool)

(assert (=> b!1435615 (=> (not res!968620) (not e!810197))))

(assert (=> b!1435615 (= res!968620 (and (= (size!47661 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47661 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47661 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435616 () Bool)

(declare-fun res!968625 () Bool)

(assert (=> b!1435616 (=> (not res!968625) (not e!810199))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435616 (= res!968625 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!968615 () Bool)

(assert (=> start!123876 (=> (not res!968615) (not e!810197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123876 (= res!968615 (validMask!0 mask!2608))))

(assert (=> start!123876 e!810197))

(assert (=> start!123876 true))

(declare-fun array_inv!36139 (array!97620) Bool)

(assert (=> start!123876 (array_inv!36139 a!2831)))

(declare-fun b!1435608 () Bool)

(declare-fun e!810201 () Bool)

(assert (=> b!1435608 (= e!810197 e!810201)))

(declare-fun res!968619 () Bool)

(assert (=> b!1435608 (=> (not res!968619) (not e!810201))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435608 (= res!968619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47111 a!2831) j!81) mask!2608) (select (arr!47111 a!2831) j!81) a!2831 mask!2608) lt!631945))))

(assert (=> b!1435608 (= lt!631945 (Intermediate!11390 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435617 () Bool)

(assert (=> b!1435617 (= e!810201 e!810199)))

(declare-fun res!968614 () Bool)

(assert (=> b!1435617 (=> (not res!968614) (not e!810199))))

(assert (=> b!1435617 (= res!968614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631947 mask!2608) lt!631947 lt!631948 mask!2608) lt!631949))))

(assert (=> b!1435617 (= lt!631949 (Intermediate!11390 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435617 (= lt!631947 (select (store (arr!47111 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435617 (= lt!631948 (array!97621 (store (arr!47111 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47661 a!2831)))))

(declare-fun b!1435618 () Bool)

(declare-fun res!968618 () Bool)

(assert (=> b!1435618 (=> (not res!968618) (not e!810197))))

(assert (=> b!1435618 (= res!968618 (validKeyInArray!0 (select (arr!47111 a!2831) i!982)))))

(declare-fun b!1435619 () Bool)

(declare-fun res!968612 () Bool)

(assert (=> b!1435619 (=> res!968612 e!810202)))

(assert (=> b!1435619 (= res!968612 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631944 (select (arr!47111 a!2831) j!81) a!2831 mask!2608) lt!631945)))))

(declare-fun b!1435620 () Bool)

(assert (=> b!1435620 (= e!810202 true)))

(assert (=> b!1435620 (and (not undefinedAfter!5) (= intermediateAfterIndex!13 i!982) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))

(declare-fun lt!631950 () Unit!48526)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!97620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!48526)

(assert (=> b!1435620 (= lt!631950 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2831 i!982 j!81 (bvadd #b00000000000000000000000000000001 x!605) lt!631944 intermediateBeforeX!13 intermediateBeforeIndex!13 intermediateAfterX!13 intermediateAfterIndex!13 undefinedAfter!5 mask!2608))))

(assert (= (and start!123876 res!968615) b!1435615))

(assert (= (and b!1435615 res!968620) b!1435618))

(assert (= (and b!1435618 res!968618) b!1435605))

(assert (= (and b!1435605 res!968623) b!1435610))

(assert (= (and b!1435610 res!968616) b!1435604))

(assert (= (and b!1435604 res!968613) b!1435611))

(assert (= (and b!1435611 res!968611) b!1435608))

(assert (= (and b!1435608 res!968619) b!1435617))

(assert (= (and b!1435617 res!968614) b!1435613))

(assert (= (and b!1435613 res!968624) b!1435609))

(assert (= (and b!1435609 res!968617) b!1435616))

(assert (= (and b!1435616 res!968625) b!1435612))

(assert (= (and b!1435612 res!968610) b!1435607))

(assert (= (and b!1435612 (not res!968622)) b!1435606))

(assert (= (and b!1435606 (not res!968621)) b!1435619))

(assert (= (and b!1435619 (not res!968612)) b!1435614))

(assert (= (and b!1435614 (not res!968626)) b!1435620))

(declare-fun m!1324953 () Bool)

(assert (=> b!1435610 m!1324953))

(declare-fun m!1324955 () Bool)

(assert (=> b!1435608 m!1324955))

(assert (=> b!1435608 m!1324955))

(declare-fun m!1324957 () Bool)

(assert (=> b!1435608 m!1324957))

(assert (=> b!1435608 m!1324957))

(assert (=> b!1435608 m!1324955))

(declare-fun m!1324959 () Bool)

(assert (=> b!1435608 m!1324959))

(declare-fun m!1324961 () Bool)

(assert (=> b!1435617 m!1324961))

(assert (=> b!1435617 m!1324961))

(declare-fun m!1324963 () Bool)

(assert (=> b!1435617 m!1324963))

(declare-fun m!1324965 () Bool)

(assert (=> b!1435617 m!1324965))

(declare-fun m!1324967 () Bool)

(assert (=> b!1435617 m!1324967))

(declare-fun m!1324969 () Bool)

(assert (=> b!1435618 m!1324969))

(assert (=> b!1435618 m!1324969))

(declare-fun m!1324971 () Bool)

(assert (=> b!1435618 m!1324971))

(declare-fun m!1324973 () Bool)

(assert (=> b!1435614 m!1324973))

(declare-fun m!1324975 () Bool)

(assert (=> start!123876 m!1324975))

(declare-fun m!1324977 () Bool)

(assert (=> start!123876 m!1324977))

(assert (=> b!1435619 m!1324955))

(assert (=> b!1435619 m!1324955))

(declare-fun m!1324979 () Bool)

(assert (=> b!1435619 m!1324979))

(assert (=> b!1435612 m!1324965))

(declare-fun m!1324981 () Bool)

(assert (=> b!1435612 m!1324981))

(declare-fun m!1324983 () Bool)

(assert (=> b!1435612 m!1324983))

(declare-fun m!1324985 () Bool)

(assert (=> b!1435612 m!1324985))

(assert (=> b!1435612 m!1324955))

(declare-fun m!1324987 () Bool)

(assert (=> b!1435612 m!1324987))

(declare-fun m!1324989 () Bool)

(assert (=> b!1435620 m!1324989))

(assert (=> b!1435607 m!1324955))

(assert (=> b!1435607 m!1324955))

(declare-fun m!1324991 () Bool)

(assert (=> b!1435607 m!1324991))

(declare-fun m!1324993 () Bool)

(assert (=> b!1435609 m!1324993))

(declare-fun m!1324995 () Bool)

(assert (=> b!1435604 m!1324995))

(declare-fun m!1324997 () Bool)

(assert (=> b!1435606 m!1324997))

(assert (=> b!1435613 m!1324955))

(assert (=> b!1435613 m!1324955))

(declare-fun m!1324999 () Bool)

(assert (=> b!1435613 m!1324999))

(assert (=> b!1435605 m!1324955))

(assert (=> b!1435605 m!1324955))

(declare-fun m!1325001 () Bool)

(assert (=> b!1435605 m!1325001))

(push 1)

