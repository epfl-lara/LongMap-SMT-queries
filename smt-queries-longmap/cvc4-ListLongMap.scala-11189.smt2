; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130770 () Bool)

(assert start!130770)

(declare-fun e!854290 () Bool)

(declare-datatypes ((array!101868 0))(
  ( (array!101869 (arr!49150 (Array (_ BitVec 32) (_ BitVec 64))) (size!49700 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101868)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun b!1533663 () Bool)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533663 (= e!854290 (not (validKeyInArray!0 (select (store (arr!49150 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))))

(declare-fun b!1533664 () Bool)

(declare-fun res!1050756 () Bool)

(assert (=> b!1533664 (=> (not res!1050756) (not e!854290))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533664 (= res!1050756 (and (= (select (arr!49150 a!2792) index!463) (select (arr!49150 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49150 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533665 () Bool)

(declare-fun res!1050757 () Bool)

(assert (=> b!1533665 (=> (not res!1050757) (not e!854290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101868 (_ BitVec 32)) Bool)

(assert (=> b!1533665 (= res!1050757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533666 () Bool)

(declare-fun res!1050753 () Bool)

(assert (=> b!1533666 (=> (not res!1050753) (not e!854290))))

(assert (=> b!1533666 (= res!1050753 (and (= (size!49700 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49700 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49700 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533667 () Bool)

(declare-fun res!1050755 () Bool)

(assert (=> b!1533667 (=> (not res!1050755) (not e!854290))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13282 0))(
  ( (MissingZero!13282 (index!55523 (_ BitVec 32))) (Found!13282 (index!55524 (_ BitVec 32))) (Intermediate!13282 (undefined!14094 Bool) (index!55525 (_ BitVec 32)) (x!137292 (_ BitVec 32))) (Undefined!13282) (MissingVacant!13282 (index!55526 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101868 (_ BitVec 32)) SeekEntryResult!13282)

(assert (=> b!1533667 (= res!1050755 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49150 a!2792) j!64) a!2792 mask!2480) (Found!13282 j!64)))))

(declare-fun b!1533668 () Bool)

(declare-fun res!1050749 () Bool)

(assert (=> b!1533668 (=> (not res!1050749) (not e!854290))))

(assert (=> b!1533668 (= res!1050749 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49700 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49700 a!2792)) (= (select (arr!49150 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533669 () Bool)

(declare-fun res!1050752 () Bool)

(assert (=> b!1533669 (=> (not res!1050752) (not e!854290))))

(declare-datatypes ((List!35624 0))(
  ( (Nil!35621) (Cons!35620 (h!37065 (_ BitVec 64)) (t!50318 List!35624)) )
))
(declare-fun arrayNoDuplicates!0 (array!101868 (_ BitVec 32) List!35624) Bool)

(assert (=> b!1533669 (= res!1050752 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35621))))

(declare-fun res!1050750 () Bool)

(assert (=> start!130770 (=> (not res!1050750) (not e!854290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130770 (= res!1050750 (validMask!0 mask!2480))))

(assert (=> start!130770 e!854290))

(assert (=> start!130770 true))

(declare-fun array_inv!38178 (array!101868) Bool)

(assert (=> start!130770 (array_inv!38178 a!2792)))

(declare-fun b!1533670 () Bool)

(declare-fun res!1050754 () Bool)

(assert (=> b!1533670 (=> (not res!1050754) (not e!854290))))

(assert (=> b!1533670 (= res!1050754 (validKeyInArray!0 (select (arr!49150 a!2792) i!951)))))

(declare-fun b!1533671 () Bool)

(declare-fun res!1050751 () Bool)

(assert (=> b!1533671 (=> (not res!1050751) (not e!854290))))

(assert (=> b!1533671 (= res!1050751 (validKeyInArray!0 (select (arr!49150 a!2792) j!64)))))

(assert (= (and start!130770 res!1050750) b!1533666))

(assert (= (and b!1533666 res!1050753) b!1533670))

(assert (= (and b!1533670 res!1050754) b!1533671))

(assert (= (and b!1533671 res!1050751) b!1533665))

(assert (= (and b!1533665 res!1050757) b!1533669))

(assert (= (and b!1533669 res!1050752) b!1533668))

(assert (= (and b!1533668 res!1050749) b!1533667))

(assert (= (and b!1533667 res!1050755) b!1533664))

(assert (= (and b!1533664 res!1050756) b!1533663))

(declare-fun m!1416357 () Bool)

(assert (=> start!130770 m!1416357))

(declare-fun m!1416359 () Bool)

(assert (=> start!130770 m!1416359))

(declare-fun m!1416361 () Bool)

(assert (=> b!1533665 m!1416361))

(declare-fun m!1416363 () Bool)

(assert (=> b!1533671 m!1416363))

(assert (=> b!1533671 m!1416363))

(declare-fun m!1416365 () Bool)

(assert (=> b!1533671 m!1416365))

(declare-fun m!1416367 () Bool)

(assert (=> b!1533669 m!1416367))

(declare-fun m!1416369 () Bool)

(assert (=> b!1533663 m!1416369))

(declare-fun m!1416371 () Bool)

(assert (=> b!1533663 m!1416371))

(assert (=> b!1533663 m!1416371))

(declare-fun m!1416373 () Bool)

(assert (=> b!1533663 m!1416373))

(declare-fun m!1416375 () Bool)

(assert (=> b!1533664 m!1416375))

(assert (=> b!1533664 m!1416363))

(assert (=> b!1533664 m!1416369))

(declare-fun m!1416377 () Bool)

(assert (=> b!1533664 m!1416377))

(assert (=> b!1533667 m!1416363))

(assert (=> b!1533667 m!1416363))

(declare-fun m!1416379 () Bool)

(assert (=> b!1533667 m!1416379))

(declare-fun m!1416381 () Bool)

(assert (=> b!1533668 m!1416381))

(declare-fun m!1416383 () Bool)

(assert (=> b!1533670 m!1416383))

(assert (=> b!1533670 m!1416383))

(declare-fun m!1416385 () Bool)

(assert (=> b!1533670 m!1416385))

(push 1)

(assert (not b!1533667))

(assert (not start!130770))

(assert (not b!1533671))

(assert (not b!1533665))

(assert (not b!1533670))

(assert (not b!1533663))

(assert (not b!1533669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

