; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47694 () Bool)

(assert start!47694)

(declare-fun b!524348 () Bool)

(declare-fun res!321377 () Bool)

(declare-fun e!305775 () Bool)

(assert (=> b!524348 (=> (not res!321377) (not e!305775))))

(declare-datatypes ((array!33341 0))(
  ( (array!33342 (arr!16022 (Array (_ BitVec 32) (_ BitVec 64))) (size!16387 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33341)

(declare-datatypes ((List!10219 0))(
  ( (Nil!10216) (Cons!10215 (h!11146 (_ BitVec 64)) (t!16438 List!10219)) )
))
(declare-fun arrayNoDuplicates!0 (array!33341 (_ BitVec 32) List!10219) Bool)

(assert (=> b!524348 (= res!321377 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10216))))

(declare-fun b!524349 () Bool)

(declare-datatypes ((Unit!16390 0))(
  ( (Unit!16391) )
))
(declare-fun e!305773 () Unit!16390)

(declare-fun Unit!16392 () Unit!16390)

(assert (=> b!524349 (= e!305773 Unit!16392)))

(declare-fun b!524350 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4486 0))(
  ( (MissingZero!4486 (index!20156 (_ BitVec 32))) (Found!4486 (index!20157 (_ BitVec 32))) (Intermediate!4486 (undefined!5298 Bool) (index!20158 (_ BitVec 32)) (x!49150 (_ BitVec 32))) (Undefined!4486) (MissingVacant!4486 (index!20159 (_ BitVec 32))) )
))
(declare-fun lt!240576 () SeekEntryResult!4486)

(declare-fun lt!240579 () (_ BitVec 32))

(declare-fun lt!240577 () (_ BitVec 64))

(declare-fun lt!240581 () array!33341)

(declare-fun e!305774 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33341 (_ BitVec 32)) SeekEntryResult!4486)

(assert (=> b!524350 (= e!305774 (not (= lt!240576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240579 lt!240577 lt!240581 mask!3524))))))

(declare-fun b!524351 () Bool)

(declare-fun e!305777 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33341 (_ BitVec 32)) SeekEntryResult!4486)

(assert (=> b!524351 (= e!305777 (= (seekEntryOrOpen!0 (select (arr!16022 a!3235) j!176) a!3235 mask!3524) (Found!4486 j!176)))))

(declare-fun b!524352 () Bool)

(declare-fun e!305771 () Bool)

(assert (=> b!524352 (= e!305775 (not e!305771))))

(declare-fun res!321380 () Bool)

(assert (=> b!524352 (=> res!321380 e!305771)))

(declare-fun lt!240575 () (_ BitVec 32))

(assert (=> b!524352 (= res!321380 (= lt!240576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240575 lt!240577 lt!240581 mask!3524)))))

