; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53938 () Bool)

(assert start!53938)

(declare-fun b!588745 () Bool)

(declare-fun res!376361 () Bool)

(declare-fun e!336175 () Bool)

(assert (=> b!588745 (=> (not res!376361) (not e!336175))))

(declare-datatypes ((array!36782 0))(
  ( (array!36783 (arr!17664 (Array (_ BitVec 32) (_ BitVec 64))) (size!18028 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36782)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588745 (= res!376361 (validKeyInArray!0 (select (arr!17664 a!2986) j!136)))))

(declare-fun b!588746 () Bool)

(declare-datatypes ((Unit!18334 0))(
  ( (Unit!18335) )
))
(declare-fun e!336176 () Unit!18334)

(declare-fun Unit!18336 () Unit!18334)

(assert (=> b!588746 (= e!336176 Unit!18336)))

(assert (=> b!588746 false))

(declare-fun b!588747 () Bool)

(declare-fun Unit!18337 () Unit!18334)

(assert (=> b!588747 (= e!336176 Unit!18337)))

(declare-fun b!588748 () Bool)

(declare-fun res!376366 () Bool)

(declare-fun e!336171 () Bool)

(assert (=> b!588748 (=> (not res!376366) (not e!336171))))

(declare-datatypes ((List!11705 0))(
  ( (Nil!11702) (Cons!11701 (h!12746 (_ BitVec 64)) (t!17933 List!11705)) )
))
(declare-fun arrayNoDuplicates!0 (array!36782 (_ BitVec 32) List!11705) Bool)

(assert (=> b!588748 (= res!376366 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11702))))

(declare-fun b!588750 () Bool)

(declare-fun e!336173 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!588750 (= e!336173 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!266943 () Unit!18334)

(assert (=> b!588750 (= lt!266943 e!336176)))

(declare-fun lt!266948 () array!36782)

(declare-fun c!66560 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!266944 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6104 0))(
  ( (MissingZero!6104 (index!26646 (_ BitVec 32))) (Found!6104 (index!26647 (_ BitVec 32))) (Intermediate!6104 (undefined!6916 Bool) (index!26648 (_ BitVec 32)) (x!55446 (_ BitVec 32))) (Undefined!6104) (MissingVacant!6104 (index!26649 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36782 (_ BitVec 32)) SeekEntryResult!6104)

(assert (=> b!588750 (= c!66560 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266944 lt!266948 mask!3053) Undefined!6104))))

(declare-fun e!336174 () Bool)

(assert (=> b!588750 e!336174))

(declare-fun res!376369 () Bool)

(assert (=> b!588750 (=> (not res!376369) (not e!336174))))

(declare-fun lt!266950 () (_ BitVec 32))

(declare-fun lt!266947 () SeekEntryResult!6104)

(assert (=> b!588750 (= res!376369 (= lt!266947 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266950 vacantSpotIndex!68 lt!266944 lt!266948 mask!3053)))))

