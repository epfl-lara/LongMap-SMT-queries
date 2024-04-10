; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44690 () Bool)

(assert start!44690)

(declare-fun b!490407 () Bool)

(declare-fun e!288291 () Bool)

(declare-fun e!288292 () Bool)

(assert (=> b!490407 (= e!288291 e!288292)))

(declare-fun res!293343 () Bool)

(assert (=> b!490407 (=> (not res!293343) (not e!288292))))

(declare-datatypes ((SeekEntryResult!3729 0))(
  ( (MissingZero!3729 (index!17095 (_ BitVec 32))) (Found!3729 (index!17096 (_ BitVec 32))) (Intermediate!3729 (undefined!4541 Bool) (index!17097 (_ BitVec 32)) (x!46195 (_ BitVec 32))) (Undefined!3729) (MissingVacant!3729 (index!17098 (_ BitVec 32))) )
))
(declare-fun lt!221473 () SeekEntryResult!3729)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490407 (= res!293343 (or (= lt!221473 (MissingZero!3729 i!1204)) (= lt!221473 (MissingVacant!3729 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31749 0))(
  ( (array!31750 (arr!15262 (Array (_ BitVec 32) (_ BitVec 64))) (size!15626 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31749)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31749 (_ BitVec 32)) SeekEntryResult!3729)

(assert (=> b!490407 (= lt!221473 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490408 () Bool)

(declare-fun res!293346 () Bool)

(assert (=> b!490408 (=> (not res!293346) (not e!288292))))

(declare-datatypes ((List!9420 0))(
  ( (Nil!9417) (Cons!9416 (h!10278 (_ BitVec 64)) (t!15648 List!9420)) )
))
(declare-fun arrayNoDuplicates!0 (array!31749 (_ BitVec 32) List!9420) Bool)

(assert (=> b!490408 (= res!293346 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9417))))

(declare-fun res!293348 () Bool)

(assert (=> start!44690 (=> (not res!293348) (not e!288291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44690 (= res!293348 (validMask!0 mask!3524))))

(assert (=> start!44690 e!288291))

(assert (=> start!44690 true))

(declare-fun array_inv!11058 (array!31749) Bool)

(assert (=> start!44690 (array_inv!11058 a!3235)))

(declare-fun b!490409 () Bool)

(declare-fun res!293344 () Bool)

(assert (=> b!490409 (=> (not res!293344) (not e!288291))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490409 (= res!293344 (and (= (size!15626 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15626 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15626 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490410 () Bool)

(assert (=> b!490410 (= e!288292 (not true))))

(declare-fun lt!221474 () SeekEntryResult!3729)

(declare-fun lt!221475 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31749 (_ BitVec 32)) SeekEntryResult!3729)

(assert (=> b!490410 (= lt!221474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221475 (select (store (arr!15262 a!3235) i!1204 k0!2280) j!176) (array!31750 (store (arr!15262 a!3235) i!1204 k0!2280) (size!15626 a!3235)) mask!3524))))

(declare-fun lt!221476 () SeekEntryResult!3729)

(declare-fun lt!221472 () (_ BitVec 32))

(assert (=> b!490410 (= lt!221476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221472 (select (arr!15262 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490410 (= lt!221475 (toIndex!0 (select (store (arr!15262 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490410 (= lt!221472 (toIndex!0 (select (arr!15262 a!3235) j!176) mask!3524))))

(declare-fun e!288294 () Bool)

(assert (=> b!490410 e!288294))

(declare-fun res!293345 () Bool)

(assert (=> b!490410 (=> (not res!293345) (not e!288294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31749 (_ BitVec 32)) Bool)

(assert (=> b!490410 (= res!293345 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14404 0))(
  ( (Unit!14405) )
))
(declare-fun lt!221471 () Unit!14404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14404)

(assert (=> b!490410 (= lt!221471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490411 () Bool)

(declare-fun res!293349 () Bool)

(assert (=> b!490411 (=> (not res!293349) (not e!288291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490411 (= res!293349 (validKeyInArray!0 k0!2280))))

(declare-fun b!490412 () Bool)

(declare-fun res!293350 () Bool)

(assert (=> b!490412 (=> (not res!293350) (not e!288291))))

(assert (=> b!490412 (= res!293350 (validKeyInArray!0 (select (arr!15262 a!3235) j!176)))))

(declare-fun b!490413 () Bool)

(declare-fun res!293351 () Bool)

(assert (=> b!490413 (=> (not res!293351) (not e!288291))))

(declare-fun arrayContainsKey!0 (array!31749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490413 (= res!293351 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490414 () Bool)

(assert (=> b!490414 (= e!288294 (= (seekEntryOrOpen!0 (select (arr!15262 a!3235) j!176) a!3235 mask!3524) (Found!3729 j!176)))))

(declare-fun b!490415 () Bool)

(declare-fun res!293347 () Bool)

(assert (=> b!490415 (=> (not res!293347) (not e!288292))))

(assert (=> b!490415 (= res!293347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44690 res!293348) b!490409))

(assert (= (and b!490409 res!293344) b!490412))

(assert (= (and b!490412 res!293350) b!490411))

(assert (= (and b!490411 res!293349) b!490413))

(assert (= (and b!490413 res!293351) b!490407))

(assert (= (and b!490407 res!293343) b!490415))

(assert (= (and b!490415 res!293347) b!490408))

(assert (= (and b!490408 res!293346) b!490410))

(assert (= (and b!490410 res!293345) b!490414))

(declare-fun m!470505 () Bool)

(assert (=> b!490411 m!470505))

(declare-fun m!470507 () Bool)

(assert (=> start!44690 m!470507))

(declare-fun m!470509 () Bool)

(assert (=> start!44690 m!470509))

(declare-fun m!470511 () Bool)

(assert (=> b!490415 m!470511))

(declare-fun m!470513 () Bool)

(assert (=> b!490410 m!470513))

(declare-fun m!470515 () Bool)

(assert (=> b!490410 m!470515))

(declare-fun m!470517 () Bool)

(assert (=> b!490410 m!470517))

(declare-fun m!470519 () Bool)

(assert (=> b!490410 m!470519))

(assert (=> b!490410 m!470513))

(declare-fun m!470521 () Bool)

(assert (=> b!490410 m!470521))

(declare-fun m!470523 () Bool)

(assert (=> b!490410 m!470523))

(assert (=> b!490410 m!470521))

(declare-fun m!470525 () Bool)

(assert (=> b!490410 m!470525))

(assert (=> b!490410 m!470521))

(declare-fun m!470527 () Bool)

(assert (=> b!490410 m!470527))

(assert (=> b!490410 m!470513))

(declare-fun m!470529 () Bool)

(assert (=> b!490410 m!470529))

(assert (=> b!490414 m!470521))

(assert (=> b!490414 m!470521))

(declare-fun m!470531 () Bool)

(assert (=> b!490414 m!470531))

(assert (=> b!490412 m!470521))

(assert (=> b!490412 m!470521))

(declare-fun m!470533 () Bool)

(assert (=> b!490412 m!470533))

(declare-fun m!470535 () Bool)

(assert (=> b!490407 m!470535))

(declare-fun m!470537 () Bool)

(assert (=> b!490408 m!470537))

(declare-fun m!470539 () Bool)

(assert (=> b!490413 m!470539))

(check-sat (not b!490413) (not b!490407) (not b!490410) (not b!490414) (not b!490411) (not b!490415) (not b!490412) (not start!44690) (not b!490408))
(check-sat)
