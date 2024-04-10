; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25434 () Bool)

(assert start!25434)

(declare-fun res!129350 () Bool)

(declare-fun e!171545 () Bool)

(assert (=> start!25434 (=> (not res!129350) (not e!171545))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25434 (= res!129350 (validMask!0 mask!4002))))

(assert (=> start!25434 e!171545))

(assert (=> start!25434 true))

(declare-datatypes ((array!12730 0))(
  ( (array!12731 (arr!6024 (Array (_ BitVec 32) (_ BitVec 64))) (size!6376 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12730)

(declare-fun array_inv!3987 (array!12730) Bool)

(assert (=> start!25434 (array_inv!3987 a!3436)))

(declare-fun b!264837 () Bool)

(declare-fun res!129351 () Bool)

(assert (=> b!264837 (=> (not res!129351) (not e!171545))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264837 (= res!129351 (validKeyInArray!0 k0!2698))))

(declare-fun b!264838 () Bool)

(declare-fun res!129349 () Bool)

(assert (=> b!264838 (=> (not res!129349) (not e!171545))))

(declare-fun arrayContainsKey!0 (array!12730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264838 (= res!129349 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264839 () Bool)

(assert (=> b!264839 (= e!171545 false)))

(declare-datatypes ((SeekEntryResult!1215 0))(
  ( (MissingZero!1215 (index!7030 (_ BitVec 32))) (Found!1215 (index!7031 (_ BitVec 32))) (Intermediate!1215 (undefined!2027 Bool) (index!7032 (_ BitVec 32)) (x!25356 (_ BitVec 32))) (Undefined!1215) (MissingVacant!1215 (index!7033 (_ BitVec 32))) )
))
(declare-fun lt!133918 () SeekEntryResult!1215)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12730 (_ BitVec 32)) SeekEntryResult!1215)

(assert (=> b!264839 (= lt!133918 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264836 () Bool)

(declare-fun res!129348 () Bool)

(assert (=> b!264836 (=> (not res!129348) (not e!171545))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264836 (= res!129348 (and (= (size!6376 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6376 a!3436))))))

(assert (= (and start!25434 res!129350) b!264836))

(assert (= (and b!264836 res!129348) b!264837))

(assert (= (and b!264837 res!129351) b!264838))

(assert (= (and b!264838 res!129349) b!264839))

(declare-fun m!281815 () Bool)

(assert (=> start!25434 m!281815))

(declare-fun m!281817 () Bool)

(assert (=> start!25434 m!281817))

(declare-fun m!281819 () Bool)

(assert (=> b!264837 m!281819))

(declare-fun m!281821 () Bool)

(assert (=> b!264838 m!281821))

(declare-fun m!281823 () Bool)

(assert (=> b!264839 m!281823))

(check-sat (not b!264839) (not start!25434) (not b!264838) (not b!264837))
(check-sat)
