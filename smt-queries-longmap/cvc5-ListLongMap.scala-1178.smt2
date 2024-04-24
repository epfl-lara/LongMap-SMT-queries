; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25416 () Bool)

(assert start!25416)

(declare-fun b!264745 () Bool)

(declare-fun e!171502 () Bool)

(assert (=> b!264745 (= e!171502 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12707 0))(
  ( (array!12708 (arr!6012 (Array (_ BitVec 32) (_ BitVec 64))) (size!6364 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12707)

(declare-datatypes ((SeekEntryResult!1168 0))(
  ( (MissingZero!1168 (index!6842 (_ BitVec 32))) (Found!1168 (index!6843 (_ BitVec 32))) (Intermediate!1168 (undefined!1980 Bool) (index!6844 (_ BitVec 32)) (x!25277 (_ BitVec 32))) (Undefined!1168) (MissingVacant!1168 (index!6845 (_ BitVec 32))) )
))
(declare-fun lt!133953 () SeekEntryResult!1168)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12707 (_ BitVec 32)) SeekEntryResult!1168)

(assert (=> b!264745 (= lt!133953 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264742 () Bool)

(declare-fun res!129229 () Bool)

(assert (=> b!264742 (=> (not res!129229) (not e!171502))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264742 (= res!129229 (and (= (size!6364 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6364 a!3436))))))

(declare-fun b!264743 () Bool)

(declare-fun res!129230 () Bool)

(assert (=> b!264743 (=> (not res!129230) (not e!171502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264743 (= res!129230 (validKeyInArray!0 k!2698))))

(declare-fun b!264744 () Bool)

(declare-fun res!129228 () Bool)

(assert (=> b!264744 (=> (not res!129228) (not e!171502))))

(declare-fun arrayContainsKey!0 (array!12707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264744 (= res!129228 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129231 () Bool)

(assert (=> start!25416 (=> (not res!129231) (not e!171502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25416 (= res!129231 (validMask!0 mask!4002))))

(assert (=> start!25416 e!171502))

(assert (=> start!25416 true))

(declare-fun array_inv!3962 (array!12707) Bool)

(assert (=> start!25416 (array_inv!3962 a!3436)))

(assert (= (and start!25416 res!129231) b!264742))

(assert (= (and b!264742 res!129229) b!264743))

(assert (= (and b!264743 res!129230) b!264744))

(assert (= (and b!264744 res!129228) b!264745))

(declare-fun m!281887 () Bool)

(assert (=> b!264745 m!281887))

(declare-fun m!281889 () Bool)

(assert (=> b!264743 m!281889))

(declare-fun m!281891 () Bool)

(assert (=> b!264744 m!281891))

(declare-fun m!281893 () Bool)

(assert (=> start!25416 m!281893))

(declare-fun m!281895 () Bool)

(assert (=> start!25416 m!281895))

(push 1)

(assert (not b!264743))

(assert (not b!264744))

(assert (not start!25416))

(assert (not b!264745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

