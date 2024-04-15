; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118204 () Bool)

(assert start!118204)

(declare-fun res!924552 () Bool)

(declare-fun e!783843 () Bool)

(assert (=> start!118204 (=> (not res!924552) (not e!783843))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118204 (= res!924552 (validMask!0 mask!2987))))

(assert (=> start!118204 e!783843))

(assert (=> start!118204 true))

(declare-datatypes ((array!94460 0))(
  ( (array!94461 (arr!45608 (Array (_ BitVec 32) (_ BitVec 64))) (size!46160 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94460)

(declare-fun array_inv!34841 (array!94460) Bool)

(assert (=> start!118204 (array_inv!34841 a!2938)))

(declare-fun b!1382917 () Bool)

(declare-fun res!924553 () Bool)

(assert (=> b!1382917 (=> (not res!924553) (not e!783843))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382917 (= res!924553 (and (= (size!46160 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46160 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46160 a!2938))))))

(declare-fun b!1382918 () Bool)

(declare-fun res!924554 () Bool)

(assert (=> b!1382918 (=> (not res!924554) (not e!783843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382918 (= res!924554 (validKeyInArray!0 (select (arr!45608 a!2938) i!1065)))))

(declare-fun b!1382919 () Bool)

(assert (=> b!1382919 (= e!783843 false)))

(declare-fun lt!608327 () Bool)

(declare-datatypes ((List!32214 0))(
  ( (Nil!32211) (Cons!32210 (h!33419 (_ BitVec 64)) (t!46900 List!32214)) )
))
(declare-fun arrayNoDuplicates!0 (array!94460 (_ BitVec 32) List!32214) Bool)

(assert (=> b!1382919 (= lt!608327 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32211))))

(assert (= (and start!118204 res!924552) b!1382917))

(assert (= (and b!1382917 res!924553) b!1382918))

(assert (= (and b!1382918 res!924554) b!1382919))

(declare-fun m!1267591 () Bool)

(assert (=> start!118204 m!1267591))

(declare-fun m!1267593 () Bool)

(assert (=> start!118204 m!1267593))

(declare-fun m!1267595 () Bool)

(assert (=> b!1382918 m!1267595))

(assert (=> b!1382918 m!1267595))

(declare-fun m!1267597 () Bool)

(assert (=> b!1382918 m!1267597))

(declare-fun m!1267599 () Bool)

(assert (=> b!1382919 m!1267599))

(push 1)

(assert (not b!1382918))

(assert (not start!118204))

(assert (not b!1382919))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

