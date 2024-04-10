; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122770 () Bool)

(assert start!122770)

(declare-fun b!1423119 () Bool)

(declare-fun res!958559 () Bool)

(declare-fun e!804438 () Bool)

(assert (=> b!1423119 (=> (not res!958559) (not e!804438))))

(declare-datatypes ((array!97135 0))(
  ( (array!97136 (arr!46885 (Array (_ BitVec 32) (_ BitVec 64))) (size!47435 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97135)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423119 (= res!958559 (validKeyInArray!0 (select (arr!46885 a!2831) j!81)))))

(declare-fun b!1423120 () Bool)

(declare-fun e!804443 () Bool)

(assert (=> b!1423120 (= e!804438 e!804443)))

(declare-fun res!958554 () Bool)

(assert (=> b!1423120 (=> (not res!958554) (not e!804443))))

(declare-datatypes ((SeekEntryResult!11170 0))(
  ( (MissingZero!11170 (index!47072 (_ BitVec 32))) (Found!11170 (index!47073 (_ BitVec 32))) (Intermediate!11170 (undefined!11982 Bool) (index!47074 (_ BitVec 32)) (x!128708 (_ BitVec 32))) (Undefined!11170) (MissingVacant!11170 (index!47075 (_ BitVec 32))) )
))
(declare-fun lt!626977 () SeekEntryResult!11170)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97135 (_ BitVec 32)) SeekEntryResult!11170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423120 (= res!958554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46885 a!2831) j!81) mask!2608) (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!626977))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1423120 (= lt!626977 (Intermediate!11170 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423121 () Bool)

(declare-fun e!804437 () Bool)

(declare-fun e!804441 () Bool)

(assert (=> b!1423121 (= e!804437 e!804441)))

(declare-fun res!958558 () Bool)

(assert (=> b!1423121 (=> res!958558 e!804441)))

(declare-fun lt!626978 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1423121 (= res!958558 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626978 #b00000000000000000000000000000000) (bvsge lt!626978 (size!47435 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423121 (= lt!626978 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423122 () Bool)

(declare-fun res!958555 () Bool)

(assert (=> b!1423122 (=> (not res!958555) (not e!804438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97135 (_ BitVec 32)) Bool)

(assert (=> b!1423122 (= res!958555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423123 () Bool)

(declare-fun e!804439 () Bool)

(assert (=> b!1423123 (= e!804439 (not e!804437))))

(declare-fun res!958553 () Bool)

(assert (=> b!1423123 (=> res!958553 e!804437)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423123 (= res!958553 (or (= (select (arr!46885 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46885 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46885 a!2831) index!585) (select (arr!46885 a!2831) j!81)) (= (select (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804442 () Bool)

(assert (=> b!1423123 e!804442))

(declare-fun res!958556 () Bool)

(assert (=> b!1423123 (=> (not res!958556) (not e!804442))))

(assert (=> b!1423123 (= res!958556 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48176 0))(
  ( (Unit!48177) )
))
(declare-fun lt!626979 () Unit!48176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48176)

(assert (=> b!1423123 (= lt!626979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423124 () Bool)

(declare-fun res!958566 () Bool)

(assert (=> b!1423124 (=> (not res!958566) (not e!804438))))

(assert (=> b!1423124 (= res!958566 (validKeyInArray!0 (select (arr!46885 a!2831) i!982)))))

(declare-fun b!1423125 () Bool)

(declare-fun res!958552 () Bool)

(assert (=> b!1423125 (=> (not res!958552) (not e!804438))))

(assert (=> b!1423125 (= res!958552 (and (= (size!47435 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47435 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47435 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423126 () Bool)

(assert (=> b!1423126 (= e!804443 e!804439)))

(declare-fun res!958560 () Bool)

(assert (=> b!1423126 (=> (not res!958560) (not e!804439))))

(declare-fun lt!626974 () array!97135)

(declare-fun lt!626973 () SeekEntryResult!11170)

(declare-fun lt!626975 () (_ BitVec 64))

(assert (=> b!1423126 (= res!958560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626975 mask!2608) lt!626975 lt!626974 mask!2608) lt!626973))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423126 (= lt!626973 (Intermediate!11170 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423126 (= lt!626975 (select (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423126 (= lt!626974 (array!97136 (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47435 a!2831)))))

(declare-fun b!1423127 () Bool)

(declare-fun res!958557 () Bool)

(assert (=> b!1423127 (=> (not res!958557) (not e!804438))))

(declare-datatypes ((List!33395 0))(
  ( (Nil!33392) (Cons!33391 (h!34693 (_ BitVec 64)) (t!48089 List!33395)) )
))
(declare-fun arrayNoDuplicates!0 (array!97135 (_ BitVec 32) List!33395) Bool)

(assert (=> b!1423127 (= res!958557 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33392))))

(declare-fun b!1423129 () Bool)

(declare-fun res!958567 () Bool)

(assert (=> b!1423129 (=> (not res!958567) (not e!804439))))

(assert (=> b!1423129 (= res!958567 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626975 lt!626974 mask!2608) lt!626973))))

(declare-fun b!1423130 () Bool)

(declare-fun res!958565 () Bool)

(assert (=> b!1423130 (=> (not res!958565) (not e!804439))))

(assert (=> b!1423130 (= res!958565 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423131 () Bool)

(declare-fun res!958563 () Bool)

(assert (=> b!1423131 (=> res!958563 e!804441)))

(assert (=> b!1423131 (= res!958563 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626978 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!626977)))))

(declare-fun res!958561 () Bool)

(assert (=> start!122770 (=> (not res!958561) (not e!804438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122770 (= res!958561 (validMask!0 mask!2608))))

(assert (=> start!122770 e!804438))

(assert (=> start!122770 true))

(declare-fun array_inv!35913 (array!97135) Bool)

(assert (=> start!122770 (array_inv!35913 a!2831)))

(declare-fun b!1423128 () Bool)

(declare-fun res!958564 () Bool)

(assert (=> b!1423128 (=> (not res!958564) (not e!804438))))

(assert (=> b!1423128 (= res!958564 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47435 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47435 a!2831))))))

(declare-fun b!1423132 () Bool)

(declare-fun res!958562 () Bool)

(assert (=> b!1423132 (=> (not res!958562) (not e!804439))))

(assert (=> b!1423132 (= res!958562 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!626977))))

(declare-fun b!1423133 () Bool)

(assert (=> b!1423133 (= e!804441 true)))

(declare-fun lt!626976 () SeekEntryResult!11170)

(assert (=> b!1423133 (= lt!626976 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626978 lt!626975 lt!626974 mask!2608))))

(declare-fun b!1423134 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97135 (_ BitVec 32)) SeekEntryResult!11170)

(assert (=> b!1423134 (= e!804442 (= (seekEntryOrOpen!0 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) (Found!11170 j!81)))))

(assert (= (and start!122770 res!958561) b!1423125))

(assert (= (and b!1423125 res!958552) b!1423124))

(assert (= (and b!1423124 res!958566) b!1423119))

(assert (= (and b!1423119 res!958559) b!1423122))

(assert (= (and b!1423122 res!958555) b!1423127))

(assert (= (and b!1423127 res!958557) b!1423128))

(assert (= (and b!1423128 res!958564) b!1423120))

(assert (= (and b!1423120 res!958554) b!1423126))

(assert (= (and b!1423126 res!958560) b!1423132))

(assert (= (and b!1423132 res!958562) b!1423129))

(assert (= (and b!1423129 res!958567) b!1423130))

(assert (= (and b!1423130 res!958565) b!1423123))

(assert (= (and b!1423123 res!958556) b!1423134))

(assert (= (and b!1423123 (not res!958553)) b!1423121))

(assert (= (and b!1423121 (not res!958558)) b!1423131))

(assert (= (and b!1423131 (not res!958563)) b!1423133))

(declare-fun m!1313667 () Bool)

(assert (=> b!1423121 m!1313667))

(declare-fun m!1313669 () Bool)

(assert (=> start!122770 m!1313669))

(declare-fun m!1313671 () Bool)

(assert (=> start!122770 m!1313671))

(declare-fun m!1313673 () Bool)

(assert (=> b!1423126 m!1313673))

(assert (=> b!1423126 m!1313673))

(declare-fun m!1313675 () Bool)

(assert (=> b!1423126 m!1313675))

(declare-fun m!1313677 () Bool)

(assert (=> b!1423126 m!1313677))

(declare-fun m!1313679 () Bool)

(assert (=> b!1423126 m!1313679))

(declare-fun m!1313681 () Bool)

(assert (=> b!1423134 m!1313681))

(assert (=> b!1423134 m!1313681))

(declare-fun m!1313683 () Bool)

(assert (=> b!1423134 m!1313683))

(assert (=> b!1423132 m!1313681))

(assert (=> b!1423132 m!1313681))

(declare-fun m!1313685 () Bool)

(assert (=> b!1423132 m!1313685))

(declare-fun m!1313687 () Bool)

(assert (=> b!1423124 m!1313687))

(assert (=> b!1423124 m!1313687))

(declare-fun m!1313689 () Bool)

(assert (=> b!1423124 m!1313689))

(declare-fun m!1313691 () Bool)

(assert (=> b!1423129 m!1313691))

(assert (=> b!1423131 m!1313681))

(assert (=> b!1423131 m!1313681))

(declare-fun m!1313693 () Bool)

(assert (=> b!1423131 m!1313693))

(declare-fun m!1313695 () Bool)

(assert (=> b!1423133 m!1313695))

(declare-fun m!1313697 () Bool)

(assert (=> b!1423122 m!1313697))

(assert (=> b!1423120 m!1313681))

(assert (=> b!1423120 m!1313681))

(declare-fun m!1313699 () Bool)

(assert (=> b!1423120 m!1313699))

(assert (=> b!1423120 m!1313699))

(assert (=> b!1423120 m!1313681))

(declare-fun m!1313701 () Bool)

(assert (=> b!1423120 m!1313701))

(assert (=> b!1423119 m!1313681))

(assert (=> b!1423119 m!1313681))

(declare-fun m!1313703 () Bool)

(assert (=> b!1423119 m!1313703))

(assert (=> b!1423123 m!1313677))

(declare-fun m!1313705 () Bool)

(assert (=> b!1423123 m!1313705))

(declare-fun m!1313707 () Bool)

(assert (=> b!1423123 m!1313707))

(declare-fun m!1313709 () Bool)

(assert (=> b!1423123 m!1313709))

(assert (=> b!1423123 m!1313681))

(declare-fun m!1313711 () Bool)

(assert (=> b!1423123 m!1313711))

(declare-fun m!1313713 () Bool)

(assert (=> b!1423127 m!1313713))

(push 1)

