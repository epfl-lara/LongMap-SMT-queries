; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47816 () Bool)

(assert start!47816)

(declare-fun b!526936 () Bool)

(declare-fun res!323493 () Bool)

(declare-fun e!307107 () Bool)

(assert (=> b!526936 (=> (not res!323493) (not e!307107))))

(declare-datatypes ((array!33453 0))(
  ( (array!33454 (arr!16078 (Array (_ BitVec 32) (_ BitVec 64))) (size!16442 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33453)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526936 (= res!323493 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526937 () Bool)

(declare-datatypes ((Unit!16632 0))(
  ( (Unit!16633) )
))
(declare-fun e!307112 () Unit!16632)

(declare-fun Unit!16634 () Unit!16632)

(assert (=> b!526937 (= e!307112 Unit!16634)))

(declare-fun b!526938 () Bool)

(declare-fun e!307109 () Bool)

(declare-fun e!307110 () Bool)

(assert (=> b!526938 (= e!307109 (not e!307110))))

(declare-fun res!323497 () Bool)

(assert (=> b!526938 (=> res!323497 e!307110)))

(declare-fun lt!242466 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4545 0))(
  ( (MissingZero!4545 (index!20392 (_ BitVec 32))) (Found!4545 (index!20393 (_ BitVec 32))) (Intermediate!4545 (undefined!5357 Bool) (index!20394 (_ BitVec 32)) (x!49358 (_ BitVec 32))) (Undefined!4545) (MissingVacant!4545 (index!20395 (_ BitVec 32))) )
))
(declare-fun lt!242471 () SeekEntryResult!4545)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!242473 () (_ BitVec 32))

(declare-fun lt!242470 () array!33453)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33453 (_ BitVec 32)) SeekEntryResult!4545)

