; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122830 () Bool)

(assert start!122830)

(declare-fun b!1424559 () Bool)

(declare-fun e!805068 () Bool)

(declare-fun e!805073 () Bool)

(assert (=> b!1424559 (= e!805068 e!805073)))

(declare-fun res!959993 () Bool)

(assert (=> b!1424559 (=> res!959993 e!805073)))

(declare-fun lt!627606 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97195 0))(
  ( (array!97196 (arr!46915 (Array (_ BitVec 32) (_ BitVec 64))) (size!47465 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97195)

(assert (=> b!1424559 (= res!959993 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627606 #b00000000000000000000000000000000) (bvsge lt!627606 (size!47465 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424559 (= lt!627606 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424560 () Bool)

(declare-fun res!960006 () Bool)

(declare-fun e!805070 () Bool)

(assert (=> b!1424560 (=> (not res!960006) (not e!805070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97195 (_ BitVec 32)) Bool)

(assert (=> b!1424560 (= res!960006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424561 () Bool)

(declare-fun res!959999 () Bool)

(assert (=> b!1424561 (=> res!959999 e!805073)))

(declare-datatypes ((SeekEntryResult!11200 0))(
  ( (MissingZero!11200 (index!47192 (_ BitVec 32))) (Found!11200 (index!47193 (_ BitVec 32))) (Intermediate!11200 (undefined!12012 Bool) (index!47194 (_ BitVec 32)) (x!128818 (_ BitVec 32))) (Undefined!11200) (MissingVacant!11200 (index!47195 (_ BitVec 32))) )
))
(declare-fun lt!627607 () SeekEntryResult!11200)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97195 (_ BitVec 32)) SeekEntryResult!11200)

(assert (=> b!1424561 (= res!959999 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627606 (select (arr!46915 a!2831) j!81) a!2831 mask!2608) lt!627607)))))

(declare-fun b!1424562 () Bool)

(declare-fun e!805071 () Bool)

(declare-fun e!805072 () Bool)

(assert (=> b!1424562 (= e!805071 e!805072)))

(declare-fun res!960002 () Bool)

(assert (=> b!1424562 (=> (not res!960002) (not e!805072))))

(declare-fun lt!627608 () array!97195)

(declare-fun lt!627603 () (_ BitVec 64))

(declare-fun lt!627604 () SeekEntryResult!11200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424562 (= res!960002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627603 mask!2608) lt!627603 lt!627608 mask!2608) lt!627604))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424562 (= lt!627604 (Intermediate!11200 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424562 (= lt!627603 (select (store (arr!46915 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424562 (= lt!627608 (array!97196 (store (arr!46915 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47465 a!2831)))))

(declare-fun b!1424563 () Bool)

(declare-fun res!959994 () Bool)

(assert (=> b!1424563 (=> (not res!959994) (not e!805072))))

(assert (=> b!1424563 (= res!959994 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627603 lt!627608 mask!2608) lt!627604))))

(declare-fun b!1424564 () Bool)

(declare-fun res!960003 () Bool)

(assert (=> b!1424564 (=> (not res!960003) (not e!805070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424564 (= res!960003 (validKeyInArray!0 (select (arr!46915 a!2831) j!81)))))

(declare-fun b!1424565 () Bool)

(declare-fun res!960005 () Bool)

(assert (=> b!1424565 (=> (not res!960005) (not e!805070))))

(declare-datatypes ((List!33425 0))(
  ( (Nil!33422) (Cons!33421 (h!34723 (_ BitVec 64)) (t!48119 List!33425)) )
))
(declare-fun arrayNoDuplicates!0 (array!97195 (_ BitVec 32) List!33425) Bool)

(assert (=> b!1424565 (= res!960005 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33422))))

(declare-fun b!1424566 () Bool)

(declare-fun res!959997 () Bool)

(assert (=> b!1424566 (=> (not res!959997) (not e!805072))))

(assert (=> b!1424566 (= res!959997 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46915 a!2831) j!81) a!2831 mask!2608) lt!627607))))

(declare-fun b!1424567 () Bool)

(assert (=> b!1424567 (= e!805072 (not e!805068))))

(declare-fun res!959998 () Bool)

(assert (=> b!1424567 (=> res!959998 e!805068)))

(assert (=> b!1424567 (= res!959998 (or (= (select (arr!46915 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46915 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46915 a!2831) index!585) (select (arr!46915 a!2831) j!81)) (= (select (store (arr!46915 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805067 () Bool)

(assert (=> b!1424567 e!805067))

(declare-fun res!960004 () Bool)

(assert (=> b!1424567 (=> (not res!960004) (not e!805067))))

(assert (=> b!1424567 (= res!960004 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48236 0))(
  ( (Unit!48237) )
))
(declare-fun lt!627605 () Unit!48236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48236)

(assert (=> b!1424567 (= lt!627605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424568 () Bool)

(assert (=> b!1424568 (= e!805070 e!805071)))

(declare-fun res!960007 () Bool)

(assert (=> b!1424568 (=> (not res!960007) (not e!805071))))

(assert (=> b!1424568 (= res!960007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46915 a!2831) j!81) mask!2608) (select (arr!46915 a!2831) j!81) a!2831 mask!2608) lt!627607))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424568 (= lt!627607 (Intermediate!11200 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424569 () Bool)

(declare-fun res!960001 () Bool)

(assert (=> b!1424569 (=> (not res!960001) (not e!805072))))

(assert (=> b!1424569 (= res!960001 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!959992 () Bool)

(assert (=> start!122830 (=> (not res!959992) (not e!805070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122830 (= res!959992 (validMask!0 mask!2608))))

(assert (=> start!122830 e!805070))

(assert (=> start!122830 true))

(declare-fun array_inv!35943 (array!97195) Bool)

(assert (=> start!122830 (array_inv!35943 a!2831)))

(declare-fun b!1424570 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97195 (_ BitVec 32)) SeekEntryResult!11200)

(assert (=> b!1424570 (= e!805067 (= (seekEntryOrOpen!0 (select (arr!46915 a!2831) j!81) a!2831 mask!2608) (Found!11200 j!81)))))

(declare-fun b!1424571 () Bool)

(declare-fun res!959996 () Bool)

(assert (=> b!1424571 (=> (not res!959996) (not e!805070))))

(assert (=> b!1424571 (= res!959996 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47465 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47465 a!2831))))))

(declare-fun b!1424572 () Bool)

(declare-fun res!959995 () Bool)

(assert (=> b!1424572 (=> (not res!959995) (not e!805070))))

(assert (=> b!1424572 (= res!959995 (and (= (size!47465 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47465 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47465 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424573 () Bool)

(declare-fun res!960000 () Bool)

(assert (=> b!1424573 (=> (not res!960000) (not e!805070))))

(assert (=> b!1424573 (= res!960000 (validKeyInArray!0 (select (arr!46915 a!2831) i!982)))))

(declare-fun b!1424574 () Bool)

(assert (=> b!1424574 (= e!805073 true)))

(declare-fun lt!627609 () SeekEntryResult!11200)

(assert (=> b!1424574 (= lt!627609 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627606 lt!627603 lt!627608 mask!2608))))

(assert (= (and start!122830 res!959992) b!1424572))

(assert (= (and b!1424572 res!959995) b!1424573))

(assert (= (and b!1424573 res!960000) b!1424564))

(assert (= (and b!1424564 res!960003) b!1424560))

(assert (= (and b!1424560 res!960006) b!1424565))

(assert (= (and b!1424565 res!960005) b!1424571))

(assert (= (and b!1424571 res!959996) b!1424568))

(assert (= (and b!1424568 res!960007) b!1424562))

(assert (= (and b!1424562 res!960002) b!1424566))

(assert (= (and b!1424566 res!959997) b!1424563))

(assert (= (and b!1424563 res!959994) b!1424569))

(assert (= (and b!1424569 res!960001) b!1424567))

(assert (= (and b!1424567 res!960004) b!1424570))

(assert (= (and b!1424567 (not res!959998)) b!1424559))

(assert (= (and b!1424559 (not res!959993)) b!1424561))

(assert (= (and b!1424561 (not res!959999)) b!1424574))

(declare-fun m!1315107 () Bool)

(assert (=> b!1424565 m!1315107))

(declare-fun m!1315109 () Bool)

(assert (=> start!122830 m!1315109))

(declare-fun m!1315111 () Bool)

(assert (=> start!122830 m!1315111))

(declare-fun m!1315113 () Bool)

(assert (=> b!1424568 m!1315113))

(assert (=> b!1424568 m!1315113))

(declare-fun m!1315115 () Bool)

(assert (=> b!1424568 m!1315115))

(assert (=> b!1424568 m!1315115))

(assert (=> b!1424568 m!1315113))

(declare-fun m!1315117 () Bool)

(assert (=> b!1424568 m!1315117))

(assert (=> b!1424566 m!1315113))

(assert (=> b!1424566 m!1315113))

(declare-fun m!1315119 () Bool)

(assert (=> b!1424566 m!1315119))

(declare-fun m!1315121 () Bool)

(assert (=> b!1424574 m!1315121))

(declare-fun m!1315123 () Bool)

(assert (=> b!1424573 m!1315123))

(assert (=> b!1424573 m!1315123))

(declare-fun m!1315125 () Bool)

(assert (=> b!1424573 m!1315125))

(declare-fun m!1315127 () Bool)

(assert (=> b!1424560 m!1315127))

(assert (=> b!1424564 m!1315113))

(assert (=> b!1424564 m!1315113))

(declare-fun m!1315129 () Bool)

(assert (=> b!1424564 m!1315129))

(assert (=> b!1424561 m!1315113))

(assert (=> b!1424561 m!1315113))

(declare-fun m!1315131 () Bool)

(assert (=> b!1424561 m!1315131))

(declare-fun m!1315133 () Bool)

(assert (=> b!1424567 m!1315133))

(declare-fun m!1315135 () Bool)

(assert (=> b!1424567 m!1315135))

(declare-fun m!1315137 () Bool)

(assert (=> b!1424567 m!1315137))

(declare-fun m!1315139 () Bool)

(assert (=> b!1424567 m!1315139))

(assert (=> b!1424567 m!1315113))

(declare-fun m!1315141 () Bool)

(assert (=> b!1424567 m!1315141))

(declare-fun m!1315143 () Bool)

(assert (=> b!1424563 m!1315143))

(declare-fun m!1315145 () Bool)

(assert (=> b!1424559 m!1315145))

(assert (=> b!1424570 m!1315113))

(assert (=> b!1424570 m!1315113))

(declare-fun m!1315147 () Bool)

(assert (=> b!1424570 m!1315147))

(declare-fun m!1315149 () Bool)

(assert (=> b!1424562 m!1315149))

(assert (=> b!1424562 m!1315149))

(declare-fun m!1315151 () Bool)

(assert (=> b!1424562 m!1315151))

(assert (=> b!1424562 m!1315133))

(declare-fun m!1315153 () Bool)

(assert (=> b!1424562 m!1315153))

(push 1)

