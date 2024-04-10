; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118270 () Bool)

(assert start!118270)

(declare-fun res!924946 () Bool)

(declare-fun e!784061 () Bool)

(assert (=> start!118270 (=> (not res!924946) (not e!784061))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118270 (= res!924946 (validMask!0 mask!2987))))

(assert (=> start!118270 e!784061))

(assert (=> start!118270 true))

(declare-datatypes ((array!94573 0))(
  ( (array!94574 (arr!45664 (Array (_ BitVec 32) (_ BitVec 64))) (size!46214 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94573)

(declare-fun array_inv!34692 (array!94573) Bool)

(assert (=> start!118270 (array_inv!34692 a!2938)))

(declare-fun b!1383357 () Bool)

(assert (=> b!1383357 (= e!784061 false)))

(declare-fun lt!608595 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94573 (_ BitVec 32)) Bool)

(assert (=> b!1383357 (= lt!608595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383355 () Bool)

(declare-fun res!924949 () Bool)

(assert (=> b!1383355 (=> (not res!924949) (not e!784061))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383355 (= res!924949 (validKeyInArray!0 (select (arr!45664 a!2938) i!1065)))))

(declare-fun b!1383354 () Bool)

(declare-fun res!924948 () Bool)

(assert (=> b!1383354 (=> (not res!924948) (not e!784061))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383354 (= res!924948 (and (= (size!46214 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46214 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46214 a!2938))))))

(declare-fun b!1383356 () Bool)

(declare-fun res!924947 () Bool)

(assert (=> b!1383356 (=> (not res!924947) (not e!784061))))

(declare-datatypes ((List!32192 0))(
  ( (Nil!32189) (Cons!32188 (h!33397 (_ BitVec 64)) (t!46886 List!32192)) )
))
(declare-fun arrayNoDuplicates!0 (array!94573 (_ BitVec 32) List!32192) Bool)

(assert (=> b!1383356 (= res!924947 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32189))))

(assert (= (and start!118270 res!924946) b!1383354))

(assert (= (and b!1383354 res!924948) b!1383355))

(assert (= (and b!1383355 res!924949) b!1383356))

(assert (= (and b!1383356 res!924947) b!1383357))

(declare-fun m!1268457 () Bool)

(assert (=> start!118270 m!1268457))

(declare-fun m!1268459 () Bool)

(assert (=> start!118270 m!1268459))

(declare-fun m!1268461 () Bool)

(assert (=> b!1383357 m!1268461))

(declare-fun m!1268463 () Bool)

(assert (=> b!1383355 m!1268463))

(assert (=> b!1383355 m!1268463))

(declare-fun m!1268465 () Bool)

(assert (=> b!1383355 m!1268465))

(declare-fun m!1268467 () Bool)

(assert (=> b!1383356 m!1268467))

(push 1)

(assert (not b!1383355))

(assert (not start!118270))

(assert (not b!1383356))

(assert (not b!1383357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

