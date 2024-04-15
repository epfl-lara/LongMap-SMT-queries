; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53202 () Bool)

(assert start!53202)

(declare-fun b!578209 () Bool)

(declare-fun res!366169 () Bool)

(declare-fun e!332498 () Bool)

(assert (=> b!578209 (=> (not res!366169) (not e!332498))))

(declare-datatypes ((array!36117 0))(
  ( (array!36118 (arr!17333 (Array (_ BitVec 32) (_ BitVec 64))) (size!17698 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36117)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36117 (_ BitVec 32)) Bool)

(assert (=> b!578209 (= res!366169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578210 () Bool)

(declare-fun res!366170 () Bool)

(declare-fun e!332497 () Bool)

(assert (=> b!578210 (=> (not res!366170) (not e!332497))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578210 (= res!366170 (and (= (size!17698 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17698 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17698 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366173 () Bool)

(assert (=> start!53202 (=> (not res!366173) (not e!332497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53202 (= res!366173 (validMask!0 mask!3053))))

(assert (=> start!53202 e!332497))

(assert (=> start!53202 true))

(declare-fun array_inv!13216 (array!36117) Bool)

(assert (=> start!53202 (array_inv!13216 a!2986)))

(declare-fun b!578211 () Bool)

(declare-fun res!366167 () Bool)

(assert (=> b!578211 (=> (not res!366167) (not e!332497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578211 (= res!366167 (validKeyInArray!0 (select (arr!17333 a!2986) j!136)))))

(declare-fun b!578212 () Bool)

(assert (=> b!578212 (= e!332497 e!332498)))

(declare-fun res!366172 () Bool)

(assert (=> b!578212 (=> (not res!366172) (not e!332498))))

(declare-datatypes ((SeekEntryResult!5770 0))(
  ( (MissingZero!5770 (index!25307 (_ BitVec 32))) (Found!5770 (index!25308 (_ BitVec 32))) (Intermediate!5770 (undefined!6582 Bool) (index!25309 (_ BitVec 32)) (x!54218 (_ BitVec 32))) (Undefined!5770) (MissingVacant!5770 (index!25310 (_ BitVec 32))) )
))
(declare-fun lt!264040 () SeekEntryResult!5770)

(assert (=> b!578212 (= res!366172 (or (= lt!264040 (MissingZero!5770 i!1108)) (= lt!264040 (MissingVacant!5770 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36117 (_ BitVec 32)) SeekEntryResult!5770)

(assert (=> b!578212 (= lt!264040 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578213 () Bool)

(declare-fun res!366168 () Bool)

(assert (=> b!578213 (=> (not res!366168) (not e!332497))))

(declare-fun arrayContainsKey!0 (array!36117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578213 (= res!366168 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578214 () Bool)

(declare-fun res!366171 () Bool)

(assert (=> b!578214 (=> (not res!366171) (not e!332497))))

(assert (=> b!578214 (= res!366171 (validKeyInArray!0 k0!1786))))

(declare-fun b!578215 () Bool)

(assert (=> b!578215 (= e!332498 false)))

(declare-fun lt!264039 () Bool)

(declare-datatypes ((List!11413 0))(
  ( (Nil!11410) (Cons!11409 (h!12454 (_ BitVec 64)) (t!17632 List!11413)) )
))
(declare-fun arrayNoDuplicates!0 (array!36117 (_ BitVec 32) List!11413) Bool)

(assert (=> b!578215 (= lt!264039 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11410))))

(assert (= (and start!53202 res!366173) b!578210))

(assert (= (and b!578210 res!366170) b!578211))

(assert (= (and b!578211 res!366167) b!578214))

(assert (= (and b!578214 res!366171) b!578213))

(assert (= (and b!578213 res!366168) b!578212))

(assert (= (and b!578212 res!366172) b!578209))

(assert (= (and b!578209 res!366169) b!578215))

(declare-fun m!556375 () Bool)

(assert (=> b!578213 m!556375))

(declare-fun m!556377 () Bool)

(assert (=> b!578212 m!556377))

(declare-fun m!556379 () Bool)

(assert (=> start!53202 m!556379))

(declare-fun m!556381 () Bool)

(assert (=> start!53202 m!556381))

(declare-fun m!556383 () Bool)

(assert (=> b!578211 m!556383))

(assert (=> b!578211 m!556383))

(declare-fun m!556385 () Bool)

(assert (=> b!578211 m!556385))

(declare-fun m!556387 () Bool)

(assert (=> b!578209 m!556387))

(declare-fun m!556389 () Bool)

(assert (=> b!578214 m!556389))

(declare-fun m!556391 () Bool)

(assert (=> b!578215 m!556391))

(check-sat (not b!578214) (not b!578215) (not b!578211) (not b!578212) (not b!578209) (not start!53202) (not b!578213))
(check-sat)
