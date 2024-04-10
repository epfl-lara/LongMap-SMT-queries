; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117424 () Bool)

(assert start!117424)

(declare-fun res!922317 () Bool)

(declare-fun e!781918 () Bool)

(assert (=> start!117424 (=> (not res!922317) (not e!781918))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93975 0))(
  ( (array!93976 (arr!45382 (Array (_ BitVec 32) (_ BitVec 64))) (size!45932 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93975)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117424 (= res!922317 (and (bvslt (size!45932 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45932 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117424 e!781918))

(assert (=> start!117424 true))

(declare-fun array_inv!34410 (array!93975) Bool)

(assert (=> start!117424 (array_inv!34410 a!3985)))

(declare-fun b!1380047 () Bool)

(declare-fun res!922318 () Bool)

(assert (=> b!1380047 (=> (not res!922318) (not e!781918))))

(declare-fun isPivot!0 (array!93975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380047 (= res!922318 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380048 () Bool)

(assert (=> b!1380048 (= e!781918 (and (= knownPivot!5 pivot!40) (bvsle to!159 from!3363)))))

(assert (= (and start!117424 res!922317) b!1380047))

(assert (= (and b!1380047 res!922318) b!1380048))

(declare-fun m!1265261 () Bool)

(assert (=> start!117424 m!1265261))

(declare-fun m!1265263 () Bool)

(assert (=> b!1380047 m!1265263))

(push 1)

(assert (not b!1380047))

(assert (not start!117424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

