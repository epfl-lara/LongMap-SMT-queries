; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31804 () Bool)

(assert start!31804)

(declare-fun lt!155057 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!317702 () Bool)

(declare-datatypes ((array!16175 0))(
  ( (array!16176 (arr!7653 (Array (_ BitVec 32) (_ BitVec 64))) (size!8005 (_ BitVec 32))) )
))
(declare-fun lt!155058 () array!16175)

(declare-fun e!197499 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2793 0))(
  ( (MissingZero!2793 (index!13348 (_ BitVec 32))) (Found!2793 (index!13349 (_ BitVec 32))) (Intermediate!2793 (undefined!3605 Bool) (index!13350 (_ BitVec 32)) (x!31610 (_ BitVec 32))) (Undefined!2793) (MissingVacant!2793 (index!13351 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16175 (_ BitVec 32)) SeekEntryResult!2793)

(assert (=> b!317702 (= e!197499 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155058 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155057 k0!2441 lt!155058 mask!3709)))))

(declare-fun a!3293 () array!16175)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317702 (= lt!155058 (array!16176 (store (arr!7653 a!3293) i!1240 k0!2441) (size!8005 a!3293)))))

(declare-fun b!317703 () Bool)

(declare-fun res!172285 () Bool)

(declare-fun e!197498 () Bool)

(assert (=> b!317703 (=> (not res!172285) (not e!197498))))

(assert (=> b!317703 (= res!172285 (and (= (size!8005 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8005 a!3293))))))

(declare-fun b!317704 () Bool)

(declare-fun e!197497 () Bool)

(declare-fun e!197496 () Bool)

(assert (=> b!317704 (= e!197497 e!197496)))

(declare-fun res!172290 () Bool)

(assert (=> b!317704 (=> (not res!172290) (not e!197496))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!155055 () SeekEntryResult!2793)

(declare-fun lt!155056 () SeekEntryResult!2793)

(assert (=> b!317704 (= res!172290 (and (= lt!155055 lt!155056) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7653 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317704 (= lt!155055 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317705 () Bool)

(assert (=> b!317705 (= e!197498 e!197497)))

(declare-fun res!172286 () Bool)

(assert (=> b!317705 (=> (not res!172286) (not e!197497))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317705 (= res!172286 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155056))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317705 (= lt!155056 (Intermediate!2793 false resIndex!52 resX!52))))

(declare-fun b!317706 () Bool)

(declare-fun res!172289 () Bool)

(assert (=> b!317706 (=> (not res!172289) (not e!197497))))

(assert (=> b!317706 (= res!172289 (and (= (select (arr!7653 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8005 a!3293))))))

(declare-fun b!317707 () Bool)

(declare-fun res!172282 () Bool)

(assert (=> b!317707 (=> (not res!172282) (not e!197498))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16175 (_ BitVec 32)) SeekEntryResult!2793)

(assert (=> b!317707 (= res!172282 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2793 i!1240)))))

(declare-fun b!317708 () Bool)

(declare-fun res!172281 () Bool)

(assert (=> b!317708 (=> (not res!172281) (not e!197498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16175 (_ BitVec 32)) Bool)

(assert (=> b!317708 (= res!172281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317709 () Bool)

(assert (=> b!317709 (= e!197496 (not true))))

(assert (=> b!317709 e!197499))

(declare-fun res!172287 () Bool)

(assert (=> b!317709 (=> (not res!172287) (not e!197499))))

(assert (=> b!317709 (= res!172287 (= lt!155055 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155057 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317709 (= lt!155057 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172283 () Bool)

(assert (=> start!31804 (=> (not res!172283) (not e!197498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31804 (= res!172283 (validMask!0 mask!3709))))

(assert (=> start!31804 e!197498))

(declare-fun array_inv!5616 (array!16175) Bool)

(assert (=> start!31804 (array_inv!5616 a!3293)))

(assert (=> start!31804 true))

(declare-fun b!317710 () Bool)

(declare-fun res!172284 () Bool)

(assert (=> b!317710 (=> (not res!172284) (not e!197498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317710 (= res!172284 (validKeyInArray!0 k0!2441))))

(declare-fun b!317711 () Bool)

(declare-fun res!172288 () Bool)

(assert (=> b!317711 (=> (not res!172288) (not e!197498))))

(declare-fun arrayContainsKey!0 (array!16175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317711 (= res!172288 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31804 res!172283) b!317703))

(assert (= (and b!317703 res!172285) b!317710))

(assert (= (and b!317710 res!172284) b!317711))

(assert (= (and b!317711 res!172288) b!317707))

(assert (= (and b!317707 res!172282) b!317708))

(assert (= (and b!317708 res!172281) b!317705))

(assert (= (and b!317705 res!172286) b!317706))

(assert (= (and b!317706 res!172289) b!317704))

(assert (= (and b!317704 res!172290) b!317709))

(assert (= (and b!317709 res!172287) b!317702))

(declare-fun m!326353 () Bool)

(assert (=> b!317710 m!326353))

(declare-fun m!326355 () Bool)

(assert (=> start!31804 m!326355))

(declare-fun m!326357 () Bool)

(assert (=> start!31804 m!326357))

(declare-fun m!326359 () Bool)

(assert (=> b!317709 m!326359))

(declare-fun m!326361 () Bool)

(assert (=> b!317709 m!326361))

(declare-fun m!326363 () Bool)

(assert (=> b!317704 m!326363))

(declare-fun m!326365 () Bool)

(assert (=> b!317704 m!326365))

(declare-fun m!326367 () Bool)

(assert (=> b!317711 m!326367))

(declare-fun m!326369 () Bool)

(assert (=> b!317705 m!326369))

(assert (=> b!317705 m!326369))

(declare-fun m!326371 () Bool)

(assert (=> b!317705 m!326371))

(declare-fun m!326373 () Bool)

(assert (=> b!317708 m!326373))

(declare-fun m!326375 () Bool)

(assert (=> b!317702 m!326375))

(declare-fun m!326377 () Bool)

(assert (=> b!317702 m!326377))

(declare-fun m!326379 () Bool)

(assert (=> b!317702 m!326379))

(declare-fun m!326381 () Bool)

(assert (=> b!317707 m!326381))

(declare-fun m!326383 () Bool)

(assert (=> b!317706 m!326383))

(check-sat (not b!317705) (not b!317708) (not b!317707) (not b!317711) (not b!317704) (not b!317710) (not start!31804) (not b!317702) (not b!317709))
(check-sat)
