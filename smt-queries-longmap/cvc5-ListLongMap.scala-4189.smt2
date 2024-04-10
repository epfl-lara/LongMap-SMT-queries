; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57110 () Bool)

(assert start!57110)

(declare-fun b!632307 () Bool)

(declare-fun e!361504 () Bool)

(declare-fun e!361503 () Bool)

(assert (=> b!632307 (= e!361504 e!361503)))

(declare-fun res!408928 () Bool)

(assert (=> b!632307 (=> (not res!408928) (not e!361503))))

(declare-datatypes ((SeekEntryResult!6737 0))(
  ( (MissingZero!6737 (index!29241 (_ BitVec 32))) (Found!6737 (index!29242 (_ BitVec 32))) (Intermediate!6737 (undefined!7549 Bool) (index!29243 (_ BitVec 32)) (x!57980 (_ BitVec 32))) (Undefined!6737) (MissingVacant!6737 (index!29244 (_ BitVec 32))) )
))
(declare-fun lt!292214 () SeekEntryResult!6737)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632307 (= res!408928 (or (= lt!292214 (MissingZero!6737 i!1108)) (= lt!292214 (MissingVacant!6737 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38129 0))(
  ( (array!38130 (arr!18297 (Array (_ BitVec 32) (_ BitVec 64))) (size!18661 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38129)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38129 (_ BitVec 32)) SeekEntryResult!6737)

(assert (=> b!632307 (= lt!292214 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632308 () Bool)

(declare-fun res!408930 () Bool)

(assert (=> b!632308 (=> (not res!408930) (not e!361503))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632308 (= res!408930 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18297 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632310 () Bool)

(declare-fun e!361506 () Bool)

(declare-fun e!361499 () Bool)

(assert (=> b!632310 (= e!361506 (not e!361499))))

(declare-fun res!408934 () Bool)

(assert (=> b!632310 (=> res!408934 e!361499)))

(declare-fun lt!292218 () SeekEntryResult!6737)

(assert (=> b!632310 (= res!408934 (not (= lt!292218 (Found!6737 index!984))))))

(declare-datatypes ((Unit!21282 0))(
  ( (Unit!21283) )
))
(declare-fun lt!292216 () Unit!21282)

(declare-fun e!361500 () Unit!21282)

(assert (=> b!632310 (= lt!292216 e!361500)))

(declare-fun c!72059 () Bool)

(assert (=> b!632310 (= c!72059 (= lt!292218 Undefined!6737))))

(declare-fun lt!292217 () (_ BitVec 64))

(declare-fun lt!292212 () array!38129)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38129 (_ BitVec 32)) SeekEntryResult!6737)

(assert (=> b!632310 (= lt!292218 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292217 lt!292212 mask!3053))))

(declare-fun e!361501 () Bool)

(assert (=> b!632310 e!361501))

(declare-fun res!408929 () Bool)

(assert (=> b!632310 (=> (not res!408929) (not e!361501))))

(declare-fun lt!292215 () SeekEntryResult!6737)

(declare-fun lt!292219 () (_ BitVec 32))

(assert (=> b!632310 (= res!408929 (= lt!292215 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292219 vacantSpotIndex!68 lt!292217 lt!292212 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!632310 (= lt!292215 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292219 vacantSpotIndex!68 (select (arr!18297 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632310 (= lt!292217 (select (store (arr!18297 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292211 () Unit!21282)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21282)

(assert (=> b!632310 (= lt!292211 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292219 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632310 (= lt!292219 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632311 () Bool)

(declare-fun e!361505 () Bool)

(assert (=> b!632311 (= e!361505 e!361506)))

(declare-fun res!408927 () Bool)

(assert (=> b!632311 (=> (not res!408927) (not e!361506))))

(declare-fun lt!292213 () SeekEntryResult!6737)

(assert (=> b!632311 (= res!408927 (and (= lt!292213 (Found!6737 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18297 a!2986) index!984) (select (arr!18297 a!2986) j!136))) (not (= (select (arr!18297 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632311 (= lt!292213 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18297 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632312 () Bool)

(declare-fun Unit!21284 () Unit!21282)

(assert (=> b!632312 (= e!361500 Unit!21284)))

(assert (=> b!632312 false))

(declare-fun b!632313 () Bool)

(assert (=> b!632313 (= e!361499 true)))

(assert (=> b!632313 (= (select (store (arr!18297 a!2986) i!1108 k!1786) index!984) (select (arr!18297 a!2986) j!136))))

(declare-fun b!632314 () Bool)

(declare-fun res!408932 () Bool)

(assert (=> b!632314 (=> (not res!408932) (not e!361504))))

(declare-fun arrayContainsKey!0 (array!38129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632314 (= res!408932 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632315 () Bool)

(declare-fun res!408926 () Bool)

(assert (=> b!632315 (=> (not res!408926) (not e!361504))))

(assert (=> b!632315 (= res!408926 (and (= (size!18661 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18661 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18661 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632316 () Bool)

(assert (=> b!632316 (= e!361501 (= lt!292213 lt!292215))))

(declare-fun b!632317 () Bool)

(declare-fun res!408924 () Bool)

(assert (=> b!632317 (=> (not res!408924) (not e!361504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632317 (= res!408924 (validKeyInArray!0 (select (arr!18297 a!2986) j!136)))))

(declare-fun b!632318 () Bool)

(declare-fun res!408933 () Bool)

(assert (=> b!632318 (=> (not res!408933) (not e!361504))))

(assert (=> b!632318 (= res!408933 (validKeyInArray!0 k!1786))))

(declare-fun b!632319 () Bool)

(declare-fun res!408925 () Bool)

(assert (=> b!632319 (=> (not res!408925) (not e!361503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38129 (_ BitVec 32)) Bool)

(assert (=> b!632319 (= res!408925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!408931 () Bool)

(assert (=> start!57110 (=> (not res!408931) (not e!361504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57110 (= res!408931 (validMask!0 mask!3053))))

(assert (=> start!57110 e!361504))

(assert (=> start!57110 true))

(declare-fun array_inv!14093 (array!38129) Bool)

(assert (=> start!57110 (array_inv!14093 a!2986)))

(declare-fun b!632309 () Bool)

(assert (=> b!632309 (= e!361503 e!361505)))

(declare-fun res!408935 () Bool)

(assert (=> b!632309 (=> (not res!408935) (not e!361505))))

(assert (=> b!632309 (= res!408935 (= (select (store (arr!18297 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632309 (= lt!292212 (array!38130 (store (arr!18297 a!2986) i!1108 k!1786) (size!18661 a!2986)))))

(declare-fun b!632320 () Bool)

(declare-fun res!408923 () Bool)

(assert (=> b!632320 (=> (not res!408923) (not e!361503))))

(declare-datatypes ((List!12338 0))(
  ( (Nil!12335) (Cons!12334 (h!13379 (_ BitVec 64)) (t!18566 List!12338)) )
))
(declare-fun arrayNoDuplicates!0 (array!38129 (_ BitVec 32) List!12338) Bool)

(assert (=> b!632320 (= res!408923 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12335))))

(declare-fun b!632321 () Bool)

(declare-fun Unit!21285 () Unit!21282)

(assert (=> b!632321 (= e!361500 Unit!21285)))

(assert (= (and start!57110 res!408931) b!632315))

(assert (= (and b!632315 res!408926) b!632317))

(assert (= (and b!632317 res!408924) b!632318))

(assert (= (and b!632318 res!408933) b!632314))

(assert (= (and b!632314 res!408932) b!632307))

(assert (= (and b!632307 res!408928) b!632319))

(assert (= (and b!632319 res!408925) b!632320))

(assert (= (and b!632320 res!408923) b!632308))

(assert (= (and b!632308 res!408930) b!632309))

(assert (= (and b!632309 res!408935) b!632311))

(assert (= (and b!632311 res!408927) b!632310))

(assert (= (and b!632310 res!408929) b!632316))

(assert (= (and b!632310 c!72059) b!632312))

(assert (= (and b!632310 (not c!72059)) b!632321))

(assert (= (and b!632310 (not res!408934)) b!632313))

(declare-fun m!607143 () Bool)

(assert (=> b!632311 m!607143))

(declare-fun m!607145 () Bool)

(assert (=> b!632311 m!607145))

(assert (=> b!632311 m!607145))

(declare-fun m!607147 () Bool)

(assert (=> b!632311 m!607147))

(declare-fun m!607149 () Bool)

(assert (=> b!632319 m!607149))

(declare-fun m!607151 () Bool)

(assert (=> b!632313 m!607151))

(declare-fun m!607153 () Bool)

(assert (=> b!632313 m!607153))

(assert (=> b!632313 m!607145))

(declare-fun m!607155 () Bool)

(assert (=> b!632307 m!607155))

(declare-fun m!607157 () Bool)

(assert (=> b!632314 m!607157))

(assert (=> b!632317 m!607145))

(assert (=> b!632317 m!607145))

(declare-fun m!607159 () Bool)

(assert (=> b!632317 m!607159))

(declare-fun m!607161 () Bool)

(assert (=> b!632310 m!607161))

(declare-fun m!607163 () Bool)

(assert (=> b!632310 m!607163))

(assert (=> b!632310 m!607145))

(declare-fun m!607165 () Bool)

(assert (=> b!632310 m!607165))

(assert (=> b!632310 m!607151))

(declare-fun m!607167 () Bool)

(assert (=> b!632310 m!607167))

(assert (=> b!632310 m!607145))

(declare-fun m!607169 () Bool)

(assert (=> b!632310 m!607169))

(declare-fun m!607171 () Bool)

(assert (=> b!632310 m!607171))

(assert (=> b!632309 m!607151))

(declare-fun m!607173 () Bool)

(assert (=> b!632309 m!607173))

(declare-fun m!607175 () Bool)

(assert (=> b!632308 m!607175))

(declare-fun m!607177 () Bool)

(assert (=> start!57110 m!607177))

(declare-fun m!607179 () Bool)

(assert (=> start!57110 m!607179))

(declare-fun m!607181 () Bool)

(assert (=> b!632318 m!607181))

(declare-fun m!607183 () Bool)

(assert (=> b!632320 m!607183))

(push 1)

