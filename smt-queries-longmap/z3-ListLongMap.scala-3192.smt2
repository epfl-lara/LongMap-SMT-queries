; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44766 () Bool)

(assert start!44766)

(declare-fun b!491333 () Bool)

(declare-fun res!294411 () Bool)

(declare-fun e!288655 () Bool)

(assert (=> b!491333 (=> (not res!294411) (not e!288655))))

(declare-datatypes ((array!31835 0))(
  ( (array!31836 (arr!15305 (Array (_ BitVec 32) (_ BitVec 64))) (size!15670 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31835)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491333 (= res!294411 (validKeyInArray!0 (select (arr!15305 a!3235) j!176)))))

(declare-fun b!491334 () Bool)

(declare-fun res!294417 () Bool)

(declare-fun e!288654 () Bool)

(assert (=> b!491334 (=> (not res!294417) (not e!288654))))

(declare-datatypes ((List!9502 0))(
  ( (Nil!9499) (Cons!9498 (h!10360 (_ BitVec 64)) (t!15721 List!9502)) )
))
(declare-fun arrayNoDuplicates!0 (array!31835 (_ BitVec 32) List!9502) Bool)

(assert (=> b!491334 (= res!294417 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9499))))

(declare-fun b!491335 () Bool)

(declare-fun res!294412 () Bool)

(assert (=> b!491335 (=> (not res!294412) (not e!288654))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31835 (_ BitVec 32)) Bool)

(assert (=> b!491335 (= res!294412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491336 () Bool)

(assert (=> b!491336 (= e!288655 e!288654)))

(declare-fun res!294414 () Bool)

(assert (=> b!491336 (=> (not res!294414) (not e!288654))))

(declare-datatypes ((SeekEntryResult!3769 0))(
  ( (MissingZero!3769 (index!17255 (_ BitVec 32))) (Found!3769 (index!17256 (_ BitVec 32))) (Intermediate!3769 (undefined!4581 Bool) (index!17257 (_ BitVec 32)) (x!46350 (_ BitVec 32))) (Undefined!3769) (MissingVacant!3769 (index!17258 (_ BitVec 32))) )
))
(declare-fun lt!222032 () SeekEntryResult!3769)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491336 (= res!294414 (or (= lt!222032 (MissingZero!3769 i!1204)) (= lt!222032 (MissingVacant!3769 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31835 (_ BitVec 32)) SeekEntryResult!3769)

(assert (=> b!491336 (= lt!222032 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491338 () Bool)

(declare-fun res!294415 () Bool)

(assert (=> b!491338 (=> (not res!294415) (not e!288655))))

(assert (=> b!491338 (= res!294415 (validKeyInArray!0 k0!2280))))

(declare-fun b!491339 () Bool)

(declare-fun res!294413 () Bool)

(assert (=> b!491339 (=> (not res!294413) (not e!288655))))

(declare-fun arrayContainsKey!0 (array!31835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491339 (= res!294413 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491340 () Bool)

(declare-fun res!294418 () Bool)

(assert (=> b!491340 (=> (not res!294418) (not e!288655))))

(assert (=> b!491340 (= res!294418 (and (= (size!15670 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15670 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15670 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491341 () Bool)

(declare-fun e!288657 () Bool)

(assert (=> b!491341 (= e!288657 true)))

(declare-fun lt!222033 () (_ BitVec 64))

(declare-fun lt!222030 () SeekEntryResult!3769)

(declare-fun lt!222031 () array!31835)

(assert (=> b!491341 (= lt!222030 (seekEntryOrOpen!0 lt!222033 lt!222031 mask!3524))))

(declare-datatypes ((Unit!14470 0))(
  ( (Unit!14471) )
))
(declare-fun lt!222034 () Unit!14470)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14470)

(assert (=> b!491341 (= lt!222034 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491337 () Bool)

(assert (=> b!491337 (= e!288654 (not e!288657))))

(declare-fun res!294419 () Bool)

(assert (=> b!491337 (=> res!294419 e!288657)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31835 (_ BitVec 32)) SeekEntryResult!3769)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491337 (= res!294419 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15305 a!3235) j!176) mask!3524) (select (arr!15305 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222033 mask!3524) lt!222033 lt!222031 mask!3524))))))

(assert (=> b!491337 (= lt!222033 (select (store (arr!15305 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491337 (= lt!222031 (array!31836 (store (arr!15305 a!3235) i!1204 k0!2280) (size!15670 a!3235)))))

(assert (=> b!491337 (= lt!222030 (Found!3769 j!176))))

(assert (=> b!491337 (= lt!222030 (seekEntryOrOpen!0 (select (arr!15305 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491337 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222029 () Unit!14470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14470)

(assert (=> b!491337 (= lt!222029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!294416 () Bool)

(assert (=> start!44766 (=> (not res!294416) (not e!288655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44766 (= res!294416 (validMask!0 mask!3524))))

(assert (=> start!44766 e!288655))

(assert (=> start!44766 true))

(declare-fun array_inv!11188 (array!31835) Bool)

(assert (=> start!44766 (array_inv!11188 a!3235)))

(assert (= (and start!44766 res!294416) b!491340))

(assert (= (and b!491340 res!294418) b!491333))

(assert (= (and b!491333 res!294411) b!491338))

(assert (= (and b!491338 res!294415) b!491339))

(assert (= (and b!491339 res!294413) b!491336))

(assert (= (and b!491336 res!294414) b!491335))

(assert (= (and b!491335 res!294412) b!491334))

(assert (= (and b!491334 res!294417) b!491337))

(assert (= (and b!491337 (not res!294419)) b!491341))

(declare-fun m!471511 () Bool)

(assert (=> b!491335 m!471511))

(declare-fun m!471513 () Bool)

(assert (=> b!491334 m!471513))

(declare-fun m!471515 () Bool)

(assert (=> b!491341 m!471515))

(declare-fun m!471517 () Bool)

(assert (=> b!491341 m!471517))

(declare-fun m!471519 () Bool)

(assert (=> b!491338 m!471519))

(declare-fun m!471521 () Bool)

(assert (=> b!491336 m!471521))

(declare-fun m!471523 () Bool)

(assert (=> b!491333 m!471523))

(assert (=> b!491333 m!471523))

(declare-fun m!471525 () Bool)

(assert (=> b!491333 m!471525))

(declare-fun m!471527 () Bool)

(assert (=> start!44766 m!471527))

(declare-fun m!471529 () Bool)

(assert (=> start!44766 m!471529))

(declare-fun m!471531 () Bool)

(assert (=> b!491337 m!471531))

(declare-fun m!471533 () Bool)

(assert (=> b!491337 m!471533))

(declare-fun m!471535 () Bool)

(assert (=> b!491337 m!471535))

(declare-fun m!471537 () Bool)

(assert (=> b!491337 m!471537))

(assert (=> b!491337 m!471523))

(declare-fun m!471539 () Bool)

(assert (=> b!491337 m!471539))

(assert (=> b!491337 m!471523))

(assert (=> b!491337 m!471537))

(assert (=> b!491337 m!471523))

(declare-fun m!471541 () Bool)

(assert (=> b!491337 m!471541))

(assert (=> b!491337 m!471523))

(declare-fun m!471543 () Bool)

(assert (=> b!491337 m!471543))

(declare-fun m!471545 () Bool)

(assert (=> b!491337 m!471545))

(declare-fun m!471547 () Bool)

(assert (=> b!491337 m!471547))

(assert (=> b!491337 m!471545))

(declare-fun m!471549 () Bool)

(assert (=> b!491339 m!471549))

(check-sat (not b!491335) (not b!491336) (not start!44766) (not b!491337) (not b!491341) (not b!491339) (not b!491338) (not b!491333) (not b!491334))
(check-sat)
