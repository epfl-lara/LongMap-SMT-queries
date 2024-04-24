; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122834 () Bool)

(assert start!122834)

(declare-fun b!1421793 () Bool)

(declare-fun res!956545 () Bool)

(declare-fun e!804185 () Bool)

(assert (=> b!1421793 (=> (not res!956545) (not e!804185))))

(declare-datatypes ((array!97121 0))(
  ( (array!97122 (arr!46876 (Array (_ BitVec 32) (_ BitVec 64))) (size!47427 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97121)

(declare-datatypes ((List!33373 0))(
  ( (Nil!33370) (Cons!33369 (h!34679 (_ BitVec 64)) (t!48059 List!33373)) )
))
(declare-fun arrayNoDuplicates!0 (array!97121 (_ BitVec 32) List!33373) Bool)

(assert (=> b!1421793 (= res!956545 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33370))))

(declare-fun b!1421794 () Bool)

(declare-fun e!804182 () Bool)

(declare-fun e!804184 () Bool)

(assert (=> b!1421794 (= e!804182 e!804184)))

(declare-fun res!956548 () Bool)

(assert (=> b!1421794 (=> (not res!956548) (not e!804184))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626343 () array!97121)

(declare-fun lt!626342 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11063 0))(
  ( (MissingZero!11063 (index!46644 (_ BitVec 32))) (Found!11063 (index!46645 (_ BitVec 32))) (Intermediate!11063 (undefined!11875 Bool) (index!46646 (_ BitVec 32)) (x!128460 (_ BitVec 32))) (Undefined!11063) (MissingVacant!11063 (index!46647 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97121 (_ BitVec 32)) SeekEntryResult!11063)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421794 (= res!956548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626342 mask!2608) lt!626342 lt!626343 mask!2608) (Intermediate!11063 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421794 (= lt!626342 (select (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421794 (= lt!626343 (array!97122 (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47427 a!2831)))))

(declare-fun b!1421796 () Bool)

(declare-fun res!956544 () Bool)

(assert (=> b!1421796 (=> (not res!956544) (not e!804185))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421796 (= res!956544 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47427 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47427 a!2831))))))

(declare-fun b!1421797 () Bool)

(assert (=> b!1421797 (= e!804184 false)))

(declare-fun lt!626344 () SeekEntryResult!11063)

(assert (=> b!1421797 (= lt!626344 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626342 lt!626343 mask!2608))))

(declare-fun b!1421798 () Bool)

(declare-fun res!956542 () Bool)

(assert (=> b!1421798 (=> (not res!956542) (not e!804185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421798 (= res!956542 (validKeyInArray!0 (select (arr!46876 a!2831) i!982)))))

(declare-fun b!1421799 () Bool)

(declare-fun res!956551 () Bool)

(assert (=> b!1421799 (=> (not res!956551) (not e!804185))))

(assert (=> b!1421799 (= res!956551 (and (= (size!47427 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47427 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47427 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421800 () Bool)

(declare-fun res!956543 () Bool)

(assert (=> b!1421800 (=> (not res!956543) (not e!804184))))

(declare-fun lt!626345 () SeekEntryResult!11063)

(assert (=> b!1421800 (= res!956543 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!626345))))

(declare-fun b!1421801 () Bool)

(assert (=> b!1421801 (= e!804185 e!804182)))

(declare-fun res!956547 () Bool)

(assert (=> b!1421801 (=> (not res!956547) (not e!804182))))

(assert (=> b!1421801 (= res!956547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46876 a!2831) j!81) mask!2608) (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!626345))))

(assert (=> b!1421801 (= lt!626345 (Intermediate!11063 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421802 () Bool)

(declare-fun res!956546 () Bool)

(assert (=> b!1421802 (=> (not res!956546) (not e!804185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97121 (_ BitVec 32)) Bool)

(assert (=> b!1421802 (= res!956546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!956550 () Bool)

(assert (=> start!122834 (=> (not res!956550) (not e!804185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122834 (= res!956550 (validMask!0 mask!2608))))

(assert (=> start!122834 e!804185))

(assert (=> start!122834 true))

(declare-fun array_inv!36157 (array!97121) Bool)

(assert (=> start!122834 (array_inv!36157 a!2831)))

(declare-fun b!1421795 () Bool)

(declare-fun res!956549 () Bool)

(assert (=> b!1421795 (=> (not res!956549) (not e!804185))))

(assert (=> b!1421795 (= res!956549 (validKeyInArray!0 (select (arr!46876 a!2831) j!81)))))

(assert (= (and start!122834 res!956550) b!1421799))

(assert (= (and b!1421799 res!956551) b!1421798))

(assert (= (and b!1421798 res!956542) b!1421795))

(assert (= (and b!1421795 res!956549) b!1421802))

(assert (= (and b!1421802 res!956546) b!1421793))

(assert (= (and b!1421793 res!956545) b!1421796))

(assert (= (and b!1421796 res!956544) b!1421801))

(assert (= (and b!1421801 res!956547) b!1421794))

(assert (= (and b!1421794 res!956548) b!1421800))

(assert (= (and b!1421800 res!956543) b!1421797))

(declare-fun m!1312539 () Bool)

(assert (=> b!1421793 m!1312539))

(declare-fun m!1312541 () Bool)

(assert (=> b!1421798 m!1312541))

(assert (=> b!1421798 m!1312541))

(declare-fun m!1312543 () Bool)

(assert (=> b!1421798 m!1312543))

(declare-fun m!1312545 () Bool)

(assert (=> b!1421797 m!1312545))

(declare-fun m!1312547 () Bool)

(assert (=> b!1421794 m!1312547))

(assert (=> b!1421794 m!1312547))

(declare-fun m!1312549 () Bool)

(assert (=> b!1421794 m!1312549))

(declare-fun m!1312551 () Bool)

(assert (=> b!1421794 m!1312551))

(declare-fun m!1312553 () Bool)

(assert (=> b!1421794 m!1312553))

(declare-fun m!1312555 () Bool)

(assert (=> b!1421795 m!1312555))

(assert (=> b!1421795 m!1312555))

(declare-fun m!1312557 () Bool)

(assert (=> b!1421795 m!1312557))

(declare-fun m!1312559 () Bool)

(assert (=> start!122834 m!1312559))

(declare-fun m!1312561 () Bool)

(assert (=> start!122834 m!1312561))

(declare-fun m!1312563 () Bool)

(assert (=> b!1421802 m!1312563))

(assert (=> b!1421800 m!1312555))

(assert (=> b!1421800 m!1312555))

(declare-fun m!1312565 () Bool)

(assert (=> b!1421800 m!1312565))

(assert (=> b!1421801 m!1312555))

(assert (=> b!1421801 m!1312555))

(declare-fun m!1312567 () Bool)

(assert (=> b!1421801 m!1312567))

(assert (=> b!1421801 m!1312567))

(assert (=> b!1421801 m!1312555))

(declare-fun m!1312569 () Bool)

(assert (=> b!1421801 m!1312569))

(check-sat (not b!1421800) (not b!1421801) (not b!1421793) (not b!1421794) (not start!122834) (not b!1421797) (not b!1421798) (not b!1421795) (not b!1421802))
(check-sat)
