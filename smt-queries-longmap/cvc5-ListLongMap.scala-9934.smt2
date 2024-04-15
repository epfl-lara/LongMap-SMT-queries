; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117426 () Bool)

(assert start!117426)

(declare-fun res!922301 () Bool)

(declare-fun e!781905 () Bool)

(assert (=> start!117426 (=> (not res!922301) (not e!781905))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93931 0))(
  ( (array!93932 (arr!45360 (Array (_ BitVec 32) (_ BitVec 64))) (size!45912 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93931)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117426 (= res!922301 (and (bvslt (size!45912 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45912 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117426 e!781905))

(assert (=> start!117426 true))

(declare-fun array_inv!34593 (array!93931) Bool)

(assert (=> start!117426 (array_inv!34593 a!3985)))

(declare-fun b!1379988 () Bool)

(assert (=> b!1379988 (= e!781905 false)))

(declare-fun lt!607664 () Bool)

(declare-fun isPivot!0 (array!93931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379988 (= lt!607664 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117426 res!922301) b!1379988))

(declare-fun m!1264769 () Bool)

(assert (=> start!117426 m!1264769))

(declare-fun m!1264771 () Bool)

(assert (=> b!1379988 m!1264771))

(push 1)

(assert (not b!1379988))

(assert (not start!117426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

