; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122692 () Bool)

(assert start!122692)

(declare-fun b!1421395 () Bool)

(declare-fun res!956836 () Bool)

(declare-fun e!803720 () Bool)

(assert (=> b!1421395 (=> (not res!956836) (not e!803720))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97057 0))(
  ( (array!97058 (arr!46846 (Array (_ BitVec 32) (_ BitVec 64))) (size!47396 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97057)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421395 (= res!956836 (and (= (size!47396 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47396 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47396 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421396 () Bool)

(declare-fun res!956833 () Bool)

(assert (=> b!1421396 (=> (not res!956833) (not e!803720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421396 (= res!956833 (validKeyInArray!0 (select (arr!46846 a!2831) i!982)))))

(declare-fun b!1421397 () Bool)

(declare-fun res!956839 () Bool)

(declare-fun e!803721 () Bool)

(assert (=> b!1421397 (=> (not res!956839) (not e!803721))))

(declare-fun lt!626247 () array!97057)

(declare-fun lt!626248 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11131 0))(
  ( (MissingZero!11131 (index!46916 (_ BitVec 32))) (Found!11131 (index!46917 (_ BitVec 32))) (Intermediate!11131 (undefined!11943 Bool) (index!46918 (_ BitVec 32)) (x!128565 (_ BitVec 32))) (Undefined!11131) (MissingVacant!11131 (index!46919 (_ BitVec 32))) )
))
(declare-fun lt!626250 () SeekEntryResult!11131)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97057 (_ BitVec 32)) SeekEntryResult!11131)

(assert (=> b!1421397 (= res!956839 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626248 lt!626247 mask!2608) lt!626250))))

(declare-fun b!1421398 () Bool)

(assert (=> b!1421398 (= e!803721 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97057 (_ BitVec 32)) Bool)

(assert (=> b!1421398 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48098 0))(
  ( (Unit!48099) )
))
(declare-fun lt!626249 () Unit!48098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48098)

(assert (=> b!1421398 (= lt!626249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421399 () Bool)

(declare-fun res!956834 () Bool)

(assert (=> b!1421399 (=> (not res!956834) (not e!803720))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421399 (= res!956834 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47396 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47396 a!2831))))))

(declare-fun res!956828 () Bool)

(assert (=> start!122692 (=> (not res!956828) (not e!803720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122692 (= res!956828 (validMask!0 mask!2608))))

(assert (=> start!122692 e!803720))

(assert (=> start!122692 true))

(declare-fun array_inv!35874 (array!97057) Bool)

(assert (=> start!122692 (array_inv!35874 a!2831)))

(declare-fun b!1421400 () Bool)

(declare-fun e!803722 () Bool)

(assert (=> b!1421400 (= e!803720 e!803722)))

(declare-fun res!956831 () Bool)

(assert (=> b!1421400 (=> (not res!956831) (not e!803722))))

(declare-fun lt!626246 () SeekEntryResult!11131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421400 (= res!956831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46846 a!2831) j!81) mask!2608) (select (arr!46846 a!2831) j!81) a!2831 mask!2608) lt!626246))))

(assert (=> b!1421400 (= lt!626246 (Intermediate!11131 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421401 () Bool)

(declare-fun res!956838 () Bool)

(assert (=> b!1421401 (=> (not res!956838) (not e!803721))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421401 (= res!956838 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421402 () Bool)

(declare-fun res!956829 () Bool)

(assert (=> b!1421402 (=> (not res!956829) (not e!803720))))

(declare-datatypes ((List!33356 0))(
  ( (Nil!33353) (Cons!33352 (h!34654 (_ BitVec 64)) (t!48050 List!33356)) )
))
(declare-fun arrayNoDuplicates!0 (array!97057 (_ BitVec 32) List!33356) Bool)

(assert (=> b!1421402 (= res!956829 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33353))))

(declare-fun b!1421403 () Bool)

(declare-fun res!956835 () Bool)

(assert (=> b!1421403 (=> (not res!956835) (not e!803721))))

(assert (=> b!1421403 (= res!956835 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46846 a!2831) j!81) a!2831 mask!2608) lt!626246))))

