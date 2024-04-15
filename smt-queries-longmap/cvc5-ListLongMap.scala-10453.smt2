; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122880 () Bool)

(assert start!122880)

(declare-fun b!1425215 () Bool)

(declare-fun res!960700 () Bool)

(declare-fun e!805285 () Bool)

(assert (=> b!1425215 (=> (not res!960700) (not e!805285))))

(declare-datatypes ((array!97198 0))(
  ( (array!97199 (arr!46917 (Array (_ BitVec 32) (_ BitVec 64))) (size!47469 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97198)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425215 (= res!960700 (validKeyInArray!0 (select (arr!46917 a!2831) i!982)))))

(declare-fun b!1425216 () Bool)

(declare-fun res!960703 () Bool)

(assert (=> b!1425216 (=> (not res!960703) (not e!805285))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97198 (_ BitVec 32)) Bool)

(assert (=> b!1425216 (= res!960703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425218 () Bool)

(declare-fun res!960699 () Bool)

(assert (=> b!1425218 (=> (not res!960699) (not e!805285))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425218 (= res!960699 (validKeyInArray!0 (select (arr!46917 a!2831) j!81)))))

(declare-fun b!1425219 () Bool)

(declare-fun res!960705 () Bool)

(assert (=> b!1425219 (=> (not res!960705) (not e!805285))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11223 0))(
  ( (MissingZero!11223 (index!47284 (_ BitVec 32))) (Found!11223 (index!47285 (_ BitVec 32))) (Intermediate!11223 (undefined!12035 Bool) (index!47286 (_ BitVec 32)) (x!128910 (_ BitVec 32))) (Undefined!11223) (MissingVacant!11223 (index!47287 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97198 (_ BitVec 32)) SeekEntryResult!11223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425219 (= res!960705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46917 a!2831) j!81) mask!2608) (select (arr!46917 a!2831) j!81) a!2831 mask!2608) (Intermediate!11223 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425220 () Bool)

(assert (=> b!1425220 (= e!805285 false)))

(declare-fun lt!627608 () (_ BitVec 32))

(assert (=> b!1425220 (= lt!627608 (toIndex!0 (select (store (arr!46917 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425221 () Bool)

(declare-fun res!960704 () Bool)

(assert (=> b!1425221 (=> (not res!960704) (not e!805285))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425221 (= res!960704 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47469 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47469 a!2831))))))

(declare-fun b!1425222 () Bool)

(declare-fun res!960701 () Bool)

(assert (=> b!1425222 (=> (not res!960701) (not e!805285))))

(declare-datatypes ((List!33505 0))(
  ( (Nil!33502) (Cons!33501 (h!34803 (_ BitVec 64)) (t!48191 List!33505)) )
))
(declare-fun arrayNoDuplicates!0 (array!97198 (_ BitVec 32) List!33505) Bool)

(assert (=> b!1425222 (= res!960701 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33502))))

(declare-fun b!1425217 () Bool)

(declare-fun res!960702 () Bool)

(assert (=> b!1425217 (=> (not res!960702) (not e!805285))))

(assert (=> b!1425217 (= res!960702 (and (= (size!47469 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47469 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47469 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960706 () Bool)

(assert (=> start!122880 (=> (not res!960706) (not e!805285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122880 (= res!960706 (validMask!0 mask!2608))))

(assert (=> start!122880 e!805285))

(assert (=> start!122880 true))

(declare-fun array_inv!36150 (array!97198) Bool)

(assert (=> start!122880 (array_inv!36150 a!2831)))

(assert (= (and start!122880 res!960706) b!1425217))

(assert (= (and b!1425217 res!960702) b!1425215))

(assert (= (and b!1425215 res!960700) b!1425218))

(assert (= (and b!1425218 res!960699) b!1425216))

(assert (= (and b!1425216 res!960703) b!1425222))

(assert (= (and b!1425222 res!960701) b!1425221))

(assert (= (and b!1425221 res!960704) b!1425219))

(assert (= (and b!1425219 res!960705) b!1425220))

(declare-fun m!1315303 () Bool)

(assert (=> b!1425222 m!1315303))

(declare-fun m!1315305 () Bool)

(assert (=> start!122880 m!1315305))

(declare-fun m!1315307 () Bool)

(assert (=> start!122880 m!1315307))

(declare-fun m!1315309 () Bool)

(assert (=> b!1425220 m!1315309))

(declare-fun m!1315311 () Bool)

(assert (=> b!1425220 m!1315311))

(assert (=> b!1425220 m!1315311))

(declare-fun m!1315313 () Bool)

(assert (=> b!1425220 m!1315313))

(declare-fun m!1315315 () Bool)

(assert (=> b!1425218 m!1315315))

(assert (=> b!1425218 m!1315315))

(declare-fun m!1315317 () Bool)

(assert (=> b!1425218 m!1315317))

(declare-fun m!1315319 () Bool)

(assert (=> b!1425216 m!1315319))

(declare-fun m!1315321 () Bool)

(assert (=> b!1425215 m!1315321))

(assert (=> b!1425215 m!1315321))

(declare-fun m!1315323 () Bool)

(assert (=> b!1425215 m!1315323))

(assert (=> b!1425219 m!1315315))

(assert (=> b!1425219 m!1315315))

(declare-fun m!1315325 () Bool)

(assert (=> b!1425219 m!1315325))

(assert (=> b!1425219 m!1315325))

(assert (=> b!1425219 m!1315315))

(declare-fun m!1315327 () Bool)

(assert (=> b!1425219 m!1315327))

(push 1)

(assert (not b!1425222))

(assert (not b!1425215))

(assert (not b!1425218))

(assert (not b!1425220))

(assert (not b!1425216))

(assert (not b!1425219))

(assert (not start!122880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

