; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81862 () Bool)

(assert start!81862)

(declare-fun b!954363 () Bool)

(declare-fun res!638973 () Bool)

(declare-fun e!537640 () Bool)

(assert (=> b!954363 (=> (not res!638973) (not e!537640))))

(declare-datatypes ((array!57785 0))(
  ( (array!57786 (arr!27774 (Array (_ BitVec 32) (_ BitVec 64))) (size!28254 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57785)

(declare-fun mask!4034 () (_ BitVec 32))

(assert (=> b!954363 (= res!638973 (= (size!28254 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954366 () Bool)

(assert (=> b!954366 (= e!537640 false)))

(declare-datatypes ((SeekEntryResult!9135 0))(
  ( (MissingZero!9135 (index!38911 (_ BitVec 32))) (Found!9135 (index!38912 (_ BitVec 32))) (Intermediate!9135 (undefined!9947 Bool) (index!38913 (_ BitVec 32)) (x!82045 (_ BitVec 32))) (Undefined!9135) (MissingVacant!9135 (index!38914 (_ BitVec 32))) )
))
(declare-fun lt!430082 () SeekEntryResult!9135)

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57785 (_ BitVec 32)) SeekEntryResult!9135)

(assert (=> b!954366 (= lt!430082 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!954365 () Bool)

(declare-fun res!638971 () Bool)

(assert (=> b!954365 (=> (not res!638971) (not e!537640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954365 (= res!638971 (validKeyInArray!0 k!2725))))

(declare-fun b!954364 () Bool)

(declare-fun res!638972 () Bool)

(assert (=> b!954364 (=> (not res!638972) (not e!537640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57785 (_ BitVec 32)) Bool)

(assert (=> b!954364 (= res!638972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638970 () Bool)

(assert (=> start!81862 (=> (not res!638970) (not e!537640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81862 (= res!638970 (validMask!0 mask!4034))))

(assert (=> start!81862 e!537640))

(assert (=> start!81862 true))

(declare-fun array_inv!21633 (array!57785) Bool)

(assert (=> start!81862 (array_inv!21633 a!3460)))

(assert (= (and start!81862 res!638970) b!954363))

(assert (= (and b!954363 res!638973) b!954364))

(assert (= (and b!954364 res!638972) b!954365))

(assert (= (and b!954365 res!638971) b!954366))

(declare-fun m!886807 () Bool)

(assert (=> b!954366 m!886807))

(declare-fun m!886809 () Bool)

(assert (=> b!954365 m!886809))

(declare-fun m!886811 () Bool)

(assert (=> b!954364 m!886811))

(declare-fun m!886813 () Bool)

(assert (=> start!81862 m!886813))

(declare-fun m!886815 () Bool)

(assert (=> start!81862 m!886815))

(push 1)

(assert (not b!954366))

(assert (not b!954364))

(assert (not b!954365))

(assert (not start!81862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

