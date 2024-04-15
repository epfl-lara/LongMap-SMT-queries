; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117420 () Bool)

(assert start!117420)

(declare-fun res!922291 () Bool)

(declare-fun e!781887 () Bool)

(assert (=> start!117420 (=> (not res!922291) (not e!781887))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93925 0))(
  ( (array!93926 (arr!45357 (Array (_ BitVec 32) (_ BitVec 64))) (size!45909 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93925)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117420 (= res!922291 (and (bvslt (size!45909 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45909 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117420 e!781887))

(assert (=> start!117420 true))

(declare-fun array_inv!34590 (array!93925) Bool)

(assert (=> start!117420 (array_inv!34590 a!3985)))

(declare-fun b!1379978 () Bool)

(declare-fun res!922292 () Bool)

(assert (=> b!1379978 (=> (not res!922292) (not e!781887))))

(declare-fun isPivot!0 (array!93925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379978 (= res!922292 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1379979 () Bool)

(assert (=> b!1379979 (= e!781887 (and (= knownPivot!5 pivot!40) (bvsle to!159 from!3363)))))

(assert (= (and start!117420 res!922291) b!1379978))

(assert (= (and b!1379978 res!922292) b!1379979))

(declare-fun m!1264757 () Bool)

(assert (=> start!117420 m!1264757))

(declare-fun m!1264759 () Bool)

(assert (=> b!1379978 m!1264759))

(push 1)

(assert (not start!117420))

(assert (not b!1379978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

