; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31832 () Bool)

(assert start!31832)

(declare-fun b!318122 () Bool)

(declare-fun res!172704 () Bool)

(declare-fun e!197709 () Bool)

(assert (=> b!318122 (=> (not res!172704) (not e!197709))))

(declare-datatypes ((array!16203 0))(
  ( (array!16204 (arr!7667 (Array (_ BitVec 32) (_ BitVec 64))) (size!8019 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16203)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318122 (= res!172704 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318123 () Bool)

(declare-fun res!172701 () Bool)

(assert (=> b!318123 (=> (not res!172701) (not e!197709))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2807 0))(
  ( (MissingZero!2807 (index!13404 (_ BitVec 32))) (Found!2807 (index!13405 (_ BitVec 32))) (Intermediate!2807 (undefined!3619 Bool) (index!13406 (_ BitVec 32)) (x!31664 (_ BitVec 32))) (Undefined!2807) (MissingVacant!2807 (index!13407 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16203 (_ BitVec 32)) SeekEntryResult!2807)

(assert (=> b!318123 (= res!172701 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2807 i!1240)))))

(declare-fun b!318124 () Bool)

(declare-fun res!172709 () Bool)

(declare-fun e!197708 () Bool)

(assert (=> b!318124 (=> (not res!172709) (not e!197708))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318124 (= res!172709 (and (= (select (arr!7667 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8019 a!3293))))))

(declare-fun b!318125 () Bool)

(assert (=> b!318125 (= e!197709 e!197708)))

(declare-fun res!172706 () Bool)

(assert (=> b!318125 (=> (not res!172706) (not e!197708))))

(declare-fun lt!155223 () SeekEntryResult!2807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16203 (_ BitVec 32)) SeekEntryResult!2807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318125 (= res!172706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155223))))

(assert (=> b!318125 (= lt!155223 (Intermediate!2807 false resIndex!52 resX!52))))

(declare-fun b!318126 () Bool)

(declare-fun e!197706 () Bool)

(assert (=> b!318126 (= e!197706 (not true))))

(declare-fun e!197707 () Bool)

(assert (=> b!318126 e!197707))

(declare-fun res!172702 () Bool)

(assert (=> b!318126 (=> (not res!172702) (not e!197707))))

(declare-fun lt!155226 () SeekEntryResult!2807)

(declare-fun lt!155224 () (_ BitVec 32))

(assert (=> b!318126 (= res!172702 (= lt!155226 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155224 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318126 (= lt!155224 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318127 () Bool)

(declare-fun lt!155225 () array!16203)

(assert (=> b!318127 (= e!197707 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155225 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155224 k!2441 lt!155225 mask!3709)))))

(assert (=> b!318127 (= lt!155225 (array!16204 (store (arr!7667 a!3293) i!1240 k!2441) (size!8019 a!3293)))))

(declare-fun b!318128 () Bool)

(declare-fun res!172705 () Bool)

(assert (=> b!318128 (=> (not res!172705) (not e!197709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16203 (_ BitVec 32)) Bool)

(assert (=> b!318128 (= res!172705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318129 () Bool)

(assert (=> b!318129 (= e!197708 e!197706)))

(declare-fun res!172703 () Bool)

(assert (=> b!318129 (=> (not res!172703) (not e!197706))))

(assert (=> b!318129 (= res!172703 (and (= lt!155226 lt!155223) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7667 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318129 (= lt!155226 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!172710 () Bool)

(assert (=> start!31832 (=> (not res!172710) (not e!197709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31832 (= res!172710 (validMask!0 mask!3709))))

(assert (=> start!31832 e!197709))

(declare-fun array_inv!5630 (array!16203) Bool)

(assert (=> start!31832 (array_inv!5630 a!3293)))

(assert (=> start!31832 true))

(declare-fun b!318130 () Bool)

(declare-fun res!172707 () Bool)

(assert (=> b!318130 (=> (not res!172707) (not e!197709))))

(assert (=> b!318130 (= res!172707 (and (= (size!8019 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8019 a!3293))))))

(declare-fun b!318131 () Bool)

(declare-fun res!172708 () Bool)

(assert (=> b!318131 (=> (not res!172708) (not e!197709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318131 (= res!172708 (validKeyInArray!0 k!2441))))

(assert (= (and start!31832 res!172710) b!318130))

(assert (= (and b!318130 res!172707) b!318131))

(assert (= (and b!318131 res!172708) b!318122))

(assert (= (and b!318122 res!172704) b!318123))

(assert (= (and b!318123 res!172701) b!318128))

(assert (= (and b!318128 res!172705) b!318125))

(assert (= (and b!318125 res!172706) b!318124))

(assert (= (and b!318124 res!172709) b!318129))

(assert (= (and b!318129 res!172703) b!318126))

(assert (= (and b!318126 res!172702) b!318127))

(declare-fun m!326801 () Bool)

(assert (=> b!318131 m!326801))

(declare-fun m!326803 () Bool)

(assert (=> b!318123 m!326803))

(declare-fun m!326805 () Bool)

(assert (=> b!318126 m!326805))

(declare-fun m!326807 () Bool)

(assert (=> b!318126 m!326807))

(declare-fun m!326809 () Bool)

(assert (=> b!318127 m!326809))

(declare-fun m!326811 () Bool)

(assert (=> b!318127 m!326811))

(declare-fun m!326813 () Bool)

(assert (=> b!318127 m!326813))

(declare-fun m!326815 () Bool)

(assert (=> b!318129 m!326815))

(declare-fun m!326817 () Bool)

(assert (=> b!318129 m!326817))

(declare-fun m!326819 () Bool)

(assert (=> start!31832 m!326819))

(declare-fun m!326821 () Bool)

(assert (=> start!31832 m!326821))

(declare-fun m!326823 () Bool)

(assert (=> b!318128 m!326823))

(declare-fun m!326825 () Bool)

(assert (=> b!318124 m!326825))

(declare-fun m!326827 () Bool)

(assert (=> b!318122 m!326827))

(declare-fun m!326829 () Bool)

(assert (=> b!318125 m!326829))

(assert (=> b!318125 m!326829))

(declare-fun m!326831 () Bool)

(assert (=> b!318125 m!326831))

(push 1)

