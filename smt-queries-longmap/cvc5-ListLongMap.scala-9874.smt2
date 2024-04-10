; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116930 () Bool)

(assert start!116930)

(declare-datatypes ((array!93599 0))(
  ( (array!93600 (arr!45203 (Array (_ BitVec 32) (_ BitVec 64))) (size!45753 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93599)

(declare-fun from!3579 () (_ BitVec 32))

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!116930 (and (bvslt (size!45753 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45753 a!4212)) (bvslt to!375 #b00000000000000000000000000000000))))

(declare-fun array_inv!34231 (array!93599) Bool)

(assert (=> start!116930 (array_inv!34231 a!4212)))

(assert (=> start!116930 true))

(declare-fun bs!39597 () Bool)

(assert (= bs!39597 start!116930))

(declare-fun m!1262045 () Bool)

(assert (=> bs!39597 m!1262045))

(push 1)

(assert (not start!116930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

