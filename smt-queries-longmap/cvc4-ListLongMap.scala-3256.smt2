; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45412 () Bool)

(assert start!45412)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32237 0))(
  ( (array!32238 (arr!15500 (Array (_ BitVec 32) (_ BitVec 64))) (size!15864 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32237)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!292559 () Bool)

(declare-fun b!499233 () Bool)

(declare-datatypes ((SeekEntryResult!3967 0))(
  ( (MissingZero!3967 (index!18050 (_ BitVec 32))) (Found!3967 (index!18051 (_ BitVec 32))) (Intermediate!3967 (undefined!4779 Bool) (index!18052 (_ BitVec 32)) (x!47092 (_ BitVec 32))) (Undefined!3967) (MissingVacant!3967 (index!18053 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32237 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!499233 (= e!292559 (= (seekEntryOrOpen!0 (select (arr!15500 a!3235) j!176) a!3235 mask!3524) (Found!3967 j!176)))))

(declare-fun b!499234 () Bool)

(declare-fun res!301226 () Bool)

(declare-fun e!292565 () Bool)

(assert (=> b!499234 (=> (not res!301226) (not e!292565))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499234 (= res!301226 (validKeyInArray!0 k!2280))))

(declare-fun b!499235 () Bool)

(declare-fun e!292564 () Bool)

(assert (=> b!499235 (= e!292564 false)))

(declare-fun b!499236 () Bool)

(declare-fun e!292566 () Bool)

(assert (=> b!499236 (= e!292565 e!292566)))

(declare-fun res!301227 () Bool)

(assert (=> b!499236 (=> (not res!301227) (not e!292566))))

(declare-fun lt!226314 () SeekEntryResult!3967)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499236 (= res!301227 (or (= lt!226314 (MissingZero!3967 i!1204)) (= lt!226314 (MissingVacant!3967 i!1204))))))

(assert (=> b!499236 (= lt!226314 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499237 () Bool)

(declare-datatypes ((Unit!14944 0))(
  ( (Unit!14945) )
))
(declare-fun e!292562 () Unit!14944)

(declare-fun Unit!14946 () Unit!14944)

(assert (=> b!499237 (= e!292562 Unit!14946)))

(declare-fun lt!226312 () SeekEntryResult!3967)

(declare-fun lt!226316 () Unit!14944)

(declare-fun lt!226318 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14944)

(assert (=> b!499237 (= lt!226316 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226318 #b00000000000000000000000000000000 (index!18052 lt!226312) (x!47092 lt!226312) mask!3524))))

(declare-fun lt!226313 () array!32237)

(declare-fun res!301223 () Bool)

(declare-fun lt!226315 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32237 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!499237 (= res!301223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226318 lt!226315 lt!226313 mask!3524) (Intermediate!3967 false (index!18052 lt!226312) (x!47092 lt!226312))))))

(assert (=> b!499237 (=> (not res!301223) (not e!292564))))

(assert (=> b!499237 e!292564))

(declare-fun res!301225 () Bool)

(assert (=> start!45412 (=> (not res!301225) (not e!292565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45412 (= res!301225 (validMask!0 mask!3524))))

(assert (=> start!45412 e!292565))

(assert (=> start!45412 true))

(declare-fun array_inv!11296 (array!32237) Bool)

(assert (=> start!45412 (array_inv!11296 a!3235)))

(declare-fun b!499238 () Bool)

(declare-fun e!292563 () Bool)

(assert (=> b!499238 (= e!292566 (not e!292563))))

(declare-fun res!301235 () Bool)

(assert (=> b!499238 (=> res!301235 e!292563)))

(declare-fun lt!226311 () (_ BitVec 32))

(assert (=> b!499238 (= res!301235 (= lt!226312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226311 lt!226315 lt!226313 mask!3524)))))

(assert (=> b!499238 (= lt!226312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226318 (select (arr!15500 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499238 (= lt!226311 (toIndex!0 lt!226315 mask!3524))))

(assert (=> b!499238 (= lt!226315 (select (store (arr!15500 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499238 (= lt!226318 (toIndex!0 (select (arr!15500 a!3235) j!176) mask!3524))))

(assert (=> b!499238 (= lt!226313 (array!32238 (store (arr!15500 a!3235) i!1204 k!2280) (size!15864 a!3235)))))

(assert (=> b!499238 e!292559))

(declare-fun res!301229 () Bool)

(assert (=> b!499238 (=> (not res!301229) (not e!292559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32237 (_ BitVec 32)) Bool)

(assert (=> b!499238 (= res!301229 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226309 () Unit!14944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14944)

(assert (=> b!499238 (= lt!226309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499239 () Bool)

(declare-fun res!301234 () Bool)

(assert (=> b!499239 (=> res!301234 e!292563)))

(assert (=> b!499239 (= res!301234 (or (undefined!4779 lt!226312) (not (is-Intermediate!3967 lt!226312))))))

(declare-fun b!499240 () Bool)

(declare-fun Unit!14947 () Unit!14944)

(assert (=> b!499240 (= e!292562 Unit!14947)))

(declare-fun b!499241 () Bool)

(declare-fun res!301233 () Bool)

(assert (=> b!499241 (=> (not res!301233) (not e!292566))))

(assert (=> b!499241 (= res!301233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499242 () Bool)

(declare-fun e!292561 () Bool)

(assert (=> b!499242 (= e!292563 e!292561)))

(declare-fun res!301228 () Bool)

(assert (=> b!499242 (=> res!301228 e!292561)))

(assert (=> b!499242 (= res!301228 (or (bvsgt #b00000000000000000000000000000000 (x!47092 lt!226312)) (bvsgt (x!47092 lt!226312) #b01111111111111111111111111111110) (bvslt lt!226318 #b00000000000000000000000000000000) (bvsge lt!226318 (size!15864 a!3235)) (bvslt (index!18052 lt!226312) #b00000000000000000000000000000000) (bvsge (index!18052 lt!226312) (size!15864 a!3235)) (not (= lt!226312 (Intermediate!3967 false (index!18052 lt!226312) (x!47092 lt!226312))))))))

(assert (=> b!499242 (and (or (= (select (arr!15500 a!3235) (index!18052 lt!226312)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15500 a!3235) (index!18052 lt!226312)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15500 a!3235) (index!18052 lt!226312)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15500 a!3235) (index!18052 lt!226312)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226310 () Unit!14944)

(assert (=> b!499242 (= lt!226310 e!292562)))

(declare-fun c!59282 () Bool)

(assert (=> b!499242 (= c!59282 (= (select (arr!15500 a!3235) (index!18052 lt!226312)) (select (arr!15500 a!3235) j!176)))))

(assert (=> b!499242 (and (bvslt (x!47092 lt!226312) #b01111111111111111111111111111110) (or (= (select (arr!15500 a!3235) (index!18052 lt!226312)) (select (arr!15500 a!3235) j!176)) (= (select (arr!15500 a!3235) (index!18052 lt!226312)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15500 a!3235) (index!18052 lt!226312)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499243 () Bool)

(declare-fun res!301224 () Bool)

(assert (=> b!499243 (=> (not res!301224) (not e!292565))))

(declare-fun arrayContainsKey!0 (array!32237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499243 (= res!301224 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499244 () Bool)

(declare-fun res!301230 () Bool)

(assert (=> b!499244 (=> (not res!301230) (not e!292566))))

(declare-datatypes ((List!9658 0))(
  ( (Nil!9655) (Cons!9654 (h!10528 (_ BitVec 64)) (t!15886 List!9658)) )
))
(declare-fun arrayNoDuplicates!0 (array!32237 (_ BitVec 32) List!9658) Bool)

(assert (=> b!499244 (= res!301230 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9655))))

(declare-fun b!499245 () Bool)

(declare-fun res!301232 () Bool)

(assert (=> b!499245 (=> (not res!301232) (not e!292565))))

(assert (=> b!499245 (= res!301232 (and (= (size!15864 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15864 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15864 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499246 () Bool)

(assert (=> b!499246 (= e!292561 true)))

(declare-fun lt!226317 () SeekEntryResult!3967)

(assert (=> b!499246 (= lt!226317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226318 lt!226315 lt!226313 mask!3524))))

(declare-fun b!499247 () Bool)

(declare-fun res!301231 () Bool)

(assert (=> b!499247 (=> (not res!301231) (not e!292565))))

(assert (=> b!499247 (= res!301231 (validKeyInArray!0 (select (arr!15500 a!3235) j!176)))))

(assert (= (and start!45412 res!301225) b!499245))

(assert (= (and b!499245 res!301232) b!499247))

(assert (= (and b!499247 res!301231) b!499234))

(assert (= (and b!499234 res!301226) b!499243))

(assert (= (and b!499243 res!301224) b!499236))

(assert (= (and b!499236 res!301227) b!499241))

(assert (= (and b!499241 res!301233) b!499244))

(assert (= (and b!499244 res!301230) b!499238))

(assert (= (and b!499238 res!301229) b!499233))

(assert (= (and b!499238 (not res!301235)) b!499239))

(assert (= (and b!499239 (not res!301234)) b!499242))

(assert (= (and b!499242 c!59282) b!499237))

(assert (= (and b!499242 (not c!59282)) b!499240))

(assert (= (and b!499237 res!301223) b!499235))

(assert (= (and b!499242 (not res!301228)) b!499246))

(declare-fun m!480447 () Bool)

(assert (=> b!499241 m!480447))

(declare-fun m!480449 () Bool)

(assert (=> b!499233 m!480449))

(assert (=> b!499233 m!480449))

(declare-fun m!480451 () Bool)

(assert (=> b!499233 m!480451))

(declare-fun m!480453 () Bool)

(assert (=> b!499242 m!480453))

(assert (=> b!499242 m!480449))

(declare-fun m!480455 () Bool)

(assert (=> b!499238 m!480455))

(declare-fun m!480457 () Bool)

(assert (=> b!499238 m!480457))

(declare-fun m!480459 () Bool)

(assert (=> b!499238 m!480459))

(assert (=> b!499238 m!480449))

(declare-fun m!480461 () Bool)

(assert (=> b!499238 m!480461))

(assert (=> b!499238 m!480449))

(declare-fun m!480463 () Bool)

(assert (=> b!499238 m!480463))

(declare-fun m!480465 () Bool)

(assert (=> b!499238 m!480465))

(declare-fun m!480467 () Bool)

(assert (=> b!499238 m!480467))

(assert (=> b!499238 m!480449))

(declare-fun m!480469 () Bool)

(assert (=> b!499238 m!480469))

(declare-fun m!480471 () Bool)

(assert (=> start!45412 m!480471))

(declare-fun m!480473 () Bool)

(assert (=> start!45412 m!480473))

(declare-fun m!480475 () Bool)

(assert (=> b!499236 m!480475))

(declare-fun m!480477 () Bool)

(assert (=> b!499237 m!480477))

(declare-fun m!480479 () Bool)

(assert (=> b!499237 m!480479))

(declare-fun m!480481 () Bool)

(assert (=> b!499244 m!480481))

(assert (=> b!499246 m!480479))

(assert (=> b!499247 m!480449))

(assert (=> b!499247 m!480449))

(declare-fun m!480483 () Bool)

(assert (=> b!499247 m!480483))

(declare-fun m!480485 () Bool)

(assert (=> b!499243 m!480485))

(declare-fun m!480487 () Bool)

(assert (=> b!499234 m!480487))

(push 1)

