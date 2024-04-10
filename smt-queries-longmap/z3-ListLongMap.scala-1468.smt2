; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28196 () Bool)

(assert start!28196)

(declare-fun res!150336 () Bool)

(declare-fun e!182796 () Bool)

(assert (=> start!28196 (=> (not res!150336) (not e!182796))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28196 (= res!150336 (validMask!0 mask!3809))))

(assert (=> start!28196 e!182796))

(assert (=> start!28196 true))

(declare-datatypes ((array!14510 0))(
  ( (array!14511 (arr!6882 (Array (_ BitVec 32) (_ BitVec 64))) (size!7234 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14510)

(declare-fun array_inv!4845 (array!14510) Bool)

(assert (=> start!28196 (array_inv!4845 a!3312)))

(declare-fun b!288709 () Bool)

(declare-fun res!150339 () Bool)

(assert (=> b!288709 (=> (not res!150339) (not e!182796))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288709 (= res!150339 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288710 () Bool)

(declare-fun e!182797 () Bool)

(declare-fun e!182798 () Bool)

(assert (=> b!288710 (= e!182797 e!182798)))

(declare-fun res!150337 () Bool)

(assert (=> b!288710 (=> (not res!150337) (not e!182798))))

(declare-fun lt!142283 () Bool)

(assert (=> b!288710 (= res!150337 lt!142283)))

(declare-fun lt!142285 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2031 0))(
  ( (MissingZero!2031 (index!10294 (_ BitVec 32))) (Found!2031 (index!10295 (_ BitVec 32))) (Intermediate!2031 (undefined!2843 Bool) (index!10296 (_ BitVec 32)) (x!28508 (_ BitVec 32))) (Undefined!2031) (MissingVacant!2031 (index!10297 (_ BitVec 32))) )
))
(declare-fun lt!142287 () SeekEntryResult!2031)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14510 (_ BitVec 32)) SeekEntryResult!2031)

(assert (=> b!288710 (= lt!142287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142285 k0!2524 (array!14511 (store (arr!6882 a!3312) i!1256 k0!2524) (size!7234 a!3312)) mask!3809))))

(declare-fun lt!142288 () SeekEntryResult!2031)

(assert (=> b!288710 (= lt!142288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142285 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288710 (= lt!142285 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288711 () Bool)

(declare-fun res!150332 () Bool)

(assert (=> b!288711 (=> (not res!150332) (not e!182796))))

(assert (=> b!288711 (= res!150332 (and (= (size!7234 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7234 a!3312))))))

(declare-fun b!288712 () Bool)

(assert (=> b!288712 (= e!182796 e!182797)))

(declare-fun res!150334 () Bool)

(assert (=> b!288712 (=> (not res!150334) (not e!182797))))

(declare-fun lt!142284 () SeekEntryResult!2031)

(assert (=> b!288712 (= res!150334 (or lt!142283 (= lt!142284 (MissingVacant!2031 i!1256))))))

(assert (=> b!288712 (= lt!142283 (= lt!142284 (MissingZero!2031 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14510 (_ BitVec 32)) SeekEntryResult!2031)

(assert (=> b!288712 (= lt!142284 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288713 () Bool)

(declare-fun res!150338 () Bool)

(assert (=> b!288713 (=> (not res!150338) (not e!182796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288713 (= res!150338 (validKeyInArray!0 k0!2524))))

(declare-fun b!288714 () Bool)

(declare-fun e!182795 () Bool)

(assert (=> b!288714 (= e!182798 e!182795)))

(declare-fun res!150333 () Bool)

(assert (=> b!288714 (=> (not res!150333) (not e!182795))))

(declare-fun lt!142286 () Bool)

(assert (=> b!288714 (= res!150333 (and (or lt!142286 (not (undefined!2843 lt!142288))) (or lt!142286 (not (= (select (arr!6882 a!3312) (index!10296 lt!142288)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142286 (not (= (select (arr!6882 a!3312) (index!10296 lt!142288)) k0!2524))) (not lt!142286)))))

(get-info :version)

(assert (=> b!288714 (= lt!142286 (not ((_ is Intermediate!2031) lt!142288)))))

(declare-fun b!288715 () Bool)

(assert (=> b!288715 (= e!182795 (not true))))

(assert (=> b!288715 (and (= (select (arr!6882 a!3312) (index!10296 lt!142288)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10296 lt!142288) i!1256))))

(declare-fun b!288716 () Bool)

(declare-fun res!150335 () Bool)

(assert (=> b!288716 (=> (not res!150335) (not e!182797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14510 (_ BitVec 32)) Bool)

(assert (=> b!288716 (= res!150335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28196 res!150336) b!288711))

(assert (= (and b!288711 res!150332) b!288713))

(assert (= (and b!288713 res!150338) b!288709))

(assert (= (and b!288709 res!150339) b!288712))

(assert (= (and b!288712 res!150334) b!288716))

(assert (= (and b!288716 res!150335) b!288710))

(assert (= (and b!288710 res!150337) b!288714))

(assert (= (and b!288714 res!150333) b!288715))

(declare-fun m!302917 () Bool)

(assert (=> b!288709 m!302917))

(declare-fun m!302919 () Bool)

(assert (=> b!288712 m!302919))

(declare-fun m!302921 () Bool)

(assert (=> b!288714 m!302921))

(declare-fun m!302923 () Bool)

(assert (=> b!288716 m!302923))

(declare-fun m!302925 () Bool)

(assert (=> b!288713 m!302925))

(assert (=> b!288715 m!302921))

(declare-fun m!302927 () Bool)

(assert (=> start!28196 m!302927))

(declare-fun m!302929 () Bool)

(assert (=> start!28196 m!302929))

(declare-fun m!302931 () Bool)

(assert (=> b!288710 m!302931))

(declare-fun m!302933 () Bool)

(assert (=> b!288710 m!302933))

(declare-fun m!302935 () Bool)

(assert (=> b!288710 m!302935))

(declare-fun m!302937 () Bool)

(assert (=> b!288710 m!302937))

(check-sat (not b!288709) (not b!288713) (not b!288712) (not start!28196) (not b!288710) (not b!288716))
(check-sat)
