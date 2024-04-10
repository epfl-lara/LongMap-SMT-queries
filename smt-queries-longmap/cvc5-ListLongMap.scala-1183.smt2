; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25438 () Bool)

(assert start!25438)

(declare-fun res!129375 () Bool)

(declare-fun e!171556 () Bool)

(assert (=> start!25438 (=> (not res!129375) (not e!171556))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25438 (= res!129375 (validMask!0 mask!4002))))

(assert (=> start!25438 e!171556))

(assert (=> start!25438 true))

(declare-datatypes ((array!12734 0))(
  ( (array!12735 (arr!6026 (Array (_ BitVec 32) (_ BitVec 64))) (size!6378 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12734)

(declare-fun array_inv!3989 (array!12734) Bool)

(assert (=> start!25438 (array_inv!3989 a!3436)))

(declare-fun b!264862 () Bool)

(declare-fun res!129373 () Bool)

(assert (=> b!264862 (=> (not res!129373) (not e!171556))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264862 (= res!129373 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264863 () Bool)

(assert (=> b!264863 (= e!171556 false)))

(declare-datatypes ((SeekEntryResult!1217 0))(
  ( (MissingZero!1217 (index!7038 (_ BitVec 32))) (Found!1217 (index!7039 (_ BitVec 32))) (Intermediate!1217 (undefined!2029 Bool) (index!7040 (_ BitVec 32)) (x!25366 (_ BitVec 32))) (Undefined!1217) (MissingVacant!1217 (index!7041 (_ BitVec 32))) )
))
(declare-fun lt!133924 () SeekEntryResult!1217)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12734 (_ BitVec 32)) SeekEntryResult!1217)

(assert (=> b!264863 (= lt!133924 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264860 () Bool)

(declare-fun res!129372 () Bool)

(assert (=> b!264860 (=> (not res!129372) (not e!171556))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264860 (= res!129372 (and (= (size!6378 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6378 a!3436))))))

(declare-fun b!264861 () Bool)

(declare-fun res!129374 () Bool)

(assert (=> b!264861 (=> (not res!129374) (not e!171556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264861 (= res!129374 (validKeyInArray!0 k!2698))))

(assert (= (and start!25438 res!129375) b!264860))

(assert (= (and b!264860 res!129372) b!264861))

(assert (= (and b!264861 res!129374) b!264862))

(assert (= (and b!264862 res!129373) b!264863))

(declare-fun m!281835 () Bool)

(assert (=> start!25438 m!281835))

(declare-fun m!281837 () Bool)

(assert (=> start!25438 m!281837))

(declare-fun m!281839 () Bool)

(assert (=> b!264862 m!281839))

(declare-fun m!281841 () Bool)

(assert (=> b!264863 m!281841))

(declare-fun m!281843 () Bool)

(assert (=> b!264861 m!281843))

(push 1)

(assert (not b!264863))

(assert (not start!25438))

(assert (not b!264862))

(assert (not b!264861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

