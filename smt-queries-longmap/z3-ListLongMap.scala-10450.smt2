; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122864 () Bool)

(assert start!122864)

(declare-fun b!1425069 () Bool)

(declare-fun e!805265 () Bool)

(assert (=> b!1425069 (= e!805265 false)))

(declare-datatypes ((SeekEntryResult!11211 0))(
  ( (MissingZero!11211 (index!47236 (_ BitVec 32))) (Found!11211 (index!47237 (_ BitVec 32))) (Intermediate!11211 (undefined!12023 Bool) (index!47238 (_ BitVec 32)) (x!128877 (_ BitVec 32))) (Undefined!11211) (MissingVacant!11211 (index!47239 (_ BitVec 32))) )
))
(declare-fun lt!627768 () SeekEntryResult!11211)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97229 0))(
  ( (array!97230 (arr!46932 (Array (_ BitVec 32) (_ BitVec 64))) (size!47482 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97229)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97229 (_ BitVec 32)) SeekEntryResult!11211)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425069 (= lt!627768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46932 a!2831) j!81) mask!2608) (select (arr!46932 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425070 () Bool)

(declare-fun res!960504 () Bool)

(assert (=> b!1425070 (=> (not res!960504) (not e!805265))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425070 (= res!960504 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47482 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47482 a!2831))))))

(declare-fun b!1425071 () Bool)

(declare-fun res!960508 () Bool)

(assert (=> b!1425071 (=> (not res!960508) (not e!805265))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425071 (= res!960508 (validKeyInArray!0 (select (arr!46932 a!2831) i!982)))))

(declare-fun b!1425072 () Bool)

(declare-fun res!960507 () Bool)

(assert (=> b!1425072 (=> (not res!960507) (not e!805265))))

(declare-datatypes ((List!33442 0))(
  ( (Nil!33439) (Cons!33438 (h!34740 (_ BitVec 64)) (t!48136 List!33442)) )
))
(declare-fun arrayNoDuplicates!0 (array!97229 (_ BitVec 32) List!33442) Bool)

(assert (=> b!1425072 (= res!960507 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33439))))

(declare-fun b!1425073 () Bool)

(declare-fun res!960503 () Bool)

(assert (=> b!1425073 (=> (not res!960503) (not e!805265))))

(assert (=> b!1425073 (= res!960503 (validKeyInArray!0 (select (arr!46932 a!2831) j!81)))))

(declare-fun b!1425074 () Bool)

(declare-fun res!960506 () Bool)

(assert (=> b!1425074 (=> (not res!960506) (not e!805265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97229 (_ BitVec 32)) Bool)

(assert (=> b!1425074 (= res!960506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!960502 () Bool)

(assert (=> start!122864 (=> (not res!960502) (not e!805265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122864 (= res!960502 (validMask!0 mask!2608))))

(assert (=> start!122864 e!805265))

(assert (=> start!122864 true))

(declare-fun array_inv!35960 (array!97229) Bool)

(assert (=> start!122864 (array_inv!35960 a!2831)))

(declare-fun b!1425075 () Bool)

(declare-fun res!960505 () Bool)

(assert (=> b!1425075 (=> (not res!960505) (not e!805265))))

(assert (=> b!1425075 (= res!960505 (and (= (size!47482 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47482 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47482 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122864 res!960502) b!1425075))

(assert (= (and b!1425075 res!960505) b!1425071))

(assert (= (and b!1425071 res!960508) b!1425073))

(assert (= (and b!1425073 res!960503) b!1425074))

(assert (= (and b!1425074 res!960506) b!1425072))

(assert (= (and b!1425072 res!960507) b!1425070))

(assert (= (and b!1425070 res!960504) b!1425069))

(declare-fun m!1315625 () Bool)

(assert (=> b!1425071 m!1315625))

(assert (=> b!1425071 m!1315625))

(declare-fun m!1315627 () Bool)

(assert (=> b!1425071 m!1315627))

(declare-fun m!1315629 () Bool)

(assert (=> b!1425069 m!1315629))

(assert (=> b!1425069 m!1315629))

(declare-fun m!1315631 () Bool)

(assert (=> b!1425069 m!1315631))

(assert (=> b!1425069 m!1315631))

(assert (=> b!1425069 m!1315629))

(declare-fun m!1315633 () Bool)

(assert (=> b!1425069 m!1315633))

(declare-fun m!1315635 () Bool)

(assert (=> b!1425074 m!1315635))

(assert (=> b!1425073 m!1315629))

(assert (=> b!1425073 m!1315629))

(declare-fun m!1315637 () Bool)

(assert (=> b!1425073 m!1315637))

(declare-fun m!1315639 () Bool)

(assert (=> start!122864 m!1315639))

(declare-fun m!1315641 () Bool)

(assert (=> start!122864 m!1315641))

(declare-fun m!1315643 () Bool)

(assert (=> b!1425072 m!1315643))

(check-sat (not b!1425069) (not b!1425074) (not start!122864) (not b!1425071) (not b!1425072) (not b!1425073))
