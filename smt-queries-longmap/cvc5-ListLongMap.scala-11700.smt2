; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136820 () Bool)

(assert start!136820)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105809 0))(
  ( (array!105810 (arr!51013 (Array (_ BitVec 32) (_ BitVec 64))) (size!51563 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105809)

(declare-fun k!2737 () (_ BitVec 64))

(assert (=> start!136820 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51563 a!3471)) (bvslt (size!51563 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51013 a!3471) from!2846) k!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51563 a!3471)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136820 true))

(declare-fun array_inv!39740 (array!105809) Bool)

(assert (=> start!136820 (array_inv!39740 a!3471)))

(declare-fun bs!45699 () Bool)

(assert (= bs!45699 start!136820))

(declare-fun m!1450843 () Bool)

(assert (=> bs!45699 m!1450843))

(declare-fun m!1450845 () Bool)

(assert (=> bs!45699 m!1450845))

(push 1)

(assert (not start!136820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

