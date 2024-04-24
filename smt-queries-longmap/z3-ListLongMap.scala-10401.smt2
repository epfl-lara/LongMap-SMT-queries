; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122756 () Bool)

(assert start!122756)

(declare-fun b!1420738 () Bool)

(declare-fun res!955495 () Bool)

(declare-fun e!803911 () Bool)

(assert (=> b!1420738 (=> (not res!955495) (not e!803911))))

(declare-datatypes ((array!97043 0))(
  ( (array!97044 (arr!46837 (Array (_ BitVec 32) (_ BitVec 64))) (size!47388 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97043)

(declare-datatypes ((List!33334 0))(
  ( (Nil!33331) (Cons!33330 (h!34640 (_ BitVec 64)) (t!48020 List!33334)) )
))
(declare-fun arrayNoDuplicates!0 (array!97043 (_ BitVec 32) List!33334) Bool)

(assert (=> b!1420738 (= res!955495 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33331))))

(declare-fun b!1420740 () Bool)

(declare-fun res!955489 () Bool)

(assert (=> b!1420740 (=> (not res!955489) (not e!803911))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420740 (= res!955489 (and (= (size!47388 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47388 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47388 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420741 () Bool)

(declare-fun res!955491 () Bool)

(assert (=> b!1420741 (=> (not res!955491) (not e!803911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420741 (= res!955491 (validKeyInArray!0 (select (arr!46837 a!2831) i!982)))))

(declare-fun b!1420742 () Bool)

(declare-fun res!955487 () Bool)

(assert (=> b!1420742 (=> (not res!955487) (not e!803911))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11024 0))(
  ( (MissingZero!11024 (index!46488 (_ BitVec 32))) (Found!11024 (index!46489 (_ BitVec 32))) (Intermediate!11024 (undefined!11836 Bool) (index!46490 (_ BitVec 32)) (x!128317 (_ BitVec 32))) (Undefined!11024) (MissingVacant!11024 (index!46491 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97043 (_ BitVec 32)) SeekEntryResult!11024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420742 (= res!955487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46837 a!2831) j!81) mask!2608) (select (arr!46837 a!2831) j!81) a!2831 mask!2608) (Intermediate!11024 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420743 () Bool)

(declare-fun res!955488 () Bool)

(assert (=> b!1420743 (=> (not res!955488) (not e!803911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97043 (_ BitVec 32)) Bool)

(assert (=> b!1420743 (= res!955488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420744 () Bool)

(declare-fun e!803912 () Bool)

(assert (=> b!1420744 (= e!803911 e!803912)))

(declare-fun res!955492 () Bool)

(assert (=> b!1420744 (=> (not res!955492) (not e!803912))))

(declare-fun lt!626237 () (_ BitVec 32))

(assert (=> b!1420744 (= res!955492 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge lt!626237 #b00000000000000000000000000000000) (bvslt lt!626237 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(assert (=> b!1420744 (= lt!626237 (toIndex!0 (select (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1420739 () Bool)

(declare-fun res!955494 () Bool)

(assert (=> b!1420739 (=> (not res!955494) (not e!803911))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420739 (= res!955494 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47388 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47388 a!2831))))))

(declare-fun res!955490 () Bool)

(assert (=> start!122756 (=> (not res!955490) (not e!803911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122756 (= res!955490 (validMask!0 mask!2608))))

(assert (=> start!122756 e!803911))

(assert (=> start!122756 true))

(declare-fun array_inv!36118 (array!97043) Bool)

(assert (=> start!122756 (array_inv!36118 a!2831)))

(declare-fun b!1420745 () Bool)

(assert (=> b!1420745 (= e!803912 (not (validKeyInArray!0 (select (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1420746 () Bool)

(declare-fun res!955493 () Bool)

(assert (=> b!1420746 (=> (not res!955493) (not e!803911))))

(assert (=> b!1420746 (= res!955493 (validKeyInArray!0 (select (arr!46837 a!2831) j!81)))))

(assert (= (and start!122756 res!955490) b!1420740))

(assert (= (and b!1420740 res!955489) b!1420741))

(assert (= (and b!1420741 res!955491) b!1420746))

(assert (= (and b!1420746 res!955493) b!1420743))

(assert (= (and b!1420743 res!955488) b!1420738))

(assert (= (and b!1420738 res!955495) b!1420739))

(assert (= (and b!1420739 res!955494) b!1420742))

(assert (= (and b!1420742 res!955487) b!1420744))

(assert (= (and b!1420744 res!955492) b!1420745))

(declare-fun m!1311405 () Bool)

(assert (=> b!1420746 m!1311405))

(assert (=> b!1420746 m!1311405))

(declare-fun m!1311407 () Bool)

(assert (=> b!1420746 m!1311407))

(declare-fun m!1311409 () Bool)

(assert (=> start!122756 m!1311409))

(declare-fun m!1311411 () Bool)

(assert (=> start!122756 m!1311411))

(declare-fun m!1311413 () Bool)

(assert (=> b!1420741 m!1311413))

(assert (=> b!1420741 m!1311413))

(declare-fun m!1311415 () Bool)

(assert (=> b!1420741 m!1311415))

(assert (=> b!1420742 m!1311405))

(assert (=> b!1420742 m!1311405))

(declare-fun m!1311417 () Bool)

(assert (=> b!1420742 m!1311417))

(assert (=> b!1420742 m!1311417))

(assert (=> b!1420742 m!1311405))

(declare-fun m!1311419 () Bool)

(assert (=> b!1420742 m!1311419))

(declare-fun m!1311421 () Bool)

(assert (=> b!1420743 m!1311421))

(declare-fun m!1311423 () Bool)

(assert (=> b!1420745 m!1311423))

(declare-fun m!1311425 () Bool)

(assert (=> b!1420745 m!1311425))

(assert (=> b!1420745 m!1311425))

(declare-fun m!1311427 () Bool)

(assert (=> b!1420745 m!1311427))

(assert (=> b!1420744 m!1311423))

(assert (=> b!1420744 m!1311425))

(assert (=> b!1420744 m!1311425))

(declare-fun m!1311429 () Bool)

(assert (=> b!1420744 m!1311429))

(declare-fun m!1311431 () Bool)

(assert (=> b!1420738 m!1311431))

(check-sat (not b!1420738) (not b!1420741) (not start!122756) (not b!1420746) (not b!1420744) (not b!1420742) (not b!1420745) (not b!1420743))
(check-sat)
