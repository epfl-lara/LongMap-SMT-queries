; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123778 () Bool)

(assert start!123778)

(declare-fun b!1433690 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97631 0))(
  ( (array!97632 (arr!47119 (Array (_ BitVec 32) (_ BitVec 64))) (size!47670 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97631)

(declare-fun e!809427 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11300 0))(
  ( (MissingZero!11300 (index!47592 (_ BitVec 32))) (Found!11300 (index!47593 (_ BitVec 32))) (Intermediate!11300 (undefined!12112 Bool) (index!47594 (_ BitVec 32)) (x!129398 (_ BitVec 32))) (Undefined!11300) (MissingVacant!11300 (index!47595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97631 (_ BitVec 32)) SeekEntryResult!11300)

(assert (=> b!1433690 (= e!809427 (= (seekEntryOrOpen!0 (select (arr!47119 a!2831) j!81) a!2831 mask!2608) (Found!11300 j!81)))))

(declare-fun b!1433691 () Bool)

(declare-fun res!966729 () Bool)

(declare-fun e!809424 () Bool)

(assert (=> b!1433691 (=> (not res!966729) (not e!809424))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433691 (= res!966729 (validKeyInArray!0 (select (arr!47119 a!2831) i!982)))))

(declare-fun b!1433692 () Bool)

(declare-fun e!809425 () Bool)

(assert (=> b!1433692 (= e!809425 true)))

(declare-fun lt!631041 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433692 (= lt!631041 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433693 () Bool)

(declare-fun res!966719 () Bool)

(assert (=> b!1433693 (=> (not res!966719) (not e!809424))))

(declare-datatypes ((List!33616 0))(
  ( (Nil!33613) (Cons!33612 (h!34946 (_ BitVec 64)) (t!48302 List!33616)) )
))
(declare-fun arrayNoDuplicates!0 (array!97631 (_ BitVec 32) List!33616) Bool)

(assert (=> b!1433693 (= res!966719 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33613))))

(declare-fun b!1433694 () Bool)

(declare-fun res!966722 () Bool)

(declare-fun e!809429 () Bool)

(assert (=> b!1433694 (=> (not res!966722) (not e!809429))))

(declare-fun lt!631043 () (_ BitVec 64))

(declare-fun lt!631042 () SeekEntryResult!11300)

(declare-fun lt!631044 () array!97631)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97631 (_ BitVec 32)) SeekEntryResult!11300)

(assert (=> b!1433694 (= res!966722 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631043 lt!631044 mask!2608) lt!631042))))

(declare-fun b!1433695 () Bool)

(declare-fun res!966720 () Bool)

(assert (=> b!1433695 (=> (not res!966720) (not e!809424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97631 (_ BitVec 32)) Bool)

(assert (=> b!1433695 (= res!966720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433697 () Bool)

(declare-fun res!966725 () Bool)

(assert (=> b!1433697 (=> (not res!966725) (not e!809429))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433697 (= res!966725 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433698 () Bool)

(declare-fun e!809426 () Bool)

(assert (=> b!1433698 (= e!809424 e!809426)))

(declare-fun res!966728 () Bool)

(assert (=> b!1433698 (=> (not res!966728) (not e!809426))))

(declare-fun lt!631045 () SeekEntryResult!11300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433698 (= res!966728 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47119 a!2831) j!81) mask!2608) (select (arr!47119 a!2831) j!81) a!2831 mask!2608) lt!631045))))

(assert (=> b!1433698 (= lt!631045 (Intermediate!11300 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433699 () Bool)

(declare-fun res!966721 () Bool)

(assert (=> b!1433699 (=> (not res!966721) (not e!809424))))

(assert (=> b!1433699 (= res!966721 (validKeyInArray!0 (select (arr!47119 a!2831) j!81)))))

(declare-fun b!1433700 () Bool)

(assert (=> b!1433700 (= e!809426 e!809429)))

(declare-fun res!966717 () Bool)

(assert (=> b!1433700 (=> (not res!966717) (not e!809429))))

(assert (=> b!1433700 (= res!966717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631043 mask!2608) lt!631043 lt!631044 mask!2608) lt!631042))))

