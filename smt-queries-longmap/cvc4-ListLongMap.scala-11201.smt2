; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130842 () Bool)

(assert start!130842)

(declare-fun res!1051556 () Bool)

(declare-fun e!854506 () Bool)

(assert (=> start!130842 (=> (not res!1051556) (not e!854506))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130842 (= res!1051556 (validMask!0 mask!2480))))

(assert (=> start!130842 e!854506))

(assert (=> start!130842 true))

(declare-datatypes ((array!101940 0))(
  ( (array!101941 (arr!49186 (Array (_ BitVec 32) (_ BitVec 64))) (size!49736 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101940)

(declare-fun array_inv!38214 (array!101940) Bool)

(assert (=> start!130842 (array_inv!38214 a!2792)))

(declare-fun b!1534466 () Bool)

(declare-fun res!1051552 () Bool)

(assert (=> b!1534466 (=> (not res!1051552) (not e!854506))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534466 (= res!1051552 (and (= (size!49736 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49736 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49736 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534467 () Bool)

(declare-fun res!1051553 () Bool)

(assert (=> b!1534467 (=> (not res!1051553) (not e!854506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101940 (_ BitVec 32)) Bool)

(assert (=> b!1534467 (= res!1051553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534468 () Bool)

(declare-fun res!1051558 () Bool)

(assert (=> b!1534468 (=> (not res!1051558) (not e!854506))))

(declare-datatypes ((List!35660 0))(
  ( (Nil!35657) (Cons!35656 (h!37101 (_ BitVec 64)) (t!50354 List!35660)) )
))
(declare-fun arrayNoDuplicates!0 (array!101940 (_ BitVec 32) List!35660) Bool)

(assert (=> b!1534468 (= res!1051558 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35657))))

(declare-fun b!1534469 () Bool)

(declare-fun res!1051557 () Bool)

(assert (=> b!1534469 (=> (not res!1051557) (not e!854506))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534469 (= res!1051557 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49736 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49736 a!2792)) (= (select (arr!49186 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534470 () Bool)

(assert (=> b!1534470 (= e!854506 false)))

(declare-datatypes ((SeekEntryResult!13318 0))(
  ( (MissingZero!13318 (index!55667 (_ BitVec 32))) (Found!13318 (index!55668 (_ BitVec 32))) (Intermediate!13318 (undefined!14130 Bool) (index!55669 (_ BitVec 32)) (x!137424 (_ BitVec 32))) (Undefined!13318) (MissingVacant!13318 (index!55670 (_ BitVec 32))) )
))
(declare-fun lt!663865 () SeekEntryResult!13318)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101940 (_ BitVec 32)) SeekEntryResult!13318)

(assert (=> b!1534470 (= lt!663865 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49186 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534471 () Bool)

(declare-fun res!1051555 () Bool)

(assert (=> b!1534471 (=> (not res!1051555) (not e!854506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534471 (= res!1051555 (validKeyInArray!0 (select (arr!49186 a!2792) i!951)))))

(declare-fun b!1534472 () Bool)

(declare-fun res!1051554 () Bool)

(assert (=> b!1534472 (=> (not res!1051554) (not e!854506))))

(assert (=> b!1534472 (= res!1051554 (validKeyInArray!0 (select (arr!49186 a!2792) j!64)))))

(assert (= (and start!130842 res!1051556) b!1534466))

(assert (= (and b!1534466 res!1051552) b!1534471))

(assert (= (and b!1534471 res!1051555) b!1534472))

(assert (= (and b!1534472 res!1051554) b!1534467))

(assert (= (and b!1534467 res!1051553) b!1534468))

(assert (= (and b!1534468 res!1051558) b!1534469))

(assert (= (and b!1534469 res!1051557) b!1534470))

(declare-fun m!1417117 () Bool)

(assert (=> b!1534472 m!1417117))

(assert (=> b!1534472 m!1417117))

(declare-fun m!1417119 () Bool)

(assert (=> b!1534472 m!1417119))

(declare-fun m!1417121 () Bool)

(assert (=> b!1534468 m!1417121))

(declare-fun m!1417123 () Bool)

(assert (=> b!1534469 m!1417123))

(declare-fun m!1417125 () Bool)

(assert (=> start!130842 m!1417125))

(declare-fun m!1417127 () Bool)

(assert (=> start!130842 m!1417127))

(assert (=> b!1534470 m!1417117))

(assert (=> b!1534470 m!1417117))

(declare-fun m!1417129 () Bool)

(assert (=> b!1534470 m!1417129))

(declare-fun m!1417131 () Bool)

(assert (=> b!1534467 m!1417131))

(declare-fun m!1417133 () Bool)

(assert (=> b!1534471 m!1417133))

(assert (=> b!1534471 m!1417133))

(declare-fun m!1417135 () Bool)

(assert (=> b!1534471 m!1417135))

(push 1)

(assert (not start!130842))

(assert (not b!1534470))

(assert (not b!1534467))

(assert (not b!1534471))

(assert (not b!1534468))

(assert (not b!1534472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

