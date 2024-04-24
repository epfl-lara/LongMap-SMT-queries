; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27792 () Bool)

(assert start!27792)

(declare-fun b!286273 () Bool)

(declare-fun e!181402 () Bool)

(assert (=> b!286273 (= e!181402 false)))

(declare-datatypes ((SeekEntryResult!1908 0))(
  ( (MissingZero!1908 (index!9802 (_ BitVec 32))) (Found!1908 (index!9803 (_ BitVec 32))) (Intermediate!1908 (undefined!2720 Bool) (index!9804 (_ BitVec 32)) (x!28132 (_ BitVec 32))) (Undefined!1908) (MissingVacant!1908 (index!9805 (_ BitVec 32))) )
))
(declare-fun lt!141096 () SeekEntryResult!1908)

(declare-datatypes ((array!14318 0))(
  ( (array!14319 (arr!6794 (Array (_ BitVec 32) (_ BitVec 64))) (size!7146 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14318)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14318 (_ BitVec 32)) SeekEntryResult!1908)

(assert (=> b!286273 (= lt!141096 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286270 () Bool)

(declare-fun res!148395 () Bool)

(assert (=> b!286270 (=> (not res!148395) (not e!181402))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286270 (= res!148395 (and (= (size!7146 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7146 a!3312))))))

(declare-fun b!286272 () Bool)

(declare-fun res!148398 () Bool)

(assert (=> b!286272 (=> (not res!148398) (not e!181402))))

(declare-fun arrayContainsKey!0 (array!14318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286272 (= res!148398 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148396 () Bool)

(assert (=> start!27792 (=> (not res!148396) (not e!181402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27792 (= res!148396 (validMask!0 mask!3809))))

(assert (=> start!27792 e!181402))

(assert (=> start!27792 true))

(declare-fun array_inv!4744 (array!14318) Bool)

(assert (=> start!27792 (array_inv!4744 a!3312)))

(declare-fun b!286271 () Bool)

(declare-fun res!148397 () Bool)

(assert (=> b!286271 (=> (not res!148397) (not e!181402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286271 (= res!148397 (validKeyInArray!0 k!2524))))

(assert (= (and start!27792 res!148396) b!286270))

(assert (= (and b!286270 res!148395) b!286271))

(assert (= (and b!286271 res!148397) b!286272))

(assert (= (and b!286272 res!148398) b!286273))

(declare-fun m!301161 () Bool)

(assert (=> b!286273 m!301161))

(declare-fun m!301163 () Bool)

(assert (=> b!286272 m!301163))

(declare-fun m!301165 () Bool)

(assert (=> start!27792 m!301165))

(declare-fun m!301167 () Bool)

(assert (=> start!27792 m!301167))

(declare-fun m!301169 () Bool)

(assert (=> b!286271 m!301169))

(push 1)

(assert (not b!286271))

(assert (not b!286272))

(assert (not start!27792))

(assert (not b!286273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

