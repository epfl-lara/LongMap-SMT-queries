; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26974 () Bool)

(assert start!26974)

(declare-fun b!279318 () Bool)

(declare-fun res!142570 () Bool)

(declare-fun e!178067 () Bool)

(assert (=> b!279318 (=> (not res!142570) (not e!178067))))

(declare-datatypes ((array!13894 0))(
  ( (array!13895 (arr!6592 (Array (_ BitVec 32) (_ BitVec 64))) (size!6944 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13894)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279318 (= res!142570 (validKeyInArray!0 (select (arr!6592 a!3325) startIndex!26)))))

(declare-fun b!279319 () Bool)

(declare-fun res!142571 () Bool)

(assert (=> b!279319 (=> (not res!142571) (not e!178067))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13894 (_ BitVec 32)) Bool)

(assert (=> b!279319 (= res!142571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279320 () Bool)

(declare-fun res!142573 () Bool)

(declare-fun e!178065 () Bool)

(assert (=> b!279320 (=> (not res!142573) (not e!178065))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279320 (= res!142573 (and (= (size!6944 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6944 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6944 a!3325))))))

(declare-fun b!279322 () Bool)

(declare-fun res!142568 () Bool)

(assert (=> b!279322 (=> (not res!142568) (not e!178065))))

(declare-datatypes ((List!4400 0))(
  ( (Nil!4397) (Cons!4396 (h!5066 (_ BitVec 64)) (t!9482 List!4400)) )
))
(declare-fun arrayNoDuplicates!0 (array!13894 (_ BitVec 32) List!4400) Bool)

(assert (=> b!279322 (= res!142568 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4397))))

(declare-fun b!279323 () Bool)

(declare-fun res!142577 () Bool)

(assert (=> b!279323 (=> (not res!142577) (not e!178065))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279323 (= res!142577 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279324 () Bool)

(declare-fun res!142578 () Bool)

(assert (=> b!279324 (=> (not res!142578) (not e!178067))))

(assert (=> b!279324 (= res!142578 (not (= startIndex!26 i!1267)))))

(declare-fun b!279325 () Bool)

(declare-fun res!142576 () Bool)

(assert (=> b!279325 (=> (not res!142576) (not e!178067))))

(assert (=> b!279325 (= res!142576 (and (bvslt (size!6944 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6944 a!3325))))))

(declare-fun b!279326 () Bool)

(declare-fun res!142567 () Bool)

(assert (=> b!279326 (=> (not res!142567) (not e!178065))))

(assert (=> b!279326 (= res!142567 (validKeyInArray!0 k!2581))))

(declare-fun b!279327 () Bool)

(declare-fun e!178064 () Bool)

(assert (=> b!279327 (= e!178067 e!178064)))

(declare-fun res!142575 () Bool)

(assert (=> b!279327 (=> res!142575 e!178064)))

(declare-fun contains!1972 (List!4400 (_ BitVec 64)) Bool)

(assert (=> b!279327 (= res!142575 (contains!1972 Nil!4397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279328 () Bool)

(assert (=> b!279328 (= e!178064 (contains!1972 Nil!4397 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279329 () Bool)

(assert (=> b!279329 (= e!178065 e!178067)))

(declare-fun res!142572 () Bool)

(assert (=> b!279329 (=> (not res!142572) (not e!178067))))

(declare-datatypes ((SeekEntryResult!1750 0))(
  ( (MissingZero!1750 (index!9170 (_ BitVec 32))) (Found!1750 (index!9171 (_ BitVec 32))) (Intermediate!1750 (undefined!2562 Bool) (index!9172 (_ BitVec 32)) (x!27412 (_ BitVec 32))) (Undefined!1750) (MissingVacant!1750 (index!9173 (_ BitVec 32))) )
))
(declare-fun lt!138589 () SeekEntryResult!1750)

(assert (=> b!279329 (= res!142572 (or (= lt!138589 (MissingZero!1750 i!1267)) (= lt!138589 (MissingVacant!1750 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13894 (_ BitVec 32)) SeekEntryResult!1750)

(assert (=> b!279329 (= lt!138589 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279321 () Bool)

(declare-fun res!142574 () Bool)

(assert (=> b!279321 (=> (not res!142574) (not e!178067))))

(declare-fun noDuplicate!154 (List!4400) Bool)

(assert (=> b!279321 (= res!142574 (noDuplicate!154 Nil!4397))))

(declare-fun res!142569 () Bool)

(assert (=> start!26974 (=> (not res!142569) (not e!178065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26974 (= res!142569 (validMask!0 mask!3868))))

(assert (=> start!26974 e!178065))

(declare-fun array_inv!4555 (array!13894) Bool)

(assert (=> start!26974 (array_inv!4555 a!3325)))

(assert (=> start!26974 true))

(assert (= (and start!26974 res!142569) b!279320))

(assert (= (and b!279320 res!142573) b!279326))

(assert (= (and b!279326 res!142567) b!279322))

(assert (= (and b!279322 res!142568) b!279323))

(assert (= (and b!279323 res!142577) b!279329))

(assert (= (and b!279329 res!142572) b!279319))

(assert (= (and b!279319 res!142571) b!279324))

(assert (= (and b!279324 res!142578) b!279318))

(assert (= (and b!279318 res!142570) b!279325))

(assert (= (and b!279325 res!142576) b!279321))

(assert (= (and b!279321 res!142574) b!279327))

(assert (= (and b!279327 (not res!142575)) b!279328))

(declare-fun m!294099 () Bool)

(assert (=> b!279327 m!294099))

(declare-fun m!294101 () Bool)

(assert (=> b!279319 m!294101))

(declare-fun m!294103 () Bool)

(assert (=> start!26974 m!294103))

(declare-fun m!294105 () Bool)

(assert (=> start!26974 m!294105))

(declare-fun m!294107 () Bool)

(assert (=> b!279326 m!294107))

(declare-fun m!294109 () Bool)

(assert (=> b!279321 m!294109))

(declare-fun m!294111 () Bool)

(assert (=> b!279328 m!294111))

(declare-fun m!294113 () Bool)

(assert (=> b!279323 m!294113))

(declare-fun m!294115 () Bool)

(assert (=> b!279322 m!294115))

(declare-fun m!294117 () Bool)

(assert (=> b!279329 m!294117))

(declare-fun m!294119 () Bool)

(assert (=> b!279318 m!294119))

(assert (=> b!279318 m!294119))

(declare-fun m!294121 () Bool)

(assert (=> b!279318 m!294121))

(push 1)

(assert (not b!279318))

(assert (not b!279322))

(assert (not b!279327))

(assert (not b!279329))

(assert (not b!279323))

(assert (not b!279328))

(assert (not b!279326))

(assert (not b!279321))

(assert (not b!279319))

(assert (not start!26974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65043 () Bool)

(declare-fun res!142596 () Bool)

(declare-fun e!178100 () Bool)

(assert (=> d!65043 (=> res!142596 e!178100)))

(assert (=> d!65043 (= res!142596 (bvsge #b00000000000000000000000000000000 (size!6944 a!3325)))))

(assert (=> d!65043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178100)))

(declare-fun b!279375 () Bool)

(declare-fun e!178101 () Bool)

(declare-fun call!25429 () Bool)

(assert (=> b!279375 (= e!178101 call!25429)))

(declare-fun b!279376 () Bool)

(declare-fun e!178099 () Bool)

(assert (=> b!279376 (= e!178101 e!178099)))

(declare-fun lt!138607 () (_ BitVec 64))

(assert (=> b!279376 (= lt!138607 (select (arr!6592 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8814 0))(
  ( (Unit!8815) )
))
(declare-fun lt!138608 () Unit!8814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13894 (_ BitVec 64) (_ BitVec 32)) Unit!8814)

(assert (=> b!279376 (= lt!138608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138607 #b00000000000000000000000000000000))))

(assert (=> b!279376 (arrayContainsKey!0 a!3325 lt!138607 #b00000000000000000000000000000000)))

(declare-fun lt!138609 () Unit!8814)

(assert (=> b!279376 (= lt!138609 lt!138608)))

(declare-fun res!142597 () Bool)

(assert (=> b!279376 (= res!142597 (= (seekEntryOrOpen!0 (select (arr!6592 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1750 #b00000000000000000000000000000000)))))

(assert (=> b!279376 (=> (not res!142597) (not e!178099))))

(declare-fun bm!25426 () Bool)

(assert (=> bm!25426 (= call!25429 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279377 () Bool)

(assert (=> b!279377 (= e!178100 e!178101)))

(declare-fun c!45942 () Bool)

(assert (=> b!279377 (= c!45942 (validKeyInArray!0 (select (arr!6592 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279378 () Bool)

(assert (=> b!279378 (= e!178099 call!25429)))

(assert (= (and d!65043 (not res!142596)) b!279377))

(assert (= (and b!279377 c!45942) b!279376))

(assert (= (and b!279377 (not c!45942)) b!279375))

(assert (= (and b!279376 res!142597) b!279378))

(assert (= (or b!279378 b!279375) bm!25426))

(declare-fun m!294143 () Bool)

(assert (=> b!279376 m!294143))

(declare-fun m!294145 () Bool)

(assert (=> b!279376 m!294145))

(declare-fun m!294149 () Bool)

(assert (=> b!279376 m!294149))

(assert (=> b!279376 m!294143))

(declare-fun m!294151 () Bool)

(assert (=> b!279376 m!294151))

(declare-fun m!294153 () Bool)

(assert (=> bm!25426 m!294153))

(assert (=> b!279377 m!294143))

(assert (=> b!279377 m!294143))

(declare-fun m!294155 () Bool)

(assert (=> b!279377 m!294155))

(assert (=> b!279319 d!65043))

(declare-fun b!279437 () Bool)

(declare-fun e!178150 () SeekEntryResult!1750)

(declare-fun e!178148 () SeekEntryResult!1750)

(assert (=> b!279437 (= e!178150 e!178148)))

(declare-fun lt!138641 () (_ BitVec 64))

(declare-fun lt!138639 () SeekEntryResult!1750)

(assert (=> b!279437 (= lt!138641 (select (arr!6592 a!3325) (index!9172 lt!138639)))))

(declare-fun c!45955 () Bool)

(assert (=> b!279437 (= c!45955 (= lt!138641 k!2581))))

(declare-fun b!279438 () Bool)

(declare-fun e!178149 () SeekEntryResult!1750)

(assert (=> b!279438 (= e!178149 (MissingZero!1750 (index!9172 lt!138639)))))

(declare-fun b!279439 () Bool)

(declare-fun c!45956 () Bool)

(assert (=> b!279439 (= c!45956 (= lt!138641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279439 (= e!178148 e!178149)))

(declare-fun d!65049 () Bool)

(declare-fun lt!138640 () SeekEntryResult!1750)

(assert (=> d!65049 (and (or (is-Undefined!1750 lt!138640) (not (is-Found!1750 lt!138640)) (and (bvsge (index!9171 lt!138640) #b00000000000000000000000000000000) (bvslt (index!9171 lt!138640) (size!6944 a!3325)))) (or (is-Undefined!1750 lt!138640) (is-Found!1750 lt!138640) (not (is-MissingZero!1750 lt!138640)) (and (bvsge (index!9170 lt!138640) #b00000000000000000000000000000000) (bvslt (index!9170 lt!138640) (size!6944 a!3325)))) (or (is-Undefined!1750 lt!138640) (is-Found!1750 lt!138640) (is-MissingZero!1750 lt!138640) (not (is-MissingVacant!1750 lt!138640)) (and (bvsge (index!9173 lt!138640) #b00000000000000000000000000000000) (bvslt (index!9173 lt!138640) (size!6944 a!3325)))) (or (is-Undefined!1750 lt!138640) (ite (is-Found!1750 lt!138640) (= (select (arr!6592 a!3325) (index!9171 lt!138640)) k!2581) (ite (is-MissingZero!1750 lt!138640) (= (select (arr!6592 a!3325) (index!9170 lt!138640)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1750 lt!138640) (= (select (arr!6592 a!3325) (index!9173 lt!138640)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65049 (= lt!138640 e!178150)))

(declare-fun c!45957 () Bool)

(assert (=> d!65049 (= c!45957 (and (is-Intermediate!1750 lt!138639) (undefined!2562 lt!138639)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13894 (_ BitVec 32)) SeekEntryResult!1750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65049 (= lt!138639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65049 (validMask!0 mask!3868)))

(assert (=> d!65049 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138640)))

(declare-fun b!279440 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13894 (_ BitVec 32)) SeekEntryResult!1750)

(assert (=> b!279440 (= e!178149 (seekKeyOrZeroReturnVacant!0 (x!27412 lt!138639) (index!9172 lt!138639) (index!9172 lt!138639) k!2581 a!3325 mask!3868))))

(declare-fun b!279441 () Bool)

(assert (=> b!279441 (= e!178148 (Found!1750 (index!9172 lt!138639)))))

(declare-fun b!279442 () Bool)

(assert (=> b!279442 (= e!178150 Undefined!1750)))

(assert (= (and d!65049 c!45957) b!279442))

(assert (= (and d!65049 (not c!45957)) b!279437))

(assert (= (and b!279437 c!45955) b!279441))

(assert (= (and b!279437 (not c!45955)) b!279439))

(assert (= (and b!279439 c!45956) b!279438))

(assert (= (and b!279439 (not c!45956)) b!279440))

(declare-fun m!294199 () Bool)

(assert (=> b!279437 m!294199))

(declare-fun m!294201 () Bool)

(assert (=> d!65049 m!294201))

(declare-fun m!294203 () Bool)

(assert (=> d!65049 m!294203))

(assert (=> d!65049 m!294103))

(declare-fun m!294205 () Bool)

(assert (=> d!65049 m!294205))

(declare-fun m!294207 () Bool)

(assert (=> d!65049 m!294207))

(assert (=> d!65049 m!294205))

(declare-fun m!294209 () Bool)

(assert (=> d!65049 m!294209))

(declare-fun m!294211 () Bool)

(assert (=> b!279440 m!294211))

(assert (=> b!279329 d!65049))

(declare-fun d!65069 () Bool)

(assert (=> d!65069 (= (validKeyInArray!0 (select (arr!6592 a!3325) startIndex!26)) (and (not (= (select (arr!6592 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6592 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279318 d!65069))

(declare-fun d!65071 () Bool)

(declare-fun res!142636 () Bool)

(declare-fun e!178155 () Bool)

(assert (=> d!65071 (=> res!142636 e!178155)))

(assert (=> d!65071 (= res!142636 (= (select (arr!6592 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65071 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!178155)))

(declare-fun b!279447 () Bool)

(declare-fun e!178156 () Bool)

(assert (=> b!279447 (= e!178155 e!178156)))

(declare-fun res!142637 () Bool)

(assert (=> b!279447 (=> (not res!142637) (not e!178156))))

(assert (=> b!279447 (= res!142637 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6944 a!3325)))))

(declare-fun b!279448 () Bool)

(assert (=> b!279448 (= e!178156 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65071 (not res!142636)) b!279447))

(assert (= (and b!279447 res!142637) b!279448))

(assert (=> d!65071 m!294143))

(declare-fun m!294213 () Bool)

(assert (=> b!279448 m!294213))

(assert (=> b!279323 d!65071))

(declare-fun d!65077 () Bool)

(declare-fun lt!138644 () Bool)

(declare-fun content!188 (List!4400) (Set (_ BitVec 64)))

(assert (=> d!65077 (= lt!138644 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!188 Nil!4397)))))

(declare-fun e!178169 () Bool)

(assert (=> d!65077 (= lt!138644 e!178169)))

(declare-fun res!142649 () Bool)

(assert (=> d!65077 (=> (not res!142649) (not e!178169))))

(assert (=> d!65077 (= res!142649 (is-Cons!4396 Nil!4397))))

(assert (=> d!65077 (= (contains!1972 Nil!4397 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138644)))

(declare-fun b!279463 () Bool)

(declare-fun e!178170 () Bool)

(assert (=> b!279463 (= e!178169 e!178170)))

(declare-fun res!142648 () Bool)

(assert (=> b!279463 (=> res!142648 e!178170)))

(assert (=> b!279463 (= res!142648 (= (h!5066 Nil!4397) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279464 () Bool)

(assert (=> b!279464 (= e!178170 (contains!1972 (t!9482 Nil!4397) #b1000000000000000000000000000000000000000000000000000000000000000))))

