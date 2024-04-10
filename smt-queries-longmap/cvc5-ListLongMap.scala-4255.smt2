; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59000 () Bool)

(assert start!59000)

(declare-fun b!651187 () Bool)

(declare-fun e!373656 () Bool)

(declare-datatypes ((SeekEntryResult!6935 0))(
  ( (MissingZero!6935 (index!30090 (_ BitVec 32))) (Found!6935 (index!30091 (_ BitVec 32))) (Intermediate!6935 (undefined!7747 Bool) (index!30092 (_ BitVec 32)) (x!58877 (_ BitVec 32))) (Undefined!6935) (MissingVacant!6935 (index!30093 (_ BitVec 32))) )
))
(declare-fun lt!302767 () SeekEntryResult!6935)

(declare-fun lt!302755 () SeekEntryResult!6935)

(assert (=> b!651187 (= e!373656 (= lt!302767 lt!302755))))

(declare-fun b!651188 () Bool)

(declare-fun e!373654 () Bool)

(declare-fun e!373643 () Bool)

(assert (=> b!651188 (= e!373654 e!373643)))

(declare-fun res!422244 () Bool)

(assert (=> b!651188 (=> (not res!422244) (not e!373643))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38581 0))(
  ( (array!38582 (arr!18495 (Array (_ BitVec 32) (_ BitVec 64))) (size!18859 (_ BitVec 32))) )
))
(declare-fun lt!302762 () array!38581)

(declare-fun a!2986 () array!38581)

(declare-fun arrayContainsKey!0 (array!38581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651188 (= res!422244 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136))))

(declare-fun b!651189 () Bool)

(declare-fun e!373646 () Bool)

(declare-fun e!373648 () Bool)

(assert (=> b!651189 (= e!373646 e!373648)))

(declare-fun res!422236 () Bool)

