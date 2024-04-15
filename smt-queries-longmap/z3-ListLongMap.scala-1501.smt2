; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28436 () Bool)

(assert start!28436)

(declare-fun b!291094 () Bool)

(declare-fun e!184191 () Bool)

(declare-fun e!184188 () Bool)

(assert (=> b!291094 (= e!184191 e!184188)))

(declare-fun res!152487 () Bool)

(assert (=> b!291094 (=> (not res!152487) (not e!184188))))

(declare-datatypes ((SeekEntryResult!2123 0))(
  ( (MissingZero!2123 (index!10662 (_ BitVec 32))) (Found!2123 (index!10663 (_ BitVec 32))) (Intermediate!2123 (undefined!2935 Bool) (index!10664 (_ BitVec 32)) (x!28869 (_ BitVec 32))) (Undefined!2123) (MissingVacant!2123 (index!10665 (_ BitVec 32))) )
))
(declare-fun lt!143863 () SeekEntryResult!2123)

(declare-datatypes ((array!14698 0))(
  ( (array!14699 (arr!6975 (Array (_ BitVec 32) (_ BitVec 64))) (size!7328 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14698)

(declare-fun lt!143866 () Bool)

(assert (=> b!291094 (= res!152487 (and (or lt!143866 (not (undefined!2935 lt!143863))) (not lt!143866) (= (select (arr!6975 a!3312) (index!10664 lt!143863)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291094 (= lt!143866 (not ((_ is Intermediate!2123) lt!143863)))))

(declare-fun b!291095 () Bool)

(declare-fun res!152486 () Bool)

(declare-fun e!184187 () Bool)

(assert (=> b!291095 (=> (not res!152486) (not e!184187))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291095 (= res!152486 (and (= (size!7328 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7328 a!3312))))))

(declare-fun b!291096 () Bool)

(assert (=> b!291096 (= e!184188 (not true))))

(assert (=> b!291096 (= (index!10664 lt!143863) i!1256)))

(declare-fun b!291097 () Bool)

(declare-fun res!152485 () Bool)

(assert (=> b!291097 (=> (not res!152485) (not e!184187))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291097 (= res!152485 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291098 () Bool)

(declare-fun e!184190 () Bool)

(assert (=> b!291098 (= e!184190 e!184191)))

(declare-fun res!152488 () Bool)

(assert (=> b!291098 (=> (not res!152488) (not e!184191))))

(declare-fun lt!143868 () SeekEntryResult!2123)

(declare-fun lt!143867 () Bool)

(assert (=> b!291098 (= res!152488 (and (not lt!143867) (= lt!143868 (MissingVacant!2123 i!1256))))))

(declare-fun lt!143864 () SeekEntryResult!2123)

(declare-fun lt!143865 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14698 (_ BitVec 32)) SeekEntryResult!2123)

(assert (=> b!291098 (= lt!143864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143865 k0!2524 (array!14699 (store (arr!6975 a!3312) i!1256 k0!2524) (size!7328 a!3312)) mask!3809))))

(assert (=> b!291098 (= lt!143863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143865 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291098 (= lt!143865 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291099 () Bool)

(declare-fun res!152484 () Bool)

(assert (=> b!291099 (=> (not res!152484) (not e!184190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14698 (_ BitVec 32)) Bool)

(assert (=> b!291099 (= res!152484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291100 () Bool)

(declare-fun res!152491 () Bool)

(assert (=> b!291100 (=> (not res!152491) (not e!184187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291100 (= res!152491 (validKeyInArray!0 k0!2524))))

(declare-fun b!291101 () Bool)

(assert (=> b!291101 (= e!184187 e!184190)))

(declare-fun res!152490 () Bool)

(assert (=> b!291101 (=> (not res!152490) (not e!184190))))

(assert (=> b!291101 (= res!152490 (or lt!143867 (= lt!143868 (MissingVacant!2123 i!1256))))))

(assert (=> b!291101 (= lt!143867 (= lt!143868 (MissingZero!2123 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14698 (_ BitVec 32)) SeekEntryResult!2123)

(assert (=> b!291101 (= lt!143868 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!152489 () Bool)

(assert (=> start!28436 (=> (not res!152489) (not e!184187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28436 (= res!152489 (validMask!0 mask!3809))))

(assert (=> start!28436 e!184187))

(assert (=> start!28436 true))

(declare-fun array_inv!4947 (array!14698) Bool)

(assert (=> start!28436 (array_inv!4947 a!3312)))

(assert (= (and start!28436 res!152489) b!291095))

(assert (= (and b!291095 res!152486) b!291100))

(assert (= (and b!291100 res!152491) b!291097))

(assert (= (and b!291097 res!152485) b!291101))

(assert (= (and b!291101 res!152490) b!291099))

(assert (= (and b!291099 res!152484) b!291098))

(assert (= (and b!291098 res!152488) b!291094))

(assert (= (and b!291094 res!152487) b!291096))

(declare-fun m!304601 () Bool)

(assert (=> b!291100 m!304601))

(declare-fun m!304603 () Bool)

(assert (=> b!291097 m!304603))

(declare-fun m!304605 () Bool)

(assert (=> start!28436 m!304605))

(declare-fun m!304607 () Bool)

(assert (=> start!28436 m!304607))

(declare-fun m!304609 () Bool)

(assert (=> b!291101 m!304609))

(declare-fun m!304611 () Bool)

(assert (=> b!291098 m!304611))

(declare-fun m!304613 () Bool)

(assert (=> b!291098 m!304613))

(declare-fun m!304615 () Bool)

(assert (=> b!291098 m!304615))

(declare-fun m!304617 () Bool)

(assert (=> b!291098 m!304617))

(declare-fun m!304619 () Bool)

(assert (=> b!291094 m!304619))

(declare-fun m!304621 () Bool)

(assert (=> b!291099 m!304621))

(check-sat (not b!291101) (not b!291097) (not b!291099) (not start!28436) (not b!291098) (not b!291100))
(check-sat)
