; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123016 () Bool)

(assert start!123016)

(declare-fun b!1426806 () Bool)

(declare-fun res!962044 () Bool)

(declare-fun e!805917 () Bool)

(assert (=> b!1426806 (=> (not res!962044) (not e!805917))))

(declare-datatypes ((array!97330 0))(
  ( (array!97331 (arr!46981 (Array (_ BitVec 32) (_ BitVec 64))) (size!47531 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97330)

(declare-datatypes ((List!33491 0))(
  ( (Nil!33488) (Cons!33487 (h!34792 (_ BitVec 64)) (t!48185 List!33491)) )
))
(declare-fun arrayNoDuplicates!0 (array!97330 (_ BitVec 32) List!33491) Bool)

(assert (=> b!1426806 (= res!962044 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33488))))

(declare-fun b!1426807 () Bool)

(declare-fun res!962045 () Bool)

(assert (=> b!1426807 (=> (not res!962045) (not e!805917))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426807 (= res!962045 (validKeyInArray!0 (select (arr!46981 a!2831) i!982)))))

(declare-fun b!1426808 () Bool)

(declare-fun res!962039 () Bool)

(assert (=> b!1426808 (=> (not res!962039) (not e!805917))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426808 (= res!962039 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47531 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47531 a!2831))))))

(declare-fun b!1426809 () Bool)

(declare-fun res!962049 () Bool)

(assert (=> b!1426809 (=> (not res!962049) (not e!805917))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1426809 (= res!962049 (validKeyInArray!0 (select (arr!46981 a!2831) j!81)))))

(declare-fun b!1426810 () Bool)

(declare-fun res!962040 () Bool)

(declare-fun e!805916 () Bool)

(assert (=> b!1426810 (=> (not res!962040) (not e!805916))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426810 (= res!962040 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426811 () Bool)

(declare-fun res!962038 () Bool)

(assert (=> b!1426811 (=> (not res!962038) (not e!805916))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11260 0))(
  ( (MissingZero!11260 (index!47432 (_ BitVec 32))) (Found!11260 (index!47433 (_ BitVec 32))) (Intermediate!11260 (undefined!12072 Bool) (index!47434 (_ BitVec 32)) (x!129060 (_ BitVec 32))) (Undefined!11260) (MissingVacant!11260 (index!47435 (_ BitVec 32))) )
))
(declare-fun lt!628316 () SeekEntryResult!11260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97330 (_ BitVec 32)) SeekEntryResult!11260)

(assert (=> b!1426811 (= res!962038 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46981 a!2831) j!81) a!2831 mask!2608) lt!628316))))

(declare-fun b!1426812 () Bool)

(declare-fun res!962046 () Bool)

