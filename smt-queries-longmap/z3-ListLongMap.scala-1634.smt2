; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30570 () Bool)

(assert start!30570)

(declare-fun res!163355 () Bool)

(declare-fun e!192073 () Bool)

(assert (=> start!30570 (=> (not res!163355) (not e!192073))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30570 (= res!163355 (validMask!0 mask!3709))))

(assert (=> start!30570 e!192073))

(declare-datatypes ((array!15578 0))(
  ( (array!15579 (arr!7374 (Array (_ BitVec 32) (_ BitVec 64))) (size!7727 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15578)

(declare-fun array_inv!5346 (array!15578) Bool)

(assert (=> start!30570 (array_inv!5346 a!3293)))

(assert (=> start!30570 true))

(declare-fun b!306353 () Bool)

(declare-fun res!163357 () Bool)

(declare-fun e!192072 () Bool)

(assert (=> b!306353 (=> (not res!163357) (not e!192072))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306353 (= res!163357 (and (= (select (arr!7374 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7727 a!3293))))))

(declare-fun b!306354 () Bool)

(assert (=> b!306354 false))

(declare-datatypes ((SeekEntryResult!2513 0))(
  ( (MissingZero!2513 (index!12228 (_ BitVec 32))) (Found!2513 (index!12229 (_ BitVec 32))) (Intermediate!2513 (undefined!3325 Bool) (index!12230 (_ BitVec 32)) (x!30495 (_ BitVec 32))) (Undefined!2513) (MissingVacant!2513 (index!12231 (_ BitVec 32))) )
))
(declare-fun lt!150769 () SeekEntryResult!2513)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15578 (_ BitVec 32)) SeekEntryResult!2513)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306354 (= lt!150769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9496 0))(
  ( (Unit!9497) )
))
(declare-fun e!192071 () Unit!9496)

(declare-fun Unit!9498 () Unit!9496)

(assert (=> b!306354 (= e!192071 Unit!9498)))

(declare-fun b!306355 () Bool)

(declare-fun e!192070 () Unit!9496)

(declare-fun Unit!9499 () Unit!9496)

(assert (=> b!306355 (= e!192070 Unit!9499)))

(declare-fun b!306356 () Bool)

(assert (=> b!306356 (= e!192070 e!192071)))

(declare-fun c!49103 () Bool)

(assert (=> b!306356 (= c!49103 (or (= (select (arr!7374 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7374 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306357 () Bool)

(declare-fun res!163361 () Bool)

(assert (=> b!306357 (=> (not res!163361) (not e!192072))))

(declare-fun lt!150770 () SeekEntryResult!2513)

(assert (=> b!306357 (= res!163361 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150770))))

(declare-fun b!306358 () Bool)

(declare-fun res!163360 () Bool)

(assert (=> b!306358 (=> (not res!163360) (not e!192073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306358 (= res!163360 (validKeyInArray!0 k0!2441))))

(declare-fun b!306359 () Bool)

(declare-fun res!163358 () Bool)

(assert (=> b!306359 (=> (not res!163358) (not e!192073))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15578 (_ BitVec 32)) SeekEntryResult!2513)

(assert (=> b!306359 (= res!163358 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2513 i!1240)))))

(declare-fun b!306360 () Bool)

(declare-fun res!163362 () Bool)

(assert (=> b!306360 (=> (not res!163362) (not e!192073))))

(declare-fun arrayContainsKey!0 (array!15578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306360 (= res!163362 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306361 () Bool)

(declare-fun res!163353 () Bool)

(assert (=> b!306361 (=> (not res!163353) (not e!192073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15578 (_ BitVec 32)) Bool)

(assert (=> b!306361 (= res!163353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306362 () Bool)

(assert (=> b!306362 false))

(declare-fun Unit!9500 () Unit!9496)

(assert (=> b!306362 (= e!192071 Unit!9500)))

(declare-fun b!306363 () Bool)

(assert (=> b!306363 (= e!192073 e!192072)))

(declare-fun res!163354 () Bool)

(assert (=> b!306363 (=> (not res!163354) (not e!192072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306363 (= res!163354 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150770))))

(assert (=> b!306363 (= lt!150770 (Intermediate!2513 false resIndex!52 resX!52))))

(declare-fun b!306364 () Bool)

(declare-fun res!163356 () Bool)

(assert (=> b!306364 (=> (not res!163356) (not e!192072))))

(assert (=> b!306364 (= res!163356 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7374 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306365 () Bool)

(declare-fun res!163359 () Bool)

(assert (=> b!306365 (=> (not res!163359) (not e!192073))))

(assert (=> b!306365 (= res!163359 (and (= (size!7727 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7727 a!3293))))))

(declare-fun b!306366 () Bool)

(assert (=> b!306366 (= e!192072 (not (or (not (= (select (arr!7374 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!306366 (= index!1781 resIndex!52)))

(declare-fun lt!150768 () Unit!9496)

(assert (=> b!306366 (= lt!150768 e!192070)))

(declare-fun c!49102 () Bool)

(assert (=> b!306366 (= c!49102 (not (= resIndex!52 index!1781)))))

(assert (= (and start!30570 res!163355) b!306365))

(assert (= (and b!306365 res!163359) b!306358))

(assert (= (and b!306358 res!163360) b!306360))

(assert (= (and b!306360 res!163362) b!306359))

(assert (= (and b!306359 res!163358) b!306361))

(assert (= (and b!306361 res!163353) b!306363))

(assert (= (and b!306363 res!163354) b!306353))

(assert (= (and b!306353 res!163357) b!306357))

(assert (= (and b!306357 res!163361) b!306364))

(assert (= (and b!306364 res!163356) b!306366))

(assert (= (and b!306366 c!49102) b!306356))

(assert (= (and b!306366 (not c!49102)) b!306355))

(assert (= (and b!306356 c!49103) b!306362))

(assert (= (and b!306356 (not c!49103)) b!306354))

(declare-fun m!316417 () Bool)

(assert (=> b!306366 m!316417))

(declare-fun m!316419 () Bool)

(assert (=> b!306353 m!316419))

(declare-fun m!316421 () Bool)

(assert (=> b!306358 m!316421))

(declare-fun m!316423 () Bool)

(assert (=> b!306360 m!316423))

(assert (=> b!306364 m!316417))

(declare-fun m!316425 () Bool)

(assert (=> b!306354 m!316425))

(assert (=> b!306354 m!316425))

(declare-fun m!316427 () Bool)

(assert (=> b!306354 m!316427))

(declare-fun m!316429 () Bool)

(assert (=> start!30570 m!316429))

(declare-fun m!316431 () Bool)

(assert (=> start!30570 m!316431))

(declare-fun m!316433 () Bool)

(assert (=> b!306359 m!316433))

(declare-fun m!316435 () Bool)

(assert (=> b!306361 m!316435))

(declare-fun m!316437 () Bool)

(assert (=> b!306363 m!316437))

(assert (=> b!306363 m!316437))

(declare-fun m!316439 () Bool)

(assert (=> b!306363 m!316439))

(declare-fun m!316441 () Bool)

(assert (=> b!306357 m!316441))

(assert (=> b!306356 m!316417))

(check-sat (not start!30570) (not b!306363) (not b!306359) (not b!306358) (not b!306354) (not b!306357) (not b!306361) (not b!306360))
(check-sat)
