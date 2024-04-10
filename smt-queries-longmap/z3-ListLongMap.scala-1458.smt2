; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28088 () Bool)

(assert start!28088)

(declare-fun res!149581 () Bool)

(declare-fun e!182256 () Bool)

(assert (=> start!28088 (=> (not res!149581) (not e!182256))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28088 (= res!149581 (validMask!0 mask!3809))))

(assert (=> start!28088 e!182256))

(assert (=> start!28088 true))

(declare-datatypes ((array!14447 0))(
  ( (array!14448 (arr!6852 (Array (_ BitVec 32) (_ BitVec 64))) (size!7204 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14447)

(declare-fun array_inv!4815 (array!14447) Bool)

(assert (=> start!28088 (array_inv!4815 a!3312)))

(declare-fun b!287817 () Bool)

(declare-fun e!182258 () Bool)

(assert (=> b!287817 (= e!182256 e!182258)))

(declare-fun res!149582 () Bool)

(assert (=> b!287817 (=> (not res!149582) (not e!182258))))

(declare-datatypes ((SeekEntryResult!2001 0))(
  ( (MissingZero!2001 (index!10174 (_ BitVec 32))) (Found!2001 (index!10175 (_ BitVec 32))) (Intermediate!2001 (undefined!2813 Bool) (index!10176 (_ BitVec 32)) (x!28392 (_ BitVec 32))) (Undefined!2001) (MissingVacant!2001 (index!10177 (_ BitVec 32))) )
))
(declare-fun lt!141691 () SeekEntryResult!2001)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287817 (= res!149582 (or (= lt!141691 (MissingZero!2001 i!1256)) (= lt!141691 (MissingVacant!2001 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14447 (_ BitVec 32)) SeekEntryResult!2001)

(assert (=> b!287817 (= lt!141691 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287818 () Bool)

(declare-fun res!149585 () Bool)

(assert (=> b!287818 (=> (not res!149585) (not e!182256))))

(declare-fun arrayContainsKey!0 (array!14447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287818 (= res!149585 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287819 () Bool)

(declare-fun res!149584 () Bool)

(assert (=> b!287819 (=> (not res!149584) (not e!182256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287819 (= res!149584 (validKeyInArray!0 k0!2524))))

(declare-fun b!287820 () Bool)

(declare-fun res!149583 () Bool)

(assert (=> b!287820 (=> (not res!149583) (not e!182258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14447 (_ BitVec 32)) Bool)

(assert (=> b!287820 (= res!149583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287821 () Bool)

(declare-fun res!149586 () Bool)

(assert (=> b!287821 (=> (not res!149586) (not e!182256))))

(assert (=> b!287821 (= res!149586 (and (= (size!7204 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7204 a!3312))))))

(declare-fun b!287822 () Bool)

(assert (=> b!287822 (= e!182258 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141692 () SeekEntryResult!2001)

(declare-fun lt!141694 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14447 (_ BitVec 32)) SeekEntryResult!2001)

(assert (=> b!287822 (= lt!141692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141694 k0!2524 (array!14448 (store (arr!6852 a!3312) i!1256 k0!2524) (size!7204 a!3312)) mask!3809))))

(declare-fun lt!141693 () SeekEntryResult!2001)

(assert (=> b!287822 (= lt!141693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141694 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287822 (= lt!141694 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28088 res!149581) b!287821))

(assert (= (and b!287821 res!149586) b!287819))

(assert (= (and b!287819 res!149584) b!287818))

(assert (= (and b!287818 res!149585) b!287817))

(assert (= (and b!287817 res!149582) b!287820))

(assert (= (and b!287820 res!149583) b!287822))

(declare-fun m!302153 () Bool)

(assert (=> start!28088 m!302153))

(declare-fun m!302155 () Bool)

(assert (=> start!28088 m!302155))

(declare-fun m!302157 () Bool)

(assert (=> b!287817 m!302157))

(declare-fun m!302159 () Bool)

(assert (=> b!287818 m!302159))

(declare-fun m!302161 () Bool)

(assert (=> b!287819 m!302161))

(declare-fun m!302163 () Bool)

(assert (=> b!287820 m!302163))

(declare-fun m!302165 () Bool)

(assert (=> b!287822 m!302165))

(declare-fun m!302167 () Bool)

(assert (=> b!287822 m!302167))

(declare-fun m!302169 () Bool)

(assert (=> b!287822 m!302169))

(declare-fun m!302171 () Bool)

(assert (=> b!287822 m!302171))

(check-sat (not b!287819) (not b!287820) (not b!287822) (not start!28088) (not b!287818) (not b!287817))
(check-sat)
