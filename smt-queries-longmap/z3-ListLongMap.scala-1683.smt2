; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30988 () Bool)

(assert start!30988)

(declare-fun lt!152322 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!311357 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun e!194277 () Bool)

(declare-datatypes ((array!15890 0))(
  ( (array!15891 (arr!7527 (Array (_ BitVec 32) (_ BitVec 64))) (size!7879 (_ BitVec 32))) )
))
(declare-fun lt!152323 () array!15890)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2667 0))(
  ( (MissingZero!2667 (index!12844 (_ BitVec 32))) (Found!2667 (index!12845 (_ BitVec 32))) (Intermediate!2667 (undefined!3479 Bool) (index!12846 (_ BitVec 32)) (x!31064 (_ BitVec 32))) (Undefined!2667) (MissingVacant!2667 (index!12847 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15890 (_ BitVec 32)) SeekEntryResult!2667)

(assert (=> b!311357 (= e!194277 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152323 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152322 k0!2441 lt!152323 mask!3709)))))

(declare-fun a!3293 () array!15890)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311357 (= lt!152323 (array!15891 (store (arr!7527 a!3293) i!1240 k0!2441) (size!7879 a!3293)))))

(declare-fun b!311358 () Bool)

(declare-fun res!167813 () Bool)

(declare-fun e!194278 () Bool)

(assert (=> b!311358 (=> (not res!167813) (not e!194278))))

(assert (=> b!311358 (= res!167813 (and (= (size!7879 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7879 a!3293))))))

(declare-fun b!311359 () Bool)

(declare-fun res!167820 () Bool)

(assert (=> b!311359 (=> (not res!167820) (not e!194278))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15890 (_ BitVec 32)) SeekEntryResult!2667)

(assert (=> b!311359 (= res!167820 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2667 i!1240)))))

(declare-fun res!167819 () Bool)

(assert (=> start!30988 (=> (not res!167819) (not e!194278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30988 (= res!167819 (validMask!0 mask!3709))))

(assert (=> start!30988 e!194278))

(declare-fun array_inv!5490 (array!15890) Bool)

(assert (=> start!30988 (array_inv!5490 a!3293)))

(assert (=> start!30988 true))

(declare-fun b!311360 () Bool)

(declare-fun e!194280 () Bool)

(assert (=> b!311360 (= e!194278 e!194280)))

(declare-fun res!167811 () Bool)

(assert (=> b!311360 (=> (not res!167811) (not e!194280))))

(declare-fun lt!152324 () SeekEntryResult!2667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311360 (= res!167811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152324))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311360 (= lt!152324 (Intermediate!2667 false resIndex!52 resX!52))))

(declare-fun b!311361 () Bool)

(declare-fun res!167815 () Bool)

(assert (=> b!311361 (=> (not res!167815) (not e!194278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15890 (_ BitVec 32)) Bool)

(assert (=> b!311361 (= res!167815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311362 () Bool)

(declare-fun e!194279 () Bool)

(assert (=> b!311362 (= e!194280 e!194279)))

(declare-fun res!167817 () Bool)

(assert (=> b!311362 (=> (not res!167817) (not e!194279))))

(declare-fun lt!152325 () SeekEntryResult!2667)

(assert (=> b!311362 (= res!167817 (and (= lt!152325 lt!152324) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7527 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311362 (= lt!152325 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311363 () Bool)

(declare-fun res!167814 () Bool)

(assert (=> b!311363 (=> (not res!167814) (not e!194280))))

(assert (=> b!311363 (= res!167814 (and (= (select (arr!7527 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7879 a!3293))))))

(declare-fun b!311364 () Bool)

(declare-fun res!167818 () Bool)

(assert (=> b!311364 (=> (not res!167818) (not e!194278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311364 (= res!167818 (validKeyInArray!0 k0!2441))))

(declare-fun b!311365 () Bool)

(declare-fun res!167816 () Bool)

(assert (=> b!311365 (=> (not res!167816) (not e!194278))))

(declare-fun arrayContainsKey!0 (array!15890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311365 (= res!167816 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311366 () Bool)

(assert (=> b!311366 (= e!194279 (not true))))

(assert (=> b!311366 e!194277))

(declare-fun res!167812 () Bool)

(assert (=> b!311366 (=> (not res!167812) (not e!194277))))

(assert (=> b!311366 (= res!167812 (= lt!152325 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152322 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311366 (= lt!152322 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30988 res!167819) b!311358))

(assert (= (and b!311358 res!167813) b!311364))

(assert (= (and b!311364 res!167818) b!311365))

(assert (= (and b!311365 res!167816) b!311359))

(assert (= (and b!311359 res!167820) b!311361))

(assert (= (and b!311361 res!167815) b!311360))

(assert (= (and b!311360 res!167811) b!311363))

(assert (= (and b!311363 res!167814) b!311362))

(assert (= (and b!311362 res!167817) b!311366))

(assert (= (and b!311366 res!167812) b!311357))

(declare-fun m!321325 () Bool)

(assert (=> b!311361 m!321325))

(declare-fun m!321327 () Bool)

(assert (=> b!311360 m!321327))

(assert (=> b!311360 m!321327))

(declare-fun m!321329 () Bool)

(assert (=> b!311360 m!321329))

(declare-fun m!321331 () Bool)

(assert (=> b!311366 m!321331))

(declare-fun m!321333 () Bool)

(assert (=> b!311366 m!321333))

(declare-fun m!321335 () Bool)

(assert (=> b!311364 m!321335))

(declare-fun m!321337 () Bool)

(assert (=> b!311359 m!321337))

(declare-fun m!321339 () Bool)

(assert (=> b!311357 m!321339))

(declare-fun m!321341 () Bool)

(assert (=> b!311357 m!321341))

(declare-fun m!321343 () Bool)

(assert (=> b!311357 m!321343))

(declare-fun m!321345 () Bool)

(assert (=> start!30988 m!321345))

(declare-fun m!321347 () Bool)

(assert (=> start!30988 m!321347))

(declare-fun m!321349 () Bool)

(assert (=> b!311362 m!321349))

(declare-fun m!321351 () Bool)

(assert (=> b!311362 m!321351))

(declare-fun m!321353 () Bool)

(assert (=> b!311363 m!321353))

(declare-fun m!321355 () Bool)

(assert (=> b!311365 m!321355))

(check-sat (not b!311364) (not b!311366) (not b!311361) (not b!311362) (not b!311360) (not b!311365) (not b!311357) (not b!311359) (not start!30988))
(check-sat)
