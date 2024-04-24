; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30558 () Bool)

(assert start!30558)

(declare-fun b!306323 () Bool)

(declare-fun res!163304 () Bool)

(declare-fun e!192126 () Bool)

(assert (=> b!306323 (=> (not res!163304) (not e!192126))))

(declare-datatypes ((array!15575 0))(
  ( (array!15576 (arr!7372 (Array (_ BitVec 32) (_ BitVec 64))) (size!7724 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15575)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306323 (= res!163304 (and (= (select (arr!7372 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7724 a!3293))))))

(declare-fun b!306324 () Bool)

(declare-fun res!163302 () Bool)

(assert (=> b!306324 (=> (not res!163302) (not e!192126))))

(declare-datatypes ((SeekEntryResult!2477 0))(
  ( (MissingZero!2477 (index!12084 (_ BitVec 32))) (Found!2477 (index!12085 (_ BitVec 32))) (Intermediate!2477 (undefined!3289 Bool) (index!12086 (_ BitVec 32)) (x!30445 (_ BitVec 32))) (Undefined!2477) (MissingVacant!2477 (index!12087 (_ BitVec 32))) )
))
(declare-fun lt!150969 () SeekEntryResult!2477)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15575 (_ BitVec 32)) SeekEntryResult!2477)

(assert (=> b!306324 (= res!163302 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150969))))

(declare-fun res!163303 () Bool)

(declare-fun e!192124 () Bool)

(assert (=> start!30558 (=> (not res!163303) (not e!192124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30558 (= res!163303 (validMask!0 mask!3709))))

(assert (=> start!30558 e!192124))

(declare-fun array_inv!5322 (array!15575) Bool)

(assert (=> start!30558 (array_inv!5322 a!3293)))

(assert (=> start!30558 true))

(declare-fun b!306325 () Bool)

(declare-datatypes ((Unit!9468 0))(
  ( (Unit!9469) )
))
(declare-fun e!192122 () Unit!9468)

(declare-fun Unit!9470 () Unit!9468)

(assert (=> b!306325 (= e!192122 Unit!9470)))

(declare-fun b!306326 () Bool)

(declare-fun res!163307 () Bool)

(assert (=> b!306326 (=> (not res!163307) (not e!192124))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15575 (_ BitVec 32)) SeekEntryResult!2477)

(assert (=> b!306326 (= res!163307 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2477 i!1240)))))

(declare-fun b!306327 () Bool)

(declare-fun e!192123 () Unit!9468)

(assert (=> b!306327 (= e!192122 e!192123)))

(declare-fun c!49114 () Bool)

(assert (=> b!306327 (= c!49114 (or (= (select (arr!7372 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7372 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306328 () Bool)

(declare-fun res!163301 () Bool)

(assert (=> b!306328 (=> (not res!163301) (not e!192126))))

(assert (=> b!306328 (= res!163301 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7372 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306329 () Bool)

(assert (=> b!306329 (= e!192126 (not (or (not (= (select (arr!7372 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(assert (=> b!306329 (= index!1781 resIndex!52)))

(declare-fun lt!150968 () Unit!9468)

(assert (=> b!306329 (= lt!150968 e!192122)))

(declare-fun c!49115 () Bool)

(assert (=> b!306329 (= c!49115 (not (= resIndex!52 index!1781)))))

(declare-fun b!306330 () Bool)

(assert (=> b!306330 false))

(declare-fun Unit!9471 () Unit!9468)

(assert (=> b!306330 (= e!192123 Unit!9471)))

(declare-fun b!306331 () Bool)

(assert (=> b!306331 (= e!192124 e!192126)))

(declare-fun res!163306 () Bool)

(assert (=> b!306331 (=> (not res!163306) (not e!192126))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306331 (= res!163306 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150969))))

(assert (=> b!306331 (= lt!150969 (Intermediate!2477 false resIndex!52 resX!52))))

(declare-fun b!306332 () Bool)

(declare-fun res!163300 () Bool)

(assert (=> b!306332 (=> (not res!163300) (not e!192124))))

(assert (=> b!306332 (= res!163300 (and (= (size!7724 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7724 a!3293))))))

(declare-fun b!306333 () Bool)

(declare-fun res!163305 () Bool)

(assert (=> b!306333 (=> (not res!163305) (not e!192124))))

(declare-fun arrayContainsKey!0 (array!15575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306333 (= res!163305 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306334 () Bool)

(assert (=> b!306334 false))

(declare-fun lt!150967 () SeekEntryResult!2477)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306334 (= lt!150967 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9472 () Unit!9468)

(assert (=> b!306334 (= e!192123 Unit!9472)))

(declare-fun b!306335 () Bool)

(declare-fun res!163299 () Bool)

(assert (=> b!306335 (=> (not res!163299) (not e!192124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306335 (= res!163299 (validKeyInArray!0 k0!2441))))

(declare-fun b!306336 () Bool)

(declare-fun res!163308 () Bool)

(assert (=> b!306336 (=> (not res!163308) (not e!192124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15575 (_ BitVec 32)) Bool)

(assert (=> b!306336 (= res!163308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30558 res!163303) b!306332))

(assert (= (and b!306332 res!163300) b!306335))

(assert (= (and b!306335 res!163299) b!306333))

(assert (= (and b!306333 res!163305) b!306326))

(assert (= (and b!306326 res!163307) b!306336))

(assert (= (and b!306336 res!163308) b!306331))

(assert (= (and b!306331 res!163306) b!306323))

(assert (= (and b!306323 res!163304) b!306324))

(assert (= (and b!306324 res!163302) b!306328))

(assert (= (and b!306328 res!163301) b!306329))

(assert (= (and b!306329 c!49115) b!306327))

(assert (= (and b!306329 (not c!49115)) b!306325))

(assert (= (and b!306327 c!49114) b!306330))

(assert (= (and b!306327 (not c!49114)) b!306334))

(declare-fun m!317113 () Bool)

(assert (=> b!306335 m!317113))

(declare-fun m!317115 () Bool)

(assert (=> b!306329 m!317115))

(assert (=> b!306328 m!317115))

(declare-fun m!317117 () Bool)

(assert (=> b!306323 m!317117))

(declare-fun m!317119 () Bool)

(assert (=> b!306334 m!317119))

(assert (=> b!306334 m!317119))

(declare-fun m!317121 () Bool)

(assert (=> b!306334 m!317121))

(declare-fun m!317123 () Bool)

(assert (=> start!30558 m!317123))

(declare-fun m!317125 () Bool)

(assert (=> start!30558 m!317125))

(declare-fun m!317127 () Bool)

(assert (=> b!306331 m!317127))

(assert (=> b!306331 m!317127))

(declare-fun m!317129 () Bool)

(assert (=> b!306331 m!317129))

(declare-fun m!317131 () Bool)

(assert (=> b!306324 m!317131))

(declare-fun m!317133 () Bool)

(assert (=> b!306336 m!317133))

(declare-fun m!317135 () Bool)

(assert (=> b!306326 m!317135))

(assert (=> b!306327 m!317115))

(declare-fun m!317137 () Bool)

(assert (=> b!306333 m!317137))

(check-sat (not b!306326) (not b!306324) (not b!306335) (not start!30558) (not b!306334) (not b!306333) (not b!306331) (not b!306336))
(check-sat)
