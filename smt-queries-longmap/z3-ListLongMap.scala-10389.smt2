; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122564 () Bool)

(assert start!122564)

(declare-fun res!954470 () Bool)

(declare-fun e!803413 () Bool)

(assert (=> start!122564 (=> (not res!954470) (not e!803413))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122564 (= res!954470 (validMask!0 mask!2608))))

(assert (=> start!122564 e!803413))

(assert (=> start!122564 true))

(declare-datatypes ((array!96962 0))(
  ( (array!96963 (arr!46801 (Array (_ BitVec 32) (_ BitVec 64))) (size!47352 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96962)

(declare-fun array_inv!36082 (array!96962) Bool)

(assert (=> start!122564 (array_inv!36082 a!2831)))

(declare-fun b!1419510 () Bool)

(declare-fun res!954467 () Bool)

(assert (=> b!1419510 (=> (not res!954467) (not e!803413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96962 (_ BitVec 32)) Bool)

(assert (=> b!1419510 (= res!954467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419511 () Bool)

(declare-fun res!954471 () Bool)

(assert (=> b!1419511 (=> (not res!954471) (not e!803413))))

(declare-datatypes ((List!33298 0))(
  ( (Nil!33295) (Cons!33294 (h!34595 (_ BitVec 64)) (t!47984 List!33298)) )
))
(declare-fun arrayNoDuplicates!0 (array!96962 (_ BitVec 32) List!33298) Bool)

(assert (=> b!1419511 (= res!954471 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33295))))

(declare-fun b!1419512 () Bool)

(declare-fun res!954468 () Bool)

(assert (=> b!1419512 (=> (not res!954468) (not e!803413))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419512 (= res!954468 (and (= (size!47352 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47352 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47352 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419513 () Bool)

(declare-fun res!954472 () Bool)

(assert (=> b!1419513 (=> (not res!954472) (not e!803413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419513 (= res!954472 (validKeyInArray!0 (select (arr!46801 a!2831) i!982)))))

(declare-fun b!1419514 () Bool)

(declare-fun res!954466 () Bool)

(assert (=> b!1419514 (=> (not res!954466) (not e!803413))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419514 (= res!954466 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47352 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47352 a!2831))))))

(declare-fun b!1419515 () Bool)

(declare-fun res!954469 () Bool)

(assert (=> b!1419515 (=> (not res!954469) (not e!803413))))

(assert (=> b!1419515 (= res!954469 (validKeyInArray!0 (select (arr!46801 a!2831) j!81)))))

(declare-fun b!1419516 () Bool)

(assert (=> b!1419516 (= e!803413 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625970 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419516 (= lt!625970 (toIndex!0 (select (arr!46801 a!2831) j!81) mask!2608))))

(assert (= (and start!122564 res!954470) b!1419512))

(assert (= (and b!1419512 res!954468) b!1419513))

(assert (= (and b!1419513 res!954472) b!1419515))

(assert (= (and b!1419515 res!954469) b!1419510))

(assert (= (and b!1419510 res!954467) b!1419511))

(assert (= (and b!1419511 res!954471) b!1419514))

(assert (= (and b!1419514 res!954466) b!1419516))

(declare-fun m!1310433 () Bool)

(assert (=> b!1419510 m!1310433))

(declare-fun m!1310435 () Bool)

(assert (=> b!1419515 m!1310435))

(assert (=> b!1419515 m!1310435))

(declare-fun m!1310437 () Bool)

(assert (=> b!1419515 m!1310437))

(declare-fun m!1310439 () Bool)

(assert (=> start!122564 m!1310439))

(declare-fun m!1310441 () Bool)

(assert (=> start!122564 m!1310441))

(declare-fun m!1310443 () Bool)

(assert (=> b!1419511 m!1310443))

(declare-fun m!1310445 () Bool)

(assert (=> b!1419513 m!1310445))

(assert (=> b!1419513 m!1310445))

(declare-fun m!1310447 () Bool)

(assert (=> b!1419513 m!1310447))

(assert (=> b!1419516 m!1310435))

(assert (=> b!1419516 m!1310435))

(declare-fun m!1310449 () Bool)

(assert (=> b!1419516 m!1310449))

(check-sat (not b!1419511) (not b!1419510) (not b!1419515) (not b!1419513) (not b!1419516) (not start!122564))
(check-sat)
