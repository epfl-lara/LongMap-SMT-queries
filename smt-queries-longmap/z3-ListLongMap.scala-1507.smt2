; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28574 () Bool)

(assert start!28574)

(declare-fun b!292129 () Bool)

(declare-fun e!184840 () Bool)

(declare-fun e!184838 () Bool)

(assert (=> b!292129 (= e!184840 e!184838)))

(declare-fun res!153192 () Bool)

(assert (=> b!292129 (=> (not res!153192) (not e!184838))))

(declare-datatypes ((SeekEntryResult!2148 0))(
  ( (MissingZero!2148 (index!10762 (_ BitVec 32))) (Found!2148 (index!10763 (_ BitVec 32))) (Intermediate!2148 (undefined!2960 Bool) (index!10764 (_ BitVec 32)) (x!28955 (_ BitVec 32))) (Undefined!2148) (MissingVacant!2148 (index!10765 (_ BitVec 32))) )
))
(declare-fun lt!144585 () SeekEntryResult!2148)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144588 () Bool)

(assert (=> b!292129 (= res!153192 (or lt!144588 (= lt!144585 (MissingVacant!2148 i!1256))))))

(assert (=> b!292129 (= lt!144588 (= lt!144585 (MissingZero!2148 i!1256)))))

(declare-datatypes ((array!14753 0))(
  ( (array!14754 (arr!6999 (Array (_ BitVec 32) (_ BitVec 64))) (size!7351 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14753)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14753 (_ BitVec 32)) SeekEntryResult!2148)

(assert (=> b!292129 (= lt!144585 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292130 () Bool)

(declare-fun e!184841 () Bool)

(declare-fun e!184839 () Bool)

(assert (=> b!292130 (= e!184841 e!184839)))

(declare-fun res!153187 () Bool)

(assert (=> b!292130 (=> (not res!153187) (not e!184839))))

(declare-fun lt!144589 () Bool)

(declare-fun lt!144583 () SeekEntryResult!2148)

(assert (=> b!292130 (= res!153187 (and (or lt!144589 (not (undefined!2960 lt!144583))) (not lt!144589) (= (select (arr!6999 a!3312) (index!10764 lt!144583)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292130 (= lt!144589 (not ((_ is Intermediate!2148) lt!144583)))))

(declare-fun res!153190 () Bool)

(assert (=> start!28574 (=> (not res!153190) (not e!184840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28574 (= res!153190 (validMask!0 mask!3809))))

(assert (=> start!28574 e!184840))

(assert (=> start!28574 true))

(declare-fun array_inv!4962 (array!14753) Bool)

(assert (=> start!28574 (array_inv!4962 a!3312)))

(declare-fun b!292131 () Bool)

(declare-fun res!153185 () Bool)

(assert (=> b!292131 (=> (not res!153185) (not e!184840))))

(declare-fun arrayContainsKey!0 (array!14753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292131 (= res!153185 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292132 () Bool)

(assert (=> b!292132 (= e!184839 (not true))))

(declare-datatypes ((Unit!9158 0))(
  ( (Unit!9159) )
))
(declare-fun lt!144584 () Unit!9158)

(declare-fun lt!144587 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9158)

(assert (=> b!292132 (= lt!144584 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144587 (index!10764 lt!144583) (x!28955 lt!144583) mask!3809))))

(assert (=> b!292132 (= (index!10764 lt!144583) i!1256)))

(declare-fun b!292133 () Bool)

(declare-fun res!153186 () Bool)

(assert (=> b!292133 (=> (not res!153186) (not e!184840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292133 (= res!153186 (validKeyInArray!0 k0!2524))))

(declare-fun b!292134 () Bool)

(assert (=> b!292134 (= e!184838 e!184841)))

(declare-fun res!153189 () Bool)

(assert (=> b!292134 (=> (not res!153189) (not e!184841))))

(assert (=> b!292134 (= res!153189 (and (not lt!144588) (= lt!144585 (MissingVacant!2148 i!1256))))))

(declare-fun lt!144586 () SeekEntryResult!2148)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14753 (_ BitVec 32)) SeekEntryResult!2148)

(assert (=> b!292134 (= lt!144586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144587 k0!2524 (array!14754 (store (arr!6999 a!3312) i!1256 k0!2524) (size!7351 a!3312)) mask!3809))))

(assert (=> b!292134 (= lt!144583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144587 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292134 (= lt!144587 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292135 () Bool)

(declare-fun res!153188 () Bool)

(assert (=> b!292135 (=> (not res!153188) (not e!184838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14753 (_ BitVec 32)) Bool)

(assert (=> b!292135 (= res!153188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292136 () Bool)

(declare-fun res!153191 () Bool)

(assert (=> b!292136 (=> (not res!153191) (not e!184840))))

(assert (=> b!292136 (= res!153191 (and (= (size!7351 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7351 a!3312))))))

(assert (= (and start!28574 res!153190) b!292136))

(assert (= (and b!292136 res!153191) b!292133))

(assert (= (and b!292133 res!153186) b!292131))

(assert (= (and b!292131 res!153185) b!292129))

(assert (= (and b!292129 res!153192) b!292135))

(assert (= (and b!292135 res!153188) b!292134))

(assert (= (and b!292134 res!153189) b!292130))

(assert (= (and b!292130 res!153187) b!292132))

(declare-fun m!305853 () Bool)

(assert (=> b!292133 m!305853))

(declare-fun m!305855 () Bool)

(assert (=> b!292129 m!305855))

(declare-fun m!305857 () Bool)

(assert (=> b!292135 m!305857))

(declare-fun m!305859 () Bool)

(assert (=> start!28574 m!305859))

(declare-fun m!305861 () Bool)

(assert (=> start!28574 m!305861))

(declare-fun m!305863 () Bool)

(assert (=> b!292132 m!305863))

(declare-fun m!305865 () Bool)

(assert (=> b!292130 m!305865))

(declare-fun m!305867 () Bool)

(assert (=> b!292134 m!305867))

(declare-fun m!305869 () Bool)

(assert (=> b!292134 m!305869))

(declare-fun m!305871 () Bool)

(assert (=> b!292134 m!305871))

(declare-fun m!305873 () Bool)

(assert (=> b!292134 m!305873))

(declare-fun m!305875 () Bool)

(assert (=> b!292131 m!305875))

(check-sat (not b!292131) (not b!292132) (not start!28574) (not b!292133) (not b!292134) (not b!292129) (not b!292135))
(check-sat)
