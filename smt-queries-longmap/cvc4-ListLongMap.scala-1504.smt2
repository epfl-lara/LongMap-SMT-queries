; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28510 () Bool)

(assert start!28510)

(declare-fun b!291721 () Bool)

(declare-fun e!184585 () Bool)

(declare-fun e!184586 () Bool)

(assert (=> b!291721 (= e!184585 e!184586)))

(declare-fun res!152921 () Bool)

(assert (=> b!291721 (=> (not res!152921) (not e!184586))))

(declare-fun lt!144341 () Bool)

(declare-datatypes ((SeekEntryResult!2140 0))(
  ( (MissingZero!2140 (index!10730 (_ BitVec 32))) (Found!2140 (index!10731 (_ BitVec 32))) (Intermediate!2140 (undefined!2952 Bool) (index!10732 (_ BitVec 32)) (x!28917 (_ BitVec 32))) (Undefined!2140) (MissingVacant!2140 (index!10733 (_ BitVec 32))) )
))
(declare-fun lt!144340 () SeekEntryResult!2140)

(declare-datatypes ((array!14734 0))(
  ( (array!14735 (arr!6991 (Array (_ BitVec 32) (_ BitVec 64))) (size!7343 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14734)

(assert (=> b!291721 (= res!152921 (and (or lt!144341 (not (undefined!2952 lt!144340))) (not lt!144341) (= (select (arr!6991 a!3312) (index!10732 lt!144340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291721 (= lt!144341 (not (is-Intermediate!2140 lt!144340)))))

(declare-fun b!291722 () Bool)

(declare-fun res!152923 () Bool)

(declare-fun e!184587 () Bool)

(assert (=> b!291722 (=> (not res!152923) (not e!184587))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291722 (= res!152923 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291723 () Bool)

(declare-fun res!152922 () Bool)

(declare-fun e!184588 () Bool)

(assert (=> b!291723 (=> (not res!152922) (not e!184588))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14734 (_ BitVec 32)) Bool)

(assert (=> b!291723 (= res!152922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291724 () Bool)

(declare-fun res!152918 () Bool)

(assert (=> b!291724 (=> (not res!152918) (not e!184587))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291724 (= res!152918 (and (= (size!7343 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7343 a!3312))))))

(declare-fun b!291725 () Bool)

(declare-fun res!152919 () Bool)

(assert (=> b!291725 (=> (not res!152919) (not e!184587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291725 (= res!152919 (validKeyInArray!0 k!2524))))

(declare-fun res!152925 () Bool)

(assert (=> start!28510 (=> (not res!152925) (not e!184587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28510 (= res!152925 (validMask!0 mask!3809))))

(assert (=> start!28510 e!184587))

(assert (=> start!28510 true))

(declare-fun array_inv!4954 (array!14734) Bool)

(assert (=> start!28510 (array_inv!4954 a!3312)))

(declare-fun b!291726 () Bool)

(assert (=> b!291726 (= e!184588 e!184585)))

(declare-fun res!152920 () Bool)

(assert (=> b!291726 (=> (not res!152920) (not e!184585))))

(declare-fun lt!144338 () Bool)

(declare-fun lt!144342 () SeekEntryResult!2140)

(assert (=> b!291726 (= res!152920 (and (not lt!144338) (= lt!144342 (MissingVacant!2140 i!1256))))))

(declare-fun lt!144343 () (_ BitVec 32))

(declare-fun lt!144339 () SeekEntryResult!2140)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14734 (_ BitVec 32)) SeekEntryResult!2140)

(assert (=> b!291726 (= lt!144339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144343 k!2524 (array!14735 (store (arr!6991 a!3312) i!1256 k!2524) (size!7343 a!3312)) mask!3809))))

(assert (=> b!291726 (= lt!144340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144343 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291726 (= lt!144343 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291727 () Bool)

(assert (=> b!291727 (= e!184587 e!184588)))

(declare-fun res!152924 () Bool)

(assert (=> b!291727 (=> (not res!152924) (not e!184588))))

(assert (=> b!291727 (= res!152924 (or lt!144338 (= lt!144342 (MissingVacant!2140 i!1256))))))

(assert (=> b!291727 (= lt!144338 (= lt!144342 (MissingZero!2140 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14734 (_ BitVec 32)) SeekEntryResult!2140)

(assert (=> b!291727 (= lt!144342 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291728 () Bool)

(assert (=> b!291728 (= e!184586 (not true))))

(assert (=> b!291728 (= (index!10732 lt!144340) i!1256)))

(assert (= (and start!28510 res!152925) b!291724))

(assert (= (and b!291724 res!152918) b!291725))

(assert (= (and b!291725 res!152919) b!291722))

(assert (= (and b!291722 res!152923) b!291727))

(assert (= (and b!291727 res!152924) b!291723))

(assert (= (and b!291723 res!152922) b!291726))

(assert (= (and b!291726 res!152920) b!291721))

(assert (= (and b!291721 res!152921) b!291728))

(declare-fun m!305555 () Bool)

(assert (=> b!291727 m!305555))

(declare-fun m!305557 () Bool)

(assert (=> start!28510 m!305557))

(declare-fun m!305559 () Bool)

(assert (=> start!28510 m!305559))

(declare-fun m!305561 () Bool)

(assert (=> b!291723 m!305561))

(declare-fun m!305563 () Bool)

(assert (=> b!291722 m!305563))

(declare-fun m!305565 () Bool)

(assert (=> b!291726 m!305565))

(declare-fun m!305567 () Bool)

(assert (=> b!291726 m!305567))

(declare-fun m!305569 () Bool)

(assert (=> b!291726 m!305569))

(declare-fun m!305571 () Bool)

(assert (=> b!291726 m!305571))

(declare-fun m!305573 () Bool)

(assert (=> b!291721 m!305573))

(declare-fun m!305575 () Bool)

(assert (=> b!291725 m!305575))

(push 1)

