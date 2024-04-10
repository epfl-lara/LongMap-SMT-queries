; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53750 () Bool)

(assert start!53750)

(declare-fun b!586339 () Bool)

(declare-fun res!374157 () Bool)

(declare-fun e!335237 () Bool)

(assert (=> b!586339 (=> (not res!374157) (not e!335237))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36651 0))(
  ( (array!36652 (arr!17600 (Array (_ BitVec 32) (_ BitVec 64))) (size!17964 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36651)

(assert (=> b!586339 (= res!374157 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17600 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17600 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586340 () Bool)

(declare-fun res!374158 () Bool)

(assert (=> b!586340 (=> (not res!374158) (not e!335237))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6040 0))(
  ( (MissingZero!6040 (index!26387 (_ BitVec 32))) (Found!6040 (index!26388 (_ BitVec 32))) (Intermediate!6040 (undefined!6852 Bool) (index!26389 (_ BitVec 32)) (x!55197 (_ BitVec 32))) (Undefined!6040) (MissingVacant!6040 (index!26390 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36651 (_ BitVec 32)) SeekEntryResult!6040)

(assert (=> b!586340 (= res!374158 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17600 a!2986) j!136) a!2986 mask!3053) (Found!6040 j!136)))))

(declare-fun b!586341 () Bool)

(declare-fun res!374156 () Bool)

(declare-fun e!335238 () Bool)

(assert (=> b!586341 (=> (not res!374156) (not e!335238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586341 (= res!374156 (validKeyInArray!0 k!1786))))

(declare-fun b!586342 () Bool)

(declare-fun res!374165 () Bool)

(assert (=> b!586342 (=> (not res!374165) (not e!335238))))

(declare-fun arrayContainsKey!0 (array!36651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586342 (= res!374165 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586343 () Bool)

(assert (=> b!586343 (= e!335237 (not true))))

(declare-fun lt!266066 () (_ BitVec 32))

(assert (=> b!586343 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266066 vacantSpotIndex!68 (select (arr!17600 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266066 vacantSpotIndex!68 (select (store (arr!17600 a!2986) i!1108 k!1786) j!136) (array!36652 (store (arr!17600 a!2986) i!1108 k!1786) (size!17964 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18200 0))(
  ( (Unit!18201) )
))
(declare-fun lt!266068 () Unit!18200)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18200)

(assert (=> b!586343 (= lt!266068 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266066 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586343 (= lt!266066 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586344 () Bool)

(declare-fun res!374160 () Bool)

(assert (=> b!586344 (=> (not res!374160) (not e!335238))))

(assert (=> b!586344 (= res!374160 (validKeyInArray!0 (select (arr!17600 a!2986) j!136)))))

(declare-fun b!586345 () Bool)

(declare-fun res!374162 () Bool)

(assert (=> b!586345 (=> (not res!374162) (not e!335237))))

(declare-datatypes ((List!11641 0))(
  ( (Nil!11638) (Cons!11637 (h!12682 (_ BitVec 64)) (t!17869 List!11641)) )
))
(declare-fun arrayNoDuplicates!0 (array!36651 (_ BitVec 32) List!11641) Bool)

(assert (=> b!586345 (= res!374162 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11638))))

(declare-fun b!586346 () Bool)

(declare-fun res!374161 () Bool)

(assert (=> b!586346 (=> (not res!374161) (not e!335237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36651 (_ BitVec 32)) Bool)

(assert (=> b!586346 (= res!374161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586348 () Bool)

(declare-fun res!374163 () Bool)

(assert (=> b!586348 (=> (not res!374163) (not e!335238))))

(assert (=> b!586348 (= res!374163 (and (= (size!17964 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17964 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17964 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586349 () Bool)

(declare-fun res!374164 () Bool)

(assert (=> b!586349 (=> (not res!374164) (not e!335237))))

(assert (=> b!586349 (= res!374164 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17600 a!2986) index!984) (select (arr!17600 a!2986) j!136))) (not (= (select (arr!17600 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!374159 () Bool)

(assert (=> start!53750 (=> (not res!374159) (not e!335238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53750 (= res!374159 (validMask!0 mask!3053))))

(assert (=> start!53750 e!335238))

(assert (=> start!53750 true))

(declare-fun array_inv!13396 (array!36651) Bool)

(assert (=> start!53750 (array_inv!13396 a!2986)))

(declare-fun b!586347 () Bool)

(assert (=> b!586347 (= e!335238 e!335237)))

(declare-fun res!374155 () Bool)

(assert (=> b!586347 (=> (not res!374155) (not e!335237))))

(declare-fun lt!266067 () SeekEntryResult!6040)

(assert (=> b!586347 (= res!374155 (or (= lt!266067 (MissingZero!6040 i!1108)) (= lt!266067 (MissingVacant!6040 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36651 (_ BitVec 32)) SeekEntryResult!6040)

(assert (=> b!586347 (= lt!266067 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53750 res!374159) b!586348))

(assert (= (and b!586348 res!374163) b!586344))

(assert (= (and b!586344 res!374160) b!586341))

(assert (= (and b!586341 res!374156) b!586342))

(assert (= (and b!586342 res!374165) b!586347))

(assert (= (and b!586347 res!374155) b!586346))

(assert (= (and b!586346 res!374161) b!586345))

(assert (= (and b!586345 res!374162) b!586339))

(assert (= (and b!586339 res!374157) b!586340))

(assert (= (and b!586340 res!374158) b!586349))

(assert (= (and b!586349 res!374164) b!586343))

(declare-fun m!564683 () Bool)

(assert (=> b!586346 m!564683))

(declare-fun m!564685 () Bool)

(assert (=> b!586347 m!564685))

(declare-fun m!564687 () Bool)

(assert (=> b!586339 m!564687))

(declare-fun m!564689 () Bool)

(assert (=> b!586339 m!564689))

(declare-fun m!564691 () Bool)

(assert (=> b!586339 m!564691))

(declare-fun m!564693 () Bool)

(assert (=> b!586341 m!564693))

(declare-fun m!564695 () Bool)

(assert (=> b!586342 m!564695))

(declare-fun m!564697 () Bool)

(assert (=> b!586349 m!564697))

(declare-fun m!564699 () Bool)

(assert (=> b!586349 m!564699))

(declare-fun m!564701 () Bool)

(assert (=> b!586345 m!564701))

(assert (=> b!586344 m!564699))

(assert (=> b!586344 m!564699))

(declare-fun m!564703 () Bool)

(assert (=> b!586344 m!564703))

(declare-fun m!564705 () Bool)

(assert (=> b!586343 m!564705))

(declare-fun m!564707 () Bool)

(assert (=> b!586343 m!564707))

(assert (=> b!586343 m!564699))

(declare-fun m!564709 () Bool)

(assert (=> b!586343 m!564709))

(assert (=> b!586343 m!564689))

(assert (=> b!586343 m!564699))

(declare-fun m!564711 () Bool)

(assert (=> b!586343 m!564711))

(assert (=> b!586343 m!564707))

(declare-fun m!564713 () Bool)

(assert (=> b!586343 m!564713))

(declare-fun m!564715 () Bool)

(assert (=> start!53750 m!564715))

(declare-fun m!564717 () Bool)

(assert (=> start!53750 m!564717))

(assert (=> b!586340 m!564699))

(assert (=> b!586340 m!564699))

(declare-fun m!564719 () Bool)

(assert (=> b!586340 m!564719))

(push 1)

