; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117472 () Bool)

(assert start!117472)

(declare-fun res!922471 () Bool)

(declare-fun e!782062 () Bool)

(assert (=> start!117472 (=> (not res!922471) (not e!782062))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-datatypes ((array!94023 0))(
  ( (array!94024 (arr!45406 (Array (_ BitVec 32) (_ BitVec 64))) (size!45956 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94023)

(declare-fun to!135 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(assert (=> start!117472 (= res!922471 (and (bvslt (size!45956 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45956 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117472 e!782062))

(declare-fun array_inv!34434 (array!94023) Bool)

(assert (=> start!117472 (array_inv!34434 a!3961)))

(assert (=> start!117472 true))

(declare-fun b!1380201 () Bool)

(assert (=> b!1380201 (= e!782062 false)))

(declare-fun lt!607893 () Bool)

(declare-fun isPivot!0 (array!94023 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380201 (= lt!607893 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117472 res!922471) b!1380201))

(declare-fun m!1265405 () Bool)

(assert (=> start!117472 m!1265405))

(declare-fun m!1265407 () Bool)

(assert (=> b!1380201 m!1265407))

(push 1)

(assert (not start!117472))

(assert (not b!1380201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

