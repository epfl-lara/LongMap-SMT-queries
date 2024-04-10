; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30254 () Bool)

(assert start!30254)

(declare-fun b!302748 () Bool)

(declare-fun res!160236 () Bool)

(declare-fun e!190758 () Bool)

(assert (=> b!302748 (=> (not res!160236) (not e!190758))))

(declare-datatypes ((array!15360 0))(
  ( (array!15361 (arr!7268 (Array (_ BitVec 32) (_ BitVec 64))) (size!7620 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15360)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2408 0))(
  ( (MissingZero!2408 (index!11808 (_ BitVec 32))) (Found!2408 (index!11809 (_ BitVec 32))) (Intermediate!2408 (undefined!3220 Bool) (index!11810 (_ BitVec 32)) (x!30081 (_ BitVec 32))) (Undefined!2408) (MissingVacant!2408 (index!11811 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15360 (_ BitVec 32)) SeekEntryResult!2408)

(assert (=> b!302748 (= res!160236 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2408 i!1240)))))

(declare-fun b!302749 () Bool)

(declare-fun e!190757 () Bool)

(assert (=> b!302749 (= e!190758 e!190757)))

(declare-fun res!160235 () Bool)

(assert (=> b!302749 (=> (not res!160235) (not e!190757))))

(declare-fun lt!150126 () SeekEntryResult!2408)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15360 (_ BitVec 32)) SeekEntryResult!2408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302749 (= res!160235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150126))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302749 (= lt!150126 (Intermediate!2408 false resIndex!52 resX!52))))

(declare-fun b!302750 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302750 (= e!190757 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7268 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7268 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7268 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302751 () Bool)

(declare-fun res!160237 () Bool)

(assert (=> b!302751 (=> (not res!160237) (not e!190758))))

(assert (=> b!302751 (= res!160237 (and (= (size!7620 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7620 a!3293))))))

(declare-fun res!160242 () Bool)

(assert (=> start!30254 (=> (not res!160242) (not e!190758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30254 (= res!160242 (validMask!0 mask!3709))))

(assert (=> start!30254 e!190758))

(declare-fun array_inv!5231 (array!15360) Bool)

(assert (=> start!30254 (array_inv!5231 a!3293)))

(assert (=> start!30254 true))

(declare-fun b!302752 () Bool)

(declare-fun res!160239 () Bool)

(assert (=> b!302752 (=> (not res!160239) (not e!190757))))

(assert (=> b!302752 (= res!160239 (and (= (select (arr!7268 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7620 a!3293))))))

(declare-fun b!302753 () Bool)

(declare-fun res!160241 () Bool)

(assert (=> b!302753 (=> (not res!160241) (not e!190758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15360 (_ BitVec 32)) Bool)

(assert (=> b!302753 (= res!160241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302754 () Bool)

(declare-fun res!160234 () Bool)

(assert (=> b!302754 (=> (not res!160234) (not e!190758))))

(declare-fun arrayContainsKey!0 (array!15360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302754 (= res!160234 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302755 () Bool)

(declare-fun res!160240 () Bool)

(assert (=> b!302755 (=> (not res!160240) (not e!190758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302755 (= res!160240 (validKeyInArray!0 k!2441))))

(declare-fun b!302756 () Bool)

(declare-fun res!160238 () Bool)

(assert (=> b!302756 (=> (not res!160238) (not e!190757))))

(assert (=> b!302756 (= res!160238 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150126))))

(assert (= (and start!30254 res!160242) b!302751))

(assert (= (and b!302751 res!160237) b!302755))

(assert (= (and b!302755 res!160240) b!302754))

(assert (= (and b!302754 res!160234) b!302748))

(assert (= (and b!302748 res!160236) b!302753))

(assert (= (and b!302753 res!160241) b!302749))

(assert (= (and b!302749 res!160235) b!302752))

(assert (= (and b!302752 res!160239) b!302756))

(assert (= (and b!302756 res!160238) b!302750))

(declare-fun m!314219 () Bool)

(assert (=> b!302756 m!314219))

(declare-fun m!314221 () Bool)

(assert (=> b!302750 m!314221))

(declare-fun m!314223 () Bool)

(assert (=> b!302752 m!314223))

(declare-fun m!314225 () Bool)

(assert (=> b!302748 m!314225))

(declare-fun m!314227 () Bool)

(assert (=> b!302754 m!314227))

(declare-fun m!314229 () Bool)

(assert (=> start!30254 m!314229))

(declare-fun m!314231 () Bool)

(assert (=> start!30254 m!314231))

(declare-fun m!314233 () Bool)

(assert (=> b!302753 m!314233))

(declare-fun m!314235 () Bool)

(assert (=> b!302749 m!314235))

(assert (=> b!302749 m!314235))

(declare-fun m!314237 () Bool)

(assert (=> b!302749 m!314237))

(declare-fun m!314239 () Bool)

(assert (=> b!302755 m!314239))

(push 1)

