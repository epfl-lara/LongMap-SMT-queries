; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27792 () Bool)

(assert start!27792)

(declare-fun b!286055 () Bool)

(declare-fun e!181266 () Bool)

(assert (=> b!286055 (= e!181266 false)))

(declare-datatypes ((SeekEntryResult!1936 0))(
  ( (MissingZero!1936 (index!9914 (_ BitVec 32))) (Found!1936 (index!9915 (_ BitVec 32))) (Intermediate!1936 (undefined!2748 Bool) (index!9916 (_ BitVec 32)) (x!28151 (_ BitVec 32))) (Undefined!1936) (MissingVacant!1936 (index!9917 (_ BitVec 32))) )
))
(declare-fun lt!140850 () SeekEntryResult!1936)

(declare-datatypes ((array!14306 0))(
  ( (array!14307 (arr!6788 (Array (_ BitVec 32) (_ BitVec 64))) (size!7141 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14306)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14306 (_ BitVec 32)) SeekEntryResult!1936)

(assert (=> b!286055 (= lt!140850 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286053 () Bool)

(declare-fun res!148257 () Bool)

(assert (=> b!286053 (=> (not res!148257) (not e!181266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286053 (= res!148257 (validKeyInArray!0 k!2524))))

(declare-fun b!286054 () Bool)

(declare-fun res!148258 () Bool)

(assert (=> b!286054 (=> (not res!148258) (not e!181266))))

(declare-fun arrayContainsKey!0 (array!14306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286054 (= res!148258 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286052 () Bool)

(declare-fun res!148256 () Bool)

(assert (=> b!286052 (=> (not res!148256) (not e!181266))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286052 (= res!148256 (and (= (size!7141 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7141 a!3312))))))

(declare-fun res!148255 () Bool)

(assert (=> start!27792 (=> (not res!148255) (not e!181266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27792 (= res!148255 (validMask!0 mask!3809))))

(assert (=> start!27792 e!181266))

(assert (=> start!27792 true))

(declare-fun array_inv!4760 (array!14306) Bool)

(assert (=> start!27792 (array_inv!4760 a!3312)))

(assert (= (and start!27792 res!148255) b!286052))

(assert (= (and b!286052 res!148256) b!286053))

(assert (= (and b!286053 res!148257) b!286054))

(assert (= (and b!286054 res!148258) b!286055))

(declare-fun m!300343 () Bool)

(assert (=> b!286055 m!300343))

(declare-fun m!300345 () Bool)

(assert (=> b!286053 m!300345))

(declare-fun m!300347 () Bool)

(assert (=> b!286054 m!300347))

(declare-fun m!300349 () Bool)

(assert (=> start!27792 m!300349))

(declare-fun m!300351 () Bool)

(assert (=> start!27792 m!300351))

(push 1)

(assert (not b!286053))

(assert (not b!286054))

(assert (not start!27792))

(assert (not b!286055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

