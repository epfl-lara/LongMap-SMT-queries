; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57048 () Bool)

(assert start!57048)

(declare-fun b!631074 () Bool)

(declare-fun e!360853 () Bool)

(assert (=> b!631074 (= e!360853 (not true))))

(declare-datatypes ((Unit!21153 0))(
  ( (Unit!21154) )
))
(declare-fun lt!291508 () Unit!21153)

(declare-fun e!360855 () Unit!21153)

(assert (=> b!631074 (= lt!291508 e!360855)))

(declare-fun c!71933 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!291504 () (_ BitVec 64))

(declare-datatypes ((array!38067 0))(
  ( (array!38068 (arr!18265 (Array (_ BitVec 32) (_ BitVec 64))) (size!18629 (_ BitVec 32))) )
))
(declare-fun lt!291502 () array!38067)

(declare-datatypes ((SeekEntryResult!6661 0))(
  ( (MissingZero!6661 (index!28934 (_ BitVec 32))) (Found!6661 (index!28935 (_ BitVec 32))) (Intermediate!6661 (undefined!7473 Bool) (index!28936 (_ BitVec 32)) (x!57826 (_ BitVec 32))) (Undefined!6661) (MissingVacant!6661 (index!28937 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38067 (_ BitVec 32)) SeekEntryResult!6661)

(assert (=> b!631074 (= c!71933 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291504 lt!291502 mask!3053) Undefined!6661))))

(declare-fun e!360858 () Bool)

(assert (=> b!631074 e!360858))

(declare-fun res!407956 () Bool)

(assert (=> b!631074 (=> (not res!407956) (not e!360858))))

(declare-fun lt!291503 () SeekEntryResult!6661)

(declare-fun lt!291507 () (_ BitVec 32))

(assert (=> b!631074 (= res!407956 (= lt!291503 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291507 vacantSpotIndex!68 lt!291504 lt!291502 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38067)

(assert (=> b!631074 (= lt!291503 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291507 vacantSpotIndex!68 (select (arr!18265 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!631074 (= lt!291504 (select (store (arr!18265 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291505 () Unit!21153)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38067 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21153)

(assert (=> b!631074 (= lt!291505 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291507 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631074 (= lt!291507 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!631075 () Bool)

(declare-fun res!407950 () Bool)

(declare-fun e!360856 () Bool)

(assert (=> b!631075 (=> (not res!407950) (not e!360856))))

(declare-fun arrayContainsKey!0 (array!38067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631075 (= res!407950 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631076 () Bool)

(declare-fun e!360852 () Bool)

(assert (=> b!631076 (= e!360856 e!360852)))

(declare-fun res!407945 () Bool)

(assert (=> b!631076 (=> (not res!407945) (not e!360852))))

(declare-fun lt!291501 () SeekEntryResult!6661)

(assert (=> b!631076 (= res!407945 (or (= lt!291501 (MissingZero!6661 i!1108)) (= lt!291501 (MissingVacant!6661 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38067 (_ BitVec 32)) SeekEntryResult!6661)

(assert (=> b!631076 (= lt!291501 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631077 () Bool)

(declare-fun Unit!21155 () Unit!21153)

(assert (=> b!631077 (= e!360855 Unit!21155)))

(declare-fun b!631078 () Bool)

(declare-fun e!360857 () Bool)

(assert (=> b!631078 (= e!360857 e!360853)))

(declare-fun res!407949 () Bool)

(assert (=> b!631078 (=> (not res!407949) (not e!360853))))

(declare-fun lt!291506 () SeekEntryResult!6661)

(assert (=> b!631078 (= res!407949 (and (= lt!291506 (Found!6661 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18265 a!2986) index!984) (select (arr!18265 a!2986) j!136))) (not (= (select (arr!18265 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631078 (= lt!291506 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18265 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631079 () Bool)

(assert (=> b!631079 (= e!360858 (= lt!291506 lt!291503))))

(declare-fun b!631080 () Bool)

(declare-fun res!407947 () Bool)

(assert (=> b!631080 (=> (not res!407947) (not e!360856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631080 (= res!407947 (validKeyInArray!0 k0!1786))))

(declare-fun b!631081 () Bool)

(declare-fun res!407954 () Bool)

(assert (=> b!631081 (=> (not res!407954) (not e!360852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38067 (_ BitVec 32)) Bool)

(assert (=> b!631081 (= res!407954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631082 () Bool)

(assert (=> b!631082 (= e!360852 e!360857)))

(declare-fun res!407948 () Bool)

(assert (=> b!631082 (=> (not res!407948) (not e!360857))))

(assert (=> b!631082 (= res!407948 (= (select (store (arr!18265 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631082 (= lt!291502 (array!38068 (store (arr!18265 a!2986) i!1108 k0!1786) (size!18629 a!2986)))))

(declare-fun res!407946 () Bool)

(assert (=> start!57048 (=> (not res!407946) (not e!360856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57048 (= res!407946 (validMask!0 mask!3053))))

(assert (=> start!57048 e!360856))

(assert (=> start!57048 true))

(declare-fun array_inv!14124 (array!38067) Bool)

(assert (=> start!57048 (array_inv!14124 a!2986)))

(declare-fun b!631083 () Bool)

(declare-fun res!407952 () Bool)

(assert (=> b!631083 (=> (not res!407952) (not e!360852))))

(assert (=> b!631083 (= res!407952 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18265 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631084 () Bool)

(declare-fun Unit!21156 () Unit!21153)

(assert (=> b!631084 (= e!360855 Unit!21156)))

(assert (=> b!631084 false))

(declare-fun b!631085 () Bool)

(declare-fun res!407951 () Bool)

(assert (=> b!631085 (=> (not res!407951) (not e!360856))))

(assert (=> b!631085 (= res!407951 (validKeyInArray!0 (select (arr!18265 a!2986) j!136)))))

(declare-fun b!631086 () Bool)

(declare-fun res!407953 () Bool)

(assert (=> b!631086 (=> (not res!407953) (not e!360856))))

(assert (=> b!631086 (= res!407953 (and (= (size!18629 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18629 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18629 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631087 () Bool)

(declare-fun res!407955 () Bool)

(assert (=> b!631087 (=> (not res!407955) (not e!360852))))

(declare-datatypes ((List!12213 0))(
  ( (Nil!12210) (Cons!12209 (h!13257 (_ BitVec 64)) (t!18433 List!12213)) )
))
(declare-fun arrayNoDuplicates!0 (array!38067 (_ BitVec 32) List!12213) Bool)

(assert (=> b!631087 (= res!407955 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12210))))

(assert (= (and start!57048 res!407946) b!631086))

(assert (= (and b!631086 res!407953) b!631085))

(assert (= (and b!631085 res!407951) b!631080))

(assert (= (and b!631080 res!407947) b!631075))

(assert (= (and b!631075 res!407950) b!631076))

(assert (= (and b!631076 res!407945) b!631081))

(assert (= (and b!631081 res!407954) b!631087))

(assert (= (and b!631087 res!407955) b!631083))

(assert (= (and b!631083 res!407952) b!631082))

(assert (= (and b!631082 res!407948) b!631078))

(assert (= (and b!631078 res!407949) b!631074))

(assert (= (and b!631074 res!407956) b!631079))

(assert (= (and b!631074 c!71933) b!631084))

(assert (= (and b!631074 (not c!71933)) b!631077))

(declare-fun m!606337 () Bool)

(assert (=> b!631085 m!606337))

(assert (=> b!631085 m!606337))

(declare-fun m!606339 () Bool)

(assert (=> b!631085 m!606339))

(declare-fun m!606341 () Bool)

(assert (=> b!631074 m!606341))

(assert (=> b!631074 m!606337))

(declare-fun m!606343 () Bool)

(assert (=> b!631074 m!606343))

(declare-fun m!606345 () Bool)

(assert (=> b!631074 m!606345))

(declare-fun m!606347 () Bool)

(assert (=> b!631074 m!606347))

(assert (=> b!631074 m!606337))

(declare-fun m!606349 () Bool)

(assert (=> b!631074 m!606349))

(declare-fun m!606351 () Bool)

(assert (=> b!631074 m!606351))

(declare-fun m!606353 () Bool)

(assert (=> b!631074 m!606353))

(declare-fun m!606355 () Bool)

(assert (=> b!631076 m!606355))

(declare-fun m!606357 () Bool)

(assert (=> b!631075 m!606357))

(declare-fun m!606359 () Bool)

(assert (=> b!631087 m!606359))

(assert (=> b!631082 m!606343))

(declare-fun m!606361 () Bool)

(assert (=> b!631082 m!606361))

(declare-fun m!606363 () Bool)

(assert (=> b!631081 m!606363))

(declare-fun m!606365 () Bool)

(assert (=> b!631080 m!606365))

(declare-fun m!606367 () Bool)

(assert (=> b!631083 m!606367))

(declare-fun m!606369 () Bool)

(assert (=> start!57048 m!606369))

(declare-fun m!606371 () Bool)

(assert (=> start!57048 m!606371))

(declare-fun m!606373 () Bool)

(assert (=> b!631078 m!606373))

(assert (=> b!631078 m!606337))

(assert (=> b!631078 m!606337))

(declare-fun m!606375 () Bool)

(assert (=> b!631078 m!606375))

(check-sat (not b!631081) (not b!631080) (not start!57048) (not b!631076) (not b!631074) (not b!631075) (not b!631078) (not b!631087) (not b!631085))
(check-sat)
