; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28302 () Bool)

(assert start!28302)

(declare-fun b!290013 () Bool)

(declare-fun e!183551 () Bool)

(assert (=> b!290013 (= e!183551 false)))

(declare-fun lt!143209 () (_ BitVec 32))

(declare-datatypes ((array!14616 0))(
  ( (array!14617 (arr!6935 (Array (_ BitVec 32) (_ BitVec 64))) (size!7287 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14616)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2084 0))(
  ( (MissingZero!2084 (index!10506 (_ BitVec 32))) (Found!2084 (index!10507 (_ BitVec 32))) (Intermediate!2084 (undefined!2896 Bool) (index!10508 (_ BitVec 32)) (x!28705 (_ BitVec 32))) (Undefined!2084) (MissingVacant!2084 (index!10509 (_ BitVec 32))) )
))
(declare-fun lt!143207 () SeekEntryResult!2084)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14616 (_ BitVec 32)) SeekEntryResult!2084)

(assert (=> b!290013 (= lt!143207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143209 k!2524 (array!14617 (store (arr!6935 a!3312) i!1256 k!2524) (size!7287 a!3312)) mask!3809))))

(declare-fun lt!143206 () SeekEntryResult!2084)

(assert (=> b!290013 (= lt!143206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143209 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290013 (= lt!143209 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!151496 () Bool)

(declare-fun e!183549 () Bool)

(assert (=> start!28302 (=> (not res!151496) (not e!183549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28302 (= res!151496 (validMask!0 mask!3809))))

(assert (=> start!28302 e!183549))

(assert (=> start!28302 true))

(declare-fun array_inv!4898 (array!14616) Bool)

(assert (=> start!28302 (array_inv!4898 a!3312)))

(declare-fun b!290014 () Bool)

(declare-fun res!151497 () Bool)

(assert (=> b!290014 (=> (not res!151497) (not e!183549))))

(declare-fun arrayContainsKey!0 (array!14616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290014 (= res!151497 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290015 () Bool)

(assert (=> b!290015 (= e!183549 e!183551)))

(declare-fun res!151492 () Bool)

(assert (=> b!290015 (=> (not res!151492) (not e!183551))))

(declare-fun lt!143208 () SeekEntryResult!2084)

(assert (=> b!290015 (= res!151492 (or (= lt!143208 (MissingZero!2084 i!1256)) (= lt!143208 (MissingVacant!2084 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14616 (_ BitVec 32)) SeekEntryResult!2084)

(assert (=> b!290015 (= lt!143208 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290016 () Bool)

(declare-fun res!151493 () Bool)

(assert (=> b!290016 (=> (not res!151493) (not e!183551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14616 (_ BitVec 32)) Bool)

(assert (=> b!290016 (= res!151493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290017 () Bool)

(declare-fun res!151495 () Bool)

(assert (=> b!290017 (=> (not res!151495) (not e!183549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290017 (= res!151495 (validKeyInArray!0 k!2524))))

(declare-fun b!290018 () Bool)

(declare-fun res!151494 () Bool)

(assert (=> b!290018 (=> (not res!151494) (not e!183549))))

(assert (=> b!290018 (= res!151494 (and (= (size!7287 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7287 a!3312))))))

(assert (= (and start!28302 res!151496) b!290018))

(assert (= (and b!290018 res!151494) b!290017))

(assert (= (and b!290017 res!151495) b!290014))

(assert (= (and b!290014 res!151497) b!290015))

(assert (= (and b!290015 res!151492) b!290016))

(assert (= (and b!290016 res!151493) b!290013))

(declare-fun m!304107 () Bool)

(assert (=> b!290015 m!304107))

(declare-fun m!304109 () Bool)

(assert (=> b!290017 m!304109))

(declare-fun m!304111 () Bool)

(assert (=> b!290013 m!304111))

(declare-fun m!304113 () Bool)

(assert (=> b!290013 m!304113))

(declare-fun m!304115 () Bool)

(assert (=> b!290013 m!304115))

(declare-fun m!304117 () Bool)

(assert (=> b!290013 m!304117))

(declare-fun m!304119 () Bool)

(assert (=> start!28302 m!304119))

(declare-fun m!304121 () Bool)

(assert (=> start!28302 m!304121))

(declare-fun m!304123 () Bool)

(assert (=> b!290016 m!304123))

(declare-fun m!304125 () Bool)

(assert (=> b!290014 m!304125))

(push 1)

