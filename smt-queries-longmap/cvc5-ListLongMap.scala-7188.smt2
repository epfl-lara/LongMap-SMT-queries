; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92130 () Bool)

(assert start!92130)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65982 0))(
  ( (array!65983 (arr!31735 (Array (_ BitVec 32) (_ BitVec 64))) (size!32271 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65982)

(assert (=> start!92130 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32271 a!3488)) (bvslt (size!32271 a!3488) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!32271 a!3488)))))

(assert (=> start!92130 true))

(declare-fun array_inv!24515 (array!65982) Bool)

(assert (=> start!92130 (array_inv!24515 a!3488)))

(declare-fun bs!30643 () Bool)

(assert (= bs!30643 start!92130))

(declare-fun m!969051 () Bool)

(assert (=> bs!30643 m!969051))

(push 1)

(assert (not start!92130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

