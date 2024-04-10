; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130760 () Bool)

(assert start!130760)

(declare-fun b!1533535 () Bool)

(declare-fun res!1050625 () Bool)

(declare-fun e!854259 () Bool)

(assert (=> b!1533535 (=> (not res!1050625) (not e!854259))))

(declare-datatypes ((array!101858 0))(
  ( (array!101859 (arr!49145 (Array (_ BitVec 32) (_ BitVec 64))) (size!49695 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101858)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101858 (_ BitVec 32)) Bool)

(assert (=> b!1533535 (= res!1050625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050622 () Bool)

(assert (=> start!130760 (=> (not res!1050622) (not e!854259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130760 (= res!1050622 (validMask!0 mask!2480))))

(assert (=> start!130760 e!854259))

(assert (=> start!130760 true))

(declare-fun array_inv!38173 (array!101858) Bool)

(assert (=> start!130760 (array_inv!38173 a!2792)))

(declare-fun b!1533536 () Bool)

(declare-fun res!1050624 () Bool)

(assert (=> b!1533536 (=> (not res!1050624) (not e!854259))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533536 (= res!1050624 (validKeyInArray!0 (select (arr!49145 a!2792) i!951)))))

(declare-fun b!1533537 () Bool)

(declare-fun res!1050628 () Bool)

(assert (=> b!1533537 (=> (not res!1050628) (not e!854259))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533537 (= res!1050628 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49695 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49695 a!2792)) (= (select (arr!49145 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533538 () Bool)

(declare-fun res!1050626 () Bool)

(assert (=> b!1533538 (=> (not res!1050626) (not e!854259))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13277 0))(
  ( (MissingZero!13277 (index!55503 (_ BitVec 32))) (Found!13277 (index!55504 (_ BitVec 32))) (Intermediate!13277 (undefined!14089 Bool) (index!55505 (_ BitVec 32)) (x!137279 (_ BitVec 32))) (Undefined!13277) (MissingVacant!13277 (index!55506 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101858 (_ BitVec 32)) SeekEntryResult!13277)

(assert (=> b!1533538 (= res!1050626 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49145 a!2792) j!64) a!2792 mask!2480) (Found!13277 j!64)))))

(declare-fun b!1533539 () Bool)

(assert (=> b!1533539 (= e!854259 (and (= (select (arr!49145 a!2792) index!463) (select (arr!49145 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49145 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1533540 () Bool)

(declare-fun res!1050623 () Bool)

(assert (=> b!1533540 (=> (not res!1050623) (not e!854259))))

(declare-datatypes ((List!35619 0))(
  ( (Nil!35616) (Cons!35615 (h!37060 (_ BitVec 64)) (t!50313 List!35619)) )
))
(declare-fun arrayNoDuplicates!0 (array!101858 (_ BitVec 32) List!35619) Bool)

(assert (=> b!1533540 (= res!1050623 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35616))))

(declare-fun b!1533541 () Bool)

(declare-fun res!1050627 () Bool)

(assert (=> b!1533541 (=> (not res!1050627) (not e!854259))))

(assert (=> b!1533541 (= res!1050627 (and (= (size!49695 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49695 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49695 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533542 () Bool)

(declare-fun res!1050621 () Bool)

(assert (=> b!1533542 (=> (not res!1050621) (not e!854259))))

(assert (=> b!1533542 (= res!1050621 (validKeyInArray!0 (select (arr!49145 a!2792) j!64)))))

(assert (= (and start!130760 res!1050622) b!1533541))

(assert (= (and b!1533541 res!1050627) b!1533536))

(assert (= (and b!1533536 res!1050624) b!1533542))

(assert (= (and b!1533542 res!1050621) b!1533535))

(assert (= (and b!1533535 res!1050625) b!1533540))

(assert (= (and b!1533540 res!1050623) b!1533537))

(assert (= (and b!1533537 res!1050628) b!1533538))

(assert (= (and b!1533538 res!1050626) b!1533539))

(declare-fun m!1416219 () Bool)

(assert (=> start!130760 m!1416219))

(declare-fun m!1416221 () Bool)

(assert (=> start!130760 m!1416221))

(declare-fun m!1416223 () Bool)

(assert (=> b!1533535 m!1416223))

(declare-fun m!1416225 () Bool)

(assert (=> b!1533536 m!1416225))

(assert (=> b!1533536 m!1416225))

(declare-fun m!1416227 () Bool)

(assert (=> b!1533536 m!1416227))

(declare-fun m!1416229 () Bool)

(assert (=> b!1533538 m!1416229))

(assert (=> b!1533538 m!1416229))

(declare-fun m!1416231 () Bool)

(assert (=> b!1533538 m!1416231))

(assert (=> b!1533542 m!1416229))

(assert (=> b!1533542 m!1416229))

(declare-fun m!1416233 () Bool)

(assert (=> b!1533542 m!1416233))

(declare-fun m!1416235 () Bool)

(assert (=> b!1533539 m!1416235))

(assert (=> b!1533539 m!1416229))

(declare-fun m!1416237 () Bool)

(assert (=> b!1533539 m!1416237))

(declare-fun m!1416239 () Bool)

(assert (=> b!1533539 m!1416239))

(declare-fun m!1416241 () Bool)

(assert (=> b!1533540 m!1416241))

(declare-fun m!1416243 () Bool)

(assert (=> b!1533537 m!1416243))

(push 1)

(assert (not b!1533538))

(assert (not b!1533535))