(assert (=> b!1433700 (= lt!631042 (Intermediate!11300 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433700 (= lt!631043 (select (store (arr!47119 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433700 (= lt!631044 (array!97632 (store (arr!47119 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47670 a!2831)))))

(declare-fun b!1433701 () Bool)

(assert (=> b!1433701 (= e!809429 (not e!809425))))

(declare-fun res!966723 () Bool)

(assert (=> b!1433701 (=> res!966723 e!809425)))

(assert (=> b!1433701 (= res!966723 (or (= (select (arr!47119 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47119 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47119 a!2831) index!585) (select (arr!47119 a!2831) j!81)) (= (select (store (arr!47119 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433701 e!809427))

(declare-fun res!966718 () Bool)

(assert (=> b!1433701 (=> (not res!966718) (not e!809427))))

(assert (=> b!1433701 (= res!966718 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48377 0))(
  ( (Unit!48378) )
))
(declare-fun lt!631046 () Unit!48377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48377)

(assert (=> b!1433701 (= lt!631046 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433702 () Bool)

(declare-fun res!966727 () Bool)

(assert (=> b!1433702 (=> (not res!966727) (not e!809424))))

(assert (=> b!1433702 (= res!966727 (and (= (size!47670 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47670 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47670 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433703 () Bool)

(declare-fun res!966724 () Bool)

(assert (=> b!1433703 (=> (not res!966724) (not e!809424))))

(assert (=> b!1433703 (= res!966724 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47670 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47670 a!2831))))))

(declare-fun res!966730 () Bool)

(assert (=> start!123778 (=> (not res!966730) (not e!809424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123778 (= res!966730 (validMask!0 mask!2608))))

(assert (=> start!123778 e!809424))

(assert (=> start!123778 true))

(declare-fun array_inv!36400 (array!97631) Bool)

(assert (=> start!123778 (array_inv!36400 a!2831)))

(declare-fun b!1433696 () Bool)

(declare-fun res!966726 () Bool)

(assert (=> b!1433696 (=> (not res!966726) (not e!809429))))

(assert (=> b!1433696 (= res!966726 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47119 a!2831) j!81) a!2831 mask!2608) lt!631045))))

(assert (= (and start!123778 res!966730) b!1433702))

(assert (= (and b!1433702 res!966727) b!1433691))

(assert (= (and b!1433691 res!966729) b!1433699))

(assert (= (and b!1433699 res!966721) b!1433695))

(assert (= (and b!1433695 res!966720) b!1433693))

(assert (= (and b!1433693 res!966719) b!1433703))

(assert (= (and b!1433703 res!966724) b!1433698))

(assert (= (and b!1433698 res!966728) b!1433700))

(assert (= (and b!1433700 res!966717) b!1433696))

(assert (= (and b!1433696 res!966726) b!1433694))

(assert (= (and b!1433694 res!966722) b!1433697))

(assert (= (and b!1433697 res!966725) b!1433701))

(assert (= (and b!1433701 res!966718) b!1433690))

(assert (= (and b!1433701 (not res!966723)) b!1433692))

(declare-fun m!1323595 () Bool)

(assert (=> b!1433694 m!1323595))

(declare-fun m!1323597 () Bool)

(assert (=> b!1433691 m!1323597))

(assert (=> b!1433691 m!1323597))

(declare-fun m!1323599 () Bool)

(assert (=> b!1433691 m!1323599))

(declare-fun m!1323601 () Bool)

(assert (=> b!1433696 m!1323601))

(assert (=> b!1433696 m!1323601))

(declare-fun m!1323603 () Bool)

(assert (=> b!1433696 m!1323603))

(declare-fun m!1323605 () Bool)

(assert (=> b!1433695 m!1323605))

(assert (=> b!1433699 m!1323601))

(assert (=> b!1433699 m!1323601))

(declare-fun m!1323607 () Bool)

(assert (=> b!1433699 m!1323607))

(declare-fun m!1323609 () Bool)

(assert (=> b!1433693 m!1323609))

(declare-fun m!1323611 () Bool)

(assert (=> b!1433700 m!1323611))

(assert (=> b!1433700 m!1323611))

(declare-fun m!1323613 () Bool)

(assert (=> b!1433700 m!1323613))

(declare-fun m!1323615 () Bool)

(assert (=> b!1433700 m!1323615))

(declare-fun m!1323617 () Bool)

(assert (=> b!1433700 m!1323617))

(assert (=> b!1433690 m!1323601))

(assert (=> b!1433690 m!1323601))

(declare-fun m!1323619 () Bool)

(assert (=> b!1433690 m!1323619))

(assert (=> b!1433701 m!1323615))

(declare-fun m!1323621 () Bool)

(assert (=> b!1433701 m!1323621))

(declare-fun m!1323623 () Bool)

(assert (=> b!1433701 m!1323623))

(declare-fun m!1323625 () Bool)

(assert (=> b!1433701 m!1323625))

(assert (=> b!1433701 m!1323601))

(declare-fun m!1323627 () Bool)

(assert (=> b!1433701 m!1323627))

(declare-fun m!1323629 () Bool)

(assert (=> start!123778 m!1323629))

(declare-fun m!1323631 () Bool)

(assert (=> start!123778 m!1323631))

(declare-fun m!1323633 () Bool)

(assert (=> b!1433692 m!1323633))

(assert (=> b!1433698 m!1323601))

(assert (=> b!1433698 m!1323601))

(declare-fun m!1323635 () Bool)

(assert (=> b!1433698 m!1323635))

(assert (=> b!1433698 m!1323635))

(assert (=> b!1433698 m!1323601))

(declare-fun m!1323637 () Bool)

(assert (=> b!1433698 m!1323637))

(check-sat (not b!1433700) (not b!1433690) (not b!1433693) (not b!1433699) (not b!1433695) (not b!1433701) (not b!1433696) (not start!123778) (not b!1433694) (not b!1433698) (not b!1433692) (not b!1433691))
(check-sat)
