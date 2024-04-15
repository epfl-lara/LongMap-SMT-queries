; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30564 () Bool)

(assert start!30564)

(declare-fun b!306227 () Bool)

(declare-fun res!163264 () Bool)

(declare-fun e!192027 () Bool)

(assert (=> b!306227 (=> (not res!163264) (not e!192027))))

(declare-datatypes ((array!15572 0))(
  ( (array!15573 (arr!7371 (Array (_ BitVec 32) (_ BitVec 64))) (size!7724 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15572)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306227 (= res!163264 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306228 () Bool)

(declare-fun e!192028 () Bool)

(assert (=> b!306228 (= e!192028 (not true))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306228 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9481 0))(
  ( (Unit!9482) )
))
(declare-fun lt!150743 () Unit!9481)

(declare-fun e!192026 () Unit!9481)

(assert (=> b!306228 (= lt!150743 e!192026)))

(declare-fun c!49085 () Bool)

(assert (=> b!306228 (= c!49085 (not (= resIndex!52 index!1781)))))

(declare-fun b!306229 () Bool)

(declare-fun e!192029 () Unit!9481)

(assert (=> b!306229 (= e!192026 e!192029)))

(declare-fun c!49084 () Bool)

(assert (=> b!306229 (= c!49084 (or (= (select (arr!7371 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7371 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306230 () Bool)

(declare-fun res!163266 () Bool)

(assert (=> b!306230 (=> (not res!163266) (not e!192027))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15572 (_ BitVec 32)) Bool)

(assert (=> b!306230 (= res!163266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306231 () Bool)

(declare-fun res!163271 () Bool)

(assert (=> b!306231 (=> (not res!163271) (not e!192028))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!306231 (= res!163271 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7371 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306232 () Bool)

(assert (=> b!306232 (= e!192027 e!192028)))

(declare-fun res!163267 () Bool)

(assert (=> b!306232 (=> (not res!163267) (not e!192028))))

(declare-datatypes ((SeekEntryResult!2510 0))(
  ( (MissingZero!2510 (index!12216 (_ BitVec 32))) (Found!2510 (index!12217 (_ BitVec 32))) (Intermediate!2510 (undefined!3322 Bool) (index!12218 (_ BitVec 32)) (x!30484 (_ BitVec 32))) (Undefined!2510) (MissingVacant!2510 (index!12219 (_ BitVec 32))) )
))
(declare-fun lt!150742 () SeekEntryResult!2510)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15572 (_ BitVec 32)) SeekEntryResult!2510)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306232 (= res!163267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150742))))

(assert (=> b!306232 (= lt!150742 (Intermediate!2510 false resIndex!52 resX!52))))

(declare-fun res!163272 () Bool)

(assert (=> start!30564 (=> (not res!163272) (not e!192027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30564 (= res!163272 (validMask!0 mask!3709))))

(assert (=> start!30564 e!192027))

(declare-fun array_inv!5343 (array!15572) Bool)

(assert (=> start!30564 (array_inv!5343 a!3293)))

(assert (=> start!30564 true))

(declare-fun b!306233 () Bool)

(declare-fun res!163270 () Bool)

(assert (=> b!306233 (=> (not res!163270) (not e!192027))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15572 (_ BitVec 32)) SeekEntryResult!2510)

(assert (=> b!306233 (= res!163270 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2510 i!1240)))))

(declare-fun b!306234 () Bool)

(declare-fun res!163268 () Bool)

(assert (=> b!306234 (=> (not res!163268) (not e!192027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306234 (= res!163268 (validKeyInArray!0 k0!2441))))

(declare-fun b!306235 () Bool)

(declare-fun res!163265 () Bool)

(assert (=> b!306235 (=> (not res!163265) (not e!192028))))

(assert (=> b!306235 (= res!163265 (and (= (select (arr!7371 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7724 a!3293))))))

(declare-fun b!306236 () Bool)

(assert (=> b!306236 false))

(declare-fun Unit!9483 () Unit!9481)

(assert (=> b!306236 (= e!192029 Unit!9483)))

(declare-fun b!306237 () Bool)

(assert (=> b!306237 false))

(declare-fun lt!150741 () SeekEntryResult!2510)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306237 (= lt!150741 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9484 () Unit!9481)

(assert (=> b!306237 (= e!192029 Unit!9484)))

(declare-fun b!306238 () Bool)

(declare-fun Unit!9485 () Unit!9481)

(assert (=> b!306238 (= e!192026 Unit!9485)))

(declare-fun b!306239 () Bool)

(declare-fun res!163263 () Bool)

(assert (=> b!306239 (=> (not res!163263) (not e!192027))))

(assert (=> b!306239 (= res!163263 (and (= (size!7724 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7724 a!3293))))))

(declare-fun b!306240 () Bool)

(declare-fun res!163269 () Bool)

(assert (=> b!306240 (=> (not res!163269) (not e!192028))))

(assert (=> b!306240 (= res!163269 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150742))))

(assert (= (and start!30564 res!163272) b!306239))

(assert (= (and b!306239 res!163263) b!306234))

(assert (= (and b!306234 res!163268) b!306227))

(assert (= (and b!306227 res!163264) b!306233))

(assert (= (and b!306233 res!163270) b!306230))

(assert (= (and b!306230 res!163266) b!306232))

(assert (= (and b!306232 res!163267) b!306235))

(assert (= (and b!306235 res!163265) b!306240))

(assert (= (and b!306240 res!163269) b!306231))

(assert (= (and b!306231 res!163271) b!306228))

(assert (= (and b!306228 c!49085) b!306229))

(assert (= (and b!306228 (not c!49085)) b!306238))

(assert (= (and b!306229 c!49084) b!306236))

(assert (= (and b!306229 (not c!49084)) b!306237))

(declare-fun m!316339 () Bool)

(assert (=> b!306234 m!316339))

(declare-fun m!316341 () Bool)

(assert (=> b!306231 m!316341))

(declare-fun m!316343 () Bool)

(assert (=> b!306232 m!316343))

(assert (=> b!306232 m!316343))

(declare-fun m!316345 () Bool)

(assert (=> b!306232 m!316345))

(declare-fun m!316347 () Bool)

(assert (=> b!306237 m!316347))

(assert (=> b!306237 m!316347))

(declare-fun m!316349 () Bool)

(assert (=> b!306237 m!316349))

(declare-fun m!316351 () Bool)

(assert (=> b!306233 m!316351))

(declare-fun m!316353 () Bool)

(assert (=> start!30564 m!316353))

(declare-fun m!316355 () Bool)

(assert (=> start!30564 m!316355))

(declare-fun m!316357 () Bool)

(assert (=> b!306240 m!316357))

(declare-fun m!316359 () Bool)

(assert (=> b!306235 m!316359))

(declare-fun m!316361 () Bool)

(assert (=> b!306230 m!316361))

(declare-fun m!316363 () Bool)

(assert (=> b!306227 m!316363))

(assert (=> b!306229 m!316341))

(check-sat (not b!306240) (not start!30564) (not b!306233) (not b!306232) (not b!306227) (not b!306230) (not b!306237) (not b!306234))
(check-sat)
