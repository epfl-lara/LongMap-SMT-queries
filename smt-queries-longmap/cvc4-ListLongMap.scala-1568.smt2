; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29900 () Bool)

(assert start!29900)

(declare-fun res!158502 () Bool)

(declare-fun e!189808 () Bool)

(assert (=> start!29900 (=> (not res!158502) (not e!189808))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29900 (= res!158502 (validMask!0 mask!3809))))

(assert (=> start!29900 e!189808))

(assert (=> start!29900 true))

(declare-datatypes ((array!15178 0))(
  ( (array!15179 (arr!7183 (Array (_ BitVec 32) (_ BitVec 64))) (size!7535 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15178)

(declare-fun array_inv!5146 (array!15178) Bool)

(assert (=> start!29900 (array_inv!5146 a!3312)))

(declare-fun b!300609 () Bool)

(declare-fun res!158505 () Bool)

(assert (=> b!300609 (=> (not res!158505) (not e!189808))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300609 (= res!158505 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300610 () Bool)

(declare-fun e!189807 () Bool)

(assert (=> b!300610 (= e!189807 false)))

(declare-fun lt!149550 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2332 0))(
  ( (MissingZero!2332 (index!11504 (_ BitVec 32))) (Found!2332 (index!11505 (_ BitVec 32))) (Intermediate!2332 (undefined!3144 Bool) (index!11506 (_ BitVec 32)) (x!29758 (_ BitVec 32))) (Undefined!2332) (MissingVacant!2332 (index!11507 (_ BitVec 32))) )
))
(declare-fun lt!149549 () SeekEntryResult!2332)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15178 (_ BitVec 32)) SeekEntryResult!2332)

(assert (=> b!300610 (= lt!149549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149550 k!2524 (array!15179 (store (arr!7183 a!3312) i!1256 k!2524) (size!7535 a!3312)) mask!3809))))

(declare-fun lt!149547 () SeekEntryResult!2332)

(assert (=> b!300610 (= lt!149547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149550 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300610 (= lt!149550 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300611 () Bool)

(declare-fun res!158503 () Bool)

(assert (=> b!300611 (=> (not res!158503) (not e!189808))))

(assert (=> b!300611 (= res!158503 (and (= (size!7535 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7535 a!3312))))))

(declare-fun b!300612 () Bool)

(declare-fun res!158500 () Bool)

(assert (=> b!300612 (=> (not res!158500) (not e!189807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15178 (_ BitVec 32)) Bool)

(assert (=> b!300612 (= res!158500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300613 () Bool)

(assert (=> b!300613 (= e!189808 e!189807)))

(declare-fun res!158504 () Bool)

(assert (=> b!300613 (=> (not res!158504) (not e!189807))))

(declare-fun lt!149548 () SeekEntryResult!2332)

(assert (=> b!300613 (= res!158504 (or (= lt!149548 (MissingZero!2332 i!1256)) (= lt!149548 (MissingVacant!2332 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15178 (_ BitVec 32)) SeekEntryResult!2332)

(assert (=> b!300613 (= lt!149548 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300614 () Bool)

(declare-fun res!158501 () Bool)

(assert (=> b!300614 (=> (not res!158501) (not e!189808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300614 (= res!158501 (validKeyInArray!0 k!2524))))

(assert (= (and start!29900 res!158502) b!300611))

(assert (= (and b!300611 res!158503) b!300614))

(assert (= (and b!300614 res!158501) b!300609))

(assert (= (and b!300609 res!158505) b!300613))

(assert (= (and b!300613 res!158504) b!300612))

(assert (= (and b!300612 res!158500) b!300610))

(declare-fun m!312589 () Bool)

(assert (=> b!300610 m!312589))

(declare-fun m!312591 () Bool)

(assert (=> b!300610 m!312591))

(declare-fun m!312593 () Bool)

(assert (=> b!300610 m!312593))

(declare-fun m!312595 () Bool)

(assert (=> b!300610 m!312595))

(declare-fun m!312597 () Bool)

(assert (=> b!300609 m!312597))

(declare-fun m!312599 () Bool)

(assert (=> b!300614 m!312599))

(declare-fun m!312601 () Bool)

(assert (=> start!29900 m!312601))

(declare-fun m!312603 () Bool)

(assert (=> start!29900 m!312603))

(declare-fun m!312605 () Bool)

(assert (=> b!300612 m!312605))

(declare-fun m!312607 () Bool)

(assert (=> b!300613 m!312607))

(push 1)

