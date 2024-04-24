; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28396 () Bool)

(assert start!28396)

(declare-fun b!290856 () Bool)

(declare-fun res!152175 () Bool)

(declare-fun e!184045 () Bool)

(assert (=> b!290856 (=> (not res!152175) (not e!184045))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14670 0))(
  ( (array!14671 (arr!6961 (Array (_ BitVec 32) (_ BitVec 64))) (size!7313 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14670)

(assert (=> b!290856 (= res!152175 (and (= (size!7313 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7313 a!3312))))))

(declare-fun b!290857 () Bool)

(declare-fun res!152168 () Bool)

(declare-fun e!184044 () Bool)

(assert (=> b!290857 (=> (not res!152168) (not e!184044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14670 (_ BitVec 32)) Bool)

(assert (=> b!290857 (= res!152168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290858 () Bool)

(declare-fun e!184042 () Bool)

(assert (=> b!290858 (= e!184044 e!184042)))

(declare-fun res!152171 () Bool)

(assert (=> b!290858 (=> (not res!152171) (not e!184042))))

(declare-datatypes ((SeekEntryResult!2075 0))(
  ( (MissingZero!2075 (index!10470 (_ BitVec 32))) (Found!2075 (index!10471 (_ BitVec 32))) (Intermediate!2075 (undefined!2887 Bool) (index!10472 (_ BitVec 32)) (x!28774 (_ BitVec 32))) (Undefined!2075) (MissingVacant!2075 (index!10473 (_ BitVec 32))) )
))
(declare-fun lt!143784 () SeekEntryResult!2075)

(declare-fun lt!143782 () Bool)

(assert (=> b!290858 (= res!152171 (and (not lt!143782) (= lt!143784 (MissingVacant!2075 i!1256))))))

(declare-fun lt!143779 () (_ BitVec 32))

(declare-fun lt!143783 () SeekEntryResult!2075)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14670 (_ BitVec 32)) SeekEntryResult!2075)

(assert (=> b!290858 (= lt!143783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143779 k0!2524 (array!14671 (store (arr!6961 a!3312) i!1256 k0!2524) (size!7313 a!3312)) mask!3809))))

(declare-fun lt!143780 () SeekEntryResult!2075)

(assert (=> b!290858 (= lt!143780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143779 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290858 (= lt!143779 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290859 () Bool)

(declare-fun e!184043 () Bool)

(assert (=> b!290859 (= e!184043 (not true))))

(assert (=> b!290859 (= (index!10472 lt!143780) i!1256)))

(declare-fun b!290861 () Bool)

(assert (=> b!290861 (= e!184045 e!184044)))

(declare-fun res!152169 () Bool)

(assert (=> b!290861 (=> (not res!152169) (not e!184044))))

(assert (=> b!290861 (= res!152169 (or lt!143782 (= lt!143784 (MissingVacant!2075 i!1256))))))

(assert (=> b!290861 (= lt!143782 (= lt!143784 (MissingZero!2075 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14670 (_ BitVec 32)) SeekEntryResult!2075)

(assert (=> b!290861 (= lt!143784 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290862 () Bool)

(assert (=> b!290862 (= e!184042 e!184043)))

(declare-fun res!152173 () Bool)

(assert (=> b!290862 (=> (not res!152173) (not e!184043))))

(declare-fun lt!143781 () Bool)

(assert (=> b!290862 (= res!152173 (and (or lt!143781 (not (undefined!2887 lt!143780))) (not lt!143781) (= (select (arr!6961 a!3312) (index!10472 lt!143780)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290862 (= lt!143781 (not ((_ is Intermediate!2075) lt!143780)))))

(declare-fun b!290863 () Bool)

(declare-fun res!152172 () Bool)

(assert (=> b!290863 (=> (not res!152172) (not e!184045))))

(declare-fun arrayContainsKey!0 (array!14670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290863 (= res!152172 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290860 () Bool)

(declare-fun res!152170 () Bool)

(assert (=> b!290860 (=> (not res!152170) (not e!184045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290860 (= res!152170 (validKeyInArray!0 k0!2524))))

(declare-fun res!152174 () Bool)

(assert (=> start!28396 (=> (not res!152174) (not e!184045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28396 (= res!152174 (validMask!0 mask!3809))))

(assert (=> start!28396 e!184045))

(assert (=> start!28396 true))

(declare-fun array_inv!4911 (array!14670) Bool)

(assert (=> start!28396 (array_inv!4911 a!3312)))

(assert (= (and start!28396 res!152174) b!290856))

(assert (= (and b!290856 res!152175) b!290860))

(assert (= (and b!290860 res!152170) b!290863))

(assert (= (and b!290863 res!152172) b!290861))

(assert (= (and b!290861 res!152169) b!290857))

(assert (= (and b!290857 res!152168) b!290858))

(assert (= (and b!290858 res!152171) b!290862))

(assert (= (and b!290862 res!152173) b!290859))

(declare-fun m!305003 () Bool)

(assert (=> start!28396 m!305003))

(declare-fun m!305005 () Bool)

(assert (=> start!28396 m!305005))

(declare-fun m!305007 () Bool)

(assert (=> b!290860 m!305007))

(declare-fun m!305009 () Bool)

(assert (=> b!290858 m!305009))

(declare-fun m!305011 () Bool)

(assert (=> b!290858 m!305011))

(declare-fun m!305013 () Bool)

(assert (=> b!290858 m!305013))

(declare-fun m!305015 () Bool)

(assert (=> b!290858 m!305015))

(declare-fun m!305017 () Bool)

(assert (=> b!290857 m!305017))

(declare-fun m!305019 () Bool)

(assert (=> b!290863 m!305019))

(declare-fun m!305021 () Bool)

(assert (=> b!290862 m!305021))

(declare-fun m!305023 () Bool)

(assert (=> b!290861 m!305023))

(check-sat (not b!290857) (not b!290858) (not b!290860) (not b!290863) (not b!290861) (not start!28396))
(check-sat)
