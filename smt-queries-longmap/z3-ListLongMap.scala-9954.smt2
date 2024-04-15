; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117578 () Bool)

(assert start!117578)

(declare-fun res!922621 () Bool)

(declare-fun e!782430 () Bool)

(assert (=> start!117578 (=> (not res!922621) (not e!782430))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94050 0))(
  ( (array!94051 (arr!45418 (Array (_ BitVec 32) (_ BitVec 64))) (size!45970 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94050)

(assert (=> start!117578 (= res!922621 (and (bvslt (size!45970 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45970 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117578 e!782430))

(declare-fun array_inv!34651 (array!94050) Bool)

(assert (=> start!117578 (array_inv!34651 a!3931)))

(assert (=> start!117578 true))

(declare-fun b!1380644 () Bool)

(declare-fun res!922622 () Bool)

(assert (=> b!1380644 (=> (not res!922622) (not e!782430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380644 (= res!922622 (validKeyInArray!0 (select (arr!45418 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380645 () Bool)

(assert (=> b!1380645 (= e!782430 (bvsgt from!3309 to!105))))

(assert (= (and start!117578 res!922621) b!1380644))

(assert (= (and b!1380644 res!922622) b!1380645))

(declare-fun m!1265439 () Bool)

(assert (=> start!117578 m!1265439))

(declare-fun m!1265441 () Bool)

(assert (=> b!1380644 m!1265441))

(assert (=> b!1380644 m!1265441))

(declare-fun m!1265443 () Bool)

(assert (=> b!1380644 m!1265443))

(check-sat (not b!1380644) (not start!117578))
(check-sat)
