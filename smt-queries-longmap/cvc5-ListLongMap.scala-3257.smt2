; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45414 () Bool)

(assert start!45414)

(declare-fun b!499279 () Bool)

(declare-fun e!292588 () Bool)

(declare-fun e!292585 () Bool)

(assert (=> b!499279 (= e!292588 e!292585)))

(declare-fun res!301273 () Bool)

(assert (=> b!499279 (=> res!301273 e!292585)))

(declare-datatypes ((array!32239 0))(
  ( (array!32240 (arr!15501 (Array (_ BitVec 32) (_ BitVec 64))) (size!15865 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32239)

(declare-fun lt!226345 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3968 0))(
  ( (MissingZero!3968 (index!18054 (_ BitVec 32))) (Found!3968 (index!18055 (_ BitVec 32))) (Intermediate!3968 (undefined!4780 Bool) (index!18056 (_ BitVec 32)) (x!47101 (_ BitVec 32))) (Undefined!3968) (MissingVacant!3968 (index!18057 (_ BitVec 32))) )
))
(declare-fun lt!226348 () SeekEntryResult!3968)

(assert (=> b!499279 (= res!301273 (or (bvsgt #b00000000000000000000000000000000 (x!47101 lt!226348)) (bvsgt (x!47101 lt!226348) #b01111111111111111111111111111110) (bvslt lt!226345 #b00000000000000000000000000000000) (bvsge lt!226345 (size!15865 a!3235)) (bvslt (index!18056 lt!226348) #b00000000000000000000000000000000) (bvsge (index!18056 lt!226348) (size!15865 a!3235)) (not (= lt!226348 (Intermediate!3968 false (index!18056 lt!226348) (x!47101 lt!226348))))))))

(assert (=> b!499279 (and (or (= (select (arr!15501 a!3235) (index!18056 lt!226348)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15501 a!3235) (index!18056 lt!226348)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15501 a!3235) (index!18056 lt!226348)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15501 a!3235) (index!18056 lt!226348)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14948 0))(
  ( (Unit!14949) )
))
(declare-fun lt!226343 () Unit!14948)

(declare-fun e!292586 () Unit!14948)

(assert (=> b!499279 (= lt!226343 e!292586)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!59285 () Bool)

(assert (=> b!499279 (= c!59285 (= (select (arr!15501 a!3235) (index!18056 lt!226348)) (select (arr!15501 a!3235) j!176)))))

(assert (=> b!499279 (and (bvslt (x!47101 lt!226348) #b01111111111111111111111111111110) (or (= (select (arr!15501 a!3235) (index!18056 lt!226348)) (select (arr!15501 a!3235) j!176)) (= (select (arr!15501 a!3235) (index!18056 lt!226348)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15501 a!3235) (index!18056 lt!226348)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499280 () Bool)

(assert (=> b!499280 (= e!292585 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!226340 () (_ BitVec 64))

(declare-fun lt!226339 () SeekEntryResult!3968)

(declare-fun lt!226344 () array!32239)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32239 (_ BitVec 32)) SeekEntryResult!3968)

(assert (=> b!499280 (= lt!226339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226345 lt!226340 lt!226344 mask!3524))))

(declare-fun b!499281 () Bool)

(declare-fun e!292589 () Bool)

(declare-fun e!292587 () Bool)

(assert (=> b!499281 (= e!292589 e!292587)))

(declare-fun res!301269 () Bool)

(assert (=> b!499281 (=> (not res!301269) (not e!292587))))

(declare-fun lt!226342 () SeekEntryResult!3968)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499281 (= res!301269 (or (= lt!226342 (MissingZero!3968 i!1204)) (= lt!226342 (MissingVacant!3968 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32239 (_ BitVec 32)) SeekEntryResult!3968)

(assert (=> b!499281 (= lt!226342 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499282 () Bool)

(declare-fun res!301267 () Bool)

(assert (=> b!499282 (=> (not res!301267) (not e!292589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499282 (= res!301267 (validKeyInArray!0 k!2280))))

(declare-fun b!499283 () Bool)

(declare-fun Unit!14950 () Unit!14948)

(assert (=> b!499283 (= e!292586 Unit!14950)))

(declare-fun lt!226346 () Unit!14948)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32239 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14948)

(assert (=> b!499283 (= lt!226346 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226345 #b00000000000000000000000000000000 (index!18056 lt!226348) (x!47101 lt!226348) mask!3524))))

(declare-fun res!301268 () Bool)

(assert (=> b!499283 (= res!301268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226345 lt!226340 lt!226344 mask!3524) (Intermediate!3968 false (index!18056 lt!226348) (x!47101 lt!226348))))))

(declare-fun e!292583 () Bool)

(assert (=> b!499283 (=> (not res!301268) (not e!292583))))

(assert (=> b!499283 e!292583))

(declare-fun e!292584 () Bool)

(declare-fun b!499284 () Bool)

(assert (=> b!499284 (= e!292584 (= (seekEntryOrOpen!0 (select (arr!15501 a!3235) j!176) a!3235 mask!3524) (Found!3968 j!176)))))

(declare-fun b!499285 () Bool)

(declare-fun Unit!14951 () Unit!14948)

(assert (=> b!499285 (= e!292586 Unit!14951)))

(declare-fun b!499286 () Bool)

(assert (=> b!499286 (= e!292583 false)))

(declare-fun res!301265 () Bool)

(assert (=> start!45414 (=> (not res!301265) (not e!292589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45414 (= res!301265 (validMask!0 mask!3524))))

(assert (=> start!45414 e!292589))

(assert (=> start!45414 true))

(declare-fun array_inv!11297 (array!32239) Bool)

(assert (=> start!45414 (array_inv!11297 a!3235)))

(declare-fun b!499278 () Bool)

(declare-fun res!301263 () Bool)

(assert (=> b!499278 (=> res!301263 e!292588)))

(assert (=> b!499278 (= res!301263 (or (undefined!4780 lt!226348) (not (is-Intermediate!3968 lt!226348))))))

(declare-fun b!499287 () Bool)

(declare-fun res!301271 () Bool)

(assert (=> b!499287 (=> (not res!301271) (not e!292589))))

(assert (=> b!499287 (= res!301271 (and (= (size!15865 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15865 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15865 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499288 () Bool)

(assert (=> b!499288 (= e!292587 (not e!292588))))

(declare-fun res!301262 () Bool)

(assert (=> b!499288 (=> res!301262 e!292588)))

(declare-fun lt!226347 () (_ BitVec 32))

(assert (=> b!499288 (= res!301262 (= lt!226348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226347 lt!226340 lt!226344 mask!3524)))))

(assert (=> b!499288 (= lt!226348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226345 (select (arr!15501 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499288 (= lt!226347 (toIndex!0 lt!226340 mask!3524))))

(assert (=> b!499288 (= lt!226340 (select (store (arr!15501 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499288 (= lt!226345 (toIndex!0 (select (arr!15501 a!3235) j!176) mask!3524))))

(assert (=> b!499288 (= lt!226344 (array!32240 (store (arr!15501 a!3235) i!1204 k!2280) (size!15865 a!3235)))))

(assert (=> b!499288 e!292584))

(declare-fun res!301272 () Bool)

(assert (=> b!499288 (=> (not res!301272) (not e!292584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32239 (_ BitVec 32)) Bool)

(assert (=> b!499288 (= res!301272 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226341 () Unit!14948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14948)

(assert (=> b!499288 (= lt!226341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499289 () Bool)

(declare-fun res!301266 () Bool)

(assert (=> b!499289 (=> (not res!301266) (not e!292589))))

(assert (=> b!499289 (= res!301266 (validKeyInArray!0 (select (arr!15501 a!3235) j!176)))))

(declare-fun b!499290 () Bool)

(declare-fun res!301264 () Bool)

(assert (=> b!499290 (=> (not res!301264) (not e!292589))))

(declare-fun arrayContainsKey!0 (array!32239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499290 (= res!301264 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499291 () Bool)

(declare-fun res!301274 () Bool)

(assert (=> b!499291 (=> (not res!301274) (not e!292587))))

(assert (=> b!499291 (= res!301274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499292 () Bool)

(declare-fun res!301270 () Bool)

(assert (=> b!499292 (=> (not res!301270) (not e!292587))))

(declare-datatypes ((List!9659 0))(
  ( (Nil!9656) (Cons!9655 (h!10529 (_ BitVec 64)) (t!15887 List!9659)) )
))
(declare-fun arrayNoDuplicates!0 (array!32239 (_ BitVec 32) List!9659) Bool)

(assert (=> b!499292 (= res!301270 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9656))))

(assert (= (and start!45414 res!301265) b!499287))

(assert (= (and b!499287 res!301271) b!499289))

(assert (= (and b!499289 res!301266) b!499282))

(assert (= (and b!499282 res!301267) b!499290))

(assert (= (and b!499290 res!301264) b!499281))

(assert (= (and b!499281 res!301269) b!499291))

(assert (= (and b!499291 res!301274) b!499292))

(assert (= (and b!499292 res!301270) b!499288))

(assert (= (and b!499288 res!301272) b!499284))

(assert (= (and b!499288 (not res!301262)) b!499278))

(assert (= (and b!499278 (not res!301263)) b!499279))

(assert (= (and b!499279 c!59285) b!499283))

(assert (= (and b!499279 (not c!59285)) b!499285))

(assert (= (and b!499283 res!301268) b!499286))

(assert (= (and b!499279 (not res!301273)) b!499280))

(declare-fun m!480489 () Bool)

(assert (=> b!499281 m!480489))

(declare-fun m!480491 () Bool)

(assert (=> b!499291 m!480491))

(declare-fun m!480493 () Bool)

(assert (=> b!499280 m!480493))

(declare-fun m!480495 () Bool)

(assert (=> b!499288 m!480495))

(declare-fun m!480497 () Bool)

(assert (=> b!499288 m!480497))

(declare-fun m!480499 () Bool)

(assert (=> b!499288 m!480499))

(declare-fun m!480501 () Bool)

(assert (=> b!499288 m!480501))

(assert (=> b!499288 m!480495))

(declare-fun m!480503 () Bool)

(assert (=> b!499288 m!480503))

(assert (=> b!499288 m!480495))

(declare-fun m!480505 () Bool)

(assert (=> b!499288 m!480505))

(declare-fun m!480507 () Bool)

(assert (=> b!499288 m!480507))

(declare-fun m!480509 () Bool)

(assert (=> b!499288 m!480509))

(declare-fun m!480511 () Bool)

(assert (=> b!499288 m!480511))

(declare-fun m!480513 () Bool)

(assert (=> b!499290 m!480513))

(declare-fun m!480515 () Bool)

(assert (=> b!499283 m!480515))

(assert (=> b!499283 m!480493))

(declare-fun m!480517 () Bool)

(assert (=> b!499279 m!480517))

(assert (=> b!499279 m!480495))

(assert (=> b!499284 m!480495))

(assert (=> b!499284 m!480495))

(declare-fun m!480519 () Bool)

(assert (=> b!499284 m!480519))

(declare-fun m!480521 () Bool)

(assert (=> start!45414 m!480521))

(declare-fun m!480523 () Bool)

(assert (=> start!45414 m!480523))

(assert (=> b!499289 m!480495))

(assert (=> b!499289 m!480495))

(declare-fun m!480525 () Bool)

(assert (=> b!499289 m!480525))

(declare-fun m!480527 () Bool)

(assert (=> b!499292 m!480527))

(declare-fun m!480529 () Bool)

(assert (=> b!499282 m!480529))

(push 1)

