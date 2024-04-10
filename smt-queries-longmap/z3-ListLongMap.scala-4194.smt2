; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57256 () Bool)

(assert start!57256)

(declare-fun b!633648 () Bool)

(declare-fun res!409783 () Bool)

(declare-fun e!362316 () Bool)

(assert (=> b!633648 (=> (not res!409783) (not e!362316))))

(declare-datatypes ((array!38166 0))(
  ( (array!38167 (arr!18313 (Array (_ BitVec 32) (_ BitVec 64))) (size!18677 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38166)

(declare-datatypes ((List!12354 0))(
  ( (Nil!12351) (Cons!12350 (h!13395 (_ BitVec 64)) (t!18582 List!12354)) )
))
(declare-fun arrayNoDuplicates!0 (array!38166 (_ BitVec 32) List!12354) Bool)

(assert (=> b!633648 (= res!409783 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12351))))

(declare-fun b!633649 () Bool)

(declare-fun e!362314 () Bool)

(assert (=> b!633649 (= e!362314 e!362316)))

(declare-fun res!409789 () Bool)

(assert (=> b!633649 (=> (not res!409789) (not e!362316))))

(declare-datatypes ((SeekEntryResult!6753 0))(
  ( (MissingZero!6753 (index!29311 (_ BitVec 32))) (Found!6753 (index!29312 (_ BitVec 32))) (Intermediate!6753 (undefined!7565 Bool) (index!29313 (_ BitVec 32)) (x!58054 (_ BitVec 32))) (Undefined!6753) (MissingVacant!6753 (index!29314 (_ BitVec 32))) )
))
(declare-fun lt!292882 () SeekEntryResult!6753)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633649 (= res!409789 (or (= lt!292882 (MissingZero!6753 i!1108)) (= lt!292882 (MissingVacant!6753 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38166 (_ BitVec 32)) SeekEntryResult!6753)

(assert (=> b!633649 (= lt!292882 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633650 () Bool)

(declare-fun res!409780 () Bool)

(assert (=> b!633650 (=> (not res!409780) (not e!362314))))

(declare-fun arrayContainsKey!0 (array!38166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633650 (= res!409780 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633651 () Bool)

(declare-fun res!409785 () Bool)

(assert (=> b!633651 (=> (not res!409785) (not e!362314))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!633651 (= res!409785 (and (= (size!18677 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18677 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18677 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633652 () Bool)

(declare-datatypes ((Unit!21346 0))(
  ( (Unit!21347) )
))
(declare-fun e!362311 () Unit!21346)

(declare-fun Unit!21348 () Unit!21346)

(assert (=> b!633652 (= e!362311 Unit!21348)))

(declare-fun b!633653 () Bool)

(declare-fun res!409790 () Bool)

(assert (=> b!633653 (=> (not res!409790) (not e!362314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633653 (= res!409790 (validKeyInArray!0 k0!1786))))

(declare-fun b!633654 () Bool)

(declare-fun e!362317 () Bool)

(declare-fun lt!292888 () SeekEntryResult!6753)

(declare-fun lt!292889 () SeekEntryResult!6753)

(assert (=> b!633654 (= e!362317 (= lt!292888 lt!292889))))

(declare-fun lt!292887 () array!38166)

(declare-fun e!362315 () Bool)

(declare-fun b!633655 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633655 (= e!362315 (arrayContainsKey!0 lt!292887 (select (arr!18313 a!2986) j!136) index!984))))

(declare-fun b!633656 () Bool)

(declare-fun Unit!21349 () Unit!21346)

(assert (=> b!633656 (= e!362311 Unit!21349)))

(assert (=> b!633656 false))

(declare-fun b!633657 () Bool)

(declare-fun res!409778 () Bool)

(assert (=> b!633657 (=> (not res!409778) (not e!362316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38166 (_ BitVec 32)) Bool)

(assert (=> b!633657 (= res!409778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633658 () Bool)

(declare-fun e!362319 () Bool)

(declare-fun e!362309 () Bool)

(assert (=> b!633658 (= e!362319 e!362309)))

(declare-fun res!409786 () Bool)

(assert (=> b!633658 (=> res!409786 e!362309)))

(declare-fun lt!292886 () (_ BitVec 64))

(declare-fun lt!292883 () (_ BitVec 64))

(assert (=> b!633658 (= res!409786 (or (not (= (select (arr!18313 a!2986) j!136) lt!292886)) (not (= (select (arr!18313 a!2986) j!136) lt!292883)) (bvsge j!136 index!984)))))

(declare-fun b!633659 () Bool)

(declare-fun res!409782 () Bool)

(assert (=> b!633659 (=> (not res!409782) (not e!362316))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633659 (= res!409782 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18313 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633660 () Bool)

(declare-fun e!362312 () Bool)

(assert (=> b!633660 (= e!362316 e!362312)))

(declare-fun res!409787 () Bool)

(assert (=> b!633660 (=> (not res!409787) (not e!362312))))

(assert (=> b!633660 (= res!409787 (= (select (store (arr!18313 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633660 (= lt!292887 (array!38167 (store (arr!18313 a!2986) i!1108 k0!1786) (size!18677 a!2986)))))

(declare-fun e!362313 () Bool)

(declare-fun b!633661 () Bool)

(assert (=> b!633661 (= e!362313 (or (not (= (select (arr!18313 a!2986) j!136) lt!292886)) (not (= (select (arr!18313 a!2986) j!136) lt!292883)) (bvsge j!136 index!984) (bvslt index!984 (size!18677 a!2986))))))

(assert (=> b!633661 e!362319))

(declare-fun res!409781 () Bool)

(assert (=> b!633661 (=> (not res!409781) (not e!362319))))

(assert (=> b!633661 (= res!409781 (= lt!292883 (select (arr!18313 a!2986) j!136)))))

(assert (=> b!633661 (= lt!292883 (select (store (arr!18313 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633662 () Bool)

(declare-fun e!362310 () Bool)

(assert (=> b!633662 (= e!362312 e!362310)))

(declare-fun res!409791 () Bool)

(assert (=> b!633662 (=> (not res!409791) (not e!362310))))

(assert (=> b!633662 (= res!409791 (and (= lt!292888 (Found!6753 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18313 a!2986) index!984) (select (arr!18313 a!2986) j!136))) (not (= (select (arr!18313 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38166 (_ BitVec 32)) SeekEntryResult!6753)

(assert (=> b!633662 (= lt!292888 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18313 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!409793 () Bool)

(assert (=> start!57256 (=> (not res!409793) (not e!362314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57256 (= res!409793 (validMask!0 mask!3053))))

(assert (=> start!57256 e!362314))

(assert (=> start!57256 true))

(declare-fun array_inv!14109 (array!38166) Bool)

(assert (=> start!57256 (array_inv!14109 a!2986)))

(declare-fun b!633663 () Bool)

(declare-fun res!409779 () Bool)

(assert (=> b!633663 (=> (not res!409779) (not e!362314))))

(assert (=> b!633663 (= res!409779 (validKeyInArray!0 (select (arr!18313 a!2986) j!136)))))

(declare-fun b!633664 () Bool)

(assert (=> b!633664 (= e!362310 (not e!362313))))

(declare-fun res!409784 () Bool)

(assert (=> b!633664 (=> res!409784 e!362313)))

(declare-fun lt!292884 () SeekEntryResult!6753)

(assert (=> b!633664 (= res!409784 (not (= lt!292884 (Found!6753 index!984))))))

(declare-fun lt!292890 () Unit!21346)

(assert (=> b!633664 (= lt!292890 e!362311)))

(declare-fun c!72302 () Bool)

(assert (=> b!633664 (= c!72302 (= lt!292884 Undefined!6753))))

(assert (=> b!633664 (= lt!292884 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292886 lt!292887 mask!3053))))

(assert (=> b!633664 e!362317))

(declare-fun res!409792 () Bool)

(assert (=> b!633664 (=> (not res!409792) (not e!362317))))

(declare-fun lt!292885 () (_ BitVec 32))

(assert (=> b!633664 (= res!409792 (= lt!292889 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292885 vacantSpotIndex!68 lt!292886 lt!292887 mask!3053)))))

(assert (=> b!633664 (= lt!292889 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292885 vacantSpotIndex!68 (select (arr!18313 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633664 (= lt!292886 (select (store (arr!18313 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292891 () Unit!21346)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38166 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21346)

(assert (=> b!633664 (= lt!292891 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292885 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633664 (= lt!292885 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633665 () Bool)

(assert (=> b!633665 (= e!362309 e!362315)))

(declare-fun res!409788 () Bool)

(assert (=> b!633665 (=> (not res!409788) (not e!362315))))

(assert (=> b!633665 (= res!409788 (arrayContainsKey!0 lt!292887 (select (arr!18313 a!2986) j!136) j!136))))

(assert (= (and start!57256 res!409793) b!633651))

(assert (= (and b!633651 res!409785) b!633663))

(assert (= (and b!633663 res!409779) b!633653))

(assert (= (and b!633653 res!409790) b!633650))

(assert (= (and b!633650 res!409780) b!633649))

(assert (= (and b!633649 res!409789) b!633657))

(assert (= (and b!633657 res!409778) b!633648))

(assert (= (and b!633648 res!409783) b!633659))

(assert (= (and b!633659 res!409782) b!633660))

(assert (= (and b!633660 res!409787) b!633662))

(assert (= (and b!633662 res!409791) b!633664))

(assert (= (and b!633664 res!409792) b!633654))

(assert (= (and b!633664 c!72302) b!633656))

(assert (= (and b!633664 (not c!72302)) b!633652))

(assert (= (and b!633664 (not res!409784)) b!633661))

(assert (= (and b!633661 res!409781) b!633658))

(assert (= (and b!633658 (not res!409786)) b!633665))

(assert (= (and b!633665 res!409788) b!633655))

(declare-fun m!608271 () Bool)

(assert (=> b!633659 m!608271))

(declare-fun m!608273 () Bool)

(assert (=> b!633653 m!608273))

(declare-fun m!608275 () Bool)

(assert (=> start!57256 m!608275))

(declare-fun m!608277 () Bool)

(assert (=> start!57256 m!608277))

(declare-fun m!608279 () Bool)

(assert (=> b!633658 m!608279))

(assert (=> b!633665 m!608279))

(assert (=> b!633665 m!608279))

(declare-fun m!608281 () Bool)

(assert (=> b!633665 m!608281))

(assert (=> b!633663 m!608279))

(assert (=> b!633663 m!608279))

(declare-fun m!608283 () Bool)

(assert (=> b!633663 m!608283))

(declare-fun m!608285 () Bool)

(assert (=> b!633657 m!608285))

(assert (=> b!633655 m!608279))

(assert (=> b!633655 m!608279))

(declare-fun m!608287 () Bool)

(assert (=> b!633655 m!608287))

(declare-fun m!608289 () Bool)

(assert (=> b!633662 m!608289))

(assert (=> b!633662 m!608279))

(assert (=> b!633662 m!608279))

(declare-fun m!608291 () Bool)

(assert (=> b!633662 m!608291))

(assert (=> b!633661 m!608279))

(declare-fun m!608293 () Bool)

(assert (=> b!633661 m!608293))

(declare-fun m!608295 () Bool)

(assert (=> b!633661 m!608295))

(declare-fun m!608297 () Bool)

(assert (=> b!633649 m!608297))

(declare-fun m!608299 () Bool)

(assert (=> b!633664 m!608299))

(declare-fun m!608301 () Bool)

(assert (=> b!633664 m!608301))

(declare-fun m!608303 () Bool)

(assert (=> b!633664 m!608303))

(assert (=> b!633664 m!608279))

(declare-fun m!608305 () Bool)

(assert (=> b!633664 m!608305))

(assert (=> b!633664 m!608279))

(assert (=> b!633664 m!608293))

(declare-fun m!608307 () Bool)

(assert (=> b!633664 m!608307))

(declare-fun m!608309 () Bool)

(assert (=> b!633664 m!608309))

(declare-fun m!608311 () Bool)

(assert (=> b!633648 m!608311))

(assert (=> b!633660 m!608293))

(declare-fun m!608313 () Bool)

(assert (=> b!633660 m!608313))

(declare-fun m!608315 () Bool)

(assert (=> b!633650 m!608315))

(check-sat (not b!633650) (not start!57256) (not b!633664) (not b!633655) (not b!633663) (not b!633653) (not b!633648) (not b!633657) (not b!633649) (not b!633662) (not b!633665))
(check-sat)
