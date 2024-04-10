; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92134 () Bool)

(assert start!92134)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65986 0))(
  ( (array!65987 (arr!31737 (Array (_ BitVec 32) (_ BitVec 64))) (size!32273 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65986)

(assert (=> start!92134 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32273 a!3488)) (bvslt (size!32273 a!3488) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!32273 a!3488)))))

(assert (=> start!92134 true))

(declare-fun array_inv!24517 (array!65986) Bool)

(assert (=> start!92134 (array_inv!24517 a!3488)))

(declare-fun bs!30645 () Bool)

(assert (= bs!30645 start!92134))

(declare-fun m!969055 () Bool)

(assert (=> bs!30645 m!969055))

(push 1)

(assert (not start!92134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

