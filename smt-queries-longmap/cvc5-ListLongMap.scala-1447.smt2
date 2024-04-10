; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27924 () Bool)

(assert start!27924)

(declare-fun b!286827 () Bool)

(declare-fun res!148838 () Bool)

(declare-fun e!181716 () Bool)

(assert (=> b!286827 (=> (not res!148838) (not e!181716))))

(declare-datatypes ((array!14373 0))(
  ( (array!14374 (arr!6818 (Array (_ BitVec 32) (_ BitVec 64))) (size!7170 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14373)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14373 (_ BitVec 32)) Bool)

(assert (=> b!286827 (= res!148838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148839 () Bool)

(declare-fun e!181718 () Bool)

(assert (=> start!27924 (=> (not res!148839) (not e!181718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27924 (= res!148839 (validMask!0 mask!3809))))

(assert (=> start!27924 e!181718))

(assert (=> start!27924 true))

(declare-fun array_inv!4781 (array!14373) Bool)

(assert (=> start!27924 (array_inv!4781 a!3312)))

(declare-fun b!286828 () Bool)

(assert (=> b!286828 (= e!181716 false)))

(declare-fun lt!141270 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286828 (= lt!141270 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286829 () Bool)

(declare-fun res!148842 () Bool)

(assert (=> b!286829 (=> (not res!148842) (not e!181718))))

(declare-fun arrayContainsKey!0 (array!14373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286829 (= res!148842 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286830 () Bool)

(assert (=> b!286830 (= e!181718 e!181716)))

(declare-fun res!148840 () Bool)

(assert (=> b!286830 (=> (not res!148840) (not e!181716))))

(declare-datatypes ((SeekEntryResult!1967 0))(
  ( (MissingZero!1967 (index!10038 (_ BitVec 32))) (Found!1967 (index!10039 (_ BitVec 32))) (Intermediate!1967 (undefined!2779 Bool) (index!10040 (_ BitVec 32)) (x!28258 (_ BitVec 32))) (Undefined!1967) (MissingVacant!1967 (index!10041 (_ BitVec 32))) )
))
(declare-fun lt!141271 () SeekEntryResult!1967)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286830 (= res!148840 (or (= lt!141271 (MissingZero!1967 i!1256)) (= lt!141271 (MissingVacant!1967 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14373 (_ BitVec 32)) SeekEntryResult!1967)

(assert (=> b!286830 (= lt!141271 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286831 () Bool)

(declare-fun res!148841 () Bool)

(assert (=> b!286831 (=> (not res!148841) (not e!181718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286831 (= res!148841 (validKeyInArray!0 k!2524))))

(declare-fun b!286832 () Bool)

(declare-fun res!148837 () Bool)

(assert (=> b!286832 (=> (not res!148837) (not e!181718))))

(assert (=> b!286832 (= res!148837 (and (= (size!7170 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7170 a!3312))))))

(assert (= (and start!27924 res!148839) b!286832))

(assert (= (and b!286832 res!148837) b!286831))

(assert (= (and b!286831 res!148841) b!286829))

(assert (= (and b!286829 res!148842) b!286830))

(assert (= (and b!286830 res!148840) b!286827))

(assert (= (and b!286827 res!148838) b!286828))

(declare-fun m!301407 () Bool)

(assert (=> b!286828 m!301407))

(declare-fun m!301409 () Bool)

(assert (=> start!27924 m!301409))

(declare-fun m!301411 () Bool)

(assert (=> start!27924 m!301411))

(declare-fun m!301413 () Bool)

(assert (=> b!286831 m!301413))

(declare-fun m!301415 () Bool)

(assert (=> b!286830 m!301415))

(declare-fun m!301417 () Bool)

(assert (=> b!286827 m!301417))

(declare-fun m!301419 () Bool)

(assert (=> b!286829 m!301419))

(push 1)

