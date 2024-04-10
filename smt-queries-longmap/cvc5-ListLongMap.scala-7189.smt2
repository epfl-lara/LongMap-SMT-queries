; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92136 () Bool)

(assert start!92136)

(declare-fun res!697178 () Bool)

(declare-fun e!594309 () Bool)

(assert (=> start!92136 (=> (not res!697178) (not e!594309))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65988 0))(
  ( (array!65989 (arr!31738 (Array (_ BitVec 32) (_ BitVec 64))) (size!32274 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65988)

(assert (=> start!92136 (= res!697178 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32274 a!3488)) (bvslt (size!32274 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32274 a!3488))))))

(assert (=> start!92136 e!594309))

(assert (=> start!92136 true))

(declare-fun array_inv!24518 (array!65988) Bool)

(assert (=> start!92136 (array_inv!24518 a!3488)))

(declare-fun b!1048016 () Bool)

(declare-datatypes ((List!22050 0))(
  ( (Nil!22047) (Cons!22046 (h!23255 (_ BitVec 64)) (t!31357 List!22050)) )
))
(declare-fun noDuplicate!1485 (List!22050) Bool)

(assert (=> b!1048016 (= e!594309 (not (noDuplicate!1485 Nil!22047)))))

(assert (= (and start!92136 res!697178) b!1048016))

(declare-fun m!969057 () Bool)

(assert (=> start!92136 m!969057))

(declare-fun m!969059 () Bool)

(assert (=> b!1048016 m!969059))

(push 1)

(assert (not start!92136))

(assert (not b!1048016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127607 () Bool)

(assert (=> d!127607 (= (array_inv!24518 a!3488) (bvsge (size!32274 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92136 d!127607))

(declare-fun d!127609 () Bool)

(declare-fun res!697195 () Bool)

(declare-fun e!594333 () Bool)

(assert (=> d!127609 (=> res!697195 e!594333)))

(assert (=> d!127609 (= res!697195 (is-Nil!22047 Nil!22047))))

