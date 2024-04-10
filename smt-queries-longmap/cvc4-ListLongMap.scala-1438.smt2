; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27796 () Bool)

(assert start!27796)

(declare-fun b!286201 () Bool)

(declare-fun res!148351 () Bool)

(declare-fun e!181367 () Bool)

(assert (=> b!286201 (=> (not res!148351) (not e!181367))))

(declare-datatypes ((array!14317 0))(
  ( (array!14318 (arr!6793 (Array (_ BitVec 32) (_ BitVec 64))) (size!7145 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14317)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286201 (= res!148351 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286202 () Bool)

(assert (=> b!286202 (= e!181367 false)))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1942 0))(
  ( (MissingZero!1942 (index!9938 (_ BitVec 32))) (Found!1942 (index!9939 (_ BitVec 32))) (Intermediate!1942 (undefined!2754 Bool) (index!9940 (_ BitVec 32)) (x!28158 (_ BitVec 32))) (Undefined!1942) (MissingVacant!1942 (index!9941 (_ BitVec 32))) )
))
(declare-fun lt!141031 () SeekEntryResult!1942)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14317 (_ BitVec 32)) SeekEntryResult!1942)

(assert (=> b!286202 (= lt!141031 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286199 () Bool)

(declare-fun res!148352 () Bool)

(assert (=> b!286199 (=> (not res!148352) (not e!181367))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286199 (= res!148352 (and (= (size!7145 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7145 a!3312))))))

(declare-fun res!148353 () Bool)

(assert (=> start!27796 (=> (not res!148353) (not e!181367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27796 (= res!148353 (validMask!0 mask!3809))))

(assert (=> start!27796 e!181367))

(assert (=> start!27796 true))

(declare-fun array_inv!4756 (array!14317) Bool)

(assert (=> start!27796 (array_inv!4756 a!3312)))

(declare-fun b!286200 () Bool)

(declare-fun res!148350 () Bool)

(assert (=> b!286200 (=> (not res!148350) (not e!181367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286200 (= res!148350 (validKeyInArray!0 k!2524))))

(assert (= (and start!27796 res!148353) b!286199))

(assert (= (and b!286199 res!148352) b!286200))

(assert (= (and b!286200 res!148350) b!286201))

(assert (= (and b!286201 res!148351) b!286202))

(declare-fun m!300935 () Bool)

(assert (=> b!286201 m!300935))

(declare-fun m!300937 () Bool)

(assert (=> b!286202 m!300937))

(declare-fun m!300939 () Bool)

(assert (=> start!27796 m!300939))

(declare-fun m!300941 () Bool)

(assert (=> start!27796 m!300941))

(declare-fun m!300943 () Bool)

(assert (=> b!286200 m!300943))

(push 1)

(assert (not b!286200))

(assert (not b!286201))

(assert (not start!27796))

(assert (not b!286202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

