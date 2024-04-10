; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28100 () Bool)

(assert start!28100)

(declare-fun b!287925 () Bool)

(declare-fun res!149691 () Bool)

(declare-fun e!182310 () Bool)

(assert (=> b!287925 (=> (not res!149691) (not e!182310))))

(declare-datatypes ((array!14459 0))(
  ( (array!14460 (arr!6858 (Array (_ BitVec 32) (_ BitVec 64))) (size!7210 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14459)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287925 (= res!149691 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287926 () Bool)

(declare-fun res!149694 () Bool)

(assert (=> b!287926 (=> (not res!149694) (not e!182310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287926 (= res!149694 (validKeyInArray!0 k0!2524))))

(declare-fun b!287927 () Bool)

(declare-fun e!182311 () Bool)

(assert (=> b!287927 (= e!182311 false)))

(declare-fun lt!141766 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2007 0))(
  ( (MissingZero!2007 (index!10198 (_ BitVec 32))) (Found!2007 (index!10199 (_ BitVec 32))) (Intermediate!2007 (undefined!2819 Bool) (index!10200 (_ BitVec 32)) (x!28414 (_ BitVec 32))) (Undefined!2007) (MissingVacant!2007 (index!10201 (_ BitVec 32))) )
))
(declare-fun lt!141763 () SeekEntryResult!2007)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14459 (_ BitVec 32)) SeekEntryResult!2007)

(assert (=> b!287927 (= lt!141763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141766 k0!2524 (array!14460 (store (arr!6858 a!3312) i!1256 k0!2524) (size!7210 a!3312)) mask!3809))))

(declare-fun lt!141765 () SeekEntryResult!2007)

(assert (=> b!287927 (= lt!141765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141766 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287927 (= lt!141766 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287928 () Bool)

(declare-fun res!149690 () Bool)

(assert (=> b!287928 (=> (not res!149690) (not e!182311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14459 (_ BitVec 32)) Bool)

(assert (=> b!287928 (= res!149690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287929 () Bool)

(declare-fun res!149693 () Bool)

(assert (=> b!287929 (=> (not res!149693) (not e!182310))))

(assert (=> b!287929 (= res!149693 (and (= (size!7210 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7210 a!3312))))))

(declare-fun res!149692 () Bool)

(assert (=> start!28100 (=> (not res!149692) (not e!182310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28100 (= res!149692 (validMask!0 mask!3809))))

(assert (=> start!28100 e!182310))

(assert (=> start!28100 true))

(declare-fun array_inv!4821 (array!14459) Bool)

(assert (=> start!28100 (array_inv!4821 a!3312)))

(declare-fun b!287930 () Bool)

(assert (=> b!287930 (= e!182310 e!182311)))

(declare-fun res!149689 () Bool)

(assert (=> b!287930 (=> (not res!149689) (not e!182311))))

(declare-fun lt!141764 () SeekEntryResult!2007)

(assert (=> b!287930 (= res!149689 (or (= lt!141764 (MissingZero!2007 i!1256)) (= lt!141764 (MissingVacant!2007 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14459 (_ BitVec 32)) SeekEntryResult!2007)

(assert (=> b!287930 (= lt!141764 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28100 res!149692) b!287929))

(assert (= (and b!287929 res!149693) b!287926))

(assert (= (and b!287926 res!149694) b!287925))

(assert (= (and b!287925 res!149691) b!287930))

(assert (= (and b!287930 res!149689) b!287928))

(assert (= (and b!287928 res!149690) b!287927))

(declare-fun m!302273 () Bool)

(assert (=> b!287930 m!302273))

(declare-fun m!302275 () Bool)

(assert (=> b!287926 m!302275))

(declare-fun m!302277 () Bool)

(assert (=> b!287927 m!302277))

(declare-fun m!302279 () Bool)

(assert (=> b!287927 m!302279))

(declare-fun m!302281 () Bool)

(assert (=> b!287927 m!302281))

(declare-fun m!302283 () Bool)

(assert (=> b!287927 m!302283))

(declare-fun m!302285 () Bool)

(assert (=> b!287928 m!302285))

(declare-fun m!302287 () Bool)

(assert (=> start!28100 m!302287))

(declare-fun m!302289 () Bool)

(assert (=> start!28100 m!302289))

(declare-fun m!302291 () Bool)

(assert (=> b!287925 m!302291))

(check-sat (not b!287930) (not b!287926) (not start!28100) (not b!287927) (not b!287928) (not b!287925))
(check-sat)
