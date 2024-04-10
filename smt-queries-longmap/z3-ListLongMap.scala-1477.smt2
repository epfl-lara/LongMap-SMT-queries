; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28250 () Bool)

(assert start!28250)

(declare-fun b!289357 () Bool)

(declare-fun res!150985 () Bool)

(declare-fun e!183199 () Bool)

(assert (=> b!289357 (=> (not res!150985) (not e!183199))))

(declare-datatypes ((array!14564 0))(
  ( (array!14565 (arr!6909 (Array (_ BitVec 32) (_ BitVec 64))) (size!7261 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14564)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289357 (= res!150985 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289358 () Bool)

(declare-fun e!183200 () Bool)

(declare-fun e!183202 () Bool)

(assert (=> b!289358 (= e!183200 e!183202)))

(declare-fun res!150980 () Bool)

(assert (=> b!289358 (=> (not res!150980) (not e!183202))))

(declare-fun lt!142770 () Bool)

(declare-datatypes ((SeekEntryResult!2058 0))(
  ( (MissingZero!2058 (index!10402 (_ BitVec 32))) (Found!2058 (index!10403 (_ BitVec 32))) (Intermediate!2058 (undefined!2870 Bool) (index!10404 (_ BitVec 32)) (x!28607 (_ BitVec 32))) (Undefined!2058) (MissingVacant!2058 (index!10405 (_ BitVec 32))) )
))
(declare-fun lt!142774 () SeekEntryResult!2058)

(assert (=> b!289358 (= res!150980 (and (or lt!142770 (not (undefined!2870 lt!142774))) (or lt!142770 (not (= (select (arr!6909 a!3312) (index!10404 lt!142774)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142770 (not (= (select (arr!6909 a!3312) (index!10404 lt!142774)) k0!2524))) (not lt!142770)))))

(get-info :version)

(assert (=> b!289358 (= lt!142770 (not ((_ is Intermediate!2058) lt!142774)))))

(declare-fun b!289359 () Bool)

(declare-fun res!150981 () Bool)

(declare-fun e!183203 () Bool)

(assert (=> b!289359 (=> (not res!150981) (not e!183203))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14564 (_ BitVec 32)) Bool)

(assert (=> b!289359 (= res!150981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289360 () Bool)

(assert (=> b!289360 (= e!183203 e!183200)))

(declare-fun res!150986 () Bool)

(assert (=> b!289360 (=> (not res!150986) (not e!183200))))

(declare-fun lt!142773 () Bool)

(assert (=> b!289360 (= res!150986 lt!142773)))

(declare-fun lt!142771 () SeekEntryResult!2058)

(declare-fun lt!142772 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14564 (_ BitVec 32)) SeekEntryResult!2058)

(assert (=> b!289360 (= lt!142771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142772 k0!2524 (array!14565 (store (arr!6909 a!3312) i!1256 k0!2524) (size!7261 a!3312)) mask!3809))))

(assert (=> b!289360 (= lt!142774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142772 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289360 (= lt!142772 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289361 () Bool)

(assert (=> b!289361 (= e!183202 (not true))))

(assert (=> b!289361 (and (= (select (arr!6909 a!3312) (index!10404 lt!142774)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10404 lt!142774) i!1256))))

(declare-fun b!289362 () Bool)

(declare-fun res!150984 () Bool)

(assert (=> b!289362 (=> (not res!150984) (not e!183199))))

(assert (=> b!289362 (= res!150984 (and (= (size!7261 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7261 a!3312))))))

(declare-fun b!289364 () Bool)

(assert (=> b!289364 (= e!183199 e!183203)))

(declare-fun res!150983 () Bool)

(assert (=> b!289364 (=> (not res!150983) (not e!183203))))

(declare-fun lt!142769 () SeekEntryResult!2058)

(assert (=> b!289364 (= res!150983 (or lt!142773 (= lt!142769 (MissingVacant!2058 i!1256))))))

(assert (=> b!289364 (= lt!142773 (= lt!142769 (MissingZero!2058 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14564 (_ BitVec 32)) SeekEntryResult!2058)

(assert (=> b!289364 (= lt!142769 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289363 () Bool)

(declare-fun res!150982 () Bool)

(assert (=> b!289363 (=> (not res!150982) (not e!183199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289363 (= res!150982 (validKeyInArray!0 k0!2524))))

(declare-fun res!150987 () Bool)

(assert (=> start!28250 (=> (not res!150987) (not e!183199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28250 (= res!150987 (validMask!0 mask!3809))))

(assert (=> start!28250 e!183199))

(assert (=> start!28250 true))

(declare-fun array_inv!4872 (array!14564) Bool)

(assert (=> start!28250 (array_inv!4872 a!3312)))

(assert (= (and start!28250 res!150987) b!289362))

(assert (= (and b!289362 res!150984) b!289363))

(assert (= (and b!289363 res!150982) b!289357))

(assert (= (and b!289357 res!150985) b!289364))

(assert (= (and b!289364 res!150983) b!289359))

(assert (= (and b!289359 res!150981) b!289360))

(assert (= (and b!289360 res!150986) b!289358))

(assert (= (and b!289358 res!150980) b!289361))

(declare-fun m!303511 () Bool)

(assert (=> start!28250 m!303511))

(declare-fun m!303513 () Bool)

(assert (=> start!28250 m!303513))

(declare-fun m!303515 () Bool)

(assert (=> b!289358 m!303515))

(declare-fun m!303517 () Bool)

(assert (=> b!289357 m!303517))

(declare-fun m!303519 () Bool)

(assert (=> b!289363 m!303519))

(declare-fun m!303521 () Bool)

(assert (=> b!289359 m!303521))

(declare-fun m!303523 () Bool)

(assert (=> b!289364 m!303523))

(assert (=> b!289361 m!303515))

(declare-fun m!303525 () Bool)

(assert (=> b!289360 m!303525))

(declare-fun m!303527 () Bool)

(assert (=> b!289360 m!303527))

(declare-fun m!303529 () Bool)

(assert (=> b!289360 m!303529))

(declare-fun m!303531 () Bool)

(assert (=> b!289360 m!303531))

(check-sat (not b!289364) (not b!289359) (not start!28250) (not b!289360) (not b!289363) (not b!289357))
(check-sat)
