; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58316 () Bool)

(assert start!58316)

(declare-fun b!643660 () Bool)

(declare-fun e!368716 () Bool)

(declare-fun e!368721 () Bool)

(assert (=> b!643660 (= e!368716 e!368721)))

(declare-fun res!416874 () Bool)

(assert (=> b!643660 (=> (not res!416874) (not e!368721))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6860 0))(
  ( (MissingZero!6860 (index!29772 (_ BitVec 32))) (Found!6860 (index!29773 (_ BitVec 32))) (Intermediate!6860 (undefined!7672 Bool) (index!29774 (_ BitVec 32)) (x!58548 (_ BitVec 32))) (Undefined!6860) (MissingVacant!6860 (index!29775 (_ BitVec 32))) )
))
(declare-fun lt!298200 () SeekEntryResult!6860)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38413 0))(
  ( (array!38414 (arr!18420 (Array (_ BitVec 32) (_ BitVec 64))) (size!18784 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38413)

(assert (=> b!643660 (= res!416874 (and (= lt!298200 (Found!6860 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18420 a!2986) index!984) (select (arr!18420 a!2986) j!136))) (not (= (select (arr!18420 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38413 (_ BitVec 32)) SeekEntryResult!6860)

(assert (=> b!643660 (= lt!298200 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18420 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643661 () Bool)

(declare-fun e!368719 () Bool)

(assert (=> b!643661 (= e!368719 true)))

(declare-fun e!368723 () Bool)

(assert (=> b!643661 e!368723))

(declare-fun res!416871 () Bool)

(assert (=> b!643661 (=> (not res!416871) (not e!368723))))

(declare-fun lt!298199 () array!38413)

(declare-fun arrayContainsKey!0 (array!38413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643661 (= res!416871 (arrayContainsKey!0 lt!298199 (select (arr!18420 a!2986) j!136) j!136))))

(declare-fun b!643662 () Bool)

(declare-fun e!368728 () Bool)

(declare-fun e!368726 () Bool)

(assert (=> b!643662 (= e!368728 e!368726)))

(declare-fun res!416880 () Bool)

(assert (=> b!643662 (=> (not res!416880) (not e!368726))))

(declare-fun lt!298193 () SeekEntryResult!6860)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643662 (= res!416880 (or (= lt!298193 (MissingZero!6860 i!1108)) (= lt!298193 (MissingVacant!6860 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38413 (_ BitVec 32)) SeekEntryResult!6860)

(assert (=> b!643662 (= lt!298193 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!643663 () Bool)

(assert (=> b!643663 (= e!368726 e!368716)))

(declare-fun res!416865 () Bool)

(assert (=> b!643663 (=> (not res!416865) (not e!368716))))

(assert (=> b!643663 (= res!416865 (= (select (store (arr!18420 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643663 (= lt!298199 (array!38414 (store (arr!18420 a!2986) i!1108 k!1786) (size!18784 a!2986)))))

(declare-fun res!416875 () Bool)

(assert (=> start!58316 (=> (not res!416875) (not e!368728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58316 (= res!416875 (validMask!0 mask!3053))))

(assert (=> start!58316 e!368728))

(assert (=> start!58316 true))

(declare-fun array_inv!14216 (array!38413) Bool)

(assert (=> start!58316 (array_inv!14216 a!2986)))

(declare-fun b!643664 () Bool)

(declare-fun res!416881 () Bool)

(assert (=> b!643664 (=> (not res!416881) (not e!368726))))

(declare-datatypes ((List!12461 0))(
  ( (Nil!12458) (Cons!12457 (h!13502 (_ BitVec 64)) (t!18689 List!12461)) )
))
(declare-fun arrayNoDuplicates!0 (array!38413 (_ BitVec 32) List!12461) Bool)

(assert (=> b!643664 (= res!416881 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12458))))

(declare-fun b!643665 () Bool)

(declare-datatypes ((Unit!21786 0))(
  ( (Unit!21787) )
))
(declare-fun e!368720 () Unit!21786)

(declare-fun Unit!21788 () Unit!21786)

(assert (=> b!643665 (= e!368720 Unit!21788)))

(declare-fun lt!298207 () Unit!21786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21786)

(assert (=> b!643665 (= lt!298207 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298199 (select (arr!18420 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643665 (arrayContainsKey!0 lt!298199 (select (arr!18420 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298205 () Unit!21786)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12461) Unit!21786)

(assert (=> b!643665 (= lt!298205 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12458))))

(assert (=> b!643665 (arrayNoDuplicates!0 lt!298199 #b00000000000000000000000000000000 Nil!12458)))

(declare-fun lt!298202 () Unit!21786)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38413 (_ BitVec 32) (_ BitVec 32)) Unit!21786)

(assert (=> b!643665 (= lt!298202 (lemmaNoDuplicateFromThenFromBigger!0 lt!298199 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643665 (arrayNoDuplicates!0 lt!298199 j!136 Nil!12458)))

(declare-fun lt!298201 () Unit!21786)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38413 (_ BitVec 64) (_ BitVec 32) List!12461) Unit!21786)

(assert (=> b!643665 (= lt!298201 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298199 (select (arr!18420 a!2986) j!136) j!136 Nil!12458))))

(assert (=> b!643665 false))

(declare-fun b!643666 () Bool)

(assert (=> b!643666 (= e!368723 (arrayContainsKey!0 lt!298199 (select (arr!18420 a!2986) j!136) index!984))))

(declare-fun b!643667 () Bool)

(declare-fun e!368718 () Unit!21786)

(declare-fun Unit!21789 () Unit!21786)

(assert (=> b!643667 (= e!368718 Unit!21789)))

(assert (=> b!643667 false))

(declare-fun b!643668 () Bool)

(declare-fun Unit!21790 () Unit!21786)

(assert (=> b!643668 (= e!368720 Unit!21790)))

(declare-fun b!643669 () Bool)

(declare-fun res!416882 () Bool)

(assert (=> b!643669 (=> (not res!416882) (not e!368728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643669 (= res!416882 (validKeyInArray!0 k!1786))))

(declare-fun b!643670 () Bool)

(declare-fun res!416867 () Bool)

(assert (=> b!643670 (=> (not res!416867) (not e!368726))))

(assert (=> b!643670 (= res!416867 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18420 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643671 () Bool)

(declare-fun e!368725 () Bool)

(declare-fun lt!298196 () SeekEntryResult!6860)

(assert (=> b!643671 (= e!368725 (= lt!298200 lt!298196))))

(declare-fun b!643672 () Bool)

(declare-fun res!416866 () Bool)

(assert (=> b!643672 (=> (not res!416866) (not e!368728))))

(assert (=> b!643672 (= res!416866 (and (= (size!18784 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18784 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18784 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643673 () Bool)

(declare-fun res!416879 () Bool)

(assert (=> b!643673 (=> (not res!416879) (not e!368726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38413 (_ BitVec 32)) Bool)

(assert (=> b!643673 (= res!416879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!368724 () Bool)

(declare-fun b!643674 () Bool)

(assert (=> b!643674 (= e!368724 (arrayContainsKey!0 lt!298199 (select (arr!18420 a!2986) j!136) index!984))))

(declare-fun b!643675 () Bool)

(declare-fun e!368727 () Bool)

(assert (=> b!643675 (= e!368727 e!368724)))

(declare-fun res!416869 () Bool)

(assert (=> b!643675 (=> (not res!416869) (not e!368724))))

(assert (=> b!643675 (= res!416869 (arrayContainsKey!0 lt!298199 (select (arr!18420 a!2986) j!136) j!136))))

(declare-fun b!643676 () Bool)

(declare-fun res!416872 () Bool)

(assert (=> b!643676 (=> (not res!416872) (not e!368728))))

(assert (=> b!643676 (= res!416872 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643677 () Bool)

(declare-fun e!368729 () Bool)

(assert (=> b!643677 (= e!368721 (not e!368729))))

(declare-fun res!416878 () Bool)

(assert (=> b!643677 (=> res!416878 e!368729)))

(declare-fun lt!298194 () SeekEntryResult!6860)

(assert (=> b!643677 (= res!416878 (not (= lt!298194 (Found!6860 index!984))))))

(declare-fun lt!298203 () Unit!21786)

(assert (=> b!643677 (= lt!298203 e!368718)))

(declare-fun c!73766 () Bool)

(assert (=> b!643677 (= c!73766 (= lt!298194 Undefined!6860))))

(declare-fun lt!298195 () (_ BitVec 64))

(assert (=> b!643677 (= lt!298194 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298195 lt!298199 mask!3053))))

(assert (=> b!643677 e!368725))

(declare-fun res!416870 () Bool)

(assert (=> b!643677 (=> (not res!416870) (not e!368725))))

(declare-fun lt!298204 () (_ BitVec 32))

(assert (=> b!643677 (= res!416870 (= lt!298196 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298204 vacantSpotIndex!68 lt!298195 lt!298199 mask!3053)))))

(assert (=> b!643677 (= lt!298196 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298204 vacantSpotIndex!68 (select (arr!18420 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643677 (= lt!298195 (select (store (arr!18420 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298198 () Unit!21786)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21786)

(assert (=> b!643677 (= lt!298198 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298204 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643677 (= lt!298204 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643678 () Bool)

(declare-fun e!368722 () Bool)

(assert (=> b!643678 (= e!368722 e!368719)))

(declare-fun res!416868 () Bool)

(assert (=> b!643678 (=> res!416868 e!368719)))

(assert (=> b!643678 (= res!416868 (bvsge index!984 j!136))))

(declare-fun lt!298197 () Unit!21786)

(assert (=> b!643678 (= lt!298197 e!368720)))

(declare-fun c!73765 () Bool)

(assert (=> b!643678 (= c!73765 (bvslt j!136 index!984))))

(declare-fun b!643679 () Bool)

(declare-fun e!368730 () Bool)

(assert (=> b!643679 (= e!368730 e!368727)))

(declare-fun res!416873 () Bool)

(assert (=> b!643679 (=> res!416873 e!368727)))

(declare-fun lt!298206 () (_ BitVec 64))

(assert (=> b!643679 (= res!416873 (or (not (= (select (arr!18420 a!2986) j!136) lt!298195)) (not (= (select (arr!18420 a!2986) j!136) lt!298206)) (bvsge j!136 index!984)))))

(declare-fun b!643680 () Bool)

(assert (=> b!643680 (= e!368729 e!368722)))

(declare-fun res!416876 () Bool)

(assert (=> b!643680 (=> res!416876 e!368722)))

(assert (=> b!643680 (= res!416876 (or (not (= (select (arr!18420 a!2986) j!136) lt!298195)) (not (= (select (arr!18420 a!2986) j!136) lt!298206))))))

(assert (=> b!643680 e!368730))

(declare-fun res!416877 () Bool)

(assert (=> b!643680 (=> (not res!416877) (not e!368730))))

(assert (=> b!643680 (= res!416877 (= lt!298206 (select (arr!18420 a!2986) j!136)))))

(assert (=> b!643680 (= lt!298206 (select (store (arr!18420 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!643681 () Bool)

(declare-fun res!416864 () Bool)

(assert (=> b!643681 (=> (not res!416864) (not e!368728))))

(assert (=> b!643681 (= res!416864 (validKeyInArray!0 (select (arr!18420 a!2986) j!136)))))

(declare-fun b!643682 () Bool)

(declare-fun Unit!21791 () Unit!21786)

(assert (=> b!643682 (= e!368718 Unit!21791)))

(assert (= (and start!58316 res!416875) b!643672))

(assert (= (and b!643672 res!416866) b!643681))

(assert (= (and b!643681 res!416864) b!643669))

(assert (= (and b!643669 res!416882) b!643676))

(assert (= (and b!643676 res!416872) b!643662))

(assert (= (and b!643662 res!416880) b!643673))

(assert (= (and b!643673 res!416879) b!643664))

(assert (= (and b!643664 res!416881) b!643670))

(assert (= (and b!643670 res!416867) b!643663))

(assert (= (and b!643663 res!416865) b!643660))

(assert (= (and b!643660 res!416874) b!643677))

(assert (= (and b!643677 res!416870) b!643671))

(assert (= (and b!643677 c!73766) b!643667))

(assert (= (and b!643677 (not c!73766)) b!643682))

(assert (= (and b!643677 (not res!416878)) b!643680))

(assert (= (and b!643680 res!416877) b!643679))

(assert (= (and b!643679 (not res!416873)) b!643675))

(assert (= (and b!643675 res!416869) b!643674))

(assert (= (and b!643680 (not res!416876)) b!643678))

(assert (= (and b!643678 c!73765) b!643665))

(assert (= (and b!643678 (not c!73765)) b!643668))

(assert (= (and b!643678 (not res!416868)) b!643661))

(assert (= (and b!643661 res!416871) b!643666))

(declare-fun m!617369 () Bool)

(assert (=> b!643661 m!617369))

(assert (=> b!643661 m!617369))

(declare-fun m!617371 () Bool)

(assert (=> b!643661 m!617371))

(declare-fun m!617373 () Bool)

(assert (=> b!643677 m!617373))

(declare-fun m!617375 () Bool)

(assert (=> b!643677 m!617375))

(assert (=> b!643677 m!617369))

(declare-fun m!617377 () Bool)

(assert (=> b!643677 m!617377))

(declare-fun m!617379 () Bool)

(assert (=> b!643677 m!617379))

(declare-fun m!617381 () Bool)

(assert (=> b!643677 m!617381))

(declare-fun m!617383 () Bool)

(assert (=> b!643677 m!617383))

(assert (=> b!643677 m!617369))

(declare-fun m!617385 () Bool)

(assert (=> b!643677 m!617385))

(assert (=> b!643663 m!617377))

(declare-fun m!617387 () Bool)

(assert (=> b!643663 m!617387))

(declare-fun m!617389 () Bool)

(assert (=> b!643660 m!617389))

(assert (=> b!643660 m!617369))

(assert (=> b!643660 m!617369))

(declare-fun m!617391 () Bool)

(assert (=> b!643660 m!617391))

(assert (=> b!643681 m!617369))

(assert (=> b!643681 m!617369))

(declare-fun m!617393 () Bool)

(assert (=> b!643681 m!617393))

(assert (=> b!643665 m!617369))

(declare-fun m!617395 () Bool)

(assert (=> b!643665 m!617395))

(assert (=> b!643665 m!617369))

(declare-fun m!617397 () Bool)

(assert (=> b!643665 m!617397))

(declare-fun m!617399 () Bool)

(assert (=> b!643665 m!617399))

(assert (=> b!643665 m!617369))

(declare-fun m!617401 () Bool)

(assert (=> b!643665 m!617401))

(assert (=> b!643665 m!617369))

(declare-fun m!617403 () Bool)

(assert (=> b!643665 m!617403))

(declare-fun m!617405 () Bool)

(assert (=> b!643665 m!617405))

(declare-fun m!617407 () Bool)

(assert (=> b!643665 m!617407))

(assert (=> b!643666 m!617369))

(assert (=> b!643666 m!617369))

(declare-fun m!617409 () Bool)

(assert (=> b!643666 m!617409))

(declare-fun m!617411 () Bool)

(assert (=> b!643669 m!617411))

(assert (=> b!643679 m!617369))

(assert (=> b!643675 m!617369))

(assert (=> b!643675 m!617369))

(assert (=> b!643675 m!617371))

(declare-fun m!617413 () Bool)

(assert (=> b!643673 m!617413))

(declare-fun m!617415 () Bool)

(assert (=> b!643670 m!617415))

(declare-fun m!617417 () Bool)

(assert (=> b!643664 m!617417))

(declare-fun m!617419 () Bool)

(assert (=> start!58316 m!617419))

(declare-fun m!617421 () Bool)

(assert (=> start!58316 m!617421))

(declare-fun m!617423 () Bool)

(assert (=> b!643676 m!617423))

(declare-fun m!617425 () Bool)

(assert (=> b!643662 m!617425))

(assert (=> b!643674 m!617369))

(assert (=> b!643674 m!617369))

(assert (=> b!643674 m!617409))

(assert (=> b!643680 m!617369))

(assert (=> b!643680 m!617377))

(declare-fun m!617427 () Bool)

(assert (=> b!643680 m!617427))

(push 1)

