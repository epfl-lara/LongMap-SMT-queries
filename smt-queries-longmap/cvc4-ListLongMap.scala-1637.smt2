; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30606 () Bool)

(assert start!30606)

(declare-fun res!163798 () Bool)

(declare-fun e!192388 () Bool)

(assert (=> start!30606 (=> (not res!163798) (not e!192388))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30606 (= res!163798 (validMask!0 mask!3709))))

(assert (=> start!30606 e!192388))

(declare-datatypes ((array!15610 0))(
  ( (array!15611 (arr!7390 (Array (_ BitVec 32) (_ BitVec 64))) (size!7742 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15610)

(declare-fun array_inv!5353 (array!15610) Bool)

(assert (=> start!30606 (array_inv!5353 a!3293)))

(assert (=> start!30606 true))

(declare-fun b!307042 () Bool)

(declare-fun res!163803 () Bool)

(assert (=> b!307042 (=> (not res!163803) (not e!192388))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307042 (= res!163803 (and (= (size!7742 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7742 a!3293))))))

(declare-fun b!307043 () Bool)

(declare-fun res!163801 () Bool)

(assert (=> b!307043 (=> (not res!163801) (not e!192388))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307043 (= res!163801 (and (= (select (arr!7390 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7742 a!3293))))))

(declare-fun b!307044 () Bool)

(declare-fun res!163802 () Bool)

(assert (=> b!307044 (=> (not res!163802) (not e!192388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15610 (_ BitVec 32)) Bool)

(assert (=> b!307044 (= res!163802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307045 () Bool)

(declare-fun res!163800 () Bool)

(assert (=> b!307045 (=> (not res!163800) (not e!192388))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2530 0))(
  ( (MissingZero!2530 (index!12296 (_ BitVec 32))) (Found!2530 (index!12297 (_ BitVec 32))) (Intermediate!2530 (undefined!3342 Bool) (index!12298 (_ BitVec 32)) (x!30541 (_ BitVec 32))) (Undefined!2530) (MissingVacant!2530 (index!12299 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15610 (_ BitVec 32)) SeekEntryResult!2530)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307045 (= res!163800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2530 false resIndex!52 resX!52)))))

(declare-fun b!307046 () Bool)

(declare-fun res!163796 () Bool)

(assert (=> b!307046 (=> (not res!163796) (not e!192388))))

(declare-fun arrayContainsKey!0 (array!15610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307046 (= res!163796 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307047 () Bool)

(declare-fun res!163797 () Bool)

(assert (=> b!307047 (=> (not res!163797) (not e!192388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307047 (= res!163797 (validKeyInArray!0 k!2441))))

(declare-fun b!307048 () Bool)

(declare-fun res!163799 () Bool)

(assert (=> b!307048 (=> (not res!163799) (not e!192388))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15610 (_ BitVec 32)) SeekEntryResult!2530)

(assert (=> b!307048 (= res!163799 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2530 i!1240)))))

(declare-fun b!307049 () Bool)

(assert (=> b!307049 (= e!192388 false)))

(declare-fun lt!151086 () SeekEntryResult!2530)

(assert (=> b!307049 (= lt!151086 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30606 res!163798) b!307042))

(assert (= (and b!307042 res!163803) b!307047))

(assert (= (and b!307047 res!163797) b!307046))

(assert (= (and b!307046 res!163796) b!307048))

(assert (= (and b!307048 res!163799) b!307044))

(assert (= (and b!307044 res!163802) b!307045))

(assert (= (and b!307045 res!163800) b!307043))

(assert (= (and b!307043 res!163801) b!307049))

(declare-fun m!317421 () Bool)

(assert (=> b!307047 m!317421))

(declare-fun m!317423 () Bool)

(assert (=> b!307046 m!317423))

(declare-fun m!317425 () Bool)

(assert (=> b!307045 m!317425))

(assert (=> b!307045 m!317425))

(declare-fun m!317427 () Bool)

(assert (=> b!307045 m!317427))

(declare-fun m!317429 () Bool)

(assert (=> b!307043 m!317429))

(declare-fun m!317431 () Bool)

(assert (=> start!30606 m!317431))

(declare-fun m!317433 () Bool)

(assert (=> start!30606 m!317433))

(declare-fun m!317435 () Bool)

(assert (=> b!307048 m!317435))

(declare-fun m!317437 () Bool)

(assert (=> b!307044 m!317437))

(declare-fun m!317439 () Bool)

(assert (=> b!307049 m!317439))

(push 1)

(assert (not start!30606))

(assert (not b!307048))

(assert (not b!307047))

(assert (not b!307049))

(assert (not b!307046))

(assert (not b!307044))

(assert (not b!307045))

(check-sat)

