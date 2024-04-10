; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56410 () Bool)

(assert start!56410)

(declare-fun b!625266 () Bool)

(declare-fun res!403273 () Bool)

(declare-fun e!358429 () Bool)

(assert (=> b!625266 (=> (not res!403273) (not e!358429))))

(declare-datatypes ((array!37790 0))(
  ( (array!37791 (arr!18138 (Array (_ BitVec 32) (_ BitVec 64))) (size!18502 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37790)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625266 (= res!403273 (validKeyInArray!0 (select (arr!18138 a!2986) j!136)))))

(declare-fun b!625267 () Bool)

(declare-fun res!403278 () Bool)

(declare-fun e!358431 () Bool)

(assert (=> b!625267 (=> (not res!403278) (not e!358431))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37790 (_ BitVec 32)) Bool)

(assert (=> b!625267 (= res!403278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625269 () Bool)

(declare-fun res!403275 () Bool)

(assert (=> b!625269 (=> (not res!403275) (not e!358429))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625269 (= res!403275 (and (= (size!18502 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18502 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18502 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625270 () Bool)

(declare-fun res!403276 () Bool)

(assert (=> b!625270 (=> (not res!403276) (not e!358429))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!625270 (= res!403276 (validKeyInArray!0 k!1786))))

(declare-fun b!625271 () Bool)

(assert (=> b!625271 (= e!358429 e!358431)))

(declare-fun res!403272 () Bool)

(assert (=> b!625271 (=> (not res!403272) (not e!358431))))

(declare-datatypes ((SeekEntryResult!6578 0))(
  ( (MissingZero!6578 (index!28596 (_ BitVec 32))) (Found!6578 (index!28597 (_ BitVec 32))) (Intermediate!6578 (undefined!7390 Bool) (index!28598 (_ BitVec 32)) (x!57352 (_ BitVec 32))) (Undefined!6578) (MissingVacant!6578 (index!28599 (_ BitVec 32))) )
))
(declare-fun lt!289797 () SeekEntryResult!6578)

(assert (=> b!625271 (= res!403272 (or (= lt!289797 (MissingZero!6578 i!1108)) (= lt!289797 (MissingVacant!6578 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37790 (_ BitVec 32)) SeekEntryResult!6578)

(assert (=> b!625271 (= lt!289797 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625272 () Bool)

(declare-fun res!403279 () Bool)

(assert (=> b!625272 (=> (not res!403279) (not e!358431))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625272 (= res!403279 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18138 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18138 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625273 () Bool)

(declare-fun res!403277 () Bool)

(assert (=> b!625273 (=> (not res!403277) (not e!358429))))

(declare-fun arrayContainsKey!0 (array!37790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625273 (= res!403277 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625274 () Bool)

(declare-fun res!403274 () Bool)

(assert (=> b!625274 (=> (not res!403274) (not e!358431))))

(declare-datatypes ((List!12179 0))(
  ( (Nil!12176) (Cons!12175 (h!13220 (_ BitVec 64)) (t!18407 List!12179)) )
))
(declare-fun arrayNoDuplicates!0 (array!37790 (_ BitVec 32) List!12179) Bool)

(assert (=> b!625274 (= res!403274 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12176))))

(declare-fun b!625268 () Bool)

(assert (=> b!625268 (= e!358431 false)))

(declare-fun lt!289798 () SeekEntryResult!6578)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37790 (_ BitVec 32)) SeekEntryResult!6578)

(assert (=> b!625268 (= lt!289798 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18138 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!403280 () Bool)

(assert (=> start!56410 (=> (not res!403280) (not e!358429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56410 (= res!403280 (validMask!0 mask!3053))))

(assert (=> start!56410 e!358429))

(assert (=> start!56410 true))

(declare-fun array_inv!13934 (array!37790) Bool)

(assert (=> start!56410 (array_inv!13934 a!2986)))

(assert (= (and start!56410 res!403280) b!625269))

(assert (= (and b!625269 res!403275) b!625266))

(assert (= (and b!625266 res!403273) b!625270))

(assert (= (and b!625270 res!403276) b!625273))

(assert (= (and b!625273 res!403277) b!625271))

(assert (= (and b!625271 res!403272) b!625267))

(assert (= (and b!625267 res!403278) b!625274))

(assert (= (and b!625274 res!403274) b!625272))

(assert (= (and b!625272 res!403279) b!625268))

(declare-fun m!600851 () Bool)

(assert (=> b!625268 m!600851))

(assert (=> b!625268 m!600851))

(declare-fun m!600853 () Bool)

(assert (=> b!625268 m!600853))

(assert (=> b!625266 m!600851))

(assert (=> b!625266 m!600851))

(declare-fun m!600855 () Bool)

(assert (=> b!625266 m!600855))

(declare-fun m!600857 () Bool)

(assert (=> b!625274 m!600857))

(declare-fun m!600859 () Bool)

(assert (=> b!625271 m!600859))

(declare-fun m!600861 () Bool)

(assert (=> b!625272 m!600861))

(declare-fun m!600863 () Bool)

(assert (=> b!625272 m!600863))

(declare-fun m!600865 () Bool)

(assert (=> b!625272 m!600865))

(declare-fun m!600867 () Bool)

(assert (=> start!56410 m!600867))

(declare-fun m!600869 () Bool)

(assert (=> start!56410 m!600869))

(declare-fun m!600871 () Bool)

(assert (=> b!625267 m!600871))

(declare-fun m!600873 () Bool)

(assert (=> b!625270 m!600873))

(declare-fun m!600875 () Bool)

(assert (=> b!625273 m!600875))

(push 1)

