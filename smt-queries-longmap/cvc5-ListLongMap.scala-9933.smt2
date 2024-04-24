; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117656 () Bool)

(assert start!117656)

(declare-fun res!922838 () Bool)

(declare-fun e!782768 () Bool)

(assert (=> start!117656 (=> (not res!922838) (not e!782768))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94091 0))(
  ( (array!94092 (arr!45435 (Array (_ BitVec 32) (_ BitVec 64))) (size!45986 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94091)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(assert (=> start!117656 (= res!922838 (and (bvslt (size!45986 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45986 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117656 e!782768))

(assert (=> start!117656 true))

(declare-fun array_inv!34716 (array!94091) Bool)

(assert (=> start!117656 (array_inv!34716 a!3985)))

(declare-fun b!1381357 () Bool)

(declare-fun res!922839 () Bool)

(assert (=> b!1381357 (=> (not res!922839) (not e!782768))))

(declare-fun isPivot!0 (array!94091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381357 (= res!922839 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381358 () Bool)

(assert (=> b!1381358 (= e!782768 (and (= knownPivot!5 pivot!40) (bvsle to!159 from!3363)))))

(assert (= (and start!117656 res!922838) b!1381357))

(assert (= (and b!1381357 res!922839) b!1381358))

(declare-fun m!1266897 () Bool)

(assert (=> start!117656 m!1266897))

(declare-fun m!1266899 () Bool)

(assert (=> b!1381357 m!1266899))

(push 1)

(assert (not start!117656))

(assert (not b!1381357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

