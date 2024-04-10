; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27936 () Bool)

(assert start!27936)

(declare-fun b!286935 () Bool)

(declare-fun e!181772 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286935 (= e!181772 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!1973 0))(
  ( (MissingZero!1973 (index!10062 (_ BitVec 32))) (Found!1973 (index!10063 (_ BitVec 32))) (Intermediate!1973 (undefined!2785 Bool) (index!10064 (_ BitVec 32)) (x!28280 (_ BitVec 32))) (Undefined!1973) (MissingVacant!1973 (index!10065 (_ BitVec 32))) )
))
(declare-fun lt!141307 () SeekEntryResult!1973)

(declare-datatypes ((array!14385 0))(
  ( (array!14386 (arr!6824 (Array (_ BitVec 32) (_ BitVec 64))) (size!7176 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14385)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14385 (_ BitVec 32)) SeekEntryResult!1973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286935 (= lt!141307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!286936 () Bool)

(declare-fun res!148945 () Bool)

(declare-fun e!181770 () Bool)

(assert (=> b!286936 (=> (not res!148945) (not e!181770))))

(declare-fun arrayContainsKey!0 (array!14385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286936 (= res!148945 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286937 () Bool)

(declare-fun res!148947 () Bool)

(assert (=> b!286937 (=> (not res!148947) (not e!181770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286937 (= res!148947 (validKeyInArray!0 k!2524))))

(declare-fun b!286938 () Bool)

(assert (=> b!286938 (= e!181770 e!181772)))

(declare-fun res!148948 () Bool)

(assert (=> b!286938 (=> (not res!148948) (not e!181772))))

(declare-fun lt!141306 () SeekEntryResult!1973)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286938 (= res!148948 (or (= lt!141306 (MissingZero!1973 i!1256)) (= lt!141306 (MissingVacant!1973 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14385 (_ BitVec 32)) SeekEntryResult!1973)

(assert (=> b!286938 (= lt!141306 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!148946 () Bool)

(assert (=> start!27936 (=> (not res!148946) (not e!181770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27936 (= res!148946 (validMask!0 mask!3809))))

(assert (=> start!27936 e!181770))

(assert (=> start!27936 true))

(declare-fun array_inv!4787 (array!14385) Bool)

(assert (=> start!27936 (array_inv!4787 a!3312)))

(declare-fun b!286939 () Bool)

(declare-fun res!148949 () Bool)

(assert (=> b!286939 (=> (not res!148949) (not e!181772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14385 (_ BitVec 32)) Bool)

(assert (=> b!286939 (= res!148949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286940 () Bool)

(declare-fun res!148950 () Bool)

(assert (=> b!286940 (=> (not res!148950) (not e!181770))))

(assert (=> b!286940 (= res!148950 (and (= (size!7176 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7176 a!3312))))))

(assert (= (and start!27936 res!148946) b!286940))

(assert (= (and b!286940 res!148950) b!286937))

(assert (= (and b!286937 res!148947) b!286936))

(assert (= (and b!286936 res!148945) b!286938))

(assert (= (and b!286938 res!148948) b!286939))

(assert (= (and b!286939 res!148949) b!286935))

(declare-fun m!301491 () Bool)

(assert (=> b!286935 m!301491))

(assert (=> b!286935 m!301491))

(declare-fun m!301493 () Bool)

(assert (=> b!286935 m!301493))

(declare-fun m!301495 () Bool)

(assert (=> b!286938 m!301495))

(declare-fun m!301497 () Bool)

(assert (=> b!286939 m!301497))

(declare-fun m!301499 () Bool)

(assert (=> start!27936 m!301499))

(declare-fun m!301501 () Bool)

(assert (=> start!27936 m!301501))

(declare-fun m!301503 () Bool)

(assert (=> b!286936 m!301503))

(declare-fun m!301505 () Bool)

(assert (=> b!286937 m!301505))

(push 1)

(assert (not start!27936))

