; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30582 () Bool)

(assert start!30582)

(declare-fun b!306827 () Bool)

(declare-fun res!163663 () Bool)

(declare-fun e!192303 () Bool)

(assert (=> b!306827 (=> (not res!163663) (not e!192303))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306827 (= res!163663 (validKeyInArray!0 k0!2441))))

(declare-fun b!306828 () Bool)

(declare-fun res!163666 () Bool)

(assert (=> b!306828 (=> (not res!163666) (not e!192303))))

(declare-datatypes ((array!15599 0))(
  ( (array!15600 (arr!7384 (Array (_ BitVec 32) (_ BitVec 64))) (size!7736 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15599)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2489 0))(
  ( (MissingZero!2489 (index!12132 (_ BitVec 32))) (Found!2489 (index!12133 (_ BitVec 32))) (Intermediate!2489 (undefined!3301 Bool) (index!12134 (_ BitVec 32)) (x!30489 (_ BitVec 32))) (Undefined!2489) (MissingVacant!2489 (index!12135 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15599 (_ BitVec 32)) SeekEntryResult!2489)

(assert (=> b!306828 (= res!163666 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2489 i!1240)))))

(declare-fun b!306829 () Bool)

(assert (=> b!306829 false))

(declare-fun lt!151075 () SeekEntryResult!2489)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15599 (_ BitVec 32)) SeekEntryResult!2489)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306829 (= lt!151075 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9528 0))(
  ( (Unit!9529) )
))
(declare-fun e!192304 () Unit!9528)

(declare-fun Unit!9530 () Unit!9528)

(assert (=> b!306829 (= e!192304 Unit!9530)))

(declare-fun b!306830 () Bool)

(assert (=> b!306830 false))

(declare-fun Unit!9531 () Unit!9528)

(assert (=> b!306830 (= e!192304 Unit!9531)))

(declare-fun b!306831 () Bool)

(declare-fun res!163667 () Bool)

(assert (=> b!306831 (=> (not res!163667) (not e!192303))))

(declare-fun arrayContainsKey!0 (array!15599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306831 (= res!163667 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306832 () Bool)

(declare-fun e!192305 () Bool)

(assert (=> b!306832 (= e!192303 e!192305)))

(declare-fun res!163668 () Bool)

(assert (=> b!306832 (=> (not res!163668) (not e!192305))))

(declare-fun lt!151077 () SeekEntryResult!2489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306832 (= res!163668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151077))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306832 (= lt!151077 (Intermediate!2489 false resIndex!52 resX!52))))

(declare-fun res!163659 () Bool)

(assert (=> start!30582 (=> (not res!163659) (not e!192303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30582 (= res!163659 (validMask!0 mask!3709))))

(assert (=> start!30582 e!192303))

(declare-fun array_inv!5334 (array!15599) Bool)

(assert (=> start!30582 (array_inv!5334 a!3293)))

(assert (=> start!30582 true))

(declare-fun b!306833 () Bool)

(declare-fun res!163664 () Bool)

(assert (=> b!306833 (=> (not res!163664) (not e!192303))))

(assert (=> b!306833 (= res!163664 (and (= (size!7736 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7736 a!3293))))))

(declare-fun b!306834 () Bool)

(declare-fun res!163661 () Bool)

(assert (=> b!306834 (=> (not res!163661) (not e!192305))))

(assert (=> b!306834 (= res!163661 (and (= (select (arr!7384 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7736 a!3293))))))

(declare-fun b!306835 () Bool)

(declare-fun res!163660 () Bool)

(assert (=> b!306835 (=> (not res!163660) (not e!192305))))

(assert (=> b!306835 (= res!163660 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151077))))

(declare-fun b!306836 () Bool)

(declare-fun res!163665 () Bool)

(assert (=> b!306836 (=> (not res!163665) (not e!192303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15599 (_ BitVec 32)) Bool)

(assert (=> b!306836 (= res!163665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306837 () Bool)

(declare-fun e!192302 () Unit!9528)

(assert (=> b!306837 (= e!192302 e!192304)))

(declare-fun c!49187 () Bool)

(assert (=> b!306837 (= c!49187 (or (= (select (arr!7384 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7384 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306838 () Bool)

(declare-fun Unit!9532 () Unit!9528)

(assert (=> b!306838 (= e!192302 Unit!9532)))

(declare-fun b!306839 () Bool)

(assert (=> b!306839 (= e!192305 (not true))))

(assert (=> b!306839 (= index!1781 resIndex!52)))

(declare-fun lt!151076 () Unit!9528)

(assert (=> b!306839 (= lt!151076 e!192302)))

(declare-fun c!49186 () Bool)

(assert (=> b!306839 (= c!49186 (not (= resIndex!52 index!1781)))))

(declare-fun b!306840 () Bool)

(declare-fun res!163662 () Bool)

(assert (=> b!306840 (=> (not res!163662) (not e!192305))))

(assert (=> b!306840 (= res!163662 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7384 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(assert (= (and start!30582 res!163659) b!306833))

(assert (= (and b!306833 res!163664) b!306827))

(assert (= (and b!306827 res!163663) b!306831))

(assert (= (and b!306831 res!163667) b!306828))

(assert (= (and b!306828 res!163666) b!306836))

(assert (= (and b!306836 res!163665) b!306832))

(assert (= (and b!306832 res!163668) b!306834))

(assert (= (and b!306834 res!163661) b!306835))

(assert (= (and b!306835 res!163660) b!306840))

(assert (= (and b!306840 res!163662) b!306839))

(assert (= (and b!306839 c!49186) b!306837))

(assert (= (and b!306839 (not c!49186)) b!306838))

(assert (= (and b!306837 c!49187) b!306830))

(assert (= (and b!306837 (not c!49187)) b!306829))

(declare-fun m!317425 () Bool)

(assert (=> b!306840 m!317425))

(declare-fun m!317427 () Bool)

(assert (=> b!306831 m!317427))

(declare-fun m!317429 () Bool)

(assert (=> start!30582 m!317429))

(declare-fun m!317431 () Bool)

(assert (=> start!30582 m!317431))

(assert (=> b!306837 m!317425))

(declare-fun m!317433 () Bool)

(assert (=> b!306832 m!317433))

(assert (=> b!306832 m!317433))

(declare-fun m!317435 () Bool)

(assert (=> b!306832 m!317435))

(declare-fun m!317437 () Bool)

(assert (=> b!306836 m!317437))

(declare-fun m!317439 () Bool)

(assert (=> b!306827 m!317439))

(declare-fun m!317441 () Bool)

(assert (=> b!306835 m!317441))

(declare-fun m!317443 () Bool)

(assert (=> b!306829 m!317443))

(assert (=> b!306829 m!317443))

(declare-fun m!317445 () Bool)

(assert (=> b!306829 m!317445))

(declare-fun m!317447 () Bool)

(assert (=> b!306828 m!317447))

(declare-fun m!317449 () Bool)

(assert (=> b!306834 m!317449))

(check-sat (not b!306832) (not b!306828) (not b!306836) (not b!306827) (not b!306829) (not start!30582) (not b!306831) (not b!306835))
(check-sat)
