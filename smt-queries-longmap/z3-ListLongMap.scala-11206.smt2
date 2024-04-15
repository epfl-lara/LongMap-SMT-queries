; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130818 () Bool)

(assert start!130818)

(declare-fun b!1534540 () Bool)

(declare-fun res!1051817 () Bool)

(declare-fun e!854423 () Bool)

(assert (=> b!1534540 (=> (not res!1051817) (not e!854423))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((array!101914 0))(
  ( (array!101915 (arr!49174 (Array (_ BitVec 32) (_ BitVec 64))) (size!49726 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101914)

(assert (=> b!1534540 (= res!1051817 (not (= (select (arr!49174 a!2792) index!463) (select (arr!49174 a!2792) j!64))))))

(declare-fun b!1534541 () Bool)

(declare-fun e!854425 () Bool)

(assert (=> b!1534541 (= e!854423 e!854425)))

(declare-fun res!1051811 () Bool)

(assert (=> b!1534541 (=> (not res!1051811) (not e!854425))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663656 () (_ BitVec 32))

(assert (=> b!1534541 (= res!1051811 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663656 #b00000000000000000000000000000000) (bvslt lt!663656 (size!49726 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534541 (= lt!663656 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534542 () Bool)

(declare-fun res!1051819 () Bool)

(assert (=> b!1534542 (=> (not res!1051819) (not e!854423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101914 (_ BitVec 32)) Bool)

(assert (=> b!1534542 (= res!1051819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534543 () Bool)

(assert (=> b!1534543 (= e!854425 false)))

(declare-datatypes ((SeekEntryResult!13331 0))(
  ( (MissingZero!13331 (index!55719 (_ BitVec 32))) (Found!13331 (index!55720 (_ BitVec 32))) (Intermediate!13331 (undefined!14143 Bool) (index!55721 (_ BitVec 32)) (x!137472 (_ BitVec 32))) (Undefined!13331) (MissingVacant!13331 (index!55722 (_ BitVec 32))) )
))
(declare-fun lt!663657 () SeekEntryResult!13331)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101914 (_ BitVec 32)) SeekEntryResult!13331)

(assert (=> b!1534543 (= lt!663657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663656 vacantIndex!5 (select (arr!49174 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534544 () Bool)

(declare-fun res!1051816 () Bool)

(assert (=> b!1534544 (=> (not res!1051816) (not e!854423))))

(declare-datatypes ((List!35726 0))(
  ( (Nil!35723) (Cons!35722 (h!37168 (_ BitVec 64)) (t!50412 List!35726)) )
))
(declare-fun arrayNoDuplicates!0 (array!101914 (_ BitVec 32) List!35726) Bool)

(assert (=> b!1534544 (= res!1051816 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35723))))

(declare-fun b!1534545 () Bool)

(declare-fun res!1051810 () Bool)

(assert (=> b!1534545 (=> (not res!1051810) (not e!854423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534545 (= res!1051810 (validKeyInArray!0 (select (arr!49174 a!2792) j!64)))))

(declare-fun b!1534546 () Bool)

(declare-fun res!1051812 () Bool)

(assert (=> b!1534546 (=> (not res!1051812) (not e!854423))))

(assert (=> b!1534546 (= res!1051812 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49174 a!2792) j!64) a!2792 mask!2480) (Found!13331 j!64)))))

(declare-fun b!1534547 () Bool)

(declare-fun res!1051818 () Bool)

(assert (=> b!1534547 (=> (not res!1051818) (not e!854423))))

(assert (=> b!1534547 (= res!1051818 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49726 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49726 a!2792)) (= (select (arr!49174 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051813 () Bool)

(assert (=> start!130818 (=> (not res!1051813) (not e!854423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130818 (= res!1051813 (validMask!0 mask!2480))))

(assert (=> start!130818 e!854423))

(assert (=> start!130818 true))

(declare-fun array_inv!38407 (array!101914) Bool)

(assert (=> start!130818 (array_inv!38407 a!2792)))

(declare-fun b!1534548 () Bool)

(declare-fun res!1051814 () Bool)

(assert (=> b!1534548 (=> (not res!1051814) (not e!854423))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534548 (= res!1051814 (validKeyInArray!0 (select (arr!49174 a!2792) i!951)))))

(declare-fun b!1534549 () Bool)

(declare-fun res!1051815 () Bool)

(assert (=> b!1534549 (=> (not res!1051815) (not e!854423))))

(assert (=> b!1534549 (= res!1051815 (and (= (size!49726 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49726 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49726 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130818 res!1051813) b!1534549))

(assert (= (and b!1534549 res!1051815) b!1534548))

(assert (= (and b!1534548 res!1051814) b!1534545))

(assert (= (and b!1534545 res!1051810) b!1534542))

(assert (= (and b!1534542 res!1051819) b!1534544))

(assert (= (and b!1534544 res!1051816) b!1534547))

(assert (= (and b!1534547 res!1051818) b!1534546))

(assert (= (and b!1534546 res!1051812) b!1534540))

(assert (= (and b!1534540 res!1051817) b!1534541))

(assert (= (and b!1534541 res!1051811) b!1534543))

(declare-fun m!1416557 () Bool)

(assert (=> b!1534546 m!1416557))

(assert (=> b!1534546 m!1416557))

(declare-fun m!1416559 () Bool)

(assert (=> b!1534546 m!1416559))

(declare-fun m!1416561 () Bool)

(assert (=> b!1534542 m!1416561))

(declare-fun m!1416563 () Bool)

(assert (=> b!1534548 m!1416563))

(assert (=> b!1534548 m!1416563))

(declare-fun m!1416565 () Bool)

(assert (=> b!1534548 m!1416565))

(declare-fun m!1416567 () Bool)

(assert (=> b!1534547 m!1416567))

(assert (=> b!1534543 m!1416557))

(assert (=> b!1534543 m!1416557))

(declare-fun m!1416569 () Bool)

(assert (=> b!1534543 m!1416569))

(declare-fun m!1416571 () Bool)

(assert (=> b!1534541 m!1416571))

(assert (=> b!1534545 m!1416557))

(assert (=> b!1534545 m!1416557))

(declare-fun m!1416573 () Bool)

(assert (=> b!1534545 m!1416573))

(declare-fun m!1416575 () Bool)

(assert (=> b!1534544 m!1416575))

(declare-fun m!1416577 () Bool)

(assert (=> b!1534540 m!1416577))

(assert (=> b!1534540 m!1416557))

(declare-fun m!1416579 () Bool)

(assert (=> start!130818 m!1416579))

(declare-fun m!1416581 () Bool)

(assert (=> start!130818 m!1416581))

(check-sat (not b!1534542) (not b!1534545) (not b!1534544) (not b!1534543) (not b!1534546) (not b!1534548) (not b!1534541) (not start!130818))
(check-sat)
