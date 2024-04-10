; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30622 () Bool)

(assert start!30622)

(declare-fun b!307248 () Bool)

(declare-datatypes ((array!15626 0))(
  ( (array!15627 (arr!7398 (Array (_ BitVec 32) (_ BitVec 64))) (size!7750 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15626)

(declare-fun e!192450 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307248 (= e!192450 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7398 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307249 () Bool)

(declare-fun res!164009 () Bool)

(declare-fun e!192449 () Bool)

(assert (=> b!307249 (=> (not res!164009) (not e!192449))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307249 (= res!164009 (and (= (size!7750 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7750 a!3293))))))

(declare-fun res!164004 () Bool)

(assert (=> start!30622 (=> (not res!164004) (not e!192449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30622 (= res!164004 (validMask!0 mask!3709))))

(assert (=> start!30622 e!192449))

(declare-fun array_inv!5361 (array!15626) Bool)

(assert (=> start!30622 (array_inv!5361 a!3293)))

(assert (=> start!30622 true))

(declare-fun b!307250 () Bool)

(declare-fun res!164006 () Bool)

(assert (=> b!307250 (=> (not res!164006) (not e!192449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15626 (_ BitVec 32)) Bool)

(assert (=> b!307250 (= res!164006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307251 () Bool)

(declare-fun res!164003 () Bool)

(assert (=> b!307251 (=> (not res!164003) (not e!192449))))

(declare-datatypes ((SeekEntryResult!2538 0))(
  ( (MissingZero!2538 (index!12328 (_ BitVec 32))) (Found!2538 (index!12329 (_ BitVec 32))) (Intermediate!2538 (undefined!3350 Bool) (index!12330 (_ BitVec 32)) (x!30573 (_ BitVec 32))) (Undefined!2538) (MissingVacant!2538 (index!12331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15626 (_ BitVec 32)) SeekEntryResult!2538)

(assert (=> b!307251 (= res!164003 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2538 i!1240)))))

(declare-fun b!307252 () Bool)

(declare-fun res!164002 () Bool)

(assert (=> b!307252 (=> (not res!164002) (not e!192449))))

(declare-fun arrayContainsKey!0 (array!15626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307252 (= res!164002 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307253 () Bool)

(assert (=> b!307253 (= e!192449 e!192450)))

(declare-fun res!164007 () Bool)

(assert (=> b!307253 (=> (not res!164007) (not e!192450))))

(declare-fun lt!151110 () SeekEntryResult!2538)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15626 (_ BitVec 32)) SeekEntryResult!2538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307253 (= res!164007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151110))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307253 (= lt!151110 (Intermediate!2538 false resIndex!52 resX!52))))

(declare-fun b!307254 () Bool)

(declare-fun res!164010 () Bool)

(assert (=> b!307254 (=> (not res!164010) (not e!192450))))

(assert (=> b!307254 (= res!164010 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151110))))

(declare-fun b!307255 () Bool)

(declare-fun res!164005 () Bool)

(assert (=> b!307255 (=> (not res!164005) (not e!192449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307255 (= res!164005 (validKeyInArray!0 k0!2441))))

(declare-fun b!307256 () Bool)

(declare-fun res!164008 () Bool)

(assert (=> b!307256 (=> (not res!164008) (not e!192450))))

(assert (=> b!307256 (= res!164008 (and (= (select (arr!7398 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7750 a!3293))))))

(assert (= (and start!30622 res!164004) b!307249))

(assert (= (and b!307249 res!164009) b!307255))

(assert (= (and b!307255 res!164005) b!307252))

(assert (= (and b!307252 res!164002) b!307251))

(assert (= (and b!307251 res!164003) b!307250))

(assert (= (and b!307250 res!164006) b!307253))

(assert (= (and b!307253 res!164007) b!307256))

(assert (= (and b!307256 res!164008) b!307254))

(assert (= (and b!307254 res!164010) b!307248))

(declare-fun m!317589 () Bool)

(assert (=> b!307256 m!317589))

(declare-fun m!317591 () Bool)

(assert (=> b!307253 m!317591))

(assert (=> b!307253 m!317591))

(declare-fun m!317593 () Bool)

(assert (=> b!307253 m!317593))

(declare-fun m!317595 () Bool)

(assert (=> b!307252 m!317595))

(declare-fun m!317597 () Bool)

(assert (=> start!30622 m!317597))

(declare-fun m!317599 () Bool)

(assert (=> start!30622 m!317599))

(declare-fun m!317601 () Bool)

(assert (=> b!307254 m!317601))

(declare-fun m!317603 () Bool)

(assert (=> b!307248 m!317603))

(declare-fun m!317605 () Bool)

(assert (=> b!307250 m!317605))

(declare-fun m!317607 () Bool)

(assert (=> b!307255 m!317607))

(declare-fun m!317609 () Bool)

(assert (=> b!307251 m!317609))

(check-sat (not b!307251) (not start!30622) (not b!307253) (not b!307252) (not b!307254) (not b!307250) (not b!307255))
(check-sat)
