; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122750 () Bool)

(assert start!122750)

(declare-fun res!958150 () Bool)

(declare-fun e!804233 () Bool)

(assert (=> start!122750 (=> (not res!958150) (not e!804233))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122750 (= res!958150 (validMask!0 mask!2608))))

(assert (=> start!122750 e!804233))

(assert (=> start!122750 true))

(declare-datatypes ((array!97068 0))(
  ( (array!97069 (arr!46852 (Array (_ BitVec 32) (_ BitVec 64))) (size!47404 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97068)

(declare-fun array_inv!36085 (array!97068) Bool)

(assert (=> start!122750 (array_inv!36085 a!2831)))

(declare-fun e!804232 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1422654 () Bool)

(declare-datatypes ((SeekEntryResult!11164 0))(
  ( (MissingZero!11164 (index!47048 (_ BitVec 32))) (Found!11164 (index!47049 (_ BitVec 32))) (Intermediate!11164 (undefined!11976 Bool) (index!47050 (_ BitVec 32)) (x!128683 (_ BitVec 32))) (Undefined!11164) (MissingVacant!11164 (index!47051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97068 (_ BitVec 32)) SeekEntryResult!11164)

(assert (=> b!1422654 (= e!804232 (= (seekEntryOrOpen!0 (select (arr!46852 a!2831) j!81) a!2831 mask!2608) (Found!11164 j!81)))))

(declare-fun b!1422655 () Bool)

(declare-fun res!958141 () Bool)

(declare-fun e!804231 () Bool)

(assert (=> b!1422655 (=> res!958141 e!804231)))

(declare-fun lt!626618 () (_ BitVec 32))

(declare-fun lt!626621 () SeekEntryResult!11164)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97068 (_ BitVec 32)) SeekEntryResult!11164)

(assert (=> b!1422655 (= res!958141 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626618 (select (arr!46852 a!2831) j!81) a!2831 mask!2608) lt!626621)))))

(declare-fun b!1422656 () Bool)

(declare-fun res!958140 () Bool)

(declare-fun e!804236 () Bool)

(assert (=> b!1422656 (=> (not res!958140) (not e!804236))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422656 (= res!958140 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46852 a!2831) j!81) a!2831 mask!2608) lt!626621))))

(declare-fun b!1422657 () Bool)

(declare-fun res!958139 () Bool)

(assert (=> b!1422657 (=> (not res!958139) (not e!804233))))

(declare-datatypes ((List!33440 0))(
  ( (Nil!33437) (Cons!33436 (h!34738 (_ BitVec 64)) (t!48126 List!33440)) )
))
(declare-fun arrayNoDuplicates!0 (array!97068 (_ BitVec 32) List!33440) Bool)

(assert (=> b!1422657 (= res!958139 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33437))))

(declare-fun b!1422658 () Bool)

(declare-fun res!958145 () Bool)

(assert (=> b!1422658 (=> (not res!958145) (not e!804233))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422658 (= res!958145 (validKeyInArray!0 (select (arr!46852 a!2831) i!982)))))

(declare-fun b!1422659 () Bool)

(declare-fun res!958153 () Bool)

(assert (=> b!1422659 (=> (not res!958153) (not e!804236))))

(declare-fun lt!626620 () SeekEntryResult!11164)

(declare-fun lt!626616 () array!97068)

(declare-fun lt!626617 () (_ BitVec 64))

(assert (=> b!1422659 (= res!958153 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626617 lt!626616 mask!2608) lt!626620))))

(declare-fun b!1422660 () Bool)

(declare-fun res!958147 () Bool)

