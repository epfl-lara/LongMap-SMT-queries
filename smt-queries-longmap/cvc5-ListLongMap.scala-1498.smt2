; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28422 () Bool)

(assert start!28422)

(declare-fun res!152366 () Bool)

(declare-fun e!184153 () Bool)

(assert (=> start!28422 (=> (not res!152366) (not e!184153))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28422 (= res!152366 (validMask!0 mask!3809))))

(assert (=> start!28422 e!184153))

(assert (=> start!28422 true))

(declare-datatypes ((array!14691 0))(
  ( (array!14692 (arr!6971 (Array (_ BitVec 32) (_ BitVec 64))) (size!7323 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14691)

(declare-fun array_inv!4934 (array!14691) Bool)

(assert (=> start!28422 (array_inv!4934 a!3312)))

(declare-fun b!291025 () Bool)

(declare-fun e!184155 () Bool)

(assert (=> b!291025 (= e!184155 (not true))))

(declare-datatypes ((SeekEntryResult!2120 0))(
  ( (MissingZero!2120 (index!10650 (_ BitVec 32))) (Found!2120 (index!10651 (_ BitVec 32))) (Intermediate!2120 (undefined!2932 Bool) (index!10652 (_ BitVec 32)) (x!28843 (_ BitVec 32))) (Undefined!2120) (MissingVacant!2120 (index!10653 (_ BitVec 32))) )
))
(declare-fun lt!143886 () SeekEntryResult!2120)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291025 (= (index!10652 lt!143886) i!1256)))

(declare-fun b!291026 () Bool)

(declare-fun res!152368 () Bool)

(assert (=> b!291026 (=> (not res!152368) (not e!184153))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291026 (= res!152368 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291027 () Bool)

(declare-fun res!152369 () Bool)

(declare-fun e!184157 () Bool)

(assert (=> b!291027 (=> (not res!152369) (not e!184157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14691 (_ BitVec 32)) Bool)

(assert (=> b!291027 (= res!152369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291028 () Bool)

(declare-fun res!152365 () Bool)

(assert (=> b!291028 (=> (not res!152365) (not e!184153))))

(assert (=> b!291028 (= res!152365 (and (= (size!7323 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7323 a!3312))))))

(declare-fun b!291029 () Bool)

(declare-fun e!184156 () Bool)

(assert (=> b!291029 (= e!184157 e!184156)))

(declare-fun res!152367 () Bool)

(assert (=> b!291029 (=> (not res!152367) (not e!184156))))

(declare-fun lt!143884 () Bool)

(declare-fun lt!143882 () SeekEntryResult!2120)

(assert (=> b!291029 (= res!152367 (and (not lt!143884) (= lt!143882 (MissingVacant!2120 i!1256))))))

(declare-fun lt!143883 () SeekEntryResult!2120)

(declare-fun lt!143885 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14691 (_ BitVec 32)) SeekEntryResult!2120)

(assert (=> b!291029 (= lt!143883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143885 k!2524 (array!14692 (store (arr!6971 a!3312) i!1256 k!2524) (size!7323 a!3312)) mask!3809))))

(assert (=> b!291029 (= lt!143886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143885 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291029 (= lt!143885 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291030 () Bool)

(declare-fun res!152364 () Bool)

(assert (=> b!291030 (=> (not res!152364) (not e!184153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291030 (= res!152364 (validKeyInArray!0 k!2524))))

(declare-fun b!291031 () Bool)

(assert (=> b!291031 (= e!184153 e!184157)))

(declare-fun res!152370 () Bool)

(assert (=> b!291031 (=> (not res!152370) (not e!184157))))

(assert (=> b!291031 (= res!152370 (or lt!143884 (= lt!143882 (MissingVacant!2120 i!1256))))))

(assert (=> b!291031 (= lt!143884 (= lt!143882 (MissingZero!2120 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14691 (_ BitVec 32)) SeekEntryResult!2120)

(assert (=> b!291031 (= lt!143882 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291032 () Bool)

(assert (=> b!291032 (= e!184156 e!184155)))

(declare-fun res!152363 () Bool)

(assert (=> b!291032 (=> (not res!152363) (not e!184155))))

(declare-fun lt!143887 () Bool)

(assert (=> b!291032 (= res!152363 (and (or lt!143887 (not (undefined!2932 lt!143886))) (not lt!143887) (= (select (arr!6971 a!3312) (index!10652 lt!143886)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291032 (= lt!143887 (not (is-Intermediate!2120 lt!143886)))))

(assert (= (and start!28422 res!152366) b!291028))

(assert (= (and b!291028 res!152365) b!291030))

(assert (= (and b!291030 res!152364) b!291026))

(assert (= (and b!291026 res!152368) b!291031))

(assert (= (and b!291031 res!152370) b!291027))

(assert (= (and b!291027 res!152369) b!291029))

(assert (= (and b!291029 res!152367) b!291032))

(assert (= (and b!291032 res!152363) b!291025))

(declare-fun m!304995 () Bool)

(assert (=> start!28422 m!304995))

(declare-fun m!304997 () Bool)

(assert (=> start!28422 m!304997))

(declare-fun m!304999 () Bool)

(assert (=> b!291029 m!304999))

(declare-fun m!305001 () Bool)

(assert (=> b!291029 m!305001))

(declare-fun m!305003 () Bool)

(assert (=> b!291029 m!305003))

(declare-fun m!305005 () Bool)

(assert (=> b!291029 m!305005))

(declare-fun m!305007 () Bool)

(assert (=> b!291026 m!305007))

(declare-fun m!305009 () Bool)

(assert (=> b!291030 m!305009))

(declare-fun m!305011 () Bool)

(assert (=> b!291027 m!305011))

(declare-fun m!305013 () Bool)

(assert (=> b!291032 m!305013))

(declare-fun m!305015 () Bool)

(assert (=> b!291031 m!305015))

(push 1)

