; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123524 () Bool)

(assert start!123524)

(declare-fun b!1431857 () Bool)

(declare-fun e!808352 () Bool)

(assert (=> b!1431857 (= e!808352 true)))

(declare-fun lt!630344 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431857 (= lt!630344 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431858 () Bool)

(declare-fun res!965733 () Bool)

(declare-fun e!808353 () Bool)

(assert (=> b!1431858 (=> (not res!965733) (not e!808353))))

(declare-datatypes ((array!97496 0))(
  ( (array!97497 (arr!47055 (Array (_ BitVec 32) (_ BitVec 64))) (size!47605 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97496)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431858 (= res!965733 (validKeyInArray!0 (select (arr!47055 a!2831) j!81)))))

(declare-fun res!965721 () Bool)

(assert (=> start!123524 (=> (not res!965721) (not e!808353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123524 (= res!965721 (validMask!0 mask!2608))))

(assert (=> start!123524 e!808353))

(assert (=> start!123524 true))

(declare-fun array_inv!36083 (array!97496) Bool)

(assert (=> start!123524 (array_inv!36083 a!2831)))

(declare-fun b!1431859 () Bool)

(declare-fun res!965723 () Bool)

(declare-fun e!808354 () Bool)

(assert (=> b!1431859 (=> (not res!965723) (not e!808354))))

(declare-datatypes ((SeekEntryResult!11334 0))(
  ( (MissingZero!11334 (index!47728 (_ BitVec 32))) (Found!11334 (index!47729 (_ BitVec 32))) (Intermediate!11334 (undefined!12146 Bool) (index!47730 (_ BitVec 32)) (x!129376 (_ BitVec 32))) (Undefined!11334) (MissingVacant!11334 (index!47731 (_ BitVec 32))) )
))
(declare-fun lt!630348 () SeekEntryResult!11334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97496 (_ BitVec 32)) SeekEntryResult!11334)

(assert (=> b!1431859 (= res!965723 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47055 a!2831) j!81) a!2831 mask!2608) lt!630348))))

(declare-fun b!1431860 () Bool)

(declare-fun res!965725 () Bool)

(assert (=> b!1431860 (=> (not res!965725) (not e!808353))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1431860 (= res!965725 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47605 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47605 a!2831))))))

(declare-fun b!1431861 () Bool)

(declare-fun res!965728 () Bool)

(assert (=> b!1431861 (=> (not res!965728) (not e!808353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97496 (_ BitVec 32)) Bool)

(assert (=> b!1431861 (= res!965728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431862 () Bool)

(declare-fun e!808351 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97496 (_ BitVec 32)) SeekEntryResult!11334)

(assert (=> b!1431862 (= e!808351 (= (seekEntryOrOpen!0 (select (arr!47055 a!2831) j!81) a!2831 mask!2608) (Found!11334 j!81)))))

(declare-fun b!1431863 () Bool)

(declare-fun e!808350 () Bool)

(assert (=> b!1431863 (= e!808353 e!808350)))

(declare-fun res!965726 () Bool)

(assert (=> b!1431863 (=> (not res!965726) (not e!808350))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431863 (= res!965726 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47055 a!2831) j!81) mask!2608) (select (arr!47055 a!2831) j!81) a!2831 mask!2608) lt!630348))))

