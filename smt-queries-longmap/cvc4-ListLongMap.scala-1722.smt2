; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31788 () Bool)

(assert start!31788)

(declare-fun res!172043 () Bool)

(declare-fun e!197376 () Bool)

(assert (=> start!31788 (=> (not res!172043) (not e!197376))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31788 (= res!172043 (validMask!0 mask!3709))))

(assert (=> start!31788 e!197376))

(declare-datatypes ((array!16159 0))(
  ( (array!16160 (arr!7645 (Array (_ BitVec 32) (_ BitVec 64))) (size!7997 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16159)

(declare-fun array_inv!5608 (array!16159) Bool)

(assert (=> start!31788 (array_inv!5608 a!3293)))

(assert (=> start!31788 true))

(declare-fun b!317462 () Bool)

(declare-fun e!197377 () Bool)

(declare-fun e!197379 () Bool)

(assert (=> b!317462 (= e!197377 e!197379)))

(declare-fun res!172045 () Bool)

(assert (=> b!317462 (=> (not res!172045) (not e!197379))))

(declare-datatypes ((SeekEntryResult!2785 0))(
  ( (MissingZero!2785 (index!13316 (_ BitVec 32))) (Found!2785 (index!13317 (_ BitVec 32))) (Intermediate!2785 (undefined!3597 Bool) (index!13318 (_ BitVec 32)) (x!31578 (_ BitVec 32))) (Undefined!2785) (MissingVacant!2785 (index!13319 (_ BitVec 32))) )
))
(declare-fun lt!154962 () SeekEntryResult!2785)

(declare-fun lt!154960 () SeekEntryResult!2785)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317462 (= res!172045 (and (= lt!154960 lt!154962) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7645 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16159 (_ BitVec 32)) SeekEntryResult!2785)

(assert (=> b!317462 (= lt!154960 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317463 () Bool)

(assert (=> b!317463 (= e!197376 e!197377)))

(declare-fun res!172048 () Bool)

(assert (=> b!317463 (=> (not res!172048) (not e!197377))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317463 (= res!172048 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154962))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317463 (= lt!154962 (Intermediate!2785 false resIndex!52 resX!52))))

(declare-fun b!317464 () Bool)

(declare-fun res!172049 () Bool)

(assert (=> b!317464 (=> (not res!172049) (not e!197377))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317464 (= res!172049 (and (= (select (arr!7645 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7997 a!3293))))))

(declare-fun b!317465 () Bool)

(declare-fun res!172044 () Bool)

(assert (=> b!317465 (=> (not res!172044) (not e!197376))))

(declare-fun arrayContainsKey!0 (array!16159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317465 (= res!172044 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun lt!154959 () (_ BitVec 32))

(declare-fun e!197378 () Bool)

(declare-fun lt!154961 () array!16159)

(declare-fun b!317466 () Bool)

(assert (=> b!317466 (= e!197378 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154961 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154959 k!2441 lt!154961 mask!3709)))))

(assert (=> b!317466 (= lt!154961 (array!16160 (store (arr!7645 a!3293) i!1240 k!2441) (size!7997 a!3293)))))

(declare-fun b!317467 () Bool)

(assert (=> b!317467 (= e!197379 (not true))))

(assert (=> b!317467 e!197378))

(declare-fun res!172042 () Bool)

(assert (=> b!317467 (=> (not res!172042) (not e!197378))))

(assert (=> b!317467 (= res!172042 (= lt!154960 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154959 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317467 (= lt!154959 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317468 () Bool)

(declare-fun res!172046 () Bool)

(assert (=> b!317468 (=> (not res!172046) (not e!197376))))

(assert (=> b!317468 (= res!172046 (and (= (size!7997 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7997 a!3293))))))

(declare-fun b!317469 () Bool)

(declare-fun res!172050 () Bool)

(assert (=> b!317469 (=> (not res!172050) (not e!197376))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16159 (_ BitVec 32)) SeekEntryResult!2785)

(assert (=> b!317469 (= res!172050 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2785 i!1240)))))

(declare-fun b!317470 () Bool)

(declare-fun res!172047 () Bool)

(assert (=> b!317470 (=> (not res!172047) (not e!197376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16159 (_ BitVec 32)) Bool)

(assert (=> b!317470 (= res!172047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317471 () Bool)

(declare-fun res!172041 () Bool)

(assert (=> b!317471 (=> (not res!172041) (not e!197376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317471 (= res!172041 (validKeyInArray!0 k!2441))))

(assert (= (and start!31788 res!172043) b!317468))

(assert (= (and b!317468 res!172046) b!317471))

(assert (= (and b!317471 res!172041) b!317465))

(assert (= (and b!317465 res!172044) b!317469))

(assert (= (and b!317469 res!172050) b!317470))

(assert (= (and b!317470 res!172047) b!317463))

(assert (= (and b!317463 res!172048) b!317464))

(assert (= (and b!317464 res!172049) b!317462))

(assert (= (and b!317462 res!172045) b!317467))

(assert (= (and b!317467 res!172042) b!317466))

(declare-fun m!326097 () Bool)

(assert (=> b!317469 m!326097))

(declare-fun m!326099 () Bool)

(assert (=> b!317471 m!326099))

(declare-fun m!326101 () Bool)

(assert (=> b!317463 m!326101))

(assert (=> b!317463 m!326101))

(declare-fun m!326103 () Bool)

(assert (=> b!317463 m!326103))

(declare-fun m!326105 () Bool)

(assert (=> b!317462 m!326105))

(declare-fun m!326107 () Bool)

(assert (=> b!317462 m!326107))

(declare-fun m!326109 () Bool)

(assert (=> b!317467 m!326109))

(declare-fun m!326111 () Bool)

(assert (=> b!317467 m!326111))

(declare-fun m!326113 () Bool)

(assert (=> b!317464 m!326113))

(declare-fun m!326115 () Bool)

(assert (=> b!317466 m!326115))

(declare-fun m!326117 () Bool)

(assert (=> b!317466 m!326117))

(declare-fun m!326119 () Bool)

(assert (=> b!317466 m!326119))

(declare-fun m!326121 () Bool)

(assert (=> start!31788 m!326121))

(declare-fun m!326123 () Bool)

(assert (=> start!31788 m!326123))

(declare-fun m!326125 () Bool)

(assert (=> b!317470 m!326125))

(declare-fun m!326127 () Bool)

(assert (=> b!317465 m!326127))

(push 1)

(assert (not b!317462))

(assert (not b!317469))

(assert (not b!317465))

