; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130824 () Bool)

(assert start!130824)

(declare-fun b!1534630 () Bool)

(declare-fun res!1051906 () Bool)

(declare-fun e!854451 () Bool)

(assert (=> b!1534630 (=> (not res!1051906) (not e!854451))))

(declare-datatypes ((array!101920 0))(
  ( (array!101921 (arr!49177 (Array (_ BitVec 32) (_ BitVec 64))) (size!49729 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101920)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534630 (= res!1051906 (validKeyInArray!0 (select (arr!49177 a!2792) j!64)))))

(declare-fun b!1534631 () Bool)

(declare-fun e!854452 () Bool)

(assert (=> b!1534631 (= e!854452 false)))

(declare-datatypes ((SeekEntryResult!13334 0))(
  ( (MissingZero!13334 (index!55731 (_ BitVec 32))) (Found!13334 (index!55732 (_ BitVec 32))) (Intermediate!13334 (undefined!14146 Bool) (index!55733 (_ BitVec 32)) (x!137483 (_ BitVec 32))) (Undefined!13334) (MissingVacant!13334 (index!55734 (_ BitVec 32))) )
))
(declare-fun lt!663674 () SeekEntryResult!13334)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!663675 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101920 (_ BitVec 32)) SeekEntryResult!13334)

(assert (=> b!1534631 (= lt!663674 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663675 vacantIndex!5 (select (arr!49177 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534632 () Bool)

(declare-fun res!1051901 () Bool)

(assert (=> b!1534632 (=> (not res!1051901) (not e!854451))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534632 (= res!1051901 (not (= (select (arr!49177 a!2792) index!463) (select (arr!49177 a!2792) j!64))))))

(declare-fun res!1051905 () Bool)

(assert (=> start!130824 (=> (not res!1051905) (not e!854451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130824 (= res!1051905 (validMask!0 mask!2480))))

(assert (=> start!130824 e!854451))

(assert (=> start!130824 true))

(declare-fun array_inv!38410 (array!101920) Bool)

(assert (=> start!130824 (array_inv!38410 a!2792)))

(declare-fun b!1534633 () Bool)

(declare-fun res!1051907 () Bool)

(assert (=> b!1534633 (=> (not res!1051907) (not e!854451))))

(assert (=> b!1534633 (= res!1051907 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49729 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49729 a!2792)) (= (select (arr!49177 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534634 () Bool)

(declare-fun res!1051909 () Bool)

(assert (=> b!1534634 (=> (not res!1051909) (not e!854451))))

(assert (=> b!1534634 (= res!1051909 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49177 a!2792) j!64) a!2792 mask!2480) (Found!13334 j!64)))))

(declare-fun b!1534635 () Bool)

(assert (=> b!1534635 (= e!854451 e!854452)))

(declare-fun res!1051900 () Bool)

(assert (=> b!1534635 (=> (not res!1051900) (not e!854452))))

(assert (=> b!1534635 (= res!1051900 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663675 #b00000000000000000000000000000000) (bvslt lt!663675 (size!49729 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534635 (= lt!663675 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534636 () Bool)

(declare-fun res!1051902 () Bool)

(assert (=> b!1534636 (=> (not res!1051902) (not e!854451))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534636 (= res!1051902 (validKeyInArray!0 (select (arr!49177 a!2792) i!951)))))

(declare-fun b!1534637 () Bool)

(declare-fun res!1051904 () Bool)

(assert (=> b!1534637 (=> (not res!1051904) (not e!854451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101920 (_ BitVec 32)) Bool)

(assert (=> b!1534637 (= res!1051904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534638 () Bool)

(declare-fun res!1051903 () Bool)

(assert (=> b!1534638 (=> (not res!1051903) (not e!854451))))

(declare-datatypes ((List!35729 0))(
  ( (Nil!35726) (Cons!35725 (h!37171 (_ BitVec 64)) (t!50415 List!35729)) )
))
(declare-fun arrayNoDuplicates!0 (array!101920 (_ BitVec 32) List!35729) Bool)

(assert (=> b!1534638 (= res!1051903 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35726))))

(declare-fun b!1534639 () Bool)

(declare-fun res!1051908 () Bool)

(assert (=> b!1534639 (=> (not res!1051908) (not e!854451))))

(assert (=> b!1534639 (= res!1051908 (and (= (size!49729 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49729 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49729 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130824 res!1051905) b!1534639))

(assert (= (and b!1534639 res!1051908) b!1534636))

(assert (= (and b!1534636 res!1051902) b!1534630))

(assert (= (and b!1534630 res!1051906) b!1534637))

(assert (= (and b!1534637 res!1051904) b!1534638))

(assert (= (and b!1534638 res!1051903) b!1534633))

(assert (= (and b!1534633 res!1051907) b!1534634))

(assert (= (and b!1534634 res!1051909) b!1534632))

(assert (= (and b!1534632 res!1051901) b!1534635))

(assert (= (and b!1534635 res!1051900) b!1534631))

(declare-fun m!1416635 () Bool)

(assert (=> b!1534634 m!1416635))

(assert (=> b!1534634 m!1416635))

(declare-fun m!1416637 () Bool)

(assert (=> b!1534634 m!1416637))

(declare-fun m!1416639 () Bool)

(assert (=> b!1534635 m!1416639))

(assert (=> b!1534631 m!1416635))

(assert (=> b!1534631 m!1416635))

(declare-fun m!1416641 () Bool)

(assert (=> b!1534631 m!1416641))

(declare-fun m!1416643 () Bool)

(assert (=> start!130824 m!1416643))

(declare-fun m!1416645 () Bool)

(assert (=> start!130824 m!1416645))

(declare-fun m!1416647 () Bool)

(assert (=> b!1534638 m!1416647))

(assert (=> b!1534630 m!1416635))

(assert (=> b!1534630 m!1416635))

(declare-fun m!1416649 () Bool)

(assert (=> b!1534630 m!1416649))

(declare-fun m!1416651 () Bool)

(assert (=> b!1534633 m!1416651))

(declare-fun m!1416653 () Bool)

(assert (=> b!1534636 m!1416653))

(assert (=> b!1534636 m!1416653))

(declare-fun m!1416655 () Bool)

(assert (=> b!1534636 m!1416655))

(declare-fun m!1416657 () Bool)

(assert (=> b!1534637 m!1416657))

(declare-fun m!1416659 () Bool)

(assert (=> b!1534632 m!1416659))

(assert (=> b!1534632 m!1416635))

(check-sat (not b!1534635) (not b!1534636) (not b!1534631) (not b!1534637) (not b!1534638) (not b!1534630) (not start!130824) (not b!1534634))
(check-sat)
