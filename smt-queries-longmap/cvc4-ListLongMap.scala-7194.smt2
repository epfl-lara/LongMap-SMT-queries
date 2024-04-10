; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92200 () Bool)

(assert start!92200)

(declare-fun b!1048195 () Bool)

(declare-fun res!697360 () Bool)

(declare-fun e!594480 () Bool)

(assert (=> b!1048195 (=> (not res!697360) (not e!594480))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048195 (= res!697360 (validKeyInArray!0 k!2747))))

(declare-fun b!1048196 () Bool)

(declare-datatypes ((array!66028 0))(
  ( (array!66029 (arr!31755 (Array (_ BitVec 32) (_ BitVec 64))) (size!32291 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66028)

(assert (=> b!1048196 (= e!594480 (bvsge #b00000000000000000000000000000000 (size!32291 a!3488)))))

(declare-fun b!1048197 () Bool)

(declare-fun res!697361 () Bool)

(assert (=> b!1048197 (=> (not res!697361) (not e!594480))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048197 (= res!697361 (= (select (arr!31755 a!3488) i!1381) k!2747))))

(declare-fun b!1048198 () Bool)

(declare-fun res!697358 () Bool)

(assert (=> b!1048198 (=> (not res!697358) (not e!594480))))

(declare-datatypes ((List!22067 0))(
  ( (Nil!22064) (Cons!22063 (h!23272 (_ BitVec 64)) (t!31374 List!22067)) )
))
(declare-fun arrayNoDuplicates!0 (array!66028 (_ BitVec 32) List!22067) Bool)

(assert (=> b!1048198 (= res!697358 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22064))))

(declare-fun b!1048199 () Bool)

(declare-fun res!697357 () Bool)

(assert (=> b!1048199 (=> (not res!697357) (not e!594480))))

(declare-fun arrayContainsKey!0 (array!66028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048199 (= res!697357 (arrayContainsKey!0 (array!66029 (store (arr!31755 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32291 a!3488)) k!2747 #b00000000000000000000000000000000))))

(declare-fun res!697359 () Bool)

(assert (=> start!92200 (=> (not res!697359) (not e!594480))))

(assert (=> start!92200 (= res!697359 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32291 a!3488)) (bvslt (size!32291 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92200 e!594480))

(assert (=> start!92200 true))

(declare-fun array_inv!24535 (array!66028) Bool)

(assert (=> start!92200 (array_inv!24535 a!3488)))

(assert (= (and start!92200 res!697359) b!1048198))

(assert (= (and b!1048198 res!697358) b!1048195))

(assert (= (and b!1048195 res!697360) b!1048197))

(assert (= (and b!1048197 res!697361) b!1048199))

(assert (= (and b!1048199 res!697357) b!1048196))

(declare-fun m!969215 () Bool)

(assert (=> b!1048198 m!969215))

(declare-fun m!969217 () Bool)

(assert (=> b!1048195 m!969217))

(declare-fun m!969219 () Bool)

(assert (=> b!1048197 m!969219))

(declare-fun m!969221 () Bool)

(assert (=> b!1048199 m!969221))

(declare-fun m!969223 () Bool)

(assert (=> b!1048199 m!969223))

(declare-fun m!969225 () Bool)

(assert (=> start!92200 m!969225))

(push 1)

