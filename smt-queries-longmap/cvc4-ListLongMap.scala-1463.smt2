; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28168 () Bool)

(assert start!28168)

(declare-fun res!150003 () Bool)

(declare-fun e!182587 () Bool)

(assert (=> start!28168 (=> (not res!150003) (not e!182587))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28168 (= res!150003 (validMask!0 mask!3809))))

(assert (=> start!28168 e!182587))

(assert (=> start!28168 true))

(declare-datatypes ((array!14482 0))(
  ( (array!14483 (arr!6868 (Array (_ BitVec 32) (_ BitVec 64))) (size!7220 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14482)

(declare-fun array_inv!4831 (array!14482) Bool)

(assert (=> start!28168 (array_inv!4831 a!3312)))

(declare-fun b!288373 () Bool)

(declare-fun e!182586 () Bool)

(declare-fun e!182585 () Bool)

(assert (=> b!288373 (= e!182586 e!182585)))

(declare-fun res!149998 () Bool)

(assert (=> b!288373 (=> (not res!149998) (not e!182585))))

(declare-fun lt!142032 () Bool)

(assert (=> b!288373 (= res!149998 lt!142032)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142035 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2017 0))(
  ( (MissingZero!2017 (index!10238 (_ BitVec 32))) (Found!2017 (index!10239 (_ BitVec 32))) (Intermediate!2017 (undefined!2829 Bool) (index!10240 (_ BitVec 32)) (x!28454 (_ BitVec 32))) (Undefined!2017) (MissingVacant!2017 (index!10241 (_ BitVec 32))) )
))
(declare-fun lt!142036 () SeekEntryResult!2017)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14482 (_ BitVec 32)) SeekEntryResult!2017)

(assert (=> b!288373 (= lt!142036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142035 k!2524 (array!14483 (store (arr!6868 a!3312) i!1256 k!2524) (size!7220 a!3312)) mask!3809))))

(declare-fun lt!142034 () SeekEntryResult!2017)

(assert (=> b!288373 (= lt!142034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142035 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288373 (= lt!142035 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288374 () Bool)

(assert (=> b!288374 (= e!182587 e!182586)))

(declare-fun res!149997 () Bool)

(assert (=> b!288374 (=> (not res!149997) (not e!182586))))

(declare-fun lt!142033 () SeekEntryResult!2017)

(assert (=> b!288374 (= res!149997 (or lt!142032 (= lt!142033 (MissingVacant!2017 i!1256))))))

(assert (=> b!288374 (= lt!142032 (= lt!142033 (MissingZero!2017 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14482 (_ BitVec 32)) SeekEntryResult!2017)

(assert (=> b!288374 (= lt!142033 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288375 () Bool)

(declare-fun res!150001 () Bool)

(assert (=> b!288375 (=> (not res!150001) (not e!182587))))

(declare-fun arrayContainsKey!0 (array!14482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288375 (= res!150001 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288376 () Bool)

(declare-fun e!182584 () Bool)

(assert (=> b!288376 (= e!182584 (not true))))

(assert (=> b!288376 (and (= (select (arr!6868 a!3312) (index!10240 lt!142034)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10240 lt!142034) i!1256))))

(declare-fun b!288377 () Bool)

(declare-fun res!149999 () Bool)

(assert (=> b!288377 (=> (not res!149999) (not e!182586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14482 (_ BitVec 32)) Bool)

(assert (=> b!288377 (= res!149999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288378 () Bool)

(declare-fun res!150000 () Bool)

(assert (=> b!288378 (=> (not res!150000) (not e!182587))))

(assert (=> b!288378 (= res!150000 (and (= (size!7220 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7220 a!3312))))))

(declare-fun b!288379 () Bool)

(assert (=> b!288379 (= e!182585 e!182584)))

(declare-fun res!149996 () Bool)

(assert (=> b!288379 (=> (not res!149996) (not e!182584))))

(declare-fun lt!142031 () Bool)

(assert (=> b!288379 (= res!149996 (and (or lt!142031 (not (undefined!2829 lt!142034))) (or lt!142031 (not (= (select (arr!6868 a!3312) (index!10240 lt!142034)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142031 (not (= (select (arr!6868 a!3312) (index!10240 lt!142034)) k!2524))) (not lt!142031)))))

(assert (=> b!288379 (= lt!142031 (not (is-Intermediate!2017 lt!142034)))))

(declare-fun b!288380 () Bool)

(declare-fun res!150002 () Bool)

(assert (=> b!288380 (=> (not res!150002) (not e!182587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288380 (= res!150002 (validKeyInArray!0 k!2524))))

(assert (= (and start!28168 res!150003) b!288378))

(assert (= (and b!288378 res!150000) b!288380))

(assert (= (and b!288380 res!150002) b!288375))

(assert (= (and b!288375 res!150001) b!288374))

(assert (= (and b!288374 res!149997) b!288377))

(assert (= (and b!288377 res!149999) b!288373))

(assert (= (and b!288373 res!149998) b!288379))

(assert (= (and b!288379 res!149996) b!288376))

(declare-fun m!302609 () Bool)

(assert (=> b!288375 m!302609))

(declare-fun m!302611 () Bool)

(assert (=> b!288380 m!302611))

(declare-fun m!302613 () Bool)

(assert (=> b!288376 m!302613))

(declare-fun m!302615 () Bool)

(assert (=> b!288373 m!302615))

(declare-fun m!302617 () Bool)

(assert (=> b!288373 m!302617))

(declare-fun m!302619 () Bool)

(assert (=> b!288373 m!302619))

(declare-fun m!302621 () Bool)

(assert (=> b!288373 m!302621))

(declare-fun m!302623 () Bool)

(assert (=> start!28168 m!302623))

(declare-fun m!302625 () Bool)

(assert (=> start!28168 m!302625))

(declare-fun m!302627 () Bool)

(assert (=> b!288374 m!302627))

(assert (=> b!288379 m!302613))

(declare-fun m!302629 () Bool)

(assert (=> b!288377 m!302629))

(push 1)

