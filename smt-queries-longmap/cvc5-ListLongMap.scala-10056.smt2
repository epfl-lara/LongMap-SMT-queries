; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118470 () Bool)

(assert start!118470)

(declare-fun b!1385409 () Bool)

(declare-fun res!926659 () Bool)

(declare-fun e!784975 () Bool)

(assert (=> b!1385409 (=> (not res!926659) (not e!784975))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94746 0))(
  ( (array!94747 (arr!45749 (Array (_ BitVec 32) (_ BitVec 64))) (size!46299 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94746)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385409 (= res!926659 (and (= (size!46299 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46299 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46299 a!2938))))))

(declare-fun b!1385410 () Bool)

(declare-fun res!926661 () Bool)

(assert (=> b!1385410 (=> (not res!926661) (not e!784975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385410 (= res!926661 (validKeyInArray!0 (select (arr!45749 a!2938) i!1065)))))

(declare-fun b!1385411 () Bool)

(declare-fun res!926662 () Bool)

(assert (=> b!1385411 (=> (not res!926662) (not e!784975))))

(declare-datatypes ((List!32277 0))(
  ( (Nil!32274) (Cons!32273 (h!33482 (_ BitVec 64)) (t!46971 List!32277)) )
))
(declare-fun arrayNoDuplicates!0 (array!94746 (_ BitVec 32) List!32277) Bool)

(assert (=> b!1385411 (= res!926662 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32274))))

(declare-fun b!1385412 () Bool)

(assert (=> b!1385412 (= e!784975 false)))

(declare-fun lt!609237 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94746 (_ BitVec 32)) Bool)

(assert (=> b!1385412 (= lt!609237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926660 () Bool)

(assert (=> start!118470 (=> (not res!926660) (not e!784975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118470 (= res!926660 (validMask!0 mask!2987))))

(assert (=> start!118470 e!784975))

(assert (=> start!118470 true))

(declare-fun array_inv!34777 (array!94746) Bool)

(assert (=> start!118470 (array_inv!34777 a!2938)))

(assert (= (and start!118470 res!926660) b!1385409))

(assert (= (and b!1385409 res!926659) b!1385410))

(assert (= (and b!1385410 res!926661) b!1385411))

(assert (= (and b!1385411 res!926662) b!1385412))

(declare-fun m!1270701 () Bool)

(assert (=> b!1385410 m!1270701))

(assert (=> b!1385410 m!1270701))

(declare-fun m!1270703 () Bool)

(assert (=> b!1385410 m!1270703))

(declare-fun m!1270705 () Bool)

(assert (=> b!1385411 m!1270705))

(declare-fun m!1270707 () Bool)

(assert (=> b!1385412 m!1270707))

(declare-fun m!1270709 () Bool)

(assert (=> start!118470 m!1270709))

(declare-fun m!1270711 () Bool)

(assert (=> start!118470 m!1270711))

(push 1)

(assert (not b!1385412))

(assert (not b!1385410))

(assert (not start!118470))

(assert (not b!1385411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

