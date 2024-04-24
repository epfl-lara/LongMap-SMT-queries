; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117638 () Bool)

(assert start!117638)

(declare-fun res!922758 () Bool)

(declare-fun e!782705 () Bool)

(assert (=> start!117638 (=> (not res!922758) (not e!782705))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94073 0))(
  ( (array!94074 (arr!45426 (Array (_ BitVec 32) (_ BitVec 64))) (size!45977 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94073)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117638 (= res!922758 (and (bvslt (size!45977 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45977 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117638 e!782705))

(assert (=> start!117638 true))

(declare-fun array_inv!34707 (array!94073) Bool)

(assert (=> start!117638 (array_inv!34707 a!3985)))

(declare-fun b!1381277 () Bool)

(assert (=> b!1381277 (= e!782705 false)))

(declare-fun lt!608293 () Bool)

(declare-fun isPivot!0 (array!94073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381277 (= lt!608293 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117638 res!922758) b!1381277))

(declare-fun m!1266825 () Bool)

(assert (=> start!117638 m!1266825))

(declare-fun m!1266827 () Bool)

(assert (=> b!1381277 m!1266827))

(push 1)

(assert (not start!117638))

(assert (not b!1381277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

