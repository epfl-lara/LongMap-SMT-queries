; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54520 () Bool)

(assert start!54520)

(declare-fun b!595309 () Bool)

(declare-fun res!381197 () Bool)

(declare-fun e!340140 () Bool)

(assert (=> b!595309 (=> res!381197 e!340140)))

(declare-datatypes ((List!11795 0))(
  ( (Nil!11792) (Cons!11791 (h!12836 (_ BitVec 64)) (t!18023 List!11795)) )
))
(declare-fun contains!2930 (List!11795 (_ BitVec 64)) Bool)

(assert (=> b!595309 (= res!381197 (contains!2930 Nil!11792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595310 () Bool)

(declare-fun res!381208 () Bool)

(declare-fun e!340135 () Bool)

(assert (=> b!595310 (=> (not res!381208) (not e!340135))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595310 (= res!381208 (validKeyInArray!0 k!1786))))

(declare-fun b!595311 () Bool)

(declare-fun res!381205 () Bool)

(assert (=> b!595311 (=> res!381205 e!340140)))

(declare-fun noDuplicate!249 (List!11795) Bool)

(assert (=> b!595311 (= res!381205 (not (noDuplicate!249 Nil!11792)))))

(declare-fun b!595312 () Bool)

(declare-fun e!340138 () Bool)

(declare-fun e!340134 () Bool)

(assert (=> b!595312 (= e!340138 e!340134)))

(declare-fun res!381202 () Bool)

(assert (=> b!595312 (=> res!381202 e!340134)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270311 () (_ BitVec 64))

(declare-fun lt!270305 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36980 0))(
  ( (array!36981 (arr!17754 (Array (_ BitVec 32) (_ BitVec 64))) (size!18118 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36980)

(assert (=> b!595312 (= res!381202 (or (not (= (select (arr!17754 a!2986) j!136) lt!270305)) (not (= (select (arr!17754 a!2986) j!136) lt!270311)) (bvsge j!136 index!984)))))

(declare-fun b!595313 () Bool)

(declare-fun res!381209 () Bool)

(declare-fun e!340133 () Bool)

(assert (=> b!595313 (=> (not res!381209) (not e!340133))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!595313 (= res!381209 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17754 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595314 () Bool)

(declare-fun res!381215 () Bool)

(assert (=> b!595314 (=> (not res!381215) (not e!340135))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595314 (= res!381215 (and (= (size!18118 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18118 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18118 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595315 () Bool)

(assert (=> b!595315 (= e!340140 true)))

(declare-fun lt!270313 () Bool)

(assert (=> b!595315 (= lt!270313 (contains!2930 Nil!11792 k!1786))))

(declare-fun lt!270309 () array!36980)

(declare-fun b!595316 () Bool)

(declare-fun e!340137 () Bool)

(declare-fun arrayContainsKey!0 (array!36980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595316 (= e!340137 (arrayContainsKey!0 lt!270309 (select (arr!17754 a!2986) j!136) index!984))))

(declare-fun b!595317 () Bool)

(declare-fun res!381213 () Bool)

(assert (=> b!595317 (=> (not res!381213) (not e!340133))))

(declare-fun arrayNoDuplicates!0 (array!36980 (_ BitVec 32) List!11795) Bool)

(assert (=> b!595317 (= res!381213 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11792))))

(declare-fun b!595319 () Bool)

(assert (=> b!595319 (= e!340134 e!340137)))

(declare-fun res!381206 () Bool)

(assert (=> b!595319 (=> (not res!381206) (not e!340137))))

(assert (=> b!595319 (= res!381206 (arrayContainsKey!0 lt!270309 (select (arr!17754 a!2986) j!136) j!136))))

(declare-fun b!595320 () Bool)

(declare-fun res!381204 () Bool)

(assert (=> b!595320 (=> (not res!381204) (not e!340135))))

(assert (=> b!595320 (= res!381204 (validKeyInArray!0 (select (arr!17754 a!2986) j!136)))))

(declare-fun b!595321 () Bool)

(declare-fun res!381199 () Bool)

(assert (=> b!595321 (=> (not res!381199) (not e!340135))))

(assert (=> b!595321 (= res!381199 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595322 () Bool)

(declare-datatypes ((Unit!18694 0))(
  ( (Unit!18695) )
))
(declare-fun e!340131 () Unit!18694)

(declare-fun Unit!18696 () Unit!18694)

(assert (=> b!595322 (= e!340131 Unit!18696)))

(declare-fun b!595323 () Bool)

(assert (=> b!595323 (= e!340135 e!340133)))

(declare-fun res!381195 () Bool)

(assert (=> b!595323 (=> (not res!381195) (not e!340133))))

(declare-datatypes ((SeekEntryResult!6194 0))(
  ( (MissingZero!6194 (index!27024 (_ BitVec 32))) (Found!6194 (index!27025 (_ BitVec 32))) (Intermediate!6194 (undefined!7006 Bool) (index!27026 (_ BitVec 32)) (x!55830 (_ BitVec 32))) (Undefined!6194) (MissingVacant!6194 (index!27027 (_ BitVec 32))) )
))
(declare-fun lt!270302 () SeekEntryResult!6194)

(assert (=> b!595323 (= res!381195 (or (= lt!270302 (MissingZero!6194 i!1108)) (= lt!270302 (MissingVacant!6194 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36980 (_ BitVec 32)) SeekEntryResult!6194)

(assert (=> b!595323 (= lt!270302 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595324 () Bool)

(declare-fun e!340130 () Bool)

(declare-fun e!340129 () Bool)

(assert (=> b!595324 (= e!340130 e!340129)))

(declare-fun res!381214 () Bool)

(assert (=> b!595324 (=> (not res!381214) (not e!340129))))

(declare-fun lt!270306 () SeekEntryResult!6194)

(assert (=> b!595324 (= res!381214 (and (= lt!270306 (Found!6194 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17754 a!2986) index!984) (select (arr!17754 a!2986) j!136))) (not (= (select (arr!17754 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36980 (_ BitVec 32)) SeekEntryResult!6194)

(assert (=> b!595324 (= lt!270306 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17754 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595325 () Bool)

(declare-fun res!381207 () Bool)

(assert (=> b!595325 (=> res!381207 e!340140)))

(assert (=> b!595325 (= res!381207 (contains!2930 Nil!11792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595326 () Bool)

(declare-fun e!340136 () Bool)

(declare-fun lt!270307 () SeekEntryResult!6194)

(assert (=> b!595326 (= e!340136 (= lt!270306 lt!270307))))

(declare-fun b!595327 () Bool)

(declare-fun Unit!18697 () Unit!18694)

(assert (=> b!595327 (= e!340131 Unit!18697)))

(assert (=> b!595327 false))

(declare-fun b!595328 () Bool)

(assert (=> b!595328 (= e!340133 e!340130)))

(declare-fun res!381198 () Bool)

(assert (=> b!595328 (=> (not res!381198) (not e!340130))))

(assert (=> b!595328 (= res!381198 (= (select (store (arr!17754 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595328 (= lt!270309 (array!36981 (store (arr!17754 a!2986) i!1108 k!1786) (size!18118 a!2986)))))

(declare-fun b!595318 () Bool)

(declare-fun e!340128 () Bool)

(assert (=> b!595318 (= e!340129 (not e!340128))))

(declare-fun res!381212 () Bool)

(assert (=> b!595318 (=> res!381212 e!340128)))

(declare-fun lt!270308 () SeekEntryResult!6194)

(assert (=> b!595318 (= res!381212 (not (= lt!270308 (Found!6194 index!984))))))

(declare-fun lt!270303 () Unit!18694)

(assert (=> b!595318 (= lt!270303 e!340131)))

(declare-fun c!67424 () Bool)

(assert (=> b!595318 (= c!67424 (= lt!270308 Undefined!6194))))

(assert (=> b!595318 (= lt!270308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270305 lt!270309 mask!3053))))

(assert (=> b!595318 e!340136))

(declare-fun res!381201 () Bool)

(assert (=> b!595318 (=> (not res!381201) (not e!340136))))

(declare-fun lt!270304 () (_ BitVec 32))

(assert (=> b!595318 (= res!381201 (= lt!270307 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270304 vacantSpotIndex!68 lt!270305 lt!270309 mask!3053)))))

(assert (=> b!595318 (= lt!270307 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270304 vacantSpotIndex!68 (select (arr!17754 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595318 (= lt!270305 (select (store (arr!17754 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270310 () Unit!18694)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36980 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18694)

(assert (=> b!595318 (= lt!270310 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270304 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595318 (= lt!270304 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!381200 () Bool)

(assert (=> start!54520 (=> (not res!381200) (not e!340135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54520 (= res!381200 (validMask!0 mask!3053))))

(assert (=> start!54520 e!340135))

(assert (=> start!54520 true))

(declare-fun array_inv!13550 (array!36980) Bool)

(assert (=> start!54520 (array_inv!13550 a!2986)))

(declare-fun b!595329 () Bool)

(declare-fun res!381196 () Bool)

(assert (=> b!595329 (=> (not res!381196) (not e!340133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36980 (_ BitVec 32)) Bool)

(assert (=> b!595329 (= res!381196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595330 () Bool)

(declare-fun e!340139 () Bool)

(assert (=> b!595330 (= e!340128 e!340139)))

(declare-fun res!381210 () Bool)

(assert (=> b!595330 (=> res!381210 e!340139)))

(assert (=> b!595330 (= res!381210 (or (not (= (select (arr!17754 a!2986) j!136) lt!270305)) (not (= (select (arr!17754 a!2986) j!136) lt!270311)) (bvsge j!136 index!984)))))

(assert (=> b!595330 e!340138))

(declare-fun res!381203 () Bool)

(assert (=> b!595330 (=> (not res!381203) (not e!340138))))

(assert (=> b!595330 (= res!381203 (= lt!270311 (select (arr!17754 a!2986) j!136)))))

(assert (=> b!595330 (= lt!270311 (select (store (arr!17754 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595331 () Bool)

(assert (=> b!595331 (= e!340139 e!340140)))

(declare-fun res!381211 () Bool)

(assert (=> b!595331 (=> res!381211 e!340140)))

(assert (=> b!595331 (= res!381211 (or (bvsge (size!18118 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18118 a!2986))))))

(assert (=> b!595331 (arrayContainsKey!0 lt!270309 (select (arr!17754 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270312 () Unit!18694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36980 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18694)

(assert (=> b!595331 (= lt!270312 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270309 (select (arr!17754 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54520 res!381200) b!595314))

(assert (= (and b!595314 res!381215) b!595320))

(assert (= (and b!595320 res!381204) b!595310))

(assert (= (and b!595310 res!381208) b!595321))

(assert (= (and b!595321 res!381199) b!595323))

(assert (= (and b!595323 res!381195) b!595329))

(assert (= (and b!595329 res!381196) b!595317))

(assert (= (and b!595317 res!381213) b!595313))

(assert (= (and b!595313 res!381209) b!595328))

(assert (= (and b!595328 res!381198) b!595324))

(assert (= (and b!595324 res!381214) b!595318))

(assert (= (and b!595318 res!381201) b!595326))

(assert (= (and b!595318 c!67424) b!595327))

(assert (= (and b!595318 (not c!67424)) b!595322))

(assert (= (and b!595318 (not res!381212)) b!595330))

(assert (= (and b!595330 res!381203) b!595312))

(assert (= (and b!595312 (not res!381202)) b!595319))

(assert (= (and b!595319 res!381206) b!595316))

(assert (= (and b!595330 (not res!381210)) b!595331))

(assert (= (and b!595331 (not res!381211)) b!595311))

(assert (= (and b!595311 (not res!381205)) b!595325))

(assert (= (and b!595325 (not res!381207)) b!595309))

(assert (= (and b!595309 (not res!381197)) b!595315))

(declare-fun m!572981 () Bool)

(assert (=> b!595331 m!572981))

(assert (=> b!595331 m!572981))

(declare-fun m!572983 () Bool)

(assert (=> b!595331 m!572983))

(assert (=> b!595331 m!572981))

(declare-fun m!572985 () Bool)

(assert (=> b!595331 m!572985))

(declare-fun m!572987 () Bool)

(assert (=> b!595323 m!572987))

(declare-fun m!572989 () Bool)

(assert (=> b!595309 m!572989))

(assert (=> b!595330 m!572981))

(declare-fun m!572991 () Bool)

(assert (=> b!595330 m!572991))

(declare-fun m!572993 () Bool)

(assert (=> b!595330 m!572993))

(declare-fun m!572995 () Bool)

(assert (=> start!54520 m!572995))

(declare-fun m!572997 () Bool)

(assert (=> start!54520 m!572997))

(declare-fun m!572999 () Bool)

(assert (=> b!595311 m!572999))

(declare-fun m!573001 () Bool)

(assert (=> b!595315 m!573001))

(assert (=> b!595328 m!572991))

(declare-fun m!573003 () Bool)

(assert (=> b!595328 m!573003))

(declare-fun m!573005 () Bool)

(assert (=> b!595324 m!573005))

(assert (=> b!595324 m!572981))

(assert (=> b!595324 m!572981))

(declare-fun m!573007 () Bool)

(assert (=> b!595324 m!573007))

(declare-fun m!573009 () Bool)

(assert (=> b!595318 m!573009))

(declare-fun m!573011 () Bool)

(assert (=> b!595318 m!573011))

(declare-fun m!573013 () Bool)

(assert (=> b!595318 m!573013))

(declare-fun m!573015 () Bool)

(assert (=> b!595318 m!573015))

(assert (=> b!595318 m!572981))

(assert (=> b!595318 m!572981))

(declare-fun m!573017 () Bool)

(assert (=> b!595318 m!573017))

(assert (=> b!595318 m!572991))

(declare-fun m!573019 () Bool)

(assert (=> b!595318 m!573019))

(declare-fun m!573021 () Bool)

(assert (=> b!595329 m!573021))

(declare-fun m!573023 () Bool)

(assert (=> b!595317 m!573023))

(declare-fun m!573025 () Bool)

(assert (=> b!595313 m!573025))

(declare-fun m!573027 () Bool)

(assert (=> b!595325 m!573027))

(assert (=> b!595320 m!572981))

(assert (=> b!595320 m!572981))

(declare-fun m!573029 () Bool)

(assert (=> b!595320 m!573029))

(assert (=> b!595312 m!572981))

(declare-fun m!573031 () Bool)

(assert (=> b!595310 m!573031))

(declare-fun m!573033 () Bool)

(assert (=> b!595321 m!573033))

(assert (=> b!595316 m!572981))

(assert (=> b!595316 m!572981))

(declare-fun m!573035 () Bool)

(assert (=> b!595316 m!573035))

(assert (=> b!595319 m!572981))

(assert (=> b!595319 m!572981))

(declare-fun m!573037 () Bool)

(assert (=> b!595319 m!573037))

(push 1)

