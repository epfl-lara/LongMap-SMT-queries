; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131766 () Bool)

(assert start!131766)

(declare-fun b!1542448 () Bool)

(declare-fun res!1057570 () Bool)

(declare-fun e!858059 () Bool)

(assert (=> b!1542448 (=> (not res!1057570) (not e!858059))))

(declare-fun lt!666114 () (_ BitVec 32))

(declare-datatypes ((array!102422 0))(
  ( (array!102423 (arr!49414 (Array (_ BitVec 32) (_ BitVec 64))) (size!49965 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102422)

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13435 0))(
  ( (MissingZero!13435 (index!56135 (_ BitVec 32))) (Found!13435 (index!56136 (_ BitVec 32))) (Intermediate!13435 (undefined!14247 Bool) (index!56137 (_ BitVec 32)) (x!138083 (_ BitVec 32))) (Undefined!13435) (MissingVacant!13435 (index!56138 (_ BitVec 32))) )
))
(declare-fun lt!666113 () SeekEntryResult!13435)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102422 (_ BitVec 32)) SeekEntryResult!13435)

(assert (=> b!1542448 (= res!1057570 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666114 vacantIndex!5 (select (arr!49414 a!2792) j!64) a!2792 mask!2480) lt!666113))))

(declare-fun b!1542449 () Bool)

(declare-fun res!1057563 () Bool)

(declare-fun e!858058 () Bool)

(assert (=> b!1542449 (=> (not res!1057563) (not e!858058))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1542449 (= res!1057563 (and (= (size!49965 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49965 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49965 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1057564 () Bool)

(assert (=> start!131766 (=> (not res!1057564) (not e!858058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131766 (= res!1057564 (validMask!0 mask!2480))))

(assert (=> start!131766 e!858058))

(assert (=> start!131766 true))

(declare-fun array_inv!38695 (array!102422) Bool)

(assert (=> start!131766 (array_inv!38695 a!2792)))

(declare-fun b!1542450 () Bool)

(assert (=> b!1542450 (= e!858059 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!510)) (bvsub #b01111111111111111111111111111110 x!510)))))

(declare-fun b!1542451 () Bool)

(declare-fun res!1057571 () Bool)

(assert (=> b!1542451 (=> (not res!1057571) (not e!858058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542451 (= res!1057571 (validKeyInArray!0 (select (arr!49414 a!2792) i!951)))))

(declare-fun b!1542452 () Bool)

(declare-fun res!1057566 () Bool)

(assert (=> b!1542452 (=> (not res!1057566) (not e!858058))))

(assert (=> b!1542452 (= res!1057566 (validKeyInArray!0 (select (arr!49414 a!2792) j!64)))))

(declare-fun b!1542453 () Bool)

(declare-fun res!1057567 () Bool)

(assert (=> b!1542453 (=> (not res!1057567) (not e!858058))))

(declare-datatypes ((List!35875 0))(
  ( (Nil!35872) (Cons!35871 (h!37334 (_ BitVec 64)) (t!50561 List!35875)) )
))
(declare-fun arrayNoDuplicates!0 (array!102422 (_ BitVec 32) List!35875) Bool)

(assert (=> b!1542453 (= res!1057567 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35872))))

(declare-fun b!1542454 () Bool)

(declare-fun res!1057562 () Bool)

(assert (=> b!1542454 (=> (not res!1057562) (not e!858058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102422 (_ BitVec 32)) Bool)

(assert (=> b!1542454 (= res!1057562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542455 () Bool)

(declare-fun e!858060 () Bool)

(assert (=> b!1542455 (= e!858060 e!858059)))

(declare-fun res!1057572 () Bool)

(assert (=> b!1542455 (=> (not res!1057572) (not e!858059))))

(assert (=> b!1542455 (= res!1057572 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666114 #b00000000000000000000000000000000) (bvslt lt!666114 (size!49965 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542455 (= lt!666114 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542456 () Bool)

(declare-fun res!1057565 () Bool)

(assert (=> b!1542456 (=> (not res!1057565) (not e!858060))))

(assert (=> b!1542456 (= res!1057565 (not (= (select (arr!49414 a!2792) index!463) (select (arr!49414 a!2792) j!64))))))

(declare-fun b!1542457 () Bool)

(assert (=> b!1542457 (= e!858058 e!858060)))

(declare-fun res!1057568 () Bool)

(assert (=> b!1542457 (=> (not res!1057568) (not e!858060))))

(assert (=> b!1542457 (= res!1057568 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49414 a!2792) j!64) a!2792 mask!2480) lt!666113))))

(assert (=> b!1542457 (= lt!666113 (Found!13435 j!64))))

(declare-fun b!1542458 () Bool)

(declare-fun res!1057569 () Bool)

(assert (=> b!1542458 (=> (not res!1057569) (not e!858058))))

(assert (=> b!1542458 (= res!1057569 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49965 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49965 a!2792)) (= (select (arr!49414 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131766 res!1057564) b!1542449))

(assert (= (and b!1542449 res!1057563) b!1542451))

(assert (= (and b!1542451 res!1057571) b!1542452))

(assert (= (and b!1542452 res!1057566) b!1542454))

(assert (= (and b!1542454 res!1057562) b!1542453))

(assert (= (and b!1542453 res!1057567) b!1542458))

(assert (= (and b!1542458 res!1057569) b!1542457))

(assert (= (and b!1542457 res!1057568) b!1542456))

(assert (= (and b!1542456 res!1057565) b!1542455))

(assert (= (and b!1542455 res!1057572) b!1542448))

(assert (= (and b!1542448 res!1057570) b!1542450))

(declare-fun m!1424387 () Bool)

(assert (=> b!1542458 m!1424387))

(declare-fun m!1424389 () Bool)

(assert (=> b!1542455 m!1424389))

(declare-fun m!1424391 () Bool)

(assert (=> b!1542454 m!1424391))

(declare-fun m!1424393 () Bool)

(assert (=> b!1542453 m!1424393))

(declare-fun m!1424395 () Bool)

(assert (=> b!1542448 m!1424395))

(assert (=> b!1542448 m!1424395))

(declare-fun m!1424397 () Bool)

(assert (=> b!1542448 m!1424397))

(declare-fun m!1424399 () Bool)

(assert (=> start!131766 m!1424399))

(declare-fun m!1424401 () Bool)

(assert (=> start!131766 m!1424401))

(assert (=> b!1542457 m!1424395))

(assert (=> b!1542457 m!1424395))

(declare-fun m!1424403 () Bool)

(assert (=> b!1542457 m!1424403))

(declare-fun m!1424405 () Bool)

(assert (=> b!1542456 m!1424405))

(assert (=> b!1542456 m!1424395))

(assert (=> b!1542452 m!1424395))

(assert (=> b!1542452 m!1424395))

(declare-fun m!1424407 () Bool)

(assert (=> b!1542452 m!1424407))

(declare-fun m!1424409 () Bool)

(assert (=> b!1542451 m!1424409))

(assert (=> b!1542451 m!1424409))

(declare-fun m!1424411 () Bool)

(assert (=> b!1542451 m!1424411))

(check-sat (not start!131766) (not b!1542455) (not b!1542457) (not b!1542453) (not b!1542448) (not b!1542454) (not b!1542451) (not b!1542452))
(check-sat)
