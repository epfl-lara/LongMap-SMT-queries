; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31830 () Bool)

(assert start!31830)

(declare-fun b!318092 () Bool)

(declare-fun e!197695 () Bool)

(assert (=> b!318092 (= e!197695 (not true))))

(declare-fun e!197694 () Bool)

(assert (=> b!318092 e!197694))

(declare-fun res!172672 () Bool)

(assert (=> b!318092 (=> (not res!172672) (not e!197694))))

(declare-datatypes ((array!16201 0))(
  ( (array!16202 (arr!7666 (Array (_ BitVec 32) (_ BitVec 64))) (size!8018 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16201)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2806 0))(
  ( (MissingZero!2806 (index!13400 (_ BitVec 32))) (Found!2806 (index!13401 (_ BitVec 32))) (Intermediate!2806 (undefined!3618 Bool) (index!13402 (_ BitVec 32)) (x!31655 (_ BitVec 32))) (Undefined!2806) (MissingVacant!2806 (index!13403 (_ BitVec 32))) )
))
(declare-fun lt!155211 () SeekEntryResult!2806)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155213 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16201 (_ BitVec 32)) SeekEntryResult!2806)

(assert (=> b!318092 (= res!172672 (= lt!155211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155213 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318092 (= lt!155213 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318093 () Bool)

(declare-fun res!172671 () Bool)

(declare-fun e!197691 () Bool)

(assert (=> b!318093 (=> (not res!172671) (not e!197691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16201 (_ BitVec 32)) Bool)

(assert (=> b!318093 (= res!172671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318094 () Bool)

(declare-fun res!172678 () Bool)

(assert (=> b!318094 (=> (not res!172678) (not e!197691))))

(declare-fun arrayContainsKey!0 (array!16201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318094 (= res!172678 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318095 () Bool)

(declare-fun res!172679 () Bool)

(declare-fun e!197693 () Bool)

(assert (=> b!318095 (=> (not res!172679) (not e!197693))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318095 (= res!172679 (and (= (select (arr!7666 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8018 a!3293))))))

(declare-fun b!318096 () Bool)

(assert (=> b!318096 (= e!197693 e!197695)))

(declare-fun res!172673 () Bool)

(assert (=> b!318096 (=> (not res!172673) (not e!197695))))

(declare-fun lt!155212 () SeekEntryResult!2806)

(assert (=> b!318096 (= res!172673 (and (= lt!155211 lt!155212) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7666 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318096 (= lt!155211 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun lt!155214 () array!16201)

(declare-fun b!318097 () Bool)

(assert (=> b!318097 (= e!197694 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155214 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155213 k!2441 lt!155214 mask!3709)))))

(assert (=> b!318097 (= lt!155214 (array!16202 (store (arr!7666 a!3293) i!1240 k!2441) (size!8018 a!3293)))))

(declare-fun b!318098 () Bool)

(assert (=> b!318098 (= e!197691 e!197693)))

(declare-fun res!172676 () Bool)

(assert (=> b!318098 (=> (not res!172676) (not e!197693))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318098 (= res!172676 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155212))))

(assert (=> b!318098 (= lt!155212 (Intermediate!2806 false resIndex!52 resX!52))))

(declare-fun b!318099 () Bool)

(declare-fun res!172680 () Bool)

(assert (=> b!318099 (=> (not res!172680) (not e!197691))))

(assert (=> b!318099 (= res!172680 (and (= (size!8018 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8018 a!3293))))))

(declare-fun b!318100 () Bool)

(declare-fun res!172674 () Bool)

(assert (=> b!318100 (=> (not res!172674) (not e!197691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318100 (= res!172674 (validKeyInArray!0 k!2441))))

(declare-fun b!318101 () Bool)

(declare-fun res!172677 () Bool)

(assert (=> b!318101 (=> (not res!172677) (not e!197691))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16201 (_ BitVec 32)) SeekEntryResult!2806)

(assert (=> b!318101 (= res!172677 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2806 i!1240)))))

(declare-fun res!172675 () Bool)

(assert (=> start!31830 (=> (not res!172675) (not e!197691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31830 (= res!172675 (validMask!0 mask!3709))))

(assert (=> start!31830 e!197691))

(declare-fun array_inv!5629 (array!16201) Bool)

(assert (=> start!31830 (array_inv!5629 a!3293)))

(assert (=> start!31830 true))

(assert (= (and start!31830 res!172675) b!318099))

(assert (= (and b!318099 res!172680) b!318100))

(assert (= (and b!318100 res!172674) b!318094))

(assert (= (and b!318094 res!172678) b!318101))

(assert (= (and b!318101 res!172677) b!318093))

(assert (= (and b!318093 res!172671) b!318098))

(assert (= (and b!318098 res!172676) b!318095))

(assert (= (and b!318095 res!172679) b!318096))

(assert (= (and b!318096 res!172673) b!318092))

(assert (= (and b!318092 res!172672) b!318097))

(declare-fun m!326769 () Bool)

(assert (=> b!318097 m!326769))

(declare-fun m!326771 () Bool)

(assert (=> b!318097 m!326771))

(declare-fun m!326773 () Bool)

(assert (=> b!318097 m!326773))

(declare-fun m!326775 () Bool)

(assert (=> b!318094 m!326775))

(declare-fun m!326777 () Bool)

(assert (=> b!318096 m!326777))

(declare-fun m!326779 () Bool)

(assert (=> b!318096 m!326779))

(declare-fun m!326781 () Bool)

(assert (=> b!318092 m!326781))

(declare-fun m!326783 () Bool)

(assert (=> b!318092 m!326783))

(declare-fun m!326785 () Bool)

(assert (=> b!318095 m!326785))

(declare-fun m!326787 () Bool)

(assert (=> b!318101 m!326787))

(declare-fun m!326789 () Bool)

(assert (=> start!31830 m!326789))

(declare-fun m!326791 () Bool)

(assert (=> start!31830 m!326791))

(declare-fun m!326793 () Bool)

(assert (=> b!318098 m!326793))

(assert (=> b!318098 m!326793))

(declare-fun m!326795 () Bool)

(assert (=> b!318098 m!326795))

(declare-fun m!326797 () Bool)

(assert (=> b!318093 m!326797))

(declare-fun m!326799 () Bool)

(assert (=> b!318100 m!326799))

(push 1)

(assert (not b!318100))

(assert (not b!318097))

(assert (not b!318096))

(assert (not b!318093))

(assert (not start!31830))

(assert (not b!318092))

(assert (not b!318094))

(assert (not b!318101))

(assert (not b!318098))

(check-sat)