(assert (=> b!524352 (= lt!240576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240579 (select (arr!16022 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524352 (= lt!240575 (toIndex!0 lt!240577 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524352 (= lt!240577 (select (store (arr!16022 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524352 (= lt!240579 (toIndex!0 (select (arr!16022 a!3235) j!176) mask!3524))))

(assert (=> b!524352 (= lt!240581 (array!33342 (store (arr!16022 a!3235) i!1204 k0!2280) (size!16387 a!3235)))))

(assert (=> b!524352 e!305777))

(declare-fun res!321378 () Bool)

(assert (=> b!524352 (=> (not res!321378) (not e!305777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33341 (_ BitVec 32)) Bool)

(assert (=> b!524352 (= res!321378 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240582 () Unit!16390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16390)

(assert (=> b!524352 (= lt!240582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524353 () Bool)

(assert (=> b!524353 (= e!305771 e!305774)))

(declare-fun res!321379 () Bool)

(assert (=> b!524353 (=> res!321379 e!305774)))

(assert (=> b!524353 (= res!321379 (or (bvsgt #b00000000000000000000000000000000 (x!49150 lt!240576)) (bvsgt (x!49150 lt!240576) #b01111111111111111111111111111110) (bvslt lt!240579 #b00000000000000000000000000000000) (bvsge lt!240579 (size!16387 a!3235)) (bvslt (index!20158 lt!240576) #b00000000000000000000000000000000) (bvsge (index!20158 lt!240576) (size!16387 a!3235)) (not (= lt!240576 (Intermediate!4486 false (index!20158 lt!240576) (x!49150 lt!240576))))))))

(declare-fun lt!240574 () Bool)

(declare-fun lt!240580 () (_ BitVec 64))

(assert (=> b!524353 (and (or lt!240574 (= lt!240580 #b1000000000000000000000000000000000000000000000000000000000000000)) (not lt!240574) (= lt!240580 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524353 (= lt!240574 (= lt!240580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240583 () Unit!16390)

(assert (=> b!524353 (= lt!240583 e!305773)))

(declare-fun c!61794 () Bool)

(assert (=> b!524353 (= c!61794 (= lt!240580 (select (arr!16022 a!3235) j!176)))))

(assert (=> b!524353 (= lt!240580 (select (arr!16022 a!3235) (index!20158 lt!240576)))))

(assert (=> b!524353 (and (bvslt (x!49150 lt!240576) #b01111111111111111111111111111110) (let ((bdg!15564 (select (arr!16022 a!3235) (index!20158 lt!240576)))) (or (= bdg!15564 (select (arr!16022 a!3235) j!176)) (= bdg!15564 #b0000000000000000000000000000000000000000000000000000000000000000) (= bdg!15564 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!524354 () Bool)

(declare-fun res!321383 () Bool)

(declare-fun e!305778 () Bool)

(assert (=> b!524354 (=> (not res!321383) (not e!305778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524354 (= res!321383 (validKeyInArray!0 k0!2280))))

(declare-fun b!524355 () Bool)

(declare-fun Unit!16393 () Unit!16390)

(assert (=> b!524355 (= e!305773 Unit!16393)))

(declare-fun lt!240573 () Unit!16390)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16390)

(assert (=> b!524355 (= lt!240573 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240579 #b00000000000000000000000000000000 (index!20158 lt!240576) (x!49150 lt!240576) mask!3524))))

(declare-fun res!321373 () Bool)

(assert (=> b!524355 (= res!321373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240579 lt!240577 lt!240581 mask!3524) (Intermediate!4486 false (index!20158 lt!240576) (x!49150 lt!240576))))))

(declare-fun e!305772 () Bool)

(assert (=> b!524355 (=> (not res!321373) (not e!305772))))

(assert (=> b!524355 e!305772))

(declare-fun b!524357 () Bool)

(declare-fun res!321375 () Bool)

(assert (=> b!524357 (=> (not res!321375) (not e!305775))))

(assert (=> b!524357 (= res!321375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524358 () Bool)

(assert (=> b!524358 (= e!305772 false)))

(declare-fun b!524359 () Bool)

(declare-fun res!321374 () Bool)

(assert (=> b!524359 (=> (not res!321374) (not e!305778))))

(assert (=> b!524359 (= res!321374 (validKeyInArray!0 (select (arr!16022 a!3235) j!176)))))

(declare-fun b!524360 () Bool)

(declare-fun res!321382 () Bool)

(assert (=> b!524360 (=> (not res!321382) (not e!305778))))

(assert (=> b!524360 (= res!321382 (and (= (size!16387 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16387 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16387 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!321376 () Bool)

(assert (=> start!47694 (=> (not res!321376) (not e!305778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47694 (= res!321376 (validMask!0 mask!3524))))

(assert (=> start!47694 e!305778))

(assert (=> start!47694 true))

(declare-fun array_inv!11905 (array!33341) Bool)

(assert (=> start!47694 (array_inv!11905 a!3235)))

(declare-fun b!524356 () Bool)

(assert (=> b!524356 (= e!305778 e!305775)))

(declare-fun res!321372 () Bool)

(assert (=> b!524356 (=> (not res!321372) (not e!305775))))

(declare-fun lt!240578 () SeekEntryResult!4486)

(assert (=> b!524356 (= res!321372 (or (= lt!240578 (MissingZero!4486 i!1204)) (= lt!240578 (MissingVacant!4486 i!1204))))))

(assert (=> b!524356 (= lt!240578 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524361 () Bool)

(declare-fun res!321381 () Bool)

(assert (=> b!524361 (=> (not res!321381) (not e!305778))))

(declare-fun arrayContainsKey!0 (array!33341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524361 (= res!321381 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524362 () Bool)

(declare-fun res!321371 () Bool)

(assert (=> b!524362 (=> res!321371 e!305771)))

(get-info :version)

(assert (=> b!524362 (= res!321371 (or (undefined!5298 lt!240576) (not ((_ is Intermediate!4486) lt!240576))))))

(assert (= (and start!47694 res!321376) b!524360))

(assert (= (and b!524360 res!321382) b!524359))

(assert (= (and b!524359 res!321374) b!524354))

(assert (= (and b!524354 res!321383) b!524361))

(assert (= (and b!524361 res!321381) b!524356))

(assert (= (and b!524356 res!321372) b!524357))

(assert (= (and b!524357 res!321375) b!524348))

(assert (= (and b!524348 res!321377) b!524352))

(assert (= (and b!524352 res!321378) b!524351))

(assert (= (and b!524352 (not res!321380)) b!524362))

(assert (= (and b!524362 (not res!321371)) b!524353))

(assert (= (and b!524353 c!61794) b!524355))

(assert (= (and b!524353 (not c!61794)) b!524349))

(assert (= (and b!524355 res!321373) b!524358))

(assert (= (and b!524353 (not res!321379)) b!524350))

(declare-fun m!504499 () Bool)

(assert (=> b!524352 m!504499))

(declare-fun m!504501 () Bool)

(assert (=> b!524352 m!504501))

(declare-fun m!504503 () Bool)

(assert (=> b!524352 m!504503))

(declare-fun m!504505 () Bool)

(assert (=> b!524352 m!504505))

(declare-fun m!504507 () Bool)

(assert (=> b!524352 m!504507))

(declare-fun m!504509 () Bool)

(assert (=> b!524352 m!504509))

(assert (=> b!524352 m!504499))

(declare-fun m!504511 () Bool)

(assert (=> b!524352 m!504511))

(assert (=> b!524352 m!504499))

(declare-fun m!504513 () Bool)

(assert (=> b!524352 m!504513))

(declare-fun m!504515 () Bool)

(assert (=> b!524352 m!504515))

(declare-fun m!504517 () Bool)

(assert (=> b!524355 m!504517))

(declare-fun m!504519 () Bool)

(assert (=> b!524355 m!504519))

(declare-fun m!504521 () Bool)

(assert (=> b!524357 m!504521))

(assert (=> b!524351 m!504499))

(assert (=> b!524351 m!504499))

(declare-fun m!504523 () Bool)

(assert (=> b!524351 m!504523))

(assert (=> b!524350 m!504519))

(declare-fun m!504525 () Bool)

(assert (=> b!524354 m!504525))

(declare-fun m!504527 () Bool)

(assert (=> b!524348 m!504527))

(assert (=> b!524359 m!504499))

(assert (=> b!524359 m!504499))

(declare-fun m!504529 () Bool)

(assert (=> b!524359 m!504529))

(declare-fun m!504531 () Bool)

(assert (=> b!524361 m!504531))

(declare-fun m!504533 () Bool)

(assert (=> b!524356 m!504533))

(declare-fun m!504535 () Bool)

(assert (=> start!47694 m!504535))

(declare-fun m!504537 () Bool)

(assert (=> start!47694 m!504537))

(assert (=> b!524353 m!504499))

(declare-fun m!504539 () Bool)

(assert (=> b!524353 m!504539))

(check-sat (not start!47694) (not b!524348) (not b!524352) (not b!524351) (not b!524361) (not b!524357) (not b!524350) (not b!524356) (not b!524355) (not b!524359) (not b!524354))
(check-sat)
