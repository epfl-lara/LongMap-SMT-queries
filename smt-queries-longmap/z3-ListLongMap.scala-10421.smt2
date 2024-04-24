; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122876 () Bool)

(assert start!122876)

(declare-fun b!1422463 () Bool)

(declare-fun res!957214 () Bool)

(declare-fun e!804436 () Bool)

(assert (=> b!1422463 (=> (not res!957214) (not e!804436))))

(declare-datatypes ((array!97163 0))(
  ( (array!97164 (arr!46897 (Array (_ BitVec 32) (_ BitVec 64))) (size!47448 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97163)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422463 (= res!957214 (validKeyInArray!0 (select (arr!46897 a!2831) i!982)))))

(declare-fun b!1422464 () Bool)

(declare-fun e!804435 () Bool)

(assert (=> b!1422464 (= e!804435 (not true))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97163 (_ BitVec 32)) Bool)

(assert (=> b!1422464 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48035 0))(
  ( (Unit!48036) )
))
(declare-fun lt!626616 () Unit!48035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48035)

(assert (=> b!1422464 (= lt!626616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422465 () Bool)

(declare-fun res!957222 () Bool)

(assert (=> b!1422465 (=> (not res!957222) (not e!804435))))

(declare-datatypes ((SeekEntryResult!11084 0))(
  ( (MissingZero!11084 (index!46728 (_ BitVec 32))) (Found!11084 (index!46729 (_ BitVec 32))) (Intermediate!11084 (undefined!11896 Bool) (index!46730 (_ BitVec 32)) (x!128537 (_ BitVec 32))) (Undefined!11084) (MissingVacant!11084 (index!46731 (_ BitVec 32))) )
))
(declare-fun lt!626614 () SeekEntryResult!11084)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97163 (_ BitVec 32)) SeekEntryResult!11084)

(assert (=> b!1422465 (= res!957222 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46897 a!2831) j!81) a!2831 mask!2608) lt!626614))))

(declare-fun b!1422466 () Bool)

(declare-fun res!957215 () Bool)

(assert (=> b!1422466 (=> (not res!957215) (not e!804436))))

(assert (=> b!1422466 (= res!957215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422467 () Bool)

(declare-fun res!957220 () Bool)

(assert (=> b!1422467 (=> (not res!957220) (not e!804435))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422467 (= res!957220 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422468 () Bool)

(declare-fun res!957218 () Bool)

(assert (=> b!1422468 (=> (not res!957218) (not e!804436))))

(assert (=> b!1422468 (= res!957218 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47448 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47448 a!2831))))))

(declare-fun b!1422469 () Bool)

(declare-fun e!804434 () Bool)

(assert (=> b!1422469 (= e!804434 e!804435)))

(declare-fun res!957221 () Bool)

(assert (=> b!1422469 (=> (not res!957221) (not e!804435))))

(declare-fun lt!626615 () array!97163)

(declare-fun lt!626618 () (_ BitVec 64))

(declare-fun lt!626617 () SeekEntryResult!11084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422469 (= res!957221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626618 mask!2608) lt!626618 lt!626615 mask!2608) lt!626617))))

