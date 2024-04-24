; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30960 () Bool)

(assert start!30960)

(declare-fun b!311094 () Bool)

(declare-fun res!167599 () Bool)

(declare-fun e!194138 () Bool)

(assert (=> b!311094 (=> (not res!167599) (not e!194138))))

(declare-datatypes ((array!15875 0))(
  ( (array!15876 (arr!7519 (Array (_ BitVec 32) (_ BitVec 64))) (size!7871 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15875)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311094 (= res!167599 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311095 () Bool)

(declare-fun res!167603 () Bool)

(declare-fun e!194140 () Bool)

(assert (=> b!311095 (=> (not res!167603) (not e!194140))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311095 (= res!167603 (and (= (select (arr!7519 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7871 a!3293))))))

(declare-fun b!311096 () Bool)

(declare-fun e!194139 () Bool)

(assert (=> b!311096 (= e!194140 e!194139)))

(declare-fun res!167601 () Bool)

(assert (=> b!311096 (=> (not res!167601) (not e!194139))))

(declare-datatypes ((SeekEntryResult!2624 0))(
  ( (MissingZero!2624 (index!12672 (_ BitVec 32))) (Found!2624 (index!12673 (_ BitVec 32))) (Intermediate!2624 (undefined!3436 Bool) (index!12674 (_ BitVec 32)) (x!31002 (_ BitVec 32))) (Undefined!2624) (MissingVacant!2624 (index!12675 (_ BitVec 32))) )
))
(declare-fun lt!152259 () SeekEntryResult!2624)

(declare-fun lt!152256 () SeekEntryResult!2624)

(assert (=> b!311096 (= res!167601 (and (= lt!152256 lt!152259) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7519 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15875 (_ BitVec 32)) SeekEntryResult!2624)

(assert (=> b!311096 (= lt!152256 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!167605 () Bool)

(assert (=> start!30960 (=> (not res!167605) (not e!194138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30960 (= res!167605 (validMask!0 mask!3709))))

(assert (=> start!30960 e!194138))

(declare-fun array_inv!5469 (array!15875) Bool)

(assert (=> start!30960 (array_inv!5469 a!3293)))

(assert (=> start!30960 true))

(declare-fun b!311097 () Bool)

(declare-fun res!167607 () Bool)

(assert (=> b!311097 (=> (not res!167607) (not e!194138))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15875 (_ BitVec 32)) SeekEntryResult!2624)

(assert (=> b!311097 (= res!167607 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2624 i!1240)))))

(declare-fun b!311098 () Bool)

(assert (=> b!311098 (= e!194138 e!194140)))

(declare-fun res!167606 () Bool)

(assert (=> b!311098 (=> (not res!167606) (not e!194140))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311098 (= res!167606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152259))))

(assert (=> b!311098 (= lt!152259 (Intermediate!2624 false resIndex!52 resX!52))))

(declare-fun b!311099 () Bool)

(declare-fun e!194141 () Bool)

(declare-fun lt!152258 () (_ BitVec 32))

(declare-fun lt!152257 () array!15875)

(assert (=> b!311099 (= e!194141 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152257 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152258 k0!2441 lt!152257 mask!3709)))))

(assert (=> b!311099 (= lt!152257 (array!15876 (store (arr!7519 a!3293) i!1240 k0!2441) (size!7871 a!3293)))))

(declare-fun b!311100 () Bool)

(declare-fun res!167598 () Bool)

(assert (=> b!311100 (=> (not res!167598) (not e!194138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311100 (= res!167598 (validKeyInArray!0 k0!2441))))

(declare-fun b!311101 () Bool)

(declare-fun res!167600 () Bool)

(assert (=> b!311101 (=> (not res!167600) (not e!194138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15875 (_ BitVec 32)) Bool)

(assert (=> b!311101 (= res!167600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311102 () Bool)

(assert (=> b!311102 (= e!194139 (not true))))

(assert (=> b!311102 e!194141))

(declare-fun res!167604 () Bool)

(assert (=> b!311102 (=> (not res!167604) (not e!194141))))

(assert (=> b!311102 (= res!167604 (= lt!152256 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152258 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311102 (= lt!152258 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311103 () Bool)

(declare-fun res!167602 () Bool)

(assert (=> b!311103 (=> (not res!167602) (not e!194138))))

(assert (=> b!311103 (= res!167602 (and (= (size!7871 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7871 a!3293))))))

(assert (= (and start!30960 res!167605) b!311103))

(assert (= (and b!311103 res!167602) b!311100))

(assert (= (and b!311100 res!167598) b!311094))

(assert (= (and b!311094 res!167599) b!311097))

(assert (= (and b!311097 res!167607) b!311101))

(assert (= (and b!311101 res!167600) b!311098))

(assert (= (and b!311098 res!167606) b!311095))

(assert (= (and b!311095 res!167603) b!311096))

(assert (= (and b!311096 res!167601) b!311102))

(assert (= (and b!311102 res!167604) b!311099))

(declare-fun m!321235 () Bool)

(assert (=> b!311101 m!321235))

(declare-fun m!321237 () Bool)

(assert (=> start!30960 m!321237))

(declare-fun m!321239 () Bool)

(assert (=> start!30960 m!321239))

(declare-fun m!321241 () Bool)

(assert (=> b!311097 m!321241))

(declare-fun m!321243 () Bool)

(assert (=> b!311094 m!321243))

(declare-fun m!321245 () Bool)

(assert (=> b!311096 m!321245))

(declare-fun m!321247 () Bool)

(assert (=> b!311096 m!321247))

(declare-fun m!321249 () Bool)

(assert (=> b!311099 m!321249))

(declare-fun m!321251 () Bool)

(assert (=> b!311099 m!321251))

(declare-fun m!321253 () Bool)

(assert (=> b!311099 m!321253))

(declare-fun m!321255 () Bool)

(assert (=> b!311095 m!321255))

(declare-fun m!321257 () Bool)

(assert (=> b!311100 m!321257))

(declare-fun m!321259 () Bool)

(assert (=> b!311098 m!321259))

(assert (=> b!311098 m!321259))

(declare-fun m!321261 () Bool)

(assert (=> b!311098 m!321261))

(declare-fun m!321263 () Bool)

(assert (=> b!311102 m!321263))

(declare-fun m!321265 () Bool)

(assert (=> b!311102 m!321265))

(check-sat (not b!311094) (not b!311101) (not b!311096) (not start!30960) (not b!311099) (not b!311102) (not b!311097) (not b!311100) (not b!311098))
(check-sat)
