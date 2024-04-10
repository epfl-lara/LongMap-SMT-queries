; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122788 () Bool)

(assert start!122788)

(declare-fun b!1423551 () Bool)

(declare-fun res!958989 () Bool)

(declare-fun e!804632 () Bool)

(assert (=> b!1423551 (=> (not res!958989) (not e!804632))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11179 0))(
  ( (MissingZero!11179 (index!47108 (_ BitVec 32))) (Found!11179 (index!47109 (_ BitVec 32))) (Intermediate!11179 (undefined!11991 Bool) (index!47110 (_ BitVec 32)) (x!128741 (_ BitVec 32))) (Undefined!11179) (MissingVacant!11179 (index!47111 (_ BitVec 32))) )
))
(declare-fun lt!627164 () SeekEntryResult!11179)

(declare-datatypes ((array!97153 0))(
  ( (array!97154 (arr!46894 (Array (_ BitVec 32) (_ BitVec 64))) (size!47444 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97153)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97153 (_ BitVec 32)) SeekEntryResult!11179)

(assert (=> b!1423551 (= res!958989 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!627164))))

(declare-fun b!1423552 () Bool)

(declare-fun res!958999 () Bool)

(declare-fun e!804629 () Bool)

(assert (=> b!1423552 (=> (not res!958999) (not e!804629))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423552 (= res!958999 (validKeyInArray!0 (select (arr!46894 a!2831) i!982)))))

(declare-fun b!1423553 () Bool)

(declare-fun res!958993 () Bool)

(assert (=> b!1423553 (=> (not res!958993) (not e!804629))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423553 (= res!958993 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47444 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47444 a!2831))))))

(declare-fun b!1423554 () Bool)

(declare-fun res!958998 () Bool)

(declare-fun e!804626 () Bool)

(assert (=> b!1423554 (=> res!958998 e!804626)))

(declare-fun lt!627167 () (_ BitVec 32))

(assert (=> b!1423554 (= res!958998 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627167 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!627164)))))

(declare-fun b!1423555 () Bool)

(declare-fun res!958994 () Bool)

(assert (=> b!1423555 (=> (not res!958994) (not e!804629))))

(declare-datatypes ((List!33404 0))(
  ( (Nil!33401) (Cons!33400 (h!34702 (_ BitVec 64)) (t!48098 List!33404)) )
))
(declare-fun arrayNoDuplicates!0 (array!97153 (_ BitVec 32) List!33404) Bool)

(assert (=> b!1423555 (= res!958994 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33401))))

(declare-fun b!1423556 () Bool)

(declare-fun e!804628 () Bool)

(assert (=> b!1423556 (= e!804632 (not e!804628))))

(declare-fun res!958986 () Bool)

(assert (=> b!1423556 (=> res!958986 e!804628)))

