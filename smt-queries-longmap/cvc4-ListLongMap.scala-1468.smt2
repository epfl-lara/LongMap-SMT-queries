; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28198 () Bool)

(assert start!28198)

(declare-fun b!288733 () Bool)

(declare-fun e!182812 () Bool)

(declare-fun e!182813 () Bool)

(assert (=> b!288733 (= e!182812 e!182813)))

(declare-fun res!150362 () Bool)

(assert (=> b!288733 (=> (not res!150362) (not e!182813))))

(declare-fun lt!142303 () Bool)

(assert (=> b!288733 (= res!150362 lt!142303)))

(declare-datatypes ((SeekEntryResult!2032 0))(
  ( (MissingZero!2032 (index!10298 (_ BitVec 32))) (Found!2032 (index!10299 (_ BitVec 32))) (Intermediate!2032 (undefined!2844 Bool) (index!10300 (_ BitVec 32)) (x!28509 (_ BitVec 32))) (Undefined!2032) (MissingVacant!2032 (index!10301 (_ BitVec 32))) )
))
(declare-fun lt!142302 () SeekEntryResult!2032)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14512 0))(
  ( (array!14513 (arr!6883 (Array (_ BitVec 32) (_ BitVec 64))) (size!7235 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14512)

(declare-fun lt!142305 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14512 (_ BitVec 32)) SeekEntryResult!2032)

(assert (=> b!288733 (= lt!142302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142305 k!2524 (array!14513 (store (arr!6883 a!3312) i!1256 k!2524) (size!7235 a!3312)) mask!3809))))

(declare-fun lt!142301 () SeekEntryResult!2032)

(assert (=> b!288733 (= lt!142301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142305 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288733 (= lt!142305 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288734 () Bool)

(declare-fun e!182809 () Bool)

(assert (=> b!288734 (= e!182809 e!182812)))

(declare-fun res!150356 () Bool)

(assert (=> b!288734 (=> (not res!150356) (not e!182812))))

(declare-fun lt!142304 () SeekEntryResult!2032)

(assert (=> b!288734 (= res!150356 (or lt!142303 (= lt!142304 (MissingVacant!2032 i!1256))))))

(assert (=> b!288734 (= lt!142303 (= lt!142304 (MissingZero!2032 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14512 (_ BitVec 32)) SeekEntryResult!2032)

(assert (=> b!288734 (= lt!142304 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288735 () Bool)

(declare-fun res!150363 () Bool)

(assert (=> b!288735 (=> (not res!150363) (not e!182809))))

(assert (=> b!288735 (= res!150363 (and (= (size!7235 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7235 a!3312))))))

(declare-fun b!288736 () Bool)

(declare-fun res!150358 () Bool)

(assert (=> b!288736 (=> (not res!150358) (not e!182809))))

(declare-fun arrayContainsKey!0 (array!14512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288736 (= res!150358 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288737 () Bool)

(declare-fun e!182811 () Bool)

(assert (=> b!288737 (= e!182811 (not true))))

(assert (=> b!288737 (and (= (select (arr!6883 a!3312) (index!10300 lt!142301)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10300 lt!142301) i!1256))))

(declare-fun res!150361 () Bool)

(assert (=> start!28198 (=> (not res!150361) (not e!182809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28198 (= res!150361 (validMask!0 mask!3809))))

(assert (=> start!28198 e!182809))

(assert (=> start!28198 true))

(declare-fun array_inv!4846 (array!14512) Bool)

(assert (=> start!28198 (array_inv!4846 a!3312)))

(declare-fun b!288738 () Bool)

(assert (=> b!288738 (= e!182813 e!182811)))

(declare-fun res!150357 () Bool)

(assert (=> b!288738 (=> (not res!150357) (not e!182811))))

(declare-fun lt!142306 () Bool)

(assert (=> b!288738 (= res!150357 (and (or lt!142306 (not (undefined!2844 lt!142301))) (or lt!142306 (not (= (select (arr!6883 a!3312) (index!10300 lt!142301)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142306 (not (= (select (arr!6883 a!3312) (index!10300 lt!142301)) k!2524))) (not lt!142306)))))

(assert (=> b!288738 (= lt!142306 (not (is-Intermediate!2032 lt!142301)))))

(declare-fun b!288739 () Bool)

(declare-fun res!150359 () Bool)

(assert (=> b!288739 (=> (not res!150359) (not e!182809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288739 (= res!150359 (validKeyInArray!0 k!2524))))

(declare-fun b!288740 () Bool)

(declare-fun res!150360 () Bool)

(assert (=> b!288740 (=> (not res!150360) (not e!182812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14512 (_ BitVec 32)) Bool)

(assert (=> b!288740 (= res!150360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28198 res!150361) b!288735))

(assert (= (and b!288735 res!150363) b!288739))

(assert (= (and b!288739 res!150359) b!288736))

(assert (= (and b!288736 res!150358) b!288734))

(assert (= (and b!288734 res!150356) b!288740))

(assert (= (and b!288740 res!150360) b!288733))

(assert (= (and b!288733 res!150362) b!288738))

(assert (= (and b!288738 res!150357) b!288737))

(declare-fun m!302939 () Bool)

(assert (=> b!288737 m!302939))

(declare-fun m!302941 () Bool)

(assert (=> b!288740 m!302941))

(declare-fun m!302943 () Bool)

(assert (=> b!288736 m!302943))

(declare-fun m!302945 () Bool)

(assert (=> b!288739 m!302945))

(declare-fun m!302947 () Bool)

(assert (=> b!288733 m!302947))

(declare-fun m!302949 () Bool)

(assert (=> b!288733 m!302949))

(declare-fun m!302951 () Bool)

(assert (=> b!288733 m!302951))

(declare-fun m!302953 () Bool)

(assert (=> b!288733 m!302953))

(assert (=> b!288738 m!302939))

(declare-fun m!302955 () Bool)

(assert (=> b!288734 m!302955))

(declare-fun m!302957 () Bool)

(assert (=> start!28198 m!302957))

(declare-fun m!302959 () Bool)

(assert (=> start!28198 m!302959))

(push 1)

