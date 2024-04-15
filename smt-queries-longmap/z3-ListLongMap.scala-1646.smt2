; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30642 () Bool)

(assert start!30642)

(declare-fun b!307414 () Bool)

(declare-fun res!164321 () Bool)

(declare-fun e!192409 () Bool)

(assert (=> b!307414 (=> (not res!164321) (not e!192409))))

(declare-datatypes ((array!15650 0))(
  ( (array!15651 (arr!7410 (Array (_ BitVec 32) (_ BitVec 64))) (size!7763 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15650)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15650 (_ BitVec 32)) Bool)

(assert (=> b!307414 (= res!164321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307415 () Bool)

(declare-fun res!164319 () Bool)

(declare-fun e!192410 () Bool)

(assert (=> b!307415 (=> (not res!164319) (not e!192410))))

(declare-datatypes ((SeekEntryResult!2549 0))(
  ( (MissingZero!2549 (index!12372 (_ BitVec 32))) (Found!2549 (index!12373 (_ BitVec 32))) (Intermediate!2549 (undefined!3361 Bool) (index!12374 (_ BitVec 32)) (x!30627 (_ BitVec 32))) (Undefined!2549) (MissingVacant!2549 (index!12375 (_ BitVec 32))) )
))
(declare-fun lt!150926 () SeekEntryResult!2549)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15650 (_ BitVec 32)) SeekEntryResult!2549)

(assert (=> b!307415 (= res!164319 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150926))))

(declare-fun res!164322 () Bool)

(assert (=> start!30642 (=> (not res!164322) (not e!192409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30642 (= res!164322 (validMask!0 mask!3709))))

(assert (=> start!30642 e!192409))

(declare-fun array_inv!5382 (array!15650) Bool)

(assert (=> start!30642 (array_inv!5382 a!3293)))

(assert (=> start!30642 true))

(declare-fun b!307416 () Bool)

(declare-fun res!164318 () Bool)

(assert (=> b!307416 (=> (not res!164318) (not e!192410))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307416 (= res!164318 (and (= (select (arr!7410 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7763 a!3293))))))

(declare-fun b!307417 () Bool)

(declare-fun res!164314 () Bool)

(assert (=> b!307417 (=> (not res!164314) (not e!192409))))

(declare-fun arrayContainsKey!0 (array!15650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307417 (= res!164314 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307418 () Bool)

(declare-fun res!164316 () Bool)

(assert (=> b!307418 (=> (not res!164316) (not e!192409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307418 (= res!164316 (validKeyInArray!0 k0!2441))))

(declare-fun b!307419 () Bool)

(declare-fun res!164320 () Bool)

(assert (=> b!307419 (=> (not res!164320) (not e!192409))))

(assert (=> b!307419 (= res!164320 (and (= (size!7763 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7763 a!3293))))))

(declare-fun b!307420 () Bool)

(assert (=> b!307420 (= e!192410 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7410 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307421 () Bool)

(assert (=> b!307421 (= e!192409 e!192410)))

(declare-fun res!164317 () Bool)

(assert (=> b!307421 (=> (not res!164317) (not e!192410))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307421 (= res!164317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150926))))

(assert (=> b!307421 (= lt!150926 (Intermediate!2549 false resIndex!52 resX!52))))

(declare-fun b!307422 () Bool)

(declare-fun res!164315 () Bool)

(assert (=> b!307422 (=> (not res!164315) (not e!192409))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15650 (_ BitVec 32)) SeekEntryResult!2549)

(assert (=> b!307422 (= res!164315 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2549 i!1240)))))

(assert (= (and start!30642 res!164322) b!307419))

(assert (= (and b!307419 res!164320) b!307418))

(assert (= (and b!307418 res!164316) b!307417))

(assert (= (and b!307417 res!164314) b!307422))

(assert (= (and b!307422 res!164315) b!307414))

(assert (= (and b!307414 res!164321) b!307421))

(assert (= (and b!307421 res!164317) b!307416))

(assert (= (and b!307416 res!164318) b!307415))

(assert (= (and b!307415 res!164319) b!307420))

(declare-fun m!317221 () Bool)

(assert (=> b!307422 m!317221))

(declare-fun m!317223 () Bool)

(assert (=> b!307417 m!317223))

(declare-fun m!317225 () Bool)

(assert (=> b!307420 m!317225))

(declare-fun m!317227 () Bool)

(assert (=> b!307418 m!317227))

(declare-fun m!317229 () Bool)

(assert (=> b!307416 m!317229))

(declare-fun m!317231 () Bool)

(assert (=> b!307414 m!317231))

(declare-fun m!317233 () Bool)

(assert (=> start!30642 m!317233))

(declare-fun m!317235 () Bool)

(assert (=> start!30642 m!317235))

(declare-fun m!317237 () Bool)

(assert (=> b!307421 m!317237))

(assert (=> b!307421 m!317237))

(declare-fun m!317239 () Bool)

(assert (=> b!307421 m!317239))

(declare-fun m!317241 () Bool)

(assert (=> b!307415 m!317241))

(check-sat (not start!30642) (not b!307417) (not b!307421) (not b!307415) (not b!307422) (not b!307418) (not b!307414))
(check-sat)
