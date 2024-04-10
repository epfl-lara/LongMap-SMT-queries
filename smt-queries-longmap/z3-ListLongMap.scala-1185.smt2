; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25452 () Bool)

(assert start!25452)

(declare-fun b!264946 () Bool)

(declare-fun res!129459 () Bool)

(declare-fun e!171598 () Bool)

(assert (=> b!264946 (=> (not res!129459) (not e!171598))))

(declare-datatypes ((array!12748 0))(
  ( (array!12749 (arr!6033 (Array (_ BitVec 32) (_ BitVec 64))) (size!6385 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12748)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264946 (= res!129459 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264947 () Bool)

(declare-datatypes ((SeekEntryResult!1224 0))(
  ( (MissingZero!1224 (index!7066 (_ BitVec 32))) (Found!1224 (index!7067 (_ BitVec 32))) (Intermediate!1224 (undefined!2036 Bool) (index!7068 (_ BitVec 32)) (x!25389 (_ BitVec 32))) (Undefined!1224) (MissingVacant!1224 (index!7069 (_ BitVec 32))) )
))
(declare-fun lt!133945 () SeekEntryResult!1224)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264947 (= e!171598 (and (or (= lt!133945 (MissingZero!1224 i!1355)) (= lt!133945 (MissingVacant!1224 i!1355))) (bvsgt #b00000000000000000000000000000000 (size!6385 a!3436))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12748 (_ BitVec 32)) SeekEntryResult!1224)

(assert (=> b!264947 (= lt!133945 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!129458 () Bool)

(assert (=> start!25452 (=> (not res!129458) (not e!171598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25452 (= res!129458 (validMask!0 mask!4002))))

(assert (=> start!25452 e!171598))

(assert (=> start!25452 true))

(declare-fun array_inv!3996 (array!12748) Bool)

(assert (=> start!25452 (array_inv!3996 a!3436)))

(declare-fun b!264944 () Bool)

(declare-fun res!129456 () Bool)

(assert (=> b!264944 (=> (not res!129456) (not e!171598))))

(assert (=> b!264944 (= res!129456 (and (= (size!6385 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6385 a!3436))))))

(declare-fun b!264945 () Bool)

(declare-fun res!129457 () Bool)

(assert (=> b!264945 (=> (not res!129457) (not e!171598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264945 (= res!129457 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25452 res!129458) b!264944))

(assert (= (and b!264944 res!129456) b!264945))

(assert (= (and b!264945 res!129457) b!264946))

(assert (= (and b!264946 res!129459) b!264947))

(declare-fun m!281905 () Bool)

(assert (=> b!264946 m!281905))

(declare-fun m!281907 () Bool)

(assert (=> b!264947 m!281907))

(declare-fun m!281909 () Bool)

(assert (=> start!25452 m!281909))

(declare-fun m!281911 () Bool)

(assert (=> start!25452 m!281911))

(declare-fun m!281913 () Bool)

(assert (=> b!264945 m!281913))

(check-sat (not b!264945) (not b!264947) (not b!264946) (not start!25452))
(check-sat)
