; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28394 () Bool)

(assert start!28394)

(declare-fun b!290590 () Bool)

(declare-fun e!183875 () Bool)

(declare-fun e!183873 () Bool)

(assert (=> b!290590 (= e!183875 e!183873)))

(declare-fun res!151986 () Bool)

(assert (=> b!290590 (=> (not res!151986) (not e!183873))))

(declare-fun lt!143485 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2102 0))(
  ( (MissingZero!2102 (index!10578 (_ BitVec 32))) (Found!2102 (index!10579 (_ BitVec 32))) (Intermediate!2102 (undefined!2914 Bool) (index!10580 (_ BitVec 32)) (x!28792 (_ BitVec 32))) (Undefined!2102) (MissingVacant!2102 (index!10581 (_ BitVec 32))) )
))
(declare-fun lt!143487 () SeekEntryResult!2102)

(assert (=> b!290590 (= res!151986 (or lt!143485 (= lt!143487 (MissingVacant!2102 i!1256))))))

(assert (=> b!290590 (= lt!143485 (= lt!143487 (MissingZero!2102 i!1256)))))

(declare-datatypes ((array!14656 0))(
  ( (array!14657 (arr!6954 (Array (_ BitVec 32) (_ BitVec 64))) (size!7307 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14656)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14656 (_ BitVec 32)) SeekEntryResult!2102)

(assert (=> b!290590 (= lt!143487 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290591 () Bool)

(declare-fun res!151985 () Bool)

(assert (=> b!290591 (=> (not res!151985) (not e!183875))))

(declare-fun arrayContainsKey!0 (array!14656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290591 (= res!151985 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290592 () Bool)

(declare-fun res!151984 () Bool)

(assert (=> b!290592 (=> (not res!151984) (not e!183875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290592 (= res!151984 (validKeyInArray!0 k0!2524))))

(declare-fun b!290593 () Bool)

(declare-fun e!183874 () Bool)

(declare-fun e!183872 () Bool)

(assert (=> b!290593 (= e!183874 e!183872)))

(declare-fun res!151983 () Bool)

(assert (=> b!290593 (=> (not res!151983) (not e!183872))))

(declare-fun lt!143489 () Bool)

(declare-fun lt!143488 () SeekEntryResult!2102)

(assert (=> b!290593 (= res!151983 (and (or lt!143489 (not (undefined!2914 lt!143488))) (not lt!143489) (= (select (arr!6954 a!3312) (index!10580 lt!143488)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290593 (= lt!143489 (not ((_ is Intermediate!2102) lt!143488)))))

(declare-fun b!290594 () Bool)

(assert (=> b!290594 (= e!183872 (not true))))

(assert (=> b!290594 (= (index!10580 lt!143488) i!1256)))

(declare-fun res!151981 () Bool)

(assert (=> start!28394 (=> (not res!151981) (not e!183875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28394 (= res!151981 (validMask!0 mask!3809))))

(assert (=> start!28394 e!183875))

(assert (=> start!28394 true))

(declare-fun array_inv!4926 (array!14656) Bool)

(assert (=> start!28394 (array_inv!4926 a!3312)))

(declare-fun b!290595 () Bool)

(assert (=> b!290595 (= e!183873 e!183874)))

(declare-fun res!151987 () Bool)

(assert (=> b!290595 (=> (not res!151987) (not e!183874))))

(assert (=> b!290595 (= res!151987 (and (not lt!143485) (= lt!143487 (MissingVacant!2102 i!1256))))))

(declare-fun lt!143490 () (_ BitVec 32))

(declare-fun lt!143486 () SeekEntryResult!2102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14656 (_ BitVec 32)) SeekEntryResult!2102)

(assert (=> b!290595 (= lt!143486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143490 k0!2524 (array!14657 (store (arr!6954 a!3312) i!1256 k0!2524) (size!7307 a!3312)) mask!3809))))

(assert (=> b!290595 (= lt!143488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143490 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290595 (= lt!143490 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290596 () Bool)

(declare-fun res!151980 () Bool)

(assert (=> b!290596 (=> (not res!151980) (not e!183875))))

(assert (=> b!290596 (= res!151980 (and (= (size!7307 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7307 a!3312))))))

(declare-fun b!290597 () Bool)

(declare-fun res!151982 () Bool)

(assert (=> b!290597 (=> (not res!151982) (not e!183873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14656 (_ BitVec 32)) Bool)

(assert (=> b!290597 (= res!151982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28394 res!151981) b!290596))

(assert (= (and b!290596 res!151980) b!290592))

(assert (= (and b!290592 res!151984) b!290591))

(assert (= (and b!290591 res!151985) b!290590))

(assert (= (and b!290590 res!151986) b!290597))

(assert (= (and b!290597 res!151982) b!290595))

(assert (= (and b!290595 res!151987) b!290593))

(assert (= (and b!290593 res!151983) b!290594))

(declare-fun m!304139 () Bool)

(assert (=> b!290590 m!304139))

(declare-fun m!304141 () Bool)

(assert (=> b!290595 m!304141))

(declare-fun m!304143 () Bool)

(assert (=> b!290595 m!304143))

(declare-fun m!304145 () Bool)

(assert (=> b!290595 m!304145))

(declare-fun m!304147 () Bool)

(assert (=> b!290595 m!304147))

(declare-fun m!304149 () Bool)

(assert (=> b!290592 m!304149))

(declare-fun m!304151 () Bool)

(assert (=> start!28394 m!304151))

(declare-fun m!304153 () Bool)

(assert (=> start!28394 m!304153))

(declare-fun m!304155 () Bool)

(assert (=> b!290591 m!304155))

(declare-fun m!304157 () Bool)

(assert (=> b!290593 m!304157))

(declare-fun m!304159 () Bool)

(assert (=> b!290597 m!304159))

(check-sat (not b!290592) (not b!290595) (not b!290590) (not b!290597) (not b!290591) (not start!28394))
(check-sat)
