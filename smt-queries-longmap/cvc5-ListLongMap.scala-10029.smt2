; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118278 () Bool)

(assert start!118278)

(declare-fun b!1383403 () Bool)

(declare-fun res!924995 () Bool)

(declare-fun e!784084 () Bool)

(assert (=> b!1383403 (=> (not res!924995) (not e!784084))))

(declare-datatypes ((array!94581 0))(
  ( (array!94582 (arr!45668 (Array (_ BitVec 32) (_ BitVec 64))) (size!46218 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94581)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383403 (= res!924995 (validKeyInArray!0 (select (arr!45668 a!2938) i!1065)))))

(declare-fun b!1383404 () Bool)

(declare-fun res!924996 () Bool)

(assert (=> b!1383404 (=> (not res!924996) (not e!784084))))

(declare-datatypes ((List!32196 0))(
  ( (Nil!32193) (Cons!32192 (h!33401 (_ BitVec 64)) (t!46890 List!32196)) )
))
(declare-fun arrayNoDuplicates!0 (array!94581 (_ BitVec 32) List!32196) Bool)

(assert (=> b!1383404 (= res!924996 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32193))))

(declare-fun b!1383402 () Bool)

(declare-fun res!924997 () Bool)

(assert (=> b!1383402 (=> (not res!924997) (not e!784084))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383402 (= res!924997 (and (= (size!46218 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46218 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46218 a!2938))))))

(declare-fun res!924994 () Bool)

(assert (=> start!118278 (=> (not res!924994) (not e!784084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118278 (= res!924994 (validMask!0 mask!2987))))

(assert (=> start!118278 e!784084))

(assert (=> start!118278 true))

(declare-fun array_inv!34696 (array!94581) Bool)

(assert (=> start!118278 (array_inv!34696 a!2938)))

(declare-fun b!1383405 () Bool)

(assert (=> b!1383405 (= e!784084 false)))

(declare-fun lt!608607 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94581 (_ BitVec 32)) Bool)

(assert (=> b!1383405 (= lt!608607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118278 res!924994) b!1383402))

(assert (= (and b!1383402 res!924997) b!1383403))

(assert (= (and b!1383403 res!924995) b!1383404))

(assert (= (and b!1383404 res!924996) b!1383405))

(declare-fun m!1268505 () Bool)

(assert (=> b!1383403 m!1268505))

(assert (=> b!1383403 m!1268505))

(declare-fun m!1268507 () Bool)

(assert (=> b!1383403 m!1268507))

(declare-fun m!1268509 () Bool)

(assert (=> b!1383404 m!1268509))

(declare-fun m!1268511 () Bool)

(assert (=> start!118278 m!1268511))

(declare-fun m!1268513 () Bool)

(assert (=> start!118278 m!1268513))

(declare-fun m!1268515 () Bool)

(assert (=> b!1383405 m!1268515))

(push 1)

(assert (not b!1383403))

(assert (not start!118278))

(assert (not b!1383404))

(assert (not b!1383405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

