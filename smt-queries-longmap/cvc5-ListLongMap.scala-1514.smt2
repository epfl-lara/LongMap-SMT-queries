; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28614 () Bool)

(assert start!28614)

(declare-fun res!153609 () Bool)

(declare-fun e!185079 () Bool)

(assert (=> start!28614 (=> (not res!153609) (not e!185079))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28614 (= res!153609 (validMask!0 mask!3809))))

(assert (=> start!28614 e!185079))

(assert (=> start!28614 true))

(declare-datatypes ((array!14793 0))(
  ( (array!14794 (arr!7019 (Array (_ BitVec 32) (_ BitVec 64))) (size!7371 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14793)

(declare-fun array_inv!4982 (array!14793) Bool)

(assert (=> start!28614 (array_inv!4982 a!3312)))

(declare-fun b!292551 () Bool)

(declare-fun res!153608 () Bool)

(assert (=> b!292551 (=> (not res!153608) (not e!185079))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292551 (= res!153608 (and (= (size!7371 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7371 a!3312))))))

(declare-fun b!292552 () Bool)

(declare-fun res!153610 () Bool)

(assert (=> b!292552 (=> (not res!153610) (not e!185079))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292552 (= res!153610 (validKeyInArray!0 k!2524))))

(declare-fun b!292553 () Bool)

(declare-fun res!153607 () Bool)

(declare-fun e!185081 () Bool)

(assert (=> b!292553 (=> (not res!153607) (not e!185081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14793 (_ BitVec 32)) Bool)

(assert (=> b!292553 (= res!153607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292554 () Bool)

(assert (=> b!292554 (= e!185079 e!185081)))

(declare-fun res!153612 () Bool)

(assert (=> b!292554 (=> (not res!153612) (not e!185081))))

(declare-datatypes ((SeekEntryResult!2168 0))(
  ( (MissingZero!2168 (index!10842 (_ BitVec 32))) (Found!2168 (index!10843 (_ BitVec 32))) (Intermediate!2168 (undefined!2980 Bool) (index!10844 (_ BitVec 32)) (x!29031 (_ BitVec 32))) (Undefined!2168) (MissingVacant!2168 (index!10845 (_ BitVec 32))) )
))
(declare-fun lt!144917 () SeekEntryResult!2168)

(assert (=> b!292554 (= res!153612 (or (= lt!144917 (MissingZero!2168 i!1256)) (= lt!144917 (MissingVacant!2168 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14793 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!292554 (= lt!144917 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292555 () Bool)

(assert (=> b!292555 (= e!185081 false)))

(declare-fun lt!144916 () SeekEntryResult!2168)

(declare-fun lt!144919 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14793 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!292555 (= lt!144916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144919 k!2524 (array!14794 (store (arr!7019 a!3312) i!1256 k!2524) (size!7371 a!3312)) mask!3809))))

(declare-fun lt!144918 () SeekEntryResult!2168)

(assert (=> b!292555 (= lt!144918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144919 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292555 (= lt!144919 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292556 () Bool)

(declare-fun res!153611 () Bool)

(assert (=> b!292556 (=> (not res!153611) (not e!185079))))

(declare-fun arrayContainsKey!0 (array!14793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292556 (= res!153611 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28614 res!153609) b!292551))

(assert (= (and b!292551 res!153608) b!292552))

(assert (= (and b!292552 res!153610) b!292556))

(assert (= (and b!292556 res!153611) b!292554))

(assert (= (and b!292554 res!153612) b!292553))

(assert (= (and b!292553 res!153607) b!292555))

(declare-fun m!306297 () Bool)

(assert (=> b!292556 m!306297))

(declare-fun m!306299 () Bool)

(assert (=> b!292553 m!306299))

(declare-fun m!306301 () Bool)

(assert (=> b!292552 m!306301))

(declare-fun m!306303 () Bool)

(assert (=> b!292554 m!306303))

(declare-fun m!306305 () Bool)

(assert (=> start!28614 m!306305))

(declare-fun m!306307 () Bool)

(assert (=> start!28614 m!306307))

(declare-fun m!306309 () Bool)

(assert (=> b!292555 m!306309))

(declare-fun m!306311 () Bool)

(assert (=> b!292555 m!306311))

(declare-fun m!306313 () Bool)

(assert (=> b!292555 m!306313))

(declare-fun m!306315 () Bool)

(assert (=> b!292555 m!306315))

(push 1)

