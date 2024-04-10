; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45502 () Bool)

(assert start!45502)

(declare-fun b!501241 () Bool)

(declare-fun e!293625 () Bool)

(declare-fun e!293627 () Bool)

(assert (=> b!501241 (= e!293625 e!293627)))

(declare-fun res!302968 () Bool)

(assert (=> b!501241 (=> (not res!302968) (not e!293627))))

(declare-datatypes ((SeekEntryResult!4012 0))(
  ( (MissingZero!4012 (index!18230 (_ BitVec 32))) (Found!4012 (index!18231 (_ BitVec 32))) (Intermediate!4012 (undefined!4824 Bool) (index!18232 (_ BitVec 32)) (x!47257 (_ BitVec 32))) (Undefined!4012) (MissingVacant!4012 (index!18233 (_ BitVec 32))) )
))
(declare-fun lt!227667 () SeekEntryResult!4012)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501241 (= res!302968 (or (= lt!227667 (MissingZero!4012 i!1204)) (= lt!227667 (MissingVacant!4012 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32327 0))(
  ( (array!32328 (arr!15545 (Array (_ BitVec 32) (_ BitVec 64))) (size!15909 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32327)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32327 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!501241 (= lt!227667 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501242 () Bool)

(declare-fun res!302965 () Bool)

(assert (=> b!501242 (=> (not res!302965) (not e!293625))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501242 (= res!302965 (validKeyInArray!0 (select (arr!15545 a!3235) j!176)))))

(declare-fun b!501243 () Bool)

(declare-fun res!302972 () Bool)

(assert (=> b!501243 (=> (not res!302972) (not e!293627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32327 (_ BitVec 32)) Bool)

(assert (=> b!501243 (= res!302972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!302964 () Bool)

(assert (=> start!45502 (=> (not res!302964) (not e!293625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45502 (= res!302964 (validMask!0 mask!3524))))

(assert (=> start!45502 e!293625))

(assert (=> start!45502 true))

(declare-fun array_inv!11341 (array!32327) Bool)

(assert (=> start!45502 (array_inv!11341 a!3235)))

(declare-fun b!501244 () Bool)

(declare-fun e!293628 () Bool)

(assert (=> b!501244 (= e!293627 (not e!293628))))

(declare-fun res!302969 () Bool)

(assert (=> b!501244 (=> res!302969 e!293628)))

(declare-fun lt!227661 () SeekEntryResult!4012)

(declare-fun lt!227668 () array!32327)

(declare-fun lt!227662 () (_ BitVec 64))

(declare-fun lt!227664 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32327 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!501244 (= res!302969 (= lt!227661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227664 lt!227662 lt!227668 mask!3524)))))

(declare-fun lt!227665 () (_ BitVec 32))

(assert (=> b!501244 (= lt!227661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227665 (select (arr!15545 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501244 (= lt!227664 (toIndex!0 lt!227662 mask!3524))))

(assert (=> b!501244 (= lt!227662 (select (store (arr!15545 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501244 (= lt!227665 (toIndex!0 (select (arr!15545 a!3235) j!176) mask!3524))))

(assert (=> b!501244 (= lt!227668 (array!32328 (store (arr!15545 a!3235) i!1204 k!2280) (size!15909 a!3235)))))

(declare-fun e!293624 () Bool)

(assert (=> b!501244 e!293624))

(declare-fun res!302967 () Bool)

(assert (=> b!501244 (=> (not res!302967) (not e!293624))))

(assert (=> b!501244 (= res!302967 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15124 0))(
  ( (Unit!15125) )
))
(declare-fun lt!227659 () Unit!15124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15124)

(assert (=> b!501244 (= lt!227659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501245 () Bool)

(assert (=> b!501245 (= e!293624 (= (seekEntryOrOpen!0 (select (arr!15545 a!3235) j!176) a!3235 mask!3524) (Found!4012 j!176)))))

(declare-fun b!501246 () Bool)

(declare-fun res!302962 () Bool)

(assert (=> b!501246 (=> (not res!302962) (not e!293625))))

(assert (=> b!501246 (= res!302962 (and (= (size!15909 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15909 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15909 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501247 () Bool)

(declare-fun res!302963 () Bool)

(assert (=> b!501247 (=> (not res!302963) (not e!293625))))

(declare-fun arrayContainsKey!0 (array!32327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501247 (= res!302963 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501248 () Bool)

(declare-fun res!302970 () Bool)

(assert (=> b!501248 (=> (not res!302970) (not e!293627))))

(declare-datatypes ((List!9703 0))(
  ( (Nil!9700) (Cons!9699 (h!10573 (_ BitVec 64)) (t!15931 List!9703)) )
))
(declare-fun arrayNoDuplicates!0 (array!32327 (_ BitVec 32) List!9703) Bool)

(assert (=> b!501248 (= res!302970 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9700))))

(declare-fun b!501249 () Bool)

(declare-fun e!293623 () Unit!15124)

(declare-fun Unit!15126 () Unit!15124)

(assert (=> b!501249 (= e!293623 Unit!15126)))

(declare-fun lt!227666 () Unit!15124)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15124)

(assert (=> b!501249 (= lt!227666 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227665 #b00000000000000000000000000000000 (index!18232 lt!227661) (x!47257 lt!227661) mask!3524))))

(declare-fun res!302966 () Bool)

(assert (=> b!501249 (= res!302966 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227665 lt!227662 lt!227668 mask!3524) (Intermediate!4012 false (index!18232 lt!227661) (x!47257 lt!227661))))))

(declare-fun e!293626 () Bool)

(assert (=> b!501249 (=> (not res!302966) (not e!293626))))

(assert (=> b!501249 e!293626))

(declare-fun b!501250 () Bool)

(assert (=> b!501250 (= e!293626 false)))

(declare-fun b!501251 () Bool)

(declare-fun res!302961 () Bool)

(assert (=> b!501251 (=> (not res!302961) (not e!293625))))

(assert (=> b!501251 (= res!302961 (validKeyInArray!0 k!2280))))

(declare-fun b!501252 () Bool)

(declare-fun res!302971 () Bool)

(assert (=> b!501252 (=> res!302971 e!293628)))

(assert (=> b!501252 (= res!302971 (or (undefined!4824 lt!227661) (not (is-Intermediate!4012 lt!227661))))))

(declare-fun b!501253 () Bool)

(assert (=> b!501253 (= e!293628 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!501253 (= (index!18232 lt!227661) i!1204)))

(declare-fun lt!227663 () Unit!15124)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15124)

(assert (=> b!501253 (= lt!227663 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227665 #b00000000000000000000000000000000 (index!18232 lt!227661) (x!47257 lt!227661) mask!3524))))

(assert (=> b!501253 (and (or (= (select (arr!15545 a!3235) (index!18232 lt!227661)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15545 a!3235) (index!18232 lt!227661)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15545 a!3235) (index!18232 lt!227661)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15545 a!3235) (index!18232 lt!227661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227660 () Unit!15124)

(assert (=> b!501253 (= lt!227660 e!293623)))

(declare-fun c!59417 () Bool)

(assert (=> b!501253 (= c!59417 (= (select (arr!15545 a!3235) (index!18232 lt!227661)) (select (arr!15545 a!3235) j!176)))))

(assert (=> b!501253 (and (bvslt (x!47257 lt!227661) #b01111111111111111111111111111110) (or (= (select (arr!15545 a!3235) (index!18232 lt!227661)) (select (arr!15545 a!3235) j!176)) (= (select (arr!15545 a!3235) (index!18232 lt!227661)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15545 a!3235) (index!18232 lt!227661)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501254 () Bool)

(declare-fun Unit!15127 () Unit!15124)

(assert (=> b!501254 (= e!293623 Unit!15127)))

(assert (= (and start!45502 res!302964) b!501246))

(assert (= (and b!501246 res!302962) b!501242))

(assert (= (and b!501242 res!302965) b!501251))

(assert (= (and b!501251 res!302961) b!501247))

(assert (= (and b!501247 res!302963) b!501241))

(assert (= (and b!501241 res!302968) b!501243))

(assert (= (and b!501243 res!302972) b!501248))

(assert (= (and b!501248 res!302970) b!501244))

(assert (= (and b!501244 res!302967) b!501245))

(assert (= (and b!501244 (not res!302969)) b!501252))

(assert (= (and b!501252 (not res!302971)) b!501253))

(assert (= (and b!501253 c!59417) b!501249))

(assert (= (and b!501253 (not c!59417)) b!501254))

(assert (= (and b!501249 res!302966) b!501250))

(declare-fun m!482347 () Bool)

(assert (=> b!501245 m!482347))

(assert (=> b!501245 m!482347))

(declare-fun m!482349 () Bool)

(assert (=> b!501245 m!482349))

(declare-fun m!482351 () Bool)

(assert (=> b!501241 m!482351))

(declare-fun m!482353 () Bool)

(assert (=> b!501251 m!482353))

(declare-fun m!482355 () Bool)

(assert (=> b!501247 m!482355))

(declare-fun m!482357 () Bool)

(assert (=> b!501244 m!482357))

(declare-fun m!482359 () Bool)

(assert (=> b!501244 m!482359))

(declare-fun m!482361 () Bool)

(assert (=> b!501244 m!482361))

(declare-fun m!482363 () Bool)

(assert (=> b!501244 m!482363))

(assert (=> b!501244 m!482347))

(declare-fun m!482365 () Bool)

(assert (=> b!501244 m!482365))

(assert (=> b!501244 m!482347))

(declare-fun m!482367 () Bool)

(assert (=> b!501244 m!482367))

(assert (=> b!501244 m!482347))

(declare-fun m!482369 () Bool)

(assert (=> b!501244 m!482369))

(declare-fun m!482371 () Bool)

(assert (=> b!501244 m!482371))

(declare-fun m!482373 () Bool)

(assert (=> start!45502 m!482373))

(declare-fun m!482375 () Bool)

(assert (=> start!45502 m!482375))

(assert (=> b!501242 m!482347))

(assert (=> b!501242 m!482347))

(declare-fun m!482377 () Bool)

(assert (=> b!501242 m!482377))

(declare-fun m!482379 () Bool)

(assert (=> b!501253 m!482379))

(declare-fun m!482381 () Bool)

(assert (=> b!501253 m!482381))

(assert (=> b!501253 m!482347))

(declare-fun m!482383 () Bool)

(assert (=> b!501243 m!482383))

(declare-fun m!482385 () Bool)

(assert (=> b!501249 m!482385))

(declare-fun m!482387 () Bool)

(assert (=> b!501249 m!482387))

(declare-fun m!482389 () Bool)

(assert (=> b!501248 m!482389))

(push 1)

(assert (not b!501248))

(assert (not start!45502))

(assert (not b!501251))

(assert (not b!501253))

(assert (not b!501241))

(assert (not b!501245))

(assert (not b!501243))

(assert (not b!501242))

(assert (not b!501244))

(assert (not b!501249))

(assert (not b!501247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!501348 () Bool)

(declare-fun e!293686 () SeekEntryResult!4012)

(assert (=> b!501348 (= e!293686 Undefined!4012)))

(declare-fun b!501349 () Bool)

(declare-fun e!293688 () SeekEntryResult!4012)

(declare-fun lt!227713 () SeekEntryResult!4012)

(assert (=> b!501349 (= e!293688 (MissingZero!4012 (index!18232 lt!227713)))))

(declare-fun d!78535 () Bool)

(declare-fun lt!227712 () SeekEntryResult!4012)

(assert (=> d!78535 (and (or (is-Undefined!4012 lt!227712) (not (is-Found!4012 lt!227712)) (and (bvsge (index!18231 lt!227712) #b00000000000000000000000000000000) (bvslt (index!18231 lt!227712) (size!15909 a!3235)))) (or (is-Undefined!4012 lt!227712) (is-Found!4012 lt!227712) (not (is-MissingZero!4012 lt!227712)) (and (bvsge (index!18230 lt!227712) #b00000000000000000000000000000000) (bvslt (index!18230 lt!227712) (size!15909 a!3235)))) (or (is-Undefined!4012 lt!227712) (is-Found!4012 lt!227712) (is-MissingZero!4012 lt!227712) (not (is-MissingVacant!4012 lt!227712)) (and (bvsge (index!18233 lt!227712) #b00000000000000000000000000000000) (bvslt (index!18233 lt!227712) (size!15909 a!3235)))) (or (is-Undefined!4012 lt!227712) (ite (is-Found!4012 lt!227712) (= (select (arr!15545 a!3235) (index!18231 lt!227712)) (select (arr!15545 a!3235) j!176)) (ite (is-MissingZero!4012 lt!227712) (= (select (arr!15545 a!3235) (index!18230 lt!227712)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4012 lt!227712) (= (select (arr!15545 a!3235) (index!18233 lt!227712)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78535 (= lt!227712 e!293686)))

(declare-fun c!59453 () Bool)

(assert (=> d!78535 (= c!59453 (and (is-Intermediate!4012 lt!227713) (undefined!4824 lt!227713)))))

(assert (=> d!78535 (= lt!227713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15545 a!3235) j!176) mask!3524) (select (arr!15545 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78535 (validMask!0 mask!3524)))

(assert (=> d!78535 (= (seekEntryOrOpen!0 (select (arr!15545 a!3235) j!176) a!3235 mask!3524) lt!227712)))

(declare-fun b!501350 () Bool)

(declare-fun c!59451 () Bool)

(declare-fun lt!227711 () (_ BitVec 64))

(assert (=> b!501350 (= c!59451 (= lt!227711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293687 () SeekEntryResult!4012)

(assert (=> b!501350 (= e!293687 e!293688)))

(declare-fun b!501351 () Bool)

(assert (=> b!501351 (= e!293687 (Found!4012 (index!18232 lt!227713)))))

(declare-fun b!501352 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32327 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!501352 (= e!293688 (seekKeyOrZeroReturnVacant!0 (x!47257 lt!227713) (index!18232 lt!227713) (index!18232 lt!227713) (select (arr!15545 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501353 () Bool)

(assert (=> b!501353 (= e!293686 e!293687)))

(assert (=> b!501353 (= lt!227711 (select (arr!15545 a!3235) (index!18232 lt!227713)))))

(declare-fun c!59452 () Bool)

(assert (=> b!501353 (= c!59452 (= lt!227711 (select (arr!15545 a!3235) j!176)))))

(assert (= (and d!78535 c!59453) b!501348))

(assert (= (and d!78535 (not c!59453)) b!501353))

(assert (= (and b!501353 c!59452) b!501351))

(assert (= (and b!501353 (not c!59452)) b!501350))

(assert (= (and b!501350 c!59451) b!501349))

(assert (= (and b!501350 (not c!59451)) b!501352))

(declare-fun m!482445 () Bool)

(assert (=> d!78535 m!482445))

(declare-fun m!482447 () Bool)

(assert (=> d!78535 m!482447))

(assert (=> d!78535 m!482367))

(assert (=> d!78535 m!482347))

(declare-fun m!482449 () Bool)

(assert (=> d!78535 m!482449))

(assert (=> d!78535 m!482373))

(assert (=> d!78535 m!482347))

(assert (=> d!78535 m!482367))

(declare-fun m!482451 () Bool)

(assert (=> d!78535 m!482451))

(assert (=> b!501352 m!482347))

(declare-fun m!482453 () Bool)

(assert (=> b!501352 m!482453))

(declare-fun m!482455 () Bool)

(assert (=> b!501353 m!482455))

(assert (=> b!501245 d!78535))

(declare-fun bm!31460 () Bool)

(declare-fun call!31463 () Bool)

(assert (=> bm!31460 (= call!31463 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!501374 () Bool)

(declare-fun e!293705 () Bool)

(assert (=> b!501374 (= e!293705 call!31463)))

(declare-fun b!501375 () Bool)

(declare-fun e!293706 () Bool)

(assert (=> b!501375 (= e!293706 e!293705)))

(declare-fun lt!227732 () (_ BitVec 64))

(assert (=> b!501375 (= lt!227732 (select (arr!15545 a!3235) j!176))))

(declare-fun lt!227731 () Unit!15124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32327 (_ BitVec 64) (_ BitVec 32)) Unit!15124)

(assert (=> b!501375 (= lt!227731 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227732 j!176))))

(assert (=> b!501375 (arrayContainsKey!0 a!3235 lt!227732 #b00000000000000000000000000000000)))

(declare-fun lt!227733 () Unit!15124)

(assert (=> b!501375 (= lt!227733 lt!227731)))

(declare-fun res!303012 () Bool)

(assert (=> b!501375 (= res!303012 (= (seekEntryOrOpen!0 (select (arr!15545 a!3235) j!176) a!3235 mask!3524) (Found!4012 j!176)))))

(assert (=> b!501375 (=> (not res!303012) (not e!293705))))

(declare-fun b!501376 () Bool)

(declare-fun e!293704 () Bool)

(assert (=> b!501376 (= e!293704 e!293706)))

(declare-fun c!59459 () Bool)

(assert (=> b!501376 (= c!59459 (validKeyInArray!0 (select (arr!15545 a!3235) j!176)))))

(declare-fun d!78547 () Bool)

(declare-fun res!303011 () Bool)

(assert (=> d!78547 (=> res!303011 e!293704)))

(assert (=> d!78547 (= res!303011 (bvsge j!176 (size!15909 a!3235)))))

(assert (=> d!78547 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!293704)))

(declare-fun b!501377 () Bool)

(assert (=> b!501377 (= e!293706 call!31463)))

(assert (= (and d!78547 (not res!303011)) b!501376))

(assert (= (and b!501376 c!59459) b!501375))

(assert (= (and b!501376 (not c!59459)) b!501377))

(assert (= (and b!501375 res!303012) b!501374))

(assert (= (or b!501374 b!501377) bm!31460))

(declare-fun m!482463 () Bool)

(assert (=> bm!31460 m!482463))

(assert (=> b!501375 m!482347))

(declare-fun m!482465 () Bool)

(assert (=> b!501375 m!482465))

(declare-fun m!482467 () Bool)

(assert (=> b!501375 m!482467))

(assert (=> b!501375 m!482347))

(assert (=> b!501375 m!482349))

(assert (=> b!501376 m!482347))

(assert (=> b!501376 m!482347))

(assert (=> b!501376 m!482377))

(assert (=> b!501244 d!78547))

(declare-fun d!78553 () Bool)

(declare-fun e!293741 () Bool)

(assert (=> d!78553 e!293741))

(declare-fun c!59478 () Bool)

(declare-fun lt!227752 () SeekEntryResult!4012)

(assert (=> d!78553 (= c!59478 (and (is-Intermediate!4012 lt!227752) (undefined!4824 lt!227752)))))

(declare-fun e!293737 () SeekEntryResult!4012)

(assert (=> d!78553 (= lt!227752 e!293737)))

(declare-fun c!59479 () Bool)

(assert (=> d!78553 (= c!59479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!227753 () (_ BitVec 64))

(assert (=> d!78553 (= lt!227753 (select (arr!15545 a!3235) lt!227665))))

(assert (=> d!78553 (validMask!0 mask!3524)))

(assert (=> d!78553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227665 (select (arr!15545 a!3235) j!176) a!3235 mask!3524) lt!227752)))

(declare-fun b!501432 () Bool)

(declare-fun e!293739 () SeekEntryResult!4012)

(assert (=> b!501432 (= e!293739 (Intermediate!4012 false lt!227665 #b00000000000000000000000000000000))))

(declare-fun b!501433 () Bool)

(assert (=> b!501433 (and (bvsge (index!18232 lt!227752) #b00000000000000000000000000000000) (bvslt (index!18232 lt!227752) (size!15909 a!3235)))))

(declare-fun res!303031 () Bool)

(assert (=> b!501433 (= res!303031 (= (select (arr!15545 a!3235) (index!18232 lt!227752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293738 () Bool)

(assert (=> b!501433 (=> res!303031 e!293738)))

(declare-fun b!501434 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501434 (= e!293739 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227665 #b00000000000000000000000000000000 mask!3524) (select (arr!15545 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501435 () Bool)

(assert (=> b!501435 (= e!293737 e!293739)))

(declare-fun c!59480 () Bool)

(assert (=> b!501435 (= c!59480 (or (= lt!227753 (select (arr!15545 a!3235) j!176)) (= (bvadd lt!227753 lt!227753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501436 () Bool)

(assert (=> b!501436 (= e!293737 (Intermediate!4012 true lt!227665 #b00000000000000000000000000000000))))

(declare-fun b!501437 () Bool)

(assert (=> b!501437 (and (bvsge (index!18232 lt!227752) #b00000000000000000000000000000000) (bvslt (index!18232 lt!227752) (size!15909 a!3235)))))

(assert (=> b!501437 (= e!293738 (= (select (arr!15545 a!3235) (index!18232 lt!227752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501438 () Bool)

(assert (=> b!501438 (and (bvsge (index!18232 lt!227752) #b00000000000000000000000000000000) (bvslt (index!18232 lt!227752) (size!15909 a!3235)))))

(declare-fun res!303032 () Bool)

(assert (=> b!501438 (= res!303032 (= (select (arr!15545 a!3235) (index!18232 lt!227752)) (select (arr!15545 a!3235) j!176)))))

(assert (=> b!501438 (=> res!303032 e!293738)))

(declare-fun e!293740 () Bool)

(assert (=> b!501438 (= e!293740 e!293738)))

(declare-fun b!501439 () Bool)

(assert (=> b!501439 (= e!293741 e!293740)))

(declare-fun res!303033 () Bool)

(assert (=> b!501439 (= res!303033 (and (is-Intermediate!4012 lt!227752) (not (undefined!4824 lt!227752)) (bvslt (x!47257 lt!227752) #b01111111111111111111111111111110) (bvsge (x!47257 lt!227752) #b00000000000000000000000000000000) (bvsge (x!47257 lt!227752) #b00000000000000000000000000000000)))))

(assert (=> b!501439 (=> (not res!303033) (not e!293740))))

(declare-fun b!501440 () Bool)

(assert (=> b!501440 (= e!293741 (bvsge (x!47257 lt!227752) #b01111111111111111111111111111110))))

(assert (= (and d!78553 c!59479) b!501436))

(assert (= (and d!78553 (not c!59479)) b!501435))

(assert (= (and b!501435 c!59480) b!501432))

(assert (= (and b!501435 (not c!59480)) b!501434))

(assert (= (and d!78553 c!59478) b!501440))

(assert (= (and d!78553 (not c!59478)) b!501439))

(assert (= (and b!501439 res!303033) b!501438))

(assert (= (and b!501438 (not res!303032)) b!501433))

(assert (= (and b!501433 (not res!303031)) b!501437))

(declare-fun m!482489 () Bool)

(assert (=> b!501434 m!482489))

(assert (=> b!501434 m!482489))

(assert (=> b!501434 m!482347))

(declare-fun m!482491 () Bool)

(assert (=> b!501434 m!482491))

(declare-fun m!482493 () Bool)

(assert (=> b!501433 m!482493))

(assert (=> b!501437 m!482493))

(declare-fun m!482495 () Bool)

(assert (=> d!78553 m!482495))

(assert (=> d!78553 m!482373))

(assert (=> b!501438 m!482493))

(assert (=> b!501244 d!78553))

(declare-fun d!78569 () Bool)

(assert (=> d!78569 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!227756 () Unit!15124)

(declare-fun choose!38 (array!32327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15124)

(assert (=> d!78569 (= lt!227756 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78569 (validMask!0 mask!3524)))

(assert (=> d!78569 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!227756)))

(declare-fun bs!15930 () Bool)

(assert (= bs!15930 d!78569))

(assert (=> bs!15930 m!482369))

(declare-fun m!482499 () Bool)

(assert (=> bs!15930 m!482499))

(assert (=> bs!15930 m!482373))

(assert (=> b!501244 d!78569))

(declare-fun d!78577 () Bool)

(declare-fun e!293752 () Bool)

(assert (=> d!78577 e!293752))

(declare-fun c!59481 () Bool)

(declare-fun lt!227757 () SeekEntryResult!4012)

(assert (=> d!78577 (= c!59481 (and (is-Intermediate!4012 lt!227757) (undefined!4824 lt!227757)))))

(declare-fun e!293748 () SeekEntryResult!4012)

(assert (=> d!78577 (= lt!227757 e!293748)))

(declare-fun c!59482 () Bool)

(assert (=> d!78577 (= c!59482 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!227758 () (_ BitVec 64))

(assert (=> d!78577 (= lt!227758 (select (arr!15545 lt!227668) lt!227664))))

(assert (=> d!78577 (validMask!0 mask!3524)))

(assert (=> d!78577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227664 lt!227662 lt!227668 mask!3524) lt!227757)))

(declare-fun b!501447 () Bool)

(declare-fun e!293750 () SeekEntryResult!4012)

(assert (=> b!501447 (= e!293750 (Intermediate!4012 false lt!227664 #b00000000000000000000000000000000))))

(declare-fun b!501448 () Bool)

(assert (=> b!501448 (and (bvsge (index!18232 lt!227757) #b00000000000000000000000000000000) (bvslt (index!18232 lt!227757) (size!15909 lt!227668)))))

(declare-fun res!303041 () Bool)

(assert (=> b!501448 (= res!303041 (= (select (arr!15545 lt!227668) (index!18232 lt!227757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293749 () Bool)

(assert (=> b!501448 (=> res!303041 e!293749)))

(declare-fun b!501449 () Bool)

(assert (=> b!501449 (= e!293750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227664 #b00000000000000000000000000000000 mask!3524) lt!227662 lt!227668 mask!3524))))

(declare-fun b!501450 () Bool)

(assert (=> b!501450 (= e!293748 e!293750)))

(declare-fun c!59483 () Bool)

(assert (=> b!501450 (= c!59483 (or (= lt!227758 lt!227662) (= (bvadd lt!227758 lt!227758) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501451 () Bool)

(assert (=> b!501451 (= e!293748 (Intermediate!4012 true lt!227664 #b00000000000000000000000000000000))))

(declare-fun b!501452 () Bool)

(assert (=> b!501452 (and (bvsge (index!18232 lt!227757) #b00000000000000000000000000000000) (bvslt (index!18232 lt!227757) (size!15909 lt!227668)))))

(assert (=> b!501452 (= e!293749 (= (select (arr!15545 lt!227668) (index!18232 lt!227757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501453 () Bool)

(assert (=> b!501453 (and (bvsge (index!18232 lt!227757) #b00000000000000000000000000000000) (bvslt (index!18232 lt!227757) (size!15909 lt!227668)))))

(declare-fun res!303042 () Bool)

(assert (=> b!501453 (= res!303042 (= (select (arr!15545 lt!227668) (index!18232 lt!227757)) lt!227662))))

(assert (=> b!501453 (=> res!303042 e!293749)))

(declare-fun e!293751 () Bool)

(assert (=> b!501453 (= e!293751 e!293749)))

(declare-fun b!501454 () Bool)

(assert (=> b!501454 (= e!293752 e!293751)))

(declare-fun res!303043 () Bool)

(assert (=> b!501454 (= res!303043 (and (is-Intermediate!4012 lt!227757) (not (undefined!4824 lt!227757)) (bvslt (x!47257 lt!227757) #b01111111111111111111111111111110) (bvsge (x!47257 lt!227757) #b00000000000000000000000000000000) (bvsge (x!47257 lt!227757) #b00000000000000000000000000000000)))))

(assert (=> b!501454 (=> (not res!303043) (not e!293751))))

(declare-fun b!501455 () Bool)

(assert (=> b!501455 (= e!293752 (bvsge (x!47257 lt!227757) #b01111111111111111111111111111110))))

(assert (= (and d!78577 c!59482) b!501451))

(assert (= (and d!78577 (not c!59482)) b!501450))

(assert (= (and b!501450 c!59483) b!501447))

(assert (= (and b!501450 (not c!59483)) b!501449))

(assert (= (and d!78577 c!59481) b!501455))

(assert (= (and d!78577 (not c!59481)) b!501454))

(assert (= (and b!501454 res!303043) b!501453))

(assert (= (and b!501453 (not res!303042)) b!501448))

(assert (= (and b!501448 (not res!303041)) b!501452))

(declare-fun m!482501 () Bool)

(assert (=> b!501449 m!482501))

(assert (=> b!501449 m!482501))

(declare-fun m!482503 () Bool)

(assert (=> b!501449 m!482503))

(declare-fun m!482505 () Bool)

(assert (=> b!501448 m!482505))

(assert (=> b!501452 m!482505))

(declare-fun m!482507 () Bool)

(assert (=> d!78577 m!482507))

(assert (=> d!78577 m!482373))

(assert (=> b!501453 m!482505))

(assert (=> b!501244 d!78577))

(declare-fun d!78579 () Bool)

(declare-fun lt!227783 () (_ BitVec 32))

(declare-fun lt!227782 () (_ BitVec 32))

(assert (=> d!78579 (= lt!227783 (bvmul (bvxor lt!227782 (bvlshr lt!227782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78579 (= lt!227782 ((_ extract 31 0) (bvand (bvxor (select (arr!15545 a!3235) j!176) (bvlshr (select (arr!15545 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78579 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!303044 (let ((h!10576 ((_ extract 31 0) (bvand (bvxor (select (arr!15545 a!3235) j!176) (bvlshr (select (arr!15545 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47265 (bvmul (bvxor h!10576 (bvlshr h!10576 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47265 (bvlshr x!47265 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!303044 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!303044 #b00000000000000000000000000000000))))))

(assert (=> d!78579 (= (toIndex!0 (select (arr!15545 a!3235) j!176) mask!3524) (bvand (bvxor lt!227783 (bvlshr lt!227783 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501244 d!78579))

(declare-fun d!78589 () Bool)

(declare-fun lt!227785 () (_ BitVec 32))

(declare-fun lt!227784 () (_ BitVec 32))

(assert (=> d!78589 (= lt!227785 (bvmul (bvxor lt!227784 (bvlshr lt!227784 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78589 (= lt!227784 ((_ extract 31 0) (bvand (bvxor lt!227662 (bvlshr lt!227662 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78589 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!303044 (let ((h!10576 ((_ extract 31 0) (bvand (bvxor lt!227662 (bvlshr lt!227662 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47265 (bvmul (bvxor h!10576 (bvlshr h!10576 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47265 (bvlshr x!47265 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!303044 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!303044 #b00000000000000000000000000000000))))))

(assert (=> d!78589 (= (toIndex!0 lt!227662 mask!3524) (bvand (bvxor lt!227785 (bvlshr lt!227785 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501244 d!78589))

(declare-fun b!501481 () Bool)

(declare-fun e!293767 () SeekEntryResult!4012)

(assert (=> b!501481 (= e!293767 Undefined!4012)))

(declare-fun b!501482 () Bool)

(declare-fun e!293769 () SeekEntryResult!4012)

(declare-fun lt!227788 () SeekEntryResult!4012)

(assert (=> b!501482 (= e!293769 (MissingZero!4012 (index!18232 lt!227788)))))

(declare-fun d!78591 () Bool)

(declare-fun lt!227787 () SeekEntryResult!4012)

(assert (=> d!78591 (and (or (is-Undefined!4012 lt!227787) (not (is-Found!4012 lt!227787)) (and (bvsge (index!18231 lt!227787) #b00000000000000000000000000000000) (bvslt (index!18231 lt!227787) (size!15909 a!3235)))) (or (is-Undefined!4012 lt!227787) (is-Found!4012 lt!227787) (not (is-MissingZero!4012 lt!227787)) (and (bvsge (index!18230 lt!227787) #b00000000000000000000000000000000) (bvslt (index!18230 lt!227787) (size!15909 a!3235)))) (or (is-Undefined!4012 lt!227787) (is-Found!4012 lt!227787) (is-MissingZero!4012 lt!227787) (not (is-MissingVacant!4012 lt!227787)) (and (bvsge (index!18233 lt!227787) #b00000000000000000000000000000000) (bvslt (index!18233 lt!227787) (size!15909 a!3235)))) (or (is-Undefined!4012 lt!227787) (ite (is-Found!4012 lt!227787) (= (select (arr!15545 a!3235) (index!18231 lt!227787)) k!2280) (ite (is-MissingZero!4012 lt!227787) (= (select (arr!15545 a!3235) (index!18230 lt!227787)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4012 lt!227787) (= (select (arr!15545 a!3235) (index!18233 lt!227787)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78591 (= lt!227787 e!293767)))

(declare-fun c!59496 () Bool)

(assert (=> d!78591 (= c!59496 (and (is-Intermediate!4012 lt!227788) (undefined!4824 lt!227788)))))

(assert (=> d!78591 (= lt!227788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78591 (validMask!0 mask!3524)))

(assert (=> d!78591 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!227787)))

(declare-fun b!501483 () Bool)

(declare-fun c!59494 () Bool)

(declare-fun lt!227786 () (_ BitVec 64))

(assert (=> b!501483 (= c!59494 (= lt!227786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293768 () SeekEntryResult!4012)

(assert (=> b!501483 (= e!293768 e!293769)))

(declare-fun b!501484 () Bool)

(assert (=> b!501484 (= e!293768 (Found!4012 (index!18232 lt!227788)))))

(declare-fun b!501485 () Bool)

(assert (=> b!501485 (= e!293769 (seekKeyOrZeroReturnVacant!0 (x!47257 lt!227788) (index!18232 lt!227788) (index!18232 lt!227788) k!2280 a!3235 mask!3524))))

(declare-fun b!501486 () Bool)

(assert (=> b!501486 (= e!293767 e!293768)))

(assert (=> b!501486 (= lt!227786 (select (arr!15545 a!3235) (index!18232 lt!227788)))))

(declare-fun c!59495 () Bool)

(assert (=> b!501486 (= c!59495 (= lt!227786 k!2280))))

(assert (= (and d!78591 c!59496) b!501481))

(assert (= (and d!78591 (not c!59496)) b!501486))

(assert (= (and b!501486 c!59495) b!501484))

(assert (= (and b!501486 (not c!59495)) b!501483))

(assert (= (and b!501483 c!59494) b!501482))

(assert (= (and b!501483 (not c!59494)) b!501485))

(declare-fun m!482523 () Bool)

(assert (=> d!78591 m!482523))

(declare-fun m!482525 () Bool)

(assert (=> d!78591 m!482525))

(declare-fun m!482527 () Bool)

(assert (=> d!78591 m!482527))

(declare-fun m!482529 () Bool)

(assert (=> d!78591 m!482529))

(assert (=> d!78591 m!482373))

(assert (=> d!78591 m!482527))

(declare-fun m!482531 () Bool)

(assert (=> d!78591 m!482531))

(declare-fun m!482533 () Bool)

(assert (=> b!501485 m!482533))

(declare-fun m!482535 () Bool)

(assert (=> b!501486 m!482535))

(assert (=> b!501241 d!78591))

(declare-fun d!78593 () Bool)

(assert (=> d!78593 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501251 d!78593))

(declare-fun d!78595 () Bool)

(assert (=> d!78595 (= (validKeyInArray!0 (select (arr!15545 a!3235) j!176)) (and (not (= (select (arr!15545 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15545 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501242 d!78595))

(declare-fun d!78599 () Bool)

(assert (=> d!78599 (= (index!18232 lt!227661) i!1204)))

(declare-fun lt!227802 () Unit!15124)

(declare-fun choose!104 (array!32327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15124)

(assert (=> d!78599 (= lt!227802 (choose!104 a!3235 i!1204 k!2280 j!176 lt!227665 #b00000000000000000000000000000000 (index!18232 lt!227661) (x!47257 lt!227661) mask!3524))))

(assert (=> d!78599 (validMask!0 mask!3524)))

(assert (=> d!78599 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227665 #b00000000000000000000000000000000 (index!18232 lt!227661) (x!47257 lt!227661) mask!3524) lt!227802)))

(declare-fun bs!15932 () Bool)

(assert (= bs!15932 d!78599))

(declare-fun m!482565 () Bool)

(assert (=> bs!15932 m!482565))

(assert (=> bs!15932 m!482373))

(assert (=> b!501253 d!78599))

(declare-fun d!78605 () Bool)

(declare-fun res!303063 () Bool)

(declare-fun e!293791 () Bool)

(assert (=> d!78605 (=> res!303063 e!293791)))

(assert (=> d!78605 (= res!303063 (= (select (arr!15545 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78605 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!293791)))

(declare-fun b!501518 () Bool)

(declare-fun e!293792 () Bool)

(assert (=> b!501518 (= e!293791 e!293792)))

(declare-fun res!303064 () Bool)

(assert (=> b!501518 (=> (not res!303064) (not e!293792))))

(assert (=> b!501518 (= res!303064 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15909 a!3235)))))

(declare-fun b!501519 () Bool)

(assert (=> b!501519 (= e!293792 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78605 (not res!303063)) b!501518))

(assert (= (and b!501518 res!303064) b!501519))

(declare-fun m!482577 () Bool)

(assert (=> d!78605 m!482577))

(declare-fun m!482579 () Bool)

(assert (=> b!501519 m!482579))

(assert (=> b!501247 d!78605))

(declare-fun d!78611 () Bool)

(assert (=> d!78611 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

