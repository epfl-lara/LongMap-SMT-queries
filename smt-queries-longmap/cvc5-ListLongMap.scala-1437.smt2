; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27786 () Bool)

(assert start!27786)

(declare-fun b!286140 () Bool)

(declare-fun res!148290 () Bool)

(declare-fun e!181337 () Bool)

(assert (=> b!286140 (=> (not res!148290) (not e!181337))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286140 (= res!148290 (validKeyInArray!0 k!2524))))

(declare-fun res!148293 () Bool)

(assert (=> start!27786 (=> (not res!148293) (not e!181337))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27786 (= res!148293 (validMask!0 mask!3809))))

(assert (=> start!27786 e!181337))

(assert (=> start!27786 true))

(declare-datatypes ((array!14307 0))(
  ( (array!14308 (arr!6788 (Array (_ BitVec 32) (_ BitVec 64))) (size!7140 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14307)

(declare-fun array_inv!4751 (array!14307) Bool)

(assert (=> start!27786 (array_inv!4751 a!3312)))

(declare-fun b!286142 () Bool)

(assert (=> b!286142 (= e!181337 false)))

(declare-datatypes ((SeekEntryResult!1937 0))(
  ( (MissingZero!1937 (index!9918 (_ BitVec 32))) (Found!1937 (index!9919 (_ BitVec 32))) (Intermediate!1937 (undefined!2749 Bool) (index!9920 (_ BitVec 32)) (x!28145 (_ BitVec 32))) (Undefined!1937) (MissingVacant!1937 (index!9921 (_ BitVec 32))) )
))
(declare-fun lt!141016 () SeekEntryResult!1937)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14307 (_ BitVec 32)) SeekEntryResult!1937)

(assert (=> b!286142 (= lt!141016 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286141 () Bool)

(declare-fun res!148292 () Bool)

(assert (=> b!286141 (=> (not res!148292) (not e!181337))))

(declare-fun arrayContainsKey!0 (array!14307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286141 (= res!148292 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286139 () Bool)

(declare-fun res!148291 () Bool)

(assert (=> b!286139 (=> (not res!148291) (not e!181337))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286139 (= res!148291 (and (= (size!7140 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7140 a!3312))))))

(assert (= (and start!27786 res!148293) b!286139))

(assert (= (and b!286139 res!148291) b!286140))

(assert (= (and b!286140 res!148290) b!286141))

(assert (= (and b!286141 res!148292) b!286142))

(declare-fun m!300885 () Bool)

(assert (=> b!286140 m!300885))

(declare-fun m!300887 () Bool)

(assert (=> start!27786 m!300887))

(declare-fun m!300889 () Bool)

(assert (=> start!27786 m!300889))

(declare-fun m!300891 () Bool)

(assert (=> b!286142 m!300891))

(declare-fun m!300893 () Bool)

(assert (=> b!286141 m!300893))

(push 1)

(assert (not b!286140))

(assert (not b!286141))

(assert (not start!27786))

(assert (not b!286142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

