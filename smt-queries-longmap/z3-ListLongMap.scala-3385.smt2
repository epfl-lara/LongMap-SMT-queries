; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46710 () Bool)

(assert start!46710)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!515505 () Bool)

(declare-datatypes ((array!33032 0))(
  ( (array!33033 (arr!15884 (Array (_ BitVec 32) (_ BitVec 64))) (size!16249 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33032)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!300927 () Bool)

(declare-datatypes ((SeekEntryResult!4348 0))(
  ( (MissingZero!4348 (index!19580 (_ BitVec 32))) (Found!4348 (index!19581 (_ BitVec 32))) (Intermediate!4348 (undefined!5160 Bool) (index!19582 (_ BitVec 32)) (x!48554 (_ BitVec 32))) (Undefined!4348) (MissingVacant!4348 (index!19583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33032 (_ BitVec 32)) SeekEntryResult!4348)

(assert (=> b!515505 (= e!300927 (= (seekEntryOrOpen!0 (select (arr!15884 a!3235) j!176) a!3235 mask!3524) (Found!4348 j!176)))))

(declare-fun b!515506 () Bool)

(declare-fun res!315218 () Bool)

(declare-fun e!300929 () Bool)

(assert (=> b!515506 (=> (not res!315218) (not e!300929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33032 (_ BitVec 32)) Bool)

(assert (=> b!515506 (= res!315218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515507 () Bool)

(declare-fun e!300926 () Bool)

(assert (=> b!515507 (= e!300926 e!300929)))

(declare-fun res!315215 () Bool)

(assert (=> b!515507 (=> (not res!315215) (not e!300929))))

(declare-fun lt!235882 () SeekEntryResult!4348)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515507 (= res!315215 (or (= lt!235882 (MissingZero!4348 i!1204)) (= lt!235882 (MissingVacant!4348 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!515507 (= lt!235882 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515508 () Bool)

(declare-fun res!315219 () Bool)

(assert (=> b!515508 (=> (not res!315219) (not e!300926))))

(declare-fun arrayContainsKey!0 (array!33032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515508 (= res!315219 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515509 () Bool)

(declare-fun res!315212 () Bool)

(assert (=> b!515509 (=> (not res!315212) (not e!300926))))

(assert (=> b!515509 (= res!315212 (and (= (size!16249 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16249 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16249 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515510 () Bool)

(declare-fun res!315216 () Bool)

(declare-fun e!300928 () Bool)

(assert (=> b!515510 (=> res!315216 e!300928)))

(declare-fun lt!235884 () SeekEntryResult!4348)

(get-info :version)

(assert (=> b!515510 (= res!315216 (or (undefined!5160 lt!235884) (not ((_ is Intermediate!4348) lt!235884))))))

(declare-fun b!515511 () Bool)

(assert (=> b!515511 (= e!300928 true)))

(assert (=> b!515511 (and (bvslt (x!48554 lt!235884) #b01111111111111111111111111111110) (or (= (select (arr!15884 a!3235) (index!19582 lt!235884)) (select (arr!15884 a!3235) j!176)) (= (select (arr!15884 a!3235) (index!19582 lt!235884)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15884 a!3235) (index!19582 lt!235884)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515512 () Bool)

(declare-fun res!315220 () Bool)

(assert (=> b!515512 (=> (not res!315220) (not e!300929))))

(declare-datatypes ((List!10081 0))(
  ( (Nil!10078) (Cons!10077 (h!10975 (_ BitVec 64)) (t!16300 List!10081)) )
))
(declare-fun arrayNoDuplicates!0 (array!33032 (_ BitVec 32) List!10081) Bool)

(assert (=> b!515512 (= res!315220 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10078))))

(declare-fun b!515513 () Bool)

(assert (=> b!515513 (= e!300929 (not e!300928))))

(declare-fun res!315213 () Bool)

(assert (=> b!515513 (=> res!315213 e!300928)))

(declare-fun lt!235883 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33032 (_ BitVec 32)) SeekEntryResult!4348)

(assert (=> b!515513 (= res!315213 (= lt!235884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235883 (select (store (arr!15884 a!3235) i!1204 k0!2280) j!176) (array!33033 (store (arr!15884 a!3235) i!1204 k0!2280) (size!16249 a!3235)) mask!3524)))))

(declare-fun lt!235881 () (_ BitVec 32))

(assert (=> b!515513 (= lt!235884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235881 (select (arr!15884 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515513 (= lt!235883 (toIndex!0 (select (store (arr!15884 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515513 (= lt!235881 (toIndex!0 (select (arr!15884 a!3235) j!176) mask!3524))))

(assert (=> b!515513 e!300927))

(declare-fun res!315217 () Bool)

(assert (=> b!515513 (=> (not res!315217) (not e!300927))))

(assert (=> b!515513 (= res!315217 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15940 0))(
  ( (Unit!15941) )
))
(declare-fun lt!235885 () Unit!15940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15940)

(assert (=> b!515513 (= lt!235885 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515514 () Bool)

(declare-fun res!315221 () Bool)

(assert (=> b!515514 (=> (not res!315221) (not e!300926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515514 (= res!315221 (validKeyInArray!0 (select (arr!15884 a!3235) j!176)))))

(declare-fun b!515515 () Bool)

(declare-fun res!315211 () Bool)

(assert (=> b!515515 (=> (not res!315211) (not e!300926))))

(assert (=> b!515515 (= res!315211 (validKeyInArray!0 k0!2280))))

(declare-fun res!315214 () Bool)

(assert (=> start!46710 (=> (not res!315214) (not e!300926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46710 (= res!315214 (validMask!0 mask!3524))))

(assert (=> start!46710 e!300926))

(assert (=> start!46710 true))

(declare-fun array_inv!11767 (array!33032) Bool)

(assert (=> start!46710 (array_inv!11767 a!3235)))

(assert (= (and start!46710 res!315214) b!515509))

(assert (= (and b!515509 res!315212) b!515514))

(assert (= (and b!515514 res!315221) b!515515))

(assert (= (and b!515515 res!315211) b!515508))

(assert (= (and b!515508 res!315219) b!515507))

(assert (= (and b!515507 res!315215) b!515506))

(assert (= (and b!515506 res!315218) b!515512))

(assert (= (and b!515512 res!315220) b!515513))

(assert (= (and b!515513 res!315217) b!515505))

(assert (= (and b!515513 (not res!315213)) b!515510))

(assert (= (and b!515510 (not res!315216)) b!515511))

(declare-fun m!496411 () Bool)

(assert (=> b!515511 m!496411))

(declare-fun m!496413 () Bool)

(assert (=> b!515511 m!496413))

(declare-fun m!496415 () Bool)

(assert (=> b!515512 m!496415))

(declare-fun m!496417 () Bool)

(assert (=> b!515515 m!496417))

(declare-fun m!496419 () Bool)

(assert (=> b!515507 m!496419))

(declare-fun m!496421 () Bool)

(assert (=> b!515506 m!496421))

(assert (=> b!515505 m!496413))

(assert (=> b!515505 m!496413))

(declare-fun m!496423 () Bool)

(assert (=> b!515505 m!496423))

(assert (=> b!515514 m!496413))

(assert (=> b!515514 m!496413))

(declare-fun m!496425 () Bool)

(assert (=> b!515514 m!496425))

(declare-fun m!496427 () Bool)

(assert (=> b!515513 m!496427))

(declare-fun m!496429 () Bool)

(assert (=> b!515513 m!496429))

(assert (=> b!515513 m!496429))

(declare-fun m!496431 () Bool)

(assert (=> b!515513 m!496431))

(assert (=> b!515513 m!496413))

(declare-fun m!496433 () Bool)

(assert (=> b!515513 m!496433))

(assert (=> b!515513 m!496413))

(declare-fun m!496435 () Bool)

(assert (=> b!515513 m!496435))

(assert (=> b!515513 m!496429))

(declare-fun m!496437 () Bool)

(assert (=> b!515513 m!496437))

(assert (=> b!515513 m!496413))

(declare-fun m!496439 () Bool)

(assert (=> b!515513 m!496439))

(declare-fun m!496441 () Bool)

(assert (=> b!515513 m!496441))

(declare-fun m!496443 () Bool)

(assert (=> start!46710 m!496443))

(declare-fun m!496445 () Bool)

(assert (=> start!46710 m!496445))

(declare-fun m!496447 () Bool)

(assert (=> b!515508 m!496447))

(check-sat (not b!515515) (not b!515506) (not start!46710) (not b!515508) (not b!515513) (not b!515512) (not b!515505) (not b!515507) (not b!515514))
(check-sat)
