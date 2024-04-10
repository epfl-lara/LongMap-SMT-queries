; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53964 () Bool)

(assert start!53964)

(declare-fun b!589291 () Bool)

(declare-fun res!376828 () Bool)

(declare-fun e!336449 () Bool)

(assert (=> b!589291 (=> (not res!376828) (not e!336449))))

(declare-datatypes ((array!36808 0))(
  ( (array!36809 (arr!17677 (Array (_ BitVec 32) (_ BitVec 64))) (size!18041 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36808)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36808 (_ BitVec 32)) Bool)

(assert (=> b!589291 (= res!376828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589292 () Bool)

(declare-fun res!376838 () Bool)

(declare-fun e!336450 () Bool)

(assert (=> b!589292 (=> (not res!376838) (not e!336450))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589292 (= res!376838 (validKeyInArray!0 k0!1786))))

(declare-fun b!589293 () Bool)

(declare-fun e!336447 () Bool)

(declare-datatypes ((SeekEntryResult!6117 0))(
  ( (MissingZero!6117 (index!26698 (_ BitVec 32))) (Found!6117 (index!26699 (_ BitVec 32))) (Intermediate!6117 (undefined!6929 Bool) (index!26700 (_ BitVec 32)) (x!55491 (_ BitVec 32))) (Undefined!6117) (MissingVacant!6117 (index!26701 (_ BitVec 32))) )
))
(declare-fun lt!267255 () SeekEntryResult!6117)

(declare-fun lt!267260 () SeekEntryResult!6117)

(assert (=> b!589293 (= e!336447 (= lt!267255 lt!267260))))

(declare-fun b!589294 () Bool)

(declare-datatypes ((Unit!18386 0))(
  ( (Unit!18387) )
))
(declare-fun e!336448 () Unit!18386)

(declare-fun Unit!18388 () Unit!18386)

(assert (=> b!589294 (= e!336448 Unit!18388)))

(declare-fun res!376833 () Bool)

(assert (=> start!53964 (=> (not res!376833) (not e!336450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53964 (= res!376833 (validMask!0 mask!3053))))

(assert (=> start!53964 e!336450))

(assert (=> start!53964 true))

(declare-fun array_inv!13473 (array!36808) Bool)

(assert (=> start!53964 (array_inv!13473 a!2986)))

(declare-fun b!589295 () Bool)

(assert (=> b!589295 (= e!336450 e!336449)))

(declare-fun res!376830 () Bool)

(assert (=> b!589295 (=> (not res!376830) (not e!336449))))

(declare-fun lt!267258 () SeekEntryResult!6117)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589295 (= res!376830 (or (= lt!267258 (MissingZero!6117 i!1108)) (= lt!267258 (MissingVacant!6117 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36808 (_ BitVec 32)) SeekEntryResult!6117)

(assert (=> b!589295 (= lt!267258 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589296 () Bool)

(declare-fun Unit!18389 () Unit!18386)

(assert (=> b!589296 (= e!336448 Unit!18389)))

(assert (=> b!589296 false))

(declare-fun b!589297 () Bool)

(declare-fun e!336445 () Bool)

(assert (=> b!589297 (= e!336445 (not true))))

(declare-fun lt!267261 () Unit!18386)

(assert (=> b!589297 (= lt!267261 e!336448)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!267256 () array!36808)

(declare-fun c!66599 () Bool)

(declare-fun lt!267257 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36808 (_ BitVec 32)) SeekEntryResult!6117)

(assert (=> b!589297 (= c!66599 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267257 lt!267256 mask!3053) Undefined!6117))))

(assert (=> b!589297 e!336447))

(declare-fun res!376836 () Bool)

(assert (=> b!589297 (=> (not res!376836) (not e!336447))))

(declare-fun lt!267259 () (_ BitVec 32))

(assert (=> b!589297 (= res!376836 (= lt!267260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267259 vacantSpotIndex!68 lt!267257 lt!267256 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589297 (= lt!267260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267259 vacantSpotIndex!68 (select (arr!17677 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589297 (= lt!267257 (select (store (arr!17677 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267262 () Unit!18386)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36808 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18386)

(assert (=> b!589297 (= lt!267262 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267259 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589297 (= lt!267259 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589298 () Bool)

(declare-fun e!336444 () Bool)

(assert (=> b!589298 (= e!336444 e!336445)))

(declare-fun res!376827 () Bool)

(assert (=> b!589298 (=> (not res!376827) (not e!336445))))

(assert (=> b!589298 (= res!376827 (and (= lt!267255 (Found!6117 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17677 a!2986) index!984) (select (arr!17677 a!2986) j!136))) (not (= (select (arr!17677 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589298 (= lt!267255 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17677 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589299 () Bool)

(declare-fun res!376837 () Bool)

(assert (=> b!589299 (=> (not res!376837) (not e!336450))))

(declare-fun arrayContainsKey!0 (array!36808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589299 (= res!376837 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589300 () Bool)

(declare-fun res!376835 () Bool)

(assert (=> b!589300 (=> (not res!376835) (not e!336450))))

(assert (=> b!589300 (= res!376835 (validKeyInArray!0 (select (arr!17677 a!2986) j!136)))))

(declare-fun b!589301 () Bool)

(declare-fun res!376829 () Bool)

(assert (=> b!589301 (=> (not res!376829) (not e!336450))))

(assert (=> b!589301 (= res!376829 (and (= (size!18041 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18041 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18041 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589302 () Bool)

(declare-fun res!376832 () Bool)

(assert (=> b!589302 (=> (not res!376832) (not e!336449))))

(declare-datatypes ((List!11718 0))(
  ( (Nil!11715) (Cons!11714 (h!12759 (_ BitVec 64)) (t!17946 List!11718)) )
))
(declare-fun arrayNoDuplicates!0 (array!36808 (_ BitVec 32) List!11718) Bool)

(assert (=> b!589302 (= res!376832 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11715))))

(declare-fun b!589303 () Bool)

(declare-fun res!376831 () Bool)

(assert (=> b!589303 (=> (not res!376831) (not e!336449))))

(assert (=> b!589303 (= res!376831 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17677 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589304 () Bool)

(assert (=> b!589304 (= e!336449 e!336444)))

(declare-fun res!376834 () Bool)

(assert (=> b!589304 (=> (not res!376834) (not e!336444))))

(assert (=> b!589304 (= res!376834 (= (select (store (arr!17677 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589304 (= lt!267256 (array!36809 (store (arr!17677 a!2986) i!1108 k0!1786) (size!18041 a!2986)))))

(assert (= (and start!53964 res!376833) b!589301))

(assert (= (and b!589301 res!376829) b!589300))

(assert (= (and b!589300 res!376835) b!589292))

(assert (= (and b!589292 res!376838) b!589299))

(assert (= (and b!589299 res!376837) b!589295))

(assert (= (and b!589295 res!376830) b!589291))

(assert (= (and b!589291 res!376828) b!589302))

(assert (= (and b!589302 res!376832) b!589303))

(assert (= (and b!589303 res!376831) b!589304))

(assert (= (and b!589304 res!376834) b!589298))

(assert (= (and b!589298 res!376827) b!589297))

(assert (= (and b!589297 res!376836) b!589293))

(assert (= (and b!589297 c!66599) b!589296))

(assert (= (and b!589297 (not c!66599)) b!589294))

(declare-fun m!567827 () Bool)

(assert (=> b!589295 m!567827))

(declare-fun m!567829 () Bool)

(assert (=> b!589303 m!567829))

(declare-fun m!567831 () Bool)

(assert (=> start!53964 m!567831))

(declare-fun m!567833 () Bool)

(assert (=> start!53964 m!567833))

(declare-fun m!567835 () Bool)

(assert (=> b!589298 m!567835))

(declare-fun m!567837 () Bool)

(assert (=> b!589298 m!567837))

(assert (=> b!589298 m!567837))

(declare-fun m!567839 () Bool)

(assert (=> b!589298 m!567839))

(declare-fun m!567841 () Bool)

(assert (=> b!589297 m!567841))

(declare-fun m!567843 () Bool)

(assert (=> b!589297 m!567843))

(declare-fun m!567845 () Bool)

(assert (=> b!589297 m!567845))

(assert (=> b!589297 m!567837))

(declare-fun m!567847 () Bool)

(assert (=> b!589297 m!567847))

(assert (=> b!589297 m!567837))

(declare-fun m!567849 () Bool)

(assert (=> b!589297 m!567849))

(declare-fun m!567851 () Bool)

(assert (=> b!589297 m!567851))

(declare-fun m!567853 () Bool)

(assert (=> b!589297 m!567853))

(declare-fun m!567855 () Bool)

(assert (=> b!589291 m!567855))

(assert (=> b!589300 m!567837))

(assert (=> b!589300 m!567837))

(declare-fun m!567857 () Bool)

(assert (=> b!589300 m!567857))

(declare-fun m!567859 () Bool)

(assert (=> b!589292 m!567859))

(assert (=> b!589304 m!567847))

(declare-fun m!567861 () Bool)

(assert (=> b!589304 m!567861))

(declare-fun m!567863 () Bool)

(assert (=> b!589299 m!567863))

(declare-fun m!567865 () Bool)

(assert (=> b!589302 m!567865))

(check-sat (not b!589292) (not b!589295) (not b!589302) (not b!589299) (not b!589300) (not b!589297) (not b!589291) (not b!589298) (not start!53964))
(check-sat)
