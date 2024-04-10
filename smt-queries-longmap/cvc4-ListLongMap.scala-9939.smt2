; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117460 () Bool)

(assert start!117460)

(declare-fun res!922462 () Bool)

(declare-fun e!782035 () Bool)

(assert (=> start!117460 (=> (not res!922462) (not e!782035))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94011 0))(
  ( (array!94012 (arr!45400 (Array (_ BitVec 32) (_ BitVec 64))) (size!45950 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94011)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> start!117460 (= res!922462 (and (bvslt (size!45950 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45950 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117460 e!782035))

(assert (=> start!117460 true))

(declare-fun array_inv!34428 (array!94011) Bool)

(assert (=> start!117460 (array_inv!34428 a!3985)))

(declare-fun b!1380190 () Bool)

(declare-fun res!922460 () Bool)

(assert (=> b!1380190 (=> (not res!922460) (not e!782035))))

(declare-fun isPivot!0 (array!94011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380190 (= res!922460 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380191 () Bool)

(declare-fun res!922461 () Bool)

(assert (=> b!1380191 (=> (not res!922461) (not e!782035))))

(assert (=> b!1380191 (= res!922461 (= knownPivot!5 pivot!40))))

(declare-fun b!1380192 () Bool)

(assert (=> b!1380192 (= e!782035 (not (isPivot!0 a!3985 from!3363 to!159 pivot!40)))))

(assert (= (and start!117460 res!922462) b!1380190))

(assert (= (and b!1380190 res!922460) b!1380191))

(assert (= (and b!1380191 res!922461) b!1380192))

(declare-fun m!1265385 () Bool)

(assert (=> start!117460 m!1265385))

(declare-fun m!1265387 () Bool)

(assert (=> b!1380190 m!1265387))

(declare-fun m!1265389 () Bool)

(assert (=> b!1380192 m!1265389))

(push 1)

(assert (not b!1380192))

(assert (not b!1380190))

(assert (not start!117460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

