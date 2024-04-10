; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28200 () Bool)

(assert start!28200)

(declare-fun res!150380 () Bool)

(declare-fun e!182827 () Bool)

(assert (=> start!28200 (=> (not res!150380) (not e!182827))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28200 (= res!150380 (validMask!0 mask!3809))))

(assert (=> start!28200 e!182827))

(assert (=> start!28200 true))

(declare-datatypes ((array!14514 0))(
  ( (array!14515 (arr!6884 (Array (_ BitVec 32) (_ BitVec 64))) (size!7236 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14514)

(declare-fun array_inv!4847 (array!14514) Bool)

(assert (=> start!28200 (array_inv!4847 a!3312)))

(declare-fun b!288757 () Bool)

(declare-fun res!150381 () Bool)

(assert (=> b!288757 (=> (not res!150381) (not e!182827))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288757 (= res!150381 (and (= (size!7236 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7236 a!3312))))))

(declare-fun b!288758 () Bool)

(declare-fun e!182825 () Bool)

(assert (=> b!288758 (= e!182827 e!182825)))

(declare-fun res!150386 () Bool)

(assert (=> b!288758 (=> (not res!150386) (not e!182825))))

(declare-fun lt!142319 () Bool)

(declare-datatypes ((SeekEntryResult!2033 0))(
  ( (MissingZero!2033 (index!10302 (_ BitVec 32))) (Found!2033 (index!10303 (_ BitVec 32))) (Intermediate!2033 (undefined!2845 Bool) (index!10304 (_ BitVec 32)) (x!28518 (_ BitVec 32))) (Undefined!2033) (MissingVacant!2033 (index!10305 (_ BitVec 32))) )
))
(declare-fun lt!142324 () SeekEntryResult!2033)

(assert (=> b!288758 (= res!150386 (or lt!142319 (= lt!142324 (MissingVacant!2033 i!1256))))))

(assert (=> b!288758 (= lt!142319 (= lt!142324 (MissingZero!2033 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14514 (_ BitVec 32)) SeekEntryResult!2033)

(assert (=> b!288758 (= lt!142324 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288759 () Bool)

(declare-fun e!182824 () Bool)

(declare-fun e!182826 () Bool)

(assert (=> b!288759 (= e!182824 e!182826)))

(declare-fun res!150384 () Bool)

(assert (=> b!288759 (=> (not res!150384) (not e!182826))))

(declare-fun lt!142320 () Bool)

(declare-fun lt!142323 () SeekEntryResult!2033)

(assert (=> b!288759 (= res!150384 (and (or lt!142320 (not (undefined!2845 lt!142323))) (or lt!142320 (not (= (select (arr!6884 a!3312) (index!10304 lt!142323)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142320 (not (= (select (arr!6884 a!3312) (index!10304 lt!142323)) k!2524))) (not lt!142320)))))

(assert (=> b!288759 (= lt!142320 (not (is-Intermediate!2033 lt!142323)))))

(declare-fun b!288760 () Bool)

(assert (=> b!288760 (= e!182825 e!182824)))

(declare-fun res!150387 () Bool)

(assert (=> b!288760 (=> (not res!150387) (not e!182824))))

(assert (=> b!288760 (= res!150387 lt!142319)))

(declare-fun lt!142322 () (_ BitVec 32))

(declare-fun lt!142321 () SeekEntryResult!2033)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14514 (_ BitVec 32)) SeekEntryResult!2033)

(assert (=> b!288760 (= lt!142321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142322 k!2524 (array!14515 (store (arr!6884 a!3312) i!1256 k!2524) (size!7236 a!3312)) mask!3809))))

(assert (=> b!288760 (= lt!142323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142322 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288760 (= lt!142322 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288761 () Bool)

(assert (=> b!288761 (= e!182826 (not true))))

(assert (=> b!288761 (and (= (select (arr!6884 a!3312) (index!10304 lt!142323)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10304 lt!142323) i!1256))))

(declare-fun b!288762 () Bool)

(declare-fun res!150385 () Bool)

(assert (=> b!288762 (=> (not res!150385) (not e!182825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14514 (_ BitVec 32)) Bool)

(assert (=> b!288762 (= res!150385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288763 () Bool)

(declare-fun res!150383 () Bool)

(assert (=> b!288763 (=> (not res!150383) (not e!182827))))

(declare-fun arrayContainsKey!0 (array!14514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288763 (= res!150383 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288764 () Bool)

(declare-fun res!150382 () Bool)

(assert (=> b!288764 (=> (not res!150382) (not e!182827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288764 (= res!150382 (validKeyInArray!0 k!2524))))

(assert (= (and start!28200 res!150380) b!288757))

(assert (= (and b!288757 res!150381) b!288764))

(assert (= (and b!288764 res!150382) b!288763))

(assert (= (and b!288763 res!150383) b!288758))

(assert (= (and b!288758 res!150386) b!288762))

(assert (= (and b!288762 res!150385) b!288760))

(assert (= (and b!288760 res!150387) b!288759))

(assert (= (and b!288759 res!150384) b!288761))

(declare-fun m!302961 () Bool)

(assert (=> b!288762 m!302961))

(declare-fun m!302963 () Bool)

(assert (=> b!288763 m!302963))

(declare-fun m!302965 () Bool)

(assert (=> b!288760 m!302965))

(declare-fun m!302967 () Bool)

(assert (=> b!288760 m!302967))

(declare-fun m!302969 () Bool)

(assert (=> b!288760 m!302969))

(declare-fun m!302971 () Bool)

(assert (=> b!288760 m!302971))

(declare-fun m!302973 () Bool)

(assert (=> b!288759 m!302973))

(assert (=> b!288761 m!302973))

(declare-fun m!302975 () Bool)

(assert (=> b!288764 m!302975))

(declare-fun m!302977 () Bool)

(assert (=> b!288758 m!302977))

(declare-fun m!302979 () Bool)

(assert (=> start!28200 m!302979))

(declare-fun m!302981 () Bool)

(assert (=> start!28200 m!302981))

(push 1)

