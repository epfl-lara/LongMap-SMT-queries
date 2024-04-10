; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27774 () Bool)

(assert start!27774)

(declare-fun b!286068 () Bool)

(declare-fun res!148219 () Bool)

(declare-fun e!181300 () Bool)

(assert (=> b!286068 (=> (not res!148219) (not e!181300))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286068 (= res!148219 (validKeyInArray!0 k!2524))))

(declare-fun b!286070 () Bool)

(assert (=> b!286070 (= e!181300 false)))

(declare-datatypes ((array!14295 0))(
  ( (array!14296 (arr!6782 (Array (_ BitVec 32) (_ BitVec 64))) (size!7134 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14295)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1931 0))(
  ( (MissingZero!1931 (index!9894 (_ BitVec 32))) (Found!1931 (index!9895 (_ BitVec 32))) (Intermediate!1931 (undefined!2743 Bool) (index!9896 (_ BitVec 32)) (x!28123 (_ BitVec 32))) (Undefined!1931) (MissingVacant!1931 (index!9897 (_ BitVec 32))) )
))
(declare-fun lt!140998 () SeekEntryResult!1931)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14295 (_ BitVec 32)) SeekEntryResult!1931)

(assert (=> b!286070 (= lt!140998 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286067 () Bool)

(declare-fun res!148218 () Bool)

(assert (=> b!286067 (=> (not res!148218) (not e!181300))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286067 (= res!148218 (and (= (size!7134 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7134 a!3312))))))

(declare-fun b!286069 () Bool)

(declare-fun res!148220 () Bool)

(assert (=> b!286069 (=> (not res!148220) (not e!181300))))

(declare-fun arrayContainsKey!0 (array!14295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286069 (= res!148220 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148221 () Bool)

(assert (=> start!27774 (=> (not res!148221) (not e!181300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27774 (= res!148221 (validMask!0 mask!3809))))

(assert (=> start!27774 e!181300))

(assert (=> start!27774 true))

(declare-fun array_inv!4745 (array!14295) Bool)

(assert (=> start!27774 (array_inv!4745 a!3312)))

(assert (= (and start!27774 res!148221) b!286067))

(assert (= (and b!286067 res!148218) b!286068))

(assert (= (and b!286068 res!148219) b!286069))

(assert (= (and b!286069 res!148220) b!286070))

(declare-fun m!300825 () Bool)

(assert (=> b!286068 m!300825))

(declare-fun m!300827 () Bool)

(assert (=> b!286070 m!300827))

(declare-fun m!300829 () Bool)

(assert (=> b!286069 m!300829))

(declare-fun m!300831 () Bool)

(assert (=> start!27774 m!300831))

(declare-fun m!300833 () Bool)

(assert (=> start!27774 m!300833))

(push 1)

(assert (not b!286068))

(assert (not start!27774))

(assert (not b!286069))

(assert (not b!286070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

