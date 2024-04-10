; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122654 () Bool)

(assert start!122654)

(declare-fun b!1420773 () Bool)

(declare-fun res!956206 () Bool)

(declare-fun e!803494 () Bool)

(assert (=> b!1420773 (=> (not res!956206) (not e!803494))))

(declare-datatypes ((array!97019 0))(
  ( (array!97020 (arr!46827 (Array (_ BitVec 32) (_ BitVec 64))) (size!47377 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97019)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420773 (= res!956206 (validKeyInArray!0 (select (arr!46827 a!2831) j!81)))))

(declare-fun b!1420774 () Bool)

(declare-fun e!803492 () Bool)

(assert (=> b!1420774 (= e!803492 false)))

(declare-fun lt!625992 () array!97019)

(declare-fun lt!625995 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11112 0))(
  ( (MissingZero!11112 (index!46840 (_ BitVec 32))) (Found!11112 (index!46841 (_ BitVec 32))) (Intermediate!11112 (undefined!11924 Bool) (index!46842 (_ BitVec 32)) (x!128498 (_ BitVec 32))) (Undefined!11112) (MissingVacant!11112 (index!46843 (_ BitVec 32))) )
))
(declare-fun lt!625994 () SeekEntryResult!11112)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97019 (_ BitVec 32)) SeekEntryResult!11112)

(assert (=> b!1420774 (= lt!625994 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625995 lt!625992 mask!2608))))

(declare-fun b!1420775 () Bool)

(declare-fun res!956215 () Bool)

(assert (=> b!1420775 (=> (not res!956215) (not e!803494))))

(declare-datatypes ((List!33337 0))(
  ( (Nil!33334) (Cons!33333 (h!34635 (_ BitVec 64)) (t!48031 List!33337)) )
))
(declare-fun arrayNoDuplicates!0 (array!97019 (_ BitVec 32) List!33337) Bool)

(assert (=> b!1420775 (= res!956215 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33334))))

(declare-fun b!1420776 () Bool)

(declare-fun res!956213 () Bool)

(assert (=> b!1420776 (=> (not res!956213) (not e!803494))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420776 (= res!956213 (validKeyInArray!0 (select (arr!46827 a!2831) i!982)))))

(declare-fun b!1420777 () Bool)

(declare-fun res!956212 () Bool)

(assert (=> b!1420777 (=> (not res!956212) (not e!803492))))

(declare-fun lt!625993 () SeekEntryResult!11112)

(assert (=> b!1420777 (= res!956212 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46827 a!2831) j!81) a!2831 mask!2608) lt!625993))))

(declare-fun b!1420778 () Bool)

(declare-fun res!956208 () Bool)

(assert (=> b!1420778 (=> (not res!956208) (not e!803494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97019 (_ BitVec 32)) Bool)

(assert (=> b!1420778 (= res!956208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420779 () Bool)

(declare-fun res!956214 () Bool)

(assert (=> b!1420779 (=> (not res!956214) (not e!803494))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420779 (= res!956214 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47377 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47377 a!2831))))))

(declare-fun b!1420780 () Bool)

(declare-fun res!956211 () Bool)

(assert (=> b!1420780 (=> (not res!956211) (not e!803494))))

(assert (=> b!1420780 (= res!956211 (and (= (size!47377 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47377 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47377 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!956209 () Bool)

(assert (=> start!122654 (=> (not res!956209) (not e!803494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122654 (= res!956209 (validMask!0 mask!2608))))

(assert (=> start!122654 e!803494))

(assert (=> start!122654 true))

(declare-fun array_inv!35855 (array!97019) Bool)

(assert (=> start!122654 (array_inv!35855 a!2831)))

(declare-fun b!1420781 () Bool)

(declare-fun e!803495 () Bool)

(assert (=> b!1420781 (= e!803494 e!803495)))

(declare-fun res!956210 () Bool)

(assert (=> b!1420781 (=> (not res!956210) (not e!803495))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420781 (= res!956210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46827 a!2831) j!81) mask!2608) (select (arr!46827 a!2831) j!81) a!2831 mask!2608) lt!625993))))

(assert (=> b!1420781 (= lt!625993 (Intermediate!11112 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420782 () Bool)

(assert (=> b!1420782 (= e!803495 e!803492)))

(declare-fun res!956207 () Bool)

(assert (=> b!1420782 (=> (not res!956207) (not e!803492))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420782 (= res!956207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625995 mask!2608) lt!625995 lt!625992 mask!2608) (Intermediate!11112 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420782 (= lt!625995 (select (store (arr!46827 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420782 (= lt!625992 (array!97020 (store (arr!46827 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47377 a!2831)))))

(assert (= (and start!122654 res!956209) b!1420780))

(assert (= (and b!1420780 res!956211) b!1420776))

(assert (= (and b!1420776 res!956213) b!1420773))

(assert (= (and b!1420773 res!956206) b!1420778))

(assert (= (and b!1420778 res!956208) b!1420775))

(assert (= (and b!1420775 res!956215) b!1420779))

(assert (= (and b!1420779 res!956214) b!1420781))

(assert (= (and b!1420781 res!956210) b!1420782))

(assert (= (and b!1420782 res!956207) b!1420777))

(assert (= (and b!1420777 res!956212) b!1420774))

(declare-fun m!1311299 () Bool)

(assert (=> b!1420775 m!1311299))

(declare-fun m!1311301 () Bool)

(assert (=> b!1420776 m!1311301))

(assert (=> b!1420776 m!1311301))

(declare-fun m!1311303 () Bool)

(assert (=> b!1420776 m!1311303))

(declare-fun m!1311305 () Bool)

(assert (=> b!1420778 m!1311305))

(declare-fun m!1311307 () Bool)

(assert (=> b!1420774 m!1311307))

(declare-fun m!1311309 () Bool)

(assert (=> b!1420773 m!1311309))

(assert (=> b!1420773 m!1311309))

(declare-fun m!1311311 () Bool)

(assert (=> b!1420773 m!1311311))

(declare-fun m!1311313 () Bool)

(assert (=> start!122654 m!1311313))

(declare-fun m!1311315 () Bool)

(assert (=> start!122654 m!1311315))

(declare-fun m!1311317 () Bool)

(assert (=> b!1420782 m!1311317))

(assert (=> b!1420782 m!1311317))

(declare-fun m!1311319 () Bool)

(assert (=> b!1420782 m!1311319))

(declare-fun m!1311321 () Bool)

(assert (=> b!1420782 m!1311321))

(declare-fun m!1311323 () Bool)

(assert (=> b!1420782 m!1311323))

(assert (=> b!1420781 m!1311309))

(assert (=> b!1420781 m!1311309))

(declare-fun m!1311325 () Bool)

(assert (=> b!1420781 m!1311325))

(assert (=> b!1420781 m!1311325))

(assert (=> b!1420781 m!1311309))

(declare-fun m!1311327 () Bool)

(assert (=> b!1420781 m!1311327))

(assert (=> b!1420777 m!1311309))

(assert (=> b!1420777 m!1311309))

(declare-fun m!1311329 () Bool)

(assert (=> b!1420777 m!1311329))

(check-sat (not b!1420776) (not b!1420777) (not start!122654) (not b!1420774) (not b!1420773) (not b!1420782) (not b!1420781) (not b!1420775) (not b!1420778))
(check-sat)
