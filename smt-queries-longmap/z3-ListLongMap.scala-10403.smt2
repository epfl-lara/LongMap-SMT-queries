; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122576 () Bool)

(assert start!122576)

(declare-fun b!1419670 () Bool)

(declare-fun res!955158 () Bool)

(declare-fun e!803176 () Bool)

(assert (=> b!1419670 (=> (not res!955158) (not e!803176))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96894 0))(
  ( (array!96895 (arr!46765 (Array (_ BitVec 32) (_ BitVec 64))) (size!47317 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96894)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419670 (= res!955158 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47317 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47317 a!2831))))))

(declare-fun b!1419671 () Bool)

(declare-fun res!955161 () Bool)

(assert (=> b!1419671 (=> (not res!955161) (not e!803176))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96894 (_ BitVec 32)) Bool)

(assert (=> b!1419671 (= res!955161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419672 () Bool)

(declare-fun res!955156 () Bool)

(assert (=> b!1419672 (=> (not res!955156) (not e!803176))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11077 0))(
  ( (MissingZero!11077 (index!46700 (_ BitVec 32))) (Found!11077 (index!46701 (_ BitVec 32))) (Intermediate!11077 (undefined!11889 Bool) (index!46702 (_ BitVec 32)) (x!128364 (_ BitVec 32))) (Undefined!11077) (MissingVacant!11077 (index!46703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96894 (_ BitVec 32)) SeekEntryResult!11077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419672 (= res!955156 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46765 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46765 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96895 (store (arr!46765 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47317 a!2831)) mask!2608) (Intermediate!11077 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419673 () Bool)

(declare-fun res!955162 () Bool)

(assert (=> b!1419673 (=> (not res!955162) (not e!803176))))

(assert (=> b!1419673 (= res!955162 (and (= (size!47317 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47317 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47317 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419674 () Bool)

(assert (=> b!1419674 (= e!803176 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1419675 () Bool)

(declare-fun res!955159 () Bool)

(assert (=> b!1419675 (=> (not res!955159) (not e!803176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419675 (= res!955159 (validKeyInArray!0 (select (arr!46765 a!2831) i!982)))))

(declare-fun b!1419676 () Bool)

(declare-fun res!955157 () Bool)

(assert (=> b!1419676 (=> (not res!955157) (not e!803176))))

(declare-datatypes ((List!33353 0))(
  ( (Nil!33350) (Cons!33349 (h!34651 (_ BitVec 64)) (t!48039 List!33353)) )
))
(declare-fun arrayNoDuplicates!0 (array!96894 (_ BitVec 32) List!33353) Bool)

(assert (=> b!1419676 (= res!955157 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33350))))

(declare-fun b!1419677 () Bool)

(declare-fun res!955154 () Bool)

(assert (=> b!1419677 (=> (not res!955154) (not e!803176))))

(assert (=> b!1419677 (= res!955154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46765 a!2831) j!81) mask!2608) (select (arr!46765 a!2831) j!81) a!2831 mask!2608) (Intermediate!11077 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419678 () Bool)

(declare-fun res!955155 () Bool)

(assert (=> b!1419678 (=> (not res!955155) (not e!803176))))

(assert (=> b!1419678 (= res!955155 (validKeyInArray!0 (select (arr!46765 a!2831) j!81)))))

(declare-fun res!955160 () Bool)

(assert (=> start!122576 (=> (not res!955160) (not e!803176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122576 (= res!955160 (validMask!0 mask!2608))))

(assert (=> start!122576 e!803176))

(assert (=> start!122576 true))

(declare-fun array_inv!35998 (array!96894) Bool)

(assert (=> start!122576 (array_inv!35998 a!2831)))

(assert (= (and start!122576 res!955160) b!1419673))

(assert (= (and b!1419673 res!955162) b!1419675))

(assert (= (and b!1419675 res!955159) b!1419678))

(assert (= (and b!1419678 res!955155) b!1419671))

(assert (= (and b!1419671 res!955161) b!1419676))

(assert (= (and b!1419676 res!955157) b!1419670))

(assert (= (and b!1419670 res!955158) b!1419677))

(assert (= (and b!1419677 res!955154) b!1419672))

(assert (= (and b!1419672 res!955156) b!1419674))

(declare-fun m!1309653 () Bool)

(assert (=> b!1419677 m!1309653))

(assert (=> b!1419677 m!1309653))

(declare-fun m!1309655 () Bool)

(assert (=> b!1419677 m!1309655))

(assert (=> b!1419677 m!1309655))

(assert (=> b!1419677 m!1309653))

(declare-fun m!1309657 () Bool)

(assert (=> b!1419677 m!1309657))

(declare-fun m!1309659 () Bool)

(assert (=> b!1419675 m!1309659))

(assert (=> b!1419675 m!1309659))

(declare-fun m!1309661 () Bool)

(assert (=> b!1419675 m!1309661))

(declare-fun m!1309663 () Bool)

(assert (=> b!1419671 m!1309663))

(declare-fun m!1309665 () Bool)

(assert (=> b!1419672 m!1309665))

(declare-fun m!1309667 () Bool)

(assert (=> b!1419672 m!1309667))

(assert (=> b!1419672 m!1309667))

(declare-fun m!1309669 () Bool)

(assert (=> b!1419672 m!1309669))

(assert (=> b!1419672 m!1309669))

(assert (=> b!1419672 m!1309667))

(declare-fun m!1309671 () Bool)

(assert (=> b!1419672 m!1309671))

(assert (=> b!1419678 m!1309653))

(assert (=> b!1419678 m!1309653))

(declare-fun m!1309673 () Bool)

(assert (=> b!1419678 m!1309673))

(declare-fun m!1309675 () Bool)

(assert (=> b!1419676 m!1309675))

(declare-fun m!1309677 () Bool)

(assert (=> start!122576 m!1309677))

(declare-fun m!1309679 () Bool)

(assert (=> start!122576 m!1309679))

(check-sat (not b!1419677) (not b!1419675) (not b!1419676) (not b!1419678) (not b!1419671) (not start!122576) (not b!1419672))
(check-sat)
