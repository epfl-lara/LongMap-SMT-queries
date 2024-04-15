; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28418 () Bool)

(assert start!28418)

(declare-fun b!290878 () Bool)

(declare-fun e!184054 () Bool)

(assert (=> b!290878 (= e!184054 (not true))))

(declare-datatypes ((SeekEntryResult!2114 0))(
  ( (MissingZero!2114 (index!10626 (_ BitVec 32))) (Found!2114 (index!10627 (_ BitVec 32))) (Intermediate!2114 (undefined!2926 Bool) (index!10628 (_ BitVec 32)) (x!28836 (_ BitVec 32))) (Undefined!2114) (MissingVacant!2114 (index!10629 (_ BitVec 32))) )
))
(declare-fun lt!143703 () SeekEntryResult!2114)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290878 (= (index!10628 lt!143703) i!1256)))

(declare-fun b!290879 () Bool)

(declare-fun res!152274 () Bool)

(declare-fun e!184055 () Bool)

(assert (=> b!290879 (=> (not res!152274) (not e!184055))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290879 (= res!152274 (validKeyInArray!0 k0!2524))))

(declare-fun res!152268 () Bool)

(assert (=> start!28418 (=> (not res!152268) (not e!184055))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28418 (= res!152268 (validMask!0 mask!3809))))

(assert (=> start!28418 e!184055))

(assert (=> start!28418 true))

(declare-datatypes ((array!14680 0))(
  ( (array!14681 (arr!6966 (Array (_ BitVec 32) (_ BitVec 64))) (size!7319 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14680)

(declare-fun array_inv!4938 (array!14680) Bool)

(assert (=> start!28418 (array_inv!4938 a!3312)))

(declare-fun b!290880 () Bool)

(declare-fun e!184053 () Bool)

(declare-fun e!184056 () Bool)

(assert (=> b!290880 (= e!184053 e!184056)))

(declare-fun res!152270 () Bool)

(assert (=> b!290880 (=> (not res!152270) (not e!184056))))

(declare-fun lt!143704 () SeekEntryResult!2114)

(declare-fun lt!143705 () Bool)

(assert (=> b!290880 (= res!152270 (and (not lt!143705) (= lt!143704 (MissingVacant!2114 i!1256))))))

(declare-fun lt!143702 () SeekEntryResult!2114)

(declare-fun lt!143706 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14680 (_ BitVec 32)) SeekEntryResult!2114)

(assert (=> b!290880 (= lt!143702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143706 k0!2524 (array!14681 (store (arr!6966 a!3312) i!1256 k0!2524) (size!7319 a!3312)) mask!3809))))

(assert (=> b!290880 (= lt!143703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143706 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290880 (= lt!143706 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290881 () Bool)

(declare-fun res!152272 () Bool)

(assert (=> b!290881 (=> (not res!152272) (not e!184055))))

(assert (=> b!290881 (= res!152272 (and (= (size!7319 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7319 a!3312))))))

(declare-fun b!290882 () Bool)

(declare-fun res!152271 () Bool)

(assert (=> b!290882 (=> (not res!152271) (not e!184055))))

(declare-fun arrayContainsKey!0 (array!14680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290882 (= res!152271 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290883 () Bool)

(declare-fun res!152273 () Bool)

(assert (=> b!290883 (=> (not res!152273) (not e!184053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14680 (_ BitVec 32)) Bool)

(assert (=> b!290883 (= res!152273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290884 () Bool)

(assert (=> b!290884 (= e!184055 e!184053)))

(declare-fun res!152269 () Bool)

(assert (=> b!290884 (=> (not res!152269) (not e!184053))))

(assert (=> b!290884 (= res!152269 (or lt!143705 (= lt!143704 (MissingVacant!2114 i!1256))))))

(assert (=> b!290884 (= lt!143705 (= lt!143704 (MissingZero!2114 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14680 (_ BitVec 32)) SeekEntryResult!2114)

(assert (=> b!290884 (= lt!143704 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290885 () Bool)

(assert (=> b!290885 (= e!184056 e!184054)))

(declare-fun res!152275 () Bool)

(assert (=> b!290885 (=> (not res!152275) (not e!184054))))

(declare-fun lt!143701 () Bool)

(assert (=> b!290885 (= res!152275 (and (or lt!143701 (not (undefined!2926 lt!143703))) (not lt!143701) (= (select (arr!6966 a!3312) (index!10628 lt!143703)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290885 (= lt!143701 (not ((_ is Intermediate!2114) lt!143703)))))

(assert (= (and start!28418 res!152268) b!290881))

(assert (= (and b!290881 res!152272) b!290879))

(assert (= (and b!290879 res!152274) b!290882))

(assert (= (and b!290882 res!152271) b!290884))

(assert (= (and b!290884 res!152269) b!290883))

(assert (= (and b!290883 res!152273) b!290880))

(assert (= (and b!290880 res!152270) b!290885))

(assert (= (and b!290885 res!152275) b!290878))

(declare-fun m!304403 () Bool)

(assert (=> b!290882 m!304403))

(declare-fun m!304405 () Bool)

(assert (=> b!290883 m!304405))

(declare-fun m!304407 () Bool)

(assert (=> b!290884 m!304407))

(declare-fun m!304409 () Bool)

(assert (=> start!28418 m!304409))

(declare-fun m!304411 () Bool)

(assert (=> start!28418 m!304411))

(declare-fun m!304413 () Bool)

(assert (=> b!290885 m!304413))

(declare-fun m!304415 () Bool)

(assert (=> b!290880 m!304415))

(declare-fun m!304417 () Bool)

(assert (=> b!290880 m!304417))

(declare-fun m!304419 () Bool)

(assert (=> b!290880 m!304419))

(declare-fun m!304421 () Bool)

(assert (=> b!290880 m!304421))

(declare-fun m!304423 () Bool)

(assert (=> b!290879 m!304423))

(check-sat (not start!28418) (not b!290882) (not b!290883) (not b!290880) (not b!290884) (not b!290879))
(check-sat)
