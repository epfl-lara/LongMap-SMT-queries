; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117716 () Bool)

(assert start!117716)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94198 0))(
  ( (array!94199 (arr!45489 (Array (_ BitVec 32) (_ BitVec 64))) (size!46039 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94198)

(assert (=> start!117716 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46039 a!3464)) (bvslt (size!46039 a!3464) #b01111111111111111111111111111111) (bvslt (bvsub (size!46039 a!3464) from!2839) #b00000000000000000000000000000000))))

(assert (=> start!117716 true))

(declare-fun array_inv!34517 (array!94198) Bool)

(assert (=> start!117716 (array_inv!34517 a!3464)))

(declare-fun bs!39954 () Bool)

(assert (= bs!39954 start!117716))

(declare-fun m!1266293 () Bool)

(assert (=> bs!39954 m!1266293))

(check-sat (not start!117716))
(check-sat)
