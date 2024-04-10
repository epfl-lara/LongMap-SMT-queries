; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6998 () Bool)

(assert start!6998)

(declare-datatypes ((array!3009 0))(
  ( (array!3010 (arr!1448 (Array (_ BitVec 32) (_ BitVec 64))) (size!1666 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3009)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6998 (and (bvslt (size!1666 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1666 a!4412)) (= (size!1666 a!4412) size!30) (= a!4412 (array!3010 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1448 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1666 a!4412)) (bvsge (bvsub size!30 (bvadd #b00000000000000000000000000000001 i!1489)) (bvsub size!30 i!1489)))))

(declare-fun array_inv!860 (array!3009) Bool)

(assert (=> start!6998 (array_inv!860 a!4412)))

(assert (=> start!6998 true))

(declare-fun bs!2108 () Bool)

(assert (= bs!2108 start!6998))

(declare-fun m!39787 () Bool)

(assert (=> bs!2108 m!39787))

(declare-fun m!39789 () Bool)

(assert (=> bs!2108 m!39789))

(push 1)

(assert (not start!6998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

