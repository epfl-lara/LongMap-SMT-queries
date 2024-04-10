; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30834 () Bool)

(assert start!30834)

(declare-fun b!309633 () Bool)

(declare-fun res!166254 () Bool)

(declare-fun e!193399 () Bool)

(assert (=> b!309633 (=> (not res!166254) (not e!193399))))

(declare-datatypes ((array!15787 0))(
  ( (array!15788 (arr!7477 (Array (_ BitVec 32) (_ BitVec 64))) (size!7829 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15787)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309633 (= res!166254 (and (= (select (arr!7477 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7829 a!3293))))))

(declare-fun res!166249 () Bool)

(declare-fun e!193400 () Bool)

(assert (=> start!30834 (=> (not res!166249) (not e!193400))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30834 (= res!166249 (validMask!0 mask!3709))))

(assert (=> start!30834 e!193400))

(declare-fun array_inv!5440 (array!15787) Bool)

(assert (=> start!30834 (array_inv!5440 a!3293)))

(assert (=> start!30834 true))

(declare-fun b!309634 () Bool)

(declare-fun res!166246 () Bool)

(assert (=> b!309634 (=> (not res!166246) (not e!193400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15787 (_ BitVec 32)) Bool)

(assert (=> b!309634 (= res!166246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309635 () Bool)

(assert (=> b!309635 (= e!193400 e!193399)))

(declare-fun res!166250 () Bool)

(assert (=> b!309635 (=> (not res!166250) (not e!193399))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2617 0))(
  ( (MissingZero!2617 (index!12644 (_ BitVec 32))) (Found!2617 (index!12645 (_ BitVec 32))) (Intermediate!2617 (undefined!3429 Bool) (index!12646 (_ BitVec 32)) (x!30869 (_ BitVec 32))) (Undefined!2617) (MissingVacant!2617 (index!12647 (_ BitVec 32))) )
))
(declare-fun lt!151640 () SeekEntryResult!2617)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15787 (_ BitVec 32)) SeekEntryResult!2617)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309635 (= res!166250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151640))))

(assert (=> b!309635 (= lt!151640 (Intermediate!2617 false resIndex!52 resX!52))))

(declare-fun b!309636 () Bool)

(declare-fun res!166247 () Bool)

(assert (=> b!309636 (=> (not res!166247) (not e!193400))))

(declare-fun arrayContainsKey!0 (array!15787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309636 (= res!166247 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309637 () Bool)

(declare-fun res!166253 () Bool)

(assert (=> b!309637 (=> (not res!166253) (not e!193400))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15787 (_ BitVec 32)) SeekEntryResult!2617)

(assert (=> b!309637 (= res!166253 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2617 i!1240)))))

(declare-fun b!309638 () Bool)

(declare-fun res!166252 () Bool)

(assert (=> b!309638 (=> (not res!166252) (not e!193400))))

(assert (=> b!309638 (= res!166252 (and (= (size!7829 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7829 a!3293))))))

(declare-fun b!309639 () Bool)

(declare-fun e!193402 () Bool)

(declare-fun lt!151641 () (_ BitVec 32))

(assert (=> b!309639 (= e!193402 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!151641 #b00000000000000000000000000000000) (bvslt lt!151641 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(declare-fun lt!151639 () SeekEntryResult!2617)

(assert (=> b!309639 (= lt!151639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151641 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309639 (= lt!151641 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309640 () Bool)

(assert (=> b!309640 (= e!193399 e!193402)))

(declare-fun res!166248 () Bool)

(assert (=> b!309640 (=> (not res!166248) (not e!193402))))

(assert (=> b!309640 (= res!166248 (and (= lt!151639 lt!151640) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7477 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309640 (= lt!151639 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309641 () Bool)

(declare-fun res!166251 () Bool)

(assert (=> b!309641 (=> (not res!166251) (not e!193400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309641 (= res!166251 (validKeyInArray!0 k!2441))))

(assert (= (and start!30834 res!166249) b!309638))

(assert (= (and b!309638 res!166252) b!309641))

(assert (= (and b!309641 res!166251) b!309636))

(assert (= (and b!309636 res!166247) b!309637))

(assert (= (and b!309637 res!166253) b!309634))

(assert (= (and b!309634 res!166246) b!309635))

(assert (= (and b!309635 res!166250) b!309633))

(assert (= (and b!309633 res!166254) b!309640))

(assert (= (and b!309640 res!166248) b!309639))

(declare-fun m!319629 () Bool)

(assert (=> b!309637 m!319629))

(declare-fun m!319631 () Bool)

(assert (=> start!30834 m!319631))

(declare-fun m!319633 () Bool)

(assert (=> start!30834 m!319633))

(declare-fun m!319635 () Bool)

(assert (=> b!309636 m!319635))

(declare-fun m!319637 () Bool)

(assert (=> b!309634 m!319637))

(declare-fun m!319639 () Bool)

(assert (=> b!309639 m!319639))

(declare-fun m!319641 () Bool)

(assert (=> b!309639 m!319641))

(declare-fun m!319643 () Bool)

(assert (=> b!309641 m!319643))

(declare-fun m!319645 () Bool)

(assert (=> b!309633 m!319645))

(declare-fun m!319647 () Bool)

(assert (=> b!309635 m!319647))

(assert (=> b!309635 m!319647))

(declare-fun m!319649 () Bool)

(assert (=> b!309635 m!319649))

(declare-fun m!319651 () Bool)

(assert (=> b!309640 m!319651))

(declare-fun m!319653 () Bool)

(assert (=> b!309640 m!319653))

(push 1)

(assert (not start!30834))

(assert (not b!309639))

(assert (not b!309636))

(assert (not b!309641))

(assert (not b!309640))

(assert (not b!309637))

(assert (not b!309634))

(assert (not b!309635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!309702 () Bool)

(declare-fun e!193439 () SeekEntryResult!2617)

(assert (=> b!309702 (= e!193439 Undefined!2617)))

(declare-fun b!309703 () Bool)

(declare-fun e!193440 () SeekEntryResult!2617)

(declare-fun lt!151666 () SeekEntryResult!2617)

(assert (=> b!309703 (= e!193440 (MissingZero!2617 (index!12646 lt!151666)))))

(declare-fun b!309704 () Bool)

(declare-fun c!49322 () Bool)

(declare-fun lt!151667 () (_ BitVec 64))

(assert (=> b!309704 (= c!49322 (= lt!151667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!193441 () SeekEntryResult!2617)

(assert (=> b!309704 (= e!193441 e!193440)))

(declare-fun d!68359 () Bool)

(declare-fun lt!151668 () SeekEntryResult!2617)

(assert (=> d!68359 (and (or (is-Undefined!2617 lt!151668) (not (is-Found!2617 lt!151668)) (and (bvsge (index!12645 lt!151668) #b00000000000000000000000000000000) (bvslt (index!12645 lt!151668) (size!7829 a!3293)))) (or (is-Undefined!2617 lt!151668) (is-Found!2617 lt!151668) (not (is-MissingZero!2617 lt!151668)) (and (bvsge (index!12644 lt!151668) #b00000000000000000000000000000000) (bvslt (index!12644 lt!151668) (size!7829 a!3293)))) (or (is-Undefined!2617 lt!151668) (is-Found!2617 lt!151668) (is-MissingZero!2617 lt!151668) (not (is-MissingVacant!2617 lt!151668)) (and (bvsge (index!12647 lt!151668) #b00000000000000000000000000000000) (bvslt (index!12647 lt!151668) (size!7829 a!3293)))) (or (is-Undefined!2617 lt!151668) (ite (is-Found!2617 lt!151668) (= (select (arr!7477 a!3293) (index!12645 lt!151668)) k!2441) (ite (is-MissingZero!2617 lt!151668) (= (select (arr!7477 a!3293) (index!12644 lt!151668)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2617 lt!151668) (= (select (arr!7477 a!3293) (index!12647 lt!151668)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68359 (= lt!151668 e!193439)))

(declare-fun c!49321 () Bool)

(assert (=> d!68359 (= c!49321 (and (is-Intermediate!2617 lt!151666) (undefined!3429 lt!151666)))))

(assert (=> d!68359 (= lt!151666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68359 (validMask!0 mask!3709)))

(assert (=> d!68359 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!151668)))

(declare-fun b!309705 () Bool)

(assert (=> b!309705 (= e!193439 e!193441)))

(assert (=> b!309705 (= lt!151667 (select (arr!7477 a!3293) (index!12646 lt!151666)))))

(declare-fun c!49323 () Bool)

(assert (=> b!309705 (= c!49323 (= lt!151667 k!2441))))

(declare-fun b!309706 () Bool)

(assert (=> b!309706 (= e!193441 (Found!2617 (index!12646 lt!151666)))))

(declare-fun b!309707 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15787 (_ BitVec 32)) SeekEntryResult!2617)

(assert (=> b!309707 (= e!193440 (seekKeyOrZeroReturnVacant!0 (x!30869 lt!151666) (index!12646 lt!151666) (index!12646 lt!151666) k!2441 a!3293 mask!3709))))

(assert (= (and d!68359 c!49321) b!309702))

(assert (= (and d!68359 (not c!49321)) b!309705))

(assert (= (and b!309705 c!49323) b!309706))

(assert (= (and b!309705 (not c!49323)) b!309704))

(assert (= (and b!309704 c!49322) b!309703))

(assert (= (and b!309704 (not c!49322)) b!309707))

(declare-fun m!319683 () Bool)

(assert (=> d!68359 m!319683))

(assert (=> d!68359 m!319647))

(assert (=> d!68359 m!319649))

(declare-fun m!319685 () Bool)

(assert (=> d!68359 m!319685))

(assert (=> d!68359 m!319631))

(declare-fun m!319687 () Bool)

(assert (=> d!68359 m!319687))

(assert (=> d!68359 m!319647))

(declare-fun m!319689 () Bool)

(assert (=> b!309705 m!319689))

(declare-fun m!319691 () Bool)

(assert (=> b!309707 m!319691))

(assert (=> b!309637 d!68359))

(declare-fun d!68367 () Bool)

(declare-fun res!166271 () Bool)

(declare-fun e!193446 () Bool)

(assert (=> d!68367 (=> res!166271 e!193446)))

(assert (=> d!68367 (= res!166271 (= (select (arr!7477 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68367 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!193446)))

(declare-fun b!309712 () Bool)

(declare-fun e!193447 () Bool)

(assert (=> b!309712 (= e!193446 e!193447)))

(declare-fun res!166272 () Bool)

(assert (=> b!309712 (=> (not res!166272) (not e!193447))))

(assert (=> b!309712 (= res!166272 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7829 a!3293)))))

(declare-fun b!309713 () Bool)

(assert (=> b!309713 (= e!193447 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68367 (not res!166271)) b!309712))

(assert (= (and b!309712 res!166272) b!309713))

(declare-fun m!319693 () Bool)

(assert (=> d!68367 m!319693))

(declare-fun m!319695 () Bool)

(assert (=> b!309713 m!319695))

(assert (=> b!309636 d!68367))

(declare-fun d!68369 () Bool)

(assert (=> d!68369 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!309641 d!68369))

(declare-fun d!68371 () Bool)

(assert (=> d!68371 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30834 d!68371))

(declare-fun d!68373 () Bool)

(assert (=> d!68373 (= (array_inv!5440 a!3293) (bvsge (size!7829 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30834 d!68373))

(declare-fun b!309822 () Bool)

(declare-fun e!193517 () SeekEntryResult!2617)

(assert (=> b!309822 (= e!193517 (Intermediate!2617 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309823 () Bool)

(declare-fun lt!151716 () SeekEntryResult!2617)

(assert (=> b!309823 (and (bvsge (index!12646 lt!151716) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151716) (size!7829 a!3293)))))

(declare-fun res!166314 () Bool)

(assert (=> b!309823 (= res!166314 (= (select (arr!7477 a!3293) (index!12646 lt!151716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!193513 () Bool)

(assert (=> b!309823 (=> res!166314 e!193513)))

(declare-fun b!309824 () Bool)

(declare-fun e!193514 () SeekEntryResult!2617)

(assert (=> b!309824 (= e!193514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309825 () Bool)

(assert (=> b!309825 (= e!193514 (Intermediate!2617 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309826 () Bool)

(assert (=> b!309826 (= e!193517 e!193514)))

(declare-fun c!49359 () Bool)

(declare-fun lt!151717 () (_ BitVec 64))

(assert (=> b!309826 (= c!49359 (or (= lt!151717 k!2441) (= (bvadd lt!151717 lt!151717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309828 () Bool)

(assert (=> b!309828 (and (bvsge (index!12646 lt!151716) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151716) (size!7829 a!3293)))))

(declare-fun res!166316 () Bool)

(assert (=> b!309828 (= res!166316 (= (select (arr!7477 a!3293) (index!12646 lt!151716)) k!2441))))

(assert (=> b!309828 (=> res!166316 e!193513)))

(declare-fun e!193515 () Bool)

(assert (=> b!309828 (= e!193515 e!193513)))

(declare-fun d!68377 () Bool)

(declare-fun e!193516 () Bool)

(assert (=> d!68377 e!193516))

(declare-fun c!49360 () Bool)

(assert (=> d!68377 (= c!49360 (and (is-Intermediate!2617 lt!151716) (undefined!3429 lt!151716)))))

(assert (=> d!68377 (= lt!151716 e!193517)))

(declare-fun c!49361 () Bool)

(assert (=> d!68377 (= c!49361 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68377 (= lt!151717 (select (arr!7477 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68377 (validMask!0 mask!3709)))

(assert (=> d!68377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151716)))

(declare-fun b!309830 () Bool)

(assert (=> b!309830 (= e!193516 (bvsge (x!30869 lt!151716) #b01111111111111111111111111111110))))

(declare-fun b!309831 () Bool)

(assert (=> b!309831 (= e!193516 e!193515)))

(declare-fun res!166315 () Bool)

(assert (=> b!309831 (= res!166315 (and (is-Intermediate!2617 lt!151716) (not (undefined!3429 lt!151716)) (bvslt (x!30869 lt!151716) #b01111111111111111111111111111110) (bvsge (x!30869 lt!151716) #b00000000000000000000000000000000) (bvsge (x!30869 lt!151716) #b00000000000000000000000000000000)))))

(assert (=> b!309831 (=> (not res!166315) (not e!193515))))

(declare-fun b!309832 () Bool)

(assert (=> b!309832 (and (bvsge (index!12646 lt!151716) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151716) (size!7829 a!3293)))))

(assert (=> b!309832 (= e!193513 (= (select (arr!7477 a!3293) (index!12646 lt!151716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68377 c!49361) b!309822))

(assert (= (and d!68377 (not c!49361)) b!309826))

(assert (= (and b!309826 c!49359) b!309825))

(assert (= (and b!309826 (not c!49359)) b!309824))

(assert (= (and d!68377 c!49360) b!309830))

(assert (= (and d!68377 (not c!49360)) b!309831))

(assert (= (and b!309831 res!166315) b!309828))

(assert (= (and b!309828 (not res!166316)) b!309823))

(assert (= (and b!309823 (not res!166314)) b!309832))

(declare-fun m!319739 () Bool)

(assert (=> b!309828 m!319739))

(assert (=> b!309832 m!319739))

(assert (=> d!68377 m!319647))

(declare-fun m!319741 () Bool)

(assert (=> d!68377 m!319741))

(assert (=> d!68377 m!319631))

(assert (=> b!309823 m!319739))

(assert (=> b!309824 m!319647))

(declare-fun m!319743 () Bool)

(assert (=> b!309824 m!319743))

(assert (=> b!309824 m!319743))

(declare-fun m!319745 () Bool)

(assert (=> b!309824 m!319745))

(assert (=> b!309635 d!68377))

(declare-fun d!68395 () Bool)

(declare-fun lt!151728 () (_ BitVec 32))

(declare-fun lt!151727 () (_ BitVec 32))

(assert (=> d!68395 (= lt!151728 (bvmul (bvxor lt!151727 (bvlshr lt!151727 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68395 (= lt!151727 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68395 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!166317 (let ((h!5344 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30876 (bvmul (bvxor h!5344 (bvlshr h!5344 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30876 (bvlshr x!30876 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!166317 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!166317 #b00000000000000000000000000000000))))))

(assert (=> d!68395 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!151728 (bvlshr lt!151728 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!309635 d!68395))

(declare-fun b!309846 () Bool)

(declare-fun e!193530 () SeekEntryResult!2617)

(assert (=> b!309846 (= e!193530 (Intermediate!2617 true index!1781 x!1427))))

(declare-fun b!309847 () Bool)

(declare-fun lt!151729 () SeekEntryResult!2617)

(assert (=> b!309847 (and (bvsge (index!12646 lt!151729) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151729) (size!7829 a!3293)))))

(declare-fun res!166324 () Bool)

(assert (=> b!309847 (= res!166324 (= (select (arr!7477 a!3293) (index!12646 lt!151729)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!193526 () Bool)

(assert (=> b!309847 (=> res!166324 e!193526)))

(declare-fun b!309848 () Bool)

(declare-fun e!193527 () SeekEntryResult!2617)

(assert (=> b!309848 (= e!193527 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309849 () Bool)

(assert (=> b!309849 (= e!193527 (Intermediate!2617 false index!1781 x!1427))))

(declare-fun b!309850 () Bool)

(assert (=> b!309850 (= e!193530 e!193527)))

(declare-fun c!49366 () Bool)

(declare-fun lt!151730 () (_ BitVec 64))

(assert (=> b!309850 (= c!49366 (or (= lt!151730 k!2441) (= (bvadd lt!151730 lt!151730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309851 () Bool)

(assert (=> b!309851 (and (bvsge (index!12646 lt!151729) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151729) (size!7829 a!3293)))))

(declare-fun res!166326 () Bool)

(assert (=> b!309851 (= res!166326 (= (select (arr!7477 a!3293) (index!12646 lt!151729)) k!2441))))

(assert (=> b!309851 (=> res!166326 e!193526)))

(declare-fun e!193528 () Bool)

(assert (=> b!309851 (= e!193528 e!193526)))

(declare-fun d!68401 () Bool)

(declare-fun e!193529 () Bool)

(assert (=> d!68401 e!193529))

(declare-fun c!49367 () Bool)

(assert (=> d!68401 (= c!49367 (and (is-Intermediate!2617 lt!151729) (undefined!3429 lt!151729)))))

(assert (=> d!68401 (= lt!151729 e!193530)))

(declare-fun c!49368 () Bool)

(assert (=> d!68401 (= c!49368 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68401 (= lt!151730 (select (arr!7477 a!3293) index!1781))))

(assert (=> d!68401 (validMask!0 mask!3709)))

(assert (=> d!68401 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151729)))

(declare-fun b!309852 () Bool)

(assert (=> b!309852 (= e!193529 (bvsge (x!30869 lt!151729) #b01111111111111111111111111111110))))

(declare-fun b!309853 () Bool)

(assert (=> b!309853 (= e!193529 e!193528)))

(declare-fun res!166325 () Bool)

(assert (=> b!309853 (= res!166325 (and (is-Intermediate!2617 lt!151729) (not (undefined!3429 lt!151729)) (bvslt (x!30869 lt!151729) #b01111111111111111111111111111110) (bvsge (x!30869 lt!151729) #b00000000000000000000000000000000) (bvsge (x!30869 lt!151729) x!1427)))))

(assert (=> b!309853 (=> (not res!166325) (not e!193528))))

(declare-fun b!309854 () Bool)

(assert (=> b!309854 (and (bvsge (index!12646 lt!151729) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151729) (size!7829 a!3293)))))

(assert (=> b!309854 (= e!193526 (= (select (arr!7477 a!3293) (index!12646 lt!151729)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68401 c!49368) b!309846))

(assert (= (and d!68401 (not c!49368)) b!309850))

(assert (= (and b!309850 c!49366) b!309849))

(assert (= (and b!309850 (not c!49366)) b!309848))

(assert (= (and d!68401 c!49367) b!309852))

(assert (= (and d!68401 (not c!49367)) b!309853))

(assert (= (and b!309853 res!166325) b!309851))

(assert (= (and b!309851 (not res!166326)) b!309847))

(assert (= (and b!309847 (not res!166324)) b!309854))

(declare-fun m!319765 () Bool)

(assert (=> b!309851 m!319765))

(assert (=> b!309854 m!319765))

(assert (=> d!68401 m!319651))

(assert (=> d!68401 m!319631))

(assert (=> b!309847 m!319765))

(assert (=> b!309848 m!319641))

(assert (=> b!309848 m!319641))

(declare-fun m!319767 () Bool)

(assert (=> b!309848 m!319767))

(assert (=> b!309640 d!68401))

(declare-fun b!309873 () Bool)

(declare-fun e!193544 () Bool)

(declare-fun e!193543 () Bool)

(assert (=> b!309873 (= e!193544 e!193543)))

(declare-fun lt!151745 () (_ BitVec 64))

(assert (=> b!309873 (= lt!151745 (select (arr!7477 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9591 0))(
  ( (Unit!9592) )
))
(declare-fun lt!151747 () Unit!9591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15787 (_ BitVec 64) (_ BitVec 32)) Unit!9591)

(assert (=> b!309873 (= lt!151747 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151745 #b00000000000000000000000000000000))))

(assert (=> b!309873 (arrayContainsKey!0 a!3293 lt!151745 #b00000000000000000000000000000000)))

(declare-fun lt!151746 () Unit!9591)

(assert (=> b!309873 (= lt!151746 lt!151747)))

(declare-fun res!166334 () Bool)

(assert (=> b!309873 (= res!166334 (= (seekEntryOrOpen!0 (select (arr!7477 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2617 #b00000000000000000000000000000000)))))

(assert (=> b!309873 (=> (not res!166334) (not e!193543))))

(declare-fun b!309874 () Bool)

(declare-fun e!193542 () Bool)

(assert (=> b!309874 (= e!193542 e!193544)))

(declare-fun c!49374 () Bool)

(assert (=> b!309874 (= c!49374 (validKeyInArray!0 (select (arr!7477 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!309872 () Bool)

(declare-fun call!25927 () Bool)

(assert (=> b!309872 (= e!193544 call!25927)))

(declare-fun d!68403 () Bool)

(declare-fun res!166335 () Bool)

(assert (=> d!68403 (=> res!166335 e!193542)))

(assert (=> d!68403 (= res!166335 (bvsge #b00000000000000000000000000000000 (size!7829 a!3293)))))

(assert (=> d!68403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!193542)))

(declare-fun bm!25924 () Bool)

(assert (=> bm!25924 (= call!25927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!309875 () Bool)

(assert (=> b!309875 (= e!193543 call!25927)))

(assert (= (and d!68403 (not res!166335)) b!309874))

(assert (= (and b!309874 c!49374) b!309873))

(assert (= (and b!309874 (not c!49374)) b!309872))

(assert (= (and b!309873 res!166334) b!309875))

(assert (= (or b!309875 b!309872) bm!25924))

(assert (=> b!309873 m!319693))

(declare-fun m!319773 () Bool)

(assert (=> b!309873 m!319773))

(declare-fun m!319775 () Bool)

(assert (=> b!309873 m!319775))

(assert (=> b!309873 m!319693))

(declare-fun m!319777 () Bool)

(assert (=> b!309873 m!319777))

(assert (=> b!309874 m!319693))

(assert (=> b!309874 m!319693))

(declare-fun m!319779 () Bool)

(assert (=> b!309874 m!319779))

(declare-fun m!319781 () Bool)

(assert (=> bm!25924 m!319781))

(assert (=> b!309634 d!68403))

(declare-fun b!309876 () Bool)

(declare-fun e!193549 () SeekEntryResult!2617)

(assert (=> b!309876 (= e!193549 (Intermediate!2617 true lt!151641 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309877 () Bool)

(declare-fun lt!151748 () SeekEntryResult!2617)

(assert (=> b!309877 (and (bvsge (index!12646 lt!151748) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151748) (size!7829 a!3293)))))

(declare-fun res!166336 () Bool)

(assert (=> b!309877 (= res!166336 (= (select (arr!7477 a!3293) (index!12646 lt!151748)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!193545 () Bool)

(assert (=> b!309877 (=> res!166336 e!193545)))

(declare-fun b!309878 () Bool)

(declare-fun e!193546 () SeekEntryResult!2617)

(assert (=> b!309878 (= e!193546 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!151641 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309879 () Bool)

(assert (=> b!309879 (= e!193546 (Intermediate!2617 false lt!151641 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309880 () Bool)

(assert (=> b!309880 (= e!193549 e!193546)))

(declare-fun c!49375 () Bool)

(declare-fun lt!151749 () (_ BitVec 64))

(assert (=> b!309880 (= c!49375 (or (= lt!151749 k!2441) (= (bvadd lt!151749 lt!151749) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309881 () Bool)

(assert (=> b!309881 (and (bvsge (index!12646 lt!151748) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151748) (size!7829 a!3293)))))

(declare-fun res!166338 () Bool)

(assert (=> b!309881 (= res!166338 (= (select (arr!7477 a!3293) (index!12646 lt!151748)) k!2441))))

(assert (=> b!309881 (=> res!166338 e!193545)))

(declare-fun e!193547 () Bool)

(assert (=> b!309881 (= e!193547 e!193545)))

(declare-fun d!68407 () Bool)

(declare-fun e!193548 () Bool)

(assert (=> d!68407 e!193548))

(declare-fun c!49376 () Bool)

(assert (=> d!68407 (= c!49376 (and (is-Intermediate!2617 lt!151748) (undefined!3429 lt!151748)))))

(assert (=> d!68407 (= lt!151748 e!193549)))

(declare-fun c!49377 () Bool)

(assert (=> d!68407 (= c!49377 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68407 (= lt!151749 (select (arr!7477 a!3293) lt!151641))))

(assert (=> d!68407 (validMask!0 mask!3709)))

(assert (=> d!68407 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151641 k!2441 a!3293 mask!3709) lt!151748)))

(declare-fun b!309882 () Bool)

(assert (=> b!309882 (= e!193548 (bvsge (x!30869 lt!151748) #b01111111111111111111111111111110))))

(declare-fun b!309883 () Bool)

(assert (=> b!309883 (= e!193548 e!193547)))

(declare-fun res!166337 () Bool)

(assert (=> b!309883 (= res!166337 (and (is-Intermediate!2617 lt!151748) (not (undefined!3429 lt!151748)) (bvslt (x!30869 lt!151748) #b01111111111111111111111111111110) (bvsge (x!30869 lt!151748) #b00000000000000000000000000000000) (bvsge (x!30869 lt!151748) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!309883 (=> (not res!166337) (not e!193547))))

(declare-fun b!309884 () Bool)

(assert (=> b!309884 (and (bvsge (index!12646 lt!151748) #b00000000000000000000000000000000) (bvslt (index!12646 lt!151748) (size!7829 a!3293)))))

(assert (=> b!309884 (= e!193545 (= (select (arr!7477 a!3293) (index!12646 lt!151748)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68407 c!49377) b!309876))

(assert (= (and d!68407 (not c!49377)) b!309880))

(assert (= (and b!309880 c!49375) b!309879))

(assert (= (and b!309880 (not c!49375)) b!309878))

(assert (= (and d!68407 c!49376) b!309882))

(assert (= (and d!68407 (not c!49376)) b!309883))

(assert (= (and b!309883 res!166337) b!309881))

(assert (= (and b!309881 (not res!166338)) b!309877))

(assert (= (and b!309877 (not res!166336)) b!309884))

(declare-fun m!319783 () Bool)

(assert (=> b!309881 m!319783))

(assert (=> b!309884 m!319783))

(declare-fun m!319785 () Bool)

(assert (=> d!68407 m!319785))

(assert (=> d!68407 m!319631))

(assert (=> b!309877 m!319783))

(declare-fun m!319787 () Bool)

(assert (=> b!309878 m!319787))

(assert (=> b!309878 m!319787))

(declare-fun m!319789 () Bool)

(assert (=> b!309878 m!319789))

