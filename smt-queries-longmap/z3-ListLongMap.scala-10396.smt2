; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122498 () Bool)

(assert start!122498)

(declare-fun b!1419098 () Bool)

(declare-fun res!954621 () Bool)

(declare-fun e!802978 () Bool)

(assert (=> b!1419098 (=> (not res!954621) (not e!802978))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96902 0))(
  ( (array!96903 (arr!46770 (Array (_ BitVec 32) (_ BitVec 64))) (size!47320 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96902)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419098 (= res!954621 (and (= (size!47320 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47320 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47320 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419099 () Bool)

(declare-fun res!954619 () Bool)

(assert (=> b!1419099 (=> (not res!954619) (not e!802978))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419099 (= res!954619 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47320 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47320 a!2831))))))

(declare-fun b!1419100 () Bool)

(declare-fun res!954618 () Bool)

(assert (=> b!1419100 (=> (not res!954618) (not e!802978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96902 (_ BitVec 32)) Bool)

(assert (=> b!1419100 (= res!954618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419102 () Bool)

(declare-fun res!954623 () Bool)

(assert (=> b!1419102 (=> (not res!954623) (not e!802978))))

(declare-datatypes ((List!33280 0))(
  ( (Nil!33277) (Cons!33276 (h!34575 (_ BitVec 64)) (t!47974 List!33280)) )
))
(declare-fun arrayNoDuplicates!0 (array!96902 (_ BitVec 32) List!33280) Bool)

(assert (=> b!1419102 (= res!954623 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33277))))

(declare-fun b!1419103 () Bool)

(declare-fun res!954625 () Bool)

(assert (=> b!1419103 (=> (not res!954625) (not e!802978))))

(declare-datatypes ((SeekEntryResult!11055 0))(
  ( (MissingZero!11055 (index!46612 (_ BitVec 32))) (Found!11055 (index!46613 (_ BitVec 32))) (Intermediate!11055 (undefined!11867 Bool) (index!46614 (_ BitVec 32)) (x!128283 (_ BitVec 32))) (Undefined!11055) (MissingVacant!11055 (index!46615 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96902 (_ BitVec 32)) SeekEntryResult!11055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419103 (= res!954625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46770 a!2831) j!81) mask!2608) (select (arr!46770 a!2831) j!81) a!2831 mask!2608) (Intermediate!11055 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419101 () Bool)

(assert (=> b!1419101 (= e!802978 false)))

(declare-fun lt!625728 () (_ BitVec 32))

(assert (=> b!1419101 (= lt!625728 (toIndex!0 (select (store (arr!46770 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun res!954624 () Bool)

(assert (=> start!122498 (=> (not res!954624) (not e!802978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122498 (= res!954624 (validMask!0 mask!2608))))

(assert (=> start!122498 e!802978))

(assert (=> start!122498 true))

(declare-fun array_inv!35798 (array!96902) Bool)

(assert (=> start!122498 (array_inv!35798 a!2831)))

(declare-fun b!1419104 () Bool)

(declare-fun res!954620 () Bool)

(assert (=> b!1419104 (=> (not res!954620) (not e!802978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419104 (= res!954620 (validKeyInArray!0 (select (arr!46770 a!2831) j!81)))))

(declare-fun b!1419105 () Bool)

(declare-fun res!954622 () Bool)

(assert (=> b!1419105 (=> (not res!954622) (not e!802978))))

(assert (=> b!1419105 (= res!954622 (validKeyInArray!0 (select (arr!46770 a!2831) i!982)))))

(assert (= (and start!122498 res!954624) b!1419098))

(assert (= (and b!1419098 res!954621) b!1419105))

(assert (= (and b!1419105 res!954622) b!1419104))

(assert (= (and b!1419104 res!954620) b!1419100))

(assert (= (and b!1419100 res!954618) b!1419102))

(assert (= (and b!1419102 res!954623) b!1419099))

(assert (= (and b!1419099 res!954619) b!1419103))

(assert (= (and b!1419103 res!954625) b!1419101))

(declare-fun m!1309601 () Bool)

(assert (=> b!1419100 m!1309601))

(declare-fun m!1309603 () Bool)

(assert (=> b!1419103 m!1309603))

(assert (=> b!1419103 m!1309603))

(declare-fun m!1309605 () Bool)

(assert (=> b!1419103 m!1309605))

(assert (=> b!1419103 m!1309605))

(assert (=> b!1419103 m!1309603))

(declare-fun m!1309607 () Bool)

(assert (=> b!1419103 m!1309607))

(declare-fun m!1309609 () Bool)

(assert (=> b!1419101 m!1309609))

(declare-fun m!1309611 () Bool)

(assert (=> b!1419101 m!1309611))

(assert (=> b!1419101 m!1309611))

(declare-fun m!1309613 () Bool)

(assert (=> b!1419101 m!1309613))

(declare-fun m!1309615 () Bool)

(assert (=> b!1419105 m!1309615))

(assert (=> b!1419105 m!1309615))

(declare-fun m!1309617 () Bool)

(assert (=> b!1419105 m!1309617))

(declare-fun m!1309619 () Bool)

(assert (=> start!122498 m!1309619))

(declare-fun m!1309621 () Bool)

(assert (=> start!122498 m!1309621))

(assert (=> b!1419104 m!1309603))

(assert (=> b!1419104 m!1309603))

(declare-fun m!1309623 () Bool)

(assert (=> b!1419104 m!1309623))

(declare-fun m!1309625 () Bool)

(assert (=> b!1419102 m!1309625))

(check-sat (not b!1419100) (not b!1419102) (not b!1419105) (not start!122498) (not b!1419104) (not b!1419101) (not b!1419103))
