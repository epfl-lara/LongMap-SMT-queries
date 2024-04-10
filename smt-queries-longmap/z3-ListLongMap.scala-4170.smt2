; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56818 () Bool)

(assert start!56818)

(declare-fun res!406712 () Bool)

(declare-fun e!359951 () Bool)

(assert (=> start!56818 (=> (not res!406712) (not e!359951))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56818 (= res!406712 (validMask!0 mask!3053))))

(assert (=> start!56818 e!359951))

(assert (=> start!56818 true))

(declare-datatypes ((array!38008 0))(
  ( (array!38009 (arr!18241 (Array (_ BitVec 32) (_ BitVec 64))) (size!18605 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38008)

(declare-fun array_inv!14037 (array!38008) Bool)

(assert (=> start!56818 (array_inv!14037 a!2986)))

(declare-fun b!629318 () Bool)

(declare-fun res!406716 () Bool)

(assert (=> b!629318 (=> (not res!406716) (not e!359951))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629318 (= res!406716 (validKeyInArray!0 k0!1786))))

(declare-fun b!629319 () Bool)

(declare-fun res!406724 () Bool)

(assert (=> b!629319 (=> (not res!406724) (not e!359951))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629319 (= res!406724 (validKeyInArray!0 (select (arr!18241 a!2986) j!136)))))

(declare-fun b!629320 () Bool)

(declare-fun res!406721 () Bool)

(declare-fun e!359954 () Bool)

(assert (=> b!629320 (=> (not res!406721) (not e!359954))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629320 (= res!406721 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18241 a!2986) index!984) (select (arr!18241 a!2986) j!136))) (not (= (select (arr!18241 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629321 () Bool)

(declare-fun res!406713 () Bool)

(declare-fun e!359953 () Bool)

(assert (=> b!629321 (=> (not res!406713) (not e!359953))))

(declare-datatypes ((List!12282 0))(
  ( (Nil!12279) (Cons!12278 (h!13323 (_ BitVec 64)) (t!18510 List!12282)) )
))
(declare-fun arrayNoDuplicates!0 (array!38008 (_ BitVec 32) List!12282) Bool)

(assert (=> b!629321 (= res!406713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12279))))

(declare-fun b!629322 () Bool)

(declare-fun res!406719 () Bool)

(declare-fun e!359952 () Bool)

(assert (=> b!629322 (=> (not res!406719) (not e!359952))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!290720 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6681 0))(
  ( (MissingZero!6681 (index!29008 (_ BitVec 32))) (Found!6681 (index!29009 (_ BitVec 32))) (Intermediate!6681 (undefined!7493 Bool) (index!29010 (_ BitVec 32)) (x!57745 (_ BitVec 32))) (Undefined!6681) (MissingVacant!6681 (index!29011 (_ BitVec 32))) )
))
(declare-fun lt!290721 () SeekEntryResult!6681)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38008 (_ BitVec 32)) SeekEntryResult!6681)

(assert (=> b!629322 (= res!406719 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290720 vacantSpotIndex!68 (select (arr!18241 a!2986) j!136) a!2986 mask!3053) lt!290721))))

(declare-fun b!629323 () Bool)

(assert (=> b!629323 (= e!359951 e!359953)))

(declare-fun res!406720 () Bool)

(assert (=> b!629323 (=> (not res!406720) (not e!359953))))