(assert (=> b!526938 (= res!323497 (= lt!242471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242473 lt!242466 lt!242470 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242468 () (_ BitVec 32))

(assert (=> b!526938 (= lt!242471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242468 (select (arr!16078 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526938 (= lt!242473 (toIndex!0 lt!242466 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526938 (= lt!242466 (select (store (arr!16078 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526938 (= lt!242468 (toIndex!0 (select (arr!16078 a!3235) j!176) mask!3524))))

(assert (=> b!526938 (= lt!242470 (array!33454 (store (arr!16078 a!3235) i!1204 k0!2280) (size!16442 a!3235)))))

(declare-fun e!307113 () Bool)

(assert (=> b!526938 e!307113))

(declare-fun res!323488 () Bool)

(assert (=> b!526938 (=> (not res!323488) (not e!307113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33453 (_ BitVec 32)) Bool)

(assert (=> b!526938 (= res!323488 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242472 () Unit!16632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16632)

(assert (=> b!526938 (= lt!242472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526939 () Bool)

(declare-fun res!323487 () Bool)

(assert (=> b!526939 (=> (not res!323487) (not e!307107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526939 (= res!323487 (validKeyInArray!0 (select (arr!16078 a!3235) j!176)))))

(declare-fun b!526940 () Bool)

(declare-fun e!307108 () Bool)

(assert (=> b!526940 (= e!307108 false)))

(declare-fun b!526941 () Bool)

(assert (=> b!526941 (= e!307107 e!307109)))

(declare-fun res!323491 () Bool)

(assert (=> b!526941 (=> (not res!323491) (not e!307109))))

(declare-fun lt!242464 () SeekEntryResult!4545)

(assert (=> b!526941 (= res!323491 (or (= lt!242464 (MissingZero!4545 i!1204)) (= lt!242464 (MissingVacant!4545 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33453 (_ BitVec 32)) SeekEntryResult!4545)

(assert (=> b!526941 (= lt!242464 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526942 () Bool)

(assert (=> b!526942 (= e!307113 (= (seekEntryOrOpen!0 (select (arr!16078 a!3235) j!176) a!3235 mask!3524) (Found!4545 j!176)))))

(declare-fun b!526943 () Bool)

(declare-fun res!323495 () Bool)

(assert (=> b!526943 (=> (not res!323495) (not e!307107))))

(assert (=> b!526943 (= res!323495 (and (= (size!16442 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16442 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16442 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526944 () Bool)

(declare-fun res!323498 () Bool)

(assert (=> b!526944 (=> (not res!323498) (not e!307109))))

(declare-datatypes ((List!10236 0))(
  ( (Nil!10233) (Cons!10232 (h!11163 (_ BitVec 64)) (t!16464 List!10236)) )
))
(declare-fun arrayNoDuplicates!0 (array!33453 (_ BitVec 32) List!10236) Bool)

(assert (=> b!526944 (= res!323498 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10233))))

(declare-fun b!526945 () Bool)

(declare-fun res!323489 () Bool)

(assert (=> b!526945 (=> res!323489 e!307110)))

(get-info :version)

(assert (=> b!526945 (= res!323489 (or (undefined!5357 lt!242471) (not ((_ is Intermediate!4545) lt!242471))))))

(declare-fun b!526946 () Bool)

(assert (=> b!526946 (= e!307110 (or (bvsgt (x!49358 lt!242471) #b01111111111111111111111111111110) (and (bvsge lt!242468 #b00000000000000000000000000000000) (bvslt lt!242468 (size!16442 a!3235)))))))

(assert (=> b!526946 (= (index!20394 lt!242471) i!1204)))

(declare-fun lt!242465 () Unit!16632)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16632)

(assert (=> b!526946 (= lt!242465 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242468 #b00000000000000000000000000000000 (index!20394 lt!242471) (x!49358 lt!242471) mask!3524))))

(assert (=> b!526946 (and (or (= (select (arr!16078 a!3235) (index!20394 lt!242471)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16078 a!3235) (index!20394 lt!242471)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16078 a!3235) (index!20394 lt!242471)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16078 a!3235) (index!20394 lt!242471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242467 () Unit!16632)

(assert (=> b!526946 (= lt!242467 e!307112)))

(declare-fun c!62030 () Bool)

(assert (=> b!526946 (= c!62030 (= (select (arr!16078 a!3235) (index!20394 lt!242471)) (select (arr!16078 a!3235) j!176)))))

(assert (=> b!526946 (and (bvslt (x!49358 lt!242471) #b01111111111111111111111111111110) (or (= (select (arr!16078 a!3235) (index!20394 lt!242471)) (select (arr!16078 a!3235) j!176)) (= (select (arr!16078 a!3235) (index!20394 lt!242471)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16078 a!3235) (index!20394 lt!242471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!323496 () Bool)

(assert (=> start!47816 (=> (not res!323496) (not e!307107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47816 (= res!323496 (validMask!0 mask!3524))))

(assert (=> start!47816 e!307107))

(assert (=> start!47816 true))

(declare-fun array_inv!11874 (array!33453) Bool)

(assert (=> start!47816 (array_inv!11874 a!3235)))

(declare-fun b!526947 () Bool)

(declare-fun res!323494 () Bool)

(assert (=> b!526947 (=> (not res!323494) (not e!307109))))

(assert (=> b!526947 (= res!323494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526948 () Bool)

(declare-fun res!323492 () Bool)

(assert (=> b!526948 (=> (not res!323492) (not e!307107))))

(assert (=> b!526948 (= res!323492 (validKeyInArray!0 k0!2280))))

(declare-fun b!526949 () Bool)

(declare-fun Unit!16635 () Unit!16632)

(assert (=> b!526949 (= e!307112 Unit!16635)))

(declare-fun lt!242469 () Unit!16632)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16632)

(assert (=> b!526949 (= lt!242469 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242468 #b00000000000000000000000000000000 (index!20394 lt!242471) (x!49358 lt!242471) mask!3524))))

(declare-fun res!323490 () Bool)

(assert (=> b!526949 (= res!323490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242468 lt!242466 lt!242470 mask!3524) (Intermediate!4545 false (index!20394 lt!242471) (x!49358 lt!242471))))))

(assert (=> b!526949 (=> (not res!323490) (not e!307108))))

(assert (=> b!526949 e!307108))

(assert (= (and start!47816 res!323496) b!526943))

(assert (= (and b!526943 res!323495) b!526939))

(assert (= (and b!526939 res!323487) b!526948))

(assert (= (and b!526948 res!323492) b!526936))

(assert (= (and b!526936 res!323493) b!526941))

(assert (= (and b!526941 res!323491) b!526947))

(assert (= (and b!526947 res!323494) b!526944))

(assert (= (and b!526944 res!323498) b!526938))

(assert (= (and b!526938 res!323488) b!526942))

(assert (= (and b!526938 (not res!323497)) b!526945))

(assert (= (and b!526945 (not res!323489)) b!526946))

(assert (= (and b!526946 c!62030) b!526949))

(assert (= (and b!526946 (not c!62030)) b!526937))

(assert (= (and b!526949 res!323490) b!526940))

(declare-fun m!507665 () Bool)

(assert (=> b!526936 m!507665))

(declare-fun m!507667 () Bool)

(assert (=> b!526948 m!507667))

(declare-fun m!507669 () Bool)

(assert (=> b!526949 m!507669))

(declare-fun m!507671 () Bool)

(assert (=> b!526949 m!507671))

(declare-fun m!507673 () Bool)

(assert (=> b!526944 m!507673))

(declare-fun m!507675 () Bool)

(assert (=> b!526941 m!507675))

(declare-fun m!507677 () Bool)

(assert (=> b!526947 m!507677))

(declare-fun m!507679 () Bool)

(assert (=> b!526942 m!507679))

(assert (=> b!526942 m!507679))

(declare-fun m!507681 () Bool)

(assert (=> b!526942 m!507681))

(declare-fun m!507683 () Bool)

(assert (=> b!526938 m!507683))

(declare-fun m!507685 () Bool)

(assert (=> b!526938 m!507685))

(declare-fun m!507687 () Bool)

(assert (=> b!526938 m!507687))

(assert (=> b!526938 m!507679))

(declare-fun m!507689 () Bool)

(assert (=> b!526938 m!507689))

(assert (=> b!526938 m!507679))

(declare-fun m!507691 () Bool)

(assert (=> b!526938 m!507691))

(assert (=> b!526938 m!507679))

(declare-fun m!507693 () Bool)

(assert (=> b!526938 m!507693))

(declare-fun m!507695 () Bool)

(assert (=> b!526938 m!507695))

(declare-fun m!507697 () Bool)

(assert (=> b!526938 m!507697))

(declare-fun m!507699 () Bool)

(assert (=> b!526946 m!507699))

(declare-fun m!507701 () Bool)

(assert (=> b!526946 m!507701))

(assert (=> b!526946 m!507679))

(declare-fun m!507703 () Bool)

(assert (=> start!47816 m!507703))

(declare-fun m!507705 () Bool)

(assert (=> start!47816 m!507705))

(assert (=> b!526939 m!507679))

(assert (=> b!526939 m!507679))

(declare-fun m!507707 () Bool)

(assert (=> b!526939 m!507707))

(check-sat (not b!526949) (not b!526939) (not start!47816) (not b!526944) (not b!526938) (not b!526947) (not b!526948) (not b!526936) (not b!526941) (not b!526942) (not b!526946))
(check-sat)
(get-model)

(declare-fun b!527004 () Bool)

(declare-fun c!62042 () Bool)

(declare-fun lt!242511 () (_ BitVec 64))

(assert (=> b!527004 (= c!62042 (= lt!242511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307141 () SeekEntryResult!4545)

(declare-fun e!307143 () SeekEntryResult!4545)

(assert (=> b!527004 (= e!307141 e!307143)))

(declare-fun b!527005 () Bool)

(declare-fun lt!242512 () SeekEntryResult!4545)

(assert (=> b!527005 (= e!307141 (Found!4545 (index!20394 lt!242512)))))

(declare-fun b!527006 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33453 (_ BitVec 32)) SeekEntryResult!4545)

(assert (=> b!527006 (= e!307143 (seekKeyOrZeroReturnVacant!0 (x!49358 lt!242512) (index!20394 lt!242512) (index!20394 lt!242512) (select (arr!16078 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527007 () Bool)

(assert (=> b!527007 (= e!307143 (MissingZero!4545 (index!20394 lt!242512)))))

(declare-fun d!80771 () Bool)

(declare-fun lt!242510 () SeekEntryResult!4545)

(assert (=> d!80771 (and (or ((_ is Undefined!4545) lt!242510) (not ((_ is Found!4545) lt!242510)) (and (bvsge (index!20393 lt!242510) #b00000000000000000000000000000000) (bvslt (index!20393 lt!242510) (size!16442 a!3235)))) (or ((_ is Undefined!4545) lt!242510) ((_ is Found!4545) lt!242510) (not ((_ is MissingZero!4545) lt!242510)) (and (bvsge (index!20392 lt!242510) #b00000000000000000000000000000000) (bvslt (index!20392 lt!242510) (size!16442 a!3235)))) (or ((_ is Undefined!4545) lt!242510) ((_ is Found!4545) lt!242510) ((_ is MissingZero!4545) lt!242510) (not ((_ is MissingVacant!4545) lt!242510)) (and (bvsge (index!20395 lt!242510) #b00000000000000000000000000000000) (bvslt (index!20395 lt!242510) (size!16442 a!3235)))) (or ((_ is Undefined!4545) lt!242510) (ite ((_ is Found!4545) lt!242510) (= (select (arr!16078 a!3235) (index!20393 lt!242510)) (select (arr!16078 a!3235) j!176)) (ite ((_ is MissingZero!4545) lt!242510) (= (select (arr!16078 a!3235) (index!20392 lt!242510)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4545) lt!242510) (= (select (arr!16078 a!3235) (index!20395 lt!242510)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307142 () SeekEntryResult!4545)

(assert (=> d!80771 (= lt!242510 e!307142)))

(declare-fun c!62040 () Bool)

(assert (=> d!80771 (= c!62040 (and ((_ is Intermediate!4545) lt!242512) (undefined!5357 lt!242512)))))

(assert (=> d!80771 (= lt!242512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16078 a!3235) j!176) mask!3524) (select (arr!16078 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80771 (validMask!0 mask!3524)))

(assert (=> d!80771 (= (seekEntryOrOpen!0 (select (arr!16078 a!3235) j!176) a!3235 mask!3524) lt!242510)))

(declare-fun b!527008 () Bool)

(assert (=> b!527008 (= e!307142 Undefined!4545)))

(declare-fun b!527009 () Bool)

(assert (=> b!527009 (= e!307142 e!307141)))

(assert (=> b!527009 (= lt!242511 (select (arr!16078 a!3235) (index!20394 lt!242512)))))

(declare-fun c!62041 () Bool)

(assert (=> b!527009 (= c!62041 (= lt!242511 (select (arr!16078 a!3235) j!176)))))

(assert (= (and d!80771 c!62040) b!527008))

(assert (= (and d!80771 (not c!62040)) b!527009))

(assert (= (and b!527009 c!62041) b!527005))

(assert (= (and b!527009 (not c!62041)) b!527004))

(assert (= (and b!527004 c!62042) b!527007))

(assert (= (and b!527004 (not c!62042)) b!527006))

(assert (=> b!527006 m!507679))

(declare-fun m!507753 () Bool)

(assert (=> b!527006 m!507753))

(declare-fun m!507755 () Bool)

(assert (=> d!80771 m!507755))

(assert (=> d!80771 m!507679))

(assert (=> d!80771 m!507689))

(assert (=> d!80771 m!507689))

(assert (=> d!80771 m!507679))

(declare-fun m!507757 () Bool)

(assert (=> d!80771 m!507757))

(declare-fun m!507759 () Bool)

(assert (=> d!80771 m!507759))

(declare-fun m!507761 () Bool)

(assert (=> d!80771 m!507761))

(assert (=> d!80771 m!507703))

(declare-fun m!507763 () Bool)

(assert (=> b!527009 m!507763))

(assert (=> b!526942 d!80771))

(declare-fun bm!31871 () Bool)

(declare-fun call!31874 () Bool)

(assert (=> bm!31871 (= call!31874 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80775 () Bool)

(declare-fun res!323539 () Bool)

(declare-fun e!307151 () Bool)

(assert (=> d!80775 (=> res!323539 e!307151)))

(assert (=> d!80775 (= res!323539 (bvsge #b00000000000000000000000000000000 (size!16442 a!3235)))))

(assert (=> d!80775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307151)))

(declare-fun b!527018 () Bool)

(declare-fun e!307150 () Bool)

(assert (=> b!527018 (= e!307151 e!307150)))

(declare-fun c!62045 () Bool)

(assert (=> b!527018 (= c!62045 (validKeyInArray!0 (select (arr!16078 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527019 () Bool)

(declare-fun e!307152 () Bool)

(assert (=> b!527019 (= e!307152 call!31874)))

(declare-fun b!527020 () Bool)

(assert (=> b!527020 (= e!307150 e!307152)))

(declare-fun lt!242524 () (_ BitVec 64))

(assert (=> b!527020 (= lt!242524 (select (arr!16078 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!242523 () Unit!16632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33453 (_ BitVec 64) (_ BitVec 32)) Unit!16632)

(assert (=> b!527020 (= lt!242523 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242524 #b00000000000000000000000000000000))))

(assert (=> b!527020 (arrayContainsKey!0 a!3235 lt!242524 #b00000000000000000000000000000000)))

(declare-fun lt!242522 () Unit!16632)

(assert (=> b!527020 (= lt!242522 lt!242523)))

(declare-fun res!323540 () Bool)

(assert (=> b!527020 (= res!323540 (= (seekEntryOrOpen!0 (select (arr!16078 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4545 #b00000000000000000000000000000000)))))

(assert (=> b!527020 (=> (not res!323540) (not e!307152))))

(declare-fun b!527021 () Bool)

(assert (=> b!527021 (= e!307150 call!31874)))

(assert (= (and d!80775 (not res!323539)) b!527018))

(assert (= (and b!527018 c!62045) b!527020))

(assert (= (and b!527018 (not c!62045)) b!527021))

(assert (= (and b!527020 res!323540) b!527019))

(assert (= (or b!527019 b!527021) bm!31871))

(declare-fun m!507767 () Bool)

(assert (=> bm!31871 m!507767))

(declare-fun m!507769 () Bool)

(assert (=> b!527018 m!507769))

(assert (=> b!527018 m!507769))

(declare-fun m!507771 () Bool)

(assert (=> b!527018 m!507771))

(assert (=> b!527020 m!507769))

(declare-fun m!507773 () Bool)

(assert (=> b!527020 m!507773))

(declare-fun m!507775 () Bool)

(assert (=> b!527020 m!507775))

(assert (=> b!527020 m!507769))

(declare-fun m!507777 () Bool)

(assert (=> b!527020 m!507777))

(assert (=> b!526947 d!80775))

(declare-fun d!80781 () Bool)

(declare-fun res!323545 () Bool)

(declare-fun e!307157 () Bool)

(assert (=> d!80781 (=> res!323545 e!307157)))

(assert (=> d!80781 (= res!323545 (= (select (arr!16078 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80781 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!307157)))

(declare-fun b!527026 () Bool)

(declare-fun e!307158 () Bool)

(assert (=> b!527026 (= e!307157 e!307158)))

(declare-fun res!323546 () Bool)

(assert (=> b!527026 (=> (not res!323546) (not e!307158))))

(assert (=> b!527026 (= res!323546 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16442 a!3235)))))

(declare-fun b!527027 () Bool)

(assert (=> b!527027 (= e!307158 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80781 (not res!323545)) b!527026))

(assert (= (and b!527026 res!323546) b!527027))

(assert (=> d!80781 m!507769))

(declare-fun m!507779 () Bool)

(assert (=> b!527027 m!507779))

(assert (=> b!526936 d!80781))

(declare-fun b!527028 () Bool)

(declare-fun c!62048 () Bool)

(declare-fun lt!242526 () (_ BitVec 64))

(assert (=> b!527028 (= c!62048 (= lt!242526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307159 () SeekEntryResult!4545)

(declare-fun e!307161 () SeekEntryResult!4545)

(assert (=> b!527028 (= e!307159 e!307161)))

(declare-fun b!527029 () Bool)

(declare-fun lt!242527 () SeekEntryResult!4545)

(assert (=> b!527029 (= e!307159 (Found!4545 (index!20394 lt!242527)))))

(declare-fun b!527030 () Bool)

(assert (=> b!527030 (= e!307161 (seekKeyOrZeroReturnVacant!0 (x!49358 lt!242527) (index!20394 lt!242527) (index!20394 lt!242527) k0!2280 a!3235 mask!3524))))

(declare-fun b!527031 () Bool)

(assert (=> b!527031 (= e!307161 (MissingZero!4545 (index!20394 lt!242527)))))

(declare-fun d!80783 () Bool)

(declare-fun lt!242525 () SeekEntryResult!4545)

(assert (=> d!80783 (and (or ((_ is Undefined!4545) lt!242525) (not ((_ is Found!4545) lt!242525)) (and (bvsge (index!20393 lt!242525) #b00000000000000000000000000000000) (bvslt (index!20393 lt!242525) (size!16442 a!3235)))) (or ((_ is Undefined!4545) lt!242525) ((_ is Found!4545) lt!242525) (not ((_ is MissingZero!4545) lt!242525)) (and (bvsge (index!20392 lt!242525) #b00000000000000000000000000000000) (bvslt (index!20392 lt!242525) (size!16442 a!3235)))) (or ((_ is Undefined!4545) lt!242525) ((_ is Found!4545) lt!242525) ((_ is MissingZero!4545) lt!242525) (not ((_ is MissingVacant!4545) lt!242525)) (and (bvsge (index!20395 lt!242525) #b00000000000000000000000000000000) (bvslt (index!20395 lt!242525) (size!16442 a!3235)))) (or ((_ is Undefined!4545) lt!242525) (ite ((_ is Found!4545) lt!242525) (= (select (arr!16078 a!3235) (index!20393 lt!242525)) k0!2280) (ite ((_ is MissingZero!4545) lt!242525) (= (select (arr!16078 a!3235) (index!20392 lt!242525)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4545) lt!242525) (= (select (arr!16078 a!3235) (index!20395 lt!242525)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307160 () SeekEntryResult!4545)

(assert (=> d!80783 (= lt!242525 e!307160)))

(declare-fun c!62046 () Bool)

(assert (=> d!80783 (= c!62046 (and ((_ is Intermediate!4545) lt!242527) (undefined!5357 lt!242527)))))

(assert (=> d!80783 (= lt!242527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80783 (validMask!0 mask!3524)))

(assert (=> d!80783 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!242525)))

(declare-fun b!527032 () Bool)

(assert (=> b!527032 (= e!307160 Undefined!4545)))

(declare-fun b!527033 () Bool)

(assert (=> b!527033 (= e!307160 e!307159)))

(assert (=> b!527033 (= lt!242526 (select (arr!16078 a!3235) (index!20394 lt!242527)))))

(declare-fun c!62047 () Bool)

(assert (=> b!527033 (= c!62047 (= lt!242526 k0!2280))))

(assert (= (and d!80783 c!62046) b!527032))

(assert (= (and d!80783 (not c!62046)) b!527033))

(assert (= (and b!527033 c!62047) b!527029))

(assert (= (and b!527033 (not c!62047)) b!527028))

(assert (= (and b!527028 c!62048) b!527031))

(assert (= (and b!527028 (not c!62048)) b!527030))

(declare-fun m!507781 () Bool)

(assert (=> b!527030 m!507781))

(declare-fun m!507783 () Bool)

(assert (=> d!80783 m!507783))

(declare-fun m!507785 () Bool)

(assert (=> d!80783 m!507785))

(assert (=> d!80783 m!507785))

(declare-fun m!507787 () Bool)

(assert (=> d!80783 m!507787))

(declare-fun m!507789 () Bool)

(assert (=> d!80783 m!507789))

(declare-fun m!507791 () Bool)

(assert (=> d!80783 m!507791))

(assert (=> d!80783 m!507703))

(declare-fun m!507793 () Bool)

(assert (=> b!527033 m!507793))

(assert (=> b!526941 d!80783))

(declare-fun d!80785 () Bool)

(assert (=> d!80785 (= (index!20394 lt!242471) i!1204)))

(declare-fun lt!242536 () Unit!16632)

(declare-fun choose!104 (array!33453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16632)

(assert (=> d!80785 (= lt!242536 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!242468 #b00000000000000000000000000000000 (index!20394 lt!242471) (x!49358 lt!242471) mask!3524))))

(assert (=> d!80785 (validMask!0 mask!3524)))

(assert (=> d!80785 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242468 #b00000000000000000000000000000000 (index!20394 lt!242471) (x!49358 lt!242471) mask!3524) lt!242536)))

(declare-fun bs!16526 () Bool)

(assert (= bs!16526 d!80785))

(declare-fun m!507795 () Bool)

(assert (=> bs!16526 m!507795))

(assert (=> bs!16526 m!507703))

(assert (=> b!526946 d!80785))

(declare-fun d!80787 () Bool)

(assert (=> d!80787 (= (validKeyInArray!0 (select (arr!16078 a!3235) j!176)) (and (not (= (select (arr!16078 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16078 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526939 d!80787))

(declare-fun b!527062 () Bool)

(declare-fun e!307182 () Bool)

(declare-fun e!307179 () Bool)

(assert (=> b!527062 (= e!307182 e!307179)))

(declare-fun res!323555 () Bool)

(assert (=> b!527062 (=> (not res!323555) (not e!307179))))

(declare-fun e!307181 () Bool)

(assert (=> b!527062 (= res!323555 (not e!307181))))

(declare-fun res!323554 () Bool)

(assert (=> b!527062 (=> (not res!323554) (not e!307181))))

(assert (=> b!527062 (= res!323554 (validKeyInArray!0 (select (arr!16078 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80789 () Bool)

(declare-fun res!323553 () Bool)

(assert (=> d!80789 (=> res!323553 e!307182)))

(assert (=> d!80789 (= res!323553 (bvsge #b00000000000000000000000000000000 (size!16442 a!3235)))))

(assert (=> d!80789 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10233) e!307182)))

(declare-fun b!527063 () Bool)

(declare-fun e!307180 () Bool)

(declare-fun call!31877 () Bool)

(assert (=> b!527063 (= e!307180 call!31877)))

(declare-fun b!527064 () Bool)

(assert (=> b!527064 (= e!307179 e!307180)))

(declare-fun c!62060 () Bool)

(assert (=> b!527064 (= c!62060 (validKeyInArray!0 (select (arr!16078 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31874 () Bool)

(assert (=> bm!31874 (= call!31877 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62060 (Cons!10232 (select (arr!16078 a!3235) #b00000000000000000000000000000000) Nil!10233) Nil!10233)))))

(declare-fun b!527065 () Bool)

(declare-fun contains!2773 (List!10236 (_ BitVec 64)) Bool)

(assert (=> b!527065 (= e!307181 (contains!2773 Nil!10233 (select (arr!16078 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527066 () Bool)

(assert (=> b!527066 (= e!307180 call!31877)))

(assert (= (and d!80789 (not res!323553)) b!527062))

(assert (= (and b!527062 res!323554) b!527065))

(assert (= (and b!527062 res!323555) b!527064))

(assert (= (and b!527064 c!62060) b!527066))

(assert (= (and b!527064 (not c!62060)) b!527063))

(assert (= (or b!527066 b!527063) bm!31874))

(assert (=> b!527062 m!507769))

(assert (=> b!527062 m!507769))

(assert (=> b!527062 m!507771))

(assert (=> b!527064 m!507769))

(assert (=> b!527064 m!507769))

(assert (=> b!527064 m!507771))

(assert (=> bm!31874 m!507769))

(declare-fun m!507809 () Bool)

(assert (=> bm!31874 m!507809))

(assert (=> b!527065 m!507769))

(assert (=> b!527065 m!507769))

(declare-fun m!507811 () Bool)

(assert (=> b!527065 m!507811))

(assert (=> b!526944 d!80789))

(declare-fun d!80797 () Bool)

(assert (=> d!80797 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47816 d!80797))

(declare-fun d!80809 () Bool)

(assert (=> d!80809 (= (array_inv!11874 a!3235) (bvsge (size!16442 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47816 d!80809))

(declare-fun d!80811 () Bool)

(declare-fun e!307227 () Bool)

(assert (=> d!80811 e!307227))

(declare-fun res!323585 () Bool)

(assert (=> d!80811 (=> (not res!323585) (not e!307227))))

(assert (=> d!80811 (= res!323585 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16442 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16442 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16442 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16442 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16442 a!3235))))))

(declare-fun lt!242586 () Unit!16632)

(declare-fun choose!47 (array!33453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16632)

(assert (=> d!80811 (= lt!242586 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!242468 #b00000000000000000000000000000000 (index!20394 lt!242471) (x!49358 lt!242471) mask!3524))))

(assert (=> d!80811 (validMask!0 mask!3524)))

(assert (=> d!80811 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242468 #b00000000000000000000000000000000 (index!20394 lt!242471) (x!49358 lt!242471) mask!3524) lt!242586)))

(declare-fun b!527127 () Bool)

(assert (=> b!527127 (= e!307227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242468 (select (store (arr!16078 a!3235) i!1204 k0!2280) j!176) (array!33454 (store (arr!16078 a!3235) i!1204 k0!2280) (size!16442 a!3235)) mask!3524) (Intermediate!4545 false (index!20394 lt!242471) (x!49358 lt!242471))))))

(assert (= (and d!80811 res!323585) b!527127))

(declare-fun m!507863 () Bool)

(assert (=> d!80811 m!507863))

(assert (=> d!80811 m!507703))

(assert (=> b!527127 m!507685))

(assert (=> b!527127 m!507687))

(assert (=> b!527127 m!507687))

(declare-fun m!507865 () Bool)

(assert (=> b!527127 m!507865))

(assert (=> b!526949 d!80811))

(declare-fun b!527230 () Bool)

(declare-fun e!307291 () Bool)

(declare-fun e!307288 () Bool)

(assert (=> b!527230 (= e!307291 e!307288)))

(declare-fun res!323624 () Bool)

(declare-fun lt!242612 () SeekEntryResult!4545)

(assert (=> b!527230 (= res!323624 (and ((_ is Intermediate!4545) lt!242612) (not (undefined!5357 lt!242612)) (bvslt (x!49358 lt!242612) #b01111111111111111111111111111110) (bvsge (x!49358 lt!242612) #b00000000000000000000000000000000) (bvsge (x!49358 lt!242612) #b00000000000000000000000000000000)))))

(assert (=> b!527230 (=> (not res!323624) (not e!307288))))

(declare-fun b!527231 () Bool)

(declare-fun e!307290 () SeekEntryResult!4545)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527231 (= e!307290 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242468 #b00000000000000000000000000000000 mask!3524) lt!242466 lt!242470 mask!3524))))

(declare-fun b!527232 () Bool)

(assert (=> b!527232 (and (bvsge (index!20394 lt!242612) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242612) (size!16442 lt!242470)))))

(declare-fun res!323625 () Bool)

(assert (=> b!527232 (= res!323625 (= (select (arr!16078 lt!242470) (index!20394 lt!242612)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307292 () Bool)

(assert (=> b!527232 (=> res!323625 e!307292)))

(declare-fun b!527233 () Bool)

(assert (=> b!527233 (= e!307291 (bvsge (x!49358 lt!242612) #b01111111111111111111111111111110))))

(declare-fun d!80823 () Bool)

(assert (=> d!80823 e!307291))

(declare-fun c!62112 () Bool)

(assert (=> d!80823 (= c!62112 (and ((_ is Intermediate!4545) lt!242612) (undefined!5357 lt!242612)))))

(declare-fun e!307289 () SeekEntryResult!4545)

(assert (=> d!80823 (= lt!242612 e!307289)))

(declare-fun c!62110 () Bool)

(assert (=> d!80823 (= c!62110 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242613 () (_ BitVec 64))

(assert (=> d!80823 (= lt!242613 (select (arr!16078 lt!242470) lt!242468))))

(assert (=> d!80823 (validMask!0 mask!3524)))

(assert (=> d!80823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242468 lt!242466 lt!242470 mask!3524) lt!242612)))

(declare-fun b!527234 () Bool)

(assert (=> b!527234 (and (bvsge (index!20394 lt!242612) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242612) (size!16442 lt!242470)))))

(assert (=> b!527234 (= e!307292 (= (select (arr!16078 lt!242470) (index!20394 lt!242612)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527235 () Bool)

(assert (=> b!527235 (= e!307289 e!307290)))

(declare-fun c!62111 () Bool)

(assert (=> b!527235 (= c!62111 (or (= lt!242613 lt!242466) (= (bvadd lt!242613 lt!242613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527236 () Bool)

(assert (=> b!527236 (= e!307289 (Intermediate!4545 true lt!242468 #b00000000000000000000000000000000))))

(declare-fun b!527237 () Bool)

(assert (=> b!527237 (= e!307290 (Intermediate!4545 false lt!242468 #b00000000000000000000000000000000))))

(declare-fun b!527238 () Bool)

(assert (=> b!527238 (and (bvsge (index!20394 lt!242612) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242612) (size!16442 lt!242470)))))

(declare-fun res!323623 () Bool)

(assert (=> b!527238 (= res!323623 (= (select (arr!16078 lt!242470) (index!20394 lt!242612)) lt!242466))))

(assert (=> b!527238 (=> res!323623 e!307292)))

(assert (=> b!527238 (= e!307288 e!307292)))

(assert (= (and d!80823 c!62110) b!527236))

(assert (= (and d!80823 (not c!62110)) b!527235))

(assert (= (and b!527235 c!62111) b!527237))

(assert (= (and b!527235 (not c!62111)) b!527231))

(assert (= (and d!80823 c!62112) b!527233))

(assert (= (and d!80823 (not c!62112)) b!527230))

(assert (= (and b!527230 res!323624) b!527238))

(assert (= (and b!527238 (not res!323623)) b!527232))

(assert (= (and b!527232 (not res!323625)) b!527234))

(declare-fun m!507909 () Bool)

(assert (=> b!527231 m!507909))

(assert (=> b!527231 m!507909))

(declare-fun m!507911 () Bool)

(assert (=> b!527231 m!507911))

(declare-fun m!507913 () Bool)

(assert (=> b!527232 m!507913))

(assert (=> b!527234 m!507913))

(assert (=> b!527238 m!507913))

(declare-fun m!507915 () Bool)

(assert (=> d!80823 m!507915))

(assert (=> d!80823 m!507703))

(assert (=> b!526949 d!80823))

(declare-fun b!527248 () Bool)

(declare-fun e!307301 () Bool)

(declare-fun e!307298 () Bool)

(assert (=> b!527248 (= e!307301 e!307298)))

(declare-fun res!323630 () Bool)

(declare-fun lt!242620 () SeekEntryResult!4545)

(assert (=> b!527248 (= res!323630 (and ((_ is Intermediate!4545) lt!242620) (not (undefined!5357 lt!242620)) (bvslt (x!49358 lt!242620) #b01111111111111111111111111111110) (bvsge (x!49358 lt!242620) #b00000000000000000000000000000000) (bvsge (x!49358 lt!242620) #b00000000000000000000000000000000)))))

(assert (=> b!527248 (=> (not res!323630) (not e!307298))))

(declare-fun e!307300 () SeekEntryResult!4545)

(declare-fun b!527249 () Bool)

(assert (=> b!527249 (= e!307300 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242473 #b00000000000000000000000000000000 mask!3524) lt!242466 lt!242470 mask!3524))))

(declare-fun b!527250 () Bool)

(assert (=> b!527250 (and (bvsge (index!20394 lt!242620) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242620) (size!16442 lt!242470)))))

(declare-fun res!323631 () Bool)

(assert (=> b!527250 (= res!323631 (= (select (arr!16078 lt!242470) (index!20394 lt!242620)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307302 () Bool)

(assert (=> b!527250 (=> res!323631 e!307302)))

(declare-fun b!527251 () Bool)

(assert (=> b!527251 (= e!307301 (bvsge (x!49358 lt!242620) #b01111111111111111111111111111110))))

(declare-fun d!80841 () Bool)

(assert (=> d!80841 e!307301))

(declare-fun c!62118 () Bool)

(assert (=> d!80841 (= c!62118 (and ((_ is Intermediate!4545) lt!242620) (undefined!5357 lt!242620)))))

(declare-fun e!307299 () SeekEntryResult!4545)

(assert (=> d!80841 (= lt!242620 e!307299)))

(declare-fun c!62116 () Bool)

(assert (=> d!80841 (= c!62116 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242621 () (_ BitVec 64))

(assert (=> d!80841 (= lt!242621 (select (arr!16078 lt!242470) lt!242473))))

(assert (=> d!80841 (validMask!0 mask!3524)))

(assert (=> d!80841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242473 lt!242466 lt!242470 mask!3524) lt!242620)))

(declare-fun b!527252 () Bool)

(assert (=> b!527252 (and (bvsge (index!20394 lt!242620) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242620) (size!16442 lt!242470)))))

(assert (=> b!527252 (= e!307302 (= (select (arr!16078 lt!242470) (index!20394 lt!242620)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527253 () Bool)

(assert (=> b!527253 (= e!307299 e!307300)))

(declare-fun c!62117 () Bool)

(assert (=> b!527253 (= c!62117 (or (= lt!242621 lt!242466) (= (bvadd lt!242621 lt!242621) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527254 () Bool)

(assert (=> b!527254 (= e!307299 (Intermediate!4545 true lt!242473 #b00000000000000000000000000000000))))

(declare-fun b!527255 () Bool)

(assert (=> b!527255 (= e!307300 (Intermediate!4545 false lt!242473 #b00000000000000000000000000000000))))

(declare-fun b!527256 () Bool)

(assert (=> b!527256 (and (bvsge (index!20394 lt!242620) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242620) (size!16442 lt!242470)))))

(declare-fun res!323629 () Bool)

(assert (=> b!527256 (= res!323629 (= (select (arr!16078 lt!242470) (index!20394 lt!242620)) lt!242466))))

(assert (=> b!527256 (=> res!323629 e!307302)))

(assert (=> b!527256 (= e!307298 e!307302)))

(assert (= (and d!80841 c!62116) b!527254))

(assert (= (and d!80841 (not c!62116)) b!527253))

(assert (= (and b!527253 c!62117) b!527255))

(assert (= (and b!527253 (not c!62117)) b!527249))

(assert (= (and d!80841 c!62118) b!527251))

(assert (= (and d!80841 (not c!62118)) b!527248))

(assert (= (and b!527248 res!323630) b!527256))

(assert (= (and b!527256 (not res!323629)) b!527250))

(assert (= (and b!527250 (not res!323631)) b!527252))

(declare-fun m!507923 () Bool)

(assert (=> b!527249 m!507923))

(assert (=> b!527249 m!507923))

(declare-fun m!507927 () Bool)

(assert (=> b!527249 m!507927))

(declare-fun m!507929 () Bool)

(assert (=> b!527250 m!507929))

(assert (=> b!527252 m!507929))

(assert (=> b!527256 m!507929))

(declare-fun m!507931 () Bool)

(assert (=> d!80841 m!507931))

(assert (=> d!80841 m!507703))

(assert (=> b!526938 d!80841))

(declare-fun d!80845 () Bool)

(declare-fun lt!242638 () (_ BitVec 32))

(declare-fun lt!242637 () (_ BitVec 32))

(assert (=> d!80845 (= lt!242638 (bvmul (bvxor lt!242637 (bvlshr lt!242637 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80845 (= lt!242637 ((_ extract 31 0) (bvand (bvxor (select (arr!16078 a!3235) j!176) (bvlshr (select (arr!16078 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80845 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323634 (let ((h!11167 ((_ extract 31 0) (bvand (bvxor (select (arr!16078 a!3235) j!176) (bvlshr (select (arr!16078 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49369 (bvmul (bvxor h!11167 (bvlshr h!11167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49369 (bvlshr x!49369 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323634 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323634 #b00000000000000000000000000000000))))))

(assert (=> d!80845 (= (toIndex!0 (select (arr!16078 a!3235) j!176) mask!3524) (bvand (bvxor lt!242638 (bvlshr lt!242638 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526938 d!80845))

(declare-fun bm!31886 () Bool)

(declare-fun call!31889 () Bool)

(assert (=> bm!31886 (= call!31889 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80853 () Bool)

(declare-fun res!323638 () Bool)

(declare-fun e!307313 () Bool)

(assert (=> d!80853 (=> res!323638 e!307313)))

(assert (=> d!80853 (= res!323638 (bvsge j!176 (size!16442 a!3235)))))

(assert (=> d!80853 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307313)))

(declare-fun b!527270 () Bool)

(declare-fun e!307312 () Bool)

(assert (=> b!527270 (= e!307313 e!307312)))

(declare-fun c!62123 () Bool)

(assert (=> b!527270 (= c!62123 (validKeyInArray!0 (select (arr!16078 a!3235) j!176)))))

(declare-fun b!527271 () Bool)

(declare-fun e!307314 () Bool)

(assert (=> b!527271 (= e!307314 call!31889)))

(declare-fun b!527272 () Bool)

(assert (=> b!527272 (= e!307312 e!307314)))

(declare-fun lt!242642 () (_ BitVec 64))

(assert (=> b!527272 (= lt!242642 (select (arr!16078 a!3235) j!176))))

(declare-fun lt!242641 () Unit!16632)

(assert (=> b!527272 (= lt!242641 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242642 j!176))))

(assert (=> b!527272 (arrayContainsKey!0 a!3235 lt!242642 #b00000000000000000000000000000000)))

(declare-fun lt!242640 () Unit!16632)

(assert (=> b!527272 (= lt!242640 lt!242641)))

(declare-fun res!323639 () Bool)

(assert (=> b!527272 (= res!323639 (= (seekEntryOrOpen!0 (select (arr!16078 a!3235) j!176) a!3235 mask!3524) (Found!4545 j!176)))))

(assert (=> b!527272 (=> (not res!323639) (not e!307314))))

(declare-fun b!527273 () Bool)

(assert (=> b!527273 (= e!307312 call!31889)))

(assert (= (and d!80853 (not res!323638)) b!527270))

(assert (= (and b!527270 c!62123) b!527272))

(assert (= (and b!527270 (not c!62123)) b!527273))

(assert (= (and b!527272 res!323639) b!527271))

(assert (= (or b!527271 b!527273) bm!31886))

(declare-fun m!507957 () Bool)

(assert (=> bm!31886 m!507957))

(assert (=> b!527270 m!507679))

(assert (=> b!527270 m!507679))

(assert (=> b!527270 m!507707))

(assert (=> b!527272 m!507679))

(declare-fun m!507961 () Bool)

(assert (=> b!527272 m!507961))

(declare-fun m!507963 () Bool)

(assert (=> b!527272 m!507963))

(assert (=> b!527272 m!507679))

(assert (=> b!527272 m!507681))

(assert (=> b!526938 d!80853))

(declare-fun d!80861 () Bool)

(assert (=> d!80861 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!242647 () Unit!16632)

(declare-fun choose!38 (array!33453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16632)

(assert (=> d!80861 (= lt!242647 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80861 (validMask!0 mask!3524)))

(assert (=> d!80861 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!242647)))

(declare-fun bs!16530 () Bool)

(assert (= bs!16530 d!80861))

(assert (=> bs!16530 m!507691))

(declare-fun m!507971 () Bool)

(assert (=> bs!16530 m!507971))

(assert (=> bs!16530 m!507703))

(assert (=> b!526938 d!80861))

(declare-fun d!80867 () Bool)

(declare-fun lt!242649 () (_ BitVec 32))

(declare-fun lt!242648 () (_ BitVec 32))

(assert (=> d!80867 (= lt!242649 (bvmul (bvxor lt!242648 (bvlshr lt!242648 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80867 (= lt!242648 ((_ extract 31 0) (bvand (bvxor lt!242466 (bvlshr lt!242466 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80867 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323634 (let ((h!11167 ((_ extract 31 0) (bvand (bvxor lt!242466 (bvlshr lt!242466 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49369 (bvmul (bvxor h!11167 (bvlshr h!11167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49369 (bvlshr x!49369 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323634 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323634 #b00000000000000000000000000000000))))))

(assert (=> d!80867 (= (toIndex!0 lt!242466 mask!3524) (bvand (bvxor lt!242649 (bvlshr lt!242649 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526938 d!80867))

(declare-fun b!527283 () Bool)

(declare-fun e!307323 () Bool)

(declare-fun e!307320 () Bool)

(assert (=> b!527283 (= e!307323 e!307320)))

(declare-fun res!323644 () Bool)

(declare-fun lt!242650 () SeekEntryResult!4545)

(assert (=> b!527283 (= res!323644 (and ((_ is Intermediate!4545) lt!242650) (not (undefined!5357 lt!242650)) (bvslt (x!49358 lt!242650) #b01111111111111111111111111111110) (bvsge (x!49358 lt!242650) #b00000000000000000000000000000000) (bvsge (x!49358 lt!242650) #b00000000000000000000000000000000)))))

(assert (=> b!527283 (=> (not res!323644) (not e!307320))))

(declare-fun e!307322 () SeekEntryResult!4545)

(declare-fun b!527284 () Bool)

(assert (=> b!527284 (= e!307322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242468 #b00000000000000000000000000000000 mask!3524) (select (arr!16078 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527285 () Bool)

(assert (=> b!527285 (and (bvsge (index!20394 lt!242650) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242650) (size!16442 a!3235)))))

(declare-fun res!323645 () Bool)

(assert (=> b!527285 (= res!323645 (= (select (arr!16078 a!3235) (index!20394 lt!242650)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307324 () Bool)

(assert (=> b!527285 (=> res!323645 e!307324)))

(declare-fun b!527286 () Bool)

(assert (=> b!527286 (= e!307323 (bvsge (x!49358 lt!242650) #b01111111111111111111111111111110))))

(declare-fun d!80869 () Bool)

(assert (=> d!80869 e!307323))

(declare-fun c!62129 () Bool)

(assert (=> d!80869 (= c!62129 (and ((_ is Intermediate!4545) lt!242650) (undefined!5357 lt!242650)))))

(declare-fun e!307321 () SeekEntryResult!4545)

(assert (=> d!80869 (= lt!242650 e!307321)))

(declare-fun c!62127 () Bool)

(assert (=> d!80869 (= c!62127 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242651 () (_ BitVec 64))

(assert (=> d!80869 (= lt!242651 (select (arr!16078 a!3235) lt!242468))))

(assert (=> d!80869 (validMask!0 mask!3524)))

(assert (=> d!80869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242468 (select (arr!16078 a!3235) j!176) a!3235 mask!3524) lt!242650)))

(declare-fun b!527287 () Bool)

(assert (=> b!527287 (and (bvsge (index!20394 lt!242650) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242650) (size!16442 a!3235)))))

(assert (=> b!527287 (= e!307324 (= (select (arr!16078 a!3235) (index!20394 lt!242650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527288 () Bool)

(assert (=> b!527288 (= e!307321 e!307322)))

(declare-fun c!62128 () Bool)

(assert (=> b!527288 (= c!62128 (or (= lt!242651 (select (arr!16078 a!3235) j!176)) (= (bvadd lt!242651 lt!242651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527289 () Bool)

(assert (=> b!527289 (= e!307321 (Intermediate!4545 true lt!242468 #b00000000000000000000000000000000))))

(declare-fun b!527290 () Bool)

(assert (=> b!527290 (= e!307322 (Intermediate!4545 false lt!242468 #b00000000000000000000000000000000))))

(declare-fun b!527291 () Bool)

(assert (=> b!527291 (and (bvsge (index!20394 lt!242650) #b00000000000000000000000000000000) (bvslt (index!20394 lt!242650) (size!16442 a!3235)))))

(declare-fun res!323643 () Bool)

(assert (=> b!527291 (= res!323643 (= (select (arr!16078 a!3235) (index!20394 lt!242650)) (select (arr!16078 a!3235) j!176)))))

(assert (=> b!527291 (=> res!323643 e!307324)))

(assert (=> b!527291 (= e!307320 e!307324)))

(assert (= (and d!80869 c!62127) b!527289))

(assert (= (and d!80869 (not c!62127)) b!527288))

(assert (= (and b!527288 c!62128) b!527290))

(assert (= (and b!527288 (not c!62128)) b!527284))

(assert (= (and d!80869 c!62129) b!527286))

(assert (= (and d!80869 (not c!62129)) b!527283))

(assert (= (and b!527283 res!323644) b!527291))

(assert (= (and b!527291 (not res!323643)) b!527285))

(assert (= (and b!527285 (not res!323645)) b!527287))

(assert (=> b!527284 m!507909))

(assert (=> b!527284 m!507909))

(assert (=> b!527284 m!507679))

(declare-fun m!507973 () Bool)

(assert (=> b!527284 m!507973))

(declare-fun m!507975 () Bool)

(assert (=> b!527285 m!507975))

(assert (=> b!527287 m!507975))

(assert (=> b!527291 m!507975))

(declare-fun m!507977 () Bool)

(assert (=> d!80869 m!507977))

(assert (=> d!80869 m!507703))

(assert (=> b!526938 d!80869))

(declare-fun d!80871 () Bool)

(assert (=> d!80871 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526948 d!80871))

(check-sat (not b!527127) (not d!80785) (not d!80823) (not b!527284) (not d!80783) (not d!80841) (not d!80861) (not b!527018) (not d!80771) (not b!527249) (not b!527272) (not b!527027) (not b!527065) (not b!527020) (not b!527270) (not d!80811) (not b!527030) (not bm!31874) (not b!527231) (not d!80869) (not b!527006) (not b!527064) (not bm!31871) (not bm!31886) (not b!527062))
(check-sat)
