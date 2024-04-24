; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28282 () Bool)

(assert start!28282)

(declare-fun b!289952 () Bool)

(declare-fun e!183519 () Bool)

(assert (=> b!289952 (= e!183519 false)))

(declare-datatypes ((SeekEntryResult!2042 0))(
  ( (MissingZero!2042 (index!10338 (_ BitVec 32))) (Found!2042 (index!10339 (_ BitVec 32))) (Intermediate!2042 (undefined!2854 Bool) (index!10340 (_ BitVec 32)) (x!28647 (_ BitVec 32))) (Undefined!2042) (MissingVacant!2042 (index!10341 (_ BitVec 32))) )
))
(declare-fun lt!143194 () SeekEntryResult!2042)

(declare-fun lt!143195 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14601 0))(
  ( (array!14602 (arr!6928 (Array (_ BitVec 32) (_ BitVec 64))) (size!7280 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14601)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14601 (_ BitVec 32)) SeekEntryResult!2042)

(assert (=> b!289952 (= lt!143194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143195 k0!2524 (array!14602 (store (arr!6928 a!3312) i!1256 k0!2524) (size!7280 a!3312)) mask!3809))))

(declare-fun lt!143193 () SeekEntryResult!2042)

(assert (=> b!289952 (= lt!143193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143195 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289952 (= lt!143195 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289953 () Bool)

(declare-fun e!183520 () Bool)

(assert (=> b!289953 (= e!183520 e!183519)))

(declare-fun res!151408 () Bool)

(assert (=> b!289953 (=> (not res!151408) (not e!183519))))

(declare-fun lt!143196 () SeekEntryResult!2042)

(assert (=> b!289953 (= res!151408 (or (= lt!143196 (MissingZero!2042 i!1256)) (= lt!143196 (MissingVacant!2042 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14601 (_ BitVec 32)) SeekEntryResult!2042)

(assert (=> b!289953 (= lt!143196 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!151409 () Bool)

(assert (=> start!28282 (=> (not res!151409) (not e!183520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28282 (= res!151409 (validMask!0 mask!3809))))

(assert (=> start!28282 e!183520))

(assert (=> start!28282 true))

(declare-fun array_inv!4878 (array!14601) Bool)

(assert (=> start!28282 (array_inv!4878 a!3312)))

(declare-fun b!289954 () Bool)

(declare-fun res!151407 () Bool)

(assert (=> b!289954 (=> (not res!151407) (not e!183520))))

(declare-fun arrayContainsKey!0 (array!14601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289954 (= res!151407 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289955 () Bool)

(declare-fun res!151410 () Bool)

(assert (=> b!289955 (=> (not res!151410) (not e!183520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289955 (= res!151410 (validKeyInArray!0 k0!2524))))

(declare-fun b!289956 () Bool)

(declare-fun res!151405 () Bool)

(assert (=> b!289956 (=> (not res!151405) (not e!183519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14601 (_ BitVec 32)) Bool)

(assert (=> b!289956 (= res!151405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289957 () Bool)

(declare-fun res!151406 () Bool)

(assert (=> b!289957 (=> (not res!151406) (not e!183520))))

(assert (=> b!289957 (= res!151406 (and (= (size!7280 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7280 a!3312))))))

(assert (= (and start!28282 res!151409) b!289957))

(assert (= (and b!289957 res!151406) b!289955))

(assert (= (and b!289955 res!151410) b!289954))

(assert (= (and b!289954 res!151407) b!289953))

(assert (= (and b!289953 res!151408) b!289956))

(assert (= (and b!289956 res!151405) b!289952))

(declare-fun m!304193 () Bool)

(assert (=> b!289956 m!304193))

(declare-fun m!304195 () Bool)

(assert (=> b!289952 m!304195))

(declare-fun m!304197 () Bool)

(assert (=> b!289952 m!304197))

(declare-fun m!304199 () Bool)

(assert (=> b!289952 m!304199))

(declare-fun m!304201 () Bool)

(assert (=> b!289952 m!304201))

(declare-fun m!304203 () Bool)

(assert (=> b!289954 m!304203))

(declare-fun m!304205 () Bool)

(assert (=> b!289955 m!304205))

(declare-fun m!304207 () Bool)

(assert (=> b!289953 m!304207))

(declare-fun m!304209 () Bool)

(assert (=> start!28282 m!304209))

(declare-fun m!304211 () Bool)

(assert (=> start!28282 m!304211))

(check-sat (not b!289955) (not b!289956) (not b!289954) (not b!289953) (not b!289952) (not start!28282))
(check-sat)
