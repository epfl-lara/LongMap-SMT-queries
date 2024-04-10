; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28328 () Bool)

(assert start!28328)

(declare-fun b!290257 () Bool)

(declare-fun e!183678 () Bool)

(declare-fun e!183676 () Bool)

(assert (=> b!290257 (= e!183678 e!183676)))

(declare-fun res!151743 () Bool)

(assert (=> b!290257 (=> (not res!151743) (not e!183676))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143372 () Bool)

(declare-datatypes ((SeekEntryResult!2097 0))(
  ( (MissingZero!2097 (index!10558 (_ BitVec 32))) (Found!2097 (index!10559 (_ BitVec 32))) (Intermediate!2097 (undefined!2909 Bool) (index!10560 (_ BitVec 32)) (x!28750 (_ BitVec 32))) (Undefined!2097) (MissingVacant!2097 (index!10561 (_ BitVec 32))) )
))
(declare-fun lt!143374 () SeekEntryResult!2097)

(assert (=> b!290257 (= res!151743 (and (not lt!143372) (= lt!143374 (MissingVacant!2097 i!1256))))))

(declare-fun lt!143377 () (_ BitVec 32))

(declare-datatypes ((array!14642 0))(
  ( (array!14643 (arr!6948 (Array (_ BitVec 32) (_ BitVec 64))) (size!7300 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14642)

(declare-fun lt!143376 () SeekEntryResult!2097)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14642 (_ BitVec 32)) SeekEntryResult!2097)

(assert (=> b!290257 (= lt!143376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143377 k0!2524 (array!14643 (store (arr!6948 a!3312) i!1256 k0!2524) (size!7300 a!3312)) mask!3809))))

(declare-fun lt!143375 () SeekEntryResult!2097)

(assert (=> b!290257 (= lt!143375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143377 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290257 (= lt!143377 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151736 () Bool)

(declare-fun e!183679 () Bool)

(assert (=> start!28328 (=> (not res!151736) (not e!183679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28328 (= res!151736 (validMask!0 mask!3809))))

(assert (=> start!28328 e!183679))

(assert (=> start!28328 true))

(declare-fun array_inv!4911 (array!14642) Bool)

(assert (=> start!28328 (array_inv!4911 a!3312)))

(declare-fun b!290258 () Bool)

(declare-fun res!151739 () Bool)

(assert (=> b!290258 (=> (not res!151739) (not e!183679))))

(declare-fun arrayContainsKey!0 (array!14642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290258 (= res!151739 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290259 () Bool)

(assert (=> b!290259 (= e!183679 e!183678)))

(declare-fun res!151737 () Bool)

(assert (=> b!290259 (=> (not res!151737) (not e!183678))))

(assert (=> b!290259 (= res!151737 (or lt!143372 (= lt!143374 (MissingVacant!2097 i!1256))))))

(assert (=> b!290259 (= lt!143372 (= lt!143374 (MissingZero!2097 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14642 (_ BitVec 32)) SeekEntryResult!2097)

(assert (=> b!290259 (= lt!143374 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290260 () Bool)

(declare-fun res!151741 () Bool)

(assert (=> b!290260 (=> (not res!151741) (not e!183679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290260 (= res!151741 (validKeyInArray!0 k0!2524))))

(declare-fun b!290261 () Bool)

(declare-fun e!183677 () Bool)

(assert (=> b!290261 (= e!183677 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(assert (=> b!290261 (= (index!10560 lt!143375) i!1256)))

(declare-fun b!290262 () Bool)

(assert (=> b!290262 (= e!183676 e!183677)))

(declare-fun res!151740 () Bool)

(assert (=> b!290262 (=> (not res!151740) (not e!183677))))

(declare-fun lt!143373 () Bool)

(assert (=> b!290262 (= res!151740 (and (or lt!143373 (not (undefined!2909 lt!143375))) (not lt!143373) (= (select (arr!6948 a!3312) (index!10560 lt!143375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290262 (= lt!143373 (not ((_ is Intermediate!2097) lt!143375)))))

(declare-fun b!290263 () Bool)

(declare-fun res!151742 () Bool)

(assert (=> b!290263 (=> (not res!151742) (not e!183679))))

(assert (=> b!290263 (= res!151742 (and (= (size!7300 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7300 a!3312))))))

(declare-fun b!290264 () Bool)

(declare-fun res!151738 () Bool)

(assert (=> b!290264 (=> (not res!151738) (not e!183678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14642 (_ BitVec 32)) Bool)

(assert (=> b!290264 (= res!151738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28328 res!151736) b!290263))

(assert (= (and b!290263 res!151742) b!290260))

(assert (= (and b!290260 res!151741) b!290258))

(assert (= (and b!290258 res!151739) b!290259))

(assert (= (and b!290259 res!151737) b!290264))

(assert (= (and b!290264 res!151738) b!290257))

(assert (= (and b!290257 res!151743) b!290262))

(assert (= (and b!290262 res!151740) b!290261))

(declare-fun m!304369 () Bool)

(assert (=> b!290262 m!304369))

(declare-fun m!304371 () Bool)

(assert (=> b!290257 m!304371))

(declare-fun m!304373 () Bool)

(assert (=> b!290257 m!304373))

(declare-fun m!304375 () Bool)

(assert (=> b!290257 m!304375))

(declare-fun m!304377 () Bool)

(assert (=> b!290257 m!304377))

(declare-fun m!304379 () Bool)

(assert (=> b!290260 m!304379))

(declare-fun m!304381 () Bool)

(assert (=> b!290259 m!304381))

(declare-fun m!304383 () Bool)

(assert (=> start!28328 m!304383))

(declare-fun m!304385 () Bool)

(assert (=> start!28328 m!304385))

(declare-fun m!304387 () Bool)

(assert (=> b!290258 m!304387))

(declare-fun m!304389 () Bool)

(assert (=> b!290264 m!304389))

(check-sat (not b!290264) (not b!290257) (not b!290260) (not start!28328) (not b!290258) (not b!290259))
(check-sat)
