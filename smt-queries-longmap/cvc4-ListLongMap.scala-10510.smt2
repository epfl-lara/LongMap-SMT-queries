; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123880 () Bool)

(assert start!123880)

(declare-fun b!1435706 () Bool)

(declare-fun res!968716 () Bool)

(declare-fun e!810239 () Bool)

(assert (=> b!1435706 (=> (not res!968716) (not e!810239))))

(declare-datatypes ((array!97624 0))(
  ( (array!97625 (arr!47113 (Array (_ BitVec 32) (_ BitVec 64))) (size!47663 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97624)

(declare-datatypes ((List!33623 0))(
  ( (Nil!33620) (Cons!33619 (h!34954 (_ BitVec 64)) (t!48317 List!33623)) )
))
(declare-fun arrayNoDuplicates!0 (array!97624 (_ BitVec 32) List!33623) Bool)

(assert (=> b!1435706 (= res!968716 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33620))))

(declare-fun e!810243 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1435707 () Bool)

(declare-datatypes ((SeekEntryResult!11392 0))(
  ( (MissingZero!11392 (index!47960 (_ BitVec 32))) (Found!11392 (index!47961 (_ BitVec 32))) (Intermediate!11392 (undefined!12204 Bool) (index!47962 (_ BitVec 32)) (x!129622 (_ BitVec 32))) (Undefined!11392) (MissingVacant!11392 (index!47963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97624 (_ BitVec 32)) SeekEntryResult!11392)

(assert (=> b!1435707 (= e!810243 (= (seekEntryOrOpen!0 (select (arr!47113 a!2831) j!81) a!2831 mask!2608) (Found!11392 j!81)))))

(declare-fun b!1435708 () Bool)

(declare-fun e!810241 () Bool)

(assert (=> b!1435708 (= e!810239 e!810241)))

(declare-fun res!968723 () Bool)

(assert (=> b!1435708 (=> (not res!968723) (not e!810241))))

(declare-fun lt!631988 () SeekEntryResult!11392)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97624 (_ BitVec 32)) SeekEntryResult!11392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435708 (= res!968723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47113 a!2831) j!81) mask!2608) (select (arr!47113 a!2831) j!81) a!2831 mask!2608) lt!631988))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435708 (= lt!631988 (Intermediate!11392 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435709 () Bool)

(declare-fun e!810244 () Bool)

(assert (=> b!1435709 (= e!810244 true)))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435709 (and (not undefinedAfter!5) (= intermediateAfterIndex!13 i!982) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))

(declare-fun lt!631986 () (_ BitVec 32))

(declare-datatypes ((Unit!48530 0))(
  ( (Unit!48531) )
))
(declare-fun lt!631990 () Unit!48530)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!97624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!48530)

