; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130830 () Bool)

(assert start!130830)

(declare-fun b!1534720 () Bool)

(declare-fun res!1051995 () Bool)

(declare-fun e!854477 () Bool)

(assert (=> b!1534720 (=> (not res!1051995) (not e!854477))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101926 0))(
  ( (array!101927 (arr!49180 (Array (_ BitVec 32) (_ BitVec 64))) (size!49732 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101926)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534720 (= res!1051995 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49732 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49732 a!2792)) (= (select (arr!49180 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534721 () Bool)

(declare-fun res!1051993 () Bool)

(assert (=> b!1534721 (=> (not res!1051993) (not e!854477))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534721 (= res!1051993 (not (= (select (arr!49180 a!2792) index!463) (select (arr!49180 a!2792) j!64))))))

(declare-fun b!1534722 () Bool)

(declare-fun e!854478 () Bool)

(assert (=> b!1534722 (= e!854477 e!854478)))

(declare-fun res!1051997 () Bool)

(assert (=> b!1534722 (=> (not res!1051997) (not e!854478))))

(declare-fun lt!663693 () (_ BitVec 32))

(assert (=> b!1534722 (= res!1051997 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663693 #b00000000000000000000000000000000) (bvslt lt!663693 (size!49732 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534722 (= lt!663693 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534723 () Bool)

(declare-fun res!1051992 () Bool)

(assert (=> b!1534723 (=> (not res!1051992) (not e!854477))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534723 (= res!1051992 (and (= (size!49732 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49732 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49732 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534724 () Bool)

(declare-fun res!1051990 () Bool)

(assert (=> b!1534724 (=> (not res!1051990) (not e!854477))))

(declare-datatypes ((SeekEntryResult!13337 0))(
  ( (MissingZero!13337 (index!55743 (_ BitVec 32))) (Found!13337 (index!55744 (_ BitVec 32))) (Intermediate!13337 (undefined!14149 Bool) (index!55745 (_ BitVec 32)) (x!137494 (_ BitVec 32))) (Undefined!13337) (MissingVacant!13337 (index!55746 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101926 (_ BitVec 32)) SeekEntryResult!13337)

(assert (=> b!1534724 (= res!1051990 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49180 a!2792) j!64) a!2792 mask!2480) (Found!13337 j!64)))))

(declare-fun res!1051994 () Bool)

(assert (=> start!130830 (=> (not res!1051994) (not e!854477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130830 (= res!1051994 (validMask!0 mask!2480))))

(assert (=> start!130830 e!854477))

(assert (=> start!130830 true))

(declare-fun array_inv!38413 (array!101926) Bool)

(assert (=> start!130830 (array_inv!38413 a!2792)))

(declare-fun b!1534725 () Bool)

(declare-fun res!1051998 () Bool)

(assert (=> b!1534725 (=> (not res!1051998) (not e!854477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101926 (_ BitVec 32)) Bool)

(assert (=> b!1534725 (= res!1051998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534726 () Bool)

(declare-fun res!1051996 () Bool)

(assert (=> b!1534726 (=> (not res!1051996) (not e!854477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534726 (= res!1051996 (validKeyInArray!0 (select (arr!49180 a!2792) i!951)))))

(declare-fun b!1534727 () Bool)

(assert (=> b!1534727 (= e!854478 false)))

(declare-fun lt!663692 () SeekEntryResult!13337)

(assert (=> b!1534727 (= lt!663692 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663693 vacantIndex!5 (select (arr!49180 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534728 () Bool)

(declare-fun res!1051991 () Bool)

(assert (=> b!1534728 (=> (not res!1051991) (not e!854477))))

(declare-datatypes ((List!35732 0))(
  ( (Nil!35729) (Cons!35728 (h!37174 (_ BitVec 64)) (t!50418 List!35732)) )
))
(declare-fun arrayNoDuplicates!0 (array!101926 (_ BitVec 32) List!35732) Bool)

(assert (=> b!1534728 (= res!1051991 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35729))))

(declare-fun b!1534729 () Bool)

(declare-fun res!1051999 () Bool)

(assert (=> b!1534729 (=> (not res!1051999) (not e!854477))))

(assert (=> b!1534729 (= res!1051999 (validKeyInArray!0 (select (arr!49180 a!2792) j!64)))))

(assert (= (and start!130830 res!1051994) b!1534723))

(assert (= (and b!1534723 res!1051992) b!1534726))

(assert (= (and b!1534726 res!1051996) b!1534729))

(assert (= (and b!1534729 res!1051999) b!1534725))

(assert (= (and b!1534725 res!1051998) b!1534728))

(assert (= (and b!1534728 res!1051991) b!1534720))

(assert (= (and b!1534720 res!1051995) b!1534724))

(assert (= (and b!1534724 res!1051990) b!1534721))

(assert (= (and b!1534721 res!1051993) b!1534722))

(assert (= (and b!1534722 res!1051997) b!1534727))

(declare-fun m!1416713 () Bool)

(assert (=> b!1534725 m!1416713))

(declare-fun m!1416715 () Bool)

(assert (=> b!1534721 m!1416715))

(declare-fun m!1416717 () Bool)

(assert (=> b!1534721 m!1416717))

(declare-fun m!1416719 () Bool)

(assert (=> b!1534726 m!1416719))

(assert (=> b!1534726 m!1416719))

(declare-fun m!1416721 () Bool)

(assert (=> b!1534726 m!1416721))

(declare-fun m!1416723 () Bool)

(assert (=> start!130830 m!1416723))

(declare-fun m!1416725 () Bool)

(assert (=> start!130830 m!1416725))

(assert (=> b!1534724 m!1416717))

(assert (=> b!1534724 m!1416717))

(declare-fun m!1416727 () Bool)

(assert (=> b!1534724 m!1416727))

(assert (=> b!1534729 m!1416717))

(assert (=> b!1534729 m!1416717))

(declare-fun m!1416729 () Bool)

(assert (=> b!1534729 m!1416729))

(declare-fun m!1416731 () Bool)

(assert (=> b!1534722 m!1416731))

(declare-fun m!1416733 () Bool)

(assert (=> b!1534728 m!1416733))

(assert (=> b!1534727 m!1416717))

(assert (=> b!1534727 m!1416717))

(declare-fun m!1416735 () Bool)

(assert (=> b!1534727 m!1416735))

(declare-fun m!1416737 () Bool)

(assert (=> b!1534720 m!1416737))

(check-sat (not b!1534724) (not b!1534729) (not b!1534726) (not b!1534728) (not b!1534722) (not b!1534725) (not start!130830) (not b!1534727))
(check-sat)
