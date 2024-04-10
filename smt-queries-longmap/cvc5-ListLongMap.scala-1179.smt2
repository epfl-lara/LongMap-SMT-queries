; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25414 () Bool)

(assert start!25414)

(declare-fun b!264709 () Bool)

(declare-fun res!129223 () Bool)

(declare-fun e!171485 () Bool)

(assert (=> b!264709 (=> (not res!129223) (not e!171485))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264709 (= res!129223 (validKeyInArray!0 k!2698))))

(declare-fun b!264710 () Bool)

(declare-fun res!129221 () Bool)

(assert (=> b!264710 (=> (not res!129221) (not e!171485))))

(declare-datatypes ((array!12710 0))(
  ( (array!12711 (arr!6014 (Array (_ BitVec 32) (_ BitVec 64))) (size!6366 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12710)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1205 0))(
  ( (MissingZero!1205 (index!6990 (_ BitVec 32))) (Found!1205 (index!6991 (_ BitVec 32))) (Intermediate!1205 (undefined!2017 Bool) (index!6992 (_ BitVec 32)) (x!25322 (_ BitVec 32))) (Undefined!1205) (MissingVacant!1205 (index!6993 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12710 (_ BitVec 32)) SeekEntryResult!1205)

(assert (=> b!264710 (= res!129221 (not (= (seekEntryOrOpen!0 k!2698 a!3436 mask!4002) (MissingZero!1205 i!1355))))))

(declare-fun b!264711 () Bool)

(assert (=> b!264711 (= e!171485 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264712 () Bool)

(declare-fun res!129224 () Bool)

(assert (=> b!264712 (=> (not res!129224) (not e!171485))))

(declare-fun arrayContainsKey!0 (array!12710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264712 (= res!129224 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264713 () Bool)

(declare-fun res!129225 () Bool)

(assert (=> b!264713 (=> (not res!129225) (not e!171485))))

(assert (=> b!264713 (= res!129225 (and (= (size!6366 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6366 a!3436))))))

(declare-fun res!129222 () Bool)

(assert (=> start!25414 (=> (not res!129222) (not e!171485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25414 (= res!129222 (validMask!0 mask!4002))))

(assert (=> start!25414 e!171485))

(assert (=> start!25414 true))

(declare-fun array_inv!3977 (array!12710) Bool)

(assert (=> start!25414 (array_inv!3977 a!3436)))

(assert (= (and start!25414 res!129222) b!264713))

(assert (= (and b!264713 res!129225) b!264709))

(assert (= (and b!264709 res!129223) b!264712))

(assert (= (and b!264712 res!129224) b!264710))

(assert (= (and b!264710 res!129221) b!264711))

(declare-fun m!281715 () Bool)

(assert (=> b!264709 m!281715))

(declare-fun m!281717 () Bool)

(assert (=> b!264710 m!281717))

(declare-fun m!281719 () Bool)

(assert (=> b!264712 m!281719))

(declare-fun m!281721 () Bool)

(assert (=> start!25414 m!281721))

(declare-fun m!281723 () Bool)

(assert (=> start!25414 m!281723))

(push 1)

(assert (not b!264709))

(assert (not start!25414))

(assert (not b!264710))

(assert (not b!264712))

(check-sat)

