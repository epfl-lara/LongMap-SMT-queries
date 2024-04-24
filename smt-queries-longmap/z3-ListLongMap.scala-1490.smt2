; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28318 () Bool)

(assert start!28318)

(declare-fun b!290280 () Bool)

(declare-fun e!183685 () Bool)

(declare-fun e!183687 () Bool)

(assert (=> b!290280 (= e!183685 e!183687)))

(declare-fun res!151735 () Bool)

(assert (=> b!290280 (=> (not res!151735) (not e!183687))))

(declare-fun lt!143416 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2060 0))(
  ( (MissingZero!2060 (index!10410 (_ BitVec 32))) (Found!2060 (index!10411 (_ BitVec 32))) (Intermediate!2060 (undefined!2872 Bool) (index!10412 (_ BitVec 32)) (x!28713 (_ BitVec 32))) (Undefined!2060) (MissingVacant!2060 (index!10413 (_ BitVec 32))) )
))
(declare-fun lt!143414 () SeekEntryResult!2060)

(assert (=> b!290280 (= res!151735 (or lt!143416 (= lt!143414 (MissingVacant!2060 i!1256))))))

(assert (=> b!290280 (= lt!143416 (= lt!143414 (MissingZero!2060 i!1256)))))

(declare-datatypes ((array!14637 0))(
  ( (array!14638 (arr!6946 (Array (_ BitVec 32) (_ BitVec 64))) (size!7298 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14637)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14637 (_ BitVec 32)) SeekEntryResult!2060)

(assert (=> b!290280 (= lt!143414 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290281 () Bool)

(declare-fun res!151737 () Bool)

(assert (=> b!290281 (=> (not res!151737) (not e!183685))))

(assert (=> b!290281 (= res!151737 (and (= (size!7298 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7298 a!3312))))))

(declare-fun b!290282 () Bool)

(declare-fun res!151733 () Bool)

(assert (=> b!290282 (=> (not res!151733) (not e!183685))))

(declare-fun arrayContainsKey!0 (array!14637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290282 (= res!151733 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290283 () Bool)

(declare-fun e!183686 () Bool)

(assert (=> b!290283 (= e!183687 e!183686)))

(declare-fun res!151736 () Bool)

(assert (=> b!290283 (=> (not res!151736) (not e!183686))))

(assert (=> b!290283 (= res!151736 (and (not lt!143416) (= lt!143414 (MissingVacant!2060 i!1256))))))

(declare-fun lt!143415 () (_ BitVec 32))

(declare-fun lt!143418 () SeekEntryResult!2060)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14637 (_ BitVec 32)) SeekEntryResult!2060)

(assert (=> b!290283 (= lt!143418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143415 k0!2524 (array!14638 (store (arr!6946 a!3312) i!1256 k0!2524) (size!7298 a!3312)) mask!3809))))

(declare-fun lt!143413 () SeekEntryResult!2060)

(assert (=> b!290283 (= lt!143413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143415 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290283 (= lt!143415 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151738 () Bool)

(assert (=> start!28318 (=> (not res!151738) (not e!183685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28318 (= res!151738 (validMask!0 mask!3809))))

(assert (=> start!28318 e!183685))

(assert (=> start!28318 true))

(declare-fun array_inv!4896 (array!14637) Bool)

(assert (=> start!28318 (array_inv!4896 a!3312)))

(declare-fun b!290284 () Bool)

(declare-fun res!151734 () Bool)

(assert (=> b!290284 (=> (not res!151734) (not e!183687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14637 (_ BitVec 32)) Bool)

(assert (=> b!290284 (= res!151734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290285 () Bool)

(declare-fun e!183688 () Bool)

(assert (=> b!290285 (= e!183688 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(assert (=> b!290285 (= (index!10412 lt!143413) i!1256)))

(declare-fun b!290286 () Bool)

(declare-fun res!151739 () Bool)

(assert (=> b!290286 (=> (not res!151739) (not e!183685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290286 (= res!151739 (validKeyInArray!0 k0!2524))))

(declare-fun b!290287 () Bool)

(assert (=> b!290287 (= e!183686 e!183688)))

(declare-fun res!151740 () Bool)

(assert (=> b!290287 (=> (not res!151740) (not e!183688))))

(declare-fun lt!143417 () Bool)

(assert (=> b!290287 (= res!151740 (and (or lt!143417 (not (undefined!2872 lt!143413))) (not lt!143417) (= (select (arr!6946 a!3312) (index!10412 lt!143413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290287 (= lt!143417 (not ((_ is Intermediate!2060) lt!143413)))))

(assert (= (and start!28318 res!151738) b!290281))

(assert (= (and b!290281 res!151737) b!290286))

(assert (= (and b!290286 res!151739) b!290282))

(assert (= (and b!290282 res!151733) b!290280))

(assert (= (and b!290280 res!151735) b!290284))

(assert (= (and b!290284 res!151734) b!290283))

(assert (= (and b!290283 res!151736) b!290287))

(assert (= (and b!290287 res!151740) b!290285))

(declare-fun m!304553 () Bool)

(assert (=> b!290282 m!304553))

(declare-fun m!304555 () Bool)

(assert (=> b!290287 m!304555))

(declare-fun m!304557 () Bool)

(assert (=> b!290280 m!304557))

(declare-fun m!304559 () Bool)

(assert (=> b!290283 m!304559))

(declare-fun m!304561 () Bool)

(assert (=> b!290283 m!304561))

(declare-fun m!304563 () Bool)

(assert (=> b!290283 m!304563))

(declare-fun m!304565 () Bool)

(assert (=> b!290283 m!304565))

(declare-fun m!304567 () Bool)

(assert (=> b!290286 m!304567))

(declare-fun m!304569 () Bool)

(assert (=> start!28318 m!304569))

(declare-fun m!304571 () Bool)

(assert (=> start!28318 m!304571))

(declare-fun m!304573 () Bool)

(assert (=> b!290284 m!304573))

(check-sat (not start!28318) (not b!290284) (not b!290280) (not b!290283) (not b!290286) (not b!290282))
(check-sat)
