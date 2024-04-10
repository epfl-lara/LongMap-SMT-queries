; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117402 () Bool)

(assert start!117402)

(declare-fun res!922231 () Bool)

(declare-fun e!781843 () Bool)

(assert (=> start!117402 (=> (not res!922231) (not e!781843))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93953 0))(
  ( (array!93954 (arr!45371 (Array (_ BitVec 32) (_ BitVec 64))) (size!45921 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93953)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117402 (= res!922231 (and (bvslt (size!45921 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45921 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117402 e!781843))

(assert (=> start!117402 true))

(declare-fun array_inv!34399 (array!93953) Bool)

(assert (=> start!117402 (array_inv!34399 a!3985)))

(declare-fun b!1379961 () Bool)

(assert (=> b!1379961 (= e!781843 false)))

(declare-fun lt!607806 () Bool)

(declare-fun isPivot!0 (array!93953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379961 (= lt!607806 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117402 res!922231) b!1379961))

(declare-fun m!1265181 () Bool)

(assert (=> start!117402 m!1265181))

(declare-fun m!1265183 () Bool)

(assert (=> b!1379961 m!1265183))

(push 1)

(assert (not b!1379961))

(assert (not start!117402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

