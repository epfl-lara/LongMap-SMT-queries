; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122384 () Bool)

(assert start!122384)

(declare-fun b!1418415 () Bool)

(declare-fun res!954109 () Bool)

(declare-fun e!802673 () Bool)

(assert (=> b!1418415 (=> (not res!954109) (not e!802673))))

(declare-datatypes ((array!96813 0))(
  ( (array!96814 (arr!46729 (Array (_ BitVec 32) (_ BitVec 64))) (size!47281 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96813)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418415 (= res!954109 (validKeyInArray!0 (select (arr!46729 a!2831) j!81)))))

(declare-fun res!954110 () Bool)

(assert (=> start!122384 (=> (not res!954110) (not e!802673))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122384 (= res!954110 (validMask!0 mask!2608))))

(assert (=> start!122384 e!802673))

(assert (=> start!122384 true))

(declare-fun array_inv!35962 (array!96813) Bool)

(assert (=> start!122384 (array_inv!35962 a!2831)))

(declare-fun b!1418416 () Bool)

(declare-fun res!954111 () Bool)

(assert (=> b!1418416 (=> (not res!954111) (not e!802673))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418416 (= res!954111 (and (= (size!47281 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47281 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47281 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418417 () Bool)

(declare-fun res!954108 () Bool)

(assert (=> b!1418417 (=> (not res!954108) (not e!802673))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418417 (= res!954108 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47281 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47281 a!2831))))))

(declare-fun b!1418418 () Bool)

(declare-fun res!954107 () Bool)

(assert (=> b!1418418 (=> (not res!954107) (not e!802673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96813 (_ BitVec 32)) Bool)

(assert (=> b!1418418 (= res!954107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418419 () Bool)

(declare-fun res!954106 () Bool)

(assert (=> b!1418419 (=> (not res!954106) (not e!802673))))

(declare-datatypes ((List!33317 0))(
  ( (Nil!33314) (Cons!33313 (h!34606 (_ BitVec 64)) (t!48003 List!33317)) )
))
(declare-fun arrayNoDuplicates!0 (array!96813 (_ BitVec 32) List!33317) Bool)

(assert (=> b!1418419 (= res!954106 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33314))))

(declare-fun b!1418420 () Bool)

(declare-fun lt!625400 () (_ BitVec 32))

(assert (=> b!1418420 (= e!802673 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625400 #b00000000000000000000000000000000) (bvsge lt!625400 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418420 (= lt!625400 (toIndex!0 (select (arr!46729 a!2831) j!81) mask!2608))))

(declare-fun b!1418421 () Bool)

(declare-fun res!954112 () Bool)

(assert (=> b!1418421 (=> (not res!954112) (not e!802673))))

(assert (=> b!1418421 (= res!954112 (validKeyInArray!0 (select (arr!46729 a!2831) i!982)))))

(assert (= (and start!122384 res!954110) b!1418416))

(assert (= (and b!1418416 res!954111) b!1418421))

(assert (= (and b!1418421 res!954112) b!1418415))

(assert (= (and b!1418415 res!954109) b!1418418))

(assert (= (and b!1418418 res!954107) b!1418419))

(assert (= (and b!1418419 res!954106) b!1418417))

(assert (= (and b!1418417 res!954108) b!1418420))

(declare-fun m!1308629 () Bool)

(assert (=> start!122384 m!1308629))

(declare-fun m!1308631 () Bool)

(assert (=> start!122384 m!1308631))

(declare-fun m!1308633 () Bool)

(assert (=> b!1418419 m!1308633))

(declare-fun m!1308635 () Bool)

(assert (=> b!1418418 m!1308635))

(declare-fun m!1308637 () Bool)

(assert (=> b!1418421 m!1308637))

(assert (=> b!1418421 m!1308637))

(declare-fun m!1308639 () Bool)

(assert (=> b!1418421 m!1308639))

(declare-fun m!1308641 () Bool)

(assert (=> b!1418420 m!1308641))

(assert (=> b!1418420 m!1308641))

(declare-fun m!1308643 () Bool)

(assert (=> b!1418420 m!1308643))

(assert (=> b!1418415 m!1308641))

(assert (=> b!1418415 m!1308641))

(declare-fun m!1308645 () Bool)

(assert (=> b!1418415 m!1308645))

(check-sat (not b!1418421) (not b!1418420) (not start!122384) (not b!1418419) (not b!1418418) (not b!1418415))
(check-sat)
(get-model)

(declare-fun d!152753 () Bool)

(assert (=> d!152753 (= (validKeyInArray!0 (select (arr!46729 a!2831) j!81)) (and (not (= (select (arr!46729 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46729 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418415 d!152753))

(declare-fun d!152755 () Bool)

(assert (=> d!152755 (= (validKeyInArray!0 (select (arr!46729 a!2831) i!982)) (and (not (= (select (arr!46729 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46729 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418421 d!152755))

(declare-fun d!152757 () Bool)

(assert (=> d!152757 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122384 d!152757))

(declare-fun d!152759 () Bool)

(assert (=> d!152759 (= (array_inv!35962 a!2831) (bvsge (size!47281 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122384 d!152759))

(declare-fun bm!67247 () Bool)

(declare-fun call!67250 () Bool)

(assert (=> bm!67247 (= call!67250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418472 () Bool)

(declare-fun e!802694 () Bool)

(assert (=> b!1418472 (= e!802694 call!67250)))

(declare-fun b!1418473 () Bool)

(declare-fun e!802692 () Bool)

(assert (=> b!1418473 (= e!802692 call!67250)))

(declare-fun d!152761 () Bool)

(declare-fun res!954161 () Bool)

(declare-fun e!802693 () Bool)

(assert (=> d!152761 (=> res!954161 e!802693)))

(assert (=> d!152761 (= res!954161 (bvsge #b00000000000000000000000000000000 (size!47281 a!2831)))))

(assert (=> d!152761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802693)))

(declare-fun b!1418474 () Bool)

(assert (=> b!1418474 (= e!802692 e!802694)))

(declare-fun lt!625420 () (_ BitVec 64))

(assert (=> b!1418474 (= lt!625420 (select (arr!46729 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47911 0))(
  ( (Unit!47912) )
))
(declare-fun lt!625419 () Unit!47911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96813 (_ BitVec 64) (_ BitVec 32)) Unit!47911)

(assert (=> b!1418474 (= lt!625419 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625420 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418474 (arrayContainsKey!0 a!2831 lt!625420 #b00000000000000000000000000000000)))

(declare-fun lt!625421 () Unit!47911)

(assert (=> b!1418474 (= lt!625421 lt!625419)))

(declare-fun res!954162 () Bool)

(declare-datatypes ((SeekEntryResult!11047 0))(
  ( (MissingZero!11047 (index!46580 (_ BitVec 32))) (Found!11047 (index!46581 (_ BitVec 32))) (Intermediate!11047 (undefined!11859 Bool) (index!46582 (_ BitVec 32)) (x!128226 (_ BitVec 32))) (Undefined!11047) (MissingVacant!11047 (index!46583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96813 (_ BitVec 32)) SeekEntryResult!11047)

(assert (=> b!1418474 (= res!954162 (= (seekEntryOrOpen!0 (select (arr!46729 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11047 #b00000000000000000000000000000000)))))

(assert (=> b!1418474 (=> (not res!954162) (not e!802694))))

(declare-fun b!1418475 () Bool)

(assert (=> b!1418475 (= e!802693 e!802692)))

(declare-fun c!131641 () Bool)

(assert (=> b!1418475 (= c!131641 (validKeyInArray!0 (select (arr!46729 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152761 (not res!954161)) b!1418475))

(assert (= (and b!1418475 c!131641) b!1418474))

(assert (= (and b!1418475 (not c!131641)) b!1418473))

(assert (= (and b!1418474 res!954162) b!1418472))

(assert (= (or b!1418472 b!1418473) bm!67247))

(declare-fun m!1308683 () Bool)

(assert (=> bm!67247 m!1308683))

(declare-fun m!1308685 () Bool)

(assert (=> b!1418474 m!1308685))

(declare-fun m!1308687 () Bool)

(assert (=> b!1418474 m!1308687))

(declare-fun m!1308689 () Bool)

(assert (=> b!1418474 m!1308689))

(assert (=> b!1418474 m!1308685))

(declare-fun m!1308691 () Bool)

(assert (=> b!1418474 m!1308691))

(assert (=> b!1418475 m!1308685))

(assert (=> b!1418475 m!1308685))

(declare-fun m!1308693 () Bool)

(assert (=> b!1418475 m!1308693))

(assert (=> b!1418418 d!152761))

(declare-fun b!1418498 () Bool)

(declare-fun e!802712 () Bool)

(declare-fun e!802714 () Bool)

(assert (=> b!1418498 (= e!802712 e!802714)))

(declare-fun c!131647 () Bool)

(assert (=> b!1418498 (= c!131647 (validKeyInArray!0 (select (arr!46729 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418499 () Bool)

(declare-fun e!802713 () Bool)

(assert (=> b!1418499 (= e!802713 e!802712)))

(declare-fun res!954176 () Bool)

(assert (=> b!1418499 (=> (not res!954176) (not e!802712))))

(declare-fun e!802715 () Bool)

(assert (=> b!1418499 (= res!954176 (not e!802715))))

(declare-fun res!954177 () Bool)

(assert (=> b!1418499 (=> (not res!954177) (not e!802715))))

(assert (=> b!1418499 (= res!954177 (validKeyInArray!0 (select (arr!46729 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418500 () Bool)

(declare-fun contains!9801 (List!33317 (_ BitVec 64)) Bool)

(assert (=> b!1418500 (= e!802715 (contains!9801 Nil!33314 (select (arr!46729 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152771 () Bool)

(declare-fun res!954175 () Bool)

(assert (=> d!152771 (=> res!954175 e!802713)))

(assert (=> d!152771 (= res!954175 (bvsge #b00000000000000000000000000000000 (size!47281 a!2831)))))

(assert (=> d!152771 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33314) e!802713)))

(declare-fun b!1418501 () Bool)

(declare-fun call!67256 () Bool)

(assert (=> b!1418501 (= e!802714 call!67256)))

(declare-fun bm!67253 () Bool)

(assert (=> bm!67253 (= call!67256 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131647 (Cons!33313 (select (arr!46729 a!2831) #b00000000000000000000000000000000) Nil!33314) Nil!33314)))))

(declare-fun b!1418502 () Bool)

(assert (=> b!1418502 (= e!802714 call!67256)))

(assert (= (and d!152771 (not res!954175)) b!1418499))

(assert (= (and b!1418499 res!954177) b!1418500))

(assert (= (and b!1418499 res!954176) b!1418498))

(assert (= (and b!1418498 c!131647) b!1418501))

(assert (= (and b!1418498 (not c!131647)) b!1418502))

(assert (= (or b!1418501 b!1418502) bm!67253))

(assert (=> b!1418498 m!1308685))

(assert (=> b!1418498 m!1308685))

(assert (=> b!1418498 m!1308693))

(assert (=> b!1418499 m!1308685))

(assert (=> b!1418499 m!1308685))

(assert (=> b!1418499 m!1308693))

(assert (=> b!1418500 m!1308685))

(assert (=> b!1418500 m!1308685))

(declare-fun m!1308707 () Bool)

(assert (=> b!1418500 m!1308707))

(assert (=> bm!67253 m!1308685))

(declare-fun m!1308709 () Bool)

(assert (=> bm!67253 m!1308709))

(assert (=> b!1418419 d!152771))

(declare-fun d!152781 () Bool)

(declare-fun lt!625451 () (_ BitVec 32))

(declare-fun lt!625450 () (_ BitVec 32))

(assert (=> d!152781 (= lt!625451 (bvmul (bvxor lt!625450 (bvlshr lt!625450 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152781 (= lt!625450 ((_ extract 31 0) (bvand (bvxor (select (arr!46729 a!2831) j!81) (bvlshr (select (arr!46729 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152781 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954178 (let ((h!34611 ((_ extract 31 0) (bvand (bvxor (select (arr!46729 a!2831) j!81) (bvlshr (select (arr!46729 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128225 (bvmul (bvxor h!34611 (bvlshr h!34611 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128225 (bvlshr x!128225 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954178 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954178 #b00000000000000000000000000000000))))))

(assert (=> d!152781 (= (toIndex!0 (select (arr!46729 a!2831) j!81) mask!2608) (bvand (bvxor lt!625451 (bvlshr lt!625451 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418420 d!152781))

(check-sat (not b!1418474) (not b!1418500) (not b!1418499) (not bm!67253) (not b!1418475) (not bm!67247) (not b!1418498))
(check-sat)
