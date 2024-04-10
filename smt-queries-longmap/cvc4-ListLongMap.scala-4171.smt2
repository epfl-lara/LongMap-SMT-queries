; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56826 () Bool)

(assert start!56826)

(declare-fun b!629458 () Bool)

(declare-fun res!406853 () Bool)

(declare-fun e!359995 () Bool)

(assert (=> b!629458 (=> (not res!406853) (not e!359995))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38016 0))(
  ( (array!38017 (arr!18245 (Array (_ BitVec 32) (_ BitVec 64))) (size!18609 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38016)

(assert (=> b!629458 (= res!406853 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18245 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18245 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629459 () Bool)

(declare-fun res!406855 () Bool)

(assert (=> b!629459 (=> (not res!406855) (not e!359995))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6685 0))(
  ( (MissingZero!6685 (index!29024 (_ BitVec 32))) (Found!6685 (index!29025 (_ BitVec 32))) (Intermediate!6685 (undefined!7497 Bool) (index!29026 (_ BitVec 32)) (x!57757 (_ BitVec 32))) (Undefined!6685) (MissingVacant!6685 (index!29027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38016 (_ BitVec 32)) SeekEntryResult!6685)

(assert (=> b!629459 (= res!406855 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18245 a!2986) j!136) a!2986 mask!3053) (Found!6685 j!136)))))

(declare-fun b!629460 () Bool)

(declare-fun res!406854 () Bool)

(declare-fun e!359997 () Bool)

(assert (=> b!629460 (=> (not res!406854) (not e!359997))))

(assert (=> b!629460 (= res!406854 (and (= (size!18609 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18609 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18609 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629461 () Bool)

(declare-fun res!406860 () Bool)

(assert (=> b!629461 (=> (not res!406860) (not e!359997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629461 (= res!406860 (validKeyInArray!0 k!1786))))

(declare-fun b!629462 () Bool)

(assert (=> b!629462 (= e!359995 (not true))))

(declare-fun lt!290758 () (_ BitVec 32))

(assert (=> b!629462 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290758 vacantSpotIndex!68 (select (arr!18245 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290758 vacantSpotIndex!68 (select (store (arr!18245 a!2986) i!1108 k!1786) j!136) (array!38017 (store (arr!18245 a!2986) i!1108 k!1786) (size!18609 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21112 0))(
  ( (Unit!21113) )
))
(declare-fun lt!290757 () Unit!21112)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38016 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21112)

(assert (=> b!629462 (= lt!290757 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290758 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629462 (= lt!290758 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!406858 () Bool)

(assert (=> start!56826 (=> (not res!406858) (not e!359997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56826 (= res!406858 (validMask!0 mask!3053))))

(assert (=> start!56826 e!359997))

(assert (=> start!56826 true))

(declare-fun array_inv!14041 (array!38016) Bool)

(assert (=> start!56826 (array_inv!14041 a!2986)))

(declare-fun b!629463 () Bool)

(declare-fun res!406856 () Bool)

(assert (=> b!629463 (=> (not res!406856) (not e!359997))))

(declare-fun arrayContainsKey!0 (array!38016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629463 (= res!406856 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629464 () Bool)

(declare-fun res!406852 () Bool)

(assert (=> b!629464 (=> (not res!406852) (not e!359997))))

(assert (=> b!629464 (= res!406852 (validKeyInArray!0 (select (arr!18245 a!2986) j!136)))))

(declare-fun b!629465 () Bool)

(declare-fun res!406862 () Bool)

(assert (=> b!629465 (=> (not res!406862) (not e!359995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38016 (_ BitVec 32)) Bool)

(assert (=> b!629465 (= res!406862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629466 () Bool)

(declare-fun res!406861 () Bool)

(assert (=> b!629466 (=> (not res!406861) (not e!359995))))

(assert (=> b!629466 (= res!406861 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18245 a!2986) index!984) (select (arr!18245 a!2986) j!136))) (not (= (select (arr!18245 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629467 () Bool)

(declare-fun res!406859 () Bool)

(assert (=> b!629467 (=> (not res!406859) (not e!359995))))

(declare-datatypes ((List!12286 0))(
  ( (Nil!12283) (Cons!12282 (h!13327 (_ BitVec 64)) (t!18514 List!12286)) )
))
(declare-fun arrayNoDuplicates!0 (array!38016 (_ BitVec 32) List!12286) Bool)

(assert (=> b!629467 (= res!406859 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12283))))

(declare-fun b!629468 () Bool)

(assert (=> b!629468 (= e!359997 e!359995)))

(declare-fun res!406857 () Bool)

(assert (=> b!629468 (=> (not res!406857) (not e!359995))))

(declare-fun lt!290756 () SeekEntryResult!6685)

(assert (=> b!629468 (= res!406857 (or (= lt!290756 (MissingZero!6685 i!1108)) (= lt!290756 (MissingVacant!6685 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38016 (_ BitVec 32)) SeekEntryResult!6685)

(assert (=> b!629468 (= lt!290756 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56826 res!406858) b!629460))

(assert (= (and b!629460 res!406854) b!629464))

(assert (= (and b!629464 res!406852) b!629461))

(assert (= (and b!629461 res!406860) b!629463))

(assert (= (and b!629463 res!406856) b!629468))

(assert (= (and b!629468 res!406857) b!629465))

(assert (= (and b!629465 res!406862) b!629467))

(assert (= (and b!629467 res!406859) b!629458))

(assert (= (and b!629458 res!406853) b!629459))

(assert (= (and b!629459 res!406855) b!629466))

(assert (= (and b!629466 res!406861) b!629462))

(declare-fun m!604465 () Bool)

(assert (=> b!629468 m!604465))

(declare-fun m!604467 () Bool)

(assert (=> start!56826 m!604467))

(declare-fun m!604469 () Bool)

(assert (=> start!56826 m!604469))

(declare-fun m!604471 () Bool)

(assert (=> b!629463 m!604471))

(declare-fun m!604473 () Bool)

(assert (=> b!629467 m!604473))

(declare-fun m!604475 () Bool)

(assert (=> b!629458 m!604475))

(declare-fun m!604477 () Bool)

(assert (=> b!629458 m!604477))

(declare-fun m!604479 () Bool)

(assert (=> b!629458 m!604479))

(declare-fun m!604481 () Bool)

(assert (=> b!629459 m!604481))

(assert (=> b!629459 m!604481))

(declare-fun m!604483 () Bool)

(assert (=> b!629459 m!604483))

(declare-fun m!604485 () Bool)

(assert (=> b!629466 m!604485))

(assert (=> b!629466 m!604481))

(declare-fun m!604487 () Bool)

(assert (=> b!629461 m!604487))

(declare-fun m!604489 () Bool)

(assert (=> b!629465 m!604489))

(assert (=> b!629464 m!604481))

(assert (=> b!629464 m!604481))

(declare-fun m!604491 () Bool)

(assert (=> b!629464 m!604491))

(declare-fun m!604493 () Bool)

(assert (=> b!629462 m!604493))

(assert (=> b!629462 m!604481))

(assert (=> b!629462 m!604477))

(declare-fun m!604495 () Bool)

(assert (=> b!629462 m!604495))

(assert (=> b!629462 m!604481))

(declare-fun m!604497 () Bool)

(assert (=> b!629462 m!604497))

(declare-fun m!604499 () Bool)

(assert (=> b!629462 m!604499))

(assert (=> b!629462 m!604499))

(declare-fun m!604501 () Bool)

(assert (=> b!629462 m!604501))

(push 1)

(assert (not b!629468))

