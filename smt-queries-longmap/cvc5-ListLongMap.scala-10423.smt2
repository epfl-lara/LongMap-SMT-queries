; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122700 () Bool)

(assert start!122700)

(declare-fun b!1421541 () Bool)

(declare-fun e!803771 () Bool)

(declare-fun e!803770 () Bool)

(assert (=> b!1421541 (= e!803771 e!803770)))

(declare-fun res!956985 () Bool)

(assert (=> b!1421541 (=> (not res!956985) (not e!803770))))

(declare-datatypes ((SeekEntryResult!11135 0))(
  ( (MissingZero!11135 (index!46932 (_ BitVec 32))) (Found!11135 (index!46933 (_ BitVec 32))) (Intermediate!11135 (undefined!11947 Bool) (index!46934 (_ BitVec 32)) (x!128585 (_ BitVec 32))) (Undefined!11135) (MissingVacant!11135 (index!46935 (_ BitVec 32))) )
))
(declare-fun lt!626310 () SeekEntryResult!11135)

(declare-datatypes ((array!97065 0))(
  ( (array!97066 (arr!46850 (Array (_ BitVec 32) (_ BitVec 64))) (size!47400 (_ BitVec 32))) )
))
(declare-fun lt!626306 () array!97065)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626309 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97065 (_ BitVec 32)) SeekEntryResult!11135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421541 (= res!956985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626309 mask!2608) lt!626309 lt!626306 mask!2608) lt!626310))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421541 (= lt!626310 (Intermediate!11135 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97065)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421541 (= lt!626309 (select (store (arr!46850 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421541 (= lt!626306 (array!97066 (store (arr!46850 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47400 a!2831)))))

(declare-fun b!1421543 () Bool)

(declare-fun res!956975 () Bool)

(assert (=> b!1421543 (=> (not res!956975) (not e!803770))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421543 (= res!956975 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626309 lt!626306 mask!2608) lt!626310))))

(declare-fun b!1421544 () Bool)

(declare-fun res!956984 () Bool)

(declare-fun e!803772 () Bool)

(assert (=> b!1421544 (=> (not res!956984) (not e!803772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421544 (= res!956984 (validKeyInArray!0 (select (arr!46850 a!2831) i!982)))))

(declare-fun b!1421545 () Bool)

(declare-fun res!956974 () Bool)

(assert (=> b!1421545 (=> (not res!956974) (not e!803772))))

(assert (=> b!1421545 (= res!956974 (validKeyInArray!0 (select (arr!46850 a!2831) j!81)))))

(declare-fun b!1421546 () Bool)

(declare-fun res!956977 () Bool)

(assert (=> b!1421546 (=> (not res!956977) (not e!803772))))

(assert (=> b!1421546 (= res!956977 (and (= (size!47400 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47400 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47400 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421547 () Bool)

(declare-fun res!956979 () Bool)

(assert (=> b!1421547 (=> (not res!956979) (not e!803772))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421547 (= res!956979 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47400 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47400 a!2831))))))

(declare-fun b!1421548 () Bool)

(declare-fun res!956982 () Bool)

(assert (=> b!1421548 (=> (not res!956982) (not e!803772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97065 (_ BitVec 32)) Bool)

(assert (=> b!1421548 (= res!956982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421549 () Bool)

(declare-fun res!956983 () Bool)

(assert (=> b!1421549 (=> (not res!956983) (not e!803770))))

(declare-fun lt!626307 () SeekEntryResult!11135)

(assert (=> b!1421549 (= res!956983 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46850 a!2831) j!81) a!2831 mask!2608) lt!626307))))

(declare-fun b!1421550 () Bool)

(assert (=> b!1421550 (= e!803772 e!803771)))

(declare-fun res!956976 () Bool)

(assert (=> b!1421550 (=> (not res!956976) (not e!803771))))

(assert (=> b!1421550 (= res!956976 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46850 a!2831) j!81) mask!2608) (select (arr!46850 a!2831) j!81) a!2831 mask!2608) lt!626307))))

(assert (=> b!1421550 (= lt!626307 (Intermediate!11135 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421551 () Bool)

(declare-fun res!956980 () Bool)

(assert (=> b!1421551 (=> (not res!956980) (not e!803770))))

(assert (=> b!1421551 (= res!956980 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421542 () Bool)

(assert (=> b!1421542 (= e!803770 (not true))))

(declare-fun e!803774 () Bool)

(assert (=> b!1421542 e!803774))

(declare-fun res!956986 () Bool)

(assert (=> b!1421542 (=> (not res!956986) (not e!803774))))

(assert (=> b!1421542 (= res!956986 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48106 0))(
  ( (Unit!48107) )
))
(declare-fun lt!626308 () Unit!48106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48106)

(assert (=> b!1421542 (= lt!626308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!956981 () Bool)

(assert (=> start!122700 (=> (not res!956981) (not e!803772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122700 (= res!956981 (validMask!0 mask!2608))))

(assert (=> start!122700 e!803772))

(assert (=> start!122700 true))

(declare-fun array_inv!35878 (array!97065) Bool)

(assert (=> start!122700 (array_inv!35878 a!2831)))

(declare-fun b!1421552 () Bool)

(declare-fun res!956978 () Bool)

(assert (=> b!1421552 (=> (not res!956978) (not e!803772))))

(declare-datatypes ((List!33360 0))(
  ( (Nil!33357) (Cons!33356 (h!34658 (_ BitVec 64)) (t!48054 List!33360)) )
))
(declare-fun arrayNoDuplicates!0 (array!97065 (_ BitVec 32) List!33360) Bool)

(assert (=> b!1421552 (= res!956978 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33357))))

(declare-fun b!1421553 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97065 (_ BitVec 32)) SeekEntryResult!11135)

(assert (=> b!1421553 (= e!803774 (= (seekEntryOrOpen!0 (select (arr!46850 a!2831) j!81) a!2831 mask!2608) (Found!11135 j!81)))))

(assert (= (and start!122700 res!956981) b!1421546))

(assert (= (and b!1421546 res!956977) b!1421544))

(assert (= (and b!1421544 res!956984) b!1421545))

(assert (= (and b!1421545 res!956974) b!1421548))

(assert (= (and b!1421548 res!956982) b!1421552))

(assert (= (and b!1421552 res!956978) b!1421547))

(assert (= (and b!1421547 res!956979) b!1421550))

(assert (= (and b!1421550 res!956976) b!1421541))

(assert (= (and b!1421541 res!956985) b!1421549))

(assert (= (and b!1421549 res!956983) b!1421543))

(assert (= (and b!1421543 res!956975) b!1421551))

(assert (= (and b!1421551 res!956980) b!1421542))

(assert (= (and b!1421542 res!956986) b!1421553))

(declare-fun m!1312083 () Bool)

(assert (=> b!1421544 m!1312083))

(assert (=> b!1421544 m!1312083))

(declare-fun m!1312085 () Bool)

(assert (=> b!1421544 m!1312085))

(declare-fun m!1312087 () Bool)

(assert (=> b!1421549 m!1312087))

(assert (=> b!1421549 m!1312087))

(declare-fun m!1312089 () Bool)

(assert (=> b!1421549 m!1312089))

(declare-fun m!1312091 () Bool)

(assert (=> b!1421542 m!1312091))

(declare-fun m!1312093 () Bool)

(assert (=> b!1421542 m!1312093))

(assert (=> b!1421550 m!1312087))

(assert (=> b!1421550 m!1312087))

(declare-fun m!1312095 () Bool)

(assert (=> b!1421550 m!1312095))

(assert (=> b!1421550 m!1312095))

(assert (=> b!1421550 m!1312087))

(declare-fun m!1312097 () Bool)

(assert (=> b!1421550 m!1312097))

(declare-fun m!1312099 () Bool)

(assert (=> b!1421543 m!1312099))

(assert (=> b!1421553 m!1312087))

(assert (=> b!1421553 m!1312087))

(declare-fun m!1312101 () Bool)

(assert (=> b!1421553 m!1312101))

(declare-fun m!1312103 () Bool)

(assert (=> start!122700 m!1312103))

(declare-fun m!1312105 () Bool)

(assert (=> start!122700 m!1312105))

(declare-fun m!1312107 () Bool)

(assert (=> b!1421552 m!1312107))

(declare-fun m!1312109 () Bool)

(assert (=> b!1421541 m!1312109))

(assert (=> b!1421541 m!1312109))

(declare-fun m!1312111 () Bool)

(assert (=> b!1421541 m!1312111))

(declare-fun m!1312113 () Bool)

(assert (=> b!1421541 m!1312113))

(declare-fun m!1312115 () Bool)

(assert (=> b!1421541 m!1312115))

(declare-fun m!1312117 () Bool)

(assert (=> b!1421548 m!1312117))

(assert (=> b!1421545 m!1312087))

(assert (=> b!1421545 m!1312087))

(declare-fun m!1312119 () Bool)

(assert (=> b!1421545 m!1312119))

(push 1)

