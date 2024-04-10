; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44692 () Bool)

(assert start!44692)

(declare-fun b!490434 () Bool)

(declare-fun res!293378 () Bool)

(declare-fun e!288306 () Bool)

(assert (=> b!490434 (=> (not res!293378) (not e!288306))))

(declare-datatypes ((array!31751 0))(
  ( (array!31752 (arr!15263 (Array (_ BitVec 32) (_ BitVec 64))) (size!15627 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31751)

(declare-datatypes ((List!9421 0))(
  ( (Nil!9418) (Cons!9417 (h!10279 (_ BitVec 64)) (t!15649 List!9421)) )
))
(declare-fun arrayNoDuplicates!0 (array!31751 (_ BitVec 32) List!9421) Bool)

(assert (=> b!490434 (= res!293378 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9418))))

(declare-fun e!288303 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!490435 () Bool)

(declare-datatypes ((SeekEntryResult!3730 0))(
  ( (MissingZero!3730 (index!17099 (_ BitVec 32))) (Found!3730 (index!17100 (_ BitVec 32))) (Intermediate!3730 (undefined!4542 Bool) (index!17101 (_ BitVec 32)) (x!46196 (_ BitVec 32))) (Undefined!3730) (MissingVacant!3730 (index!17102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31751 (_ BitVec 32)) SeekEntryResult!3730)

(assert (=> b!490435 (= e!288303 (= (seekEntryOrOpen!0 (select (arr!15263 a!3235) j!176) a!3235 mask!3524) (Found!3730 j!176)))))

(declare-fun b!490436 () Bool)

(declare-fun res!293373 () Bool)

(declare-fun e!288304 () Bool)

(assert (=> b!490436 (=> (not res!293373) (not e!288304))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490436 (= res!293373 (and (= (size!15627 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15627 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15627 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490437 () Bool)

(declare-fun res!293370 () Bool)

(assert (=> b!490437 (=> (not res!293370) (not e!288304))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490437 (= res!293370 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490438 () Bool)

(assert (=> b!490438 (= e!288304 e!288306)))

(declare-fun res!293377 () Bool)

(assert (=> b!490438 (=> (not res!293377) (not e!288306))))

(declare-fun lt!221492 () SeekEntryResult!3730)

(assert (=> b!490438 (= res!293377 (or (= lt!221492 (MissingZero!3730 i!1204)) (= lt!221492 (MissingVacant!3730 i!1204))))))

(assert (=> b!490438 (= lt!221492 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!293372 () Bool)

(assert (=> start!44692 (=> (not res!293372) (not e!288304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44692 (= res!293372 (validMask!0 mask!3524))))

(assert (=> start!44692 e!288304))

(assert (=> start!44692 true))

(declare-fun array_inv!11059 (array!31751) Bool)

(assert (=> start!44692 (array_inv!11059 a!3235)))

(declare-fun b!490439 () Bool)

(declare-fun res!293371 () Bool)

(assert (=> b!490439 (=> (not res!293371) (not e!288306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31751 (_ BitVec 32)) Bool)

(assert (=> b!490439 (= res!293371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490440 () Bool)

(declare-fun res!293376 () Bool)

(assert (=> b!490440 (=> (not res!293376) (not e!288304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490440 (= res!293376 (validKeyInArray!0 (select (arr!15263 a!3235) j!176)))))

(declare-fun b!490441 () Bool)

(assert (=> b!490441 (= e!288306 (not true))))

(declare-fun lt!221489 () (_ BitVec 32))

(declare-fun lt!221490 () SeekEntryResult!3730)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31751 (_ BitVec 32)) SeekEntryResult!3730)

(assert (=> b!490441 (= lt!221490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221489 (select (store (arr!15263 a!3235) i!1204 k!2280) j!176) (array!31752 (store (arr!15263 a!3235) i!1204 k!2280) (size!15627 a!3235)) mask!3524))))

(declare-fun lt!221491 () SeekEntryResult!3730)

(declare-fun lt!221493 () (_ BitVec 32))

(assert (=> b!490441 (= lt!221491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221493 (select (arr!15263 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490441 (= lt!221489 (toIndex!0 (select (store (arr!15263 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490441 (= lt!221493 (toIndex!0 (select (arr!15263 a!3235) j!176) mask!3524))))

(assert (=> b!490441 e!288303))

(declare-fun res!293375 () Bool)

(assert (=> b!490441 (=> (not res!293375) (not e!288303))))

(assert (=> b!490441 (= res!293375 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14406 0))(
  ( (Unit!14407) )
))
(declare-fun lt!221494 () Unit!14406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14406)

(assert (=> b!490441 (= lt!221494 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490442 () Bool)

(declare-fun res!293374 () Bool)

(assert (=> b!490442 (=> (not res!293374) (not e!288304))))

(assert (=> b!490442 (= res!293374 (validKeyInArray!0 k!2280))))

(assert (= (and start!44692 res!293372) b!490436))

(assert (= (and b!490436 res!293373) b!490440))

(assert (= (and b!490440 res!293376) b!490442))

(assert (= (and b!490442 res!293374) b!490437))

(assert (= (and b!490437 res!293370) b!490438))

(assert (= (and b!490438 res!293377) b!490439))

(assert (= (and b!490439 res!293371) b!490434))

(assert (= (and b!490434 res!293378) b!490441))

(assert (= (and b!490441 res!293375) b!490435))

(declare-fun m!470541 () Bool)

(assert (=> b!490435 m!470541))

(assert (=> b!490435 m!470541))

(declare-fun m!470543 () Bool)

(assert (=> b!490435 m!470543))

(declare-fun m!470545 () Bool)

(assert (=> b!490434 m!470545))

(declare-fun m!470547 () Bool)

(assert (=> b!490442 m!470547))

(assert (=> b!490440 m!470541))

(assert (=> b!490440 m!470541))

(declare-fun m!470549 () Bool)

(assert (=> b!490440 m!470549))

(declare-fun m!470551 () Bool)

(assert (=> b!490437 m!470551))

(declare-fun m!470553 () Bool)

(assert (=> b!490439 m!470553))

(declare-fun m!470555 () Bool)

(assert (=> b!490441 m!470555))

(assert (=> b!490441 m!470541))

(declare-fun m!470557 () Bool)

(assert (=> b!490441 m!470557))

(declare-fun m!470559 () Bool)

(assert (=> b!490441 m!470559))

(declare-fun m!470561 () Bool)

(assert (=> b!490441 m!470561))

(assert (=> b!490441 m!470561))

(declare-fun m!470563 () Bool)

(assert (=> b!490441 m!470563))

(assert (=> b!490441 m!470541))

(declare-fun m!470565 () Bool)

(assert (=> b!490441 m!470565))

(assert (=> b!490441 m!470541))

(declare-fun m!470567 () Bool)

(assert (=> b!490441 m!470567))

(assert (=> b!490441 m!470561))

(declare-fun m!470569 () Bool)

(assert (=> b!490441 m!470569))

(declare-fun m!470571 () Bool)

(assert (=> b!490438 m!470571))

(declare-fun m!470573 () Bool)

(assert (=> start!44692 m!470573))

(declare-fun m!470575 () Bool)

(assert (=> start!44692 m!470575))

(push 1)

