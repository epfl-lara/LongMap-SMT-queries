; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25428 () Bool)

(assert start!25428)

(declare-fun b!264629 () Bool)

(declare-fun res!129195 () Bool)

(declare-fun e!171413 () Bool)

(assert (=> b!264629 (=> (not res!129195) (not e!171413))))

(declare-datatypes ((array!12712 0))(
  ( (array!12713 (arr!6014 (Array (_ BitVec 32) (_ BitVec 64))) (size!6367 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12712)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264629 (= res!129195 (and (= (size!6367 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6367 a!3436))))))

(declare-fun b!264630 () Bool)

(declare-fun res!129196 () Bool)

(assert (=> b!264630 (=> (not res!129196) (not e!171413))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264630 (= res!129196 (validKeyInArray!0 k!2698))))

(declare-fun b!264631 () Bool)

(declare-fun res!129194 () Bool)

(assert (=> b!264631 (=> (not res!129194) (not e!171413))))

(declare-fun arrayContainsKey!0 (array!12712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264631 (= res!129194 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264632 () Bool)

(assert (=> b!264632 (= e!171413 false)))

(declare-datatypes ((SeekEntryResult!1204 0))(
  ( (MissingZero!1204 (index!6986 (_ BitVec 32))) (Found!1204 (index!6987 (_ BitVec 32))) (Intermediate!1204 (undefined!2016 Bool) (index!6988 (_ BitVec 32)) (x!25328 (_ BitVec 32))) (Undefined!1204) (MissingVacant!1204 (index!6989 (_ BitVec 32))) )
))
(declare-fun lt!133722 () SeekEntryResult!1204)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12712 (_ BitVec 32)) SeekEntryResult!1204)

(assert (=> b!264632 (= lt!133722 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!129193 () Bool)

(assert (=> start!25428 (=> (not res!129193) (not e!171413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25428 (= res!129193 (validMask!0 mask!4002))))

(assert (=> start!25428 e!171413))

(assert (=> start!25428 true))

(declare-fun array_inv!3986 (array!12712) Bool)

(assert (=> start!25428 (array_inv!3986 a!3436)))

(assert (= (and start!25428 res!129193) b!264629))

(assert (= (and b!264629 res!129195) b!264630))

(assert (= (and b!264630 res!129196) b!264631))

(assert (= (and b!264631 res!129194) b!264632))

(declare-fun m!281149 () Bool)

(assert (=> b!264630 m!281149))

(declare-fun m!281151 () Bool)

(assert (=> b!264631 m!281151))

(declare-fun m!281153 () Bool)

(assert (=> b!264632 m!281153))

(declare-fun m!281155 () Bool)

(assert (=> start!25428 m!281155))

(declare-fun m!281157 () Bool)

(assert (=> start!25428 m!281157))

(push 1)

(assert (not b!264630))

(assert (not b!264631))

(assert (not start!25428))

(assert (not b!264632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

