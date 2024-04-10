; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27804 () Bool)

(assert start!27804)

(declare-fun res!148399 () Bool)

(declare-fun e!181390 () Bool)

(assert (=> start!27804 (=> (not res!148399) (not e!181390))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27804 (= res!148399 (validMask!0 mask!3809))))

(assert (=> start!27804 e!181390))

(assert (=> start!27804 true))

(declare-datatypes ((array!14325 0))(
  ( (array!14326 (arr!6797 (Array (_ BitVec 32) (_ BitVec 64))) (size!7149 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14325)

(declare-fun array_inv!4760 (array!14325) Bool)

(assert (=> start!27804 (array_inv!4760 a!3312)))

(declare-fun b!286247 () Bool)

(declare-fun res!148398 () Bool)

(assert (=> b!286247 (=> (not res!148398) (not e!181390))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286247 (= res!148398 (and (= (size!7149 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7149 a!3312))))))

(declare-fun b!286249 () Bool)

(declare-fun res!148401 () Bool)

(assert (=> b!286249 (=> (not res!148401) (not e!181390))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286249 (= res!148401 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!1946 0))(
  ( (MissingZero!1946 (index!9954 (_ BitVec 32))) (Found!1946 (index!9955 (_ BitVec 32))) (Intermediate!1946 (undefined!2758 Bool) (index!9956 (_ BitVec 32)) (x!28178 (_ BitVec 32))) (Undefined!1946) (MissingVacant!1946 (index!9957 (_ BitVec 32))) )
))
(declare-fun lt!141043 () SeekEntryResult!1946)

(declare-fun b!286250 () Bool)

(assert (=> b!286250 (= e!181390 (and (or (= lt!141043 (MissingZero!1946 i!1256)) (= lt!141043 (MissingVacant!1946 i!1256))) (bvsgt #b00000000000000000000000000000000 (size!7149 a!3312))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14325 (_ BitVec 32)) SeekEntryResult!1946)

(assert (=> b!286250 (= lt!141043 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286248 () Bool)

(declare-fun res!148400 () Bool)

(assert (=> b!286248 (=> (not res!148400) (not e!181390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286248 (= res!148400 (validKeyInArray!0 k!2524))))

(assert (= (and start!27804 res!148399) b!286247))

(assert (= (and b!286247 res!148398) b!286248))

(assert (= (and b!286248 res!148400) b!286249))

(assert (= (and b!286249 res!148401) b!286250))

(declare-fun m!300975 () Bool)

(assert (=> start!27804 m!300975))

(declare-fun m!300977 () Bool)

(assert (=> start!27804 m!300977))

(declare-fun m!300979 () Bool)

(assert (=> b!286249 m!300979))

(declare-fun m!300981 () Bool)

(assert (=> b!286250 m!300981))

(declare-fun m!300983 () Bool)

(assert (=> b!286248 m!300983))

(push 1)

(assert (not b!286250))

(assert (not start!27804))

(assert (not b!286249))

(assert (not b!286248))

(check-sat)

(pop 1)

