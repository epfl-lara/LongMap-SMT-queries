; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44694 () Bool)

(assert start!44694)

(declare-fun b!490352 () Bool)

(declare-fun res!293437 () Bool)

(declare-fun e!288214 () Bool)

(assert (=> b!490352 (=> (not res!293437) (not e!288214))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31763 0))(
  ( (array!31764 (arr!15269 (Array (_ BitVec 32) (_ BitVec 64))) (size!15634 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31763)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490352 (= res!293437 (and (= (size!15634 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15634 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15634 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!293433 () Bool)

(assert (=> start!44694 (=> (not res!293433) (not e!288214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44694 (= res!293433 (validMask!0 mask!3524))))

(assert (=> start!44694 e!288214))

(assert (=> start!44694 true))

(declare-fun array_inv!11152 (array!31763) Bool)

(assert (=> start!44694 (array_inv!11152 a!3235)))

(declare-fun b!490353 () Bool)

(declare-fun res!293436 () Bool)

(assert (=> b!490353 (=> (not res!293436) (not e!288214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490353 (= res!293436 (validKeyInArray!0 (select (arr!15269 a!3235) j!176)))))

(declare-fun b!490354 () Bool)

(declare-fun e!288216 () Bool)

(assert (=> b!490354 (= e!288214 e!288216)))

(declare-fun res!293434 () Bool)

(assert (=> b!490354 (=> (not res!293434) (not e!288216))))

(declare-datatypes ((SeekEntryResult!3733 0))(
  ( (MissingZero!3733 (index!17111 (_ BitVec 32))) (Found!3733 (index!17112 (_ BitVec 32))) (Intermediate!3733 (undefined!4545 Bool) (index!17113 (_ BitVec 32)) (x!46218 (_ BitVec 32))) (Undefined!3733) (MissingVacant!3733 (index!17114 (_ BitVec 32))) )
))
(declare-fun lt!221386 () SeekEntryResult!3733)

(assert (=> b!490354 (= res!293434 (or (= lt!221386 (MissingZero!3733 i!1204)) (= lt!221386 (MissingVacant!3733 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31763 (_ BitVec 32)) SeekEntryResult!3733)

(assert (=> b!490354 (= lt!221386 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490355 () Bool)

(declare-fun res!293431 () Bool)

(assert (=> b!490355 (=> (not res!293431) (not e!288216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31763 (_ BitVec 32)) Bool)

(assert (=> b!490355 (= res!293431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490356 () Bool)

(declare-fun res!293432 () Bool)

(assert (=> b!490356 (=> (not res!293432) (not e!288216))))

(declare-datatypes ((List!9466 0))(
  ( (Nil!9463) (Cons!9462 (h!10324 (_ BitVec 64)) (t!15685 List!9466)) )
))
(declare-fun arrayNoDuplicates!0 (array!31763 (_ BitVec 32) List!9466) Bool)

(assert (=> b!490356 (= res!293432 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9463))))

(declare-fun b!490357 () Bool)

(declare-fun e!288213 () Bool)

(assert (=> b!490357 (= e!288213 true)))

(declare-fun lt!221383 () array!31763)

(declare-fun lt!221385 () SeekEntryResult!3733)

(declare-fun lt!221381 () (_ BitVec 64))

(assert (=> b!490357 (= lt!221385 (seekEntryOrOpen!0 lt!221381 lt!221383 mask!3524))))

(declare-datatypes ((Unit!14398 0))(
  ( (Unit!14399) )
))
(declare-fun lt!221382 () Unit!14398)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14398)

(assert (=> b!490357 (= lt!221382 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490358 () Bool)

(declare-fun res!293430 () Bool)

(assert (=> b!490358 (=> (not res!293430) (not e!288214))))

(declare-fun arrayContainsKey!0 (array!31763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490358 (= res!293430 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490359 () Bool)

(assert (=> b!490359 (= e!288216 (not e!288213))))

(declare-fun res!293438 () Bool)

(assert (=> b!490359 (=> res!293438 e!288213)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31763 (_ BitVec 32)) SeekEntryResult!3733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490359 (= res!293438 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15269 a!3235) j!176) mask!3524) (select (arr!15269 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221381 mask!3524) lt!221381 lt!221383 mask!3524))))))

(assert (=> b!490359 (= lt!221381 (select (store (arr!15269 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490359 (= lt!221383 (array!31764 (store (arr!15269 a!3235) i!1204 k0!2280) (size!15634 a!3235)))))

(assert (=> b!490359 (= lt!221385 (Found!3733 j!176))))

(assert (=> b!490359 (= lt!221385 (seekEntryOrOpen!0 (select (arr!15269 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490359 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221384 () Unit!14398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14398)

(assert (=> b!490359 (= lt!221384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490360 () Bool)

(declare-fun res!293435 () Bool)

(assert (=> b!490360 (=> (not res!293435) (not e!288214))))

(assert (=> b!490360 (= res!293435 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44694 res!293433) b!490352))

(assert (= (and b!490352 res!293437) b!490353))

(assert (= (and b!490353 res!293436) b!490360))

(assert (= (and b!490360 res!293435) b!490358))

(assert (= (and b!490358 res!293430) b!490354))

(assert (= (and b!490354 res!293434) b!490355))

(assert (= (and b!490355 res!293431) b!490356))

(assert (= (and b!490356 res!293432) b!490359))

(assert (= (and b!490359 (not res!293438)) b!490357))

(declare-fun m!470065 () Bool)

(assert (=> b!490358 m!470065))

(declare-fun m!470067 () Bool)

(assert (=> b!490359 m!470067))

(declare-fun m!470069 () Bool)

(assert (=> b!490359 m!470069))

(declare-fun m!470071 () Bool)

(assert (=> b!490359 m!470071))

(declare-fun m!470073 () Bool)

(assert (=> b!490359 m!470073))

(declare-fun m!470075 () Bool)

(assert (=> b!490359 m!470075))

(declare-fun m!470077 () Bool)

(assert (=> b!490359 m!470077))

(declare-fun m!470079 () Bool)

(assert (=> b!490359 m!470079))

(declare-fun m!470081 () Bool)

(assert (=> b!490359 m!470081))

(assert (=> b!490359 m!470075))

(assert (=> b!490359 m!470073))

(assert (=> b!490359 m!470075))

(declare-fun m!470083 () Bool)

(assert (=> b!490359 m!470083))

(assert (=> b!490359 m!470075))

(declare-fun m!470085 () Bool)

(assert (=> b!490359 m!470085))

(assert (=> b!490359 m!470079))

(declare-fun m!470087 () Bool)

(assert (=> b!490355 m!470087))

(declare-fun m!470089 () Bool)

(assert (=> b!490354 m!470089))

(declare-fun m!470091 () Bool)

(assert (=> b!490360 m!470091))

(declare-fun m!470093 () Bool)

(assert (=> b!490356 m!470093))

(declare-fun m!470095 () Bool)

(assert (=> b!490357 m!470095))

(declare-fun m!470097 () Bool)

(assert (=> b!490357 m!470097))

(assert (=> b!490353 m!470075))

(assert (=> b!490353 m!470075))

(declare-fun m!470099 () Bool)

(assert (=> b!490353 m!470099))

(declare-fun m!470101 () Bool)

(assert (=> start!44694 m!470101))

(declare-fun m!470103 () Bool)

(assert (=> start!44694 m!470103))

(check-sat (not b!490359) (not b!490355) (not b!490353) (not b!490357) (not b!490358) (not b!490354) (not b!490356) (not start!44694) (not b!490360))
(check-sat)
