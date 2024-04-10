; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28310 () Bool)

(assert start!28310)

(declare-fun b!290085 () Bool)

(declare-fun res!151569 () Bool)

(declare-fun e!183587 () Bool)

(assert (=> b!290085 (=> (not res!151569) (not e!183587))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14624 0))(
  ( (array!14625 (arr!6939 (Array (_ BitVec 32) (_ BitVec 64))) (size!7291 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14624)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290085 (= res!151569 (and (= (size!7291 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7291 a!3312))))))

(declare-fun b!290086 () Bool)

(declare-fun res!151564 () Bool)

(assert (=> b!290086 (=> (not res!151564) (not e!183587))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290086 (= res!151564 (validKeyInArray!0 k0!2524))))

(declare-fun b!290087 () Bool)

(declare-fun e!183585 () Bool)

(assert (=> b!290087 (= e!183585 false)))

(declare-fun lt!143256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2088 0))(
  ( (MissingZero!2088 (index!10522 (_ BitVec 32))) (Found!2088 (index!10523 (_ BitVec 32))) (Intermediate!2088 (undefined!2900 Bool) (index!10524 (_ BitVec 32)) (x!28717 (_ BitVec 32))) (Undefined!2088) (MissingVacant!2088 (index!10525 (_ BitVec 32))) )
))
(declare-fun lt!143255 () SeekEntryResult!2088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14624 (_ BitVec 32)) SeekEntryResult!2088)

(assert (=> b!290087 (= lt!143255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143256 k0!2524 (array!14625 (store (arr!6939 a!3312) i!1256 k0!2524) (size!7291 a!3312)) mask!3809))))

(declare-fun lt!143257 () SeekEntryResult!2088)

(assert (=> b!290087 (= lt!143257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143256 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290087 (= lt!143256 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290088 () Bool)

(declare-fun res!151568 () Bool)

(assert (=> b!290088 (=> (not res!151568) (not e!183587))))

(declare-fun arrayContainsKey!0 (array!14624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290088 (= res!151568 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151565 () Bool)

(assert (=> start!28310 (=> (not res!151565) (not e!183587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28310 (= res!151565 (validMask!0 mask!3809))))

(assert (=> start!28310 e!183587))

(assert (=> start!28310 true))

(declare-fun array_inv!4902 (array!14624) Bool)

(assert (=> start!28310 (array_inv!4902 a!3312)))

(declare-fun b!290089 () Bool)

(assert (=> b!290089 (= e!183587 e!183585)))

(declare-fun res!151566 () Bool)

(assert (=> b!290089 (=> (not res!151566) (not e!183585))))

(declare-fun lt!143254 () SeekEntryResult!2088)

(assert (=> b!290089 (= res!151566 (or (= lt!143254 (MissingZero!2088 i!1256)) (= lt!143254 (MissingVacant!2088 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14624 (_ BitVec 32)) SeekEntryResult!2088)

(assert (=> b!290089 (= lt!143254 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290090 () Bool)

(declare-fun res!151567 () Bool)

(assert (=> b!290090 (=> (not res!151567) (not e!183585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14624 (_ BitVec 32)) Bool)

(assert (=> b!290090 (= res!151567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28310 res!151565) b!290085))

(assert (= (and b!290085 res!151569) b!290086))

(assert (= (and b!290086 res!151564) b!290088))

(assert (= (and b!290088 res!151568) b!290089))

(assert (= (and b!290089 res!151566) b!290090))

(assert (= (and b!290090 res!151567) b!290087))

(declare-fun m!304187 () Bool)

(assert (=> b!290090 m!304187))

(declare-fun m!304189 () Bool)

(assert (=> b!290086 m!304189))

(declare-fun m!304191 () Bool)

(assert (=> b!290088 m!304191))

(declare-fun m!304193 () Bool)

(assert (=> b!290089 m!304193))

(declare-fun m!304195 () Bool)

(assert (=> start!28310 m!304195))

(declare-fun m!304197 () Bool)

(assert (=> start!28310 m!304197))

(declare-fun m!304199 () Bool)

(assert (=> b!290087 m!304199))

(declare-fun m!304201 () Bool)

(assert (=> b!290087 m!304201))

(declare-fun m!304203 () Bool)

(assert (=> b!290087 m!304203))

(declare-fun m!304205 () Bool)

(assert (=> b!290087 m!304205))

(check-sat (not b!290088) (not b!290090) (not b!290086) (not b!290087) (not b!290089) (not start!28310))
(check-sat)
