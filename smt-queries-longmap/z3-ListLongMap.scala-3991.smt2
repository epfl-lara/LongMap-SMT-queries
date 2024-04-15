; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54120 () Bool)

(assert start!54120)

(declare-fun b!590783 () Bool)

(declare-fun e!337290 () Bool)

(declare-datatypes ((SeekEntryResult!6139 0))(
  ( (MissingZero!6139 (index!26792 (_ BitVec 32))) (Found!6139 (index!26793 (_ BitVec 32))) (Intermediate!6139 (undefined!6951 Bool) (index!26794 (_ BitVec 32)) (x!55598 (_ BitVec 32))) (Undefined!6139) (MissingVacant!6139 (index!26795 (_ BitVec 32))) )
))
(declare-fun lt!267926 () SeekEntryResult!6139)

(declare-fun lt!267924 () SeekEntryResult!6139)

(assert (=> b!590783 (= e!337290 (= lt!267926 lt!267924))))

(declare-fun b!590784 () Bool)

(declare-fun e!337291 () Bool)

(declare-fun e!337299 () Bool)

(assert (=> b!590784 (= e!337291 e!337299)))

(declare-fun res!377922 () Bool)

(assert (=> b!590784 (=> (not res!377922) (not e!337299))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36864 0))(
  ( (array!36865 (arr!17702 (Array (_ BitVec 32) (_ BitVec 64))) (size!18067 (_ BitVec 32))) )
))
(declare-fun lt!267923 () array!36864)

(declare-fun a!2986 () array!36864)

(declare-fun arrayContainsKey!0 (array!36864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590784 (= res!377922 (arrayContainsKey!0 lt!267923 (select (arr!17702 a!2986) j!136) j!136))))

(declare-fun b!590785 () Bool)

(declare-fun res!377917 () Bool)

(declare-fun e!337298 () Bool)

