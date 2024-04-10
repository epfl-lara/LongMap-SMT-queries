; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56754 () Bool)

(assert start!56754)

(declare-fun b!628909 () Bool)

(declare-fun res!406474 () Bool)

(declare-fun e!359734 () Bool)

(assert (=> b!628909 (=> (not res!406474) (not e!359734))))

(declare-datatypes ((array!37995 0))(
  ( (array!37996 (arr!18236 (Array (_ BitVec 32) (_ BitVec 64))) (size!18600 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37995)

(declare-datatypes ((List!12277 0))(
  ( (Nil!12274) (Cons!12273 (h!13318 (_ BitVec 64)) (t!18505 List!12277)) )
))
(declare-fun arrayNoDuplicates!0 (array!37995 (_ BitVec 32) List!12277) Bool)

(assert (=> b!628909 (= res!406474 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12274))))

(declare-fun b!628910 () Bool)

(declare-fun res!406467 () Bool)

(assert (=> b!628910 (=> (not res!406467) (not e!359734))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628910 (= res!406467 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18236 a!2986) index!984) (select (arr!18236 a!2986) j!136))) (not (= (select (arr!18236 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628911 () Bool)

(declare-fun res!406473 () Bool)

(assert (=> b!628911 (=> (not res!406473) (not e!359734))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37995 (_ BitVec 32)) Bool)

(assert (=> b!628911 (= res!406473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628912 () Bool)

(declare-fun res!406466 () Bool)

(declare-fun e!359736 () Bool)

(assert (=> b!628912 (=> (not res!406466) (not e!359736))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628912 (= res!406466 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!406470 () Bool)

(assert (=> start!56754 (=> (not res!406470) (not e!359736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56754 (= res!406470 (validMask!0 mask!3053))))

(assert (=> start!56754 e!359736))

(assert (=> start!56754 true))

(declare-fun array_inv!14032 (array!37995) Bool)

(assert (=> start!56754 (array_inv!14032 a!2986)))

(declare-fun b!628913 () Bool)

(assert (=> b!628913 (= e!359734 false)))

(declare-fun lt!290590 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628913 (= lt!290590 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628914 () Bool)

(declare-fun res!406469 () Bool)

(assert (=> b!628914 (=> (not res!406469) (not e!359734))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!628914 (= res!406469 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18236 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18236 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628915 () Bool)

(declare-fun res!406475 () Bool)

(assert (=> b!628915 (=> (not res!406475) (not e!359734))))

(declare-datatypes ((SeekEntryResult!6676 0))(
  ( (MissingZero!6676 (index!28988 (_ BitVec 32))) (Found!6676 (index!28989 (_ BitVec 32))) (Intermediate!6676 (undefined!7488 Bool) (index!28990 (_ BitVec 32)) (x!57718 (_ BitVec 32))) (Undefined!6676) (MissingVacant!6676 (index!28991 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37995 (_ BitVec 32)) SeekEntryResult!6676)

(assert (=> b!628915 (= res!406475 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053) (Found!6676 j!136)))))

(declare-fun b!628916 () Bool)

(declare-fun res!406472 () Bool)

(assert (=> b!628916 (=> (not res!406472) (not e!359736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628916 (= res!406472 (validKeyInArray!0 (select (arr!18236 a!2986) j!136)))))

(declare-fun b!628917 () Bool)

(assert (=> b!628917 (= e!359736 e!359734)))

(declare-fun res!406468 () Bool)

(assert (=> b!628917 (=> (not res!406468) (not e!359734))))

(declare-fun lt!290589 () SeekEntryResult!6676)

(assert (=> b!628917 (= res!406468 (or (= lt!290589 (MissingZero!6676 i!1108)) (= lt!290589 (MissingVacant!6676 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37995 (_ BitVec 32)) SeekEntryResult!6676)

(assert (=> b!628917 (= lt!290589 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628918 () Bool)

(declare-fun res!406471 () Bool)

(assert (=> b!628918 (=> (not res!406471) (not e!359736))))

(assert (=> b!628918 (= res!406471 (validKeyInArray!0 k!1786))))

(declare-fun b!628919 () Bool)

(declare-fun res!406465 () Bool)

(assert (=> b!628919 (=> (not res!406465) (not e!359736))))

(assert (=> b!628919 (= res!406465 (and (= (size!18600 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18600 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18600 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56754 res!406470) b!628919))

(assert (= (and b!628919 res!406465) b!628916))

(assert (= (and b!628916 res!406472) b!628918))

(assert (= (and b!628918 res!406471) b!628912))

(assert (= (and b!628912 res!406466) b!628917))

(assert (= (and b!628917 res!406468) b!628911))

(assert (= (and b!628911 res!406473) b!628909))

(assert (= (and b!628909 res!406474) b!628914))

(assert (= (and b!628914 res!406469) b!628915))

(assert (= (and b!628915 res!406475) b!628910))

(assert (= (and b!628910 res!406467) b!628913))

(declare-fun m!604017 () Bool)

(assert (=> b!628911 m!604017))

(declare-fun m!604019 () Bool)

(assert (=> b!628909 m!604019))

(declare-fun m!604021 () Bool)

(assert (=> b!628912 m!604021))

(declare-fun m!604023 () Bool)

(assert (=> start!56754 m!604023))

(declare-fun m!604025 () Bool)

(assert (=> start!56754 m!604025))

(declare-fun m!604027 () Bool)

(assert (=> b!628917 m!604027))

(declare-fun m!604029 () Bool)

(assert (=> b!628910 m!604029))

(declare-fun m!604031 () Bool)

(assert (=> b!628910 m!604031))

(declare-fun m!604033 () Bool)

(assert (=> b!628914 m!604033))

(declare-fun m!604035 () Bool)

(assert (=> b!628914 m!604035))

(declare-fun m!604037 () Bool)

(assert (=> b!628914 m!604037))

(assert (=> b!628916 m!604031))

(assert (=> b!628916 m!604031))

(declare-fun m!604039 () Bool)

(assert (=> b!628916 m!604039))

(declare-fun m!604041 () Bool)

(assert (=> b!628913 m!604041))

(declare-fun m!604043 () Bool)

(assert (=> b!628918 m!604043))

(assert (=> b!628915 m!604031))

(assert (=> b!628915 m!604031))

(declare-fun m!604045 () Bool)

(assert (=> b!628915 m!604045))

(push 1)

(assert (not b!628916))

(assert (not b!628915))

(assert (not b!628909))

(assert (not start!56754))

(assert (not b!628917))

