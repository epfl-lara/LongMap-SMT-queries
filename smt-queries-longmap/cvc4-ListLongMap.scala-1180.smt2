; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25424 () Bool)

(assert start!25424)

(declare-fun res!129290 () Bool)

(declare-fun e!171515 () Bool)

(assert (=> start!25424 (=> (not res!129290) (not e!171515))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25424 (= res!129290 (validMask!0 mask!4002))))

(assert (=> start!25424 e!171515))

(assert (=> start!25424 true))

(declare-datatypes ((array!12720 0))(
  ( (array!12721 (arr!6019 (Array (_ BitVec 32) (_ BitVec 64))) (size!6371 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12720)

(declare-fun array_inv!3982 (array!12720) Bool)

(assert (=> start!25424 (array_inv!3982 a!3436)))

(declare-fun b!264776 () Bool)

(declare-fun res!129289 () Bool)

(assert (=> b!264776 (=> (not res!129289) (not e!171515))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264776 (= res!129289 (and (= (size!6371 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6371 a!3436))))))

(declare-fun b!264778 () Bool)

(declare-fun res!129288 () Bool)

(assert (=> b!264778 (=> (not res!129288) (not e!171515))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264778 (= res!129288 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264779 () Bool)

(assert (=> b!264779 (= e!171515 false)))

(declare-datatypes ((SeekEntryResult!1210 0))(
  ( (MissingZero!1210 (index!7010 (_ BitVec 32))) (Found!1210 (index!7011 (_ BitVec 32))) (Intermediate!1210 (undefined!2022 Bool) (index!7012 (_ BitVec 32)) (x!25335 (_ BitVec 32))) (Undefined!1210) (MissingVacant!1210 (index!7013 (_ BitVec 32))) )
))
(declare-fun lt!133903 () SeekEntryResult!1210)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12720 (_ BitVec 32)) SeekEntryResult!1210)

(assert (=> b!264779 (= lt!133903 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264777 () Bool)

(declare-fun res!129291 () Bool)

(assert (=> b!264777 (=> (not res!129291) (not e!171515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264777 (= res!129291 (validKeyInArray!0 k!2698))))

(assert (= (and start!25424 res!129290) b!264776))

(assert (= (and b!264776 res!129289) b!264777))

(assert (= (and b!264777 res!129291) b!264778))

(assert (= (and b!264778 res!129288) b!264779))

(declare-fun m!281765 () Bool)

(assert (=> start!25424 m!281765))

(declare-fun m!281767 () Bool)

(assert (=> start!25424 m!281767))

(declare-fun m!281769 () Bool)

(assert (=> b!264778 m!281769))

(declare-fun m!281771 () Bool)

(assert (=> b!264779 m!281771))

(declare-fun m!281773 () Bool)

(assert (=> b!264777 m!281773))

(push 1)

(assert (not b!264777))

(assert (not b!264779))

(assert (not b!264778))

(assert (not start!25424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

