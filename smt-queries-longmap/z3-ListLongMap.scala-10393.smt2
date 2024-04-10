; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122438 () Bool)

(assert start!122438)

(declare-fun b!1418724 () Bool)

(declare-fun res!954334 () Bool)

(declare-fun e!802817 () Bool)

(assert (=> b!1418724 (=> (not res!954334) (not e!802817))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96881 0))(
  ( (array!96882 (arr!46761 (Array (_ BitVec 32) (_ BitVec 64))) (size!47311 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96881)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418724 (= res!954334 (and (= (size!47311 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47311 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47311 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418725 () Bool)

(assert (=> b!1418725 (= e!802817 false)))

(declare-fun lt!625656 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418725 (= lt!625656 (toIndex!0 (select (arr!46761 a!2831) j!81) mask!2608))))

(declare-fun b!1418727 () Bool)

(declare-fun res!954337 () Bool)

(assert (=> b!1418727 (=> (not res!954337) (not e!802817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418727 (= res!954337 (validKeyInArray!0 (select (arr!46761 a!2831) j!81)))))

(declare-fun b!1418728 () Bool)

(declare-fun res!954335 () Bool)

(assert (=> b!1418728 (=> (not res!954335) (not e!802817))))

(assert (=> b!1418728 (= res!954335 (validKeyInArray!0 (select (arr!46761 a!2831) i!982)))))

(declare-fun b!1418726 () Bool)

(declare-fun res!954336 () Bool)

(assert (=> b!1418726 (=> (not res!954336) (not e!802817))))

(declare-datatypes ((List!33271 0))(
  ( (Nil!33268) (Cons!33267 (h!34563 (_ BitVec 64)) (t!47965 List!33271)) )
))
(declare-fun arrayNoDuplicates!0 (array!96881 (_ BitVec 32) List!33271) Bool)

(assert (=> b!1418726 (= res!954336 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33268))))

(declare-fun res!954333 () Bool)

(assert (=> start!122438 (=> (not res!954333) (not e!802817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122438 (= res!954333 (validMask!0 mask!2608))))

(assert (=> start!122438 e!802817))

(assert (=> start!122438 true))

(declare-fun array_inv!35789 (array!96881) Bool)

(assert (=> start!122438 (array_inv!35789 a!2831)))

(declare-fun b!1418729 () Bool)

(declare-fun res!954331 () Bool)

(assert (=> b!1418729 (=> (not res!954331) (not e!802817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96881 (_ BitVec 32)) Bool)

(assert (=> b!1418729 (= res!954331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418730 () Bool)

(declare-fun res!954332 () Bool)

(assert (=> b!1418730 (=> (not res!954332) (not e!802817))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418730 (= res!954332 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47311 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47311 a!2831))))))

(assert (= (and start!122438 res!954333) b!1418724))

(assert (= (and b!1418724 res!954334) b!1418728))

(assert (= (and b!1418728 res!954335) b!1418727))

(assert (= (and b!1418727 res!954337) b!1418729))

(assert (= (and b!1418729 res!954331) b!1418726))

(assert (= (and b!1418726 res!954336) b!1418730))

(assert (= (and b!1418730 res!954332) b!1418725))

(declare-fun m!1309347 () Bool)

(assert (=> b!1418727 m!1309347))

(assert (=> b!1418727 m!1309347))

(declare-fun m!1309349 () Bool)

(assert (=> b!1418727 m!1309349))

(declare-fun m!1309351 () Bool)

(assert (=> start!122438 m!1309351))

(declare-fun m!1309353 () Bool)

(assert (=> start!122438 m!1309353))

(declare-fun m!1309355 () Bool)

(assert (=> b!1418729 m!1309355))

(declare-fun m!1309357 () Bool)

(assert (=> b!1418728 m!1309357))

(assert (=> b!1418728 m!1309357))

(declare-fun m!1309359 () Bool)

(assert (=> b!1418728 m!1309359))

(assert (=> b!1418725 m!1309347))

(assert (=> b!1418725 m!1309347))

(declare-fun m!1309361 () Bool)

(assert (=> b!1418725 m!1309361))

(declare-fun m!1309363 () Bool)

(assert (=> b!1418726 m!1309363))

(check-sat (not start!122438) (not b!1418725) (not b!1418727) (not b!1418726) (not b!1418728) (not b!1418729))
