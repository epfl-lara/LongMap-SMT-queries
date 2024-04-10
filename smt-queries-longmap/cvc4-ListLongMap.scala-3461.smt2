; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48040 () Bool)

(assert start!48040)

(declare-fun b!529319 () Bool)

(declare-fun res!325212 () Bool)

(declare-fun e!308427 () Bool)

(assert (=> b!529319 (=> (not res!325212) (not e!308427))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529319 (= res!325212 (validKeyInArray!0 k!2280))))

(declare-fun b!529320 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!308424 () Bool)

(declare-datatypes ((array!33533 0))(
  ( (array!33534 (arr!16115 (Array (_ BitVec 32) (_ BitVec 64))) (size!16479 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33533)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4582 0))(
  ( (MissingZero!4582 (index!20552 (_ BitVec 32))) (Found!4582 (index!20553 (_ BitVec 32))) (Intermediate!4582 (undefined!5394 Bool) (index!20554 (_ BitVec 32)) (x!49518 (_ BitVec 32))) (Undefined!4582) (MissingVacant!4582 (index!20555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33533 (_ BitVec 32)) SeekEntryResult!4582)

(assert (=> b!529320 (= e!308424 (= (seekEntryOrOpen!0 (select (arr!16115 a!3235) j!176) a!3235 mask!3524) (Found!4582 j!176)))))

(declare-fun b!529321 () Bool)

(declare-fun e!308426 () Bool)

(declare-fun lt!244031 () Bool)

(declare-fun lt!244029 () SeekEntryResult!4582)

(assert (=> b!529321 (= e!308426 (or (and (not lt!244031) (undefined!5394 lt!244029)) (and (not lt!244031) (not (undefined!5394 lt!244029)))))))

(assert (=> b!529321 (= lt!244031 (not (is-Intermediate!4582 lt!244029)))))

(declare-fun b!529322 () Bool)

(declare-fun res!325209 () Bool)

(assert (=> b!529322 (=> (not res!325209) (not e!308427))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529322 (= res!325209 (and (= (size!16479 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16479 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16479 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!325211 () Bool)

(assert (=> start!48040 (=> (not res!325211) (not e!308427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48040 (= res!325211 (validMask!0 mask!3524))))

(assert (=> start!48040 e!308427))

(assert (=> start!48040 true))

(declare-fun array_inv!11911 (array!33533) Bool)

(assert (=> start!48040 (array_inv!11911 a!3235)))

(declare-fun b!529323 () Bool)

(declare-fun res!325208 () Bool)

(declare-fun e!308423 () Bool)

(assert (=> b!529323 (=> (not res!325208) (not e!308423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33533 (_ BitVec 32)) Bool)

(assert (=> b!529323 (= res!325208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529324 () Bool)

(assert (=> b!529324 (= e!308427 e!308423)))

(declare-fun res!325217 () Bool)

(assert (=> b!529324 (=> (not res!325217) (not e!308423))))

(declare-fun lt!244030 () SeekEntryResult!4582)

(assert (=> b!529324 (= res!325217 (or (= lt!244030 (MissingZero!4582 i!1204)) (= lt!244030 (MissingVacant!4582 i!1204))))))

(assert (=> b!529324 (= lt!244030 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529325 () Bool)

(declare-fun res!325215 () Bool)

(assert (=> b!529325 (=> (not res!325215) (not e!308427))))

(assert (=> b!529325 (= res!325215 (validKeyInArray!0 (select (arr!16115 a!3235) j!176)))))

(declare-fun b!529326 () Bool)

(declare-fun res!325213 () Bool)

(assert (=> b!529326 (=> (not res!325213) (not e!308423))))

(declare-datatypes ((List!10273 0))(
  ( (Nil!10270) (Cons!10269 (h!11206 (_ BitVec 64)) (t!16501 List!10273)) )
))
(declare-fun arrayNoDuplicates!0 (array!33533 (_ BitVec 32) List!10273) Bool)

(assert (=> b!529326 (= res!325213 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10270))))

(declare-fun b!529327 () Bool)

(assert (=> b!529327 (= e!308423 (not e!308426))))

(declare-fun res!325216 () Bool)

(assert (=> b!529327 (=> res!325216 e!308426)))

(declare-fun lt!244033 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33533 (_ BitVec 32)) SeekEntryResult!4582)

(assert (=> b!529327 (= res!325216 (= lt!244029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244033 (select (store (arr!16115 a!3235) i!1204 k!2280) j!176) (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235)) mask!3524)))))

(declare-fun lt!244032 () (_ BitVec 32))

(assert (=> b!529327 (= lt!244029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244032 (select (arr!16115 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529327 (= lt!244033 (toIndex!0 (select (store (arr!16115 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!529327 (= lt!244032 (toIndex!0 (select (arr!16115 a!3235) j!176) mask!3524))))

(assert (=> b!529327 e!308424))

(declare-fun res!325214 () Bool)

(assert (=> b!529327 (=> (not res!325214) (not e!308424))))

(assert (=> b!529327 (= res!325214 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16776 0))(
  ( (Unit!16777) )
))
(declare-fun lt!244028 () Unit!16776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16776)

(assert (=> b!529327 (= lt!244028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529328 () Bool)

(declare-fun res!325210 () Bool)

(assert (=> b!529328 (=> (not res!325210) (not e!308427))))

(declare-fun arrayContainsKey!0 (array!33533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529328 (= res!325210 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48040 res!325211) b!529322))

(assert (= (and b!529322 res!325209) b!529325))

(assert (= (and b!529325 res!325215) b!529319))

(assert (= (and b!529319 res!325212) b!529328))

(assert (= (and b!529328 res!325210) b!529324))

(assert (= (and b!529324 res!325217) b!529323))

(assert (= (and b!529323 res!325208) b!529326))

(assert (= (and b!529326 res!325213) b!529327))

(assert (= (and b!529327 res!325214) b!529320))

(assert (= (and b!529327 (not res!325216)) b!529321))

(declare-fun m!509877 () Bool)

(assert (=> b!529326 m!509877))

(declare-fun m!509879 () Bool)

(assert (=> b!529323 m!509879))

(declare-fun m!509881 () Bool)

(assert (=> b!529328 m!509881))

(declare-fun m!509883 () Bool)

(assert (=> b!529325 m!509883))

(assert (=> b!529325 m!509883))

(declare-fun m!509885 () Bool)

(assert (=> b!529325 m!509885))

(declare-fun m!509887 () Bool)

(assert (=> start!48040 m!509887))

(declare-fun m!509889 () Bool)

(assert (=> start!48040 m!509889))

(declare-fun m!509891 () Bool)

(assert (=> b!529324 m!509891))

(declare-fun m!509893 () Bool)

(assert (=> b!529319 m!509893))

(assert (=> b!529320 m!509883))

(assert (=> b!529320 m!509883))

(declare-fun m!509895 () Bool)

(assert (=> b!529320 m!509895))

(assert (=> b!529327 m!509883))

(declare-fun m!509897 () Bool)

(assert (=> b!529327 m!509897))

(declare-fun m!509899 () Bool)

(assert (=> b!529327 m!509899))

(declare-fun m!509901 () Bool)

(assert (=> b!529327 m!509901))

(declare-fun m!509903 () Bool)

(assert (=> b!529327 m!509903))

(assert (=> b!529327 m!509883))

(declare-fun m!509905 () Bool)

(assert (=> b!529327 m!509905))

(assert (=> b!529327 m!509883))

(declare-fun m!509907 () Bool)

(assert (=> b!529327 m!509907))

(assert (=> b!529327 m!509903))

(declare-fun m!509909 () Bool)

(assert (=> b!529327 m!509909))

(assert (=> b!529327 m!509903))

(declare-fun m!509911 () Bool)

(assert (=> b!529327 m!509911))

(push 1)

(assert (not b!529325))

(assert (not b!529320))

(assert (not b!529323))

(assert (not start!48040))

(assert (not b!529327))

(assert (not b!529319))

(assert (not b!529324))

(assert (not b!529326))

(assert (not b!529328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!529369 () Bool)

(declare-fun e!308455 () Bool)

(declare-fun call!31918 () Bool)

(assert (=> b!529369 (= e!308455 call!31918)))

(declare-fun bm!31915 () Bool)

(assert (=> bm!31915 (= call!31918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!529371 () Bool)

(declare-fun e!308457 () Bool)

(assert (=> b!529371 (= e!308457 call!31918)))

(declare-fun b!529372 () Bool)

(declare-fun e!308456 () Bool)

(assert (=> b!529372 (= e!308456 e!308457)))

(declare-fun c!62377 () Bool)

(assert (=> b!529372 (= c!62377 (validKeyInArray!0 (select (arr!16115 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529370 () Bool)

(assert (=> b!529370 (= e!308457 e!308455)))

(declare-fun lt!244055 () (_ BitVec 64))

(assert (=> b!529370 (= lt!244055 (select (arr!16115 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!244056 () Unit!16776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33533 (_ BitVec 64) (_ BitVec 32)) Unit!16776)

(assert (=> b!529370 (= lt!244056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244055 #b00000000000000000000000000000000))))

(assert (=> b!529370 (arrayContainsKey!0 a!3235 lt!244055 #b00000000000000000000000000000000)))

(declare-fun lt!244057 () Unit!16776)

(assert (=> b!529370 (= lt!244057 lt!244056)))

(declare-fun res!325232 () Bool)

(assert (=> b!529370 (= res!325232 (= (seekEntryOrOpen!0 (select (arr!16115 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4582 #b00000000000000000000000000000000)))))

(assert (=> b!529370 (=> (not res!325232) (not e!308455))))

(declare-fun d!81023 () Bool)

(declare-fun res!325233 () Bool)

(assert (=> d!81023 (=> res!325233 e!308456)))

(assert (=> d!81023 (= res!325233 (bvsge #b00000000000000000000000000000000 (size!16479 a!3235)))))

(assert (=> d!81023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!308456)))

(assert (= (and d!81023 (not res!325233)) b!529372))

(assert (= (and b!529372 c!62377) b!529370))

(assert (= (and b!529372 (not c!62377)) b!529371))

(assert (= (and b!529370 res!325232) b!529369))

(assert (= (or b!529369 b!529371) bm!31915))

(declare-fun m!509931 () Bool)

(assert (=> bm!31915 m!509931))

(declare-fun m!509933 () Bool)

(assert (=> b!529372 m!509933))

(assert (=> b!529372 m!509933))

(declare-fun m!509935 () Bool)

(assert (=> b!529372 m!509935))

(assert (=> b!529370 m!509933))

(declare-fun m!509941 () Bool)

(assert (=> b!529370 m!509941))

(declare-fun m!509943 () Bool)

(assert (=> b!529370 m!509943))

(assert (=> b!529370 m!509933))

(declare-fun m!509947 () Bool)

(assert (=> b!529370 m!509947))

(assert (=> b!529323 d!81023))

(declare-fun d!81031 () Bool)

(declare-fun res!325241 () Bool)

(declare-fun e!308465 () Bool)

(assert (=> d!81031 (=> res!325241 e!308465)))

(assert (=> d!81031 (= res!325241 (= (select (arr!16115 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!81031 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!308465)))

(declare-fun b!529381 () Bool)

(declare-fun e!308466 () Bool)

(assert (=> b!529381 (= e!308465 e!308466)))

(declare-fun res!325242 () Bool)

(assert (=> b!529381 (=> (not res!325242) (not e!308466))))

(assert (=> b!529381 (= res!325242 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16479 a!3235)))))

(declare-fun b!529382 () Bool)

(assert (=> b!529382 (= e!308466 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81031 (not res!325241)) b!529381))

(assert (= (and b!529381 res!325242) b!529382))

(assert (=> d!81031 m!509933))

(declare-fun m!509953 () Bool)

(assert (=> b!529382 m!509953))

(assert (=> b!529328 d!81031))

(declare-fun d!81035 () Bool)

(assert (=> d!81035 (= (validKeyInArray!0 (select (arr!16115 a!3235) j!176)) (and (not (= (select (arr!16115 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16115 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529325 d!81035))

(declare-fun d!81037 () Bool)

(assert (=> d!81037 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529319 d!81037))

(declare-fun d!81039 () Bool)

(declare-fun lt!244086 () SeekEntryResult!4582)

(assert (=> d!81039 (and (or (is-Undefined!4582 lt!244086) (not (is-Found!4582 lt!244086)) (and (bvsge (index!20553 lt!244086) #b00000000000000000000000000000000) (bvslt (index!20553 lt!244086) (size!16479 a!3235)))) (or (is-Undefined!4582 lt!244086) (is-Found!4582 lt!244086) (not (is-MissingZero!4582 lt!244086)) (and (bvsge (index!20552 lt!244086) #b00000000000000000000000000000000) (bvslt (index!20552 lt!244086) (size!16479 a!3235)))) (or (is-Undefined!4582 lt!244086) (is-Found!4582 lt!244086) (is-MissingZero!4582 lt!244086) (not (is-MissingVacant!4582 lt!244086)) (and (bvsge (index!20555 lt!244086) #b00000000000000000000000000000000) (bvslt (index!20555 lt!244086) (size!16479 a!3235)))) (or (is-Undefined!4582 lt!244086) (ite (is-Found!4582 lt!244086) (= (select (arr!16115 a!3235) (index!20553 lt!244086)) k!2280) (ite (is-MissingZero!4582 lt!244086) (= (select (arr!16115 a!3235) (index!20552 lt!244086)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4582 lt!244086) (= (select (arr!16115 a!3235) (index!20555 lt!244086)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!308488 () SeekEntryResult!4582)

(assert (=> d!81039 (= lt!244086 e!308488)))

(declare-fun c!62393 () Bool)

(declare-fun lt!244088 () SeekEntryResult!4582)

(assert (=> d!81039 (= c!62393 (and (is-Intermediate!4582 lt!244088) (undefined!5394 lt!244088)))))

(assert (=> d!81039 (= lt!244088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!81039 (validMask!0 mask!3524)))

(assert (=> d!81039 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!244086)))

(declare-fun b!529417 () Bool)

(declare-fun c!62394 () Bool)

(declare-fun lt!244087 () (_ BitVec 64))

(assert (=> b!529417 (= c!62394 (= lt!244087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!308487 () SeekEntryResult!4582)

(declare-fun e!308486 () SeekEntryResult!4582)

(assert (=> b!529417 (= e!308487 e!308486)))

(declare-fun b!529418 () Bool)

(assert (=> b!529418 (= e!308488 Undefined!4582)))

(declare-fun b!529419 () Bool)

(assert (=> b!529419 (= e!308487 (Found!4582 (index!20554 lt!244088)))))

(declare-fun b!529420 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33533 (_ BitVec 32)) SeekEntryResult!4582)

(assert (=> b!529420 (= e!308486 (seekKeyOrZeroReturnVacant!0 (x!49518 lt!244088) (index!20554 lt!244088) (index!20554 lt!244088) k!2280 a!3235 mask!3524))))

(declare-fun b!529421 () Bool)

(assert (=> b!529421 (= e!308486 (MissingZero!4582 (index!20554 lt!244088)))))

(declare-fun b!529422 () Bool)

(assert (=> b!529422 (= e!308488 e!308487)))

(assert (=> b!529422 (= lt!244087 (select (arr!16115 a!3235) (index!20554 lt!244088)))))

(declare-fun c!62392 () Bool)

(assert (=> b!529422 (= c!62392 (= lt!244087 k!2280))))

(assert (= (and d!81039 c!62393) b!529418))

(assert (= (and d!81039 (not c!62393)) b!529422))

(assert (= (and b!529422 c!62392) b!529419))

(assert (= (and b!529422 (not c!62392)) b!529417))

(assert (= (and b!529417 c!62394) b!529421))

(assert (= (and b!529417 (not c!62394)) b!529420))

(declare-fun m!509961 () Bool)

(assert (=> d!81039 m!509961))

(declare-fun m!509963 () Bool)

(assert (=> d!81039 m!509963))

(assert (=> d!81039 m!509887))

(declare-fun m!509965 () Bool)

(assert (=> d!81039 m!509965))

(declare-fun m!509967 () Bool)

(assert (=> d!81039 m!509967))

(assert (=> d!81039 m!509961))

(declare-fun m!509969 () Bool)

(assert (=> d!81039 m!509969))

(declare-fun m!509971 () Bool)

(assert (=> b!529420 m!509971))

(declare-fun m!509973 () Bool)

(assert (=> b!529422 m!509973))

(assert (=> b!529324 d!81039))

(declare-fun d!81051 () Bool)

(declare-fun res!325265 () Bool)

(declare-fun e!308514 () Bool)

(assert (=> d!81051 (=> res!325265 e!308514)))

(assert (=> d!81051 (= res!325265 (bvsge #b00000000000000000000000000000000 (size!16479 a!3235)))))

(assert (=> d!81051 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10270) e!308514)))

(declare-fun b!529459 () Bool)

(declare-fun e!308512 () Bool)

(declare-fun call!31923 () Bool)

(assert (=> b!529459 (= e!308512 call!31923)))

(declare-fun b!529460 () Bool)

(declare-fun e!308513 () Bool)

(assert (=> b!529460 (= e!308514 e!308513)))

(declare-fun res!325266 () Bool)

(assert (=> b!529460 (=> (not res!325266) (not e!308513))))

(declare-fun e!308511 () Bool)

(assert (=> b!529460 (= res!325266 (not e!308511))))

(declare-fun res!325264 () Bool)

(assert (=> b!529460 (=> (not res!325264) (not e!308511))))

(assert (=> b!529460 (= res!325264 (validKeyInArray!0 (select (arr!16115 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31920 () Bool)

(declare-fun c!62407 () Bool)

(assert (=> bm!31920 (= call!31923 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62407 (Cons!10269 (select (arr!16115 a!3235) #b00000000000000000000000000000000) Nil!10270) Nil!10270)))))

(declare-fun b!529461 () Bool)

(declare-fun contains!2779 (List!10273 (_ BitVec 64)) Bool)

(assert (=> b!529461 (= e!308511 (contains!2779 Nil!10270 (select (arr!16115 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529462 () Bool)

(assert (=> b!529462 (= e!308513 e!308512)))

(assert (=> b!529462 (= c!62407 (validKeyInArray!0 (select (arr!16115 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529463 () Bool)

(assert (=> b!529463 (= e!308512 call!31923)))

(assert (= (and d!81051 (not res!325265)) b!529460))

(assert (= (and b!529460 res!325264) b!529461))

(assert (= (and b!529460 res!325266) b!529462))

(assert (= (and b!529462 c!62407) b!529463))

(assert (= (and b!529462 (not c!62407)) b!529459))

(assert (= (or b!529463 b!529459) bm!31920))

(assert (=> b!529460 m!509933))

(assert (=> b!529460 m!509933))

(assert (=> b!529460 m!509935))

(assert (=> bm!31920 m!509933))

(declare-fun m!509991 () Bool)

(assert (=> bm!31920 m!509991))

(assert (=> b!529461 m!509933))

(assert (=> b!529461 m!509933))

(declare-fun m!509993 () Bool)

(assert (=> b!529461 m!509993))

(assert (=> b!529462 m!509933))

(assert (=> b!529462 m!509933))

(assert (=> b!529462 m!509935))

(assert (=> b!529326 d!81051))

(declare-fun d!81057 () Bool)

(assert (=> d!81057 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!48040 d!81057))

(declare-fun d!81069 () Bool)

(assert (=> d!81069 (= (array_inv!11911 a!3235) (bvsge (size!16479 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!48040 d!81069))

(declare-fun d!81073 () Bool)

(declare-fun lt!244114 () SeekEntryResult!4582)

(assert (=> d!81073 (and (or (is-Undefined!4582 lt!244114) (not (is-Found!4582 lt!244114)) (and (bvsge (index!20553 lt!244114) #b00000000000000000000000000000000) (bvslt (index!20553 lt!244114) (size!16479 a!3235)))) (or (is-Undefined!4582 lt!244114) (is-Found!4582 lt!244114) (not (is-MissingZero!4582 lt!244114)) (and (bvsge (index!20552 lt!244114) #b00000000000000000000000000000000) (bvslt (index!20552 lt!244114) (size!16479 a!3235)))) (or (is-Undefined!4582 lt!244114) (is-Found!4582 lt!244114) (is-MissingZero!4582 lt!244114) (not (is-MissingVacant!4582 lt!244114)) (and (bvsge (index!20555 lt!244114) #b00000000000000000000000000000000) (bvslt (index!20555 lt!244114) (size!16479 a!3235)))) (or (is-Undefined!4582 lt!244114) (ite (is-Found!4582 lt!244114) (= (select (arr!16115 a!3235) (index!20553 lt!244114)) (select (arr!16115 a!3235) j!176)) (ite (is-MissingZero!4582 lt!244114) (= (select (arr!16115 a!3235) (index!20552 lt!244114)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4582 lt!244114) (= (select (arr!16115 a!3235) (index!20555 lt!244114)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!308536 () SeekEntryResult!4582)

(assert (=> d!81073 (= lt!244114 e!308536)))

(declare-fun c!62420 () Bool)

(declare-fun lt!244116 () SeekEntryResult!4582)

(assert (=> d!81073 (= c!62420 (and (is-Intermediate!4582 lt!244116) (undefined!5394 lt!244116)))))

(assert (=> d!81073 (= lt!244116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16115 a!3235) j!176) mask!3524) (select (arr!16115 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!81073 (validMask!0 mask!3524)))

(assert (=> d!81073 (= (seekEntryOrOpen!0 (select (arr!16115 a!3235) j!176) a!3235 mask!3524) lt!244114)))

(declare-fun b!529498 () Bool)

(declare-fun c!62421 () Bool)

(declare-fun lt!244115 () (_ BitVec 64))

(assert (=> b!529498 (= c!62421 (= lt!244115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!308535 () SeekEntryResult!4582)

(declare-fun e!308534 () SeekEntryResult!4582)

(assert (=> b!529498 (= e!308535 e!308534)))

(declare-fun b!529499 () Bool)

(assert (=> b!529499 (= e!308536 Undefined!4582)))

(declare-fun b!529500 () Bool)

(assert (=> b!529500 (= e!308535 (Found!4582 (index!20554 lt!244116)))))

(declare-fun b!529501 () Bool)

(assert (=> b!529501 (= e!308534 (seekKeyOrZeroReturnVacant!0 (x!49518 lt!244116) (index!20554 lt!244116) (index!20554 lt!244116) (select (arr!16115 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529502 () Bool)

(assert (=> b!529502 (= e!308534 (MissingZero!4582 (index!20554 lt!244116)))))

(declare-fun b!529503 () Bool)

(assert (=> b!529503 (= e!308536 e!308535)))

(assert (=> b!529503 (= lt!244115 (select (arr!16115 a!3235) (index!20554 lt!244116)))))

(declare-fun c!62419 () Bool)

(assert (=> b!529503 (= c!62419 (= lt!244115 (select (arr!16115 a!3235) j!176)))))

(assert (= (and d!81073 c!62420) b!529499))

(assert (= (and d!81073 (not c!62420)) b!529503))

(assert (= (and b!529503 c!62419) b!529500))

(assert (= (and b!529503 (not c!62419)) b!529498))

(assert (= (and b!529498 c!62421) b!529502))

(assert (= (and b!529498 (not c!62421)) b!529501))

(assert (=> d!81073 m!509883))

(assert (=> d!81073 m!509905))

(declare-fun m!510027 () Bool)

(assert (=> d!81073 m!510027))

(assert (=> d!81073 m!509887))

(declare-fun m!510029 () Bool)

(assert (=> d!81073 m!510029))

(declare-fun m!510031 () Bool)

(assert (=> d!81073 m!510031))

(assert (=> d!81073 m!509905))

(assert (=> d!81073 m!509883))

(declare-fun m!510033 () Bool)

(assert (=> d!81073 m!510033))

(assert (=> b!529501 m!509883))

(declare-fun m!510035 () Bool)

(assert (=> b!529501 m!510035))

(declare-fun m!510037 () Bool)

(assert (=> b!529503 m!510037))

(assert (=> b!529320 d!81073))

(declare-fun d!81077 () Bool)

(declare-fun lt!244122 () (_ BitVec 32))

(declare-fun lt!244121 () (_ BitVec 32))

(assert (=> d!81077 (= lt!244122 (bvmul (bvxor lt!244121 (bvlshr lt!244121 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81077 (= lt!244121 ((_ extract 31 0) (bvand (bvxor (select (arr!16115 a!3235) j!176) (bvlshr (select (arr!16115 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81077 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325279 (let ((h!11209 ((_ extract 31 0) (bvand (bvxor (select (arr!16115 a!3235) j!176) (bvlshr (select (arr!16115 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49523 (bvmul (bvxor h!11209 (bvlshr h!11209 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49523 (bvlshr x!49523 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325279 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325279 #b00000000000000000000000000000000))))))

(assert (=> d!81077 (= (toIndex!0 (select (arr!16115 a!3235) j!176) mask!3524) (bvand (bvxor lt!244122 (bvlshr lt!244122 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529327 d!81077))

(declare-fun b!529512 () Bool)

(declare-fun e!308543 () Bool)

(declare-fun call!31924 () Bool)

(assert (=> b!529512 (= e!308543 call!31924)))

(declare-fun bm!31921 () Bool)

(assert (=> bm!31921 (= call!31924 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!529514 () Bool)

(declare-fun e!308545 () Bool)

(assert (=> b!529514 (= e!308545 call!31924)))

(declare-fun b!529515 () Bool)

(declare-fun e!308544 () Bool)

(assert (=> b!529515 (= e!308544 e!308545)))

(declare-fun c!62422 () Bool)

(assert (=> b!529515 (= c!62422 (validKeyInArray!0 (select (arr!16115 a!3235) j!176)))))

(declare-fun b!529513 () Bool)

(assert (=> b!529513 (= e!308545 e!308543)))

(declare-fun lt!244123 () (_ BitVec 64))

(assert (=> b!529513 (= lt!244123 (select (arr!16115 a!3235) j!176))))

(declare-fun lt!244124 () Unit!16776)

(assert (=> b!529513 (= lt!244124 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244123 j!176))))

(assert (=> b!529513 (arrayContainsKey!0 a!3235 lt!244123 #b00000000000000000000000000000000)))

(declare-fun lt!244125 () Unit!16776)

(assert (=> b!529513 (= lt!244125 lt!244124)))

(declare-fun res!325286 () Bool)

(assert (=> b!529513 (= res!325286 (= (seekEntryOrOpen!0 (select (arr!16115 a!3235) j!176) a!3235 mask!3524) (Found!4582 j!176)))))

(assert (=> b!529513 (=> (not res!325286) (not e!308543))))

(declare-fun d!81085 () Bool)

(declare-fun res!325287 () Bool)

(assert (=> d!81085 (=> res!325287 e!308544)))

(assert (=> d!81085 (= res!325287 (bvsge j!176 (size!16479 a!3235)))))

(assert (=> d!81085 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!308544)))

(assert (= (and d!81085 (not res!325287)) b!529515))

(assert (= (and b!529515 c!62422) b!529513))

(assert (= (and b!529515 (not c!62422)) b!529514))

(assert (= (and b!529513 res!325286) b!529512))

(assert (= (or b!529512 b!529514) bm!31921))

(declare-fun m!510039 () Bool)

(assert (=> bm!31921 m!510039))

(assert (=> b!529515 m!509883))

(assert (=> b!529515 m!509883))

(assert (=> b!529515 m!509885))

(assert (=> b!529513 m!509883))

(declare-fun m!510041 () Bool)

(assert (=> b!529513 m!510041))

(declare-fun m!510043 () Bool)

(assert (=> b!529513 m!510043))

(assert (=> b!529513 m!509883))

(assert (=> b!529513 m!509895))

(assert (=> b!529327 d!81085))

(declare-fun b!529578 () Bool)

(declare-fun e!308595 () Bool)

(declare-fun lt!244142 () SeekEntryResult!4582)

(assert (=> b!529578 (= e!308595 (bvsge (x!49518 lt!244142) #b01111111111111111111111111111110))))

(declare-fun b!529579 () Bool)

(declare-fun e!308596 () SeekEntryResult!4582)

(assert (=> b!529579 (= e!308596 (Intermediate!4582 false lt!244033 #b00000000000000000000000000000000))))

(declare-fun d!81087 () Bool)

(assert (=> d!81087 e!308595))

(declare-fun c!62441 () Bool)

(assert (=> d!81087 (= c!62441 (and (is-Intermediate!4582 lt!244142) (undefined!5394 lt!244142)))))

(declare-fun e!308593 () SeekEntryResult!4582)

(assert (=> d!81087 (= lt!244142 e!308593)))

(declare-fun c!62439 () Bool)

(assert (=> d!81087 (= c!62439 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!244143 () (_ BitVec 64))

(assert (=> d!81087 (= lt!244143 (select (arr!16115 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235))) lt!244033))))

(assert (=> d!81087 (validMask!0 mask!3524)))

(assert (=> d!81087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244033 (select (store (arr!16115 a!3235) i!1204 k!2280) j!176) (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235)) mask!3524) lt!244142)))

(declare-fun b!529580 () Bool)

(assert (=> b!529580 (= e!308593 e!308596)))

(declare-fun c!62440 () Bool)

(assert (=> b!529580 (= c!62440 (or (= lt!244143 (select (store (arr!16115 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!244143 lt!244143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529581 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529581 (= e!308596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!244033 #b00000000000000000000000000000000 mask!3524) (select (store (arr!16115 a!3235) i!1204 k!2280) j!176) (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235)) mask!3524))))

(declare-fun b!529582 () Bool)

(assert (=> b!529582 (and (bvsge (index!20554 lt!244142) #b00000000000000000000000000000000) (bvslt (index!20554 lt!244142) (size!16479 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235)))))))

(declare-fun res!325320 () Bool)

(assert (=> b!529582 (= res!325320 (= (select (arr!16115 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235))) (index!20554 lt!244142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!308592 () Bool)

(assert (=> b!529582 (=> res!325320 e!308592)))

(declare-fun b!529583 () Bool)

(assert (=> b!529583 (and (bvsge (index!20554 lt!244142) #b00000000000000000000000000000000) (bvslt (index!20554 lt!244142) (size!16479 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235)))))))

(declare-fun res!325322 () Bool)

(assert (=> b!529583 (= res!325322 (= (select (arr!16115 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235))) (index!20554 lt!244142)) (select (store (arr!16115 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!529583 (=> res!325322 e!308592)))

(declare-fun e!308594 () Bool)

(assert (=> b!529583 (= e!308594 e!308592)))

(declare-fun b!529584 () Bool)

(assert (=> b!529584 (= e!308595 e!308594)))

(declare-fun res!325321 () Bool)

(assert (=> b!529584 (= res!325321 (and (is-Intermediate!4582 lt!244142) (not (undefined!5394 lt!244142)) (bvslt (x!49518 lt!244142) #b01111111111111111111111111111110) (bvsge (x!49518 lt!244142) #b00000000000000000000000000000000) (bvsge (x!49518 lt!244142) #b00000000000000000000000000000000)))))

(assert (=> b!529584 (=> (not res!325321) (not e!308594))))

(declare-fun b!529585 () Bool)

(assert (=> b!529585 (= e!308593 (Intermediate!4582 true lt!244033 #b00000000000000000000000000000000))))

(declare-fun b!529586 () Bool)

(assert (=> b!529586 (and (bvsge (index!20554 lt!244142) #b00000000000000000000000000000000) (bvslt (index!20554 lt!244142) (size!16479 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235)))))))

(assert (=> b!529586 (= e!308592 (= (select (arr!16115 (array!33534 (store (arr!16115 a!3235) i!1204 k!2280) (size!16479 a!3235))) (index!20554 lt!244142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81087 c!62439) b!529585))

(assert (= (and d!81087 (not c!62439)) b!529580))

(assert (= (and b!529580 c!62440) b!529579))

(assert (= (and b!529580 (not c!62440)) b!529581))

(assert (= (and d!81087 c!62441) b!529578))

(assert (= (and d!81087 (not c!62441)) b!529584))

(assert (= (and b!529584 res!325321) b!529583))

(assert (= (and b!529583 (not res!325322)) b!529582))

(assert (= (and b!529582 (not res!325320)) b!529586))

(declare-fun m!510073 () Bool)

(assert (=> b!529583 m!510073))

(declare-fun m!510075 () Bool)

(assert (=> d!81087 m!510075))

(assert (=> d!81087 m!509887))

(assert (=> b!529582 m!510073))

(declare-fun m!510077 () Bool)

(assert (=> b!529581 m!510077))

(assert (=> b!529581 m!510077))

(assert (=> b!529581 m!509903))

(declare-fun m!510079 () Bool)

(assert (=> b!529581 m!510079))

(assert (=> b!529586 m!510073))

(assert (=> b!529327 d!81087))

(declare-fun b!529587 () Bool)

(declare-fun e!308600 () Bool)

(declare-fun lt!244144 () SeekEntryResult!4582)

(assert (=> b!529587 (= e!308600 (bvsge (x!49518 lt!244144) #b01111111111111111111111111111110))))

(declare-fun b!529588 () Bool)

(declare-fun e!308601 () SeekEntryResult!4582)

(assert (=> b!529588 (= e!308601 (Intermediate!4582 false lt!244032 #b00000000000000000000000000000000))))

(declare-fun d!81097 () Bool)

(assert (=> d!81097 e!308600))

(declare-fun c!62444 () Bool)

(assert (=> d!81097 (= c!62444 (and (is-Intermediate!4582 lt!244144) (undefined!5394 lt!244144)))))

(declare-fun e!308598 () SeekEntryResult!4582)

(assert (=> d!81097 (= lt!244144 e!308598)))

(declare-fun c!62442 () Bool)

(assert (=> d!81097 (= c!62442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!244145 () (_ BitVec 64))

(assert (=> d!81097 (= lt!244145 (select (arr!16115 a!3235) lt!244032))))

(assert (=> d!81097 (validMask!0 mask!3524)))

(assert (=> d!81097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244032 (select (arr!16115 a!3235) j!176) a!3235 mask!3524) lt!244144)))

(declare-fun b!529589 () Bool)

(assert (=> b!529589 (= e!308598 e!308601)))

(declare-fun c!62443 () Bool)

(assert (=> b!529589 (= c!62443 (or (= lt!244145 (select (arr!16115 a!3235) j!176)) (= (bvadd lt!244145 lt!244145) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529590 () Bool)

(assert (=> b!529590 (= e!308601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!244032 #b00000000000000000000000000000000 mask!3524) (select (arr!16115 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529591 () Bool)

(assert (=> b!529591 (and (bvsge (index!20554 lt!244144) #b00000000000000000000000000000000) (bvslt (index!20554 lt!244144) (size!16479 a!3235)))))

(declare-fun res!325323 () Bool)

(assert (=> b!529591 (= res!325323 (= (select (arr!16115 a!3235) (index!20554 lt!244144)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!308597 () Bool)

(assert (=> b!529591 (=> res!325323 e!308597)))

(declare-fun b!529592 () Bool)

(assert (=> b!529592 (and (bvsge (index!20554 lt!244144) #b00000000000000000000000000000000) (bvslt (index!20554 lt!244144) (size!16479 a!3235)))))

(declare-fun res!325325 () Bool)

(assert (=> b!529592 (= res!325325 (= (select (arr!16115 a!3235) (index!20554 lt!244144)) (select (arr!16115 a!3235) j!176)))))

(assert (=> b!529592 (=> res!325325 e!308597)))

(declare-fun e!308599 () Bool)

(assert (=> b!529592 (= e!308599 e!308597)))

(declare-fun b!529593 () Bool)

(assert (=> b!529593 (= e!308600 e!308599)))

(declare-fun res!325324 () Bool)

(assert (=> b!529593 (= res!325324 (and (is-Intermediate!4582 lt!244144) (not (undefined!5394 lt!244144)) (bvslt (x!49518 lt!244144) #b01111111111111111111111111111110) (bvsge (x!49518 lt!244144) #b00000000000000000000000000000000) (bvsge (x!49518 lt!244144) #b00000000000000000000000000000000)))))

(assert (=> b!529593 (=> (not res!325324) (not e!308599))))

(declare-fun b!529594 () Bool)

(assert (=> b!529594 (= e!308598 (Intermediate!4582 true lt!244032 #b00000000000000000000000000000000))))

(declare-fun b!529595 () Bool)

(assert (=> b!529595 (and (bvsge (index!20554 lt!244144) #b00000000000000000000000000000000) (bvslt (index!20554 lt!244144) (size!16479 a!3235)))))

