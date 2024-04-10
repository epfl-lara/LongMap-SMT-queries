; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118266 () Bool)

(assert start!118266)

(declare-fun b!1383331 () Bool)

(declare-fun res!924922 () Bool)

(declare-fun e!784049 () Bool)

(assert (=> b!1383331 (=> (not res!924922) (not e!784049))))

(declare-datatypes ((array!94569 0))(
  ( (array!94570 (arr!45662 (Array (_ BitVec 32) (_ BitVec 64))) (size!46212 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94569)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383331 (= res!924922 (validKeyInArray!0 (select (arr!45662 a!2938) i!1065)))))

(declare-fun b!1383332 () Bool)

(declare-fun res!924924 () Bool)

(assert (=> b!1383332 (=> (not res!924924) (not e!784049))))

(declare-datatypes ((List!32190 0))(
  ( (Nil!32187) (Cons!32186 (h!33395 (_ BitVec 64)) (t!46884 List!32190)) )
))
(declare-fun arrayNoDuplicates!0 (array!94569 (_ BitVec 32) List!32190) Bool)

(assert (=> b!1383332 (= res!924924 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32187))))

(declare-fun res!924923 () Bool)

(assert (=> start!118266 (=> (not res!924923) (not e!784049))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118266 (= res!924923 (validMask!0 mask!2987))))

(assert (=> start!118266 e!784049))

(assert (=> start!118266 true))

(declare-fun array_inv!34690 (array!94569) Bool)

(assert (=> start!118266 (array_inv!34690 a!2938)))

(declare-fun b!1383333 () Bool)

(assert (=> b!1383333 (= e!784049 false)))

(declare-fun lt!608589 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94569 (_ BitVec 32)) Bool)

(assert (=> b!1383333 (= lt!608589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383330 () Bool)

(declare-fun res!924925 () Bool)

(assert (=> b!1383330 (=> (not res!924925) (not e!784049))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383330 (= res!924925 (and (= (size!46212 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46212 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46212 a!2938))))))

(assert (= (and start!118266 res!924923) b!1383330))

(assert (= (and b!1383330 res!924925) b!1383331))

(assert (= (and b!1383331 res!924922) b!1383332))

(assert (= (and b!1383332 res!924924) b!1383333))

(declare-fun m!1268433 () Bool)

(assert (=> b!1383331 m!1268433))

(assert (=> b!1383331 m!1268433))

(declare-fun m!1268435 () Bool)

(assert (=> b!1383331 m!1268435))

(declare-fun m!1268437 () Bool)

(assert (=> b!1383332 m!1268437))

(declare-fun m!1268439 () Bool)

(assert (=> start!118266 m!1268439))

(declare-fun m!1268441 () Bool)

(assert (=> start!118266 m!1268441))

(declare-fun m!1268443 () Bool)

(assert (=> b!1383333 m!1268443))

(push 1)

(assert (not b!1383331))

(assert (not start!118266))

(assert (not b!1383332))

(assert (not b!1383333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

