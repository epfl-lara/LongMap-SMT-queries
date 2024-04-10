; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118246 () Bool)

(assert start!118246)

(declare-fun b!1383210 () Bool)

(declare-fun res!924804 () Bool)

(declare-fun e!783988 () Bool)

(assert (=> b!1383210 (=> (not res!924804) (not e!783988))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94549 0))(
  ( (array!94550 (arr!45652 (Array (_ BitVec 32) (_ BitVec 64))) (size!46202 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94549)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383210 (= res!924804 (and (= (size!46202 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46202 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46202 a!2938))))))

(declare-fun res!924802 () Bool)

(assert (=> start!118246 (=> (not res!924802) (not e!783988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118246 (= res!924802 (validMask!0 mask!2987))))

(assert (=> start!118246 e!783988))

(assert (=> start!118246 true))

(declare-fun array_inv!34680 (array!94549) Bool)

(assert (=> start!118246 (array_inv!34680 a!2938)))

(declare-fun b!1383213 () Bool)

(assert (=> b!1383213 (= e!783988 false)))

(declare-fun lt!608559 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94549 (_ BitVec 32)) Bool)

(assert (=> b!1383213 (= lt!608559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383212 () Bool)

(declare-fun res!924805 () Bool)

(assert (=> b!1383212 (=> (not res!924805) (not e!783988))))

(declare-datatypes ((List!32180 0))(
  ( (Nil!32177) (Cons!32176 (h!33385 (_ BitVec 64)) (t!46874 List!32180)) )
))
(declare-fun arrayNoDuplicates!0 (array!94549 (_ BitVec 32) List!32180) Bool)

(assert (=> b!1383212 (= res!924805 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32177))))

(declare-fun b!1383211 () Bool)

(declare-fun res!924803 () Bool)

(assert (=> b!1383211 (=> (not res!924803) (not e!783988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383211 (= res!924803 (validKeyInArray!0 (select (arr!45652 a!2938) i!1065)))))

(assert (= (and start!118246 res!924802) b!1383210))

(assert (= (and b!1383210 res!924804) b!1383211))

(assert (= (and b!1383211 res!924803) b!1383212))

(assert (= (and b!1383212 res!924805) b!1383213))

(declare-fun m!1268313 () Bool)

(assert (=> start!118246 m!1268313))

(declare-fun m!1268315 () Bool)

(assert (=> start!118246 m!1268315))

(declare-fun m!1268317 () Bool)

(assert (=> b!1383213 m!1268317))

(declare-fun m!1268319 () Bool)

(assert (=> b!1383212 m!1268319))

(declare-fun m!1268321 () Bool)

(assert (=> b!1383211 m!1268321))

(assert (=> b!1383211 m!1268321))

(declare-fun m!1268323 () Bool)

(assert (=> b!1383211 m!1268323))

(push 1)

(assert (not start!118246))

(assert (not b!1383212))

(assert (not b!1383213))

(assert (not b!1383211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

