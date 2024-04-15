; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122508 () Bool)

(assert start!122508)

(declare-fun b!1419185 () Bool)

(declare-fun e!802981 () Bool)

(assert (=> b!1419185 (= e!802981 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96865 0))(
  ( (array!96866 (arr!46752 (Array (_ BitVec 32) (_ BitVec 64))) (size!47304 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96865)

(declare-fun lt!625559 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419185 (= lt!625559 (toIndex!0 (select (store (arr!46752 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419186 () Bool)

(declare-fun res!954761 () Bool)

(assert (=> b!1419186 (=> (not res!954761) (not e!802981))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419186 (= res!954761 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47304 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47304 a!2831))))))

(declare-fun b!1419187 () Bool)

(declare-fun res!954759 () Bool)

(assert (=> b!1419187 (=> (not res!954759) (not e!802981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419187 (= res!954759 (validKeyInArray!0 (select (arr!46752 a!2831) i!982)))))

(declare-fun b!1419188 () Bool)

(declare-fun res!954756 () Bool)

(assert (=> b!1419188 (=> (not res!954756) (not e!802981))))

(declare-datatypes ((SeekEntryResult!11064 0))(
  ( (MissingZero!11064 (index!46648 (_ BitVec 32))) (Found!11064 (index!46649 (_ BitVec 32))) (Intermediate!11064 (undefined!11876 Bool) (index!46650 (_ BitVec 32)) (x!128305 (_ BitVec 32))) (Undefined!11064) (MissingVacant!11064 (index!46651 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96865 (_ BitVec 32)) SeekEntryResult!11064)

(assert (=> b!1419188 (= res!954756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46752 a!2831) j!81) mask!2608) (select (arr!46752 a!2831) j!81) a!2831 mask!2608) (Intermediate!11064 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419189 () Bool)

(declare-fun res!954757 () Bool)

(assert (=> b!1419189 (=> (not res!954757) (not e!802981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96865 (_ BitVec 32)) Bool)

(assert (=> b!1419189 (= res!954757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419190 () Bool)

(declare-fun res!954758 () Bool)

(assert (=> b!1419190 (=> (not res!954758) (not e!802981))))

(declare-datatypes ((List!33340 0))(
  ( (Nil!33337) (Cons!33336 (h!34635 (_ BitVec 64)) (t!48026 List!33340)) )
))
(declare-fun arrayNoDuplicates!0 (array!96865 (_ BitVec 32) List!33340) Bool)

(assert (=> b!1419190 (= res!954758 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33337))))

(declare-fun b!1419191 () Bool)

(declare-fun res!954763 () Bool)

(assert (=> b!1419191 (=> (not res!954763) (not e!802981))))

(assert (=> b!1419191 (= res!954763 (validKeyInArray!0 (select (arr!46752 a!2831) j!81)))))

(declare-fun res!954762 () Bool)

(assert (=> start!122508 (=> (not res!954762) (not e!802981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122508 (= res!954762 (validMask!0 mask!2608))))

(assert (=> start!122508 e!802981))

(assert (=> start!122508 true))

(declare-fun array_inv!35985 (array!96865) Bool)

(assert (=> start!122508 (array_inv!35985 a!2831)))

(declare-fun b!1419192 () Bool)

(declare-fun res!954760 () Bool)

(assert (=> b!1419192 (=> (not res!954760) (not e!802981))))

(assert (=> b!1419192 (= res!954760 (and (= (size!47304 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47304 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47304 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122508 res!954762) b!1419192))

(assert (= (and b!1419192 res!954760) b!1419187))

(assert (= (and b!1419187 res!954759) b!1419191))

(assert (= (and b!1419191 res!954763) b!1419189))

(assert (= (and b!1419189 res!954757) b!1419190))

(assert (= (and b!1419190 res!954758) b!1419186))

(assert (= (and b!1419186 res!954761) b!1419188))

(assert (= (and b!1419188 res!954756) b!1419185))

(declare-fun m!1309231 () Bool)

(assert (=> b!1419188 m!1309231))

(assert (=> b!1419188 m!1309231))

(declare-fun m!1309233 () Bool)

(assert (=> b!1419188 m!1309233))

(assert (=> b!1419188 m!1309233))

(assert (=> b!1419188 m!1309231))

(declare-fun m!1309235 () Bool)

(assert (=> b!1419188 m!1309235))

(declare-fun m!1309237 () Bool)

(assert (=> b!1419187 m!1309237))

(assert (=> b!1419187 m!1309237))

(declare-fun m!1309239 () Bool)

(assert (=> b!1419187 m!1309239))

(declare-fun m!1309241 () Bool)

(assert (=> start!122508 m!1309241))

(declare-fun m!1309243 () Bool)

(assert (=> start!122508 m!1309243))

(assert (=> b!1419191 m!1309231))

(assert (=> b!1419191 m!1309231))

(declare-fun m!1309245 () Bool)

(assert (=> b!1419191 m!1309245))

(declare-fun m!1309247 () Bool)

(assert (=> b!1419189 m!1309247))

(declare-fun m!1309249 () Bool)

(assert (=> b!1419185 m!1309249))

(declare-fun m!1309251 () Bool)

(assert (=> b!1419185 m!1309251))

(assert (=> b!1419185 m!1309251))

(declare-fun m!1309253 () Bool)

(assert (=> b!1419185 m!1309253))

(declare-fun m!1309255 () Bool)

(assert (=> b!1419190 m!1309255))

(push 1)

(assert (not b!1419185))

(assert (not b!1419190))

(assert (not b!1419189))

(assert (not b!1419191))

(assert (not b!1419187))

(assert (not b!1419188))

(assert (not start!122508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

