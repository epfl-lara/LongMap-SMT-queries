; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117704 () Bool)

(assert start!117704)

(declare-fun res!922992 () Bool)

(declare-fun e!782912 () Bool)

(assert (=> start!117704 (=> (not res!922992) (not e!782912))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94139 0))(
  ( (array!94140 (arr!45459 (Array (_ BitVec 32) (_ BitVec 64))) (size!46010 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94139)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117704 (= res!922992 (and (bvslt (size!46010 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!46010 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117704 e!782912))

(declare-fun array_inv!34740 (array!94139) Bool)

(assert (=> start!117704 (array_inv!34740 a!3961)))

(assert (=> start!117704 true))

(declare-fun b!1381511 () Bool)

(assert (=> b!1381511 (= e!782912 false)))

(declare-fun lt!608374 () Bool)

(declare-fun isPivot!0 (array!94139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381511 (= lt!608374 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117704 res!922992) b!1381511))

(declare-fun m!1267041 () Bool)

(assert (=> start!117704 m!1267041))

(declare-fun m!1267043 () Bool)

(assert (=> b!1381511 m!1267043))

(push 1)

(assert (not start!117704))

(assert (not b!1381511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

