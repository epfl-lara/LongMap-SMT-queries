; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57088 () Bool)

(assert start!57088)

(declare-fun b!631812 () Bool)

(declare-fun res!408498 () Bool)

(declare-fun e!361237 () Bool)

(assert (=> b!631812 (=> (not res!408498) (not e!361237))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631812 (= res!408498 (validKeyInArray!0 k0!1786))))

(declare-fun b!631813 () Bool)

(declare-fun e!361236 () Bool)

(declare-fun e!361242 () Bool)

(assert (=> b!631813 (= e!361236 (not e!361242))))

(declare-fun res!408500 () Bool)

(assert (=> b!631813 (=> res!408500 e!361242)))

(declare-datatypes ((SeekEntryResult!6726 0))(
  ( (MissingZero!6726 (index!29197 (_ BitVec 32))) (Found!6726 (index!29198 (_ BitVec 32))) (Intermediate!6726 (undefined!7538 Bool) (index!29199 (_ BitVec 32)) (x!57937 (_ BitVec 32))) (Undefined!6726) (MissingVacant!6726 (index!29200 (_ BitVec 32))) )
))
(declare-fun lt!291916 () SeekEntryResult!6726)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631813 (= res!408500 (not (= lt!291916 (Found!6726 index!984))))))

(declare-datatypes ((Unit!21238 0))(
  ( (Unit!21239) )
))
(declare-fun lt!291917 () Unit!21238)

(declare-fun e!361235 () Unit!21238)

(assert (=> b!631813 (= lt!291917 e!361235)))

(declare-fun c!72026 () Bool)

(assert (=> b!631813 (= c!72026 (= lt!291916 Undefined!6726))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38107 0))(
  ( (array!38108 (arr!18286 (Array (_ BitVec 32) (_ BitVec 64))) (size!18650 (_ BitVec 32))) )
))
(declare-fun lt!291914 () array!38107)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!291915 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38107 (_ BitVec 32)) SeekEntryResult!6726)

(assert (=> b!631813 (= lt!291916 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291915 lt!291914 mask!3053))))

(declare-fun e!361239 () Bool)

(assert (=> b!631813 e!361239))

(declare-fun res!408501 () Bool)

(assert (=> b!631813 (=> (not res!408501) (not e!361239))))

(declare-fun lt!291920 () SeekEntryResult!6726)

(declare-fun lt!291919 () (_ BitVec 32))

