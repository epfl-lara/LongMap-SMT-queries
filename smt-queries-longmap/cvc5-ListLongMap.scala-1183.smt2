; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25446 () Bool)

(assert start!25446)

(declare-fun b!264737 () Bool)

(declare-fun res!129301 () Bool)

(declare-fun e!171467 () Bool)

(assert (=> b!264737 (=> (not res!129301) (not e!171467))))

(declare-datatypes ((array!12730 0))(
  ( (array!12731 (arr!6023 (Array (_ BitVec 32) (_ BitVec 64))) (size!6376 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12730)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264737 (= res!129301 (and (= (size!6376 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6376 a!3436))))))

(declare-fun b!264738 () Bool)

(declare-fun res!129304 () Bool)

(assert (=> b!264738 (=> (not res!129304) (not e!171467))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264738 (= res!129304 (validKeyInArray!0 k!2698))))

(declare-fun b!264739 () Bool)

(declare-fun res!129302 () Bool)

(assert (=> b!264739 (=> (not res!129302) (not e!171467))))

(declare-fun arrayContainsKey!0 (array!12730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264739 (= res!129302 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264740 () Bool)

(assert (=> b!264740 (= e!171467 false)))

(declare-datatypes ((SeekEntryResult!1213 0))(
  ( (MissingZero!1213 (index!7022 (_ BitVec 32))) (Found!1213 (index!7023 (_ BitVec 32))) (Intermediate!1213 (undefined!2025 Bool) (index!7024 (_ BitVec 32)) (x!25361 (_ BitVec 32))) (Undefined!1213) (MissingVacant!1213 (index!7025 (_ BitVec 32))) )
))
(declare-fun lt!133749 () SeekEntryResult!1213)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12730 (_ BitVec 32)) SeekEntryResult!1213)

(assert (=> b!264740 (= lt!133749 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!129303 () Bool)

(assert (=> start!25446 (=> (not res!129303) (not e!171467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25446 (= res!129303 (validMask!0 mask!4002))))

(assert (=> start!25446 e!171467))

(assert (=> start!25446 true))

(declare-fun array_inv!3995 (array!12730) Bool)

(assert (=> start!25446 (array_inv!3995 a!3436)))

(assert (= (and start!25446 res!129303) b!264737))

(assert (= (and b!264737 res!129301) b!264738))

(assert (= (and b!264738 res!129304) b!264739))

(assert (= (and b!264739 res!129302) b!264740))

(declare-fun m!281239 () Bool)

(assert (=> b!264738 m!281239))

(declare-fun m!281241 () Bool)

(assert (=> b!264739 m!281241))

(declare-fun m!281243 () Bool)

(assert (=> b!264740 m!281243))

(declare-fun m!281245 () Bool)

(assert (=> start!25446 m!281245))

(declare-fun m!281247 () Bool)

(assert (=> start!25446 m!281247))

(push 1)

(assert (not b!264739))

(assert (not start!25446))

(assert (not b!264740))

(assert (not b!264738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

