; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32672 () Bool)

(assert start!32672)

(declare-fun res!179619 () Bool)

(declare-fun e!201038 () Bool)

(assert (=> start!32672 (=> (not res!179619) (not e!201038))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32672 (= res!179619 (validMask!0 mask!3777))))

(assert (=> start!32672 e!201038))

(declare-datatypes ((array!16722 0))(
  ( (array!16723 (arr!7915 (Array (_ BitVec 32) (_ BitVec 64))) (size!8267 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16722)

(declare-fun array_inv!5865 (array!16722) Bool)

(assert (=> start!32672 (array_inv!5865 a!3305)))

(assert (=> start!32672 true))

(declare-fun b!326538 () Bool)

(declare-fun res!179623 () Bool)

(assert (=> b!326538 (=> (not res!179623) (not e!201038))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3011 0))(
  ( (MissingZero!3011 (index!14220 (_ BitVec 32))) (Found!3011 (index!14221 (_ BitVec 32))) (Intermediate!3011 (undefined!3823 Bool) (index!14222 (_ BitVec 32)) (x!32574 (_ BitVec 32))) (Undefined!3011) (MissingVacant!3011 (index!14223 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16722 (_ BitVec 32)) SeekEntryResult!3011)

(assert (=> b!326538 (= res!179623 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3011 i!1250)))))

(declare-fun b!326539 () Bool)

(declare-fun e!201037 () Bool)

(assert (=> b!326539 (= e!201037 false)))

(declare-datatypes ((Unit!10090 0))(
  ( (Unit!10091) )
))
(declare-fun lt!157373 () Unit!10090)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16722 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10090)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326539 (= lt!157373 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326540 () Bool)

(declare-fun res!179625 () Bool)

(assert (=> b!326540 (=> (not res!179625) (not e!201038))))

(declare-fun arrayContainsKey!0 (array!16722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326540 (= res!179625 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326541 () Bool)

(declare-fun res!179626 () Bool)

(assert (=> b!326541 (=> (not res!179626) (not e!201037))))

(assert (=> b!326541 (= res!179626 (and (= (select (arr!7915 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8267 a!3305))))))

(declare-fun b!326542 () Bool)

(declare-fun res!179622 () Bool)

(assert (=> b!326542 (=> (not res!179622) (not e!201038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326542 (= res!179622 (validKeyInArray!0 k0!2497))))

(declare-fun b!326543 () Bool)

(declare-fun res!179628 () Bool)

(assert (=> b!326543 (=> (not res!179628) (not e!201038))))

(assert (=> b!326543 (= res!179628 (and (= (size!8267 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8267 a!3305))))))

(declare-fun b!326544 () Bool)

(declare-fun res!179627 () Bool)

(assert (=> b!326544 (=> (not res!179627) (not e!201037))))

(declare-fun lt!157374 () SeekEntryResult!3011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16722 (_ BitVec 32)) SeekEntryResult!3011)

(assert (=> b!326544 (= res!179627 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157374))))

(declare-fun b!326545 () Bool)

(declare-fun res!179624 () Bool)

(assert (=> b!326545 (=> (not res!179624) (not e!201037))))

(assert (=> b!326545 (= res!179624 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7915 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326546 () Bool)

(declare-fun res!179621 () Bool)

(assert (=> b!326546 (=> (not res!179621) (not e!201038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16722 (_ BitVec 32)) Bool)

(assert (=> b!326546 (= res!179621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326547 () Bool)

(assert (=> b!326547 (= e!201038 e!201037)))

(declare-fun res!179620 () Bool)

(assert (=> b!326547 (=> (not res!179620) (not e!201037))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326547 (= res!179620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157374))))

(assert (=> b!326547 (= lt!157374 (Intermediate!3011 false resIndex!58 resX!58))))

(assert (= (and start!32672 res!179619) b!326543))

(assert (= (and b!326543 res!179628) b!326542))

(assert (= (and b!326542 res!179622) b!326540))

(assert (= (and b!326540 res!179625) b!326538))

(assert (= (and b!326538 res!179623) b!326546))

(assert (= (and b!326546 res!179621) b!326547))

(assert (= (and b!326547 res!179620) b!326541))

(assert (= (and b!326541 res!179626) b!326544))

(assert (= (and b!326544 res!179627) b!326545))

(assert (= (and b!326545 res!179624) b!326539))

(declare-fun m!333313 () Bool)

(assert (=> b!326546 m!333313))

(declare-fun m!333315 () Bool)

(assert (=> b!326542 m!333315))

(declare-fun m!333317 () Bool)

(assert (=> start!32672 m!333317))

(declare-fun m!333319 () Bool)

(assert (=> start!32672 m!333319))

(declare-fun m!333321 () Bool)

(assert (=> b!326538 m!333321))

(declare-fun m!333323 () Bool)

(assert (=> b!326545 m!333323))

(declare-fun m!333325 () Bool)

(assert (=> b!326547 m!333325))

(assert (=> b!326547 m!333325))

(declare-fun m!333327 () Bool)

(assert (=> b!326547 m!333327))

(declare-fun m!333329 () Bool)

(assert (=> b!326541 m!333329))

(declare-fun m!333331 () Bool)

(assert (=> b!326544 m!333331))

(declare-fun m!333333 () Bool)

(assert (=> b!326539 m!333333))

(assert (=> b!326539 m!333333))

(declare-fun m!333335 () Bool)

(assert (=> b!326539 m!333335))

(declare-fun m!333337 () Bool)

(assert (=> b!326540 m!333337))

(check-sat (not b!326540) (not b!326544) (not b!326546) (not b!326539) (not b!326542) (not b!326547) (not b!326538) (not start!32672))
(check-sat)
