; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29906 () Bool)

(assert start!29906)

(declare-fun b!300663 () Bool)

(declare-fun res!158554 () Bool)

(declare-fun e!189834 () Bool)

(assert (=> b!300663 (=> (not res!158554) (not e!189834))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300663 (= res!158554 (validKeyInArray!0 k!2524))))

(declare-fun b!300664 () Bool)

(declare-fun res!158557 () Bool)

(assert (=> b!300664 (=> (not res!158557) (not e!189834))))

(declare-datatypes ((array!15184 0))(
  ( (array!15185 (arr!7186 (Array (_ BitVec 32) (_ BitVec 64))) (size!7538 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15184)

(declare-fun arrayContainsKey!0 (array!15184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300664 (= res!158557 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300665 () Bool)

(declare-fun res!158556 () Bool)

(assert (=> b!300665 (=> (not res!158556) (not e!189834))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!300665 (= res!158556 (and (= (size!7538 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7538 a!3312))))))

(declare-fun res!158555 () Bool)

(assert (=> start!29906 (=> (not res!158555) (not e!189834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29906 (= res!158555 (validMask!0 mask!3809))))

(assert (=> start!29906 e!189834))

(assert (=> start!29906 true))

(declare-fun array_inv!5149 (array!15184) Bool)

(assert (=> start!29906 (array_inv!5149 a!3312)))

(declare-fun b!300666 () Bool)

(declare-fun res!158559 () Bool)

(declare-fun e!189833 () Bool)

(assert (=> b!300666 (=> (not res!158559) (not e!189833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15184 (_ BitVec 32)) Bool)

(assert (=> b!300666 (= res!158559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300667 () Bool)

(assert (=> b!300667 (= e!189834 e!189833)))

(declare-fun res!158558 () Bool)

(assert (=> b!300667 (=> (not res!158558) (not e!189833))))

(declare-datatypes ((SeekEntryResult!2335 0))(
  ( (MissingZero!2335 (index!11516 (_ BitVec 32))) (Found!2335 (index!11517 (_ BitVec 32))) (Intermediate!2335 (undefined!3147 Bool) (index!11518 (_ BitVec 32)) (x!29769 (_ BitVec 32))) (Undefined!2335) (MissingVacant!2335 (index!11519 (_ BitVec 32))) )
))
(declare-fun lt!149591 () SeekEntryResult!2335)

(declare-fun lt!149594 () Bool)

(assert (=> b!300667 (= res!158558 (or lt!149594 (= lt!149591 (MissingVacant!2335 i!1256))))))

(assert (=> b!300667 (= lt!149594 (= lt!149591 (MissingZero!2335 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15184 (_ BitVec 32)) SeekEntryResult!2335)

(assert (=> b!300667 (= lt!149591 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun lt!149592 () SeekEntryResult!2335)

(declare-fun b!300668 () Bool)

(assert (=> b!300668 (= e!189833 (and (not lt!149594) (= lt!149591 (MissingVacant!2335 i!1256)) (not (is-Intermediate!2335 lt!149592))))))

(declare-fun lt!149595 () SeekEntryResult!2335)

(declare-fun lt!149593 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15184 (_ BitVec 32)) SeekEntryResult!2335)

(assert (=> b!300668 (= lt!149595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149593 k!2524 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312)) mask!3809))))

(assert (=> b!300668 (= lt!149592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149593 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300668 (= lt!149593 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29906 res!158555) b!300665))

(assert (= (and b!300665 res!158556) b!300663))

(assert (= (and b!300663 res!158554) b!300664))

(assert (= (and b!300664 res!158557) b!300667))

(assert (= (and b!300667 res!158558) b!300666))

(assert (= (and b!300666 res!158559) b!300668))

(declare-fun m!312649 () Bool)

(assert (=> b!300666 m!312649))

(declare-fun m!312651 () Bool)

(assert (=> start!29906 m!312651))

(declare-fun m!312653 () Bool)

(assert (=> start!29906 m!312653))

(declare-fun m!312655 () Bool)

(assert (=> b!300667 m!312655))

(declare-fun m!312657 () Bool)

(assert (=> b!300668 m!312657))

(declare-fun m!312659 () Bool)

(assert (=> b!300668 m!312659))

(declare-fun m!312661 () Bool)

(assert (=> b!300668 m!312661))

(declare-fun m!312663 () Bool)

(assert (=> b!300668 m!312663))

(declare-fun m!312665 () Bool)

(assert (=> b!300664 m!312665))

(declare-fun m!312667 () Bool)

(assert (=> b!300663 m!312667))

(push 1)

(assert (not b!300667))

(assert (not b!300664))

(assert (not b!300666))

(assert (not start!29906))

(assert (not b!300668))

(assert (not b!300663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!300711 () Bool)

(declare-fun lt!149609 () SeekEntryResult!2335)

(assert (=> b!300711 (and (bvsge (index!11518 lt!149609) #b00000000000000000000000000000000) (bvslt (index!11518 lt!149609) (size!7538 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312)))))))

(declare-fun e!189863 () Bool)

(assert (=> b!300711 (= e!189863 (= (select (arr!7186 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312))) (index!11518 lt!149609)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300712 () Bool)

(declare-fun e!189864 () SeekEntryResult!2335)

(assert (=> b!300712 (= e!189864 (Intermediate!2335 true lt!149593 #b00000000000000000000000000000000))))

(declare-fun b!300713 () Bool)

(assert (=> b!300713 (and (bvsge (index!11518 lt!149609) #b00000000000000000000000000000000) (bvslt (index!11518 lt!149609) (size!7538 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312)))))))

(declare-fun res!158573 () Bool)

(assert (=> b!300713 (= res!158573 (= (select (arr!7186 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312))) (index!11518 lt!149609)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300713 (=> res!158573 e!189863)))

(declare-fun b!300714 () Bool)

(declare-fun e!189862 () SeekEntryResult!2335)

(assert (=> b!300714 (= e!189862 (Intermediate!2335 false lt!149593 #b00000000000000000000000000000000))))

(declare-fun b!300716 () Bool)

(declare-fun e!189865 () Bool)

(declare-fun e!189861 () Bool)

(assert (=> b!300716 (= e!189865 e!189861)))

(declare-fun res!158572 () Bool)

(assert (=> b!300716 (= res!158572 (and (is-Intermediate!2335 lt!149609) (not (undefined!3147 lt!149609)) (bvslt (x!29769 lt!149609) #b01111111111111111111111111111110) (bvsge (x!29769 lt!149609) #b00000000000000000000000000000000) (bvsge (x!29769 lt!149609) #b00000000000000000000000000000000)))))

(assert (=> b!300716 (=> (not res!158572) (not e!189861))))

(declare-fun b!300717 () Bool)

(assert (=> b!300717 (= e!189865 (bvsge (x!29769 lt!149609) #b01111111111111111111111111111110))))

(declare-fun b!300718 () Bool)

(assert (=> b!300718 (= e!189864 e!189862)))

(declare-fun c!48664 () Bool)

(declare-fun lt!149610 () (_ BitVec 64))

(assert (=> b!300718 (= c!48664 (or (= lt!149610 k!2524) (= (bvadd lt!149610 lt!149610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300719 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300719 (= e!189862 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149593 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312)) mask!3809))))

(declare-fun d!67777 () Bool)

(assert (=> d!67777 e!189865))

(declare-fun c!48665 () Bool)

(assert (=> d!67777 (= c!48665 (and (is-Intermediate!2335 lt!149609) (undefined!3147 lt!149609)))))

(assert (=> d!67777 (= lt!149609 e!189864)))

(declare-fun c!48666 () Bool)

(assert (=> d!67777 (= c!48666 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67777 (= lt!149610 (select (arr!7186 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312))) lt!149593))))

(assert (=> d!67777 (validMask!0 mask!3809)))

(assert (=> d!67777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149593 k!2524 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312)) mask!3809) lt!149609)))

(declare-fun b!300715 () Bool)

(assert (=> b!300715 (and (bvsge (index!11518 lt!149609) #b00000000000000000000000000000000) (bvslt (index!11518 lt!149609) (size!7538 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312)))))))

(declare-fun res!158574 () Bool)

(assert (=> b!300715 (= res!158574 (= (select (arr!7186 (array!15185 (store (arr!7186 a!3312) i!1256 k!2524) (size!7538 a!3312))) (index!11518 lt!149609)) k!2524))))

(assert (=> b!300715 (=> res!158574 e!189863)))

(assert (=> b!300715 (= e!189861 e!189863)))

(assert (= (and d!67777 c!48666) b!300712))

(assert (= (and d!67777 (not c!48666)) b!300718))

(assert (= (and b!300718 c!48664) b!300714))

(assert (= (and b!300718 (not c!48664)) b!300719))

(assert (= (and d!67777 c!48665) b!300717))

(assert (= (and d!67777 (not c!48665)) b!300716))

(assert (= (and b!300716 res!158572) b!300715))

(assert (= (and b!300715 (not res!158574)) b!300713))

(assert (= (and b!300713 (not res!158573)) b!300711))

(declare-fun m!312685 () Bool)

(assert (=> b!300711 m!312685))

(declare-fun m!312687 () Bool)

(assert (=> d!67777 m!312687))

(assert (=> d!67777 m!312651))

(assert (=> b!300713 m!312685))

(assert (=> b!300715 m!312685))

(declare-fun m!312689 () Bool)

(assert (=> b!300719 m!312689))

(assert (=> b!300719 m!312689))

(declare-fun m!312691 () Bool)

(assert (=> b!300719 m!312691))

(assert (=> b!300668 d!67777))

(declare-fun b!300732 () Bool)

(declare-fun lt!149617 () SeekEntryResult!2335)

(assert (=> b!300732 (and (bvsge (index!11518 lt!149617) #b00000000000000000000000000000000) (bvslt (index!11518 lt!149617) (size!7538 a!3312)))))

(declare-fun e!189874 () Bool)

(assert (=> b!300732 (= e!189874 (= (select (arr!7186 a!3312) (index!11518 lt!149617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300733 () Bool)

(declare-fun e!189875 () SeekEntryResult!2335)

(assert (=> b!300733 (= e!189875 (Intermediate!2335 true lt!149593 #b00000000000000000000000000000000))))

(declare-fun b!300734 () Bool)

(assert (=> b!300734 (and (bvsge (index!11518 lt!149617) #b00000000000000000000000000000000) (bvslt (index!11518 lt!149617) (size!7538 a!3312)))))

(declare-fun res!158576 () Bool)

(assert (=> b!300734 (= res!158576 (= (select (arr!7186 a!3312) (index!11518 lt!149617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300734 (=> res!158576 e!189874)))

(declare-fun b!300735 () Bool)

(declare-fun e!189873 () SeekEntryResult!2335)

(assert (=> b!300735 (= e!189873 (Intermediate!2335 false lt!149593 #b00000000000000000000000000000000))))

(declare-fun b!300737 () Bool)

(declare-fun e!189876 () Bool)

(declare-fun e!189872 () Bool)

(assert (=> b!300737 (= e!189876 e!189872)))

(declare-fun res!158575 () Bool)

(assert (=> b!300737 (= res!158575 (and (is-Intermediate!2335 lt!149617) (not (undefined!3147 lt!149617)) (bvslt (x!29769 lt!149617) #b01111111111111111111111111111110) (bvsge (x!29769 lt!149617) #b00000000000000000000000000000000) (bvsge (x!29769 lt!149617) #b00000000000000000000000000000000)))))

(assert (=> b!300737 (=> (not res!158575) (not e!189872))))

(declare-fun b!300738 () Bool)

(assert (=> b!300738 (= e!189876 (bvsge (x!29769 lt!149617) #b01111111111111111111111111111110))))

(declare-fun b!300739 () Bool)

(assert (=> b!300739 (= e!189875 e!189873)))

(declare-fun c!48673 () Bool)

(declare-fun lt!149618 () (_ BitVec 64))

(assert (=> b!300739 (= c!48673 (or (= lt!149618 k!2524) (= (bvadd lt!149618 lt!149618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300740 () Bool)

(assert (=> b!300740 (= e!189873 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149593 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!67787 () Bool)

(assert (=> d!67787 e!189876))

(declare-fun c!48674 () Bool)

(assert (=> d!67787 (= c!48674 (and (is-Intermediate!2335 lt!149617) (undefined!3147 lt!149617)))))

(assert (=> d!67787 (= lt!149617 e!189875)))

(declare-fun c!48675 () Bool)

(assert (=> d!67787 (= c!48675 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67787 (= lt!149618 (select (arr!7186 a!3312) lt!149593))))

(assert (=> d!67787 (validMask!0 mask!3809)))

(assert (=> d!67787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149593 k!2524 a!3312 mask!3809) lt!149617)))

(declare-fun b!300736 () Bool)

(assert (=> b!300736 (and (bvsge (index!11518 lt!149617) #b00000000000000000000000000000000) (bvslt (index!11518 lt!149617) (size!7538 a!3312)))))

(declare-fun res!158577 () Bool)

(assert (=> b!300736 (= res!158577 (= (select (arr!7186 a!3312) (index!11518 lt!149617)) k!2524))))

(assert (=> b!300736 (=> res!158577 e!189874)))

(assert (=> b!300736 (= e!189872 e!189874)))

(assert (= (and d!67787 c!48675) b!300733))

(assert (= (and d!67787 (not c!48675)) b!300739))

(assert (= (and b!300739 c!48673) b!300735))

(assert (= (and b!300739 (not c!48673)) b!300740))

(assert (= (and d!67787 c!48674) b!300738))

(assert (= (and d!67787 (not c!48674)) b!300737))

(assert (= (and b!300737 res!158575) b!300736))

(assert (= (and b!300736 (not res!158577)) b!300734))

(assert (= (and b!300734 (not res!158576)) b!300732))

(declare-fun m!312693 () Bool)

(assert (=> b!300732 m!312693))

(declare-fun m!312695 () Bool)

(assert (=> d!67787 m!312695))

(assert (=> d!67787 m!312651))

(assert (=> b!300734 m!312693))

(assert (=> b!300736 m!312693))

(assert (=> b!300740 m!312689))

(assert (=> b!300740 m!312689))

(declare-fun m!312697 () Bool)

(assert (=> b!300740 m!312697))

(assert (=> b!300668 d!67787))

(declare-fun d!67789 () Bool)

(declare-fun lt!149633 () (_ BitVec 32))

(declare-fun lt!149632 () (_ BitVec 32))

(assert (=> d!67789 (= lt!149633 (bvmul (bvxor lt!149632 (bvlshr lt!149632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67789 (= lt!149632 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67789 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158578 (let ((h!5325 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29771 (bvmul (bvxor h!5325 (bvlshr h!5325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29771 (bvlshr x!29771 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158578 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158578 #b00000000000000000000000000000000))))))

(assert (=> d!67789 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!149633 (bvlshr lt!149633 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300668 d!67789))

(declare-fun d!67791 () Bool)

(assert (=> d!67791 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300663 d!67791))

(declare-fun d!67795 () Bool)

(assert (=> d!67795 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29906 d!67795))

(declare-fun d!67801 () Bool)

(assert (=> d!67801 (= (array_inv!5149 a!3312) (bvsge (size!7538 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29906 d!67801))

(declare-fun b!300819 () Bool)

(declare-fun e!189926 () SeekEntryResult!2335)

(declare-fun lt!149668 () SeekEntryResult!2335)

(assert (=> b!300819 (= e!189926 (MissingZero!2335 (index!11518 lt!149668)))))

(declare-fun b!300820 () Bool)

(declare-fun e!189925 () SeekEntryResult!2335)

(assert (=> b!300820 (= e!189925 (Found!2335 (index!11518 lt!149668)))))

(declare-fun d!67803 () Bool)

(declare-fun lt!149667 () SeekEntryResult!2335)

(assert (=> d!67803 (and (or (is-Undefined!2335 lt!149667) (not (is-Found!2335 lt!149667)) (and (bvsge (index!11517 lt!149667) #b00000000000000000000000000000000) (bvslt (index!11517 lt!149667) (size!7538 a!3312)))) (or (is-Undefined!2335 lt!149667) (is-Found!2335 lt!149667) (not (is-MissingZero!2335 lt!149667)) (and (bvsge (index!11516 lt!149667) #b00000000000000000000000000000000) (bvslt (index!11516 lt!149667) (size!7538 a!3312)))) (or (is-Undefined!2335 lt!149667) (is-Found!2335 lt!149667) (is-MissingZero!2335 lt!149667) (not (is-MissingVacant!2335 lt!149667)) (and (bvsge (index!11519 lt!149667) #b00000000000000000000000000000000) (bvslt (index!11519 lt!149667) (size!7538 a!3312)))) (or (is-Undefined!2335 lt!149667) (ite (is-Found!2335 lt!149667) (= (select (arr!7186 a!3312) (index!11517 lt!149667)) k!2524) (ite (is-MissingZero!2335 lt!149667) (= (select (arr!7186 a!3312) (index!11516 lt!149667)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2335 lt!149667) (= (select (arr!7186 a!3312) (index!11519 lt!149667)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189924 () SeekEntryResult!2335)

(assert (=> d!67803 (= lt!149667 e!189924)))

(declare-fun c!48703 () Bool)

(assert (=> d!67803 (= c!48703 (and (is-Intermediate!2335 lt!149668) (undefined!3147 lt!149668)))))

(assert (=> d!67803 (= lt!149668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67803 (validMask!0 mask!3809)))

(assert (=> d!67803 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149667)))

(declare-fun b!300821 () Bool)

(declare-fun c!48705 () Bool)

(declare-fun lt!149666 () (_ BitVec 64))

(assert (=> b!300821 (= c!48705 (= lt!149666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300821 (= e!189925 e!189926)))

(declare-fun b!300822 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15184 (_ BitVec 32)) SeekEntryResult!2335)

(assert (=> b!300822 (= e!189926 (seekKeyOrZeroReturnVacant!0 (x!29769 lt!149668) (index!11518 lt!149668) (index!11518 lt!149668) k!2524 a!3312 mask!3809))))

(declare-fun b!300823 () Bool)

(assert (=> b!300823 (= e!189924 e!189925)))

(assert (=> b!300823 (= lt!149666 (select (arr!7186 a!3312) (index!11518 lt!149668)))))

(declare-fun c!48704 () Bool)

(assert (=> b!300823 (= c!48704 (= lt!149666 k!2524))))

(declare-fun b!300824 () Bool)

(assert (=> b!300824 (= e!189924 Undefined!2335)))

(assert (= (and d!67803 c!48703) b!300824))

(assert (= (and d!67803 (not c!48703)) b!300823))

(assert (= (and b!300823 c!48704) b!300820))

(assert (= (and b!300823 (not c!48704)) b!300821))

(assert (= (and b!300821 c!48705) b!300819))

(assert (= (and b!300821 (not c!48705)) b!300822))

(declare-fun m!312747 () Bool)

(assert (=> d!67803 m!312747))

(declare-fun m!312749 () Bool)

(assert (=> d!67803 m!312749))

(assert (=> d!67803 m!312651))

(assert (=> d!67803 m!312663))

(declare-fun m!312751 () Bool)

(assert (=> d!67803 m!312751))

(assert (=> d!67803 m!312663))

(declare-fun m!312753 () Bool)

(assert (=> d!67803 m!312753))

(declare-fun m!312755 () Bool)

(assert (=> b!300822 m!312755))

(declare-fun m!312757 () Bool)

(assert (=> b!300823 m!312757))

(assert (=> b!300667 d!67803))

(declare-fun b!300833 () Bool)

(declare-fun e!189934 () Bool)

(declare-fun e!189933 () Bool)

(assert (=> b!300833 (= e!189934 e!189933)))

(declare-fun lt!149676 () (_ BitVec 64))

(assert (=> b!300833 (= lt!149676 (select (arr!7186 a!3312) #b00000000000000000000000000000000))))

