; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117468 () Bool)

(assert start!117468)

(declare-fun res!922445 () Bool)

(declare-fun e!782031 () Bool)

(assert (=> start!117468 (=> (not res!922445) (not e!782031))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!93973 0))(
  ( (array!93974 (arr!45381 (Array (_ BitVec 32) (_ BitVec 64))) (size!45933 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!93973)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117468 (= res!922445 (and (bvslt (size!45933 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45933 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117468 e!782031))

(declare-fun array_inv!34614 (array!93973) Bool)

(assert (=> start!117468 (array_inv!34614 a!3961)))

(assert (=> start!117468 true))

(declare-fun b!1380132 () Bool)

(assert (=> b!1380132 (= e!782031 false)))

(declare-fun lt!607709 () Bool)

(declare-fun isPivot!0 (array!93973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380132 (= lt!607709 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117468 res!922445) b!1380132))

(declare-fun m!1264901 () Bool)

(assert (=> start!117468 m!1264901))

(declare-fun m!1264903 () Bool)

(assert (=> b!1380132 m!1264903))

(push 1)

(assert (not b!1380132))

(assert (not start!117468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

