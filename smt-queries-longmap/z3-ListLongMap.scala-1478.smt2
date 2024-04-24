; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28246 () Bool)

(assert start!28246)

(declare-fun b!289458 () Bool)

(declare-datatypes ((Unit!9048 0))(
  ( (Unit!9049) )
))
(declare-fun e!183257 () Unit!9048)

(declare-fun Unit!9050 () Unit!9048)

(assert (=> b!289458 (= e!183257 Unit!9050)))

(assert (=> b!289458 false))

(declare-fun b!289459 () Bool)

(declare-fun e!183256 () Unit!9048)

(assert (=> b!289459 (= e!183257 e!183256)))

(declare-fun c!46767 () Bool)

(declare-datatypes ((SeekEntryResult!2024 0))(
  ( (MissingZero!2024 (index!10266 (_ BitVec 32))) (Found!2024 (index!10267 (_ BitVec 32))) (Intermediate!2024 (undefined!2836 Bool) (index!10268 (_ BitVec 32)) (x!28581 (_ BitVec 32))) (Undefined!2024) (MissingVacant!2024 (index!10269 (_ BitVec 32))) )
))
(declare-fun lt!142866 () SeekEntryResult!2024)

(get-info :version)

(assert (=> b!289459 (= c!46767 ((_ is Intermediate!2024) lt!142866))))

(declare-fun b!289460 () Bool)

(declare-fun res!151049 () Bool)

(declare-fun e!183258 () Bool)

