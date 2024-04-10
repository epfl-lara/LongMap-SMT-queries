; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56402 () Bool)

(assert start!56402)

(declare-fun b!625158 () Bool)

(declare-fun res!403167 () Bool)

(declare-fun e!358395 () Bool)

(assert (=> b!625158 (=> (not res!403167) (not e!358395))))

(declare-datatypes ((array!37782 0))(
  ( (array!37783 (arr!18134 (Array (_ BitVec 32) (_ BitVec 64))) (size!18498 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37782)

(declare-datatypes ((List!12175 0))(
  ( (Nil!12172) (Cons!12171 (h!13216 (_ BitVec 64)) (t!18403 List!12175)) )
))
(declare-fun arrayNoDuplicates!0 (array!37782 (_ BitVec 32) List!12175) Bool)

(assert (=> b!625158 (= res!403167 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12172))))

(declare-fun b!625159 () Bool)

(declare-fun e!358393 () Bool)

(assert (=> b!625159 (= e!358393 e!358395)))

(declare-fun res!403164 () Bool)

(assert (=> b!625159 (=> (not res!403164) (not e!358395))))

(declare-datatypes ((SeekEntryResult!6574 0))(
  ( (MissingZero!6574 (index!28580 (_ BitVec 32))) (Found!6574 (index!28581 (_ BitVec 32))) (Intermediate!6574 (undefined!7386 Bool) (index!28582 (_ BitVec 32)) (x!57332 (_ BitVec 32))) (Undefined!6574) (MissingVacant!6574 (index!28583 (_ BitVec 32))) )
))
(declare-fun lt!289774 () SeekEntryResult!6574)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625159 (= res!403164 (or (= lt!289774 (MissingZero!6574 i!1108)) (= lt!289774 (MissingVacant!6574 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37782 (_ BitVec 32)) SeekEntryResult!6574)

(assert (=> b!625159 (= lt!289774 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625160 () Bool)

(assert (=> b!625160 (= e!358395 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!289773 () SeekEntryResult!6574)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37782 (_ BitVec 32)) SeekEntryResult!6574)

(assert (=> b!625160 (= lt!289773 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18134 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625161 () Bool)

(declare-fun res!403171 () Bool)

(assert (=> b!625161 (=> (not res!403171) (not e!358395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37782 (_ BitVec 32)) Bool)

(assert (=> b!625161 (= res!403171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625162 () Bool)

(declare-fun res!403168 () Bool)

(assert (=> b!625162 (=> (not res!403168) (not e!358393))))

(assert (=> b!625162 (= res!403168 (and (= (size!18498 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18498 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18498 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625164 () Bool)

(declare-fun res!403170 () Bool)

(assert (=> b!625164 (=> (not res!403170) (not e!358393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625164 (= res!403170 (validKeyInArray!0 k!1786))))

(declare-fun b!625165 () Bool)

(declare-fun res!403172 () Bool)

(assert (=> b!625165 (=> (not res!403172) (not e!358393))))

(declare-fun arrayContainsKey!0 (array!37782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625165 (= res!403172 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625166 () Bool)

(declare-fun res!403165 () Bool)

(assert (=> b!625166 (=> (not res!403165) (not e!358393))))

(assert (=> b!625166 (= res!403165 (validKeyInArray!0 (select (arr!18134 a!2986) j!136)))))

(declare-fun res!403166 () Bool)

(assert (=> start!56402 (=> (not res!403166) (not e!358393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56402 (= res!403166 (validMask!0 mask!3053))))

(assert (=> start!56402 e!358393))

(assert (=> start!56402 true))

(declare-fun array_inv!13930 (array!37782) Bool)

(assert (=> start!56402 (array_inv!13930 a!2986)))

(declare-fun b!625163 () Bool)

(declare-fun res!403169 () Bool)

(assert (=> b!625163 (=> (not res!403169) (not e!358395))))

(assert (=> b!625163 (= res!403169 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18134 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18134 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56402 res!403166) b!625162))

(assert (= (and b!625162 res!403168) b!625166))

(assert (= (and b!625166 res!403165) b!625164))

(assert (= (and b!625164 res!403170) b!625165))

(assert (= (and b!625165 res!403172) b!625159))

(assert (= (and b!625159 res!403164) b!625161))

(assert (= (and b!625161 res!403171) b!625158))

(assert (= (and b!625158 res!403167) b!625163))

(assert (= (and b!625163 res!403169) b!625160))

(declare-fun m!600747 () Bool)

(assert (=> start!56402 m!600747))

(declare-fun m!600749 () Bool)

(assert (=> start!56402 m!600749))

(declare-fun m!600751 () Bool)

(assert (=> b!625165 m!600751))

(declare-fun m!600753 () Bool)

(assert (=> b!625158 m!600753))

(declare-fun m!600755 () Bool)

(assert (=> b!625166 m!600755))

(assert (=> b!625166 m!600755))

(declare-fun m!600757 () Bool)

(assert (=> b!625166 m!600757))

(declare-fun m!600759 () Bool)

(assert (=> b!625161 m!600759))

(declare-fun m!600761 () Bool)

(assert (=> b!625163 m!600761))

(declare-fun m!600763 () Bool)

(assert (=> b!625163 m!600763))

(declare-fun m!600765 () Bool)

(assert (=> b!625163 m!600765))

(declare-fun m!600767 () Bool)

(assert (=> b!625159 m!600767))

(declare-fun m!600769 () Bool)

(assert (=> b!625164 m!600769))

(assert (=> b!625160 m!600755))

(assert (=> b!625160 m!600755))

(declare-fun m!600771 () Bool)

(assert (=> b!625160 m!600771))

(push 1)

(assert (not start!56402))

(assert (not b!625161))

(assert (not b!625159))

(assert (not b!625164))

(assert (not b!625160))

(assert (not b!625166))

(assert (not b!625165))

(assert (not b!625158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

