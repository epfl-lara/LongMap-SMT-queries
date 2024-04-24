; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123090 () Bool)

(assert start!123090)

(declare-fun b!1426352 () Bool)

(declare-fun res!960904 () Bool)

(declare-fun e!806144 () Bool)

(assert (=> b!1426352 (=> (not res!960904) (not e!806144))))

(declare-datatypes ((array!97326 0))(
  ( (array!97327 (arr!46977 (Array (_ BitVec 32) (_ BitVec 64))) (size!47528 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97326)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426352 (= res!960904 (validKeyInArray!0 (select (arr!46977 a!2831) i!982)))))

(declare-fun b!1426353 () Bool)

(declare-fun res!960901 () Bool)

(assert (=> b!1426353 (=> (not res!960901) (not e!806144))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97326 (_ BitVec 32)) Bool)

(assert (=> b!1426353 (= res!960901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426354 () Bool)

(declare-fun res!960902 () Bool)

(assert (=> b!1426354 (=> (not res!960902) (not e!806144))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1426354 (= res!960902 (validKeyInArray!0 (select (arr!46977 a!2831) j!81)))))

(declare-fun b!1426355 () Bool)

(assert (=> b!1426355 (= e!806144 false)))

(declare-fun lt!628274 () Bool)

(declare-datatypes ((List!33474 0))(
  ( (Nil!33471) (Cons!33470 (h!34783 (_ BitVec 64)) (t!48160 List!33474)) )
))
(declare-fun arrayNoDuplicates!0 (array!97326 (_ BitVec 32) List!33474) Bool)

(assert (=> b!1426355 (= lt!628274 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33471))))

(declare-fun res!960900 () Bool)

(assert (=> start!123090 (=> (not res!960900) (not e!806144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123090 (= res!960900 (validMask!0 mask!2608))))

(assert (=> start!123090 e!806144))

(assert (=> start!123090 true))

(declare-fun array_inv!36258 (array!97326) Bool)

(assert (=> start!123090 (array_inv!36258 a!2831)))

(declare-fun b!1426356 () Bool)

(declare-fun res!960903 () Bool)

(assert (=> b!1426356 (=> (not res!960903) (not e!806144))))

(assert (=> b!1426356 (= res!960903 (and (= (size!47528 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47528 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47528 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123090 res!960900) b!1426356))

(assert (= (and b!1426356 res!960903) b!1426352))

(assert (= (and b!1426352 res!960904) b!1426354))

(assert (= (and b!1426354 res!960902) b!1426353))

(assert (= (and b!1426353 res!960901) b!1426355))

(declare-fun m!1317041 () Bool)

(assert (=> b!1426352 m!1317041))

(assert (=> b!1426352 m!1317041))

(declare-fun m!1317043 () Bool)

(assert (=> b!1426352 m!1317043))

(declare-fun m!1317045 () Bool)

(assert (=> b!1426354 m!1317045))

(assert (=> b!1426354 m!1317045))

(declare-fun m!1317047 () Bool)

(assert (=> b!1426354 m!1317047))

(declare-fun m!1317049 () Bool)

(assert (=> start!123090 m!1317049))

(declare-fun m!1317051 () Bool)

(assert (=> start!123090 m!1317051))

(declare-fun m!1317053 () Bool)

(assert (=> b!1426353 m!1317053))

(declare-fun m!1317055 () Bool)

(assert (=> b!1426355 m!1317055))

(push 1)

(assert (not start!123090))

(assert (not b!1426354))

(assert (not b!1426352))

(assert (not b!1426353))

(assert (not b!1426355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

