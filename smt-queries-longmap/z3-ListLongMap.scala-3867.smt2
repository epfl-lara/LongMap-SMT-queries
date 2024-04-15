; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53196 () Bool)

(assert start!53196)

(declare-fun b!578146 () Bool)

(declare-fun res!366109 () Bool)

(declare-fun e!332472 () Bool)

(assert (=> b!578146 (=> (not res!366109) (not e!332472))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36111 0))(
  ( (array!36112 (arr!17330 (Array (_ BitVec 32) (_ BitVec 64))) (size!17695 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36111)

(assert (=> b!578146 (= res!366109 (and (= (size!17695 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17695 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17695 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578147 () Bool)

(declare-fun res!366105 () Bool)

(declare-fun e!332470 () Bool)

(assert (=> b!578147 (=> (not res!366105) (not e!332470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36111 (_ BitVec 32)) Bool)

(assert (=> b!578147 (= res!366105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366108 () Bool)

(assert (=> start!53196 (=> (not res!366108) (not e!332472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53196 (= res!366108 (validMask!0 mask!3053))))

(assert (=> start!53196 e!332472))

(assert (=> start!53196 true))

(declare-fun array_inv!13213 (array!36111) Bool)

(assert (=> start!53196 (array_inv!13213 a!2986)))

(declare-fun b!578148 () Bool)

(declare-fun res!366106 () Bool)

(assert (=> b!578148 (=> (not res!366106) (not e!332472))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578148 (= res!366106 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578149 () Bool)

(declare-fun res!366107 () Bool)

(assert (=> b!578149 (=> (not res!366107) (not e!332472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578149 (= res!366107 (validKeyInArray!0 (select (arr!17330 a!2986) j!136)))))

(declare-fun b!578150 () Bool)

(declare-fun res!366104 () Bool)

(assert (=> b!578150 (=> (not res!366104) (not e!332472))))

(assert (=> b!578150 (= res!366104 (validKeyInArray!0 k0!1786))))

(declare-fun b!578151 () Bool)

(assert (=> b!578151 (= e!332470 false)))

(declare-fun lt!264021 () Bool)

(declare-datatypes ((List!11410 0))(
  ( (Nil!11407) (Cons!11406 (h!12451 (_ BitVec 64)) (t!17629 List!11410)) )
))
(declare-fun arrayNoDuplicates!0 (array!36111 (_ BitVec 32) List!11410) Bool)

(assert (=> b!578151 (= lt!264021 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11407))))

(declare-fun b!578152 () Bool)

(assert (=> b!578152 (= e!332472 e!332470)))

(declare-fun res!366110 () Bool)

(assert (=> b!578152 (=> (not res!366110) (not e!332470))))

(declare-datatypes ((SeekEntryResult!5767 0))(
  ( (MissingZero!5767 (index!25295 (_ BitVec 32))) (Found!5767 (index!25296 (_ BitVec 32))) (Intermediate!5767 (undefined!6579 Bool) (index!25297 (_ BitVec 32)) (x!54207 (_ BitVec 32))) (Undefined!5767) (MissingVacant!5767 (index!25298 (_ BitVec 32))) )
))
(declare-fun lt!264022 () SeekEntryResult!5767)

(assert (=> b!578152 (= res!366110 (or (= lt!264022 (MissingZero!5767 i!1108)) (= lt!264022 (MissingVacant!5767 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36111 (_ BitVec 32)) SeekEntryResult!5767)

(assert (=> b!578152 (= lt!264022 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53196 res!366108) b!578146))

(assert (= (and b!578146 res!366109) b!578149))

(assert (= (and b!578149 res!366107) b!578150))

(assert (= (and b!578150 res!366104) b!578148))

(assert (= (and b!578148 res!366106) b!578152))

(assert (= (and b!578152 res!366110) b!578147))

(assert (= (and b!578147 res!366105) b!578151))

(declare-fun m!556321 () Bool)

(assert (=> b!578152 m!556321))

(declare-fun m!556323 () Bool)

(assert (=> b!578149 m!556323))

(assert (=> b!578149 m!556323))

(declare-fun m!556325 () Bool)

(assert (=> b!578149 m!556325))

(declare-fun m!556327 () Bool)

(assert (=> b!578151 m!556327))

(declare-fun m!556329 () Bool)

(assert (=> start!53196 m!556329))

(declare-fun m!556331 () Bool)

(assert (=> start!53196 m!556331))

(declare-fun m!556333 () Bool)

(assert (=> b!578147 m!556333))

(declare-fun m!556335 () Bool)

(assert (=> b!578148 m!556335))

(declare-fun m!556337 () Bool)

(assert (=> b!578150 m!556337))

(check-sat (not b!578152) (not b!578149) (not b!578147) (not start!53196) (not b!578148) (not b!578151) (not b!578150))
(check-sat)
