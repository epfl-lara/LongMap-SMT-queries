; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27774 () Bool)

(assert start!27774)

(declare-fun b!285947 () Bool)

(declare-fun e!181212 () Bool)

(assert (=> b!285947 (= e!181212 false)))

(declare-datatypes ((SeekEntryResult!1927 0))(
  ( (MissingZero!1927 (index!9878 (_ BitVec 32))) (Found!1927 (index!9879 (_ BitVec 32))) (Intermediate!1927 (undefined!2739 Bool) (index!9880 (_ BitVec 32)) (x!28118 (_ BitVec 32))) (Undefined!1927) (MissingVacant!1927 (index!9881 (_ BitVec 32))) )
))
(declare-fun lt!140823 () SeekEntryResult!1927)

(declare-datatypes ((array!14288 0))(
  ( (array!14289 (arr!6779 (Array (_ BitVec 32) (_ BitVec 64))) (size!7132 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14288)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14288 (_ BitVec 32)) SeekEntryResult!1927)

(assert (=> b!285947 (= lt!140823 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!285944 () Bool)

(declare-fun res!148148 () Bool)

(assert (=> b!285944 (=> (not res!148148) (not e!181212))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285944 (= res!148148 (and (= (size!7132 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7132 a!3312))))))

(declare-fun b!285945 () Bool)

(declare-fun res!148147 () Bool)

(assert (=> b!285945 (=> (not res!148147) (not e!181212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285945 (= res!148147 (validKeyInArray!0 k!2524))))

(declare-fun b!285946 () Bool)

(declare-fun res!148149 () Bool)

(assert (=> b!285946 (=> (not res!148149) (not e!181212))))

(declare-fun arrayContainsKey!0 (array!14288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285946 (= res!148149 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148150 () Bool)

(assert (=> start!27774 (=> (not res!148150) (not e!181212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27774 (= res!148150 (validMask!0 mask!3809))))

(assert (=> start!27774 e!181212))

(assert (=> start!27774 true))

(declare-fun array_inv!4751 (array!14288) Bool)

(assert (=> start!27774 (array_inv!4751 a!3312)))

(assert (= (and start!27774 res!148150) b!285944))

(assert (= (and b!285944 res!148148) b!285945))

(assert (= (and b!285945 res!148147) b!285946))

(assert (= (and b!285946 res!148149) b!285947))

(declare-fun m!300253 () Bool)

(assert (=> b!285947 m!300253))

(declare-fun m!300255 () Bool)

(assert (=> b!285945 m!300255))

(declare-fun m!300257 () Bool)

(assert (=> b!285946 m!300257))

(declare-fun m!300259 () Bool)

(assert (=> start!27774 m!300259))

(declare-fun m!300261 () Bool)

(assert (=> start!27774 m!300261))

(push 1)

(assert (not b!285945))

(assert (not b!285946))

(assert (not start!27774))

(assert (not b!285947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