(assert (=> b!1423556 (= res!958986 (or (= (select (arr!46894 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46894 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46894 a!2831) index!585) (select (arr!46894 a!2831) j!81)) (= (select (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804630 () Bool)

(assert (=> b!1423556 e!804630))

(declare-fun res!958995 () Bool)

(assert (=> b!1423556 (=> (not res!958995) (not e!804630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97153 (_ BitVec 32)) Bool)

(assert (=> b!1423556 (= res!958995 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48194 0))(
  ( (Unit!48195) )
))
(declare-fun lt!627162 () Unit!48194)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48194)

(assert (=> b!1423556 (= lt!627162 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423557 () Bool)

(declare-fun res!958985 () Bool)

(assert (=> b!1423557 (=> (not res!958985) (not e!804629))))

(assert (=> b!1423557 (= res!958985 (validKeyInArray!0 (select (arr!46894 a!2831) j!81)))))

(declare-fun b!1423558 () Bool)

(declare-fun res!958996 () Bool)

(assert (=> b!1423558 (=> (not res!958996) (not e!804632))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423558 (= res!958996 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423559 () Bool)

(declare-fun res!958987 () Bool)

(assert (=> b!1423559 (=> (not res!958987) (not e!804629))))

(assert (=> b!1423559 (= res!958987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423560 () Bool)

(declare-fun e!804627 () Bool)

(assert (=> b!1423560 (= e!804627 e!804632)))

(declare-fun res!958997 () Bool)

(assert (=> b!1423560 (=> (not res!958997) (not e!804632))))

(declare-fun lt!627163 () SeekEntryResult!11179)

(declare-fun lt!627166 () array!97153)

(declare-fun lt!627165 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423560 (= res!958997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627165 mask!2608) lt!627165 lt!627166 mask!2608) lt!627163))))

(assert (=> b!1423560 (= lt!627163 (Intermediate!11179 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423560 (= lt!627165 (select (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423560 (= lt!627166 (array!97154 (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47444 a!2831)))))

(declare-fun b!1423561 () Bool)

(declare-fun res!958988 () Bool)

(assert (=> b!1423561 (=> (not res!958988) (not e!804632))))

(assert (=> b!1423561 (= res!958988 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627165 lt!627166 mask!2608) lt!627163))))

(declare-fun b!1423562 () Bool)

(declare-fun res!958984 () Bool)

(assert (=> b!1423562 (=> (not res!958984) (not e!804629))))

(assert (=> b!1423562 (= res!958984 (and (= (size!47444 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47444 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47444 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!958991 () Bool)

(assert (=> start!122788 (=> (not res!958991) (not e!804629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122788 (= res!958991 (validMask!0 mask!2608))))

(assert (=> start!122788 e!804629))

(assert (=> start!122788 true))

(declare-fun array_inv!35922 (array!97153) Bool)

(assert (=> start!122788 (array_inv!35922 a!2831)))

(declare-fun b!1423563 () Bool)

(assert (=> b!1423563 (= e!804629 e!804627)))

(declare-fun res!958990 () Bool)

(assert (=> b!1423563 (=> (not res!958990) (not e!804627))))

(assert (=> b!1423563 (= res!958990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46894 a!2831) j!81) mask!2608) (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!627164))))

(assert (=> b!1423563 (= lt!627164 (Intermediate!11179 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423564 () Bool)

(assert (=> b!1423564 (= e!804628 e!804626)))

(declare-fun res!958992 () Bool)

(assert (=> b!1423564 (=> res!958992 e!804626)))

(assert (=> b!1423564 (= res!958992 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627167 #b00000000000000000000000000000000) (bvsge lt!627167 (size!47444 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423564 (= lt!627167 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423565 () Bool)

(assert (=> b!1423565 (= e!804626 true)))

(declare-fun lt!627168 () SeekEntryResult!11179)

(assert (=> b!1423565 (= lt!627168 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627167 lt!627165 lt!627166 mask!2608))))

(declare-fun b!1423566 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97153 (_ BitVec 32)) SeekEntryResult!11179)

(assert (=> b!1423566 (= e!804630 (= (seekEntryOrOpen!0 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) (Found!11179 j!81)))))

(assert (= (and start!122788 res!958991) b!1423562))

(assert (= (and b!1423562 res!958984) b!1423552))

(assert (= (and b!1423552 res!958999) b!1423557))

(assert (= (and b!1423557 res!958985) b!1423559))

(assert (= (and b!1423559 res!958987) b!1423555))

(assert (= (and b!1423555 res!958994) b!1423553))

(assert (= (and b!1423553 res!958993) b!1423563))

(assert (= (and b!1423563 res!958990) b!1423560))

(assert (= (and b!1423560 res!958997) b!1423551))

(assert (= (and b!1423551 res!958989) b!1423561))

(assert (= (and b!1423561 res!958988) b!1423558))

(assert (= (and b!1423558 res!958996) b!1423556))

(assert (= (and b!1423556 res!958995) b!1423566))

(assert (= (and b!1423556 (not res!958986)) b!1423564))

(assert (= (and b!1423564 (not res!958992)) b!1423554))

(assert (= (and b!1423554 (not res!958998)) b!1423565))

(declare-fun m!1314099 () Bool)

(assert (=> b!1423552 m!1314099))

(assert (=> b!1423552 m!1314099))

(declare-fun m!1314101 () Bool)

(assert (=> b!1423552 m!1314101))

(declare-fun m!1314103 () Bool)

(assert (=> b!1423561 m!1314103))

(declare-fun m!1314105 () Bool)

(assert (=> b!1423554 m!1314105))

(assert (=> b!1423554 m!1314105))

(declare-fun m!1314107 () Bool)

(assert (=> b!1423554 m!1314107))

(assert (=> b!1423566 m!1314105))

(assert (=> b!1423566 m!1314105))

(declare-fun m!1314109 () Bool)

(assert (=> b!1423566 m!1314109))

(assert (=> b!1423563 m!1314105))

(assert (=> b!1423563 m!1314105))

(declare-fun m!1314111 () Bool)

(assert (=> b!1423563 m!1314111))

(assert (=> b!1423563 m!1314111))

(assert (=> b!1423563 m!1314105))

(declare-fun m!1314113 () Bool)

(assert (=> b!1423563 m!1314113))

(declare-fun m!1314115 () Bool)

(assert (=> b!1423559 m!1314115))

(declare-fun m!1314117 () Bool)

(assert (=> b!1423560 m!1314117))

(assert (=> b!1423560 m!1314117))

(declare-fun m!1314119 () Bool)

(assert (=> b!1423560 m!1314119))

(declare-fun m!1314121 () Bool)

(assert (=> b!1423560 m!1314121))

(declare-fun m!1314123 () Bool)

(assert (=> b!1423560 m!1314123))

(declare-fun m!1314125 () Bool)

(assert (=> b!1423555 m!1314125))

(declare-fun m!1314127 () Bool)

(assert (=> b!1423564 m!1314127))

(declare-fun m!1314129 () Bool)

(assert (=> b!1423565 m!1314129))

(assert (=> b!1423556 m!1314121))

(declare-fun m!1314131 () Bool)

(assert (=> b!1423556 m!1314131))

(declare-fun m!1314133 () Bool)

(assert (=> b!1423556 m!1314133))

(declare-fun m!1314135 () Bool)

(assert (=> b!1423556 m!1314135))

(assert (=> b!1423556 m!1314105))

(declare-fun m!1314137 () Bool)

(assert (=> b!1423556 m!1314137))

(declare-fun m!1314139 () Bool)

(assert (=> start!122788 m!1314139))

(declare-fun m!1314141 () Bool)

(assert (=> start!122788 m!1314141))

(assert (=> b!1423551 m!1314105))

(assert (=> b!1423551 m!1314105))

(declare-fun m!1314143 () Bool)

(assert (=> b!1423551 m!1314143))

(assert (=> b!1423557 m!1314105))

(assert (=> b!1423557 m!1314105))

(declare-fun m!1314145 () Bool)

(assert (=> b!1423557 m!1314145))

(push 1)

