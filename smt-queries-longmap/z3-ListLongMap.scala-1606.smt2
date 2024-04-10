; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30310 () Bool)

(assert start!30310)

(declare-fun b!303459 () Bool)

(declare-fun e!190966 () Bool)

(declare-fun e!190965 () Bool)

(assert (=> b!303459 (= e!190966 e!190965)))

(declare-fun res!160945 () Bool)

(assert (=> b!303459 (=> (not res!160945) (not e!190965))))

(declare-datatypes ((array!15416 0))(
  ( (array!15417 (arr!7296 (Array (_ BitVec 32) (_ BitVec 64))) (size!7648 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15416)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2436 0))(
  ( (MissingZero!2436 (index!11920 (_ BitVec 32))) (Found!2436 (index!11921 (_ BitVec 32))) (Intermediate!2436 (undefined!3248 Bool) (index!11922 (_ BitVec 32)) (x!30181 (_ BitVec 32))) (Undefined!2436) (MissingVacant!2436 (index!11923 (_ BitVec 32))) )
))
(declare-fun lt!150210 () SeekEntryResult!2436)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15416 (_ BitVec 32)) SeekEntryResult!2436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303459 (= res!160945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150210))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303459 (= lt!150210 (Intermediate!2436 false resIndex!52 resX!52))))

(declare-fun b!303460 () Bool)

(declare-fun res!160947 () Bool)

(assert (=> b!303460 (=> (not res!160947) (not e!190966))))

(declare-fun arrayContainsKey!0 (array!15416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303460 (= res!160947 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303461 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303461 (= e!190965 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7296 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7296 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7296 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun res!160946 () Bool)

(assert (=> start!30310 (=> (not res!160946) (not e!190966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30310 (= res!160946 (validMask!0 mask!3709))))

(assert (=> start!30310 e!190966))

(declare-fun array_inv!5259 (array!15416) Bool)

(assert (=> start!30310 (array_inv!5259 a!3293)))

(assert (=> start!30310 true))

(declare-fun b!303462 () Bool)

(declare-fun res!160952 () Bool)

(assert (=> b!303462 (=> (not res!160952) (not e!190965))))

(assert (=> b!303462 (= res!160952 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150210))))

(declare-fun b!303463 () Bool)

(declare-fun res!160953 () Bool)

(assert (=> b!303463 (=> (not res!160953) (not e!190966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15416 (_ BitVec 32)) Bool)

(assert (=> b!303463 (= res!160953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303464 () Bool)

(declare-fun res!160948 () Bool)

(assert (=> b!303464 (=> (not res!160948) (not e!190965))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303464 (= res!160948 (and (= (select (arr!7296 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7648 a!3293))))))

(declare-fun b!303465 () Bool)

(declare-fun res!160949 () Bool)

(assert (=> b!303465 (=> (not res!160949) (not e!190966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303465 (= res!160949 (validKeyInArray!0 k0!2441))))

(declare-fun b!303466 () Bool)

(declare-fun res!160951 () Bool)

(assert (=> b!303466 (=> (not res!160951) (not e!190966))))

(assert (=> b!303466 (= res!160951 (and (= (size!7648 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7648 a!3293))))))

(declare-fun b!303467 () Bool)

(declare-fun res!160950 () Bool)

(assert (=> b!303467 (=> (not res!160950) (not e!190966))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15416 (_ BitVec 32)) SeekEntryResult!2436)

(assert (=> b!303467 (= res!160950 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2436 i!1240)))))

(assert (= (and start!30310 res!160946) b!303466))

(assert (= (and b!303466 res!160951) b!303465))

(assert (= (and b!303465 res!160949) b!303460))

(assert (= (and b!303460 res!160947) b!303467))

(assert (= (and b!303467 res!160950) b!303463))

(assert (= (and b!303463 res!160953) b!303459))

(assert (= (and b!303459 res!160945) b!303464))

(assert (= (and b!303464 res!160948) b!303462))

(assert (= (and b!303462 res!160952) b!303461))

(declare-fun m!314805 () Bool)

(assert (=> b!303463 m!314805))

(declare-fun m!314807 () Bool)

(assert (=> b!303462 m!314807))

(declare-fun m!314809 () Bool)

(assert (=> start!30310 m!314809))

(declare-fun m!314811 () Bool)

(assert (=> start!30310 m!314811))

(declare-fun m!314813 () Bool)

(assert (=> b!303467 m!314813))

(declare-fun m!314815 () Bool)

(assert (=> b!303464 m!314815))

(declare-fun m!314817 () Bool)

(assert (=> b!303460 m!314817))

(declare-fun m!314819 () Bool)

(assert (=> b!303465 m!314819))

(declare-fun m!314821 () Bool)

(assert (=> b!303461 m!314821))

(declare-fun m!314823 () Bool)

(assert (=> b!303459 m!314823))

(assert (=> b!303459 m!314823))

(declare-fun m!314825 () Bool)

(assert (=> b!303459 m!314825))

(check-sat (not start!30310) (not b!303462) (not b!303460) (not b!303467) (not b!303463) (not b!303465) (not b!303459))
(check-sat)
