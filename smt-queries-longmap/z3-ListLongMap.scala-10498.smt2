; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123566 () Bool)

(assert start!123566)

(declare-fun b!1432739 () Bool)

(declare-fun e!808731 () Bool)

(declare-fun e!808729 () Bool)

(assert (=> b!1432739 (= e!808731 (not e!808729))))

(declare-fun res!966607 () Bool)

(assert (=> b!1432739 (=> res!966607 e!808729)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97538 0))(
  ( (array!97539 (arr!47076 (Array (_ BitVec 32) (_ BitVec 64))) (size!47626 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97538)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432739 (= res!966607 (or (= (select (arr!47076 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47076 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47076 a!2831) index!585) (select (arr!47076 a!2831) j!81)) (= (select (store (arr!47076 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808728 () Bool)

(assert (=> b!1432739 e!808728))

(declare-fun res!966608 () Bool)

(assert (=> b!1432739 (=> (not res!966608) (not e!808728))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97538 (_ BitVec 32)) Bool)

(assert (=> b!1432739 (= res!966608 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48456 0))(
  ( (Unit!48457) )
))
(declare-fun lt!630726 () Unit!48456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48456)

(assert (=> b!1432739 (= lt!630726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432741 () Bool)

(declare-fun e!808732 () Bool)

(declare-fun e!808733 () Bool)

(assert (=> b!1432741 (= e!808732 e!808733)))

(declare-fun res!966606 () Bool)

(assert (=> b!1432741 (=> (not res!966606) (not e!808733))))

(declare-datatypes ((SeekEntryResult!11355 0))(
  ( (MissingZero!11355 (index!47812 (_ BitVec 32))) (Found!11355 (index!47813 (_ BitVec 32))) (Intermediate!11355 (undefined!12167 Bool) (index!47814 (_ BitVec 32)) (x!129453 (_ BitVec 32))) (Undefined!11355) (MissingVacant!11355 (index!47815 (_ BitVec 32))) )
))
(declare-fun lt!630722 () SeekEntryResult!11355)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97538 (_ BitVec 32)) SeekEntryResult!11355)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432741 (= res!966606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47076 a!2831) j!81) mask!2608) (select (arr!47076 a!2831) j!81) a!2831 mask!2608) lt!630722))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432741 (= lt!630722 (Intermediate!11355 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432742 () Bool)

(declare-fun res!966603 () Bool)

(assert (=> b!1432742 (=> (not res!966603) (not e!808732))))

(declare-datatypes ((List!33586 0))(
  ( (Nil!33583) (Cons!33582 (h!34905 (_ BitVec 64)) (t!48280 List!33586)) )
))
(declare-fun arrayNoDuplicates!0 (array!97538 (_ BitVec 32) List!33586) Bool)

(assert (=> b!1432742 (= res!966603 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33583))))

(declare-fun b!1432743 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97538 (_ BitVec 32)) SeekEntryResult!11355)

(assert (=> b!1432743 (= e!808728 (= (seekEntryOrOpen!0 (select (arr!47076 a!2831) j!81) a!2831 mask!2608) (Found!11355 j!81)))))

(declare-fun b!1432744 () Bool)

(declare-fun res!966610 () Bool)

(assert (=> b!1432744 (=> (not res!966610) (not e!808731))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432744 (= res!966610 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432745 () Bool)

(declare-fun res!966605 () Bool)

(assert (=> b!1432745 (=> (not res!966605) (not e!808731))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1432745 (= res!966605 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47076 a!2831) j!81) a!2831 mask!2608) lt!630722))))

(declare-fun b!1432746 () Bool)

(assert (=> b!1432746 (= e!808733 e!808731)))

(declare-fun res!966609 () Bool)

(assert (=> b!1432746 (=> (not res!966609) (not e!808731))))

(declare-fun lt!630723 () array!97538)

(declare-fun lt!630721 () (_ BitVec 64))

(declare-fun lt!630725 () SeekEntryResult!11355)

(assert (=> b!1432746 (= res!966609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630721 mask!2608) lt!630721 lt!630723 mask!2608) lt!630725))))

