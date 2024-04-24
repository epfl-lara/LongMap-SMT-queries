; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117952 () Bool)

(assert start!117952)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94318 0))(
  ( (array!94319 (arr!45544 (Array (_ BitVec 32) (_ BitVec 64))) (size!46095 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94318)

(assert (=> start!117952 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46095 a!3464)) (bvslt (size!46095 a!3464) #b01111111111111111111111111111111) (bvsge from!2839 to!94) (bvsgt #b00000000000000000000000000000000 (bvsub (size!46095 a!3464) from!2839)))))

(assert (=> start!117952 true))

(declare-fun array_inv!34825 (array!94318) Bool)

(assert (=> start!117952 (array_inv!34825 a!3464)))

(declare-fun bs!39976 () Bool)

(assert (= bs!39976 start!117952))

(declare-fun m!1267933 () Bool)

(assert (=> bs!39976 m!1267933))

(check-sat (not start!117952))
(check-sat)
