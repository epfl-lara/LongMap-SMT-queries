; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27390 () Bool)

(assert start!27390)

(declare-fun b!283534 () Bool)

(declare-fun e!179890 () Bool)

(declare-fun e!179888 () Bool)

(assert (=> b!283534 (= e!179890 e!179888)))

(declare-fun res!146427 () Bool)

(assert (=> b!283534 (=> (not res!146427) (not e!179888))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283534 (= res!146427 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14144 0))(
  ( (array!14145 (arr!6712 (Array (_ BitVec 32) (_ BitVec 64))) (size!7064 (_ BitVec 32))) )
))
(declare-fun lt!140181 () array!14144)

(declare-fun a!3325 () array!14144)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!283534 (= lt!140181 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)))))

(declare-fun e!179891 () Bool)

(declare-fun b!283535 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14144 (_ BitVec 32)) Bool)

(assert (=> b!283535 (= e!179891 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140181 mask!3868))))

(declare-fun b!283536 () Bool)

(declare-fun res!146436 () Bool)

(declare-fun e!179889 () Bool)

(assert (=> b!283536 (=> (not res!146436) (not e!179889))))

(declare-datatypes ((List!4433 0))(
  ( (Nil!4430) (Cons!4429 (h!5099 (_ BitVec 64)) (t!9507 List!4433)) )
))
(declare-fun arrayNoDuplicates!0 (array!14144 (_ BitVec 32) List!4433) Bool)

(assert (=> b!283536 (= res!146436 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4430))))

(declare-fun b!283537 () Bool)

(declare-fun res!146435 () Bool)

(assert (=> b!283537 (=> (not res!146435) (not e!179889))))

