; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27790 () Bool)

(assert start!27790)

(declare-fun res!148315 () Bool)

(declare-fun e!181349 () Bool)

(assert (=> start!27790 (=> (not res!148315) (not e!181349))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27790 (= res!148315 (validMask!0 mask!3809))))

(assert (=> start!27790 e!181349))

(assert (=> start!27790 true))

(declare-datatypes ((array!14311 0))(
  ( (array!14312 (arr!6790 (Array (_ BitVec 32) (_ BitVec 64))) (size!7142 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14311)

(declare-fun array_inv!4753 (array!14311) Bool)

(assert (=> start!27790 (array_inv!4753 a!3312)))

(declare-fun b!286163 () Bool)

(declare-fun res!148317 () Bool)

(assert (=> b!286163 (=> (not res!148317) (not e!181349))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286163 (= res!148317 (and (= (size!7142 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7142 a!3312))))))

(declare-fun b!286166 () Bool)

(assert (=> b!286166 (= e!181349 false)))

(declare-datatypes ((SeekEntryResult!1939 0))(
  ( (MissingZero!1939 (index!9926 (_ BitVec 32))) (Found!1939 (index!9927 (_ BitVec 32))) (Intermediate!1939 (undefined!2751 Bool) (index!9928 (_ BitVec 32)) (x!28147 (_ BitVec 32))) (Undefined!1939) (MissingVacant!1939 (index!9929 (_ BitVec 32))) )
))
(declare-fun lt!141022 () SeekEntryResult!1939)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14311 (_ BitVec 32)) SeekEntryResult!1939)

(assert (=> b!286166 (= lt!141022 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286164 () Bool)

(declare-fun res!148314 () Bool)

(assert (=> b!286164 (=> (not res!148314) (not e!181349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286164 (= res!148314 (validKeyInArray!0 k!2524))))

(declare-fun b!286165 () Bool)

(declare-fun res!148316 () Bool)

(assert (=> b!286165 (=> (not res!148316) (not e!181349))))

(declare-fun arrayContainsKey!0 (array!14311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286165 (= res!148316 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27790 res!148315) b!286163))

(assert (= (and b!286163 res!148317) b!286164))

(assert (= (and b!286164 res!148314) b!286165))

(assert (= (and b!286165 res!148316) b!286166))

(declare-fun m!300905 () Bool)

(assert (=> start!27790 m!300905))

(declare-fun m!300907 () Bool)

(assert (=> start!27790 m!300907))

(declare-fun m!300909 () Bool)

(assert (=> b!286166 m!300909))

(declare-fun m!300911 () Bool)

(assert (=> b!286164 m!300911))

(declare-fun m!300913 () Bool)

(assert (=> b!286165 m!300913))

(push 1)

(assert (not b!286164))

(assert (not b!286165))

(assert (not start!27790))

(assert (not b!286166))

(check-sat)

