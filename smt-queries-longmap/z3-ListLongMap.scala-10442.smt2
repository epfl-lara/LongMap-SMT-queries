; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122810 () Bool)

(assert start!122810)

(declare-fun b!1424094 () Bool)

(declare-fun e!804865 () Bool)

(declare-fun e!804866 () Bool)

(assert (=> b!1424094 (= e!804865 e!804866)))

(declare-fun res!959588 () Bool)

(assert (=> b!1424094 (=> (not res!959588) (not e!804866))))

(declare-datatypes ((array!97128 0))(
  ( (array!97129 (arr!46882 (Array (_ BitVec 32) (_ BitVec 64))) (size!47434 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97128)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11194 0))(
  ( (MissingZero!11194 (index!47168 (_ BitVec 32))) (Found!11194 (index!47169 (_ BitVec 32))) (Intermediate!11194 (undefined!12006 Bool) (index!47170 (_ BitVec 32)) (x!128793 (_ BitVec 32))) (Undefined!11194) (MissingVacant!11194 (index!47171 (_ BitVec 32))) )
))
(declare-fun lt!627250 () SeekEntryResult!11194)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97128 (_ BitVec 32)) SeekEntryResult!11194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424094 (= res!959588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46882 a!2831) j!81) mask!2608) (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!627250))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424094 (= lt!627250 (Intermediate!11194 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424095 () Bool)

(declare-fun res!959585 () Bool)

(assert (=> b!1424095 (=> (not res!959585) (not e!804865))))

(declare-datatypes ((List!33470 0))(
  ( (Nil!33467) (Cons!33466 (h!34768 (_ BitVec 64)) (t!48156 List!33470)) )
))
(declare-fun arrayNoDuplicates!0 (array!97128 (_ BitVec 32) List!33470) Bool)

(assert (=> b!1424095 (= res!959585 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33467))))

(declare-fun b!1424096 () Bool)

(declare-fun res!959589 () Bool)

