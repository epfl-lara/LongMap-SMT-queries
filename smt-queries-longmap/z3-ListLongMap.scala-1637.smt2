; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30588 () Bool)

(assert start!30588)

(declare-fun b!306941 () Bool)

(declare-fun res!163745 () Bool)

(declare-fun e!192341 () Bool)

(assert (=> b!306941 (=> (not res!163745) (not e!192341))))

(declare-datatypes ((array!15605 0))(
  ( (array!15606 (arr!7387 (Array (_ BitVec 32) (_ BitVec 64))) (size!7739 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15605)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306941 (= res!163745 (and (= (size!7739 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7739 a!3293))))))

(declare-fun b!306942 () Bool)

(declare-fun res!163749 () Bool)

(assert (=> b!306942 (=> (not res!163749) (not e!192341))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2492 0))(
  ( (MissingZero!2492 (index!12144 (_ BitVec 32))) (Found!2492 (index!12145 (_ BitVec 32))) (Intermediate!2492 (undefined!3304 Bool) (index!12146 (_ BitVec 32)) (x!30500 (_ BitVec 32))) (Undefined!2492) (MissingVacant!2492 (index!12147 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15605 (_ BitVec 32)) SeekEntryResult!2492)

(assert (=> b!306942 (= res!163749 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2492 i!1240)))))

(declare-fun b!306943 () Bool)

(declare-fun res!163750 () Bool)

(assert (=> b!306943 (=> (not res!163750) (not e!192341))))

(declare-fun arrayContainsKey!0 (array!15605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306943 (= res!163750 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306944 () Bool)

(declare-fun res!163747 () Bool)

(assert (=> b!306944 (=> (not res!163747) (not e!192341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15605 (_ BitVec 32)) Bool)

(assert (=> b!306944 (= res!163747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306945 () Bool)

(assert (=> b!306945 (= e!192341 false)))

(declare-fun lt!151098 () SeekEntryResult!2492)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15605 (_ BitVec 32)) SeekEntryResult!2492)

(assert (=> b!306945 (= lt!151098 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!306946 () Bool)

(declare-fun res!163748 () Bool)

(assert (=> b!306946 (=> (not res!163748) (not e!192341))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306946 (= res!163748 (and (= (select (arr!7387 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7739 a!3293))))))

(declare-fun res!163752 () Bool)

(assert (=> start!30588 (=> (not res!163752) (not e!192341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30588 (= res!163752 (validMask!0 mask!3709))))

(assert (=> start!30588 e!192341))

(declare-fun array_inv!5337 (array!15605) Bool)

(assert (=> start!30588 (array_inv!5337 a!3293)))

(assert (=> start!30588 true))

(declare-fun b!306947 () Bool)

(declare-fun res!163746 () Bool)

(assert (=> b!306947 (=> (not res!163746) (not e!192341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306947 (= res!163746 (validKeyInArray!0 k0!2441))))

(declare-fun b!306948 () Bool)

(declare-fun res!163751 () Bool)

(assert (=> b!306948 (=> (not res!163751) (not e!192341))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306948 (= res!163751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2492 false resIndex!52 resX!52)))))

(assert (= (and start!30588 res!163752) b!306941))

(assert (= (and b!306941 res!163745) b!306947))

(assert (= (and b!306947 res!163746) b!306943))

(assert (= (and b!306943 res!163750) b!306942))

(assert (= (and b!306942 res!163749) b!306944))

(assert (= (and b!306944 res!163747) b!306948))

(assert (= (and b!306948 res!163751) b!306946))

(assert (= (and b!306946 res!163748) b!306945))

(declare-fun m!317503 () Bool)

(assert (=> b!306948 m!317503))

(assert (=> b!306948 m!317503))

(declare-fun m!317505 () Bool)

(assert (=> b!306948 m!317505))

(declare-fun m!317507 () Bool)

(assert (=> b!306947 m!317507))

(declare-fun m!317509 () Bool)

(assert (=> b!306945 m!317509))

(declare-fun m!317511 () Bool)

(assert (=> b!306943 m!317511))

(declare-fun m!317513 () Bool)

(assert (=> start!30588 m!317513))

(declare-fun m!317515 () Bool)

(assert (=> start!30588 m!317515))

(declare-fun m!317517 () Bool)

(assert (=> b!306944 m!317517))

(declare-fun m!317519 () Bool)

(assert (=> b!306946 m!317519))

(declare-fun m!317521 () Bool)

(assert (=> b!306942 m!317521))

(check-sat (not b!306948) (not b!306942) (not b!306944) (not b!306943) (not b!306947) (not start!30588) (not b!306945))
(check-sat)
