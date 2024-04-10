; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30810 () Bool)

(assert start!30810)

(declare-fun b!309309 () Bool)

(declare-fun e!193255 () Bool)

(declare-fun e!193257 () Bool)

(assert (=> b!309309 (= e!193255 e!193257)))

(declare-fun res!165923 () Bool)

(assert (=> b!309309 (=> (not res!165923) (not e!193257))))

(declare-datatypes ((array!15763 0))(
  ( (array!15764 (arr!7465 (Array (_ BitVec 32) (_ BitVec 64))) (size!7817 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15763)

(declare-datatypes ((SeekEntryResult!2605 0))(
  ( (MissingZero!2605 (index!12596 (_ BitVec 32))) (Found!2605 (index!12597 (_ BitVec 32))) (Intermediate!2605 (undefined!3417 Bool) (index!12598 (_ BitVec 32)) (x!30825 (_ BitVec 32))) (Undefined!2605) (MissingVacant!2605 (index!12599 (_ BitVec 32))) )
))
(declare-fun lt!151560 () SeekEntryResult!2605)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!151559 () SeekEntryResult!2605)

(assert (=> b!309309 (= res!165923 (and (= lt!151560 lt!151559) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7465 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15763 (_ BitVec 32)) SeekEntryResult!2605)

(assert (=> b!309309 (= lt!151560 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309310 () Bool)

(declare-fun res!165928 () Bool)

(declare-fun e!193256 () Bool)

(assert (=> b!309310 (=> (not res!165928) (not e!193256))))

(declare-fun arrayContainsKey!0 (array!15763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309310 (= res!165928 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!165929 () Bool)

(assert (=> start!30810 (=> (not res!165929) (not e!193256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30810 (= res!165929 (validMask!0 mask!3709))))

(assert (=> start!30810 e!193256))

(declare-fun array_inv!5428 (array!15763) Bool)

(assert (=> start!30810 (array_inv!5428 a!3293)))

(assert (=> start!30810 true))

(declare-fun b!309311 () Bool)

(declare-fun res!165924 () Bool)

(assert (=> b!309311 (=> (not res!165924) (not e!193256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309311 (= res!165924 (validKeyInArray!0 k!2441))))

(declare-fun b!309312 () Bool)

(declare-fun res!165927 () Bool)

(assert (=> b!309312 (=> (not res!165927) (not e!193256))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309312 (= res!165927 (and (= (size!7817 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7817 a!3293))))))

(declare-fun b!309313 () Bool)

(declare-fun res!165930 () Bool)

(assert (=> b!309313 (=> (not res!165930) (not e!193255))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309313 (= res!165930 (and (= (select (arr!7465 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7817 a!3293))))))

(declare-fun b!309314 () Bool)

(declare-fun res!165922 () Bool)

(assert (=> b!309314 (=> (not res!165922) (not e!193256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15763 (_ BitVec 32)) Bool)

(assert (=> b!309314 (= res!165922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309315 () Bool)

(assert (=> b!309315 (= e!193257 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309315 (= lt!151560 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309316 () Bool)

(declare-fun res!165926 () Bool)

(assert (=> b!309316 (=> (not res!165926) (not e!193256))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15763 (_ BitVec 32)) SeekEntryResult!2605)

(assert (=> b!309316 (= res!165926 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2605 i!1240)))))

(declare-fun b!309317 () Bool)

(assert (=> b!309317 (= e!193256 e!193255)))

(declare-fun res!165925 () Bool)

(assert (=> b!309317 (=> (not res!165925) (not e!193255))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309317 (= res!165925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151559))))

(assert (=> b!309317 (= lt!151559 (Intermediate!2605 false resIndex!52 resX!52))))

(assert (= (and start!30810 res!165929) b!309312))

(assert (= (and b!309312 res!165927) b!309311))

(assert (= (and b!309311 res!165924) b!309310))

(assert (= (and b!309310 res!165928) b!309316))

(assert (= (and b!309316 res!165926) b!309314))

(assert (= (and b!309314 res!165922) b!309317))

(assert (= (and b!309317 res!165925) b!309313))

(assert (= (and b!309313 res!165930) b!309309))

(assert (= (and b!309309 res!165923) b!309315))

(declare-fun m!319317 () Bool)

(assert (=> start!30810 m!319317))

(declare-fun m!319319 () Bool)

(assert (=> start!30810 m!319319))

(declare-fun m!319321 () Bool)

(assert (=> b!309317 m!319321))

(assert (=> b!309317 m!319321))

(declare-fun m!319323 () Bool)

(assert (=> b!309317 m!319323))

(declare-fun m!319325 () Bool)

(assert (=> b!309311 m!319325))

(declare-fun m!319327 () Bool)

(assert (=> b!309313 m!319327))

(declare-fun m!319329 () Bool)

(assert (=> b!309310 m!319329))

(declare-fun m!319331 () Bool)

(assert (=> b!309316 m!319331))

(declare-fun m!319333 () Bool)

(assert (=> b!309315 m!319333))

(assert (=> b!309315 m!319333))

(declare-fun m!319335 () Bool)

(assert (=> b!309315 m!319335))

(declare-fun m!319337 () Bool)

(assert (=> b!309314 m!319337))

(declare-fun m!319339 () Bool)

(assert (=> b!309309 m!319339))

(declare-fun m!319341 () Bool)

(assert (=> b!309309 m!319341))

(push 1)

(assert (not start!30810))

(assert (not b!309310))

(assert (not b!309314))

(assert (not b!309309))

(assert (not b!309316))

