; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27802 () Bool)

(assert start!27802)

(declare-fun b!286236 () Bool)

(declare-fun res!148386 () Bool)

(declare-fun e!181384 () Bool)

(assert (=> b!286236 (=> (not res!148386) (not e!181384))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286236 (= res!148386 (validKeyInArray!0 k!2524))))

(declare-fun b!286235 () Bool)

(declare-fun res!148387 () Bool)

(assert (=> b!286235 (=> (not res!148387) (not e!181384))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14323 0))(
  ( (array!14324 (arr!6796 (Array (_ BitVec 32) (_ BitVec 64))) (size!7148 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14323)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286235 (= res!148387 (and (= (size!7148 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7148 a!3312))))))

(declare-fun b!286237 () Bool)

(declare-fun res!148389 () Bool)

(assert (=> b!286237 (=> (not res!148389) (not e!181384))))

(declare-fun arrayContainsKey!0 (array!14323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286237 (= res!148389 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286238 () Bool)

(assert (=> b!286238 (= e!181384 false)))

(declare-datatypes ((SeekEntryResult!1945 0))(
  ( (MissingZero!1945 (index!9950 (_ BitVec 32))) (Found!1945 (index!9951 (_ BitVec 32))) (Intermediate!1945 (undefined!2757 Bool) (index!9952 (_ BitVec 32)) (x!28169 (_ BitVec 32))) (Undefined!1945) (MissingVacant!1945 (index!9953 (_ BitVec 32))) )
))
(declare-fun lt!141040 () SeekEntryResult!1945)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14323 (_ BitVec 32)) SeekEntryResult!1945)

(assert (=> b!286238 (= lt!141040 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!148388 () Bool)

(assert (=> start!27802 (=> (not res!148388) (not e!181384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27802 (= res!148388 (validMask!0 mask!3809))))

(assert (=> start!27802 e!181384))

(assert (=> start!27802 true))

(declare-fun array_inv!4759 (array!14323) Bool)

(assert (=> start!27802 (array_inv!4759 a!3312)))

(assert (= (and start!27802 res!148388) b!286235))

(assert (= (and b!286235 res!148387) b!286236))

(assert (= (and b!286236 res!148386) b!286237))

(assert (= (and b!286237 res!148389) b!286238))

(declare-fun m!300965 () Bool)

(assert (=> b!286236 m!300965))

(declare-fun m!300967 () Bool)

(assert (=> b!286237 m!300967))

(declare-fun m!300969 () Bool)

(assert (=> b!286238 m!300969))

(declare-fun m!300971 () Bool)

(assert (=> start!27802 m!300971))

(declare-fun m!300973 () Bool)

(assert (=> start!27802 m!300973))

(push 1)

(assert (not b!286238))

(assert (not b!286237))

(assert (not b!286236))

(assert (not start!27802))

(check-sat)

