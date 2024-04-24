; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123874 () Bool)

(assert start!123874)

(declare-fun b!1434755 () Bool)

(declare-fun res!967590 () Bool)

(declare-fun e!809942 () Bool)

(assert (=> b!1434755 (=> (not res!967590) (not e!809942))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434755 (= res!967590 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434756 () Bool)

(declare-fun e!809938 () Bool)

(declare-fun e!809939 () Bool)

(assert (=> b!1434756 (= e!809938 e!809939)))

(declare-fun res!967584 () Bool)

(assert (=> b!1434756 (=> (not res!967584) (not e!809939))))

(declare-datatypes ((array!97670 0))(
  ( (array!97671 (arr!47137 (Array (_ BitVec 32) (_ BitVec 64))) (size!47688 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97670)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11318 0))(
  ( (MissingZero!11318 (index!47664 (_ BitVec 32))) (Found!11318 (index!47665 (_ BitVec 32))) (Intermediate!11318 (undefined!12130 Bool) (index!47666 (_ BitVec 32)) (x!129473 (_ BitVec 32))) (Undefined!11318) (MissingVacant!11318 (index!47667 (_ BitVec 32))) )
))
(declare-fun lt!631508 () SeekEntryResult!11318)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97670 (_ BitVec 32)) SeekEntryResult!11318)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434756 (= res!967584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47137 a!2831) j!81) mask!2608) (select (arr!47137 a!2831) j!81) a!2831 mask!2608) lt!631508))))

(assert (=> b!1434756 (= lt!631508 (Intermediate!11318 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434758 () Bool)

(declare-fun res!967587 () Bool)

(assert (=> b!1434758 (=> (not res!967587) (not e!809942))))

(declare-fun lt!631510 () array!97670)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!631506 () SeekEntryResult!11318)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!631507 () (_ BitVec 64))

(assert (=> b!1434758 (= res!967587 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631507 lt!631510 mask!2608) lt!631506))))

(declare-fun b!1434759 () Bool)

(declare-fun res!967591 () Bool)

(assert (=> b!1434759 (=> (not res!967591) (not e!809938))))

(declare-datatypes ((List!33634 0))(
  ( (Nil!33631) (Cons!33630 (h!34967 (_ BitVec 64)) (t!48320 List!33634)) )
))
(declare-fun arrayNoDuplicates!0 (array!97670 (_ BitVec 32) List!33634) Bool)

(assert (=> b!1434759 (= res!967591 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33631))))

(declare-fun b!1434760 () Bool)

(declare-fun res!967589 () Bool)

