; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25432 () Bool)

(assert start!25432)

(declare-fun res!129336 () Bool)

(declare-fun e!171538 () Bool)

(assert (=> start!25432 (=> (not res!129336) (not e!171538))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25432 (= res!129336 (validMask!0 mask!4002))))

(assert (=> start!25432 e!171538))

(assert (=> start!25432 true))

(declare-datatypes ((array!12728 0))(
  ( (array!12729 (arr!6023 (Array (_ BitVec 32) (_ BitVec 64))) (size!6375 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12728)

(declare-fun array_inv!3986 (array!12728) Bool)

(assert (=> start!25432 (array_inv!3986 a!3436)))

(declare-fun b!264825 () Bool)

(declare-fun res!129338 () Bool)

(assert (=> b!264825 (=> (not res!129338) (not e!171538))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264825 (= res!129338 (validKeyInArray!0 k!2698))))

(declare-fun b!264826 () Bool)

(declare-fun res!129339 () Bool)

(assert (=> b!264826 (=> (not res!129339) (not e!171538))))

(declare-fun arrayContainsKey!0 (array!12728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264826 (= res!129339 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264827 () Bool)

(assert (=> b!264827 (= e!171538 false)))

(declare-datatypes ((SeekEntryResult!1214 0))(
  ( (MissingZero!1214 (index!7026 (_ BitVec 32))) (Found!1214 (index!7027 (_ BitVec 32))) (Intermediate!1214 (undefined!2026 Bool) (index!7028 (_ BitVec 32)) (x!25355 (_ BitVec 32))) (Undefined!1214) (MissingVacant!1214 (index!7029 (_ BitVec 32))) )
))
(declare-fun lt!133915 () SeekEntryResult!1214)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12728 (_ BitVec 32)) SeekEntryResult!1214)

(assert (=> b!264827 (= lt!133915 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264824 () Bool)

(declare-fun res!129337 () Bool)

(assert (=> b!264824 (=> (not res!129337) (not e!171538))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264824 (= res!129337 (and (= (size!6375 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6375 a!3436))))))

(assert (= (and start!25432 res!129336) b!264824))

(assert (= (and b!264824 res!129337) b!264825))

(assert (= (and b!264825 res!129338) b!264826))

(assert (= (and b!264826 res!129339) b!264827))

(declare-fun m!281805 () Bool)

(assert (=> start!25432 m!281805))

(declare-fun m!281807 () Bool)

(assert (=> start!25432 m!281807))

(declare-fun m!281809 () Bool)

(assert (=> b!264825 m!281809))

(declare-fun m!281811 () Bool)

(assert (=> b!264826 m!281811))

(declare-fun m!281813 () Bool)

(assert (=> b!264827 m!281813))

(push 1)

(assert (not b!264827))

(assert (not b!264826))

(assert (not start!25432))

(assert (not b!264825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

