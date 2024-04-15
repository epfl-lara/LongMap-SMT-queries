; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123554 () Bool)

(assert start!123554)

(declare-fun b!1432655 () Bool)

(declare-fun res!966634 () Bool)

(declare-fun e!808673 () Bool)

(assert (=> b!1432655 (=> (not res!966634) (not e!808673))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97491 0))(
  ( (array!97492 (arr!47053 (Array (_ BitVec 32) (_ BitVec 64))) (size!47605 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97491)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432655 (= res!966634 (and (= (size!47605 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47605 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47605 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432656 () Bool)

(declare-fun res!966632 () Bool)

(assert (=> b!1432656 (=> (not res!966632) (not e!808673))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432656 (= res!966632 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47605 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47605 a!2831))))))

(declare-fun b!1432657 () Bool)

(declare-fun res!966631 () Bool)

(declare-fun e!808674 () Bool)

(assert (=> b!1432657 (=> (not res!966631) (not e!808674))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432657 (= res!966631 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432658 () Bool)

(declare-fun e!808670 () Bool)

(assert (=> b!1432658 (= e!808670 e!808674)))

(declare-fun res!966628 () Bool)

(assert (=> b!1432658 (=> (not res!966628) (not e!808674))))

(declare-fun lt!630537 () array!97491)

(declare-fun lt!630536 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11359 0))(
  ( (MissingZero!11359 (index!47828 (_ BitVec 32))) (Found!11359 (index!47829 (_ BitVec 32))) (Intermediate!11359 (undefined!12171 Bool) (index!47830 (_ BitVec 32)) (x!129460 (_ BitVec 32))) (Undefined!11359) (MissingVacant!11359 (index!47831 (_ BitVec 32))) )
))
(declare-fun lt!630532 () SeekEntryResult!11359)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97491 (_ BitVec 32)) SeekEntryResult!11359)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432658 (= res!966628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630536 mask!2608) lt!630536 lt!630537 mask!2608) lt!630532))))

(assert (=> b!1432658 (= lt!630532 (Intermediate!11359 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432658 (= lt!630536 (select (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432658 (= lt!630537 (array!97492 (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47605 a!2831)))))

(declare-fun b!1432659 () Bool)

(assert (=> b!1432659 (= e!808673 e!808670)))

(declare-fun res!966630 () Bool)

(assert (=> b!1432659 (=> (not res!966630) (not e!808670))))

(declare-fun lt!630535 () SeekEntryResult!11359)

(assert (=> b!1432659 (= res!966630 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47053 a!2831) j!81) mask!2608) (select (arr!47053 a!2831) j!81) a!2831 mask!2608) lt!630535))))