(assert (=> b!590785 (=> (not res!377917) (not e!337298))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590785 (= res!377917 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17702 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590786 () Bool)

(declare-fun res!377915 () Bool)

(declare-fun e!337297 () Bool)

(assert (=> b!590786 (=> (not res!377915) (not e!337297))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!590786 (= res!377915 (and (= (size!18067 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18067 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18067 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590787 () Bool)

(declare-fun e!337292 () Bool)

(assert (=> b!590787 (= e!337292 e!337291)))

(declare-fun res!377909 () Bool)

(assert (=> b!590787 (=> res!377909 e!337291)))

(declare-fun lt!267925 () (_ BitVec 64))

(declare-fun lt!267922 () (_ BitVec 64))

(assert (=> b!590787 (= res!377909 (or (not (= (select (arr!17702 a!2986) j!136) lt!267922)) (not (= (select (arr!17702 a!2986) j!136) lt!267925)) (bvsge j!136 index!984)))))

(declare-fun b!590788 () Bool)

(assert (=> b!590788 (= e!337297 e!337298)))

(declare-fun res!377918 () Bool)

(assert (=> b!590788 (=> (not res!377918) (not e!337298))))

(declare-fun lt!267921 () SeekEntryResult!6139)

(assert (=> b!590788 (= res!377918 (or (= lt!267921 (MissingZero!6139 i!1108)) (= lt!267921 (MissingVacant!6139 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36864 (_ BitVec 32)) SeekEntryResult!6139)

(assert (=> b!590788 (= lt!267921 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590789 () Bool)

(declare-fun e!337289 () Bool)

(declare-fun e!337294 () Bool)

(assert (=> b!590789 (= e!337289 e!337294)))

(declare-fun res!377910 () Bool)

(assert (=> b!590789 (=> (not res!377910) (not e!337294))))

(assert (=> b!590789 (= res!377910 (and (= lt!267926 (Found!6139 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17702 a!2986) index!984) (select (arr!17702 a!2986) j!136))) (not (= (select (arr!17702 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36864 (_ BitVec 32)) SeekEntryResult!6139)

(assert (=> b!590789 (= lt!267926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590790 () Bool)

(declare-fun res!377924 () Bool)

(assert (=> b!590790 (=> (not res!377924) (not e!337297))))

(assert (=> b!590790 (= res!377924 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590791 () Bool)

(declare-fun e!337293 () Bool)

(assert (=> b!590791 (= e!337293 true)))

(assert (=> b!590791 e!337292))

(declare-fun res!377921 () Bool)

(assert (=> b!590791 (=> (not res!377921) (not e!337292))))

(assert (=> b!590791 (= res!377921 (= lt!267925 (select (arr!17702 a!2986) j!136)))))

(assert (=> b!590791 (= lt!267925 (select (store (arr!17702 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!590792 () Bool)

(declare-datatypes ((Unit!18468 0))(
  ( (Unit!18469) )
))
(declare-fun e!337295 () Unit!18468)

(declare-fun Unit!18470 () Unit!18468)

(assert (=> b!590792 (= e!337295 Unit!18470)))

(declare-fun b!590793 () Bool)

(declare-fun res!377916 () Bool)

(assert (=> b!590793 (=> (not res!377916) (not e!337298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36864 (_ BitVec 32)) Bool)

(assert (=> b!590793 (= res!377916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590794 () Bool)

(declare-fun res!377914 () Bool)

(assert (=> b!590794 (=> (not res!377914) (not e!337297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590794 (= res!377914 (validKeyInArray!0 k0!1786))))

(declare-fun b!590795 () Bool)

(assert (=> b!590795 (= e!337299 (arrayContainsKey!0 lt!267923 (select (arr!17702 a!2986) j!136) index!984))))

(declare-fun b!590796 () Bool)

(declare-fun res!377913 () Bool)

(assert (=> b!590796 (=> (not res!377913) (not e!337298))))

(declare-datatypes ((List!11782 0))(
  ( (Nil!11779) (Cons!11778 (h!12823 (_ BitVec 64)) (t!18001 List!11782)) )
))
(declare-fun arrayNoDuplicates!0 (array!36864 (_ BitVec 32) List!11782) Bool)

(assert (=> b!590796 (= res!377913 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11779))))

(declare-fun b!590797 () Bool)

(declare-fun Unit!18471 () Unit!18468)

(assert (=> b!590797 (= e!337295 Unit!18471)))

(assert (=> b!590797 false))

(declare-fun res!377920 () Bool)

(assert (=> start!54120 (=> (not res!377920) (not e!337297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54120 (= res!377920 (validMask!0 mask!3053))))

(assert (=> start!54120 e!337297))

(assert (=> start!54120 true))

(declare-fun array_inv!13585 (array!36864) Bool)

(assert (=> start!54120 (array_inv!13585 a!2986)))

(declare-fun b!590798 () Bool)

(assert (=> b!590798 (= e!337298 e!337289)))

(declare-fun res!377912 () Bool)

(assert (=> b!590798 (=> (not res!377912) (not e!337289))))

(assert (=> b!590798 (= res!377912 (= (select (store (arr!17702 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590798 (= lt!267923 (array!36865 (store (arr!17702 a!2986) i!1108 k0!1786) (size!18067 a!2986)))))

(declare-fun b!590799 () Bool)

(declare-fun res!377911 () Bool)

(assert (=> b!590799 (=> (not res!377911) (not e!337297))))

(assert (=> b!590799 (= res!377911 (validKeyInArray!0 (select (arr!17702 a!2986) j!136)))))

(declare-fun b!590800 () Bool)

(assert (=> b!590800 (= e!337294 (not e!337293))))

(declare-fun res!377923 () Bool)

(assert (=> b!590800 (=> res!377923 e!337293)))

(declare-fun lt!267920 () SeekEntryResult!6139)

(assert (=> b!590800 (= res!377923 (not (= lt!267920 (Found!6139 index!984))))))

(declare-fun lt!267928 () Unit!18468)

(assert (=> b!590800 (= lt!267928 e!337295)))

(declare-fun c!66804 () Bool)

(assert (=> b!590800 (= c!66804 (= lt!267920 Undefined!6139))))

(assert (=> b!590800 (= lt!267920 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267922 lt!267923 mask!3053))))

(assert (=> b!590800 e!337290))

(declare-fun res!377919 () Bool)

(assert (=> b!590800 (=> (not res!377919) (not e!337290))))

(declare-fun lt!267919 () (_ BitVec 32))

(assert (=> b!590800 (= res!377919 (= lt!267924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267919 vacantSpotIndex!68 lt!267922 lt!267923 mask!3053)))))

(assert (=> b!590800 (= lt!267924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267919 vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590800 (= lt!267922 (select (store (arr!17702 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267927 () Unit!18468)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36864 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18468)

(assert (=> b!590800 (= lt!267927 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267919 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590800 (= lt!267919 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54120 res!377920) b!590786))

(assert (= (and b!590786 res!377915) b!590799))

(assert (= (and b!590799 res!377911) b!590794))

(assert (= (and b!590794 res!377914) b!590790))

(assert (= (and b!590790 res!377924) b!590788))

(assert (= (and b!590788 res!377918) b!590793))

(assert (= (and b!590793 res!377916) b!590796))

(assert (= (and b!590796 res!377913) b!590785))

(assert (= (and b!590785 res!377917) b!590798))

(assert (= (and b!590798 res!377912) b!590789))

(assert (= (and b!590789 res!377910) b!590800))

(assert (= (and b!590800 res!377919) b!590783))

(assert (= (and b!590800 c!66804) b!590797))

(assert (= (and b!590800 (not c!66804)) b!590792))

(assert (= (and b!590800 (not res!377923)) b!590791))

(assert (= (and b!590791 res!377921) b!590787))

(assert (= (and b!590787 (not res!377909)) b!590784))

(assert (= (and b!590784 res!377922) b!590795))

(declare-fun m!568573 () Bool)

(assert (=> b!590787 m!568573))

(declare-fun m!568575 () Bool)

(assert (=> b!590788 m!568575))

(declare-fun m!568577 () Bool)

(assert (=> b!590785 m!568577))

(declare-fun m!568579 () Bool)

(assert (=> b!590800 m!568579))

(declare-fun m!568581 () Bool)

(assert (=> b!590800 m!568581))

(assert (=> b!590800 m!568573))

(assert (=> b!590800 m!568573))

(declare-fun m!568583 () Bool)

(assert (=> b!590800 m!568583))

(declare-fun m!568585 () Bool)

(assert (=> b!590800 m!568585))

(declare-fun m!568587 () Bool)

(assert (=> b!590800 m!568587))

(declare-fun m!568589 () Bool)

(assert (=> b!590800 m!568589))

(declare-fun m!568591 () Bool)

(assert (=> b!590800 m!568591))

(declare-fun m!568593 () Bool)

(assert (=> b!590796 m!568593))

(assert (=> b!590791 m!568573))

(assert (=> b!590791 m!568591))

(declare-fun m!568595 () Bool)

(assert (=> b!590791 m!568595))

(declare-fun m!568597 () Bool)

(assert (=> start!54120 m!568597))

(declare-fun m!568599 () Bool)

(assert (=> start!54120 m!568599))

(declare-fun m!568601 () Bool)

(assert (=> b!590794 m!568601))

(assert (=> b!590798 m!568591))

(declare-fun m!568603 () Bool)

(assert (=> b!590798 m!568603))

(declare-fun m!568605 () Bool)

(assert (=> b!590793 m!568605))

(assert (=> b!590795 m!568573))

(assert (=> b!590795 m!568573))

(declare-fun m!568607 () Bool)

(assert (=> b!590795 m!568607))

(assert (=> b!590784 m!568573))

(assert (=> b!590784 m!568573))

(declare-fun m!568609 () Bool)

(assert (=> b!590784 m!568609))

(assert (=> b!590799 m!568573))

(assert (=> b!590799 m!568573))

(declare-fun m!568611 () Bool)

(assert (=> b!590799 m!568611))

(declare-fun m!568613 () Bool)

(assert (=> b!590790 m!568613))

(declare-fun m!568615 () Bool)

(assert (=> b!590789 m!568615))

(assert (=> b!590789 m!568573))

(assert (=> b!590789 m!568573))

(declare-fun m!568617 () Bool)

(assert (=> b!590789 m!568617))

(check-sat (not b!590794) (not b!590790) (not b!590789) (not b!590795) (not b!590796) (not b!590799) (not b!590793) (not b!590800) (not b!590784) (not start!54120) (not b!590788))
(check-sat)
