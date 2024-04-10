; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57016 () Bool)

(assert start!57016)

(declare-fun b!631285 () Bool)

(declare-fun e!360933 () Bool)

(assert (=> b!631285 (= e!360933 (not true))))

(declare-datatypes ((Unit!21214 0))(
  ( (Unit!21215) )
))
(declare-fun lt!291652 () Unit!21214)

(declare-fun e!360938 () Unit!21214)

(assert (=> b!631285 (= lt!291652 e!360938)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!291648 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38092 0))(
  ( (array!38093 (arr!18280 (Array (_ BitVec 32) (_ BitVec 64))) (size!18644 (_ BitVec 32))) )
))
(declare-fun lt!291655 () array!38092)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!71909 () Bool)

(declare-datatypes ((SeekEntryResult!6720 0))(
  ( (MissingZero!6720 (index!29170 (_ BitVec 32))) (Found!6720 (index!29171 (_ BitVec 32))) (Intermediate!6720 (undefined!7532 Bool) (index!29172 (_ BitVec 32)) (x!57906 (_ BitVec 32))) (Undefined!6720) (MissingVacant!6720 (index!29173 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38092 (_ BitVec 32)) SeekEntryResult!6720)

(assert (=> b!631285 (= c!71909 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291648 lt!291655 mask!3053) Undefined!6720))))

(declare-fun e!360939 () Bool)

(assert (=> b!631285 e!360939))

(declare-fun res!408209 () Bool)

(assert (=> b!631285 (=> (not res!408209) (not e!360939))))

(declare-fun lt!291653 () (_ BitVec 32))

(declare-fun lt!291651 () SeekEntryResult!6720)

(assert (=> b!631285 (= res!408209 (= lt!291651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291653 vacantSpotIndex!68 lt!291648 lt!291655 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38092)

(assert (=> b!631285 (= lt!291651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291653 vacantSpotIndex!68 (select (arr!18280 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!631285 (= lt!291648 (select (store (arr!18280 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291654 () Unit!21214)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38092 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21214)

(assert (=> b!631285 (= lt!291654 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291653 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631285 (= lt!291653 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631286 () Bool)

(declare-fun res!408211 () Bool)

(declare-fun e!360935 () Bool)

(assert (=> b!631286 (=> (not res!408211) (not e!360935))))

(declare-fun arrayContainsKey!0 (array!38092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631286 (= res!408211 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631287 () Bool)

(declare-fun res!408208 () Bool)

(assert (=> b!631287 (=> (not res!408208) (not e!360935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631287 (= res!408208 (validKeyInArray!0 (select (arr!18280 a!2986) j!136)))))

(declare-fun b!631288 () Bool)

(declare-fun res!408206 () Bool)

(assert (=> b!631288 (=> (not res!408206) (not e!360935))))

(assert (=> b!631288 (= res!408206 (and (= (size!18644 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18644 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18644 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631289 () Bool)

(declare-fun e!360937 () Bool)

(assert (=> b!631289 (= e!360937 e!360933)))

(declare-fun res!408212 () Bool)

(assert (=> b!631289 (=> (not res!408212) (not e!360933))))

(declare-fun lt!291650 () SeekEntryResult!6720)

(assert (=> b!631289 (= res!408212 (and (= lt!291650 (Found!6720 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18280 a!2986) index!984) (select (arr!18280 a!2986) j!136))) (not (= (select (arr!18280 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631289 (= lt!291650 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18280 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631290 () Bool)

(declare-fun res!408204 () Bool)

(declare-fun e!360936 () Bool)

(assert (=> b!631290 (=> (not res!408204) (not e!360936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38092 (_ BitVec 32)) Bool)

(assert (=> b!631290 (= res!408204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631291 () Bool)

(declare-fun Unit!21216 () Unit!21214)

(assert (=> b!631291 (= e!360938 Unit!21216)))

(declare-fun b!631292 () Bool)

(assert (=> b!631292 (= e!360939 (= lt!291650 lt!291651))))

(declare-fun b!631293 () Bool)

(declare-fun res!408210 () Bool)

(assert (=> b!631293 (=> (not res!408210) (not e!360935))))

(assert (=> b!631293 (= res!408210 (validKeyInArray!0 k0!1786))))

(declare-fun b!631294 () Bool)

(assert (=> b!631294 (= e!360936 e!360937)))

(declare-fun res!408203 () Bool)

(assert (=> b!631294 (=> (not res!408203) (not e!360937))))

(assert (=> b!631294 (= res!408203 (= (select (store (arr!18280 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631294 (= lt!291655 (array!38093 (store (arr!18280 a!2986) i!1108 k0!1786) (size!18644 a!2986)))))

(declare-fun res!408201 () Bool)

(assert (=> start!57016 (=> (not res!408201) (not e!360935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57016 (= res!408201 (validMask!0 mask!3053))))

(assert (=> start!57016 e!360935))

(assert (=> start!57016 true))

(declare-fun array_inv!14076 (array!38092) Bool)

(assert (=> start!57016 (array_inv!14076 a!2986)))

(declare-fun b!631295 () Bool)

(declare-fun Unit!21217 () Unit!21214)

(assert (=> b!631295 (= e!360938 Unit!21217)))

(assert (=> b!631295 false))

(declare-fun b!631296 () Bool)

(declare-fun res!408207 () Bool)

(assert (=> b!631296 (=> (not res!408207) (not e!360936))))

(declare-datatypes ((List!12321 0))(
  ( (Nil!12318) (Cons!12317 (h!13362 (_ BitVec 64)) (t!18549 List!12321)) )
))
(declare-fun arrayNoDuplicates!0 (array!38092 (_ BitVec 32) List!12321) Bool)

(assert (=> b!631296 (= res!408207 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12318))))

(declare-fun b!631297 () Bool)

(declare-fun res!408202 () Bool)

(assert (=> b!631297 (=> (not res!408202) (not e!360936))))

(assert (=> b!631297 (= res!408202 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18280 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631298 () Bool)

(assert (=> b!631298 (= e!360935 e!360936)))

(declare-fun res!408205 () Bool)

(assert (=> b!631298 (=> (not res!408205) (not e!360936))))

(declare-fun lt!291649 () SeekEntryResult!6720)

(assert (=> b!631298 (= res!408205 (or (= lt!291649 (MissingZero!6720 i!1108)) (= lt!291649 (MissingVacant!6720 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38092 (_ BitVec 32)) SeekEntryResult!6720)

(assert (=> b!631298 (= lt!291649 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57016 res!408201) b!631288))

(assert (= (and b!631288 res!408206) b!631287))

(assert (= (and b!631287 res!408208) b!631293))

(assert (= (and b!631293 res!408210) b!631286))

(assert (= (and b!631286 res!408211) b!631298))

(assert (= (and b!631298 res!408205) b!631290))

(assert (= (and b!631290 res!408204) b!631296))

(assert (= (and b!631296 res!408207) b!631297))

(assert (= (and b!631297 res!408202) b!631294))

(assert (= (and b!631294 res!408203) b!631289))

(assert (= (and b!631289 res!408212) b!631285))

(assert (= (and b!631285 res!408209) b!631292))

(assert (= (and b!631285 c!71909) b!631295))

(assert (= (and b!631285 (not c!71909)) b!631291))

(declare-fun m!606223 () Bool)

(assert (=> b!631285 m!606223))

(declare-fun m!606225 () Bool)

(assert (=> b!631285 m!606225))

(declare-fun m!606227 () Bool)

(assert (=> b!631285 m!606227))

(declare-fun m!606229 () Bool)

(assert (=> b!631285 m!606229))

(assert (=> b!631285 m!606225))

(declare-fun m!606231 () Bool)

(assert (=> b!631285 m!606231))

(declare-fun m!606233 () Bool)

(assert (=> b!631285 m!606233))

(declare-fun m!606235 () Bool)

(assert (=> b!631285 m!606235))

(declare-fun m!606237 () Bool)

(assert (=> b!631285 m!606237))

(declare-fun m!606239 () Bool)

(assert (=> b!631289 m!606239))

(assert (=> b!631289 m!606225))

(assert (=> b!631289 m!606225))

(declare-fun m!606241 () Bool)

(assert (=> b!631289 m!606241))

(assert (=> b!631294 m!606227))

(declare-fun m!606243 () Bool)

(assert (=> b!631294 m!606243))

(declare-fun m!606245 () Bool)

(assert (=> b!631298 m!606245))

(declare-fun m!606247 () Bool)

(assert (=> start!57016 m!606247))

(declare-fun m!606249 () Bool)

(assert (=> start!57016 m!606249))

(declare-fun m!606251 () Bool)

(assert (=> b!631297 m!606251))

(declare-fun m!606253 () Bool)

(assert (=> b!631293 m!606253))

(assert (=> b!631287 m!606225))

(assert (=> b!631287 m!606225))

(declare-fun m!606255 () Bool)

(assert (=> b!631287 m!606255))

(declare-fun m!606257 () Bool)

(assert (=> b!631286 m!606257))

(declare-fun m!606259 () Bool)

(assert (=> b!631290 m!606259))

(declare-fun m!606261 () Bool)

(assert (=> b!631296 m!606261))

(check-sat (not b!631289) (not start!57016) (not b!631290) (not b!631296) (not b!631298) (not b!631287) (not b!631286) (not b!631285) (not b!631293))
(check-sat)
