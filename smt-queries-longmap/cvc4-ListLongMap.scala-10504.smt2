; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123724 () Bool)

(assert start!123724)

(declare-fun b!1434155 () Bool)

(declare-fun res!967624 () Bool)

(declare-fun e!809453 () Bool)

(assert (=> b!1434155 (=> (not res!967624) (not e!809453))))

(declare-datatypes ((array!97582 0))(
  ( (array!97583 (arr!47095 (Array (_ BitVec 32) (_ BitVec 64))) (size!47645 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97582)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434155 (= res!967624 (validKeyInArray!0 (select (arr!47095 a!2831) j!81)))))

(declare-fun b!1434156 () Bool)

(declare-fun e!809448 () Bool)

(declare-fun e!809452 () Bool)

(assert (=> b!1434156 (= e!809448 e!809452)))

(declare-fun res!967620 () Bool)

(assert (=> b!1434156 (=> (not res!967620) (not e!809452))))

(declare-fun lt!631350 () array!97582)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11374 0))(
  ( (MissingZero!11374 (index!47888 (_ BitVec 32))) (Found!11374 (index!47889 (_ BitVec 32))) (Intermediate!11374 (undefined!12186 Bool) (index!47890 (_ BitVec 32)) (x!129538 (_ BitVec 32))) (Undefined!11374) (MissingVacant!11374 (index!47891 (_ BitVec 32))) )
))
(declare-fun lt!631345 () SeekEntryResult!11374)

(declare-fun lt!631349 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97582 (_ BitVec 32)) SeekEntryResult!11374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434156 (= res!967620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631349 mask!2608) lt!631349 lt!631350 mask!2608) lt!631345))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434156 (= lt!631345 (Intermediate!11374 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434156 (= lt!631349 (select (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434156 (= lt!631350 (array!97583 (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47645 a!2831)))))

(declare-fun b!1434157 () Bool)

(declare-fun res!967628 () Bool)

(assert (=> b!1434157 (=> (not res!967628) (not e!809452))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1434157 (= res!967628 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434158 () Bool)

(declare-fun res!967619 () Bool)

(assert (=> b!1434158 (=> (not res!967619) (not e!809452))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434158 (= res!967619 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631349 lt!631350 mask!2608) lt!631345))))

(declare-fun b!1434159 () Bool)

(declare-fun e!809449 () Bool)

(assert (=> b!1434159 (= e!809449 true)))

(declare-fun lt!631346 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434159 (= lt!631346 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!967621 () Bool)

(assert (=> start!123724 (=> (not res!967621) (not e!809453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123724 (= res!967621 (validMask!0 mask!2608))))

(assert (=> start!123724 e!809453))

(assert (=> start!123724 true))

(declare-fun array_inv!36123 (array!97582) Bool)

(assert (=> start!123724 (array_inv!36123 a!2831)))

(declare-fun b!1434160 () Bool)

(declare-fun res!967623 () Bool)

(assert (=> b!1434160 (=> (not res!967623) (not e!809453))))

(assert (=> b!1434160 (= res!967623 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47645 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47645 a!2831))))))

(declare-fun b!1434161 () Bool)

(declare-fun res!967618 () Bool)

(assert (=> b!1434161 (=> (not res!967618) (not e!809452))))

(declare-fun lt!631347 () SeekEntryResult!11374)

(assert (=> b!1434161 (= res!967618 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!631347))))

(declare-fun e!809451 () Bool)

(declare-fun b!1434162 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97582 (_ BitVec 32)) SeekEntryResult!11374)

(assert (=> b!1434162 (= e!809451 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) (Found!11374 j!81)))))

(declare-fun b!1434163 () Bool)

(declare-fun res!967626 () Bool)

(assert (=> b!1434163 (=> (not res!967626) (not e!809453))))

(assert (=> b!1434163 (= res!967626 (validKeyInArray!0 (select (arr!47095 a!2831) i!982)))))

(declare-fun b!1434164 () Bool)

(assert (=> b!1434164 (= e!809453 e!809448)))

(declare-fun res!967629 () Bool)

(assert (=> b!1434164 (=> (not res!967629) (not e!809448))))

(assert (=> b!1434164 (= res!967629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!631347))))

