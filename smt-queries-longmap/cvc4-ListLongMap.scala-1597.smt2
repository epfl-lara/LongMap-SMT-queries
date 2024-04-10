; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30258 () Bool)

(assert start!30258)

(declare-fun b!302803 () Bool)

(declare-fun res!160291 () Bool)

(declare-fun e!190777 () Bool)

(assert (=> b!302803 (=> (not res!160291) (not e!190777))))

(declare-datatypes ((array!15364 0))(
  ( (array!15365 (arr!7270 (Array (_ BitVec 32) (_ BitVec 64))) (size!7622 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15364)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2410 0))(
  ( (MissingZero!2410 (index!11816 (_ BitVec 32))) (Found!2410 (index!11817 (_ BitVec 32))) (Intermediate!2410 (undefined!3222 Bool) (index!11818 (_ BitVec 32)) (x!30083 (_ BitVec 32))) (Undefined!2410) (MissingVacant!2410 (index!11819 (_ BitVec 32))) )
))
(declare-fun lt!150132 () SeekEntryResult!2410)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15364 (_ BitVec 32)) SeekEntryResult!2410)

(assert (=> b!302803 (= res!160291 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150132))))

(declare-fun b!302804 () Bool)

(declare-fun res!160296 () Bool)

(declare-fun e!190775 () Bool)

(assert (=> b!302804 (=> (not res!160296) (not e!190775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15364 (_ BitVec 32)) Bool)

(assert (=> b!302804 (= res!160296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302805 () Bool)

(declare-fun res!160293 () Bool)

(assert (=> b!302805 (=> (not res!160293) (not e!190775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302805 (= res!160293 (validKeyInArray!0 k!2441))))

(declare-fun b!302806 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302806 (= e!190777 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7270 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7270 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7270 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302807 () Bool)

(declare-fun res!160288 () Bool)

(assert (=> b!302807 (=> (not res!160288) (not e!190775))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15364 (_ BitVec 32)) SeekEntryResult!2410)

(assert (=> b!302807 (= res!160288 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2410 i!1240)))))

(declare-fun b!302808 () Bool)

(declare-fun res!160294 () Bool)

(assert (=> b!302808 (=> (not res!160294) (not e!190777))))

(assert (=> b!302808 (= res!160294 (and (= (select (arr!7270 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7622 a!3293))))))

(declare-fun b!302809 () Bool)

(assert (=> b!302809 (= e!190775 e!190777)))

(declare-fun res!160295 () Bool)

(assert (=> b!302809 (=> (not res!160295) (not e!190777))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302809 (= res!160295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150132))))

(assert (=> b!302809 (= lt!150132 (Intermediate!2410 false resIndex!52 resX!52))))

(declare-fun b!302810 () Bool)

(declare-fun res!160290 () Bool)

(assert (=> b!302810 (=> (not res!160290) (not e!190775))))

(assert (=> b!302810 (= res!160290 (and (= (size!7622 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7622 a!3293))))))

(declare-fun res!160289 () Bool)

(assert (=> start!30258 (=> (not res!160289) (not e!190775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30258 (= res!160289 (validMask!0 mask!3709))))

(assert (=> start!30258 e!190775))

(declare-fun array_inv!5233 (array!15364) Bool)

(assert (=> start!30258 (array_inv!5233 a!3293)))

(assert (=> start!30258 true))

(declare-fun b!302802 () Bool)

(declare-fun res!160292 () Bool)

(assert (=> b!302802 (=> (not res!160292) (not e!190775))))

(declare-fun arrayContainsKey!0 (array!15364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302802 (= res!160292 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30258 res!160289) b!302810))

(assert (= (and b!302810 res!160290) b!302805))

(assert (= (and b!302805 res!160293) b!302802))

(assert (= (and b!302802 res!160292) b!302807))

(assert (= (and b!302807 res!160288) b!302804))

(assert (= (and b!302804 res!160296) b!302809))

(assert (= (and b!302809 res!160295) b!302808))

(assert (= (and b!302808 res!160294) b!302803))

(assert (= (and b!302803 res!160291) b!302806))

(declare-fun m!314263 () Bool)

(assert (=> b!302807 m!314263))

(declare-fun m!314265 () Bool)

(assert (=> b!302805 m!314265))

(declare-fun m!314267 () Bool)

(assert (=> b!302809 m!314267))

(assert (=> b!302809 m!314267))

(declare-fun m!314269 () Bool)

(assert (=> b!302809 m!314269))

(declare-fun m!314271 () Bool)

(assert (=> b!302806 m!314271))

(declare-fun m!314273 () Bool)

(assert (=> b!302803 m!314273))

(declare-fun m!314275 () Bool)

(assert (=> b!302808 m!314275))

(declare-fun m!314277 () Bool)

(assert (=> b!302804 m!314277))

(declare-fun m!314279 () Bool)

(assert (=> start!30258 m!314279))

(declare-fun m!314281 () Bool)

(assert (=> start!30258 m!314281))

(declare-fun m!314283 () Bool)

(assert (=> b!302802 m!314283))

(push 1)

(assert (not start!30258))

(assert (not b!302805))

(assert (not b!302804))

(assert (not b!302803))

(assert (not b!302809))

(assert (not b!302802))

(assert (not b!302807))

(check-sat)