(assert (=> b!1432659 (= lt!630535 (Intermediate!11359 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432660 () Bool)

(declare-fun e!808672 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97491 (_ BitVec 32)) SeekEntryResult!11359)

(assert (=> b!1432660 (= e!808672 (= (seekEntryOrOpen!0 (select (arr!47053 a!2831) j!81) a!2831 mask!2608) (Found!11359 j!81)))))

(declare-fun b!1432661 () Bool)

(declare-fun res!966636 () Bool)

(assert (=> b!1432661 (=> (not res!966636) (not e!808673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432661 (= res!966636 (validKeyInArray!0 (select (arr!47053 a!2831) i!982)))))

(declare-fun b!1432662 () Bool)

(declare-fun res!966633 () Bool)

(assert (=> b!1432662 (=> (not res!966633) (not e!808674))))

(assert (=> b!1432662 (= res!966633 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630536 lt!630537 mask!2608) lt!630532))))

(declare-fun res!966624 () Bool)

(assert (=> start!123554 (=> (not res!966624) (not e!808673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123554 (= res!966624 (validMask!0 mask!2608))))

(assert (=> start!123554 e!808673))

(assert (=> start!123554 true))

(declare-fun array_inv!36286 (array!97491) Bool)

(assert (=> start!123554 (array_inv!36286 a!2831)))

(declare-fun b!1432663 () Bool)

(declare-fun res!966627 () Bool)

(assert (=> b!1432663 (=> (not res!966627) (not e!808673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97491 (_ BitVec 32)) Bool)

(assert (=> b!1432663 (= res!966627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432664 () Bool)

(declare-fun res!966626 () Bool)

(assert (=> b!1432664 (=> (not res!966626) (not e!808673))))

(declare-datatypes ((List!33641 0))(
  ( (Nil!33638) (Cons!33637 (h!34960 (_ BitVec 64)) (t!48327 List!33641)) )
))
(declare-fun arrayNoDuplicates!0 (array!97491 (_ BitVec 32) List!33641) Bool)

(assert (=> b!1432664 (= res!966626 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33638))))

(declare-fun b!1432665 () Bool)

(declare-fun e!808671 () Bool)

(assert (=> b!1432665 (= e!808671 true)))

(declare-fun lt!630534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432665 (= lt!630534 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432666 () Bool)

(declare-fun res!966629 () Bool)

(assert (=> b!1432666 (=> (not res!966629) (not e!808673))))

(assert (=> b!1432666 (= res!966629 (validKeyInArray!0 (select (arr!47053 a!2831) j!81)))))

(declare-fun b!1432667 () Bool)

(declare-fun res!966625 () Bool)

(assert (=> b!1432667 (=> (not res!966625) (not e!808674))))

(assert (=> b!1432667 (= res!966625 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47053 a!2831) j!81) a!2831 mask!2608) lt!630535))))

(declare-fun b!1432668 () Bool)

(assert (=> b!1432668 (= e!808674 (not e!808671))))

(declare-fun res!966635 () Bool)

(assert (=> b!1432668 (=> res!966635 e!808671)))

(assert (=> b!1432668 (= res!966635 (or (= (select (arr!47053 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47053 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47053 a!2831) index!585) (select (arr!47053 a!2831) j!81)) (= (select (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432668 e!808672))

(declare-fun res!966637 () Bool)

(assert (=> b!1432668 (=> (not res!966637) (not e!808672))))

(assert (=> b!1432668 (= res!966637 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48303 0))(
  ( (Unit!48304) )
))
(declare-fun lt!630533 () Unit!48303)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48303)

(assert (=> b!1432668 (= lt!630533 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123554 res!966624) b!1432655))

(assert (= (and b!1432655 res!966634) b!1432661))

(assert (= (and b!1432661 res!966636) b!1432666))

(assert (= (and b!1432666 res!966629) b!1432663))

(assert (= (and b!1432663 res!966627) b!1432664))

(assert (= (and b!1432664 res!966626) b!1432656))

(assert (= (and b!1432656 res!966632) b!1432659))

(assert (= (and b!1432659 res!966630) b!1432658))

(assert (= (and b!1432658 res!966628) b!1432667))

(assert (= (and b!1432667 res!966625) b!1432662))

(assert (= (and b!1432662 res!966633) b!1432657))

(assert (= (and b!1432657 res!966631) b!1432668))

(assert (= (and b!1432668 res!966637) b!1432660))

(assert (= (and b!1432668 (not res!966635)) b!1432665))

(declare-fun m!1321997 () Bool)

(assert (=> b!1432665 m!1321997))

(declare-fun m!1321999 () Bool)

(assert (=> b!1432658 m!1321999))

(assert (=> b!1432658 m!1321999))

(declare-fun m!1322001 () Bool)

(assert (=> b!1432658 m!1322001))

(declare-fun m!1322003 () Bool)

(assert (=> b!1432658 m!1322003))

(declare-fun m!1322005 () Bool)

(assert (=> b!1432658 m!1322005))

(declare-fun m!1322007 () Bool)

(assert (=> b!1432666 m!1322007))

(assert (=> b!1432666 m!1322007))

(declare-fun m!1322009 () Bool)

(assert (=> b!1432666 m!1322009))

(declare-fun m!1322011 () Bool)

(assert (=> b!1432664 m!1322011))

(assert (=> b!1432668 m!1322003))

(declare-fun m!1322013 () Bool)

(assert (=> b!1432668 m!1322013))

(declare-fun m!1322015 () Bool)

(assert (=> b!1432668 m!1322015))

(declare-fun m!1322017 () Bool)

(assert (=> b!1432668 m!1322017))

(assert (=> b!1432668 m!1322007))

(declare-fun m!1322019 () Bool)

(assert (=> b!1432668 m!1322019))

(assert (=> b!1432659 m!1322007))

(assert (=> b!1432659 m!1322007))

(declare-fun m!1322021 () Bool)

(assert (=> b!1432659 m!1322021))

(assert (=> b!1432659 m!1322021))

(assert (=> b!1432659 m!1322007))

(declare-fun m!1322023 () Bool)

(assert (=> b!1432659 m!1322023))

(declare-fun m!1322025 () Bool)

(assert (=> b!1432661 m!1322025))

(assert (=> b!1432661 m!1322025))

(declare-fun m!1322027 () Bool)

(assert (=> b!1432661 m!1322027))

(assert (=> b!1432660 m!1322007))

(assert (=> b!1432660 m!1322007))

(declare-fun m!1322029 () Bool)

(assert (=> b!1432660 m!1322029))

(assert (=> b!1432667 m!1322007))

(assert (=> b!1432667 m!1322007))

(declare-fun m!1322031 () Bool)

(assert (=> b!1432667 m!1322031))

(declare-fun m!1322033 () Bool)

(assert (=> b!1432662 m!1322033))

(declare-fun m!1322035 () Bool)

(assert (=> b!1432663 m!1322035))

(declare-fun m!1322037 () Bool)

(assert (=> start!123554 m!1322037))

(declare-fun m!1322039 () Bool)

(assert (=> start!123554 m!1322039))

(check-sat (not b!1432667) (not b!1432666) (not b!1432660) (not b!1432663) (not b!1432668) (not start!123554) (not b!1432658) (not b!1432662) (not b!1432659) (not b!1432661) (not b!1432664) (not b!1432665))
(check-sat)
