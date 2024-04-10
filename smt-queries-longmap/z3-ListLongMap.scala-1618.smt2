; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30436 () Bool)

(assert start!30436)

(declare-fun b!304701 () Bool)

(declare-fun res!162047 () Bool)

(declare-fun e!191454 () Bool)

(assert (=> b!304701 (=> (not res!162047) (not e!191454))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304701 (= res!162047 (validKeyInArray!0 k0!2441))))

(declare-fun res!162049 () Bool)

(assert (=> start!30436 (=> (not res!162049) (not e!191454))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30436 (= res!162049 (validMask!0 mask!3709))))

(assert (=> start!30436 e!191454))

(declare-datatypes ((array!15491 0))(
  ( (array!15492 (arr!7332 (Array (_ BitVec 32) (_ BitVec 64))) (size!7684 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15491)

(declare-fun array_inv!5295 (array!15491) Bool)

(assert (=> start!30436 (array_inv!5295 a!3293)))

(assert (=> start!30436 true))

(declare-fun b!304702 () Bool)

(declare-fun e!191455 () Bool)

(assert (=> b!304702 (= e!191454 e!191455)))

(declare-fun res!162050 () Bool)

(assert (=> b!304702 (=> (not res!162050) (not e!191455))))

(declare-datatypes ((SeekEntryResult!2472 0))(
  ( (MissingZero!2472 (index!12064 (_ BitVec 32))) (Found!2472 (index!12065 (_ BitVec 32))) (Intermediate!2472 (undefined!3284 Bool) (index!12066 (_ BitVec 32)) (x!30322 (_ BitVec 32))) (Undefined!2472) (MissingVacant!2472 (index!12067 (_ BitVec 32))) )
))
(declare-fun lt!150509 () SeekEntryResult!2472)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15491 (_ BitVec 32)) SeekEntryResult!2472)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304702 (= res!162050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150509))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304702 (= lt!150509 (Intermediate!2472 false resIndex!52 resX!52))))

(declare-fun b!304703 () Bool)

(declare-fun e!191453 () Bool)

(assert (=> b!304703 (= e!191455 e!191453)))

(declare-fun res!162054 () Bool)

(assert (=> b!304703 (=> (not res!162054) (not e!191453))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!150510 () SeekEntryResult!2472)

(assert (=> b!304703 (= res!162054 (and (= lt!150510 lt!150509) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7332 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7332 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7332 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304703 (= lt!150510 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304704 () Bool)

(declare-fun res!162052 () Bool)

(assert (=> b!304704 (=> (not res!162052) (not e!191454))))

(declare-fun arrayContainsKey!0 (array!15491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304704 (= res!162052 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304705 () Bool)

(declare-fun res!162048 () Bool)

(assert (=> b!304705 (=> (not res!162048) (not e!191454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15491 (_ BitVec 32)) Bool)

(assert (=> b!304705 (= res!162048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304706 () Bool)

(declare-fun res!162051 () Bool)

(assert (=> b!304706 (=> (not res!162051) (not e!191454))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15491 (_ BitVec 32)) SeekEntryResult!2472)

(assert (=> b!304706 (= res!162051 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2472 i!1240)))))

(declare-fun b!304707 () Bool)

(declare-fun res!162046 () Bool)

(assert (=> b!304707 (=> (not res!162046) (not e!191455))))

(assert (=> b!304707 (= res!162046 (and (= (select (arr!7332 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7684 a!3293))))))

(declare-fun b!304708 () Bool)

(assert (=> b!304708 (= e!191453 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304708 (= lt!150510 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304709 () Bool)

(declare-fun res!162053 () Bool)

(assert (=> b!304709 (=> (not res!162053) (not e!191454))))

(assert (=> b!304709 (= res!162053 (and (= (size!7684 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7684 a!3293))))))

(assert (= (and start!30436 res!162049) b!304709))

(assert (= (and b!304709 res!162053) b!304701))

(assert (= (and b!304701 res!162047) b!304704))

(assert (= (and b!304704 res!162052) b!304706))

(assert (= (and b!304706 res!162051) b!304705))

(assert (= (and b!304705 res!162048) b!304702))

(assert (= (and b!304702 res!162050) b!304707))

(assert (= (and b!304707 res!162046) b!304703))

(assert (= (and b!304703 res!162054) b!304708))

(declare-fun m!315787 () Bool)

(assert (=> b!304704 m!315787))

(declare-fun m!315789 () Bool)

(assert (=> b!304707 m!315789))

(declare-fun m!315791 () Bool)

(assert (=> b!304703 m!315791))

(declare-fun m!315793 () Bool)

(assert (=> b!304703 m!315793))

(declare-fun m!315795 () Bool)

(assert (=> b!304701 m!315795))

(declare-fun m!315797 () Bool)

(assert (=> b!304708 m!315797))

(assert (=> b!304708 m!315797))

(declare-fun m!315799 () Bool)

(assert (=> b!304708 m!315799))

(declare-fun m!315801 () Bool)

(assert (=> b!304706 m!315801))

(declare-fun m!315803 () Bool)

(assert (=> start!30436 m!315803))

(declare-fun m!315805 () Bool)

(assert (=> start!30436 m!315805))

(declare-fun m!315807 () Bool)

(assert (=> b!304702 m!315807))

(assert (=> b!304702 m!315807))

(declare-fun m!315809 () Bool)

(assert (=> b!304702 m!315809))

(declare-fun m!315811 () Bool)

(assert (=> b!304705 m!315811))

(check-sat (not b!304706) (not b!304705) (not b!304703) (not b!304702) (not start!30436) (not b!304704) (not b!304708) (not b!304701))
(check-sat)
