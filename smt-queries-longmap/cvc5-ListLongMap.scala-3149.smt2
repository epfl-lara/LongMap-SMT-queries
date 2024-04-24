; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44310 () Bool)

(assert start!44310)

(declare-fun b!487364 () Bool)

(declare-fun res!290808 () Bool)

(declare-fun e!286744 () Bool)

(assert (=> b!487364 (=> (not res!290808) (not e!286744))))

(declare-datatypes ((array!31562 0))(
  ( (array!31563 (arr!15174 (Array (_ BitVec 32) (_ BitVec 64))) (size!15538 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31562)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487364 (= res!290808 (validKeyInArray!0 (select (arr!15174 a!3235) j!176)))))

(declare-fun b!487365 () Bool)

(declare-fun res!290804 () Bool)

(declare-fun e!286745 () Bool)

(assert (=> b!487365 (=> (not res!290804) (not e!286745))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31562 (_ BitVec 32)) Bool)

(assert (=> b!487365 (= res!290804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487366 () Bool)

(declare-fun res!290805 () Bool)

(assert (=> b!487366 (=> (not res!290805) (not e!286745))))

(declare-datatypes ((List!9239 0))(
  ( (Nil!9236) (Cons!9235 (h!10091 (_ BitVec 64)) (t!15459 List!9239)) )
))
(declare-fun arrayNoDuplicates!0 (array!31562 (_ BitVec 32) List!9239) Bool)

(assert (=> b!487366 (= res!290805 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9236))))

(declare-fun b!487367 () Bool)

(declare-fun res!290809 () Bool)

(assert (=> b!487367 (=> (not res!290809) (not e!286744))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487367 (= res!290809 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487368 () Bool)

(declare-fun res!290806 () Bool)

(assert (=> b!487368 (=> (not res!290806) (not e!286744))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487368 (= res!290806 (and (= (size!15538 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15538 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15538 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290812 () Bool)

(assert (=> start!44310 (=> (not res!290812) (not e!286744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44310 (= res!290812 (validMask!0 mask!3524))))

(assert (=> start!44310 e!286744))

(assert (=> start!44310 true))

(declare-fun array_inv!11033 (array!31562) Bool)

(assert (=> start!44310 (array_inv!11033 a!3235)))

(declare-fun b!487369 () Bool)

(assert (=> b!487369 (= e!286744 e!286745)))

(declare-fun res!290810 () Bool)

(assert (=> b!487369 (=> (not res!290810) (not e!286745))))

(declare-datatypes ((SeekEntryResult!3597 0))(
  ( (MissingZero!3597 (index!16567 (_ BitVec 32))) (Found!3597 (index!16568 (_ BitVec 32))) (Intermediate!3597 (undefined!4409 Bool) (index!16569 (_ BitVec 32)) (x!45830 (_ BitVec 32))) (Undefined!3597) (MissingVacant!3597 (index!16570 (_ BitVec 32))) )
))
(declare-fun lt!220030 () SeekEntryResult!3597)

(assert (=> b!487369 (= res!290810 (or (= lt!220030 (MissingZero!3597 i!1204)) (= lt!220030 (MissingVacant!3597 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31562 (_ BitVec 32)) SeekEntryResult!3597)

(assert (=> b!487369 (= lt!220030 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487370 () Bool)

(assert (=> b!487370 (= e!286745 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(declare-fun e!286743 () Bool)

(assert (=> b!487370 e!286743))

(declare-fun res!290811 () Bool)

(assert (=> b!487370 (=> (not res!290811) (not e!286743))))

(assert (=> b!487370 (= res!290811 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14201 0))(
  ( (Unit!14202) )
))
(declare-fun lt!220029 () Unit!14201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14201)

(assert (=> b!487370 (= lt!220029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487371 () Bool)

(declare-fun res!290807 () Bool)

(assert (=> b!487371 (=> (not res!290807) (not e!286744))))

(assert (=> b!487371 (= res!290807 (validKeyInArray!0 k!2280))))

(declare-fun b!487372 () Bool)

(assert (=> b!487372 (= e!286743 (= (seekEntryOrOpen!0 (select (arr!15174 a!3235) j!176) a!3235 mask!3524) (Found!3597 j!176)))))

(assert (= (and start!44310 res!290812) b!487368))

(assert (= (and b!487368 res!290806) b!487364))

(assert (= (and b!487364 res!290808) b!487371))

(assert (= (and b!487371 res!290807) b!487367))

(assert (= (and b!487367 res!290809) b!487369))

(assert (= (and b!487369 res!290810) b!487365))

(assert (= (and b!487365 res!290804) b!487366))

(assert (= (and b!487366 res!290805) b!487370))

(assert (= (and b!487370 res!290811) b!487372))

(declare-fun m!467425 () Bool)

(assert (=> b!487366 m!467425))

(declare-fun m!467427 () Bool)

(assert (=> b!487365 m!467427))

(declare-fun m!467429 () Bool)

(assert (=> b!487370 m!467429))

(declare-fun m!467431 () Bool)

(assert (=> b!487370 m!467431))

(declare-fun m!467433 () Bool)

(assert (=> b!487369 m!467433))

(declare-fun m!467435 () Bool)

(assert (=> start!44310 m!467435))

(declare-fun m!467437 () Bool)

(assert (=> start!44310 m!467437))

(declare-fun m!467439 () Bool)

(assert (=> b!487367 m!467439))

(declare-fun m!467441 () Bool)

(assert (=> b!487371 m!467441))

(declare-fun m!467443 () Bool)

(assert (=> b!487372 m!467443))

(assert (=> b!487372 m!467443))

(declare-fun m!467445 () Bool)

(assert (=> b!487372 m!467445))

(assert (=> b!487364 m!467443))

(assert (=> b!487364 m!467443))

(declare-fun m!467447 () Bool)

(assert (=> b!487364 m!467447))

(push 1)

(assert (not start!44310))

(assert (not b!487367))

(assert (not b!487364))

(assert (not b!487365))

(assert (not b!487372))

(assert (not b!487370))

(assert (not b!487369))

(assert (not b!487371))

(assert (not b!487366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!31272 () Bool)

(declare-fun call!31275 () Bool)

(declare-fun c!58553 () Bool)

(assert (=> bm!31272 (= call!31275 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58553 (Cons!9235 (select (arr!15174 a!3235) #b00000000000000000000000000000000) Nil!9236) Nil!9236)))))

(declare-fun b!487399 () Bool)

(declare-fun e!286768 () Bool)

(declare-fun e!286770 () Bool)

(assert (=> b!487399 (= e!286768 e!286770)))

(declare-fun res!290829 () Bool)

(assert (=> b!487399 (=> (not res!290829) (not e!286770))))

(declare-fun e!286771 () Bool)

(assert (=> b!487399 (= res!290829 (not e!286771))))

(declare-fun res!290831 () Bool)

(assert (=> b!487399 (=> (not res!290831) (not e!286771))))

(assert (=> b!487399 (= res!290831 (validKeyInArray!0 (select (arr!15174 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487400 () Bool)

(declare-fun e!286769 () Bool)

(assert (=> b!487400 (= e!286769 call!31275)))

(declare-fun d!77669 () Bool)

(declare-fun res!290830 () Bool)

(assert (=> d!77669 (=> res!290830 e!286768)))

(assert (=> d!77669 (= res!290830 (bvsge #b00000000000000000000000000000000 (size!15538 a!3235)))))

(assert (=> d!77669 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9236) e!286768)))

(declare-fun b!487401 () Bool)

(assert (=> b!487401 (= e!286770 e!286769)))

(assert (=> b!487401 (= c!58553 (validKeyInArray!0 (select (arr!15174 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487402 () Bool)

(declare-fun contains!2674 (List!9239 (_ BitVec 64)) Bool)

(assert (=> b!487402 (= e!286771 (contains!2674 Nil!9236 (select (arr!15174 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487403 () Bool)

(assert (=> b!487403 (= e!286769 call!31275)))

(assert (= (and d!77669 (not res!290830)) b!487399))

(assert (= (and b!487399 res!290831) b!487402))

(assert (= (and b!487399 res!290829) b!487401))

(assert (= (and b!487401 c!58553) b!487403))

(assert (= (and b!487401 (not c!58553)) b!487400))

(assert (= (or b!487403 b!487400) bm!31272))

(declare-fun m!467461 () Bool)

(assert (=> bm!31272 m!467461))

(declare-fun m!467463 () Bool)

(assert (=> bm!31272 m!467463))

(assert (=> b!487399 m!467461))

(assert (=> b!487399 m!467461))

(declare-fun m!467465 () Bool)

(assert (=> b!487399 m!467465))

(assert (=> b!487401 m!467461))

(assert (=> b!487401 m!467461))

(assert (=> b!487401 m!467465))

(assert (=> b!487402 m!467461))

(assert (=> b!487402 m!467461))

(declare-fun m!467467 () Bool)

(assert (=> b!487402 m!467467))

(assert (=> b!487366 d!77669))

(declare-fun lt!220053 () SeekEntryResult!3597)

(declare-fun e!286800 () SeekEntryResult!3597)

(declare-fun b!487445 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31562 (_ BitVec 32)) SeekEntryResult!3597)

(assert (=> b!487445 (= e!286800 (seekKeyOrZeroReturnVacant!0 (x!45830 lt!220053) (index!16569 lt!220053) (index!16569 lt!220053) (select (arr!15174 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!487446 () Bool)

(declare-fun e!286799 () SeekEntryResult!3597)

(assert (=> b!487446 (= e!286799 (Found!3597 (index!16569 lt!220053)))))

(declare-fun b!487448 () Bool)

(declare-fun c!58571 () Bool)

(declare-fun lt!220054 () (_ BitVec 64))

(assert (=> b!487448 (= c!58571 (= lt!220054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487448 (= e!286799 e!286800)))

(declare-fun b!487449 () Bool)

(declare-fun e!286798 () SeekEntryResult!3597)

(assert (=> b!487449 (= e!286798 e!286799)))

(assert (=> b!487449 (= lt!220054 (select (arr!15174 a!3235) (index!16569 lt!220053)))))

(declare-fun c!58569 () Bool)

(assert (=> b!487449 (= c!58569 (= lt!220054 (select (arr!15174 a!3235) j!176)))))

(declare-fun b!487450 () Bool)

(assert (=> b!487450 (= e!286800 (MissingZero!3597 (index!16569 lt!220053)))))

(declare-fun b!487447 () Bool)

(assert (=> b!487447 (= e!286798 Undefined!3597)))

(declare-fun d!77679 () Bool)

(declare-fun lt!220052 () SeekEntryResult!3597)

(assert (=> d!77679 (and (or (is-Undefined!3597 lt!220052) (not (is-Found!3597 lt!220052)) (and (bvsge (index!16568 lt!220052) #b00000000000000000000000000000000) (bvslt (index!16568 lt!220052) (size!15538 a!3235)))) (or (is-Undefined!3597 lt!220052) (is-Found!3597 lt!220052) (not (is-MissingZero!3597 lt!220052)) (and (bvsge (index!16567 lt!220052) #b00000000000000000000000000000000) (bvslt (index!16567 lt!220052) (size!15538 a!3235)))) (or (is-Undefined!3597 lt!220052) (is-Found!3597 lt!220052) (is-MissingZero!3597 lt!220052) (not (is-MissingVacant!3597 lt!220052)) (and (bvsge (index!16570 lt!220052) #b00000000000000000000000000000000) (bvslt (index!16570 lt!220052) (size!15538 a!3235)))) (or (is-Undefined!3597 lt!220052) (ite (is-Found!3597 lt!220052) (= (select (arr!15174 a!3235) (index!16568 lt!220052)) (select (arr!15174 a!3235) j!176)) (ite (is-MissingZero!3597 lt!220052) (= (select (arr!15174 a!3235) (index!16567 lt!220052)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3597 lt!220052) (= (select (arr!15174 a!3235) (index!16570 lt!220052)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77679 (= lt!220052 e!286798)))

(declare-fun c!58570 () Bool)

(assert (=> d!77679 (= c!58570 (and (is-Intermediate!3597 lt!220053) (undefined!4409 lt!220053)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31562 (_ BitVec 32)) SeekEntryResult!3597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77679 (= lt!220053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15174 a!3235) j!176) mask!3524) (select (arr!15174 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77679 (validMask!0 mask!3524)))

(assert (=> d!77679 (= (seekEntryOrOpen!0 (select (arr!15174 a!3235) j!176) a!3235 mask!3524) lt!220052)))

(assert (= (and d!77679 c!58570) b!487447))

(assert (= (and d!77679 (not c!58570)) b!487449))

(assert (= (and b!487449 c!58569) b!487446))

(assert (= (and b!487449 (not c!58569)) b!487448))

(assert (= (and b!487448 c!58571) b!487450))

(assert (= (and b!487448 (not c!58571)) b!487445))

(assert (=> b!487445 m!467443))

(declare-fun m!467479 () Bool)

(assert (=> b!487445 m!467479))

(declare-fun m!467481 () Bool)

(assert (=> b!487449 m!467481))

(declare-fun m!467483 () Bool)

(assert (=> d!77679 m!467483))

(declare-fun m!467485 () Bool)

(assert (=> d!77679 m!467485))

(declare-fun m!467487 () Bool)

(assert (=> d!77679 m!467487))

(assert (=> d!77679 m!467435))

(assert (=> d!77679 m!467443))

(declare-fun m!467489 () Bool)

(assert (=> d!77679 m!467489))

(assert (=> d!77679 m!467489))

(assert (=> d!77679 m!467443))

(declare-fun m!467491 () Bool)

(assert (=> d!77679 m!467491))

(assert (=> b!487372 d!77679))

(declare-fun d!77685 () Bool)

(declare-fun res!290847 () Bool)

(declare-fun e!286805 () Bool)

(assert (=> d!77685 (=> res!290847 e!286805)))

(assert (=> d!77685 (= res!290847 (= (select (arr!15174 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77685 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!286805)))

(declare-fun b!487455 () Bool)

(declare-fun e!286806 () Bool)

(assert (=> b!487455 (= e!286805 e!286806)))

(declare-fun res!290848 () Bool)

(assert (=> b!487455 (=> (not res!290848) (not e!286806))))

(assert (=> b!487455 (= res!290848 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15538 a!3235)))))

(declare-fun b!487456 () Bool)

(assert (=> b!487456 (= e!286806 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77685 (not res!290847)) b!487455))

(assert (= (and b!487455 res!290848) b!487456))

(assert (=> d!77685 m!467461))

(declare-fun m!467493 () Bool)

(assert (=> b!487456 m!467493))

(assert (=> b!487367 d!77685))

(declare-fun call!31281 () Bool)

(declare-fun bm!31278 () Bool)

(assert (=> bm!31278 (= call!31281 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487483 () Bool)

(declare-fun e!286827 () Bool)

(assert (=> b!487483 (= e!286827 call!31281)))

(declare-fun b!487484 () Bool)

(declare-fun e!286825 () Bool)

(assert (=> b!487484 (= e!286825 e!286827)))

(declare-fun lt!220067 () (_ BitVec 64))

(assert (=> b!487484 (= lt!220067 (select (arr!15174 a!3235) j!176))))

(declare-fun lt!220068 () Unit!14201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31562 (_ BitVec 64) (_ BitVec 32)) Unit!14201)

(assert (=> b!487484 (= lt!220068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220067 j!176))))

(assert (=> b!487484 (arrayContainsKey!0 a!3235 lt!220067 #b00000000000000000000000000000000)))

(declare-fun lt!220069 () Unit!14201)

(assert (=> b!487484 (= lt!220069 lt!220068)))

(declare-fun res!290860 () Bool)

(assert (=> b!487484 (= res!290860 (= (seekEntryOrOpen!0 (select (arr!15174 a!3235) j!176) a!3235 mask!3524) (Found!3597 j!176)))))

(assert (=> b!487484 (=> (not res!290860) (not e!286827))))

(declare-fun d!77687 () Bool)

(declare-fun res!290859 () Bool)

(declare-fun e!286826 () Bool)

(assert (=> d!77687 (=> res!290859 e!286826)))

(assert (=> d!77687 (= res!290859 (bvsge j!176 (size!15538 a!3235)))))

(assert (=> d!77687 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!286826)))

(declare-fun b!487485 () Bool)

(assert (=> b!487485 (= e!286826 e!286825)))

(declare-fun c!58580 () Bool)

(assert (=> b!487485 (= c!58580 (validKeyInArray!0 (select (arr!15174 a!3235) j!176)))))

(declare-fun b!487486 () Bool)

(assert (=> b!487486 (= e!286825 call!31281)))

(assert (= (and d!77687 (not res!290859)) b!487485))

(assert (= (and b!487485 c!58580) b!487484))

(assert (= (and b!487485 (not c!58580)) b!487486))

(assert (= (and b!487484 res!290860) b!487483))

(assert (= (or b!487483 b!487486) bm!31278))

(declare-fun m!467525 () Bool)

(assert (=> bm!31278 m!467525))

(assert (=> b!487484 m!467443))

(declare-fun m!467527 () Bool)

(assert (=> b!487484 m!467527))

(declare-fun m!467529 () Bool)

(assert (=> b!487484 m!467529))

(assert (=> b!487484 m!467443))

(assert (=> b!487484 m!467445))

(assert (=> b!487485 m!467443))

(assert (=> b!487485 m!467443))

(assert (=> b!487485 m!467447))

(assert (=> b!487370 d!77687))

(declare-fun d!77701 () Bool)

(assert (=> d!77701 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220075 () Unit!14201)

(declare-fun choose!38 (array!31562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14201)

(assert (=> d!77701 (= lt!220075 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77701 (validMask!0 mask!3524)))

(assert (=> d!77701 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220075)))

(declare-fun bs!15554 () Bool)

(assert (= bs!15554 d!77701))

(assert (=> bs!15554 m!467429))

(declare-fun m!467537 () Bool)

(assert (=> bs!15554 m!467537))

(assert (=> bs!15554 m!467435))

(assert (=> b!487370 d!77701))

(declare-fun bm!31280 () Bool)

(declare-fun call!31283 () Bool)

(assert (=> bm!31280 (= call!31283 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487491 () Bool)

(declare-fun e!286833 () Bool)

(assert (=> b!487491 (= e!286833 call!31283)))

(declare-fun b!487492 () Bool)

(declare-fun e!286831 () Bool)

(assert (=> b!487492 (= e!286831 e!286833)))

(declare-fun lt!220076 () (_ BitVec 64))

(assert (=> b!487492 (= lt!220076 (select (arr!15174 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220077 () Unit!14201)

(assert (=> b!487492 (= lt!220077 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220076 #b00000000000000000000000000000000))))

(assert (=> b!487492 (arrayContainsKey!0 a!3235 lt!220076 #b00000000000000000000000000000000)))

(declare-fun lt!220078 () Unit!14201)

(assert (=> b!487492 (= lt!220078 lt!220077)))

(declare-fun res!290864 () Bool)

(assert (=> b!487492 (= res!290864 (= (seekEntryOrOpen!0 (select (arr!15174 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3597 #b00000000000000000000000000000000)))))

(assert (=> b!487492 (=> (not res!290864) (not e!286833))))

(declare-fun d!77705 () Bool)

(declare-fun res!290863 () Bool)

(declare-fun e!286832 () Bool)

(assert (=> d!77705 (=> res!290863 e!286832)))

(assert (=> d!77705 (= res!290863 (bvsge #b00000000000000000000000000000000 (size!15538 a!3235)))))

(assert (=> d!77705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286832)))

(declare-fun b!487493 () Bool)

(assert (=> b!487493 (= e!286832 e!286831)))

(declare-fun c!58582 () Bool)

(assert (=> b!487493 (= c!58582 (validKeyInArray!0 (select (arr!15174 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487494 () Bool)

(assert (=> b!487494 (= e!286831 call!31283)))

(assert (= (and d!77705 (not res!290863)) b!487493))

(assert (= (and b!487493 c!58582) b!487492))

(assert (= (and b!487493 (not c!58582)) b!487494))

(assert (= (and b!487492 res!290864) b!487491))

(assert (= (or b!487491 b!487494) bm!31280))

(declare-fun m!467539 () Bool)

(assert (=> bm!31280 m!467539))

(assert (=> b!487492 m!467461))

(declare-fun m!467541 () Bool)

(assert (=> b!487492 m!467541))

(declare-fun m!467543 () Bool)

(assert (=> b!487492 m!467543))

(assert (=> b!487492 m!467461))

(declare-fun m!467545 () Bool)

(assert (=> b!487492 m!467545))

(assert (=> b!487493 m!467461))

(assert (=> b!487493 m!467461))

(assert (=> b!487493 m!467465))

(assert (=> b!487365 d!77705))

(declare-fun d!77707 () Bool)

(assert (=> d!77707 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487371 d!77707))

(declare-fun b!487501 () Bool)

(declare-fun lt!220086 () SeekEntryResult!3597)

(declare-fun e!286840 () SeekEntryResult!3597)

(assert (=> b!487501 (= e!286840 (seekKeyOrZeroReturnVacant!0 (x!45830 lt!220086) (index!16569 lt!220086) (index!16569 lt!220086) k!2280 a!3235 mask!3524))))

(declare-fun b!487502 () Bool)

(declare-fun e!286839 () SeekEntryResult!3597)

(assert (=> b!487502 (= e!286839 (Found!3597 (index!16569 lt!220086)))))

(declare-fun b!487504 () Bool)

(declare-fun c!58587 () Bool)

(declare-fun lt!220087 () (_ BitVec 64))

(assert (=> b!487504 (= c!58587 (= lt!220087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487504 (= e!286839 e!286840)))

(declare-fun b!487505 () Bool)

(declare-fun e!286838 () SeekEntryResult!3597)

(assert (=> b!487505 (= e!286838 e!286839)))

(assert (=> b!487505 (= lt!220087 (select (arr!15174 a!3235) (index!16569 lt!220086)))))

(declare-fun c!58585 () Bool)

(assert (=> b!487505 (= c!58585 (= lt!220087 k!2280))))

(declare-fun b!487506 () Bool)

(assert (=> b!487506 (= e!286840 (MissingZero!3597 (index!16569 lt!220086)))))

(declare-fun b!487503 () Bool)

(assert (=> b!487503 (= e!286838 Undefined!3597)))

(declare-fun d!77709 () Bool)

(declare-fun lt!220085 () SeekEntryResult!3597)

(assert (=> d!77709 (and (or (is-Undefined!3597 lt!220085) (not (is-Found!3597 lt!220085)) (and (bvsge (index!16568 lt!220085) #b00000000000000000000000000000000) (bvslt (index!16568 lt!220085) (size!15538 a!3235)))) (or (is-Undefined!3597 lt!220085) (is-Found!3597 lt!220085) (not (is-MissingZero!3597 lt!220085)) (and (bvsge (index!16567 lt!220085) #b00000000000000000000000000000000) (bvslt (index!16567 lt!220085) (size!15538 a!3235)))) (or (is-Undefined!3597 lt!220085) (is-Found!3597 lt!220085) (is-MissingZero!3597 lt!220085) (not (is-MissingVacant!3597 lt!220085)) (and (bvsge (index!16570 lt!220085) #b00000000000000000000000000000000) (bvslt (index!16570 lt!220085) (size!15538 a!3235)))) (or (is-Undefined!3597 lt!220085) (ite (is-Found!3597 lt!220085) (= (select (arr!15174 a!3235) (index!16568 lt!220085)) k!2280) (ite (is-MissingZero!3597 lt!220085) (= (select (arr!15174 a!3235) (index!16567 lt!220085)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3597 lt!220085) (= (select (arr!15174 a!3235) (index!16570 lt!220085)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77709 (= lt!220085 e!286838)))

(declare-fun c!58586 () Bool)

(assert (=> d!77709 (= c!58586 (and (is-Intermediate!3597 lt!220086) (undefined!4409 lt!220086)))))

(assert (=> d!77709 (= lt!220086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77709 (validMask!0 mask!3524)))

(assert (=> d!77709 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220085)))

(assert (= (and d!77709 c!58586) b!487503))

(assert (= (and d!77709 (not c!58586)) b!487505))

(assert (= (and b!487505 c!58585) b!487502))

(assert (= (and b!487505 (not c!58585)) b!487504))

(assert (= (and b!487504 c!58587) b!487506))

(assert (= (and b!487504 (not c!58587)) b!487501))

(declare-fun m!467547 () Bool)

(assert (=> b!487501 m!467547))

(declare-fun m!467549 () Bool)

(assert (=> b!487505 m!467549))

(declare-fun m!467551 () Bool)

(assert (=> d!77709 m!467551))

(declare-fun m!467553 () Bool)

(assert (=> d!77709 m!467553))

(declare-fun m!467555 () Bool)

(assert (=> d!77709 m!467555))

(assert (=> d!77709 m!467435))

(declare-fun m!467557 () Bool)

(assert (=> d!77709 m!467557))

(assert (=> d!77709 m!467557))

(declare-fun m!467559 () Bool)

(assert (=> d!77709 m!467559))

(assert (=> b!487369 d!77709))

(declare-fun d!77711 () Bool)

(assert (=> d!77711 (= (validKeyInArray!0 (select (arr!15174 a!3235) j!176)) (and (not (= (select (arr!15174 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15174 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487364 d!77711))

(declare-fun d!77713 () Bool)

(assert (=> d!77713 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44310 d!77713))

(declare-fun d!77721 () Bool)

(assert (=> d!77721 (= (array_inv!11033 a!3235) (bvsge (size!15538 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44310 d!77721))

(push 1)

(assert (not b!487445))

(assert (not b!487485))

(assert (not b!487493))

(assert (not b!487484))

(assert (not b!487399))

(assert (not d!77709))

(assert (not b!487501))

(assert (not b!487401))

(assert (not bm!31280))

(assert (not bm!31272))

(assert (not d!77679))

(assert (not bm!31278))

(assert (not b!487402))

(assert (not b!487492))

(assert (not d!77701))

(assert (not b!487456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

