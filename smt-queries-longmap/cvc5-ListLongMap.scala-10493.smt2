; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123534 () Bool)

(assert start!123534)

(declare-fun b!1432067 () Bool)

(declare-fun e!808442 () Bool)

(declare-fun e!808444 () Bool)

(assert (=> b!1432067 (= e!808442 e!808444)))

(declare-fun res!965933 () Bool)

(assert (=> b!1432067 (=> (not res!965933) (not e!808444))))

(declare-datatypes ((array!97506 0))(
  ( (array!97507 (arr!47060 (Array (_ BitVec 32) (_ BitVec 64))) (size!47610 (_ BitVec 32))) )
))
(declare-fun lt!630437 () array!97506)

(declare-datatypes ((SeekEntryResult!11339 0))(
  ( (MissingZero!11339 (index!47748 (_ BitVec 32))) (Found!11339 (index!47749 (_ BitVec 32))) (Intermediate!11339 (undefined!12151 Bool) (index!47750 (_ BitVec 32)) (x!129397 (_ BitVec 32))) (Undefined!11339) (MissingVacant!11339 (index!47751 (_ BitVec 32))) )
))
(declare-fun lt!630438 () SeekEntryResult!11339)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630433 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97506 (_ BitVec 32)) SeekEntryResult!11339)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432067 (= res!965933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630433 mask!2608) lt!630433 lt!630437 mask!2608) lt!630438))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1432067 (= lt!630438 (Intermediate!11339 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97506)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432067 (= lt!630433 (select (store (arr!47060 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432067 (= lt!630437 (array!97507 (store (arr!47060 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47610 a!2831)))))

(declare-fun b!1432068 () Bool)

(declare-fun res!965944 () Bool)

(assert (=> b!1432068 (=> (not res!965944) (not e!808444))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1432068 (= res!965944 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630433 lt!630437 mask!2608) lt!630438))))

(declare-fun b!1432069 () Bool)

(declare-fun e!808443 () Bool)

(assert (=> b!1432069 (= e!808443 true)))

(declare-fun lt!630435 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432069 (= lt!630435 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432070 () Bool)

(declare-fun e!808441 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97506 (_ BitVec 32)) SeekEntryResult!11339)

(assert (=> b!1432070 (= e!808441 (= (seekEntryOrOpen!0 (select (arr!47060 a!2831) j!81) a!2831 mask!2608) (Found!11339 j!81)))))

(declare-fun b!1432071 () Bool)

(assert (=> b!1432071 (= e!808444 (not e!808443))))

(declare-fun res!965934 () Bool)

(assert (=> b!1432071 (=> res!965934 e!808443)))

(assert (=> b!1432071 (= res!965934 (or (= (select (arr!47060 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47060 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47060 a!2831) index!585) (select (arr!47060 a!2831) j!81)) (= (select (store (arr!47060 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432071 e!808441))

(declare-fun res!965931 () Bool)

(assert (=> b!1432071 (=> (not res!965931) (not e!808441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97506 (_ BitVec 32)) Bool)

(assert (=> b!1432071 (= res!965931 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48424 0))(
  ( (Unit!48425) )
))
(declare-fun lt!630436 () Unit!48424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48424)

(assert (=> b!1432071 (= lt!630436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432072 () Bool)

(declare-fun res!965935 () Bool)

(declare-fun e!808440 () Bool)

(assert (=> b!1432072 (=> (not res!965935) (not e!808440))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432072 (= res!965935 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47610 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47610 a!2831))))))

(declare-fun b!1432073 () Bool)

(declare-fun res!965938 () Bool)

(assert (=> b!1432073 (=> (not res!965938) (not e!808440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432073 (= res!965938 (validKeyInArray!0 (select (arr!47060 a!2831) i!982)))))

(declare-fun res!965943 () Bool)

(assert (=> start!123534 (=> (not res!965943) (not e!808440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123534 (= res!965943 (validMask!0 mask!2608))))

(assert (=> start!123534 e!808440))

(assert (=> start!123534 true))

(declare-fun array_inv!36088 (array!97506) Bool)

(assert (=> start!123534 (array_inv!36088 a!2831)))

(declare-fun b!1432074 () Bool)

(declare-fun res!965936 () Bool)

(assert (=> b!1432074 (=> (not res!965936) (not e!808440))))

(assert (=> b!1432074 (= res!965936 (and (= (size!47610 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47610 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47610 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432075 () Bool)

(declare-fun res!965937 () Bool)

(assert (=> b!1432075 (=> (not res!965937) (not e!808440))))

(assert (=> b!1432075 (= res!965937 (validKeyInArray!0 (select (arr!47060 a!2831) j!81)))))

(declare-fun b!1432076 () Bool)

(declare-fun res!965941 () Bool)

(assert (=> b!1432076 (=> (not res!965941) (not e!808444))))

(assert (=> b!1432076 (= res!965941 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432077 () Bool)

(declare-fun res!965942 () Bool)

(assert (=> b!1432077 (=> (not res!965942) (not e!808440))))

(declare-datatypes ((List!33570 0))(
  ( (Nil!33567) (Cons!33566 (h!34889 (_ BitVec 64)) (t!48264 List!33570)) )
))
(declare-fun arrayNoDuplicates!0 (array!97506 (_ BitVec 32) List!33570) Bool)

(assert (=> b!1432077 (= res!965942 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33567))))

(declare-fun b!1432078 () Bool)

(assert (=> b!1432078 (= e!808440 e!808442)))

(declare-fun res!965932 () Bool)

(assert (=> b!1432078 (=> (not res!965932) (not e!808442))))

(declare-fun lt!630434 () SeekEntryResult!11339)

(assert (=> b!1432078 (= res!965932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47060 a!2831) j!81) mask!2608) (select (arr!47060 a!2831) j!81) a!2831 mask!2608) lt!630434))))

(assert (=> b!1432078 (= lt!630434 (Intermediate!11339 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432079 () Bool)

(declare-fun res!965939 () Bool)

(assert (=> b!1432079 (=> (not res!965939) (not e!808440))))

(assert (=> b!1432079 (= res!965939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432080 () Bool)

(declare-fun res!965940 () Bool)

(assert (=> b!1432080 (=> (not res!965940) (not e!808444))))

(assert (=> b!1432080 (= res!965940 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47060 a!2831) j!81) a!2831 mask!2608) lt!630434))))

(assert (= (and start!123534 res!965943) b!1432074))

(assert (= (and b!1432074 res!965936) b!1432073))

(assert (= (and b!1432073 res!965938) b!1432075))

(assert (= (and b!1432075 res!965937) b!1432079))

(assert (= (and b!1432079 res!965939) b!1432077))

(assert (= (and b!1432077 res!965942) b!1432072))

(assert (= (and b!1432072 res!965935) b!1432078))

(assert (= (and b!1432078 res!965932) b!1432067))

(assert (= (and b!1432067 res!965933) b!1432080))

(assert (= (and b!1432080 res!965940) b!1432068))

(assert (= (and b!1432068 res!965944) b!1432076))

(assert (= (and b!1432076 res!965941) b!1432071))

(assert (= (and b!1432071 res!965931) b!1432070))

(assert (= (and b!1432071 (not res!965934)) b!1432069))

(declare-fun m!1321857 () Bool)

(assert (=> b!1432075 m!1321857))

(assert (=> b!1432075 m!1321857))

(declare-fun m!1321859 () Bool)

(assert (=> b!1432075 m!1321859))

(declare-fun m!1321861 () Bool)

(assert (=> b!1432067 m!1321861))

(assert (=> b!1432067 m!1321861))

(declare-fun m!1321863 () Bool)

(assert (=> b!1432067 m!1321863))

(declare-fun m!1321865 () Bool)

(assert (=> b!1432067 m!1321865))

(declare-fun m!1321867 () Bool)

(assert (=> b!1432067 m!1321867))

(declare-fun m!1321869 () Bool)

(assert (=> b!1432073 m!1321869))

(assert (=> b!1432073 m!1321869))

(declare-fun m!1321871 () Bool)

(assert (=> b!1432073 m!1321871))

(declare-fun m!1321873 () Bool)

(assert (=> b!1432079 m!1321873))

(assert (=> b!1432080 m!1321857))

(assert (=> b!1432080 m!1321857))

(declare-fun m!1321875 () Bool)

(assert (=> b!1432080 m!1321875))

(declare-fun m!1321877 () Bool)

(assert (=> start!123534 m!1321877))

(declare-fun m!1321879 () Bool)

(assert (=> start!123534 m!1321879))

(assert (=> b!1432071 m!1321865))

(declare-fun m!1321881 () Bool)

(assert (=> b!1432071 m!1321881))

(declare-fun m!1321883 () Bool)

(assert (=> b!1432071 m!1321883))

(declare-fun m!1321885 () Bool)

(assert (=> b!1432071 m!1321885))

(assert (=> b!1432071 m!1321857))

(declare-fun m!1321887 () Bool)

(assert (=> b!1432071 m!1321887))

(declare-fun m!1321889 () Bool)

(assert (=> b!1432068 m!1321889))

(declare-fun m!1321891 () Bool)

(assert (=> b!1432077 m!1321891))

(assert (=> b!1432078 m!1321857))

(assert (=> b!1432078 m!1321857))

(declare-fun m!1321893 () Bool)

(assert (=> b!1432078 m!1321893))

(assert (=> b!1432078 m!1321893))

(assert (=> b!1432078 m!1321857))

(declare-fun m!1321895 () Bool)

(assert (=> b!1432078 m!1321895))

(declare-fun m!1321897 () Bool)

(assert (=> b!1432069 m!1321897))

(assert (=> b!1432070 m!1321857))

(assert (=> b!1432070 m!1321857))

(declare-fun m!1321899 () Bool)

(assert (=> b!1432070 m!1321899))

(push 1)

