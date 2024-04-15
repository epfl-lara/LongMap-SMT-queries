; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122382 () Bool)

(assert start!122382)

(declare-fun b!1418394 () Bool)

(declare-fun res!954088 () Bool)

(declare-fun e!802666 () Bool)

(assert (=> b!1418394 (=> (not res!954088) (not e!802666))))

(declare-datatypes ((array!96811 0))(
  ( (array!96812 (arr!46728 (Array (_ BitVec 32) (_ BitVec 64))) (size!47280 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96811)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96811 (_ BitVec 32)) Bool)

(assert (=> b!1418394 (= res!954088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418395 () Bool)

(assert (=> b!1418395 (= e!802666 false)))

(declare-fun lt!625397 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418395 (= lt!625397 (toIndex!0 (select (arr!46728 a!2831) j!81) mask!2608))))

(declare-fun b!1418396 () Bool)

(declare-fun res!954091 () Bool)

(assert (=> b!1418396 (=> (not res!954091) (not e!802666))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418396 (= res!954091 (and (= (size!47280 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47280 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47280 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418397 () Bool)

(declare-fun res!954087 () Bool)

(assert (=> b!1418397 (=> (not res!954087) (not e!802666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418397 (= res!954087 (validKeyInArray!0 (select (arr!46728 a!2831) i!982)))))

(declare-fun b!1418398 () Bool)

(declare-fun res!954085 () Bool)

(assert (=> b!1418398 (=> (not res!954085) (not e!802666))))

(declare-datatypes ((List!33316 0))(
  ( (Nil!33313) (Cons!33312 (h!34605 (_ BitVec 64)) (t!48002 List!33316)) )
))
(declare-fun arrayNoDuplicates!0 (array!96811 (_ BitVec 32) List!33316) Bool)

(assert (=> b!1418398 (= res!954085 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33313))))

(declare-fun b!1418399 () Bool)

(declare-fun res!954090 () Bool)

(assert (=> b!1418399 (=> (not res!954090) (not e!802666))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418399 (= res!954090 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47280 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47280 a!2831))))))

(declare-fun b!1418400 () Bool)

(declare-fun res!954086 () Bool)

(assert (=> b!1418400 (=> (not res!954086) (not e!802666))))

(assert (=> b!1418400 (= res!954086 (validKeyInArray!0 (select (arr!46728 a!2831) j!81)))))

(declare-fun res!954089 () Bool)

(assert (=> start!122382 (=> (not res!954089) (not e!802666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122382 (= res!954089 (validMask!0 mask!2608))))

(assert (=> start!122382 e!802666))

(assert (=> start!122382 true))

(declare-fun array_inv!35961 (array!96811) Bool)

(assert (=> start!122382 (array_inv!35961 a!2831)))

(assert (= (and start!122382 res!954089) b!1418396))

(assert (= (and b!1418396 res!954091) b!1418397))

(assert (= (and b!1418397 res!954087) b!1418400))

(assert (= (and b!1418400 res!954086) b!1418394))

(assert (= (and b!1418394 res!954088) b!1418398))

(assert (= (and b!1418398 res!954085) b!1418399))

(assert (= (and b!1418399 res!954090) b!1418395))

(declare-fun m!1308611 () Bool)

(assert (=> b!1418394 m!1308611))

(declare-fun m!1308613 () Bool)

(assert (=> b!1418398 m!1308613))

(declare-fun m!1308615 () Bool)

(assert (=> start!122382 m!1308615))

(declare-fun m!1308617 () Bool)

(assert (=> start!122382 m!1308617))

(declare-fun m!1308619 () Bool)

(assert (=> b!1418395 m!1308619))

(assert (=> b!1418395 m!1308619))

(declare-fun m!1308621 () Bool)

(assert (=> b!1418395 m!1308621))

(declare-fun m!1308623 () Bool)

(assert (=> b!1418397 m!1308623))

(assert (=> b!1418397 m!1308623))

(declare-fun m!1308625 () Bool)

(assert (=> b!1418397 m!1308625))

(assert (=> b!1418400 m!1308619))

(assert (=> b!1418400 m!1308619))

(declare-fun m!1308627 () Bool)

(assert (=> b!1418400 m!1308627))

(push 1)

(assert (not b!1418397))

(assert (not b!1418398))

(assert (not b!1418400))

(assert (not b!1418394))

(assert (not b!1418395))

(assert (not start!122382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

