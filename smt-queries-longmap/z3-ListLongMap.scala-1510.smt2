; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28592 () Bool)

(assert start!28592)

(declare-fun res!153407 () Bool)

(declare-fun e!184972 () Bool)

(assert (=> start!28592 (=> (not res!153407) (not e!184972))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28592 (= res!153407 (validMask!0 mask!3809))))

(assert (=> start!28592 e!184972))

(assert (=> start!28592 true))

(declare-datatypes ((array!14771 0))(
  ( (array!14772 (arr!7008 (Array (_ BitVec 32) (_ BitVec 64))) (size!7360 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14771)

(declare-fun array_inv!4971 (array!14771) Bool)

(assert (=> start!28592 (array_inv!4971 a!3312)))

(declare-fun b!292345 () Bool)

(declare-fun e!184976 () Bool)

(assert (=> b!292345 (= e!184976 (not true))))

(declare-fun lt!144775 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((Unit!9176 0))(
  ( (Unit!9177) )
))
(declare-fun lt!144774 () Unit!9176)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2157 0))(
  ( (MissingZero!2157 (index!10798 (_ BitVec 32))) (Found!2157 (index!10799 (_ BitVec 32))) (Intermediate!2157 (undefined!2969 Bool) (index!10800 (_ BitVec 32)) (x!28988 (_ BitVec 32))) (Undefined!2157) (MissingVacant!2157 (index!10801 (_ BitVec 32))) )
))
(declare-fun lt!144778 () SeekEntryResult!2157)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9176)

(assert (=> b!292345 (= lt!144774 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144775 (index!10800 lt!144778) (x!28988 lt!144778) mask!3809))))

(assert (=> b!292345 (= (index!10800 lt!144778) i!1256)))

(declare-fun b!292346 () Bool)

(declare-fun res!153406 () Bool)

(assert (=> b!292346 (=> (not res!153406) (not e!184972))))

(declare-fun arrayContainsKey!0 (array!14771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292346 (= res!153406 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292347 () Bool)

(declare-fun res!153403 () Bool)

(assert (=> b!292347 (=> (not res!153403) (not e!184972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292347 (= res!153403 (validKeyInArray!0 k0!2524))))

(declare-fun b!292348 () Bool)

(declare-fun e!184975 () Bool)

(declare-fun e!184974 () Bool)

(assert (=> b!292348 (= e!184975 e!184974)))

(declare-fun res!153405 () Bool)

(assert (=> b!292348 (=> (not res!153405) (not e!184974))))

(declare-fun lt!144772 () Bool)

(declare-fun lt!144777 () SeekEntryResult!2157)

(assert (=> b!292348 (= res!153405 (and (not lt!144772) (= lt!144777 (MissingVacant!2157 i!1256))))))

(declare-fun lt!144773 () SeekEntryResult!2157)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14771 (_ BitVec 32)) SeekEntryResult!2157)

(assert (=> b!292348 (= lt!144773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144775 k0!2524 (array!14772 (store (arr!7008 a!3312) i!1256 k0!2524) (size!7360 a!3312)) mask!3809))))

(assert (=> b!292348 (= lt!144778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144775 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292348 (= lt!144775 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292349 () Bool)

(declare-fun res!153408 () Bool)

(assert (=> b!292349 (=> (not res!153408) (not e!184972))))

(assert (=> b!292349 (= res!153408 (and (= (size!7360 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7360 a!3312))))))

(declare-fun b!292350 () Bool)

(assert (=> b!292350 (= e!184972 e!184975)))

(declare-fun res!153404 () Bool)

(assert (=> b!292350 (=> (not res!153404) (not e!184975))))

(assert (=> b!292350 (= res!153404 (or lt!144772 (= lt!144777 (MissingVacant!2157 i!1256))))))

(assert (=> b!292350 (= lt!144772 (= lt!144777 (MissingZero!2157 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14771 (_ BitVec 32)) SeekEntryResult!2157)

(assert (=> b!292350 (= lt!144777 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292351 () Bool)

(assert (=> b!292351 (= e!184974 e!184976)))

(declare-fun res!153402 () Bool)

(assert (=> b!292351 (=> (not res!153402) (not e!184976))))

(declare-fun lt!144776 () Bool)

(assert (=> b!292351 (= res!153402 (and (or lt!144776 (not (undefined!2969 lt!144778))) (not lt!144776) (= (select (arr!7008 a!3312) (index!10800 lt!144778)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292351 (= lt!144776 (not ((_ is Intermediate!2157) lt!144778)))))

(declare-fun b!292352 () Bool)

(declare-fun res!153401 () Bool)

(assert (=> b!292352 (=> (not res!153401) (not e!184975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14771 (_ BitVec 32)) Bool)

(assert (=> b!292352 (= res!153401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28592 res!153407) b!292349))

(assert (= (and b!292349 res!153408) b!292347))

(assert (= (and b!292347 res!153403) b!292346))

(assert (= (and b!292346 res!153406) b!292350))

(assert (= (and b!292350 res!153404) b!292352))

(assert (= (and b!292352 res!153401) b!292348))

(assert (= (and b!292348 res!153405) b!292351))

(assert (= (and b!292351 res!153402) b!292345))

(declare-fun m!306069 () Bool)

(assert (=> start!28592 m!306069))

(declare-fun m!306071 () Bool)

(assert (=> start!28592 m!306071))

(declare-fun m!306073 () Bool)

(assert (=> b!292348 m!306073))

(declare-fun m!306075 () Bool)

(assert (=> b!292348 m!306075))

(declare-fun m!306077 () Bool)

(assert (=> b!292348 m!306077))

(declare-fun m!306079 () Bool)

(assert (=> b!292348 m!306079))

(declare-fun m!306081 () Bool)

(assert (=> b!292346 m!306081))

(declare-fun m!306083 () Bool)

(assert (=> b!292352 m!306083))

(declare-fun m!306085 () Bool)

(assert (=> b!292347 m!306085))

(declare-fun m!306087 () Bool)

(assert (=> b!292351 m!306087))

(declare-fun m!306089 () Bool)

(assert (=> b!292345 m!306089))

(declare-fun m!306091 () Bool)

(assert (=> b!292350 m!306091))

(check-sat (not b!292352) (not start!28592) (not b!292345) (not b!292346) (not b!292347) (not b!292350) (not b!292348))
(check-sat)
