; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25452 () Bool)

(assert start!25452)

(declare-fun b!264967 () Bool)

(declare-fun res!129453 () Bool)

(declare-fun e!171611 () Bool)

(assert (=> b!264967 (=> (not res!129453) (not e!171611))))

(declare-datatypes ((array!12743 0))(
  ( (array!12744 (arr!6030 (Array (_ BitVec 32) (_ BitVec 64))) (size!6382 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12743)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264967 (= res!129453 (and (= (size!6382 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6382 a!3436))))))

(declare-fun b!264968 () Bool)

(declare-fun res!129456 () Bool)

(assert (=> b!264968 (=> (not res!129456) (not e!171611))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264968 (= res!129456 (validKeyInArray!0 k!2698))))

(declare-fun res!129454 () Bool)

(assert (=> start!25452 (=> (not res!129454) (not e!171611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25452 (= res!129454 (validMask!0 mask!4002))))

(assert (=> start!25452 e!171611))

(assert (=> start!25452 true))

(declare-fun array_inv!3980 (array!12743) Bool)

(assert (=> start!25452 (array_inv!3980 a!3436)))

(declare-fun b!264969 () Bool)

(declare-fun res!129455 () Bool)

(assert (=> b!264969 (=> (not res!129455) (not e!171611))))

(declare-fun arrayContainsKey!0 (array!12743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264969 (= res!129455 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264970 () Bool)

(assert (=> b!264970 (= e!171611 false)))

(declare-datatypes ((SeekEntryResult!1186 0))(
  ( (MissingZero!1186 (index!6914 (_ BitVec 32))) (Found!1186 (index!6915 (_ BitVec 32))) (Intermediate!1186 (undefined!1998 Bool) (index!6916 (_ BitVec 32)) (x!25343 (_ BitVec 32))) (Undefined!1186) (MissingVacant!1186 (index!6917 (_ BitVec 32))) )
))
(declare-fun lt!133998 () SeekEntryResult!1186)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12743 (_ BitVec 32)) SeekEntryResult!1186)

(assert (=> b!264970 (= lt!133998 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25452 res!129454) b!264967))

(assert (= (and b!264967 res!129453) b!264968))

(assert (= (and b!264968 res!129456) b!264969))

(assert (= (and b!264969 res!129455) b!264970))

(declare-fun m!282067 () Bool)

(assert (=> b!264968 m!282067))

(declare-fun m!282069 () Bool)

(assert (=> start!25452 m!282069))

(declare-fun m!282071 () Bool)

(assert (=> start!25452 m!282071))

(declare-fun m!282073 () Bool)

(assert (=> b!264969 m!282073))

(declare-fun m!282075 () Bool)

(assert (=> b!264970 m!282075))

(push 1)

(assert (not b!264970))

(assert (not b!264969))

(assert (not start!25452))

(assert (not b!264968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

