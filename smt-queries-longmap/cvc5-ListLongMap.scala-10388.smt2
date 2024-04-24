; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122562 () Bool)

(assert start!122562)

(declare-fun b!1419489 () Bool)

(declare-fun res!954450 () Bool)

(declare-fun e!803408 () Bool)

(assert (=> b!1419489 (=> (not res!954450) (not e!803408))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96960 0))(
  ( (array!96961 (arr!46800 (Array (_ BitVec 32) (_ BitVec 64))) (size!47351 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96960)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419489 (= res!954450 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47351 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47351 a!2831))))))

(declare-fun b!1419490 () Bool)

(declare-fun res!954447 () Bool)

(assert (=> b!1419490 (=> (not res!954447) (not e!803408))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419490 (= res!954447 (and (= (size!47351 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47351 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47351 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419491 () Bool)

(assert (=> b!1419491 (= e!803408 false)))

(declare-fun lt!625967 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419491 (= lt!625967 (toIndex!0 (select (arr!46800 a!2831) j!81) mask!2608))))

(declare-fun b!1419492 () Bool)

(declare-fun res!954451 () Bool)

(assert (=> b!1419492 (=> (not res!954451) (not e!803408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419492 (= res!954451 (validKeyInArray!0 (select (arr!46800 a!2831) i!982)))))

(declare-fun b!1419493 () Bool)

(declare-fun res!954448 () Bool)

(assert (=> b!1419493 (=> (not res!954448) (not e!803408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96960 (_ BitVec 32)) Bool)

(assert (=> b!1419493 (= res!954448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419494 () Bool)

(declare-fun res!954445 () Bool)

(assert (=> b!1419494 (=> (not res!954445) (not e!803408))))

(declare-datatypes ((List!33297 0))(
  ( (Nil!33294) (Cons!33293 (h!34594 (_ BitVec 64)) (t!47983 List!33297)) )
))
(declare-fun arrayNoDuplicates!0 (array!96960 (_ BitVec 32) List!33297) Bool)

(assert (=> b!1419494 (= res!954445 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33294))))

(declare-fun b!1419495 () Bool)

(declare-fun res!954449 () Bool)

(assert (=> b!1419495 (=> (not res!954449) (not e!803408))))

(assert (=> b!1419495 (= res!954449 (validKeyInArray!0 (select (arr!46800 a!2831) j!81)))))

(declare-fun res!954446 () Bool)

(assert (=> start!122562 (=> (not res!954446) (not e!803408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122562 (= res!954446 (validMask!0 mask!2608))))

(assert (=> start!122562 e!803408))

(assert (=> start!122562 true))

(declare-fun array_inv!36081 (array!96960) Bool)

(assert (=> start!122562 (array_inv!36081 a!2831)))

(assert (= (and start!122562 res!954446) b!1419490))

(assert (= (and b!1419490 res!954447) b!1419492))

(assert (= (and b!1419492 res!954451) b!1419495))

(assert (= (and b!1419495 res!954449) b!1419493))

(assert (= (and b!1419493 res!954448) b!1419494))

(assert (= (and b!1419494 res!954445) b!1419489))

(assert (= (and b!1419489 res!954450) b!1419491))

(declare-fun m!1310415 () Bool)

(assert (=> b!1419494 m!1310415))

(declare-fun m!1310417 () Bool)

(assert (=> b!1419493 m!1310417))

(declare-fun m!1310419 () Bool)

(assert (=> b!1419495 m!1310419))

(assert (=> b!1419495 m!1310419))

(declare-fun m!1310421 () Bool)

(assert (=> b!1419495 m!1310421))

(declare-fun m!1310423 () Bool)

(assert (=> b!1419492 m!1310423))

(assert (=> b!1419492 m!1310423))

(declare-fun m!1310425 () Bool)

(assert (=> b!1419492 m!1310425))

(declare-fun m!1310427 () Bool)

(assert (=> start!122562 m!1310427))

(declare-fun m!1310429 () Bool)

(assert (=> start!122562 m!1310429))

(assert (=> b!1419491 m!1310419))

(assert (=> b!1419491 m!1310419))

(declare-fun m!1310431 () Bool)

(assert (=> b!1419491 m!1310431))

(push 1)

(assert (not b!1419492))

(assert (not b!1419495))

(assert (not b!1419494))

(assert (not b!1419491))

(assert (not b!1419493))

(assert (not start!122562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

