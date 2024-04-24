; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30504 () Bool)

(assert start!30504)

(declare-fun b!305269 () Bool)

(declare-fun res!162508 () Bool)

(declare-fun e!191735 () Bool)

(assert (=> b!305269 (=> (not res!162508) (not e!191735))))

(declare-datatypes ((array!15521 0))(
  ( (array!15522 (arr!7345 (Array (_ BitVec 32) (_ BitVec 64))) (size!7697 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15521)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305269 (= res!162508 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305270 () Bool)

(declare-fun res!162506 () Bool)

(declare-fun e!191736 () Bool)

(assert (=> b!305270 (=> (not res!162506) (not e!191736))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305270 (= res!162506 (and (= (select (arr!7345 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7697 a!3293))))))

(declare-fun b!305271 () Bool)

(assert (=> b!305271 (= e!191735 e!191736)))

(declare-fun res!162507 () Bool)

(assert (=> b!305271 (=> (not res!162507) (not e!191736))))

(declare-datatypes ((SeekEntryResult!2450 0))(
  ( (MissingZero!2450 (index!11976 (_ BitVec 32))) (Found!2450 (index!11977 (_ BitVec 32))) (Intermediate!2450 (undefined!3262 Bool) (index!11978 (_ BitVec 32)) (x!30346 (_ BitVec 32))) (Undefined!2450) (MissingVacant!2450 (index!11979 (_ BitVec 32))) )
))
(declare-fun lt!150734 () SeekEntryResult!2450)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15521 (_ BitVec 32)) SeekEntryResult!2450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305271 (= res!162507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150734))))

(assert (=> b!305271 (= lt!150734 (Intermediate!2450 false resIndex!52 resX!52))))

(declare-fun e!191733 () Bool)

(declare-fun b!305272 () Bool)

(declare-fun lt!150733 () (_ BitVec 32))

(assert (=> b!305272 (= e!191733 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!150733 #b00000000000000000000000000000000) (bvsge lt!150733 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-fun lt!150735 () SeekEntryResult!2450)

(assert (=> b!305272 (= lt!150735 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150733 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305272 (= lt!150733 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!305273 () Bool)

(declare-fun res!162509 () Bool)

(assert (=> b!305273 (=> (not res!162509) (not e!191735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305273 (= res!162509 (validKeyInArray!0 k0!2441))))

(declare-fun b!305274 () Bool)

(declare-fun res!162513 () Bool)

(assert (=> b!305274 (=> (not res!162513) (not e!191735))))

(assert (=> b!305274 (= res!162513 (and (= (size!7697 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7697 a!3293))))))

(declare-fun b!305275 () Bool)

(assert (=> b!305275 (= e!191736 e!191733)))

(declare-fun res!162511 () Bool)

(assert (=> b!305275 (=> (not res!162511) (not e!191733))))

(assert (=> b!305275 (= res!162511 (and (= lt!150735 lt!150734) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7345 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7345 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7345 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305275 (= lt!150735 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!305277 () Bool)

(declare-fun res!162510 () Bool)

(assert (=> b!305277 (=> (not res!162510) (not e!191735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15521 (_ BitVec 32)) Bool)

(assert (=> b!305277 (= res!162510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305276 () Bool)

(declare-fun res!162505 () Bool)

(assert (=> b!305276 (=> (not res!162505) (not e!191735))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15521 (_ BitVec 32)) SeekEntryResult!2450)

(assert (=> b!305276 (= res!162505 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2450 i!1240)))))

(declare-fun res!162512 () Bool)

(assert (=> start!30504 (=> (not res!162512) (not e!191735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30504 (= res!162512 (validMask!0 mask!3709))))

(assert (=> start!30504 e!191735))

(declare-fun array_inv!5295 (array!15521) Bool)

(assert (=> start!30504 (array_inv!5295 a!3293)))

(assert (=> start!30504 true))

(assert (= (and start!30504 res!162512) b!305274))

(assert (= (and b!305274 res!162513) b!305273))

(assert (= (and b!305273 res!162509) b!305269))

(assert (= (and b!305269 res!162508) b!305276))

(assert (= (and b!305276 res!162505) b!305277))

(assert (= (and b!305277 res!162510) b!305271))

(assert (= (and b!305271 res!162507) b!305270))

(assert (= (and b!305270 res!162506) b!305275))

(assert (= (and b!305275 res!162511) b!305272))

(declare-fun m!316411 () Bool)

(assert (=> b!305273 m!316411))

(declare-fun m!316413 () Bool)

(assert (=> b!305276 m!316413))

(declare-fun m!316415 () Bool)

(assert (=> b!305269 m!316415))

(declare-fun m!316417 () Bool)

(assert (=> b!305275 m!316417))

(declare-fun m!316419 () Bool)

(assert (=> b!305275 m!316419))

(declare-fun m!316421 () Bool)

(assert (=> b!305272 m!316421))

(declare-fun m!316423 () Bool)

(assert (=> b!305272 m!316423))

(declare-fun m!316425 () Bool)

(assert (=> b!305277 m!316425))

(declare-fun m!316427 () Bool)

(assert (=> start!30504 m!316427))

(declare-fun m!316429 () Bool)

(assert (=> start!30504 m!316429))

(declare-fun m!316431 () Bool)

(assert (=> b!305271 m!316431))

(assert (=> b!305271 m!316431))

(declare-fun m!316433 () Bool)

(assert (=> b!305271 m!316433))

(declare-fun m!316435 () Bool)

(assert (=> b!305270 m!316435))

(check-sat (not b!305269) (not b!305272) (not b!305276) (not b!305275) (not start!30504) (not b!305277) (not b!305273) (not b!305271))
(check-sat)
