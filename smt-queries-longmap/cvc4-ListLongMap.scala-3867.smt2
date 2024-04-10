; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53216 () Bool)

(assert start!53216)

(declare-fun b!578459 () Bool)

(declare-fun e!332662 () Bool)

(assert (=> b!578459 (= e!332662 false)))

(declare-fun lt!264267 () Bool)

(declare-datatypes ((array!36117 0))(
  ( (array!36118 (arr!17333 (Array (_ BitVec 32) (_ BitVec 64))) (size!17697 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36117)

(declare-datatypes ((List!11374 0))(
  ( (Nil!11371) (Cons!11370 (h!12415 (_ BitVec 64)) (t!17602 List!11374)) )
))
(declare-fun arrayNoDuplicates!0 (array!36117 (_ BitVec 32) List!11374) Bool)

(assert (=> b!578459 (= lt!264267 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11371))))

(declare-fun b!578460 () Bool)

(declare-fun res!366275 () Bool)

(assert (=> b!578460 (=> (not res!366275) (not e!332662))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36117 (_ BitVec 32)) Bool)

(assert (=> b!578460 (= res!366275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578461 () Bool)

(declare-fun res!366277 () Bool)

(declare-fun e!332663 () Bool)

(assert (=> b!578461 (=> (not res!366277) (not e!332663))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578461 (= res!366277 (and (= (size!17697 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17697 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17697 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578462 () Bool)

(assert (=> b!578462 (= e!332663 e!332662)))

(declare-fun res!366280 () Bool)

(assert (=> b!578462 (=> (not res!366280) (not e!332662))))

(declare-datatypes ((SeekEntryResult!5773 0))(
  ( (MissingZero!5773 (index!25319 (_ BitVec 32))) (Found!5773 (index!25320 (_ BitVec 32))) (Intermediate!5773 (undefined!6585 Bool) (index!25321 (_ BitVec 32)) (x!54218 (_ BitVec 32))) (Undefined!5773) (MissingVacant!5773 (index!25322 (_ BitVec 32))) )
))
(declare-fun lt!264268 () SeekEntryResult!5773)

(assert (=> b!578462 (= res!366280 (or (= lt!264268 (MissingZero!5773 i!1108)) (= lt!264268 (MissingVacant!5773 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36117 (_ BitVec 32)) SeekEntryResult!5773)

(assert (=> b!578462 (= lt!264268 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!366279 () Bool)

(assert (=> start!53216 (=> (not res!366279) (not e!332663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53216 (= res!366279 (validMask!0 mask!3053))))

(assert (=> start!53216 e!332663))

(assert (=> start!53216 true))

(declare-fun array_inv!13129 (array!36117) Bool)

(assert (=> start!53216 (array_inv!13129 a!2986)))

(declare-fun b!578463 () Bool)

(declare-fun res!366276 () Bool)

(assert (=> b!578463 (=> (not res!366276) (not e!332663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578463 (= res!366276 (validKeyInArray!0 k!1786))))

(declare-fun b!578464 () Bool)

(declare-fun res!366278 () Bool)

(assert (=> b!578464 (=> (not res!366278) (not e!332663))))

(assert (=> b!578464 (= res!366278 (validKeyInArray!0 (select (arr!17333 a!2986) j!136)))))

(declare-fun b!578465 () Bool)

(declare-fun res!366281 () Bool)

(assert (=> b!578465 (=> (not res!366281) (not e!332663))))

(declare-fun arrayContainsKey!0 (array!36117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578465 (= res!366281 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53216 res!366279) b!578461))

(assert (= (and b!578461 res!366277) b!578464))

(assert (= (and b!578464 res!366278) b!578463))

(assert (= (and b!578463 res!366276) b!578465))

(assert (= (and b!578465 res!366281) b!578462))

(assert (= (and b!578462 res!366280) b!578460))

(assert (= (and b!578460 res!366275) b!578459))

(declare-fun m!557143 () Bool)

(assert (=> start!53216 m!557143))

(declare-fun m!557145 () Bool)

(assert (=> start!53216 m!557145))

(declare-fun m!557147 () Bool)

(assert (=> b!578460 m!557147))

(declare-fun m!557149 () Bool)

(assert (=> b!578464 m!557149))

(assert (=> b!578464 m!557149))

(declare-fun m!557151 () Bool)

(assert (=> b!578464 m!557151))

(declare-fun m!557153 () Bool)

(assert (=> b!578463 m!557153))

(declare-fun m!557155 () Bool)

(assert (=> b!578465 m!557155))

(declare-fun m!557157 () Bool)

(assert (=> b!578459 m!557157))

(declare-fun m!557159 () Bool)

(assert (=> b!578462 m!557159))

(push 1)

(assert (not b!578463))

(assert (not b!578462))

(assert (not b!578464))

(assert (not b!578459))

(assert (not b!578465))

(assert (not start!53216))

(assert (not b!578460))

