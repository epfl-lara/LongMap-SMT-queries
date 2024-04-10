; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56916 () Bool)

(assert start!56916)

(declare-fun b!630196 () Bool)

(declare-fun res!407420 () Bool)

(declare-fun e!360355 () Bool)

(assert (=> b!630196 (=> (not res!407420) (not e!360355))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38049 0))(
  ( (array!38050 (arr!18260 (Array (_ BitVec 32) (_ BitVec 64))) (size!18624 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38049)

(assert (=> b!630196 (= res!407420 (and (= (size!18624 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18624 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18624 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!407410 () Bool)

(assert (=> start!56916 (=> (not res!407410) (not e!360355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56916 (= res!407410 (validMask!0 mask!3053))))

(assert (=> start!56916 e!360355))

(assert (=> start!56916 true))

(declare-fun array_inv!14056 (array!38049) Bool)

(assert (=> start!56916 (array_inv!14056 a!2986)))

(declare-fun b!630197 () Bool)

(declare-fun e!360353 () Bool)

(declare-fun e!360356 () Bool)

(assert (=> b!630197 (= e!360353 e!360356)))

(declare-fun res!407417 () Bool)

(assert (=> b!630197 (=> (not res!407417) (not e!360356))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6700 0))(
  ( (MissingZero!6700 (index!29087 (_ BitVec 32))) (Found!6700 (index!29088 (_ BitVec 32))) (Intermediate!6700 (undefined!7512 Bool) (index!29089 (_ BitVec 32)) (x!57821 (_ BitVec 32))) (Undefined!6700) (MissingVacant!6700 (index!29090 (_ BitVec 32))) )
))
(declare-fun lt!291066 () SeekEntryResult!6700)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630197 (= res!407417 (and (= lt!291066 (Found!6700 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18260 a!2986) index!984) (select (arr!18260 a!2986) j!136))) (not (= (select (arr!18260 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38049 (_ BitVec 32)) SeekEntryResult!6700)

(assert (=> b!630197 (= lt!291066 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18260 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630198 () Bool)

(declare-fun res!407418 () Bool)

(assert (=> b!630198 (=> (not res!407418) (not e!360355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630198 (= res!407418 (validKeyInArray!0 (select (arr!18260 a!2986) j!136)))))

(declare-fun b!630199 () Bool)

(declare-fun res!407414 () Bool)

(assert (=> b!630199 (=> (not res!407414) (not e!360353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38049 (_ BitVec 32)) Bool)

(assert (=> b!630199 (= res!407414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630200 () Bool)

(assert (=> b!630200 (= e!360356 (not true))))

(declare-fun e!360354 () Bool)

(assert (=> b!630200 e!360354))

(declare-fun res!407412 () Bool)

(assert (=> b!630200 (=> (not res!407412) (not e!360354))))

(declare-fun lt!291063 () SeekEntryResult!6700)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!291064 () (_ BitVec 32))

(assert (=> b!630200 (= res!407412 (= lt!291063 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291064 vacantSpotIndex!68 (select (store (arr!18260 a!2986) i!1108 k!1786) j!136) (array!38050 (store (arr!18260 a!2986) i!1108 k!1786) (size!18624 a!2986)) mask!3053)))))

(assert (=> b!630200 (= lt!291063 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291064 vacantSpotIndex!68 (select (arr!18260 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21142 0))(
  ( (Unit!21143) )
))
(declare-fun lt!291067 () Unit!21142)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21142)

(assert (=> b!630200 (= lt!291067 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291064 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630200 (= lt!291064 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630201 () Bool)

(declare-fun res!407419 () Bool)

(assert (=> b!630201 (=> (not res!407419) (not e!360353))))

(declare-datatypes ((List!12301 0))(
  ( (Nil!12298) (Cons!12297 (h!13342 (_ BitVec 64)) (t!18529 List!12301)) )
))
(declare-fun arrayNoDuplicates!0 (array!38049 (_ BitVec 32) List!12301) Bool)

(assert (=> b!630201 (= res!407419 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12298))))

(declare-fun b!630202 () Bool)

(assert (=> b!630202 (= e!360355 e!360353)))

(declare-fun res!407416 () Bool)

(assert (=> b!630202 (=> (not res!407416) (not e!360353))))

(declare-fun lt!291065 () SeekEntryResult!6700)

(assert (=> b!630202 (= res!407416 (or (= lt!291065 (MissingZero!6700 i!1108)) (= lt!291065 (MissingVacant!6700 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38049 (_ BitVec 32)) SeekEntryResult!6700)

(assert (=> b!630202 (= lt!291065 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630203 () Bool)

(declare-fun res!407413 () Bool)

(assert (=> b!630203 (=> (not res!407413) (not e!360355))))

(declare-fun arrayContainsKey!0 (array!38049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630203 (= res!407413 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630204 () Bool)

(declare-fun res!407415 () Bool)

(assert (=> b!630204 (=> (not res!407415) (not e!360355))))

(assert (=> b!630204 (= res!407415 (validKeyInArray!0 k!1786))))

(declare-fun b!630205 () Bool)

(declare-fun res!407411 () Bool)

(assert (=> b!630205 (=> (not res!407411) (not e!360353))))

(assert (=> b!630205 (= res!407411 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18260 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18260 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630206 () Bool)

(assert (=> b!630206 (= e!360354 (= lt!291066 lt!291063))))

(assert (= (and start!56916 res!407410) b!630196))

(assert (= (and b!630196 res!407420) b!630198))

(assert (= (and b!630198 res!407418) b!630204))

(assert (= (and b!630204 res!407415) b!630203))

(assert (= (and b!630203 res!407413) b!630202))

(assert (= (and b!630202 res!407416) b!630199))

(assert (= (and b!630199 res!407414) b!630201))

(assert (= (and b!630201 res!407419) b!630205))

(assert (= (and b!630205 res!407411) b!630197))

(assert (= (and b!630197 res!407417) b!630200))

(assert (= (and b!630200 res!407412) b!630206))

(declare-fun m!605215 () Bool)

(assert (=> b!630201 m!605215))

(declare-fun m!605217 () Bool)

(assert (=> b!630197 m!605217))

(declare-fun m!605219 () Bool)

(assert (=> b!630197 m!605219))

(assert (=> b!630197 m!605219))

(declare-fun m!605221 () Bool)

(assert (=> b!630197 m!605221))

(assert (=> b!630198 m!605219))

(assert (=> b!630198 m!605219))

(declare-fun m!605223 () Bool)

(assert (=> b!630198 m!605223))

(declare-fun m!605225 () Bool)

(assert (=> b!630199 m!605225))

(declare-fun m!605227 () Bool)

(assert (=> b!630202 m!605227))

(declare-fun m!605229 () Bool)

(assert (=> b!630203 m!605229))

(declare-fun m!605231 () Bool)

(assert (=> b!630205 m!605231))

(declare-fun m!605233 () Bool)

(assert (=> b!630205 m!605233))

(declare-fun m!605235 () Bool)

(assert (=> b!630205 m!605235))

(declare-fun m!605237 () Bool)

(assert (=> b!630204 m!605237))

(declare-fun m!605239 () Bool)

(assert (=> b!630200 m!605239))

(declare-fun m!605241 () Bool)

(assert (=> b!630200 m!605241))

(assert (=> b!630200 m!605219))

(assert (=> b!630200 m!605233))

(declare-fun m!605243 () Bool)

(assert (=> b!630200 m!605243))

(assert (=> b!630200 m!605241))

(declare-fun m!605245 () Bool)

(assert (=> b!630200 m!605245))

(assert (=> b!630200 m!605219))

(declare-fun m!605247 () Bool)

(assert (=> b!630200 m!605247))

(declare-fun m!605249 () Bool)

(assert (=> start!56916 m!605249))

(declare-fun m!605251 () Bool)

(assert (=> start!56916 m!605251))

(push 1)

