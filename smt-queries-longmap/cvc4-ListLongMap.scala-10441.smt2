; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122812 () Bool)

(assert start!122812)

(declare-fun b!1424127 () Bool)

(declare-fun res!959571 () Bool)

(declare-fun e!804882 () Bool)

(assert (=> b!1424127 (=> (not res!959571) (not e!804882))))

(declare-datatypes ((array!97177 0))(
  ( (array!97178 (arr!46906 (Array (_ BitVec 32) (_ BitVec 64))) (size!47456 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97177)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424127 (= res!959571 (validKeyInArray!0 (select (arr!46906 a!2831) j!81)))))

(declare-fun b!1424128 () Bool)

(declare-fun res!959564 () Bool)

(assert (=> b!1424128 (=> (not res!959564) (not e!804882))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424128 (= res!959564 (validKeyInArray!0 (select (arr!46906 a!2831) i!982)))))

(declare-fun b!1424129 () Bool)

(declare-fun res!959572 () Bool)

(assert (=> b!1424129 (=> (not res!959572) (not e!804882))))

(declare-datatypes ((List!33416 0))(
  ( (Nil!33413) (Cons!33412 (h!34714 (_ BitVec 64)) (t!48110 List!33416)) )
))
(declare-fun arrayNoDuplicates!0 (array!97177 (_ BitVec 32) List!33416) Bool)

(assert (=> b!1424129 (= res!959572 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33413))))

(declare-fun b!1424130 () Bool)

(declare-fun res!959560 () Bool)

(declare-fun e!804879 () Bool)

(assert (=> b!1424130 (=> (not res!959560) (not e!804879))))

(declare-fun lt!627417 () array!97177)

(declare-fun lt!627415 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11191 0))(
  ( (MissingZero!11191 (index!47156 (_ BitVec 32))) (Found!11191 (index!47157 (_ BitVec 32))) (Intermediate!11191 (undefined!12003 Bool) (index!47158 (_ BitVec 32)) (x!128785 (_ BitVec 32))) (Undefined!11191) (MissingVacant!11191 (index!47159 (_ BitVec 32))) )
))
(declare-fun lt!627420 () SeekEntryResult!11191)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97177 (_ BitVec 32)) SeekEntryResult!11191)

(assert (=> b!1424130 (= res!959560 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627415 lt!627417 mask!2608) lt!627420))))

(declare-fun b!1424131 () Bool)

(declare-fun e!804878 () Bool)

(assert (=> b!1424131 (= e!804878 true)))

(declare-fun lt!627418 () SeekEntryResult!11191)

(declare-fun lt!627416 () (_ BitVec 32))

(assert (=> b!1424131 (= lt!627418 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627416 lt!627415 lt!627417 mask!2608))))

(declare-fun b!1424132 () Bool)

(declare-fun res!959574 () Bool)

