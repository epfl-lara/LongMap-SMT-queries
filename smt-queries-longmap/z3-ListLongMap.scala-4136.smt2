; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56412 () Bool)

(assert start!56412)

(declare-fun b!625293 () Bool)

(declare-fun e!358440 () Bool)

(declare-fun e!358438 () Bool)

(assert (=> b!625293 (= e!358440 e!358438)))

(declare-fun res!403299 () Bool)

(assert (=> b!625293 (=> (not res!403299) (not e!358438))))

(declare-datatypes ((SeekEntryResult!6579 0))(
  ( (MissingZero!6579 (index!28600 (_ BitVec 32))) (Found!6579 (index!28601 (_ BitVec 32))) (Intermediate!6579 (undefined!7391 Bool) (index!28602 (_ BitVec 32)) (x!57353 (_ BitVec 32))) (Undefined!6579) (MissingVacant!6579 (index!28603 (_ BitVec 32))) )
))
(declare-fun lt!289804 () SeekEntryResult!6579)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625293 (= res!403299 (or (= lt!289804 (MissingZero!6579 i!1108)) (= lt!289804 (MissingVacant!6579 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37792 0))(
  ( (array!37793 (arr!18139 (Array (_ BitVec 32) (_ BitVec 64))) (size!18503 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37792)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37792 (_ BitVec 32)) SeekEntryResult!6579)

(assert (=> b!625293 (= lt!289804 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625294 () Bool)

(assert (=> b!625294 (= e!358438 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!289803 () SeekEntryResult!6579)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37792 (_ BitVec 32)) SeekEntryResult!6579)

(assert (=> b!625294 (= lt!289803 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18139 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625295 () Bool)

(declare-fun res!403302 () Bool)

(assert (=> b!625295 (=> (not res!403302) (not e!358438))))

(declare-datatypes ((List!12180 0))(
  ( (Nil!12177) (Cons!12176 (h!13221 (_ BitVec 64)) (t!18408 List!12180)) )
))
(declare-fun arrayNoDuplicates!0 (array!37792 (_ BitVec 32) List!12180) Bool)

(assert (=> b!625295 (= res!403302 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12177))))

(declare-fun b!625296 () Bool)

(declare-fun res!403301 () Bool)

(assert (=> b!625296 (=> (not res!403301) (not e!358440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625296 (= res!403301 (validKeyInArray!0 (select (arr!18139 a!2986) j!136)))))

(declare-fun b!625298 () Bool)

(declare-fun res!403306 () Bool)

(assert (=> b!625298 (=> (not res!403306) (not e!358440))))

(assert (=> b!625298 (= res!403306 (and (= (size!18503 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18503 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18503 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625299 () Bool)

(declare-fun res!403303 () Bool)

(assert (=> b!625299 (=> (not res!403303) (not e!358438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37792 (_ BitVec 32)) Bool)

(assert (=> b!625299 (= res!403303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625300 () Bool)

(declare-fun res!403305 () Bool)

(assert (=> b!625300 (=> (not res!403305) (not e!358440))))

(assert (=> b!625300 (= res!403305 (validKeyInArray!0 k0!1786))))

(declare-fun b!625301 () Bool)

(declare-fun res!403300 () Bool)

(assert (=> b!625301 (=> (not res!403300) (not e!358440))))

(declare-fun arrayContainsKey!0 (array!37792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625301 (= res!403300 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625297 () Bool)

(declare-fun res!403304 () Bool)

(assert (=> b!625297 (=> (not res!403304) (not e!358438))))

(assert (=> b!625297 (= res!403304 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18139 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18139 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403307 () Bool)

(assert (=> start!56412 (=> (not res!403307) (not e!358440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56412 (= res!403307 (validMask!0 mask!3053))))

(assert (=> start!56412 e!358440))

(assert (=> start!56412 true))

(declare-fun array_inv!13935 (array!37792) Bool)

(assert (=> start!56412 (array_inv!13935 a!2986)))

(assert (= (and start!56412 res!403307) b!625298))

(assert (= (and b!625298 res!403306) b!625296))

(assert (= (and b!625296 res!403301) b!625300))

(assert (= (and b!625300 res!403305) b!625301))

(assert (= (and b!625301 res!403300) b!625293))

(assert (= (and b!625293 res!403299) b!625299))

(assert (= (and b!625299 res!403303) b!625295))

(assert (= (and b!625295 res!403302) b!625297))

(assert (= (and b!625297 res!403304) b!625294))

(declare-fun m!600877 () Bool)

(assert (=> b!625299 m!600877))

(declare-fun m!600879 () Bool)

(assert (=> b!625296 m!600879))

(assert (=> b!625296 m!600879))

(declare-fun m!600881 () Bool)

(assert (=> b!625296 m!600881))

(declare-fun m!600883 () Bool)

(assert (=> start!56412 m!600883))

(declare-fun m!600885 () Bool)

(assert (=> start!56412 m!600885))

(declare-fun m!600887 () Bool)

(assert (=> b!625293 m!600887))

(assert (=> b!625294 m!600879))

(assert (=> b!625294 m!600879))

(declare-fun m!600889 () Bool)

(assert (=> b!625294 m!600889))

(declare-fun m!600891 () Bool)

(assert (=> b!625297 m!600891))

(declare-fun m!600893 () Bool)

(assert (=> b!625297 m!600893))

(declare-fun m!600895 () Bool)

(assert (=> b!625297 m!600895))

(declare-fun m!600897 () Bool)

(assert (=> b!625301 m!600897))

(declare-fun m!600899 () Bool)

(assert (=> b!625295 m!600899))

(declare-fun m!600901 () Bool)

(assert (=> b!625300 m!600901))

(check-sat (not b!625295) (not b!625300) (not b!625299) (not b!625296) (not b!625293) (not start!56412) (not b!625301) (not b!625294))
(check-sat)
