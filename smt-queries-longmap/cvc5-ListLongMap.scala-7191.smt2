; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92178 () Bool)

(assert start!92178)

(declare-fun res!697274 () Bool)

(declare-fun e!594414 () Bool)

(assert (=> start!92178 (=> (not res!697274) (not e!594414))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66006 0))(
  ( (array!66007 (arr!31744 (Array (_ BitVec 32) (_ BitVec 64))) (size!32280 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66006)

(assert (=> start!92178 (= res!697274 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32280 a!3488)) (bvslt (size!32280 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92178 e!594414))

(assert (=> start!92178 true))

(declare-fun array_inv!24524 (array!66006) Bool)

(assert (=> start!92178 (array_inv!24524 a!3488)))

(declare-fun b!1048112 () Bool)

(assert (=> b!1048112 (= e!594414 false)))

(declare-fun lt!463113 () Bool)

(declare-datatypes ((List!22056 0))(
  ( (Nil!22053) (Cons!22052 (h!23261 (_ BitVec 64)) (t!31363 List!22056)) )
))
(declare-fun arrayNoDuplicates!0 (array!66006 (_ BitVec 32) List!22056) Bool)

(assert (=> b!1048112 (= lt!463113 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22053))))

(assert (= (and start!92178 res!697274) b!1048112))

(declare-fun m!969143 () Bool)

(assert (=> start!92178 m!969143))

(declare-fun m!969145 () Bool)

(assert (=> b!1048112 m!969145))

(push 1)

(assert (not start!92178))

(assert (not b!1048112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

