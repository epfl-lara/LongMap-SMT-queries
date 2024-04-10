; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122850 () Bool)

(assert start!122850)

(declare-fun b!1424922 () Bool)

(declare-fun res!960359 () Bool)

(declare-fun e!805222 () Bool)

(assert (=> b!1424922 (=> (not res!960359) (not e!805222))))

(declare-datatypes ((array!97215 0))(
  ( (array!97216 (arr!46925 (Array (_ BitVec 32) (_ BitVec 64))) (size!47475 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97215)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97215 (_ BitVec 32)) Bool)

(assert (=> b!1424922 (= res!960359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424923 () Bool)

(declare-fun res!960356 () Bool)

(assert (=> b!1424923 (=> (not res!960356) (not e!805222))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424923 (= res!960356 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47475 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47475 a!2831))))))

(declare-fun b!1424924 () Bool)

(declare-fun res!960360 () Bool)

(assert (=> b!1424924 (=> (not res!960360) (not e!805222))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424924 (= res!960360 (validKeyInArray!0 (select (arr!46925 a!2831) i!982)))))

(declare-fun b!1424925 () Bool)

(declare-fun res!960355 () Bool)

(assert (=> b!1424925 (=> (not res!960355) (not e!805222))))

(declare-datatypes ((List!33435 0))(
  ( (Nil!33432) (Cons!33431 (h!34733 (_ BitVec 64)) (t!48129 List!33435)) )
))
(declare-fun arrayNoDuplicates!0 (array!97215 (_ BitVec 32) List!33435) Bool)

(assert (=> b!1424925 (= res!960355 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33432))))

(declare-fun res!960358 () Bool)

(assert (=> start!122850 (=> (not res!960358) (not e!805222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122850 (= res!960358 (validMask!0 mask!2608))))

(assert (=> start!122850 e!805222))

(assert (=> start!122850 true))

(declare-fun array_inv!35953 (array!97215) Bool)

(assert (=> start!122850 (array_inv!35953 a!2831)))

(declare-fun b!1424926 () Bool)

(declare-fun res!960357 () Bool)

(assert (=> b!1424926 (=> (not res!960357) (not e!805222))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1424926 (= res!960357 (and (= (size!47475 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47475 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47475 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424927 () Bool)

(assert (=> b!1424927 (= e!805222 false)))

(declare-fun lt!627747 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424927 (= lt!627747 (toIndex!0 (select (arr!46925 a!2831) j!81) mask!2608))))

(declare-fun b!1424928 () Bool)

(declare-fun res!960361 () Bool)

(assert (=> b!1424928 (=> (not res!960361) (not e!805222))))

(assert (=> b!1424928 (= res!960361 (validKeyInArray!0 (select (arr!46925 a!2831) j!81)))))

(assert (= (and start!122850 res!960358) b!1424926))

(assert (= (and b!1424926 res!960357) b!1424924))

(assert (= (and b!1424924 res!960360) b!1424928))

(assert (= (and b!1424928 res!960361) b!1424922))

(assert (= (and b!1424922 res!960359) b!1424925))

(assert (= (and b!1424925 res!960355) b!1424923))

(assert (= (and b!1424923 res!960356) b!1424927))

(declare-fun m!1315491 () Bool)

(assert (=> b!1424924 m!1315491))

(assert (=> b!1424924 m!1315491))

(declare-fun m!1315493 () Bool)

(assert (=> b!1424924 m!1315493))

(declare-fun m!1315495 () Bool)

(assert (=> b!1424925 m!1315495))

(declare-fun m!1315497 () Bool)

(assert (=> start!122850 m!1315497))

(declare-fun m!1315499 () Bool)

(assert (=> start!122850 m!1315499))

(declare-fun m!1315501 () Bool)

(assert (=> b!1424922 m!1315501))

(declare-fun m!1315503 () Bool)

(assert (=> b!1424928 m!1315503))

(assert (=> b!1424928 m!1315503))

(declare-fun m!1315505 () Bool)

(assert (=> b!1424928 m!1315505))

(assert (=> b!1424927 m!1315503))

(assert (=> b!1424927 m!1315503))

(declare-fun m!1315507 () Bool)

(assert (=> b!1424927 m!1315507))

(push 1)

(assert (not b!1424928))

(assert (not start!122850))

(assert (not b!1424922))

(assert (not b!1424924))

(assert (not b!1424925))

(assert (not b!1424927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