(assert (=> b!289460 (=> (not res!151049) (not e!183258))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14565 0))(
  ( (array!14566 (arr!6910 (Array (_ BitVec 32) (_ BitVec 64))) (size!7262 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14565)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289460 (= res!151049 (and (= (size!7262 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7262 a!3312))))))

(declare-fun b!289461 () Bool)

(declare-fun res!151048 () Bool)

(assert (=> b!289461 (=> (not res!151048) (not e!183258))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289461 (= res!151048 (validKeyInArray!0 k0!2524))))

(declare-fun b!289462 () Bool)

(declare-fun res!151053 () Bool)

(assert (=> b!289462 (=> (not res!151053) (not e!183258))))

(declare-fun arrayContainsKey!0 (array!14565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289462 (= res!151053 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151050 () Bool)

(assert (=> start!28246 (=> (not res!151050) (not e!183258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28246 (= res!151050 (validMask!0 mask!3809))))

(assert (=> start!28246 e!183258))

(assert (=> start!28246 true))

(declare-fun array_inv!4860 (array!14565) Bool)

(assert (=> start!28246 (array_inv!4860 a!3312)))

(declare-fun b!289463 () Bool)

(declare-fun e!183260 () Bool)

(assert (=> b!289463 (= e!183258 e!183260)))

(declare-fun res!151052 () Bool)

(assert (=> b!289463 (=> (not res!151052) (not e!183260))))

(declare-fun lt!142871 () Bool)

(declare-fun lt!142872 () SeekEntryResult!2024)

(assert (=> b!289463 (= res!151052 (or lt!142871 (= lt!142872 (MissingVacant!2024 i!1256))))))

(assert (=> b!289463 (= lt!142871 (= lt!142872 (MissingZero!2024 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14565 (_ BitVec 32)) SeekEntryResult!2024)

(assert (=> b!289463 (= lt!142872 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289464 () Bool)

(assert (=> b!289464 false))

(declare-fun Unit!9051 () Unit!9048)

(assert (=> b!289464 (= e!183256 Unit!9051)))

(declare-fun b!289465 () Bool)

(declare-fun e!183259 () Bool)

(assert (=> b!289465 (= e!183259 false)))

(declare-fun lt!142870 () Unit!9048)

(assert (=> b!289465 (= lt!142870 e!183257)))

(declare-fun c!46768 () Bool)

(assert (=> b!289465 (= c!46768 (or (and ((_ is Intermediate!2024) lt!142866) (undefined!2836 lt!142866)) (and ((_ is Intermediate!2024) lt!142866) (= (select (arr!6910 a!3312) (index!10268 lt!142866)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2024) lt!142866) (= (select (arr!6910 a!3312) (index!10268 lt!142866)) k0!2524))))))

(declare-fun b!289466 () Bool)

(assert (=> b!289466 (= e!183260 e!183259)))

(declare-fun res!151047 () Bool)

(assert (=> b!289466 (=> (not res!151047) (not e!183259))))

(assert (=> b!289466 (= res!151047 lt!142871)))

(declare-fun lt!142869 () SeekEntryResult!2024)

(declare-fun lt!142868 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14565 (_ BitVec 32)) SeekEntryResult!2024)

(assert (=> b!289466 (= lt!142869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142868 k0!2524 (array!14566 (store (arr!6910 a!3312) i!1256 k0!2524) (size!7262 a!3312)) mask!3809))))

(assert (=> b!289466 (= lt!142866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142868 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289466 (= lt!142868 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289467 () Bool)

(assert (=> b!289467 (and (= lt!142869 lt!142866) (= (select (store (arr!6910 a!3312) i!1256 k0!2524) (index!10268 lt!142866)) k0!2524))))

(declare-fun lt!142867 () Unit!9048)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9048)

(assert (=> b!289467 (= lt!142867 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142868 (index!10268 lt!142866) (x!28581 lt!142866) mask!3809))))

(assert (=> b!289467 (and (= (select (arr!6910 a!3312) (index!10268 lt!142866)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10268 lt!142866) i!1256))))

(declare-fun Unit!9052 () Unit!9048)

(assert (=> b!289467 (= e!183256 Unit!9052)))

(declare-fun b!289468 () Bool)

(declare-fun res!151051 () Bool)

(assert (=> b!289468 (=> (not res!151051) (not e!183260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14565 (_ BitVec 32)) Bool)

(assert (=> b!289468 (= res!151051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28246 res!151050) b!289460))

(assert (= (and b!289460 res!151049) b!289461))

(assert (= (and b!289461 res!151048) b!289462))

(assert (= (and b!289462 res!151053) b!289463))

(assert (= (and b!289463 res!151052) b!289468))

(assert (= (and b!289468 res!151051) b!289466))

(assert (= (and b!289466 res!151047) b!289465))

(assert (= (and b!289465 c!46768) b!289458))

(assert (= (and b!289465 (not c!46768)) b!289459))

(assert (= (and b!289459 c!46767) b!289467))

(assert (= (and b!289459 (not c!46767)) b!289464))

(declare-fun m!303761 () Bool)

(assert (=> start!28246 m!303761))

(declare-fun m!303763 () Bool)

(assert (=> start!28246 m!303763))

(declare-fun m!303765 () Bool)

(assert (=> b!289468 m!303765))

(declare-fun m!303767 () Bool)

(assert (=> b!289461 m!303767))

(declare-fun m!303769 () Bool)

(assert (=> b!289462 m!303769))

(declare-fun m!303771 () Bool)

(assert (=> b!289467 m!303771))

(declare-fun m!303773 () Bool)

(assert (=> b!289467 m!303773))

(declare-fun m!303775 () Bool)

(assert (=> b!289467 m!303775))

(declare-fun m!303777 () Bool)

(assert (=> b!289467 m!303777))

(declare-fun m!303779 () Bool)

(assert (=> b!289463 m!303779))

(assert (=> b!289465 m!303777))

(assert (=> b!289466 m!303771))

(declare-fun m!303781 () Bool)

(assert (=> b!289466 m!303781))

(declare-fun m!303783 () Bool)

(assert (=> b!289466 m!303783))

(declare-fun m!303785 () Bool)

(assert (=> b!289466 m!303785))

(check-sat (not b!289463) (not start!28246) (not b!289468) (not b!289467) (not b!289462) (not b!289461) (not b!289466))
(check-sat)
