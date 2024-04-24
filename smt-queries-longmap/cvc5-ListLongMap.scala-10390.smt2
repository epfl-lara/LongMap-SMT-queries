; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122574 () Bool)

(assert start!122574)

(declare-fun b!1419615 () Bool)

(declare-fun res!954571 () Bool)

(declare-fun e!803443 () Bool)

(assert (=> b!1419615 (=> (not res!954571) (not e!803443))))

(declare-datatypes ((array!96972 0))(
  ( (array!96973 (arr!46806 (Array (_ BitVec 32) (_ BitVec 64))) (size!47357 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96972)

(declare-datatypes ((List!33303 0))(
  ( (Nil!33300) (Cons!33299 (h!34600 (_ BitVec 64)) (t!47989 List!33303)) )
))
(declare-fun arrayNoDuplicates!0 (array!96972 (_ BitVec 32) List!33303) Bool)

(assert (=> b!1419615 (= res!954571 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33300))))

(declare-fun res!954576 () Bool)

(assert (=> start!122574 (=> (not res!954576) (not e!803443))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122574 (= res!954576 (validMask!0 mask!2608))))

(assert (=> start!122574 e!803443))

(assert (=> start!122574 true))

(declare-fun array_inv!36087 (array!96972) Bool)

(assert (=> start!122574 (array_inv!36087 a!2831)))

(declare-fun b!1419616 () Bool)

(declare-fun res!954577 () Bool)

(assert (=> b!1419616 (=> (not res!954577) (not e!803443))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419616 (= res!954577 (validKeyInArray!0 (select (arr!46806 a!2831) j!81)))))

(declare-fun b!1419617 () Bool)

(assert (=> b!1419617 (= e!803443 false)))

(declare-fun lt!625985 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419617 (= lt!625985 (toIndex!0 (select (arr!46806 a!2831) j!81) mask!2608))))

(declare-fun b!1419618 () Bool)

(declare-fun res!954572 () Bool)

(assert (=> b!1419618 (=> (not res!954572) (not e!803443))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419618 (= res!954572 (validKeyInArray!0 (select (arr!46806 a!2831) i!982)))))

(declare-fun b!1419619 () Bool)

(declare-fun res!954575 () Bool)

(assert (=> b!1419619 (=> (not res!954575) (not e!803443))))

(assert (=> b!1419619 (= res!954575 (and (= (size!47357 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47357 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47357 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419620 () Bool)

(declare-fun res!954574 () Bool)

(assert (=> b!1419620 (=> (not res!954574) (not e!803443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96972 (_ BitVec 32)) Bool)

(assert (=> b!1419620 (= res!954574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419621 () Bool)

(declare-fun res!954573 () Bool)

(assert (=> b!1419621 (=> (not res!954573) (not e!803443))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419621 (= res!954573 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47357 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47357 a!2831))))))

(assert (= (and start!122574 res!954576) b!1419619))

(assert (= (and b!1419619 res!954575) b!1419618))

(assert (= (and b!1419618 res!954572) b!1419616))

(assert (= (and b!1419616 res!954577) b!1419620))

(assert (= (and b!1419620 res!954574) b!1419615))

(assert (= (and b!1419615 res!954571) b!1419621))

(assert (= (and b!1419621 res!954573) b!1419617))

(declare-fun m!1310523 () Bool)

(assert (=> start!122574 m!1310523))

(declare-fun m!1310525 () Bool)

(assert (=> start!122574 m!1310525))

(declare-fun m!1310527 () Bool)

(assert (=> b!1419620 m!1310527))

(declare-fun m!1310529 () Bool)

(assert (=> b!1419616 m!1310529))

(assert (=> b!1419616 m!1310529))

(declare-fun m!1310531 () Bool)

(assert (=> b!1419616 m!1310531))

(declare-fun m!1310533 () Bool)

(assert (=> b!1419618 m!1310533))

(assert (=> b!1419618 m!1310533))

(declare-fun m!1310535 () Bool)

(assert (=> b!1419618 m!1310535))

(declare-fun m!1310537 () Bool)

(assert (=> b!1419615 m!1310537))

(assert (=> b!1419617 m!1310529))

(assert (=> b!1419617 m!1310529))

(declare-fun m!1310539 () Bool)

(assert (=> b!1419617 m!1310539))

(push 1)

(assert (not b!1419616))

(assert (not b!1419615))

(assert (not b!1419620))

(assert (not b!1419617))

(assert (not b!1419618))

(assert (not start!122574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

