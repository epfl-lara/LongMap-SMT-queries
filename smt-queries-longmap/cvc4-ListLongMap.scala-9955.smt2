; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117592 () Bool)

(assert start!117592)

(declare-fun res!922677 () Bool)

(declare-fun e!782491 () Bool)

(assert (=> start!117592 (=> (not res!922677) (not e!782491))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94110 0))(
  ( (array!94111 (arr!45448 (Array (_ BitVec 32) (_ BitVec 64))) (size!45998 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94110)

(assert (=> start!117592 (= res!922677 (and (bvslt (size!45998 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45998 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117592 e!782491))

(declare-fun array_inv!34476 (array!94110) Bool)

(assert (=> start!117592 (array_inv!34476 a!3931)))

(assert (=> start!117592 true))

(declare-fun b!1380743 () Bool)

(declare-fun res!922678 () Bool)

(assert (=> b!1380743 (=> (not res!922678) (not e!782491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380743 (= res!922678 (not (validKeyInArray!0 (select (arr!45448 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380744 () Bool)

(assert (=> b!1380744 (= e!782491 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45998 a!3931)))))

(assert (= (and start!117592 res!922677) b!1380743))

(assert (= (and b!1380743 res!922678) b!1380744))

(declare-fun m!1265973 () Bool)

(assert (=> start!117592 m!1265973))

(declare-fun m!1265975 () Bool)

(assert (=> b!1380743 m!1265975))

(assert (=> b!1380743 m!1265975))

(declare-fun m!1265977 () Bool)

(assert (=> b!1380743 m!1265977))

(push 1)

(assert (not b!1380743))

(assert (not start!117592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

