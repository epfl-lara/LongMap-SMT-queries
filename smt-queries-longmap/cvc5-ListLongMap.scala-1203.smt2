; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25684 () Bool)

(assert start!25684)

(declare-fun b!266332 () Bool)

(declare-fun res!130629 () Bool)

(declare-fun e!172356 () Bool)

(assert (=> b!266332 (=> (not res!130629) (not e!172356))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266332 (= res!130629 (validKeyInArray!0 k!2698))))

(declare-fun b!266333 () Bool)

(declare-fun e!172357 () Bool)

(assert (=> b!266333 (= e!172356 e!172357)))

(declare-fun res!130630 () Bool)

(assert (=> b!266333 (=> (not res!130630) (not e!172357))))

(declare-datatypes ((SeekEntryResult!1277 0))(
  ( (MissingZero!1277 (index!7278 (_ BitVec 32))) (Found!1277 (index!7279 (_ BitVec 32))) (Intermediate!1277 (undefined!2089 Bool) (index!7280 (_ BitVec 32)) (x!25586 (_ BitVec 32))) (Undefined!1277) (MissingVacant!1277 (index!7281 (_ BitVec 32))) )
))
(declare-fun lt!134398 () SeekEntryResult!1277)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266333 (= res!130630 (or (= lt!134398 (MissingZero!1277 i!1355)) (= lt!134398 (MissingVacant!1277 i!1355))))))

(declare-datatypes ((array!12863 0))(
  ( (array!12864 (arr!6086 (Array (_ BitVec 32) (_ BitVec 64))) (size!6438 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12863)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12863 (_ BitVec 32)) SeekEntryResult!1277)

(assert (=> b!266333 (= lt!134398 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266334 () Bool)

(declare-fun res!130634 () Bool)

(assert (=> b!266334 (=> (not res!130634) (not e!172356))))

(declare-fun arrayContainsKey!0 (array!12863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266334 (= res!130634 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266335 () Bool)

(declare-fun res!130628 () Bool)

(assert (=> b!266335 (=> (not res!130628) (not e!172357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12863 (_ BitVec 32)) Bool)

(assert (=> b!266335 (= res!130628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266336 () Bool)

(assert (=> b!266336 (= e!172357 (not true))))

(assert (=> b!266336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12864 (store (arr!6086 a!3436) i!1355 k!2698) (size!6438 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8275 0))(
  ( (Unit!8276) )
))
(declare-fun lt!134397 () Unit!8275)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12863 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8275)

(assert (=> b!266336 (= lt!134397 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun res!130632 () Bool)

(assert (=> start!25684 (=> (not res!130632) (not e!172356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25684 (= res!130632 (validMask!0 mask!4002))))

(assert (=> start!25684 e!172356))

(assert (=> start!25684 true))

(declare-fun array_inv!4049 (array!12863) Bool)

(assert (=> start!25684 (array_inv!4049 a!3436)))

(declare-fun b!266337 () Bool)

(declare-fun res!130635 () Bool)

(assert (=> b!266337 (=> (not res!130635) (not e!172357))))

(declare-datatypes ((List!3900 0))(
  ( (Nil!3897) (Cons!3896 (h!4563 (_ BitVec 64)) (t!8982 List!3900)) )
))
(declare-fun arrayNoDuplicates!0 (array!12863 (_ BitVec 32) List!3900) Bool)

(assert (=> b!266337 (= res!130635 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3897))))

(declare-fun b!266338 () Bool)

(declare-fun res!130633 () Bool)

(assert (=> b!266338 (=> (not res!130633) (not e!172356))))

(assert (=> b!266338 (= res!130633 (and (= (size!6438 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6438 a!3436))))))

(declare-fun b!266339 () Bool)

(declare-fun res!130631 () Bool)

(assert (=> b!266339 (=> (not res!130631) (not e!172357))))

(assert (=> b!266339 (= res!130631 (bvslt #b00000000000000000000000000000000 (size!6438 a!3436)))))

(assert (= (and start!25684 res!130632) b!266338))

(assert (= (and b!266338 res!130633) b!266332))

(assert (= (and b!266332 res!130629) b!266334))

(assert (= (and b!266334 res!130634) b!266333))

(assert (= (and b!266333 res!130630) b!266335))

(assert (= (and b!266335 res!130628) b!266337))

(assert (= (and b!266337 res!130635) b!266339))

(assert (= (and b!266339 res!130631) b!266336))

(declare-fun m!282939 () Bool)

(assert (=> b!266332 m!282939))

(declare-fun m!282941 () Bool)

(assert (=> b!266337 m!282941))

(declare-fun m!282943 () Bool)

(assert (=> b!266333 m!282943))

(declare-fun m!282945 () Bool)

(assert (=> b!266336 m!282945))

(declare-fun m!282947 () Bool)

(assert (=> b!266336 m!282947))

(declare-fun m!282949 () Bool)

(assert (=> b!266336 m!282949))

(declare-fun m!282951 () Bool)

(assert (=> b!266335 m!282951))

(declare-fun m!282953 () Bool)

(assert (=> start!25684 m!282953))

(declare-fun m!282955 () Bool)

(assert (=> start!25684 m!282955))

(declare-fun m!282957 () Bool)

(assert (=> b!266334 m!282957))

(push 1)

(assert (not start!25684))

(assert (not b!266333))

(assert (not b!266334))

(assert (not b!266336))

(assert (not b!266332))

(assert (not b!266337))

(assert (not b!266335))

(check-sat)

