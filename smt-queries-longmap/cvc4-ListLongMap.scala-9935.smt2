; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117436 () Bool)

(assert start!117436)

(declare-fun res!922344 () Bool)

(declare-fun e!781954 () Bool)

(assert (=> start!117436 (=> (not res!922344) (not e!781954))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93987 0))(
  ( (array!93988 (arr!45388 (Array (_ BitVec 32) (_ BitVec 64))) (size!45938 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93987)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> start!117436 (= res!922344 (and (bvslt (size!45938 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45938 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117436 e!781954))

(assert (=> start!117436 true))

(declare-fun array_inv!34416 (array!93987) Bool)

(assert (=> start!117436 (array_inv!34416 a!3985)))

(declare-fun b!1380074 () Bool)

(declare-fun res!922345 () Bool)

(assert (=> b!1380074 (=> (not res!922345) (not e!781954))))

(declare-fun isPivot!0 (array!93987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380074 (= res!922345 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380075 () Bool)

(assert (=> b!1380075 (= e!781954 (and (not (= knownPivot!5 pivot!40)) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 (bvsub to!159 #b00000000000000000000000000000001)))))))

(assert (= (and start!117436 res!922344) b!1380074))

(assert (= (and b!1380074 res!922345) b!1380075))

(declare-fun m!1265285 () Bool)

(assert (=> start!117436 m!1265285))

(declare-fun m!1265287 () Bool)

(assert (=> b!1380074 m!1265287))

(push 1)

(assert (not b!1380074))

(assert (not start!117436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

