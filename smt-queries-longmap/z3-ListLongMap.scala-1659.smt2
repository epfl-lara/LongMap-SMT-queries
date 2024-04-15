; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30774 () Bool)

(assert start!30774)

(declare-fun res!165496 () Bool)

(declare-fun e!192948 () Bool)

(assert (=> start!30774 (=> (not res!165496) (not e!192948))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30774 (= res!165496 (validMask!0 mask!3709))))

(assert (=> start!30774 e!192948))

(declare-datatypes ((array!15731 0))(
  ( (array!15732 (arr!7449 (Array (_ BitVec 32) (_ BitVec 64))) (size!7802 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15731)

(declare-fun array_inv!5421 (array!15731) Bool)

(assert (=> start!30774 (array_inv!5421 a!3293)))

(assert (=> start!30774 true))

(declare-fun b!308737 () Bool)

(declare-fun res!165502 () Bool)

(assert (=> b!308737 (=> (not res!165502) (not e!192948))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2588 0))(
  ( (MissingZero!2588 (index!12528 (_ BitVec 32))) (Found!2588 (index!12529 (_ BitVec 32))) (Intermediate!2588 (undefined!3400 Bool) (index!12530 (_ BitVec 32)) (x!30779 (_ BitVec 32))) (Undefined!2588) (MissingVacant!2588 (index!12531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15731 (_ BitVec 32)) SeekEntryResult!2588)

(assert (=> b!308737 (= res!165502 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2588 i!1240)))))

(declare-fun b!308738 () Bool)

(declare-fun res!165498 () Bool)

(assert (=> b!308738 (=> (not res!165498) (not e!192948))))

(declare-fun arrayContainsKey!0 (array!15731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308738 (= res!165498 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308739 () Bool)

(declare-fun e!192947 () Bool)

(declare-fun e!192950 () Bool)

(assert (=> b!308739 (= e!192947 e!192950)))

(declare-fun res!165501 () Bool)

(assert (=> b!308739 (=> (not res!165501) (not e!192950))))

(declare-fun lt!151259 () SeekEntryResult!2588)

(declare-fun lt!151258 () SeekEntryResult!2588)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308739 (= res!165501 (and (= lt!151259 lt!151258) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7449 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15731 (_ BitVec 32)) SeekEntryResult!2588)

(assert (=> b!308739 (= lt!151259 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308740 () Bool)

(declare-fun res!165504 () Bool)

(assert (=> b!308740 (=> (not res!165504) (not e!192947))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308740 (= res!165504 (and (= (select (arr!7449 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7802 a!3293))))))

(declare-fun b!308741 () Bool)

(declare-fun res!165500 () Bool)

(assert (=> b!308741 (=> (not res!165500) (not e!192948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308741 (= res!165500 (validKeyInArray!0 k0!2441))))

(declare-fun b!308742 () Bool)

(assert (=> b!308742 (= e!192948 e!192947)))

(declare-fun res!165497 () Bool)

(assert (=> b!308742 (=> (not res!165497) (not e!192947))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308742 (= res!165497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151258))))

(assert (=> b!308742 (= lt!151258 (Intermediate!2588 false resIndex!52 resX!52))))

(declare-fun b!308743 () Bool)

(assert (=> b!308743 (= e!192950 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308743 (= lt!151259 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308744 () Bool)

(declare-fun res!165503 () Bool)

(assert (=> b!308744 (=> (not res!165503) (not e!192948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15731 (_ BitVec 32)) Bool)

(assert (=> b!308744 (= res!165503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308745 () Bool)

(declare-fun res!165499 () Bool)

(assert (=> b!308745 (=> (not res!165499) (not e!192948))))

(assert (=> b!308745 (= res!165499 (and (= (size!7802 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7802 a!3293))))))

(assert (= (and start!30774 res!165496) b!308745))

(assert (= (and b!308745 res!165499) b!308741))

(assert (= (and b!308741 res!165500) b!308738))

(assert (= (and b!308738 res!165498) b!308737))

(assert (= (and b!308737 res!165502) b!308744))

(assert (= (and b!308744 res!165503) b!308742))

(assert (= (and b!308742 res!165497) b!308740))

(assert (= (and b!308740 res!165504) b!308739))

(assert (= (and b!308739 res!165501) b!308743))

(declare-fun m!318301 () Bool)

(assert (=> b!308737 m!318301))

(declare-fun m!318303 () Bool)

(assert (=> b!308742 m!318303))

(assert (=> b!308742 m!318303))

(declare-fun m!318305 () Bool)

(assert (=> b!308742 m!318305))

(declare-fun m!318307 () Bool)

(assert (=> b!308738 m!318307))

(declare-fun m!318309 () Bool)

(assert (=> b!308739 m!318309))

(declare-fun m!318311 () Bool)

(assert (=> b!308739 m!318311))

(declare-fun m!318313 () Bool)

(assert (=> b!308744 m!318313))

(declare-fun m!318315 () Bool)

(assert (=> b!308740 m!318315))

(declare-fun m!318317 () Bool)

(assert (=> b!308741 m!318317))

(declare-fun m!318319 () Bool)

(assert (=> start!30774 m!318319))

(declare-fun m!318321 () Bool)

(assert (=> start!30774 m!318321))

(declare-fun m!318323 () Bool)

(assert (=> b!308743 m!318323))

(assert (=> b!308743 m!318323))

(declare-fun m!318325 () Bool)

(assert (=> b!308743 m!318325))

(check-sat (not b!308739) (not b!308737) (not start!30774) (not b!308741) (not b!308742) (not b!308744) (not b!308738) (not b!308743))
(check-sat)
