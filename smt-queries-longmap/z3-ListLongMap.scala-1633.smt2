; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30580 () Bool)

(assert start!30580)

(declare-fun b!306544 () Bool)

(declare-fun res!163428 () Bool)

(declare-fun e!192220 () Bool)

(assert (=> b!306544 (=> (not res!163428) (not e!192220))))

(declare-datatypes ((array!15584 0))(
  ( (array!15585 (arr!7377 (Array (_ BitVec 32) (_ BitVec 64))) (size!7729 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15584)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15584 (_ BitVec 32)) Bool)

(assert (=> b!306544 (= res!163428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306545 () Bool)

(declare-fun res!163423 () Bool)

(assert (=> b!306545 (=> (not res!163423) (not e!192220))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306545 (= res!163423 (and (= (size!7729 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7729 a!3293))))))

(declare-fun b!306546 () Bool)

(declare-datatypes ((Unit!9526 0))(
  ( (Unit!9527) )
))
(declare-fun e!192218 () Unit!9526)

(declare-fun Unit!9528 () Unit!9526)

(assert (=> b!306546 (= e!192218 Unit!9528)))

(declare-fun b!306547 () Bool)

(assert (=> b!306547 false))

(declare-fun e!192219 () Unit!9526)

(declare-fun Unit!9529 () Unit!9526)

(assert (=> b!306547 (= e!192219 Unit!9529)))

(declare-fun res!163422 () Bool)

(assert (=> start!30580 (=> (not res!163422) (not e!192220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30580 (= res!163422 (validMask!0 mask!3709))))

(assert (=> start!30580 e!192220))

(declare-fun array_inv!5340 (array!15584) Bool)

(assert (=> start!30580 (array_inv!5340 a!3293)))

(assert (=> start!30580 true))

(declare-fun b!306548 () Bool)

(declare-fun res!163426 () Bool)

(assert (=> b!306548 (=> (not res!163426) (not e!192220))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306548 (= res!163426 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306549 () Bool)

(declare-fun res!163430 () Bool)

(declare-fun e!192217 () Bool)

(assert (=> b!306549 (=> (not res!163430) (not e!192217))))

(declare-datatypes ((SeekEntryResult!2517 0))(
  ( (MissingZero!2517 (index!12244 (_ BitVec 32))) (Found!2517 (index!12245 (_ BitVec 32))) (Intermediate!2517 (undefined!3329 Bool) (index!12246 (_ BitVec 32)) (x!30496 (_ BitVec 32))) (Undefined!2517) (MissingVacant!2517 (index!12247 (_ BitVec 32))) )
))
(declare-fun lt!150987 () SeekEntryResult!2517)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15584 (_ BitVec 32)) SeekEntryResult!2517)

(assert (=> b!306549 (= res!163430 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150987))))

(declare-fun b!306550 () Bool)

(declare-fun res!163425 () Bool)

(assert (=> b!306550 (=> (not res!163425) (not e!192220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306550 (= res!163425 (validKeyInArray!0 k0!2441))))

(declare-fun b!306551 () Bool)

(declare-fun res!163429 () Bool)

(assert (=> b!306551 (=> (not res!163429) (not e!192217))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306551 (= res!163429 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7377 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306552 () Bool)

(declare-fun res!163431 () Bool)

(assert (=> b!306552 (=> (not res!163431) (not e!192217))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306552 (= res!163431 (and (= (select (arr!7377 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7729 a!3293))))))

(declare-fun b!306553 () Bool)

(assert (=> b!306553 (= e!192220 e!192217)))

(declare-fun res!163427 () Bool)

(assert (=> b!306553 (=> (not res!163427) (not e!192217))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306553 (= res!163427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150987))))

(assert (=> b!306553 (= lt!150987 (Intermediate!2517 false resIndex!52 resX!52))))

(declare-fun b!306554 () Bool)

(declare-fun res!163424 () Bool)

(assert (=> b!306554 (=> (not res!163424) (not e!192220))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15584 (_ BitVec 32)) SeekEntryResult!2517)

(assert (=> b!306554 (= res!163424 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2517 i!1240)))))

(declare-fun b!306555 () Bool)

(assert (=> b!306555 (= e!192218 e!192219)))

(declare-fun c!49164 () Bool)

(assert (=> b!306555 (= c!49164 (or (= (select (arr!7377 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7377 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306556 () Bool)

(assert (=> b!306556 (= e!192217 (not true))))

(assert (=> b!306556 (= index!1781 resIndex!52)))

(declare-fun lt!150986 () Unit!9526)

(assert (=> b!306556 (= lt!150986 e!192218)))

(declare-fun c!49163 () Bool)

(assert (=> b!306556 (= c!49163 (not (= resIndex!52 index!1781)))))

(declare-fun b!306557 () Bool)

(assert (=> b!306557 false))

(declare-fun lt!150985 () SeekEntryResult!2517)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306557 (= lt!150985 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9530 () Unit!9526)

(assert (=> b!306557 (= e!192219 Unit!9530)))

(assert (= (and start!30580 res!163422) b!306545))

(assert (= (and b!306545 res!163423) b!306550))

(assert (= (and b!306550 res!163425) b!306548))

(assert (= (and b!306548 res!163426) b!306554))

(assert (= (and b!306554 res!163424) b!306544))

(assert (= (and b!306544 res!163428) b!306553))

(assert (= (and b!306553 res!163427) b!306552))

(assert (= (and b!306552 res!163431) b!306549))

(assert (= (and b!306549 res!163430) b!306551))

(assert (= (and b!306551 res!163429) b!306556))

(assert (= (and b!306556 c!49163) b!306555))

(assert (= (and b!306556 (not c!49163)) b!306546))

(assert (= (and b!306555 c!49164) b!306547))

(assert (= (and b!306555 (not c!49164)) b!306557))

(declare-fun m!317095 () Bool)

(assert (=> start!30580 m!317095))

(declare-fun m!317097 () Bool)

(assert (=> start!30580 m!317097))

(declare-fun m!317099 () Bool)

(assert (=> b!306550 m!317099))

(declare-fun m!317101 () Bool)

(assert (=> b!306557 m!317101))

(assert (=> b!306557 m!317101))

(declare-fun m!317103 () Bool)

(assert (=> b!306557 m!317103))

(declare-fun m!317105 () Bool)

(assert (=> b!306555 m!317105))

(declare-fun m!317107 () Bool)

(assert (=> b!306552 m!317107))

(assert (=> b!306551 m!317105))

(declare-fun m!317109 () Bool)

(assert (=> b!306553 m!317109))

(assert (=> b!306553 m!317109))

(declare-fun m!317111 () Bool)

(assert (=> b!306553 m!317111))

(declare-fun m!317113 () Bool)

(assert (=> b!306544 m!317113))

(declare-fun m!317115 () Bool)

(assert (=> b!306548 m!317115))

(declare-fun m!317117 () Bool)

(assert (=> b!306554 m!317117))

(declare-fun m!317119 () Bool)

(assert (=> b!306549 m!317119))

(check-sat (not b!306554) (not start!30580) (not b!306544) (not b!306548) (not b!306550) (not b!306549) (not b!306553) (not b!306557))
(check-sat)
