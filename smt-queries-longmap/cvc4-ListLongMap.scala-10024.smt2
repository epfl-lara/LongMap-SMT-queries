; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118252 () Bool)

(assert start!118252)

(declare-fun b!1383247 () Bool)

(declare-fun res!924840 () Bool)

(declare-fun e!784007 () Bool)

(assert (=> b!1383247 (=> (not res!924840) (not e!784007))))

(declare-datatypes ((array!94555 0))(
  ( (array!94556 (arr!45655 (Array (_ BitVec 32) (_ BitVec 64))) (size!46205 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94555)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383247 (= res!924840 (validKeyInArray!0 (select (arr!45655 a!2938) i!1065)))))

(declare-fun b!1383249 () Bool)

(assert (=> b!1383249 (= e!784007 false)))

(declare-fun lt!608568 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94555 (_ BitVec 32)) Bool)

(assert (=> b!1383249 (= lt!608568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383246 () Bool)

(declare-fun res!924839 () Bool)

(assert (=> b!1383246 (=> (not res!924839) (not e!784007))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383246 (= res!924839 (and (= (size!46205 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46205 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46205 a!2938))))))

(declare-fun b!1383248 () Bool)

(declare-fun res!924841 () Bool)

(assert (=> b!1383248 (=> (not res!924841) (not e!784007))))

(declare-datatypes ((List!32183 0))(
  ( (Nil!32180) (Cons!32179 (h!33388 (_ BitVec 64)) (t!46877 List!32183)) )
))
(declare-fun arrayNoDuplicates!0 (array!94555 (_ BitVec 32) List!32183) Bool)

(assert (=> b!1383248 (= res!924841 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32180))))

(declare-fun res!924838 () Bool)

(assert (=> start!118252 (=> (not res!924838) (not e!784007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118252 (= res!924838 (validMask!0 mask!2987))))

(assert (=> start!118252 e!784007))

(assert (=> start!118252 true))

(declare-fun array_inv!34683 (array!94555) Bool)

(assert (=> start!118252 (array_inv!34683 a!2938)))

(assert (= (and start!118252 res!924838) b!1383246))

(assert (= (and b!1383246 res!924839) b!1383247))

(assert (= (and b!1383247 res!924840) b!1383248))

(assert (= (and b!1383248 res!924841) b!1383249))

(declare-fun m!1268349 () Bool)

(assert (=> b!1383247 m!1268349))

(assert (=> b!1383247 m!1268349))

(declare-fun m!1268351 () Bool)

(assert (=> b!1383247 m!1268351))

(declare-fun m!1268353 () Bool)

(assert (=> b!1383249 m!1268353))

(declare-fun m!1268355 () Bool)

(assert (=> b!1383248 m!1268355))

(declare-fun m!1268357 () Bool)

(assert (=> start!118252 m!1268357))

(declare-fun m!1268359 () Bool)

(assert (=> start!118252 m!1268359))

(push 1)

(assert (not b!1383247))

(assert (not start!118252))

(assert (not b!1383248))

(assert (not b!1383249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

