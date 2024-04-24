; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117668 () Bool)

(assert start!117668)

(declare-fun res!922865 () Bool)

(declare-fun e!782804 () Bool)

(assert (=> start!117668 (=> (not res!922865) (not e!782804))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94103 0))(
  ( (array!94104 (arr!45441 (Array (_ BitVec 32) (_ BitVec 64))) (size!45992 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94103)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117668 (= res!922865 (and (bvslt (size!45992 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45992 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117668 e!782804))

(assert (=> start!117668 true))

(declare-fun array_inv!34722 (array!94103) Bool)

(assert (=> start!117668 (array_inv!34722 a!3985)))

(declare-fun b!1381384 () Bool)

(declare-fun res!922866 () Bool)

(assert (=> b!1381384 (=> (not res!922866) (not e!782804))))

(declare-fun isPivot!0 (array!94103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381384 (= res!922866 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381385 () Bool)

(assert (=> b!1381385 (= e!782804 (and (not (= knownPivot!5 pivot!40)) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 (bvsub to!159 #b00000000000000000000000000000001)))))))

(assert (= (and start!117668 res!922865) b!1381384))

(assert (= (and b!1381384 res!922866) b!1381385))

(declare-fun m!1266921 () Bool)

(assert (=> start!117668 m!1266921))

(declare-fun m!1266923 () Bool)

(assert (=> b!1381384 m!1266923))

(push 1)

(assert (not start!117668))

(assert (not b!1381384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

