; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117468 () Bool)

(assert start!117468)

(declare-fun res!922465 () Bool)

(declare-fun e!782050 () Bool)

(assert (=> start!117468 (=> (not res!922465) (not e!782050))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94019 0))(
  ( (array!94020 (arr!45404 (Array (_ BitVec 32) (_ BitVec 64))) (size!45954 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94019)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117468 (= res!922465 (and (bvslt (size!45954 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45954 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117468 e!782050))

(declare-fun array_inv!34432 (array!94019) Bool)

(assert (=> start!117468 (array_inv!34432 a!3961)))

(assert (=> start!117468 true))

(declare-fun b!1380195 () Bool)

(assert (=> b!1380195 (= e!782050 false)))

(declare-fun lt!607887 () Bool)

(declare-fun isPivot!0 (array!94019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380195 (= lt!607887 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117468 res!922465) b!1380195))

(declare-fun m!1265397 () Bool)

(assert (=> start!117468 m!1265397))

(declare-fun m!1265399 () Bool)

(assert (=> b!1380195 m!1265399))

(push 1)

(assert (not start!117468))

(assert (not b!1380195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

