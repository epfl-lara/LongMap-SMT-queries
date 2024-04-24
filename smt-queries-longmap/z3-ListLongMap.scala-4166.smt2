; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56790 () Bool)

(assert start!56790)

(declare-fun b!628854 () Bool)

(declare-fun res!406311 () Bool)

(declare-fun e!359792 () Bool)

(assert (=> b!628854 (=> (not res!406311) (not e!359792))))

(declare-datatypes ((array!37974 0))(
  ( (array!37975 (arr!18223 (Array (_ BitVec 32) (_ BitVec 64))) (size!18587 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37974)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628854 (= res!406311 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628855 () Bool)

(declare-fun res!406310 () Bool)

(declare-fun e!359793 () Bool)

(assert (=> b!628855 (=> (not res!406310) (not e!359793))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37974 (_ BitVec 32)) Bool)

(assert (=> b!628855 (= res!406310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628856 () Bool)

(declare-fun res!406307 () Bool)

(assert (=> b!628856 (=> (not res!406307) (not e!359792))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628856 (= res!406307 (validKeyInArray!0 (select (arr!18223 a!2986) j!136)))))

(declare-fun res!406313 () Bool)

(assert (=> start!56790 (=> (not res!406313) (not e!359792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56790 (= res!406313 (validMask!0 mask!3053))))

(assert (=> start!56790 e!359792))

(assert (=> start!56790 true))

(declare-fun array_inv!14082 (array!37974) Bool)

(assert (=> start!56790 (array_inv!14082 a!2986)))

(declare-fun b!628857 () Bool)

(declare-fun res!406306 () Bool)

(assert (=> b!628857 (=> (not res!406306) (not e!359792))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628857 (= res!406306 (and (= (size!18587 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18587 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18587 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628858 () Bool)

(declare-fun res!406314 () Bool)

(assert (=> b!628858 (=> (not res!406314) (not e!359793))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6619 0))(
  ( (MissingZero!6619 (index!28760 (_ BitVec 32))) (Found!6619 (index!28761 (_ BitVec 32))) (Intermediate!6619 (undefined!7431 Bool) (index!28762 (_ BitVec 32)) (x!57648 (_ BitVec 32))) (Undefined!6619) (MissingVacant!6619 (index!28763 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37974 (_ BitVec 32)) SeekEntryResult!6619)

(assert (=> b!628858 (= res!406314 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18223 a!2986) j!136) a!2986 mask!3053) (Found!6619 j!136)))))

(declare-fun b!628859 () Bool)

(declare-fun res!406315 () Bool)

(assert (=> b!628859 (=> (not res!406315) (not e!359793))))

(assert (=> b!628859 (= res!406315 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18223 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18223 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628860 () Bool)

(assert (=> b!628860 (= e!359792 e!359793)))

(declare-fun res!406309 () Bool)

(assert (=> b!628860 (=> (not res!406309) (not e!359793))))

(declare-fun lt!290643 () SeekEntryResult!6619)

(assert (=> b!628860 (= res!406309 (or (= lt!290643 (MissingZero!6619 i!1108)) (= lt!290643 (MissingVacant!6619 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37974 (_ BitVec 32)) SeekEntryResult!6619)

(assert (=> b!628860 (= lt!290643 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628861 () Bool)

(assert (=> b!628861 (= e!359793 false)))

(declare-fun lt!290644 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628861 (= lt!290644 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!628862 () Bool)

(declare-fun res!406312 () Bool)

(assert (=> b!628862 (=> (not res!406312) (not e!359793))))

(assert (=> b!628862 (= res!406312 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18223 a!2986) index!984) (select (arr!18223 a!2986) j!136))) (not (= (select (arr!18223 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628863 () Bool)

(declare-fun res!406308 () Bool)

(assert (=> b!628863 (=> (not res!406308) (not e!359793))))

(declare-datatypes ((List!12171 0))(
  ( (Nil!12168) (Cons!12167 (h!13215 (_ BitVec 64)) (t!18391 List!12171)) )
))
(declare-fun arrayNoDuplicates!0 (array!37974 (_ BitVec 32) List!12171) Bool)

(assert (=> b!628863 (= res!406308 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12168))))

(declare-fun b!628864 () Bool)

(declare-fun res!406305 () Bool)

(assert (=> b!628864 (=> (not res!406305) (not e!359792))))

(assert (=> b!628864 (= res!406305 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56790 res!406313) b!628857))

(assert (= (and b!628857 res!406306) b!628856))

(assert (= (and b!628856 res!406307) b!628864))

(assert (= (and b!628864 res!406305) b!628854))

(assert (= (and b!628854 res!406311) b!628860))

(assert (= (and b!628860 res!406309) b!628855))

(assert (= (and b!628855 res!406310) b!628863))

(assert (= (and b!628863 res!406308) b!628859))

(assert (= (and b!628859 res!406315) b!628858))

(assert (= (and b!628858 res!406314) b!628862))

(assert (= (and b!628862 res!406312) b!628861))

(declare-fun m!604273 () Bool)

(assert (=> b!628860 m!604273))

(declare-fun m!604275 () Bool)

(assert (=> b!628856 m!604275))

(assert (=> b!628856 m!604275))

(declare-fun m!604277 () Bool)

(assert (=> b!628856 m!604277))

(declare-fun m!604279 () Bool)

(assert (=> b!628864 m!604279))

(declare-fun m!604281 () Bool)

(assert (=> b!628861 m!604281))

(assert (=> b!628858 m!604275))

(assert (=> b!628858 m!604275))

(declare-fun m!604283 () Bool)

(assert (=> b!628858 m!604283))

(declare-fun m!604285 () Bool)

(assert (=> b!628863 m!604285))

(declare-fun m!604287 () Bool)

(assert (=> b!628859 m!604287))

(declare-fun m!604289 () Bool)

(assert (=> b!628859 m!604289))

(declare-fun m!604291 () Bool)

(assert (=> b!628859 m!604291))

(declare-fun m!604293 () Bool)

(assert (=> b!628855 m!604293))

(declare-fun m!604295 () Bool)

(assert (=> b!628862 m!604295))

(assert (=> b!628862 m!604275))

(declare-fun m!604297 () Bool)

(assert (=> start!56790 m!604297))

(declare-fun m!604299 () Bool)

(assert (=> start!56790 m!604299))

(declare-fun m!604301 () Bool)

(assert (=> b!628854 m!604301))

(check-sat (not b!628860) (not b!628858) (not b!628861) (not b!628863) (not b!628854) (not b!628856) (not b!628864) (not b!628855) (not start!56790))
(check-sat)
