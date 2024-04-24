; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28498 () Bool)

(assert start!28498)

(declare-fun res!152896 () Bool)

(declare-fun e!184581 () Bool)

(assert (=> start!28498 (=> (not res!152896) (not e!184581))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28498 (= res!152896 (validMask!0 mask!3809))))

(assert (=> start!28498 e!184581))

(assert (=> start!28498 true))

(declare-datatypes ((array!14727 0))(
  ( (array!14728 (arr!6988 (Array (_ BitVec 32) (_ BitVec 64))) (size!7340 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14727)

(declare-fun array_inv!4938 (array!14727) Bool)

(assert (=> start!28498 (array_inv!4938 a!3312)))

(declare-fun b!291720 () Bool)

(declare-fun e!184580 () Bool)

(declare-fun e!184579 () Bool)

(assert (=> b!291720 (= e!184580 e!184579)))

(declare-fun res!152897 () Bool)

(assert (=> b!291720 (=> (not res!152897) (not e!184579))))

(declare-datatypes ((SeekEntryResult!2102 0))(
  ( (MissingZero!2102 (index!10578 (_ BitVec 32))) (Found!2102 (index!10579 (_ BitVec 32))) (Intermediate!2102 (undefined!2914 Bool) (index!10580 (_ BitVec 32)) (x!28879 (_ BitVec 32))) (Undefined!2102) (MissingVacant!2102 (index!10581 (_ BitVec 32))) )
))
(declare-fun lt!144364 () SeekEntryResult!2102)

(declare-fun lt!144363 () Bool)

(assert (=> b!291720 (= res!152897 (and (or lt!144363 (not (undefined!2914 lt!144364))) (not lt!144363) (= (select (arr!6988 a!3312) (index!10580 lt!144364)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291720 (= lt!144363 (not ((_ is Intermediate!2102) lt!144364)))))

(declare-fun b!291721 () Bool)

(declare-fun res!152895 () Bool)

(assert (=> b!291721 (=> (not res!152895) (not e!184581))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291721 (= res!152895 (validKeyInArray!0 k0!2524))))

(declare-fun b!291722 () Bool)

(declare-fun e!184583 () Bool)

(assert (=> b!291722 (= e!184581 e!184583)))

(declare-fun res!152894 () Bool)

(assert (=> b!291722 (=> (not res!152894) (not e!184583))))

(declare-fun lt!144361 () SeekEntryResult!2102)

(declare-fun lt!144366 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291722 (= res!152894 (or lt!144366 (= lt!144361 (MissingVacant!2102 i!1256))))))

(assert (=> b!291722 (= lt!144366 (= lt!144361 (MissingZero!2102 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14727 (_ BitVec 32)) SeekEntryResult!2102)

(assert (=> b!291722 (= lt!144361 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291723 () Bool)

(declare-fun res!152892 () Bool)

(assert (=> b!291723 (=> (not res!152892) (not e!184581))))

(assert (=> b!291723 (= res!152892 (and (= (size!7340 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7340 a!3312))))))

(declare-fun b!291724 () Bool)

(declare-fun res!152893 () Bool)

(assert (=> b!291724 (=> (not res!152893) (not e!184581))))

(declare-fun arrayContainsKey!0 (array!14727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291724 (= res!152893 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291725 () Bool)

(assert (=> b!291725 (= e!184583 e!184580)))

(declare-fun res!152891 () Bool)

(assert (=> b!291725 (=> (not res!152891) (not e!184580))))

(assert (=> b!291725 (= res!152891 (and (not lt!144366) (= lt!144361 (MissingVacant!2102 i!1256))))))

(declare-fun lt!144362 () (_ BitVec 32))

(declare-fun lt!144365 () SeekEntryResult!2102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14727 (_ BitVec 32)) SeekEntryResult!2102)

(assert (=> b!291725 (= lt!144365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144362 k0!2524 (array!14728 (store (arr!6988 a!3312) i!1256 k0!2524) (size!7340 a!3312)) mask!3809))))

(assert (=> b!291725 (= lt!144364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144362 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291725 (= lt!144362 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291726 () Bool)

(declare-fun res!152898 () Bool)

(assert (=> b!291726 (=> (not res!152898) (not e!184583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14727 (_ BitVec 32)) Bool)

(assert (=> b!291726 (= res!152898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291727 () Bool)

(assert (=> b!291727 (= e!184579 (not true))))

(assert (=> b!291727 (= (index!10580 lt!144364) i!1256)))

(assert (= (and start!28498 res!152896) b!291723))

(assert (= (and b!291723 res!152892) b!291721))

(assert (= (and b!291721 res!152895) b!291724))

(assert (= (and b!291724 res!152893) b!291722))

(assert (= (and b!291722 res!152894) b!291726))

(assert (= (and b!291726 res!152898) b!291725))

(assert (= (and b!291725 res!152891) b!291720))

(assert (= (and b!291720 res!152897) b!291727))

(declare-fun m!305717 () Bool)

(assert (=> b!291725 m!305717))

(declare-fun m!305719 () Bool)

(assert (=> b!291725 m!305719))

(declare-fun m!305721 () Bool)

(assert (=> b!291725 m!305721))

(declare-fun m!305723 () Bool)

(assert (=> b!291725 m!305723))

(declare-fun m!305725 () Bool)

(assert (=> b!291726 m!305725))

(declare-fun m!305727 () Bool)

(assert (=> b!291720 m!305727))

(declare-fun m!305729 () Bool)

(assert (=> b!291724 m!305729))

(declare-fun m!305731 () Bool)

(assert (=> b!291721 m!305731))

(declare-fun m!305733 () Bool)

(assert (=> start!28498 m!305733))

(declare-fun m!305735 () Bool)

(assert (=> start!28498 m!305735))

(declare-fun m!305737 () Bool)

(assert (=> b!291722 m!305737))

(check-sat (not b!291726) (not start!28498) (not b!291722) (not b!291721) (not b!291725) (not b!291724))
(check-sat)
