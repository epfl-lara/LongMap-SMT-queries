; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122726 () Bool)

(assert start!122726)

(declare-fun res!957497 () Bool)

(declare-fun e!803975 () Bool)

(assert (=> start!122726 (=> (not res!957497) (not e!803975))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122726 (= res!957497 (validMask!0 mask!2608))))

(assert (=> start!122726 e!803975))

(assert (=> start!122726 true))

(declare-datatypes ((array!97091 0))(
  ( (array!97092 (arr!46863 (Array (_ BitVec 32) (_ BitVec 64))) (size!47413 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97091)

(declare-fun array_inv!35891 (array!97091) Bool)

(assert (=> start!122726 (array_inv!35891 a!2831)))

(declare-fun b!1422063 () Bool)

(declare-fun res!957501 () Bool)

(declare-fun e!803978 () Bool)

(assert (=> b!1422063 (=> (not res!957501) (not e!803978))))

(declare-fun lt!626517 () array!97091)

(declare-fun lt!626515 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11148 0))(
  ( (MissingZero!11148 (index!46984 (_ BitVec 32))) (Found!11148 (index!46985 (_ BitVec 32))) (Intermediate!11148 (undefined!11960 Bool) (index!46986 (_ BitVec 32)) (x!128630 (_ BitVec 32))) (Undefined!11148) (MissingVacant!11148 (index!46987 (_ BitVec 32))) )
))
(declare-fun lt!626512 () SeekEntryResult!11148)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97091 (_ BitVec 32)) SeekEntryResult!11148)

(assert (=> b!1422063 (= res!957501 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626515 lt!626517 mask!2608) lt!626512))))

(declare-fun b!1422064 () Bool)

(declare-fun res!957508 () Bool)