(assert (=> b!1434164 (= lt!631347 (Intermediate!11374 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434165 () Bool)

(declare-fun res!967625 () Bool)

(assert (=> b!1434165 (=> (not res!967625) (not e!809453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97582 (_ BitVec 32)) Bool)

(assert (=> b!1434165 (= res!967625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434166 () Bool)

(declare-fun res!967622 () Bool)

(assert (=> b!1434166 (=> (not res!967622) (not e!809453))))

(assert (=> b!1434166 (= res!967622 (and (= (size!47645 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47645 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47645 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434167 () Bool)

(declare-fun res!967617 () Bool)

(assert (=> b!1434167 (=> (not res!967617) (not e!809453))))

(declare-datatypes ((List!33605 0))(
  ( (Nil!33602) (Cons!33601 (h!34930 (_ BitVec 64)) (t!48299 List!33605)) )
))
(declare-fun arrayNoDuplicates!0 (array!97582 (_ BitVec 32) List!33605) Bool)

(assert (=> b!1434167 (= res!967617 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33602))))

(declare-fun b!1434168 () Bool)

(assert (=> b!1434168 (= e!809452 (not e!809449))))

(declare-fun res!967630 () Bool)

(assert (=> b!1434168 (=> res!967630 e!809449)))

(assert (=> b!1434168 (= res!967630 (or (= (select (arr!47095 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47095 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47095 a!2831) index!585) (select (arr!47095 a!2831) j!81)) (= (select (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434168 e!809451))

(declare-fun res!967627 () Bool)

(assert (=> b!1434168 (=> (not res!967627) (not e!809451))))

(assert (=> b!1434168 (= res!967627 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48494 0))(
  ( (Unit!48495) )
))
(declare-fun lt!631348 () Unit!48494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48494)

(assert (=> b!1434168 (= lt!631348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123724 res!967621) b!1434166))

(assert (= (and b!1434166 res!967622) b!1434163))

(assert (= (and b!1434163 res!967626) b!1434155))

(assert (= (and b!1434155 res!967624) b!1434165))

(assert (= (and b!1434165 res!967625) b!1434167))

(assert (= (and b!1434167 res!967617) b!1434160))

(assert (= (and b!1434160 res!967623) b!1434164))

(assert (= (and b!1434164 res!967629) b!1434156))

(assert (= (and b!1434156 res!967620) b!1434161))

(assert (= (and b!1434161 res!967618) b!1434158))

(assert (= (and b!1434158 res!967619) b!1434157))

(assert (= (and b!1434157 res!967628) b!1434168))

(assert (= (and b!1434168 res!967627) b!1434162))

(assert (= (and b!1434168 (not res!967630)) b!1434159))

(declare-fun m!1323769 () Bool)

(assert (=> b!1434165 m!1323769))

(declare-fun m!1323771 () Bool)

(assert (=> b!1434168 m!1323771))

(declare-fun m!1323773 () Bool)

(assert (=> b!1434168 m!1323773))

(declare-fun m!1323775 () Bool)

(assert (=> b!1434168 m!1323775))

(declare-fun m!1323777 () Bool)

(assert (=> b!1434168 m!1323777))

(declare-fun m!1323779 () Bool)

(assert (=> b!1434168 m!1323779))

(declare-fun m!1323781 () Bool)

(assert (=> b!1434168 m!1323781))

(assert (=> b!1434162 m!1323779))

(assert (=> b!1434162 m!1323779))

(declare-fun m!1323783 () Bool)

(assert (=> b!1434162 m!1323783))

(declare-fun m!1323785 () Bool)

(assert (=> b!1434167 m!1323785))

(declare-fun m!1323787 () Bool)

(assert (=> b!1434159 m!1323787))

(declare-fun m!1323789 () Bool)

(assert (=> b!1434158 m!1323789))

(declare-fun m!1323791 () Bool)

(assert (=> b!1434156 m!1323791))

(assert (=> b!1434156 m!1323791))

(declare-fun m!1323793 () Bool)

(assert (=> b!1434156 m!1323793))

(assert (=> b!1434156 m!1323771))

(declare-fun m!1323795 () Bool)

(assert (=> b!1434156 m!1323795))

(assert (=> b!1434164 m!1323779))

(assert (=> b!1434164 m!1323779))

(declare-fun m!1323797 () Bool)

(assert (=> b!1434164 m!1323797))

(assert (=> b!1434164 m!1323797))

(assert (=> b!1434164 m!1323779))

(declare-fun m!1323799 () Bool)

(assert (=> b!1434164 m!1323799))

(declare-fun m!1323801 () Bool)

(assert (=> start!123724 m!1323801))

(declare-fun m!1323803 () Bool)

(assert (=> start!123724 m!1323803))

(assert (=> b!1434161 m!1323779))

(assert (=> b!1434161 m!1323779))

(declare-fun m!1323805 () Bool)

(assert (=> b!1434161 m!1323805))

(assert (=> b!1434155 m!1323779))

(assert (=> b!1434155 m!1323779))

(declare-fun m!1323807 () Bool)

(assert (=> b!1434155 m!1323807))

(declare-fun m!1323809 () Bool)

(assert (=> b!1434163 m!1323809))

(assert (=> b!1434163 m!1323809))

(declare-fun m!1323811 () Bool)

(assert (=> b!1434163 m!1323811))

(push 1)