(assert (=> b!1434760 (=> (not res!967589) (not e!809938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97670 (_ BitVec 32)) Bool)

(assert (=> b!1434760 (= res!967589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434761 () Bool)

(declare-fun e!809941 () Bool)

(assert (=> b!1434761 (= e!809942 (not e!809941))))

(declare-fun res!967592 () Bool)

(assert (=> b!1434761 (=> res!967592 e!809941)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434761 (= res!967592 (or (= (select (arr!47137 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47137 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47137 a!2831) index!585) (select (arr!47137 a!2831) j!81)) (= (select (store (arr!47137 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809937 () Bool)

(assert (=> b!1434761 e!809937))

(declare-fun res!967594 () Bool)

(assert (=> b!1434761 (=> (not res!967594) (not e!809937))))

(assert (=> b!1434761 (= res!967594 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48413 0))(
  ( (Unit!48414) )
))
(declare-fun lt!631511 () Unit!48413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48413)

(assert (=> b!1434761 (= lt!631511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434762 () Bool)

(declare-fun res!967586 () Bool)

(assert (=> b!1434762 (=> (not res!967586) (not e!809938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434762 (= res!967586 (validKeyInArray!0 (select (arr!47137 a!2831) i!982)))))

(declare-fun b!1434763 () Bool)

(declare-fun res!967581 () Bool)

(assert (=> b!1434763 (=> (not res!967581) (not e!809938))))

(assert (=> b!1434763 (= res!967581 (validKeyInArray!0 (select (arr!47137 a!2831) j!81)))))

(declare-fun b!1434764 () Bool)

(assert (=> b!1434764 (= e!809939 e!809942)))

(declare-fun res!967593 () Bool)

(assert (=> b!1434764 (=> (not res!967593) (not e!809942))))

(assert (=> b!1434764 (= res!967593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631507 mask!2608) lt!631507 lt!631510 mask!2608) lt!631506))))

(assert (=> b!1434764 (= lt!631506 (Intermediate!11318 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434764 (= lt!631507 (select (store (arr!47137 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434764 (= lt!631510 (array!97671 (store (arr!47137 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47688 a!2831)))))

(declare-fun res!967585 () Bool)

(assert (=> start!123874 (=> (not res!967585) (not e!809938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123874 (= res!967585 (validMask!0 mask!2608))))

(assert (=> start!123874 e!809938))

(assert (=> start!123874 true))

(declare-fun array_inv!36418 (array!97670) Bool)

(assert (=> start!123874 (array_inv!36418 a!2831)))

(declare-fun b!1434757 () Bool)

(declare-fun res!967583 () Bool)

(assert (=> b!1434757 (=> (not res!967583) (not e!809938))))

(assert (=> b!1434757 (= res!967583 (and (= (size!47688 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47688 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47688 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434765 () Bool)

(assert (=> b!1434765 (= e!809941 true)))

(declare-fun lt!631509 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434765 (= lt!631509 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1434766 () Bool)

(declare-fun res!967588 () Bool)

(assert (=> b!1434766 (=> (not res!967588) (not e!809942))))

(assert (=> b!1434766 (= res!967588 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47137 a!2831) j!81) a!2831 mask!2608) lt!631508))))

(declare-fun b!1434767 () Bool)

(declare-fun res!967582 () Bool)

(assert (=> b!1434767 (=> (not res!967582) (not e!809938))))

(assert (=> b!1434767 (= res!967582 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47688 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47688 a!2831))))))

(declare-fun b!1434768 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97670 (_ BitVec 32)) SeekEntryResult!11318)

(assert (=> b!1434768 (= e!809937 (= (seekEntryOrOpen!0 (select (arr!47137 a!2831) j!81) a!2831 mask!2608) (Found!11318 j!81)))))

(assert (= (and start!123874 res!967585) b!1434757))

(assert (= (and b!1434757 res!967583) b!1434762))

(assert (= (and b!1434762 res!967586) b!1434763))

(assert (= (and b!1434763 res!967581) b!1434760))

(assert (= (and b!1434760 res!967589) b!1434759))

(assert (= (and b!1434759 res!967591) b!1434767))

(assert (= (and b!1434767 res!967582) b!1434756))

(assert (= (and b!1434756 res!967584) b!1434764))

(assert (= (and b!1434764 res!967593) b!1434766))

(assert (= (and b!1434766 res!967588) b!1434758))

(assert (= (and b!1434758 res!967587) b!1434755))

(assert (= (and b!1434755 res!967590) b!1434761))

(assert (= (and b!1434761 res!967594) b!1434768))

(assert (= (and b!1434761 (not res!967592)) b!1434765))

(declare-fun m!1324579 () Bool)

(assert (=> b!1434763 m!1324579))

(assert (=> b!1434763 m!1324579))

(declare-fun m!1324581 () Bool)

(assert (=> b!1434763 m!1324581))

(declare-fun m!1324583 () Bool)

(assert (=> b!1434758 m!1324583))

(declare-fun m!1324585 () Bool)

(assert (=> b!1434759 m!1324585))

(assert (=> b!1434766 m!1324579))

(assert (=> b!1434766 m!1324579))

(declare-fun m!1324587 () Bool)

(assert (=> b!1434766 m!1324587))

(declare-fun m!1324589 () Bool)

(assert (=> b!1434764 m!1324589))

(assert (=> b!1434764 m!1324589))

(declare-fun m!1324591 () Bool)

(assert (=> b!1434764 m!1324591))

(declare-fun m!1324593 () Bool)

(assert (=> b!1434764 m!1324593))

(declare-fun m!1324595 () Bool)

(assert (=> b!1434764 m!1324595))

(declare-fun m!1324597 () Bool)

(assert (=> b!1434762 m!1324597))

(assert (=> b!1434762 m!1324597))

(declare-fun m!1324599 () Bool)

(assert (=> b!1434762 m!1324599))

(assert (=> b!1434768 m!1324579))

(assert (=> b!1434768 m!1324579))

(declare-fun m!1324601 () Bool)

(assert (=> b!1434768 m!1324601))

(declare-fun m!1324603 () Bool)

(assert (=> start!123874 m!1324603))

(declare-fun m!1324605 () Bool)

(assert (=> start!123874 m!1324605))

(assert (=> b!1434761 m!1324593))

(declare-fun m!1324607 () Bool)

(assert (=> b!1434761 m!1324607))

(declare-fun m!1324609 () Bool)

(assert (=> b!1434761 m!1324609))

(declare-fun m!1324611 () Bool)

(assert (=> b!1434761 m!1324611))

(assert (=> b!1434761 m!1324579))

(declare-fun m!1324613 () Bool)

(assert (=> b!1434761 m!1324613))

(declare-fun m!1324615 () Bool)

(assert (=> b!1434765 m!1324615))

(assert (=> b!1434756 m!1324579))

(assert (=> b!1434756 m!1324579))

(declare-fun m!1324617 () Bool)

(assert (=> b!1434756 m!1324617))

(assert (=> b!1434756 m!1324617))

(assert (=> b!1434756 m!1324579))

(declare-fun m!1324619 () Bool)

(assert (=> b!1434756 m!1324619))

(declare-fun m!1324621 () Bool)

(assert (=> b!1434760 m!1324621))

(check-sat (not b!1434764) (not b!1434756) (not b!1434762) (not b!1434765) (not b!1434768) (not b!1434760) (not b!1434766) (not b!1434761) (not b!1434763) (not b!1434758) (not b!1434759) (not start!123874))
(check-sat)