(declare-fun lt!290722 () SeekEntryResult!6681)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629323 (= res!406720 (or (= lt!290722 (MissingZero!6681 i!1108)) (= lt!290722 (MissingVacant!6681 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38008 (_ BitVec 32)) SeekEntryResult!6681)

(assert (=> b!629323 (= lt!290722 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629324 () Bool)

(assert (=> b!629324 (= e!359954 e!359952)))

(declare-fun res!406722 () Bool)

(assert (=> b!629324 (=> (not res!406722) (not e!359952))))

(assert (=> b!629324 (= res!406722 (and (bvsge lt!290720 #b00000000000000000000000000000000) (bvslt lt!290720 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629324 (= lt!290720 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629325 () Bool)

(declare-fun res!406717 () Bool)

(assert (=> b!629325 (=> (not res!406717) (not e!359951))))

(declare-fun arrayContainsKey!0 (array!38008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629325 (= res!406717 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629326 () Bool)

(assert (=> b!629326 (= e!359953 e!359954)))

(declare-fun res!406715 () Bool)

(assert (=> b!629326 (=> (not res!406715) (not e!359954))))

(assert (=> b!629326 (= res!406715 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18241 a!2986) j!136) a!2986 mask!3053) lt!290721))))

(assert (=> b!629326 (= lt!290721 (Found!6681 j!136))))

(declare-fun b!629327 () Bool)

(declare-fun res!406718 () Bool)

(assert (=> b!629327 (=> (not res!406718) (not e!359953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38008 (_ BitVec 32)) Bool)

(assert (=> b!629327 (= res!406718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629328 () Bool)

(declare-fun res!406723 () Bool)

(assert (=> b!629328 (=> (not res!406723) (not e!359953))))

(assert (=> b!629328 (= res!406723 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18241 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18241 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629329 () Bool)

(declare-fun res!406714 () Bool)

(assert (=> b!629329 (=> (not res!406714) (not e!359951))))

(assert (=> b!629329 (= res!406714 (and (= (size!18605 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18605 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18605 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629330 () Bool)

(assert (=> b!629330 (= e!359952 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!910)) (bvsub #b01111111111111111111111111111110 x!910)))))

(assert (= (and start!56818 res!406712) b!629329))

(assert (= (and b!629329 res!406714) b!629319))

(assert (= (and b!629319 res!406724) b!629318))

(assert (= (and b!629318 res!406716) b!629325))

(assert (= (and b!629325 res!406717) b!629323))

(assert (= (and b!629323 res!406720) b!629327))

(assert (= (and b!629327 res!406718) b!629321))

(assert (= (and b!629321 res!406713) b!629328))

(assert (= (and b!629328 res!406723) b!629326))

(assert (= (and b!629326 res!406715) b!629320))

(assert (= (and b!629320 res!406721) b!629324))

(assert (= (and b!629324 res!406722) b!629322))

(assert (= (and b!629322 res!406719) b!629330))

(declare-fun m!604325 () Bool)

(assert (=> b!629323 m!604325))

(declare-fun m!604327 () Bool)

(assert (=> b!629327 m!604327))

(declare-fun m!604329 () Bool)

(assert (=> b!629328 m!604329))

(declare-fun m!604331 () Bool)

(assert (=> b!629328 m!604331))

(declare-fun m!604333 () Bool)

(assert (=> b!629328 m!604333))

(declare-fun m!604335 () Bool)

(assert (=> b!629318 m!604335))

(declare-fun m!604337 () Bool)

(assert (=> b!629321 m!604337))

(declare-fun m!604339 () Bool)

(assert (=> b!629324 m!604339))

(declare-fun m!604341 () Bool)

(assert (=> b!629319 m!604341))

(assert (=> b!629319 m!604341))

(declare-fun m!604343 () Bool)

(assert (=> b!629319 m!604343))

(assert (=> b!629322 m!604341))

(assert (=> b!629322 m!604341))

(declare-fun m!604345 () Bool)

(assert (=> b!629322 m!604345))

(declare-fun m!604347 () Bool)

(assert (=> b!629325 m!604347))

(declare-fun m!604349 () Bool)

(assert (=> start!56818 m!604349))

(declare-fun m!604351 () Bool)

(assert (=> start!56818 m!604351))

(assert (=> b!629326 m!604341))

(assert (=> b!629326 m!604341))

(declare-fun m!604353 () Bool)

(assert (=> b!629326 m!604353))

(declare-fun m!604355 () Bool)

(assert (=> b!629320 m!604355))

(assert (=> b!629320 m!604341))

(check-sat (not b!629326) (not b!629324) (not b!629319) (not b!629323) (not b!629321) (not b!629318) (not b!629322) (not b!629327) (not start!56818) (not b!629325))
(check-sat)
