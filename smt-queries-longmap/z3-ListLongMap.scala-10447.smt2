; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122846 () Bool)

(assert start!122846)

(declare-fun b!1424888 () Bool)

(declare-fun res!960321 () Bool)

(declare-fun e!805210 () Bool)

(assert (=> b!1424888 (=> (not res!960321) (not e!805210))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97211 0))(
  ( (array!97212 (arr!46923 (Array (_ BitVec 32) (_ BitVec 64))) (size!47473 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97211)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1424888 (= res!960321 (and (= (size!47473 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47473 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47473 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424890 () Bool)

(declare-fun res!960323 () Bool)

(assert (=> b!1424890 (=> (not res!960323) (not e!805210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424890 (= res!960323 (validKeyInArray!0 (select (arr!46923 a!2831) j!81)))))

(declare-fun b!1424891 () Bool)

(declare-fun res!960324 () Bool)

(assert (=> b!1424891 (=> (not res!960324) (not e!805210))))

(assert (=> b!1424891 (= res!960324 (validKeyInArray!0 (select (arr!46923 a!2831) i!982)))))

(declare-fun b!1424892 () Bool)

(assert (=> b!1424892 (= e!805210 false)))

(declare-fun lt!627741 () Bool)

(declare-datatypes ((List!33433 0))(
  ( (Nil!33430) (Cons!33429 (h!34731 (_ BitVec 64)) (t!48127 List!33433)) )
))
(declare-fun arrayNoDuplicates!0 (array!97211 (_ BitVec 32) List!33433) Bool)

(assert (=> b!1424892 (= lt!627741 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33430))))

(declare-fun res!960322 () Bool)

(assert (=> start!122846 (=> (not res!960322) (not e!805210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122846 (= res!960322 (validMask!0 mask!2608))))

(assert (=> start!122846 e!805210))

(assert (=> start!122846 true))

(declare-fun array_inv!35951 (array!97211) Bool)

(assert (=> start!122846 (array_inv!35951 a!2831)))

(declare-fun b!1424889 () Bool)

(declare-fun res!960325 () Bool)

(assert (=> b!1424889 (=> (not res!960325) (not e!805210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97211 (_ BitVec 32)) Bool)

(assert (=> b!1424889 (= res!960325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122846 res!960322) b!1424888))

(assert (= (and b!1424888 res!960321) b!1424891))

(assert (= (and b!1424891 res!960324) b!1424890))

(assert (= (and b!1424890 res!960323) b!1424889))

(assert (= (and b!1424889 res!960325) b!1424892))

(declare-fun m!1315459 () Bool)

(assert (=> b!1424889 m!1315459))

(declare-fun m!1315461 () Bool)

(assert (=> start!122846 m!1315461))

(declare-fun m!1315463 () Bool)

(assert (=> start!122846 m!1315463))

(declare-fun m!1315465 () Bool)

(assert (=> b!1424892 m!1315465))

(declare-fun m!1315467 () Bool)

(assert (=> b!1424890 m!1315467))

(assert (=> b!1424890 m!1315467))

(declare-fun m!1315469 () Bool)

(assert (=> b!1424890 m!1315469))

(declare-fun m!1315471 () Bool)

(assert (=> b!1424891 m!1315471))

(assert (=> b!1424891 m!1315471))

(declare-fun m!1315473 () Bool)

(assert (=> b!1424891 m!1315473))

(check-sat (not b!1424889) (not start!122846) (not b!1424891) (not b!1424890) (not b!1424892))
