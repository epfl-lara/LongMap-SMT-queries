; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29572 () Bool)

(assert start!29572)

(declare-fun b!298742 () Bool)

(declare-fun res!157543 () Bool)

(declare-fun e!188719 () Bool)

(assert (=> b!298742 (=> (not res!157543) (not e!188719))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15102 0))(
  ( (array!15103 (arr!7153 (Array (_ BitVec 32) (_ BitVec 64))) (size!7505 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15102)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!298742 (= res!157543 (and (= (size!7505 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7505 a!3312))))))

(declare-fun b!298743 () Bool)

(declare-fun res!157544 () Bool)

(assert (=> b!298743 (=> (not res!157544) (not e!188719))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298743 (= res!157544 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298744 () Bool)

(declare-fun res!157542 () Bool)

(assert (=> b!298744 (=> (not res!157542) (not e!188719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298744 (= res!157542 (validKeyInArray!0 k0!2524))))

(declare-fun res!157541 () Bool)

(assert (=> start!29572 (=> (not res!157541) (not e!188719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29572 (= res!157541 (validMask!0 mask!3809))))

(assert (=> start!29572 e!188719))

(assert (=> start!29572 true))

(declare-fun array_inv!5103 (array!15102) Bool)

(assert (=> start!29572 (array_inv!5103 a!3312)))

(declare-fun b!298745 () Bool)

(declare-fun e!188718 () Bool)

(assert (=> b!298745 (= e!188719 e!188718)))

(declare-fun res!157545 () Bool)

(assert (=> b!298745 (=> (not res!157545) (not e!188718))))

(declare-datatypes ((SeekEntryResult!2267 0))(
  ( (MissingZero!2267 (index!11241 (_ BitVec 32))) (Found!2267 (index!11242 (_ BitVec 32))) (Intermediate!2267 (undefined!3079 Bool) (index!11243 (_ BitVec 32)) (x!29583 (_ BitVec 32))) (Undefined!2267) (MissingVacant!2267 (index!11244 (_ BitVec 32))) )
))
(declare-fun lt!148566 () SeekEntryResult!2267)

(declare-fun lt!148563 () Bool)

(assert (=> b!298745 (= res!157545 (or lt!148563 (= lt!148566 (MissingVacant!2267 i!1256))))))

(assert (=> b!298745 (= lt!148563 (= lt!148566 (MissingZero!2267 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15102 (_ BitVec 32)) SeekEntryResult!2267)

(assert (=> b!298745 (= lt!148566 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298746 () Bool)

(declare-fun res!157540 () Bool)

(assert (=> b!298746 (=> (not res!157540) (not e!188718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15102 (_ BitVec 32)) Bool)

(assert (=> b!298746 (= res!157540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun lt!148564 () SeekEntryResult!2267)

(declare-fun b!298747 () Bool)

(get-info :version)

(assert (=> b!298747 (= e!188718 (and (not lt!148563) (= lt!148566 (MissingVacant!2267 i!1256)) (let ((bdg!6425 (not ((_ is Intermediate!2267) lt!148564)))) (and (or bdg!6425 (not (undefined!3079 lt!148564))) (not bdg!6425) (= (select (arr!7153 a!3312) (index!11243 lt!148564)) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (index!11243 lt!148564) i!1256))))))))

(declare-fun lt!148565 () SeekEntryResult!2267)

(declare-fun lt!148562 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15102 (_ BitVec 32)) SeekEntryResult!2267)

(assert (=> b!298747 (= lt!148565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148562 k0!2524 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)) mask!3809))))

(assert (=> b!298747 (= lt!148564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148562 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298747 (= lt!148562 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29572 res!157541) b!298742))

(assert (= (and b!298742 res!157543) b!298744))

(assert (= (and b!298744 res!157542) b!298743))

(assert (= (and b!298743 res!157544) b!298745))

(assert (= (and b!298745 res!157545) b!298746))

(assert (= (and b!298746 res!157540) b!298747))

(declare-fun m!311339 () Bool)

(assert (=> b!298744 m!311339))

(declare-fun m!311341 () Bool)

(assert (=> b!298746 m!311341))

(declare-fun m!311343 () Bool)

(assert (=> start!29572 m!311343))

(declare-fun m!311345 () Bool)

(assert (=> start!29572 m!311345))

(declare-fun m!311347 () Bool)

(assert (=> b!298745 m!311347))

(declare-fun m!311349 () Bool)

(assert (=> b!298743 m!311349))

(declare-fun m!311351 () Bool)

(assert (=> b!298747 m!311351))

(declare-fun m!311353 () Bool)

(assert (=> b!298747 m!311353))

(declare-fun m!311355 () Bool)

(assert (=> b!298747 m!311355))

(declare-fun m!311357 () Bool)

(assert (=> b!298747 m!311357))

(declare-fun m!311359 () Bool)

(assert (=> b!298747 m!311359))

(check-sat (not b!298746) (not b!298743) (not b!298744) (not b!298745) (not b!298747) (not start!29572))
(check-sat)
(get-model)

(declare-fun lt!148611 () SeekEntryResult!2267)

(declare-fun b!298820 () Bool)

(assert (=> b!298820 (and (bvsge (index!11243 lt!148611) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148611) (size!7505 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)))))))

(declare-fun res!157602 () Bool)

(assert (=> b!298820 (= res!157602 (= (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (index!11243 lt!148611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188767 () Bool)

(assert (=> b!298820 (=> res!157602 e!188767)))

(declare-fun b!298821 () Bool)

(assert (=> b!298821 (and (bvsge (index!11243 lt!148611) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148611) (size!7505 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)))))))

(declare-fun res!157601 () Bool)

(assert (=> b!298821 (= res!157601 (= (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (index!11243 lt!148611)) k0!2524))))

(assert (=> b!298821 (=> res!157601 e!188767)))

(declare-fun e!188764 () Bool)

(assert (=> b!298821 (= e!188764 e!188767)))

(declare-fun b!298822 () Bool)

(declare-fun e!188766 () SeekEntryResult!2267)

(assert (=> b!298822 (= e!188766 (Intermediate!2267 false lt!148562 #b00000000000000000000000000000000))))

(declare-fun b!298823 () Bool)

(declare-fun e!188765 () Bool)

(assert (=> b!298823 (= e!188765 e!188764)))

(declare-fun res!157600 () Bool)

(assert (=> b!298823 (= res!157600 (and ((_ is Intermediate!2267) lt!148611) (not (undefined!3079 lt!148611)) (bvslt (x!29583 lt!148611) #b01111111111111111111111111111110) (bvsge (x!29583 lt!148611) #b00000000000000000000000000000000) (bvsge (x!29583 lt!148611) #b00000000000000000000000000000000)))))

(assert (=> b!298823 (=> (not res!157600) (not e!188764))))

(declare-fun b!298824 () Bool)

(assert (=> b!298824 (= e!188765 (bvsge (x!29583 lt!148611) #b01111111111111111111111111111110))))

(declare-fun b!298825 () Bool)

(declare-fun e!188768 () SeekEntryResult!2267)

(assert (=> b!298825 (= e!188768 (Intermediate!2267 true lt!148562 #b00000000000000000000000000000000))))

(declare-fun b!298826 () Bool)

(assert (=> b!298826 (= e!188768 e!188766)))

(declare-fun c!48198 () Bool)

(declare-fun lt!148610 () (_ BitVec 64))

(assert (=> b!298826 (= c!48198 (or (= lt!148610 k0!2524) (= (bvadd lt!148610 lt!148610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67475 () Bool)

(assert (=> d!67475 e!188765))

(declare-fun c!48197 () Bool)

(assert (=> d!67475 (= c!48197 (and ((_ is Intermediate!2267) lt!148611) (undefined!3079 lt!148611)))))

(assert (=> d!67475 (= lt!148611 e!188768)))

(declare-fun c!48199 () Bool)

(assert (=> d!67475 (= c!48199 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67475 (= lt!148610 (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) lt!148562))))

(assert (=> d!67475 (validMask!0 mask!3809)))

(assert (=> d!67475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148562 k0!2524 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)) mask!3809) lt!148611)))

(declare-fun b!298827 () Bool)

(assert (=> b!298827 (and (bvsge (index!11243 lt!148611) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148611) (size!7505 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)))))))

(assert (=> b!298827 (= e!188767 (= (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (index!11243 lt!148611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298828 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298828 (= e!188766 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)) mask!3809))))

(assert (= (and d!67475 c!48199) b!298825))

(assert (= (and d!67475 (not c!48199)) b!298826))

(assert (= (and b!298826 c!48198) b!298822))

(assert (= (and b!298826 (not c!48198)) b!298828))

(assert (= (and d!67475 c!48197) b!298824))

(assert (= (and d!67475 (not c!48197)) b!298823))

(assert (= (and b!298823 res!157600) b!298821))

(assert (= (and b!298821 (not res!157601)) b!298820))

(assert (= (and b!298820 (not res!157602)) b!298827))

(declare-fun m!311419 () Bool)

(assert (=> b!298828 m!311419))

(assert (=> b!298828 m!311419))

(declare-fun m!311421 () Bool)

(assert (=> b!298828 m!311421))

(declare-fun m!311423 () Bool)

(assert (=> b!298827 m!311423))

(declare-fun m!311425 () Bool)

(assert (=> d!67475 m!311425))

(assert (=> d!67475 m!311343))

(assert (=> b!298820 m!311423))

(assert (=> b!298821 m!311423))

(assert (=> b!298747 d!67475))

(declare-fun b!298829 () Bool)

(declare-fun lt!148613 () SeekEntryResult!2267)

(assert (=> b!298829 (and (bvsge (index!11243 lt!148613) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148613) (size!7505 a!3312)))))

(declare-fun res!157605 () Bool)

(assert (=> b!298829 (= res!157605 (= (select (arr!7153 a!3312) (index!11243 lt!148613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188772 () Bool)

(assert (=> b!298829 (=> res!157605 e!188772)))

(declare-fun b!298830 () Bool)

(assert (=> b!298830 (and (bvsge (index!11243 lt!148613) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148613) (size!7505 a!3312)))))

(declare-fun res!157604 () Bool)

(assert (=> b!298830 (= res!157604 (= (select (arr!7153 a!3312) (index!11243 lt!148613)) k0!2524))))

(assert (=> b!298830 (=> res!157604 e!188772)))

(declare-fun e!188769 () Bool)

(assert (=> b!298830 (= e!188769 e!188772)))

(declare-fun b!298831 () Bool)

(declare-fun e!188771 () SeekEntryResult!2267)

(assert (=> b!298831 (= e!188771 (Intermediate!2267 false lt!148562 #b00000000000000000000000000000000))))

(declare-fun b!298832 () Bool)

(declare-fun e!188770 () Bool)

(assert (=> b!298832 (= e!188770 e!188769)))

(declare-fun res!157603 () Bool)

(assert (=> b!298832 (= res!157603 (and ((_ is Intermediate!2267) lt!148613) (not (undefined!3079 lt!148613)) (bvslt (x!29583 lt!148613) #b01111111111111111111111111111110) (bvsge (x!29583 lt!148613) #b00000000000000000000000000000000) (bvsge (x!29583 lt!148613) #b00000000000000000000000000000000)))))

(assert (=> b!298832 (=> (not res!157603) (not e!188769))))

(declare-fun b!298833 () Bool)

(assert (=> b!298833 (= e!188770 (bvsge (x!29583 lt!148613) #b01111111111111111111111111111110))))

(declare-fun b!298834 () Bool)

(declare-fun e!188773 () SeekEntryResult!2267)

(assert (=> b!298834 (= e!188773 (Intermediate!2267 true lt!148562 #b00000000000000000000000000000000))))

(declare-fun b!298835 () Bool)

(assert (=> b!298835 (= e!188773 e!188771)))

(declare-fun c!48201 () Bool)

(declare-fun lt!148612 () (_ BitVec 64))

(assert (=> b!298835 (= c!48201 (or (= lt!148612 k0!2524) (= (bvadd lt!148612 lt!148612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67485 () Bool)

(assert (=> d!67485 e!188770))

(declare-fun c!48200 () Bool)

(assert (=> d!67485 (= c!48200 (and ((_ is Intermediate!2267) lt!148613) (undefined!3079 lt!148613)))))

(assert (=> d!67485 (= lt!148613 e!188773)))

(declare-fun c!48202 () Bool)

(assert (=> d!67485 (= c!48202 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67485 (= lt!148612 (select (arr!7153 a!3312) lt!148562))))

(assert (=> d!67485 (validMask!0 mask!3809)))

(assert (=> d!67485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148562 k0!2524 a!3312 mask!3809) lt!148613)))

(declare-fun b!298836 () Bool)

(assert (=> b!298836 (and (bvsge (index!11243 lt!148613) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148613) (size!7505 a!3312)))))

(assert (=> b!298836 (= e!188772 (= (select (arr!7153 a!3312) (index!11243 lt!148613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298837 () Bool)

(assert (=> b!298837 (= e!188771 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67485 c!48202) b!298834))

(assert (= (and d!67485 (not c!48202)) b!298835))

(assert (= (and b!298835 c!48201) b!298831))

(assert (= (and b!298835 (not c!48201)) b!298837))

(assert (= (and d!67485 c!48200) b!298833))

(assert (= (and d!67485 (not c!48200)) b!298832))

(assert (= (and b!298832 res!157603) b!298830))

(assert (= (and b!298830 (not res!157604)) b!298829))

(assert (= (and b!298829 (not res!157605)) b!298836))

(assert (=> b!298837 m!311419))

(assert (=> b!298837 m!311419))

(declare-fun m!311427 () Bool)

(assert (=> b!298837 m!311427))

(declare-fun m!311429 () Bool)

(assert (=> b!298836 m!311429))

(declare-fun m!311431 () Bool)

(assert (=> d!67485 m!311431))

(assert (=> d!67485 m!311343))

(assert (=> b!298829 m!311429))

(assert (=> b!298830 m!311429))

(assert (=> b!298747 d!67485))

(declare-fun d!67487 () Bool)

(declare-fun lt!148619 () (_ BitVec 32))

(declare-fun lt!148618 () (_ BitVec 32))

(assert (=> d!67487 (= lt!148619 (bvmul (bvxor lt!148618 (bvlshr lt!148618 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67487 (= lt!148618 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67487 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157606 (let ((h!5222 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29587 (bvmul (bvxor h!5222 (bvlshr h!5222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29587 (bvlshr x!29587 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157606 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157606 #b00000000000000000000000000000000))))))

(assert (=> d!67487 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148619 (bvlshr lt!148619 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298747 d!67487))

(declare-fun d!67489 () Bool)

(declare-fun res!157611 () Bool)

(declare-fun e!188778 () Bool)

(assert (=> d!67489 (=> res!157611 e!188778)))

(assert (=> d!67489 (= res!157611 (= (select (arr!7153 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67489 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188778)))

(declare-fun b!298842 () Bool)

(declare-fun e!188779 () Bool)

(assert (=> b!298842 (= e!188778 e!188779)))

(declare-fun res!157612 () Bool)

(assert (=> b!298842 (=> (not res!157612) (not e!188779))))

(assert (=> b!298842 (= res!157612 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7505 a!3312)))))

(declare-fun b!298843 () Bool)

(assert (=> b!298843 (= e!188779 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67489 (not res!157611)) b!298842))

(assert (= (and b!298842 res!157612) b!298843))

(declare-fun m!311433 () Bool)

(assert (=> d!67489 m!311433))

(declare-fun m!311435 () Bool)

(assert (=> b!298843 m!311435))

(assert (=> b!298743 d!67489))

(declare-fun d!67493 () Bool)

(assert (=> d!67493 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298744 d!67493))

(declare-fun b!298884 () Bool)

(declare-fun e!188805 () SeekEntryResult!2267)

(declare-fun lt!148641 () SeekEntryResult!2267)

(assert (=> b!298884 (= e!188805 (MissingZero!2267 (index!11243 lt!148641)))))

(declare-fun d!67497 () Bool)

(declare-fun lt!148643 () SeekEntryResult!2267)

(assert (=> d!67497 (and (or ((_ is Undefined!2267) lt!148643) (not ((_ is Found!2267) lt!148643)) (and (bvsge (index!11242 lt!148643) #b00000000000000000000000000000000) (bvslt (index!11242 lt!148643) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148643) ((_ is Found!2267) lt!148643) (not ((_ is MissingZero!2267) lt!148643)) (and (bvsge (index!11241 lt!148643) #b00000000000000000000000000000000) (bvslt (index!11241 lt!148643) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148643) ((_ is Found!2267) lt!148643) ((_ is MissingZero!2267) lt!148643) (not ((_ is MissingVacant!2267) lt!148643)) (and (bvsge (index!11244 lt!148643) #b00000000000000000000000000000000) (bvslt (index!11244 lt!148643) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148643) (ite ((_ is Found!2267) lt!148643) (= (select (arr!7153 a!3312) (index!11242 lt!148643)) k0!2524) (ite ((_ is MissingZero!2267) lt!148643) (= (select (arr!7153 a!3312) (index!11241 lt!148643)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2267) lt!148643) (= (select (arr!7153 a!3312) (index!11244 lt!148643)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188807 () SeekEntryResult!2267)

(assert (=> d!67497 (= lt!148643 e!188807)))

(declare-fun c!48220 () Bool)

(assert (=> d!67497 (= c!48220 (and ((_ is Intermediate!2267) lt!148641) (undefined!3079 lt!148641)))))

(assert (=> d!67497 (= lt!148641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67497 (validMask!0 mask!3809)))

(assert (=> d!67497 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148643)))

(declare-fun b!298885 () Bool)

(assert (=> b!298885 (= e!188807 Undefined!2267)))

(declare-fun b!298886 () Bool)

(declare-fun e!188806 () SeekEntryResult!2267)

(assert (=> b!298886 (= e!188806 (Found!2267 (index!11243 lt!148641)))))

(declare-fun b!298887 () Bool)

(assert (=> b!298887 (= e!188807 e!188806)))

(declare-fun lt!148642 () (_ BitVec 64))

(assert (=> b!298887 (= lt!148642 (select (arr!7153 a!3312) (index!11243 lt!148641)))))

(declare-fun c!48219 () Bool)

(assert (=> b!298887 (= c!48219 (= lt!148642 k0!2524))))

(declare-fun b!298888 () Bool)

(declare-fun c!48218 () Bool)

(assert (=> b!298888 (= c!48218 (= lt!148642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298888 (= e!188806 e!188805)))

(declare-fun b!298889 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15102 (_ BitVec 32)) SeekEntryResult!2267)

(assert (=> b!298889 (= e!188805 (seekKeyOrZeroReturnVacant!0 (x!29583 lt!148641) (index!11243 lt!148641) (index!11243 lt!148641) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67497 c!48220) b!298885))

(assert (= (and d!67497 (not c!48220)) b!298887))

(assert (= (and b!298887 c!48219) b!298886))

(assert (= (and b!298887 (not c!48219)) b!298888))

(assert (= (and b!298888 c!48218) b!298884))

(assert (= (and b!298888 (not c!48218)) b!298889))

(declare-fun m!311449 () Bool)

(assert (=> d!67497 m!311449))

(declare-fun m!311451 () Bool)

(assert (=> d!67497 m!311451))

(assert (=> d!67497 m!311343))

(declare-fun m!311453 () Bool)

(assert (=> d!67497 m!311453))

(assert (=> d!67497 m!311353))

(declare-fun m!311455 () Bool)

(assert (=> d!67497 m!311455))

(assert (=> d!67497 m!311353))

(declare-fun m!311457 () Bool)

(assert (=> b!298887 m!311457))

(declare-fun m!311463 () Bool)

(assert (=> b!298889 m!311463))

(assert (=> b!298745 d!67497))

(declare-fun b!298906 () Bool)

(declare-fun e!188819 () Bool)

(declare-fun call!25786 () Bool)

(assert (=> b!298906 (= e!188819 call!25786)))

(declare-fun b!298907 () Bool)

(declare-fun e!188820 () Bool)

(assert (=> b!298907 (= e!188820 call!25786)))

(declare-fun b!298908 () Bool)

(assert (=> b!298908 (= e!188820 e!188819)))

(declare-fun lt!148655 () (_ BitVec 64))

(assert (=> b!298908 (= lt!148655 (select (arr!7153 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9273 0))(
  ( (Unit!9274) )
))
(declare-fun lt!148653 () Unit!9273)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15102 (_ BitVec 64) (_ BitVec 32)) Unit!9273)

(assert (=> b!298908 (= lt!148653 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148655 #b00000000000000000000000000000000))))

(assert (=> b!298908 (arrayContainsKey!0 a!3312 lt!148655 #b00000000000000000000000000000000)))

(declare-fun lt!148654 () Unit!9273)

(assert (=> b!298908 (= lt!148654 lt!148653)))

(declare-fun res!157629 () Bool)

(assert (=> b!298908 (= res!157629 (= (seekEntryOrOpen!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2267 #b00000000000000000000000000000000)))))

(assert (=> b!298908 (=> (not res!157629) (not e!188819))))

(declare-fun bm!25783 () Bool)

(assert (=> bm!25783 (= call!25786 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298909 () Bool)

(declare-fun e!188821 () Bool)

(assert (=> b!298909 (= e!188821 e!188820)))

(declare-fun c!48226 () Bool)

(assert (=> b!298909 (= c!48226 (validKeyInArray!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67505 () Bool)

(declare-fun res!157630 () Bool)

(assert (=> d!67505 (=> res!157630 e!188821)))

(assert (=> d!67505 (= res!157630 (bvsge #b00000000000000000000000000000000 (size!7505 a!3312)))))

(assert (=> d!67505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188821)))

(assert (= (and d!67505 (not res!157630)) b!298909))

(assert (= (and b!298909 c!48226) b!298908))

(assert (= (and b!298909 (not c!48226)) b!298907))

(assert (= (and b!298908 res!157629) b!298906))

(assert (= (or b!298906 b!298907) bm!25783))

(assert (=> b!298908 m!311433))

(declare-fun m!311475 () Bool)

(assert (=> b!298908 m!311475))

(declare-fun m!311477 () Bool)

(assert (=> b!298908 m!311477))

(assert (=> b!298908 m!311433))

(declare-fun m!311479 () Bool)

(assert (=> b!298908 m!311479))

(declare-fun m!311481 () Bool)

(assert (=> bm!25783 m!311481))

(assert (=> b!298909 m!311433))

(assert (=> b!298909 m!311433))

(declare-fun m!311483 () Bool)

(assert (=> b!298909 m!311483))

(assert (=> b!298746 d!67505))

(declare-fun d!67511 () Bool)

(assert (=> d!67511 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29572 d!67511))

(declare-fun d!67517 () Bool)

(assert (=> d!67517 (= (array_inv!5103 a!3312) (bvsge (size!7505 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29572 d!67517))

(check-sat (not d!67497) (not b!298843) (not b!298889) (not b!298908) (not b!298828) (not b!298837) (not d!67475) (not b!298909) (not d!67485) (not bm!25783))
(check-sat)
(get-model)

(declare-fun d!67529 () Bool)

(assert (=> d!67529 (= (validKeyInArray!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7153 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7153 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298909 d!67529))

(declare-fun b!299000 () Bool)

(declare-fun lt!148694 () SeekEntryResult!2267)

(assert (=> b!299000 (and (bvsge (index!11243 lt!148694) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148694) (size!7505 a!3312)))))

(declare-fun res!157659 () Bool)

(assert (=> b!299000 (= res!157659 (= (select (arr!7153 a!3312) (index!11243 lt!148694)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188874 () Bool)

(assert (=> b!299000 (=> res!157659 e!188874)))

(declare-fun b!299001 () Bool)

(assert (=> b!299001 (and (bvsge (index!11243 lt!148694) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148694) (size!7505 a!3312)))))

(declare-fun res!157658 () Bool)

(assert (=> b!299001 (= res!157658 (= (select (arr!7153 a!3312) (index!11243 lt!148694)) k0!2524))))

(assert (=> b!299001 (=> res!157658 e!188874)))

(declare-fun e!188871 () Bool)

(assert (=> b!299001 (= e!188871 e!188874)))

(declare-fun b!299002 () Bool)

(declare-fun e!188873 () SeekEntryResult!2267)

(assert (=> b!299002 (= e!188873 (Intermediate!2267 false (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!299003 () Bool)

(declare-fun e!188872 () Bool)

(assert (=> b!299003 (= e!188872 e!188871)))

(declare-fun res!157657 () Bool)

(assert (=> b!299003 (= res!157657 (and ((_ is Intermediate!2267) lt!148694) (not (undefined!3079 lt!148694)) (bvslt (x!29583 lt!148694) #b01111111111111111111111111111110) (bvsge (x!29583 lt!148694) #b00000000000000000000000000000000) (bvsge (x!29583 lt!148694) #b00000000000000000000000000000000)))))

(assert (=> b!299003 (=> (not res!157657) (not e!188871))))

(declare-fun b!299004 () Bool)

(assert (=> b!299004 (= e!188872 (bvsge (x!29583 lt!148694) #b01111111111111111111111111111110))))

(declare-fun b!299005 () Bool)

(declare-fun e!188875 () SeekEntryResult!2267)

(assert (=> b!299005 (= e!188875 (Intermediate!2267 true (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!299006 () Bool)

(assert (=> b!299006 (= e!188875 e!188873)))

(declare-fun c!48261 () Bool)

(declare-fun lt!148693 () (_ BitVec 64))

(assert (=> b!299006 (= c!48261 (or (= lt!148693 k0!2524) (= (bvadd lt!148693 lt!148693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67531 () Bool)

(assert (=> d!67531 e!188872))

(declare-fun c!48260 () Bool)

(assert (=> d!67531 (= c!48260 (and ((_ is Intermediate!2267) lt!148694) (undefined!3079 lt!148694)))))

(assert (=> d!67531 (= lt!148694 e!188875)))

(declare-fun c!48262 () Bool)

(assert (=> d!67531 (= c!48262 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67531 (= lt!148693 (select (arr!7153 a!3312) (toIndex!0 k0!2524 mask!3809)))))

(assert (=> d!67531 (validMask!0 mask!3809)))

(assert (=> d!67531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809) lt!148694)))

(declare-fun b!299007 () Bool)

(assert (=> b!299007 (and (bvsge (index!11243 lt!148694) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148694) (size!7505 a!3312)))))

(assert (=> b!299007 (= e!188874 (= (select (arr!7153 a!3312) (index!11243 lt!148694)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299008 () Bool)

(assert (=> b!299008 (= e!188873 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2524 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67531 c!48262) b!299005))

(assert (= (and d!67531 (not c!48262)) b!299006))

(assert (= (and b!299006 c!48261) b!299002))

(assert (= (and b!299006 (not c!48261)) b!299008))

(assert (= (and d!67531 c!48260) b!299004))

(assert (= (and d!67531 (not c!48260)) b!299003))

(assert (= (and b!299003 res!157657) b!299001))

(assert (= (and b!299001 (not res!157658)) b!299000))

(assert (= (and b!299000 (not res!157659)) b!299007))

(assert (=> b!299008 m!311353))

(declare-fun m!311525 () Bool)

(assert (=> b!299008 m!311525))

(assert (=> b!299008 m!311525))

(declare-fun m!311527 () Bool)

(assert (=> b!299008 m!311527))

(declare-fun m!311529 () Bool)

(assert (=> b!299007 m!311529))

(assert (=> d!67531 m!311353))

(declare-fun m!311531 () Bool)

(assert (=> d!67531 m!311531))

(assert (=> d!67531 m!311343))

(assert (=> b!299000 m!311529))

(assert (=> b!299001 m!311529))

(assert (=> d!67497 d!67531))

(assert (=> d!67497 d!67487))

(assert (=> d!67497 d!67511))

(declare-fun d!67533 () Bool)

(declare-fun res!157660 () Bool)

(declare-fun e!188876 () Bool)

(assert (=> d!67533 (=> res!157660 e!188876)))

(assert (=> d!67533 (= res!157660 (= (select (arr!7153 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2524))))

(assert (=> d!67533 (= (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!188876)))

(declare-fun b!299009 () Bool)

(declare-fun e!188877 () Bool)

(assert (=> b!299009 (= e!188876 e!188877)))

(declare-fun res!157661 () Bool)

(assert (=> b!299009 (=> (not res!157661) (not e!188877))))

(assert (=> b!299009 (= res!157661 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7505 a!3312)))))

(declare-fun b!299010 () Bool)

(assert (=> b!299010 (= e!188877 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!67533 (not res!157660)) b!299009))

(assert (= (and b!299009 res!157661) b!299010))

(declare-fun m!311533 () Bool)

(assert (=> d!67533 m!311533))

(declare-fun m!311535 () Bool)

(assert (=> b!299010 m!311535))

(assert (=> b!298843 d!67533))

(assert (=> d!67475 d!67511))

(assert (=> d!67485 d!67511))

(declare-fun b!299011 () Bool)

(declare-fun lt!148696 () SeekEntryResult!2267)

(assert (=> b!299011 (and (bvsge (index!11243 lt!148696) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148696) (size!7505 a!3312)))))

(declare-fun res!157664 () Bool)

(assert (=> b!299011 (= res!157664 (= (select (arr!7153 a!3312) (index!11243 lt!148696)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188881 () Bool)

(assert (=> b!299011 (=> res!157664 e!188881)))

(declare-fun b!299012 () Bool)

(assert (=> b!299012 (and (bvsge (index!11243 lt!148696) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148696) (size!7505 a!3312)))))

(declare-fun res!157663 () Bool)

(assert (=> b!299012 (= res!157663 (= (select (arr!7153 a!3312) (index!11243 lt!148696)) k0!2524))))

(assert (=> b!299012 (=> res!157663 e!188881)))

(declare-fun e!188878 () Bool)

(assert (=> b!299012 (= e!188878 e!188881)))

(declare-fun b!299013 () Bool)

(declare-fun e!188880 () SeekEntryResult!2267)

(assert (=> b!299013 (= e!188880 (Intermediate!2267 false (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299014 () Bool)

(declare-fun e!188879 () Bool)

(assert (=> b!299014 (= e!188879 e!188878)))

(declare-fun res!157662 () Bool)

(assert (=> b!299014 (= res!157662 (and ((_ is Intermediate!2267) lt!148696) (not (undefined!3079 lt!148696)) (bvslt (x!29583 lt!148696) #b01111111111111111111111111111110) (bvsge (x!29583 lt!148696) #b00000000000000000000000000000000) (bvsge (x!29583 lt!148696) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299014 (=> (not res!157662) (not e!188878))))

(declare-fun b!299015 () Bool)

(assert (=> b!299015 (= e!188879 (bvsge (x!29583 lt!148696) #b01111111111111111111111111111110))))

(declare-fun b!299016 () Bool)

(declare-fun e!188882 () SeekEntryResult!2267)

(assert (=> b!299016 (= e!188882 (Intermediate!2267 true (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299017 () Bool)

(assert (=> b!299017 (= e!188882 e!188880)))

(declare-fun c!48264 () Bool)

(declare-fun lt!148695 () (_ BitVec 64))

(assert (=> b!299017 (= c!48264 (or (= lt!148695 k0!2524) (= (bvadd lt!148695 lt!148695) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67535 () Bool)

(assert (=> d!67535 e!188879))

(declare-fun c!48263 () Bool)

(assert (=> d!67535 (= c!48263 (and ((_ is Intermediate!2267) lt!148696) (undefined!3079 lt!148696)))))

(assert (=> d!67535 (= lt!148696 e!188882)))

(declare-fun c!48265 () Bool)

(assert (=> d!67535 (= c!48265 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!67535 (= lt!148695 (select (arr!7153 a!3312) (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809)))))

(assert (=> d!67535 (validMask!0 mask!3809)))

(assert (=> d!67535 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809) lt!148696)))

(declare-fun b!299018 () Bool)

(assert (=> b!299018 (and (bvsge (index!11243 lt!148696) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148696) (size!7505 a!3312)))))

(assert (=> b!299018 (= e!188881 (= (select (arr!7153 a!3312) (index!11243 lt!148696)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299019 () Bool)

(assert (=> b!299019 (= e!188880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67535 c!48265) b!299016))

(assert (= (and d!67535 (not c!48265)) b!299017))

(assert (= (and b!299017 c!48264) b!299013))

(assert (= (and b!299017 (not c!48264)) b!299019))

(assert (= (and d!67535 c!48263) b!299015))

(assert (= (and d!67535 (not c!48263)) b!299014))

(assert (= (and b!299014 res!157662) b!299012))

(assert (= (and b!299012 (not res!157663)) b!299011))

(assert (= (and b!299011 (not res!157664)) b!299018))

(assert (=> b!299019 m!311419))

(declare-fun m!311537 () Bool)

(assert (=> b!299019 m!311537))

(assert (=> b!299019 m!311537))

(declare-fun m!311539 () Bool)

(assert (=> b!299019 m!311539))

(declare-fun m!311541 () Bool)

(assert (=> b!299018 m!311541))

(assert (=> d!67535 m!311419))

(declare-fun m!311543 () Bool)

(assert (=> d!67535 m!311543))

(assert (=> d!67535 m!311343))

(assert (=> b!299011 m!311541))

(assert (=> b!299012 m!311541))

(assert (=> b!298837 d!67535))

(declare-fun d!67537 () Bool)

(declare-fun lt!148699 () (_ BitVec 32))

(assert (=> d!67537 (and (bvsge lt!148699 #b00000000000000000000000000000000) (bvslt lt!148699 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67537 (= lt!148699 (choose!52 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809))))

(assert (=> d!67537 (validMask!0 mask!3809)))

(assert (=> d!67537 (= (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) lt!148699)))

(declare-fun bs!10564 () Bool)

(assert (= bs!10564 d!67537))

(declare-fun m!311545 () Bool)

(assert (=> bs!10564 m!311545))

(assert (=> bs!10564 m!311343))

(assert (=> b!298837 d!67537))

(declare-fun d!67539 () Bool)

(assert (=> d!67539 (arrayContainsKey!0 a!3312 lt!148655 #b00000000000000000000000000000000)))

(declare-fun lt!148702 () Unit!9273)

(declare-fun choose!13 (array!15102 (_ BitVec 64) (_ BitVec 32)) Unit!9273)

(assert (=> d!67539 (= lt!148702 (choose!13 a!3312 lt!148655 #b00000000000000000000000000000000))))

(assert (=> d!67539 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!67539 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148655 #b00000000000000000000000000000000) lt!148702)))

(declare-fun bs!10565 () Bool)

(assert (= bs!10565 d!67539))

(assert (=> bs!10565 m!311477))

(declare-fun m!311547 () Bool)

(assert (=> bs!10565 m!311547))

(assert (=> b!298908 d!67539))

(declare-fun d!67541 () Bool)

(declare-fun res!157665 () Bool)

(declare-fun e!188883 () Bool)

(assert (=> d!67541 (=> res!157665 e!188883)))

(assert (=> d!67541 (= res!157665 (= (select (arr!7153 a!3312) #b00000000000000000000000000000000) lt!148655))))

(assert (=> d!67541 (= (arrayContainsKey!0 a!3312 lt!148655 #b00000000000000000000000000000000) e!188883)))

(declare-fun b!299020 () Bool)

(declare-fun e!188884 () Bool)

(assert (=> b!299020 (= e!188883 e!188884)))

(declare-fun res!157666 () Bool)

(assert (=> b!299020 (=> (not res!157666) (not e!188884))))

(assert (=> b!299020 (= res!157666 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7505 a!3312)))))

(declare-fun b!299021 () Bool)

(assert (=> b!299021 (= e!188884 (arrayContainsKey!0 a!3312 lt!148655 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67541 (not res!157665)) b!299020))

(assert (= (and b!299020 res!157666) b!299021))

(assert (=> d!67541 m!311433))

(declare-fun m!311549 () Bool)

(assert (=> b!299021 m!311549))

(assert (=> b!298908 d!67541))

(declare-fun b!299022 () Bool)

(declare-fun e!188885 () SeekEntryResult!2267)

(declare-fun lt!148703 () SeekEntryResult!2267)

(assert (=> b!299022 (= e!188885 (MissingZero!2267 (index!11243 lt!148703)))))

(declare-fun d!67543 () Bool)

(declare-fun lt!148705 () SeekEntryResult!2267)

(assert (=> d!67543 (and (or ((_ is Undefined!2267) lt!148705) (not ((_ is Found!2267) lt!148705)) (and (bvsge (index!11242 lt!148705) #b00000000000000000000000000000000) (bvslt (index!11242 lt!148705) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148705) ((_ is Found!2267) lt!148705) (not ((_ is MissingZero!2267) lt!148705)) (and (bvsge (index!11241 lt!148705) #b00000000000000000000000000000000) (bvslt (index!11241 lt!148705) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148705) ((_ is Found!2267) lt!148705) ((_ is MissingZero!2267) lt!148705) (not ((_ is MissingVacant!2267) lt!148705)) (and (bvsge (index!11244 lt!148705) #b00000000000000000000000000000000) (bvslt (index!11244 lt!148705) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148705) (ite ((_ is Found!2267) lt!148705) (= (select (arr!7153 a!3312) (index!11242 lt!148705)) (select (arr!7153 a!3312) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!2267) lt!148705) (= (select (arr!7153 a!3312) (index!11241 lt!148705)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2267) lt!148705) (= (select (arr!7153 a!3312) (index!11244 lt!148705)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188887 () SeekEntryResult!2267)

(assert (=> d!67543 (= lt!148705 e!188887)))

(declare-fun c!48268 () Bool)

(assert (=> d!67543 (= c!48268 (and ((_ is Intermediate!2267) lt!148703) (undefined!3079 lt!148703)))))

(assert (=> d!67543 (= lt!148703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7153 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!67543 (validMask!0 mask!3809)))

(assert (=> d!67543 (= (seekEntryOrOpen!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!148705)))

(declare-fun b!299023 () Bool)

(assert (=> b!299023 (= e!188887 Undefined!2267)))

(declare-fun b!299024 () Bool)

(declare-fun e!188886 () SeekEntryResult!2267)

(assert (=> b!299024 (= e!188886 (Found!2267 (index!11243 lt!148703)))))

(declare-fun b!299025 () Bool)

(assert (=> b!299025 (= e!188887 e!188886)))

(declare-fun lt!148704 () (_ BitVec 64))

(assert (=> b!299025 (= lt!148704 (select (arr!7153 a!3312) (index!11243 lt!148703)))))

(declare-fun c!48267 () Bool)

(assert (=> b!299025 (= c!48267 (= lt!148704 (select (arr!7153 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299026 () Bool)

(declare-fun c!48266 () Bool)

(assert (=> b!299026 (= c!48266 (= lt!148704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299026 (= e!188886 e!188885)))

(declare-fun b!299027 () Bool)

(assert (=> b!299027 (= e!188885 (seekKeyOrZeroReturnVacant!0 (x!29583 lt!148703) (index!11243 lt!148703) (index!11243 lt!148703) (select (arr!7153 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (= (and d!67543 c!48268) b!299023))

(assert (= (and d!67543 (not c!48268)) b!299025))

(assert (= (and b!299025 c!48267) b!299024))

(assert (= (and b!299025 (not c!48267)) b!299026))

(assert (= (and b!299026 c!48266) b!299022))

(assert (= (and b!299026 (not c!48266)) b!299027))

(declare-fun m!311551 () Bool)

(assert (=> d!67543 m!311551))

(declare-fun m!311553 () Bool)

(assert (=> d!67543 m!311553))

(assert (=> d!67543 m!311343))

(declare-fun m!311555 () Bool)

(assert (=> d!67543 m!311555))

(declare-fun m!311557 () Bool)

(assert (=> d!67543 m!311557))

(assert (=> d!67543 m!311433))

(declare-fun m!311559 () Bool)

(assert (=> d!67543 m!311559))

(assert (=> d!67543 m!311433))

(assert (=> d!67543 m!311557))

(declare-fun m!311561 () Bool)

(assert (=> b!299025 m!311561))

(assert (=> b!299027 m!311433))

(declare-fun m!311563 () Bool)

(assert (=> b!299027 m!311563))

(assert (=> b!298908 d!67543))

(declare-fun b!299028 () Bool)

(declare-fun lt!148707 () SeekEntryResult!2267)

(assert (=> b!299028 (and (bvsge (index!11243 lt!148707) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148707) (size!7505 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)))))))

(declare-fun res!157669 () Bool)

(assert (=> b!299028 (= res!157669 (= (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (index!11243 lt!148707)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188891 () Bool)

(assert (=> b!299028 (=> res!157669 e!188891)))

(declare-fun b!299029 () Bool)

(assert (=> b!299029 (and (bvsge (index!11243 lt!148707) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148707) (size!7505 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)))))))

(declare-fun res!157668 () Bool)

(assert (=> b!299029 (= res!157668 (= (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (index!11243 lt!148707)) k0!2524))))

(assert (=> b!299029 (=> res!157668 e!188891)))

(declare-fun e!188888 () Bool)

(assert (=> b!299029 (= e!188888 e!188891)))

(declare-fun b!299030 () Bool)

(declare-fun e!188890 () SeekEntryResult!2267)

(assert (=> b!299030 (= e!188890 (Intermediate!2267 false (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299031 () Bool)

(declare-fun e!188889 () Bool)

(assert (=> b!299031 (= e!188889 e!188888)))

(declare-fun res!157667 () Bool)

(assert (=> b!299031 (= res!157667 (and ((_ is Intermediate!2267) lt!148707) (not (undefined!3079 lt!148707)) (bvslt (x!29583 lt!148707) #b01111111111111111111111111111110) (bvsge (x!29583 lt!148707) #b00000000000000000000000000000000) (bvsge (x!29583 lt!148707) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299031 (=> (not res!157667) (not e!188888))))

(declare-fun b!299032 () Bool)

(assert (=> b!299032 (= e!188889 (bvsge (x!29583 lt!148707) #b01111111111111111111111111111110))))

(declare-fun b!299033 () Bool)

(declare-fun e!188892 () SeekEntryResult!2267)

(assert (=> b!299033 (= e!188892 (Intermediate!2267 true (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299034 () Bool)

(assert (=> b!299034 (= e!188892 e!188890)))

(declare-fun c!48270 () Bool)

(declare-fun lt!148706 () (_ BitVec 64))

(assert (=> b!299034 (= c!48270 (or (= lt!148706 k0!2524) (= (bvadd lt!148706 lt!148706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67545 () Bool)

(assert (=> d!67545 e!188889))

(declare-fun c!48269 () Bool)

(assert (=> d!67545 (= c!48269 (and ((_ is Intermediate!2267) lt!148707) (undefined!3079 lt!148707)))))

(assert (=> d!67545 (= lt!148707 e!188892)))

(declare-fun c!48271 () Bool)

(assert (=> d!67545 (= c!48271 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!67545 (= lt!148706 (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809)))))

(assert (=> d!67545 (validMask!0 mask!3809)))

(assert (=> d!67545 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)) mask!3809) lt!148707)))

(declare-fun b!299035 () Bool)

(assert (=> b!299035 (and (bvsge (index!11243 lt!148707) #b00000000000000000000000000000000) (bvslt (index!11243 lt!148707) (size!7505 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)))))))

(assert (=> b!299035 (= e!188891 (= (select (arr!7153 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312))) (index!11243 lt!148707)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299036 () Bool)

(assert (=> b!299036 (= e!188890 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15103 (store (arr!7153 a!3312) i!1256 k0!2524) (size!7505 a!3312)) mask!3809))))

(assert (= (and d!67545 c!48271) b!299033))

(assert (= (and d!67545 (not c!48271)) b!299034))

(assert (= (and b!299034 c!48270) b!299030))

(assert (= (and b!299034 (not c!48270)) b!299036))

(assert (= (and d!67545 c!48269) b!299032))

(assert (= (and d!67545 (not c!48269)) b!299031))

(assert (= (and b!299031 res!157667) b!299029))

(assert (= (and b!299029 (not res!157668)) b!299028))

(assert (= (and b!299028 (not res!157669)) b!299035))

(assert (=> b!299036 m!311419))

(assert (=> b!299036 m!311537))

(assert (=> b!299036 m!311537))

(declare-fun m!311565 () Bool)

(assert (=> b!299036 m!311565))

(declare-fun m!311567 () Bool)

(assert (=> b!299035 m!311567))

(assert (=> d!67545 m!311419))

(declare-fun m!311569 () Bool)

(assert (=> d!67545 m!311569))

(assert (=> d!67545 m!311343))

(assert (=> b!299028 m!311567))

(assert (=> b!299029 m!311567))

(assert (=> b!298828 d!67545))

(assert (=> b!298828 d!67537))

(declare-fun b!299049 () Bool)

(declare-fun e!188901 () SeekEntryResult!2267)

(assert (=> b!299049 (= e!188901 Undefined!2267)))

(declare-fun b!299050 () Bool)

(declare-fun e!188899 () SeekEntryResult!2267)

(assert (=> b!299050 (= e!188901 e!188899)))

(declare-fun c!48280 () Bool)

(declare-fun lt!148713 () (_ BitVec 64))

(assert (=> b!299050 (= c!48280 (= lt!148713 k0!2524))))

(declare-fun b!299051 () Bool)

(declare-fun e!188900 () SeekEntryResult!2267)

(assert (=> b!299051 (= e!188900 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29583 lt!148641) #b00000000000000000000000000000001) (nextIndex!0 (index!11243 lt!148641) (bvadd (x!29583 lt!148641) #b00000000000000000000000000000001) mask!3809) (index!11243 lt!148641) k0!2524 a!3312 mask!3809))))

(declare-fun b!299052 () Bool)

(assert (=> b!299052 (= e!188900 (MissingVacant!2267 (index!11243 lt!148641)))))

(declare-fun lt!148712 () SeekEntryResult!2267)

(declare-fun d!67547 () Bool)

(assert (=> d!67547 (and (or ((_ is Undefined!2267) lt!148712) (not ((_ is Found!2267) lt!148712)) (and (bvsge (index!11242 lt!148712) #b00000000000000000000000000000000) (bvslt (index!11242 lt!148712) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148712) ((_ is Found!2267) lt!148712) (not ((_ is MissingVacant!2267) lt!148712)) (not (= (index!11244 lt!148712) (index!11243 lt!148641))) (and (bvsge (index!11244 lt!148712) #b00000000000000000000000000000000) (bvslt (index!11244 lt!148712) (size!7505 a!3312)))) (or ((_ is Undefined!2267) lt!148712) (ite ((_ is Found!2267) lt!148712) (= (select (arr!7153 a!3312) (index!11242 lt!148712)) k0!2524) (and ((_ is MissingVacant!2267) lt!148712) (= (index!11244 lt!148712) (index!11243 lt!148641)) (= (select (arr!7153 a!3312) (index!11244 lt!148712)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!67547 (= lt!148712 e!188901)))

(declare-fun c!48279 () Bool)

(assert (=> d!67547 (= c!48279 (bvsge (x!29583 lt!148641) #b01111111111111111111111111111110))))

(assert (=> d!67547 (= lt!148713 (select (arr!7153 a!3312) (index!11243 lt!148641)))))

(assert (=> d!67547 (validMask!0 mask!3809)))

(assert (=> d!67547 (= (seekKeyOrZeroReturnVacant!0 (x!29583 lt!148641) (index!11243 lt!148641) (index!11243 lt!148641) k0!2524 a!3312 mask!3809) lt!148712)))

(declare-fun b!299053 () Bool)

(declare-fun c!48278 () Bool)

(assert (=> b!299053 (= c!48278 (= lt!148713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299053 (= e!188899 e!188900)))

(declare-fun b!299054 () Bool)

(assert (=> b!299054 (= e!188899 (Found!2267 (index!11243 lt!148641)))))

(assert (= (and d!67547 c!48279) b!299049))

(assert (= (and d!67547 (not c!48279)) b!299050))

(assert (= (and b!299050 c!48280) b!299054))

(assert (= (and b!299050 (not c!48280)) b!299053))

(assert (= (and b!299053 c!48278) b!299052))

(assert (= (and b!299053 (not c!48278)) b!299051))

(declare-fun m!311571 () Bool)

(assert (=> b!299051 m!311571))

(assert (=> b!299051 m!311571))

(declare-fun m!311573 () Bool)

(assert (=> b!299051 m!311573))

(declare-fun m!311575 () Bool)

(assert (=> d!67547 m!311575))

(declare-fun m!311577 () Bool)

(assert (=> d!67547 m!311577))

(assert (=> d!67547 m!311457))

(assert (=> d!67547 m!311343))

(assert (=> b!298889 d!67547))

(declare-fun b!299055 () Bool)

(declare-fun e!188902 () Bool)

(declare-fun call!25787 () Bool)

(assert (=> b!299055 (= e!188902 call!25787)))

(declare-fun b!299056 () Bool)

(declare-fun e!188903 () Bool)

(assert (=> b!299056 (= e!188903 call!25787)))

(declare-fun b!299057 () Bool)

(assert (=> b!299057 (= e!188903 e!188902)))

(declare-fun lt!148716 () (_ BitVec 64))

(assert (=> b!299057 (= lt!148716 (select (arr!7153 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!148714 () Unit!9273)

(assert (=> b!299057 (= lt!148714 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148716 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!299057 (arrayContainsKey!0 a!3312 lt!148716 #b00000000000000000000000000000000)))

(declare-fun lt!148715 () Unit!9273)

(assert (=> b!299057 (= lt!148715 lt!148714)))

(declare-fun res!157670 () Bool)

(assert (=> b!299057 (= res!157670 (= (seekEntryOrOpen!0 (select (arr!7153 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299057 (=> (not res!157670) (not e!188902))))

(declare-fun bm!25784 () Bool)

(assert (=> bm!25784 (= call!25787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299058 () Bool)

(declare-fun e!188904 () Bool)

(assert (=> b!299058 (= e!188904 e!188903)))

(declare-fun c!48281 () Bool)

(assert (=> b!299058 (= c!48281 (validKeyInArray!0 (select (arr!7153 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!67549 () Bool)

(declare-fun res!157671 () Bool)

(assert (=> d!67549 (=> res!157671 e!188904)))

(assert (=> d!67549 (= res!157671 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7505 a!3312)))))

(assert (=> d!67549 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!188904)))

(assert (= (and d!67549 (not res!157671)) b!299058))

(assert (= (and b!299058 c!48281) b!299057))

(assert (= (and b!299058 (not c!48281)) b!299056))

(assert (= (and b!299057 res!157670) b!299055))

(assert (= (or b!299055 b!299056) bm!25784))

(assert (=> b!299057 m!311533))

(declare-fun m!311579 () Bool)

(assert (=> b!299057 m!311579))

(declare-fun m!311581 () Bool)

(assert (=> b!299057 m!311581))

(assert (=> b!299057 m!311533))

(declare-fun m!311583 () Bool)

(assert (=> b!299057 m!311583))

(declare-fun m!311585 () Bool)

(assert (=> bm!25784 m!311585))

(assert (=> b!299058 m!311533))

(assert (=> b!299058 m!311533))

(declare-fun m!311587 () Bool)

(assert (=> b!299058 m!311587))

(assert (=> bm!25783 d!67549))

(check-sat (not b!299057) (not d!67537) (not b!299036) (not bm!25784) (not d!67531) (not b!299021) (not d!67547) (not d!67543) (not b!299058) (not d!67545) (not b!299010) (not d!67539) (not b!299008) (not d!67535) (not b!299051) (not b!299027) (not b!299019))
(check-sat)
