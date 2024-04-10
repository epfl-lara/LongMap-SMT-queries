; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30244 () Bool)

(assert start!30244)

(declare-fun b!302617 () Bool)

(declare-fun res!160106 () Bool)

(declare-fun e!190717 () Bool)

(assert (=> b!302617 (=> (not res!160106) (not e!190717))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15350 0))(
  ( (array!15351 (arr!7263 (Array (_ BitVec 32) (_ BitVec 64))) (size!7615 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15350)

(assert (=> b!302617 (= res!160106 (and (= (size!7615 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7615 a!3293))))))

(declare-fun b!302618 () Bool)

(declare-fun res!160109 () Bool)

(assert (=> b!302618 (=> (not res!160109) (not e!190717))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2403 0))(
  ( (MissingZero!2403 (index!11788 (_ BitVec 32))) (Found!2403 (index!11789 (_ BitVec 32))) (Intermediate!2403 (undefined!3215 Bool) (index!11790 (_ BitVec 32)) (x!30060 (_ BitVec 32))) (Undefined!2403) (MissingVacant!2403 (index!11791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15350 (_ BitVec 32)) SeekEntryResult!2403)

(assert (=> b!302618 (= res!160109 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2403 i!1240)))))

(declare-fun b!302619 () Bool)

(declare-fun res!160105 () Bool)

(assert (=> b!302619 (=> (not res!160105) (not e!190717))))

(declare-fun arrayContainsKey!0 (array!15350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302619 (= res!160105 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160110 () Bool)

(assert (=> start!30244 (=> (not res!160110) (not e!190717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30244 (= res!160110 (validMask!0 mask!3709))))

(assert (=> start!30244 e!190717))

(declare-fun array_inv!5226 (array!15350) Bool)

(assert (=> start!30244 (array_inv!5226 a!3293)))

(assert (=> start!30244 true))

(declare-fun b!302620 () Bool)

(declare-fun res!160107 () Bool)

(assert (=> b!302620 (=> (not res!160107) (not e!190717))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302620 (= res!160107 (and (= (select (arr!7263 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7615 a!3293))))))

(declare-fun b!302621 () Bool)

(assert (=> b!302621 (= e!190717 false)))

(declare-fun lt!150111 () SeekEntryResult!2403)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15350 (_ BitVec 32)) SeekEntryResult!2403)

(assert (=> b!302621 (= lt!150111 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!302622 () Bool)

(declare-fun res!160103 () Bool)

(assert (=> b!302622 (=> (not res!160103) (not e!190717))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302622 (= res!160103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2403 false resIndex!52 resX!52)))))

(declare-fun b!302623 () Bool)

(declare-fun res!160108 () Bool)

(assert (=> b!302623 (=> (not res!160108) (not e!190717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302623 (= res!160108 (validKeyInArray!0 k0!2441))))

(declare-fun b!302624 () Bool)

(declare-fun res!160104 () Bool)

(assert (=> b!302624 (=> (not res!160104) (not e!190717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15350 (_ BitVec 32)) Bool)

(assert (=> b!302624 (= res!160104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30244 res!160110) b!302617))

(assert (= (and b!302617 res!160106) b!302623))

(assert (= (and b!302623 res!160108) b!302619))

(assert (= (and b!302619 res!160105) b!302618))

(assert (= (and b!302618 res!160109) b!302624))

(assert (= (and b!302624 res!160104) b!302622))

(assert (= (and b!302622 res!160103) b!302620))

(assert (= (and b!302620 res!160107) b!302621))

(declare-fun m!314113 () Bool)

(assert (=> b!302620 m!314113))

(declare-fun m!314115 () Bool)

(assert (=> b!302624 m!314115))

(declare-fun m!314117 () Bool)

(assert (=> b!302619 m!314117))

(declare-fun m!314119 () Bool)

(assert (=> b!302621 m!314119))

(declare-fun m!314121 () Bool)

(assert (=> b!302618 m!314121))

(declare-fun m!314123 () Bool)

(assert (=> b!302623 m!314123))

(declare-fun m!314125 () Bool)

(assert (=> b!302622 m!314125))

(assert (=> b!302622 m!314125))

(declare-fun m!314127 () Bool)

(assert (=> b!302622 m!314127))

(declare-fun m!314129 () Bool)

(assert (=> start!30244 m!314129))

(declare-fun m!314131 () Bool)

(assert (=> start!30244 m!314131))

(check-sat (not b!302623) (not b!302624) (not b!302622) (not start!30244) (not b!302621) (not b!302619) (not b!302618))
