; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31714 () Bool)

(assert start!31714)

(declare-fun b!316887 () Bool)

(declare-fun res!171669 () Bool)

(declare-fun e!197071 () Bool)

(assert (=> b!316887 (=> (not res!171669) (not e!197071))))

(declare-datatypes ((array!16136 0))(
  ( (array!16137 (arr!7635 (Array (_ BitVec 32) (_ BitVec 64))) (size!7987 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16136)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316887 (= res!171669 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316888 () Bool)

(declare-fun e!197074 () Bool)

(declare-fun e!197073 () Bool)

(assert (=> b!316888 (= e!197074 e!197073)))

(declare-fun res!171666 () Bool)

(assert (=> b!316888 (=> (not res!171666) (not e!197073))))

(declare-datatypes ((SeekEntryResult!2775 0))(
  ( (MissingZero!2775 (index!13276 (_ BitVec 32))) (Found!2775 (index!13277 (_ BitVec 32))) (Intermediate!2775 (undefined!3587 Bool) (index!13278 (_ BitVec 32)) (x!31535 (_ BitVec 32))) (Undefined!2775) (MissingVacant!2775 (index!13279 (_ BitVec 32))) )
))
(declare-fun lt!154742 () SeekEntryResult!2775)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!154743 () SeekEntryResult!2775)

(assert (=> b!316888 (= res!171666 (and (= lt!154742 lt!154743) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7635 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16136 (_ BitVec 32)) SeekEntryResult!2775)

(assert (=> b!316888 (= lt!154742 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316889 () Bool)

(declare-fun res!171668 () Bool)

(assert (=> b!316889 (=> (not res!171668) (not e!197071))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316889 (= res!171668 (and (= (size!7987 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7987 a!3293))))))

(declare-fun b!316890 () Bool)

(assert (=> b!316890 (= e!197073 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316890 (= lt!154742 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316891 () Bool)

(declare-fun res!171661 () Bool)

(assert (=> b!316891 (=> (not res!171661) (not e!197071))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16136 (_ BitVec 32)) SeekEntryResult!2775)

(assert (=> b!316891 (= res!171661 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2775 i!1240)))))

(declare-fun res!171663 () Bool)

(assert (=> start!31714 (=> (not res!171663) (not e!197071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31714 (= res!171663 (validMask!0 mask!3709))))

(assert (=> start!31714 e!197071))

(declare-fun array_inv!5598 (array!16136) Bool)

(assert (=> start!31714 (array_inv!5598 a!3293)))

(assert (=> start!31714 true))

(declare-fun b!316892 () Bool)

(declare-fun res!171665 () Bool)

(assert (=> b!316892 (=> (not res!171665) (not e!197071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16136 (_ BitVec 32)) Bool)

(assert (=> b!316892 (= res!171665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316893 () Bool)

(assert (=> b!316893 (= e!197071 e!197074)))

(declare-fun res!171667 () Bool)

(assert (=> b!316893 (=> (not res!171667) (not e!197074))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316893 (= res!171667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154743))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316893 (= lt!154743 (Intermediate!2775 false resIndex!52 resX!52))))

(declare-fun b!316894 () Bool)

(declare-fun res!171664 () Bool)

(assert (=> b!316894 (=> (not res!171664) (not e!197074))))

(assert (=> b!316894 (= res!171664 (and (= (select (arr!7635 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7987 a!3293))))))

(declare-fun b!316895 () Bool)

(declare-fun res!171662 () Bool)

(assert (=> b!316895 (=> (not res!171662) (not e!197071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316895 (= res!171662 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31714 res!171663) b!316889))

(assert (= (and b!316889 res!171668) b!316895))

(assert (= (and b!316895 res!171662) b!316887))

(assert (= (and b!316887 res!171669) b!316891))

(assert (= (and b!316891 res!171661) b!316892))

(assert (= (and b!316892 res!171665) b!316893))

(assert (= (and b!316893 res!171667) b!316894))

(assert (= (and b!316894 res!171664) b!316888))

(assert (= (and b!316888 res!171666) b!316890))

(declare-fun m!325633 () Bool)

(assert (=> b!316887 m!325633))

(declare-fun m!325635 () Bool)

(assert (=> b!316895 m!325635))

(declare-fun m!325637 () Bool)

(assert (=> b!316888 m!325637))

(declare-fun m!325639 () Bool)

(assert (=> b!316888 m!325639))

(declare-fun m!325641 () Bool)

(assert (=> b!316892 m!325641))

(declare-fun m!325643 () Bool)

(assert (=> b!316891 m!325643))

(declare-fun m!325645 () Bool)

(assert (=> start!31714 m!325645))

(declare-fun m!325647 () Bool)

(assert (=> start!31714 m!325647))

(declare-fun m!325649 () Bool)

(assert (=> b!316890 m!325649))

(assert (=> b!316890 m!325649))

(declare-fun m!325651 () Bool)

(assert (=> b!316890 m!325651))

(declare-fun m!325653 () Bool)

(assert (=> b!316893 m!325653))

(assert (=> b!316893 m!325653))

(declare-fun m!325655 () Bool)

(assert (=> b!316893 m!325655))

(declare-fun m!325657 () Bool)

(assert (=> b!316894 m!325657))

(check-sat (not b!316887) (not b!316888) (not b!316890) (not b!316892) (not b!316893) (not b!316895) (not start!31714) (not b!316891))
(check-sat)