(assert (=> b!1435709 (= lt!631990 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2831 i!982 j!81 (bvadd #b00000000000000000000000000000001 x!605) lt!631986 intermediateBeforeX!13 intermediateBeforeIndex!13 intermediateAfterX!13 intermediateAfterIndex!13 undefinedAfter!5 mask!2608))))

(declare-fun res!968722 () Bool)

(assert (=> start!123880 (=> (not res!968722) (not e!810239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123880 (= res!968722 (validMask!0 mask!2608))))

(assert (=> start!123880 e!810239))

(assert (=> start!123880 true))

(declare-fun array_inv!36141 (array!97624) Bool)

(assert (=> start!123880 (array_inv!36141 a!2831)))

(declare-fun b!1435710 () Bool)

(declare-fun res!968728 () Bool)

(assert (=> b!1435710 (=> (not res!968728) (not e!810239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435710 (= res!968728 (validKeyInArray!0 (select (arr!47113 a!2831) i!982)))))

(declare-fun b!1435711 () Bool)

(declare-fun e!810240 () Bool)

(assert (=> b!1435711 (= e!810240 e!810244)))

(declare-fun res!968718 () Bool)

(assert (=> b!1435711 (=> res!968718 e!810244)))

(assert (=> b!1435711 (= res!968718 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631986 #b00000000000000000000000000000000) (bvsge lt!631986 (size!47663 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435711 (= lt!631986 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435712 () Bool)

(declare-fun res!968719 () Bool)

(assert (=> b!1435712 (=> res!968719 e!810244)))

(assert (=> b!1435712 (= res!968719 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631986 (select (arr!47113 a!2831) j!81) a!2831 mask!2608) lt!631988)))))

(declare-fun b!1435713 () Bool)

(declare-fun res!968715 () Bool)

(declare-fun e!810242 () Bool)

(assert (=> b!1435713 (=> (not res!968715) (not e!810242))))

(assert (=> b!1435713 (= res!968715 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435714 () Bool)

(declare-fun res!968721 () Bool)

(assert (=> b!1435714 (=> (not res!968721) (not e!810239))))

(assert (=> b!1435714 (= res!968721 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47663 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47663 a!2831))))))

(declare-fun b!1435715 () Bool)

(declare-fun res!968713 () Bool)

(assert (=> b!1435715 (=> (not res!968713) (not e!810239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97624 (_ BitVec 32)) Bool)

(assert (=> b!1435715 (= res!968713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435716 () Bool)

(assert (=> b!1435716 (= e!810242 (not e!810240))))

(declare-fun res!968714 () Bool)

(assert (=> b!1435716 (=> res!968714 e!810240)))

(assert (=> b!1435716 (= res!968714 (or (= (select (arr!47113 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47113 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47113 a!2831) index!585) (select (arr!47113 a!2831) j!81)) (= (select (store (arr!47113 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435716 e!810243))

(declare-fun res!968724 () Bool)

(assert (=> b!1435716 (=> (not res!968724) (not e!810243))))

(assert (=> b!1435716 (= res!968724 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-fun lt!631991 () Unit!48530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48530)

(assert (=> b!1435716 (= lt!631991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435717 () Bool)

(declare-fun res!968727 () Bool)

(assert (=> b!1435717 (=> (not res!968727) (not e!810239))))

(assert (=> b!1435717 (= res!968727 (validKeyInArray!0 (select (arr!47113 a!2831) j!81)))))

(declare-fun b!1435718 () Bool)

(declare-fun res!968712 () Bool)

(assert (=> b!1435718 (=> (not res!968712) (not e!810242))))

(assert (=> b!1435718 (= res!968712 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47113 a!2831) j!81) a!2831 mask!2608) lt!631988))))

(declare-fun b!1435719 () Bool)

(declare-fun res!968720 () Bool)

(assert (=> b!1435719 (=> res!968720 e!810244)))

(declare-fun lt!631987 () SeekEntryResult!11392)

(declare-fun lt!631989 () array!97624)

(declare-fun lt!631992 () (_ BitVec 64))

(assert (=> b!1435719 (= res!968720 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631986 lt!631992 lt!631989 mask!2608) lt!631987)))))

(declare-fun b!1435720 () Bool)

(declare-fun res!968717 () Bool)

(assert (=> b!1435720 (=> (not res!968717) (not e!810239))))

(assert (=> b!1435720 (= res!968717 (and (= (size!47663 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47663 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47663 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435721 () Bool)

(assert (=> b!1435721 (= e!810241 e!810242)))

(declare-fun res!968725 () Bool)

(assert (=> b!1435721 (=> (not res!968725) (not e!810242))))

(assert (=> b!1435721 (= res!968725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631992 mask!2608) lt!631992 lt!631989 mask!2608) lt!631987))))

(assert (=> b!1435721 (= lt!631987 (Intermediate!11392 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435721 (= lt!631992 (select (store (arr!47113 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435721 (= lt!631989 (array!97625 (store (arr!47113 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47663 a!2831)))))

(declare-fun b!1435722 () Bool)

(declare-fun res!968726 () Bool)

(assert (=> b!1435722 (=> (not res!968726) (not e!810242))))

(assert (=> b!1435722 (= res!968726 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631992 lt!631989 mask!2608) lt!631987))))

(assert (= (and start!123880 res!968722) b!1435720))

(assert (= (and b!1435720 res!968717) b!1435710))

(assert (= (and b!1435710 res!968728) b!1435717))

(assert (= (and b!1435717 res!968727) b!1435715))

(assert (= (and b!1435715 res!968713) b!1435706))

(assert (= (and b!1435706 res!968716) b!1435714))

(assert (= (and b!1435714 res!968721) b!1435708))

(assert (= (and b!1435708 res!968723) b!1435721))

(assert (= (and b!1435721 res!968725) b!1435718))

(assert (= (and b!1435718 res!968712) b!1435722))

(assert (= (and b!1435722 res!968726) b!1435713))

(assert (= (and b!1435713 res!968715) b!1435716))

(assert (= (and b!1435716 res!968724) b!1435707))

(assert (= (and b!1435716 (not res!968714)) b!1435711))

(assert (= (and b!1435711 (not res!968718)) b!1435712))

(assert (= (and b!1435712 (not res!968719)) b!1435719))

(assert (= (and b!1435719 (not res!968720)) b!1435709))

(declare-fun m!1325053 () Bool)

(assert (=> b!1435715 m!1325053))

(declare-fun m!1325055 () Bool)

(assert (=> start!123880 m!1325055))

(declare-fun m!1325057 () Bool)

(assert (=> start!123880 m!1325057))

(declare-fun m!1325059 () Bool)

(assert (=> b!1435708 m!1325059))

(assert (=> b!1435708 m!1325059))

(declare-fun m!1325061 () Bool)

(assert (=> b!1435708 m!1325061))

(assert (=> b!1435708 m!1325061))

(assert (=> b!1435708 m!1325059))

(declare-fun m!1325063 () Bool)

(assert (=> b!1435708 m!1325063))

(declare-fun m!1325065 () Bool)

(assert (=> b!1435719 m!1325065))

(declare-fun m!1325067 () Bool)

(assert (=> b!1435710 m!1325067))

(assert (=> b!1435710 m!1325067))

(declare-fun m!1325069 () Bool)

(assert (=> b!1435710 m!1325069))

(declare-fun m!1325071 () Bool)

(assert (=> b!1435721 m!1325071))

(assert (=> b!1435721 m!1325071))

(declare-fun m!1325073 () Bool)

(assert (=> b!1435721 m!1325073))

(declare-fun m!1325075 () Bool)

(assert (=> b!1435721 m!1325075))

(declare-fun m!1325077 () Bool)

(assert (=> b!1435721 m!1325077))

(declare-fun m!1325079 () Bool)

(assert (=> b!1435709 m!1325079))

(declare-fun m!1325081 () Bool)

(assert (=> b!1435722 m!1325081))

(assert (=> b!1435707 m!1325059))

(assert (=> b!1435707 m!1325059))

(declare-fun m!1325083 () Bool)

(assert (=> b!1435707 m!1325083))

(assert (=> b!1435718 m!1325059))

(assert (=> b!1435718 m!1325059))

(declare-fun m!1325085 () Bool)

(assert (=> b!1435718 m!1325085))

(assert (=> b!1435716 m!1325075))

(declare-fun m!1325087 () Bool)

(assert (=> b!1435716 m!1325087))

(declare-fun m!1325089 () Bool)

(assert (=> b!1435716 m!1325089))

(declare-fun m!1325091 () Bool)

(assert (=> b!1435716 m!1325091))

(assert (=> b!1435716 m!1325059))

(declare-fun m!1325093 () Bool)

(assert (=> b!1435716 m!1325093))

(assert (=> b!1435712 m!1325059))

(assert (=> b!1435712 m!1325059))

(declare-fun m!1325095 () Bool)

(assert (=> b!1435712 m!1325095))

(declare-fun m!1325097 () Bool)

(assert (=> b!1435711 m!1325097))

(assert (=> b!1435717 m!1325059))

(assert (=> b!1435717 m!1325059))

(declare-fun m!1325099 () Bool)

(assert (=> b!1435717 m!1325099))

(declare-fun m!1325101 () Bool)

(assert (=> b!1435706 m!1325101))

(push 1)

