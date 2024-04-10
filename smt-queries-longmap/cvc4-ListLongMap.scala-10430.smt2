; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122746 () Bool)

(assert start!122746)

(declare-fun e!804185 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97111 0))(
  ( (array!97112 (arr!46873 (Array (_ BitVec 32) (_ BitVec 64))) (size!47423 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97111)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1422543 () Bool)

(declare-datatypes ((SeekEntryResult!11158 0))(
  ( (MissingZero!11158 (index!47024 (_ BitVec 32))) (Found!11158 (index!47025 (_ BitVec 32))) (Intermediate!11158 (undefined!11970 Bool) (index!47026 (_ BitVec 32)) (x!128664 (_ BitVec 32))) (Undefined!11158) (MissingVacant!11158 (index!47027 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97111 (_ BitVec 32)) SeekEntryResult!11158)

(assert (=> b!1422543 (= e!804185 (= (seekEntryOrOpen!0 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) (Found!11158 j!81)))))

(declare-fun b!1422544 () Bool)

(declare-fun e!804188 () Bool)

(declare-fun e!804191 () Bool)

(assert (=> b!1422544 (= e!804188 (not e!804191))))

(declare-fun res!957979 () Bool)

(assert (=> b!1422544 (=> res!957979 e!804191)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422544 (= res!957979 (or (= (select (arr!46873 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46873 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46873 a!2831) index!585) (select (arr!46873 a!2831) j!81)) (= (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422544 e!804185))

(declare-fun res!957989 () Bool)

(assert (=> b!1422544 (=> (not res!957989) (not e!804185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97111 (_ BitVec 32)) Bool)

(assert (=> b!1422544 (= res!957989 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48152 0))(
  ( (Unit!48153) )
))
(declare-fun lt!626724 () Unit!48152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48152)

(assert (=> b!1422544 (= lt!626724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422545 () Bool)

(declare-fun res!957984 () Bool)

(assert (=> b!1422545 (=> (not res!957984) (not e!804188))))

(declare-fun lt!626721 () SeekEntryResult!11158)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97111 (_ BitVec 32)) SeekEntryResult!11158)

(assert (=> b!1422545 (= res!957984 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!626721))))

(declare-fun b!1422546 () Bool)

(declare-fun e!804189 () Bool)

(assert (=> b!1422546 (= e!804191 e!804189)))

(declare-fun res!957990 () Bool)

(assert (=> b!1422546 (=> res!957990 e!804189)))

(declare-fun lt!626725 () (_ BitVec 32))

(assert (=> b!1422546 (= res!957990 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626725 #b00000000000000000000000000000000) (bvsge lt!626725 (size!47423 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422546 (= lt!626725 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422547 () Bool)

(declare-fun res!957987 () Bool)

(assert (=> b!1422547 (=> (not res!957987) (not e!804188))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1422547 (= res!957987 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422549 () Bool)

(declare-fun res!957982 () Bool)

(declare-fun e!804190 () Bool)

(assert (=> b!1422549 (=> (not res!957982) (not e!804190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422549 (= res!957982 (validKeyInArray!0 (select (arr!46873 a!2831) j!81)))))

(declare-fun b!1422550 () Bool)

(declare-fun res!957980 () Bool)

(assert (=> b!1422550 (=> (not res!957980) (not e!804190))))

(assert (=> b!1422550 (= res!957980 (validKeyInArray!0 (select (arr!46873 a!2831) i!982)))))

(declare-fun b!1422551 () Bool)

(declare-fun e!804186 () Bool)

(assert (=> b!1422551 (= e!804190 e!804186)))

(declare-fun res!957991 () Bool)

(assert (=> b!1422551 (=> (not res!957991) (not e!804186))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422551 (= res!957991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46873 a!2831) j!81) mask!2608) (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!626721))))

(assert (=> b!1422551 (= lt!626721 (Intermediate!11158 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422552 () Bool)

(declare-fun res!957978 () Bool)

(assert (=> b!1422552 (=> res!957978 e!804189)))

(assert (=> b!1422552 (= res!957978 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626725 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!626721)))))

(declare-fun b!1422553 () Bool)

(declare-fun res!957981 () Bool)

(assert (=> b!1422553 (=> (not res!957981) (not e!804188))))

(declare-fun lt!626727 () array!97111)

(declare-fun lt!626726 () (_ BitVec 64))

(declare-fun lt!626723 () SeekEntryResult!11158)

(assert (=> b!1422553 (= res!957981 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626726 lt!626727 mask!2608) lt!626723))))

(declare-fun b!1422554 () Bool)

(assert (=> b!1422554 (= e!804189 true)))

(declare-fun lt!626722 () SeekEntryResult!11158)

(assert (=> b!1422554 (= lt!626722 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626725 lt!626726 lt!626727 mask!2608))))

(declare-fun b!1422555 () Bool)

(declare-fun res!957976 () Bool)

(assert (=> b!1422555 (=> (not res!957976) (not e!804190))))

(declare-datatypes ((List!33383 0))(
  ( (Nil!33380) (Cons!33379 (h!34681 (_ BitVec 64)) (t!48077 List!33383)) )
))
(declare-fun arrayNoDuplicates!0 (array!97111 (_ BitVec 32) List!33383) Bool)

(assert (=> b!1422555 (= res!957976 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33380))))

(declare-fun b!1422556 () Bool)

(declare-fun res!957985 () Bool)

(assert (=> b!1422556 (=> (not res!957985) (not e!804190))))

(assert (=> b!1422556 (= res!957985 (and (= (size!47423 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47423 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47423 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422557 () Bool)

(assert (=> b!1422557 (= e!804186 e!804188)))

(declare-fun res!957988 () Bool)

(assert (=> b!1422557 (=> (not res!957988) (not e!804188))))

(assert (=> b!1422557 (= res!957988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626726 mask!2608) lt!626726 lt!626727 mask!2608) lt!626723))))

(assert (=> b!1422557 (= lt!626723 (Intermediate!11158 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422557 (= lt!626726 (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422557 (= lt!626727 (array!97112 (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47423 a!2831)))))

(declare-fun b!1422558 () Bool)

(declare-fun res!957977 () Bool)

(assert (=> b!1422558 (=> (not res!957977) (not e!804190))))

(assert (=> b!1422558 (= res!957977 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47423 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47423 a!2831))))))

(declare-fun b!1422548 () Bool)

(declare-fun res!957986 () Bool)

(assert (=> b!1422548 (=> (not res!957986) (not e!804190))))

(assert (=> b!1422548 (= res!957986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!957983 () Bool)

(assert (=> start!122746 (=> (not res!957983) (not e!804190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122746 (= res!957983 (validMask!0 mask!2608))))

(assert (=> start!122746 e!804190))

(assert (=> start!122746 true))

(declare-fun array_inv!35901 (array!97111) Bool)

(assert (=> start!122746 (array_inv!35901 a!2831)))

(assert (= (and start!122746 res!957983) b!1422556))

(assert (= (and b!1422556 res!957985) b!1422550))

(assert (= (and b!1422550 res!957980) b!1422549))

(assert (= (and b!1422549 res!957982) b!1422548))

(assert (= (and b!1422548 res!957986) b!1422555))

(assert (= (and b!1422555 res!957976) b!1422558))

(assert (= (and b!1422558 res!957977) b!1422551))

(assert (= (and b!1422551 res!957991) b!1422557))

(assert (= (and b!1422557 res!957988) b!1422545))

(assert (= (and b!1422545 res!957984) b!1422553))

(assert (= (and b!1422553 res!957981) b!1422547))

(assert (= (and b!1422547 res!957987) b!1422544))

(assert (= (and b!1422544 res!957989) b!1422543))

(assert (= (and b!1422544 (not res!957979)) b!1422546))

(assert (= (and b!1422546 (not res!957990)) b!1422552))

(assert (= (and b!1422552 (not res!957978)) b!1422554))

(declare-fun m!1313091 () Bool)

(assert (=> b!1422555 m!1313091))

(declare-fun m!1313093 () Bool)

(assert (=> start!122746 m!1313093))

(declare-fun m!1313095 () Bool)

(assert (=> start!122746 m!1313095))

(declare-fun m!1313097 () Bool)

(assert (=> b!1422552 m!1313097))

(assert (=> b!1422552 m!1313097))

(declare-fun m!1313099 () Bool)

(assert (=> b!1422552 m!1313099))

(declare-fun m!1313101 () Bool)

(assert (=> b!1422554 m!1313101))

(declare-fun m!1313103 () Bool)

(assert (=> b!1422544 m!1313103))

(declare-fun m!1313105 () Bool)

(assert (=> b!1422544 m!1313105))

(declare-fun m!1313107 () Bool)

(assert (=> b!1422544 m!1313107))

(declare-fun m!1313109 () Bool)

(assert (=> b!1422544 m!1313109))

(assert (=> b!1422544 m!1313097))

(declare-fun m!1313111 () Bool)

(assert (=> b!1422544 m!1313111))

(declare-fun m!1313113 () Bool)

(assert (=> b!1422550 m!1313113))

(assert (=> b!1422550 m!1313113))

(declare-fun m!1313115 () Bool)

(assert (=> b!1422550 m!1313115))

(declare-fun m!1313117 () Bool)

(assert (=> b!1422546 m!1313117))

(declare-fun m!1313119 () Bool)

(assert (=> b!1422548 m!1313119))

(assert (=> b!1422551 m!1313097))

(assert (=> b!1422551 m!1313097))

(declare-fun m!1313121 () Bool)

(assert (=> b!1422551 m!1313121))

(assert (=> b!1422551 m!1313121))

(assert (=> b!1422551 m!1313097))

(declare-fun m!1313123 () Bool)

(assert (=> b!1422551 m!1313123))

(assert (=> b!1422549 m!1313097))

(assert (=> b!1422549 m!1313097))

(declare-fun m!1313125 () Bool)

(assert (=> b!1422549 m!1313125))

(declare-fun m!1313127 () Bool)

(assert (=> b!1422557 m!1313127))

(assert (=> b!1422557 m!1313127))

(declare-fun m!1313129 () Bool)

(assert (=> b!1422557 m!1313129))

(assert (=> b!1422557 m!1313103))

(declare-fun m!1313131 () Bool)

(assert (=> b!1422557 m!1313131))

(declare-fun m!1313133 () Bool)

(assert (=> b!1422553 m!1313133))

(assert (=> b!1422545 m!1313097))

(assert (=> b!1422545 m!1313097))

(declare-fun m!1313135 () Bool)

(assert (=> b!1422545 m!1313135))

(assert (=> b!1422543 m!1313097))

(assert (=> b!1422543 m!1313097))

(declare-fun m!1313137 () Bool)

(assert (=> b!1422543 m!1313137))

(push 1)

