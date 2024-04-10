; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25674 () Bool)

(assert start!25674)

(declare-fun b!266220 () Bool)

(declare-fun res!130520 () Bool)

(declare-fun e!172313 () Bool)

(assert (=> b!266220 (=> (not res!130520) (not e!172313))))

(declare-datatypes ((array!12853 0))(
  ( (array!12854 (arr!6081 (Array (_ BitVec 32) (_ BitVec 64))) (size!6433 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12853)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12853 (_ BitVec 32)) Bool)

(assert (=> b!266220 (= res!130520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130518 () Bool)

(declare-fun e!172311 () Bool)

(assert (=> start!25674 (=> (not res!130518) (not e!172311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25674 (= res!130518 (validMask!0 mask!4002))))

(assert (=> start!25674 e!172311))

(assert (=> start!25674 true))

(declare-fun array_inv!4044 (array!12853) Bool)

(assert (=> start!25674 (array_inv!4044 a!3436)))

(declare-fun b!266221 () Bool)

(assert (=> b!266221 (= e!172311 e!172313)))

(declare-fun res!130519 () Bool)

(assert (=> b!266221 (=> (not res!130519) (not e!172313))))

(declare-datatypes ((SeekEntryResult!1272 0))(
  ( (MissingZero!1272 (index!7258 (_ BitVec 32))) (Found!1272 (index!7259 (_ BitVec 32))) (Intermediate!1272 (undefined!2084 Bool) (index!7260 (_ BitVec 32)) (x!25565 (_ BitVec 32))) (Undefined!1272) (MissingVacant!1272 (index!7261 (_ BitVec 32))) )
))
(declare-fun lt!134368 () SeekEntryResult!1272)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266221 (= res!130519 (or (= lt!134368 (MissingZero!1272 i!1355)) (= lt!134368 (MissingVacant!1272 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12853 (_ BitVec 32)) SeekEntryResult!1272)

(assert (=> b!266221 (= lt!134368 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266222 () Bool)

(assert (=> b!266222 (= e!172313 false)))

(declare-fun lt!134367 () Bool)

(declare-datatypes ((List!3895 0))(
  ( (Nil!3892) (Cons!3891 (h!4558 (_ BitVec 64)) (t!8977 List!3895)) )
))
(declare-fun arrayNoDuplicates!0 (array!12853 (_ BitVec 32) List!3895) Bool)

(assert (=> b!266222 (= lt!134367 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3892))))

(declare-fun b!266223 () Bool)

(declare-fun res!130517 () Bool)

(assert (=> b!266223 (=> (not res!130517) (not e!172311))))

(assert (=> b!266223 (= res!130517 (and (= (size!6433 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6433 a!3436))))))

(declare-fun b!266224 () Bool)

(declare-fun res!130521 () Bool)

(assert (=> b!266224 (=> (not res!130521) (not e!172311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266224 (= res!130521 (validKeyInArray!0 k0!2698))))

(declare-fun b!266225 () Bool)

(declare-fun res!130516 () Bool)

(assert (=> b!266225 (=> (not res!130516) (not e!172311))))

(declare-fun arrayContainsKey!0 (array!12853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266225 (= res!130516 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25674 res!130518) b!266223))

(assert (= (and b!266223 res!130517) b!266224))

(assert (= (and b!266224 res!130521) b!266225))

(assert (= (and b!266225 res!130516) b!266221))

(assert (= (and b!266221 res!130519) b!266220))

(assert (= (and b!266220 res!130520) b!266222))

(declare-fun m!282851 () Bool)

(assert (=> start!25674 m!282851))

(declare-fun m!282853 () Bool)

(assert (=> start!25674 m!282853))

(declare-fun m!282855 () Bool)

(assert (=> b!266222 m!282855))

(declare-fun m!282857 () Bool)

(assert (=> b!266220 m!282857))

(declare-fun m!282859 () Bool)

(assert (=> b!266224 m!282859))

(declare-fun m!282861 () Bool)

(assert (=> b!266221 m!282861))

(declare-fun m!282863 () Bool)

(assert (=> b!266225 m!282863))

(check-sat (not start!25674) (not b!266225) (not b!266220) (not b!266222) (not b!266221) (not b!266224))
