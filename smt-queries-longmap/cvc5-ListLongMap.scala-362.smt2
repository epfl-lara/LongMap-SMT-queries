; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6990 () Bool)

(assert start!6990)

(declare-datatypes ((array!2983 0))(
  ( (array!2984 (arr!1435 (Array (_ BitVec 32) (_ BitVec 64))) (size!1653 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2983)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6990 (and (bvslt (size!1653 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1653 a!4412)) (= (size!1653 a!4412) size!30) (= a!4412 (array!2984 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (bvsge i!1489 (size!1653 a!4412)))))

(declare-fun array_inv!838 (array!2983) Bool)

(assert (=> start!6990 (array_inv!838 a!4412)))

(assert (=> start!6990 true))

(declare-fun bs!2096 () Bool)

(assert (= bs!2096 start!6990))

(declare-fun m!39641 () Bool)

(assert (=> bs!2096 m!39641))

(push 1)

(assert (not start!6990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

