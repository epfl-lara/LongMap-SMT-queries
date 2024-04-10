; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122564 () Bool)

(assert start!122564)

(declare-fun b!1419548 () Bool)

(declare-fun res!954982 () Bool)

(declare-fun e!803159 () Bool)

(assert (=> b!1419548 (=> (not res!954982) (not e!803159))))

(declare-datatypes ((array!96929 0))(
  ( (array!96930 (arr!46782 (Array (_ BitVec 32) (_ BitVec 64))) (size!47332 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96929)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96929 (_ BitVec 32)) Bool)

(assert (=> b!1419548 (= res!954982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!954987 () Bool)

(assert (=> start!122564 (=> (not res!954987) (not e!803159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122564 (= res!954987 (validMask!0 mask!2608))))

(assert (=> start!122564 e!803159))

(assert (=> start!122564 true))

(declare-fun array_inv!35810 (array!96929) Bool)

(assert (=> start!122564 (array_inv!35810 a!2831)))

(declare-fun b!1419549 () Bool)

(assert (=> b!1419549 (= e!803159 false)))

(declare-fun lt!625833 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419549 (= lt!625833 (toIndex!0 (select (store (arr!46782 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419550 () Bool)

(declare-fun res!954985 () Bool)

(assert (=> b!1419550 (=> (not res!954985) (not e!803159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419550 (= res!954985 (validKeyInArray!0 (select (arr!46782 a!2831) j!81)))))

(declare-fun b!1419551 () Bool)

(declare-fun res!954984 () Bool)

(assert (=> b!1419551 (=> (not res!954984) (not e!803159))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11067 0))(
  ( (MissingZero!11067 (index!46660 (_ BitVec 32))) (Found!11067 (index!46661 (_ BitVec 32))) (Intermediate!11067 (undefined!11879 Bool) (index!46662 (_ BitVec 32)) (x!128333 (_ BitVec 32))) (Undefined!11067) (MissingVacant!11067 (index!46663 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96929 (_ BitVec 32)) SeekEntryResult!11067)

(assert (=> b!1419551 (= res!954984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46782 a!2831) j!81) mask!2608) (select (arr!46782 a!2831) j!81) a!2831 mask!2608) (Intermediate!11067 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419552 () Bool)

(declare-fun res!954988 () Bool)

(assert (=> b!1419552 (=> (not res!954988) (not e!803159))))

(assert (=> b!1419552 (= res!954988 (and (= (size!47332 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47332 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47332 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419553 () Bool)

(declare-fun res!954986 () Bool)

(assert (=> b!1419553 (=> (not res!954986) (not e!803159))))

(assert (=> b!1419553 (= res!954986 (validKeyInArray!0 (select (arr!46782 a!2831) i!982)))))

(declare-fun b!1419554 () Bool)

(declare-fun res!954983 () Bool)

(assert (=> b!1419554 (=> (not res!954983) (not e!803159))))

(declare-datatypes ((List!33292 0))(
  ( (Nil!33289) (Cons!33288 (h!34590 (_ BitVec 64)) (t!47986 List!33292)) )
))
(declare-fun arrayNoDuplicates!0 (array!96929 (_ BitVec 32) List!33292) Bool)

(assert (=> b!1419554 (= res!954983 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33289))))

(declare-fun b!1419555 () Bool)

(declare-fun res!954981 () Bool)

(assert (=> b!1419555 (=> (not res!954981) (not e!803159))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419555 (= res!954981 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47332 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47332 a!2831))))))

(assert (= (and start!122564 res!954987) b!1419552))

(assert (= (and b!1419552 res!954988) b!1419553))

(assert (= (and b!1419553 res!954986) b!1419550))

(assert (= (and b!1419550 res!954985) b!1419548))

(assert (= (and b!1419548 res!954982) b!1419554))

(assert (= (and b!1419554 res!954983) b!1419555))

(assert (= (and b!1419555 res!954981) b!1419551))

(assert (= (and b!1419551 res!954984) b!1419549))

(declare-fun m!1309985 () Bool)

(assert (=> b!1419554 m!1309985))

(declare-fun m!1309987 () Bool)

(assert (=> b!1419549 m!1309987))

(declare-fun m!1309989 () Bool)

(assert (=> b!1419549 m!1309989))

(assert (=> b!1419549 m!1309989))

(declare-fun m!1309991 () Bool)

(assert (=> b!1419549 m!1309991))

(declare-fun m!1309993 () Bool)

(assert (=> b!1419553 m!1309993))

(assert (=> b!1419553 m!1309993))

(declare-fun m!1309995 () Bool)

(assert (=> b!1419553 m!1309995))

(declare-fun m!1309997 () Bool)

(assert (=> b!1419551 m!1309997))

(assert (=> b!1419551 m!1309997))

(declare-fun m!1309999 () Bool)

(assert (=> b!1419551 m!1309999))

(assert (=> b!1419551 m!1309999))

(assert (=> b!1419551 m!1309997))

(declare-fun m!1310001 () Bool)

(assert (=> b!1419551 m!1310001))

(declare-fun m!1310003 () Bool)

(assert (=> b!1419548 m!1310003))

(declare-fun m!1310005 () Bool)

(assert (=> start!122564 m!1310005))

(declare-fun m!1310007 () Bool)

(assert (=> start!122564 m!1310007))

(assert (=> b!1419550 m!1309997))

(assert (=> b!1419550 m!1309997))

(declare-fun m!1310009 () Bool)

(assert (=> b!1419550 m!1310009))

(check-sat (not b!1419553) (not b!1419550) (not b!1419554) (not start!122564) (not b!1419551) (not b!1419549) (not b!1419548))