(assert (=> b!1432746 (= lt!630725 (Intermediate!11355 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432746 (= lt!630721 (select (store (arr!47076 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432746 (= lt!630723 (array!97539 (store (arr!47076 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47626 a!2831)))))

(declare-fun b!1432747 () Bool)

(declare-fun res!966613 () Bool)

(assert (=> b!1432747 (=> (not res!966613) (not e!808732))))

(assert (=> b!1432747 (= res!966613 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47626 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47626 a!2831))))))

(declare-fun b!1432748 () Bool)

(declare-fun res!966616 () Bool)

(assert (=> b!1432748 (=> (not res!966616) (not e!808732))))

(assert (=> b!1432748 (= res!966616 (and (= (size!47626 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47626 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47626 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!966612 () Bool)

(assert (=> start!123566 (=> (not res!966612) (not e!808732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123566 (= res!966612 (validMask!0 mask!2608))))

(assert (=> start!123566 e!808732))

(assert (=> start!123566 true))

(declare-fun array_inv!36104 (array!97538) Bool)

(assert (=> start!123566 (array_inv!36104 a!2831)))

(declare-fun b!1432740 () Bool)

(declare-fun res!966611 () Bool)

(assert (=> b!1432740 (=> (not res!966611) (not e!808732))))

(assert (=> b!1432740 (= res!966611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432749 () Bool)

(declare-fun res!966604 () Bool)

(assert (=> b!1432749 (=> (not res!966604) (not e!808731))))

(assert (=> b!1432749 (= res!966604 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630721 lt!630723 mask!2608) lt!630725))))

(declare-fun b!1432750 () Bool)

(assert (=> b!1432750 (= e!808729 true)))

(declare-fun lt!630724 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432750 (= lt!630724 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432751 () Bool)

(declare-fun res!966614 () Bool)

(assert (=> b!1432751 (=> (not res!966614) (not e!808732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432751 (= res!966614 (validKeyInArray!0 (select (arr!47076 a!2831) j!81)))))

(declare-fun b!1432752 () Bool)

(declare-fun res!966615 () Bool)

(assert (=> b!1432752 (=> (not res!966615) (not e!808732))))

(assert (=> b!1432752 (= res!966615 (validKeyInArray!0 (select (arr!47076 a!2831) i!982)))))

(assert (= (and start!123566 res!966612) b!1432748))

(assert (= (and b!1432748 res!966616) b!1432752))

(assert (= (and b!1432752 res!966615) b!1432751))

(assert (= (and b!1432751 res!966614) b!1432740))

(assert (= (and b!1432740 res!966611) b!1432742))

(assert (= (and b!1432742 res!966603) b!1432747))

(assert (= (and b!1432747 res!966613) b!1432741))

(assert (= (and b!1432741 res!966606) b!1432746))

(assert (= (and b!1432746 res!966609) b!1432745))

(assert (= (and b!1432745 res!966605) b!1432749))

(assert (= (and b!1432749 res!966604) b!1432744))

(assert (= (and b!1432744 res!966610) b!1432739))

(assert (= (and b!1432739 res!966608) b!1432743))

(assert (= (and b!1432739 (not res!966607)) b!1432750))

(declare-fun m!1322561 () Bool)

(assert (=> b!1432745 m!1322561))

(assert (=> b!1432745 m!1322561))

(declare-fun m!1322563 () Bool)

(assert (=> b!1432745 m!1322563))

(declare-fun m!1322565 () Bool)

(assert (=> b!1432746 m!1322565))

(assert (=> b!1432746 m!1322565))

(declare-fun m!1322567 () Bool)

(assert (=> b!1432746 m!1322567))

(declare-fun m!1322569 () Bool)

(assert (=> b!1432746 m!1322569))

(declare-fun m!1322571 () Bool)

(assert (=> b!1432746 m!1322571))

(declare-fun m!1322573 () Bool)

(assert (=> b!1432740 m!1322573))

(assert (=> b!1432739 m!1322569))

(declare-fun m!1322575 () Bool)

(assert (=> b!1432739 m!1322575))

(declare-fun m!1322577 () Bool)

(assert (=> b!1432739 m!1322577))

(declare-fun m!1322579 () Bool)

(assert (=> b!1432739 m!1322579))

(assert (=> b!1432739 m!1322561))

(declare-fun m!1322581 () Bool)

(assert (=> b!1432739 m!1322581))

(declare-fun m!1322583 () Bool)

(assert (=> b!1432749 m!1322583))

(declare-fun m!1322585 () Bool)

(assert (=> start!123566 m!1322585))

(declare-fun m!1322587 () Bool)

(assert (=> start!123566 m!1322587))

(declare-fun m!1322589 () Bool)

(assert (=> b!1432742 m!1322589))

(assert (=> b!1432741 m!1322561))

(assert (=> b!1432741 m!1322561))

(declare-fun m!1322591 () Bool)

(assert (=> b!1432741 m!1322591))

(assert (=> b!1432741 m!1322591))

(assert (=> b!1432741 m!1322561))

(declare-fun m!1322593 () Bool)

(assert (=> b!1432741 m!1322593))

(assert (=> b!1432751 m!1322561))

(assert (=> b!1432751 m!1322561))

(declare-fun m!1322595 () Bool)

(assert (=> b!1432751 m!1322595))

(assert (=> b!1432743 m!1322561))

(assert (=> b!1432743 m!1322561))

(declare-fun m!1322597 () Bool)

(assert (=> b!1432743 m!1322597))

(declare-fun m!1322599 () Bool)

(assert (=> b!1432752 m!1322599))

(assert (=> b!1432752 m!1322599))

(declare-fun m!1322601 () Bool)

(assert (=> b!1432752 m!1322601))

(declare-fun m!1322603 () Bool)

(assert (=> b!1432750 m!1322603))

(check-sat (not b!1432741) (not b!1432739) (not b!1432743) (not b!1432750) (not b!1432752) (not start!123566) (not b!1432749) (not b!1432740) (not b!1432746) (not b!1432742) (not b!1432745) (not b!1432751))
(check-sat)
