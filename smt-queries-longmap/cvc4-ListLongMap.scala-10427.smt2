; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122728 () Bool)

(assert start!122728)

(declare-fun b!1422111 () Bool)

(declare-fun res!957553 () Bool)

(declare-fun e!803996 () Bool)

(assert (=> b!1422111 (=> (not res!957553) (not e!803996))))

(declare-datatypes ((array!97093 0))(
  ( (array!97094 (arr!46864 (Array (_ BitVec 32) (_ BitVec 64))) (size!47414 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97093)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422111 (= res!957553 (validKeyInArray!0 (select (arr!46864 a!2831) j!81)))))

(declare-fun b!1422112 () Bool)

(declare-fun e!804002 () Bool)

(assert (=> b!1422112 (= e!804002 true)))

(declare-datatypes ((SeekEntryResult!11149 0))(
  ( (MissingZero!11149 (index!46988 (_ BitVec 32))) (Found!11149 (index!46989 (_ BitVec 32))) (Intermediate!11149 (undefined!11961 Bool) (index!46990 (_ BitVec 32)) (x!128631 (_ BitVec 32))) (Undefined!11149) (MissingVacant!11149 (index!46991 (_ BitVec 32))) )
))
(declare-fun lt!626534 () SeekEntryResult!11149)

(declare-fun lt!626535 () (_ BitVec 32))

(declare-fun lt!626538 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626532 () array!97093)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97093 (_ BitVec 32)) SeekEntryResult!11149)

(assert (=> b!1422112 (= lt!626534 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626535 lt!626538 lt!626532 mask!2608))))

(declare-fun b!1422113 () Bool)

(declare-fun e!803997 () Bool)

(assert (=> b!1422113 (= e!803996 e!803997)))

(declare-fun res!957547 () Bool)

(assert (=> b!1422113 (=> (not res!957547) (not e!803997))))

