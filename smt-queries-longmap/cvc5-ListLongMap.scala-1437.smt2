; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27786 () Bool)

(assert start!27786)

(declare-fun b!286016 () Bool)

(declare-fun res!148220 () Bool)

(declare-fun e!181248 () Bool)

(assert (=> b!286016 (=> (not res!148220) (not e!181248))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14300 0))(
  ( (array!14301 (arr!6785 (Array (_ BitVec 32) (_ BitVec 64))) (size!7138 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14300)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286016 (= res!148220 (and (= (size!7138 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7138 a!3312))))))

(declare-fun b!286018 () Bool)

(declare-fun res!148222 () Bool)

(assert (=> b!286018 (=> (not res!148222) (not e!181248))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286018 (= res!148222 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286017 () Bool)

(declare-fun res!148221 () Bool)

(assert (=> b!286017 (=> (not res!148221) (not e!181248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286017 (= res!148221 (validKeyInArray!0 k!2524))))

(declare-fun res!148219 () Bool)

(assert (=> start!27786 (=> (not res!148219) (not e!181248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27786 (= res!148219 (validMask!0 mask!3809))))

(assert (=> start!27786 e!181248))

(assert (=> start!27786 true))

(declare-fun array_inv!4757 (array!14300) Bool)

(assert (=> start!27786 (array_inv!4757 a!3312)))

(declare-fun b!286019 () Bool)

(assert (=> b!286019 (= e!181248 false)))

(declare-datatypes ((SeekEntryResult!1933 0))(
  ( (MissingZero!1933 (index!9902 (_ BitVec 32))) (Found!1933 (index!9903 (_ BitVec 32))) (Intermediate!1933 (undefined!2745 Bool) (index!9904 (_ BitVec 32)) (x!28140 (_ BitVec 32))) (Undefined!1933) (MissingVacant!1933 (index!9905 (_ BitVec 32))) )
))
(declare-fun lt!140841 () SeekEntryResult!1933)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14300 (_ BitVec 32)) SeekEntryResult!1933)

(assert (=> b!286019 (= lt!140841 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!27786 res!148219) b!286016))

(assert (= (and b!286016 res!148220) b!286017))

(assert (= (and b!286017 res!148221) b!286018))

(assert (= (and b!286018 res!148222) b!286019))

(declare-fun m!300313 () Bool)

(assert (=> b!286018 m!300313))

(declare-fun m!300315 () Bool)

(assert (=> b!286017 m!300315))

(declare-fun m!300317 () Bool)

(assert (=> start!27786 m!300317))

(declare-fun m!300319 () Bool)

(assert (=> start!27786 m!300319))

(declare-fun m!300321 () Bool)

(assert (=> b!286019 m!300321))

(push 1)

(assert (not b!286018))

(assert (not start!27786))

(assert (not b!286017))

(assert (not b!286019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

