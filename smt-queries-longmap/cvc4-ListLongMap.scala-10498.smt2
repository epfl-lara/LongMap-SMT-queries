; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123568 () Bool)

(assert start!123568)

(declare-fun b!1432781 () Bool)

(declare-fun res!966656 () Bool)

(declare-fun e!808746 () Bool)

(assert (=> b!1432781 (=> (not res!966656) (not e!808746))))

(declare-datatypes ((array!97540 0))(
  ( (array!97541 (arr!47077 (Array (_ BitVec 32) (_ BitVec 64))) (size!47627 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97540)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432781 (= res!966656 (validKeyInArray!0 (select (arr!47077 a!2831) i!982)))))

(declare-fun b!1432782 () Bool)

(declare-fun e!808750 () Bool)

(assert (=> b!1432782 (= e!808746 e!808750)))

(declare-fun res!966654 () Bool)

(assert (=> b!1432782 (=> (not res!966654) (not e!808750))))

(declare-datatypes ((SeekEntryResult!11356 0))(
  ( (MissingZero!11356 (index!47816 (_ BitVec 32))) (Found!11356 (index!47817 (_ BitVec 32))) (Intermediate!11356 (undefined!12168 Bool) (index!47818 (_ BitVec 32)) (x!129454 (_ BitVec 32))) (Undefined!11356) (MissingVacant!11356 (index!47819 (_ BitVec 32))) )
))
(declare-fun lt!630740 () SeekEntryResult!11356)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97540 (_ BitVec 32)) SeekEntryResult!11356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432782 (= res!966654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!630740))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432782 (= lt!630740 (Intermediate!11356 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432783 () Bool)

(declare-fun res!966648 () Bool)

(assert (=> b!1432783 (=> (not res!966648) (not e!808746))))

(assert (=> b!1432783 (= res!966648 (and (= (size!47627 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47627 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47627 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432784 () Bool)

(declare-fun e!808747 () Bool)

(assert (=> b!1432784 (= e!808750 e!808747)))

(declare-fun res!966647 () Bool)

(assert (=> b!1432784 (=> (not res!966647) (not e!808747))))

(declare-fun lt!630741 () SeekEntryResult!11356)

(declare-fun lt!630742 () array!97540)

(declare-fun lt!630743 () (_ BitVec 64))

(assert (=> b!1432784 (= res!966647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630743 mask!2608) lt!630743 lt!630742 mask!2608) lt!630741))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432784 (= lt!630741 (Intermediate!11356 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432784 (= lt!630743 (select (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432784 (= lt!630742 (array!97541 (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47627 a!2831)))))

(declare-fun b!1432785 () Bool)

(declare-fun res!966653 () Bool)

(assert (=> b!1432785 (=> (not res!966653) (not e!808746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97540 (_ BitVec 32)) Bool)

(assert (=> b!1432785 (= res!966653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432786 () Bool)

(declare-fun res!966649 () Bool)

(assert (=> b!1432786 (=> (not res!966649) (not e!808746))))

(assert (=> b!1432786 (= res!966649 (validKeyInArray!0 (select (arr!47077 a!2831) j!81)))))

(declare-fun res!966657 () Bool)

(assert (=> start!123568 (=> (not res!966657) (not e!808746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123568 (= res!966657 (validMask!0 mask!2608))))

(assert (=> start!123568 e!808746))

(assert (=> start!123568 true))

(declare-fun array_inv!36105 (array!97540) Bool)

(assert (=> start!123568 (array_inv!36105 a!2831)))

(declare-fun b!1432787 () Bool)

(declare-fun e!808748 () Bool)

(assert (=> b!1432787 (= e!808747 (not e!808748))))

(declare-fun res!966650 () Bool)

(assert (=> b!1432787 (=> res!966650 e!808748)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432787 (= res!966650 (or (= (select (arr!47077 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47077 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47077 a!2831) index!585) (select (arr!47077 a!2831) j!81)) (= (select (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808749 () Bool)

(assert (=> b!1432787 e!808749))

(declare-fun res!966658 () Bool)

(assert (=> b!1432787 (=> (not res!966658) (not e!808749))))

(assert (=> b!1432787 (= res!966658 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48458 0))(
  ( (Unit!48459) )
))
(declare-fun lt!630739 () Unit!48458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48458)

(assert (=> b!1432787 (= lt!630739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432788 () Bool)

(declare-fun res!966651 () Bool)

(assert (=> b!1432788 (=> (not res!966651) (not e!808747))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1432788 (= res!966651 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630743 lt!630742 mask!2608) lt!630741))))

(declare-fun b!1432789 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97540 (_ BitVec 32)) SeekEntryResult!11356)

(assert (=> b!1432789 (= e!808749 (= (seekEntryOrOpen!0 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) (Found!11356 j!81)))))

(declare-fun b!1432790 () Bool)

(declare-fun res!966645 () Bool)

(assert (=> b!1432790 (=> (not res!966645) (not e!808746))))

(declare-datatypes ((List!33587 0))(
  ( (Nil!33584) (Cons!33583 (h!34906 (_ BitVec 64)) (t!48281 List!33587)) )
))
(declare-fun arrayNoDuplicates!0 (array!97540 (_ BitVec 32) List!33587) Bool)

(assert (=> b!1432790 (= res!966645 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33584))))

(declare-fun b!1432791 () Bool)

(declare-fun res!966652 () Bool)

(assert (=> b!1432791 (=> (not res!966652) (not e!808747))))

(assert (=> b!1432791 (= res!966652 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432792 () Bool)

(declare-fun res!966646 () Bool)

(assert (=> b!1432792 (=> (not res!966646) (not e!808746))))

(assert (=> b!1432792 (= res!966646 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47627 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47627 a!2831))))))

(declare-fun b!1432793 () Bool)

(assert (=> b!1432793 (= e!808748 true)))

(declare-fun lt!630744 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432793 (= lt!630744 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432794 () Bool)

(declare-fun res!966655 () Bool)

(assert (=> b!1432794 (=> (not res!966655) (not e!808747))))

(assert (=> b!1432794 (= res!966655 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!630740))))

(assert (= (and start!123568 res!966657) b!1432783))

(assert (= (and b!1432783 res!966648) b!1432781))

(assert (= (and b!1432781 res!966656) b!1432786))

(assert (= (and b!1432786 res!966649) b!1432785))

(assert (= (and b!1432785 res!966653) b!1432790))

(assert (= (and b!1432790 res!966645) b!1432792))

(assert (= (and b!1432792 res!966646) b!1432782))

(assert (= (and b!1432782 res!966654) b!1432784))

(assert (= (and b!1432784 res!966647) b!1432794))

(assert (= (and b!1432794 res!966655) b!1432788))

(assert (= (and b!1432788 res!966651) b!1432791))

(assert (= (and b!1432791 res!966652) b!1432787))

(assert (= (and b!1432787 res!966658) b!1432789))

(assert (= (and b!1432787 (not res!966650)) b!1432793))

(declare-fun m!1322605 () Bool)

(assert (=> b!1432786 m!1322605))

(assert (=> b!1432786 m!1322605))

(declare-fun m!1322607 () Bool)

(assert (=> b!1432786 m!1322607))

(declare-fun m!1322609 () Bool)

(assert (=> start!123568 m!1322609))

(declare-fun m!1322611 () Bool)

(assert (=> start!123568 m!1322611))

(declare-fun m!1322613 () Bool)

(assert (=> b!1432784 m!1322613))

(assert (=> b!1432784 m!1322613))

(declare-fun m!1322615 () Bool)

(assert (=> b!1432784 m!1322615))

(declare-fun m!1322617 () Bool)

(assert (=> b!1432784 m!1322617))

(declare-fun m!1322619 () Bool)

(assert (=> b!1432784 m!1322619))

(declare-fun m!1322621 () Bool)

(assert (=> b!1432785 m!1322621))

(declare-fun m!1322623 () Bool)

(assert (=> b!1432793 m!1322623))

(declare-fun m!1322625 () Bool)

(assert (=> b!1432790 m!1322625))

(assert (=> b!1432789 m!1322605))

(assert (=> b!1432789 m!1322605))

(declare-fun m!1322627 () Bool)

(assert (=> b!1432789 m!1322627))

(assert (=> b!1432787 m!1322617))

(declare-fun m!1322629 () Bool)

(assert (=> b!1432787 m!1322629))

(declare-fun m!1322631 () Bool)

(assert (=> b!1432787 m!1322631))

(declare-fun m!1322633 () Bool)

(assert (=> b!1432787 m!1322633))

(assert (=> b!1432787 m!1322605))

(declare-fun m!1322635 () Bool)

(assert (=> b!1432787 m!1322635))

(declare-fun m!1322637 () Bool)

(assert (=> b!1432781 m!1322637))

(assert (=> b!1432781 m!1322637))

(declare-fun m!1322639 () Bool)

(assert (=> b!1432781 m!1322639))

(assert (=> b!1432794 m!1322605))

(assert (=> b!1432794 m!1322605))

(declare-fun m!1322641 () Bool)

(assert (=> b!1432794 m!1322641))

(declare-fun m!1322643 () Bool)

(assert (=> b!1432788 m!1322643))

(assert (=> b!1432782 m!1322605))

(assert (=> b!1432782 m!1322605))

(declare-fun m!1322645 () Bool)

(assert (=> b!1432782 m!1322645))

(assert (=> b!1432782 m!1322645))

(assert (=> b!1432782 m!1322605))

(declare-fun m!1322647 () Bool)

(assert (=> b!1432782 m!1322647))

(push 1)

