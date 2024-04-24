; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117662 () Bool)

(assert start!117662)

(declare-fun res!922848 () Bool)

(declare-fun e!782786 () Bool)

(assert (=> start!117662 (=> (not res!922848) (not e!782786))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94097 0))(
  ( (array!94098 (arr!45438 (Array (_ BitVec 32) (_ BitVec 64))) (size!45989 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94097)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117662 (= res!922848 (and (bvslt (size!45989 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45989 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117662 e!782786))

(assert (=> start!117662 true))

(declare-fun array_inv!34719 (array!94097) Bool)

(assert (=> start!117662 (array_inv!34719 a!3985)))

(declare-fun b!1381367 () Bool)

(assert (=> b!1381367 (= e!782786 false)))

(declare-fun lt!608329 () Bool)

(declare-fun isPivot!0 (array!94097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381367 (= lt!608329 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117662 res!922848) b!1381367))

(declare-fun m!1266909 () Bool)

(assert (=> start!117662 m!1266909))

(declare-fun m!1266911 () Bool)

(assert (=> b!1381367 m!1266911))

(push 1)

(assert (not b!1381367))

(assert (not start!117662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

