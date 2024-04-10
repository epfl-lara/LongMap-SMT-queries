; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117420 () Bool)

(assert start!117420)

(declare-fun res!922305 () Bool)

(declare-fun e!781906 () Bool)

(assert (=> start!117420 (=> (not res!922305) (not e!781906))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93971 0))(
  ( (array!93972 (arr!45380 (Array (_ BitVec 32) (_ BitVec 64))) (size!45930 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93971)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117420 (= res!922305 (and (bvslt (size!45930 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45930 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117420 e!781906))

(assert (=> start!117420 true))

(declare-fun array_inv!34408 (array!93971) Bool)

(assert (=> start!117420 (array_inv!34408 a!3985)))

(declare-fun b!1380035 () Bool)

(declare-fun res!922306 () Bool)

(assert (=> b!1380035 (=> (not res!922306) (not e!781906))))

(declare-fun isPivot!0 (array!93971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380035 (= res!922306 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380036 () Bool)

(assert (=> b!1380036 (= e!781906 (and (= knownPivot!5 pivot!40) (bvsle to!159 from!3363)))))

(assert (= (and start!117420 res!922305) b!1380035))

(assert (= (and b!1380035 res!922306) b!1380036))

(declare-fun m!1265253 () Bool)

(assert (=> start!117420 m!1265253))

(declare-fun m!1265255 () Bool)

(assert (=> b!1380035 m!1265255))

(push 1)

(assert (not b!1380035))

(assert (not start!117420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