(assert (=> b!1424132 (=> (not res!959574) (not e!804882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97177 (_ BitVec 32)) Bool)

(assert (=> b!1424132 (= res!959574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424133 () Bool)

(declare-fun e!804880 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97177 (_ BitVec 32)) SeekEntryResult!11191)

(assert (=> b!1424133 (= e!804880 (= (seekEntryOrOpen!0 (select (arr!46906 a!2831) j!81) a!2831 mask!2608) (Found!11191 j!81)))))

(declare-fun res!959569 () Bool)

(assert (=> start!122812 (=> (not res!959569) (not e!804882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122812 (= res!959569 (validMask!0 mask!2608))))

(assert (=> start!122812 e!804882))

(assert (=> start!122812 true))

(declare-fun array_inv!35934 (array!97177) Bool)

(assert (=> start!122812 (array_inv!35934 a!2831)))

(declare-fun b!1424134 () Bool)

(declare-fun e!804881 () Bool)

(assert (=> b!1424134 (= e!804879 (not e!804881))))

(declare-fun res!959562 () Bool)

(assert (=> b!1424134 (=> res!959562 e!804881)))

(assert (=> b!1424134 (= res!959562 (or (= (select (arr!46906 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46906 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46906 a!2831) index!585) (select (arr!46906 a!2831) j!81)) (= (select (store (arr!46906 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424134 e!804880))

(declare-fun res!959573 () Bool)

(assert (=> b!1424134 (=> (not res!959573) (not e!804880))))

(assert (=> b!1424134 (= res!959573 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48218 0))(
  ( (Unit!48219) )
))
(declare-fun lt!627414 () Unit!48218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48218)

(assert (=> b!1424134 (= lt!627414 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424135 () Bool)

(declare-fun res!959568 () Bool)

(assert (=> b!1424135 (=> (not res!959568) (not e!804882))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424135 (= res!959568 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47456 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47456 a!2831))))))

(declare-fun b!1424136 () Bool)

(declare-fun res!959566 () Bool)

(assert (=> b!1424136 (=> (not res!959566) (not e!804879))))

(declare-fun lt!627419 () SeekEntryResult!11191)

(assert (=> b!1424136 (= res!959566 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46906 a!2831) j!81) a!2831 mask!2608) lt!627419))))

(declare-fun b!1424137 () Bool)

(declare-fun res!959561 () Bool)

(assert (=> b!1424137 (=> (not res!959561) (not e!804879))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424137 (= res!959561 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424138 () Bool)

(declare-fun e!804884 () Bool)

(assert (=> b!1424138 (= e!804884 e!804879)))

(declare-fun res!959563 () Bool)

(assert (=> b!1424138 (=> (not res!959563) (not e!804879))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424138 (= res!959563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627415 mask!2608) lt!627415 lt!627417 mask!2608) lt!627420))))

(assert (=> b!1424138 (= lt!627420 (Intermediate!11191 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424138 (= lt!627415 (select (store (arr!46906 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424138 (= lt!627417 (array!97178 (store (arr!46906 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47456 a!2831)))))

(declare-fun b!1424139 () Bool)

(declare-fun res!959567 () Bool)

(assert (=> b!1424139 (=> (not res!959567) (not e!804882))))

(assert (=> b!1424139 (= res!959567 (and (= (size!47456 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47456 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47456 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424140 () Bool)

(assert (=> b!1424140 (= e!804881 e!804878)))

(declare-fun res!959565 () Bool)

(assert (=> b!1424140 (=> res!959565 e!804878)))

(assert (=> b!1424140 (= res!959565 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627416 #b00000000000000000000000000000000) (bvsge lt!627416 (size!47456 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424140 (= lt!627416 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424141 () Bool)

(declare-fun res!959575 () Bool)

(assert (=> b!1424141 (=> res!959575 e!804878)))

(assert (=> b!1424141 (= res!959575 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627416 (select (arr!46906 a!2831) j!81) a!2831 mask!2608) lt!627419)))))

(declare-fun b!1424142 () Bool)

(assert (=> b!1424142 (= e!804882 e!804884)))

(declare-fun res!959570 () Bool)

(assert (=> b!1424142 (=> (not res!959570) (not e!804884))))

(assert (=> b!1424142 (= res!959570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46906 a!2831) j!81) mask!2608) (select (arr!46906 a!2831) j!81) a!2831 mask!2608) lt!627419))))

(assert (=> b!1424142 (= lt!627419 (Intermediate!11191 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122812 res!959569) b!1424139))

(assert (= (and b!1424139 res!959567) b!1424128))

(assert (= (and b!1424128 res!959564) b!1424127))

(assert (= (and b!1424127 res!959571) b!1424132))

(assert (= (and b!1424132 res!959574) b!1424129))

(assert (= (and b!1424129 res!959572) b!1424135))

(assert (= (and b!1424135 res!959568) b!1424142))

(assert (= (and b!1424142 res!959570) b!1424138))

(assert (= (and b!1424138 res!959563) b!1424136))

(assert (= (and b!1424136 res!959566) b!1424130))

(assert (= (and b!1424130 res!959560) b!1424137))

(assert (= (and b!1424137 res!959561) b!1424134))

(assert (= (and b!1424134 res!959573) b!1424133))

(assert (= (and b!1424134 (not res!959562)) b!1424140))

(assert (= (and b!1424140 (not res!959565)) b!1424141))

(assert (= (and b!1424141 (not res!959575)) b!1424131))

(declare-fun m!1314675 () Bool)

(assert (=> b!1424130 m!1314675))

(declare-fun m!1314677 () Bool)

(assert (=> start!122812 m!1314677))

(declare-fun m!1314679 () Bool)

(assert (=> start!122812 m!1314679))

(declare-fun m!1314681 () Bool)

(assert (=> b!1424129 m!1314681))

(declare-fun m!1314683 () Bool)

(assert (=> b!1424132 m!1314683))

(declare-fun m!1314685 () Bool)

(assert (=> b!1424142 m!1314685))

(assert (=> b!1424142 m!1314685))

(declare-fun m!1314687 () Bool)

(assert (=> b!1424142 m!1314687))

(assert (=> b!1424142 m!1314687))

(assert (=> b!1424142 m!1314685))

(declare-fun m!1314689 () Bool)

(assert (=> b!1424142 m!1314689))

(assert (=> b!1424133 m!1314685))

(assert (=> b!1424133 m!1314685))

(declare-fun m!1314691 () Bool)

(assert (=> b!1424133 m!1314691))

(assert (=> b!1424136 m!1314685))

(assert (=> b!1424136 m!1314685))

(declare-fun m!1314693 () Bool)

(assert (=> b!1424136 m!1314693))

(assert (=> b!1424127 m!1314685))

(assert (=> b!1424127 m!1314685))

(declare-fun m!1314695 () Bool)

(assert (=> b!1424127 m!1314695))

(declare-fun m!1314697 () Bool)

(assert (=> b!1424134 m!1314697))

(declare-fun m!1314699 () Bool)

(assert (=> b!1424134 m!1314699))

(declare-fun m!1314701 () Bool)

(assert (=> b!1424134 m!1314701))

(declare-fun m!1314703 () Bool)

(assert (=> b!1424134 m!1314703))

(assert (=> b!1424134 m!1314685))

(declare-fun m!1314705 () Bool)

(assert (=> b!1424134 m!1314705))

(assert (=> b!1424141 m!1314685))

(assert (=> b!1424141 m!1314685))

(declare-fun m!1314707 () Bool)

(assert (=> b!1424141 m!1314707))

(declare-fun m!1314709 () Bool)

(assert (=> b!1424138 m!1314709))

(assert (=> b!1424138 m!1314709))

(declare-fun m!1314711 () Bool)

(assert (=> b!1424138 m!1314711))

(assert (=> b!1424138 m!1314697))

(declare-fun m!1314713 () Bool)

(assert (=> b!1424138 m!1314713))

(declare-fun m!1314715 () Bool)

(assert (=> b!1424131 m!1314715))

(declare-fun m!1314717 () Bool)

(assert (=> b!1424140 m!1314717))

(declare-fun m!1314719 () Bool)

(assert (=> b!1424128 m!1314719))

(assert (=> b!1424128 m!1314719))

(declare-fun m!1314721 () Bool)

(assert (=> b!1424128 m!1314721))

(push 1)