(declare-fun b!1421404 () Bool)

(assert (=> b!1421404 (= e!803722 e!803721)))

(declare-fun res!956832 () Bool)

(assert (=> b!1421404 (=> (not res!956832) (not e!803721))))

(assert (=> b!1421404 (= res!956832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626248 mask!2608) lt!626248 lt!626247 mask!2608) lt!626250))))

(assert (=> b!1421404 (= lt!626250 (Intermediate!11131 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421404 (= lt!626248 (select (store (arr!46846 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421404 (= lt!626247 (array!97058 (store (arr!46846 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47396 a!2831)))))

(declare-fun b!1421405 () Bool)

(declare-fun res!956837 () Bool)

(assert (=> b!1421405 (=> (not res!956837) (not e!803720))))

(assert (=> b!1421405 (= res!956837 (validKeyInArray!0 (select (arr!46846 a!2831) j!81)))))

(declare-fun b!1421406 () Bool)

(declare-fun res!956830 () Bool)

(assert (=> b!1421406 (=> (not res!956830) (not e!803720))))

(assert (=> b!1421406 (= res!956830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122692 res!956828) b!1421395))

(assert (= (and b!1421395 res!956836) b!1421396))

(assert (= (and b!1421396 res!956833) b!1421405))

(assert (= (and b!1421405 res!956837) b!1421406))

(assert (= (and b!1421406 res!956830) b!1421402))

(assert (= (and b!1421402 res!956829) b!1421399))

(assert (= (and b!1421399 res!956834) b!1421400))

(assert (= (and b!1421400 res!956831) b!1421404))

(assert (= (and b!1421404 res!956832) b!1421403))

(assert (= (and b!1421403 res!956835) b!1421397))

(assert (= (and b!1421397 res!956839) b!1421401))

(assert (= (and b!1421401 res!956838) b!1421398))

(declare-fun m!1311939 () Bool)

(assert (=> b!1421403 m!1311939))

(assert (=> b!1421403 m!1311939))

(declare-fun m!1311941 () Bool)

(assert (=> b!1421403 m!1311941))

(declare-fun m!1311943 () Bool)

(assert (=> b!1421402 m!1311943))

(declare-fun m!1311945 () Bool)

(assert (=> start!122692 m!1311945))

(declare-fun m!1311947 () Bool)

(assert (=> start!122692 m!1311947))

(declare-fun m!1311949 () Bool)

(assert (=> b!1421398 m!1311949))

(declare-fun m!1311951 () Bool)

(assert (=> b!1421398 m!1311951))

(declare-fun m!1311953 () Bool)

(assert (=> b!1421397 m!1311953))

(assert (=> b!1421405 m!1311939))

(assert (=> b!1421405 m!1311939))

(declare-fun m!1311955 () Bool)

(assert (=> b!1421405 m!1311955))

(assert (=> b!1421400 m!1311939))

(assert (=> b!1421400 m!1311939))

(declare-fun m!1311957 () Bool)

(assert (=> b!1421400 m!1311957))

(assert (=> b!1421400 m!1311957))

(assert (=> b!1421400 m!1311939))

(declare-fun m!1311959 () Bool)

(assert (=> b!1421400 m!1311959))

(declare-fun m!1311961 () Bool)

(assert (=> b!1421404 m!1311961))

(assert (=> b!1421404 m!1311961))

(declare-fun m!1311963 () Bool)

(assert (=> b!1421404 m!1311963))

(declare-fun m!1311965 () Bool)

(assert (=> b!1421404 m!1311965))

(declare-fun m!1311967 () Bool)

(assert (=> b!1421404 m!1311967))

(declare-fun m!1311969 () Bool)

(assert (=> b!1421396 m!1311969))

(assert (=> b!1421396 m!1311969))

(declare-fun m!1311971 () Bool)

(assert (=> b!1421396 m!1311971))

(declare-fun m!1311973 () Bool)

(assert (=> b!1421406 m!1311973))

(push 1)

(assert (not b!1421406))

(assert (not b!1421400))

