; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117454 () Bool)

(assert start!117454)

(declare-fun res!922426 () Bool)

(declare-fun e!781999 () Bool)

(assert (=> start!117454 (=> (not res!922426) (not e!781999))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93959 0))(
  ( (array!93960 (arr!45374 (Array (_ BitVec 32) (_ BitVec 64))) (size!45926 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93959)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117454 (= res!922426 (and (bvslt (size!45926 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45926 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117454 e!781999))

(assert (=> start!117454 true))

(declare-fun array_inv!34607 (array!93959) Bool)

(assert (=> start!117454 (array_inv!34607 a!3985)))

(declare-fun b!1380112 () Bool)

(declare-fun res!922427 () Bool)

(assert (=> b!1380112 (=> (not res!922427) (not e!781999))))

(declare-fun isPivot!0 (array!93959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380112 (= res!922427 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380113 () Bool)

(declare-fun res!922425 () Bool)

(assert (=> b!1380113 (=> (not res!922425) (not e!781999))))

(assert (=> b!1380113 (= res!922425 (= knownPivot!5 pivot!40))))

(declare-fun b!1380114 () Bool)

(assert (=> b!1380114 (= e!781999 (not (isPivot!0 a!3985 from!3363 to!159 pivot!40)))))

(assert (= (and start!117454 res!922426) b!1380112))

(assert (= (and b!1380112 res!922427) b!1380113))

(assert (= (and b!1380113 res!922425) b!1380114))

(declare-fun m!1264875 () Bool)

(assert (=> start!117454 m!1264875))

(declare-fun m!1264877 () Bool)

(assert (=> b!1380112 m!1264877))

(declare-fun m!1264879 () Bool)

(assert (=> b!1380114 m!1264879))

(push 1)

(assert (not b!1380112))

(assert (not start!117454))

(assert (not b!1380114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