(assert (=> b!1422660 (=> (not res!958147) (not e!804233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97068 (_ BitVec 32)) Bool)

(assert (=> b!1422660 (= res!958147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422661 () Bool)

(declare-fun e!804230 () Bool)

(assert (=> b!1422661 (= e!804230 e!804231)))

(declare-fun res!958138 () Bool)

(assert (=> b!1422661 (=> res!958138 e!804231)))

(assert (=> b!1422661 (= res!958138 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626618 #b00000000000000000000000000000000) (bvsge lt!626618 (size!47404 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422661 (= lt!626618 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422662 () Bool)

(declare-fun e!804235 () Bool)

(assert (=> b!1422662 (= e!804235 e!804236)))

(declare-fun res!958148 () Bool)

(assert (=> b!1422662 (=> (not res!958148) (not e!804236))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422662 (= res!958148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626617 mask!2608) lt!626617 lt!626616 mask!2608) lt!626620))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422662 (= lt!626620 (Intermediate!11164 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422662 (= lt!626617 (select (store (arr!46852 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422662 (= lt!626616 (array!97069 (store (arr!46852 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47404 a!2831)))))

(declare-fun b!1422663 () Bool)

(assert (=> b!1422663 (= e!804236 (not e!804230))))

(declare-fun res!958152 () Bool)

(assert (=> b!1422663 (=> res!958152 e!804230)))

(assert (=> b!1422663 (= res!958152 (or (= (select (arr!46852 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46852 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46852 a!2831) index!585) (select (arr!46852 a!2831) j!81)) (= (select (store (arr!46852 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422663 e!804232))

(declare-fun res!958149 () Bool)

(assert (=> b!1422663 (=> (not res!958149) (not e!804232))))

(assert (=> b!1422663 (= res!958149 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48003 0))(
  ( (Unit!48004) )
))
(declare-fun lt!626619 () Unit!48003)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48003)

(assert (=> b!1422663 (= lt!626619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422664 () Bool)

(assert (=> b!1422664 (= e!804231 true)))

(declare-fun lt!626615 () SeekEntryResult!11164)

(assert (=> b!1422664 (= lt!626615 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626618 lt!626617 lt!626616 mask!2608))))

(declare-fun b!1422665 () Bool)

(declare-fun res!958143 () Bool)

(assert (=> b!1422665 (=> (not res!958143) (not e!804233))))

(assert (=> b!1422665 (= res!958143 (validKeyInArray!0 (select (arr!46852 a!2831) j!81)))))

(declare-fun b!1422666 () Bool)

(assert (=> b!1422666 (= e!804233 e!804235)))

(declare-fun res!958142 () Bool)

(assert (=> b!1422666 (=> (not res!958142) (not e!804235))))

(assert (=> b!1422666 (= res!958142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46852 a!2831) j!81) mask!2608) (select (arr!46852 a!2831) j!81) a!2831 mask!2608) lt!626621))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422666 (= lt!626621 (Intermediate!11164 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422667 () Bool)

(declare-fun res!958151 () Bool)

(assert (=> b!1422667 (=> (not res!958151) (not e!804236))))

(assert (=> b!1422667 (= res!958151 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422668 () Bool)

(declare-fun res!958146 () Bool)

(assert (=> b!1422668 (=> (not res!958146) (not e!804233))))

(assert (=> b!1422668 (= res!958146 (and (= (size!47404 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47404 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47404 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422669 () Bool)

(declare-fun res!958144 () Bool)

(assert (=> b!1422669 (=> (not res!958144) (not e!804233))))

(assert (=> b!1422669 (= res!958144 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47404 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47404 a!2831))))))

(assert (= (and start!122750 res!958150) b!1422668))

(assert (= (and b!1422668 res!958146) b!1422658))

(assert (= (and b!1422658 res!958145) b!1422665))

(assert (= (and b!1422665 res!958143) b!1422660))

(assert (= (and b!1422660 res!958147) b!1422657))

(assert (= (and b!1422657 res!958139) b!1422669))

(assert (= (and b!1422669 res!958144) b!1422666))

(assert (= (and b!1422666 res!958142) b!1422662))

(assert (= (and b!1422662 res!958148) b!1422656))

(assert (= (and b!1422656 res!958140) b!1422659))

(assert (= (and b!1422659 res!958153) b!1422667))

(assert (= (and b!1422667 res!958151) b!1422663))

(assert (= (and b!1422663 res!958149) b!1422654))

(assert (= (and b!1422663 (not res!958152)) b!1422661))

(assert (= (and b!1422661 (not res!958138)) b!1422655))

(assert (= (and b!1422655 (not res!958141)) b!1422664))

(declare-fun m!1312731 () Bool)

(assert (=> b!1422656 m!1312731))

(assert (=> b!1422656 m!1312731))

(declare-fun m!1312733 () Bool)

(assert (=> b!1422656 m!1312733))

(declare-fun m!1312735 () Bool)

(assert (=> b!1422662 m!1312735))

(assert (=> b!1422662 m!1312735))

(declare-fun m!1312737 () Bool)

(assert (=> b!1422662 m!1312737))

(declare-fun m!1312739 () Bool)

(assert (=> b!1422662 m!1312739))

(declare-fun m!1312741 () Bool)

(assert (=> b!1422662 m!1312741))

(assert (=> b!1422654 m!1312731))

(assert (=> b!1422654 m!1312731))

(declare-fun m!1312743 () Bool)

(assert (=> b!1422654 m!1312743))

(assert (=> b!1422665 m!1312731))

(assert (=> b!1422665 m!1312731))

(declare-fun m!1312745 () Bool)

(assert (=> b!1422665 m!1312745))

(declare-fun m!1312747 () Bool)

(assert (=> b!1422661 m!1312747))

(assert (=> b!1422655 m!1312731))

(assert (=> b!1422655 m!1312731))

(declare-fun m!1312749 () Bool)

(assert (=> b!1422655 m!1312749))

(assert (=> b!1422666 m!1312731))

(assert (=> b!1422666 m!1312731))

(declare-fun m!1312751 () Bool)

(assert (=> b!1422666 m!1312751))

(assert (=> b!1422666 m!1312751))

(assert (=> b!1422666 m!1312731))

(declare-fun m!1312753 () Bool)

(assert (=> b!1422666 m!1312753))

(declare-fun m!1312755 () Bool)

(assert (=> b!1422664 m!1312755))

(declare-fun m!1312757 () Bool)

(assert (=> b!1422658 m!1312757))

(assert (=> b!1422658 m!1312757))

(declare-fun m!1312759 () Bool)

(assert (=> b!1422658 m!1312759))

(assert (=> b!1422663 m!1312739))

(declare-fun m!1312761 () Bool)

(assert (=> b!1422663 m!1312761))

(declare-fun m!1312763 () Bool)

(assert (=> b!1422663 m!1312763))

(declare-fun m!1312765 () Bool)

(assert (=> b!1422663 m!1312765))

(assert (=> b!1422663 m!1312731))

(declare-fun m!1312767 () Bool)

(assert (=> b!1422663 m!1312767))

(declare-fun m!1312769 () Bool)

(assert (=> start!122750 m!1312769))

(declare-fun m!1312771 () Bool)

(assert (=> start!122750 m!1312771))

(declare-fun m!1312773 () Bool)

(assert (=> b!1422659 m!1312773))

(declare-fun m!1312775 () Bool)

(assert (=> b!1422660 m!1312775))

(declare-fun m!1312777 () Bool)

(assert (=> b!1422657 m!1312777))

(check-sat (not b!1422666) (not b!1422661) (not b!1422656) (not b!1422657) (not b!1422663) (not b!1422665) (not b!1422658) (not b!1422660) (not b!1422654) (not b!1422662) (not start!122750) (not b!1422664) (not b!1422659) (not b!1422655))
(check-sat)
