; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122430 () Bool)

(assert start!122430)

(declare-fun b!1418601 () Bool)

(declare-fun res!954259 () Bool)

(declare-fun e!802765 () Bool)

(assert (=> b!1418601 (=> (not res!954259) (not e!802765))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96826 0))(
  ( (array!96827 (arr!46734 (Array (_ BitVec 32) (_ BitVec 64))) (size!47286 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96826)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418601 (= res!954259 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47286 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47286 a!2831))))))

(declare-fun b!1418602 () Bool)

(declare-fun res!954265 () Bool)

(assert (=> b!1418602 (=> (not res!954265) (not e!802765))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418602 (= res!954265 (validKeyInArray!0 (select (arr!46734 a!2831) j!81)))))

(declare-fun res!954262 () Bool)

(assert (=> start!122430 (=> (not res!954262) (not e!802765))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122430 (= res!954262 (validMask!0 mask!2608))))

(assert (=> start!122430 e!802765))

(assert (=> start!122430 true))

(declare-fun array_inv!35967 (array!96826) Bool)

(assert (=> start!122430 (array_inv!35967 a!2831)))

(declare-fun b!1418603 () Bool)

(declare-fun res!954260 () Bool)

(assert (=> b!1418603 (=> (not res!954260) (not e!802765))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418603 (= res!954260 (and (= (size!47286 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47286 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47286 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418604 () Bool)

(declare-fun res!954264 () Bool)

(assert (=> b!1418604 (=> (not res!954264) (not e!802765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96826 (_ BitVec 32)) Bool)

(assert (=> b!1418604 (= res!954264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418605 () Bool)

(assert (=> b!1418605 (= e!802765 false)))

(declare-fun lt!625460 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418605 (= lt!625460 (toIndex!0 (select (arr!46734 a!2831) j!81) mask!2608))))

(declare-fun b!1418606 () Bool)

(declare-fun res!954261 () Bool)

(assert (=> b!1418606 (=> (not res!954261) (not e!802765))))

(declare-datatypes ((List!33322 0))(
  ( (Nil!33319) (Cons!33318 (h!34614 (_ BitVec 64)) (t!48008 List!33322)) )
))
(declare-fun arrayNoDuplicates!0 (array!96826 (_ BitVec 32) List!33322) Bool)

(assert (=> b!1418606 (= res!954261 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33319))))

(declare-fun b!1418607 () Bool)

(declare-fun res!954263 () Bool)

(assert (=> b!1418607 (=> (not res!954263) (not e!802765))))

(assert (=> b!1418607 (= res!954263 (validKeyInArray!0 (select (arr!46734 a!2831) i!982)))))

(assert (= (and start!122430 res!954262) b!1418603))

(assert (= (and b!1418603 res!954260) b!1418607))

(assert (= (and b!1418607 res!954263) b!1418602))

(assert (= (and b!1418602 res!954265) b!1418604))

(assert (= (and b!1418604 res!954264) b!1418606))

(assert (= (and b!1418606 res!954261) b!1418601))

(assert (= (and b!1418601 res!954259) b!1418605))

(declare-fun m!1308767 () Bool)

(assert (=> b!1418604 m!1308767))

(declare-fun m!1308769 () Bool)

(assert (=> b!1418606 m!1308769))

(declare-fun m!1308771 () Bool)

(assert (=> b!1418602 m!1308771))

(assert (=> b!1418602 m!1308771))

(declare-fun m!1308773 () Bool)

(assert (=> b!1418602 m!1308773))

(assert (=> b!1418605 m!1308771))

(assert (=> b!1418605 m!1308771))

(declare-fun m!1308775 () Bool)

(assert (=> b!1418605 m!1308775))

(declare-fun m!1308777 () Bool)

(assert (=> start!122430 m!1308777))

(declare-fun m!1308779 () Bool)

(assert (=> start!122430 m!1308779))

(declare-fun m!1308781 () Bool)

(assert (=> b!1418607 m!1308781))

(assert (=> b!1418607 m!1308781))

(declare-fun m!1308783 () Bool)

(assert (=> b!1418607 m!1308783))

(push 1)

(assert (not b!1418607))

(assert (not b!1418604))

(assert (not start!122430))

(assert (not b!1418605))

(assert (not b!1418602))

(assert (not b!1418606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

