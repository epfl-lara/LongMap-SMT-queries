; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92190 () Bool)

(assert start!92190)

(declare-fun res!697310 () Bool)

(declare-fun e!594450 () Bool)

(assert (=> start!92190 (=> (not res!697310) (not e!594450))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66018 0))(
  ( (array!66019 (arr!31750 (Array (_ BitVec 32) (_ BitVec 64))) (size!32286 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66018)

(assert (=> start!92190 (= res!697310 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32286 a!3488)) (bvslt (size!32286 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92190 e!594450))

(assert (=> start!92190 true))

(declare-fun array_inv!24530 (array!66018) Bool)

(assert (=> start!92190 (array_inv!24530 a!3488)))

(declare-fun b!1048148 () Bool)

(assert (=> b!1048148 (= e!594450 false)))

(declare-fun lt!463122 () Bool)

(declare-datatypes ((List!22062 0))(
  ( (Nil!22059) (Cons!22058 (h!23267 (_ BitVec 64)) (t!31369 List!22062)) )
))
(declare-fun arrayNoDuplicates!0 (array!66018 (_ BitVec 32) List!22062) Bool)

(assert (=> b!1048148 (= lt!463122 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22059))))

(assert (= (and start!92190 res!697310) b!1048148))

(declare-fun m!969179 () Bool)

(assert (=> start!92190 m!969179))

(declare-fun m!969181 () Bool)

(assert (=> b!1048148 m!969181))

(push 1)

(assert (not start!92190))

(assert (not b!1048148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