(declare-fun lt!626533 () SeekEntryResult!11149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422113 (= res!957547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46864 a!2831) j!81) mask!2608) (select (arr!46864 a!2831) j!81) a!2831 mask!2608) lt!626533))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422113 (= lt!626533 (Intermediate!11149 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422114 () Bool)

(declare-fun res!957544 () Bool)

(declare-fun e!804001 () Bool)

(assert (=> b!1422114 (=> (not res!957544) (not e!804001))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422114 (= res!957544 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422115 () Bool)

(declare-fun e!803998 () Bool)

(assert (=> b!1422115 (= e!804001 (not e!803998))))

(declare-fun res!957551 () Bool)

(assert (=> b!1422115 (=> res!957551 e!803998)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422115 (= res!957551 (or (= (select (arr!46864 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46864 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46864 a!2831) index!585) (select (arr!46864 a!2831) j!81)) (= (select (store (arr!46864 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804000 () Bool)

(assert (=> b!1422115 e!804000))

(declare-fun res!957550 () Bool)

(assert (=> b!1422115 (=> (not res!957550) (not e!804000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97093 (_ BitVec 32)) Bool)

(assert (=> b!1422115 (= res!957550 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48134 0))(
  ( (Unit!48135) )
))
(declare-fun lt!626537 () Unit!48134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48134)

(assert (=> b!1422115 (= lt!626537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422116 () Bool)

(declare-fun res!957556 () Bool)

(assert (=> b!1422116 (=> res!957556 e!804002)))

(assert (=> b!1422116 (= res!957556 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626535 (select (arr!46864 a!2831) j!81) a!2831 mask!2608) lt!626533)))))

(declare-fun b!1422117 () Bool)

(assert (=> b!1422117 (= e!803997 e!804001)))

(declare-fun res!957546 () Bool)

(assert (=> b!1422117 (=> (not res!957546) (not e!804001))))

(declare-fun lt!626536 () SeekEntryResult!11149)

(assert (=> b!1422117 (= res!957546 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626538 mask!2608) lt!626538 lt!626532 mask!2608) lt!626536))))

(assert (=> b!1422117 (= lt!626536 (Intermediate!11149 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422117 (= lt!626538 (select (store (arr!46864 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422117 (= lt!626532 (array!97094 (store (arr!46864 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47414 a!2831)))))

(declare-fun b!1422118 () Bool)

(declare-fun res!957554 () Bool)

(assert (=> b!1422118 (=> (not res!957554) (not e!803996))))

(assert (=> b!1422118 (= res!957554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422120 () Bool)

(assert (=> b!1422120 (= e!803998 e!804002)))

(declare-fun res!957558 () Bool)

(assert (=> b!1422120 (=> res!957558 e!804002)))

(assert (=> b!1422120 (= res!957558 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626535 #b00000000000000000000000000000000) (bvsge lt!626535 (size!47414 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422120 (= lt!626535 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422121 () Bool)

(declare-fun res!957559 () Bool)

(assert (=> b!1422121 (=> (not res!957559) (not e!804001))))

(assert (=> b!1422121 (= res!957559 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626538 lt!626532 mask!2608) lt!626536))))

(declare-fun b!1422122 () Bool)

(declare-fun res!957555 () Bool)

(assert (=> b!1422122 (=> (not res!957555) (not e!803996))))

(assert (=> b!1422122 (= res!957555 (and (= (size!47414 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47414 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47414 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422123 () Bool)

(declare-fun res!957545 () Bool)

(assert (=> b!1422123 (=> (not res!957545) (not e!803996))))

(assert (=> b!1422123 (= res!957545 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47414 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47414 a!2831))))))

(declare-fun b!1422124 () Bool)

(declare-fun res!957549 () Bool)

(assert (=> b!1422124 (=> (not res!957549) (not e!803996))))

(assert (=> b!1422124 (= res!957549 (validKeyInArray!0 (select (arr!46864 a!2831) i!982)))))

(declare-fun b!1422125 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97093 (_ BitVec 32)) SeekEntryResult!11149)

(assert (=> b!1422125 (= e!804000 (= (seekEntryOrOpen!0 (select (arr!46864 a!2831) j!81) a!2831 mask!2608) (Found!11149 j!81)))))

(declare-fun b!1422126 () Bool)

(declare-fun res!957552 () Bool)

(assert (=> b!1422126 (=> (not res!957552) (not e!804001))))

(assert (=> b!1422126 (= res!957552 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46864 a!2831) j!81) a!2831 mask!2608) lt!626533))))

(declare-fun b!1422119 () Bool)

(declare-fun res!957557 () Bool)

(assert (=> b!1422119 (=> (not res!957557) (not e!803996))))

(declare-datatypes ((List!33374 0))(
  ( (Nil!33371) (Cons!33370 (h!34672 (_ BitVec 64)) (t!48068 List!33374)) )
))
(declare-fun arrayNoDuplicates!0 (array!97093 (_ BitVec 32) List!33374) Bool)

(assert (=> b!1422119 (= res!957557 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33371))))

(declare-fun res!957548 () Bool)

(assert (=> start!122728 (=> (not res!957548) (not e!803996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122728 (= res!957548 (validMask!0 mask!2608))))

(assert (=> start!122728 e!803996))

(assert (=> start!122728 true))

(declare-fun array_inv!35892 (array!97093) Bool)

(assert (=> start!122728 (array_inv!35892 a!2831)))

(assert (= (and start!122728 res!957548) b!1422122))

(assert (= (and b!1422122 res!957555) b!1422124))

(assert (= (and b!1422124 res!957549) b!1422111))

(assert (= (and b!1422111 res!957553) b!1422118))

(assert (= (and b!1422118 res!957554) b!1422119))

(assert (= (and b!1422119 res!957557) b!1422123))

(assert (= (and b!1422123 res!957545) b!1422113))

(assert (= (and b!1422113 res!957547) b!1422117))

(assert (= (and b!1422117 res!957546) b!1422126))

(assert (= (and b!1422126 res!957552) b!1422121))

(assert (= (and b!1422121 res!957559) b!1422114))

(assert (= (and b!1422114 res!957544) b!1422115))

(assert (= (and b!1422115 res!957550) b!1422125))

(assert (= (and b!1422115 (not res!957551)) b!1422120))

(assert (= (and b!1422120 (not res!957558)) b!1422116))

(assert (= (and b!1422116 (not res!957556)) b!1422112))

(declare-fun m!1312659 () Bool)

(assert (=> b!1422121 m!1312659))

(declare-fun m!1312661 () Bool)

(assert (=> b!1422117 m!1312661))

(assert (=> b!1422117 m!1312661))

(declare-fun m!1312663 () Bool)

(assert (=> b!1422117 m!1312663))

(declare-fun m!1312665 () Bool)

(assert (=> b!1422117 m!1312665))

(declare-fun m!1312667 () Bool)

(assert (=> b!1422117 m!1312667))

(declare-fun m!1312669 () Bool)

(assert (=> b!1422126 m!1312669))

(assert (=> b!1422126 m!1312669))

(declare-fun m!1312671 () Bool)

(assert (=> b!1422126 m!1312671))

(assert (=> b!1422113 m!1312669))

(assert (=> b!1422113 m!1312669))

(declare-fun m!1312673 () Bool)

(assert (=> b!1422113 m!1312673))

(assert (=> b!1422113 m!1312673))

(assert (=> b!1422113 m!1312669))

(declare-fun m!1312675 () Bool)

(assert (=> b!1422113 m!1312675))

(declare-fun m!1312677 () Bool)

(assert (=> start!122728 m!1312677))

(declare-fun m!1312679 () Bool)

(assert (=> start!122728 m!1312679))

(assert (=> b!1422116 m!1312669))

(assert (=> b!1422116 m!1312669))

(declare-fun m!1312681 () Bool)

(assert (=> b!1422116 m!1312681))

(assert (=> b!1422115 m!1312665))

(declare-fun m!1312683 () Bool)

(assert (=> b!1422115 m!1312683))

(declare-fun m!1312685 () Bool)

(assert (=> b!1422115 m!1312685))

(declare-fun m!1312687 () Bool)

(assert (=> b!1422115 m!1312687))

(assert (=> b!1422115 m!1312669))

(declare-fun m!1312689 () Bool)

(assert (=> b!1422115 m!1312689))

(assert (=> b!1422125 m!1312669))

(assert (=> b!1422125 m!1312669))

(declare-fun m!1312691 () Bool)

(assert (=> b!1422125 m!1312691))

(declare-fun m!1312693 () Bool)

(assert (=> b!1422118 m!1312693))

(declare-fun m!1312695 () Bool)

(assert (=> b!1422112 m!1312695))

(declare-fun m!1312697 () Bool)

(assert (=> b!1422119 m!1312697))

(declare-fun m!1312699 () Bool)

(assert (=> b!1422124 m!1312699))

(assert (=> b!1422124 m!1312699))

(declare-fun m!1312701 () Bool)

(assert (=> b!1422124 m!1312701))

(declare-fun m!1312703 () Bool)

(assert (=> b!1422120 m!1312703))

(assert (=> b!1422111 m!1312669))

(assert (=> b!1422111 m!1312669))

(declare-fun m!1312705 () Bool)

(assert (=> b!1422111 m!1312705))

(push 1)