(assert (=> b!1424096 (=> (not res!959589) (not e!804865))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424096 (= res!959589 (and (= (size!47434 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47434 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47434 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424097 () Bool)

(declare-fun res!959591 () Bool)

(assert (=> b!1424097 (=> (not res!959591) (not e!804865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97128 (_ BitVec 32)) Bool)

(assert (=> b!1424097 (= res!959591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424098 () Bool)

(declare-fun e!804860 () Bool)

(declare-fun e!804861 () Bool)

(assert (=> b!1424098 (= e!804860 (not e!804861))))

(declare-fun res!959593 () Bool)

(assert (=> b!1424098 (=> res!959593 e!804861)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424098 (= res!959593 (or (= (select (arr!46882 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46882 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46882 a!2831) index!585) (select (arr!46882 a!2831) j!81)) (= (select (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804864 () Bool)

(assert (=> b!1424098 e!804864))

(declare-fun res!959580 () Bool)

(assert (=> b!1424098 (=> (not res!959580) (not e!804864))))

(assert (=> b!1424098 (= res!959580 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48063 0))(
  ( (Unit!48064) )
))
(declare-fun lt!627248 () Unit!48063)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48063)

(assert (=> b!1424098 (= lt!627248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424099 () Bool)

(declare-fun res!959578 () Bool)

(assert (=> b!1424099 (=> (not res!959578) (not e!804860))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424099 (= res!959578 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424100 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97128 (_ BitVec 32)) SeekEntryResult!11194)

(assert (=> b!1424100 (= e!804864 (= (seekEntryOrOpen!0 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) (Found!11194 j!81)))))

(declare-fun b!1424101 () Bool)

(declare-fun res!959586 () Bool)

(assert (=> b!1424101 (=> (not res!959586) (not e!804860))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1424101 (= res!959586 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!627250))))

(declare-fun b!1424102 () Bool)

(declare-fun res!959583 () Bool)

(assert (=> b!1424102 (=> (not res!959583) (not e!804865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424102 (= res!959583 (validKeyInArray!0 (select (arr!46882 a!2831) j!81)))))

(declare-fun b!1424103 () Bool)

(declare-fun res!959587 () Bool)

(assert (=> b!1424103 (=> (not res!959587) (not e!804860))))

(declare-fun lt!627245 () (_ BitVec 64))

(declare-fun lt!627246 () array!97128)

(declare-fun lt!627251 () SeekEntryResult!11194)

(assert (=> b!1424103 (= res!959587 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627245 lt!627246 mask!2608) lt!627251))))

(declare-fun b!1424104 () Bool)

(declare-fun res!959584 () Bool)

(assert (=> b!1424104 (=> (not res!959584) (not e!804865))))

(assert (=> b!1424104 (= res!959584 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47434 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47434 a!2831))))))

(declare-fun b!1424105 () Bool)

(declare-fun e!804862 () Bool)

(assert (=> b!1424105 (= e!804861 e!804862)))

(declare-fun res!959590 () Bool)

(assert (=> b!1424105 (=> res!959590 e!804862)))

(declare-fun lt!627247 () (_ BitVec 32))

(assert (=> b!1424105 (= res!959590 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627247 #b00000000000000000000000000000000) (bvsge lt!627247 (size!47434 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424105 (= lt!627247 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424106 () Bool)

(declare-fun res!959581 () Bool)

(assert (=> b!1424106 (=> (not res!959581) (not e!804865))))

(assert (=> b!1424106 (= res!959581 (validKeyInArray!0 (select (arr!46882 a!2831) i!982)))))

(declare-fun b!1424107 () Bool)

(assert (=> b!1424107 (= e!804866 e!804860)))

(declare-fun res!959582 () Bool)

(assert (=> b!1424107 (=> (not res!959582) (not e!804860))))

(assert (=> b!1424107 (= res!959582 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627245 mask!2608) lt!627245 lt!627246 mask!2608) lt!627251))))

(assert (=> b!1424107 (= lt!627251 (Intermediate!11194 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424107 (= lt!627245 (select (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424107 (= lt!627246 (array!97129 (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47434 a!2831)))))

(declare-fun res!959579 () Bool)

(assert (=> start!122810 (=> (not res!959579) (not e!804865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122810 (= res!959579 (validMask!0 mask!2608))))

(assert (=> start!122810 e!804865))

(assert (=> start!122810 true))

(declare-fun array_inv!36115 (array!97128) Bool)

(assert (=> start!122810 (array_inv!36115 a!2831)))

(declare-fun b!1424108 () Bool)

(declare-fun res!959592 () Bool)

(assert (=> b!1424108 (=> res!959592 e!804862)))

(assert (=> b!1424108 (= res!959592 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627247 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!627250)))))

(declare-fun b!1424109 () Bool)

(assert (=> b!1424109 (= e!804862 true)))

(declare-fun lt!627249 () SeekEntryResult!11194)

(assert (=> b!1424109 (= lt!627249 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627247 lt!627245 lt!627246 mask!2608))))

(assert (= (and start!122810 res!959579) b!1424096))

(assert (= (and b!1424096 res!959589) b!1424106))

(assert (= (and b!1424106 res!959581) b!1424102))

(assert (= (and b!1424102 res!959583) b!1424097))

(assert (= (and b!1424097 res!959591) b!1424095))

(assert (= (and b!1424095 res!959585) b!1424104))

(assert (= (and b!1424104 res!959584) b!1424094))

(assert (= (and b!1424094 res!959588) b!1424107))

(assert (= (and b!1424107 res!959582) b!1424101))

(assert (= (and b!1424101 res!959586) b!1424103))

(assert (= (and b!1424103 res!959587) b!1424099))

(assert (= (and b!1424099 res!959578) b!1424098))

(assert (= (and b!1424098 res!959580) b!1424100))

(assert (= (and b!1424098 (not res!959593)) b!1424105))

(assert (= (and b!1424105 (not res!959590)) b!1424108))

(assert (= (and b!1424108 (not res!959592)) b!1424109))

(declare-fun m!1314171 () Bool)

(assert (=> b!1424108 m!1314171))

(assert (=> b!1424108 m!1314171))

(declare-fun m!1314173 () Bool)

(assert (=> b!1424108 m!1314173))

(declare-fun m!1314175 () Bool)

(assert (=> b!1424107 m!1314175))

(assert (=> b!1424107 m!1314175))

(declare-fun m!1314177 () Bool)

(assert (=> b!1424107 m!1314177))

(declare-fun m!1314179 () Bool)

(assert (=> b!1424107 m!1314179))

(declare-fun m!1314181 () Bool)

(assert (=> b!1424107 m!1314181))

(assert (=> b!1424102 m!1314171))

(assert (=> b!1424102 m!1314171))

(declare-fun m!1314183 () Bool)

(assert (=> b!1424102 m!1314183))

(assert (=> b!1424094 m!1314171))

(assert (=> b!1424094 m!1314171))

(declare-fun m!1314185 () Bool)

(assert (=> b!1424094 m!1314185))

(assert (=> b!1424094 m!1314185))

(assert (=> b!1424094 m!1314171))

(declare-fun m!1314187 () Bool)

(assert (=> b!1424094 m!1314187))

(declare-fun m!1314189 () Bool)

(assert (=> b!1424105 m!1314189))

(assert (=> b!1424101 m!1314171))

(assert (=> b!1424101 m!1314171))

(declare-fun m!1314191 () Bool)

(assert (=> b!1424101 m!1314191))

(declare-fun m!1314193 () Bool)

(assert (=> b!1424106 m!1314193))

(assert (=> b!1424106 m!1314193))

(declare-fun m!1314195 () Bool)

(assert (=> b!1424106 m!1314195))

(assert (=> b!1424098 m!1314179))

(declare-fun m!1314197 () Bool)

(assert (=> b!1424098 m!1314197))

(declare-fun m!1314199 () Bool)

(assert (=> b!1424098 m!1314199))

(declare-fun m!1314201 () Bool)

(assert (=> b!1424098 m!1314201))

(assert (=> b!1424098 m!1314171))

(declare-fun m!1314203 () Bool)

(assert (=> b!1424098 m!1314203))

(declare-fun m!1314205 () Bool)

(assert (=> b!1424103 m!1314205))

(assert (=> b!1424100 m!1314171))

(assert (=> b!1424100 m!1314171))

(declare-fun m!1314207 () Bool)

(assert (=> b!1424100 m!1314207))

(declare-fun m!1314209 () Bool)

(assert (=> b!1424097 m!1314209))

(declare-fun m!1314211 () Bool)

(assert (=> start!122810 m!1314211))

(declare-fun m!1314213 () Bool)

(assert (=> start!122810 m!1314213))

(declare-fun m!1314215 () Bool)

(assert (=> b!1424095 m!1314215))

(declare-fun m!1314217 () Bool)

(assert (=> b!1424109 m!1314217))

(check-sat (not b!1424094) (not b!1424103) (not b!1424102) (not b!1424101) (not b!1424109) (not b!1424107) (not start!122810) (not b!1424098) (not b!1424097) (not b!1424106) (not b!1424105) (not b!1424100) (not b!1424095) (not b!1424108))
(check-sat)
