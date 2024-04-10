; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122750 () Bool)

(assert start!122750)

(declare-fun b!1422639 () Bool)

(declare-fun e!804228 () Bool)

(declare-fun e!804232 () Bool)

(assert (=> b!1422639 (= e!804228 e!804232)))

(declare-fun res!958074 () Bool)

(assert (=> b!1422639 (=> res!958074 e!804232)))

(declare-fun lt!626764 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97115 0))(
  ( (array!97116 (arr!46875 (Array (_ BitVec 32) (_ BitVec 64))) (size!47425 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97115)

(assert (=> b!1422639 (= res!958074 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626764 #b00000000000000000000000000000000) (bvsge lt!626764 (size!47425 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422639 (= lt!626764 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422640 () Bool)

(declare-fun res!958086 () Bool)

(declare-fun e!804231 () Bool)

(assert (=> b!1422640 (=> (not res!958086) (not e!804231))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422640 (= res!958086 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422641 () Bool)

(declare-fun res!958083 () Bool)

(assert (=> b!1422641 (=> (not res!958083) (not e!804231))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11160 0))(
  ( (MissingZero!11160 (index!47032 (_ BitVec 32))) (Found!11160 (index!47033 (_ BitVec 32))) (Intermediate!11160 (undefined!11972 Bool) (index!47034 (_ BitVec 32)) (x!128674 (_ BitVec 32))) (Undefined!11160) (MissingVacant!11160 (index!47035 (_ BitVec 32))) )
))
(declare-fun lt!626767 () SeekEntryResult!11160)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97115 (_ BitVec 32)) SeekEntryResult!11160)

(assert (=> b!1422641 (= res!958083 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46875 a!2831) j!81) a!2831 mask!2608) lt!626767))))

(declare-fun b!1422642 () Bool)

(assert (=> b!1422642 (= e!804232 true)))

(declare-fun lt!626765 () (_ BitVec 64))

(declare-fun lt!626763 () SeekEntryResult!11160)

(declare-fun lt!626766 () array!97115)

(assert (=> b!1422642 (= lt!626763 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626764 lt!626765 lt!626766 mask!2608))))

(declare-fun b!1422643 () Bool)

(declare-fun res!958084 () Bool)

(assert (=> b!1422643 (=> (not res!958084) (not e!804231))))

(declare-fun lt!626768 () SeekEntryResult!11160)

(assert (=> b!1422643 (= res!958084 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626765 lt!626766 mask!2608) lt!626768))))

(declare-fun b!1422644 () Bool)

(declare-fun e!804229 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97115 (_ BitVec 32)) SeekEntryResult!11160)

(assert (=> b!1422644 (= e!804229 (= (seekEntryOrOpen!0 (select (arr!46875 a!2831) j!81) a!2831 mask!2608) (Found!11160 j!81)))))

(declare-fun b!1422645 () Bool)

(declare-fun e!804230 () Bool)

(declare-fun e!804233 () Bool)

(assert (=> b!1422645 (= e!804230 e!804233)))

(declare-fun res!958082 () Bool)

(assert (=> b!1422645 (=> (not res!958082) (not e!804233))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422645 (= res!958082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46875 a!2831) j!81) mask!2608) (select (arr!46875 a!2831) j!81) a!2831 mask!2608) lt!626767))))

(assert (=> b!1422645 (= lt!626767 (Intermediate!11160 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422646 () Bool)

(declare-fun res!958085 () Bool)

(assert (=> b!1422646 (=> res!958085 e!804232)))

(assert (=> b!1422646 (= res!958085 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626764 (select (arr!46875 a!2831) j!81) a!2831 mask!2608) lt!626767)))))

(declare-fun b!1422647 () Bool)

(assert (=> b!1422647 (= e!804231 (not e!804228))))

(declare-fun res!958079 () Bool)