(assert (=> b!651189 (=> (not res!422236) (not e!373648))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!651189 (= res!422236 (= (select (store (arr!18495 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651189 (= lt!302762 (array!38582 (store (arr!18495 a!2986) i!1108 k!1786) (size!18859 a!2986)))))

(declare-fun b!651190 () Bool)

(declare-fun e!373655 () Bool)

(declare-fun e!373642 () Bool)

(assert (=> b!651190 (= e!373655 e!373642)))

(declare-fun res!422245 () Bool)

(assert (=> b!651190 (=> res!422245 e!373642)))

(declare-fun lt!302750 () (_ BitVec 64))

(declare-fun lt!302764 () (_ BitVec 64))

(assert (=> b!651190 (= res!422245 (or (not (= (select (arr!18495 a!2986) j!136) lt!302750)) (not (= (select (arr!18495 a!2986) j!136) lt!302764))))))

(declare-fun e!373650 () Bool)

(assert (=> b!651190 e!373650))

(declare-fun res!422248 () Bool)

(assert (=> b!651190 (=> (not res!422248) (not e!373650))))

(assert (=> b!651190 (= res!422248 (= lt!302764 (select (arr!18495 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651190 (= lt!302764 (select (store (arr!18495 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651191 () Bool)

(declare-fun e!373645 () Bool)

(assert (=> b!651191 (= e!373645 (bvslt (size!18859 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12536 0))(
  ( (Nil!12533) (Cons!12532 (h!13577 (_ BitVec 64)) (t!18764 List!12536)) )
))
(declare-fun arrayNoDuplicates!0 (array!38581 (_ BitVec 32) List!12536) Bool)

(assert (=> b!651191 (arrayNoDuplicates!0 lt!302762 index!984 Nil!12533)))

(declare-datatypes ((Unit!22236 0))(
  ( (Unit!22237) )
))
(declare-fun lt!302759 () Unit!22236)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38581 (_ BitVec 32) (_ BitVec 32)) Unit!22236)

(assert (=> b!651191 (= lt!302759 (lemmaNoDuplicateFromThenFromBigger!0 lt!302762 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651191 (arrayNoDuplicates!0 lt!302762 #b00000000000000000000000000000000 Nil!12533)))

(declare-fun lt!302760 () Unit!22236)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12536) Unit!22236)

(assert (=> b!651191 (= lt!302760 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12533))))

(assert (=> b!651191 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302763 () Unit!22236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22236)

(assert (=> b!651191 (= lt!302763 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373651 () Bool)

(assert (=> b!651191 e!373651))

(declare-fun res!422241 () Bool)

(assert (=> b!651191 (=> (not res!422241) (not e!373651))))

(assert (=> b!651191 (= res!422241 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136))))

(declare-fun b!651192 () Bool)

(declare-fun e!373653 () Bool)

(assert (=> b!651192 (= e!373653 (not e!373655))))

(declare-fun res!422242 () Bool)

(assert (=> b!651192 (=> res!422242 e!373655)))

(declare-fun lt!302754 () SeekEntryResult!6935)

(assert (=> b!651192 (= res!422242 (not (= lt!302754 (Found!6935 index!984))))))

(declare-fun lt!302753 () Unit!22236)

(declare-fun e!373647 () Unit!22236)

(assert (=> b!651192 (= lt!302753 e!373647)))

(declare-fun c!74845 () Bool)

(assert (=> b!651192 (= c!74845 (= lt!302754 Undefined!6935))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38581 (_ BitVec 32)) SeekEntryResult!6935)

(assert (=> b!651192 (= lt!302754 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302750 lt!302762 mask!3053))))

(assert (=> b!651192 e!373656))

(declare-fun res!422234 () Bool)

(assert (=> b!651192 (=> (not res!422234) (not e!373656))))

(declare-fun lt!302751 () (_ BitVec 32))

(assert (=> b!651192 (= res!422234 (= lt!302755 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 lt!302750 lt!302762 mask!3053)))))

(assert (=> b!651192 (= lt!302755 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 (select (arr!18495 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651192 (= lt!302750 (select (store (arr!18495 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302756 () Unit!22236)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38581 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22236)

(assert (=> b!651192 (= lt!302756 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651192 (= lt!302751 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651193 () Bool)

(declare-fun e!373644 () Bool)

(assert (=> b!651193 (= e!373644 e!373646)))

(declare-fun res!422249 () Bool)

(assert (=> b!651193 (=> (not res!422249) (not e!373646))))

(declare-fun lt!302752 () SeekEntryResult!6935)

(assert (=> b!651193 (= res!422249 (or (= lt!302752 (MissingZero!6935 i!1108)) (= lt!302752 (MissingVacant!6935 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38581 (_ BitVec 32)) SeekEntryResult!6935)

(assert (=> b!651193 (= lt!302752 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!651195 () Bool)

(assert (=> b!651195 (= e!373643 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) index!984))))

(declare-fun b!651196 () Bool)

(declare-fun e!373652 () Unit!22236)

(declare-fun Unit!22238 () Unit!22236)

(assert (=> b!651196 (= e!373652 Unit!22238)))

(declare-fun lt!302758 () Unit!22236)

(assert (=> b!651196 (= lt!302758 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302762 (select (arr!18495 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651196 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302765 () Unit!22236)

(assert (=> b!651196 (= lt!302765 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12533))))

(assert (=> b!651196 (arrayNoDuplicates!0 lt!302762 #b00000000000000000000000000000000 Nil!12533)))

(declare-fun lt!302766 () Unit!22236)

(assert (=> b!651196 (= lt!302766 (lemmaNoDuplicateFromThenFromBigger!0 lt!302762 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651196 (arrayNoDuplicates!0 lt!302762 j!136 Nil!12533)))

(declare-fun lt!302761 () Unit!22236)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38581 (_ BitVec 64) (_ BitVec 32) List!12536) Unit!22236)

(assert (=> b!651196 (= lt!302761 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136 Nil!12533))))

(assert (=> b!651196 false))

(declare-fun b!651197 () Bool)

(declare-fun res!422240 () Bool)

(assert (=> b!651197 (=> (not res!422240) (not e!373644))))

(assert (=> b!651197 (= res!422240 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651198 () Bool)

(declare-fun res!422246 () Bool)

(assert (=> b!651198 (=> (not res!422246) (not e!373644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651198 (= res!422246 (validKeyInArray!0 (select (arr!18495 a!2986) j!136)))))

(declare-fun b!651199 () Bool)

(declare-fun res!422238 () Bool)

(assert (=> b!651199 (=> (not res!422238) (not e!373646))))

(assert (=> b!651199 (= res!422238 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12533))))

(declare-fun b!651200 () Bool)

(declare-fun res!422233 () Bool)

(assert (=> b!651200 (=> (not res!422233) (not e!373644))))

(assert (=> b!651200 (= res!422233 (and (= (size!18859 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18859 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651201 () Bool)

(assert (=> b!651201 (= e!373642 e!373645)))

(declare-fun res!422247 () Bool)

(assert (=> b!651201 (=> res!422247 e!373645)))

(assert (=> b!651201 (= res!422247 (bvsge index!984 j!136))))

(declare-fun lt!302757 () Unit!22236)

(assert (=> b!651201 (= lt!302757 e!373652)))

(declare-fun c!74846 () Bool)

(assert (=> b!651201 (= c!74846 (bvslt j!136 index!984))))

(declare-fun b!651202 () Bool)

(declare-fun Unit!22239 () Unit!22236)

(assert (=> b!651202 (= e!373652 Unit!22239)))

(declare-fun b!651203 () Bool)

(assert (=> b!651203 (= e!373650 e!373654)))

(declare-fun res!422237 () Bool)

(assert (=> b!651203 (=> res!422237 e!373654)))

(assert (=> b!651203 (= res!422237 (or (not (= (select (arr!18495 a!2986) j!136) lt!302750)) (not (= (select (arr!18495 a!2986) j!136) lt!302764)) (bvsge j!136 index!984)))))

(declare-fun b!651204 () Bool)

(assert (=> b!651204 (= e!373651 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) index!984))))

(declare-fun b!651194 () Bool)

(declare-fun res!422243 () Bool)

(assert (=> b!651194 (=> (not res!422243) (not e!373644))))

(assert (=> b!651194 (= res!422243 (validKeyInArray!0 k!1786))))

(declare-fun res!422232 () Bool)

(assert (=> start!59000 (=> (not res!422232) (not e!373644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59000 (= res!422232 (validMask!0 mask!3053))))

(assert (=> start!59000 e!373644))

(assert (=> start!59000 true))

(declare-fun array_inv!14291 (array!38581) Bool)

(assert (=> start!59000 (array_inv!14291 a!2986)))

(declare-fun b!651205 () Bool)

(declare-fun res!422235 () Bool)

(assert (=> b!651205 (=> (not res!422235) (not e!373646))))

(assert (=> b!651205 (= res!422235 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18495 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651206 () Bool)

(declare-fun Unit!22240 () Unit!22236)

(assert (=> b!651206 (= e!373647 Unit!22240)))

(assert (=> b!651206 false))

(declare-fun b!651207 () Bool)

(declare-fun res!422239 () Bool)

(assert (=> b!651207 (=> (not res!422239) (not e!373646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38581 (_ BitVec 32)) Bool)

(assert (=> b!651207 (= res!422239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651208 () Bool)

(declare-fun Unit!22241 () Unit!22236)

(assert (=> b!651208 (= e!373647 Unit!22241)))

(declare-fun b!651209 () Bool)

(assert (=> b!651209 (= e!373648 e!373653)))

(declare-fun res!422231 () Bool)

(assert (=> b!651209 (=> (not res!422231) (not e!373653))))

(assert (=> b!651209 (= res!422231 (and (= lt!302767 (Found!6935 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18495 a!2986) index!984) (select (arr!18495 a!2986) j!136))) (not (= (select (arr!18495 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651209 (= lt!302767 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18495 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!59000 res!422232) b!651200))

(assert (= (and b!651200 res!422233) b!651198))

(assert (= (and b!651198 res!422246) b!651194))

(assert (= (and b!651194 res!422243) b!651197))

(assert (= (and b!651197 res!422240) b!651193))

(assert (= (and b!651193 res!422249) b!651207))

(assert (= (and b!651207 res!422239) b!651199))

(assert (= (and b!651199 res!422238) b!651205))

(assert (= (and b!651205 res!422235) b!651189))

(assert (= (and b!651189 res!422236) b!651209))

(assert (= (and b!651209 res!422231) b!651192))

(assert (= (and b!651192 res!422234) b!651187))

(assert (= (and b!651192 c!74845) b!651206))

(assert (= (and b!651192 (not c!74845)) b!651208))

(assert (= (and b!651192 (not res!422242)) b!651190))

(assert (= (and b!651190 res!422248) b!651203))

(assert (= (and b!651203 (not res!422237)) b!651188))

(assert (= (and b!651188 res!422244) b!651195))

(assert (= (and b!651190 (not res!422245)) b!651201))

(assert (= (and b!651201 c!74846) b!651196))

(assert (= (and b!651201 (not c!74846)) b!651202))

(assert (= (and b!651201 (not res!422247)) b!651191))

(assert (= (and b!651191 res!422241) b!651204))

(declare-fun m!624335 () Bool)

(assert (=> b!651203 m!624335))

(assert (=> b!651188 m!624335))

(assert (=> b!651188 m!624335))

(declare-fun m!624337 () Bool)

(assert (=> b!651188 m!624337))

(declare-fun m!624339 () Bool)

(assert (=> b!651194 m!624339))

(declare-fun m!624341 () Bool)

(assert (=> b!651199 m!624341))

(declare-fun m!624343 () Bool)

(assert (=> b!651189 m!624343))

(declare-fun m!624345 () Bool)

(assert (=> b!651189 m!624345))

(declare-fun m!624347 () Bool)

(assert (=> b!651193 m!624347))

(declare-fun m!624349 () Bool)

(assert (=> b!651192 m!624349))

(declare-fun m!624351 () Bool)

(assert (=> b!651192 m!624351))

(assert (=> b!651192 m!624335))

(assert (=> b!651192 m!624335))

(declare-fun m!624353 () Bool)

(assert (=> b!651192 m!624353))

(assert (=> b!651192 m!624343))

(declare-fun m!624355 () Bool)

(assert (=> b!651192 m!624355))

(declare-fun m!624357 () Bool)

(assert (=> b!651192 m!624357))

(declare-fun m!624359 () Bool)

(assert (=> b!651192 m!624359))

(declare-fun m!624361 () Bool)

(assert (=> b!651205 m!624361))

(declare-fun m!624363 () Bool)

(assert (=> b!651207 m!624363))

(declare-fun m!624365 () Bool)

(assert (=> b!651197 m!624365))

(assert (=> b!651190 m!624335))

(assert (=> b!651190 m!624343))

(declare-fun m!624367 () Bool)

(assert (=> b!651190 m!624367))

(declare-fun m!624369 () Bool)

(assert (=> b!651209 m!624369))

(assert (=> b!651209 m!624335))

(assert (=> b!651209 m!624335))

(declare-fun m!624371 () Bool)

(assert (=> b!651209 m!624371))

(assert (=> b!651204 m!624335))

(assert (=> b!651204 m!624335))

(declare-fun m!624373 () Bool)

(assert (=> b!651204 m!624373))

(assert (=> b!651191 m!624335))

(assert (=> b!651191 m!624337))

(assert (=> b!651191 m!624335))

(assert (=> b!651191 m!624335))

(declare-fun m!624375 () Bool)

(assert (=> b!651191 m!624375))

(declare-fun m!624377 () Bool)

(assert (=> b!651191 m!624377))

(declare-fun m!624379 () Bool)

(assert (=> b!651191 m!624379))

(declare-fun m!624381 () Bool)

(assert (=> b!651191 m!624381))

(assert (=> b!651191 m!624335))

(declare-fun m!624383 () Bool)

(assert (=> b!651191 m!624383))

(declare-fun m!624385 () Bool)

(assert (=> b!651191 m!624385))

(declare-fun m!624387 () Bool)

(assert (=> b!651196 m!624387))

(assert (=> b!651196 m!624335))

(declare-fun m!624389 () Bool)

(assert (=> b!651196 m!624389))

(assert (=> b!651196 m!624335))

(declare-fun m!624391 () Bool)

(assert (=> b!651196 m!624391))

(assert (=> b!651196 m!624335))

(declare-fun m!624393 () Bool)

(assert (=> b!651196 m!624393))

(assert (=> b!651196 m!624385))

(assert (=> b!651196 m!624335))

(declare-fun m!624395 () Bool)

(assert (=> b!651196 m!624395))

(assert (=> b!651196 m!624381))

(assert (=> b!651198 m!624335))

(assert (=> b!651198 m!624335))

(declare-fun m!624397 () Bool)

(assert (=> b!651198 m!624397))

(assert (=> b!651195 m!624335))

(assert (=> b!651195 m!624335))

(assert (=> b!651195 m!624373))

(declare-fun m!624399 () Bool)

(assert (=> start!59000 m!624399))

(declare-fun m!624401 () Bool)

(assert (=> start!59000 m!624401))

(push 1)

(assert (not b!651195))

(assert (not b!651194))

(assert (not b!651209))

(assert (not b!651193))

(assert (not b!651198))

(assert (not b!651188))

(assert (not b!651191))

(assert (not b!651197))

(assert (not b!651196))

(assert (not b!651199))

(assert (not b!651207))

(assert (not b!651204))

(assert (not b!651192))

(assert (not start!59000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!33758 () Bool)

(declare-fun c!74882 () Bool)

(declare-fun bm!33755 () Bool)

(assert (=> bm!33755 (= call!33758 (arrayNoDuplicates!0 lt!302762 (bvadd index!984 #b00000000000000000000000000000001) (ite c!74882 (Cons!12532 (select (arr!18495 lt!302762) index!984) Nil!12533) Nil!12533)))))

(declare-fun b!651412 () Bool)

(declare-fun e!373788 () Bool)

(assert (=> b!651412 (= e!373788 call!33758)))

(declare-fun b!651413 () Bool)

(declare-fun e!373789 () Bool)

(assert (=> b!651413 (= e!373789 e!373788)))

(assert (=> b!651413 (= c!74882 (validKeyInArray!0 (select (arr!18495 lt!302762) index!984)))))

(declare-fun b!651414 () Bool)

(declare-fun e!373790 () Bool)

(declare-fun contains!3176 (List!12536 (_ BitVec 64)) Bool)

(assert (=> b!651414 (= e!373790 (contains!3176 Nil!12533 (select (arr!18495 lt!302762) index!984)))))

(declare-fun b!651415 () Bool)

(declare-fun e!373791 () Bool)

(assert (=> b!651415 (= e!373791 e!373789)))

(declare-fun res!422382 () Bool)

(assert (=> b!651415 (=> (not res!422382) (not e!373789))))

(assert (=> b!651415 (= res!422382 (not e!373790))))

(declare-fun res!422383 () Bool)

(assert (=> b!651415 (=> (not res!422383) (not e!373790))))

(assert (=> b!651415 (= res!422383 (validKeyInArray!0 (select (arr!18495 lt!302762) index!984)))))

(declare-fun d!92063 () Bool)

(declare-fun res!422384 () Bool)

(assert (=> d!92063 (=> res!422384 e!373791)))

(assert (=> d!92063 (= res!422384 (bvsge index!984 (size!18859 lt!302762)))))

(assert (=> d!92063 (= (arrayNoDuplicates!0 lt!302762 index!984 Nil!12533) e!373791)))

(declare-fun b!651416 () Bool)

(assert (=> b!651416 (= e!373788 call!33758)))

(assert (= (and d!92063 (not res!422384)) b!651415))

(assert (= (and b!651415 res!422383) b!651414))

(assert (= (and b!651415 res!422382) b!651413))

(assert (= (and b!651413 c!74882) b!651416))

(assert (= (and b!651413 (not c!74882)) b!651412))

(assert (= (or b!651416 b!651412) bm!33755))

(declare-fun m!624585 () Bool)

(assert (=> bm!33755 m!624585))

(declare-fun m!624587 () Bool)

(assert (=> bm!33755 m!624587))

(assert (=> b!651413 m!624585))

(assert (=> b!651413 m!624585))

(declare-fun m!624589 () Bool)

(assert (=> b!651413 m!624589))

(assert (=> b!651414 m!624585))

(assert (=> b!651414 m!624585))

(declare-fun m!624591 () Bool)

(assert (=> b!651414 m!624591))

(assert (=> b!651415 m!624585))

(assert (=> b!651415 m!624585))

(assert (=> b!651415 m!624589))

(assert (=> b!651191 d!92063))

(declare-fun d!92071 () Bool)

(assert (=> d!92071 (arrayNoDuplicates!0 lt!302762 index!984 Nil!12533)))

(declare-fun lt!302896 () Unit!22236)

(declare-fun choose!39 (array!38581 (_ BitVec 32) (_ BitVec 32)) Unit!22236)

(assert (=> d!92071 (= lt!302896 (choose!39 lt!302762 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92071 (bvslt (size!18859 lt!302762) #b01111111111111111111111111111111)))

(assert (=> d!92071 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302762 #b00000000000000000000000000000000 index!984) lt!302896)))

(declare-fun bs!19421 () Bool)

(assert (= bs!19421 d!92071))

(assert (=> bs!19421 m!624379))

(declare-fun m!624593 () Bool)

(assert (=> bs!19421 m!624593))

(assert (=> b!651191 d!92071))

(declare-fun d!92073 () Bool)

(declare-fun res!422389 () Bool)

(declare-fun e!373802 () Bool)

(assert (=> d!92073 (=> res!422389 e!373802)))

(assert (=> d!92073 (= res!422389 (= (select (arr!18495 lt!302762) j!136) (select (arr!18495 a!2986) j!136)))))

(assert (=> d!92073 (= (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136) e!373802)))

(declare-fun b!651433 () Bool)

(declare-fun e!373803 () Bool)

(assert (=> b!651433 (= e!373802 e!373803)))

(declare-fun res!422390 () Bool)

(assert (=> b!651433 (=> (not res!422390) (not e!373803))))

(assert (=> b!651433 (= res!422390 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18859 lt!302762)))))

(declare-fun b!651434 () Bool)

(assert (=> b!651434 (= e!373803 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92073 (not res!422389)) b!651433))

(assert (= (and b!651433 res!422390) b!651434))

(declare-fun m!624595 () Bool)

(assert (=> d!92073 m!624595))

(assert (=> b!651434 m!624335))

(declare-fun m!624597 () Bool)

(assert (=> b!651434 m!624597))

(assert (=> b!651191 d!92073))

(declare-fun d!92075 () Bool)

(declare-fun res!422391 () Bool)

(declare-fun e!373804 () Bool)

(assert (=> d!92075 (=> res!422391 e!373804)))

(assert (=> d!92075 (= res!422391 (= (select (arr!18495 lt!302762) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18495 a!2986) j!136)))))

(assert (=> d!92075 (= (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!373804)))

(declare-fun b!651435 () Bool)

(declare-fun e!373805 () Bool)

(assert (=> b!651435 (= e!373804 e!373805)))

(declare-fun res!422392 () Bool)

(assert (=> b!651435 (=> (not res!422392) (not e!373805))))

(assert (=> b!651435 (= res!422392 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18859 lt!302762)))))

(declare-fun b!651436 () Bool)

(assert (=> b!651436 (= e!373805 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92075 (not res!422391)) b!651435))

(assert (= (and b!651435 res!422392) b!651436))

(declare-fun m!624599 () Bool)

(assert (=> d!92075 m!624599))

(assert (=> b!651436 m!624335))

(declare-fun m!624601 () Bool)

(assert (=> b!651436 m!624601))

(assert (=> b!651191 d!92075))

(declare-fun d!92077 () Bool)

(declare-fun e!373811 () Bool)

(assert (=> d!92077 e!373811))

(declare-fun res!422395 () Bool)

(assert (=> d!92077 (=> (not res!422395) (not e!373811))))

(assert (=> d!92077 (= res!422395 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986))))))

(declare-fun lt!302908 () Unit!22236)

(declare-fun choose!41 (array!38581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12536) Unit!22236)

(assert (=> d!92077 (= lt!302908 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12533))))

(assert (=> d!92077 (bvslt (size!18859 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92077 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12533) lt!302908)))

(declare-fun b!651445 () Bool)

(assert (=> b!651445 (= e!373811 (arrayNoDuplicates!0 (array!38582 (store (arr!18495 a!2986) i!1108 k!1786) (size!18859 a!2986)) #b00000000000000000000000000000000 Nil!12533))))

(assert (= (and d!92077 res!422395) b!651445))

(declare-fun m!624615 () Bool)

(assert (=> d!92077 m!624615))

(assert (=> b!651445 m!624343))

(declare-fun m!624617 () Bool)

(assert (=> b!651445 m!624617))

(assert (=> b!651191 d!92077))

(declare-fun bm!33756 () Bool)

(declare-fun call!33759 () Bool)

(declare-fun c!74892 () Bool)

(assert (=> bm!33756 (= call!33759 (arrayNoDuplicates!0 lt!302762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74892 (Cons!12532 (select (arr!18495 lt!302762) #b00000000000000000000000000000000) Nil!12533) Nil!12533)))))

(declare-fun b!651446 () Bool)

(declare-fun e!373812 () Bool)

(assert (=> b!651446 (= e!373812 call!33759)))

(declare-fun b!651447 () Bool)

(declare-fun e!373813 () Bool)

(assert (=> b!651447 (= e!373813 e!373812)))

(assert (=> b!651447 (= c!74892 (validKeyInArray!0 (select (arr!18495 lt!302762) #b00000000000000000000000000000000)))))

(declare-fun b!651448 () Bool)

(declare-fun e!373814 () Bool)

(assert (=> b!651448 (= e!373814 (contains!3176 Nil!12533 (select (arr!18495 lt!302762) #b00000000000000000000000000000000)))))

(declare-fun b!651449 () Bool)

(declare-fun e!373815 () Bool)

(assert (=> b!651449 (= e!373815 e!373813)))

(declare-fun res!422396 () Bool)

(assert (=> b!651449 (=> (not res!422396) (not e!373813))))

(assert (=> b!651449 (= res!422396 (not e!373814))))

(declare-fun res!422397 () Bool)

(assert (=> b!651449 (=> (not res!422397) (not e!373814))))

(assert (=> b!651449 (= res!422397 (validKeyInArray!0 (select (arr!18495 lt!302762) #b00000000000000000000000000000000)))))

(declare-fun d!92085 () Bool)

(declare-fun res!422398 () Bool)

(assert (=> d!92085 (=> res!422398 e!373815)))

(assert (=> d!92085 (= res!422398 (bvsge #b00000000000000000000000000000000 (size!18859 lt!302762)))))

(assert (=> d!92085 (= (arrayNoDuplicates!0 lt!302762 #b00000000000000000000000000000000 Nil!12533) e!373815)))

(declare-fun b!651450 () Bool)

(assert (=> b!651450 (= e!373812 call!33759)))

(assert (= (and d!92085 (not res!422398)) b!651449))

(assert (= (and b!651449 res!422397) b!651448))

(assert (= (and b!651449 res!422396) b!651447))

(assert (= (and b!651447 c!74892) b!651450))

(assert (= (and b!651447 (not c!74892)) b!651446))

(assert (= (or b!651450 b!651446) bm!33756))

(declare-fun m!624619 () Bool)

(assert (=> bm!33756 m!624619))

(declare-fun m!624621 () Bool)

(assert (=> bm!33756 m!624621))

(assert (=> b!651447 m!624619))

(assert (=> b!651447 m!624619))

(declare-fun m!624623 () Bool)

(assert (=> b!651447 m!624623))

(assert (=> b!651448 m!624619))

(assert (=> b!651448 m!624619))

(declare-fun m!624625 () Bool)

(assert (=> b!651448 m!624625))

(assert (=> b!651449 m!624619))

(assert (=> b!651449 m!624619))

(assert (=> b!651449 m!624623))

(assert (=> b!651191 d!92085))

(declare-fun d!92089 () Bool)

(assert (=> d!92089 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302914 () Unit!22236)

(declare-fun choose!114 (array!38581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22236)

(assert (=> d!92089 (= lt!302914 (choose!114 lt!302762 (select (arr!18495 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92089 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92089 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!302914)))

(declare-fun bs!19424 () Bool)

(assert (= bs!19424 d!92089))

(assert (=> bs!19424 m!624335))

(assert (=> bs!19424 m!624383))

(assert (=> bs!19424 m!624335))

(declare-fun m!624629 () Bool)

(assert (=> bs!19424 m!624629))

(assert (=> b!651191 d!92089))

(declare-fun b!651519 () Bool)

(declare-fun e!373870 () SeekEntryResult!6935)

(declare-fun lt!302937 () SeekEntryResult!6935)

(assert (=> b!651519 (= e!373870 (seekKeyOrZeroReturnVacant!0 (x!58877 lt!302937) (index!30092 lt!302937) (index!30092 lt!302937) k!1786 a!2986 mask!3053))))

(declare-fun b!651520 () Bool)

(declare-fun c!74911 () Bool)

(declare-fun lt!302936 () (_ BitVec 64))

(assert (=> b!651520 (= c!74911 (= lt!302936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373869 () SeekEntryResult!6935)

(assert (=> b!651520 (= e!373869 e!373870)))

(declare-fun b!651521 () Bool)

(assert (=> b!651521 (= e!373870 (MissingZero!6935 (index!30092 lt!302937)))))

(declare-fun b!651522 () Bool)

(assert (=> b!651522 (= e!373869 (Found!6935 (index!30092 lt!302937)))))

(declare-fun d!92093 () Bool)

(declare-fun lt!302938 () SeekEntryResult!6935)

(assert (=> d!92093 (and (or (is-Undefined!6935 lt!302938) (not (is-Found!6935 lt!302938)) (and (bvsge (index!30091 lt!302938) #b00000000000000000000000000000000) (bvslt (index!30091 lt!302938) (size!18859 a!2986)))) (or (is-Undefined!6935 lt!302938) (is-Found!6935 lt!302938) (not (is-MissingZero!6935 lt!302938)) (and (bvsge (index!30090 lt!302938) #b00000000000000000000000000000000) (bvslt (index!30090 lt!302938) (size!18859 a!2986)))) (or (is-Undefined!6935 lt!302938) (is-Found!6935 lt!302938) (is-MissingZero!6935 lt!302938) (not (is-MissingVacant!6935 lt!302938)) (and (bvsge (index!30093 lt!302938) #b00000000000000000000000000000000) (bvslt (index!30093 lt!302938) (size!18859 a!2986)))) (or (is-Undefined!6935 lt!302938) (ite (is-Found!6935 lt!302938) (= (select (arr!18495 a!2986) (index!30091 lt!302938)) k!1786) (ite (is-MissingZero!6935 lt!302938) (= (select (arr!18495 a!2986) (index!30090 lt!302938)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6935 lt!302938) (= (select (arr!18495 a!2986) (index!30093 lt!302938)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!373868 () SeekEntryResult!6935)

(assert (=> d!92093 (= lt!302938 e!373868)))

(declare-fun c!74910 () Bool)

(assert (=> d!92093 (= c!74910 (and (is-Intermediate!6935 lt!302937) (undefined!7747 lt!302937)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38581 (_ BitVec 32)) SeekEntryResult!6935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92093 (= lt!302937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92093 (validMask!0 mask!3053)))

(assert (=> d!92093 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!302938)))

(declare-fun b!651523 () Bool)

(assert (=> b!651523 (= e!373868 Undefined!6935)))

(declare-fun b!651524 () Bool)

(assert (=> b!651524 (= e!373868 e!373869)))

(assert (=> b!651524 (= lt!302936 (select (arr!18495 a!2986) (index!30092 lt!302937)))))

(declare-fun c!74909 () Bool)

(assert (=> b!651524 (= c!74909 (= lt!302936 k!1786))))

(assert (= (and d!92093 c!74910) b!651523))

(assert (= (and d!92093 (not c!74910)) b!651524))

(assert (= (and b!651524 c!74909) b!651522))

(assert (= (and b!651524 (not c!74909)) b!651520))

(assert (= (and b!651520 c!74911) b!651521))

(assert (= (and b!651520 (not c!74911)) b!651519))

(declare-fun m!624693 () Bool)

(assert (=> b!651519 m!624693))

(declare-fun m!624695 () Bool)

(assert (=> d!92093 m!624695))

(declare-fun m!624697 () Bool)

(assert (=> d!92093 m!624697))

(declare-fun m!624699 () Bool)

(assert (=> d!92093 m!624699))

(declare-fun m!624701 () Bool)

(assert (=> d!92093 m!624701))

(assert (=> d!92093 m!624399))

(assert (=> d!92093 m!624697))

(declare-fun m!624703 () Bool)

(assert (=> d!92093 m!624703))

(declare-fun m!624705 () Bool)

(assert (=> b!651524 m!624705))

(assert (=> b!651193 d!92093))

(declare-fun d!92123 () Bool)

(declare-fun res!422438 () Bool)

(declare-fun e!373875 () Bool)

(assert (=> d!92123 (=> res!422438 e!373875)))

(assert (=> d!92123 (= res!422438 (= (select (arr!18495 lt!302762) index!984) (select (arr!18495 a!2986) j!136)))))

(assert (=> d!92123 (= (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) index!984) e!373875)))

(declare-fun b!651530 () Bool)

(declare-fun e!373876 () Bool)

(assert (=> b!651530 (= e!373875 e!373876)))

(declare-fun res!422439 () Bool)

(assert (=> b!651530 (=> (not res!422439) (not e!373876))))

(assert (=> b!651530 (= res!422439 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18859 lt!302762)))))

(declare-fun b!651531 () Bool)

(assert (=> b!651531 (= e!373876 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92123 (not res!422438)) b!651530))

(assert (= (and b!651530 res!422439) b!651531))

(assert (=> d!92123 m!624585))

(assert (=> b!651531 m!624335))

(declare-fun m!624715 () Bool)

(assert (=> b!651531 m!624715))

(assert (=> b!651204 d!92123))

(declare-fun d!92127 () Bool)

(assert (=> d!92127 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59000 d!92127))

(declare-fun d!92143 () Bool)

(assert (=> d!92143 (= (array_inv!14291 a!2986) (bvsge (size!18859 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59000 d!92143))

(declare-fun b!651580 () Bool)

(declare-fun e!373913 () SeekEntryResult!6935)

(assert (=> b!651580 (= e!373913 Undefined!6935)))

(declare-fun b!651582 () Bool)

(declare-fun e!373914 () SeekEntryResult!6935)

(assert (=> b!651582 (= e!373914 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!302750 lt!302762 mask!3053))))

(declare-fun b!651583 () Bool)

(declare-fun c!74927 () Bool)

(declare-fun lt!302964 () (_ BitVec 64))

(assert (=> b!651583 (= c!74927 (= lt!302964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373915 () SeekEntryResult!6935)

(assert (=> b!651583 (= e!373915 e!373914)))

(declare-fun b!651584 () Bool)

(assert (=> b!651584 (= e!373915 (Found!6935 index!984))))

(declare-fun b!651585 () Bool)

(assert (=> b!651585 (= e!373914 (MissingVacant!6935 vacantSpotIndex!68))))

(declare-fun b!651581 () Bool)

(assert (=> b!651581 (= e!373913 e!373915)))

(declare-fun c!74925 () Bool)

(assert (=> b!651581 (= c!74925 (= lt!302964 lt!302750))))

(declare-fun d!92145 () Bool)

(declare-fun lt!302965 () SeekEntryResult!6935)

(assert (=> d!92145 (and (or (is-Undefined!6935 lt!302965) (not (is-Found!6935 lt!302965)) (and (bvsge (index!30091 lt!302965) #b00000000000000000000000000000000) (bvslt (index!30091 lt!302965) (size!18859 lt!302762)))) (or (is-Undefined!6935 lt!302965) (is-Found!6935 lt!302965) (not (is-MissingVacant!6935 lt!302965)) (not (= (index!30093 lt!302965) vacantSpotIndex!68)) (and (bvsge (index!30093 lt!302965) #b00000000000000000000000000000000) (bvslt (index!30093 lt!302965) (size!18859 lt!302762)))) (or (is-Undefined!6935 lt!302965) (ite (is-Found!6935 lt!302965) (= (select (arr!18495 lt!302762) (index!30091 lt!302965)) lt!302750) (and (is-MissingVacant!6935 lt!302965) (= (index!30093 lt!302965) vacantSpotIndex!68) (= (select (arr!18495 lt!302762) (index!30093 lt!302965)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92145 (= lt!302965 e!373913)))

(declare-fun c!74926 () Bool)

(assert (=> d!92145 (= c!74926 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92145 (= lt!302964 (select (arr!18495 lt!302762) index!984))))

(assert (=> d!92145 (validMask!0 mask!3053)))

(assert (=> d!92145 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302750 lt!302762 mask!3053) lt!302965)))

(assert (= (and d!92145 c!74926) b!651580))

(assert (= (and d!92145 (not c!74926)) b!651581))

(assert (= (and b!651581 c!74925) b!651584))

(assert (= (and b!651581 (not c!74925)) b!651583))

(assert (= (and b!651583 c!74927) b!651585))

(assert (= (and b!651583 (not c!74927)) b!651582))

(assert (=> b!651582 m!624349))

(assert (=> b!651582 m!624349))

(declare-fun m!624763 () Bool)

(assert (=> b!651582 m!624763))

(declare-fun m!624765 () Bool)

(assert (=> d!92145 m!624765))

(declare-fun m!624767 () Bool)

(assert (=> d!92145 m!624767))

(assert (=> d!92145 m!624585))

(assert (=> d!92145 m!624399))

(assert (=> b!651192 d!92145))

(declare-fun d!92157 () Bool)

(declare-fun lt!302968 () (_ BitVec 32))

(assert (=> d!92157 (and (bvsge lt!302968 #b00000000000000000000000000000000) (bvslt lt!302968 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92157 (= lt!302968 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92157 (validMask!0 mask!3053)))

(assert (=> d!92157 (= (nextIndex!0 index!984 x!910 mask!3053) lt!302968)))

(declare-fun bs!19431 () Bool)

(assert (= bs!19431 d!92157))

(declare-fun m!624769 () Bool)

(assert (=> bs!19431 m!624769))

(assert (=> bs!19431 m!624399))

(assert (=> b!651192 d!92157))

(declare-fun d!92159 () Bool)

(declare-fun e!373947 () Bool)

(assert (=> d!92159 e!373947))

(declare-fun res!422473 () Bool)

(assert (=> d!92159 (=> (not res!422473) (not e!373947))))

(assert (=> d!92159 (= res!422473 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18859 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18859 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18859 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986))))))

(declare-fun lt!302996 () Unit!22236)

(declare-fun choose!9 (array!38581 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22236)

(assert (=> d!92159 (= lt!302996 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92159 (validMask!0 mask!3053)))

(assert (=> d!92159 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 mask!3053) lt!302996)))

(declare-fun b!651639 () Bool)

(assert (=> b!651639 (= e!373947 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 (select (arr!18495 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 (select (store (arr!18495 a!2986) i!1108 k!1786) j!136) (array!38582 (store (arr!18495 a!2986) i!1108 k!1786) (size!18859 a!2986)) mask!3053)))))

(assert (= (and d!92159 res!422473) b!651639))

(declare-fun m!624823 () Bool)

(assert (=> d!92159 m!624823))

(assert (=> d!92159 m!624399))

(assert (=> b!651639 m!624343))

(assert (=> b!651639 m!624335))

(assert (=> b!651639 m!624351))

(declare-fun m!624825 () Bool)

(assert (=> b!651639 m!624825))

(assert (=> b!651639 m!624351))

(assert (=> b!651639 m!624335))

(assert (=> b!651639 m!624353))

(assert (=> b!651192 d!92159))

(declare-fun b!651640 () Bool)

(declare-fun e!373948 () SeekEntryResult!6935)

(assert (=> b!651640 (= e!373948 Undefined!6935)))

(declare-fun e!373949 () SeekEntryResult!6935)

(declare-fun b!651642 () Bool)

(assert (=> b!651642 (= e!373949 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302751 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!302750 lt!302762 mask!3053))))

(declare-fun b!651643 () Bool)

(declare-fun c!74952 () Bool)

(declare-fun lt!302997 () (_ BitVec 64))

(assert (=> b!651643 (= c!74952 (= lt!302997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373950 () SeekEntryResult!6935)

(assert (=> b!651643 (= e!373950 e!373949)))

(declare-fun b!651644 () Bool)

(assert (=> b!651644 (= e!373950 (Found!6935 lt!302751))))

(declare-fun b!651645 () Bool)

(assert (=> b!651645 (= e!373949 (MissingVacant!6935 vacantSpotIndex!68))))

(declare-fun b!651641 () Bool)

(assert (=> b!651641 (= e!373948 e!373950)))

(declare-fun c!74950 () Bool)

(assert (=> b!651641 (= c!74950 (= lt!302997 lt!302750))))

(declare-fun lt!302998 () SeekEntryResult!6935)

(declare-fun d!92181 () Bool)

(assert (=> d!92181 (and (or (is-Undefined!6935 lt!302998) (not (is-Found!6935 lt!302998)) (and (bvsge (index!30091 lt!302998) #b00000000000000000000000000000000) (bvslt (index!30091 lt!302998) (size!18859 lt!302762)))) (or (is-Undefined!6935 lt!302998) (is-Found!6935 lt!302998) (not (is-MissingVacant!6935 lt!302998)) (not (= (index!30093 lt!302998) vacantSpotIndex!68)) (and (bvsge (index!30093 lt!302998) #b00000000000000000000000000000000) (bvslt (index!30093 lt!302998) (size!18859 lt!302762)))) (or (is-Undefined!6935 lt!302998) (ite (is-Found!6935 lt!302998) (= (select (arr!18495 lt!302762) (index!30091 lt!302998)) lt!302750) (and (is-MissingVacant!6935 lt!302998) (= (index!30093 lt!302998) vacantSpotIndex!68) (= (select (arr!18495 lt!302762) (index!30093 lt!302998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92181 (= lt!302998 e!373948)))

(declare-fun c!74951 () Bool)

(assert (=> d!92181 (= c!74951 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92181 (= lt!302997 (select (arr!18495 lt!302762) lt!302751))))

(assert (=> d!92181 (validMask!0 mask!3053)))

(assert (=> d!92181 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 lt!302750 lt!302762 mask!3053) lt!302998)))

(assert (= (and d!92181 c!74951) b!651640))

(assert (= (and d!92181 (not c!74951)) b!651641))

(assert (= (and b!651641 c!74950) b!651644))

(assert (= (and b!651641 (not c!74950)) b!651643))

(assert (= (and b!651643 c!74952) b!651645))

(assert (= (and b!651643 (not c!74952)) b!651642))

(declare-fun m!624827 () Bool)

(assert (=> b!651642 m!624827))

(assert (=> b!651642 m!624827))

(declare-fun m!624829 () Bool)

(assert (=> b!651642 m!624829))

(declare-fun m!624831 () Bool)

(assert (=> d!92181 m!624831))

(declare-fun m!624833 () Bool)

(assert (=> d!92181 m!624833))

(declare-fun m!624835 () Bool)

(assert (=> d!92181 m!624835))

(assert (=> d!92181 m!624399))

(assert (=> b!651192 d!92181))

(declare-fun b!651646 () Bool)

(declare-fun e!373951 () SeekEntryResult!6935)

(assert (=> b!651646 (= e!373951 Undefined!6935)))

(declare-fun b!651648 () Bool)

(declare-fun e!373952 () SeekEntryResult!6935)

(assert (=> b!651648 (= e!373952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302751 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18495 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651649 () Bool)

(declare-fun c!74955 () Bool)

(declare-fun lt!302999 () (_ BitVec 64))

(assert (=> b!651649 (= c!74955 (= lt!302999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373953 () SeekEntryResult!6935)

(assert (=> b!651649 (= e!373953 e!373952)))

(declare-fun b!651650 () Bool)

(assert (=> b!651650 (= e!373953 (Found!6935 lt!302751))))

(declare-fun b!651651 () Bool)

(assert (=> b!651651 (= e!373952 (MissingVacant!6935 vacantSpotIndex!68))))

(declare-fun b!651647 () Bool)

(assert (=> b!651647 (= e!373951 e!373953)))

(declare-fun c!74953 () Bool)

(assert (=> b!651647 (= c!74953 (= lt!302999 (select (arr!18495 a!2986) j!136)))))

(declare-fun lt!303000 () SeekEntryResult!6935)

(declare-fun d!92183 () Bool)

(assert (=> d!92183 (and (or (is-Undefined!6935 lt!303000) (not (is-Found!6935 lt!303000)) (and (bvsge (index!30091 lt!303000) #b00000000000000000000000000000000) (bvslt (index!30091 lt!303000) (size!18859 a!2986)))) (or (is-Undefined!6935 lt!303000) (is-Found!6935 lt!303000) (not (is-MissingVacant!6935 lt!303000)) (not (= (index!30093 lt!303000) vacantSpotIndex!68)) (and (bvsge (index!30093 lt!303000) #b00000000000000000000000000000000) (bvslt (index!30093 lt!303000) (size!18859 a!2986)))) (or (is-Undefined!6935 lt!303000) (ite (is-Found!6935 lt!303000) (= (select (arr!18495 a!2986) (index!30091 lt!303000)) (select (arr!18495 a!2986) j!136)) (and (is-MissingVacant!6935 lt!303000) (= (index!30093 lt!303000) vacantSpotIndex!68) (= (select (arr!18495 a!2986) (index!30093 lt!303000)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92183 (= lt!303000 e!373951)))

(declare-fun c!74954 () Bool)

(assert (=> d!92183 (= c!74954 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92183 (= lt!302999 (select (arr!18495 a!2986) lt!302751))))

(assert (=> d!92183 (validMask!0 mask!3053)))

(assert (=> d!92183 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302751 vacantSpotIndex!68 (select (arr!18495 a!2986) j!136) a!2986 mask!3053) lt!303000)))

(assert (= (and d!92183 c!74954) b!651646))

(assert (= (and d!92183 (not c!74954)) b!651647))

(assert (= (and b!651647 c!74953) b!651650))

(assert (= (and b!651647 (not c!74953)) b!651649))

(assert (= (and b!651649 c!74955) b!651651))

(assert (= (and b!651649 (not c!74955)) b!651648))

(assert (=> b!651648 m!624827))

(assert (=> b!651648 m!624827))

(assert (=> b!651648 m!624335))

(declare-fun m!624837 () Bool)

(assert (=> b!651648 m!624837))

(declare-fun m!624839 () Bool)

(assert (=> d!92183 m!624839))

(declare-fun m!624841 () Bool)

(assert (=> d!92183 m!624841))

(declare-fun m!624843 () Bool)

(assert (=> d!92183 m!624843))

(assert (=> d!92183 m!624399))

(assert (=> b!651192 d!92183))

(declare-fun d!92185 () Bool)

(assert (=> d!92185 (arrayNoDuplicates!0 lt!302762 j!136 Nil!12533)))

(declare-fun lt!303001 () Unit!22236)

(assert (=> d!92185 (= lt!303001 (choose!39 lt!302762 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92185 (bvslt (size!18859 lt!302762) #b01111111111111111111111111111111)))

(assert (=> d!92185 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302762 #b00000000000000000000000000000000 j!136) lt!303001)))

(declare-fun bs!19435 () Bool)

(assert (= bs!19435 d!92185))

(assert (=> bs!19435 m!624391))

(declare-fun m!624845 () Bool)

(assert (=> bs!19435 m!624845))

(assert (=> b!651196 d!92185))

(declare-fun d!92187 () Bool)

(assert (=> d!92187 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18859 lt!302762)) (not (= (select (arr!18495 lt!302762) j!136) (select (arr!18495 a!2986) j!136))))))

(declare-fun lt!303010 () Unit!22236)

(declare-fun choose!21 (array!38581 (_ BitVec 64) (_ BitVec 32) List!12536) Unit!22236)

(assert (=> d!92187 (= lt!303010 (choose!21 lt!302762 (select (arr!18495 a!2986) j!136) j!136 Nil!12533))))

(assert (=> d!92187 (bvslt (size!18859 lt!302762) #b01111111111111111111111111111111)))

(assert (=> d!92187 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302762 (select (arr!18495 a!2986) j!136) j!136 Nil!12533) lt!303010)))

(declare-fun bs!19436 () Bool)

(assert (= bs!19436 d!92187))

(assert (=> bs!19436 m!624595))

(assert (=> bs!19436 m!624335))

(declare-fun m!624847 () Bool)

(assert (=> bs!19436 m!624847))

(assert (=> b!651196 d!92187))

(declare-fun d!92189 () Bool)

(assert (=> d!92189 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303014 () Unit!22236)

(assert (=> d!92189 (= lt!303014 (choose!114 lt!302762 (select (arr!18495 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92189 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92189 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302762 (select (arr!18495 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303014)))

(declare-fun bs!19437 () Bool)

(assert (= bs!19437 d!92189))

(assert (=> bs!19437 m!624335))

(assert (=> bs!19437 m!624393))

(assert (=> bs!19437 m!624335))

(declare-fun m!624849 () Bool)

(assert (=> bs!19437 m!624849))

(assert (=> b!651196 d!92189))

(declare-fun d!92191 () Bool)

(declare-fun res!422480 () Bool)

(declare-fun e!373963 () Bool)

(assert (=> d!92191 (=> res!422480 e!373963)))

(assert (=> d!92191 (= res!422480 (= (select (arr!18495 lt!302762) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18495 a!2986) j!136)))))

(assert (=> d!92191 (= (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!373963)))

(declare-fun b!651664 () Bool)

(declare-fun e!373964 () Bool)

(assert (=> b!651664 (= e!373963 e!373964)))

(declare-fun res!422481 () Bool)

(assert (=> b!651664 (=> (not res!422481) (not e!373964))))

(assert (=> b!651664 (= res!422481 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18859 lt!302762)))))

(declare-fun b!651665 () Bool)

(assert (=> b!651665 (= e!373964 (arrayContainsKey!0 lt!302762 (select (arr!18495 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92191 (not res!422480)) b!651664))

(assert (= (and b!651664 res!422481) b!651665))

(declare-fun m!624859 () Bool)

(assert (=> d!92191 m!624859))

(assert (=> b!651665 m!624335))

(declare-fun m!624861 () Bool)

(assert (=> b!651665 m!624861))

(assert (=> b!651196 d!92191))

(assert (=> b!651196 d!92077))

(declare-fun c!74959 () Bool)

(declare-fun bm!33772 () Bool)

(declare-fun call!33775 () Bool)

(assert (=> bm!33772 (= call!33775 (arrayNoDuplicates!0 lt!302762 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74959 (Cons!12532 (select (arr!18495 lt!302762) j!136) Nil!12533) Nil!12533)))))

(declare-fun b!651666 () Bool)

(declare-fun e!373965 () Bool)

(assert (=> b!651666 (= e!373965 call!33775)))

(declare-fun b!651667 () Bool)

(declare-fun e!373966 () Bool)

(assert (=> b!651667 (= e!373966 e!373965)))

(assert (=> b!651667 (= c!74959 (validKeyInArray!0 (select (arr!18495 lt!302762) j!136)))))

(declare-fun b!651668 () Bool)

(declare-fun e!373967 () Bool)

(assert (=> b!651668 (= e!373967 (contains!3176 Nil!12533 (select (arr!18495 lt!302762) j!136)))))

(declare-fun b!651669 () Bool)

(declare-fun e!373968 () Bool)

(assert (=> b!651669 (= e!373968 e!373966)))

(declare-fun res!422482 () Bool)

(assert (=> b!651669 (=> (not res!422482) (not e!373966))))

(assert (=> b!651669 (= res!422482 (not e!373967))))

(declare-fun res!422483 () Bool)

(assert (=> b!651669 (=> (not res!422483) (not e!373967))))

(assert (=> b!651669 (= res!422483 (validKeyInArray!0 (select (arr!18495 lt!302762) j!136)))))

(declare-fun d!92195 () Bool)

(declare-fun res!422484 () Bool)

(assert (=> d!92195 (=> res!422484 e!373968)))

(assert (=> d!92195 (= res!422484 (bvsge j!136 (size!18859 lt!302762)))))

(assert (=> d!92195 (= (arrayNoDuplicates!0 lt!302762 j!136 Nil!12533) e!373968)))

(declare-fun b!651670 () Bool)

(assert (=> b!651670 (= e!373965 call!33775)))

(assert (= (and d!92195 (not res!422484)) b!651669))

(assert (= (and b!651669 res!422483) b!651668))

(assert (= (and b!651669 res!422482) b!651667))

(assert (= (and b!651667 c!74959) b!651670))

(assert (= (and b!651667 (not c!74959)) b!651666))

(assert (= (or b!651670 b!651666) bm!33772))

(assert (=> bm!33772 m!624595))

(declare-fun m!624863 () Bool)

(assert (=> bm!33772 m!624863))

(assert (=> b!651667 m!624595))

(assert (=> b!651667 m!624595))

(declare-fun m!624865 () Bool)

(assert (=> b!651667 m!624865))

(assert (=> b!651668 m!624595))

(assert (=> b!651668 m!624595))

(declare-fun m!624867 () Bool)

(assert (=> b!651668 m!624867))

(assert (=> b!651669 m!624595))

(assert (=> b!651669 m!624595))

(assert (=> b!651669 m!624865))

(assert (=> b!651196 d!92195))

(assert (=> b!651196 d!92085))

(declare-fun b!651679 () Bool)

(declare-fun e!373975 () Bool)

(declare-fun call!33778 () Bool)

(assert (=> b!651679 (= e!373975 call!33778)))

(declare-fun b!651680 () Bool)

(declare-fun e!373976 () Bool)

(declare-fun e!373977 () Bool)

(assert (=> b!651680 (= e!373976 e!373977)))

(declare-fun c!74962 () Bool)

(assert (=> b!651680 (= c!74962 (validKeyInArray!0 (select (arr!18495 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92197 () Bool)

(declare-fun res!422490 () Bool)

(assert (=> d!92197 (=> res!422490 e!373976)))

(assert (=> d!92197 (= res!422490 (bvsge #b00000000000000000000000000000000 (size!18859 a!2986)))))

(assert (=> d!92197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!373976)))

(declare-fun b!651681 () Bool)

(assert (=> b!651681 (= e!373977 e!373975)))

(declare-fun lt!303023 () (_ BitVec 64))

(assert (=> b!651681 (= lt!303023 (select (arr!18495 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303022 () Unit!22236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38581 (_ BitVec 64) (_ BitVec 32)) Unit!22236)

(assert (=> b!651681 (= lt!303022 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303023 #b00000000000000000000000000000000))))

(assert (=> b!651681 (arrayContainsKey!0 a!2986 lt!303023 #b00000000000000000000000000000000)))

(declare-fun lt!303021 () Unit!22236)

(assert (=> b!651681 (= lt!303021 lt!303022)))

(declare-fun res!422489 () Bool)

(assert (=> b!651681 (= res!422489 (= (seekEntryOrOpen!0 (select (arr!18495 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6935 #b00000000000000000000000000000000)))))

