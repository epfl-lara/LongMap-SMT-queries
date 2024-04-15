; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122562 () Bool)

(assert start!122562)

(declare-fun b!1419491 () Bool)

(declare-fun res!954982 () Bool)

(declare-fun e!803126 () Bool)

(assert (=> b!1419491 (=> (not res!954982) (not e!803126))))

(declare-datatypes ((array!96880 0))(
  ( (array!96881 (arr!46758 (Array (_ BitVec 32) (_ BitVec 64))) (size!47310 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96880)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96880 (_ BitVec 32)) Bool)

(assert (=> b!1419491 (= res!954982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419492 () Bool)

(declare-fun res!954978 () Bool)

(assert (=> b!1419492 (=> (not res!954978) (not e!803126))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419492 (= res!954978 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47310 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47310 a!2831))))))

(declare-fun res!954981 () Bool)

(assert (=> start!122562 (=> (not res!954981) (not e!803126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122562 (= res!954981 (validMask!0 mask!2608))))

(assert (=> start!122562 e!803126))

(assert (=> start!122562 true))

(declare-fun array_inv!35991 (array!96880) Bool)

(assert (=> start!122562 (array_inv!35991 a!2831)))

(declare-fun b!1419493 () Bool)

(declare-fun res!954980 () Bool)

(assert (=> b!1419493 (=> (not res!954980) (not e!803126))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419493 (= res!954980 (validKeyInArray!0 (select (arr!46758 a!2831) j!81)))))

(declare-fun b!1419494 () Bool)

(assert (=> b!1419494 (= e!803126 false)))

(declare-fun lt!625646 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419494 (= lt!625646 (toIndex!0 (select (store (arr!46758 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419495 () Bool)

(declare-fun res!954975 () Bool)

(assert (=> b!1419495 (=> (not res!954975) (not e!803126))))

(assert (=> b!1419495 (= res!954975 (and (= (size!47310 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47310 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47310 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419496 () Bool)

(declare-fun res!954976 () Bool)

(assert (=> b!1419496 (=> (not res!954976) (not e!803126))))

(assert (=> b!1419496 (= res!954976 (validKeyInArray!0 (select (arr!46758 a!2831) i!982)))))

(declare-fun b!1419497 () Bool)

(declare-fun res!954979 () Bool)

(assert (=> b!1419497 (=> (not res!954979) (not e!803126))))

(declare-datatypes ((List!33346 0))(
  ( (Nil!33343) (Cons!33342 (h!34644 (_ BitVec 64)) (t!48032 List!33346)) )
))
(declare-fun arrayNoDuplicates!0 (array!96880 (_ BitVec 32) List!33346) Bool)

(assert (=> b!1419497 (= res!954979 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33343))))

(declare-fun b!1419498 () Bool)

(declare-fun res!954977 () Bool)

(assert (=> b!1419498 (=> (not res!954977) (not e!803126))))

(declare-datatypes ((SeekEntryResult!11070 0))(
  ( (MissingZero!11070 (index!46672 (_ BitVec 32))) (Found!11070 (index!46673 (_ BitVec 32))) (Intermediate!11070 (undefined!11882 Bool) (index!46674 (_ BitVec 32)) (x!128333 (_ BitVec 32))) (Undefined!11070) (MissingVacant!11070 (index!46675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96880 (_ BitVec 32)) SeekEntryResult!11070)

(assert (=> b!1419498 (= res!954977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46758 a!2831) j!81) mask!2608) (select (arr!46758 a!2831) j!81) a!2831 mask!2608) (Intermediate!11070 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122562 res!954981) b!1419495))

(assert (= (and b!1419495 res!954975) b!1419496))

(assert (= (and b!1419496 res!954976) b!1419493))

(assert (= (and b!1419493 res!954980) b!1419491))

(assert (= (and b!1419491 res!954982) b!1419497))

(assert (= (and b!1419497 res!954979) b!1419492))

(assert (= (and b!1419492 res!954978) b!1419498))

(assert (= (and b!1419498 res!954977) b!1419494))

(declare-fun m!1309459 () Bool)

(assert (=> start!122562 m!1309459))

(declare-fun m!1309461 () Bool)

(assert (=> start!122562 m!1309461))

(declare-fun m!1309463 () Bool)

(assert (=> b!1419493 m!1309463))

(assert (=> b!1419493 m!1309463))

(declare-fun m!1309465 () Bool)

(assert (=> b!1419493 m!1309465))

(declare-fun m!1309467 () Bool)

(assert (=> b!1419491 m!1309467))

(declare-fun m!1309469 () Bool)

(assert (=> b!1419496 m!1309469))

(assert (=> b!1419496 m!1309469))

(declare-fun m!1309471 () Bool)

(assert (=> b!1419496 m!1309471))

(assert (=> b!1419498 m!1309463))

(assert (=> b!1419498 m!1309463))

(declare-fun m!1309473 () Bool)

(assert (=> b!1419498 m!1309473))

(assert (=> b!1419498 m!1309473))

(assert (=> b!1419498 m!1309463))

(declare-fun m!1309475 () Bool)

(assert (=> b!1419498 m!1309475))

(declare-fun m!1309477 () Bool)

(assert (=> b!1419497 m!1309477))

(declare-fun m!1309479 () Bool)

(assert (=> b!1419494 m!1309479))

(declare-fun m!1309481 () Bool)

(assert (=> b!1419494 m!1309481))

(assert (=> b!1419494 m!1309481))

(declare-fun m!1309483 () Bool)

(assert (=> b!1419494 m!1309483))

(push 1)

(assert (not b!1419498))

(assert (not b!1419493))

(assert (not b!1419494))

(assert (not b!1419497))

(assert (not b!1419491))

(assert (not b!1419496))

(assert (not start!122562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

