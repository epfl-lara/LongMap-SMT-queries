; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45424 () Bool)

(assert start!45424)

(declare-fun b!499503 () Bool)

(declare-fun res!301466 () Bool)

(declare-fun e!292708 () Bool)

(assert (=> b!499503 (=> (not res!301466) (not e!292708))))

(declare-datatypes ((array!32249 0))(
  ( (array!32250 (arr!15506 (Array (_ BitVec 32) (_ BitVec 64))) (size!15870 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32249)

(declare-datatypes ((List!9664 0))(
  ( (Nil!9661) (Cons!9660 (h!10534 (_ BitVec 64)) (t!15892 List!9664)) )
))
(declare-fun arrayNoDuplicates!0 (array!32249 (_ BitVec 32) List!9664) Bool)

(assert (=> b!499503 (= res!301466 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9661))))

(declare-fun b!499504 () Bool)

(declare-fun res!301457 () Bool)

(declare-fun e!292704 () Bool)

(assert (=> b!499504 (=> (not res!301457) (not e!292704))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499504 (= res!301457 (and (= (size!15870 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15870 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15870 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499505 () Bool)

(declare-fun e!292705 () Bool)

(assert (=> b!499505 (= e!292708 (not e!292705))))

(declare-fun res!301461 () Bool)

(assert (=> b!499505 (=> res!301461 e!292705)))

(declare-datatypes ((SeekEntryResult!3973 0))(
  ( (MissingZero!3973 (index!18074 (_ BitVec 32))) (Found!3973 (index!18075 (_ BitVec 32))) (Intermediate!3973 (undefined!4785 Bool) (index!18076 (_ BitVec 32)) (x!47114 (_ BitVec 32))) (Undefined!3973) (MissingVacant!3973 (index!18077 (_ BitVec 32))) )
))
(declare-fun lt!226494 () SeekEntryResult!3973)

(declare-fun lt!226495 () (_ BitVec 64))

(declare-fun lt!226498 () (_ BitVec 32))

(declare-fun lt!226490 () array!32249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32249 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!499505 (= res!301461 (= lt!226494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226498 lt!226495 lt!226490 mask!3524)))))

(declare-fun lt!226496 () (_ BitVec 32))

(assert (=> b!499505 (= lt!226494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226496 (select (arr!15506 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499505 (= lt!226498 (toIndex!0 lt!226495 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!499505 (= lt!226495 (select (store (arr!15506 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499505 (= lt!226496 (toIndex!0 (select (arr!15506 a!3235) j!176) mask!3524))))

(assert (=> b!499505 (= lt!226490 (array!32250 (store (arr!15506 a!3235) i!1204 k!2280) (size!15870 a!3235)))))

(declare-fun e!292706 () Bool)

(assert (=> b!499505 e!292706))

(declare-fun res!301468 () Bool)

(assert (=> b!499505 (=> (not res!301468) (not e!292706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32249 (_ BitVec 32)) Bool)

(assert (=> b!499505 (= res!301468 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14968 0))(
  ( (Unit!14969) )
))
(declare-fun lt!226493 () Unit!14968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14968)

(assert (=> b!499505 (= lt!226493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499506 () Bool)

(declare-fun res!301462 () Bool)

(assert (=> b!499506 (=> (not res!301462) (not e!292704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499506 (= res!301462 (validKeyInArray!0 (select (arr!15506 a!3235) j!176)))))

(declare-fun b!499507 () Bool)

(declare-fun e!292703 () Bool)

(assert (=> b!499507 (= e!292705 e!292703)))

(declare-fun res!301464 () Bool)

(assert (=> b!499507 (=> res!301464 e!292703)))

(assert (=> b!499507 (= res!301464 (or (bvsgt #b00000000000000000000000000000000 (x!47114 lt!226494)) (bvsgt (x!47114 lt!226494) #b01111111111111111111111111111110) (bvslt lt!226496 #b00000000000000000000000000000000) (bvsge lt!226496 (size!15870 a!3235)) (bvslt (index!18076 lt!226494) #b00000000000000000000000000000000) (bvsge (index!18076 lt!226494) (size!15870 a!3235)) (not (= lt!226494 (Intermediate!3973 false (index!18076 lt!226494) (x!47114 lt!226494))))))))

(assert (=> b!499507 (and (or (= (select (arr!15506 a!3235) (index!18076 lt!226494)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15506 a!3235) (index!18076 lt!226494)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15506 a!3235) (index!18076 lt!226494)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15506 a!3235) (index!18076 lt!226494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226492 () Unit!14968)

(declare-fun e!292709 () Unit!14968)

(assert (=> b!499507 (= lt!226492 e!292709)))

(declare-fun c!59300 () Bool)

(assert (=> b!499507 (= c!59300 (= (select (arr!15506 a!3235) (index!18076 lt!226494)) (select (arr!15506 a!3235) j!176)))))

(assert (=> b!499507 (and (bvslt (x!47114 lt!226494) #b01111111111111111111111111111110) (or (= (select (arr!15506 a!3235) (index!18076 lt!226494)) (select (arr!15506 a!3235) j!176)) (= (select (arr!15506 a!3235) (index!18076 lt!226494)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15506 a!3235) (index!18076 lt!226494)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499508 () Bool)

(assert (=> b!499508 (= e!292704 e!292708)))

(declare-fun res!301459 () Bool)

(assert (=> b!499508 (=> (not res!301459) (not e!292708))))

(declare-fun lt!226489 () SeekEntryResult!3973)

(assert (=> b!499508 (= res!301459 (or (= lt!226489 (MissingZero!3973 i!1204)) (= lt!226489 (MissingVacant!3973 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32249 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!499508 (= lt!226489 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499509 () Bool)

(declare-fun Unit!14970 () Unit!14968)

(assert (=> b!499509 (= e!292709 Unit!14970)))

(declare-fun lt!226491 () Unit!14968)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14968)

(assert (=> b!499509 (= lt!226491 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226496 #b00000000000000000000000000000000 (index!18076 lt!226494) (x!47114 lt!226494) mask!3524))))

(declare-fun res!301467 () Bool)

(assert (=> b!499509 (= res!301467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226496 lt!226495 lt!226490 mask!3524) (Intermediate!3973 false (index!18076 lt!226494) (x!47114 lt!226494))))))

(declare-fun e!292710 () Bool)

(assert (=> b!499509 (=> (not res!301467) (not e!292710))))

(assert (=> b!499509 e!292710))

(declare-fun b!499510 () Bool)

(declare-fun res!301463 () Bool)

(assert (=> b!499510 (=> (not res!301463) (not e!292704))))

(assert (=> b!499510 (= res!301463 (validKeyInArray!0 k!2280))))

(declare-fun b!499511 () Bool)

(declare-fun Unit!14971 () Unit!14968)

(assert (=> b!499511 (= e!292709 Unit!14971)))

(declare-fun b!499512 () Bool)

(declare-fun res!301460 () Bool)

(assert (=> b!499512 (=> (not res!301460) (not e!292708))))

(assert (=> b!499512 (= res!301460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499513 () Bool)

(assert (=> b!499513 (= e!292703 true)))

(declare-fun lt!226497 () SeekEntryResult!3973)

(assert (=> b!499513 (= lt!226497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226496 lt!226495 lt!226490 mask!3524))))

(declare-fun res!301469 () Bool)

(assert (=> start!45424 (=> (not res!301469) (not e!292704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45424 (= res!301469 (validMask!0 mask!3524))))

(assert (=> start!45424 e!292704))

(assert (=> start!45424 true))

(declare-fun array_inv!11302 (array!32249) Bool)

(assert (=> start!45424 (array_inv!11302 a!3235)))

(declare-fun b!499514 () Bool)

(assert (=> b!499514 (= e!292706 (= (seekEntryOrOpen!0 (select (arr!15506 a!3235) j!176) a!3235 mask!3524) (Found!3973 j!176)))))

(declare-fun b!499515 () Bool)

(declare-fun res!301465 () Bool)

(assert (=> b!499515 (=> res!301465 e!292705)))

(assert (=> b!499515 (= res!301465 (or (undefined!4785 lt!226494) (not (is-Intermediate!3973 lt!226494))))))

(declare-fun b!499516 () Bool)

(assert (=> b!499516 (= e!292710 false)))

(declare-fun b!499517 () Bool)

(declare-fun res!301458 () Bool)

(assert (=> b!499517 (=> (not res!301458) (not e!292704))))

(declare-fun arrayContainsKey!0 (array!32249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499517 (= res!301458 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45424 res!301469) b!499504))

(assert (= (and b!499504 res!301457) b!499506))

(assert (= (and b!499506 res!301462) b!499510))

(assert (= (and b!499510 res!301463) b!499517))

(assert (= (and b!499517 res!301458) b!499508))

(assert (= (and b!499508 res!301459) b!499512))

(assert (= (and b!499512 res!301460) b!499503))

(assert (= (and b!499503 res!301466) b!499505))

(assert (= (and b!499505 res!301468) b!499514))

(assert (= (and b!499505 (not res!301461)) b!499515))

(assert (= (and b!499515 (not res!301465)) b!499507))

(assert (= (and b!499507 c!59300) b!499509))

(assert (= (and b!499507 (not c!59300)) b!499511))

(assert (= (and b!499509 res!301467) b!499516))

(assert (= (and b!499507 (not res!301464)) b!499513))

(declare-fun m!480699 () Bool)

(assert (=> start!45424 m!480699))

(declare-fun m!480701 () Bool)

(assert (=> start!45424 m!480701))

(declare-fun m!480703 () Bool)

(assert (=> b!499508 m!480703))

(declare-fun m!480705 () Bool)

(assert (=> b!499517 m!480705))

(declare-fun m!480707 () Bool)

(assert (=> b!499509 m!480707))

(declare-fun m!480709 () Bool)

(assert (=> b!499509 m!480709))

(declare-fun m!480711 () Bool)

(assert (=> b!499505 m!480711))

(declare-fun m!480713 () Bool)

(assert (=> b!499505 m!480713))

(declare-fun m!480715 () Bool)

(assert (=> b!499505 m!480715))

(declare-fun m!480717 () Bool)

(assert (=> b!499505 m!480717))

(declare-fun m!480719 () Bool)

(assert (=> b!499505 m!480719))

(assert (=> b!499505 m!480717))

(declare-fun m!480721 () Bool)

(assert (=> b!499505 m!480721))

(declare-fun m!480723 () Bool)

(assert (=> b!499505 m!480723))

(declare-fun m!480725 () Bool)

(assert (=> b!499505 m!480725))

(assert (=> b!499505 m!480717))

(declare-fun m!480727 () Bool)

(assert (=> b!499505 m!480727))

(declare-fun m!480729 () Bool)

(assert (=> b!499503 m!480729))

(assert (=> b!499513 m!480709))

(assert (=> b!499514 m!480717))

(assert (=> b!499514 m!480717))

(declare-fun m!480731 () Bool)

(assert (=> b!499514 m!480731))

(declare-fun m!480733 () Bool)

(assert (=> b!499512 m!480733))

(assert (=> b!499506 m!480717))

(assert (=> b!499506 m!480717))

(declare-fun m!480735 () Bool)

(assert (=> b!499506 m!480735))

(declare-fun m!480737 () Bool)

(assert (=> b!499507 m!480737))

(assert (=> b!499507 m!480717))

(declare-fun m!480739 () Bool)

(assert (=> b!499510 m!480739))

(push 1)

