; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31936 () Bool)

(assert start!31936)

(declare-fun b!319169 () Bool)

(declare-fun res!173555 () Bool)

(declare-fun e!198261 () Bool)

(assert (=> b!319169 (=> (not res!173555) (not e!198261))))

(declare-datatypes ((array!16256 0))(
  ( (array!16257 (arr!7692 (Array (_ BitVec 32) (_ BitVec 64))) (size!8044 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16256)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319169 (= res!173555 (and (= (select (arr!7692 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8044 a!3293))))))

(declare-fun b!319170 () Bool)

(declare-fun e!198259 () Bool)

(declare-fun e!198260 () Bool)

(assert (=> b!319170 (= e!198259 (not e!198260))))

(declare-fun res!173561 () Bool)

(assert (=> b!319170 (=> res!173561 e!198260)))

(declare-fun lt!155687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2832 0))(
  ( (MissingZero!2832 (index!13504 (_ BitVec 32))) (Found!2832 (index!13505 (_ BitVec 32))) (Intermediate!2832 (undefined!3644 Bool) (index!13506 (_ BitVec 32)) (x!31762 (_ BitVec 32))) (Undefined!2832) (MissingVacant!2832 (index!13507 (_ BitVec 32))) )
))
(declare-fun lt!155690 () SeekEntryResult!2832)

(declare-fun lt!155685 () SeekEntryResult!2832)

(assert (=> b!319170 (= res!173561 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155687 #b00000000000000000000000000000000) (bvsge lt!155687 (size!8044 a!3293)) (not (= lt!155685 lt!155690))))))

(declare-fun lt!155688 () SeekEntryResult!2832)

(declare-fun lt!155689 () SeekEntryResult!2832)

(assert (=> b!319170 (= lt!155688 lt!155689)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!155686 () array!16256)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16256 (_ BitVec 32)) SeekEntryResult!2832)

(assert (=> b!319170 (= lt!155689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155687 k0!2441 lt!155686 mask!3709))))

(assert (=> b!319170 (= lt!155688 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155686 mask!3709))))

(assert (=> b!319170 (= lt!155686 (array!16257 (store (arr!7692 a!3293) i!1240 k0!2441) (size!8044 a!3293)))))

(declare-fun lt!155684 () SeekEntryResult!2832)

(assert (=> b!319170 (= lt!155684 lt!155685)))

(assert (=> b!319170 (= lt!155685 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155687 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319170 (= lt!155687 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!319171 () Bool)

(assert (=> b!319171 (= e!198260 true)))

(assert (=> b!319171 (= lt!155689 lt!155685)))

(declare-datatypes ((Unit!9802 0))(
  ( (Unit!9803) )
))
(declare-fun lt!155691 () Unit!9802)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9802)

(assert (=> b!319171 (= lt!155691 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155687 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319172 () Bool)

(declare-fun res!173554 () Bool)

(declare-fun e!198262 () Bool)

(assert (=> b!319172 (=> (not res!173554) (not e!198262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319172 (= res!173554 (validKeyInArray!0 k0!2441))))

(declare-fun b!319173 () Bool)

(declare-fun res!173556 () Bool)

(assert (=> b!319173 (=> (not res!173556) (not e!198262))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16256 (_ BitVec 32)) SeekEntryResult!2832)

(assert (=> b!319173 (= res!173556 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2832 i!1240)))))

(declare-fun b!319174 () Bool)

(assert (=> b!319174 (= e!198262 e!198261)))

(declare-fun res!173560 () Bool)

(assert (=> b!319174 (=> (not res!173560) (not e!198261))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319174 (= res!173560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155690))))

(assert (=> b!319174 (= lt!155690 (Intermediate!2832 false resIndex!52 resX!52))))

(declare-fun b!319175 () Bool)

(declare-fun res!173557 () Bool)

(assert (=> b!319175 (=> (not res!173557) (not e!198262))))

(assert (=> b!319175 (= res!173557 (and (= (size!8044 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8044 a!3293))))))

(declare-fun b!319176 () Bool)

(assert (=> b!319176 (= e!198261 e!198259)))

(declare-fun res!173553 () Bool)

(assert (=> b!319176 (=> (not res!173553) (not e!198259))))

(assert (=> b!319176 (= res!173553 (and (= lt!155684 lt!155690) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7692 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319176 (= lt!155684 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!173559 () Bool)

(assert (=> start!31936 (=> (not res!173559) (not e!198262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31936 (= res!173559 (validMask!0 mask!3709))))

(assert (=> start!31936 e!198262))

(declare-fun array_inv!5655 (array!16256) Bool)

(assert (=> start!31936 (array_inv!5655 a!3293)))

(assert (=> start!31936 true))

(declare-fun b!319177 () Bool)

(declare-fun res!173558 () Bool)

(assert (=> b!319177 (=> (not res!173558) (not e!198262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16256 (_ BitVec 32)) Bool)

(assert (=> b!319177 (= res!173558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319178 () Bool)

(declare-fun res!173562 () Bool)

(assert (=> b!319178 (=> (not res!173562) (not e!198262))))

(declare-fun arrayContainsKey!0 (array!16256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319178 (= res!173562 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31936 res!173559) b!319175))

(assert (= (and b!319175 res!173557) b!319172))

(assert (= (and b!319172 res!173554) b!319178))

(assert (= (and b!319178 res!173562) b!319173))

(assert (= (and b!319173 res!173556) b!319177))

(assert (= (and b!319177 res!173558) b!319174))

(assert (= (and b!319174 res!173560) b!319169))

(assert (= (and b!319169 res!173555) b!319176))

(assert (= (and b!319176 res!173553) b!319170))

(assert (= (and b!319170 (not res!173561)) b!319171))

(declare-fun m!327777 () Bool)

(assert (=> b!319172 m!327777))

(declare-fun m!327779 () Bool)

(assert (=> b!319170 m!327779))

(declare-fun m!327781 () Bool)

(assert (=> b!319170 m!327781))

(declare-fun m!327783 () Bool)

(assert (=> b!319170 m!327783))

(declare-fun m!327785 () Bool)

(assert (=> b!319170 m!327785))

(declare-fun m!327787 () Bool)

(assert (=> b!319170 m!327787))

(declare-fun m!327789 () Bool)

(assert (=> b!319178 m!327789))

(declare-fun m!327791 () Bool)

(assert (=> b!319169 m!327791))

(declare-fun m!327793 () Bool)

(assert (=> b!319171 m!327793))

(declare-fun m!327795 () Bool)

(assert (=> b!319173 m!327795))

(declare-fun m!327797 () Bool)

(assert (=> b!319174 m!327797))

(assert (=> b!319174 m!327797))

(declare-fun m!327799 () Bool)

(assert (=> b!319174 m!327799))

(declare-fun m!327801 () Bool)

(assert (=> b!319177 m!327801))

(declare-fun m!327803 () Bool)

(assert (=> start!31936 m!327803))

(declare-fun m!327805 () Bool)

(assert (=> start!31936 m!327805))

(declare-fun m!327807 () Bool)

(assert (=> b!319176 m!327807))

(declare-fun m!327809 () Bool)

(assert (=> b!319176 m!327809))

(check-sat (not b!319170) (not b!319178) (not start!31936) (not b!319176) (not b!319173) (not b!319171) (not b!319172) (not b!319177) (not b!319174))
(check-sat)
