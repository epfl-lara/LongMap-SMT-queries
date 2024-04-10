; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31858 () Bool)

(assert start!31858)

(declare-fun b!318512 () Bool)

(declare-fun res!173093 () Bool)

(declare-fun e!197905 () Bool)

(assert (=> b!318512 (=> (not res!173093) (not e!197905))))

(declare-datatypes ((array!16229 0))(
  ( (array!16230 (arr!7680 (Array (_ BitVec 32) (_ BitVec 64))) (size!8032 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16229)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2820 0))(
  ( (MissingZero!2820 (index!13456 (_ BitVec 32))) (Found!2820 (index!13457 (_ BitVec 32))) (Intermediate!2820 (undefined!3632 Bool) (index!13458 (_ BitVec 32)) (x!31709 (_ BitVec 32))) (Undefined!2820) (MissingVacant!2820 (index!13459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16229 (_ BitVec 32)) SeekEntryResult!2820)

(assert (=> b!318512 (= res!173093 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2820 i!1240)))))

(declare-fun b!318513 () Bool)

(declare-fun res!173100 () Bool)

(assert (=> b!318513 (=> (not res!173100) (not e!197905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318513 (= res!173100 (validKeyInArray!0 k0!2441))))

(declare-fun b!318514 () Bool)

(declare-fun res!173095 () Bool)

(assert (=> b!318514 (=> (not res!173095) (not e!197905))))

(assert (=> b!318514 (= res!173095 (and (= (size!8032 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8032 a!3293))))))

(declare-fun b!318515 () Bool)

(declare-fun e!197901 () Bool)

(assert (=> b!318515 (= e!197905 e!197901)))

(declare-fun res!173094 () Bool)

(assert (=> b!318515 (=> (not res!173094) (not e!197901))))

(declare-fun lt!155379 () SeekEntryResult!2820)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16229 (_ BitVec 32)) SeekEntryResult!2820)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318515 (= res!173094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155379))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318515 (= lt!155379 (Intermediate!2820 false resIndex!52 resX!52))))

(declare-fun b!318516 () Bool)

(declare-fun e!197902 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318516 (= e!197902 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun e!197904 () Bool)

(assert (=> b!318516 e!197904))

(declare-fun res!173091 () Bool)

(assert (=> b!318516 (=> (not res!173091) (not e!197904))))

(declare-fun lt!155380 () (_ BitVec 32))

(declare-fun lt!155382 () SeekEntryResult!2820)

(assert (=> b!318516 (= res!173091 (= lt!155382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155380 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318516 (= lt!155380 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318517 () Bool)

(declare-fun lt!155381 () array!16229)

(assert (=> b!318517 (= e!197904 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155381 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155380 k0!2441 lt!155381 mask!3709)))))

(assert (=> b!318517 (= lt!155381 (array!16230 (store (arr!7680 a!3293) i!1240 k0!2441) (size!8032 a!3293)))))

(declare-fun res!173092 () Bool)

(assert (=> start!31858 (=> (not res!173092) (not e!197905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31858 (= res!173092 (validMask!0 mask!3709))))

(assert (=> start!31858 e!197905))

(declare-fun array_inv!5643 (array!16229) Bool)

(assert (=> start!31858 (array_inv!5643 a!3293)))

(assert (=> start!31858 true))

(declare-fun b!318518 () Bool)

(declare-fun res!173096 () Bool)

(assert (=> b!318518 (=> (not res!173096) (not e!197905))))

(declare-fun arrayContainsKey!0 (array!16229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318518 (= res!173096 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318519 () Bool)

(assert (=> b!318519 (= e!197901 e!197902)))

(declare-fun res!173099 () Bool)

(assert (=> b!318519 (=> (not res!173099) (not e!197902))))

(assert (=> b!318519 (= res!173099 (and (= lt!155382 lt!155379) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7680 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318519 (= lt!155382 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318520 () Bool)

(declare-fun res!173098 () Bool)

(assert (=> b!318520 (=> (not res!173098) (not e!197901))))

(assert (=> b!318520 (= res!173098 (and (= (select (arr!7680 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8032 a!3293))))))

(declare-fun b!318521 () Bool)

(declare-fun res!173097 () Bool)

(assert (=> b!318521 (=> (not res!173097) (not e!197905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16229 (_ BitVec 32)) Bool)

(assert (=> b!318521 (= res!173097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31858 res!173092) b!318514))

(assert (= (and b!318514 res!173095) b!318513))

(assert (= (and b!318513 res!173100) b!318518))

(assert (= (and b!318518 res!173096) b!318512))

(assert (= (and b!318512 res!173093) b!318521))

(assert (= (and b!318521 res!173097) b!318515))

(assert (= (and b!318515 res!173094) b!318520))

(assert (= (and b!318520 res!173098) b!318519))

(assert (= (and b!318519 res!173099) b!318516))

(assert (= (and b!318516 res!173091) b!318517))

(declare-fun m!327217 () Bool)

(assert (=> b!318517 m!327217))

(declare-fun m!327219 () Bool)

(assert (=> b!318517 m!327219))

(declare-fun m!327221 () Bool)

(assert (=> b!318517 m!327221))

(declare-fun m!327223 () Bool)

(assert (=> b!318515 m!327223))

(assert (=> b!318515 m!327223))

(declare-fun m!327225 () Bool)

(assert (=> b!318515 m!327225))

(declare-fun m!327227 () Bool)

(assert (=> b!318518 m!327227))

(declare-fun m!327229 () Bool)

(assert (=> start!31858 m!327229))

(declare-fun m!327231 () Bool)

(assert (=> start!31858 m!327231))

(declare-fun m!327233 () Bool)

(assert (=> b!318520 m!327233))

(declare-fun m!327235 () Bool)

(assert (=> b!318519 m!327235))

(declare-fun m!327237 () Bool)

(assert (=> b!318519 m!327237))

(declare-fun m!327239 () Bool)

(assert (=> b!318521 m!327239))

(declare-fun m!327241 () Bool)

(assert (=> b!318516 m!327241))

(declare-fun m!327243 () Bool)

(assert (=> b!318516 m!327243))

(declare-fun m!327245 () Bool)

(assert (=> b!318512 m!327245))

(declare-fun m!327247 () Bool)

(assert (=> b!318513 m!327247))

(check-sat (not b!318518) (not b!318513) (not b!318516) (not b!318512) (not b!318521) (not b!318515) (not start!31858) (not b!318517) (not b!318519))
(check-sat)
