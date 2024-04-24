; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27782 () Bool)

(assert start!27782)

(declare-fun b!286213 () Bool)

(declare-fun e!181372 () Bool)

(assert (=> b!286213 (= e!181372 false)))

(declare-datatypes ((SeekEntryResult!1903 0))(
  ( (MissingZero!1903 (index!9782 (_ BitVec 32))) (Found!1903 (index!9783 (_ BitVec 32))) (Intermediate!1903 (undefined!2715 Bool) (index!9784 (_ BitVec 32)) (x!28111 (_ BitVec 32))) (Undefined!1903) (MissingVacant!1903 (index!9785 (_ BitVec 32))) )
))
(declare-fun lt!141081 () SeekEntryResult!1903)

(declare-datatypes ((array!14308 0))(
  ( (array!14309 (arr!6789 (Array (_ BitVec 32) (_ BitVec 64))) (size!7141 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14308)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14308 (_ BitVec 32)) SeekEntryResult!1903)

(assert (=> b!286213 (= lt!141081 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!148337 () Bool)

(assert (=> start!27782 (=> (not res!148337) (not e!181372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27782 (= res!148337 (validMask!0 mask!3809))))

(assert (=> start!27782 e!181372))

(assert (=> start!27782 true))

(declare-fun array_inv!4739 (array!14308) Bool)

(assert (=> start!27782 (array_inv!4739 a!3312)))

(declare-fun b!286210 () Bool)

(declare-fun res!148338 () Bool)

(assert (=> b!286210 (=> (not res!148338) (not e!181372))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286210 (= res!148338 (and (= (size!7141 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7141 a!3312))))))

(declare-fun b!286211 () Bool)

(declare-fun res!148336 () Bool)

(assert (=> b!286211 (=> (not res!148336) (not e!181372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286211 (= res!148336 (validKeyInArray!0 k!2524))))

(declare-fun b!286212 () Bool)

(declare-fun res!148335 () Bool)

(assert (=> b!286212 (=> (not res!148335) (not e!181372))))

(declare-fun arrayContainsKey!0 (array!14308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286212 (= res!148335 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27782 res!148337) b!286210))

(assert (= (and b!286210 res!148338) b!286211))

(assert (= (and b!286211 res!148336) b!286212))

(assert (= (and b!286212 res!148335) b!286213))

(declare-fun m!301111 () Bool)

(assert (=> b!286213 m!301111))

(declare-fun m!301113 () Bool)

(assert (=> start!27782 m!301113))

(declare-fun m!301115 () Bool)

(assert (=> start!27782 m!301115))

(declare-fun m!301117 () Bool)

(assert (=> b!286211 m!301117))

(declare-fun m!301119 () Bool)

(assert (=> b!286212 m!301119))

(push 1)

(assert (not b!286211))

(assert (not b!286212))

(assert (not start!27782))

(assert (not b!286213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

