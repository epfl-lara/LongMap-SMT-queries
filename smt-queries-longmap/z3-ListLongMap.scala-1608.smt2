; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30306 () Bool)

(assert start!30306)

(declare-fun b!303319 () Bool)

(declare-fun res!160953 () Bool)

(declare-fun e!190833 () Bool)

(assert (=> b!303319 (=> (not res!160953) (not e!190833))))

(declare-datatypes ((array!15416 0))(
  ( (array!15417 (arr!7296 (Array (_ BitVec 32) (_ BitVec 64))) (size!7649 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15416)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303319 (= res!160953 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160951 () Bool)

(assert (=> start!30306 (=> (not res!160951) (not e!190833))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30306 (= res!160951 (validMask!0 mask!3709))))

(assert (=> start!30306 e!190833))

(declare-fun array_inv!5268 (array!15416) Bool)

(assert (=> start!30306 (array_inv!5268 a!3293)))

(assert (=> start!30306 true))

(declare-fun b!303320 () Bool)

(declare-fun res!160955 () Bool)

(assert (=> b!303320 (=> (not res!160955) (not e!190833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15416 (_ BitVec 32)) Bool)

(assert (=> b!303320 (= res!160955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303321 () Bool)

(declare-fun e!190834 () Bool)

(assert (=> b!303321 (= e!190833 e!190834)))

(declare-fun res!160959 () Bool)

(assert (=> b!303321 (=> (not res!160959) (not e!190834))))

(declare-datatypes ((SeekEntryResult!2435 0))(
  ( (MissingZero!2435 (index!11916 (_ BitVec 32))) (Found!2435 (index!11917 (_ BitVec 32))) (Intermediate!2435 (undefined!3247 Bool) (index!11918 (_ BitVec 32)) (x!30191 (_ BitVec 32))) (Undefined!2435) (MissingVacant!2435 (index!11919 (_ BitVec 32))) )
))
(declare-fun lt!149990 () SeekEntryResult!2435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15416 (_ BitVec 32)) SeekEntryResult!2435)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303321 (= res!160959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149990))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303321 (= lt!149990 (Intermediate!2435 false resIndex!52 resX!52))))

(declare-fun b!303322 () Bool)

(declare-fun res!160957 () Bool)

(assert (=> b!303322 (=> (not res!160957) (not e!190833))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15416 (_ BitVec 32)) SeekEntryResult!2435)

(assert (=> b!303322 (= res!160957 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2435 i!1240)))))

(declare-fun b!303323 () Bool)

(declare-fun res!160952 () Bool)

(assert (=> b!303323 (=> (not res!160952) (not e!190833))))

(assert (=> b!303323 (= res!160952 (and (= (size!7649 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7649 a!3293))))))

(declare-fun b!303324 () Bool)

(declare-fun res!160954 () Bool)

(assert (=> b!303324 (=> (not res!160954) (not e!190834))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303324 (= res!160954 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149990))))

(declare-fun b!303325 () Bool)

(declare-fun res!160956 () Bool)

(assert (=> b!303325 (=> (not res!160956) (not e!190833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303325 (= res!160956 (validKeyInArray!0 k0!2441))))

(declare-fun b!303326 () Bool)

(assert (=> b!303326 (= e!190834 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7296 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7296 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7296 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!303327 () Bool)

(declare-fun res!160958 () Bool)

(assert (=> b!303327 (=> (not res!160958) (not e!190834))))

(assert (=> b!303327 (= res!160958 (and (= (select (arr!7296 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7649 a!3293))))))

(assert (= (and start!30306 res!160951) b!303323))

(assert (= (and b!303323 res!160952) b!303325))

(assert (= (and b!303325 res!160956) b!303319))

(assert (= (and b!303319 res!160953) b!303322))

(assert (= (and b!303322 res!160957) b!303320))

(assert (= (and b!303320 res!160955) b!303321))

(assert (= (and b!303321 res!160959) b!303327))

(assert (= (and b!303327 res!160958) b!303324))

(assert (= (and b!303324 res!160954) b!303326))

(declare-fun m!314185 () Bool)

(assert (=> b!303325 m!314185))

(declare-fun m!314187 () Bool)

(assert (=> b!303321 m!314187))

(assert (=> b!303321 m!314187))

(declare-fun m!314189 () Bool)

(assert (=> b!303321 m!314189))

(declare-fun m!314191 () Bool)

(assert (=> b!303322 m!314191))

(declare-fun m!314193 () Bool)

(assert (=> b!303320 m!314193))

(declare-fun m!314195 () Bool)

(assert (=> b!303324 m!314195))

(declare-fun m!314197 () Bool)

(assert (=> b!303319 m!314197))

(declare-fun m!314199 () Bool)

(assert (=> b!303327 m!314199))

(declare-fun m!314201 () Bool)

(assert (=> start!30306 m!314201))

(declare-fun m!314203 () Bool)

(assert (=> start!30306 m!314203))

(declare-fun m!314205 () Bool)

(assert (=> b!303326 m!314205))

(check-sat (not b!303319) (not b!303322) (not b!303324) (not b!303321) (not b!303320) (not start!30306) (not b!303325))
(check-sat)
