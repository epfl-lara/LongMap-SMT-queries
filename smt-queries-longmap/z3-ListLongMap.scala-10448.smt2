; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122852 () Bool)

(assert start!122852)

(declare-fun b!1424943 () Bool)

(declare-fun res!960382 () Bool)

(declare-fun e!805229 () Bool)

(assert (=> b!1424943 (=> (not res!960382) (not e!805229))))

(declare-datatypes ((array!97217 0))(
  ( (array!97218 (arr!46926 (Array (_ BitVec 32) (_ BitVec 64))) (size!47476 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97217)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424943 (= res!960382 (validKeyInArray!0 (select (arr!46926 a!2831) j!81)))))

(declare-fun b!1424944 () Bool)

(declare-fun res!960381 () Bool)

(assert (=> b!1424944 (=> (not res!960381) (not e!805229))))

(declare-datatypes ((List!33436 0))(
  ( (Nil!33433) (Cons!33432 (h!34734 (_ BitVec 64)) (t!48130 List!33436)) )
))
(declare-fun arrayNoDuplicates!0 (array!97217 (_ BitVec 32) List!33436) Bool)

(assert (=> b!1424944 (= res!960381 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33433))))

(declare-fun b!1424945 () Bool)

(declare-fun res!960380 () Bool)

(assert (=> b!1424945 (=> (not res!960380) (not e!805229))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97217 (_ BitVec 32)) Bool)

(assert (=> b!1424945 (= res!960380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424946 () Bool)

(declare-fun res!960377 () Bool)

(assert (=> b!1424946 (=> (not res!960377) (not e!805229))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424946 (= res!960377 (validKeyInArray!0 (select (arr!46926 a!2831) i!982)))))

(declare-fun b!1424947 () Bool)

(declare-fun res!960378 () Bool)

(assert (=> b!1424947 (=> (not res!960378) (not e!805229))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424947 (= res!960378 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47476 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47476 a!2831))))))

(declare-fun b!1424948 () Bool)

(assert (=> b!1424948 (= e!805229 false)))

(declare-fun lt!627750 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424948 (= lt!627750 (toIndex!0 (select (arr!46926 a!2831) j!81) mask!2608))))

(declare-fun b!1424949 () Bool)

(declare-fun res!960379 () Bool)

(assert (=> b!1424949 (=> (not res!960379) (not e!805229))))

(assert (=> b!1424949 (= res!960379 (and (= (size!47476 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47476 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47476 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960376 () Bool)

(assert (=> start!122852 (=> (not res!960376) (not e!805229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122852 (= res!960376 (validMask!0 mask!2608))))

(assert (=> start!122852 e!805229))

(assert (=> start!122852 true))

(declare-fun array_inv!35954 (array!97217) Bool)

(assert (=> start!122852 (array_inv!35954 a!2831)))

(assert (= (and start!122852 res!960376) b!1424949))

(assert (= (and b!1424949 res!960379) b!1424946))

(assert (= (and b!1424946 res!960377) b!1424943))

(assert (= (and b!1424943 res!960382) b!1424945))

(assert (= (and b!1424945 res!960380) b!1424944))

(assert (= (and b!1424944 res!960381) b!1424947))

(assert (= (and b!1424947 res!960378) b!1424948))

(declare-fun m!1315509 () Bool)

(assert (=> start!122852 m!1315509))

(declare-fun m!1315511 () Bool)

(assert (=> start!122852 m!1315511))

(declare-fun m!1315513 () Bool)

(assert (=> b!1424943 m!1315513))

(assert (=> b!1424943 m!1315513))

(declare-fun m!1315515 () Bool)

(assert (=> b!1424943 m!1315515))

(declare-fun m!1315517 () Bool)

(assert (=> b!1424944 m!1315517))

(assert (=> b!1424948 m!1315513))

(assert (=> b!1424948 m!1315513))

(declare-fun m!1315519 () Bool)

(assert (=> b!1424948 m!1315519))

(declare-fun m!1315521 () Bool)

(assert (=> b!1424946 m!1315521))

(assert (=> b!1424946 m!1315521))

(declare-fun m!1315523 () Bool)

(assert (=> b!1424946 m!1315523))

(declare-fun m!1315525 () Bool)

(assert (=> b!1424945 m!1315525))

(check-sat (not b!1424945) (not b!1424944) (not b!1424948) (not start!122852) (not b!1424946) (not b!1424943))