(assert (=> b!631813 (= res!408501 (= lt!291920 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291919 vacantSpotIndex!68 lt!291915 lt!291914 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38107)

(assert (=> b!631813 (= lt!291920 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291919 vacantSpotIndex!68 (select (arr!18286 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631813 (= lt!291915 (select (store (arr!18286 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291918 () Unit!21238)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38107 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21238)

(assert (=> b!631813 (= lt!291918 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291919 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631813 (= lt!291919 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631814 () Bool)

(declare-fun e!361241 () Bool)

(assert (=> b!631814 (= e!361241 e!361236)))

(declare-fun res!408494 () Bool)

(assert (=> b!631814 (=> (not res!408494) (not e!361236))))

(declare-fun lt!291921 () SeekEntryResult!6726)

(assert (=> b!631814 (= res!408494 (and (= lt!291921 (Found!6726 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18286 a!2986) index!984) (select (arr!18286 a!2986) j!136))) (not (= (select (arr!18286 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631814 (= lt!291921 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18286 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!408495 () Bool)

(assert (=> start!57088 (=> (not res!408495) (not e!361237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57088 (= res!408495 (validMask!0 mask!3053))))

(assert (=> start!57088 e!361237))

(assert (=> start!57088 true))

(declare-fun array_inv!14082 (array!38107) Bool)

(assert (=> start!57088 (array_inv!14082 a!2986)))

(declare-fun b!631815 () Bool)

(declare-fun Unit!21240 () Unit!21238)

(assert (=> b!631815 (= e!361235 Unit!21240)))

(assert (=> b!631815 false))

(declare-fun b!631816 () Bool)

(declare-fun res!408504 () Bool)

(assert (=> b!631816 (=> (not res!408504) (not e!361237))))

(declare-fun arrayContainsKey!0 (array!38107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631816 (= res!408504 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631817 () Bool)

(declare-fun e!361238 () Bool)

(assert (=> b!631817 (= e!361237 e!361238)))

(declare-fun res!408502 () Bool)

(assert (=> b!631817 (=> (not res!408502) (not e!361238))))

(declare-fun lt!291922 () SeekEntryResult!6726)

(assert (=> b!631817 (= res!408502 (or (= lt!291922 (MissingZero!6726 i!1108)) (= lt!291922 (MissingVacant!6726 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38107 (_ BitVec 32)) SeekEntryResult!6726)

(assert (=> b!631817 (= lt!291922 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631818 () Bool)

(declare-fun res!408497 () Bool)

(assert (=> b!631818 (=> (not res!408497) (not e!361238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38107 (_ BitVec 32)) Bool)

(assert (=> b!631818 (= res!408497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631819 () Bool)

(declare-fun res!408496 () Bool)

(assert (=> b!631819 (=> (not res!408496) (not e!361237))))

(assert (=> b!631819 (= res!408496 (and (= (size!18650 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18650 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18650 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631820 () Bool)

(assert (=> b!631820 (= e!361242 true)))

(assert (=> b!631820 (= (select (store (arr!18286 a!2986) i!1108 k0!1786) index!984) (select (arr!18286 a!2986) j!136))))

(declare-fun b!631821 () Bool)

(declare-fun res!408505 () Bool)

(assert (=> b!631821 (=> (not res!408505) (not e!361237))))

(assert (=> b!631821 (= res!408505 (validKeyInArray!0 (select (arr!18286 a!2986) j!136)))))

(declare-fun b!631822 () Bool)

(assert (=> b!631822 (= e!361238 e!361241)))

(declare-fun res!408506 () Bool)

(assert (=> b!631822 (=> (not res!408506) (not e!361241))))

(assert (=> b!631822 (= res!408506 (= (select (store (arr!18286 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631822 (= lt!291914 (array!38108 (store (arr!18286 a!2986) i!1108 k0!1786) (size!18650 a!2986)))))

(declare-fun b!631823 () Bool)

(declare-fun res!408503 () Bool)

(assert (=> b!631823 (=> (not res!408503) (not e!361238))))

(assert (=> b!631823 (= res!408503 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18286 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631824 () Bool)

(declare-fun Unit!21241 () Unit!21238)

(assert (=> b!631824 (= e!361235 Unit!21241)))

(declare-fun b!631825 () Bool)

(assert (=> b!631825 (= e!361239 (= lt!291921 lt!291920))))

(declare-fun b!631826 () Bool)

(declare-fun res!408499 () Bool)

(assert (=> b!631826 (=> (not res!408499) (not e!361238))))

(declare-datatypes ((List!12327 0))(
  ( (Nil!12324) (Cons!12323 (h!13368 (_ BitVec 64)) (t!18555 List!12327)) )
))
(declare-fun arrayNoDuplicates!0 (array!38107 (_ BitVec 32) List!12327) Bool)

(assert (=> b!631826 (= res!408499 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12324))))

(assert (= (and start!57088 res!408495) b!631819))

(assert (= (and b!631819 res!408496) b!631821))

(assert (= (and b!631821 res!408505) b!631812))

(assert (= (and b!631812 res!408498) b!631816))

(assert (= (and b!631816 res!408504) b!631817))

(assert (= (and b!631817 res!408502) b!631818))

(assert (= (and b!631818 res!408497) b!631826))

(assert (= (and b!631826 res!408499) b!631823))

(assert (= (and b!631823 res!408503) b!631822))

(assert (= (and b!631822 res!408506) b!631814))

(assert (= (and b!631814 res!408494) b!631813))

(assert (= (and b!631813 res!408501) b!631825))

(assert (= (and b!631813 c!72026) b!631815))

(assert (= (and b!631813 (not c!72026)) b!631824))

(assert (= (and b!631813 (not res!408500)) b!631820))

(declare-fun m!606681 () Bool)

(assert (=> b!631814 m!606681))

(declare-fun m!606683 () Bool)

(assert (=> b!631814 m!606683))

(assert (=> b!631814 m!606683))

(declare-fun m!606685 () Bool)

(assert (=> b!631814 m!606685))

(declare-fun m!606687 () Bool)

(assert (=> b!631816 m!606687))

(declare-fun m!606689 () Bool)

(assert (=> b!631823 m!606689))

(declare-fun m!606691 () Bool)

(assert (=> b!631820 m!606691))

(declare-fun m!606693 () Bool)

(assert (=> b!631820 m!606693))

(assert (=> b!631820 m!606683))

(declare-fun m!606695 () Bool)

(assert (=> b!631818 m!606695))

(declare-fun m!606697 () Bool)

(assert (=> b!631813 m!606697))

(declare-fun m!606699 () Bool)

(assert (=> b!631813 m!606699))

(declare-fun m!606701 () Bool)

(assert (=> b!631813 m!606701))

(assert (=> b!631813 m!606691))

(assert (=> b!631813 m!606683))

(declare-fun m!606703 () Bool)

(assert (=> b!631813 m!606703))

(declare-fun m!606705 () Bool)

(assert (=> b!631813 m!606705))

(assert (=> b!631813 m!606683))

(declare-fun m!606707 () Bool)

(assert (=> b!631813 m!606707))

(declare-fun m!606709 () Bool)

(assert (=> start!57088 m!606709))

(declare-fun m!606711 () Bool)

(assert (=> start!57088 m!606711))

(assert (=> b!631822 m!606691))

(declare-fun m!606713 () Bool)

(assert (=> b!631822 m!606713))

(declare-fun m!606715 () Bool)

(assert (=> b!631826 m!606715))

(assert (=> b!631821 m!606683))

(assert (=> b!631821 m!606683))

(declare-fun m!606717 () Bool)

(assert (=> b!631821 m!606717))

(declare-fun m!606719 () Bool)

(assert (=> b!631812 m!606719))

(declare-fun m!606721 () Bool)

(assert (=> b!631817 m!606721))

(check-sat (not b!631812) (not b!631826) (not b!631817) (not b!631821) (not b!631818) (not b!631813) (not b!631814) (not start!57088) (not b!631816))
(check-sat)
