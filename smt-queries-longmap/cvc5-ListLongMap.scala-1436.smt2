; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27780 () Bool)

(assert start!27780)

(declare-fun b!286103 () Bool)

(declare-fun res!148255 () Bool)

(declare-fun e!181319 () Bool)

(assert (=> b!286103 (=> (not res!148255) (not e!181319))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14301 0))(
  ( (array!14302 (arr!6785 (Array (_ BitVec 32) (_ BitVec 64))) (size!7137 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14301)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286103 (= res!148255 (and (= (size!7137 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7137 a!3312))))))

(declare-fun res!148254 () Bool)

(assert (=> start!27780 (=> (not res!148254) (not e!181319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27780 (= res!148254 (validMask!0 mask!3809))))

(assert (=> start!27780 e!181319))

(assert (=> start!27780 true))

(declare-fun array_inv!4748 (array!14301) Bool)

(assert (=> start!27780 (array_inv!4748 a!3312)))

(declare-fun b!286105 () Bool)

(declare-fun res!148256 () Bool)

(assert (=> b!286105 (=> (not res!148256) (not e!181319))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286105 (= res!148256 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286106 () Bool)

(assert (=> b!286106 (= e!181319 false)))

(declare-datatypes ((SeekEntryResult!1934 0))(
  ( (MissingZero!1934 (index!9906 (_ BitVec 32))) (Found!1934 (index!9907 (_ BitVec 32))) (Intermediate!1934 (undefined!2746 Bool) (index!9908 (_ BitVec 32)) (x!28134 (_ BitVec 32))) (Undefined!1934) (MissingVacant!1934 (index!9909 (_ BitVec 32))) )
))
(declare-fun lt!141007 () SeekEntryResult!1934)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14301 (_ BitVec 32)) SeekEntryResult!1934)

(assert (=> b!286106 (= lt!141007 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286104 () Bool)

(declare-fun res!148257 () Bool)

(assert (=> b!286104 (=> (not res!148257) (not e!181319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286104 (= res!148257 (validKeyInArray!0 k!2524))))

(assert (= (and start!27780 res!148254) b!286103))

(assert (= (and b!286103 res!148255) b!286104))

(assert (= (and b!286104 res!148257) b!286105))

(assert (= (and b!286105 res!148256) b!286106))

(declare-fun m!300855 () Bool)

(assert (=> start!27780 m!300855))

(declare-fun m!300857 () Bool)

(assert (=> start!27780 m!300857))

(declare-fun m!300859 () Bool)

(assert (=> b!286105 m!300859))

(declare-fun m!300861 () Bool)

(assert (=> b!286106 m!300861))

(declare-fun m!300863 () Bool)

(assert (=> b!286104 m!300863))

(push 1)

(assert (not b!286104))

(assert (not b!286105))

(assert (not start!27780))

(assert (not b!286106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

