; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117690 () Bool)

(assert start!117690)

(declare-fun res!922972 () Bool)

(declare-fun e!782879 () Bool)

(assert (=> start!117690 (=> (not res!922972) (not e!782879))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94125 0))(
  ( (array!94126 (arr!45452 (Array (_ BitVec 32) (_ BitVec 64))) (size!46003 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94125)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117690 (= res!922972 (and (bvslt (size!46003 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!46003 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117690 e!782879))

(assert (=> start!117690 true))

(declare-fun array_inv!34733 (array!94125) Bool)

(assert (=> start!117690 (array_inv!34733 a!3985)))

(declare-fun b!1381491 () Bool)

(declare-fun res!922974 () Bool)

(assert (=> b!1381491 (=> (not res!922974) (not e!782879))))

(declare-fun isPivot!0 (array!94125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381491 (= res!922974 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381492 () Bool)

(declare-fun res!922973 () Bool)

(assert (=> b!1381492 (=> (not res!922973) (not e!782879))))

(assert (=> b!1381492 (= res!922973 (= knownPivot!5 pivot!40))))

(declare-fun b!1381493 () Bool)

(assert (=> b!1381493 (= e!782879 (not (isPivot!0 a!3985 from!3363 to!159 pivot!40)))))

(assert (= (and start!117690 res!922972) b!1381491))

(assert (= (and b!1381491 res!922974) b!1381492))

(assert (= (and b!1381492 res!922973) b!1381493))

(declare-fun m!1267015 () Bool)

(assert (=> start!117690 m!1267015))

(declare-fun m!1267017 () Bool)

(assert (=> b!1381491 m!1267017))

(declare-fun m!1267019 () Bool)

(assert (=> b!1381493 m!1267019))

(push 1)

(assert (not b!1381491))

(assert (not start!117690))

(assert (not b!1381493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

