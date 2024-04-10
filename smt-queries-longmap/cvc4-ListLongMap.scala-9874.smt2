; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116934 () Bool)

(assert start!116934)

(declare-datatypes ((array!93603 0))(
  ( (array!93604 (arr!45205 (Array (_ BitVec 32) (_ BitVec 64))) (size!45755 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93603)

(declare-fun from!3579 () (_ BitVec 32))

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!116934 (and (bvslt (size!45755 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45755 a!4212)) (bvslt to!375 #b00000000000000000000000000000000))))

(declare-fun array_inv!34233 (array!93603) Bool)

(assert (=> start!116934 (array_inv!34233 a!4212)))

(assert (=> start!116934 true))

(declare-fun bs!39599 () Bool)

(assert (= bs!39599 start!116934))

(declare-fun m!1262049 () Bool)

(assert (=> bs!39599 m!1262049))

(push 1)

(assert (not start!116934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

