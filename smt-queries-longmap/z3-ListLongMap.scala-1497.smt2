; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28418 () Bool)

(assert start!28418)

(declare-fun b!290977 () Bool)

(declare-fun e!184124 () Bool)

(declare-fun e!184126 () Bool)

(assert (=> b!290977 (= e!184124 e!184126)))

(declare-fun res!152322 () Bool)

(assert (=> b!290977 (=> (not res!152322) (not e!184126))))

(declare-datatypes ((SeekEntryResult!2118 0))(
  ( (MissingZero!2118 (index!10642 (_ BitVec 32))) (Found!2118 (index!10643 (_ BitVec 32))) (Intermediate!2118 (undefined!2930 Bool) (index!10644 (_ BitVec 32)) (x!28833 (_ BitVec 32))) (Undefined!2118) (MissingVacant!2118 (index!10645 (_ BitVec 32))) )
))
(declare-fun lt!143847 () SeekEntryResult!2118)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143850 () Bool)

(assert (=> b!290977 (= res!152322 (or lt!143850 (= lt!143847 (MissingVacant!2118 i!1256))))))

(assert (=> b!290977 (= lt!143850 (= lt!143847 (MissingZero!2118 i!1256)))))

(declare-datatypes ((array!14687 0))(
  ( (array!14688 (arr!6969 (Array (_ BitVec 32) (_ BitVec 64))) (size!7321 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14687)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14687 (_ BitVec 32)) SeekEntryResult!2118)

(assert (=> b!290977 (= lt!143847 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290978 () Bool)

(declare-fun res!152320 () Bool)

(assert (=> b!290978 (=> (not res!152320) (not e!184124))))

(declare-fun arrayContainsKey!0 (array!14687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290978 (= res!152320 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152319 () Bool)

(assert (=> start!28418 (=> (not res!152319) (not e!184124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28418 (= res!152319 (validMask!0 mask!3809))))

(assert (=> start!28418 e!184124))

(assert (=> start!28418 true))

(declare-fun array_inv!4932 (array!14687) Bool)

(assert (=> start!28418 (array_inv!4932 a!3312)))

(declare-fun b!290979 () Bool)

(declare-fun res!152315 () Bool)

(assert (=> b!290979 (=> (not res!152315) (not e!184126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14687 (_ BitVec 32)) Bool)

(assert (=> b!290979 (= res!152315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290980 () Bool)

(declare-fun res!152321 () Bool)

(assert (=> b!290980 (=> (not res!152321) (not e!184124))))

(assert (=> b!290980 (= res!152321 (and (= (size!7321 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7321 a!3312))))))

(declare-fun b!290981 () Bool)

(declare-fun e!184127 () Bool)

(declare-fun e!184123 () Bool)

(assert (=> b!290981 (= e!184127 e!184123)))

(declare-fun res!152316 () Bool)

(assert (=> b!290981 (=> (not res!152316) (not e!184123))))

(declare-fun lt!143849 () SeekEntryResult!2118)

(declare-fun lt!143846 () Bool)

(assert (=> b!290981 (= res!152316 (and (or lt!143846 (not (undefined!2930 lt!143849))) (not lt!143846) (= (select (arr!6969 a!3312) (index!10644 lt!143849)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290981 (= lt!143846 (not ((_ is Intermediate!2118) lt!143849)))))

(declare-fun b!290982 () Bool)

(assert (=> b!290982 (= e!184123 (not true))))

(assert (=> b!290982 (= (index!10644 lt!143849) i!1256)))

(declare-fun b!290983 () Bool)

(assert (=> b!290983 (= e!184126 e!184127)))

(declare-fun res!152318 () Bool)

(assert (=> b!290983 (=> (not res!152318) (not e!184127))))

(assert (=> b!290983 (= res!152318 (and (not lt!143850) (= lt!143847 (MissingVacant!2118 i!1256))))))

(declare-fun lt!143851 () (_ BitVec 32))

(declare-fun lt!143848 () SeekEntryResult!2118)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14687 (_ BitVec 32)) SeekEntryResult!2118)

(assert (=> b!290983 (= lt!143848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143851 k0!2524 (array!14688 (store (arr!6969 a!3312) i!1256 k0!2524) (size!7321 a!3312)) mask!3809))))

(assert (=> b!290983 (= lt!143849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143851 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290983 (= lt!143851 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290984 () Bool)

(declare-fun res!152317 () Bool)

(assert (=> b!290984 (=> (not res!152317) (not e!184124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290984 (= res!152317 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28418 res!152319) b!290980))

(assert (= (and b!290980 res!152321) b!290984))

(assert (= (and b!290984 res!152317) b!290978))

(assert (= (and b!290978 res!152320) b!290977))

(assert (= (and b!290977 res!152322) b!290979))

(assert (= (and b!290979 res!152315) b!290983))

(assert (= (and b!290983 res!152318) b!290981))

(assert (= (and b!290981 res!152316) b!290982))

(declare-fun m!304951 () Bool)

(assert (=> start!28418 m!304951))

(declare-fun m!304953 () Bool)

(assert (=> start!28418 m!304953))

(declare-fun m!304955 () Bool)

(assert (=> b!290977 m!304955))

(declare-fun m!304957 () Bool)

(assert (=> b!290984 m!304957))

(declare-fun m!304959 () Bool)

(assert (=> b!290979 m!304959))

(declare-fun m!304961 () Bool)

(assert (=> b!290983 m!304961))

(declare-fun m!304963 () Bool)

(assert (=> b!290983 m!304963))

(declare-fun m!304965 () Bool)

(assert (=> b!290983 m!304965))

(declare-fun m!304967 () Bool)

(assert (=> b!290983 m!304967))

(declare-fun m!304969 () Bool)

(assert (=> b!290981 m!304969))

(declare-fun m!304971 () Bool)

(assert (=> b!290978 m!304971))

(check-sat (not b!290979) (not b!290984) (not b!290983) (not b!290977) (not b!290978) (not start!28418))
(check-sat)
