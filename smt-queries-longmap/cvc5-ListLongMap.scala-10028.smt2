; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118272 () Bool)

(assert start!118272)

(declare-fun b!1383366 () Bool)

(declare-fun res!924960 () Bool)

(declare-fun e!784067 () Bool)

(assert (=> b!1383366 (=> (not res!924960) (not e!784067))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94575 0))(
  ( (array!94576 (arr!45665 (Array (_ BitVec 32) (_ BitVec 64))) (size!46215 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94575)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383366 (= res!924960 (and (= (size!46215 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46215 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46215 a!2938))))))

(declare-fun b!1383368 () Bool)

(declare-fun res!924961 () Bool)

(assert (=> b!1383368 (=> (not res!924961) (not e!784067))))

(declare-datatypes ((List!32193 0))(
  ( (Nil!32190) (Cons!32189 (h!33398 (_ BitVec 64)) (t!46887 List!32193)) )
))
(declare-fun arrayNoDuplicates!0 (array!94575 (_ BitVec 32) List!32193) Bool)

(assert (=> b!1383368 (= res!924961 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32190))))

(declare-fun res!924959 () Bool)

(assert (=> start!118272 (=> (not res!924959) (not e!784067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118272 (= res!924959 (validMask!0 mask!2987))))

(assert (=> start!118272 e!784067))

(assert (=> start!118272 true))

(declare-fun array_inv!34693 (array!94575) Bool)

(assert (=> start!118272 (array_inv!34693 a!2938)))

(declare-fun b!1383367 () Bool)

(declare-fun res!924958 () Bool)

(assert (=> b!1383367 (=> (not res!924958) (not e!784067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383367 (= res!924958 (validKeyInArray!0 (select (arr!45665 a!2938) i!1065)))))

(declare-fun b!1383369 () Bool)

(assert (=> b!1383369 (= e!784067 false)))

(declare-fun lt!608598 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94575 (_ BitVec 32)) Bool)

(assert (=> b!1383369 (= lt!608598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118272 res!924959) b!1383366))

(assert (= (and b!1383366 res!924960) b!1383367))

(assert (= (and b!1383367 res!924958) b!1383368))

(assert (= (and b!1383368 res!924961) b!1383369))

(declare-fun m!1268469 () Bool)

(assert (=> b!1383368 m!1268469))

(declare-fun m!1268471 () Bool)

(assert (=> start!118272 m!1268471))

(declare-fun m!1268473 () Bool)

(assert (=> start!118272 m!1268473))

(declare-fun m!1268475 () Bool)

(assert (=> b!1383367 m!1268475))

(assert (=> b!1383367 m!1268475))

(declare-fun m!1268477 () Bool)

(assert (=> b!1383367 m!1268477))

(declare-fun m!1268479 () Bool)

(assert (=> b!1383369 m!1268479))

(push 1)

(assert (not b!1383367))

(assert (not start!118272))

(assert (not b!1383368))

(assert (not b!1383369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

