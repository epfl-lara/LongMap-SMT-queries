; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28642 () Bool)

(assert start!28642)

(declare-fun b!292922 () Bool)

(declare-fun res!153954 () Bool)

(declare-fun e!185266 () Bool)

(assert (=> b!292922 (=> (not res!153954) (not e!185266))))

(declare-datatypes ((array!14826 0))(
  ( (array!14827 (arr!7036 (Array (_ BitVec 32) (_ BitVec 64))) (size!7388 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14826)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14826 (_ BitVec 32)) Bool)

(assert (=> b!292922 (= res!153954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292923 () Bool)

(declare-fun res!153953 () Bool)

(declare-fun e!185267 () Bool)

(assert (=> b!292923 (=> (not res!153953) (not e!185267))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292923 (= res!153953 (validKeyInArray!0 k0!2524))))

(declare-fun res!153956 () Bool)

(assert (=> start!28642 (=> (not res!153956) (not e!185267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28642 (= res!153956 (validMask!0 mask!3809))))

(assert (=> start!28642 e!185267))

(assert (=> start!28642 true))

(declare-fun array_inv!4986 (array!14826) Bool)

(assert (=> start!28642 (array_inv!4986 a!3312)))

(declare-fun b!292924 () Bool)

(assert (=> b!292924 (= e!185266 false)))

(declare-datatypes ((SeekEntryResult!2150 0))(
  ( (MissingZero!2150 (index!10770 (_ BitVec 32))) (Found!2150 (index!10771 (_ BitVec 32))) (Intermediate!2150 (undefined!2962 Bool) (index!10772 (_ BitVec 32)) (x!29061 (_ BitVec 32))) (Undefined!2150) (MissingVacant!2150 (index!10773 (_ BitVec 32))) )
))
(declare-fun lt!145193 () SeekEntryResult!2150)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145192 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14826 (_ BitVec 32)) SeekEntryResult!2150)

(assert (=> b!292924 (= lt!145193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145192 k0!2524 (array!14827 (store (arr!7036 a!3312) i!1256 k0!2524) (size!7388 a!3312)) mask!3809))))

(declare-fun lt!145191 () SeekEntryResult!2150)

(assert (=> b!292924 (= lt!145191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145192 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292924 (= lt!145192 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292925 () Bool)

(assert (=> b!292925 (= e!185267 e!185266)))

(declare-fun res!153952 () Bool)

(assert (=> b!292925 (=> (not res!153952) (not e!185266))))

(declare-fun lt!145194 () SeekEntryResult!2150)

(assert (=> b!292925 (= res!153952 (or (= lt!145194 (MissingZero!2150 i!1256)) (= lt!145194 (MissingVacant!2150 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14826 (_ BitVec 32)) SeekEntryResult!2150)

(assert (=> b!292925 (= lt!145194 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292926 () Bool)

(declare-fun res!153957 () Bool)

(assert (=> b!292926 (=> (not res!153957) (not e!185267))))

(declare-fun arrayContainsKey!0 (array!14826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292926 (= res!153957 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292927 () Bool)

(declare-fun res!153955 () Bool)

(assert (=> b!292927 (=> (not res!153955) (not e!185267))))

(assert (=> b!292927 (= res!153955 (and (= (size!7388 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7388 a!3312))))))

(assert (= (and start!28642 res!153956) b!292927))

(assert (= (and b!292927 res!153955) b!292923))

(assert (= (and b!292923 res!153953) b!292926))

(assert (= (and b!292926 res!153957) b!292925))

(assert (= (and b!292925 res!153952) b!292922))

(assert (= (and b!292922 res!153954) b!292924))

(declare-fun m!306863 () Bool)

(assert (=> b!292925 m!306863))

(declare-fun m!306865 () Bool)

(assert (=> start!28642 m!306865))

(declare-fun m!306867 () Bool)

(assert (=> start!28642 m!306867))

(declare-fun m!306869 () Bool)

(assert (=> b!292924 m!306869))

(declare-fun m!306871 () Bool)

(assert (=> b!292924 m!306871))

(declare-fun m!306873 () Bool)

(assert (=> b!292924 m!306873))

(declare-fun m!306875 () Bool)

(assert (=> b!292924 m!306875))

(declare-fun m!306877 () Bool)

(assert (=> b!292922 m!306877))

(declare-fun m!306879 () Bool)

(assert (=> b!292923 m!306879))

(declare-fun m!306881 () Bool)

(assert (=> b!292926 m!306881))

(check-sat (not b!292926) (not start!28642) (not b!292923) (not b!292924) (not b!292922) (not b!292925))
(check-sat)
