; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45828 () Bool)

(assert start!45828)

(declare-fun b!507445 () Bool)

(declare-fun res!308414 () Bool)

(declare-fun e!296967 () Bool)

(assert (=> b!507445 (=> (not res!308414) (not e!296967))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32584 0))(
  ( (array!32585 (arr!15672 (Array (_ BitVec 32) (_ BitVec 64))) (size!16036 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32584)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507445 (= res!308414 (and (= (size!16036 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16036 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16036 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507446 () Bool)

(declare-fun e!296968 () Bool)

(declare-fun e!296965 () Bool)

(assert (=> b!507446 (= e!296968 e!296965)))

(declare-fun res!308412 () Bool)

(assert (=> b!507446 (=> res!308412 e!296965)))

(declare-fun lt!231733 () Bool)

(declare-datatypes ((SeekEntryResult!4139 0))(
  ( (MissingZero!4139 (index!18744 (_ BitVec 32))) (Found!4139 (index!18745 (_ BitVec 32))) (Intermediate!4139 (undefined!4951 Bool) (index!18746 (_ BitVec 32)) (x!47740 (_ BitVec 32))) (Undefined!4139) (MissingVacant!4139 (index!18747 (_ BitVec 32))) )
))
(declare-fun lt!231731 () SeekEntryResult!4139)

(assert (=> b!507446 (= res!308412 (or (and (not lt!231733) (undefined!4951 lt!231731)) (and (not lt!231733) (not (undefined!4951 lt!231731)))))))

(assert (=> b!507446 (= lt!231733 (not (is-Intermediate!4139 lt!231731)))))

(declare-fun b!507447 () Bool)

(declare-fun res!308413 () Bool)

(declare-fun e!296966 () Bool)

(assert (=> b!507447 (=> (not res!308413) (not e!296966))))

(declare-datatypes ((List!9830 0))(
  ( (Nil!9827) (Cons!9826 (h!10703 (_ BitVec 64)) (t!16058 List!9830)) )
))
(declare-fun arrayNoDuplicates!0 (array!32584 (_ BitVec 32) List!9830) Bool)

(assert (=> b!507447 (= res!308413 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9827))))

(declare-fun b!507448 () Bool)

(declare-fun res!308405 () Bool)

(assert (=> b!507448 (=> (not res!308405) (not e!296967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507448 (= res!308405 (validKeyInArray!0 (select (arr!15672 a!3235) j!176)))))

(declare-fun b!507449 () Bool)

(declare-fun res!308406 () Bool)

(assert (=> b!507449 (=> (not res!308406) (not e!296967))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507449 (= res!308406 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507450 () Bool)

(declare-fun res!308407 () Bool)

(assert (=> b!507450 (=> (not res!308407) (not e!296967))))

(assert (=> b!507450 (= res!308407 (validKeyInArray!0 k!2280))))

(declare-fun b!507451 () Bool)

(declare-fun res!308411 () Bool)

(assert (=> b!507451 (=> (not res!308411) (not e!296966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32584 (_ BitVec 32)) Bool)

(assert (=> b!507451 (= res!308411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507452 () Bool)

(assert (=> b!507452 (= e!296966 (not e!296968))))

(declare-fun res!308409 () Bool)

(assert (=> b!507452 (=> res!308409 e!296968)))

(declare-fun lt!231730 () array!32584)

(declare-fun lt!231735 () (_ BitVec 32))

(declare-fun lt!231729 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32584 (_ BitVec 32)) SeekEntryResult!4139)

(assert (=> b!507452 (= res!308409 (= lt!231731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231735 lt!231729 lt!231730 mask!3524)))))

(declare-fun lt!231736 () (_ BitVec 32))

(assert (=> b!507452 (= lt!231731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231736 (select (arr!15672 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507452 (= lt!231735 (toIndex!0 lt!231729 mask!3524))))

(assert (=> b!507452 (= lt!231729 (select (store (arr!15672 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507452 (= lt!231736 (toIndex!0 (select (arr!15672 a!3235) j!176) mask!3524))))

(assert (=> b!507452 (= lt!231730 (array!32585 (store (arr!15672 a!3235) i!1204 k!2280) (size!16036 a!3235)))))

(declare-fun e!296969 () Bool)

(assert (=> b!507452 e!296969))

(declare-fun res!308410 () Bool)

(assert (=> b!507452 (=> (not res!308410) (not e!296969))))

(assert (=> b!507452 (= res!308410 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15566 0))(
  ( (Unit!15567) )
))
(declare-fun lt!231734 () Unit!15566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15566)

(assert (=> b!507452 (= lt!231734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507453 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32584 (_ BitVec 32)) SeekEntryResult!4139)

(assert (=> b!507453 (= e!296969 (= (seekEntryOrOpen!0 (select (arr!15672 a!3235) j!176) a!3235 mask!3524) (Found!4139 j!176)))))

(declare-fun b!507454 () Bool)

(assert (=> b!507454 (= e!296965 true)))

(declare-fun lt!231732 () SeekEntryResult!4139)

(assert (=> b!507454 (= lt!231732 (seekEntryOrOpen!0 lt!231729 lt!231730 mask!3524))))

(assert (=> b!507454 false))

(declare-fun b!507455 () Bool)

(assert (=> b!507455 (= e!296967 e!296966)))

(declare-fun res!308408 () Bool)

(assert (=> b!507455 (=> (not res!308408) (not e!296966))))

(declare-fun lt!231728 () SeekEntryResult!4139)

(assert (=> b!507455 (= res!308408 (or (= lt!231728 (MissingZero!4139 i!1204)) (= lt!231728 (MissingVacant!4139 i!1204))))))

(assert (=> b!507455 (= lt!231728 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!308404 () Bool)

(assert (=> start!45828 (=> (not res!308404) (not e!296967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45828 (= res!308404 (validMask!0 mask!3524))))

(assert (=> start!45828 e!296967))

(assert (=> start!45828 true))

(declare-fun array_inv!11468 (array!32584) Bool)

(assert (=> start!45828 (array_inv!11468 a!3235)))

(assert (= (and start!45828 res!308404) b!507445))

(assert (= (and b!507445 res!308414) b!507448))

(assert (= (and b!507448 res!308405) b!507450))

(assert (= (and b!507450 res!308407) b!507449))

(assert (= (and b!507449 res!308406) b!507455))

(assert (= (and b!507455 res!308408) b!507451))

(assert (= (and b!507451 res!308411) b!507447))

(assert (= (and b!507447 res!308413) b!507452))

(assert (= (and b!507452 res!308410) b!507453))

(assert (= (and b!507452 (not res!308409)) b!507446))

(assert (= (and b!507446 (not res!308412)) b!507454))

(declare-fun m!488217 () Bool)

(assert (=> b!507450 m!488217))

(declare-fun m!488219 () Bool)

(assert (=> b!507447 m!488219))

(declare-fun m!488221 () Bool)

(assert (=> b!507451 m!488221))

(declare-fun m!488223 () Bool)

(assert (=> b!507454 m!488223))

(declare-fun m!488225 () Bool)

(assert (=> b!507448 m!488225))

(assert (=> b!507448 m!488225))

(declare-fun m!488227 () Bool)

(assert (=> b!507448 m!488227))

(declare-fun m!488229 () Bool)

(assert (=> b!507455 m!488229))

(declare-fun m!488231 () Bool)

(assert (=> start!45828 m!488231))

(declare-fun m!488233 () Bool)

(assert (=> start!45828 m!488233))

(declare-fun m!488235 () Bool)

(assert (=> b!507449 m!488235))

(declare-fun m!488237 () Bool)

(assert (=> b!507452 m!488237))

(declare-fun m!488239 () Bool)

(assert (=> b!507452 m!488239))

(declare-fun m!488241 () Bool)

(assert (=> b!507452 m!488241))

(assert (=> b!507452 m!488225))

(declare-fun m!488243 () Bool)

(assert (=> b!507452 m!488243))

(assert (=> b!507452 m!488225))

(declare-fun m!488245 () Bool)

(assert (=> b!507452 m!488245))

(declare-fun m!488247 () Bool)

(assert (=> b!507452 m!488247))

(assert (=> b!507452 m!488225))

(declare-fun m!488249 () Bool)

(assert (=> b!507452 m!488249))

(declare-fun m!488251 () Bool)

(assert (=> b!507452 m!488251))

(assert (=> b!507453 m!488225))

(assert (=> b!507453 m!488225))

(declare-fun m!488253 () Bool)

(assert (=> b!507453 m!488253))

(push 1)