(assert (=> b!1422469 (= lt!626617 (Intermediate!11084 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422469 (= lt!626618 (select (store (arr!46897 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422469 (= lt!626615 (array!97164 (store (arr!46897 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47448 a!2831)))))

(declare-fun b!1422470 () Bool)

(assert (=> b!1422470 (= e!804436 e!804434)))

(declare-fun res!957217 () Bool)

(assert (=> b!1422470 (=> (not res!957217) (not e!804434))))

(assert (=> b!1422470 (= res!957217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46897 a!2831) j!81) mask!2608) (select (arr!46897 a!2831) j!81) a!2831 mask!2608) lt!626614))))

(assert (=> b!1422470 (= lt!626614 (Intermediate!11084 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!957223 () Bool)

(assert (=> start!122876 (=> (not res!957223) (not e!804436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122876 (= res!957223 (validMask!0 mask!2608))))

(assert (=> start!122876 e!804436))

(assert (=> start!122876 true))

(declare-fun array_inv!36178 (array!97163) Bool)

(assert (=> start!122876 (array_inv!36178 a!2831)))

(declare-fun b!1422471 () Bool)

(declare-fun res!957213 () Bool)

(assert (=> b!1422471 (=> (not res!957213) (not e!804436))))

(declare-datatypes ((List!33394 0))(
  ( (Nil!33391) (Cons!33390 (h!34700 (_ BitVec 64)) (t!48080 List!33394)) )
))
(declare-fun arrayNoDuplicates!0 (array!97163 (_ BitVec 32) List!33394) Bool)

(assert (=> b!1422471 (= res!957213 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33391))))

(declare-fun b!1422472 () Bool)

(declare-fun res!957216 () Bool)

(assert (=> b!1422472 (=> (not res!957216) (not e!804436))))

(assert (=> b!1422472 (= res!957216 (and (= (size!47448 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47448 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47448 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422473 () Bool)

(declare-fun res!957219 () Bool)

(assert (=> b!1422473 (=> (not res!957219) (not e!804436))))

(assert (=> b!1422473 (= res!957219 (validKeyInArray!0 (select (arr!46897 a!2831) j!81)))))

(declare-fun b!1422474 () Bool)

(declare-fun res!957212 () Bool)

(assert (=> b!1422474 (=> (not res!957212) (not e!804435))))

(assert (=> b!1422474 (= res!957212 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626618 lt!626615 mask!2608) lt!626617))))

(assert (= (and start!122876 res!957223) b!1422472))

(assert (= (and b!1422472 res!957216) b!1422463))

(assert (= (and b!1422463 res!957214) b!1422473))

(assert (= (and b!1422473 res!957219) b!1422466))

(assert (= (and b!1422466 res!957215) b!1422471))

(assert (= (and b!1422471 res!957213) b!1422468))

(assert (= (and b!1422468 res!957218) b!1422470))

(assert (= (and b!1422470 res!957217) b!1422469))

(assert (= (and b!1422469 res!957221) b!1422465))

(assert (= (and b!1422465 res!957222) b!1422474))

(assert (= (and b!1422474 res!957212) b!1422467))

(assert (= (and b!1422467 res!957220) b!1422464))

(declare-fun m!1313235 () Bool)

(assert (=> b!1422473 m!1313235))

(assert (=> b!1422473 m!1313235))

(declare-fun m!1313237 () Bool)

(assert (=> b!1422473 m!1313237))

(declare-fun m!1313239 () Bool)

(assert (=> b!1422469 m!1313239))

(assert (=> b!1422469 m!1313239))

(declare-fun m!1313241 () Bool)

(assert (=> b!1422469 m!1313241))

(declare-fun m!1313243 () Bool)

(assert (=> b!1422469 m!1313243))

(declare-fun m!1313245 () Bool)

(assert (=> b!1422469 m!1313245))

(declare-fun m!1313247 () Bool)

(assert (=> b!1422466 m!1313247))

(declare-fun m!1313249 () Bool)

(assert (=> b!1422471 m!1313249))

(declare-fun m!1313251 () Bool)

(assert (=> start!122876 m!1313251))

(declare-fun m!1313253 () Bool)

(assert (=> start!122876 m!1313253))

(declare-fun m!1313255 () Bool)

(assert (=> b!1422474 m!1313255))

(assert (=> b!1422470 m!1313235))

(assert (=> b!1422470 m!1313235))

(declare-fun m!1313257 () Bool)

(assert (=> b!1422470 m!1313257))

(assert (=> b!1422470 m!1313257))

(assert (=> b!1422470 m!1313235))

(declare-fun m!1313259 () Bool)

(assert (=> b!1422470 m!1313259))

(declare-fun m!1313261 () Bool)

(assert (=> b!1422463 m!1313261))

(assert (=> b!1422463 m!1313261))

(declare-fun m!1313263 () Bool)

(assert (=> b!1422463 m!1313263))

(declare-fun m!1313265 () Bool)

(assert (=> b!1422464 m!1313265))

(declare-fun m!1313267 () Bool)

(assert (=> b!1422464 m!1313267))

(assert (=> b!1422465 m!1313235))

(assert (=> b!1422465 m!1313235))

(declare-fun m!1313269 () Bool)

(assert (=> b!1422465 m!1313269))

(check-sat (not b!1422465) (not b!1422469) (not b!1422471) (not start!122876) (not b!1422470) (not b!1422466) (not b!1422463) (not b!1422474) (not b!1422473) (not b!1422464))
(check-sat)
