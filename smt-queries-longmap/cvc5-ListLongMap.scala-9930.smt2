; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117402 () Bool)

(assert start!117402)

(declare-fun res!922211 () Bool)

(declare-fun e!781824 () Bool)

(assert (=> start!117402 (=> (not res!922211) (not e!781824))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((array!93907 0))(
  ( (array!93908 (arr!45348 (Array (_ BitVec 32) (_ BitVec 64))) (size!45900 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93907)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> start!117402 (= res!922211 (and (bvslt (size!45900 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45900 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117402 e!781824))

(assert (=> start!117402 true))

(declare-fun array_inv!34581 (array!93907) Bool)

(assert (=> start!117402 (array_inv!34581 a!3985)))

(declare-fun b!1379898 () Bool)

(assert (=> b!1379898 (= e!781824 false)))

(declare-fun lt!607628 () Bool)

(declare-fun isPivot!0 (array!93907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379898 (= lt!607628 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117402 res!922211) b!1379898))

(declare-fun m!1264685 () Bool)

(assert (=> start!117402 m!1264685))

(declare-fun m!1264687 () Bool)

(assert (=> b!1379898 m!1264687))

(push 1)

(assert (not start!117402))

(assert (not b!1379898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

