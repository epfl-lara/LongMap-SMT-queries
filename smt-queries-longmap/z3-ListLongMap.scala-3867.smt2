; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53262 () Bool)

(assert start!53262)

(declare-fun b!578617 () Bool)

(declare-fun e!332775 () Bool)

(declare-fun e!332773 () Bool)

(assert (=> b!578617 (= e!332775 e!332773)))

(declare-fun res!366329 () Bool)

(assert (=> b!578617 (=> (not res!366329) (not e!332773))))

(declare-datatypes ((SeekEntryResult!5722 0))(
  ( (MissingZero!5722 (index!25115 (_ BitVec 32))) (Found!5722 (index!25116 (_ BitVec 32))) (Intermediate!5722 (undefined!6534 Bool) (index!25117 (_ BitVec 32)) (x!54170 (_ BitVec 32))) (Undefined!5722) (MissingVacant!5722 (index!25118 (_ BitVec 32))) )
))
(declare-fun lt!264367 () SeekEntryResult!5722)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578617 (= res!366329 (or (= lt!264367 (MissingZero!5722 i!1108)) (= lt!264367 (MissingVacant!5722 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36108 0))(
  ( (array!36109 (arr!17326 (Array (_ BitVec 32) (_ BitVec 64))) (size!17690 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36108)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36108 (_ BitVec 32)) SeekEntryResult!5722)

(assert (=> b!578617 (= lt!264367 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578618 () Bool)

(declare-fun res!366332 () Bool)

(assert (=> b!578618 (=> (not res!366332) (not e!332775))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578618 (= res!366332 (and (= (size!17690 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17690 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17690 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578619 () Bool)

(assert (=> b!578619 (= e!332773 false)))

(declare-fun lt!264366 () Bool)

(declare-datatypes ((List!11274 0))(
  ( (Nil!11271) (Cons!11270 (h!12318 (_ BitVec 64)) (t!17494 List!11274)) )
))
(declare-fun arrayNoDuplicates!0 (array!36108 (_ BitVec 32) List!11274) Bool)

(assert (=> b!578619 (= lt!264366 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11271))))

(declare-fun b!578620 () Bool)

(declare-fun res!366334 () Bool)

(assert (=> b!578620 (=> (not res!366334) (not e!332773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36108 (_ BitVec 32)) Bool)

(assert (=> b!578620 (= res!366334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366328 () Bool)

(assert (=> start!53262 (=> (not res!366328) (not e!332775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53262 (= res!366328 (validMask!0 mask!3053))))

(assert (=> start!53262 e!332775))

(assert (=> start!53262 true))

(declare-fun array_inv!13185 (array!36108) Bool)

(assert (=> start!53262 (array_inv!13185 a!2986)))

(declare-fun b!578621 () Bool)

(declare-fun res!366331 () Bool)

(assert (=> b!578621 (=> (not res!366331) (not e!332775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578621 (= res!366331 (validKeyInArray!0 k0!1786))))

(declare-fun b!578622 () Bool)

(declare-fun res!366333 () Bool)

(assert (=> b!578622 (=> (not res!366333) (not e!332775))))

(declare-fun arrayContainsKey!0 (array!36108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578622 (= res!366333 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578623 () Bool)

(declare-fun res!366330 () Bool)

(assert (=> b!578623 (=> (not res!366330) (not e!332775))))

(assert (=> b!578623 (= res!366330 (validKeyInArray!0 (select (arr!17326 a!2986) j!136)))))

(assert (= (and start!53262 res!366328) b!578618))

(assert (= (and b!578618 res!366332) b!578623))

(assert (= (and b!578623 res!366330) b!578621))

(assert (= (and b!578621 res!366331) b!578622))

(assert (= (and b!578622 res!366333) b!578617))

(assert (= (and b!578617 res!366329) b!578620))

(assert (= (and b!578620 res!366334) b!578619))

(declare-fun m!557459 () Bool)

(assert (=> b!578620 m!557459))

(declare-fun m!557461 () Bool)

(assert (=> b!578617 m!557461))

(declare-fun m!557463 () Bool)

(assert (=> b!578623 m!557463))

(assert (=> b!578623 m!557463))

(declare-fun m!557465 () Bool)

(assert (=> b!578623 m!557465))

(declare-fun m!557467 () Bool)

(assert (=> b!578621 m!557467))

(declare-fun m!557469 () Bool)

(assert (=> start!53262 m!557469))

(declare-fun m!557471 () Bool)

(assert (=> start!53262 m!557471))

(declare-fun m!557473 () Bool)

(assert (=> b!578619 m!557473))

(declare-fun m!557475 () Bool)

(assert (=> b!578622 m!557475))

(check-sat (not b!578617) (not b!578619) (not b!578623) (not start!53262) (not b!578621) (not b!578620) (not b!578622))
(check-sat)
