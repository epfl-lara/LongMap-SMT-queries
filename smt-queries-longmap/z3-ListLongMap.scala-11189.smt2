; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130716 () Bool)

(assert start!130716)

(declare-fun b!1533296 () Bool)

(declare-fun res!1050573 () Bool)

(declare-fun e!854080 () Bool)

(assert (=> b!1533296 (=> (not res!1050573) (not e!854080))))

(declare-datatypes ((array!101812 0))(
  ( (array!101813 (arr!49123 (Array (_ BitVec 32) (_ BitVec 64))) (size!49675 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101812)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533296 (= res!1050573 (and (= (select (arr!49123 a!2792) index!463) (select (arr!49123 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49123 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050574 () Bool)

(assert (=> start!130716 (=> (not res!1050574) (not e!854080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130716 (= res!1050574 (validMask!0 mask!2480))))

(assert (=> start!130716 e!854080))

(assert (=> start!130716 true))

(declare-fun array_inv!38356 (array!101812) Bool)

(assert (=> start!130716 (array_inv!38356 a!2792)))

(declare-fun b!1533297 () Bool)

(declare-fun res!1050571 () Bool)

(assert (=> b!1533297 (=> (not res!1050571) (not e!854080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101812 (_ BitVec 32)) Bool)

(assert (=> b!1533297 (= res!1050571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533298 () Bool)

(declare-fun res!1050572 () Bool)

(assert (=> b!1533298 (=> (not res!1050572) (not e!854080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533298 (= res!1050572 (validKeyInArray!0 (select (arr!49123 a!2792) j!64)))))

(declare-fun b!1533299 () Bool)

(declare-fun res!1050568 () Bool)

(assert (=> b!1533299 (=> (not res!1050568) (not e!854080))))

(declare-datatypes ((List!35675 0))(
  ( (Nil!35672) (Cons!35671 (h!37117 (_ BitVec 64)) (t!50361 List!35675)) )
))
(declare-fun arrayNoDuplicates!0 (array!101812 (_ BitVec 32) List!35675) Bool)

(assert (=> b!1533299 (= res!1050568 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35672))))

(declare-fun b!1533300 () Bool)

(declare-fun res!1050566 () Bool)

(assert (=> b!1533300 (=> (not res!1050566) (not e!854080))))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1533300 (= res!1050566 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49675 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49675 a!2792)) (= (select (arr!49123 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533301 () Bool)

(declare-fun res!1050567 () Bool)

(assert (=> b!1533301 (=> (not res!1050567) (not e!854080))))

(assert (=> b!1533301 (= res!1050567 (and (= (size!49675 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49675 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49675 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533302 () Bool)

(declare-fun res!1050570 () Bool)

(assert (=> b!1533302 (=> (not res!1050570) (not e!854080))))

(declare-datatypes ((SeekEntryResult!13280 0))(
  ( (MissingZero!13280 (index!55515 (_ BitVec 32))) (Found!13280 (index!55516 (_ BitVec 32))) (Intermediate!13280 (undefined!14092 Bool) (index!55517 (_ BitVec 32)) (x!137285 (_ BitVec 32))) (Undefined!13280) (MissingVacant!13280 (index!55518 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101812 (_ BitVec 32)) SeekEntryResult!13280)

(assert (=> b!1533302 (= res!1050570 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49123 a!2792) j!64) a!2792 mask!2480) (Found!13280 j!64)))))

(declare-fun b!1533303 () Bool)

(declare-fun res!1050569 () Bool)

(assert (=> b!1533303 (=> (not res!1050569) (not e!854080))))

(assert (=> b!1533303 (= res!1050569 (validKeyInArray!0 (select (arr!49123 a!2792) i!951)))))

(declare-fun b!1533304 () Bool)

(assert (=> b!1533304 (= e!854080 (not (validKeyInArray!0 (select (store (arr!49123 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))))

(assert (= (and start!130716 res!1050574) b!1533301))

(assert (= (and b!1533301 res!1050567) b!1533303))

(assert (= (and b!1533303 res!1050569) b!1533298))

(assert (= (and b!1533298 res!1050572) b!1533297))

(assert (= (and b!1533297 res!1050571) b!1533299))

(assert (= (and b!1533299 res!1050568) b!1533300))

(assert (= (and b!1533300 res!1050566) b!1533302))

(assert (= (and b!1533302 res!1050570) b!1533296))

(assert (= (and b!1533296 res!1050573) b!1533304))

(declare-fun m!1415405 () Bool)

(assert (=> b!1533304 m!1415405))

(declare-fun m!1415407 () Bool)

(assert (=> b!1533304 m!1415407))

(assert (=> b!1533304 m!1415407))

(declare-fun m!1415409 () Bool)

(assert (=> b!1533304 m!1415409))

(declare-fun m!1415411 () Bool)

(assert (=> b!1533296 m!1415411))

(declare-fun m!1415413 () Bool)

(assert (=> b!1533296 m!1415413))

(assert (=> b!1533296 m!1415405))

(declare-fun m!1415415 () Bool)

(assert (=> b!1533296 m!1415415))

(assert (=> b!1533302 m!1415413))

(assert (=> b!1533302 m!1415413))

(declare-fun m!1415417 () Bool)

(assert (=> b!1533302 m!1415417))

(declare-fun m!1415419 () Bool)

(assert (=> start!130716 m!1415419))

(declare-fun m!1415421 () Bool)

(assert (=> start!130716 m!1415421))

(declare-fun m!1415423 () Bool)

(assert (=> b!1533297 m!1415423))

(declare-fun m!1415425 () Bool)

(assert (=> b!1533303 m!1415425))

(assert (=> b!1533303 m!1415425))

(declare-fun m!1415427 () Bool)

(assert (=> b!1533303 m!1415427))

(assert (=> b!1533298 m!1415413))

(assert (=> b!1533298 m!1415413))

(declare-fun m!1415429 () Bool)

(assert (=> b!1533298 m!1415429))

(declare-fun m!1415431 () Bool)

(assert (=> b!1533299 m!1415431))

(declare-fun m!1415433 () Bool)

(assert (=> b!1533300 m!1415433))

(check-sat (not b!1533304) (not start!130716) (not b!1533297) (not b!1533298) (not b!1533302) (not b!1533303) (not b!1533299))
(check-sat)
