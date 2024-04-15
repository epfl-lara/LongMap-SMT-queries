; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117704 () Bool)

(assert start!117704)

(declare-fun res!922729 () Bool)

(declare-fun e!782745 () Bool)

(assert (=> start!117704 (=> (not res!922729) (not e!782745))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-datatypes ((array!94140 0))(
  ( (array!94141 (arr!45460 (Array (_ BitVec 32) (_ BitVec 64))) (size!46012 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94140)

(declare-fun to!94 () (_ BitVec 32))

(assert (=> start!117704 (= res!922729 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46012 a!3464)) (bvslt (size!46012 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117704 e!782745))

(assert (=> start!117704 true))

(declare-fun array_inv!34693 (array!94140) Bool)

(assert (=> start!117704 (array_inv!34693 a!3464)))

(declare-fun b!1380986 () Bool)

(declare-fun res!922730 () Bool)

(assert (=> b!1380986 (=> (not res!922730) (not e!782745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380986 (= res!922730 (not (validKeyInArray!0 (select (arr!45460 a!3464) from!2839))))))

(declare-fun b!1380987 () Bool)

(assert (=> b!1380987 (= e!782745 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117704 res!922729) b!1380986))

(assert (= (and b!1380986 res!922730) b!1380987))

(declare-fun m!1265769 () Bool)

(assert (=> start!117704 m!1265769))

(declare-fun m!1265771 () Bool)

(assert (=> b!1380986 m!1265771))

(assert (=> b!1380986 m!1265771))

(declare-fun m!1265773 () Bool)

(assert (=> b!1380986 m!1265773))

(check-sat (not b!1380986) (not start!117704))
(check-sat)
