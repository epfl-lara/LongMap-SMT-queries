; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31038 () Bool)

(assert start!31038)

(declare-fun b!312042 () Bool)

(declare-fun res!168646 () Bool)

(declare-fun e!194585 () Bool)

(assert (=> b!312042 (=> (not res!168646) (not e!194585))))

(declare-datatypes ((array!15944 0))(
  ( (array!15945 (arr!7554 (Array (_ BitVec 32) (_ BitVec 64))) (size!7907 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15944)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312042 (= res!168646 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312043 () Bool)

(declare-fun res!168643 () Bool)

(assert (=> b!312043 (=> (not res!168643) (not e!194585))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15944 (_ BitVec 32)) Bool)

(assert (=> b!312043 (= res!168643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312044 () Bool)

(declare-fun e!194583 () Bool)

(declare-fun e!194582 () Bool)

(assert (=> b!312044 (= e!194583 e!194582)))

(declare-fun res!168651 () Bool)

(assert (=> b!312044 (=> (not res!168651) (not e!194582))))

(declare-datatypes ((SeekEntryResult!2693 0))(
  ( (MissingZero!2693 (index!12948 (_ BitVec 32))) (Found!2693 (index!12949 (_ BitVec 32))) (Intermediate!2693 (undefined!3505 Bool) (index!12950 (_ BitVec 32)) (x!31173 (_ BitVec 32))) (Undefined!2693) (MissingVacant!2693 (index!12951 (_ BitVec 32))) )
))
(declare-fun lt!152702 () SeekEntryResult!2693)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152700 () SeekEntryResult!2693)

(assert (=> b!312044 (= res!168651 (and (= lt!152702 lt!152700) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7554 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15944 (_ BitVec 32)) SeekEntryResult!2693)

(assert (=> b!312044 (= lt!152702 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312045 () Bool)

(assert (=> b!312045 (= e!194585 e!194583)))

(declare-fun res!168644 () Bool)

(assert (=> b!312045 (=> (not res!168644) (not e!194583))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312045 (= res!168644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152700))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312045 (= lt!152700 (Intermediate!2693 false resIndex!52 resX!52))))

(declare-fun b!312046 () Bool)

(declare-fun res!168649 () Bool)

(assert (=> b!312046 (=> (not res!168649) (not e!194585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312046 (= res!168649 (validKeyInArray!0 k0!2441))))

(declare-fun res!168648 () Bool)

(assert (=> start!31038 (=> (not res!168648) (not e!194585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31038 (= res!168648 (validMask!0 mask!3709))))

(assert (=> start!31038 e!194585))

(declare-fun array_inv!5526 (array!15944) Bool)

(assert (=> start!31038 (array_inv!5526 a!3293)))

(assert (=> start!31038 true))

(declare-fun b!312047 () Bool)

(declare-fun e!194584 () Bool)

(assert (=> b!312047 (= e!194584 true)))

(declare-fun lt!152697 () SeekEntryResult!2693)

(declare-fun lt!152696 () SeekEntryResult!2693)

(assert (=> b!312047 (= lt!152697 lt!152696)))

(declare-datatypes ((Unit!9589 0))(
  ( (Unit!9590) )
))
(declare-fun lt!152701 () Unit!9589)

(declare-fun lt!152699 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15944 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9589)

(assert (=> b!312047 (= lt!152701 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152699 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312048 () Bool)

(declare-fun res!168647 () Bool)

(assert (=> b!312048 (=> (not res!168647) (not e!194585))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15944 (_ BitVec 32)) SeekEntryResult!2693)

(assert (=> b!312048 (= res!168647 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2693 i!1240)))))

(declare-fun b!312049 () Bool)

(declare-fun res!168645 () Bool)

(assert (=> b!312049 (=> (not res!168645) (not e!194583))))

(assert (=> b!312049 (= res!168645 (and (= (select (arr!7554 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7907 a!3293))))))

(declare-fun b!312050 () Bool)

(declare-fun res!168642 () Bool)

(assert (=> b!312050 (=> (not res!168642) (not e!194585))))

(assert (=> b!312050 (= res!168642 (and (= (size!7907 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7907 a!3293))))))

(declare-fun b!312051 () Bool)

(assert (=> b!312051 (= e!194582 (not e!194584))))

(declare-fun res!168650 () Bool)

(assert (=> b!312051 (=> res!168650 e!194584)))

(assert (=> b!312051 (= res!168650 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152699 #b00000000000000000000000000000000) (bvsge lt!152699 (size!7907 a!3293)) (not (= lt!152696 lt!152700))))))

(declare-fun lt!152695 () SeekEntryResult!2693)

(assert (=> b!312051 (= lt!152695 lt!152697)))

(declare-fun lt!152698 () array!15944)

(assert (=> b!312051 (= lt!152697 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152699 k0!2441 lt!152698 mask!3709))))

(assert (=> b!312051 (= lt!152695 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152698 mask!3709))))

(assert (=> b!312051 (= lt!152698 (array!15945 (store (arr!7554 a!3293) i!1240 k0!2441) (size!7907 a!3293)))))

(assert (=> b!312051 (= lt!152702 lt!152696)))

(assert (=> b!312051 (= lt!152696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152699 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312051 (= lt!152699 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31038 res!168648) b!312050))

(assert (= (and b!312050 res!168642) b!312046))

(assert (= (and b!312046 res!168649) b!312042))

(assert (= (and b!312042 res!168646) b!312048))

(assert (= (and b!312048 res!168647) b!312043))

(assert (= (and b!312043 res!168643) b!312045))

(assert (= (and b!312045 res!168644) b!312049))

(assert (= (and b!312049 res!168645) b!312044))

(assert (= (and b!312044 res!168651) b!312051))

(assert (= (and b!312051 (not res!168650)) b!312047))

(declare-fun m!321655 () Bool)

(assert (=> b!312046 m!321655))

(declare-fun m!321657 () Bool)

(assert (=> b!312051 m!321657))

(declare-fun m!321659 () Bool)

(assert (=> b!312051 m!321659))

(declare-fun m!321661 () Bool)

(assert (=> b!312051 m!321661))

(declare-fun m!321663 () Bool)

(assert (=> b!312051 m!321663))

(declare-fun m!321665 () Bool)

(assert (=> b!312051 m!321665))

(declare-fun m!321667 () Bool)

(assert (=> b!312045 m!321667))

(assert (=> b!312045 m!321667))

(declare-fun m!321669 () Bool)

(assert (=> b!312045 m!321669))

(declare-fun m!321671 () Bool)

(assert (=> b!312044 m!321671))

(declare-fun m!321673 () Bool)

(assert (=> b!312044 m!321673))

(declare-fun m!321675 () Bool)

(assert (=> b!312042 m!321675))

(declare-fun m!321677 () Bool)

(assert (=> b!312047 m!321677))

(declare-fun m!321679 () Bool)

(assert (=> b!312043 m!321679))

(declare-fun m!321681 () Bool)

(assert (=> start!31038 m!321681))

(declare-fun m!321683 () Bool)

(assert (=> start!31038 m!321683))

(declare-fun m!321685 () Bool)

(assert (=> b!312048 m!321685))

(declare-fun m!321687 () Bool)

(assert (=> b!312049 m!321687))

(check-sat (not b!312048) (not b!312042) (not b!312047) (not b!312045) (not b!312044) (not start!31038) (not b!312046) (not b!312051) (not b!312043))
(check-sat)
