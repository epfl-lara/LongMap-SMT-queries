; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30548 () Bool)

(assert start!30548)

(declare-fun b!305872 () Bool)

(declare-fun res!162947 () Bool)

(declare-fun e!191978 () Bool)

(assert (=> b!305872 (=> (not res!162947) (not e!191978))))

(declare-datatypes ((array!15552 0))(
  ( (array!15553 (arr!7361 (Array (_ BitVec 32) (_ BitVec 64))) (size!7713 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15552)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305872 (= res!162947 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7361 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305873 () Bool)

(declare-datatypes ((Unit!9446 0))(
  ( (Unit!9447) )
))
(declare-fun e!191979 () Unit!9446)

(declare-fun Unit!9448 () Unit!9446)

(assert (=> b!305873 (= e!191979 Unit!9448)))

(declare-fun b!305874 () Bool)

(assert (=> b!305874 false))

(declare-fun e!191977 () Unit!9446)

(declare-fun Unit!9449 () Unit!9446)

(assert (=> b!305874 (= e!191977 Unit!9449)))

(declare-fun b!305875 () Bool)

(declare-fun res!162944 () Bool)

(declare-fun e!191976 () Bool)

(assert (=> b!305875 (=> (not res!162944) (not e!191976))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15552 (_ BitVec 32)) Bool)

(assert (=> b!305875 (= res!162944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305876 () Bool)

(declare-fun res!162943 () Bool)

(assert (=> b!305876 (=> (not res!162943) (not e!191978))))

(declare-datatypes ((SeekEntryResult!2501 0))(
  ( (MissingZero!2501 (index!12180 (_ BitVec 32))) (Found!2501 (index!12181 (_ BitVec 32))) (Intermediate!2501 (undefined!3313 Bool) (index!12182 (_ BitVec 32)) (x!30440 (_ BitVec 32))) (Undefined!2501) (MissingVacant!2501 (index!12183 (_ BitVec 32))) )
))
(declare-fun lt!150843 () SeekEntryResult!2501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15552 (_ BitVec 32)) SeekEntryResult!2501)

(assert (=> b!305876 (= res!162943 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150843))))

(declare-fun b!305877 () Bool)

(assert (=> b!305877 (= e!191979 e!191977)))

(declare-fun c!49068 () Bool)

(assert (=> b!305877 (= c!49068 (or (= (select (arr!7361 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7361 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305879 () Bool)

(assert (=> b!305879 false))

(declare-fun lt!150842 () SeekEntryResult!2501)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305879 (= lt!150842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9450 () Unit!9446)

(assert (=> b!305879 (= e!191977 Unit!9450)))

(declare-fun b!305880 () Bool)

(declare-fun res!162949 () Bool)

(assert (=> b!305880 (=> (not res!162949) (not e!191976))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305880 (= res!162949 (and (= (size!7713 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7713 a!3293))))))

(declare-fun b!305881 () Bool)

(declare-fun res!162946 () Bool)

(assert (=> b!305881 (=> (not res!162946) (not e!191978))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305881 (= res!162946 (and (= (select (arr!7361 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7713 a!3293))))))

(declare-fun b!305882 () Bool)

(declare-fun res!162945 () Bool)

(assert (=> b!305882 (=> (not res!162945) (not e!191976))))

(declare-fun arrayContainsKey!0 (array!15552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305882 (= res!162945 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305883 () Bool)

(assert (=> b!305883 (= e!191978 (not (or (not (= (select (arr!7361 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!305883 (= index!1781 resIndex!52)))

(declare-fun lt!150841 () Unit!9446)

(assert (=> b!305883 (= lt!150841 e!191979)))

(declare-fun c!49067 () Bool)

(assert (=> b!305883 (= c!49067 (not (= resIndex!52 index!1781)))))

(declare-fun b!305884 () Bool)

(declare-fun res!162948 () Bool)

(assert (=> b!305884 (=> (not res!162948) (not e!191976))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15552 (_ BitVec 32)) SeekEntryResult!2501)

(assert (=> b!305884 (= res!162948 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2501 i!1240)))))

(declare-fun b!305885 () Bool)

(declare-fun res!162942 () Bool)

(assert (=> b!305885 (=> (not res!162942) (not e!191976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305885 (= res!162942 (validKeyInArray!0 k!2441))))

(declare-fun res!162951 () Bool)

(assert (=> start!30548 (=> (not res!162951) (not e!191976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30548 (= res!162951 (validMask!0 mask!3709))))

(assert (=> start!30548 e!191976))

(declare-fun array_inv!5324 (array!15552) Bool)

(assert (=> start!30548 (array_inv!5324 a!3293)))

(assert (=> start!30548 true))

(declare-fun b!305878 () Bool)

(assert (=> b!305878 (= e!191976 e!191978)))

(declare-fun res!162950 () Bool)

(assert (=> b!305878 (=> (not res!162950) (not e!191978))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305878 (= res!162950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150843))))

(assert (=> b!305878 (= lt!150843 (Intermediate!2501 false resIndex!52 resX!52))))

(assert (= (and start!30548 res!162951) b!305880))

(assert (= (and b!305880 res!162949) b!305885))

(assert (= (and b!305885 res!162942) b!305882))

(assert (= (and b!305882 res!162945) b!305884))

(assert (= (and b!305884 res!162948) b!305875))

(assert (= (and b!305875 res!162944) b!305878))

(assert (= (and b!305878 res!162950) b!305881))

(assert (= (and b!305881 res!162946) b!305876))

(assert (= (and b!305876 res!162943) b!305872))

(assert (= (and b!305872 res!162947) b!305883))

(assert (= (and b!305883 c!49067) b!305877))

(assert (= (and b!305883 (not c!49067)) b!305873))

(assert (= (and b!305877 c!49068) b!305874))

(assert (= (and b!305877 (not c!49068)) b!305879))

(declare-fun m!316679 () Bool)

(assert (=> b!305877 m!316679))

(declare-fun m!316681 () Bool)

(assert (=> b!305884 m!316681))

(declare-fun m!316683 () Bool)

(assert (=> b!305878 m!316683))

(assert (=> b!305878 m!316683))

(declare-fun m!316685 () Bool)

(assert (=> b!305878 m!316685))

(declare-fun m!316687 () Bool)

(assert (=> start!30548 m!316687))

(declare-fun m!316689 () Bool)

(assert (=> start!30548 m!316689))

(assert (=> b!305872 m!316679))

(declare-fun m!316691 () Bool)

(assert (=> b!305875 m!316691))

(declare-fun m!316693 () Bool)

(assert (=> b!305882 m!316693))

(declare-fun m!316695 () Bool)

(assert (=> b!305885 m!316695))

(declare-fun m!316697 () Bool)

(assert (=> b!305881 m!316697))

(declare-fun m!316699 () Bool)

(assert (=> b!305879 m!316699))

(assert (=> b!305879 m!316699))

(declare-fun m!316701 () Bool)

(assert (=> b!305879 m!316701))

(declare-fun m!316703 () Bool)

(assert (=> b!305876 m!316703))

(assert (=> b!305883 m!316679))

(push 1)

(assert (not start!30548))

(assert (not b!305876))

(assert (not b!305879))

(assert (not b!305884))

(assert (not b!305882))

(assert (not b!305875))

(assert (not b!305885))

(assert (not b!305878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