(assert (=> b!1426812 (=> (not res!962046) (not e!805917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97330 (_ BitVec 32)) Bool)

(assert (=> b!1426812 (= res!962046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!962050 () Bool)

(assert (=> start!123016 (=> (not res!962050) (not e!805917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123016 (= res!962050 (validMask!0 mask!2608))))

(assert (=> start!123016 e!805917))

(assert (=> start!123016 true))

(declare-fun array_inv!36009 (array!97330) Bool)

(assert (=> start!123016 (array_inv!36009 a!2831)))

(declare-fun b!1426813 () Bool)

(declare-fun res!962041 () Bool)

(assert (=> b!1426813 (=> (not res!962041) (not e!805916))))

(declare-fun lt!628315 () SeekEntryResult!11260)

(declare-fun lt!628313 () (_ BitVec 64))

(declare-fun lt!628314 () array!97330)

(assert (=> b!1426813 (= res!962041 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628313 lt!628314 mask!2608) lt!628315))))

(declare-fun b!1426814 () Bool)

(declare-fun e!805918 () Bool)

(assert (=> b!1426814 (= e!805918 e!805916)))

(declare-fun res!962048 () Bool)

(assert (=> b!1426814 (=> (not res!962048) (not e!805916))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426814 (= res!962048 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628313 mask!2608) lt!628313 lt!628314 mask!2608) lt!628315))))

(assert (=> b!1426814 (= lt!628315 (Intermediate!11260 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426814 (= lt!628313 (select (store (arr!46981 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426814 (= lt!628314 (array!97331 (store (arr!46981 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47531 a!2831)))))

(declare-fun b!1426815 () Bool)

(assert (=> b!1426815 (= e!805917 e!805918)))

(declare-fun res!962043 () Bool)

(assert (=> b!1426815 (=> (not res!962043) (not e!805918))))

(assert (=> b!1426815 (= res!962043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46981 a!2831) j!81) mask!2608) (select (arr!46981 a!2831) j!81) a!2831 mask!2608) lt!628316))))

(assert (=> b!1426815 (= lt!628316 (Intermediate!11260 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun e!805919 () Bool)

(declare-fun b!1426816 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97330 (_ BitVec 32)) SeekEntryResult!11260)

(assert (=> b!1426816 (= e!805919 (= (seekEntryOrOpen!0 (select (arr!46981 a!2831) j!81) a!2831 mask!2608) (Found!11260 j!81)))))

(declare-fun b!1426817 () Bool)

(declare-fun res!962047 () Bool)

(assert (=> b!1426817 (=> (not res!962047) (not e!805917))))

(assert (=> b!1426817 (= res!962047 (and (= (size!47531 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47531 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47531 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426818 () Bool)

(assert (=> b!1426818 (= e!805916 (not true))))

(assert (=> b!1426818 e!805919))

(declare-fun res!962042 () Bool)

(assert (=> b!1426818 (=> (not res!962042) (not e!805919))))

(assert (=> b!1426818 (= res!962042 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48266 0))(
  ( (Unit!48267) )
))
(declare-fun lt!628317 () Unit!48266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48266)

(assert (=> b!1426818 (= lt!628317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123016 res!962050) b!1426817))

(assert (= (and b!1426817 res!962047) b!1426807))

(assert (= (and b!1426807 res!962045) b!1426809))

(assert (= (and b!1426809 res!962049) b!1426812))

(assert (= (and b!1426812 res!962046) b!1426806))

(assert (= (and b!1426806 res!962044) b!1426808))

(assert (= (and b!1426808 res!962039) b!1426815))

(assert (= (and b!1426815 res!962043) b!1426814))

(assert (= (and b!1426814 res!962048) b!1426811))

(assert (= (and b!1426811 res!962038) b!1426813))

(assert (= (and b!1426813 res!962041) b!1426810))

(assert (= (and b!1426810 res!962040) b!1426818))

(assert (= (and b!1426818 res!962042) b!1426816))

(declare-fun m!1317301 () Bool)

(assert (=> b!1426809 m!1317301))

(assert (=> b!1426809 m!1317301))

(declare-fun m!1317303 () Bool)

(assert (=> b!1426809 m!1317303))

(declare-fun m!1317305 () Bool)

(assert (=> b!1426806 m!1317305))

(declare-fun m!1317307 () Bool)

(assert (=> b!1426812 m!1317307))

(declare-fun m!1317309 () Bool)

(assert (=> start!123016 m!1317309))

(declare-fun m!1317311 () Bool)

(assert (=> start!123016 m!1317311))

(declare-fun m!1317313 () Bool)

(assert (=> b!1426814 m!1317313))

(assert (=> b!1426814 m!1317313))

(declare-fun m!1317315 () Bool)

(assert (=> b!1426814 m!1317315))

(declare-fun m!1317317 () Bool)

(assert (=> b!1426814 m!1317317))

(declare-fun m!1317319 () Bool)

(assert (=> b!1426814 m!1317319))

(assert (=> b!1426816 m!1317301))

(assert (=> b!1426816 m!1317301))

(declare-fun m!1317321 () Bool)

(assert (=> b!1426816 m!1317321))

(declare-fun m!1317323 () Bool)

(assert (=> b!1426813 m!1317323))

(declare-fun m!1317325 () Bool)

(assert (=> b!1426807 m!1317325))

(assert (=> b!1426807 m!1317325))

(declare-fun m!1317327 () Bool)

(assert (=> b!1426807 m!1317327))

(assert (=> b!1426815 m!1317301))

(assert (=> b!1426815 m!1317301))

(declare-fun m!1317329 () Bool)

(assert (=> b!1426815 m!1317329))

(assert (=> b!1426815 m!1317329))

(assert (=> b!1426815 m!1317301))

(declare-fun m!1317331 () Bool)

(assert (=> b!1426815 m!1317331))

(declare-fun m!1317333 () Bool)

(assert (=> b!1426818 m!1317333))

(declare-fun m!1317335 () Bool)

(assert (=> b!1426818 m!1317335))

(assert (=> b!1426811 m!1317301))

(assert (=> b!1426811 m!1317301))

(declare-fun m!1317337 () Bool)

(assert (=> b!1426811 m!1317337))

(push 1)

