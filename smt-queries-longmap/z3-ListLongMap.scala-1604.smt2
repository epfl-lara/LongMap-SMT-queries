; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30298 () Bool)

(assert start!30298)

(declare-fun b!303310 () Bool)

(declare-fun e!190924 () Bool)

(assert (=> b!303310 (= e!190924 false)))

(declare-datatypes ((array!15404 0))(
  ( (array!15405 (arr!7290 (Array (_ BitVec 32) (_ BitVec 64))) (size!7642 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15404)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2430 0))(
  ( (MissingZero!2430 (index!11896 (_ BitVec 32))) (Found!2430 (index!11897 (_ BitVec 32))) (Intermediate!2430 (undefined!3242 Bool) (index!11898 (_ BitVec 32)) (x!30159 (_ BitVec 32))) (Undefined!2430) (MissingVacant!2430 (index!11899 (_ BitVec 32))) )
))
(declare-fun lt!150192 () SeekEntryResult!2430)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15404 (_ BitVec 32)) SeekEntryResult!2430)

(assert (=> b!303310 (= lt!150192 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!303311 () Bool)

(declare-fun res!160802 () Bool)

(assert (=> b!303311 (=> (not res!160802) (not e!190924))))

(declare-fun arrayContainsKey!0 (array!15404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303311 (= res!160802 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160803 () Bool)

(assert (=> start!30298 (=> (not res!160803) (not e!190924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30298 (= res!160803 (validMask!0 mask!3709))))

(assert (=> start!30298 e!190924))

(declare-fun array_inv!5253 (array!15404) Bool)

(assert (=> start!30298 (array_inv!5253 a!3293)))

(assert (=> start!30298 true))

(declare-fun b!303312 () Bool)

(declare-fun res!160799 () Bool)

(assert (=> b!303312 (=> (not res!160799) (not e!190924))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303312 (= res!160799 (and (= (size!7642 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7642 a!3293))))))

(declare-fun b!303313 () Bool)

(declare-fun res!160798 () Bool)

(assert (=> b!303313 (=> (not res!160798) (not e!190924))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303313 (= res!160798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2430 false resIndex!52 resX!52)))))

(declare-fun b!303314 () Bool)

(declare-fun res!160797 () Bool)

(assert (=> b!303314 (=> (not res!160797) (not e!190924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15404 (_ BitVec 32)) Bool)

(assert (=> b!303314 (= res!160797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303315 () Bool)

(declare-fun res!160800 () Bool)

(assert (=> b!303315 (=> (not res!160800) (not e!190924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303315 (= res!160800 (validKeyInArray!0 k0!2441))))

(declare-fun b!303316 () Bool)

(declare-fun res!160801 () Bool)

(assert (=> b!303316 (=> (not res!160801) (not e!190924))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15404 (_ BitVec 32)) SeekEntryResult!2430)

(assert (=> b!303316 (= res!160801 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2430 i!1240)))))

(declare-fun b!303317 () Bool)

(declare-fun res!160796 () Bool)

(assert (=> b!303317 (=> (not res!160796) (not e!190924))))

(assert (=> b!303317 (= res!160796 (and (= (select (arr!7290 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7642 a!3293))))))

(assert (= (and start!30298 res!160803) b!303312))

(assert (= (and b!303312 res!160799) b!303315))

(assert (= (and b!303315 res!160800) b!303311))

(assert (= (and b!303311 res!160802) b!303316))

(assert (= (and b!303316 res!160801) b!303314))

(assert (= (and b!303314 res!160797) b!303313))

(assert (= (and b!303313 res!160798) b!303317))

(assert (= (and b!303317 res!160796) b!303310))

(declare-fun m!314683 () Bool)

(assert (=> start!30298 m!314683))

(declare-fun m!314685 () Bool)

(assert (=> start!30298 m!314685))

(declare-fun m!314687 () Bool)

(assert (=> b!303310 m!314687))

(declare-fun m!314689 () Bool)

(assert (=> b!303316 m!314689))

(declare-fun m!314691 () Bool)

(assert (=> b!303311 m!314691))

(declare-fun m!314693 () Bool)

(assert (=> b!303317 m!314693))

(declare-fun m!314695 () Bool)

(assert (=> b!303314 m!314695))

(declare-fun m!314697 () Bool)

(assert (=> b!303313 m!314697))

(assert (=> b!303313 m!314697))

(declare-fun m!314699 () Bool)

(assert (=> b!303313 m!314699))

(declare-fun m!314701 () Bool)

(assert (=> b!303315 m!314701))

(check-sat (not b!303311) (not b!303313) (not start!30298) (not b!303310) (not b!303316) (not b!303315) (not b!303314))
