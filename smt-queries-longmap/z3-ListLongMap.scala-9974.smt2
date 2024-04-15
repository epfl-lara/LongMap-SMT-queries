; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117758 () Bool)

(assert start!117758)

(declare-fun res!922783 () Bool)

(declare-fun e!782844 () Bool)

(assert (=> start!117758 (=> (not res!922783) (not e!782844))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94179 0))(
  ( (array!94180 (arr!45478 (Array (_ BitVec 32) (_ BitVec 64))) (size!46030 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94179)

(assert (=> start!117758 (= res!922783 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46030 a!3464)) (bvslt (size!46030 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117758 e!782844))

(assert (=> start!117758 true))

(declare-fun array_inv!34711 (array!94179) Bool)

(assert (=> start!117758 (array_inv!34711 a!3464)))

(declare-fun b!1381076 () Bool)

(declare-fun res!922784 () Bool)

(assert (=> b!1381076 (=> (not res!922784) (not e!782844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381076 (= res!922784 (not (validKeyInArray!0 (select (arr!45478 a!3464) from!2839))))))

(declare-fun b!1381077 () Bool)

(assert (=> b!1381077 (= e!782844 (bvsge (bvsub (size!46030 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46030 a!3464) from!2839)))))

(assert (= (and start!117758 res!922783) b!1381076))

(assert (= (and b!1381076 res!922784) b!1381077))

(declare-fun m!1265865 () Bool)

(assert (=> start!117758 m!1265865))

(declare-fun m!1265867 () Bool)

(assert (=> b!1381076 m!1265867))

(assert (=> b!1381076 m!1265867))

(declare-fun m!1265869 () Bool)

(assert (=> b!1381076 m!1265869))

(check-sat (not b!1381076) (not start!117758))
(check-sat)
