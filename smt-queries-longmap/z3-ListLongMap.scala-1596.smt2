; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30250 () Bool)

(assert start!30250)

(declare-datatypes ((array!15356 0))(
  ( (array!15357 (arr!7266 (Array (_ BitVec 32) (_ BitVec 64))) (size!7618 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15356)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun e!190741 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!302694 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302694 (= e!190741 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7266 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7266 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7266 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun res!160187 () Bool)

(declare-fun e!190740 () Bool)

(assert (=> start!30250 (=> (not res!160187) (not e!190740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30250 (= res!160187 (validMask!0 mask!3709))))

(assert (=> start!30250 e!190740))

(declare-fun array_inv!5229 (array!15356) Bool)

(assert (=> start!30250 (array_inv!5229 a!3293)))

(assert (=> start!30250 true))

(declare-fun b!302695 () Bool)

(declare-fun res!160184 () Bool)

(assert (=> b!302695 (=> (not res!160184) (not e!190740))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2406 0))(
  ( (MissingZero!2406 (index!11800 (_ BitVec 32))) (Found!2406 (index!11801 (_ BitVec 32))) (Intermediate!2406 (undefined!3218 Bool) (index!11802 (_ BitVec 32)) (x!30071 (_ BitVec 32))) (Undefined!2406) (MissingVacant!2406 (index!11803 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15356 (_ BitVec 32)) SeekEntryResult!2406)

(assert (=> b!302695 (= res!160184 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2406 i!1240)))))

(declare-fun b!302696 () Bool)

(declare-fun res!160188 () Bool)

(assert (=> b!302696 (=> (not res!160188) (not e!190740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15356 (_ BitVec 32)) Bool)

(assert (=> b!302696 (= res!160188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302697 () Bool)

(declare-fun res!160181 () Bool)

(assert (=> b!302697 (=> (not res!160181) (not e!190740))))

(assert (=> b!302697 (= res!160181 (and (= (size!7618 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7618 a!3293))))))

(declare-fun b!302698 () Bool)

(declare-fun res!160186 () Bool)

(assert (=> b!302698 (=> (not res!160186) (not e!190741))))

(assert (=> b!302698 (= res!160186 (and (= (select (arr!7266 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7618 a!3293))))))

(declare-fun b!302699 () Bool)

(declare-fun res!160185 () Bool)

(assert (=> b!302699 (=> (not res!160185) (not e!190741))))

(declare-fun lt!150120 () SeekEntryResult!2406)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15356 (_ BitVec 32)) SeekEntryResult!2406)

(assert (=> b!302699 (= res!160185 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150120))))

(declare-fun b!302700 () Bool)

(assert (=> b!302700 (= e!190740 e!190741)))

(declare-fun res!160183 () Bool)

(assert (=> b!302700 (=> (not res!160183) (not e!190741))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302700 (= res!160183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150120))))

(assert (=> b!302700 (= lt!150120 (Intermediate!2406 false resIndex!52 resX!52))))

(declare-fun b!302701 () Bool)

(declare-fun res!160180 () Bool)

(assert (=> b!302701 (=> (not res!160180) (not e!190740))))

(declare-fun arrayContainsKey!0 (array!15356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302701 (= res!160180 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302702 () Bool)

(declare-fun res!160182 () Bool)

(assert (=> b!302702 (=> (not res!160182) (not e!190740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302702 (= res!160182 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30250 res!160187) b!302697))

(assert (= (and b!302697 res!160181) b!302702))

(assert (= (and b!302702 res!160182) b!302701))

(assert (= (and b!302701 res!160180) b!302695))

(assert (= (and b!302695 res!160184) b!302696))

(assert (= (and b!302696 res!160188) b!302700))

(assert (= (and b!302700 res!160183) b!302698))

(assert (= (and b!302698 res!160186) b!302699))

(assert (= (and b!302699 res!160185) b!302694))

(declare-fun m!314175 () Bool)

(assert (=> b!302696 m!314175))

(declare-fun m!314177 () Bool)

(assert (=> b!302701 m!314177))

(declare-fun m!314179 () Bool)

(assert (=> b!302698 m!314179))

(declare-fun m!314181 () Bool)

(assert (=> b!302702 m!314181))

(declare-fun m!314183 () Bool)

(assert (=> b!302694 m!314183))

(declare-fun m!314185 () Bool)

(assert (=> b!302699 m!314185))

(declare-fun m!314187 () Bool)

(assert (=> b!302700 m!314187))

(assert (=> b!302700 m!314187))

(declare-fun m!314189 () Bool)

(assert (=> b!302700 m!314189))

(declare-fun m!314191 () Bool)

(assert (=> start!30250 m!314191))

(declare-fun m!314193 () Bool)

(assert (=> start!30250 m!314193))

(declare-fun m!314195 () Bool)

(assert (=> b!302695 m!314195))

(check-sat (not b!302699) (not start!30250) (not b!302700) (not b!302702) (not b!302701) (not b!302696) (not b!302695))
(check-sat)
