; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30656 () Bool)

(assert start!30656)

(declare-fun b!307689 () Bool)

(declare-fun res!164443 () Bool)

(declare-fun e!192585 () Bool)

(assert (=> b!307689 (=> (not res!164443) (not e!192585))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307689 (= res!164443 (validKeyInArray!0 k!2441))))

(declare-fun b!307690 () Bool)

(declare-fun res!164446 () Bool)

(assert (=> b!307690 (=> (not res!164446) (not e!192585))))

(declare-datatypes ((array!15660 0))(
  ( (array!15661 (arr!7415 (Array (_ BitVec 32) (_ BitVec 64))) (size!7767 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15660)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2555 0))(
  ( (MissingZero!2555 (index!12396 (_ BitVec 32))) (Found!2555 (index!12397 (_ BitVec 32))) (Intermediate!2555 (undefined!3367 Bool) (index!12398 (_ BitVec 32)) (x!30638 (_ BitVec 32))) (Undefined!2555) (MissingVacant!2555 (index!12399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15660 (_ BitVec 32)) SeekEntryResult!2555)

(assert (=> b!307690 (= res!164446 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2555 i!1240)))))

(declare-fun b!307691 () Bool)

(declare-fun res!164447 () Bool)

(declare-fun e!192586 () Bool)

(assert (=> b!307691 (=> (not res!164447) (not e!192586))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307691 (= res!164447 (and (= (select (arr!7415 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7767 a!3293))))))

(declare-fun b!307692 () Bool)

(assert (=> b!307692 (= e!192585 e!192586)))

(declare-fun res!164449 () Bool)

(assert (=> b!307692 (=> (not res!164449) (not e!192586))))

(declare-fun lt!151161 () SeekEntryResult!2555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15660 (_ BitVec 32)) SeekEntryResult!2555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307692 (= res!164449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151161))))

(assert (=> b!307692 (= lt!151161 (Intermediate!2555 false resIndex!52 resX!52))))

(declare-fun b!307694 () Bool)

(declare-fun res!164450 () Bool)

(assert (=> b!307694 (=> (not res!164450) (not e!192586))))

(assert (=> b!307694 (= res!164450 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151161))))

(declare-fun b!307695 () Bool)

(declare-fun res!164444 () Bool)

(assert (=> b!307695 (=> (not res!164444) (not e!192585))))

(declare-fun arrayContainsKey!0 (array!15660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307695 (= res!164444 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164451 () Bool)

(assert (=> start!30656 (=> (not res!164451) (not e!192585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30656 (= res!164451 (validMask!0 mask!3709))))

(assert (=> start!30656 e!192585))

(declare-fun array_inv!5378 (array!15660) Bool)

(assert (=> start!30656 (array_inv!5378 a!3293)))

(assert (=> start!30656 true))

(declare-fun b!307693 () Bool)

(declare-fun res!164448 () Bool)

(assert (=> b!307693 (=> (not res!164448) (not e!192585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15660 (_ BitVec 32)) Bool)

(assert (=> b!307693 (= res!164448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307696 () Bool)

(declare-fun res!164445 () Bool)

(assert (=> b!307696 (=> (not res!164445) (not e!192585))))

(assert (=> b!307696 (= res!164445 (and (= (size!7767 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7767 a!3293))))))

(declare-fun b!307697 () Bool)

(assert (=> b!307697 (= e!192586 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7415 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(assert (= (and start!30656 res!164451) b!307696))

(assert (= (and b!307696 res!164445) b!307689))

(assert (= (and b!307689 res!164443) b!307695))

(assert (= (and b!307695 res!164444) b!307690))

(assert (= (and b!307690 res!164446) b!307693))

(assert (= (and b!307693 res!164448) b!307692))

(assert (= (and b!307692 res!164449) b!307691))

(assert (= (and b!307691 res!164447) b!307694))

(assert (= (and b!307694 res!164450) b!307697))

(declare-fun m!317951 () Bool)

(assert (=> b!307694 m!317951))

(declare-fun m!317953 () Bool)

(assert (=> start!30656 m!317953))

(declare-fun m!317955 () Bool)

(assert (=> start!30656 m!317955))

(declare-fun m!317957 () Bool)

(assert (=> b!307695 m!317957))

(declare-fun m!317959 () Bool)

(assert (=> b!307693 m!317959))

(declare-fun m!317961 () Bool)

(assert (=> b!307690 m!317961))

(declare-fun m!317963 () Bool)

(assert (=> b!307697 m!317963))

(declare-fun m!317965 () Bool)

(assert (=> b!307691 m!317965))

(declare-fun m!317967 () Bool)

(assert (=> b!307689 m!317967))

(declare-fun m!317969 () Bool)

(assert (=> b!307692 m!317969))

(assert (=> b!307692 m!317969))

(declare-fun m!317971 () Bool)

(assert (=> b!307692 m!317971))

(push 1)

(assert (not b!307695))

(assert (not b!307694))

(assert (not b!307692))

(assert (not start!30656))

(assert (not b!307693))

(assert (not b!307689))

(assert (not b!307690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

