; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122372 () Bool)

(assert start!122372)

(declare-fun b!1418328 () Bool)

(declare-fun res!953973 () Bool)

(declare-fun e!802664 () Bool)

(assert (=> b!1418328 (=> (not res!953973) (not e!802664))))

(declare-datatypes ((array!96848 0))(
  ( (array!96849 (arr!46746 (Array (_ BitVec 32) (_ BitVec 64))) (size!47296 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96848)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418328 (= res!953973 (validKeyInArray!0 (select (arr!46746 a!2831) i!982)))))

(declare-fun b!1418329 () Bool)

(declare-fun res!953974 () Bool)

(assert (=> b!1418329 (=> (not res!953974) (not e!802664))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418329 (= res!953974 (validKeyInArray!0 (select (arr!46746 a!2831) j!81)))))

(declare-fun res!953970 () Bool)

(assert (=> start!122372 (=> (not res!953970) (not e!802664))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122372 (= res!953970 (validMask!0 mask!2608))))

(assert (=> start!122372 e!802664))

(assert (=> start!122372 true))

(declare-fun array_inv!35774 (array!96848) Bool)

(assert (=> start!122372 (array_inv!35774 a!2831)))

(declare-fun b!1418330 () Bool)

(declare-fun res!953969 () Bool)

(assert (=> b!1418330 (=> (not res!953969) (not e!802664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96848 (_ BitVec 32)) Bool)

(assert (=> b!1418330 (= res!953969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418331 () Bool)

(assert (=> b!1418331 (= e!802664 false)))

(declare-fun lt!625566 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418331 (= lt!625566 (toIndex!0 (select (arr!46746 a!2831) j!81) mask!2608))))

(declare-fun b!1418332 () Bool)

(declare-fun res!953971 () Bool)

(assert (=> b!1418332 (=> (not res!953971) (not e!802664))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418332 (= res!953971 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47296 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47296 a!2831))))))

(declare-fun b!1418333 () Bool)

(declare-fun res!953972 () Bool)

(assert (=> b!1418333 (=> (not res!953972) (not e!802664))))

(assert (=> b!1418333 (= res!953972 (and (= (size!47296 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47296 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47296 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418334 () Bool)

(declare-fun res!953968 () Bool)

(assert (=> b!1418334 (=> (not res!953968) (not e!802664))))

(declare-datatypes ((List!33256 0))(
  ( (Nil!33253) (Cons!33252 (h!34545 (_ BitVec 64)) (t!47950 List!33256)) )
))
(declare-fun arrayNoDuplicates!0 (array!96848 (_ BitVec 32) List!33256) Bool)

(assert (=> b!1418334 (= res!953968 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33253))))

(assert (= (and start!122372 res!953970) b!1418333))

(assert (= (and b!1418333 res!953972) b!1418328))

(assert (= (and b!1418328 res!953973) b!1418329))

(assert (= (and b!1418329 res!953974) b!1418330))

(assert (= (and b!1418330 res!953969) b!1418334))

(assert (= (and b!1418334 res!953968) b!1418332))

(assert (= (and b!1418332 res!953971) b!1418331))

(declare-fun m!1309029 () Bool)

(assert (=> b!1418334 m!1309029))

(declare-fun m!1309031 () Bool)

(assert (=> start!122372 m!1309031))

(declare-fun m!1309033 () Bool)

(assert (=> start!122372 m!1309033))

(declare-fun m!1309035 () Bool)

(assert (=> b!1418330 m!1309035))

(declare-fun m!1309037 () Bool)

(assert (=> b!1418328 m!1309037))

(assert (=> b!1418328 m!1309037))

(declare-fun m!1309039 () Bool)

(assert (=> b!1418328 m!1309039))

(declare-fun m!1309041 () Bool)

(assert (=> b!1418329 m!1309041))

(assert (=> b!1418329 m!1309041))

(declare-fun m!1309043 () Bool)

(assert (=> b!1418329 m!1309043))

(assert (=> b!1418331 m!1309041))

(assert (=> b!1418331 m!1309041))

(declare-fun m!1309045 () Bool)

(assert (=> b!1418331 m!1309045))

(check-sat (not b!1418331) (not b!1418330) (not start!122372) (not b!1418328) (not b!1418334) (not b!1418329))