(assert (=> b!588750 (= lt!266947 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266950 vacantSpotIndex!68 (select (arr!17664 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!588750 (= lt!266944 (select (store (arr!17664 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!266945 () Unit!18334)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36782 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18334)

(assert (=> b!588750 (= lt!266945 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266950 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588750 (= lt!266950 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588751 () Bool)

(declare-fun e!336172 () Bool)

(assert (=> b!588751 (= e!336171 e!336172)))

(declare-fun res!376363 () Bool)

(assert (=> b!588751 (=> (not res!376363) (not e!336172))))

(assert (=> b!588751 (= res!376363 (= (select (store (arr!17664 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588751 (= lt!266948 (array!36783 (store (arr!17664 a!2986) i!1108 k!1786) (size!18028 a!2986)))))

(declare-fun b!588752 () Bool)

(declare-fun res!376360 () Bool)

(assert (=> b!588752 (=> (not res!376360) (not e!336175))))

(declare-fun arrayContainsKey!0 (array!36782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588752 (= res!376360 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588753 () Bool)

(declare-fun res!376359 () Bool)

(assert (=> b!588753 (=> (not res!376359) (not e!336175))))

(assert (=> b!588753 (= res!376359 (validKeyInArray!0 k!1786))))

(declare-fun b!588754 () Bool)

(declare-fun res!376362 () Bool)

(assert (=> b!588754 (=> (not res!376362) (not e!336171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36782 (_ BitVec 32)) Bool)

(assert (=> b!588754 (= res!376362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588755 () Bool)

(assert (=> b!588755 (= e!336175 e!336171)))

(declare-fun res!376370 () Bool)

(assert (=> b!588755 (=> (not res!376370) (not e!336171))))

(declare-fun lt!266949 () SeekEntryResult!6104)

(assert (=> b!588755 (= res!376370 (or (= lt!266949 (MissingZero!6104 i!1108)) (= lt!266949 (MissingVacant!6104 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36782 (_ BitVec 32)) SeekEntryResult!6104)

(assert (=> b!588755 (= lt!266949 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588756 () Bool)

(declare-fun res!376368 () Bool)

(assert (=> b!588756 (=> (not res!376368) (not e!336175))))

(assert (=> b!588756 (= res!376368 (and (= (size!18028 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18028 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18028 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588757 () Bool)

(declare-fun lt!266946 () SeekEntryResult!6104)

(assert (=> b!588757 (= e!336174 (= lt!266946 lt!266947))))

(declare-fun b!588758 () Bool)

(declare-fun res!376364 () Bool)

(assert (=> b!588758 (=> (not res!376364) (not e!336171))))

(assert (=> b!588758 (= res!376364 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17664 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588749 () Bool)

(assert (=> b!588749 (= e!336172 e!336173)))

(declare-fun res!376367 () Bool)

(assert (=> b!588749 (=> (not res!376367) (not e!336173))))

(assert (=> b!588749 (= res!376367 (and (= lt!266946 (Found!6104 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17664 a!2986) index!984) (select (arr!17664 a!2986) j!136))) (not (= (select (arr!17664 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588749 (= lt!266946 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17664 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!376365 () Bool)

(assert (=> start!53938 (=> (not res!376365) (not e!336175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53938 (= res!376365 (validMask!0 mask!3053))))

(assert (=> start!53938 e!336175))

(assert (=> start!53938 true))

(declare-fun array_inv!13460 (array!36782) Bool)

(assert (=> start!53938 (array_inv!13460 a!2986)))

(assert (= (and start!53938 res!376365) b!588756))

(assert (= (and b!588756 res!376368) b!588745))

(assert (= (and b!588745 res!376361) b!588753))

(assert (= (and b!588753 res!376359) b!588752))

(assert (= (and b!588752 res!376360) b!588755))

(assert (= (and b!588755 res!376370) b!588754))

(assert (= (and b!588754 res!376362) b!588748))

(assert (= (and b!588748 res!376366) b!588758))

(assert (= (and b!588758 res!376364) b!588751))

(assert (= (and b!588751 res!376363) b!588749))

(assert (= (and b!588749 res!376367) b!588750))

(assert (= (and b!588750 res!376369) b!588757))

(assert (= (and b!588750 c!66560) b!588746))

(assert (= (and b!588750 (not c!66560)) b!588747))

(declare-fun m!567307 () Bool)

(assert (=> start!53938 m!567307))

(declare-fun m!567309 () Bool)

(assert (=> start!53938 m!567309))

(declare-fun m!567311 () Bool)

(assert (=> b!588751 m!567311))

(declare-fun m!567313 () Bool)

(assert (=> b!588751 m!567313))

(declare-fun m!567315 () Bool)

(assert (=> b!588749 m!567315))

(declare-fun m!567317 () Bool)

(assert (=> b!588749 m!567317))

(assert (=> b!588749 m!567317))

(declare-fun m!567319 () Bool)

(assert (=> b!588749 m!567319))

(assert (=> b!588745 m!567317))

(assert (=> b!588745 m!567317))

(declare-fun m!567321 () Bool)

(assert (=> b!588745 m!567321))

(declare-fun m!567323 () Bool)

(assert (=> b!588750 m!567323))

(declare-fun m!567325 () Bool)

(assert (=> b!588750 m!567325))

(assert (=> b!588750 m!567317))

(assert (=> b!588750 m!567317))

(declare-fun m!567327 () Bool)

(assert (=> b!588750 m!567327))

(assert (=> b!588750 m!567311))

(declare-fun m!567329 () Bool)

(assert (=> b!588750 m!567329))

(declare-fun m!567331 () Bool)

(assert (=> b!588750 m!567331))

(declare-fun m!567333 () Bool)

(assert (=> b!588750 m!567333))

(declare-fun m!567335 () Bool)

(assert (=> b!588752 m!567335))

(declare-fun m!567337 () Bool)

(assert (=> b!588753 m!567337))

(declare-fun m!567339 () Bool)

(assert (=> b!588748 m!567339))

(declare-fun m!567341 () Bool)

(assert (=> b!588754 m!567341))

(declare-fun m!567343 () Bool)

(assert (=> b!588758 m!567343))

(declare-fun m!567345 () Bool)

(assert (=> b!588755 m!567345))

(push 1)

