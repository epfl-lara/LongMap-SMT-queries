; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25452 () Bool)

(assert start!25452)

(declare-fun b!264773 () Bool)

(declare-fun res!129337 () Bool)

(declare-fun e!171485 () Bool)

(assert (=> b!264773 (=> (not res!129337) (not e!171485))))

(declare-datatypes ((array!12736 0))(
  ( (array!12737 (arr!6026 (Array (_ BitVec 32) (_ BitVec 64))) (size!6379 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12736)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264773 (= res!129337 (and (= (size!6379 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6379 a!3436))))))

(declare-fun b!264776 () Bool)

(assert (=> b!264776 (= e!171485 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1216 0))(
  ( (MissingZero!1216 (index!7034 (_ BitVec 32))) (Found!1216 (index!7035 (_ BitVec 32))) (Intermediate!1216 (undefined!2028 Bool) (index!7036 (_ BitVec 32)) (x!25372 (_ BitVec 32))) (Undefined!1216) (MissingVacant!1216 (index!7037 (_ BitVec 32))) )
))
(declare-fun lt!133758 () SeekEntryResult!1216)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12736 (_ BitVec 32)) SeekEntryResult!1216)

(assert (=> b!264776 (= lt!133758 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264774 () Bool)

(declare-fun res!129338 () Bool)

(assert (=> b!264774 (=> (not res!129338) (not e!171485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264774 (= res!129338 (validKeyInArray!0 k!2698))))

(declare-fun res!129340 () Bool)

(assert (=> start!25452 (=> (not res!129340) (not e!171485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25452 (= res!129340 (validMask!0 mask!4002))))

(assert (=> start!25452 e!171485))

(assert (=> start!25452 true))

(declare-fun array_inv!3998 (array!12736) Bool)

(assert (=> start!25452 (array_inv!3998 a!3436)))

(declare-fun b!264775 () Bool)

(declare-fun res!129339 () Bool)

(assert (=> b!264775 (=> (not res!129339) (not e!171485))))

(declare-fun arrayContainsKey!0 (array!12736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264775 (= res!129339 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25452 res!129340) b!264773))

(assert (= (and b!264773 res!129337) b!264774))

(assert (= (and b!264774 res!129338) b!264775))

(assert (= (and b!264775 res!129339) b!264776))

(declare-fun m!281269 () Bool)

(assert (=> b!264776 m!281269))

(declare-fun m!281271 () Bool)

(assert (=> b!264774 m!281271))

(declare-fun m!281273 () Bool)

(assert (=> start!25452 m!281273))

(declare-fun m!281275 () Bool)

(assert (=> start!25452 m!281275))

(declare-fun m!281277 () Bool)

(assert (=> b!264775 m!281277))

(push 1)

(assert (not b!264776))

(assert (not b!264774))

(assert (not b!264775))

(assert (not start!25452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

