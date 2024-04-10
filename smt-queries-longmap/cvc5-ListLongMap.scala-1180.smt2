; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25420 () Bool)

(assert start!25420)

(declare-fun b!264753 () Bool)

(declare-fun res!129265 () Bool)

(declare-fun e!171502 () Bool)

(assert (=> b!264753 (=> (not res!129265) (not e!171502))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264753 (= res!129265 (validKeyInArray!0 k!2698))))

(declare-fun b!264752 () Bool)

(declare-fun res!129264 () Bool)

(assert (=> b!264752 (=> (not res!129264) (not e!171502))))

(declare-datatypes ((array!12716 0))(
  ( (array!12717 (arr!6017 (Array (_ BitVec 32) (_ BitVec 64))) (size!6369 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12716)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264752 (= res!129264 (and (= (size!6369 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6369 a!3436))))))

(declare-fun res!129267 () Bool)

(assert (=> start!25420 (=> (not res!129267) (not e!171502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25420 (= res!129267 (validMask!0 mask!4002))))

(assert (=> start!25420 e!171502))

(assert (=> start!25420 true))

(declare-fun array_inv!3980 (array!12716) Bool)

(assert (=> start!25420 (array_inv!3980 a!3436)))

(declare-fun b!264755 () Bool)

(assert (=> b!264755 (= e!171502 false)))

(declare-datatypes ((SeekEntryResult!1208 0))(
  ( (MissingZero!1208 (index!7002 (_ BitVec 32))) (Found!1208 (index!7003 (_ BitVec 32))) (Intermediate!1208 (undefined!2020 Bool) (index!7004 (_ BitVec 32)) (x!25333 (_ BitVec 32))) (Undefined!1208) (MissingVacant!1208 (index!7005 (_ BitVec 32))) )
))
(declare-fun lt!133897 () SeekEntryResult!1208)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12716 (_ BitVec 32)) SeekEntryResult!1208)

(assert (=> b!264755 (= lt!133897 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264754 () Bool)

(declare-fun res!129266 () Bool)

(assert (=> b!264754 (=> (not res!129266) (not e!171502))))

(declare-fun arrayContainsKey!0 (array!12716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264754 (= res!129266 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25420 res!129267) b!264752))

(assert (= (and b!264752 res!129264) b!264753))

(assert (= (and b!264753 res!129265) b!264754))

(assert (= (and b!264754 res!129266) b!264755))

(declare-fun m!281745 () Bool)

(assert (=> b!264753 m!281745))

(declare-fun m!281747 () Bool)

(assert (=> start!25420 m!281747))

(declare-fun m!281749 () Bool)

(assert (=> start!25420 m!281749))

(declare-fun m!281751 () Bool)

(assert (=> b!264755 m!281751))

(declare-fun m!281753 () Bool)

(assert (=> b!264754 m!281753))

(push 1)

(assert (not b!264754))

(assert (not start!25420))

(assert (not b!264753))

(assert (not b!264755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

