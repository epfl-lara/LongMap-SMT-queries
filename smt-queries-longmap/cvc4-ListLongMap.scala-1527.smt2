; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28792 () Bool)

(assert start!28792)

(declare-fun b!293721 () Bool)

(declare-fun res!154497 () Bool)

(declare-fun e!185712 () Bool)

(assert (=> b!293721 (=> (not res!154497) (not e!185712))))

(declare-datatypes ((array!14881 0))(
  ( (array!14882 (arr!7060 (Array (_ BitVec 32) (_ BitVec 64))) (size!7412 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14881)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293721 (= res!154497 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293722 () Bool)

(declare-fun res!154498 () Bool)

(declare-fun e!185713 () Bool)

(assert (=> b!293722 (=> (not res!154498) (not e!185713))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14881 (_ BitVec 32)) Bool)

(assert (=> b!293722 (= res!154498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293723 () Bool)

(declare-fun res!154499 () Bool)

(assert (=> b!293723 (=> (not res!154499) (not e!185712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293723 (= res!154499 (validKeyInArray!0 k!2524))))

(declare-fun b!293724 () Bool)

(assert (=> b!293724 (= e!185712 e!185713)))

(declare-fun res!154496 () Bool)

(assert (=> b!293724 (=> (not res!154496) (not e!185713))))

(declare-datatypes ((SeekEntryResult!2209 0))(
  ( (MissingZero!2209 (index!11006 (_ BitVec 32))) (Found!2209 (index!11007 (_ BitVec 32))) (Intermediate!2209 (undefined!3021 Bool) (index!11008 (_ BitVec 32)) (x!29188 (_ BitVec 32))) (Undefined!2209) (MissingVacant!2209 (index!11009 (_ BitVec 32))) )
))
(declare-fun lt!145612 () SeekEntryResult!2209)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145609 () Bool)

(assert (=> b!293724 (= res!154496 (or lt!145609 (= lt!145612 (MissingVacant!2209 i!1256))))))

(assert (=> b!293724 (= lt!145609 (= lt!145612 (MissingZero!2209 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14881 (_ BitVec 32)) SeekEntryResult!2209)

(assert (=> b!293724 (= lt!145612 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!293725 () Bool)

(declare-fun res!154495 () Bool)

(assert (=> b!293725 (=> (not res!154495) (not e!185712))))

(assert (=> b!293725 (= res!154495 (and (= (size!7412 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7412 a!3312))))))

(declare-fun b!293726 () Bool)

(declare-fun lt!145608 () SeekEntryResult!2209)

(assert (=> b!293726 (= e!185713 (and lt!145609 (let ((bdg!6223 (not (is-Intermediate!2209 lt!145608)))) (and (or bdg!6223 (not (undefined!3021 lt!145608))) (not bdg!6223) (= (select (arr!7060 a!3312) (index!11008 lt!145608)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!145611 () SeekEntryResult!2209)

(declare-fun lt!145610 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14881 (_ BitVec 32)) SeekEntryResult!2209)

(assert (=> b!293726 (= lt!145611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145610 k!2524 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)) mask!3809))))

(assert (=> b!293726 (= lt!145608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145610 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293726 (= lt!145610 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!154500 () Bool)

(assert (=> start!28792 (=> (not res!154500) (not e!185712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28792 (= res!154500 (validMask!0 mask!3809))))

(assert (=> start!28792 e!185712))

(assert (=> start!28792 true))

(declare-fun array_inv!5023 (array!14881) Bool)

(assert (=> start!28792 (array_inv!5023 a!3312)))

(assert (= (and start!28792 res!154500) b!293725))

(assert (= (and b!293725 res!154495) b!293723))

(assert (= (and b!293723 res!154499) b!293721))

(assert (= (and b!293721 res!154497) b!293724))

(assert (= (and b!293724 res!154496) b!293722))

(assert (= (and b!293722 res!154498) b!293726))

(declare-fun m!307349 () Bool)

(assert (=> b!293724 m!307349))

(declare-fun m!307351 () Bool)

(assert (=> b!293722 m!307351))

(declare-fun m!307353 () Bool)

(assert (=> b!293721 m!307353))

(declare-fun m!307355 () Bool)

(assert (=> b!293726 m!307355))

(declare-fun m!307357 () Bool)

(assert (=> b!293726 m!307357))

(declare-fun m!307359 () Bool)

(assert (=> b!293726 m!307359))

(declare-fun m!307361 () Bool)

(assert (=> b!293726 m!307361))

(declare-fun m!307363 () Bool)

(assert (=> b!293726 m!307363))

(declare-fun m!307365 () Bool)

(assert (=> start!28792 m!307365))

(declare-fun m!307367 () Bool)

(assert (=> start!28792 m!307367))

(declare-fun m!307369 () Bool)

(assert (=> b!293723 m!307369))

(push 1)

(assert (not b!293722))

(assert (not b!293724))

(assert (not start!28792))

(assert (not b!293723))

(assert (not b!293726))

(assert (not b!293721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66633 () Bool)

(assert (=> d!66633 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293723 d!66633))

(declare-fun d!66637 () Bool)

(assert (=> d!66637 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28792 d!66637))

(declare-fun d!66641 () Bool)

(assert (=> d!66641 (= (array_inv!5023 a!3312) (bvsge (size!7412 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28792 d!66641))

(declare-fun b!293805 () Bool)

(declare-fun e!185766 () SeekEntryResult!2209)

(declare-fun lt!145652 () SeekEntryResult!2209)

(assert (=> b!293805 (= e!185766 (MissingZero!2209 (index!11008 lt!145652)))))

(declare-fun b!293806 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14881 (_ BitVec 32)) SeekEntryResult!2209)

(assert (=> b!293806 (= e!185766 (seekKeyOrZeroReturnVacant!0 (x!29188 lt!145652) (index!11008 lt!145652) (index!11008 lt!145652) k!2524 a!3312 mask!3809))))

(declare-fun b!293807 () Bool)

(declare-fun e!185767 () SeekEntryResult!2209)

(assert (=> b!293807 (= e!185767 Undefined!2209)))

(declare-fun d!66643 () Bool)

(declare-fun lt!145651 () SeekEntryResult!2209)

(assert (=> d!66643 (and (or (is-Undefined!2209 lt!145651) (not (is-Found!2209 lt!145651)) (and (bvsge (index!11007 lt!145651) #b00000000000000000000000000000000) (bvslt (index!11007 lt!145651) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145651) (is-Found!2209 lt!145651) (not (is-MissingZero!2209 lt!145651)) (and (bvsge (index!11006 lt!145651) #b00000000000000000000000000000000) (bvslt (index!11006 lt!145651) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145651) (is-Found!2209 lt!145651) (is-MissingZero!2209 lt!145651) (not (is-MissingVacant!2209 lt!145651)) (and (bvsge (index!11009 lt!145651) #b00000000000000000000000000000000) (bvslt (index!11009 lt!145651) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145651) (ite (is-Found!2209 lt!145651) (= (select (arr!7060 a!3312) (index!11007 lt!145651)) k!2524) (ite (is-MissingZero!2209 lt!145651) (= (select (arr!7060 a!3312) (index!11006 lt!145651)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2209 lt!145651) (= (select (arr!7060 a!3312) (index!11009 lt!145651)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66643 (= lt!145651 e!185767)))

(declare-fun c!47207 () Bool)

(assert (=> d!66643 (= c!47207 (and (is-Intermediate!2209 lt!145652) (undefined!3021 lt!145652)))))

(assert (=> d!66643 (= lt!145652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66643 (validMask!0 mask!3809)))

(assert (=> d!66643 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145651)))

(declare-fun b!293808 () Bool)

(declare-fun c!47208 () Bool)

(declare-fun lt!145653 () (_ BitVec 64))

(assert (=> b!293808 (= c!47208 (= lt!145653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185765 () SeekEntryResult!2209)

(assert (=> b!293808 (= e!185765 e!185766)))

(declare-fun b!293809 () Bool)

(assert (=> b!293809 (= e!185765 (Found!2209 (index!11008 lt!145652)))))

(declare-fun b!293810 () Bool)

(assert (=> b!293810 (= e!185767 e!185765)))

(assert (=> b!293810 (= lt!145653 (select (arr!7060 a!3312) (index!11008 lt!145652)))))

(declare-fun c!47206 () Bool)

(assert (=> b!293810 (= c!47206 (= lt!145653 k!2524))))

(assert (= (and d!66643 c!47207) b!293807))

(assert (= (and d!66643 (not c!47207)) b!293810))

(assert (= (and b!293810 c!47206) b!293809))

(assert (= (and b!293810 (not c!47206)) b!293808))

(assert (= (and b!293808 c!47208) b!293805))

(assert (= (and b!293808 (not c!47208)) b!293806))

(declare-fun m!307411 () Bool)

(assert (=> b!293806 m!307411))

(assert (=> d!66643 m!307363))

(declare-fun m!307413 () Bool)

(assert (=> d!66643 m!307413))

(assert (=> d!66643 m!307365))

(assert (=> d!66643 m!307363))

(declare-fun m!307415 () Bool)

(assert (=> d!66643 m!307415))

(declare-fun m!307417 () Bool)

(assert (=> d!66643 m!307417))

(declare-fun m!307419 () Bool)

(assert (=> d!66643 m!307419))

(declare-fun m!307421 () Bool)

(assert (=> b!293810 m!307421))

(assert (=> b!293724 d!66643))

(declare-fun b!293871 () Bool)

(declare-fun e!185802 () SeekEntryResult!2209)

(declare-fun e!185805 () SeekEntryResult!2209)

(assert (=> b!293871 (= e!185802 e!185805)))

(declare-fun c!47233 () Bool)

(declare-fun lt!145676 () (_ BitVec 64))

(assert (=> b!293871 (= c!47233 (or (= lt!145676 k!2524) (= (bvadd lt!145676 lt!145676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293872 () Bool)

(declare-fun lt!145677 () SeekEntryResult!2209)

(assert (=> b!293872 (and (bvsge (index!11008 lt!145677) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145677) (size!7412 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)))))))

(declare-fun res!154546 () Bool)

(assert (=> b!293872 (= res!154546 (= (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (index!11008 lt!145677)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185806 () Bool)

(assert (=> b!293872 (=> res!154546 e!185806)))

(declare-fun d!66659 () Bool)

(declare-fun e!185804 () Bool)

(assert (=> d!66659 e!185804))

(declare-fun c!47234 () Bool)

(assert (=> d!66659 (= c!47234 (and (is-Intermediate!2209 lt!145677) (undefined!3021 lt!145677)))))

(assert (=> d!66659 (= lt!145677 e!185802)))

(declare-fun c!47235 () Bool)

(assert (=> d!66659 (= c!47235 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66659 (= lt!145676 (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) lt!145610))))

(assert (=> d!66659 (validMask!0 mask!3809)))

(assert (=> d!66659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145610 k!2524 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)) mask!3809) lt!145677)))

(declare-fun b!293873 () Bool)

(assert (=> b!293873 (and (bvsge (index!11008 lt!145677) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145677) (size!7412 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)))))))

(declare-fun res!154545 () Bool)

(assert (=> b!293873 (= res!154545 (= (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (index!11008 lt!145677)) k!2524))))

(assert (=> b!293873 (=> res!154545 e!185806)))

(declare-fun e!185803 () Bool)

(assert (=> b!293873 (= e!185803 e!185806)))

(declare-fun b!293874 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293874 (= e!185805 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)) mask!3809))))

(declare-fun b!293875 () Bool)

(assert (=> b!293875 (and (bvsge (index!11008 lt!145677) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145677) (size!7412 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)))))))

(assert (=> b!293875 (= e!185806 (= (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (index!11008 lt!145677)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293876 () Bool)

(assert (=> b!293876 (= e!185802 (Intermediate!2209 true lt!145610 #b00000000000000000000000000000000))))

(declare-fun b!293877 () Bool)

(assert (=> b!293877 (= e!185804 e!185803)))

(declare-fun res!154544 () Bool)

(assert (=> b!293877 (= res!154544 (and (is-Intermediate!2209 lt!145677) (not (undefined!3021 lt!145677)) (bvslt (x!29188 lt!145677) #b01111111111111111111111111111110) (bvsge (x!29188 lt!145677) #b00000000000000000000000000000000) (bvsge (x!29188 lt!145677) #b00000000000000000000000000000000)))))

(assert (=> b!293877 (=> (not res!154544) (not e!185803))))

(declare-fun b!293878 () Bool)

(assert (=> b!293878 (= e!185804 (bvsge (x!29188 lt!145677) #b01111111111111111111111111111110))))

(declare-fun b!293879 () Bool)

(assert (=> b!293879 (= e!185805 (Intermediate!2209 false lt!145610 #b00000000000000000000000000000000))))

(assert (= (and d!66659 c!47235) b!293876))

(assert (= (and d!66659 (not c!47235)) b!293871))

(assert (= (and b!293871 c!47233) b!293879))

(assert (= (and b!293871 (not c!47233)) b!293874))

(assert (= (and d!66659 c!47234) b!293878))

(assert (= (and d!66659 (not c!47234)) b!293877))

(assert (= (and b!293877 res!154544) b!293873))

(assert (= (and b!293873 (not res!154545)) b!293872))

(assert (= (and b!293872 (not res!154546)) b!293875))

(declare-fun m!307449 () Bool)

(assert (=> b!293872 m!307449))

(assert (=> b!293875 m!307449))

(assert (=> b!293873 m!307449))

(declare-fun m!307451 () Bool)

(assert (=> b!293874 m!307451))

(assert (=> b!293874 m!307451))

(declare-fun m!307453 () Bool)

(assert (=> b!293874 m!307453))

(declare-fun m!307455 () Bool)

(assert (=> d!66659 m!307455))

(assert (=> d!66659 m!307365))

(assert (=> b!293726 d!66659))

(declare-fun b!293880 () Bool)

(declare-fun e!185807 () SeekEntryResult!2209)

(declare-fun e!185810 () SeekEntryResult!2209)

(assert (=> b!293880 (= e!185807 e!185810)))

(declare-fun c!47236 () Bool)

(declare-fun lt!145678 () (_ BitVec 64))

(assert (=> b!293880 (= c!47236 (or (= lt!145678 k!2524) (= (bvadd lt!145678 lt!145678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293881 () Bool)

(declare-fun lt!145679 () SeekEntryResult!2209)

(assert (=> b!293881 (and (bvsge (index!11008 lt!145679) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145679) (size!7412 a!3312)))))

(declare-fun res!154549 () Bool)

(assert (=> b!293881 (= res!154549 (= (select (arr!7060 a!3312) (index!11008 lt!145679)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185811 () Bool)

(assert (=> b!293881 (=> res!154549 e!185811)))

(declare-fun d!66665 () Bool)

(declare-fun e!185809 () Bool)

(assert (=> d!66665 e!185809))

(declare-fun c!47237 () Bool)

(assert (=> d!66665 (= c!47237 (and (is-Intermediate!2209 lt!145679) (undefined!3021 lt!145679)))))

(assert (=> d!66665 (= lt!145679 e!185807)))

(declare-fun c!47238 () Bool)

(assert (=> d!66665 (= c!47238 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66665 (= lt!145678 (select (arr!7060 a!3312) lt!145610))))

(assert (=> d!66665 (validMask!0 mask!3809)))

(assert (=> d!66665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145610 k!2524 a!3312 mask!3809) lt!145679)))

(declare-fun b!293882 () Bool)

(assert (=> b!293882 (and (bvsge (index!11008 lt!145679) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145679) (size!7412 a!3312)))))

(declare-fun res!154548 () Bool)

(assert (=> b!293882 (= res!154548 (= (select (arr!7060 a!3312) (index!11008 lt!145679)) k!2524))))

(assert (=> b!293882 (=> res!154548 e!185811)))

(declare-fun e!185808 () Bool)

(assert (=> b!293882 (= e!185808 e!185811)))

(declare-fun b!293883 () Bool)

(assert (=> b!293883 (= e!185810 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293884 () Bool)

(assert (=> b!293884 (and (bvsge (index!11008 lt!145679) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145679) (size!7412 a!3312)))))

(assert (=> b!293884 (= e!185811 (= (select (arr!7060 a!3312) (index!11008 lt!145679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293885 () Bool)

(assert (=> b!293885 (= e!185807 (Intermediate!2209 true lt!145610 #b00000000000000000000000000000000))))

(declare-fun b!293886 () Bool)

(assert (=> b!293886 (= e!185809 e!185808)))

(declare-fun res!154547 () Bool)

(assert (=> b!293886 (= res!154547 (and (is-Intermediate!2209 lt!145679) (not (undefined!3021 lt!145679)) (bvslt (x!29188 lt!145679) #b01111111111111111111111111111110) (bvsge (x!29188 lt!145679) #b00000000000000000000000000000000) (bvsge (x!29188 lt!145679) #b00000000000000000000000000000000)))))

(assert (=> b!293886 (=> (not res!154547) (not e!185808))))

(declare-fun b!293887 () Bool)

(assert (=> b!293887 (= e!185809 (bvsge (x!29188 lt!145679) #b01111111111111111111111111111110))))

(declare-fun b!293888 () Bool)

(assert (=> b!293888 (= e!185810 (Intermediate!2209 false lt!145610 #b00000000000000000000000000000000))))

(assert (= (and d!66665 c!47238) b!293885))

(assert (= (and d!66665 (not c!47238)) b!293880))

(assert (= (and b!293880 c!47236) b!293888))

(assert (= (and b!293880 (not c!47236)) b!293883))

(assert (= (and d!66665 c!47237) b!293887))

(assert (= (and d!66665 (not c!47237)) b!293886))

(assert (= (and b!293886 res!154547) b!293882))

(assert (= (and b!293882 (not res!154548)) b!293881))

(assert (= (and b!293881 (not res!154549)) b!293884))

(declare-fun m!307457 () Bool)

(assert (=> b!293881 m!307457))

(assert (=> b!293884 m!307457))

(assert (=> b!293882 m!307457))

(assert (=> b!293883 m!307451))

(assert (=> b!293883 m!307451))

(declare-fun m!307459 () Bool)

(assert (=> b!293883 m!307459))

(declare-fun m!307461 () Bool)

(assert (=> d!66665 m!307461))

(assert (=> d!66665 m!307365))

(assert (=> b!293726 d!66665))

(declare-fun d!66667 () Bool)

(declare-fun lt!145689 () (_ BitVec 32))

(declare-fun lt!145688 () (_ BitVec 32))

(assert (=> d!66667 (= lt!145689 (bvmul (bvxor lt!145688 (bvlshr lt!145688 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66667 (= lt!145688 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66667 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154550 (let ((h!5275 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29192 (bvmul (bvxor h!5275 (bvlshr h!5275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29192 (bvlshr x!29192 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154550 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154550 #b00000000000000000000000000000000))))))

(assert (=> d!66667 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145689 (bvlshr lt!145689 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293726 d!66667))

(declare-fun d!66669 () Bool)

(declare-fun res!154561 () Bool)

(declare-fun e!185826 () Bool)

(assert (=> d!66669 (=> res!154561 e!185826)))

(assert (=> d!66669 (= res!154561 (= (select (arr!7060 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66669 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185826)))

(declare-fun b!293911 () Bool)

(declare-fun e!185827 () Bool)

(assert (=> b!293911 (= e!185826 e!185827)))

(declare-fun res!154562 () Bool)

(assert (=> b!293911 (=> (not res!154562) (not e!185827))))

(assert (=> b!293911 (= res!154562 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7412 a!3312)))))

(declare-fun b!293912 () Bool)

(assert (=> b!293912 (= e!185827 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66669 (not res!154561)) b!293911))

(assert (= (and b!293911 res!154562) b!293912))

(declare-fun m!307463 () Bool)

(assert (=> d!66669 m!307463))

(declare-fun m!307465 () Bool)

(assert (=> b!293912 m!307465))

(assert (=> b!293721 d!66669))

(declare-fun b!293939 () Bool)

(declare-fun e!185846 () Bool)

(declare-fun call!25687 () Bool)

(assert (=> b!293939 (= e!185846 call!25687)))

(declare-fun b!293940 () Bool)

(declare-fun e!185845 () Bool)

(assert (=> b!293940 (= e!185845 call!25687)))

(declare-fun b!293941 () Bool)

(assert (=> b!293941 (= e!185846 e!185845)))

(declare-fun lt!145706 () (_ BitVec 64))

(assert (=> b!293941 (= lt!145706 (select (arr!7060 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9194 0))(
  ( (Unit!9195) )
))
(declare-fun lt!145707 () Unit!9194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14881 (_ BitVec 64) (_ BitVec 32)) Unit!9194)

(assert (=> b!293941 (= lt!145707 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145706 #b00000000000000000000000000000000))))

(assert (=> b!293941 (arrayContainsKey!0 a!3312 lt!145706 #b00000000000000000000000000000000)))

(declare-fun lt!145708 () Unit!9194)

(assert (=> b!293941 (= lt!145708 lt!145707)))

(declare-fun res!154575 () Bool)

(assert (=> b!293941 (= res!154575 (= (seekEntryOrOpen!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2209 #b00000000000000000000000000000000)))))

(assert (=> b!293941 (=> (not res!154575) (not e!185845))))

(declare-fun b!293942 () Bool)

(declare-fun e!185844 () Bool)

(assert (=> b!293942 (= e!185844 e!185846)))

(declare-fun c!47253 () Bool)

(assert (=> b!293942 (= c!47253 (validKeyInArray!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25684 () Bool)

(assert (=> bm!25684 (= call!25687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66671 () Bool)

(declare-fun res!154574 () Bool)

(assert (=> d!66671 (=> res!154574 e!185844)))

(assert (=> d!66671 (= res!154574 (bvsge #b00000000000000000000000000000000 (size!7412 a!3312)))))

(assert (=> d!66671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185844)))

(assert (= (and d!66671 (not res!154574)) b!293942))

(assert (= (and b!293942 c!47253) b!293941))

(assert (= (and b!293942 (not c!47253)) b!293939))

(assert (= (and b!293941 res!154575) b!293940))

(assert (= (or b!293940 b!293939) bm!25684))

(assert (=> b!293941 m!307463))

(declare-fun m!307481 () Bool)

(assert (=> b!293941 m!307481))

(declare-fun m!307483 () Bool)

(assert (=> b!293941 m!307483))

(assert (=> b!293941 m!307463))

(declare-fun m!307485 () Bool)

(assert (=> b!293941 m!307485))

(assert (=> b!293942 m!307463))

(assert (=> b!293942 m!307463))

(declare-fun m!307487 () Bool)

(assert (=> b!293942 m!307487))

(declare-fun m!307489 () Bool)

(assert (=> bm!25684 m!307489))

(assert (=> b!293722 d!66671))

(push 1)

(assert (not b!293942))

(assert (not b!293883))

(assert (not b!293874))

(assert (not d!66665))

(assert (not bm!25684))

(assert (not b!293806))

(assert (not d!66643))

(assert (not d!66659))

(assert (not b!293941))

(assert (not b!293912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66687 () Bool)

(declare-fun res!154584 () Bool)

(declare-fun e!185868 () Bool)

(assert (=> d!66687 (=> res!154584 e!185868)))

(assert (=> d!66687 (= res!154584 (= (select (arr!7060 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2524))))

(assert (=> d!66687 (= (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!185868)))

(declare-fun b!293981 () Bool)

(declare-fun e!185869 () Bool)

(assert (=> b!293981 (= e!185868 e!185869)))

(declare-fun res!154585 () Bool)

(assert (=> b!293981 (=> (not res!154585) (not e!185869))))

(assert (=> b!293981 (= res!154585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7412 a!3312)))))

(declare-fun b!293982 () Bool)

(assert (=> b!293982 (= e!185869 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!66687 (not res!154584)) b!293981))

(assert (= (and b!293981 res!154585) b!293982))

(declare-fun m!307513 () Bool)

(assert (=> d!66687 m!307513))

(declare-fun m!307515 () Bool)

(assert (=> b!293982 m!307515))

(assert (=> b!293912 d!66687))

(assert (=> d!66659 d!66637))

(declare-fun d!66689 () Bool)

(assert (=> d!66689 (arrayContainsKey!0 a!3312 lt!145706 #b00000000000000000000000000000000)))

(declare-fun lt!145727 () Unit!9194)

(declare-fun choose!13 (array!14881 (_ BitVec 64) (_ BitVec 32)) Unit!9194)

(assert (=> d!66689 (= lt!145727 (choose!13 a!3312 lt!145706 #b00000000000000000000000000000000))))

(assert (=> d!66689 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!66689 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145706 #b00000000000000000000000000000000) lt!145727)))

(declare-fun bs!10444 () Bool)

(assert (= bs!10444 d!66689))

(assert (=> bs!10444 m!307483))

(declare-fun m!307533 () Bool)

(assert (=> bs!10444 m!307533))

(assert (=> b!293941 d!66689))

(declare-fun d!66695 () Bool)

(declare-fun res!154588 () Bool)

(declare-fun e!185873 () Bool)

(assert (=> d!66695 (=> res!154588 e!185873)))

(assert (=> d!66695 (= res!154588 (= (select (arr!7060 a!3312) #b00000000000000000000000000000000) lt!145706))))

(assert (=> d!66695 (= (arrayContainsKey!0 a!3312 lt!145706 #b00000000000000000000000000000000) e!185873)))

(declare-fun b!293987 () Bool)

(declare-fun e!185874 () Bool)

(assert (=> b!293987 (= e!185873 e!185874)))

(declare-fun res!154589 () Bool)

(assert (=> b!293987 (=> (not res!154589) (not e!185874))))

(assert (=> b!293987 (= res!154589 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7412 a!3312)))))

(declare-fun b!293988 () Bool)

(assert (=> b!293988 (= e!185874 (arrayContainsKey!0 a!3312 lt!145706 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66695 (not res!154588)) b!293987))

(assert (= (and b!293987 res!154589) b!293988))

(assert (=> d!66695 m!307463))

(declare-fun m!307535 () Bool)

(assert (=> b!293988 m!307535))

(assert (=> b!293941 d!66695))

(declare-fun b!293989 () Bool)

(declare-fun e!185876 () SeekEntryResult!2209)

(declare-fun lt!145729 () SeekEntryResult!2209)

(assert (=> b!293989 (= e!185876 (MissingZero!2209 (index!11008 lt!145729)))))

(declare-fun b!293990 () Bool)

(assert (=> b!293990 (= e!185876 (seekKeyOrZeroReturnVacant!0 (x!29188 lt!145729) (index!11008 lt!145729) (index!11008 lt!145729) (select (arr!7060 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(declare-fun b!293991 () Bool)

(declare-fun e!185877 () SeekEntryResult!2209)

(assert (=> b!293991 (= e!185877 Undefined!2209)))

(declare-fun d!66697 () Bool)

(declare-fun lt!145728 () SeekEntryResult!2209)

(assert (=> d!66697 (and (or (is-Undefined!2209 lt!145728) (not (is-Found!2209 lt!145728)) (and (bvsge (index!11007 lt!145728) #b00000000000000000000000000000000) (bvslt (index!11007 lt!145728) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145728) (is-Found!2209 lt!145728) (not (is-MissingZero!2209 lt!145728)) (and (bvsge (index!11006 lt!145728) #b00000000000000000000000000000000) (bvslt (index!11006 lt!145728) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145728) (is-Found!2209 lt!145728) (is-MissingZero!2209 lt!145728) (not (is-MissingVacant!2209 lt!145728)) (and (bvsge (index!11009 lt!145728) #b00000000000000000000000000000000) (bvslt (index!11009 lt!145728) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145728) (ite (is-Found!2209 lt!145728) (= (select (arr!7060 a!3312) (index!11007 lt!145728)) (select (arr!7060 a!3312) #b00000000000000000000000000000000)) (ite (is-MissingZero!2209 lt!145728) (= (select (arr!7060 a!3312) (index!11006 lt!145728)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2209 lt!145728) (= (select (arr!7060 a!3312) (index!11009 lt!145728)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66697 (= lt!145728 e!185877)))

(declare-fun c!47271 () Bool)

(assert (=> d!66697 (= c!47271 (and (is-Intermediate!2209 lt!145729) (undefined!3021 lt!145729)))))

(assert (=> d!66697 (= lt!145729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7060 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!66697 (validMask!0 mask!3809)))

(assert (=> d!66697 (= (seekEntryOrOpen!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!145728)))

(declare-fun b!293992 () Bool)

(declare-fun c!47272 () Bool)

(declare-fun lt!145730 () (_ BitVec 64))

(assert (=> b!293992 (= c!47272 (= lt!145730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185875 () SeekEntryResult!2209)

(assert (=> b!293992 (= e!185875 e!185876)))

(declare-fun b!293993 () Bool)

(assert (=> b!293993 (= e!185875 (Found!2209 (index!11008 lt!145729)))))

(declare-fun b!293994 () Bool)

(assert (=> b!293994 (= e!185877 e!185875)))

(assert (=> b!293994 (= lt!145730 (select (arr!7060 a!3312) (index!11008 lt!145729)))))

(declare-fun c!47270 () Bool)

(assert (=> b!293994 (= c!47270 (= lt!145730 (select (arr!7060 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66697 c!47271) b!293991))

(assert (= (and d!66697 (not c!47271)) b!293994))

(assert (= (and b!293994 c!47270) b!293993))

(assert (= (and b!293994 (not c!47270)) b!293992))

(assert (= (and b!293992 c!47272) b!293989))

(assert (= (and b!293992 (not c!47272)) b!293990))

(assert (=> b!293990 m!307463))

(declare-fun m!307537 () Bool)

(assert (=> b!293990 m!307537))

(declare-fun m!307541 () Bool)

(assert (=> d!66697 m!307541))

(assert (=> d!66697 m!307463))

(declare-fun m!307543 () Bool)

(assert (=> d!66697 m!307543))

(assert (=> d!66697 m!307365))

(assert (=> d!66697 m!307463))

(assert (=> d!66697 m!307541))

(declare-fun m!307545 () Bool)

(assert (=> d!66697 m!307545))

(declare-fun m!307547 () Bool)

(assert (=> d!66697 m!307547))

(declare-fun m!307549 () Bool)

(assert (=> d!66697 m!307549))

(declare-fun m!307551 () Bool)

(assert (=> b!293994 m!307551))

(assert (=> b!293941 d!66697))

(declare-fun d!66701 () Bool)

(assert (=> d!66701 (= (validKeyInArray!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7060 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7060 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293942 d!66701))

(declare-fun b!294003 () Bool)

(declare-fun e!185883 () SeekEntryResult!2209)

(declare-fun e!185886 () SeekEntryResult!2209)

(assert (=> b!294003 (= e!185883 e!185886)))

(declare-fun c!47276 () Bool)

(declare-fun lt!145737 () (_ BitVec 64))

(assert (=> b!294003 (= c!47276 (or (= lt!145737 k!2524) (= (bvadd lt!145737 lt!145737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294004 () Bool)

(declare-fun lt!145738 () SeekEntryResult!2209)

(assert (=> b!294004 (and (bvsge (index!11008 lt!145738) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145738) (size!7412 a!3312)))))

(declare-fun res!154594 () Bool)

(assert (=> b!294004 (= res!154594 (= (select (arr!7060 a!3312) (index!11008 lt!145738)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185887 () Bool)

(assert (=> b!294004 (=> res!154594 e!185887)))

(declare-fun d!66703 () Bool)

(declare-fun e!185885 () Bool)

(assert (=> d!66703 e!185885))

(declare-fun c!47277 () Bool)

(assert (=> d!66703 (= c!47277 (and (is-Intermediate!2209 lt!145738) (undefined!3021 lt!145738)))))

(assert (=> d!66703 (= lt!145738 e!185883)))

(declare-fun c!47278 () Bool)

(assert (=> d!66703 (= c!47278 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66703 (= lt!145737 (select (arr!7060 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!66703 (validMask!0 mask!3809)))

(assert (=> d!66703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!145738)))

(declare-fun b!294005 () Bool)

(assert (=> b!294005 (and (bvsge (index!11008 lt!145738) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145738) (size!7412 a!3312)))))

(declare-fun res!154593 () Bool)

(assert (=> b!294005 (= res!154593 (= (select (arr!7060 a!3312) (index!11008 lt!145738)) k!2524))))

(assert (=> b!294005 (=> res!154593 e!185887)))

(declare-fun e!185884 () Bool)

(assert (=> b!294005 (= e!185884 e!185887)))

(declare-fun b!294006 () Bool)

(assert (=> b!294006 (= e!185886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294007 () Bool)

(assert (=> b!294007 (and (bvsge (index!11008 lt!145738) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145738) (size!7412 a!3312)))))

(assert (=> b!294007 (= e!185887 (= (select (arr!7060 a!3312) (index!11008 lt!145738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294008 () Bool)

(assert (=> b!294008 (= e!185883 (Intermediate!2209 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!294009 () Bool)

(assert (=> b!294009 (= e!185885 e!185884)))

(declare-fun res!154592 () Bool)

(assert (=> b!294009 (= res!154592 (and (is-Intermediate!2209 lt!145738) (not (undefined!3021 lt!145738)) (bvslt (x!29188 lt!145738) #b01111111111111111111111111111110) (bvsge (x!29188 lt!145738) #b00000000000000000000000000000000) (bvsge (x!29188 lt!145738) #b00000000000000000000000000000000)))))

(assert (=> b!294009 (=> (not res!154592) (not e!185884))))

(declare-fun b!294010 () Bool)

(assert (=> b!294010 (= e!185885 (bvsge (x!29188 lt!145738) #b01111111111111111111111111111110))))

(declare-fun b!294011 () Bool)

(assert (=> b!294011 (= e!185886 (Intermediate!2209 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(assert (= (and d!66703 c!47278) b!294008))

(assert (= (and d!66703 (not c!47278)) b!294003))

(assert (= (and b!294003 c!47276) b!294011))

(assert (= (and b!294003 (not c!47276)) b!294006))

(assert (= (and d!66703 c!47277) b!294010))

(assert (= (and d!66703 (not c!47277)) b!294009))

(assert (= (and b!294009 res!154592) b!294005))

(assert (= (and b!294005 (not res!154593)) b!294004))

(assert (= (and b!294004 (not res!154594)) b!294007))

(declare-fun m!307559 () Bool)

(assert (=> b!294004 m!307559))

(assert (=> b!294007 m!307559))

(assert (=> b!294005 m!307559))

(assert (=> b!294006 m!307363))

(declare-fun m!307565 () Bool)

(assert (=> b!294006 m!307565))

(assert (=> b!294006 m!307565))

(declare-fun m!307569 () Bool)

(assert (=> b!294006 m!307569))

(assert (=> d!66703 m!307363))

(declare-fun m!307573 () Bool)

(assert (=> d!66703 m!307573))

(assert (=> d!66703 m!307365))

(assert (=> d!66643 d!66703))

(assert (=> d!66643 d!66667))

(assert (=> d!66643 d!66637))

(assert (=> d!66665 d!66637))

(declare-fun b!294021 () Bool)

(declare-fun e!185893 () SeekEntryResult!2209)

(declare-fun e!185896 () SeekEntryResult!2209)

(assert (=> b!294021 (= e!185893 e!185896)))

(declare-fun c!47282 () Bool)

(declare-fun lt!145741 () (_ BitVec 64))

(assert (=> b!294021 (= c!47282 (or (= lt!145741 k!2524) (= (bvadd lt!145741 lt!145741) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!145742 () SeekEntryResult!2209)

(declare-fun b!294022 () Bool)

(assert (=> b!294022 (and (bvsge (index!11008 lt!145742) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145742) (size!7412 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)))))))

(declare-fun res!154600 () Bool)

(assert (=> b!294022 (= res!154600 (= (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (index!11008 lt!145742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185897 () Bool)

(assert (=> b!294022 (=> res!154600 e!185897)))

(declare-fun d!66709 () Bool)

(declare-fun e!185895 () Bool)

(assert (=> d!66709 e!185895))

(declare-fun c!47283 () Bool)

(assert (=> d!66709 (= c!47283 (and (is-Intermediate!2209 lt!145742) (undefined!3021 lt!145742)))))

(assert (=> d!66709 (= lt!145742 e!185893)))

(declare-fun c!47284 () Bool)

(assert (=> d!66709 (= c!47284 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!66709 (= lt!145741 (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!66709 (validMask!0 mask!3809)))

(assert (=> d!66709 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)) mask!3809) lt!145742)))

(declare-fun b!294023 () Bool)

(assert (=> b!294023 (and (bvsge (index!11008 lt!145742) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145742) (size!7412 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)))))))

(declare-fun res!154599 () Bool)

(assert (=> b!294023 (= res!154599 (= (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (index!11008 lt!145742)) k!2524))))

(assert (=> b!294023 (=> res!154599 e!185897)))

(declare-fun e!185894 () Bool)

(assert (=> b!294023 (= e!185894 e!185897)))

(declare-fun b!294024 () Bool)

(assert (=> b!294024 (= e!185896 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)) mask!3809))))

(declare-fun b!294025 () Bool)

(assert (=> b!294025 (and (bvsge (index!11008 lt!145742) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145742) (size!7412 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312)))))))

(assert (=> b!294025 (= e!185897 (= (select (arr!7060 (array!14882 (store (arr!7060 a!3312) i!1256 k!2524) (size!7412 a!3312))) (index!11008 lt!145742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294026 () Bool)

(assert (=> b!294026 (= e!185893 (Intermediate!2209 true (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!294027 () Bool)

(assert (=> b!294027 (= e!185895 e!185894)))

(declare-fun res!154598 () Bool)

(assert (=> b!294027 (= res!154598 (and (is-Intermediate!2209 lt!145742) (not (undefined!3021 lt!145742)) (bvslt (x!29188 lt!145742) #b01111111111111111111111111111110) (bvsge (x!29188 lt!145742) #b00000000000000000000000000000000) (bvsge (x!29188 lt!145742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!294027 (=> (not res!154598) (not e!185894))))

(declare-fun b!294028 () Bool)

(assert (=> b!294028 (= e!185895 (bvsge (x!29188 lt!145742) #b01111111111111111111111111111110))))

(declare-fun b!294029 () Bool)

(assert (=> b!294029 (= e!185896 (Intermediate!2209 false (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66709 c!47284) b!294026))

(assert (= (and d!66709 (not c!47284)) b!294021))

(assert (= (and b!294021 c!47282) b!294029))

(assert (= (and b!294021 (not c!47282)) b!294024))

(assert (= (and d!66709 c!47283) b!294028))

(assert (= (and d!66709 (not c!47283)) b!294027))

(assert (= (and b!294027 res!154598) b!294023))

(assert (= (and b!294023 (not res!154599)) b!294022))

(assert (= (and b!294022 (not res!154600)) b!294025))

(declare-fun m!307583 () Bool)

(assert (=> b!294022 m!307583))

(assert (=> b!294025 m!307583))

(assert (=> b!294023 m!307583))

(assert (=> b!294024 m!307451))

(declare-fun m!307587 () Bool)

(assert (=> b!294024 m!307587))

(assert (=> b!294024 m!307587))

(declare-fun m!307589 () Bool)

(assert (=> b!294024 m!307589))

(assert (=> d!66709 m!307451))

(declare-fun m!307591 () Bool)

(assert (=> d!66709 m!307591))

(assert (=> d!66709 m!307365))

(assert (=> b!293874 d!66709))

(declare-fun d!66713 () Bool)

(declare-fun lt!145745 () (_ BitVec 32))

(assert (=> d!66713 (and (bvsge lt!145745 #b00000000000000000000000000000000) (bvslt lt!145745 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!66713 (= lt!145745 (choose!52 lt!145610 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!66713 (validMask!0 mask!3809)))

(assert (=> d!66713 (= (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) lt!145745)))

(declare-fun bs!10446 () Bool)

(assert (= bs!10446 d!66713))

(declare-fun m!307593 () Bool)

(assert (=> bs!10446 m!307593))

(assert (=> bs!10446 m!307365))

(assert (=> b!293874 d!66713))

(declare-fun b!294030 () Bool)

(declare-fun e!185898 () SeekEntryResult!2209)

(declare-fun e!185901 () SeekEntryResult!2209)

(assert (=> b!294030 (= e!185898 e!185901)))

(declare-fun c!47285 () Bool)

(declare-fun lt!145746 () (_ BitVec 64))

(assert (=> b!294030 (= c!47285 (or (= lt!145746 k!2524) (= (bvadd lt!145746 lt!145746) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294031 () Bool)

(declare-fun lt!145747 () SeekEntryResult!2209)

(assert (=> b!294031 (and (bvsge (index!11008 lt!145747) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145747) (size!7412 a!3312)))))

(declare-fun res!154603 () Bool)

(assert (=> b!294031 (= res!154603 (= (select (arr!7060 a!3312) (index!11008 lt!145747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185902 () Bool)

(assert (=> b!294031 (=> res!154603 e!185902)))

(declare-fun d!66715 () Bool)

(declare-fun e!185900 () Bool)

(assert (=> d!66715 e!185900))

(declare-fun c!47286 () Bool)

(assert (=> d!66715 (= c!47286 (and (is-Intermediate!2209 lt!145747) (undefined!3021 lt!145747)))))

(assert (=> d!66715 (= lt!145747 e!185898)))

(declare-fun c!47287 () Bool)

(assert (=> d!66715 (= c!47287 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!66715 (= lt!145746 (select (arr!7060 a!3312) (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!66715 (validMask!0 mask!3809)))

(assert (=> d!66715 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809) lt!145747)))

(declare-fun b!294032 () Bool)

(assert (=> b!294032 (and (bvsge (index!11008 lt!145747) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145747) (size!7412 a!3312)))))

(declare-fun res!154602 () Bool)

(assert (=> b!294032 (= res!154602 (= (select (arr!7060 a!3312) (index!11008 lt!145747)) k!2524))))

(assert (=> b!294032 (=> res!154602 e!185902)))

(declare-fun e!185899 () Bool)

(assert (=> b!294032 (= e!185899 e!185902)))

(declare-fun b!294033 () Bool)

(assert (=> b!294033 (= e!185901 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294034 () Bool)

(assert (=> b!294034 (and (bvsge (index!11008 lt!145747) #b00000000000000000000000000000000) (bvslt (index!11008 lt!145747) (size!7412 a!3312)))))

(assert (=> b!294034 (= e!185902 (= (select (arr!7060 a!3312) (index!11008 lt!145747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294035 () Bool)

(assert (=> b!294035 (= e!185898 (Intermediate!2209 true (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!294036 () Bool)

(assert (=> b!294036 (= e!185900 e!185899)))

(declare-fun res!154601 () Bool)

(assert (=> b!294036 (= res!154601 (and (is-Intermediate!2209 lt!145747) (not (undefined!3021 lt!145747)) (bvslt (x!29188 lt!145747) #b01111111111111111111111111111110) (bvsge (x!29188 lt!145747) #b00000000000000000000000000000000) (bvsge (x!29188 lt!145747) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!294036 (=> (not res!154601) (not e!185899))))

(declare-fun b!294037 () Bool)

(assert (=> b!294037 (= e!185900 (bvsge (x!29188 lt!145747) #b01111111111111111111111111111110))))

(declare-fun b!294038 () Bool)

(assert (=> b!294038 (= e!185901 (Intermediate!2209 false (nextIndex!0 lt!145610 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66715 c!47287) b!294035))

(assert (= (and d!66715 (not c!47287)) b!294030))

(assert (= (and b!294030 c!47285) b!294038))

(assert (= (and b!294030 (not c!47285)) b!294033))

(assert (= (and d!66715 c!47286) b!294037))

(assert (= (and d!66715 (not c!47286)) b!294036))

(assert (= (and b!294036 res!154601) b!294032))

(assert (= (and b!294032 (not res!154602)) b!294031))

(assert (= (and b!294031 (not res!154603)) b!294034))

(declare-fun m!307595 () Bool)

(assert (=> b!294031 m!307595))

(assert (=> b!294034 m!307595))

(assert (=> b!294032 m!307595))

(assert (=> b!294033 m!307451))

(assert (=> b!294033 m!307587))

(assert (=> b!294033 m!307587))

(declare-fun m!307597 () Bool)

(assert (=> b!294033 m!307597))

(assert (=> d!66715 m!307451))

(declare-fun m!307599 () Bool)

(assert (=> d!66715 m!307599))

(assert (=> d!66715 m!307365))

(assert (=> b!293883 d!66715))

(assert (=> b!293883 d!66713))

(declare-fun b!294039 () Bool)

(declare-fun e!185905 () Bool)

(declare-fun call!25689 () Bool)

(assert (=> b!294039 (= e!185905 call!25689)))

(declare-fun b!294040 () Bool)

(declare-fun e!185904 () Bool)

(assert (=> b!294040 (= e!185904 call!25689)))

(declare-fun b!294041 () Bool)

(assert (=> b!294041 (= e!185905 e!185904)))

(declare-fun lt!145748 () (_ BitVec 64))

(assert (=> b!294041 (= lt!145748 (select (arr!7060 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!145749 () Unit!9194)

(assert (=> b!294041 (= lt!145749 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!294041 (arrayContainsKey!0 a!3312 lt!145748 #b00000000000000000000000000000000)))

(declare-fun lt!145750 () Unit!9194)

(assert (=> b!294041 (= lt!145750 lt!145749)))

(declare-fun res!154605 () Bool)

(assert (=> b!294041 (= res!154605 (= (seekEntryOrOpen!0 (select (arr!7060 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!294041 (=> (not res!154605) (not e!185904))))

(declare-fun b!294042 () Bool)

(declare-fun e!185903 () Bool)

(assert (=> b!294042 (= e!185903 e!185905)))

(declare-fun c!47288 () Bool)

(assert (=> b!294042 (= c!47288 (validKeyInArray!0 (select (arr!7060 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25686 () Bool)

(assert (=> bm!25686 (= call!25689 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66717 () Bool)

(declare-fun res!154604 () Bool)

(assert (=> d!66717 (=> res!154604 e!185903)))

(assert (=> d!66717 (= res!154604 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7412 a!3312)))))

(assert (=> d!66717 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!185903)))

(assert (= (and d!66717 (not res!154604)) b!294042))

(assert (= (and b!294042 c!47288) b!294041))

(assert (= (and b!294042 (not c!47288)) b!294039))

(assert (= (and b!294041 res!154605) b!294040))

(assert (= (or b!294040 b!294039) bm!25686))

(assert (=> b!294041 m!307513))

(declare-fun m!307601 () Bool)

(assert (=> b!294041 m!307601))

(declare-fun m!307603 () Bool)

(assert (=> b!294041 m!307603))

(assert (=> b!294041 m!307513))

(declare-fun m!307605 () Bool)

(assert (=> b!294041 m!307605))

(assert (=> b!294042 m!307513))

(assert (=> b!294042 m!307513))

(declare-fun m!307607 () Bool)

(assert (=> b!294042 m!307607))

(declare-fun m!307609 () Bool)

(assert (=> bm!25686 m!307609))

(assert (=> bm!25684 d!66717))

(declare-fun b!294055 () Bool)

(declare-fun e!185914 () SeekEntryResult!2209)

(assert (=> b!294055 (= e!185914 (MissingVacant!2209 (index!11008 lt!145652)))))

(declare-fun lt!145755 () SeekEntryResult!2209)

(declare-fun d!66719 () Bool)

(assert (=> d!66719 (and (or (is-Undefined!2209 lt!145755) (not (is-Found!2209 lt!145755)) (and (bvsge (index!11007 lt!145755) #b00000000000000000000000000000000) (bvslt (index!11007 lt!145755) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145755) (is-Found!2209 lt!145755) (not (is-MissingVacant!2209 lt!145755)) (not (= (index!11009 lt!145755) (index!11008 lt!145652))) (and (bvsge (index!11009 lt!145755) #b00000000000000000000000000000000) (bvslt (index!11009 lt!145755) (size!7412 a!3312)))) (or (is-Undefined!2209 lt!145755) (ite (is-Found!2209 lt!145755) (= (select (arr!7060 a!3312) (index!11007 lt!145755)) k!2524) (and (is-MissingVacant!2209 lt!145755) (= (index!11009 lt!145755) (index!11008 lt!145652)) (= (select (arr!7060 a!3312) (index!11009 lt!145755)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!185912 () SeekEntryResult!2209)

(assert (=> d!66719 (= lt!145755 e!185912)))

(declare-fun c!47297 () Bool)

(assert (=> d!66719 (= c!47297 (bvsge (x!29188 lt!145652) #b01111111111111111111111111111110))))

(declare-fun lt!145756 () (_ BitVec 64))

(assert (=> d!66719 (= lt!145756 (select (arr!7060 a!3312) (index!11008 lt!145652)))))

(assert (=> d!66719 (validMask!0 mask!3809)))

(assert (=> d!66719 (= (seekKeyOrZeroReturnVacant!0 (x!29188 lt!145652) (index!11008 lt!145652) (index!11008 lt!145652) k!2524 a!3312 mask!3809) lt!145755)))

(declare-fun b!294056 () Bool)

(declare-fun c!47296 () Bool)

(assert (=> b!294056 (= c!47296 (= lt!145756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185913 () SeekEntryResult!2209)

(assert (=> b!294056 (= e!185913 e!185914)))

(declare-fun b!294057 () Bool)

(assert (=> b!294057 (= e!185914 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29188 lt!145652) #b00000000000000000000000000000001) (nextIndex!0 (index!11008 lt!145652) (x!29188 lt!145652) mask!3809) (index!11008 lt!145652) k!2524 a!3312 mask!3809))))

(declare-fun b!294058 () Bool)

(assert (=> b!294058 (= e!185912 Undefined!2209)))

(declare-fun b!294059 () Bool)

(assert (=> b!294059 (= e!185912 e!185913)))

(declare-fun c!47295 () Bool)

(assert (=> b!294059 (= c!47295 (= lt!145756 k!2524))))

(declare-fun b!294060 () Bool)

(assert (=> b!294060 (= e!185913 (Found!2209 (index!11008 lt!145652)))))

(assert (= (and d!66719 c!47297) b!294058))

(assert (= (and d!66719 (not c!47297)) b!294059))

(assert (= (and b!294059 c!47295) b!294060))

(assert (= (and b!294059 (not c!47295)) b!294056))

(assert (= (and b!294056 c!47296) b!294055))

(assert (= (and b!294056 (not c!47296)) b!294057))

(declare-fun m!307611 () Bool)

(assert (=> d!66719 m!307611))

(declare-fun m!307613 () Bool)

(assert (=> d!66719 m!307613))

(assert (=> d!66719 m!307421))

(assert (=> d!66719 m!307365))

(declare-fun m!307615 () Bool)

(assert (=> b!294057 m!307615))

(assert (=> b!294057 m!307615))

(declare-fun m!307617 () Bool)

(assert (=> b!294057 m!307617))

(assert (=> b!293806 d!66719))

(push 1)

