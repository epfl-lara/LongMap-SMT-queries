; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28442 () Bool)

(assert start!28442)

(declare-fun res!152557 () Bool)

(declare-fun e!184233 () Bool)

(assert (=> start!28442 (=> (not res!152557) (not e!184233))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28442 (= res!152557 (validMask!0 mask!3809))))

(assert (=> start!28442 e!184233))

(assert (=> start!28442 true))

(declare-datatypes ((array!14704 0))(
  ( (array!14705 (arr!6978 (Array (_ BitVec 32) (_ BitVec 64))) (size!7331 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14704)

(declare-fun array_inv!4950 (array!14704) Bool)

(assert (=> start!28442 (array_inv!4950 a!3312)))

(declare-fun b!291166 () Bool)

(declare-fun e!184235 () Bool)

(assert (=> b!291166 (= e!184235 (not true))))

(declare-datatypes ((SeekEntryResult!2126 0))(
  ( (MissingZero!2126 (index!10674 (_ BitVec 32))) (Found!2126 (index!10675 (_ BitVec 32))) (Intermediate!2126 (undefined!2938 Bool) (index!10676 (_ BitVec 32)) (x!28880 (_ BitVec 32))) (Undefined!2126) (MissingVacant!2126 (index!10677 (_ BitVec 32))) )
))
(declare-fun lt!143922 () SeekEntryResult!2126)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291166 (= (index!10676 lt!143922) i!1256)))

(declare-fun b!291167 () Bool)

(declare-fun res!152563 () Bool)

(assert (=> b!291167 (=> (not res!152563) (not e!184233))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291167 (= res!152563 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291168 () Bool)

(declare-fun res!152559 () Bool)

(assert (=> b!291168 (=> (not res!152559) (not e!184233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291168 (= res!152559 (validKeyInArray!0 k0!2524))))

(declare-fun b!291169 () Bool)

(declare-fun res!152558 () Bool)

(assert (=> b!291169 (=> (not res!152558) (not e!184233))))

(assert (=> b!291169 (= res!152558 (and (= (size!7331 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7331 a!3312))))))

(declare-fun b!291170 () Bool)

(declare-fun e!184234 () Bool)

(assert (=> b!291170 (= e!184234 e!184235)))

(declare-fun res!152562 () Bool)

(assert (=> b!291170 (=> (not res!152562) (not e!184235))))

(declare-fun lt!143920 () Bool)

(assert (=> b!291170 (= res!152562 (and (or lt!143920 (not (undefined!2938 lt!143922))) (not lt!143920) (= (select (arr!6978 a!3312) (index!10676 lt!143922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291170 (= lt!143920 (not ((_ is Intermediate!2126) lt!143922)))))

(declare-fun b!291171 () Bool)

(declare-fun e!184232 () Bool)

(assert (=> b!291171 (= e!184232 e!184234)))

(declare-fun res!152561 () Bool)

(assert (=> b!291171 (=> (not res!152561) (not e!184234))))

(declare-fun lt!143918 () SeekEntryResult!2126)

(declare-fun lt!143919 () Bool)

(assert (=> b!291171 (= res!152561 (and (not lt!143919) (= lt!143918 (MissingVacant!2126 i!1256))))))

(declare-fun lt!143921 () (_ BitVec 32))

(declare-fun lt!143917 () SeekEntryResult!2126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14704 (_ BitVec 32)) SeekEntryResult!2126)

(assert (=> b!291171 (= lt!143917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143921 k0!2524 (array!14705 (store (arr!6978 a!3312) i!1256 k0!2524) (size!7331 a!3312)) mask!3809))))

(assert (=> b!291171 (= lt!143922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143921 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291171 (= lt!143921 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291172 () Bool)

(assert (=> b!291172 (= e!184233 e!184232)))

(declare-fun res!152560 () Bool)

(assert (=> b!291172 (=> (not res!152560) (not e!184232))))

(assert (=> b!291172 (= res!152560 (or lt!143919 (= lt!143918 (MissingVacant!2126 i!1256))))))

(assert (=> b!291172 (= lt!143919 (= lt!143918 (MissingZero!2126 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14704 (_ BitVec 32)) SeekEntryResult!2126)

(assert (=> b!291172 (= lt!143918 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291173 () Bool)

(declare-fun res!152556 () Bool)

(assert (=> b!291173 (=> (not res!152556) (not e!184232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14704 (_ BitVec 32)) Bool)

(assert (=> b!291173 (= res!152556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28442 res!152557) b!291169))

(assert (= (and b!291169 res!152558) b!291168))

(assert (= (and b!291168 res!152559) b!291167))

(assert (= (and b!291167 res!152563) b!291172))

(assert (= (and b!291172 res!152560) b!291173))

(assert (= (and b!291173 res!152556) b!291171))

(assert (= (and b!291171 res!152561) b!291170))

(assert (= (and b!291170 res!152562) b!291166))

(declare-fun m!304667 () Bool)

(assert (=> b!291171 m!304667))

(declare-fun m!304669 () Bool)

(assert (=> b!291171 m!304669))

(declare-fun m!304671 () Bool)

(assert (=> b!291171 m!304671))

(declare-fun m!304673 () Bool)

(assert (=> b!291171 m!304673))

(declare-fun m!304675 () Bool)

(assert (=> start!28442 m!304675))

(declare-fun m!304677 () Bool)

(assert (=> start!28442 m!304677))

(declare-fun m!304679 () Bool)

(assert (=> b!291167 m!304679))

(declare-fun m!304681 () Bool)

(assert (=> b!291172 m!304681))

(declare-fun m!304683 () Bool)

(assert (=> b!291173 m!304683))

(declare-fun m!304685 () Bool)

(assert (=> b!291170 m!304685))

(declare-fun m!304687 () Bool)

(assert (=> b!291168 m!304687))

(check-sat (not b!291172) (not b!291171) (not b!291167) (not start!28442) (not b!291173) (not b!291168))
(check-sat)