(assert (=> b!1422647 (=> res!958079 e!804228)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422647 (= res!958079 (or (= (select (arr!46875 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46875 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46875 a!2831) index!585) (select (arr!46875 a!2831) j!81)) (= (select (store (arr!46875 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422647 e!804229))

(declare-fun res!958075 () Bool)

(assert (=> b!1422647 (=> (not res!958075) (not e!804229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97115 (_ BitVec 32)) Bool)

(assert (=> b!1422647 (= res!958075 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48156 0))(
  ( (Unit!48157) )
))
(declare-fun lt!626769 () Unit!48156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48156)

(assert (=> b!1422647 (= lt!626769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422648 () Bool)

(declare-fun res!958078 () Bool)

(assert (=> b!1422648 (=> (not res!958078) (not e!804230))))

(assert (=> b!1422648 (= res!958078 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47425 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47425 a!2831))))))

(declare-fun b!1422649 () Bool)

(declare-fun res!958087 () Bool)

(assert (=> b!1422649 (=> (not res!958087) (not e!804230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422649 (= res!958087 (validKeyInArray!0 (select (arr!46875 a!2831) i!982)))))

(declare-fun b!1422650 () Bool)

(declare-fun res!958077 () Bool)

(assert (=> b!1422650 (=> (not res!958077) (not e!804230))))

(declare-datatypes ((List!33385 0))(
  ( (Nil!33382) (Cons!33381 (h!34683 (_ BitVec 64)) (t!48079 List!33385)) )
))
(declare-fun arrayNoDuplicates!0 (array!97115 (_ BitVec 32) List!33385) Bool)

(assert (=> b!1422650 (= res!958077 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33382))))

(declare-fun b!1422651 () Bool)

(declare-fun res!958081 () Bool)

(assert (=> b!1422651 (=> (not res!958081) (not e!804230))))

(assert (=> b!1422651 (= res!958081 (validKeyInArray!0 (select (arr!46875 a!2831) j!81)))))

(declare-fun b!1422652 () Bool)

(assert (=> b!1422652 (= e!804233 e!804231)))

(declare-fun res!958072 () Bool)

(assert (=> b!1422652 (=> (not res!958072) (not e!804231))))

(assert (=> b!1422652 (= res!958072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626765 mask!2608) lt!626765 lt!626766 mask!2608) lt!626768))))

(assert (=> b!1422652 (= lt!626768 (Intermediate!11160 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422652 (= lt!626765 (select (store (arr!46875 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422652 (= lt!626766 (array!97116 (store (arr!46875 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47425 a!2831)))))

(declare-fun b!1422653 () Bool)

(declare-fun res!958080 () Bool)

(assert (=> b!1422653 (=> (not res!958080) (not e!804230))))

(assert (=> b!1422653 (= res!958080 (and (= (size!47425 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47425 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47425 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422654 () Bool)

(declare-fun res!958073 () Bool)

(assert (=> b!1422654 (=> (not res!958073) (not e!804230))))

(assert (=> b!1422654 (= res!958073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!958076 () Bool)

(assert (=> start!122750 (=> (not res!958076) (not e!804230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122750 (= res!958076 (validMask!0 mask!2608))))

(assert (=> start!122750 e!804230))

(assert (=> start!122750 true))

(declare-fun array_inv!35903 (array!97115) Bool)

(assert (=> start!122750 (array_inv!35903 a!2831)))

(assert (= (and start!122750 res!958076) b!1422653))

(assert (= (and b!1422653 res!958080) b!1422649))

(assert (= (and b!1422649 res!958087) b!1422651))

(assert (= (and b!1422651 res!958081) b!1422654))

(assert (= (and b!1422654 res!958073) b!1422650))

(assert (= (and b!1422650 res!958077) b!1422648))

(assert (= (and b!1422648 res!958078) b!1422645))

(assert (= (and b!1422645 res!958082) b!1422652))

(assert (= (and b!1422652 res!958072) b!1422641))

(assert (= (and b!1422641 res!958083) b!1422643))

(assert (= (and b!1422643 res!958084) b!1422640))

(assert (= (and b!1422640 res!958086) b!1422647))

(assert (= (and b!1422647 res!958075) b!1422644))

(assert (= (and b!1422647 (not res!958079)) b!1422639))

(assert (= (and b!1422639 (not res!958074)) b!1422646))

(assert (= (and b!1422646 (not res!958085)) b!1422642))

(declare-fun m!1313187 () Bool)

(assert (=> b!1422643 m!1313187))

(declare-fun m!1313189 () Bool)

(assert (=> b!1422649 m!1313189))

(assert (=> b!1422649 m!1313189))

(declare-fun m!1313191 () Bool)

(assert (=> b!1422649 m!1313191))

(declare-fun m!1313193 () Bool)

(assert (=> b!1422652 m!1313193))

(assert (=> b!1422652 m!1313193))

(declare-fun m!1313195 () Bool)

(assert (=> b!1422652 m!1313195))

(declare-fun m!1313197 () Bool)

(assert (=> b!1422652 m!1313197))

(declare-fun m!1313199 () Bool)

(assert (=> b!1422652 m!1313199))

(assert (=> b!1422647 m!1313197))

(declare-fun m!1313201 () Bool)

(assert (=> b!1422647 m!1313201))

(declare-fun m!1313203 () Bool)

(assert (=> b!1422647 m!1313203))

(declare-fun m!1313205 () Bool)

(assert (=> b!1422647 m!1313205))

(declare-fun m!1313207 () Bool)

(assert (=> b!1422647 m!1313207))

(declare-fun m!1313209 () Bool)

(assert (=> b!1422647 m!1313209))

(declare-fun m!1313211 () Bool)

(assert (=> b!1422654 m!1313211))

(assert (=> b!1422645 m!1313207))

(assert (=> b!1422645 m!1313207))

(declare-fun m!1313213 () Bool)

(assert (=> b!1422645 m!1313213))

(assert (=> b!1422645 m!1313213))

(assert (=> b!1422645 m!1313207))

(declare-fun m!1313215 () Bool)

(assert (=> b!1422645 m!1313215))

(assert (=> b!1422646 m!1313207))

(assert (=> b!1422646 m!1313207))

(declare-fun m!1313217 () Bool)

(assert (=> b!1422646 m!1313217))

(declare-fun m!1313219 () Bool)

(assert (=> b!1422642 m!1313219))

(assert (=> b!1422651 m!1313207))

(assert (=> b!1422651 m!1313207))

(declare-fun m!1313221 () Bool)

(assert (=> b!1422651 m!1313221))

(declare-fun m!1313223 () Bool)

(assert (=> start!122750 m!1313223))

(declare-fun m!1313225 () Bool)

(assert (=> start!122750 m!1313225))

(assert (=> b!1422644 m!1313207))

(assert (=> b!1422644 m!1313207))

(declare-fun m!1313227 () Bool)

(assert (=> b!1422644 m!1313227))

(assert (=> b!1422641 m!1313207))

(assert (=> b!1422641 m!1313207))

(declare-fun m!1313229 () Bool)

(assert (=> b!1422641 m!1313229))

(declare-fun m!1313231 () Bool)

(assert (=> b!1422639 m!1313231))

(declare-fun m!1313233 () Bool)

(assert (=> b!1422650 m!1313233))

(check-sat (not b!1422643) (not start!122750) (not b!1422649) (not b!1422650) (not b!1422639) (not b!1422646) (not b!1422651) (not b!1422644) (not b!1422654) (not b!1422645) (not b!1422652) (not b!1422642) (not b!1422641) (not b!1422647))
(check-sat)
