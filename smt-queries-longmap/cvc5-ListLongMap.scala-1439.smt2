; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27798 () Bool)

(assert start!27798)

(declare-fun res!148293 () Bool)

(declare-fun e!181284 () Bool)

(assert (=> start!27798 (=> (not res!148293) (not e!181284))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27798 (= res!148293 (validMask!0 mask!3809))))

(assert (=> start!27798 e!181284))

(assert (=> start!27798 true))

(declare-datatypes ((array!14312 0))(
  ( (array!14313 (arr!6791 (Array (_ BitVec 32) (_ BitVec 64))) (size!7144 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14312)

(declare-fun array_inv!4763 (array!14312) Bool)

(assert (=> start!27798 (array_inv!4763 a!3312)))

(declare-fun b!286088 () Bool)

(declare-fun res!148291 () Bool)

(assert (=> b!286088 (=> (not res!148291) (not e!181284))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286088 (= res!148291 (and (= (size!7144 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7144 a!3312))))))

(declare-fun b!286091 () Bool)

(assert (=> b!286091 (= e!181284 false)))

(declare-datatypes ((SeekEntryResult!1939 0))(
  ( (MissingZero!1939 (index!9926 (_ BitVec 32))) (Found!1939 (index!9927 (_ BitVec 32))) (Intermediate!1939 (undefined!2751 Bool) (index!9928 (_ BitVec 32)) (x!28162 (_ BitVec 32))) (Undefined!1939) (MissingVacant!1939 (index!9929 (_ BitVec 32))) )
))
(declare-fun lt!140859 () SeekEntryResult!1939)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14312 (_ BitVec 32)) SeekEntryResult!1939)

(assert (=> b!286091 (= lt!140859 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286090 () Bool)

(declare-fun res!148292 () Bool)

(assert (=> b!286090 (=> (not res!148292) (not e!181284))))

(declare-fun arrayContainsKey!0 (array!14312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286090 (= res!148292 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286089 () Bool)

(declare-fun res!148294 () Bool)

(assert (=> b!286089 (=> (not res!148294) (not e!181284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286089 (= res!148294 (validKeyInArray!0 k!2524))))

(assert (= (and start!27798 res!148293) b!286088))

(assert (= (and b!286088 res!148291) b!286089))

(assert (= (and b!286089 res!148294) b!286090))

(assert (= (and b!286090 res!148292) b!286091))

(declare-fun m!300373 () Bool)

(assert (=> start!27798 m!300373))

(declare-fun m!300375 () Bool)

(assert (=> start!27798 m!300375))

(declare-fun m!300377 () Bool)

(assert (=> b!286091 m!300377))

(declare-fun m!300379 () Bool)

(assert (=> b!286090 m!300379))

(declare-fun m!300381 () Bool)

(assert (=> b!286089 m!300381))

(push 1)

(assert (not b!286089))

(assert (not b!286090))

(assert (not start!27798))

(assert (not b!286091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