(assert (=> b!1422064 (=> (not res!957508) (not e!803975))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422064 (= res!957508 (and (= (size!47413 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47413 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47413 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422065 () Bool)

(declare-fun e!803977 () Bool)

(assert (=> b!1422065 (= e!803975 e!803977)))

(declare-fun res!957511 () Bool)

(assert (=> b!1422065 (=> (not res!957511) (not e!803977))))

(declare-fun lt!626516 () SeekEntryResult!11148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422065 (= res!957511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46863 a!2831) j!81) mask!2608) (select (arr!46863 a!2831) j!81) a!2831 mask!2608) lt!626516))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422065 (= lt!626516 (Intermediate!11148 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422066 () Bool)

(declare-fun e!803981 () Bool)

(assert (=> b!1422066 (= e!803978 (not e!803981))))

(declare-fun res!957506 () Bool)

(assert (=> b!1422066 (=> res!957506 e!803981)))

(assert (=> b!1422066 (= res!957506 (or (= (select (arr!46863 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46863 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46863 a!2831) index!585) (select (arr!46863 a!2831) j!81)) (= (select (store (arr!46863 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!803980 () Bool)

(assert (=> b!1422066 e!803980))

(declare-fun res!957502 () Bool)

(assert (=> b!1422066 (=> (not res!957502) (not e!803980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97091 (_ BitVec 32)) Bool)

(assert (=> b!1422066 (= res!957502 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48132 0))(
  ( (Unit!48133) )
))
(declare-fun lt!626514 () Unit!48132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48132)

(assert (=> b!1422066 (= lt!626514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422067 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97091 (_ BitVec 32)) SeekEntryResult!11148)

(assert (=> b!1422067 (= e!803980 (= (seekEntryOrOpen!0 (select (arr!46863 a!2831) j!81) a!2831 mask!2608) (Found!11148 j!81)))))

(declare-fun b!1422068 () Bool)

(declare-fun res!957507 () Bool)

(assert (=> b!1422068 (=> (not res!957507) (not e!803975))))

(assert (=> b!1422068 (= res!957507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422069 () Bool)

(declare-fun res!957500 () Bool)

(declare-fun e!803976 () Bool)

(assert (=> b!1422069 (=> res!957500 e!803976)))

(declare-fun lt!626513 () (_ BitVec 32))

(assert (=> b!1422069 (= res!957500 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626513 (select (arr!46863 a!2831) j!81) a!2831 mask!2608) lt!626516)))))

(declare-fun b!1422070 () Bool)

(declare-fun res!957504 () Bool)

(assert (=> b!1422070 (=> (not res!957504) (not e!803975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422070 (= res!957504 (validKeyInArray!0 (select (arr!46863 a!2831) i!982)))))

(declare-fun b!1422071 () Bool)

(declare-fun res!957510 () Bool)

(assert (=> b!1422071 (=> (not res!957510) (not e!803978))))

(assert (=> b!1422071 (= res!957510 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46863 a!2831) j!81) a!2831 mask!2608) lt!626516))))

(declare-fun b!1422072 () Bool)

(declare-fun res!957509 () Bool)

(assert (=> b!1422072 (=> (not res!957509) (not e!803975))))

(declare-datatypes ((List!33373 0))(
  ( (Nil!33370) (Cons!33369 (h!34671 (_ BitVec 64)) (t!48067 List!33373)) )
))
(declare-fun arrayNoDuplicates!0 (array!97091 (_ BitVec 32) List!33373) Bool)

(assert (=> b!1422072 (= res!957509 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33370))))

(declare-fun b!1422073 () Bool)

(assert (=> b!1422073 (= e!803976 true)))

(declare-fun lt!626511 () SeekEntryResult!11148)

(assert (=> b!1422073 (= lt!626511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626513 lt!626515 lt!626517 mask!2608))))

(declare-fun b!1422074 () Bool)

(assert (=> b!1422074 (= e!803981 e!803976)))

(declare-fun res!957498 () Bool)

(assert (=> b!1422074 (=> res!957498 e!803976)))

(assert (=> b!1422074 (= res!957498 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626513 #b00000000000000000000000000000000) (bvsge lt!626513 (size!47413 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422074 (= lt!626513 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422075 () Bool)

(assert (=> b!1422075 (= e!803977 e!803978)))

(declare-fun res!957503 () Bool)

(assert (=> b!1422075 (=> (not res!957503) (not e!803978))))

(assert (=> b!1422075 (= res!957503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626515 mask!2608) lt!626515 lt!626517 mask!2608) lt!626512))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1422075 (= lt!626512 (Intermediate!11148 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422075 (= lt!626515 (select (store (arr!46863 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422075 (= lt!626517 (array!97092 (store (arr!46863 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47413 a!2831)))))

(declare-fun b!1422076 () Bool)

(declare-fun res!957505 () Bool)

(assert (=> b!1422076 (=> (not res!957505) (not e!803975))))

(assert (=> b!1422076 (= res!957505 (validKeyInArray!0 (select (arr!46863 a!2831) j!81)))))

(declare-fun b!1422077 () Bool)

(declare-fun res!957496 () Bool)

(assert (=> b!1422077 (=> (not res!957496) (not e!803975))))

(assert (=> b!1422077 (= res!957496 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47413 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47413 a!2831))))))

(declare-fun b!1422078 () Bool)

(declare-fun res!957499 () Bool)

(assert (=> b!1422078 (=> (not res!957499) (not e!803978))))

(assert (=> b!1422078 (= res!957499 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122726 res!957497) b!1422064))

(assert (= (and b!1422064 res!957508) b!1422070))

(assert (= (and b!1422070 res!957504) b!1422076))

(assert (= (and b!1422076 res!957505) b!1422068))

(assert (= (and b!1422068 res!957507) b!1422072))

(assert (= (and b!1422072 res!957509) b!1422077))

(assert (= (and b!1422077 res!957496) b!1422065))

(assert (= (and b!1422065 res!957511) b!1422075))

(assert (= (and b!1422075 res!957503) b!1422071))

(assert (= (and b!1422071 res!957510) b!1422063))

(assert (= (and b!1422063 res!957501) b!1422078))

(assert (= (and b!1422078 res!957499) b!1422066))

(assert (= (and b!1422066 res!957502) b!1422067))

(assert (= (and b!1422066 (not res!957506)) b!1422074))

(assert (= (and b!1422074 (not res!957498)) b!1422069))

(assert (= (and b!1422069 (not res!957500)) b!1422073))

(declare-fun m!1312611 () Bool)

(assert (=> b!1422065 m!1312611))

(assert (=> b!1422065 m!1312611))

(declare-fun m!1312613 () Bool)

(assert (=> b!1422065 m!1312613))

(assert (=> b!1422065 m!1312613))

(assert (=> b!1422065 m!1312611))

(declare-fun m!1312615 () Bool)

(assert (=> b!1422065 m!1312615))

(declare-fun m!1312617 () Bool)

(assert (=> b!1422068 m!1312617))

(assert (=> b!1422067 m!1312611))

(assert (=> b!1422067 m!1312611))

(declare-fun m!1312619 () Bool)

(assert (=> b!1422067 m!1312619))

(assert (=> b!1422069 m!1312611))

(assert (=> b!1422069 m!1312611))

(declare-fun m!1312621 () Bool)

(assert (=> b!1422069 m!1312621))

(declare-fun m!1312623 () Bool)

(assert (=> start!122726 m!1312623))

(declare-fun m!1312625 () Bool)

(assert (=> start!122726 m!1312625))

(declare-fun m!1312627 () Bool)

(assert (=> b!1422066 m!1312627))

(declare-fun m!1312629 () Bool)

(assert (=> b!1422066 m!1312629))

(declare-fun m!1312631 () Bool)

(assert (=> b!1422066 m!1312631))

(declare-fun m!1312633 () Bool)

(assert (=> b!1422066 m!1312633))

(assert (=> b!1422066 m!1312611))

(declare-fun m!1312635 () Bool)

(assert (=> b!1422066 m!1312635))

(declare-fun m!1312637 () Bool)

(assert (=> b!1422072 m!1312637))

(declare-fun m!1312639 () Bool)

(assert (=> b!1422063 m!1312639))

(declare-fun m!1312641 () Bool)

(assert (=> b!1422070 m!1312641))

(assert (=> b!1422070 m!1312641))

(declare-fun m!1312643 () Bool)

(assert (=> b!1422070 m!1312643))

(assert (=> b!1422076 m!1312611))

(assert (=> b!1422076 m!1312611))

(declare-fun m!1312645 () Bool)

(assert (=> b!1422076 m!1312645))

(declare-fun m!1312647 () Bool)

(assert (=> b!1422073 m!1312647))

(assert (=> b!1422071 m!1312611))

(assert (=> b!1422071 m!1312611))

(declare-fun m!1312649 () Bool)

(assert (=> b!1422071 m!1312649))

(declare-fun m!1312651 () Bool)

(assert (=> b!1422074 m!1312651))

(declare-fun m!1312653 () Bool)

(assert (=> b!1422075 m!1312653))

(assert (=> b!1422075 m!1312653))

(declare-fun m!1312655 () Bool)

(assert (=> b!1422075 m!1312655))

(assert (=> b!1422075 m!1312627))

(declare-fun m!1312657 () Bool)

(assert (=> b!1422075 m!1312657))

(check-sat (not b!1422075) (not b!1422074) (not b!1422067) (not b!1422065) (not b!1422066) (not b!1422063) (not start!122726) (not b!1422069) (not b!1422072) (not b!1422068) (not b!1422070) (not b!1422071) (not b!1422073) (not b!1422076))
(check-sat)