(assert (=> b!1431863 (= lt!630348 (Intermediate!11334 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431864 () Bool)

(assert (=> b!1431864 (= e!808354 (not e!808352))))

(declare-fun res!965734 () Bool)

(assert (=> b!1431864 (=> res!965734 e!808352)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431864 (= res!965734 (or (= (select (arr!47055 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47055 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47055 a!2831) index!585) (select (arr!47055 a!2831) j!81)) (= (select (store (arr!47055 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1431864 e!808351))

(declare-fun res!965730 () Bool)

(assert (=> b!1431864 (=> (not res!965730) (not e!808351))))

(assert (=> b!1431864 (= res!965730 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48414 0))(
  ( (Unit!48415) )
))
(declare-fun lt!630345 () Unit!48414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48414)

(assert (=> b!1431864 (= lt!630345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431865 () Bool)

(assert (=> b!1431865 (= e!808350 e!808354)))

(declare-fun res!965731 () Bool)

(assert (=> b!1431865 (=> (not res!965731) (not e!808354))))

(declare-fun lt!630347 () (_ BitVec 64))

(declare-fun lt!630343 () SeekEntryResult!11334)

(declare-fun lt!630346 () array!97496)

(assert (=> b!1431865 (= res!965731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630347 mask!2608) lt!630347 lt!630346 mask!2608) lt!630343))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431865 (= lt!630343 (Intermediate!11334 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431865 (= lt!630347 (select (store (arr!47055 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431865 (= lt!630346 (array!97497 (store (arr!47055 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47605 a!2831)))))

(declare-fun b!1431866 () Bool)

(declare-fun res!965729 () Bool)

(assert (=> b!1431866 (=> (not res!965729) (not e!808353))))

(assert (=> b!1431866 (= res!965729 (and (= (size!47605 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47605 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47605 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431867 () Bool)

(declare-fun res!965732 () Bool)

(assert (=> b!1431867 (=> (not res!965732) (not e!808354))))

(assert (=> b!1431867 (= res!965732 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630347 lt!630346 mask!2608) lt!630343))))

(declare-fun b!1431868 () Bool)

(declare-fun res!965727 () Bool)

(assert (=> b!1431868 (=> (not res!965727) (not e!808353))))

(assert (=> b!1431868 (= res!965727 (validKeyInArray!0 (select (arr!47055 a!2831) i!982)))))

(declare-fun b!1431869 () Bool)

(declare-fun res!965722 () Bool)

(assert (=> b!1431869 (=> (not res!965722) (not e!808354))))

(assert (=> b!1431869 (= res!965722 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431870 () Bool)

(declare-fun res!965724 () Bool)

(assert (=> b!1431870 (=> (not res!965724) (not e!808353))))

(declare-datatypes ((List!33565 0))(
  ( (Nil!33562) (Cons!33561 (h!34884 (_ BitVec 64)) (t!48259 List!33565)) )
))
(declare-fun arrayNoDuplicates!0 (array!97496 (_ BitVec 32) List!33565) Bool)

(assert (=> b!1431870 (= res!965724 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33562))))

(assert (= (and start!123524 res!965721) b!1431866))

(assert (= (and b!1431866 res!965729) b!1431868))

(assert (= (and b!1431868 res!965727) b!1431858))

(assert (= (and b!1431858 res!965733) b!1431861))

(assert (= (and b!1431861 res!965728) b!1431870))

(assert (= (and b!1431870 res!965724) b!1431860))

(assert (= (and b!1431860 res!965725) b!1431863))

(assert (= (and b!1431863 res!965726) b!1431865))

(assert (= (and b!1431865 res!965731) b!1431859))

(assert (= (and b!1431859 res!965723) b!1431867))

(assert (= (and b!1431867 res!965732) b!1431869))

(assert (= (and b!1431869 res!965722) b!1431864))

(assert (= (and b!1431864 res!965730) b!1431862))

(assert (= (and b!1431864 (not res!965734)) b!1431857))

(declare-fun m!1321637 () Bool)

(assert (=> b!1431863 m!1321637))

(assert (=> b!1431863 m!1321637))

(declare-fun m!1321639 () Bool)

(assert (=> b!1431863 m!1321639))

(assert (=> b!1431863 m!1321639))

(assert (=> b!1431863 m!1321637))

(declare-fun m!1321641 () Bool)

(assert (=> b!1431863 m!1321641))

(declare-fun m!1321643 () Bool)

(assert (=> b!1431865 m!1321643))

(assert (=> b!1431865 m!1321643))

(declare-fun m!1321645 () Bool)

(assert (=> b!1431865 m!1321645))

(declare-fun m!1321647 () Bool)

(assert (=> b!1431865 m!1321647))

(declare-fun m!1321649 () Bool)

(assert (=> b!1431865 m!1321649))

(declare-fun m!1321651 () Bool)

(assert (=> start!123524 m!1321651))

(declare-fun m!1321653 () Bool)

(assert (=> start!123524 m!1321653))

(assert (=> b!1431858 m!1321637))

(assert (=> b!1431858 m!1321637))

(declare-fun m!1321655 () Bool)

(assert (=> b!1431858 m!1321655))

(declare-fun m!1321657 () Bool)

(assert (=> b!1431867 m!1321657))

(assert (=> b!1431864 m!1321647))

(declare-fun m!1321659 () Bool)

(assert (=> b!1431864 m!1321659))

(declare-fun m!1321661 () Bool)

(assert (=> b!1431864 m!1321661))

(declare-fun m!1321663 () Bool)

(assert (=> b!1431864 m!1321663))

(assert (=> b!1431864 m!1321637))

(declare-fun m!1321665 () Bool)

(assert (=> b!1431864 m!1321665))

(declare-fun m!1321667 () Bool)

(assert (=> b!1431870 m!1321667))

(assert (=> b!1431859 m!1321637))

(assert (=> b!1431859 m!1321637))

(declare-fun m!1321669 () Bool)

(assert (=> b!1431859 m!1321669))

(declare-fun m!1321671 () Bool)

(assert (=> b!1431868 m!1321671))

(assert (=> b!1431868 m!1321671))

(declare-fun m!1321673 () Bool)

(assert (=> b!1431868 m!1321673))

(assert (=> b!1431862 m!1321637))

(assert (=> b!1431862 m!1321637))

(declare-fun m!1321675 () Bool)

(assert (=> b!1431862 m!1321675))

(declare-fun m!1321677 () Bool)

(assert (=> b!1431861 m!1321677))

(declare-fun m!1321679 () Bool)

(assert (=> b!1431857 m!1321679))

(check-sat (not b!1431858) (not b!1431857) (not b!1431861) (not b!1431862) (not b!1431870) (not b!1431863) (not start!123524) (not b!1431867) (not b!1431868) (not b!1431859) (not b!1431864) (not b!1431865))
(check-sat)
