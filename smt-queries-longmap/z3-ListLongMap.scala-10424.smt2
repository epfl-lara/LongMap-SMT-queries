; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122708 () Bool)

(assert start!122708)

(declare-fun e!803830 () Bool)

(declare-fun b!1421697 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97073 0))(
  ( (array!97074 (arr!46854 (Array (_ BitVec 32) (_ BitVec 64))) (size!47404 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97073)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421697 (= e!803830 (not (or (= (select (arr!46854 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46854 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46854 a!2831) index!585) (select (arr!46854 a!2831) j!81)) (= (select (store (arr!46854 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2608 #b00000000000000000000000000000000))))))

(declare-fun e!803831 () Bool)

(assert (=> b!1421697 e!803831))

(declare-fun res!957141 () Bool)

(assert (=> b!1421697 (=> (not res!957141) (not e!803831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97073 (_ BitVec 32)) Bool)

(assert (=> b!1421697 (= res!957141 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48114 0))(
  ( (Unit!48115) )
))
(declare-fun lt!626366 () Unit!48114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48114)

(assert (=> b!1421697 (= lt!626366 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421698 () Bool)

(declare-fun res!957136 () Bool)

(declare-fun e!803832 () Bool)

(assert (=> b!1421698 (=> (not res!957136) (not e!803832))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1421698 (= res!957136 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47404 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47404 a!2831))))))

(declare-fun b!1421699 () Bool)

(declare-fun res!957138 () Bool)

(assert (=> b!1421699 (=> (not res!957138) (not e!803832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421699 (= res!957138 (validKeyInArray!0 (select (arr!46854 a!2831) i!982)))))

(declare-fun b!1421700 () Bool)

(declare-fun res!957137 () Bool)

(assert (=> b!1421700 (=> (not res!957137) (not e!803830))))

(declare-fun lt!626367 () (_ BitVec 64))

(declare-fun lt!626370 () array!97073)

(declare-datatypes ((SeekEntryResult!11139 0))(
  ( (MissingZero!11139 (index!46948 (_ BitVec 32))) (Found!11139 (index!46949 (_ BitVec 32))) (Intermediate!11139 (undefined!11951 Bool) (index!46950 (_ BitVec 32)) (x!128597 (_ BitVec 32))) (Undefined!11139) (MissingVacant!11139 (index!46951 (_ BitVec 32))) )
))
(declare-fun lt!626369 () SeekEntryResult!11139)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97073 (_ BitVec 32)) SeekEntryResult!11139)

(assert (=> b!1421700 (= res!957137 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626367 lt!626370 mask!2608) lt!626369))))

(declare-fun b!1421701 () Bool)

(declare-fun res!957140 () Bool)

(assert (=> b!1421701 (=> (not res!957140) (not e!803830))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421701 (= res!957140 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421703 () Bool)

(declare-fun e!803833 () Bool)

(assert (=> b!1421703 (= e!803832 e!803833)))

(declare-fun res!957133 () Bool)

(assert (=> b!1421703 (=> (not res!957133) (not e!803833))))

(declare-fun lt!626368 () SeekEntryResult!11139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421703 (= res!957133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46854 a!2831) j!81) mask!2608) (select (arr!46854 a!2831) j!81) a!2831 mask!2608) lt!626368))))

(assert (=> b!1421703 (= lt!626368 (Intermediate!11139 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421704 () Bool)

(declare-fun res!957134 () Bool)

(assert (=> b!1421704 (=> (not res!957134) (not e!803830))))

(assert (=> b!1421704 (= res!957134 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46854 a!2831) j!81) a!2831 mask!2608) lt!626368))))

(declare-fun b!1421705 () Bool)

(declare-fun res!957131 () Bool)

(assert (=> b!1421705 (=> (not res!957131) (not e!803832))))

(assert (=> b!1421705 (= res!957131 (and (= (size!47404 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47404 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47404 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421706 () Bool)

(declare-fun res!957135 () Bool)

(assert (=> b!1421706 (=> (not res!957135) (not e!803832))))

(assert (=> b!1421706 (= res!957135 (validKeyInArray!0 (select (arr!46854 a!2831) j!81)))))

(declare-fun b!1421707 () Bool)

(declare-fun res!957142 () Bool)

(assert (=> b!1421707 (=> (not res!957142) (not e!803832))))

(declare-datatypes ((List!33364 0))(
  ( (Nil!33361) (Cons!33360 (h!34662 (_ BitVec 64)) (t!48058 List!33364)) )
))
(declare-fun arrayNoDuplicates!0 (array!97073 (_ BitVec 32) List!33364) Bool)

(assert (=> b!1421707 (= res!957142 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33361))))

(declare-fun b!1421708 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97073 (_ BitVec 32)) SeekEntryResult!11139)

(assert (=> b!1421708 (= e!803831 (= (seekEntryOrOpen!0 (select (arr!46854 a!2831) j!81) a!2831 mask!2608) (Found!11139 j!81)))))

(declare-fun b!1421709 () Bool)

(assert (=> b!1421709 (= e!803833 e!803830)))

(declare-fun res!957139 () Bool)

(assert (=> b!1421709 (=> (not res!957139) (not e!803830))))

(assert (=> b!1421709 (= res!957139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626367 mask!2608) lt!626367 lt!626370 mask!2608) lt!626369))))

(assert (=> b!1421709 (= lt!626369 (Intermediate!11139 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421709 (= lt!626367 (select (store (arr!46854 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421709 (= lt!626370 (array!97074 (store (arr!46854 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47404 a!2831)))))

(declare-fun res!957130 () Bool)

(assert (=> start!122708 (=> (not res!957130) (not e!803832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122708 (= res!957130 (validMask!0 mask!2608))))

(assert (=> start!122708 e!803832))

(assert (=> start!122708 true))

(declare-fun array_inv!35882 (array!97073) Bool)

(assert (=> start!122708 (array_inv!35882 a!2831)))

(declare-fun b!1421702 () Bool)

(declare-fun res!957132 () Bool)

(assert (=> b!1421702 (=> (not res!957132) (not e!803832))))

(assert (=> b!1421702 (= res!957132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122708 res!957130) b!1421705))

(assert (= (and b!1421705 res!957131) b!1421699))

(assert (= (and b!1421699 res!957138) b!1421706))

(assert (= (and b!1421706 res!957135) b!1421702))

(assert (= (and b!1421702 res!957132) b!1421707))

(assert (= (and b!1421707 res!957142) b!1421698))

(assert (= (and b!1421698 res!957136) b!1421703))

(assert (= (and b!1421703 res!957133) b!1421709))

(assert (= (and b!1421709 res!957139) b!1421704))

(assert (= (and b!1421704 res!957134) b!1421700))

(assert (= (and b!1421700 res!957137) b!1421701))

(assert (= (and b!1421701 res!957140) b!1421697))

(assert (= (and b!1421697 res!957141) b!1421708))

(declare-fun m!1312239 () Bool)

(assert (=> b!1421702 m!1312239))

(declare-fun m!1312241 () Bool)

(assert (=> b!1421707 m!1312241))

(declare-fun m!1312243 () Bool)

(assert (=> start!122708 m!1312243))

(declare-fun m!1312245 () Bool)

(assert (=> start!122708 m!1312245))

(declare-fun m!1312247 () Bool)

(assert (=> b!1421697 m!1312247))

(declare-fun m!1312249 () Bool)

(assert (=> b!1421697 m!1312249))

(declare-fun m!1312251 () Bool)

(assert (=> b!1421697 m!1312251))

(declare-fun m!1312253 () Bool)

(assert (=> b!1421697 m!1312253))

(declare-fun m!1312255 () Bool)

(assert (=> b!1421697 m!1312255))

(declare-fun m!1312257 () Bool)

(assert (=> b!1421697 m!1312257))

(assert (=> b!1421703 m!1312255))

(assert (=> b!1421703 m!1312255))

(declare-fun m!1312259 () Bool)

(assert (=> b!1421703 m!1312259))

(assert (=> b!1421703 m!1312259))

(assert (=> b!1421703 m!1312255))

(declare-fun m!1312261 () Bool)

(assert (=> b!1421703 m!1312261))

(declare-fun m!1312263 () Bool)

(assert (=> b!1421699 m!1312263))

(assert (=> b!1421699 m!1312263))

(declare-fun m!1312265 () Bool)

(assert (=> b!1421699 m!1312265))

(assert (=> b!1421704 m!1312255))

(assert (=> b!1421704 m!1312255))

(declare-fun m!1312267 () Bool)

(assert (=> b!1421704 m!1312267))

(declare-fun m!1312269 () Bool)

(assert (=> b!1421709 m!1312269))

(assert (=> b!1421709 m!1312269))

(declare-fun m!1312271 () Bool)

(assert (=> b!1421709 m!1312271))

(assert (=> b!1421709 m!1312247))

(declare-fun m!1312273 () Bool)

(assert (=> b!1421709 m!1312273))

(declare-fun m!1312275 () Bool)

(assert (=> b!1421700 m!1312275))

(assert (=> b!1421706 m!1312255))

(assert (=> b!1421706 m!1312255))

(declare-fun m!1312277 () Bool)

(assert (=> b!1421706 m!1312277))

(assert (=> b!1421708 m!1312255))

(assert (=> b!1421708 m!1312255))

(declare-fun m!1312279 () Bool)

(assert (=> b!1421708 m!1312279))

(check-sat (not b!1421706) (not b!1421708) (not b!1421709) (not b!1421697) (not b!1421700) (not b!1421699) (not b!1421704) (not b!1421707) (not start!122708) (not b!1421702) (not b!1421703))
(check-sat)
