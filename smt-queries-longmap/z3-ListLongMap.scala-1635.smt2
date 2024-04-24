; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30576 () Bool)

(assert start!30576)

(declare-fun res!163573 () Bool)

(declare-fun e!192258 () Bool)

(assert (=> start!30576 (=> (not res!163573) (not e!192258))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30576 (= res!163573 (validMask!0 mask!3709))))

(assert (=> start!30576 e!192258))

(declare-datatypes ((array!15593 0))(
  ( (array!15594 (arr!7381 (Array (_ BitVec 32) (_ BitVec 64))) (size!7733 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15593)

(declare-fun array_inv!5331 (array!15593) Bool)

(assert (=> start!30576 (array_inv!5331 a!3293)))

(assert (=> start!30576 true))

(declare-fun b!306701 () Bool)

(assert (=> b!306701 false))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2486 0))(
  ( (MissingZero!2486 (index!12120 (_ BitVec 32))) (Found!2486 (index!12121 (_ BitVec 32))) (Intermediate!2486 (undefined!3298 Bool) (index!12122 (_ BitVec 32)) (x!30478 (_ BitVec 32))) (Undefined!2486) (MissingVacant!2486 (index!12123 (_ BitVec 32))) )
))
(declare-fun lt!151050 () SeekEntryResult!2486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15593 (_ BitVec 32)) SeekEntryResult!2486)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306701 (= lt!151050 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9513 0))(
  ( (Unit!9514) )
))
(declare-fun e!192260 () Unit!9513)

(declare-fun Unit!9515 () Unit!9513)

(assert (=> b!306701 (= e!192260 Unit!9515)))

(declare-fun b!306702 () Bool)

(declare-fun e!192259 () Bool)

(assert (=> b!306702 (= e!192258 e!192259)))

(declare-fun res!163576 () Bool)

(assert (=> b!306702 (=> (not res!163576) (not e!192259))))

(declare-fun lt!151049 () SeekEntryResult!2486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306702 (= res!163576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151049))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306702 (= lt!151049 (Intermediate!2486 false resIndex!52 resX!52))))

(declare-fun b!306703 () Bool)

(assert (=> b!306703 false))

(declare-fun Unit!9516 () Unit!9513)

(assert (=> b!306703 (= e!192260 Unit!9516)))

(declare-fun b!306704 () Bool)

(declare-fun res!163569 () Bool)

(assert (=> b!306704 (=> (not res!163569) (not e!192258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306704 (= res!163569 (validKeyInArray!0 k0!2441))))

(declare-fun b!306705 () Bool)

(declare-fun e!192261 () Unit!9513)

(declare-fun Unit!9517 () Unit!9513)

(assert (=> b!306705 (= e!192261 Unit!9517)))

(declare-fun b!306706 () Bool)

(declare-fun res!163571 () Bool)

(assert (=> b!306706 (=> (not res!163571) (not e!192259))))

(assert (=> b!306706 (= res!163571 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151049))))

(declare-fun b!306707 () Bool)

(declare-fun res!163574 () Bool)

(assert (=> b!306707 (=> (not res!163574) (not e!192258))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306707 (= res!163574 (and (= (size!7733 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7733 a!3293))))))

(declare-fun b!306708 () Bool)

(assert (=> b!306708 (= e!192261 e!192260)))

(declare-fun c!49168 () Bool)

(assert (=> b!306708 (= c!49168 (or (= (select (arr!7381 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7381 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306709 () Bool)

(declare-fun res!163570 () Bool)

(assert (=> b!306709 (=> (not res!163570) (not e!192258))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15593 (_ BitVec 32)) SeekEntryResult!2486)

(assert (=> b!306709 (= res!163570 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2486 i!1240)))))

(declare-fun b!306710 () Bool)

(declare-fun res!163575 () Bool)

(assert (=> b!306710 (=> (not res!163575) (not e!192259))))

(assert (=> b!306710 (= res!163575 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7381 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306711 () Bool)

(assert (=> b!306711 (= e!192259 (not (or (not (= (select (arr!7381 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!306711 (= index!1781 resIndex!52)))

(declare-fun lt!151048 () Unit!9513)

(assert (=> b!306711 (= lt!151048 e!192261)))

(declare-fun c!49169 () Bool)

(assert (=> b!306711 (= c!49169 (not (= resIndex!52 index!1781)))))

(declare-fun b!306712 () Bool)

(declare-fun res!163578 () Bool)

(assert (=> b!306712 (=> (not res!163578) (not e!192258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15593 (_ BitVec 32)) Bool)

(assert (=> b!306712 (= res!163578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306713 () Bool)

(declare-fun res!163577 () Bool)

(assert (=> b!306713 (=> (not res!163577) (not e!192258))))

(declare-fun arrayContainsKey!0 (array!15593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306713 (= res!163577 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306714 () Bool)

(declare-fun res!163572 () Bool)

(assert (=> b!306714 (=> (not res!163572) (not e!192259))))

(assert (=> b!306714 (= res!163572 (and (= (select (arr!7381 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7733 a!3293))))))

(assert (= (and start!30576 res!163573) b!306707))

(assert (= (and b!306707 res!163574) b!306704))

(assert (= (and b!306704 res!163569) b!306713))

(assert (= (and b!306713 res!163577) b!306709))

(assert (= (and b!306709 res!163570) b!306712))

(assert (= (and b!306712 res!163578) b!306702))

(assert (= (and b!306702 res!163576) b!306714))

(assert (= (and b!306714 res!163572) b!306706))

(assert (= (and b!306706 res!163571) b!306710))

(assert (= (and b!306710 res!163575) b!306711))

(assert (= (and b!306711 c!49169) b!306708))

(assert (= (and b!306711 (not c!49169)) b!306705))

(assert (= (and b!306708 c!49168) b!306703))

(assert (= (and b!306708 (not c!49168)) b!306701))

(declare-fun m!317347 () Bool)

(assert (=> start!30576 m!317347))

(declare-fun m!317349 () Bool)

(assert (=> start!30576 m!317349))

(declare-fun m!317351 () Bool)

(assert (=> b!306710 m!317351))

(declare-fun m!317353 () Bool)

(assert (=> b!306709 m!317353))

(assert (=> b!306708 m!317351))

(assert (=> b!306711 m!317351))

(declare-fun m!317355 () Bool)

(assert (=> b!306702 m!317355))

(assert (=> b!306702 m!317355))

(declare-fun m!317357 () Bool)

(assert (=> b!306702 m!317357))

(declare-fun m!317359 () Bool)

(assert (=> b!306713 m!317359))

(declare-fun m!317361 () Bool)

(assert (=> b!306701 m!317361))

(assert (=> b!306701 m!317361))

(declare-fun m!317363 () Bool)

(assert (=> b!306701 m!317363))

(declare-fun m!317365 () Bool)

(assert (=> b!306714 m!317365))

(declare-fun m!317367 () Bool)

(assert (=> b!306712 m!317367))

(declare-fun m!317369 () Bool)

(assert (=> b!306704 m!317369))

(declare-fun m!317371 () Bool)

(assert (=> b!306706 m!317371))

(check-sat (not b!306712) (not b!306704) (not b!306701) (not b!306702) (not b!306713) (not start!30576) (not b!306706) (not b!306709))
(check-sat)
