; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30534 () Bool)

(assert start!30534)

(declare-fun b!305597 () Bool)

(declare-fun res!162821 () Bool)

(declare-fun e!191804 () Bool)

(assert (=> b!305597 (=> (not res!162821) (not e!191804))))

(declare-datatypes ((array!15542 0))(
  ( (array!15543 (arr!7356 (Array (_ BitVec 32) (_ BitVec 64))) (size!7709 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15542)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305597 (= res!162821 (and (= (select (arr!7356 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7709 a!3293))))))

(declare-fun res!162813 () Bool)

(declare-fun e!191803 () Bool)

(assert (=> start!30534 (=> (not res!162813) (not e!191803))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30534 (= res!162813 (validMask!0 mask!3709))))

(assert (=> start!30534 e!191803))

(declare-fun array_inv!5328 (array!15542) Bool)

(assert (=> start!30534 (array_inv!5328 a!3293)))

(assert (=> start!30534 true))

(declare-fun b!305598 () Bool)

(assert (=> b!305598 (= e!191803 e!191804)))

(declare-fun res!162817 () Bool)

(assert (=> b!305598 (=> (not res!162817) (not e!191804))))

(declare-datatypes ((SeekEntryResult!2495 0))(
  ( (MissingZero!2495 (index!12156 (_ BitVec 32))) (Found!2495 (index!12157 (_ BitVec 32))) (Intermediate!2495 (undefined!3307 Bool) (index!12158 (_ BitVec 32)) (x!30429 (_ BitVec 32))) (Undefined!2495) (MissingVacant!2495 (index!12159 (_ BitVec 32))) )
))
(declare-fun lt!150606 () SeekEntryResult!2495)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15542 (_ BitVec 32)) SeekEntryResult!2495)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305598 (= res!162817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150606))))

(assert (=> b!305598 (= lt!150606 (Intermediate!2495 false resIndex!52 resX!52))))

(declare-fun b!305599 () Bool)

(declare-fun res!162814 () Bool)

(assert (=> b!305599 (=> (not res!162814) (not e!191803))))

(assert (=> b!305599 (= res!162814 (and (= (size!7709 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7709 a!3293))))))

(declare-fun b!305600 () Bool)

(declare-fun res!162818 () Bool)

(assert (=> b!305600 (=> (not res!162818) (not e!191803))))

(declare-fun arrayContainsKey!0 (array!15542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305600 (= res!162818 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305601 () Bool)

(declare-fun res!162820 () Bool)

(assert (=> b!305601 (=> (not res!162820) (not e!191803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15542 (_ BitVec 32)) Bool)

(assert (=> b!305601 (= res!162820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305602 () Bool)

(declare-datatypes ((Unit!9406 0))(
  ( (Unit!9407) )
))
(declare-fun e!191800 () Unit!9406)

(declare-fun e!191802 () Unit!9406)

(assert (=> b!305602 (= e!191800 e!191802)))

(declare-fun c!48994 () Bool)

(assert (=> b!305602 (= c!48994 (or (= (select (arr!7356 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7356 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305603 () Bool)

(declare-fun Unit!9408 () Unit!9406)

(assert (=> b!305603 (= e!191800 Unit!9408)))

(declare-fun b!305604 () Bool)

(declare-fun res!162815 () Bool)

(assert (=> b!305604 (=> (not res!162815) (not e!191804))))

(assert (=> b!305604 (= res!162815 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150606))))

(declare-fun b!305605 () Bool)

(assert (=> b!305605 false))

(declare-fun lt!150607 () SeekEntryResult!2495)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305605 (= lt!150607 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9409 () Unit!9406)

(assert (=> b!305605 (= e!191802 Unit!9409)))

(declare-fun b!305606 () Bool)

(declare-fun res!162819 () Bool)

(assert (=> b!305606 (=> (not res!162819) (not e!191804))))

(assert (=> b!305606 (= res!162819 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7356 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305607 () Bool)

(declare-fun res!162822 () Bool)

(assert (=> b!305607 (=> (not res!162822) (not e!191803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305607 (= res!162822 (validKeyInArray!0 k0!2441))))

(declare-fun b!305608 () Bool)

(assert (=> b!305608 false))

(declare-fun Unit!9410 () Unit!9406)

(assert (=> b!305608 (= e!191802 Unit!9410)))

(declare-fun b!305609 () Bool)

(assert (=> b!305609 (= e!191804 (not (or (not (= (select (arr!7356 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!305609 (= index!1781 resIndex!52)))

(declare-fun lt!150608 () Unit!9406)

(assert (=> b!305609 (= lt!150608 e!191800)))

(declare-fun c!48995 () Bool)

(assert (=> b!305609 (= c!48995 (not (= resIndex!52 index!1781)))))

(declare-fun b!305610 () Bool)

(declare-fun res!162816 () Bool)

(assert (=> b!305610 (=> (not res!162816) (not e!191803))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15542 (_ BitVec 32)) SeekEntryResult!2495)

(assert (=> b!305610 (= res!162816 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2495 i!1240)))))

(assert (= (and start!30534 res!162813) b!305599))

(assert (= (and b!305599 res!162814) b!305607))

(assert (= (and b!305607 res!162822) b!305600))

(assert (= (and b!305600 res!162818) b!305610))

(assert (= (and b!305610 res!162816) b!305601))

(assert (= (and b!305601 res!162820) b!305598))

(assert (= (and b!305598 res!162817) b!305597))

(assert (= (and b!305597 res!162821) b!305604))

(assert (= (and b!305604 res!162815) b!305606))

(assert (= (and b!305606 res!162819) b!305609))

(assert (= (and b!305609 c!48995) b!305602))

(assert (= (and b!305609 (not c!48995)) b!305603))

(assert (= (and b!305602 c!48994) b!305608))

(assert (= (and b!305602 (not c!48994)) b!305605))

(declare-fun m!315949 () Bool)

(assert (=> b!305601 m!315949))

(declare-fun m!315951 () Bool)

(assert (=> b!305606 m!315951))

(declare-fun m!315953 () Bool)

(assert (=> b!305604 m!315953))

(declare-fun m!315955 () Bool)

(assert (=> start!30534 m!315955))

(declare-fun m!315957 () Bool)

(assert (=> start!30534 m!315957))

(declare-fun m!315959 () Bool)

(assert (=> b!305600 m!315959))

(declare-fun m!315961 () Bool)

(assert (=> b!305605 m!315961))

(assert (=> b!305605 m!315961))

(declare-fun m!315963 () Bool)

(assert (=> b!305605 m!315963))

(declare-fun m!315965 () Bool)

(assert (=> b!305597 m!315965))

(declare-fun m!315967 () Bool)

(assert (=> b!305598 m!315967))

(assert (=> b!305598 m!315967))

(declare-fun m!315969 () Bool)

(assert (=> b!305598 m!315969))

(declare-fun m!315971 () Bool)

(assert (=> b!305610 m!315971))

(assert (=> b!305609 m!315951))

(declare-fun m!315973 () Bool)

(assert (=> b!305607 m!315973))

(assert (=> b!305602 m!315951))

(check-sat (not b!305605) (not start!30534) (not b!305600) (not b!305607) (not b!305601) (not b!305610) (not b!305598) (not b!305604))
(check-sat)
