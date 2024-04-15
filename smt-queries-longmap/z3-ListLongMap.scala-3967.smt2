; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53856 () Bool)

(assert start!53856)

(declare-fun b!587343 () Bool)

(declare-fun res!375122 () Bool)

(declare-fun e!335503 () Bool)

(assert (=> b!587343 (=> (not res!375122) (not e!335503))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36714 0))(
  ( (array!36715 (arr!17630 (Array (_ BitVec 32) (_ BitVec 64))) (size!17995 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36714)

(declare-datatypes ((SeekEntryResult!6067 0))(
  ( (MissingZero!6067 (index!26498 (_ BitVec 32))) (Found!6067 (index!26499 (_ BitVec 32))) (Intermediate!6067 (undefined!6879 Bool) (index!26500 (_ BitVec 32)) (x!55316 (_ BitVec 32))) (Undefined!6067) (MissingVacant!6067 (index!26501 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36714 (_ BitVec 32)) SeekEntryResult!6067)

(assert (=> b!587343 (= res!375122 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17630 a!2986) j!136) a!2986 mask!3053) (Found!6067 j!136)))))

(declare-fun b!587344 () Bool)

(declare-fun res!375127 () Bool)

(declare-fun e!335505 () Bool)

(assert (=> b!587344 (=> (not res!375127) (not e!335505))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587344 (= res!375127 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587345 () Bool)

(declare-fun res!375131 () Bool)

(assert (=> b!587345 (=> (not res!375131) (not e!335505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587345 (= res!375131 (validKeyInArray!0 (select (arr!17630 a!2986) j!136)))))

(declare-fun b!587346 () Bool)

(declare-fun res!375121 () Bool)

(assert (=> b!587346 (=> (not res!375121) (not e!335503))))

(declare-datatypes ((List!11710 0))(
  ( (Nil!11707) (Cons!11706 (h!12751 (_ BitVec 64)) (t!17929 List!11710)) )
))
(declare-fun arrayNoDuplicates!0 (array!36714 (_ BitVec 32) List!11710) Bool)

(assert (=> b!587346 (= res!375121 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11707))))

(declare-fun res!375128 () Bool)

(assert (=> start!53856 (=> (not res!375128) (not e!335505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53856 (= res!375128 (validMask!0 mask!3053))))

(assert (=> start!53856 e!335505))

(assert (=> start!53856 true))

(declare-fun array_inv!13513 (array!36714) Bool)

(assert (=> start!53856 (array_inv!13513 a!2986)))

(declare-fun b!587347 () Bool)

(declare-fun res!375129 () Bool)

(assert (=> b!587347 (=> (not res!375129) (not e!335505))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587347 (= res!375129 (and (= (size!17995 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17995 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17995 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587348 () Bool)

(declare-fun res!375130 () Bool)

(assert (=> b!587348 (=> (not res!375130) (not e!335503))))

(assert (=> b!587348 (= res!375130 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17630 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17630 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587349 () Bool)

(assert (=> b!587349 (= e!335505 e!335503)))

(declare-fun res!375123 () Bool)

(assert (=> b!587349 (=> (not res!375123) (not e!335503))))

(declare-fun lt!266215 () SeekEntryResult!6067)

(assert (=> b!587349 (= res!375123 (or (= lt!266215 (MissingZero!6067 i!1108)) (= lt!266215 (MissingVacant!6067 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36714 (_ BitVec 32)) SeekEntryResult!6067)

(assert (=> b!587349 (= lt!266215 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587350 () Bool)

(assert (=> b!587350 (= e!335503 (not true))))

(declare-fun lt!266214 () (_ BitVec 32))

(assert (=> b!587350 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266214 vacantSpotIndex!68 (select (arr!17630 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266214 vacantSpotIndex!68 (select (store (arr!17630 a!2986) i!1108 k0!1786) j!136) (array!36715 (store (arr!17630 a!2986) i!1108 k0!1786) (size!17995 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18240 0))(
  ( (Unit!18241) )
))
(declare-fun lt!266213 () Unit!18240)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36714 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18240)

(assert (=> b!587350 (= lt!266213 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266214 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587350 (= lt!266214 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587351 () Bool)

(declare-fun res!375126 () Bool)

(assert (=> b!587351 (=> (not res!375126) (not e!335505))))

(assert (=> b!587351 (= res!375126 (validKeyInArray!0 k0!1786))))

(declare-fun b!587352 () Bool)

(declare-fun res!375124 () Bool)

(assert (=> b!587352 (=> (not res!375124) (not e!335503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36714 (_ BitVec 32)) Bool)

(assert (=> b!587352 (= res!375124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587353 () Bool)

(declare-fun res!375125 () Bool)

(assert (=> b!587353 (=> (not res!375125) (not e!335503))))

(assert (=> b!587353 (= res!375125 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17630 a!2986) index!984) (select (arr!17630 a!2986) j!136))) (not (= (select (arr!17630 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53856 res!375128) b!587347))

(assert (= (and b!587347 res!375129) b!587345))

(assert (= (and b!587345 res!375131) b!587351))

(assert (= (and b!587351 res!375126) b!587344))

(assert (= (and b!587344 res!375127) b!587349))

(assert (= (and b!587349 res!375123) b!587352))

(assert (= (and b!587352 res!375124) b!587346))

(assert (= (and b!587346 res!375121) b!587348))

(assert (= (and b!587348 res!375130) b!587343))

(assert (= (and b!587343 res!375122) b!587353))

(assert (= (and b!587353 res!375125) b!587350))

(declare-fun m!565255 () Bool)

(assert (=> b!587345 m!565255))

(assert (=> b!587345 m!565255))

(declare-fun m!565257 () Bool)

(assert (=> b!587345 m!565257))

(declare-fun m!565259 () Bool)

(assert (=> b!587351 m!565259))

(declare-fun m!565261 () Bool)

(assert (=> b!587346 m!565261))

(assert (=> b!587343 m!565255))

(assert (=> b!587343 m!565255))

(declare-fun m!565263 () Bool)

(assert (=> b!587343 m!565263))

(declare-fun m!565265 () Bool)

(assert (=> b!587350 m!565265))

(declare-fun m!565267 () Bool)

(assert (=> b!587350 m!565267))

(assert (=> b!587350 m!565255))

(declare-fun m!565269 () Bool)

(assert (=> b!587350 m!565269))

(declare-fun m!565271 () Bool)

(assert (=> b!587350 m!565271))

(assert (=> b!587350 m!565255))

(declare-fun m!565273 () Bool)

(assert (=> b!587350 m!565273))

(assert (=> b!587350 m!565267))

(declare-fun m!565275 () Bool)

(assert (=> b!587350 m!565275))

(declare-fun m!565277 () Bool)

(assert (=> b!587352 m!565277))

(declare-fun m!565279 () Bool)

(assert (=> b!587348 m!565279))

(assert (=> b!587348 m!565269))

(declare-fun m!565281 () Bool)

(assert (=> b!587348 m!565281))

(declare-fun m!565283 () Bool)

(assert (=> b!587349 m!565283))

(declare-fun m!565285 () Bool)

(assert (=> b!587353 m!565285))

(assert (=> b!587353 m!565255))

(declare-fun m!565287 () Bool)

(assert (=> b!587344 m!565287))

(declare-fun m!565289 () Bool)

(assert (=> start!53856 m!565289))

(declare-fun m!565291 () Bool)

(assert (=> start!53856 m!565291))

(check-sat (not b!587351) (not b!587352) (not b!587349) (not b!587344) (not start!53856) (not b!587346) (not b!587343) (not b!587350) (not b!587345))
(check-sat)
