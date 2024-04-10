; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28104 () Bool)

(assert start!28104)

(declare-fun res!149729 () Bool)

(declare-fun e!182334 () Bool)

(assert (=> start!28104 (=> (not res!149729) (not e!182334))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28104 (= res!149729 (validMask!0 mask!3809))))

(assert (=> start!28104 e!182334))

(assert (=> start!28104 true))

(declare-datatypes ((array!14463 0))(
  ( (array!14464 (arr!6860 (Array (_ BitVec 32) (_ BitVec 64))) (size!7212 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14463)

(declare-fun array_inv!4823 (array!14463) Bool)

(assert (=> start!28104 (array_inv!4823 a!3312)))

(declare-fun b!287965 () Bool)

(declare-fun res!149730 () Bool)

(assert (=> b!287965 (=> (not res!149730) (not e!182334))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287965 (= res!149730 (validKeyInArray!0 k!2524))))

(declare-fun b!287966 () Bool)

(declare-fun res!149736 () Bool)

(assert (=> b!287966 (=> (not res!149736) (not e!182334))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287966 (= res!149736 (and (= (size!7212 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7212 a!3312))))))

(declare-fun b!287967 () Bool)

(declare-fun e!182336 () Bool)

(assert (=> b!287967 (= e!182336 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!2009 0))(
  ( (MissingZero!2009 (index!10206 (_ BitVec 32))) (Found!2009 (index!10207 (_ BitVec 32))) (Intermediate!2009 (undefined!2821 Bool) (index!10208 (_ BitVec 32)) (x!28424 (_ BitVec 32))) (Undefined!2009) (MissingVacant!2009 (index!10209 (_ BitVec 32))) )
))
(declare-fun lt!141796 () SeekEntryResult!2009)

(assert (=> b!287967 (and (= (select (arr!6860 a!3312) (index!10208 lt!141796)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10208 lt!141796) i!1256))))

(declare-fun b!287968 () Bool)

(declare-fun e!182335 () Bool)

(declare-fun e!182332 () Bool)

(assert (=> b!287968 (= e!182335 e!182332)))

(declare-fun res!149732 () Bool)

(assert (=> b!287968 (=> (not res!149732) (not e!182332))))

(declare-fun lt!141794 () Bool)

(assert (=> b!287968 (= res!149732 lt!141794)))

(declare-fun lt!141791 () SeekEntryResult!2009)

(declare-fun lt!141792 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14463 (_ BitVec 32)) SeekEntryResult!2009)

(assert (=> b!287968 (= lt!141791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141792 k!2524 (array!14464 (store (arr!6860 a!3312) i!1256 k!2524) (size!7212 a!3312)) mask!3809))))

(assert (=> b!287968 (= lt!141796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141792 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287968 (= lt!141792 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287969 () Bool)

(declare-fun res!149733 () Bool)

(assert (=> b!287969 (=> (not res!149733) (not e!182335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14463 (_ BitVec 32)) Bool)

(assert (=> b!287969 (= res!149733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287970 () Bool)

(assert (=> b!287970 (= e!182334 e!182335)))

(declare-fun res!149734 () Bool)

(assert (=> b!287970 (=> (not res!149734) (not e!182335))))

(declare-fun lt!141793 () SeekEntryResult!2009)

(assert (=> b!287970 (= res!149734 (or lt!141794 (= lt!141793 (MissingVacant!2009 i!1256))))))

(assert (=> b!287970 (= lt!141794 (= lt!141793 (MissingZero!2009 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14463 (_ BitVec 32)) SeekEntryResult!2009)

(assert (=> b!287970 (= lt!141793 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287971 () Bool)

(declare-fun res!149735 () Bool)

(assert (=> b!287971 (=> (not res!149735) (not e!182334))))

(declare-fun arrayContainsKey!0 (array!14463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287971 (= res!149735 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287972 () Bool)

(assert (=> b!287972 (= e!182332 e!182336)))

(declare-fun res!149731 () Bool)

(assert (=> b!287972 (=> (not res!149731) (not e!182336))))

(declare-fun lt!141795 () Bool)

(assert (=> b!287972 (= res!149731 (and (or lt!141795 (not (undefined!2821 lt!141796))) (or lt!141795 (not (= (select (arr!6860 a!3312) (index!10208 lt!141796)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141795 (not (= (select (arr!6860 a!3312) (index!10208 lt!141796)) k!2524))) (not lt!141795)))))

(assert (=> b!287972 (= lt!141795 (not (is-Intermediate!2009 lt!141796)))))

(assert (= (and start!28104 res!149729) b!287966))

(assert (= (and b!287966 res!149736) b!287965))

(assert (= (and b!287965 res!149730) b!287971))

(assert (= (and b!287971 res!149735) b!287970))

(assert (= (and b!287970 res!149734) b!287969))

(assert (= (and b!287969 res!149733) b!287968))

(assert (= (and b!287968 res!149732) b!287972))

(assert (= (and b!287972 res!149731) b!287967))

(declare-fun m!302313 () Bool)

(assert (=> b!287969 m!302313))

(declare-fun m!302315 () Bool)

(assert (=> start!28104 m!302315))

(declare-fun m!302317 () Bool)

(assert (=> start!28104 m!302317))

(declare-fun m!302319 () Bool)

(assert (=> b!287970 m!302319))

(declare-fun m!302321 () Bool)

(assert (=> b!287967 m!302321))

(declare-fun m!302323 () Bool)

(assert (=> b!287971 m!302323))

(assert (=> b!287972 m!302321))

(declare-fun m!302325 () Bool)

(assert (=> b!287968 m!302325))

(declare-fun m!302327 () Bool)

(assert (=> b!287968 m!302327))

(declare-fun m!302329 () Bool)

(assert (=> b!287968 m!302329))

(declare-fun m!302331 () Bool)

(assert (=> b!287968 m!302331))

(declare-fun m!302333 () Bool)

(assert (=> b!287965 m!302333))

(push 1)

