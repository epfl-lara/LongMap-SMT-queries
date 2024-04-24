; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30570 () Bool)

(assert start!30570)

(declare-fun b!306575 () Bool)

(declare-fun e!192215 () Bool)

(declare-fun e!192212 () Bool)

(assert (=> b!306575 (= e!192215 e!192212)))

(declare-fun res!163483 () Bool)

(assert (=> b!306575 (=> (not res!163483) (not e!192212))))

(declare-datatypes ((array!15587 0))(
  ( (array!15588 (arr!7378 (Array (_ BitVec 32) (_ BitVec 64))) (size!7730 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15587)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2483 0))(
  ( (MissingZero!2483 (index!12108 (_ BitVec 32))) (Found!2483 (index!12109 (_ BitVec 32))) (Intermediate!2483 (undefined!3295 Bool) (index!12110 (_ BitVec 32)) (x!30467 (_ BitVec 32))) (Undefined!2483) (MissingVacant!2483 (index!12111 (_ BitVec 32))) )
))
(declare-fun lt!151023 () SeekEntryResult!2483)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15587 (_ BitVec 32)) SeekEntryResult!2483)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306575 (= res!163483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151023))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306575 (= lt!151023 (Intermediate!2483 false resIndex!52 resX!52))))

(declare-fun b!306576 () Bool)

(declare-datatypes ((Unit!9498 0))(
  ( (Unit!9499) )
))
(declare-fun e!192213 () Unit!9498)

(declare-fun Unit!9500 () Unit!9498)

(assert (=> b!306576 (= e!192213 Unit!9500)))

(declare-fun b!306577 () Bool)

(declare-fun res!163486 () Bool)

(assert (=> b!306577 (=> (not res!163486) (not e!192215))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306577 (= res!163486 (and (= (size!7730 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7730 a!3293))))))

(declare-fun b!306578 () Bool)

(declare-fun res!163488 () Bool)

(assert (=> b!306578 (=> (not res!163488) (not e!192212))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306578 (= res!163488 (and (= (select (arr!7378 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7730 a!3293))))))

(declare-fun b!306579 () Bool)

(declare-fun e!192214 () Unit!9498)

(assert (=> b!306579 (= e!192213 e!192214)))

(declare-fun c!49151 () Bool)

(assert (=> b!306579 (= c!49151 (or (= (select (arr!7378 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7378 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306580 () Bool)

(declare-fun res!163481 () Bool)

(assert (=> b!306580 (=> (not res!163481) (not e!192215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306580 (= res!163481 (validKeyInArray!0 k0!2441))))

(declare-fun b!306581 () Bool)

(declare-fun res!163479 () Bool)

(assert (=> b!306581 (=> (not res!163479) (not e!192212))))

(assert (=> b!306581 (= res!163479 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7378 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306582 () Bool)

(declare-fun res!163484 () Bool)

(assert (=> b!306582 (=> (not res!163484) (not e!192215))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15587 (_ BitVec 32)) SeekEntryResult!2483)

(assert (=> b!306582 (= res!163484 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2483 i!1240)))))

(declare-fun b!306583 () Bool)

(declare-fun res!163480 () Bool)

(assert (=> b!306583 (=> (not res!163480) (not e!192215))))

(declare-fun arrayContainsKey!0 (array!15587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306583 (= res!163480 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306584 () Bool)

(assert (=> b!306584 (= e!192212 (not (or (not (= (select (arr!7378 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!306584 (= index!1781 resIndex!52)))

(declare-fun lt!151022 () Unit!9498)

(assert (=> b!306584 (= lt!151022 e!192213)))

(declare-fun c!49150 () Bool)

(assert (=> b!306584 (= c!49150 (not (= resIndex!52 index!1781)))))

(declare-fun res!163487 () Bool)

(assert (=> start!30570 (=> (not res!163487) (not e!192215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30570 (= res!163487 (validMask!0 mask!3709))))

(assert (=> start!30570 e!192215))

(declare-fun array_inv!5328 (array!15587) Bool)

(assert (=> start!30570 (array_inv!5328 a!3293)))

(assert (=> start!30570 true))

(declare-fun b!306585 () Bool)

(declare-fun res!163482 () Bool)

(assert (=> b!306585 (=> (not res!163482) (not e!192215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15587 (_ BitVec 32)) Bool)

(assert (=> b!306585 (= res!163482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306586 () Bool)

(assert (=> b!306586 false))

(declare-fun lt!151021 () SeekEntryResult!2483)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306586 (= lt!151021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9501 () Unit!9498)

(assert (=> b!306586 (= e!192214 Unit!9501)))

(declare-fun b!306587 () Bool)

(assert (=> b!306587 false))

(declare-fun Unit!9502 () Unit!9498)

(assert (=> b!306587 (= e!192214 Unit!9502)))

(declare-fun b!306588 () Bool)

(declare-fun res!163485 () Bool)

(assert (=> b!306588 (=> (not res!163485) (not e!192212))))

(assert (=> b!306588 (= res!163485 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151023))))

(assert (= (and start!30570 res!163487) b!306577))

(assert (= (and b!306577 res!163486) b!306580))

(assert (= (and b!306580 res!163481) b!306583))

(assert (= (and b!306583 res!163480) b!306582))

(assert (= (and b!306582 res!163484) b!306585))

(assert (= (and b!306585 res!163482) b!306575))

(assert (= (and b!306575 res!163483) b!306578))

(assert (= (and b!306578 res!163488) b!306588))

(assert (= (and b!306588 res!163485) b!306581))

(assert (= (and b!306581 res!163479) b!306584))

(assert (= (and b!306584 c!49150) b!306579))

(assert (= (and b!306584 (not c!49150)) b!306576))

(assert (= (and b!306579 c!49151) b!306587))

(assert (= (and b!306579 (not c!49151)) b!306586))

(declare-fun m!317269 () Bool)

(assert (=> b!306580 m!317269))

(declare-fun m!317271 () Bool)

(assert (=> b!306582 m!317271))

(declare-fun m!317273 () Bool)

(assert (=> b!306585 m!317273))

(declare-fun m!317275 () Bool)

(assert (=> b!306575 m!317275))

(assert (=> b!306575 m!317275))

(declare-fun m!317277 () Bool)

(assert (=> b!306575 m!317277))

(declare-fun m!317279 () Bool)

(assert (=> b!306578 m!317279))

(declare-fun m!317281 () Bool)

(assert (=> b!306579 m!317281))

(assert (=> b!306581 m!317281))

(declare-fun m!317283 () Bool)

(assert (=> start!30570 m!317283))

(declare-fun m!317285 () Bool)

(assert (=> start!30570 m!317285))

(declare-fun m!317287 () Bool)

(assert (=> b!306583 m!317287))

(declare-fun m!317289 () Bool)

(assert (=> b!306588 m!317289))

(assert (=> b!306584 m!317281))

(declare-fun m!317291 () Bool)

(assert (=> b!306586 m!317291))

(assert (=> b!306586 m!317291))

(declare-fun m!317293 () Bool)

(assert (=> b!306586 m!317293))

(check-sat (not b!306588) (not b!306580) (not b!306583) (not b!306586) (not b!306582) (not b!306585) (not start!30570) (not b!306575))
(check-sat)
