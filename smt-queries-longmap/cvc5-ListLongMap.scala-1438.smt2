; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27792 () Bool)

(assert start!27792)

(declare-fun b!286176 () Bool)

(declare-fun res!148326 () Bool)

(declare-fun e!181354 () Bool)

(assert (=> b!286176 (=> (not res!148326) (not e!181354))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286176 (= res!148326 (validKeyInArray!0 k!2524))))

(declare-fun b!286177 () Bool)

(declare-fun res!148328 () Bool)

(assert (=> b!286177 (=> (not res!148328) (not e!181354))))

(declare-datatypes ((array!14313 0))(
  ( (array!14314 (arr!6791 (Array (_ BitVec 32) (_ BitVec 64))) (size!7143 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14313)

(declare-fun arrayContainsKey!0 (array!14313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286177 (= res!148328 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148327 () Bool)

(assert (=> start!27792 (=> (not res!148327) (not e!181354))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27792 (= res!148327 (validMask!0 mask!3809))))

(assert (=> start!27792 e!181354))

(assert (=> start!27792 true))

(declare-fun array_inv!4754 (array!14313) Bool)

(assert (=> start!27792 (array_inv!4754 a!3312)))

(declare-fun b!286178 () Bool)

(assert (=> b!286178 (= e!181354 false)))

(declare-datatypes ((SeekEntryResult!1940 0))(
  ( (MissingZero!1940 (index!9930 (_ BitVec 32))) (Found!1940 (index!9931 (_ BitVec 32))) (Intermediate!1940 (undefined!2752 Bool) (index!9932 (_ BitVec 32)) (x!28156 (_ BitVec 32))) (Undefined!1940) (MissingVacant!1940 (index!9933 (_ BitVec 32))) )
))
(declare-fun lt!141025 () SeekEntryResult!1940)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14313 (_ BitVec 32)) SeekEntryResult!1940)

(assert (=> b!286178 (= lt!141025 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286175 () Bool)

(declare-fun res!148329 () Bool)

(assert (=> b!286175 (=> (not res!148329) (not e!181354))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286175 (= res!148329 (and (= (size!7143 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7143 a!3312))))))

(assert (= (and start!27792 res!148327) b!286175))

(assert (= (and b!286175 res!148329) b!286176))

(assert (= (and b!286176 res!148326) b!286177))

(assert (= (and b!286177 res!148328) b!286178))

(declare-fun m!300915 () Bool)

(assert (=> b!286176 m!300915))

(declare-fun m!300917 () Bool)

(assert (=> b!286177 m!300917))

(declare-fun m!300919 () Bool)

(assert (=> start!27792 m!300919))

(declare-fun m!300921 () Bool)

(assert (=> start!27792 m!300921))

(declare-fun m!300923 () Bool)

(assert (=> b!286178 m!300923))

(push 1)

(assert (not b!286176))

(assert (not b!286177))

(assert (not start!27792))

(assert (not b!286178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

