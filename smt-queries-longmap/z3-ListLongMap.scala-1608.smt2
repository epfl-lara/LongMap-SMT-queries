; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30306 () Bool)

(assert start!30306)

(declare-fun b!303541 () Bool)

(declare-fun res!161080 () Bool)

(declare-fun e!190976 () Bool)

(assert (=> b!303541 (=> (not res!161080) (not e!190976))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2405 0))(
  ( (MissingZero!2405 (index!11796 (_ BitVec 32))) (Found!2405 (index!11797 (_ BitVec 32))) (Intermediate!2405 (undefined!3217 Bool) (index!11798 (_ BitVec 32)) (x!30163 (_ BitVec 32))) (Undefined!2405) (MissingVacant!2405 (index!11799 (_ BitVec 32))) )
))
(declare-fun lt!150243 () SeekEntryResult!2405)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15425 0))(
  ( (array!15426 (arr!7300 (Array (_ BitVec 32) (_ BitVec 64))) (size!7652 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15425)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15425 (_ BitVec 32)) SeekEntryResult!2405)

(assert (=> b!303541 (= res!161080 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150243))))

(declare-fun b!303542 () Bool)

(declare-fun res!161078 () Bool)

(declare-fun e!190977 () Bool)

(assert (=> b!303542 (=> (not res!161078) (not e!190977))))

(declare-fun arrayContainsKey!0 (array!15425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303542 (= res!161078 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303543 () Bool)

(declare-fun res!161085 () Bool)

(assert (=> b!303543 (=> (not res!161085) (not e!190977))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303543 (= res!161085 (and (= (size!7652 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7652 a!3293))))))

(declare-fun res!161082 () Bool)

(assert (=> start!30306 (=> (not res!161082) (not e!190977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30306 (= res!161082 (validMask!0 mask!3709))))

(assert (=> start!30306 e!190977))

(declare-fun array_inv!5250 (array!15425) Bool)

(assert (=> start!30306 (array_inv!5250 a!3293)))

(assert (=> start!30306 true))

(declare-fun b!303544 () Bool)

(declare-fun res!161079 () Bool)

(assert (=> b!303544 (=> (not res!161079) (not e!190977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303544 (= res!161079 (validKeyInArray!0 k0!2441))))

(declare-fun b!303545 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303545 (= e!190976 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7300 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7300 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7300 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun b!303546 () Bool)

(declare-fun res!161084 () Bool)

(assert (=> b!303546 (=> (not res!161084) (not e!190977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15425 (_ BitVec 32)) Bool)

(assert (=> b!303546 (= res!161084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303547 () Bool)

(assert (=> b!303547 (= e!190977 e!190976)))

(declare-fun res!161083 () Bool)

(assert (=> b!303547 (=> (not res!161083) (not e!190976))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303547 (= res!161083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150243))))

(assert (=> b!303547 (= lt!150243 (Intermediate!2405 false resIndex!52 resX!52))))

(declare-fun b!303548 () Bool)

(declare-fun res!161077 () Bool)

(assert (=> b!303548 (=> (not res!161077) (not e!190976))))

(assert (=> b!303548 (= res!161077 (and (= (select (arr!7300 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7652 a!3293))))))

(declare-fun b!303549 () Bool)

(declare-fun res!161081 () Bool)

(assert (=> b!303549 (=> (not res!161081) (not e!190977))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15425 (_ BitVec 32)) SeekEntryResult!2405)

(assert (=> b!303549 (= res!161081 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2405 i!1240)))))

(assert (= (and start!30306 res!161082) b!303543))

(assert (= (and b!303543 res!161085) b!303544))

(assert (= (and b!303544 res!161079) b!303542))

(assert (= (and b!303542 res!161078) b!303549))

(assert (= (and b!303549 res!161081) b!303546))

(assert (= (and b!303546 res!161084) b!303547))

(assert (= (and b!303547 res!161083) b!303548))

(assert (= (and b!303548 res!161077) b!303541))

(assert (= (and b!303541 res!161080) b!303545))

(declare-fun m!315025 () Bool)

(assert (=> b!303547 m!315025))

(assert (=> b!303547 m!315025))

(declare-fun m!315027 () Bool)

(assert (=> b!303547 m!315027))

(declare-fun m!315029 () Bool)

(assert (=> b!303545 m!315029))

(declare-fun m!315031 () Bool)

(assert (=> start!30306 m!315031))

(declare-fun m!315033 () Bool)

(assert (=> start!30306 m!315033))

(declare-fun m!315035 () Bool)

(assert (=> b!303542 m!315035))

(declare-fun m!315037 () Bool)

(assert (=> b!303544 m!315037))

(declare-fun m!315039 () Bool)

(assert (=> b!303541 m!315039))

(declare-fun m!315041 () Bool)

(assert (=> b!303548 m!315041))

(declare-fun m!315043 () Bool)

(assert (=> b!303549 m!315043))

(declare-fun m!315045 () Bool)

(assert (=> b!303546 m!315045))

(check-sat (not b!303549) (not b!303542) (not b!303547) (not b!303546) (not b!303541) (not b!303544) (not start!30306))
(check-sat)
