; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29398 () Bool)

(assert start!29398)

(declare-fun b!297690 () Bool)

(declare-fun res!157002 () Bool)

(declare-fun e!188112 () Bool)

(assert (=> b!297690 (=> (not res!157002) (not e!188112))))

(declare-datatypes ((array!15066 0))(
  ( (array!15067 (arr!7139 (Array (_ BitVec 32) (_ BitVec 64))) (size!7491 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15066)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297690 (= res!157002 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!156996 () Bool)

(assert (=> start!29398 (=> (not res!156996) (not e!188112))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29398 (= res!156996 (validMask!0 mask!3809))))

(assert (=> start!29398 e!188112))

(assert (=> start!29398 true))

(declare-fun array_inv!5102 (array!15066) Bool)

(assert (=> start!29398 (array_inv!5102 a!3312)))

(declare-fun b!297691 () Bool)

(declare-fun e!188107 () Bool)

(declare-fun e!188111 () Bool)

(assert (=> b!297691 (= e!188107 e!188111)))

(declare-fun res!157001 () Bool)

(assert (=> b!297691 (=> (not res!157001) (not e!188111))))

(declare-datatypes ((SeekEntryResult!2288 0))(
  ( (MissingZero!2288 (index!11322 (_ BitVec 32))) (Found!2288 (index!11323 (_ BitVec 32))) (Intermediate!2288 (undefined!3100 Bool) (index!11324 (_ BitVec 32)) (x!29542 (_ BitVec 32))) (Undefined!2288) (MissingVacant!2288 (index!11325 (_ BitVec 32))) )
))
(declare-fun lt!147965 () SeekEntryResult!2288)

(declare-fun lt!147963 () SeekEntryResult!2288)

(assert (=> b!297691 (= res!157001 (= lt!147965 lt!147963))))

(declare-datatypes ((Unit!9292 0))(
  ( (Unit!9293) )
))
(declare-fun lt!147969 () Unit!9292)

(declare-fun e!188113 () Unit!9292)

(assert (=> b!297691 (= lt!147969 e!188113)))

(declare-fun c!47930 () Bool)

(assert (=> b!297691 (= c!47930 (or (and (is-Intermediate!2288 lt!147963) (undefined!3100 lt!147963)) (and (is-Intermediate!2288 lt!147963) (= (select (arr!7139 a!3312) (index!11324 lt!147963)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2288 lt!147963) (= (select (arr!7139 a!3312) (index!11324 lt!147963)) k!2524))))))

(declare-fun b!297692 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!297692 (and (= lt!147965 lt!147963) (= (select (store (arr!7139 a!3312) i!1256 k!2524) (index!11324 lt!147963)) k!2524))))

(declare-fun lt!147968 () (_ BitVec 32))

(declare-fun lt!147966 () Unit!9292)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15066 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9292)

(assert (=> b!297692 (= lt!147966 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147968 (index!11324 lt!147963) (x!29542 lt!147963) mask!3809))))

(assert (=> b!297692 (and (= (select (arr!7139 a!3312) (index!11324 lt!147963)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11324 lt!147963) i!1256))))

(declare-fun e!188110 () Unit!9292)

(declare-fun Unit!9294 () Unit!9292)

(assert (=> b!297692 (= e!188110 Unit!9294)))

(declare-fun b!297693 () Bool)

(declare-fun res!156997 () Bool)

(assert (=> b!297693 (=> (not res!156997) (not e!188112))))

(assert (=> b!297693 (= res!156997 (and (= (size!7491 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7491 a!3312))))))

(declare-fun b!297694 () Bool)

(declare-fun e!188109 () Bool)

(assert (=> b!297694 (= e!188112 e!188109)))

(declare-fun res!156999 () Bool)

(assert (=> b!297694 (=> (not res!156999) (not e!188109))))

(declare-fun lt!147964 () SeekEntryResult!2288)

(declare-fun lt!147967 () Bool)

(assert (=> b!297694 (= res!156999 (or lt!147967 (= lt!147964 (MissingVacant!2288 i!1256))))))

(assert (=> b!297694 (= lt!147967 (= lt!147964 (MissingZero!2288 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15066 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!297694 (= lt!147964 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297695 () Bool)

(assert (=> b!297695 false))

(declare-fun Unit!9295 () Unit!9292)

(assert (=> b!297695 (= e!188110 Unit!9295)))

(declare-fun b!297696 () Bool)

(declare-fun lt!147962 () array!15066)

(assert (=> b!297696 (= e!188111 (not (= (seekEntryOrOpen!0 k!2524 lt!147962 mask!3809) (Found!2288 i!1256))))))

(declare-fun b!297697 () Bool)

(assert (=> b!297697 (= e!188113 e!188110)))

(declare-fun c!47931 () Bool)

(assert (=> b!297697 (= c!47931 (is-Intermediate!2288 lt!147963))))

(declare-fun b!297698 () Bool)

(assert (=> b!297698 (= e!188109 e!188107)))

(declare-fun res!156998 () Bool)

(assert (=> b!297698 (=> (not res!156998) (not e!188107))))

(assert (=> b!297698 (= res!156998 lt!147967)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15066 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!297698 (= lt!147965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147968 k!2524 lt!147962 mask!3809))))

(assert (=> b!297698 (= lt!147962 (array!15067 (store (arr!7139 a!3312) i!1256 k!2524) (size!7491 a!3312)))))

(assert (=> b!297698 (= lt!147963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147968 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297698 (= lt!147968 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297699 () Bool)

(declare-fun Unit!9296 () Unit!9292)

(assert (=> b!297699 (= e!188113 Unit!9296)))

(assert (=> b!297699 false))

(declare-fun b!297700 () Bool)

(declare-fun res!156995 () Bool)

(assert (=> b!297700 (=> (not res!156995) (not e!188109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15066 (_ BitVec 32)) Bool)

(assert (=> b!297700 (= res!156995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297701 () Bool)

(declare-fun res!157000 () Bool)

(assert (=> b!297701 (=> (not res!157000) (not e!188112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297701 (= res!157000 (validKeyInArray!0 k!2524))))

(assert (= (and start!29398 res!156996) b!297693))

(assert (= (and b!297693 res!156997) b!297701))

(assert (= (and b!297701 res!157000) b!297690))

(assert (= (and b!297690 res!157002) b!297694))

(assert (= (and b!297694 res!156999) b!297700))

(assert (= (and b!297700 res!156995) b!297698))

(assert (= (and b!297698 res!156998) b!297691))

(assert (= (and b!297691 c!47930) b!297699))

(assert (= (and b!297691 (not c!47930)) b!297697))

(assert (= (and b!297697 c!47931) b!297692))

(assert (= (and b!297697 (not c!47931)) b!297695))

(assert (= (and b!297691 res!157001) b!297696))

(declare-fun m!310377 () Bool)

(assert (=> b!297692 m!310377))

(declare-fun m!310379 () Bool)

(assert (=> b!297692 m!310379))

(declare-fun m!310381 () Bool)

(assert (=> b!297692 m!310381))

(declare-fun m!310383 () Bool)

(assert (=> b!297692 m!310383))

(declare-fun m!310385 () Bool)

(assert (=> start!29398 m!310385))

(declare-fun m!310387 () Bool)

(assert (=> start!29398 m!310387))

(declare-fun m!310389 () Bool)

(assert (=> b!297694 m!310389))

(declare-fun m!310391 () Bool)

(assert (=> b!297690 m!310391))

(assert (=> b!297691 m!310383))

(declare-fun m!310393 () Bool)

(assert (=> b!297700 m!310393))

(declare-fun m!310395 () Bool)

(assert (=> b!297698 m!310395))

(assert (=> b!297698 m!310377))

(declare-fun m!310397 () Bool)

(assert (=> b!297698 m!310397))

(declare-fun m!310399 () Bool)

(assert (=> b!297698 m!310399))

(declare-fun m!310401 () Bool)

(assert (=> b!297701 m!310401))

(declare-fun m!310403 () Bool)

(assert (=> b!297696 m!310403))

(push 1)

(assert (not b!297701))

(assert (not b!297700))

(assert (not b!297694))

(assert (not b!297696))

(assert (not b!297698))

(assert (not b!297690))

(assert (not start!29398))

(assert (not b!297692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!297819 () Bool)

(declare-fun e!188185 () SeekEntryResult!2288)

(declare-fun lt!148046 () SeekEntryResult!2288)

(assert (=> b!297819 (= e!188185 (Found!2288 (index!11324 lt!148046)))))

(declare-fun b!297820 () Bool)

(declare-fun c!47963 () Bool)

(declare-fun lt!148047 () (_ BitVec 64))

(assert (=> b!297820 (= c!47963 (= lt!148047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188184 () SeekEntryResult!2288)

(assert (=> b!297820 (= e!188185 e!188184)))

(declare-fun b!297821 () Bool)

(assert (=> b!297821 (= e!188184 (MissingZero!2288 (index!11324 lt!148046)))))

(declare-fun b!297822 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15066 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!297822 (= e!188184 (seekKeyOrZeroReturnVacant!0 (x!29542 lt!148046) (index!11324 lt!148046) (index!11324 lt!148046) k!2524 a!3312 mask!3809))))

(declare-fun b!297823 () Bool)

(declare-fun e!188183 () SeekEntryResult!2288)

(assert (=> b!297823 (= e!188183 e!188185)))

(assert (=> b!297823 (= lt!148047 (select (arr!7139 a!3312) (index!11324 lt!148046)))))

(declare-fun c!47964 () Bool)

(assert (=> b!297823 (= c!47964 (= lt!148047 k!2524))))

(declare-fun b!297824 () Bool)

(assert (=> b!297824 (= e!188183 Undefined!2288)))

(declare-fun d!67227 () Bool)

(declare-fun lt!148045 () SeekEntryResult!2288)

(assert (=> d!67227 (and (or (is-Undefined!2288 lt!148045) (not (is-Found!2288 lt!148045)) (and (bvsge (index!11323 lt!148045) #b00000000000000000000000000000000) (bvslt (index!11323 lt!148045) (size!7491 a!3312)))) (or (is-Undefined!2288 lt!148045) (is-Found!2288 lt!148045) (not (is-MissingZero!2288 lt!148045)) (and (bvsge (index!11322 lt!148045) #b00000000000000000000000000000000) (bvslt (index!11322 lt!148045) (size!7491 a!3312)))) (or (is-Undefined!2288 lt!148045) (is-Found!2288 lt!148045) (is-MissingZero!2288 lt!148045) (not (is-MissingVacant!2288 lt!148045)) (and (bvsge (index!11325 lt!148045) #b00000000000000000000000000000000) (bvslt (index!11325 lt!148045) (size!7491 a!3312)))) (or (is-Undefined!2288 lt!148045) (ite (is-Found!2288 lt!148045) (= (select (arr!7139 a!3312) (index!11323 lt!148045)) k!2524) (ite (is-MissingZero!2288 lt!148045) (= (select (arr!7139 a!3312) (index!11322 lt!148045)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2288 lt!148045) (= (select (arr!7139 a!3312) (index!11325 lt!148045)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67227 (= lt!148045 e!188183)))

(declare-fun c!47962 () Bool)

(assert (=> d!67227 (= c!47962 (and (is-Intermediate!2288 lt!148046) (undefined!3100 lt!148046)))))

(assert (=> d!67227 (= lt!148046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67227 (validMask!0 mask!3809)))

(assert (=> d!67227 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148045)))

(assert (= (and d!67227 c!47962) b!297824))

(assert (= (and d!67227 (not c!47962)) b!297823))

(assert (= (and b!297823 c!47964) b!297819))

(assert (= (and b!297823 (not c!47964)) b!297820))

(assert (= (and b!297820 c!47963) b!297821))

(assert (= (and b!297820 (not c!47963)) b!297822))

(declare-fun m!310489 () Bool)

(assert (=> b!297822 m!310489))

(declare-fun m!310491 () Bool)

(assert (=> b!297823 m!310491))

(declare-fun m!310493 () Bool)

(assert (=> d!67227 m!310493))

(assert (=> d!67227 m!310399))

(declare-fun m!310495 () Bool)

(assert (=> d!67227 m!310495))

(assert (=> d!67227 m!310385))

(declare-fun m!310497 () Bool)

(assert (=> d!67227 m!310497))

(declare-fun m!310499 () Bool)

(assert (=> d!67227 m!310499))

(assert (=> d!67227 m!310399))

(assert (=> b!297694 d!67227))

(declare-fun d!67237 () Bool)

(declare-fun e!188188 () Bool)

(assert (=> d!67237 e!188188))

(declare-fun res!157062 () Bool)

(assert (=> d!67237 (=> (not res!157062) (not e!188188))))

(assert (=> d!67237 (= res!157062 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7491 a!3312))))))

(declare-fun lt!148050 () Unit!9292)

(declare-fun choose!42 (array!15066 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9292)

(assert (=> d!67237 (= lt!148050 (choose!42 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147968 (index!11324 lt!147963) (x!29542 lt!147963) mask!3809))))

(assert (=> d!67237 (validMask!0 mask!3809)))

(assert (=> d!67237 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147968 (index!11324 lt!147963) (x!29542 lt!147963) mask!3809) lt!148050)))

(declare-fun b!297827 () Bool)

(assert (=> b!297827 (= e!188188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147968 k!2524 (array!15067 (store (arr!7139 a!3312) i!1256 k!2524) (size!7491 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147968 k!2524 a!3312 mask!3809)))))

(assert (= (and d!67237 res!157062) b!297827))

(declare-fun m!310501 () Bool)

(assert (=> d!67237 m!310501))

(assert (=> d!67237 m!310385))

(assert (=> b!297827 m!310377))

(declare-fun m!310503 () Bool)

(assert (=> b!297827 m!310503))

(assert (=> b!297827 m!310397))

(assert (=> b!297692 d!67237))

(declare-fun b!297912 () Bool)

(declare-fun e!188240 () Bool)

(declare-fun lt!148082 () SeekEntryResult!2288)

(assert (=> b!297912 (= e!188240 (bvsge (x!29542 lt!148082) #b01111111111111111111111111111110))))

(declare-fun b!297913 () Bool)

(assert (=> b!297913 (and (bvsge (index!11324 lt!148082) #b00000000000000000000000000000000) (bvslt (index!11324 lt!148082) (size!7491 lt!147962)))))

(declare-fun e!188241 () Bool)

(assert (=> b!297913 (= e!188241 (= (select (arr!7139 lt!147962) (index!11324 lt!148082)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297914 () Bool)

(declare-fun e!188238 () SeekEntryResult!2288)

(declare-fun e!188237 () SeekEntryResult!2288)

(assert (=> b!297914 (= e!188238 e!188237)))

(declare-fun c!47995 () Bool)

(declare-fun lt!148081 () (_ BitVec 64))

(assert (=> b!297914 (= c!47995 (or (= lt!148081 k!2524) (= (bvadd lt!148081 lt!148081) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297915 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297915 (= e!188237 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147968 #b00000000000000000000000000000000 mask!3809) k!2524 lt!147962 mask!3809))))

(declare-fun b!297916 () Bool)

(assert (=> b!297916 (and (bvsge (index!11324 lt!148082) #b00000000000000000000000000000000) (bvslt (index!11324 lt!148082) (size!7491 lt!147962)))))

(declare-fun res!157090 () Bool)

(assert (=> b!297916 (= res!157090 (= (select (arr!7139 lt!147962) (index!11324 lt!148082)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297916 (=> res!157090 e!188241)))

(declare-fun b!297917 () Bool)

(assert (=> b!297917 (and (bvsge (index!11324 lt!148082) #b00000000000000000000000000000000) (bvslt (index!11324 lt!148082) (size!7491 lt!147962)))))

(declare-fun res!157088 () Bool)

(assert (=> b!297917 (= res!157088 (= (select (arr!7139 lt!147962) (index!11324 lt!148082)) k!2524))))

(assert (=> b!297917 (=> res!157088 e!188241)))

(declare-fun e!188239 () Bool)

(assert (=> b!297917 (= e!188239 e!188241)))

(declare-fun b!297918 () Bool)

(assert (=> b!297918 (= e!188237 (Intermediate!2288 false lt!147968 #b00000000000000000000000000000000))))

(declare-fun d!67239 () Bool)

(assert (=> d!67239 e!188240))

(declare-fun c!47997 () Bool)

(assert (=> d!67239 (= c!47997 (and (is-Intermediate!2288 lt!148082) (undefined!3100 lt!148082)))))

(assert (=> d!67239 (= lt!148082 e!188238)))

(declare-fun c!47996 () Bool)

(assert (=> d!67239 (= c!47996 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67239 (= lt!148081 (select (arr!7139 lt!147962) lt!147968))))

(assert (=> d!67239 (validMask!0 mask!3809)))

(assert (=> d!67239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147968 k!2524 lt!147962 mask!3809) lt!148082)))

(declare-fun b!297919 () Bool)

(assert (=> b!297919 (= e!188240 e!188239)))

(declare-fun res!157089 () Bool)

(assert (=> b!297919 (= res!157089 (and (is-Intermediate!2288 lt!148082) (not (undefined!3100 lt!148082)) (bvslt (x!29542 lt!148082) #b01111111111111111111111111111110) (bvsge (x!29542 lt!148082) #b00000000000000000000000000000000) (bvsge (x!29542 lt!148082) #b00000000000000000000000000000000)))))

(assert (=> b!297919 (=> (not res!157089) (not e!188239))))

(declare-fun b!297920 () Bool)

(assert (=> b!297920 (= e!188238 (Intermediate!2288 true lt!147968 #b00000000000000000000000000000000))))

(assert (= (and d!67239 c!47996) b!297920))

(assert (= (and d!67239 (not c!47996)) b!297914))

(assert (= (and b!297914 c!47995) b!297918))

(assert (= (and b!297914 (not c!47995)) b!297915))

(assert (= (and d!67239 c!47997) b!297912))

(assert (= (and d!67239 (not c!47997)) b!297919))

(assert (= (and b!297919 res!157089) b!297917))

(assert (= (and b!297917 (not res!157088)) b!297916))

(assert (= (and b!297916 (not res!157090)) b!297913))

(declare-fun m!310547 () Bool)

(assert (=> b!297913 m!310547))

(assert (=> b!297916 m!310547))

(assert (=> b!297917 m!310547))

(declare-fun m!310549 () Bool)

(assert (=> b!297915 m!310549))

(assert (=> b!297915 m!310549))

(declare-fun m!310551 () Bool)

(assert (=> b!297915 m!310551))

(declare-fun m!310553 () Bool)

(assert (=> d!67239 m!310553))

(assert (=> d!67239 m!310385))

(assert (=> b!297698 d!67239))

(declare-fun b!297921 () Bool)

(declare-fun e!188245 () Bool)

(declare-fun lt!148084 () SeekEntryResult!2288)

(assert (=> b!297921 (= e!188245 (bvsge (x!29542 lt!148084) #b01111111111111111111111111111110))))

(declare-fun b!297922 () Bool)

(assert (=> b!297922 (and (bvsge (index!11324 lt!148084) #b00000000000000000000000000000000) (bvslt (index!11324 lt!148084) (size!7491 a!3312)))))

(declare-fun e!188246 () Bool)

(assert (=> b!297922 (= e!188246 (= (select (arr!7139 a!3312) (index!11324 lt!148084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297923 () Bool)

(declare-fun e!188243 () SeekEntryResult!2288)

(declare-fun e!188242 () SeekEntryResult!2288)

(assert (=> b!297923 (= e!188243 e!188242)))

(declare-fun c!47998 () Bool)

(declare-fun lt!148083 () (_ BitVec 64))

(assert (=> b!297923 (= c!47998 (or (= lt!148083 k!2524) (= (bvadd lt!148083 lt!148083) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297924 () Bool)

(assert (=> b!297924 (= e!188242 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147968 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!297925 () Bool)

(assert (=> b!297925 (and (bvsge (index!11324 lt!148084) #b00000000000000000000000000000000) (bvslt (index!11324 lt!148084) (size!7491 a!3312)))))

(declare-fun res!157093 () Bool)

(assert (=> b!297925 (= res!157093 (= (select (arr!7139 a!3312) (index!11324 lt!148084)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297925 (=> res!157093 e!188246)))

(declare-fun b!297926 () Bool)

(assert (=> b!297926 (and (bvsge (index!11324 lt!148084) #b00000000000000000000000000000000) (bvslt (index!11324 lt!148084) (size!7491 a!3312)))))

(declare-fun res!157091 () Bool)

(assert (=> b!297926 (= res!157091 (= (select (arr!7139 a!3312) (index!11324 lt!148084)) k!2524))))

(assert (=> b!297926 (=> res!157091 e!188246)))

(declare-fun e!188244 () Bool)

(assert (=> b!297926 (= e!188244 e!188246)))

(declare-fun b!297927 () Bool)

(assert (=> b!297927 (= e!188242 (Intermediate!2288 false lt!147968 #b00000000000000000000000000000000))))

(declare-fun d!67257 () Bool)

(assert (=> d!67257 e!188245))

(declare-fun c!48000 () Bool)

(assert (=> d!67257 (= c!48000 (and (is-Intermediate!2288 lt!148084) (undefined!3100 lt!148084)))))

(assert (=> d!67257 (= lt!148084 e!188243)))

(declare-fun c!47999 () Bool)

(assert (=> d!67257 (= c!47999 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67257 (= lt!148083 (select (arr!7139 a!3312) lt!147968))))

(assert (=> d!67257 (validMask!0 mask!3809)))

(assert (=> d!67257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147968 k!2524 a!3312 mask!3809) lt!148084)))

(declare-fun b!297928 () Bool)

(assert (=> b!297928 (= e!188245 e!188244)))

(declare-fun res!157092 () Bool)

(assert (=> b!297928 (= res!157092 (and (is-Intermediate!2288 lt!148084) (not (undefined!3100 lt!148084)) (bvslt (x!29542 lt!148084) #b01111111111111111111111111111110) (bvsge (x!29542 lt!148084) #b00000000000000000000000000000000) (bvsge (x!29542 lt!148084) #b00000000000000000000000000000000)))))

(assert (=> b!297928 (=> (not res!157092) (not e!188244))))

(declare-fun b!297929 () Bool)

(assert (=> b!297929 (= e!188243 (Intermediate!2288 true lt!147968 #b00000000000000000000000000000000))))

(assert (= (and d!67257 c!47999) b!297929))

(assert (= (and d!67257 (not c!47999)) b!297923))

(assert (= (and b!297923 c!47998) b!297927))

(assert (= (and b!297923 (not c!47998)) b!297924))

(assert (= (and d!67257 c!48000) b!297921))

(assert (= (and d!67257 (not c!48000)) b!297928))

(assert (= (and b!297928 res!157092) b!297926))

(assert (= (and b!297926 (not res!157091)) b!297925))

(assert (= (and b!297925 (not res!157093)) b!297922))

(declare-fun m!310555 () Bool)

(assert (=> b!297922 m!310555))

(assert (=> b!297925 m!310555))

(assert (=> b!297926 m!310555))

(assert (=> b!297924 m!310549))

(assert (=> b!297924 m!310549))

(declare-fun m!310557 () Bool)

(assert (=> b!297924 m!310557))

(declare-fun m!310559 () Bool)

(assert (=> d!67257 m!310559))

(assert (=> d!67257 m!310385))

(assert (=> b!297698 d!67257))

(declare-fun d!67259 () Bool)

(declare-fun lt!148090 () (_ BitVec 32))

(declare-fun lt!148089 () (_ BitVec 32))

(assert (=> d!67259 (= lt!148090 (bvmul (bvxor lt!148089 (bvlshr lt!148089 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67259 (= lt!148089 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67259 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157094 (let ((h!5302 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29550 (bvmul (bvxor h!5302 (bvlshr h!5302 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29550 (bvlshr x!29550 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157094 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157094 #b00000000000000000000000000000000))))))

(assert (=> d!67259 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148090 (bvlshr lt!148090 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297698 d!67259))

(declare-fun b!297930 () Bool)

(declare-fun e!188249 () SeekEntryResult!2288)

(declare-fun lt!148092 () SeekEntryResult!2288)

(assert (=> b!297930 (= e!188249 (Found!2288 (index!11324 lt!148092)))))

(declare-fun b!297931 () Bool)

(declare-fun c!48002 () Bool)

(declare-fun lt!148093 () (_ BitVec 64))

(assert (=> b!297931 (= c!48002 (= lt!148093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188248 () SeekEntryResult!2288)

(assert (=> b!297931 (= e!188249 e!188248)))

(declare-fun b!297932 () Bool)

(assert (=> b!297932 (= e!188248 (MissingZero!2288 (index!11324 lt!148092)))))

(declare-fun b!297933 () Bool)

(assert (=> b!297933 (= e!188248 (seekKeyOrZeroReturnVacant!0 (x!29542 lt!148092) (index!11324 lt!148092) (index!11324 lt!148092) k!2524 lt!147962 mask!3809))))

(declare-fun b!297934 () Bool)

(declare-fun e!188247 () SeekEntryResult!2288)

(assert (=> b!297934 (= e!188247 e!188249)))

(assert (=> b!297934 (= lt!148093 (select (arr!7139 lt!147962) (index!11324 lt!148092)))))

(declare-fun c!48003 () Bool)

(assert (=> b!297934 (= c!48003 (= lt!148093 k!2524))))

(declare-fun b!297935 () Bool)

(assert (=> b!297935 (= e!188247 Undefined!2288)))

(declare-fun d!67265 () Bool)

(declare-fun lt!148091 () SeekEntryResult!2288)

(assert (=> d!67265 (and (or (is-Undefined!2288 lt!148091) (not (is-Found!2288 lt!148091)) (and (bvsge (index!11323 lt!148091) #b00000000000000000000000000000000) (bvslt (index!11323 lt!148091) (size!7491 lt!147962)))) (or (is-Undefined!2288 lt!148091) (is-Found!2288 lt!148091) (not (is-MissingZero!2288 lt!148091)) (and (bvsge (index!11322 lt!148091) #b00000000000000000000000000000000) (bvslt (index!11322 lt!148091) (size!7491 lt!147962)))) (or (is-Undefined!2288 lt!148091) (is-Found!2288 lt!148091) (is-MissingZero!2288 lt!148091) (not (is-MissingVacant!2288 lt!148091)) (and (bvsge (index!11325 lt!148091) #b00000000000000000000000000000000) (bvslt (index!11325 lt!148091) (size!7491 lt!147962)))) (or (is-Undefined!2288 lt!148091) (ite (is-Found!2288 lt!148091) (= (select (arr!7139 lt!147962) (index!11323 lt!148091)) k!2524) (ite (is-MissingZero!2288 lt!148091) (= (select (arr!7139 lt!147962) (index!11322 lt!148091)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2288 lt!148091) (= (select (arr!7139 lt!147962) (index!11325 lt!148091)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67265 (= lt!148091 e!188247)))

(declare-fun c!48001 () Bool)

(assert (=> d!67265 (= c!48001 (and (is-Intermediate!2288 lt!148092) (undefined!3100 lt!148092)))))

(assert (=> d!67265 (= lt!148092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 lt!147962 mask!3809))))

(assert (=> d!67265 (validMask!0 mask!3809)))

(assert (=> d!67265 (= (seekEntryOrOpen!0 k!2524 lt!147962 mask!3809) lt!148091)))

(assert (= (and d!67265 c!48001) b!297935))

(assert (= (and d!67265 (not c!48001)) b!297934))

(assert (= (and b!297934 c!48003) b!297930))

(assert (= (and b!297934 (not c!48003)) b!297931))

(assert (= (and b!297931 c!48002) b!297932))

(assert (= (and b!297931 (not c!48002)) b!297933))

(declare-fun m!310561 () Bool)

(assert (=> b!297933 m!310561))

(declare-fun m!310563 () Bool)

(assert (=> b!297934 m!310563))

(declare-fun m!310565 () Bool)

(assert (=> d!67265 m!310565))

(assert (=> d!67265 m!310399))

(declare-fun m!310567 () Bool)

(assert (=> d!67265 m!310567))

(assert (=> d!67265 m!310385))

(declare-fun m!310569 () Bool)

(assert (=> d!67265 m!310569))

(declare-fun m!310571 () Bool)

(assert (=> d!67265 m!310571))

(assert (=> d!67265 m!310399))

(assert (=> b!297696 d!67265))

(declare-fun d!67267 () Bool)

(assert (=> d!67267 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297701 d!67267))

(declare-fun d!67269 () Bool)

(assert (=> d!67269 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29398 d!67269))

(declare-fun d!67275 () Bool)

(assert (=> d!67275 (= (array_inv!5102 a!3312) (bvsge (size!7491 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29398 d!67275))

(declare-fun b!298004 () Bool)

(declare-fun e!188294 () Bool)

(declare-fun call!25771 () Bool)

(assert (=> b!298004 (= e!188294 call!25771)))

(declare-fun b!298005 () Bool)

(declare-fun e!188296 () Bool)

(assert (=> b!298005 (= e!188296 e!188294)))

(declare-fun lt!148127 () (_ BitVec 64))

(assert (=> b!298005 (= lt!148127 (select (arr!7139 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148126 () Unit!9292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15066 (_ BitVec 64) (_ BitVec 32)) Unit!9292)

(assert (=> b!298005 (= lt!148126 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148127 #b00000000000000000000000000000000))))

(assert (=> b!298005 (arrayContainsKey!0 a!3312 lt!148127 #b00000000000000000000000000000000)))

(declare-fun lt!148128 () Unit!9292)

(assert (=> b!298005 (= lt!148128 lt!148126)))

(declare-fun res!157125 () Bool)

(assert (=> b!298005 (= res!157125 (= (seekEntryOrOpen!0 (select (arr!7139 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2288 #b00000000000000000000000000000000)))))

(assert (=> b!298005 (=> (not res!157125) (not e!188294))))

(declare-fun b!298006 () Bool)

(assert (=> b!298006 (= e!188296 call!25771)))

(declare-fun d!67277 () Bool)

(declare-fun res!157124 () Bool)

(declare-fun e!188295 () Bool)

(assert (=> d!67277 (=> res!157124 e!188295)))

(assert (=> d!67277 (= res!157124 (bvsge #b00000000000000000000000000000000 (size!7491 a!3312)))))

(assert (=> d!67277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188295)))

(declare-fun bm!25768 () Bool)

(assert (=> bm!25768 (= call!25771 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298007 () Bool)

(assert (=> b!298007 (= e!188295 e!188296)))

(declare-fun c!48024 () Bool)

(assert (=> b!298007 (= c!48024 (validKeyInArray!0 (select (arr!7139 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!67277 (not res!157124)) b!298007))

(assert (= (and b!298007 c!48024) b!298005))

(assert (= (and b!298007 (not c!48024)) b!298006))

(assert (= (and b!298005 res!157125) b!298004))

(assert (= (or b!298004 b!298006) bm!25768))

(declare-fun m!310611 () Bool)

(assert (=> b!298005 m!310611))

(declare-fun m!310613 () Bool)

(assert (=> b!298005 m!310613))

(declare-fun m!310615 () Bool)

(assert (=> b!298005 m!310615))

(assert (=> b!298005 m!310611))

(declare-fun m!310617 () Bool)

(assert (=> b!298005 m!310617))

(declare-fun m!310619 () Bool)

(assert (=> bm!25768 m!310619))

(assert (=> b!298007 m!310611))

(assert (=> b!298007 m!310611))

(declare-fun m!310621 () Bool)

(assert (=> b!298007 m!310621))

(assert (=> b!297700 d!67277))

(declare-fun d!67285 () Bool)

(declare-fun res!157130 () Bool)

(declare-fun e!188301 () Bool)

(assert (=> d!67285 (=> res!157130 e!188301)))

(assert (=> d!67285 (= res!157130 (= (select (arr!7139 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67285 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!188301)))

(declare-fun b!298012 () Bool)

(declare-fun e!188302 () Bool)

(assert (=> b!298012 (= e!188301 e!188302)))

(declare-fun res!157131 () Bool)

(assert (=> b!298012 (=> (not res!157131) (not e!188302))))

(assert (=> b!298012 (= res!157131 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7491 a!3312)))))

(declare-fun b!298013 () Bool)

(assert (=> b!298013 (= e!188302 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67285 (not res!157130)) b!298012))

(assert (= (and b!298012 res!157131) b!298013))

(assert (=> d!67285 m!310611))

(declare-fun m!310623 () Bool)

(assert (=> b!298013 m!310623))

(assert (=> b!297690 d!67285))

(push 1)

