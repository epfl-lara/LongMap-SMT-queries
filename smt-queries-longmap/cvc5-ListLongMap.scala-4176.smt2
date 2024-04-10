; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56912 () Bool)

(assert start!56912)

(declare-fun b!630130 () Bool)

(declare-fun res!407347 () Bool)

(declare-fun e!360327 () Bool)

(assert (=> b!630130 (=> (not res!407347) (not e!360327))))

(declare-datatypes ((array!38045 0))(
  ( (array!38046 (arr!18258 (Array (_ BitVec 32) (_ BitVec 64))) (size!18622 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38045)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630130 (= res!407347 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630131 () Bool)

(declare-fun e!360326 () Bool)

(declare-datatypes ((SeekEntryResult!6698 0))(
  ( (MissingZero!6698 (index!29079 (_ BitVec 32))) (Found!6698 (index!29080 (_ BitVec 32))) (Intermediate!6698 (undefined!7510 Bool) (index!29081 (_ BitVec 32)) (x!57819 (_ BitVec 32))) (Undefined!6698) (MissingVacant!6698 (index!29082 (_ BitVec 32))) )
))
(declare-fun lt!291033 () SeekEntryResult!6698)

(declare-fun lt!291034 () SeekEntryResult!6698)

(assert (=> b!630131 (= e!360326 (= lt!291033 lt!291034))))

(declare-fun res!407351 () Bool)

(assert (=> start!56912 (=> (not res!407351) (not e!360327))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56912 (= res!407351 (validMask!0 mask!3053))))

(assert (=> start!56912 e!360327))

(assert (=> start!56912 true))

(declare-fun array_inv!14054 (array!38045) Bool)

(assert (=> start!56912 (array_inv!14054 a!2986)))

(declare-fun b!630132 () Bool)

(declare-fun e!360324 () Bool)

(declare-fun e!360325 () Bool)

(assert (=> b!630132 (= e!360324 e!360325)))

(declare-fun res!407353 () Bool)

(assert (=> b!630132 (=> (not res!407353) (not e!360325))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630132 (= res!407353 (and (= lt!291033 (Found!6698 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18258 a!2986) index!984) (select (arr!18258 a!2986) j!136))) (not (= (select (arr!18258 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38045 (_ BitVec 32)) SeekEntryResult!6698)

(assert (=> b!630132 (= lt!291033 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18258 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630133 () Bool)

(declare-fun res!407344 () Bool)

(assert (=> b!630133 (=> (not res!407344) (not e!360327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630133 (= res!407344 (validKeyInArray!0 k!1786))))

(declare-fun b!630134 () Bool)

(declare-fun res!407346 () Bool)

(assert (=> b!630134 (=> (not res!407346) (not e!360327))))

(assert (=> b!630134 (= res!407346 (validKeyInArray!0 (select (arr!18258 a!2986) j!136)))))

(declare-fun b!630135 () Bool)

(declare-fun res!407354 () Bool)

(assert (=> b!630135 (=> (not res!407354) (not e!360324))))

(declare-datatypes ((List!12299 0))(
  ( (Nil!12296) (Cons!12295 (h!13340 (_ BitVec 64)) (t!18527 List!12299)) )
))
(declare-fun arrayNoDuplicates!0 (array!38045 (_ BitVec 32) List!12299) Bool)

(assert (=> b!630135 (= res!407354 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12296))))

(declare-fun b!630136 () Bool)

(assert (=> b!630136 (= e!360327 e!360324)))

(declare-fun res!407345 () Bool)

(assert (=> b!630136 (=> (not res!407345) (not e!360324))))

(declare-fun lt!291035 () SeekEntryResult!6698)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630136 (= res!407345 (or (= lt!291035 (MissingZero!6698 i!1108)) (= lt!291035 (MissingVacant!6698 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38045 (_ BitVec 32)) SeekEntryResult!6698)

(assert (=> b!630136 (= lt!291035 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630137 () Bool)

(assert (=> b!630137 (= e!360325 (not true))))

(assert (=> b!630137 e!360326))

(declare-fun res!407349 () Bool)

(assert (=> b!630137 (=> (not res!407349) (not e!360326))))

(declare-fun lt!291037 () (_ BitVec 32))

(assert (=> b!630137 (= res!407349 (= lt!291034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291037 vacantSpotIndex!68 (select (store (arr!18258 a!2986) i!1108 k!1786) j!136) (array!38046 (store (arr!18258 a!2986) i!1108 k!1786) (size!18622 a!2986)) mask!3053)))))

(assert (=> b!630137 (= lt!291034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291037 vacantSpotIndex!68 (select (arr!18258 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21138 0))(
  ( (Unit!21139) )
))
(declare-fun lt!291036 () Unit!21138)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38045 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21138)

(assert (=> b!630137 (= lt!291036 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291037 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630137 (= lt!291037 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630138 () Bool)

(declare-fun res!407348 () Bool)

(assert (=> b!630138 (=> (not res!407348) (not e!360327))))

(assert (=> b!630138 (= res!407348 (and (= (size!18622 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18622 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18622 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630139 () Bool)

(declare-fun res!407350 () Bool)

(assert (=> b!630139 (=> (not res!407350) (not e!360324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38045 (_ BitVec 32)) Bool)

(assert (=> b!630139 (= res!407350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630140 () Bool)

(declare-fun res!407352 () Bool)

(assert (=> b!630140 (=> (not res!407352) (not e!360324))))

(assert (=> b!630140 (= res!407352 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18258 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18258 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56912 res!407351) b!630138))

(assert (= (and b!630138 res!407348) b!630134))

(assert (= (and b!630134 res!407346) b!630133))

(assert (= (and b!630133 res!407344) b!630130))

(assert (= (and b!630130 res!407347) b!630136))

(assert (= (and b!630136 res!407345) b!630139))

(assert (= (and b!630139 res!407350) b!630135))

(assert (= (and b!630135 res!407354) b!630140))

(assert (= (and b!630140 res!407352) b!630132))

(assert (= (and b!630132 res!407353) b!630137))

(assert (= (and b!630137 res!407349) b!630131))

(declare-fun m!605139 () Bool)

(assert (=> start!56912 m!605139))

(declare-fun m!605141 () Bool)

(assert (=> start!56912 m!605141))

(declare-fun m!605143 () Bool)

(assert (=> b!630132 m!605143))

(declare-fun m!605145 () Bool)

(assert (=> b!630132 m!605145))

(assert (=> b!630132 m!605145))

(declare-fun m!605147 () Bool)

(assert (=> b!630132 m!605147))

(declare-fun m!605149 () Bool)

(assert (=> b!630135 m!605149))

(declare-fun m!605151 () Bool)

(assert (=> b!630140 m!605151))

(declare-fun m!605153 () Bool)

(assert (=> b!630140 m!605153))

(declare-fun m!605155 () Bool)

(assert (=> b!630140 m!605155))

(declare-fun m!605157 () Bool)

(assert (=> b!630130 m!605157))

(declare-fun m!605159 () Bool)

(assert (=> b!630137 m!605159))

(assert (=> b!630137 m!605145))

(assert (=> b!630137 m!605153))

(declare-fun m!605161 () Bool)

(assert (=> b!630137 m!605161))

(assert (=> b!630137 m!605145))

(declare-fun m!605163 () Bool)

(assert (=> b!630137 m!605163))

(declare-fun m!605165 () Bool)

(assert (=> b!630137 m!605165))

(assert (=> b!630137 m!605165))

(declare-fun m!605167 () Bool)

(assert (=> b!630137 m!605167))

(declare-fun m!605169 () Bool)

(assert (=> b!630133 m!605169))

(assert (=> b!630134 m!605145))

(assert (=> b!630134 m!605145))

(declare-fun m!605171 () Bool)

(assert (=> b!630134 m!605171))

(declare-fun m!605173 () Bool)

(assert (=> b!630139 m!605173))

(declare-fun m!605175 () Bool)

(assert (=> b!630136 m!605175))

(push 1)

