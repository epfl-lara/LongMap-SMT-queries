; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118106 () Bool)

(assert start!118106)

(declare-fun res!924329 () Bool)

(declare-fun e!783703 () Bool)

(assert (=> start!118106 (=> (not res!924329) (not e!783703))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118106 (= res!924329 (validMask!0 mask!2987))))

(assert (=> start!118106 e!783703))

(assert (=> start!118106 true))

(declare-datatypes ((array!94470 0))(
  ( (array!94471 (arr!45616 (Array (_ BitVec 32) (_ BitVec 64))) (size!46166 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94470)

(declare-fun array_inv!34644 (array!94470) Bool)

(assert (=> start!118106 (array_inv!34644 a!2938)))

(declare-fun b!1382737 () Bool)

(declare-fun res!924331 () Bool)

(assert (=> b!1382737 (=> (not res!924331) (not e!783703))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382737 (= res!924331 (and (= (size!46166 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46166 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46166 a!2938))))))

(declare-fun b!1382738 () Bool)

(declare-fun res!924330 () Bool)

(assert (=> b!1382738 (=> (not res!924330) (not e!783703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382738 (= res!924330 (validKeyInArray!0 (select (arr!45616 a!2938) i!1065)))))

(declare-fun b!1382739 () Bool)

(assert (=> b!1382739 (= e!783703 (bvsgt #b00000000000000000000000000000000 (size!46166 a!2938)))))

(assert (= (and start!118106 res!924329) b!1382737))

(assert (= (and b!1382737 res!924331) b!1382738))

(assert (= (and b!1382738 res!924330) b!1382739))

(declare-fun m!1267867 () Bool)

(assert (=> start!118106 m!1267867))

(declare-fun m!1267869 () Bool)

(assert (=> start!118106 m!1267869))

(declare-fun m!1267871 () Bool)

(assert (=> b!1382738 m!1267871))

(assert (=> b!1382738 m!1267871))

(declare-fun m!1267873 () Bool)

(assert (=> b!1382738 m!1267873))

(push 1)

(assert (not b!1382738))

(assert (not start!118106))

(check-sat)

(pop 1)

