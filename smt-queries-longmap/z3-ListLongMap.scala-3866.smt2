; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53208 () Bool)

(assert start!53208)

(declare-fun b!578375 () Bool)

(declare-fun res!366193 () Bool)

(declare-fun e!332626 () Bool)

(assert (=> b!578375 (=> (not res!366193) (not e!332626))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36109 0))(
  ( (array!36110 (arr!17329 (Array (_ BitVec 32) (_ BitVec 64))) (size!17693 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36109)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578375 (= res!366193 (and (= (size!17693 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17693 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17693 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578376 () Bool)

(declare-fun res!366196 () Bool)

(assert (=> b!578376 (=> (not res!366196) (not e!332626))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578376 (= res!366196 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578377 () Bool)

(declare-fun res!366191 () Bool)

(assert (=> b!578377 (=> (not res!366191) (not e!332626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578377 (= res!366191 (validKeyInArray!0 (select (arr!17329 a!2986) j!136)))))

(declare-fun b!578378 () Bool)

(declare-fun e!332627 () Bool)

(assert (=> b!578378 (= e!332627 false)))

(declare-fun lt!264243 () Bool)

(declare-datatypes ((List!11370 0))(
  ( (Nil!11367) (Cons!11366 (h!12411 (_ BitVec 64)) (t!17598 List!11370)) )
))
(declare-fun arrayNoDuplicates!0 (array!36109 (_ BitVec 32) List!11370) Bool)

(assert (=> b!578378 (= lt!264243 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11367))))

(declare-fun res!366192 () Bool)

(assert (=> start!53208 (=> (not res!366192) (not e!332626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53208 (= res!366192 (validMask!0 mask!3053))))

(assert (=> start!53208 e!332626))

(assert (=> start!53208 true))

(declare-fun array_inv!13125 (array!36109) Bool)

(assert (=> start!53208 (array_inv!13125 a!2986)))

(declare-fun b!578379 () Bool)

(declare-fun res!366195 () Bool)

(assert (=> b!578379 (=> (not res!366195) (not e!332627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36109 (_ BitVec 32)) Bool)

(assert (=> b!578379 (= res!366195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578380 () Bool)

(declare-fun res!366197 () Bool)

(assert (=> b!578380 (=> (not res!366197) (not e!332626))))

(assert (=> b!578380 (= res!366197 (validKeyInArray!0 k0!1786))))

(declare-fun b!578381 () Bool)

(assert (=> b!578381 (= e!332626 e!332627)))

(declare-fun res!366194 () Bool)

(assert (=> b!578381 (=> (not res!366194) (not e!332627))))

(declare-datatypes ((SeekEntryResult!5769 0))(
  ( (MissingZero!5769 (index!25303 (_ BitVec 32))) (Found!5769 (index!25304 (_ BitVec 32))) (Intermediate!5769 (undefined!6581 Bool) (index!25305 (_ BitVec 32)) (x!54206 (_ BitVec 32))) (Undefined!5769) (MissingVacant!5769 (index!25306 (_ BitVec 32))) )
))
(declare-fun lt!264244 () SeekEntryResult!5769)

(assert (=> b!578381 (= res!366194 (or (= lt!264244 (MissingZero!5769 i!1108)) (= lt!264244 (MissingVacant!5769 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36109 (_ BitVec 32)) SeekEntryResult!5769)

(assert (=> b!578381 (= lt!264244 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53208 res!366192) b!578375))

(assert (= (and b!578375 res!366193) b!578377))

(assert (= (and b!578377 res!366191) b!578380))

(assert (= (and b!578380 res!366197) b!578376))

(assert (= (and b!578376 res!366196) b!578381))

(assert (= (and b!578381 res!366194) b!578379))

(assert (= (and b!578379 res!366195) b!578378))

(declare-fun m!557071 () Bool)

(assert (=> b!578377 m!557071))

(assert (=> b!578377 m!557071))

(declare-fun m!557073 () Bool)

(assert (=> b!578377 m!557073))

(declare-fun m!557075 () Bool)

(assert (=> b!578379 m!557075))

(declare-fun m!557077 () Bool)

(assert (=> start!53208 m!557077))

(declare-fun m!557079 () Bool)

(assert (=> start!53208 m!557079))

(declare-fun m!557081 () Bool)

(assert (=> b!578376 m!557081))

(declare-fun m!557083 () Bool)

(assert (=> b!578378 m!557083))

(declare-fun m!557085 () Bool)

(assert (=> b!578381 m!557085))

(declare-fun m!557087 () Bool)

(assert (=> b!578380 m!557087))

(check-sat (not b!578381) (not b!578380) (not b!578376) (not b!578379) (not b!578377) (not b!578378) (not start!53208))
(check-sat)
