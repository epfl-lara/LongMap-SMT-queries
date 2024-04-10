; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29582 () Bool)

(assert start!29582)

(declare-fun b!298713 () Bool)

(declare-fun e!188702 () Bool)

(declare-fun e!188703 () Bool)

(assert (=> b!298713 (= e!188702 e!188703)))

(declare-fun res!157551 () Bool)

(assert (=> b!298713 (=> (not res!157551) (not e!188703))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148526 () Bool)

(declare-datatypes ((SeekEntryResult!2305 0))(
  ( (MissingZero!2305 (index!11393 (_ BitVec 32))) (Found!2305 (index!11394 (_ BitVec 32))) (Intermediate!2305 (undefined!3117 Bool) (index!11395 (_ BitVec 32)) (x!29620 (_ BitVec 32))) (Undefined!2305) (MissingVacant!2305 (index!11396 (_ BitVec 32))) )
))
(declare-fun lt!148528 () SeekEntryResult!2305)

(assert (=> b!298713 (= res!157551 (or lt!148526 (= lt!148528 (MissingVacant!2305 i!1256))))))

(assert (=> b!298713 (= lt!148526 (= lt!148528 (MissingZero!2305 i!1256)))))

(declare-datatypes ((array!15109 0))(
  ( (array!15110 (arr!7156 (Array (_ BitVec 32) (_ BitVec 64))) (size!7508 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15109)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15109 (_ BitVec 32)) SeekEntryResult!2305)

(assert (=> b!298713 (= lt!148528 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298714 () Bool)

(declare-fun res!157552 () Bool)

(assert (=> b!298714 (=> (not res!157552) (not e!188702))))

(declare-fun arrayContainsKey!0 (array!15109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298714 (= res!157552 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298715 () Bool)

(declare-fun res!157550 () Bool)

(assert (=> b!298715 (=> (not res!157550) (not e!188703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15109 (_ BitVec 32)) Bool)

(assert (=> b!298715 (= res!157550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298716 () Bool)

(declare-fun res!157554 () Bool)

(assert (=> b!298716 (=> (not res!157554) (not e!188702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298716 (= res!157554 (validKeyInArray!0 k!2524))))

(declare-fun lt!148529 () SeekEntryResult!2305)

(declare-fun b!298717 () Bool)

(assert (=> b!298717 (= e!188703 (and (not lt!148526) (= lt!148528 (MissingVacant!2305 i!1256)) (let ((bdg!6425 (not (is-Intermediate!2305 lt!148529)))) (and (or bdg!6425 (not (undefined!3117 lt!148529))) (not bdg!6425) (= (select (arr!7156 a!3312) (index!11395 lt!148529)) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (index!11395 lt!148529) i!1256))))))))

(declare-fun lt!148527 () (_ BitVec 32))

(declare-fun lt!148530 () SeekEntryResult!2305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15109 (_ BitVec 32)) SeekEntryResult!2305)

(assert (=> b!298717 (= lt!148530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148527 k!2524 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)) mask!3809))))

(assert (=> b!298717 (= lt!148529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148527 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298717 (= lt!148527 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!157553 () Bool)

(assert (=> start!29582 (=> (not res!157553) (not e!188702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29582 (= res!157553 (validMask!0 mask!3809))))

(assert (=> start!29582 e!188702))

(assert (=> start!29582 true))

(declare-fun array_inv!5119 (array!15109) Bool)

(assert (=> start!29582 (array_inv!5119 a!3312)))

(declare-fun b!298718 () Bool)

(declare-fun res!157549 () Bool)

(assert (=> b!298718 (=> (not res!157549) (not e!188702))))

(assert (=> b!298718 (= res!157549 (and (= (size!7508 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7508 a!3312))))))

(assert (= (and start!29582 res!157553) b!298718))

(assert (= (and b!298718 res!157549) b!298716))

(assert (= (and b!298716 res!157554) b!298714))

(assert (= (and b!298714 res!157552) b!298713))

(assert (= (and b!298713 res!157551) b!298715))

(assert (= (and b!298715 res!157550) b!298717))

(declare-fun m!311153 () Bool)

(assert (=> b!298716 m!311153))

(declare-fun m!311155 () Bool)

(assert (=> b!298717 m!311155))

(declare-fun m!311157 () Bool)

(assert (=> b!298717 m!311157))

(declare-fun m!311159 () Bool)

(assert (=> b!298717 m!311159))

(declare-fun m!311161 () Bool)

(assert (=> b!298717 m!311161))

(declare-fun m!311163 () Bool)

(assert (=> b!298717 m!311163))

(declare-fun m!311165 () Bool)

(assert (=> b!298714 m!311165))

(declare-fun m!311167 () Bool)

(assert (=> start!29582 m!311167))

(declare-fun m!311169 () Bool)

(assert (=> start!29582 m!311169))

(declare-fun m!311171 () Bool)

(assert (=> b!298715 m!311171))

(declare-fun m!311173 () Bool)

(assert (=> b!298713 m!311173))

(push 1)

(assert (not b!298715))

(assert (not b!298714))

(assert (not start!29582))

(assert (not b!298716))

(assert (not b!298713))

(assert (not b!298717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67409 () Bool)

(assert (=> d!67409 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298716 d!67409))

(declare-fun d!67411 () Bool)

(assert (=> d!67411 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29582 d!67411))

(declare-fun d!67415 () Bool)

(assert (=> d!67415 (= (array_inv!5119 a!3312) (bvsge (size!7508 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29582 d!67415))

(declare-fun d!67419 () Bool)

(declare-fun e!188759 () Bool)

(assert (=> d!67419 e!188759))

(declare-fun c!48201 () Bool)

(declare-fun lt!148564 () SeekEntryResult!2305)

(assert (=> d!67419 (= c!48201 (and (is-Intermediate!2305 lt!148564) (undefined!3117 lt!148564)))))

(declare-fun e!188762 () SeekEntryResult!2305)

(assert (=> d!67419 (= lt!148564 e!188762)))

(declare-fun c!48199 () Bool)

(assert (=> d!67419 (= c!48199 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148565 () (_ BitVec 64))

(assert (=> d!67419 (= lt!148565 (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) lt!148527))))

(assert (=> d!67419 (validMask!0 mask!3809)))

(assert (=> d!67419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148527 k!2524 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)) mask!3809) lt!148564)))

(declare-fun b!298812 () Bool)

(declare-fun e!188760 () SeekEntryResult!2305)

(assert (=> b!298812 (= e!188760 (Intermediate!2305 false lt!148527 #b00000000000000000000000000000000))))

(declare-fun b!298813 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298813 (= e!188760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)) mask!3809))))

(declare-fun b!298814 () Bool)

(assert (=> b!298814 (= e!188762 e!188760)))

(declare-fun c!48200 () Bool)

(assert (=> b!298814 (= c!48200 (or (= lt!148565 k!2524) (= (bvadd lt!148565 lt!148565) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298815 () Bool)

(assert (=> b!298815 (= e!188759 (bvsge (x!29620 lt!148564) #b01111111111111111111111111111110))))

(declare-fun b!298816 () Bool)

(assert (=> b!298816 (and (bvsge (index!11395 lt!148564) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148564) (size!7508 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)))))))

(declare-fun res!157590 () Bool)

(assert (=> b!298816 (= res!157590 (= (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) (index!11395 lt!148564)) k!2524))))

(declare-fun e!188761 () Bool)

(assert (=> b!298816 (=> res!157590 e!188761)))

(declare-fun e!188763 () Bool)

(assert (=> b!298816 (= e!188763 e!188761)))

(declare-fun b!298817 () Bool)

(assert (=> b!298817 (= e!188762 (Intermediate!2305 true lt!148527 #b00000000000000000000000000000000))))

(declare-fun b!298818 () Bool)

(assert (=> b!298818 (and (bvsge (index!11395 lt!148564) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148564) (size!7508 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)))))))

(assert (=> b!298818 (= e!188761 (= (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) (index!11395 lt!148564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298819 () Bool)

(assert (=> b!298819 (= e!188759 e!188763)))

(declare-fun res!157589 () Bool)

(assert (=> b!298819 (= res!157589 (and (is-Intermediate!2305 lt!148564) (not (undefined!3117 lt!148564)) (bvslt (x!29620 lt!148564) #b01111111111111111111111111111110) (bvsge (x!29620 lt!148564) #b00000000000000000000000000000000) (bvsge (x!29620 lt!148564) #b00000000000000000000000000000000)))))

(assert (=> b!298819 (=> (not res!157589) (not e!188763))))

(declare-fun b!298820 () Bool)

(assert (=> b!298820 (and (bvsge (index!11395 lt!148564) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148564) (size!7508 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)))))))

(declare-fun res!157591 () Bool)

(assert (=> b!298820 (= res!157591 (= (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) (index!11395 lt!148564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298820 (=> res!157591 e!188761)))

(assert (= (and d!67419 c!48199) b!298817))

(assert (= (and d!67419 (not c!48199)) b!298814))

(assert (= (and b!298814 c!48200) b!298812))

(assert (= (and b!298814 (not c!48200)) b!298813))

(assert (= (and d!67419 c!48201) b!298815))

(assert (= (and d!67419 (not c!48201)) b!298819))

(assert (= (and b!298819 res!157589) b!298816))

(assert (= (and b!298816 (not res!157590)) b!298820))

(assert (= (and b!298820 (not res!157591)) b!298818))

(declare-fun m!311209 () Bool)

(assert (=> b!298816 m!311209))

(declare-fun m!311211 () Bool)

(assert (=> d!67419 m!311211))

(assert (=> d!67419 m!311167))

(assert (=> b!298820 m!311209))

(declare-fun m!311213 () Bool)

(assert (=> b!298813 m!311213))

(assert (=> b!298813 m!311213))

(declare-fun m!311215 () Bool)

(assert (=> b!298813 m!311215))

(assert (=> b!298818 m!311209))

(assert (=> b!298717 d!67419))

(declare-fun d!67433 () Bool)

(declare-fun e!188773 () Bool)

(assert (=> d!67433 e!188773))

(declare-fun c!48207 () Bool)

(declare-fun lt!148568 () SeekEntryResult!2305)

(assert (=> d!67433 (= c!48207 (and (is-Intermediate!2305 lt!148568) (undefined!3117 lt!148568)))))

(declare-fun e!188776 () SeekEntryResult!2305)

(assert (=> d!67433 (= lt!148568 e!188776)))

(declare-fun c!48205 () Bool)

(assert (=> d!67433 (= c!48205 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148569 () (_ BitVec 64))

(assert (=> d!67433 (= lt!148569 (select (arr!7156 a!3312) lt!148527))))

(assert (=> d!67433 (validMask!0 mask!3809)))

(assert (=> d!67433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148527 k!2524 a!3312 mask!3809) lt!148568)))

(declare-fun b!298834 () Bool)

(declare-fun e!188774 () SeekEntryResult!2305)

(assert (=> b!298834 (= e!188774 (Intermediate!2305 false lt!148527 #b00000000000000000000000000000000))))

(declare-fun b!298835 () Bool)

(assert (=> b!298835 (= e!188774 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298836 () Bool)

(assert (=> b!298836 (= e!188776 e!188774)))

(declare-fun c!48206 () Bool)

(assert (=> b!298836 (= c!48206 (or (= lt!148569 k!2524) (= (bvadd lt!148569 lt!148569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298837 () Bool)

(assert (=> b!298837 (= e!188773 (bvsge (x!29620 lt!148568) #b01111111111111111111111111111110))))

(declare-fun b!298838 () Bool)

(assert (=> b!298838 (and (bvsge (index!11395 lt!148568) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148568) (size!7508 a!3312)))))

(declare-fun res!157600 () Bool)

(assert (=> b!298838 (= res!157600 (= (select (arr!7156 a!3312) (index!11395 lt!148568)) k!2524))))

(declare-fun e!188775 () Bool)

(assert (=> b!298838 (=> res!157600 e!188775)))

(declare-fun e!188777 () Bool)

(assert (=> b!298838 (= e!188777 e!188775)))

(declare-fun b!298839 () Bool)

(assert (=> b!298839 (= e!188776 (Intermediate!2305 true lt!148527 #b00000000000000000000000000000000))))

(declare-fun b!298840 () Bool)

(assert (=> b!298840 (and (bvsge (index!11395 lt!148568) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148568) (size!7508 a!3312)))))

(assert (=> b!298840 (= e!188775 (= (select (arr!7156 a!3312) (index!11395 lt!148568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298841 () Bool)

(assert (=> b!298841 (= e!188773 e!188777)))

(declare-fun res!157599 () Bool)

(assert (=> b!298841 (= res!157599 (and (is-Intermediate!2305 lt!148568) (not (undefined!3117 lt!148568)) (bvslt (x!29620 lt!148568) #b01111111111111111111111111111110) (bvsge (x!29620 lt!148568) #b00000000000000000000000000000000) (bvsge (x!29620 lt!148568) #b00000000000000000000000000000000)))))

(assert (=> b!298841 (=> (not res!157599) (not e!188777))))

(declare-fun b!298842 () Bool)

(assert (=> b!298842 (and (bvsge (index!11395 lt!148568) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148568) (size!7508 a!3312)))))

(declare-fun res!157601 () Bool)

(assert (=> b!298842 (= res!157601 (= (select (arr!7156 a!3312) (index!11395 lt!148568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298842 (=> res!157601 e!188775)))

(assert (= (and d!67433 c!48205) b!298839))

(assert (= (and d!67433 (not c!48205)) b!298836))

(assert (= (and b!298836 c!48206) b!298834))

(assert (= (and b!298836 (not c!48206)) b!298835))

(assert (= (and d!67433 c!48207) b!298837))

(assert (= (and d!67433 (not c!48207)) b!298841))

(assert (= (and b!298841 res!157599) b!298838))

(assert (= (and b!298838 (not res!157600)) b!298842))

(assert (= (and b!298842 (not res!157601)) b!298840))

(declare-fun m!311227 () Bool)

(assert (=> b!298838 m!311227))

(declare-fun m!311229 () Bool)

(assert (=> d!67433 m!311229))

(assert (=> d!67433 m!311167))

(assert (=> b!298842 m!311227))

(assert (=> b!298835 m!311213))

(assert (=> b!298835 m!311213))

(declare-fun m!311231 () Bool)

(assert (=> b!298835 m!311231))

(assert (=> b!298840 m!311227))

(assert (=> b!298717 d!67433))

(declare-fun d!67439 () Bool)

(declare-fun lt!148581 () (_ BitVec 32))

(declare-fun lt!148580 () (_ BitVec 32))

(assert (=> d!67439 (= lt!148581 (bvmul (bvxor lt!148580 (bvlshr lt!148580 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67439 (= lt!148580 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67439 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157605 (let ((h!5312 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29626 (bvmul (bvxor h!5312 (bvlshr h!5312 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29626 (bvlshr x!29626 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157605 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157605 #b00000000000000000000000000000000))))))

(assert (=> d!67439 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148581 (bvlshr lt!148581 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298717 d!67439))

(declare-fun b!298869 () Bool)

(declare-fun e!188795 () SeekEntryResult!2305)

(declare-fun lt!148597 () SeekEntryResult!2305)

(assert (=> b!298869 (= e!188795 (Found!2305 (index!11395 lt!148597)))))

(declare-fun d!67443 () Bool)

(declare-fun lt!148599 () SeekEntryResult!2305)

(assert (=> d!67443 (and (or (is-Undefined!2305 lt!148599) (not (is-Found!2305 lt!148599)) (and (bvsge (index!11394 lt!148599) #b00000000000000000000000000000000) (bvslt (index!11394 lt!148599) (size!7508 a!3312)))) (or (is-Undefined!2305 lt!148599) (is-Found!2305 lt!148599) (not (is-MissingZero!2305 lt!148599)) (and (bvsge (index!11393 lt!148599) #b00000000000000000000000000000000) (bvslt (index!11393 lt!148599) (size!7508 a!3312)))) (or (is-Undefined!2305 lt!148599) (is-Found!2305 lt!148599) (is-MissingZero!2305 lt!148599) (not (is-MissingVacant!2305 lt!148599)) (and (bvsge (index!11396 lt!148599) #b00000000000000000000000000000000) (bvslt (index!11396 lt!148599) (size!7508 a!3312)))) (or (is-Undefined!2305 lt!148599) (ite (is-Found!2305 lt!148599) (= (select (arr!7156 a!3312) (index!11394 lt!148599)) k!2524) (ite (is-MissingZero!2305 lt!148599) (= (select (arr!7156 a!3312) (index!11393 lt!148599)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2305 lt!148599) (= (select (arr!7156 a!3312) (index!11396 lt!148599)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188797 () SeekEntryResult!2305)

(assert (=> d!67443 (= lt!148599 e!188797)))

(declare-fun c!48217 () Bool)

(assert (=> d!67443 (= c!48217 (and (is-Intermediate!2305 lt!148597) (undefined!3117 lt!148597)))))

(assert (=> d!67443 (= lt!148597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67443 (validMask!0 mask!3809)))

(assert (=> d!67443 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148599)))

(declare-fun b!298870 () Bool)

(assert (=> b!298870 (= e!188797 Undefined!2305)))

(declare-fun b!298871 () Bool)

(declare-fun e!188796 () SeekEntryResult!2305)

(assert (=> b!298871 (= e!188796 (MissingZero!2305 (index!11395 lt!148597)))))

(declare-fun b!298872 () Bool)

(declare-fun c!48218 () Bool)

(declare-fun lt!148598 () (_ BitVec 64))

(assert (=> b!298872 (= c!48218 (= lt!148598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298872 (= e!188795 e!188796)))

(declare-fun b!298873 () Bool)

(assert (=> b!298873 (= e!188797 e!188795)))

(assert (=> b!298873 (= lt!148598 (select (arr!7156 a!3312) (index!11395 lt!148597)))))

(declare-fun c!48219 () Bool)

(assert (=> b!298873 (= c!48219 (= lt!148598 k!2524))))

(declare-fun b!298874 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15109 (_ BitVec 32)) SeekEntryResult!2305)

(assert (=> b!298874 (= e!188796 (seekKeyOrZeroReturnVacant!0 (x!29620 lt!148597) (index!11395 lt!148597) (index!11395 lt!148597) k!2524 a!3312 mask!3809))))

(assert (= (and d!67443 c!48217) b!298870))

(assert (= (and d!67443 (not c!48217)) b!298873))

(assert (= (and b!298873 c!48219) b!298869))

(assert (= (and b!298873 (not c!48219)) b!298872))

(assert (= (and b!298872 c!48218) b!298871))

(assert (= (and b!298872 (not c!48218)) b!298874))

(assert (=> d!67443 m!311163))

(assert (=> d!67443 m!311163))

(declare-fun m!311243 () Bool)

(assert (=> d!67443 m!311243))

(declare-fun m!311245 () Bool)

(assert (=> d!67443 m!311245))

(declare-fun m!311247 () Bool)

(assert (=> d!67443 m!311247))

(assert (=> d!67443 m!311167))

(declare-fun m!311249 () Bool)

(assert (=> d!67443 m!311249))

(declare-fun m!311251 () Bool)

(assert (=> b!298873 m!311251))

(declare-fun m!311253 () Bool)

(assert (=> b!298874 m!311253))

(assert (=> b!298713 d!67443))

(declare-fun d!67453 () Bool)

(declare-fun res!157616 () Bool)

(declare-fun e!188808 () Bool)

(assert (=> d!67453 (=> res!157616 e!188808)))

(assert (=> d!67453 (= res!157616 (= (select (arr!7156 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67453 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!188808)))

(declare-fun b!298891 () Bool)

(declare-fun e!188809 () Bool)

(assert (=> b!298891 (= e!188808 e!188809)))

(declare-fun res!157617 () Bool)

(assert (=> b!298891 (=> (not res!157617) (not e!188809))))

(assert (=> b!298891 (= res!157617 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7508 a!3312)))))

(declare-fun b!298892 () Bool)

(assert (=> b!298892 (= e!188809 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67453 (not res!157616)) b!298891))

(assert (= (and b!298891 res!157617) b!298892))

(declare-fun m!311255 () Bool)

(assert (=> d!67453 m!311255))

(declare-fun m!311257 () Bool)

(assert (=> b!298892 m!311257))

(assert (=> b!298714 d!67453))

(declare-fun b!298929 () Bool)

(declare-fun e!188834 () Bool)

(declare-fun e!188832 () Bool)

(assert (=> b!298929 (= e!188834 e!188832)))

(declare-fun c!48240 () Bool)

(assert (=> b!298929 (= c!48240 (validKeyInArray!0 (select (arr!7156 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298930 () Bool)

(declare-fun e!188833 () Bool)

(declare-fun call!25798 () Bool)

(assert (=> b!298930 (= e!188833 call!25798)))

(declare-fun b!298931 () Bool)

(assert (=> b!298931 (= e!188832 e!188833)))

(declare-fun lt!148625 () (_ BitVec 64))

(assert (=> b!298931 (= lt!148625 (select (arr!7156 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9321 0))(
  ( (Unit!9322) )
))
(declare-fun lt!148626 () Unit!9321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15109 (_ BitVec 64) (_ BitVec 32)) Unit!9321)

(assert (=> b!298931 (= lt!148626 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148625 #b00000000000000000000000000000000))))

(assert (=> b!298931 (arrayContainsKey!0 a!3312 lt!148625 #b00000000000000000000000000000000)))

(declare-fun lt!148624 () Unit!9321)

(assert (=> b!298931 (= lt!148624 lt!148626)))

(declare-fun res!157626 () Bool)

(assert (=> b!298931 (= res!157626 (= (seekEntryOrOpen!0 (select (arr!7156 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2305 #b00000000000000000000000000000000)))))

(assert (=> b!298931 (=> (not res!157626) (not e!188833))))

(declare-fun b!298932 () Bool)

(assert (=> b!298932 (= e!188832 call!25798)))

(declare-fun d!67455 () Bool)

(declare-fun res!157627 () Bool)

(assert (=> d!67455 (=> res!157627 e!188834)))

(assert (=> d!67455 (= res!157627 (bvsge #b00000000000000000000000000000000 (size!7508 a!3312)))))

(assert (=> d!67455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188834)))

(declare-fun bm!25795 () Bool)

(assert (=> bm!25795 (= call!25798 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67455 (not res!157627)) b!298929))

(assert (= (and b!298929 c!48240) b!298931))

(assert (= (and b!298929 (not c!48240)) b!298932))

(assert (= (and b!298931 res!157626) b!298930))

(assert (= (or b!298930 b!298932) bm!25795))

(assert (=> b!298929 m!311255))

(assert (=> b!298929 m!311255))

(declare-fun m!311283 () Bool)

(assert (=> b!298929 m!311283))

(assert (=> b!298931 m!311255))

(declare-fun m!311285 () Bool)

(assert (=> b!298931 m!311285))

(declare-fun m!311287 () Bool)

(assert (=> b!298931 m!311287))

(assert (=> b!298931 m!311255))

(declare-fun m!311289 () Bool)

(assert (=> b!298931 m!311289))

(declare-fun m!311291 () Bool)

(assert (=> bm!25795 m!311291))

(assert (=> b!298715 d!67455))

(push 1)

(assert (not b!298931))

(assert (not b!298929))

(assert (not d!67419))

(assert (not b!298892))

(assert (not bm!25795))

(assert (not b!298874))

(assert (not d!67433))

(assert (not b!298813))

(assert (not d!67443))

(assert (not b!298835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67505 () Bool)

(declare-fun e!188905 () Bool)

(assert (=> d!67505 e!188905))

(declare-fun c!48287 () Bool)

(declare-fun lt!148675 () SeekEntryResult!2305)

(assert (=> d!67505 (= c!48287 (and (is-Intermediate!2305 lt!148675) (undefined!3117 lt!148675)))))

(declare-fun e!188908 () SeekEntryResult!2305)

(assert (=> d!67505 (= lt!148675 e!188908)))

(declare-fun c!48285 () Bool)

(assert (=> d!67505 (= c!48285 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!148676 () (_ BitVec 64))

(assert (=> d!67505 (= lt!148676 (select (arr!7156 a!3312) (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67505 (validMask!0 mask!3809)))

(assert (=> d!67505 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809) lt!148675)))

(declare-fun b!299053 () Bool)

(declare-fun e!188906 () SeekEntryResult!2305)

(assert (=> b!299053 (= e!188906 (Intermediate!2305 false (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299054 () Bool)

(assert (=> b!299054 (= e!188906 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!299055 () Bool)

(assert (=> b!299055 (= e!188908 e!188906)))

(declare-fun c!48286 () Bool)

(assert (=> b!299055 (= c!48286 (or (= lt!148676 k!2524) (= (bvadd lt!148676 lt!148676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299056 () Bool)

(assert (=> b!299056 (= e!188905 (bvsge (x!29620 lt!148675) #b01111111111111111111111111111110))))

(declare-fun b!299057 () Bool)

(assert (=> b!299057 (and (bvsge (index!11395 lt!148675) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148675) (size!7508 a!3312)))))

(declare-fun res!157661 () Bool)

(assert (=> b!299057 (= res!157661 (= (select (arr!7156 a!3312) (index!11395 lt!148675)) k!2524))))

(declare-fun e!188907 () Bool)

(assert (=> b!299057 (=> res!157661 e!188907)))

(declare-fun e!188909 () Bool)

(assert (=> b!299057 (= e!188909 e!188907)))

(declare-fun b!299058 () Bool)

(assert (=> b!299058 (= e!188908 (Intermediate!2305 true (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299059 () Bool)

(assert (=> b!299059 (and (bvsge (index!11395 lt!148675) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148675) (size!7508 a!3312)))))

(assert (=> b!299059 (= e!188907 (= (select (arr!7156 a!3312) (index!11395 lt!148675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299060 () Bool)

(assert (=> b!299060 (= e!188905 e!188909)))

(declare-fun res!157660 () Bool)

(assert (=> b!299060 (= res!157660 (and (is-Intermediate!2305 lt!148675) (not (undefined!3117 lt!148675)) (bvslt (x!29620 lt!148675) #b01111111111111111111111111111110) (bvsge (x!29620 lt!148675) #b00000000000000000000000000000000) (bvsge (x!29620 lt!148675) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299060 (=> (not res!157660) (not e!188909))))

(declare-fun b!299061 () Bool)

(assert (=> b!299061 (and (bvsge (index!11395 lt!148675) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148675) (size!7508 a!3312)))))

(declare-fun res!157662 () Bool)

(assert (=> b!299061 (= res!157662 (= (select (arr!7156 a!3312) (index!11395 lt!148675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299061 (=> res!157662 e!188907)))

(assert (= (and d!67505 c!48285) b!299058))

(assert (= (and d!67505 (not c!48285)) b!299055))

(assert (= (and b!299055 c!48286) b!299053))

(assert (= (and b!299055 (not c!48286)) b!299054))

(assert (= (and d!67505 c!48287) b!299056))

(assert (= (and d!67505 (not c!48287)) b!299060))

(assert (= (and b!299060 res!157660) b!299057))

(assert (= (and b!299057 (not res!157661)) b!299061))

(assert (= (and b!299061 (not res!157662)) b!299059))

(declare-fun m!311423 () Bool)

(assert (=> b!299057 m!311423))

(assert (=> d!67505 m!311213))

(declare-fun m!311425 () Bool)

(assert (=> d!67505 m!311425))

(assert (=> d!67505 m!311167))

(assert (=> b!299061 m!311423))

(assert (=> b!299054 m!311213))

(declare-fun m!311427 () Bool)

(assert (=> b!299054 m!311427))

(assert (=> b!299054 m!311427))

(declare-fun m!311429 () Bool)

(assert (=> b!299054 m!311429))

(assert (=> b!299059 m!311423))

(assert (=> b!298835 d!67505))

(declare-fun d!67507 () Bool)

(declare-fun lt!148679 () (_ BitVec 32))

(assert (=> d!67507 (and (bvsge lt!148679 #b00000000000000000000000000000000) (bvslt lt!148679 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67507 (= lt!148679 (choose!52 lt!148527 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!67507 (validMask!0 mask!3809)))

(assert (=> d!67507 (= (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) lt!148679)))

(declare-fun bs!10548 () Bool)

(assert (= bs!10548 d!67507))

(declare-fun m!311431 () Bool)

(assert (=> bs!10548 m!311431))

(assert (=> bs!10548 m!311167))

(assert (=> b!298835 d!67507))

(declare-fun b!299062 () Bool)

(declare-fun e!188912 () Bool)

(declare-fun e!188910 () Bool)

(assert (=> b!299062 (= e!188912 e!188910)))

(declare-fun c!48288 () Bool)

(assert (=> b!299062 (= c!48288 (validKeyInArray!0 (select (arr!7156 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!299063 () Bool)

(declare-fun e!188911 () Bool)

(declare-fun call!25801 () Bool)

(assert (=> b!299063 (= e!188911 call!25801)))

(declare-fun b!299064 () Bool)

(assert (=> b!299064 (= e!188910 e!188911)))

(declare-fun lt!148681 () (_ BitVec 64))

(assert (=> b!299064 (= lt!148681 (select (arr!7156 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!148682 () Unit!9321)

(assert (=> b!299064 (= lt!148682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148681 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!299064 (arrayContainsKey!0 a!3312 lt!148681 #b00000000000000000000000000000000)))

(declare-fun lt!148680 () Unit!9321)

(assert (=> b!299064 (= lt!148680 lt!148682)))

(declare-fun res!157663 () Bool)

(assert (=> b!299064 (= res!157663 (= (seekEntryOrOpen!0 (select (arr!7156 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2305 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299064 (=> (not res!157663) (not e!188911))))

(declare-fun b!299065 () Bool)

(assert (=> b!299065 (= e!188910 call!25801)))

(declare-fun d!67509 () Bool)

(declare-fun res!157664 () Bool)

(assert (=> d!67509 (=> res!157664 e!188912)))

(assert (=> d!67509 (= res!157664 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7508 a!3312)))))

(assert (=> d!67509 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!188912)))

(declare-fun bm!25798 () Bool)

(assert (=> bm!25798 (= call!25801 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67509 (not res!157664)) b!299062))

(assert (= (and b!299062 c!48288) b!299064))

(assert (= (and b!299062 (not c!48288)) b!299065))

(assert (= (and b!299064 res!157663) b!299063))

(assert (= (or b!299063 b!299065) bm!25798))

(declare-fun m!311433 () Bool)

(assert (=> b!299062 m!311433))

(assert (=> b!299062 m!311433))

(declare-fun m!311435 () Bool)

(assert (=> b!299062 m!311435))

(assert (=> b!299064 m!311433))

(declare-fun m!311437 () Bool)

(assert (=> b!299064 m!311437))

(declare-fun m!311439 () Bool)

(assert (=> b!299064 m!311439))

(assert (=> b!299064 m!311433))

(declare-fun m!311441 () Bool)

(assert (=> b!299064 m!311441))

(declare-fun m!311443 () Bool)

(assert (=> bm!25798 m!311443))

(assert (=> bm!25795 d!67509))

(assert (=> d!67419 d!67411))

(declare-fun d!67511 () Bool)

(declare-fun e!188913 () Bool)

(assert (=> d!67511 e!188913))

(declare-fun c!48291 () Bool)

(declare-fun lt!148683 () SeekEntryResult!2305)

(assert (=> d!67511 (= c!48291 (and (is-Intermediate!2305 lt!148683) (undefined!3117 lt!148683)))))

(declare-fun e!188916 () SeekEntryResult!2305)

(assert (=> d!67511 (= lt!148683 e!188916)))

(declare-fun c!48289 () Bool)

(assert (=> d!67511 (= c!48289 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148684 () (_ BitVec 64))

(assert (=> d!67511 (= lt!148684 (select (arr!7156 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!67511 (validMask!0 mask!3809)))

(assert (=> d!67511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!148683)))

(declare-fun b!299066 () Bool)

(declare-fun e!188914 () SeekEntryResult!2305)

(assert (=> b!299066 (= e!188914 (Intermediate!2305 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!299067 () Bool)

(assert (=> b!299067 (= e!188914 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!299068 () Bool)

(assert (=> b!299068 (= e!188916 e!188914)))

(declare-fun c!48290 () Bool)

(assert (=> b!299068 (= c!48290 (or (= lt!148684 k!2524) (= (bvadd lt!148684 lt!148684) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299069 () Bool)

(assert (=> b!299069 (= e!188913 (bvsge (x!29620 lt!148683) #b01111111111111111111111111111110))))

(declare-fun b!299070 () Bool)

(assert (=> b!299070 (and (bvsge (index!11395 lt!148683) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148683) (size!7508 a!3312)))))

(declare-fun res!157666 () Bool)

(assert (=> b!299070 (= res!157666 (= (select (arr!7156 a!3312) (index!11395 lt!148683)) k!2524))))

(declare-fun e!188915 () Bool)

(assert (=> b!299070 (=> res!157666 e!188915)))

(declare-fun e!188917 () Bool)

(assert (=> b!299070 (= e!188917 e!188915)))

(declare-fun b!299071 () Bool)

(assert (=> b!299071 (= e!188916 (Intermediate!2305 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!299072 () Bool)

(assert (=> b!299072 (and (bvsge (index!11395 lt!148683) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148683) (size!7508 a!3312)))))

(assert (=> b!299072 (= e!188915 (= (select (arr!7156 a!3312) (index!11395 lt!148683)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299073 () Bool)

(assert (=> b!299073 (= e!188913 e!188917)))

(declare-fun res!157665 () Bool)

(assert (=> b!299073 (= res!157665 (and (is-Intermediate!2305 lt!148683) (not (undefined!3117 lt!148683)) (bvslt (x!29620 lt!148683) #b01111111111111111111111111111110) (bvsge (x!29620 lt!148683) #b00000000000000000000000000000000) (bvsge (x!29620 lt!148683) #b00000000000000000000000000000000)))))

(assert (=> b!299073 (=> (not res!157665) (not e!188917))))

(declare-fun b!299074 () Bool)

(assert (=> b!299074 (and (bvsge (index!11395 lt!148683) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148683) (size!7508 a!3312)))))

(declare-fun res!157667 () Bool)

(assert (=> b!299074 (= res!157667 (= (select (arr!7156 a!3312) (index!11395 lt!148683)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299074 (=> res!157667 e!188915)))

(assert (= (and d!67511 c!48289) b!299071))

(assert (= (and d!67511 (not c!48289)) b!299068))

(assert (= (and b!299068 c!48290) b!299066))

(assert (= (and b!299068 (not c!48290)) b!299067))

(assert (= (and d!67511 c!48291) b!299069))

(assert (= (and d!67511 (not c!48291)) b!299073))

(assert (= (and b!299073 res!157665) b!299070))

(assert (= (and b!299070 (not res!157666)) b!299074))

(assert (= (and b!299074 (not res!157667)) b!299072))

(declare-fun m!311445 () Bool)

(assert (=> b!299070 m!311445))

(assert (=> d!67511 m!311163))

(declare-fun m!311447 () Bool)

(assert (=> d!67511 m!311447))

(assert (=> d!67511 m!311167))

(assert (=> b!299074 m!311445))

(assert (=> b!299067 m!311163))

(declare-fun m!311449 () Bool)

(assert (=> b!299067 m!311449))

(assert (=> b!299067 m!311449))

(declare-fun m!311451 () Bool)

(assert (=> b!299067 m!311451))

(assert (=> b!299072 m!311445))

(assert (=> d!67443 d!67511))

(assert (=> d!67443 d!67439))

(assert (=> d!67443 d!67411))

(declare-fun d!67513 () Bool)

(declare-fun e!188918 () Bool)

(assert (=> d!67513 e!188918))

(declare-fun c!48294 () Bool)

(declare-fun lt!148685 () SeekEntryResult!2305)

(assert (=> d!67513 (= c!48294 (and (is-Intermediate!2305 lt!148685) (undefined!3117 lt!148685)))))

(declare-fun e!188921 () SeekEntryResult!2305)

(assert (=> d!67513 (= lt!148685 e!188921)))

(declare-fun c!48292 () Bool)

(assert (=> d!67513 (= c!48292 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!148686 () (_ BitVec 64))

(assert (=> d!67513 (= lt!148686 (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67513 (validMask!0 mask!3809)))

(assert (=> d!67513 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)) mask!3809) lt!148685)))

(declare-fun b!299075 () Bool)

(declare-fun e!188919 () SeekEntryResult!2305)

(assert (=> b!299075 (= e!188919 (Intermediate!2305 false (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299076 () Bool)

(assert (=> b!299076 (= e!188919 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)) mask!3809))))

(declare-fun b!299077 () Bool)

(assert (=> b!299077 (= e!188921 e!188919)))

(declare-fun c!48293 () Bool)

(assert (=> b!299077 (= c!48293 (or (= lt!148686 k!2524) (= (bvadd lt!148686 lt!148686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299078 () Bool)

(assert (=> b!299078 (= e!188918 (bvsge (x!29620 lt!148685) #b01111111111111111111111111111110))))

(declare-fun b!299079 () Bool)

(assert (=> b!299079 (and (bvsge (index!11395 lt!148685) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148685) (size!7508 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)))))))

(declare-fun res!157669 () Bool)

(assert (=> b!299079 (= res!157669 (= (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) (index!11395 lt!148685)) k!2524))))

(declare-fun e!188920 () Bool)

(assert (=> b!299079 (=> res!157669 e!188920)))

(declare-fun e!188922 () Bool)

(assert (=> b!299079 (= e!188922 e!188920)))

(declare-fun b!299080 () Bool)

(assert (=> b!299080 (= e!188921 (Intermediate!2305 true (nextIndex!0 lt!148527 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299081 () Bool)

(assert (=> b!299081 (and (bvsge (index!11395 lt!148685) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148685) (size!7508 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)))))))

(assert (=> b!299081 (= e!188920 (= (select (arr!7156 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312))) (index!11395 lt!148685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299082 () Bool)

(assert (=> b!299082 (= e!188918 e!188922)))

(declare-fun res!157668 () Bool)

(assert (=> b!299082 (= res!157668 (and (is-Intermediate!2305 lt!148685) (not (undefined!3117 lt!148685)) (bvslt (x!29620 lt!148685) #b01111111111111111111111111111110) (bvsge (x!29620 lt!148685) #b00000000000000000000000000000000) (bvsge (x!29620 lt!148685) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299082 (=> (not res!157668) (not e!188922))))

(declare-fun b!299083 () Bool)

(assert (=> b!299083 (and (bvsge (index!11395 lt!148685) #b00000000000000000000000000000000) (bvslt (index!11395 lt!148685) (size!7508 (array!15110 (store (arr!7156 a!3312) i!1256 k!2524) (size!7508 a!3312)))))))