(declare-fun arrayContainsKey!0 (array!14144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283537 (= res!146435 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!146434 () Bool)

(assert (=> start!27390 (=> (not res!146434) (not e!179889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27390 (= res!146434 (validMask!0 mask!3868))))

(assert (=> start!27390 e!179889))

(declare-fun array_inv!4662 (array!14144) Bool)

(assert (=> start!27390 (array_inv!4662 a!3325)))

(assert (=> start!27390 true))

(declare-fun b!283538 () Bool)

(declare-fun res!146432 () Bool)

(assert (=> b!283538 (=> (not res!146432) (not e!179890))))

(assert (=> b!283538 (= res!146432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283539 () Bool)

(declare-fun res!146429 () Bool)

(assert (=> b!283539 (=> (not res!146429) (not e!179888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283539 (= res!146429 (validKeyInArray!0 (select (arr!6712 a!3325) startIndex!26)))))

(declare-fun b!283540 () Bool)

(assert (=> b!283540 (= e!179889 e!179890)))

(declare-fun res!146431 () Bool)

(assert (=> b!283540 (=> (not res!146431) (not e!179890))))

(declare-datatypes ((SeekEntryResult!1835 0))(
  ( (MissingZero!1835 (index!9510 (_ BitVec 32))) (Found!1835 (index!9511 (_ BitVec 32))) (Intermediate!1835 (undefined!2647 Bool) (index!9512 (_ BitVec 32)) (x!27825 (_ BitVec 32))) (Undefined!1835) (MissingVacant!1835 (index!9513 (_ BitVec 32))) )
))
(declare-fun lt!140182 () SeekEntryResult!1835)

(assert (=> b!283540 (= res!146431 (or (= lt!140182 (MissingZero!1835 i!1267)) (= lt!140182 (MissingVacant!1835 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14144 (_ BitVec 32)) SeekEntryResult!1835)

(assert (=> b!283540 (= lt!140182 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!283541 () Bool)

(declare-fun res!146428 () Bool)

(assert (=> b!283541 (=> (not res!146428) (not e!179889))))

(assert (=> b!283541 (= res!146428 (validKeyInArray!0 k0!2581))))

(declare-fun b!283542 () Bool)

(declare-fun res!146433 () Bool)

(assert (=> b!283542 (=> (not res!146433) (not e!179889))))

(assert (=> b!283542 (= res!146433 (and (= (size!7064 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7064 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7064 a!3325))))))

(declare-fun b!283543 () Bool)

(assert (=> b!283543 (= e!179888 (not e!179891))))

(declare-fun res!146430 () Bool)

(assert (=> b!283543 (=> res!146430 e!179891)))

(assert (=> b!283543 (= res!146430 (bvslt startIndex!26 (bvsub (size!7064 a!3325) #b00000000000000000000000000000001)))))

(assert (=> b!283543 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9000 0))(
  ( (Unit!9001) )
))
(declare-fun lt!140180 () Unit!9000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9000)

(assert (=> b!283543 (= lt!140180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!283543 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868))))

(declare-fun lt!140184 () Unit!9000)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14144 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9000)

(assert (=> b!283543 (= lt!140184 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!283543 (arrayNoDuplicates!0 lt!140181 #b00000000000000000000000000000000 Nil!4430)))

(declare-fun lt!140183 () Unit!9000)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14144 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4433) Unit!9000)

(assert (=> b!283543 (= lt!140183 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4430))))

(assert (= (and start!27390 res!146434) b!283542))

(assert (= (and b!283542 res!146433) b!283541))

(assert (= (and b!283541 res!146428) b!283536))

(assert (= (and b!283536 res!146436) b!283537))

(assert (= (and b!283537 res!146435) b!283540))

(assert (= (and b!283540 res!146431) b!283538))

(assert (= (and b!283538 res!146432) b!283534))

(assert (= (and b!283534 res!146427) b!283539))

(assert (= (and b!283539 res!146429) b!283543))

(assert (= (and b!283543 (not res!146430)) b!283535))

(declare-fun m!298595 () Bool)

(assert (=> b!283538 m!298595))

(declare-fun m!298597 () Bool)

(assert (=> b!283543 m!298597))

(declare-fun m!298599 () Bool)

(assert (=> b!283543 m!298599))

(declare-fun m!298601 () Bool)

(assert (=> b!283543 m!298601))

(declare-fun m!298603 () Bool)

(assert (=> b!283543 m!298603))

(declare-fun m!298605 () Bool)

(assert (=> b!283543 m!298605))

(assert (=> b!283543 m!298603))

(declare-fun m!298607 () Bool)

(assert (=> b!283543 m!298607))

(declare-fun m!298609 () Bool)

(assert (=> b!283543 m!298609))

(declare-fun m!298611 () Bool)

(assert (=> b!283543 m!298611))

(assert (=> b!283543 m!298597))

(declare-fun m!298613 () Bool)

(assert (=> b!283543 m!298613))

(declare-fun m!298615 () Bool)

(assert (=> b!283543 m!298615))

(assert (=> b!283534 m!298599))

(declare-fun m!298617 () Bool)

(assert (=> start!27390 m!298617))

(declare-fun m!298619 () Bool)

(assert (=> start!27390 m!298619))

(declare-fun m!298621 () Bool)

(assert (=> b!283540 m!298621))

(declare-fun m!298623 () Bool)

(assert (=> b!283541 m!298623))

(assert (=> b!283539 m!298603))

(assert (=> b!283539 m!298603))

(declare-fun m!298625 () Bool)

(assert (=> b!283539 m!298625))

(declare-fun m!298627 () Bool)

(assert (=> b!283536 m!298627))

(declare-fun m!298629 () Bool)

(assert (=> b!283537 m!298629))

(declare-fun m!298631 () Bool)

(assert (=> b!283535 m!298631))

(check-sat (not b!283536) (not b!283543) (not b!283535) (not start!27390) (not b!283539) (not b!283538) (not b!283541) (not b!283540) (not b!283537))
(check-sat)
(get-model)

(declare-fun d!65437 () Bool)

(declare-fun e!179924 () Bool)

(assert (=> d!65437 e!179924))

(declare-fun res!146499 () Bool)

(assert (=> d!65437 (=> (not res!146499) (not e!179924))))

(assert (=> d!65437 (= res!146499 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7064 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7064 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7064 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7064 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7064 a!3325))))))

(declare-fun lt!140217 () Unit!9000)

(declare-fun choose!83 (array!14144 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9000)

(assert (=> d!65437 (= lt!140217 (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> d!65437 (validMask!0 mask!3868)))

(assert (=> d!65437 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) lt!140217)))

(declare-fun b!283606 () Bool)

(assert (=> b!283606 (= e!179924 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) mask!3868)))))

(assert (= (and d!65437 res!146499) b!283606))

(declare-fun m!298709 () Bool)

(assert (=> d!65437 m!298709))

(assert (=> d!65437 m!298617))

(assert (=> b!283606 m!298603))

(assert (=> b!283606 m!298607))

(assert (=> b!283606 m!298597))

(assert (=> b!283606 m!298603))

(assert (=> b!283606 m!298597))

(declare-fun m!298711 () Bool)

(assert (=> b!283606 m!298711))

(assert (=> b!283606 m!298599))

(assert (=> b!283543 d!65437))

(declare-fun b!283619 () Bool)

(declare-fun e!179933 () SeekEntryResult!1835)

(declare-fun lt!140225 () SeekEntryResult!1835)

(assert (=> b!283619 (= e!179933 (MissingZero!1835 (index!9512 lt!140225)))))

(declare-fun b!283620 () Bool)

(declare-fun c!46114 () Bool)

(declare-fun lt!140224 () (_ BitVec 64))

(assert (=> b!283620 (= c!46114 (= lt!140224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179932 () SeekEntryResult!1835)

(assert (=> b!283620 (= e!179932 e!179933)))

(declare-fun b!283622 () Bool)

(assert (=> b!283622 (= e!179932 (Found!1835 (index!9512 lt!140225)))))

(declare-fun b!283623 () Bool)

(declare-fun e!179931 () SeekEntryResult!1835)

(assert (=> b!283623 (= e!179931 e!179932)))

(assert (=> b!283623 (= lt!140224 (select (arr!6712 a!3325) (index!9512 lt!140225)))))

(declare-fun c!46113 () Bool)

(assert (=> b!283623 (= c!46113 (= lt!140224 (select (arr!6712 a!3325) startIndex!26)))))

(declare-fun b!283624 () Bool)

(assert (=> b!283624 (= e!179931 Undefined!1835)))

(declare-fun b!283621 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14144 (_ BitVec 32)) SeekEntryResult!1835)

(assert (=> b!283621 (= e!179933 (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140225) (index!9512 lt!140225) (index!9512 lt!140225) (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun d!65439 () Bool)

(declare-fun lt!140226 () SeekEntryResult!1835)

(get-info :version)

(assert (=> d!65439 (and (or ((_ is Undefined!1835) lt!140226) (not ((_ is Found!1835) lt!140226)) (and (bvsge (index!9511 lt!140226) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140226) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140226) ((_ is Found!1835) lt!140226) (not ((_ is MissingZero!1835) lt!140226)) (and (bvsge (index!9510 lt!140226) #b00000000000000000000000000000000) (bvslt (index!9510 lt!140226) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140226) ((_ is Found!1835) lt!140226) ((_ is MissingZero!1835) lt!140226) (not ((_ is MissingVacant!1835) lt!140226)) (and (bvsge (index!9513 lt!140226) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140226) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140226) (ite ((_ is Found!1835) lt!140226) (= (select (arr!6712 a!3325) (index!9511 lt!140226)) (select (arr!6712 a!3325) startIndex!26)) (ite ((_ is MissingZero!1835) lt!140226) (= (select (arr!6712 a!3325) (index!9510 lt!140226)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1835) lt!140226) (= (select (arr!6712 a!3325) (index!9513 lt!140226)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65439 (= lt!140226 e!179931)))

(declare-fun c!46112 () Bool)

(assert (=> d!65439 (= c!46112 (and ((_ is Intermediate!1835) lt!140225) (undefined!2647 lt!140225)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14144 (_ BitVec 32)) SeekEntryResult!1835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65439 (= lt!140225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868) (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65439 (validMask!0 mask!3868)))

(assert (=> d!65439 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) lt!140226)))

(assert (= (and d!65439 c!46112) b!283624))

(assert (= (and d!65439 (not c!46112)) b!283623))

(assert (= (and b!283623 c!46113) b!283622))

(assert (= (and b!283623 (not c!46113)) b!283620))

(assert (= (and b!283620 c!46114) b!283619))

(assert (= (and b!283620 (not c!46114)) b!283621))

(declare-fun m!298713 () Bool)

(assert (=> b!283623 m!298713))

(assert (=> b!283621 m!298603))

(declare-fun m!298715 () Bool)

(assert (=> b!283621 m!298715))

(declare-fun m!298717 () Bool)

(assert (=> d!65439 m!298717))

(declare-fun m!298719 () Bool)

(assert (=> d!65439 m!298719))

(assert (=> d!65439 m!298617))

(assert (=> d!65439 m!298603))

(declare-fun m!298721 () Bool)

(assert (=> d!65439 m!298721))

(assert (=> d!65439 m!298721))

(assert (=> d!65439 m!298603))

(declare-fun m!298723 () Bool)

(assert (=> d!65439 m!298723))

(declare-fun m!298725 () Bool)

(assert (=> d!65439 m!298725))

(assert (=> b!283543 d!65439))

(declare-fun d!65445 () Bool)

(declare-fun res!146513 () Bool)

(declare-fun e!179953 () Bool)

(assert (=> d!65445 (=> res!146513 e!179953)))

(assert (=> d!65445 (= res!146513 (bvsge #b00000000000000000000000000000000 (size!7064 lt!140181)))))

(assert (=> d!65445 (= (arrayNoDuplicates!0 lt!140181 #b00000000000000000000000000000000 Nil!4430) e!179953)))

(declare-fun b!283647 () Bool)

(declare-fun e!179951 () Bool)

(declare-fun call!25483 () Bool)

(assert (=> b!283647 (= e!179951 call!25483)))

(declare-fun b!283648 () Bool)

(assert (=> b!283648 (= e!179951 call!25483)))

(declare-fun b!283649 () Bool)

(declare-fun e!179954 () Bool)

(declare-fun contains!1967 (List!4433 (_ BitVec 64)) Bool)

(assert (=> b!283649 (= e!179954 (contains!1967 Nil!4430 (select (arr!6712 lt!140181) #b00000000000000000000000000000000)))))

(declare-fun b!283650 () Bool)

(declare-fun e!179952 () Bool)

(assert (=> b!283650 (= e!179953 e!179952)))

(declare-fun res!146512 () Bool)

(assert (=> b!283650 (=> (not res!146512) (not e!179952))))

(assert (=> b!283650 (= res!146512 (not e!179954))))

(declare-fun res!146514 () Bool)

(assert (=> b!283650 (=> (not res!146514) (not e!179954))))

(assert (=> b!283650 (= res!146514 (validKeyInArray!0 (select (arr!6712 lt!140181) #b00000000000000000000000000000000)))))

(declare-fun bm!25480 () Bool)

(declare-fun c!46120 () Bool)

(assert (=> bm!25480 (= call!25483 (arrayNoDuplicates!0 lt!140181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46120 (Cons!4429 (select (arr!6712 lt!140181) #b00000000000000000000000000000000) Nil!4430) Nil!4430)))))

(declare-fun b!283651 () Bool)

(assert (=> b!283651 (= e!179952 e!179951)))

(assert (=> b!283651 (= c!46120 (validKeyInArray!0 (select (arr!6712 lt!140181) #b00000000000000000000000000000000)))))

(assert (= (and d!65445 (not res!146513)) b!283650))

(assert (= (and b!283650 res!146514) b!283649))

(assert (= (and b!283650 res!146512) b!283651))

(assert (= (and b!283651 c!46120) b!283648))

(assert (= (and b!283651 (not c!46120)) b!283647))

(assert (= (or b!283648 b!283647) bm!25480))

(declare-fun m!298739 () Bool)

(assert (=> b!283649 m!298739))

(assert (=> b!283649 m!298739))

(declare-fun m!298741 () Bool)

(assert (=> b!283649 m!298741))

(assert (=> b!283650 m!298739))

(assert (=> b!283650 m!298739))

(declare-fun m!298743 () Bool)

(assert (=> b!283650 m!298743))

(assert (=> bm!25480 m!298739))

(declare-fun m!298745 () Bool)

(assert (=> bm!25480 m!298745))

(assert (=> b!283651 m!298739))

(assert (=> b!283651 m!298739))

(assert (=> b!283651 m!298743))

(assert (=> b!283543 d!65445))

(declare-fun d!65449 () Bool)

(declare-fun e!179957 () Bool)

(assert (=> d!65449 e!179957))

(declare-fun res!146517 () Bool)

(assert (=> d!65449 (=> (not res!146517) (not e!179957))))

(assert (=> d!65449 (= res!146517 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7064 a!3325))))))

(declare-fun lt!140238 () Unit!9000)

(declare-fun choose!41 (array!14144 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4433) Unit!9000)

(assert (=> d!65449 (= lt!140238 (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4430))))

(assert (=> d!65449 (bvslt (size!7064 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65449 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4430) lt!140238)))

(declare-fun b!283654 () Bool)

(assert (=> b!283654 (= e!179957 (arrayNoDuplicates!0 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) #b00000000000000000000000000000000 Nil!4430))))

(assert (= (and d!65449 res!146517) b!283654))

(declare-fun m!298747 () Bool)

(assert (=> d!65449 m!298747))

(assert (=> b!283654 m!298599))

(declare-fun m!298749 () Bool)

(assert (=> b!283654 m!298749))

(assert (=> b!283543 d!65449))

(declare-fun d!65451 () Bool)

(assert (=> d!65451 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140241 () Unit!9000)

(declare-fun choose!38 (array!14144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9000)

(assert (=> d!65451 (= lt!140241 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65451 (validMask!0 mask!3868)))

(assert (=> d!65451 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140241)))

(declare-fun bs!10090 () Bool)

(assert (= bs!10090 d!65451))

(assert (=> bs!10090 m!298601))

(declare-fun m!298751 () Bool)

(assert (=> bs!10090 m!298751))

(assert (=> bs!10090 m!298617))

(assert (=> b!283543 d!65451))

(declare-fun bm!25483 () Bool)

(declare-fun call!25486 () Bool)

(assert (=> bm!25483 (= call!25486 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283667 () Bool)

(declare-fun e!179967 () Bool)

(assert (=> b!283667 (= e!179967 call!25486)))

(declare-fun b!283666 () Bool)

(declare-fun e!179969 () Bool)

(assert (=> b!283666 (= e!179969 e!179967)))

(declare-fun lt!140251 () (_ BitVec 64))

(assert (=> b!283666 (= lt!140251 (select (arr!6712 a!3325) startIndex!26))))

(declare-fun lt!140253 () Unit!9000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14144 (_ BitVec 64) (_ BitVec 32)) Unit!9000)

(assert (=> b!283666 (= lt!140253 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140251 startIndex!26))))

(assert (=> b!283666 (arrayContainsKey!0 a!3325 lt!140251 #b00000000000000000000000000000000)))

(declare-fun lt!140252 () Unit!9000)

(assert (=> b!283666 (= lt!140252 lt!140253)))

(declare-fun res!146526 () Bool)

(assert (=> b!283666 (= res!146526 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) (Found!1835 startIndex!26)))))

(assert (=> b!283666 (=> (not res!146526) (not e!179967))))

(declare-fun d!65459 () Bool)

(declare-fun res!146525 () Bool)

(declare-fun e!179968 () Bool)

(assert (=> d!65459 (=> res!146525 e!179968)))

(assert (=> d!65459 (= res!146525 (bvsge startIndex!26 (size!7064 a!3325)))))

(assert (=> d!65459 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!179968)))

(declare-fun b!283668 () Bool)

(assert (=> b!283668 (= e!179969 call!25486)))

(declare-fun b!283669 () Bool)

(assert (=> b!283669 (= e!179968 e!179969)))

(declare-fun c!46123 () Bool)

(assert (=> b!283669 (= c!46123 (validKeyInArray!0 (select (arr!6712 a!3325) startIndex!26)))))

(assert (= (and d!65459 (not res!146525)) b!283669))

(assert (= (and b!283669 c!46123) b!283666))

(assert (= (and b!283669 (not c!46123)) b!283668))

(assert (= (and b!283666 res!146526) b!283667))

(assert (= (or b!283667 b!283668) bm!25483))

(declare-fun m!298757 () Bool)

(assert (=> bm!25483 m!298757))

(assert (=> b!283666 m!298603))

(declare-fun m!298759 () Bool)

(assert (=> b!283666 m!298759))

(declare-fun m!298761 () Bool)

(assert (=> b!283666 m!298761))

(assert (=> b!283666 m!298603))

(assert (=> b!283666 m!298607))

(assert (=> b!283669 m!298603))

(assert (=> b!283669 m!298603))

(assert (=> b!283669 m!298625))

(assert (=> b!283543 d!65459))

(declare-fun b!283670 () Bool)

(declare-fun e!179972 () SeekEntryResult!1835)

(declare-fun lt!140255 () SeekEntryResult!1835)

(assert (=> b!283670 (= e!179972 (MissingZero!1835 (index!9512 lt!140255)))))

(declare-fun b!283671 () Bool)

(declare-fun c!46126 () Bool)

(declare-fun lt!140254 () (_ BitVec 64))

(assert (=> b!283671 (= c!46126 (= lt!140254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179971 () SeekEntryResult!1835)

(assert (=> b!283671 (= e!179971 e!179972)))

(declare-fun b!283673 () Bool)

(assert (=> b!283673 (= e!179971 (Found!1835 (index!9512 lt!140255)))))

(declare-fun b!283674 () Bool)

(declare-fun e!179970 () SeekEntryResult!1835)

(assert (=> b!283674 (= e!179970 e!179971)))

(assert (=> b!283674 (= lt!140254 (select (arr!6712 lt!140181) (index!9512 lt!140255)))))

(declare-fun c!46125 () Bool)

(assert (=> b!283674 (= c!46125 (= lt!140254 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!283675 () Bool)

(assert (=> b!283675 (= e!179970 Undefined!1835)))

(declare-fun b!283672 () Bool)

(assert (=> b!283672 (= e!179972 (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140255) (index!9512 lt!140255) (index!9512 lt!140255) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868))))

(declare-fun d!65463 () Bool)

(declare-fun lt!140256 () SeekEntryResult!1835)

(assert (=> d!65463 (and (or ((_ is Undefined!1835) lt!140256) (not ((_ is Found!1835) lt!140256)) (and (bvsge (index!9511 lt!140256) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140256) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140256) ((_ is Found!1835) lt!140256) (not ((_ is MissingZero!1835) lt!140256)) (and (bvsge (index!9510 lt!140256) #b00000000000000000000000000000000) (bvslt (index!9510 lt!140256) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140256) ((_ is Found!1835) lt!140256) ((_ is MissingZero!1835) lt!140256) (not ((_ is MissingVacant!1835) lt!140256)) (and (bvsge (index!9513 lt!140256) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140256) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140256) (ite ((_ is Found!1835) lt!140256) (= (select (arr!6712 lt!140181) (index!9511 lt!140256)) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1835) lt!140256) (= (select (arr!6712 lt!140181) (index!9510 lt!140256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1835) lt!140256) (= (select (arr!6712 lt!140181) (index!9513 lt!140256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65463 (= lt!140256 e!179970)))

(declare-fun c!46124 () Bool)

(assert (=> d!65463 (= c!46124 (and ((_ is Intermediate!1835) lt!140255) (undefined!2647 lt!140255)))))

(assert (=> d!65463 (= lt!140255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868))))

(assert (=> d!65463 (validMask!0 mask!3868)))

(assert (=> d!65463 (= (seekEntryOrOpen!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868) lt!140256)))

(assert (= (and d!65463 c!46124) b!283675))

(assert (= (and d!65463 (not c!46124)) b!283674))

(assert (= (and b!283674 c!46125) b!283673))

(assert (= (and b!283674 (not c!46125)) b!283671))

(assert (= (and b!283671 c!46126) b!283670))

(assert (= (and b!283671 (not c!46126)) b!283672))

(declare-fun m!298763 () Bool)

(assert (=> b!283674 m!298763))

(assert (=> b!283672 m!298597))

(declare-fun m!298765 () Bool)

(assert (=> b!283672 m!298765))

(declare-fun m!298767 () Bool)

(assert (=> d!65463 m!298767))

(declare-fun m!298769 () Bool)

(assert (=> d!65463 m!298769))

(assert (=> d!65463 m!298617))

(assert (=> d!65463 m!298597))

(declare-fun m!298771 () Bool)

(assert (=> d!65463 m!298771))

(assert (=> d!65463 m!298771))

(assert (=> d!65463 m!298597))

(declare-fun m!298773 () Bool)

(assert (=> d!65463 m!298773))

(declare-fun m!298775 () Bool)

(assert (=> d!65463 m!298775))

(assert (=> b!283543 d!65463))

(declare-fun bm!25484 () Bool)

(declare-fun call!25487 () Bool)

(assert (=> bm!25484 (= call!25487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283677 () Bool)

(declare-fun e!179973 () Bool)

(assert (=> b!283677 (= e!179973 call!25487)))

(declare-fun b!283676 () Bool)

(declare-fun e!179975 () Bool)

(assert (=> b!283676 (= e!179975 e!179973)))

(declare-fun lt!140257 () (_ BitVec 64))

(assert (=> b!283676 (= lt!140257 (select (arr!6712 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140259 () Unit!9000)

(assert (=> b!283676 (= lt!140259 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140257 #b00000000000000000000000000000000))))

(assert (=> b!283676 (arrayContainsKey!0 a!3325 lt!140257 #b00000000000000000000000000000000)))

(declare-fun lt!140258 () Unit!9000)

(assert (=> b!283676 (= lt!140258 lt!140259)))

(declare-fun res!146528 () Bool)

(assert (=> b!283676 (= res!146528 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1835 #b00000000000000000000000000000000)))))

(assert (=> b!283676 (=> (not res!146528) (not e!179973))))

(declare-fun d!65465 () Bool)

(declare-fun res!146527 () Bool)

(declare-fun e!179974 () Bool)

(assert (=> d!65465 (=> res!146527 e!179974)))

(assert (=> d!65465 (= res!146527 (bvsge #b00000000000000000000000000000000 (size!7064 a!3325)))))

(assert (=> d!65465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179974)))

(declare-fun b!283678 () Bool)

(assert (=> b!283678 (= e!179975 call!25487)))

(declare-fun b!283679 () Bool)

(assert (=> b!283679 (= e!179974 e!179975)))

(declare-fun c!46127 () Bool)

(assert (=> b!283679 (= c!46127 (validKeyInArray!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65465 (not res!146527)) b!283679))

(assert (= (and b!283679 c!46127) b!283676))

(assert (= (and b!283679 (not c!46127)) b!283678))

(assert (= (and b!283676 res!146528) b!283677))

(assert (= (or b!283677 b!283678) bm!25484))

(declare-fun m!298777 () Bool)

(assert (=> bm!25484 m!298777))

(declare-fun m!298779 () Bool)

(assert (=> b!283676 m!298779))

(declare-fun m!298781 () Bool)

(assert (=> b!283676 m!298781))

(declare-fun m!298783 () Bool)

(assert (=> b!283676 m!298783))

(assert (=> b!283676 m!298779))

(declare-fun m!298785 () Bool)

(assert (=> b!283676 m!298785))

(assert (=> b!283679 m!298779))

(assert (=> b!283679 m!298779))

(declare-fun m!298787 () Bool)

(assert (=> b!283679 m!298787))

(assert (=> b!283538 d!65465))

(declare-fun d!65467 () Bool)

(assert (=> d!65467 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27390 d!65467))

(declare-fun d!65473 () Bool)

(assert (=> d!65473 (= (array_inv!4662 a!3325) (bvsge (size!7064 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27390 d!65473))

(declare-fun d!65475 () Bool)

(assert (=> d!65475 (= (validKeyInArray!0 (select (arr!6712 a!3325) startIndex!26)) (and (not (= (select (arr!6712 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6712 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283539 d!65475))

(declare-fun b!283686 () Bool)

(declare-fun e!179984 () SeekEntryResult!1835)

(declare-fun lt!140267 () SeekEntryResult!1835)

(assert (=> b!283686 (= e!179984 (MissingZero!1835 (index!9512 lt!140267)))))

(declare-fun b!283687 () Bool)

(declare-fun c!46130 () Bool)

(declare-fun lt!140266 () (_ BitVec 64))

(assert (=> b!283687 (= c!46130 (= lt!140266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179983 () SeekEntryResult!1835)

(assert (=> b!283687 (= e!179983 e!179984)))

(declare-fun b!283689 () Bool)

(assert (=> b!283689 (= e!179983 (Found!1835 (index!9512 lt!140267)))))

(declare-fun b!283690 () Bool)

(declare-fun e!179982 () SeekEntryResult!1835)

(assert (=> b!283690 (= e!179982 e!179983)))

(assert (=> b!283690 (= lt!140266 (select (arr!6712 a!3325) (index!9512 lt!140267)))))

(declare-fun c!46129 () Bool)

(assert (=> b!283690 (= c!46129 (= lt!140266 k0!2581))))

(declare-fun b!283691 () Bool)

(assert (=> b!283691 (= e!179982 Undefined!1835)))

(declare-fun b!283688 () Bool)

(assert (=> b!283688 (= e!179984 (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140267) (index!9512 lt!140267) (index!9512 lt!140267) k0!2581 a!3325 mask!3868))))

(declare-fun d!65477 () Bool)

(declare-fun lt!140268 () SeekEntryResult!1835)

(assert (=> d!65477 (and (or ((_ is Undefined!1835) lt!140268) (not ((_ is Found!1835) lt!140268)) (and (bvsge (index!9511 lt!140268) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140268) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140268) ((_ is Found!1835) lt!140268) (not ((_ is MissingZero!1835) lt!140268)) (and (bvsge (index!9510 lt!140268) #b00000000000000000000000000000000) (bvslt (index!9510 lt!140268) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140268) ((_ is Found!1835) lt!140268) ((_ is MissingZero!1835) lt!140268) (not ((_ is MissingVacant!1835) lt!140268)) (and (bvsge (index!9513 lt!140268) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140268) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140268) (ite ((_ is Found!1835) lt!140268) (= (select (arr!6712 a!3325) (index!9511 lt!140268)) k0!2581) (ite ((_ is MissingZero!1835) lt!140268) (= (select (arr!6712 a!3325) (index!9510 lt!140268)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1835) lt!140268) (= (select (arr!6712 a!3325) (index!9513 lt!140268)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65477 (= lt!140268 e!179982)))

(declare-fun c!46128 () Bool)

(assert (=> d!65477 (= c!46128 (and ((_ is Intermediate!1835) lt!140267) (undefined!2647 lt!140267)))))

(assert (=> d!65477 (= lt!140267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65477 (validMask!0 mask!3868)))

(assert (=> d!65477 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140268)))

(assert (= (and d!65477 c!46128) b!283691))

(assert (= (and d!65477 (not c!46128)) b!283690))

(assert (= (and b!283690 c!46129) b!283689))

(assert (= (and b!283690 (not c!46129)) b!283687))

(assert (= (and b!283687 c!46130) b!283686))

(assert (= (and b!283687 (not c!46130)) b!283688))

(declare-fun m!298797 () Bool)

(assert (=> b!283690 m!298797))

(declare-fun m!298799 () Bool)

(assert (=> b!283688 m!298799))

(declare-fun m!298801 () Bool)

(assert (=> d!65477 m!298801))

(declare-fun m!298803 () Bool)

(assert (=> d!65477 m!298803))

(assert (=> d!65477 m!298617))

(declare-fun m!298805 () Bool)

(assert (=> d!65477 m!298805))

(assert (=> d!65477 m!298805))

(declare-fun m!298807 () Bool)

(assert (=> d!65477 m!298807))

(declare-fun m!298809 () Bool)

(assert (=> d!65477 m!298809))

(assert (=> b!283540 d!65477))

(declare-fun call!25488 () Bool)

(declare-fun bm!25485 () Bool)

(assert (=> bm!25485 (= call!25488 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140181 mask!3868))))

(declare-fun b!283693 () Bool)

(declare-fun e!179985 () Bool)

(assert (=> b!283693 (= e!179985 call!25488)))

(declare-fun b!283692 () Bool)

(declare-fun e!179987 () Bool)

(assert (=> b!283692 (= e!179987 e!179985)))

(declare-fun lt!140271 () (_ BitVec 64))

(assert (=> b!283692 (= lt!140271 (select (arr!6712 lt!140181) startIndex!26))))

(declare-fun lt!140273 () Unit!9000)

(assert (=> b!283692 (= lt!140273 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140181 lt!140271 startIndex!26))))

(assert (=> b!283692 (arrayContainsKey!0 lt!140181 lt!140271 #b00000000000000000000000000000000)))

(declare-fun lt!140272 () Unit!9000)

(assert (=> b!283692 (= lt!140272 lt!140273)))

(declare-fun res!146536 () Bool)

(assert (=> b!283692 (= res!146536 (= (seekEntryOrOpen!0 (select (arr!6712 lt!140181) startIndex!26) lt!140181 mask!3868) (Found!1835 startIndex!26)))))

(assert (=> b!283692 (=> (not res!146536) (not e!179985))))

(declare-fun d!65479 () Bool)

(declare-fun res!146535 () Bool)

(declare-fun e!179986 () Bool)

(assert (=> d!65479 (=> res!146535 e!179986)))

(assert (=> d!65479 (= res!146535 (bvsge startIndex!26 (size!7064 lt!140181)))))

(assert (=> d!65479 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140181 mask!3868) e!179986)))

(declare-fun b!283694 () Bool)

(assert (=> b!283694 (= e!179987 call!25488)))

(declare-fun b!283695 () Bool)

(assert (=> b!283695 (= e!179986 e!179987)))

(declare-fun c!46131 () Bool)

(assert (=> b!283695 (= c!46131 (validKeyInArray!0 (select (arr!6712 lt!140181) startIndex!26)))))

(assert (= (and d!65479 (not res!146535)) b!283695))

(assert (= (and b!283695 c!46131) b!283692))

(assert (= (and b!283695 (not c!46131)) b!283694))

(assert (= (and b!283692 res!146536) b!283693))

(assert (= (or b!283693 b!283694) bm!25485))

(declare-fun m!298811 () Bool)

(assert (=> bm!25485 m!298811))

(declare-fun m!298813 () Bool)

(assert (=> b!283692 m!298813))

(declare-fun m!298815 () Bool)

(assert (=> b!283692 m!298815))

(declare-fun m!298817 () Bool)

(assert (=> b!283692 m!298817))

(assert (=> b!283692 m!298813))

(declare-fun m!298821 () Bool)

(assert (=> b!283692 m!298821))

(assert (=> b!283695 m!298813))

(assert (=> b!283695 m!298813))

(declare-fun m!298823 () Bool)

(assert (=> b!283695 m!298823))

(assert (=> b!283535 d!65479))

(declare-fun d!65483 () Bool)

(assert (=> d!65483 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283541 d!65483))

(declare-fun d!65485 () Bool)

(declare-fun res!146538 () Bool)

(declare-fun e!179996 () Bool)

(assert (=> d!65485 (=> res!146538 e!179996)))

(assert (=> d!65485 (= res!146538 (bvsge #b00000000000000000000000000000000 (size!7064 a!3325)))))

(assert (=> d!65485 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4430) e!179996)))

(declare-fun b!283708 () Bool)

(declare-fun e!179994 () Bool)

(declare-fun call!25489 () Bool)

(assert (=> b!283708 (= e!179994 call!25489)))

(declare-fun b!283709 () Bool)

(assert (=> b!283709 (= e!179994 call!25489)))

(declare-fun b!283710 () Bool)

(declare-fun e!179997 () Bool)

(assert (=> b!283710 (= e!179997 (contains!1967 Nil!4430 (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283711 () Bool)

(declare-fun e!179995 () Bool)

(assert (=> b!283711 (= e!179996 e!179995)))

(declare-fun res!146537 () Bool)

(assert (=> b!283711 (=> (not res!146537) (not e!179995))))

(assert (=> b!283711 (= res!146537 (not e!179997))))

(declare-fun res!146539 () Bool)

(assert (=> b!283711 (=> (not res!146539) (not e!179997))))

(assert (=> b!283711 (= res!146539 (validKeyInArray!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25486 () Bool)

(declare-fun c!46138 () Bool)

(assert (=> bm!25486 (= call!25489 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46138 (Cons!4429 (select (arr!6712 a!3325) #b00000000000000000000000000000000) Nil!4430) Nil!4430)))))

(declare-fun b!283712 () Bool)

(assert (=> b!283712 (= e!179995 e!179994)))

(assert (=> b!283712 (= c!46138 (validKeyInArray!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65485 (not res!146538)) b!283711))

(assert (= (and b!283711 res!146539) b!283710))

(assert (= (and b!283711 res!146537) b!283712))

(assert (= (and b!283712 c!46138) b!283709))

(assert (= (and b!283712 (not c!46138)) b!283708))

(assert (= (or b!283709 b!283708) bm!25486))

(assert (=> b!283710 m!298779))

(assert (=> b!283710 m!298779))

(declare-fun m!298825 () Bool)

(assert (=> b!283710 m!298825))

(assert (=> b!283711 m!298779))

(assert (=> b!283711 m!298779))

(assert (=> b!283711 m!298787))

(assert (=> bm!25486 m!298779))

(declare-fun m!298827 () Bool)

(assert (=> bm!25486 m!298827))

(assert (=> b!283712 m!298779))

(assert (=> b!283712 m!298779))

(assert (=> b!283712 m!298787))

(assert (=> b!283536 d!65485))

(declare-fun d!65487 () Bool)

(declare-fun res!146544 () Bool)

(declare-fun e!180002 () Bool)

(assert (=> d!65487 (=> res!146544 e!180002)))

(assert (=> d!65487 (= res!146544 (= (select (arr!6712 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65487 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!180002)))

(declare-fun b!283717 () Bool)

(declare-fun e!180003 () Bool)

(assert (=> b!283717 (= e!180002 e!180003)))

(declare-fun res!146545 () Bool)

(assert (=> b!283717 (=> (not res!146545) (not e!180003))))

(assert (=> b!283717 (= res!146545 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(declare-fun b!283718 () Bool)

(assert (=> b!283718 (= e!180003 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65487 (not res!146544)) b!283717))

(assert (= (and b!283717 res!146545) b!283718))

(assert (=> d!65487 m!298779))

(declare-fun m!298829 () Bool)

(assert (=> b!283718 m!298829))

(assert (=> b!283537 d!65487))

(check-sat (not b!283712) (not d!65477) (not b!283650) (not b!283692) (not b!283711) (not b!283669) (not b!283651) (not b!283649) (not b!283710) (not b!283695) (not d!65439) (not b!283654) (not b!283676) (not b!283672) (not d!65437) (not d!65449) (not bm!25480) (not b!283718) (not d!65451) (not b!283679) (not bm!25485) (not bm!25484) (not b!283688) (not bm!25483) (not b!283606) (not d!65463) (not b!283621) (not bm!25486) (not b!283666))
(check-sat)
(get-model)

(declare-fun d!65533 () Bool)

(declare-fun lt!140334 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!193 (List!4433) (InoxSet (_ BitVec 64)))

(assert (=> d!65533 (= lt!140334 (select (content!193 Nil!4430) (select (arr!6712 lt!140181) #b00000000000000000000000000000000)))))

(declare-fun e!180100 () Bool)

(assert (=> d!65533 (= lt!140334 e!180100)))

(declare-fun res!146603 () Bool)

(assert (=> d!65533 (=> (not res!146603) (not e!180100))))

(assert (=> d!65533 (= res!146603 ((_ is Cons!4429) Nil!4430))))

(assert (=> d!65533 (= (contains!1967 Nil!4430 (select (arr!6712 lt!140181) #b00000000000000000000000000000000)) lt!140334)))

(declare-fun b!283854 () Bool)

(declare-fun e!180101 () Bool)

(assert (=> b!283854 (= e!180100 e!180101)))

(declare-fun res!146604 () Bool)

(assert (=> b!283854 (=> res!146604 e!180101)))

(assert (=> b!283854 (= res!146604 (= (h!5099 Nil!4430) (select (arr!6712 lt!140181) #b00000000000000000000000000000000)))))

(declare-fun b!283855 () Bool)

(assert (=> b!283855 (= e!180101 (contains!1967 (t!9507 Nil!4430) (select (arr!6712 lt!140181) #b00000000000000000000000000000000)))))

(assert (= (and d!65533 res!146603) b!283854))

(assert (= (and b!283854 (not res!146604)) b!283855))

(declare-fun m!298997 () Bool)

(assert (=> d!65533 m!298997))

(assert (=> d!65533 m!298739))

(declare-fun m!298999 () Bool)

(assert (=> d!65533 m!298999))

(assert (=> b!283855 m!298739))

(declare-fun m!299001 () Bool)

(assert (=> b!283855 m!299001))

(assert (=> b!283649 d!65533))

(declare-fun d!65535 () Bool)

(assert (=> d!65535 (= (validKeyInArray!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6712 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6712 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283679 d!65535))

(declare-fun d!65537 () Bool)

(declare-fun res!146605 () Bool)

(declare-fun e!180102 () Bool)

(assert (=> d!65537 (=> res!146605 e!180102)))

(assert (=> d!65537 (= res!146605 (= (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!65537 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!180102)))

(declare-fun b!283856 () Bool)

(declare-fun e!180103 () Bool)

(assert (=> b!283856 (= e!180102 e!180103)))

(declare-fun res!146606 () Bool)

(assert (=> b!283856 (=> (not res!146606) (not e!180103))))

(assert (=> b!283856 (= res!146606 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(declare-fun b!283857 () Bool)

(assert (=> b!283857 (= e!180103 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65537 (not res!146605)) b!283856))

(assert (= (and b!283856 res!146606) b!283857))

(declare-fun m!299003 () Bool)

(assert (=> d!65537 m!299003))

(declare-fun m!299005 () Bool)

(assert (=> b!283857 m!299005))

(assert (=> b!283718 d!65537))

(declare-fun d!65539 () Bool)

(assert (=> d!65539 (= (validKeyInArray!0 (select (arr!6712 lt!140181) #b00000000000000000000000000000000)) (and (not (= (select (arr!6712 lt!140181) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6712 lt!140181) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283650 d!65539))

(declare-fun d!65541 () Bool)

(declare-fun res!146608 () Bool)

(declare-fun e!180106 () Bool)

(assert (=> d!65541 (=> res!146608 e!180106)))

(assert (=> d!65541 (= res!146608 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 lt!140181)))))

(assert (=> d!65541 (= (arrayNoDuplicates!0 lt!140181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46120 (Cons!4429 (select (arr!6712 lt!140181) #b00000000000000000000000000000000) Nil!4430) Nil!4430)) e!180106)))

(declare-fun b!283858 () Bool)

(declare-fun e!180104 () Bool)

(declare-fun call!25505 () Bool)

(assert (=> b!283858 (= e!180104 call!25505)))

(declare-fun b!283859 () Bool)

(assert (=> b!283859 (= e!180104 call!25505)))

(declare-fun b!283860 () Bool)

(declare-fun e!180107 () Bool)

(assert (=> b!283860 (= e!180107 (contains!1967 (ite c!46120 (Cons!4429 (select (arr!6712 lt!140181) #b00000000000000000000000000000000) Nil!4430) Nil!4430) (select (arr!6712 lt!140181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283861 () Bool)

(declare-fun e!180105 () Bool)

(assert (=> b!283861 (= e!180106 e!180105)))

(declare-fun res!146607 () Bool)

(assert (=> b!283861 (=> (not res!146607) (not e!180105))))

(assert (=> b!283861 (= res!146607 (not e!180107))))

(declare-fun res!146609 () Bool)

(assert (=> b!283861 (=> (not res!146609) (not e!180107))))

(assert (=> b!283861 (= res!146609 (validKeyInArray!0 (select (arr!6712 lt!140181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!46178 () Bool)

(declare-fun bm!25502 () Bool)

(assert (=> bm!25502 (= call!25505 (arrayNoDuplicates!0 lt!140181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46178 (Cons!4429 (select (arr!6712 lt!140181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46120 (Cons!4429 (select (arr!6712 lt!140181) #b00000000000000000000000000000000) Nil!4430) Nil!4430)) (ite c!46120 (Cons!4429 (select (arr!6712 lt!140181) #b00000000000000000000000000000000) Nil!4430) Nil!4430))))))

(declare-fun b!283862 () Bool)

(assert (=> b!283862 (= e!180105 e!180104)))

(assert (=> b!283862 (= c!46178 (validKeyInArray!0 (select (arr!6712 lt!140181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65541 (not res!146608)) b!283861))

(assert (= (and b!283861 res!146609) b!283860))

(assert (= (and b!283861 res!146607) b!283862))

(assert (= (and b!283862 c!46178) b!283859))

(assert (= (and b!283862 (not c!46178)) b!283858))

(assert (= (or b!283859 b!283858) bm!25502))

(declare-fun m!299007 () Bool)

(assert (=> b!283860 m!299007))

(assert (=> b!283860 m!299007))

(declare-fun m!299009 () Bool)

(assert (=> b!283860 m!299009))

(assert (=> b!283861 m!299007))

(assert (=> b!283861 m!299007))

(declare-fun m!299011 () Bool)

(assert (=> b!283861 m!299011))

(assert (=> bm!25502 m!299007))

(declare-fun m!299013 () Bool)

(assert (=> bm!25502 m!299013))

(assert (=> b!283862 m!299007))

(assert (=> b!283862 m!299007))

(assert (=> b!283862 m!299011))

(assert (=> bm!25480 d!65541))

(declare-fun d!65543 () Bool)

(declare-fun res!146611 () Bool)

(declare-fun e!180110 () Bool)

(assert (=> d!65543 (=> res!146611 e!180110)))

(assert (=> d!65543 (= res!146611 (bvsge #b00000000000000000000000000000000 (size!7064 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)))))))

(assert (=> d!65543 (= (arrayNoDuplicates!0 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) #b00000000000000000000000000000000 Nil!4430) e!180110)))

(declare-fun b!283863 () Bool)

(declare-fun e!180108 () Bool)

(declare-fun call!25506 () Bool)

(assert (=> b!283863 (= e!180108 call!25506)))

(declare-fun b!283864 () Bool)

(assert (=> b!283864 (= e!180108 call!25506)))

(declare-fun b!283865 () Bool)

(declare-fun e!180111 () Bool)

(assert (=> b!283865 (= e!180111 (contains!1967 Nil!4430 (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun b!283866 () Bool)

(declare-fun e!180109 () Bool)

(assert (=> b!283866 (= e!180110 e!180109)))

(declare-fun res!146610 () Bool)

(assert (=> b!283866 (=> (not res!146610) (not e!180109))))

(assert (=> b!283866 (= res!146610 (not e!180111))))

(declare-fun res!146612 () Bool)

(assert (=> b!283866 (=> (not res!146612) (not e!180111))))

(assert (=> b!283866 (= res!146612 (validKeyInArray!0 (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun bm!25503 () Bool)

(declare-fun c!46179 () Bool)

(assert (=> bm!25503 (= call!25506 (arrayNoDuplicates!0 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46179 (Cons!4429 (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) #b00000000000000000000000000000000) Nil!4430) Nil!4430)))))

(declare-fun b!283867 () Bool)

(assert (=> b!283867 (= e!180109 e!180108)))

(assert (=> b!283867 (= c!46179 (validKeyInArray!0 (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) #b00000000000000000000000000000000)))))

(assert (= (and d!65543 (not res!146611)) b!283866))

(assert (= (and b!283866 res!146612) b!283865))

(assert (= (and b!283866 res!146610) b!283867))

(assert (= (and b!283867 c!46179) b!283864))

(assert (= (and b!283867 (not c!46179)) b!283863))

(assert (= (or b!283864 b!283863) bm!25503))

(declare-fun m!299015 () Bool)

(assert (=> b!283865 m!299015))

(assert (=> b!283865 m!299015))

(declare-fun m!299017 () Bool)

(assert (=> b!283865 m!299017))

(assert (=> b!283866 m!299015))

(assert (=> b!283866 m!299015))

(declare-fun m!299019 () Bool)

(assert (=> b!283866 m!299019))

(assert (=> bm!25503 m!299015))

(declare-fun m!299021 () Bool)

(assert (=> bm!25503 m!299021))

(assert (=> b!283867 m!299015))

(assert (=> b!283867 m!299015))

(assert (=> b!283867 m!299019))

(assert (=> b!283654 d!65543))

(declare-fun call!25507 () Bool)

(declare-fun bm!25504 () Bool)

(assert (=> bm!25504 (= call!25507 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!140181 mask!3868))))

(declare-fun b!283869 () Bool)

(declare-fun e!180112 () Bool)

(assert (=> b!283869 (= e!180112 call!25507)))

(declare-fun b!283868 () Bool)

(declare-fun e!180114 () Bool)

(assert (=> b!283868 (= e!180114 e!180112)))

(declare-fun lt!140335 () (_ BitVec 64))

(assert (=> b!283868 (= lt!140335 (select (arr!6712 lt!140181) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140337 () Unit!9000)

(assert (=> b!283868 (= lt!140337 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140181 lt!140335 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!283868 (arrayContainsKey!0 lt!140181 lt!140335 #b00000000000000000000000000000000)))

(declare-fun lt!140336 () Unit!9000)

(assert (=> b!283868 (= lt!140336 lt!140337)))

(declare-fun res!146614 () Bool)

(assert (=> b!283868 (= res!146614 (= (seekEntryOrOpen!0 (select (arr!6712 lt!140181) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!140181 mask!3868) (Found!1835 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!283868 (=> (not res!146614) (not e!180112))))

(declare-fun d!65545 () Bool)

(declare-fun res!146613 () Bool)

(declare-fun e!180113 () Bool)

(assert (=> d!65545 (=> res!146613 e!180113)))

(assert (=> d!65545 (= res!146613 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7064 lt!140181)))))

(assert (=> d!65545 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140181 mask!3868) e!180113)))

(declare-fun b!283870 () Bool)

(assert (=> b!283870 (= e!180114 call!25507)))

(declare-fun b!283871 () Bool)

(assert (=> b!283871 (= e!180113 e!180114)))

(declare-fun c!46180 () Bool)

(assert (=> b!283871 (= c!46180 (validKeyInArray!0 (select (arr!6712 lt!140181) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (= (and d!65545 (not res!146613)) b!283871))

(assert (= (and b!283871 c!46180) b!283868))

(assert (= (and b!283871 (not c!46180)) b!283870))

(assert (= (and b!283868 res!146614) b!283869))

(assert (= (or b!283869 b!283870) bm!25504))

(declare-fun m!299023 () Bool)

(assert (=> bm!25504 m!299023))

(declare-fun m!299025 () Bool)

(assert (=> b!283868 m!299025))

(declare-fun m!299027 () Bool)

(assert (=> b!283868 m!299027))

(declare-fun m!299029 () Bool)

(assert (=> b!283868 m!299029))

(assert (=> b!283868 m!299025))

(declare-fun m!299031 () Bool)

(assert (=> b!283868 m!299031))

(assert (=> b!283871 m!299025))

(assert (=> b!283871 m!299025))

(declare-fun m!299033 () Bool)

(assert (=> b!283871 m!299033))

(assert (=> bm!25485 d!65545))

(declare-fun d!65547 () Bool)

(assert (=> d!65547 (arrayContainsKey!0 lt!140181 lt!140271 #b00000000000000000000000000000000)))

(declare-fun lt!140340 () Unit!9000)

(declare-fun choose!13 (array!14144 (_ BitVec 64) (_ BitVec 32)) Unit!9000)

(assert (=> d!65547 (= lt!140340 (choose!13 lt!140181 lt!140271 startIndex!26))))

(assert (=> d!65547 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65547 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140181 lt!140271 startIndex!26) lt!140340)))

(declare-fun bs!10093 () Bool)

(assert (= bs!10093 d!65547))

(assert (=> bs!10093 m!298817))

(declare-fun m!299035 () Bool)

(assert (=> bs!10093 m!299035))

(assert (=> b!283692 d!65547))

(declare-fun d!65549 () Bool)

(declare-fun res!146615 () Bool)

(declare-fun e!180115 () Bool)

(assert (=> d!65549 (=> res!146615 e!180115)))

(assert (=> d!65549 (= res!146615 (= (select (arr!6712 lt!140181) #b00000000000000000000000000000000) lt!140271))))

(assert (=> d!65549 (= (arrayContainsKey!0 lt!140181 lt!140271 #b00000000000000000000000000000000) e!180115)))

(declare-fun b!283872 () Bool)

(declare-fun e!180116 () Bool)

(assert (=> b!283872 (= e!180115 e!180116)))

(declare-fun res!146616 () Bool)

(assert (=> b!283872 (=> (not res!146616) (not e!180116))))

(assert (=> b!283872 (= res!146616 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 lt!140181)))))

(declare-fun b!283873 () Bool)

(assert (=> b!283873 (= e!180116 (arrayContainsKey!0 lt!140181 lt!140271 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65549 (not res!146615)) b!283872))

(assert (= (and b!283872 res!146616) b!283873))

(assert (=> d!65549 m!298739))

(declare-fun m!299037 () Bool)

(assert (=> b!283873 m!299037))

(assert (=> b!283692 d!65549))

(declare-fun b!283874 () Bool)

(declare-fun e!180119 () SeekEntryResult!1835)

(declare-fun lt!140342 () SeekEntryResult!1835)

(assert (=> b!283874 (= e!180119 (MissingZero!1835 (index!9512 lt!140342)))))

(declare-fun b!283875 () Bool)

(declare-fun c!46183 () Bool)

(declare-fun lt!140341 () (_ BitVec 64))

(assert (=> b!283875 (= c!46183 (= lt!140341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180118 () SeekEntryResult!1835)

(assert (=> b!283875 (= e!180118 e!180119)))

(declare-fun b!283877 () Bool)

(assert (=> b!283877 (= e!180118 (Found!1835 (index!9512 lt!140342)))))

(declare-fun b!283878 () Bool)

(declare-fun e!180117 () SeekEntryResult!1835)

(assert (=> b!283878 (= e!180117 e!180118)))

(assert (=> b!283878 (= lt!140341 (select (arr!6712 lt!140181) (index!9512 lt!140342)))))

(declare-fun c!46182 () Bool)

(assert (=> b!283878 (= c!46182 (= lt!140341 (select (arr!6712 lt!140181) startIndex!26)))))

(declare-fun b!283879 () Bool)

(assert (=> b!283879 (= e!180117 Undefined!1835)))

(declare-fun b!283876 () Bool)

(assert (=> b!283876 (= e!180119 (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140342) (index!9512 lt!140342) (index!9512 lt!140342) (select (arr!6712 lt!140181) startIndex!26) lt!140181 mask!3868))))

(declare-fun d!65551 () Bool)

(declare-fun lt!140343 () SeekEntryResult!1835)

(assert (=> d!65551 (and (or ((_ is Undefined!1835) lt!140343) (not ((_ is Found!1835) lt!140343)) (and (bvsge (index!9511 lt!140343) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140343) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140343) ((_ is Found!1835) lt!140343) (not ((_ is MissingZero!1835) lt!140343)) (and (bvsge (index!9510 lt!140343) #b00000000000000000000000000000000) (bvslt (index!9510 lt!140343) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140343) ((_ is Found!1835) lt!140343) ((_ is MissingZero!1835) lt!140343) (not ((_ is MissingVacant!1835) lt!140343)) (and (bvsge (index!9513 lt!140343) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140343) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140343) (ite ((_ is Found!1835) lt!140343) (= (select (arr!6712 lt!140181) (index!9511 lt!140343)) (select (arr!6712 lt!140181) startIndex!26)) (ite ((_ is MissingZero!1835) lt!140343) (= (select (arr!6712 lt!140181) (index!9510 lt!140343)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1835) lt!140343) (= (select (arr!6712 lt!140181) (index!9513 lt!140343)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65551 (= lt!140343 e!180117)))

(declare-fun c!46181 () Bool)

(assert (=> d!65551 (= c!46181 (and ((_ is Intermediate!1835) lt!140342) (undefined!2647 lt!140342)))))

(assert (=> d!65551 (= lt!140342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6712 lt!140181) startIndex!26) mask!3868) (select (arr!6712 lt!140181) startIndex!26) lt!140181 mask!3868))))

(assert (=> d!65551 (validMask!0 mask!3868)))

(assert (=> d!65551 (= (seekEntryOrOpen!0 (select (arr!6712 lt!140181) startIndex!26) lt!140181 mask!3868) lt!140343)))

(assert (= (and d!65551 c!46181) b!283879))

(assert (= (and d!65551 (not c!46181)) b!283878))

(assert (= (and b!283878 c!46182) b!283877))

(assert (= (and b!283878 (not c!46182)) b!283875))

(assert (= (and b!283875 c!46183) b!283874))

(assert (= (and b!283875 (not c!46183)) b!283876))

(declare-fun m!299039 () Bool)

(assert (=> b!283878 m!299039))

(assert (=> b!283876 m!298813))

(declare-fun m!299041 () Bool)

(assert (=> b!283876 m!299041))

(declare-fun m!299043 () Bool)

(assert (=> d!65551 m!299043))

(declare-fun m!299045 () Bool)

(assert (=> d!65551 m!299045))

(assert (=> d!65551 m!298617))

(assert (=> d!65551 m!298813))

(declare-fun m!299047 () Bool)

(assert (=> d!65551 m!299047))

(assert (=> d!65551 m!299047))

(assert (=> d!65551 m!298813))

(declare-fun m!299049 () Bool)

(assert (=> d!65551 m!299049))

(declare-fun m!299051 () Bool)

(assert (=> d!65551 m!299051))

(assert (=> b!283692 d!65551))

(declare-fun d!65553 () Bool)

(assert (=> d!65553 (arrayNoDuplicates!0 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) #b00000000000000000000000000000000 Nil!4430)))

(assert (=> d!65553 true))

(declare-fun _$65!101 () Unit!9000)

(assert (=> d!65553 (= (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4430) _$65!101)))

(declare-fun bs!10094 () Bool)

(assert (= bs!10094 d!65553))

(assert (=> bs!10094 m!298599))

(assert (=> bs!10094 m!298749))

(assert (=> d!65449 d!65553))

(declare-fun b!283916 () Bool)

(declare-fun e!180142 () Bool)

(declare-fun e!180144 () Bool)

(assert (=> b!283916 (= e!180142 e!180144)))

(declare-fun res!146629 () Bool)

(declare-fun lt!140352 () SeekEntryResult!1835)

(assert (=> b!283916 (= res!146629 (and ((_ is Intermediate!1835) lt!140352) (not (undefined!2647 lt!140352)) (bvslt (x!27825 lt!140352) #b01111111111111111111111111111110) (bvsge (x!27825 lt!140352) #b00000000000000000000000000000000) (bvsge (x!27825 lt!140352) #b00000000000000000000000000000000)))))

(assert (=> b!283916 (=> (not res!146629) (not e!180144))))

(declare-fun d!65557 () Bool)

(assert (=> d!65557 e!180142))

(declare-fun c!46197 () Bool)

(assert (=> d!65557 (= c!46197 (and ((_ is Intermediate!1835) lt!140352) (undefined!2647 lt!140352)))))

(declare-fun e!180141 () SeekEntryResult!1835)

(assert (=> d!65557 (= lt!140352 e!180141)))

(declare-fun c!46196 () Bool)

(assert (=> d!65557 (= c!46196 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140353 () (_ BitVec 64))

(assert (=> d!65557 (= lt!140353 (select (arr!6712 a!3325) (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868)))))

(assert (=> d!65557 (validMask!0 mask!3868)))

(assert (=> d!65557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868) (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) lt!140352)))

(declare-fun b!283917 () Bool)

(declare-fun e!180143 () SeekEntryResult!1835)

(assert (=> b!283917 (= e!180143 (Intermediate!1835 false (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283918 () Bool)

(assert (=> b!283918 (= e!180141 (Intermediate!1835 true (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283919 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!283919 (= e!180143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3868) (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283920 () Bool)

(assert (=> b!283920 (= e!180142 (bvsge (x!27825 lt!140352) #b01111111111111111111111111111110))))

(declare-fun b!283921 () Bool)

(assert (=> b!283921 (= e!180141 e!180143)))

(declare-fun c!46198 () Bool)

(assert (=> b!283921 (= c!46198 (or (= lt!140353 (select (arr!6712 a!3325) startIndex!26)) (= (bvadd lt!140353 lt!140353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283922 () Bool)

(assert (=> b!283922 (and (bvsge (index!9512 lt!140352) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140352) (size!7064 a!3325)))))

(declare-fun res!146630 () Bool)

(assert (=> b!283922 (= res!146630 (= (select (arr!6712 a!3325) (index!9512 lt!140352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180140 () Bool)

(assert (=> b!283922 (=> res!146630 e!180140)))

(declare-fun b!283923 () Bool)

(assert (=> b!283923 (and (bvsge (index!9512 lt!140352) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140352) (size!7064 a!3325)))))

(assert (=> b!283923 (= e!180140 (= (select (arr!6712 a!3325) (index!9512 lt!140352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283924 () Bool)

(assert (=> b!283924 (and (bvsge (index!9512 lt!140352) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140352) (size!7064 a!3325)))))

(declare-fun res!146631 () Bool)

(assert (=> b!283924 (= res!146631 (= (select (arr!6712 a!3325) (index!9512 lt!140352)) (select (arr!6712 a!3325) startIndex!26)))))

(assert (=> b!283924 (=> res!146631 e!180140)))

(assert (=> b!283924 (= e!180144 e!180140)))

(assert (= (and d!65557 c!46196) b!283918))

(assert (= (and d!65557 (not c!46196)) b!283921))

(assert (= (and b!283921 c!46198) b!283917))

(assert (= (and b!283921 (not c!46198)) b!283919))

(assert (= (and d!65557 c!46197) b!283920))

(assert (= (and d!65557 (not c!46197)) b!283916))

(assert (= (and b!283916 res!146629) b!283924))

(assert (= (and b!283924 (not res!146631)) b!283922))

(assert (= (and b!283922 (not res!146630)) b!283923))

(declare-fun m!299053 () Bool)

(assert (=> b!283922 m!299053))

(assert (=> b!283919 m!298721))

(declare-fun m!299055 () Bool)

(assert (=> b!283919 m!299055))

(assert (=> b!283919 m!299055))

(assert (=> b!283919 m!298603))

(declare-fun m!299057 () Bool)

(assert (=> b!283919 m!299057))

(assert (=> b!283923 m!299053))

(assert (=> b!283924 m!299053))

(assert (=> d!65557 m!298721))

(declare-fun m!299059 () Bool)

(assert (=> d!65557 m!299059))

(assert (=> d!65557 m!298617))

(assert (=> d!65439 d!65557))

(declare-fun d!65559 () Bool)

(declare-fun lt!140361 () (_ BitVec 32))

(declare-fun lt!140360 () (_ BitVec 32))

(assert (=> d!65559 (= lt!140361 (bvmul (bvxor lt!140360 (bvlshr lt!140360 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65559 (= lt!140360 ((_ extract 31 0) (bvand (bvxor (select (arr!6712 a!3325) startIndex!26) (bvlshr (select (arr!6712 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65559 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146635 (let ((h!5102 ((_ extract 31 0) (bvand (bvxor (select (arr!6712 a!3325) startIndex!26) (bvlshr (select (arr!6712 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27830 (bvmul (bvxor h!5102 (bvlshr h!5102 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27830 (bvlshr x!27830 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146635 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146635 #b00000000000000000000000000000000))))))

(assert (=> d!65559 (= (toIndex!0 (select (arr!6712 a!3325) startIndex!26) mask!3868) (bvand (bvxor lt!140361 (bvlshr lt!140361 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65439 d!65559))

(assert (=> d!65439 d!65467))

(declare-fun b!283934 () Bool)

(declare-fun e!180152 () Bool)

(declare-fun e!180154 () Bool)

(assert (=> b!283934 (= e!180152 e!180154)))

(declare-fun res!146637 () Bool)

(declare-fun lt!140362 () SeekEntryResult!1835)

(assert (=> b!283934 (= res!146637 (and ((_ is Intermediate!1835) lt!140362) (not (undefined!2647 lt!140362)) (bvslt (x!27825 lt!140362) #b01111111111111111111111111111110) (bvsge (x!27825 lt!140362) #b00000000000000000000000000000000) (bvsge (x!27825 lt!140362) #b00000000000000000000000000000000)))))

(assert (=> b!283934 (=> (not res!146637) (not e!180154))))

(declare-fun d!65563 () Bool)

(assert (=> d!65563 e!180152))

(declare-fun c!46203 () Bool)

(assert (=> d!65563 (= c!46203 (and ((_ is Intermediate!1835) lt!140362) (undefined!2647 lt!140362)))))

(declare-fun e!180151 () SeekEntryResult!1835)

(assert (=> d!65563 (= lt!140362 e!180151)))

(declare-fun c!46202 () Bool)

(assert (=> d!65563 (= c!46202 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140363 () (_ BitVec 64))

(assert (=> d!65563 (= lt!140363 (select (arr!6712 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!65563 (validMask!0 mask!3868)))

(assert (=> d!65563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!140362)))

(declare-fun b!283935 () Bool)

(declare-fun e!180153 () SeekEntryResult!1835)

(assert (=> b!283935 (= e!180153 (Intermediate!1835 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283936 () Bool)

(assert (=> b!283936 (= e!180151 (Intermediate!1835 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283937 () Bool)

(assert (=> b!283937 (= e!180153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!283938 () Bool)

(assert (=> b!283938 (= e!180152 (bvsge (x!27825 lt!140362) #b01111111111111111111111111111110))))

(declare-fun b!283939 () Bool)

(assert (=> b!283939 (= e!180151 e!180153)))

(declare-fun c!46204 () Bool)

(assert (=> b!283939 (= c!46204 (or (= lt!140363 k0!2581) (= (bvadd lt!140363 lt!140363) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283940 () Bool)

(assert (=> b!283940 (and (bvsge (index!9512 lt!140362) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140362) (size!7064 a!3325)))))

(declare-fun res!146638 () Bool)

(assert (=> b!283940 (= res!146638 (= (select (arr!6712 a!3325) (index!9512 lt!140362)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180150 () Bool)

(assert (=> b!283940 (=> res!146638 e!180150)))

(declare-fun b!283941 () Bool)

(assert (=> b!283941 (and (bvsge (index!9512 lt!140362) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140362) (size!7064 a!3325)))))

(assert (=> b!283941 (= e!180150 (= (select (arr!6712 a!3325) (index!9512 lt!140362)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283942 () Bool)

(assert (=> b!283942 (and (bvsge (index!9512 lt!140362) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140362) (size!7064 a!3325)))))

(declare-fun res!146639 () Bool)

(assert (=> b!283942 (= res!146639 (= (select (arr!6712 a!3325) (index!9512 lt!140362)) k0!2581))))

(assert (=> b!283942 (=> res!146639 e!180150)))

(assert (=> b!283942 (= e!180154 e!180150)))

(assert (= (and d!65563 c!46202) b!283936))

(assert (= (and d!65563 (not c!46202)) b!283939))

(assert (= (and b!283939 c!46204) b!283935))

(assert (= (and b!283939 (not c!46204)) b!283937))

(assert (= (and d!65563 c!46203) b!283938))

(assert (= (and d!65563 (not c!46203)) b!283934))

(assert (= (and b!283934 res!146637) b!283942))

(assert (= (and b!283942 (not res!146639)) b!283940))

(assert (= (and b!283940 (not res!146638)) b!283941))

(declare-fun m!299069 () Bool)

(assert (=> b!283940 m!299069))

(assert (=> b!283937 m!298805))

(declare-fun m!299071 () Bool)

(assert (=> b!283937 m!299071))

(assert (=> b!283937 m!299071))

(declare-fun m!299073 () Bool)

(assert (=> b!283937 m!299073))

(assert (=> b!283941 m!299069))

(assert (=> b!283942 m!299069))

(assert (=> d!65563 m!298805))

(declare-fun m!299075 () Bool)

(assert (=> d!65563 m!299075))

(assert (=> d!65563 m!298617))

(assert (=> d!65477 d!65563))

(declare-fun d!65565 () Bool)

(declare-fun lt!140369 () (_ BitVec 32))

(declare-fun lt!140368 () (_ BitVec 32))

(assert (=> d!65565 (= lt!140369 (bvmul (bvxor lt!140368 (bvlshr lt!140368 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65565 (= lt!140368 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65565 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146635 (let ((h!5102 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27830 (bvmul (bvxor h!5102 (bvlshr h!5102 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27830 (bvlshr x!27830 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146635 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146635 #b00000000000000000000000000000000))))))

(assert (=> d!65565 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!140369 (bvlshr lt!140369 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65477 d!65565))

(assert (=> d!65477 d!65467))

(declare-fun bm!25505 () Bool)

(declare-fun call!25508 () Bool)

(assert (=> bm!25505 (= call!25508 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283944 () Bool)

(declare-fun e!180155 () Bool)

(assert (=> b!283944 (= e!180155 call!25508)))

(declare-fun b!283943 () Bool)

(declare-fun e!180157 () Bool)

(assert (=> b!283943 (= e!180157 e!180155)))

(declare-fun lt!140372 () (_ BitVec 64))

(assert (=> b!283943 (= lt!140372 (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140374 () Unit!9000)

(assert (=> b!283943 (= lt!140374 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140372 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!283943 (arrayContainsKey!0 a!3325 lt!140372 #b00000000000000000000000000000000)))

(declare-fun lt!140373 () Unit!9000)

(assert (=> b!283943 (= lt!140373 lt!140374)))

(declare-fun res!146641 () Bool)

(assert (=> b!283943 (= res!146641 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1835 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!283943 (=> (not res!146641) (not e!180155))))

(declare-fun d!65567 () Bool)

(declare-fun res!146640 () Bool)

(declare-fun e!180156 () Bool)

(assert (=> d!65567 (=> res!146640 e!180156)))

(assert (=> d!65567 (= res!146640 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(assert (=> d!65567 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!180156)))

(declare-fun b!283945 () Bool)

(assert (=> b!283945 (= e!180157 call!25508)))

(declare-fun b!283946 () Bool)

(assert (=> b!283946 (= e!180156 e!180157)))

(declare-fun c!46205 () Bool)

(assert (=> b!283946 (= c!46205 (validKeyInArray!0 (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65567 (not res!146640)) b!283946))

(assert (= (and b!283946 c!46205) b!283943))

(assert (= (and b!283946 (not c!46205)) b!283945))

(assert (= (and b!283943 res!146641) b!283944))

(assert (= (or b!283944 b!283945) bm!25505))

(declare-fun m!299077 () Bool)

(assert (=> bm!25505 m!299077))

(assert (=> b!283943 m!299003))

(declare-fun m!299079 () Bool)

(assert (=> b!283943 m!299079))

(declare-fun m!299081 () Bool)

(assert (=> b!283943 m!299081))

(assert (=> b!283943 m!299003))

(declare-fun m!299083 () Bool)

(assert (=> b!283943 m!299083))

(assert (=> b!283946 m!299003))

(assert (=> b!283946 m!299003))

(declare-fun m!299085 () Bool)

(assert (=> b!283946 m!299085))

(assert (=> bm!25484 d!65567))

(declare-fun d!65571 () Bool)

(assert (=> d!65571 (arrayContainsKey!0 a!3325 lt!140257 #b00000000000000000000000000000000)))

(declare-fun lt!140378 () Unit!9000)

(assert (=> d!65571 (= lt!140378 (choose!13 a!3325 lt!140257 #b00000000000000000000000000000000))))

(assert (=> d!65571 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!65571 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140257 #b00000000000000000000000000000000) lt!140378)))

(declare-fun bs!10095 () Bool)

(assert (= bs!10095 d!65571))

(assert (=> bs!10095 m!298783))

(declare-fun m!299099 () Bool)

(assert (=> bs!10095 m!299099))

(assert (=> b!283676 d!65571))

(declare-fun d!65573 () Bool)

(declare-fun res!146644 () Bool)

(declare-fun e!180161 () Bool)

(assert (=> d!65573 (=> res!146644 e!180161)))

(assert (=> d!65573 (= res!146644 (= (select (arr!6712 a!3325) #b00000000000000000000000000000000) lt!140257))))

(assert (=> d!65573 (= (arrayContainsKey!0 a!3325 lt!140257 #b00000000000000000000000000000000) e!180161)))

(declare-fun b!283951 () Bool)

(declare-fun e!180162 () Bool)

(assert (=> b!283951 (= e!180161 e!180162)))

(declare-fun res!146645 () Bool)

(assert (=> b!283951 (=> (not res!146645) (not e!180162))))

(assert (=> b!283951 (= res!146645 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(declare-fun b!283952 () Bool)

(assert (=> b!283952 (= e!180162 (arrayContainsKey!0 a!3325 lt!140257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65573 (not res!146644)) b!283951))

(assert (= (and b!283951 res!146645) b!283952))

(assert (=> d!65573 m!298779))

(declare-fun m!299101 () Bool)

(assert (=> b!283952 m!299101))

(assert (=> b!283676 d!65573))

(declare-fun b!283953 () Bool)

(declare-fun e!180165 () SeekEntryResult!1835)

(declare-fun lt!140380 () SeekEntryResult!1835)

(assert (=> b!283953 (= e!180165 (MissingZero!1835 (index!9512 lt!140380)))))

(declare-fun b!283954 () Bool)

(declare-fun c!46209 () Bool)

(declare-fun lt!140379 () (_ BitVec 64))

(assert (=> b!283954 (= c!46209 (= lt!140379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180164 () SeekEntryResult!1835)

(assert (=> b!283954 (= e!180164 e!180165)))

(declare-fun b!283956 () Bool)

(assert (=> b!283956 (= e!180164 (Found!1835 (index!9512 lt!140380)))))

(declare-fun b!283957 () Bool)

(declare-fun e!180163 () SeekEntryResult!1835)

(assert (=> b!283957 (= e!180163 e!180164)))

(assert (=> b!283957 (= lt!140379 (select (arr!6712 a!3325) (index!9512 lt!140380)))))

(declare-fun c!46208 () Bool)

(assert (=> b!283957 (= c!46208 (= lt!140379 (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283958 () Bool)

(assert (=> b!283958 (= e!180163 Undefined!1835)))

(declare-fun b!283955 () Bool)

(assert (=> b!283955 (= e!180165 (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140380) (index!9512 lt!140380) (index!9512 lt!140380) (select (arr!6712 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun d!65579 () Bool)

(declare-fun lt!140381 () SeekEntryResult!1835)

(assert (=> d!65579 (and (or ((_ is Undefined!1835) lt!140381) (not ((_ is Found!1835) lt!140381)) (and (bvsge (index!9511 lt!140381) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140381) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140381) ((_ is Found!1835) lt!140381) (not ((_ is MissingZero!1835) lt!140381)) (and (bvsge (index!9510 lt!140381) #b00000000000000000000000000000000) (bvslt (index!9510 lt!140381) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140381) ((_ is Found!1835) lt!140381) ((_ is MissingZero!1835) lt!140381) (not ((_ is MissingVacant!1835) lt!140381)) (and (bvsge (index!9513 lt!140381) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140381) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140381) (ite ((_ is Found!1835) lt!140381) (= (select (arr!6712 a!3325) (index!9511 lt!140381)) (select (arr!6712 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1835) lt!140381) (= (select (arr!6712 a!3325) (index!9510 lt!140381)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1835) lt!140381) (= (select (arr!6712 a!3325) (index!9513 lt!140381)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65579 (= lt!140381 e!180163)))

(declare-fun c!46207 () Bool)

(assert (=> d!65579 (= c!46207 (and ((_ is Intermediate!1835) lt!140380) (undefined!2647 lt!140380)))))

(assert (=> d!65579 (= lt!140380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6712 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!65579 (validMask!0 mask!3868)))

(assert (=> d!65579 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!140381)))

(assert (= (and d!65579 c!46207) b!283958))

(assert (= (and d!65579 (not c!46207)) b!283957))

(assert (= (and b!283957 c!46208) b!283956))

(assert (= (and b!283957 (not c!46208)) b!283954))

(assert (= (and b!283954 c!46209) b!283953))

(assert (= (and b!283954 (not c!46209)) b!283955))

(declare-fun m!299103 () Bool)

(assert (=> b!283957 m!299103))

(assert (=> b!283955 m!298779))

(declare-fun m!299105 () Bool)

(assert (=> b!283955 m!299105))

(declare-fun m!299107 () Bool)

(assert (=> d!65579 m!299107))

(declare-fun m!299109 () Bool)

(assert (=> d!65579 m!299109))

(assert (=> d!65579 m!298617))

(assert (=> d!65579 m!298779))

(declare-fun m!299111 () Bool)

(assert (=> d!65579 m!299111))

(assert (=> d!65579 m!299111))

(assert (=> d!65579 m!298779))

(declare-fun m!299113 () Bool)

(assert (=> d!65579 m!299113))

(declare-fun m!299115 () Bool)

(assert (=> d!65579 m!299115))

(assert (=> b!283676 d!65579))

(declare-fun b!283959 () Bool)

(declare-fun e!180168 () Bool)

(declare-fun e!180170 () Bool)

(assert (=> b!283959 (= e!180168 e!180170)))

(declare-fun res!146646 () Bool)

(declare-fun lt!140384 () SeekEntryResult!1835)

(assert (=> b!283959 (= res!146646 (and ((_ is Intermediate!1835) lt!140384) (not (undefined!2647 lt!140384)) (bvslt (x!27825 lt!140384) #b01111111111111111111111111111110) (bvsge (x!27825 lt!140384) #b00000000000000000000000000000000) (bvsge (x!27825 lt!140384) #b00000000000000000000000000000000)))))

(assert (=> b!283959 (=> (not res!146646) (not e!180170))))

(declare-fun d!65581 () Bool)

(assert (=> d!65581 e!180168))

(declare-fun c!46211 () Bool)

(assert (=> d!65581 (= c!46211 (and ((_ is Intermediate!1835) lt!140384) (undefined!2647 lt!140384)))))

(declare-fun e!180167 () SeekEntryResult!1835)

(assert (=> d!65581 (= lt!140384 e!180167)))

(declare-fun c!46210 () Bool)

(assert (=> d!65581 (= c!46210 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140385 () (_ BitVec 64))

(assert (=> d!65581 (= lt!140385 (select (arr!6712 lt!140181) (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868)))))

(assert (=> d!65581 (validMask!0 mask!3868)))

(assert (=> d!65581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868) lt!140384)))

(declare-fun b!283960 () Bool)

(declare-fun e!180169 () SeekEntryResult!1835)

(assert (=> b!283960 (= e!180169 (Intermediate!1835 false (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283961 () Bool)

(assert (=> b!283961 (= e!180167 (Intermediate!1835 true (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283962 () Bool)

(assert (=> b!283962 (= e!180169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3868) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868))))

(declare-fun b!283963 () Bool)

(assert (=> b!283963 (= e!180168 (bvsge (x!27825 lt!140384) #b01111111111111111111111111111110))))

(declare-fun b!283964 () Bool)

(assert (=> b!283964 (= e!180167 e!180169)))

(declare-fun c!46212 () Bool)

(assert (=> b!283964 (= c!46212 (or (= lt!140385 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)) (= (bvadd lt!140385 lt!140385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283965 () Bool)

(assert (=> b!283965 (and (bvsge (index!9512 lt!140384) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140384) (size!7064 lt!140181)))))

(declare-fun res!146647 () Bool)

(assert (=> b!283965 (= res!146647 (= (select (arr!6712 lt!140181) (index!9512 lt!140384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180166 () Bool)

(assert (=> b!283965 (=> res!146647 e!180166)))

(declare-fun b!283966 () Bool)

(assert (=> b!283966 (and (bvsge (index!9512 lt!140384) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140384) (size!7064 lt!140181)))))

(assert (=> b!283966 (= e!180166 (= (select (arr!6712 lt!140181) (index!9512 lt!140384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283967 () Bool)

(assert (=> b!283967 (and (bvsge (index!9512 lt!140384) #b00000000000000000000000000000000) (bvslt (index!9512 lt!140384) (size!7064 lt!140181)))))

(declare-fun res!146648 () Bool)

(assert (=> b!283967 (= res!146648 (= (select (arr!6712 lt!140181) (index!9512 lt!140384)) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)))))

(assert (=> b!283967 (=> res!146648 e!180166)))

(assert (=> b!283967 (= e!180170 e!180166)))

(assert (= (and d!65581 c!46210) b!283961))

(assert (= (and d!65581 (not c!46210)) b!283964))

(assert (= (and b!283964 c!46212) b!283960))

(assert (= (and b!283964 (not c!46212)) b!283962))

(assert (= (and d!65581 c!46211) b!283963))

(assert (= (and d!65581 (not c!46211)) b!283959))

(assert (= (and b!283959 res!146646) b!283967))

(assert (= (and b!283967 (not res!146648)) b!283965))

(assert (= (and b!283965 (not res!146647)) b!283966))

(declare-fun m!299119 () Bool)

(assert (=> b!283965 m!299119))

(assert (=> b!283962 m!298771))

(declare-fun m!299121 () Bool)

(assert (=> b!283962 m!299121))

(assert (=> b!283962 m!299121))

(assert (=> b!283962 m!298597))

(declare-fun m!299123 () Bool)

(assert (=> b!283962 m!299123))

(assert (=> b!283966 m!299119))

(assert (=> b!283967 m!299119))

(assert (=> d!65581 m!298771))

(declare-fun m!299125 () Bool)

(assert (=> d!65581 m!299125))

(assert (=> d!65581 m!298617))

(assert (=> d!65463 d!65581))

(declare-fun d!65585 () Bool)

(declare-fun lt!140388 () (_ BitVec 32))

(declare-fun lt!140387 () (_ BitVec 32))

(assert (=> d!65585 (= lt!140388 (bvmul (bvxor lt!140387 (bvlshr lt!140387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65585 (= lt!140387 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (bvlshr (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65585 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146635 (let ((h!5102 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (bvlshr (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27830 (bvmul (bvxor h!5102 (bvlshr h!5102 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27830 (bvlshr x!27830 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146635 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146635 #b00000000000000000000000000000000))))))

(assert (=> d!65585 (= (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (bvand (bvxor lt!140388 (bvlshr lt!140388 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65463 d!65585))

(assert (=> d!65463 d!65467))

(declare-fun d!65589 () Bool)

(declare-fun lt!140392 () Bool)

(assert (=> d!65589 (= lt!140392 (select (content!193 Nil!4430) (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!180176 () Bool)

(assert (=> d!65589 (= lt!140392 e!180176)))

(declare-fun res!146651 () Bool)

(assert (=> d!65589 (=> (not res!146651) (not e!180176))))

(assert (=> d!65589 (= res!146651 ((_ is Cons!4429) Nil!4430))))

(assert (=> d!65589 (= (contains!1967 Nil!4430 (select (arr!6712 a!3325) #b00000000000000000000000000000000)) lt!140392)))

(declare-fun b!283976 () Bool)

(declare-fun e!180177 () Bool)

(assert (=> b!283976 (= e!180176 e!180177)))

(declare-fun res!146652 () Bool)

(assert (=> b!283976 (=> res!146652 e!180177)))

(assert (=> b!283976 (= res!146652 (= (h!5099 Nil!4430) (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283977 () Bool)

(assert (=> b!283977 (= e!180177 (contains!1967 (t!9507 Nil!4430) (select (arr!6712 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65589 res!146651) b!283976))

(assert (= (and b!283976 (not res!146652)) b!283977))

(assert (=> d!65589 m!298997))

(assert (=> d!65589 m!298779))

(declare-fun m!299129 () Bool)

(assert (=> d!65589 m!299129))

(assert (=> b!283977 m!298779))

(declare-fun m!299131 () Bool)

(assert (=> b!283977 m!299131))

(assert (=> b!283710 d!65589))

(declare-fun b!284018 () Bool)

(declare-fun e!180207 () SeekEntryResult!1835)

(assert (=> b!284018 (= e!180207 (MissingVacant!1835 (index!9512 lt!140255)))))

(declare-fun b!284019 () Bool)

(declare-fun e!180206 () SeekEntryResult!1835)

(assert (=> b!284019 (= e!180206 (Found!1835 (index!9512 lt!140255)))))

(declare-fun b!284020 () Bool)

(declare-fun e!180208 () SeekEntryResult!1835)

(assert (=> b!284020 (= e!180208 Undefined!1835)))

(declare-fun d!65591 () Bool)

(declare-fun lt!140407 () SeekEntryResult!1835)

(assert (=> d!65591 (and (or ((_ is Undefined!1835) lt!140407) (not ((_ is Found!1835) lt!140407)) (and (bvsge (index!9511 lt!140407) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140407) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140407) ((_ is Found!1835) lt!140407) (not ((_ is MissingVacant!1835) lt!140407)) (not (= (index!9513 lt!140407) (index!9512 lt!140255))) (and (bvsge (index!9513 lt!140407) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140407) (size!7064 lt!140181)))) (or ((_ is Undefined!1835) lt!140407) (ite ((_ is Found!1835) lt!140407) (= (select (arr!6712 lt!140181) (index!9511 lt!140407)) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)) (and ((_ is MissingVacant!1835) lt!140407) (= (index!9513 lt!140407) (index!9512 lt!140255)) (= (select (arr!6712 lt!140181) (index!9513 lt!140407)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65591 (= lt!140407 e!180208)))

(declare-fun c!46228 () Bool)

(assert (=> d!65591 (= c!46228 (bvsge (x!27825 lt!140255) #b01111111111111111111111111111110))))

(declare-fun lt!140408 () (_ BitVec 64))

(assert (=> d!65591 (= lt!140408 (select (arr!6712 lt!140181) (index!9512 lt!140255)))))

(assert (=> d!65591 (validMask!0 mask!3868)))

(assert (=> d!65591 (= (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140255) (index!9512 lt!140255) (index!9512 lt!140255) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868) lt!140407)))

(declare-fun b!284021 () Bool)

(assert (=> b!284021 (= e!180207 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27825 lt!140255) #b00000000000000000000000000000001) (nextIndex!0 (index!9512 lt!140255) (bvadd (x!27825 lt!140255) #b00000000000000000000000000000001) mask!3868) (index!9512 lt!140255) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) lt!140181 mask!3868))))

(declare-fun b!284022 () Bool)

(assert (=> b!284022 (= e!180208 e!180206)))

(declare-fun c!46230 () Bool)

(assert (=> b!284022 (= c!46230 (= lt!140408 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!284023 () Bool)

(declare-fun c!46229 () Bool)

(assert (=> b!284023 (= c!46229 (= lt!140408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284023 (= e!180206 e!180207)))

(assert (= (and d!65591 c!46228) b!284020))

(assert (= (and d!65591 (not c!46228)) b!284022))

(assert (= (and b!284022 c!46230) b!284019))

(assert (= (and b!284022 (not c!46230)) b!284023))

(assert (= (and b!284023 c!46229) b!284018))

(assert (= (and b!284023 (not c!46229)) b!284021))

(declare-fun m!299199 () Bool)

(assert (=> d!65591 m!299199))

(declare-fun m!299201 () Bool)

(assert (=> d!65591 m!299201))

(assert (=> d!65591 m!298763))

(assert (=> d!65591 m!298617))

(declare-fun m!299203 () Bool)

(assert (=> b!284021 m!299203))

(assert (=> b!284021 m!299203))

(assert (=> b!284021 m!298597))

(declare-fun m!299205 () Bool)

(assert (=> b!284021 m!299205))

(assert (=> b!283672 d!65591))

(assert (=> b!283712 d!65535))

(declare-fun d!65613 () Bool)

(assert (=> d!65613 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) mask!3868))))

(assert (=> d!65613 true))

(declare-fun _$51!15 () Unit!9000)

(assert (=> d!65613 (= (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) _$51!15)))

(declare-fun bs!10098 () Bool)

(assert (= bs!10098 d!65613))

(assert (=> bs!10098 m!298599))

(assert (=> bs!10098 m!298597))

(assert (=> bs!10098 m!298711))

(assert (=> bs!10098 m!298597))

(assert (=> bs!10098 m!298603))

(assert (=> bs!10098 m!298607))

(assert (=> bs!10098 m!298603))

(assert (=> d!65437 d!65613))

(assert (=> d!65437 d!65467))

(declare-fun d!65615 () Bool)

(declare-fun res!146670 () Bool)

(declare-fun e!180211 () Bool)

(assert (=> d!65615 (=> res!146670 e!180211)))

(assert (=> d!65615 (= res!146670 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(assert (=> d!65615 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46138 (Cons!4429 (select (arr!6712 a!3325) #b00000000000000000000000000000000) Nil!4430) Nil!4430)) e!180211)))

(declare-fun b!284024 () Bool)

(declare-fun e!180209 () Bool)

(declare-fun call!25513 () Bool)

(assert (=> b!284024 (= e!180209 call!25513)))

(declare-fun b!284025 () Bool)

(assert (=> b!284025 (= e!180209 call!25513)))

(declare-fun b!284026 () Bool)

(declare-fun e!180212 () Bool)

(assert (=> b!284026 (= e!180212 (contains!1967 (ite c!46138 (Cons!4429 (select (arr!6712 a!3325) #b00000000000000000000000000000000) Nil!4430) Nil!4430) (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!284027 () Bool)

(declare-fun e!180210 () Bool)

(assert (=> b!284027 (= e!180211 e!180210)))

(declare-fun res!146669 () Bool)

(assert (=> b!284027 (=> (not res!146669) (not e!180210))))

(assert (=> b!284027 (= res!146669 (not e!180212))))

(declare-fun res!146671 () Bool)

(assert (=> b!284027 (=> (not res!146671) (not e!180212))))

(assert (=> b!284027 (= res!146671 (validKeyInArray!0 (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!46231 () Bool)

(declare-fun bm!25510 () Bool)

(assert (=> bm!25510 (= call!25513 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46231 (Cons!4429 (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46138 (Cons!4429 (select (arr!6712 a!3325) #b00000000000000000000000000000000) Nil!4430) Nil!4430)) (ite c!46138 (Cons!4429 (select (arr!6712 a!3325) #b00000000000000000000000000000000) Nil!4430) Nil!4430))))))

(declare-fun b!284028 () Bool)

(assert (=> b!284028 (= e!180210 e!180209)))

(assert (=> b!284028 (= c!46231 (validKeyInArray!0 (select (arr!6712 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65615 (not res!146670)) b!284027))

(assert (= (and b!284027 res!146671) b!284026))

(assert (= (and b!284027 res!146669) b!284028))

(assert (= (and b!284028 c!46231) b!284025))

(assert (= (and b!284028 (not c!46231)) b!284024))

(assert (= (or b!284025 b!284024) bm!25510))

(assert (=> b!284026 m!299003))

(assert (=> b!284026 m!299003))

(declare-fun m!299207 () Bool)

(assert (=> b!284026 m!299207))

(assert (=> b!284027 m!299003))

(assert (=> b!284027 m!299003))

(assert (=> b!284027 m!299085))

(assert (=> bm!25510 m!299003))

(declare-fun m!299209 () Bool)

(assert (=> bm!25510 m!299209))

(assert (=> b!284028 m!299003))

(assert (=> b!284028 m!299003))

(assert (=> b!284028 m!299085))

(assert (=> bm!25486 d!65615))

(assert (=> b!283606 d!65439))

(declare-fun b!284033 () Bool)

(declare-fun e!180217 () SeekEntryResult!1835)

(declare-fun lt!140414 () SeekEntryResult!1835)

(assert (=> b!284033 (= e!180217 (MissingZero!1835 (index!9512 lt!140414)))))

(declare-fun b!284034 () Bool)

(declare-fun c!46236 () Bool)

(declare-fun lt!140413 () (_ BitVec 64))

(assert (=> b!284034 (= c!46236 (= lt!140413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180216 () SeekEntryResult!1835)

(assert (=> b!284034 (= e!180216 e!180217)))

(declare-fun b!284036 () Bool)

(assert (=> b!284036 (= e!180216 (Found!1835 (index!9512 lt!140414)))))

(declare-fun b!284037 () Bool)

(declare-fun e!180215 () SeekEntryResult!1835)

(assert (=> b!284037 (= e!180215 e!180216)))

(assert (=> b!284037 (= lt!140413 (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) (index!9512 lt!140414)))))

(declare-fun c!46235 () Bool)

(assert (=> b!284037 (= c!46235 (= lt!140413 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!284038 () Bool)

(assert (=> b!284038 (= e!180215 Undefined!1835)))

(declare-fun b!284035 () Bool)

(assert (=> b!284035 (= e!180217 (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140414) (index!9512 lt!140414) (index!9512 lt!140414) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) mask!3868))))

(declare-fun lt!140415 () SeekEntryResult!1835)

(declare-fun d!65617 () Bool)

(assert (=> d!65617 (and (or ((_ is Undefined!1835) lt!140415) (not ((_ is Found!1835) lt!140415)) (and (bvsge (index!9511 lt!140415) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140415) (size!7064 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)))))) (or ((_ is Undefined!1835) lt!140415) ((_ is Found!1835) lt!140415) (not ((_ is MissingZero!1835) lt!140415)) (and (bvsge (index!9510 lt!140415) #b00000000000000000000000000000000) (bvslt (index!9510 lt!140415) (size!7064 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)))))) (or ((_ is Undefined!1835) lt!140415) ((_ is Found!1835) lt!140415) ((_ is MissingZero!1835) lt!140415) (not ((_ is MissingVacant!1835) lt!140415)) (and (bvsge (index!9513 lt!140415) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140415) (size!7064 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)))))) (or ((_ is Undefined!1835) lt!140415) (ite ((_ is Found!1835) lt!140415) (= (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) (index!9511 lt!140415)) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1835) lt!140415) (= (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) (index!9510 lt!140415)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1835) lt!140415) (= (select (arr!6712 (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325))) (index!9513 lt!140415)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65617 (= lt!140415 e!180215)))

(declare-fun c!46234 () Bool)

(assert (=> d!65617 (= c!46234 (and ((_ is Intermediate!1835) lt!140414) (undefined!2647 lt!140414)))))

(assert (=> d!65617 (= lt!140414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) mask!3868))))

(assert (=> d!65617 (validMask!0 mask!3868)))

(assert (=> d!65617 (= (seekEntryOrOpen!0 (select (store (arr!6712 a!3325) i!1267 k0!2581) startIndex!26) (array!14145 (store (arr!6712 a!3325) i!1267 k0!2581) (size!7064 a!3325)) mask!3868) lt!140415)))

(assert (= (and d!65617 c!46234) b!284038))

(assert (= (and d!65617 (not c!46234)) b!284037))

(assert (= (and b!284037 c!46235) b!284036))

(assert (= (and b!284037 (not c!46235)) b!284034))

(assert (= (and b!284034 c!46236) b!284033))

(assert (= (and b!284034 (not c!46236)) b!284035))

(declare-fun m!299211 () Bool)

(assert (=> b!284037 m!299211))

(assert (=> b!284035 m!298597))

(declare-fun m!299213 () Bool)

(assert (=> b!284035 m!299213))

(declare-fun m!299215 () Bool)

(assert (=> d!65617 m!299215))

(declare-fun m!299217 () Bool)

(assert (=> d!65617 m!299217))

(assert (=> d!65617 m!298617))

(assert (=> d!65617 m!298597))

(assert (=> d!65617 m!298771))

(assert (=> d!65617 m!298771))

(assert (=> d!65617 m!298597))

(declare-fun m!299219 () Bool)

(assert (=> d!65617 m!299219))

(declare-fun m!299221 () Bool)

(assert (=> d!65617 m!299221))

(assert (=> b!283606 d!65617))

(assert (=> b!283711 d!65535))

(declare-fun d!65619 () Bool)

(assert (=> d!65619 (= (validKeyInArray!0 (select (arr!6712 lt!140181) startIndex!26)) (and (not (= (select (arr!6712 lt!140181) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6712 lt!140181) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283695 d!65619))

(declare-fun b!284047 () Bool)

(declare-fun e!180223 () SeekEntryResult!1835)

(assert (=> b!284047 (= e!180223 (MissingVacant!1835 (index!9512 lt!140225)))))

(declare-fun b!284048 () Bool)

(declare-fun e!180222 () SeekEntryResult!1835)

(assert (=> b!284048 (= e!180222 (Found!1835 (index!9512 lt!140225)))))

(declare-fun b!284049 () Bool)

(declare-fun e!180224 () SeekEntryResult!1835)

(assert (=> b!284049 (= e!180224 Undefined!1835)))

(declare-fun lt!140416 () SeekEntryResult!1835)

(declare-fun d!65621 () Bool)

(assert (=> d!65621 (and (or ((_ is Undefined!1835) lt!140416) (not ((_ is Found!1835) lt!140416)) (and (bvsge (index!9511 lt!140416) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140416) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140416) ((_ is Found!1835) lt!140416) (not ((_ is MissingVacant!1835) lt!140416)) (not (= (index!9513 lt!140416) (index!9512 lt!140225))) (and (bvsge (index!9513 lt!140416) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140416) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140416) (ite ((_ is Found!1835) lt!140416) (= (select (arr!6712 a!3325) (index!9511 lt!140416)) (select (arr!6712 a!3325) startIndex!26)) (and ((_ is MissingVacant!1835) lt!140416) (= (index!9513 lt!140416) (index!9512 lt!140225)) (= (select (arr!6712 a!3325) (index!9513 lt!140416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65621 (= lt!140416 e!180224)))

(declare-fun c!46241 () Bool)

(assert (=> d!65621 (= c!46241 (bvsge (x!27825 lt!140225) #b01111111111111111111111111111110))))

(declare-fun lt!140417 () (_ BitVec 64))

(assert (=> d!65621 (= lt!140417 (select (arr!6712 a!3325) (index!9512 lt!140225)))))

(assert (=> d!65621 (validMask!0 mask!3868)))

(assert (=> d!65621 (= (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140225) (index!9512 lt!140225) (index!9512 lt!140225) (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) lt!140416)))

(declare-fun b!284050 () Bool)

(assert (=> b!284050 (= e!180223 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27825 lt!140225) #b00000000000000000000000000000001) (nextIndex!0 (index!9512 lt!140225) (bvadd (x!27825 lt!140225) #b00000000000000000000000000000001) mask!3868) (index!9512 lt!140225) (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!284051 () Bool)

(assert (=> b!284051 (= e!180224 e!180222)))

(declare-fun c!46243 () Bool)

(assert (=> b!284051 (= c!46243 (= lt!140417 (select (arr!6712 a!3325) startIndex!26)))))

(declare-fun b!284052 () Bool)

(declare-fun c!46242 () Bool)

(assert (=> b!284052 (= c!46242 (= lt!140417 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284052 (= e!180222 e!180223)))

(assert (= (and d!65621 c!46241) b!284049))

(assert (= (and d!65621 (not c!46241)) b!284051))

(assert (= (and b!284051 c!46243) b!284048))

(assert (= (and b!284051 (not c!46243)) b!284052))

(assert (= (and b!284052 c!46242) b!284047))

(assert (= (and b!284052 (not c!46242)) b!284050))

(declare-fun m!299223 () Bool)

(assert (=> d!65621 m!299223))

(declare-fun m!299225 () Bool)

(assert (=> d!65621 m!299225))

(assert (=> d!65621 m!298713))

(assert (=> d!65621 m!298617))

(declare-fun m!299227 () Bool)

(assert (=> b!284050 m!299227))

(assert (=> b!284050 m!299227))

(assert (=> b!284050 m!298603))

(declare-fun m!299229 () Bool)

(assert (=> b!284050 m!299229))

(assert (=> b!283621 d!65621))

(assert (=> b!283669 d!65475))

(declare-fun d!65623 () Bool)

(assert (=> d!65623 (arrayContainsKey!0 a!3325 lt!140251 #b00000000000000000000000000000000)))

(declare-fun lt!140418 () Unit!9000)

(assert (=> d!65623 (= lt!140418 (choose!13 a!3325 lt!140251 startIndex!26))))

(assert (=> d!65623 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65623 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140251 startIndex!26) lt!140418)))

(declare-fun bs!10099 () Bool)

(assert (= bs!10099 d!65623))

(assert (=> bs!10099 m!298761))

(declare-fun m!299231 () Bool)

(assert (=> bs!10099 m!299231))

(assert (=> b!283666 d!65623))

(declare-fun d!65625 () Bool)

(declare-fun res!146672 () Bool)

(declare-fun e!180225 () Bool)

(assert (=> d!65625 (=> res!146672 e!180225)))

(assert (=> d!65625 (= res!146672 (= (select (arr!6712 a!3325) #b00000000000000000000000000000000) lt!140251))))

(assert (=> d!65625 (= (arrayContainsKey!0 a!3325 lt!140251 #b00000000000000000000000000000000) e!180225)))

(declare-fun b!284053 () Bool)

(declare-fun e!180226 () Bool)

(assert (=> b!284053 (= e!180225 e!180226)))

(declare-fun res!146673 () Bool)

(assert (=> b!284053 (=> (not res!146673) (not e!180226))))

(assert (=> b!284053 (= res!146673 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(declare-fun b!284054 () Bool)

(assert (=> b!284054 (= e!180226 (arrayContainsKey!0 a!3325 lt!140251 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65625 (not res!146672)) b!284053))

(assert (= (and b!284053 res!146673) b!284054))

(assert (=> d!65625 m!298779))

(declare-fun m!299233 () Bool)

(assert (=> b!284054 m!299233))

(assert (=> b!283666 d!65625))

(assert (=> b!283666 d!65439))

(assert (=> b!283651 d!65539))

(assert (=> d!65451 d!65459))

(declare-fun d!65627 () Bool)

(assert (=> d!65627 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(assert (=> d!65627 true))

(declare-fun _$72!98 () Unit!9000)

(assert (=> d!65627 (= (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) _$72!98)))

(declare-fun bs!10100 () Bool)

(assert (= bs!10100 d!65627))

(assert (=> bs!10100 m!298601))

(assert (=> d!65451 d!65627))

(assert (=> d!65451 d!65467))

(declare-fun bm!25511 () Bool)

(declare-fun call!25514 () Bool)

(assert (=> bm!25511 (= call!25514 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!284062 () Bool)

(declare-fun e!180230 () Bool)

(assert (=> b!284062 (= e!180230 call!25514)))

(declare-fun b!284061 () Bool)

(declare-fun e!180232 () Bool)

(assert (=> b!284061 (= e!180232 e!180230)))

(declare-fun lt!140421 () (_ BitVec 64))

(assert (=> b!284061 (= lt!140421 (select (arr!6712 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140423 () Unit!9000)

(assert (=> b!284061 (= lt!140423 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140421 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!284061 (arrayContainsKey!0 a!3325 lt!140421 #b00000000000000000000000000000000)))

(declare-fun lt!140422 () Unit!9000)

(assert (=> b!284061 (= lt!140422 lt!140423)))

(declare-fun res!146675 () Bool)

(assert (=> b!284061 (= res!146675 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1835 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!284061 (=> (not res!146675) (not e!180230))))

(declare-fun d!65631 () Bool)

(declare-fun res!146674 () Bool)

(declare-fun e!180231 () Bool)

(assert (=> d!65631 (=> res!146674 e!180231)))

(assert (=> d!65631 (= res!146674 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7064 a!3325)))))

(assert (=> d!65631 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868) e!180231)))

(declare-fun b!284063 () Bool)

(assert (=> b!284063 (= e!180232 call!25514)))

(declare-fun b!284064 () Bool)

(assert (=> b!284064 (= e!180231 e!180232)))

(declare-fun c!46247 () Bool)

(assert (=> b!284064 (= c!46247 (validKeyInArray!0 (select (arr!6712 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (= (and d!65631 (not res!146674)) b!284064))

(assert (= (and b!284064 c!46247) b!284061))

(assert (= (and b!284064 (not c!46247)) b!284063))

(assert (= (and b!284061 res!146675) b!284062))

(assert (= (or b!284062 b!284063) bm!25511))

(declare-fun m!299243 () Bool)

(assert (=> bm!25511 m!299243))

(declare-fun m!299245 () Bool)

(assert (=> b!284061 m!299245))

(declare-fun m!299247 () Bool)

(assert (=> b!284061 m!299247))

(declare-fun m!299249 () Bool)

(assert (=> b!284061 m!299249))

(assert (=> b!284061 m!299245))

(declare-fun m!299251 () Bool)

(assert (=> b!284061 m!299251))

(assert (=> b!284064 m!299245))

(assert (=> b!284064 m!299245))

(declare-fun m!299253 () Bool)

(assert (=> b!284064 m!299253))

(assert (=> bm!25483 d!65631))

(declare-fun b!284065 () Bool)

(declare-fun e!180234 () SeekEntryResult!1835)

(assert (=> b!284065 (= e!180234 (MissingVacant!1835 (index!9512 lt!140267)))))

(declare-fun b!284066 () Bool)

(declare-fun e!180233 () SeekEntryResult!1835)

(assert (=> b!284066 (= e!180233 (Found!1835 (index!9512 lt!140267)))))

(declare-fun b!284067 () Bool)

(declare-fun e!180235 () SeekEntryResult!1835)

(assert (=> b!284067 (= e!180235 Undefined!1835)))

(declare-fun lt!140424 () SeekEntryResult!1835)

(declare-fun d!65633 () Bool)

(assert (=> d!65633 (and (or ((_ is Undefined!1835) lt!140424) (not ((_ is Found!1835) lt!140424)) (and (bvsge (index!9511 lt!140424) #b00000000000000000000000000000000) (bvslt (index!9511 lt!140424) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140424) ((_ is Found!1835) lt!140424) (not ((_ is MissingVacant!1835) lt!140424)) (not (= (index!9513 lt!140424) (index!9512 lt!140267))) (and (bvsge (index!9513 lt!140424) #b00000000000000000000000000000000) (bvslt (index!9513 lt!140424) (size!7064 a!3325)))) (or ((_ is Undefined!1835) lt!140424) (ite ((_ is Found!1835) lt!140424) (= (select (arr!6712 a!3325) (index!9511 lt!140424)) k0!2581) (and ((_ is MissingVacant!1835) lt!140424) (= (index!9513 lt!140424) (index!9512 lt!140267)) (= (select (arr!6712 a!3325) (index!9513 lt!140424)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65633 (= lt!140424 e!180235)))

(declare-fun c!46248 () Bool)

(assert (=> d!65633 (= c!46248 (bvsge (x!27825 lt!140267) #b01111111111111111111111111111110))))

(declare-fun lt!140425 () (_ BitVec 64))

(assert (=> d!65633 (= lt!140425 (select (arr!6712 a!3325) (index!9512 lt!140267)))))

(assert (=> d!65633 (validMask!0 mask!3868)))

(assert (=> d!65633 (= (seekKeyOrZeroReturnVacant!0 (x!27825 lt!140267) (index!9512 lt!140267) (index!9512 lt!140267) k0!2581 a!3325 mask!3868) lt!140424)))

(declare-fun b!284068 () Bool)

(assert (=> b!284068 (= e!180234 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27825 lt!140267) #b00000000000000000000000000000001) (nextIndex!0 (index!9512 lt!140267) (bvadd (x!27825 lt!140267) #b00000000000000000000000000000001) mask!3868) (index!9512 lt!140267) k0!2581 a!3325 mask!3868))))

(declare-fun b!284069 () Bool)

(assert (=> b!284069 (= e!180235 e!180233)))

(declare-fun c!46250 () Bool)

(assert (=> b!284069 (= c!46250 (= lt!140425 k0!2581))))

(declare-fun b!284070 () Bool)

(declare-fun c!46249 () Bool)

(assert (=> b!284070 (= c!46249 (= lt!140425 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284070 (= e!180233 e!180234)))

(assert (= (and d!65633 c!46248) b!284067))

(assert (= (and d!65633 (not c!46248)) b!284069))

(assert (= (and b!284069 c!46250) b!284066))

(assert (= (and b!284069 (not c!46250)) b!284070))

(assert (= (and b!284070 c!46249) b!284065))

(assert (= (and b!284070 (not c!46249)) b!284068))

(declare-fun m!299255 () Bool)

(assert (=> d!65633 m!299255))

(declare-fun m!299257 () Bool)

(assert (=> d!65633 m!299257))

(assert (=> d!65633 m!298797))

(assert (=> d!65633 m!298617))

(declare-fun m!299259 () Bool)

(assert (=> b!284068 m!299259))

(assert (=> b!284068 m!299259))

(declare-fun m!299261 () Bool)

(assert (=> b!284068 m!299261))

(assert (=> b!283688 d!65633))

(check-sat (not b!284026) (not d!65591) (not d!65557) (not b!283943) (not b!283855) (not d!65571) (not b!283857) (not d!65581) (not b!283873) (not b!283937) (not b!284050) (not d!65563) (not b!283962) (not b!283861) (not b!283876) (not b!283860) (not bm!25511) (not b!283955) (not bm!25510) (not b!283867) (not b!284061) (not bm!25502) (not b!283862) (not d!65633) (not b!284054) (not b!284035) (not d!65627) (not d!65617) (not d!65553) (not b!284027) (not b!283946) (not bm!25503) (not d!65623) (not bm!25505) (not b!284021) (not d!65589) (not b!283866) (not d!65551) (not d!65621) (not b!284028) (not b!283952) (not d!65547) (not b!283868) (not d!65613) (not b!283977) (not b!284068) (not d!65579) (not b!284064) (not bm!25504) (not b!283919) (not b!283871) (not b!283865) (not d!65533))
(check-sat)
