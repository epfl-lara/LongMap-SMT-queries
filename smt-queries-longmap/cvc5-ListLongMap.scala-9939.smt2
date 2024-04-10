; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117456 () Bool)

(assert start!117456)

(declare-fun res!922442 () Bool)

(declare-fun e!782023 () Bool)

(assert (=> start!117456 (=> (not res!922442) (not e!782023))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((array!94007 0))(
  ( (array!94008 (arr!45398 (Array (_ BitVec 32) (_ BitVec 64))) (size!45948 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94007)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> start!117456 (= res!922442 (and (bvslt (size!45948 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45948 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117456 e!782023))

(assert (=> start!117456 true))

(declare-fun array_inv!34426 (array!94007) Bool)

(assert (=> start!117456 (array_inv!34426 a!3985)))

(declare-fun b!1380172 () Bool)

(declare-fun res!922444 () Bool)

(assert (=> b!1380172 (=> (not res!922444) (not e!782023))))

(declare-fun isPivot!0 (array!94007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380172 (= res!922444 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380173 () Bool)

(declare-fun res!922443 () Bool)

(assert (=> b!1380173 (=> (not res!922443) (not e!782023))))

(assert (=> b!1380173 (= res!922443 (= knownPivot!5 pivot!40))))

(declare-fun b!1380174 () Bool)

(assert (=> b!1380174 (= e!782023 (not (isPivot!0 a!3985 from!3363 to!159 pivot!40)))))

(assert (= (and start!117456 res!922442) b!1380172))

(assert (= (and b!1380172 res!922444) b!1380173))

(assert (= (and b!1380173 res!922443) b!1380174))

(declare-fun m!1265373 () Bool)

(assert (=> start!117456 m!1265373))

(declare-fun m!1265375 () Bool)

(assert (=> b!1380172 m!1265375))

(declare-fun m!1265377 () Bool)

(assert (=> b!1380174 m!1265377))

(push 1)

(assert (not b!1380174))

(assert (not start!117456))

(assert (not b!1380172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

