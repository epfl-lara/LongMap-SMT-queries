; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30592 () Bool)

(assert start!30592)

(declare-fun b!306767 () Bool)

(declare-fun res!163667 () Bool)

(declare-fun e!192212 () Bool)

(assert (=> b!306767 (=> (not res!163667) (not e!192212))))

(declare-datatypes ((array!15600 0))(
  ( (array!15601 (arr!7385 (Array (_ BitVec 32) (_ BitVec 64))) (size!7738 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15600)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306767 (= res!163667 (and (= (select (arr!7385 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7738 a!3293))))))

(declare-fun b!306768 () Bool)

(declare-fun res!163674 () Bool)

(assert (=> b!306768 (=> (not res!163674) (not e!192212))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!306768 (= res!163674 (and (= (size!7738 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7738 a!3293))))))

(declare-fun b!306769 () Bool)

(declare-fun res!163673 () Bool)

(assert (=> b!306769 (=> (not res!163673) (not e!192212))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306769 (= res!163673 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306770 () Bool)

(assert (=> b!306770 (= e!192212 false)))

(declare-datatypes ((SeekEntryResult!2524 0))(
  ( (MissingZero!2524 (index!12272 (_ BitVec 32))) (Found!2524 (index!12273 (_ BitVec 32))) (Intermediate!2524 (undefined!3336 Bool) (index!12274 (_ BitVec 32)) (x!30530 (_ BitVec 32))) (Undefined!2524) (MissingVacant!2524 (index!12275 (_ BitVec 32))) )
))
(declare-fun lt!150851 () SeekEntryResult!2524)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15600 (_ BitVec 32)) SeekEntryResult!2524)

(assert (=> b!306770 (= lt!150851 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!306771 () Bool)

(declare-fun res!163670 () Bool)

(assert (=> b!306771 (=> (not res!163670) (not e!192212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15600 (_ BitVec 32)) Bool)

(assert (=> b!306771 (= res!163670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306772 () Bool)

(declare-fun res!163669 () Bool)

(assert (=> b!306772 (=> (not res!163669) (not e!192212))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15600 (_ BitVec 32)) SeekEntryResult!2524)

(assert (=> b!306772 (= res!163669 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2524 i!1240)))))

(declare-fun res!163668 () Bool)

(assert (=> start!30592 (=> (not res!163668) (not e!192212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30592 (= res!163668 (validMask!0 mask!3709))))

(assert (=> start!30592 e!192212))

(declare-fun array_inv!5357 (array!15600) Bool)

(assert (=> start!30592 (array_inv!5357 a!3293)))

(assert (=> start!30592 true))

(declare-fun b!306773 () Bool)

(declare-fun res!163672 () Bool)

(assert (=> b!306773 (=> (not res!163672) (not e!192212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306773 (= res!163672 (validKeyInArray!0 k!2441))))

(declare-fun b!306774 () Bool)

(declare-fun res!163671 () Bool)

(assert (=> b!306774 (=> (not res!163671) (not e!192212))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306774 (= res!163671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2524 false resIndex!52 resX!52)))))

(assert (= (and start!30592 res!163668) b!306768))

(assert (= (and b!306768 res!163674) b!306773))

(assert (= (and b!306773 res!163672) b!306769))

(assert (= (and b!306769 res!163673) b!306772))

(assert (= (and b!306772 res!163669) b!306771))

(assert (= (and b!306771 res!163670) b!306774))

(assert (= (and b!306774 res!163671) b!306767))

(assert (= (and b!306767 res!163667) b!306770))

(declare-fun m!316691 () Bool)

(assert (=> b!306774 m!316691))

(assert (=> b!306774 m!316691))

(declare-fun m!316693 () Bool)

(assert (=> b!306774 m!316693))

(declare-fun m!316695 () Bool)

(assert (=> b!306773 m!316695))

(declare-fun m!316697 () Bool)

(assert (=> b!306772 m!316697))

(declare-fun m!316699 () Bool)

(assert (=> b!306769 m!316699))

(declare-fun m!316701 () Bool)

(assert (=> start!30592 m!316701))

(declare-fun m!316703 () Bool)

(assert (=> start!30592 m!316703))

(declare-fun m!316705 () Bool)

(assert (=> b!306771 m!316705))

(declare-fun m!316707 () Bool)

(assert (=> b!306770 m!316707))

(declare-fun m!316709 () Bool)

(assert (=> b!306767 m!316709))

(push 1)

(assert (not start!30592))

(assert (not b!306773))

(assert (not b!306774))

(assert (not b!306771))

(assert (not b!306770))

(assert (not b!306772))

(assert (not b!306769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

