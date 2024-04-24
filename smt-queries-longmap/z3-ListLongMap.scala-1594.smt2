; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30222 () Bool)

(assert start!30222)

(declare-fun b!302461 () Bool)

(declare-fun res!159999 () Bool)

(declare-fun e!190653 () Bool)

(assert (=> b!302461 (=> (not res!159999) (not e!190653))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15341 0))(
  ( (array!15342 (arr!7258 (Array (_ BitVec 32) (_ BitVec 64))) (size!7610 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15341)

(assert (=> b!302461 (= res!159999 (and (= (select (arr!7258 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7610 a!3293))))))

(declare-fun b!302462 () Bool)

(declare-fun res!159998 () Bool)

(declare-fun e!190651 () Bool)

(assert (=> b!302462 (=> (not res!159998) (not e!190651))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15341 (_ BitVec 32)) Bool)

(assert (=> b!302462 (= res!159998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302463 () Bool)

(declare-fun res!160003 () Bool)

(assert (=> b!302463 (=> (not res!160003) (not e!190651))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302463 (= res!160003 (validKeyInArray!0 k0!2441))))

(declare-fun b!302464 () Bool)

(declare-fun res!160004 () Bool)

(assert (=> b!302464 (=> (not res!160004) (not e!190651))))

(declare-datatypes ((SeekEntryResult!2363 0))(
  ( (MissingZero!2363 (index!11628 (_ BitVec 32))) (Found!2363 (index!11629 (_ BitVec 32))) (Intermediate!2363 (undefined!3175 Bool) (index!11630 (_ BitVec 32)) (x!30009 (_ BitVec 32))) (Undefined!2363) (MissingVacant!2363 (index!11631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15341 (_ BitVec 32)) SeekEntryResult!2363)

(assert (=> b!302464 (= res!160004 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2363 i!1240)))))

(declare-fun res!160002 () Bool)

(assert (=> start!30222 (=> (not res!160002) (not e!190651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30222 (= res!160002 (validMask!0 mask!3709))))

(assert (=> start!30222 e!190651))

(declare-fun array_inv!5208 (array!15341) Bool)

(assert (=> start!30222 (array_inv!5208 a!3293)))

(assert (=> start!30222 true))

(declare-fun b!302465 () Bool)

(assert (=> b!302465 (= e!190651 e!190653)))

(declare-fun res!160000 () Bool)

(assert (=> b!302465 (=> (not res!160000) (not e!190653))))

(declare-fun lt!150117 () SeekEntryResult!2363)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15341 (_ BitVec 32)) SeekEntryResult!2363)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302465 (= res!160000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150117))))

(assert (=> b!302465 (= lt!150117 (Intermediate!2363 false resIndex!52 resX!52))))

(declare-fun b!302466 () Bool)

(declare-fun res!159997 () Bool)

(assert (=> b!302466 (=> (not res!159997) (not e!190653))))

(assert (=> b!302466 (= res!159997 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150117))))

(declare-fun b!302467 () Bool)

(assert (=> b!302467 (= e!190653 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7258 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7258 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7258 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302468 () Bool)

(declare-fun res!160005 () Bool)

(assert (=> b!302468 (=> (not res!160005) (not e!190651))))

(declare-fun arrayContainsKey!0 (array!15341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302468 (= res!160005 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302469 () Bool)

(declare-fun res!160001 () Bool)

(assert (=> b!302469 (=> (not res!160001) (not e!190651))))

(assert (=> b!302469 (= res!160001 (and (= (size!7610 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7610 a!3293))))))

(assert (= (and start!30222 res!160002) b!302469))

(assert (= (and b!302469 res!160001) b!302463))

(assert (= (and b!302463 res!160003) b!302468))

(assert (= (and b!302468 res!160005) b!302464))

(assert (= (and b!302464 res!160004) b!302462))

(assert (= (and b!302462 res!159998) b!302465))

(assert (= (and b!302465 res!160000) b!302461))

(assert (= (and b!302461 res!159999) b!302466))

(assert (= (and b!302466 res!159997) b!302467))

(declare-fun m!314137 () Bool)

(assert (=> b!302468 m!314137))

(declare-fun m!314139 () Bool)

(assert (=> b!302463 m!314139))

(declare-fun m!314141 () Bool)

(assert (=> b!302467 m!314141))

(declare-fun m!314143 () Bool)

(assert (=> b!302465 m!314143))

(assert (=> b!302465 m!314143))

(declare-fun m!314145 () Bool)

(assert (=> b!302465 m!314145))

(declare-fun m!314147 () Bool)

(assert (=> b!302466 m!314147))

(declare-fun m!314149 () Bool)

(assert (=> b!302464 m!314149))

(declare-fun m!314151 () Bool)

(assert (=> b!302462 m!314151))

(declare-fun m!314153 () Bool)

(assert (=> b!302461 m!314153))

(declare-fun m!314155 () Bool)

(assert (=> start!30222 m!314155))

(declare-fun m!314157 () Bool)

(assert (=> start!30222 m!314157))

(check-sat (not start!30222) (not b!302465) (not b!302464) (not b!302466) (not b!302468) (not b!302462) (not b!302463))
(check-sat)
