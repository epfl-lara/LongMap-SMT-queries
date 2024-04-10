; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56996 () Bool)

(assert start!56996)

(declare-fun b!630865 () Bool)

(declare-fun e!360726 () Bool)

(declare-fun e!360729 () Bool)

(assert (=> b!630865 (= e!360726 e!360729)))

(declare-fun res!407850 () Bool)

(assert (=> b!630865 (=> (not res!407850) (not e!360729))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6710 0))(
  ( (MissingZero!6710 (index!29130 (_ BitVec 32))) (Found!6710 (index!29131 (_ BitVec 32))) (Intermediate!6710 (undefined!7522 Bool) (index!29132 (_ BitVec 32)) (x!57872 (_ BitVec 32))) (Undefined!6710) (MissingVacant!6710 (index!29133 (_ BitVec 32))) )
))
(declare-fun lt!291402 () SeekEntryResult!6710)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38072 0))(
  ( (array!38073 (arr!18270 (Array (_ BitVec 32) (_ BitVec 64))) (size!18634 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38072)

(assert (=> b!630865 (= res!407850 (and (= lt!291402 (Found!6710 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18270 a!2986) index!984) (select (arr!18270 a!2986) j!136))) (not (= (select (arr!18270 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38072 (_ BitVec 32)) SeekEntryResult!6710)

(assert (=> b!630865 (= lt!291402 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18270 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630866 () Bool)

(declare-fun res!407842 () Bool)

(declare-fun e!360727 () Bool)

(assert (=> b!630866 (=> (not res!407842) (not e!360727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38072 (_ BitVec 32)) Bool)

(assert (=> b!630866 (= res!407842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630867 () Bool)

(declare-fun e!360725 () Bool)

(assert (=> b!630867 (= e!360725 e!360727)))

(declare-fun res!407844 () Bool)

(assert (=> b!630867 (=> (not res!407844) (not e!360727))))

(declare-fun lt!291403 () SeekEntryResult!6710)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630867 (= res!407844 (or (= lt!291403 (MissingZero!6710 i!1108)) (= lt!291403 (MissingVacant!6710 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38072 (_ BitVec 32)) SeekEntryResult!6710)

(assert (=> b!630867 (= lt!291403 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630868 () Bool)

(declare-fun res!407848 () Bool)

(assert (=> b!630868 (=> (not res!407848) (not e!360725))))

(declare-fun arrayContainsKey!0 (array!38072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630868 (= res!407848 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630869 () Bool)

(assert (=> b!630869 (= e!360729 (not true))))

(declare-datatypes ((Unit!21174 0))(
  ( (Unit!21175) )
))
(declare-fun lt!291405 () Unit!21174)

(declare-fun e!360723 () Unit!21174)

(assert (=> b!630869 (= lt!291405 e!360723)))

(declare-fun lt!291404 () array!38072)

(declare-fun lt!291399 () (_ BitVec 64))

(declare-fun c!71879 () Bool)

(assert (=> b!630869 (= c!71879 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291399 lt!291404 mask!3053) Undefined!6710))))

(declare-fun e!360724 () Bool)

(assert (=> b!630869 e!360724))

(declare-fun res!407846 () Bool)

(assert (=> b!630869 (=> (not res!407846) (not e!360724))))

(declare-fun lt!291406 () (_ BitVec 32))

(declare-fun lt!291401 () SeekEntryResult!6710)

(assert (=> b!630869 (= res!407846 (= lt!291401 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291406 vacantSpotIndex!68 lt!291399 lt!291404 mask!3053)))))

(assert (=> b!630869 (= lt!291401 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291406 vacantSpotIndex!68 (select (arr!18270 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630869 (= lt!291399 (select (store (arr!18270 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291400 () Unit!21174)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38072 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21174)

(assert (=> b!630869 (= lt!291400 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291406 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630869 (= lt!291406 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630870 () Bool)

(declare-fun res!407849 () Bool)

(assert (=> b!630870 (=> (not res!407849) (not e!360725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630870 (= res!407849 (validKeyInArray!0 (select (arr!18270 a!2986) j!136)))))

(declare-fun res!407845 () Bool)

(assert (=> start!56996 (=> (not res!407845) (not e!360725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56996 (= res!407845 (validMask!0 mask!3053))))

(assert (=> start!56996 e!360725))

(assert (=> start!56996 true))

(declare-fun array_inv!14066 (array!38072) Bool)

(assert (=> start!56996 (array_inv!14066 a!2986)))

(declare-fun b!630871 () Bool)

(declare-fun Unit!21176 () Unit!21174)

(assert (=> b!630871 (= e!360723 Unit!21176)))

(declare-fun b!630872 () Bool)

(declare-fun res!407843 () Bool)

(assert (=> b!630872 (=> (not res!407843) (not e!360725))))

(assert (=> b!630872 (= res!407843 (validKeyInArray!0 k!1786))))

(declare-fun b!630873 () Bool)

(declare-fun res!407852 () Bool)

(assert (=> b!630873 (=> (not res!407852) (not e!360727))))

(assert (=> b!630873 (= res!407852 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18270 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630874 () Bool)

(declare-fun res!407847 () Bool)

(assert (=> b!630874 (=> (not res!407847) (not e!360725))))

(assert (=> b!630874 (= res!407847 (and (= (size!18634 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18634 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18634 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630875 () Bool)

(declare-fun Unit!21177 () Unit!21174)

(assert (=> b!630875 (= e!360723 Unit!21177)))

(assert (=> b!630875 false))

(declare-fun b!630876 () Bool)

(declare-fun res!407841 () Bool)

(assert (=> b!630876 (=> (not res!407841) (not e!360727))))

(declare-datatypes ((List!12311 0))(
  ( (Nil!12308) (Cons!12307 (h!13352 (_ BitVec 64)) (t!18539 List!12311)) )
))
(declare-fun arrayNoDuplicates!0 (array!38072 (_ BitVec 32) List!12311) Bool)

(assert (=> b!630876 (= res!407841 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12308))))

(declare-fun b!630877 () Bool)

(assert (=> b!630877 (= e!360724 (= lt!291402 lt!291401))))

(declare-fun b!630878 () Bool)

(assert (=> b!630878 (= e!360727 e!360726)))

(declare-fun res!407851 () Bool)

(assert (=> b!630878 (=> (not res!407851) (not e!360726))))

(assert (=> b!630878 (= res!407851 (= (select (store (arr!18270 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630878 (= lt!291404 (array!38073 (store (arr!18270 a!2986) i!1108 k!1786) (size!18634 a!2986)))))

(assert (= (and start!56996 res!407845) b!630874))

(assert (= (and b!630874 res!407847) b!630870))

(assert (= (and b!630870 res!407849) b!630872))

(assert (= (and b!630872 res!407843) b!630868))

(assert (= (and b!630868 res!407848) b!630867))

(assert (= (and b!630867 res!407844) b!630866))

(assert (= (and b!630866 res!407842) b!630876))

(assert (= (and b!630876 res!407841) b!630873))

(assert (= (and b!630873 res!407852) b!630878))

(assert (= (and b!630878 res!407851) b!630865))

(assert (= (and b!630865 res!407850) b!630869))

(assert (= (and b!630869 res!407846) b!630877))

(assert (= (and b!630869 c!71879) b!630875))

(assert (= (and b!630869 (not c!71879)) b!630871))

(declare-fun m!605823 () Bool)

(assert (=> start!56996 m!605823))

(declare-fun m!605825 () Bool)

(assert (=> start!56996 m!605825))

(declare-fun m!605827 () Bool)

(assert (=> b!630872 m!605827))

(declare-fun m!605829 () Bool)

(assert (=> b!630878 m!605829))

(declare-fun m!605831 () Bool)

(assert (=> b!630878 m!605831))

(declare-fun m!605833 () Bool)

(assert (=> b!630869 m!605833))

(declare-fun m!605835 () Bool)

(assert (=> b!630869 m!605835))

(declare-fun m!605837 () Bool)

(assert (=> b!630869 m!605837))

(assert (=> b!630869 m!605829))

(assert (=> b!630869 m!605837))

(declare-fun m!605839 () Bool)

(assert (=> b!630869 m!605839))

(declare-fun m!605841 () Bool)

(assert (=> b!630869 m!605841))

(declare-fun m!605843 () Bool)

(assert (=> b!630869 m!605843))

(declare-fun m!605845 () Bool)

(assert (=> b!630869 m!605845))

(declare-fun m!605847 () Bool)

(assert (=> b!630867 m!605847))

(declare-fun m!605849 () Bool)

(assert (=> b!630873 m!605849))

(declare-fun m!605851 () Bool)

(assert (=> b!630866 m!605851))

(declare-fun m!605853 () Bool)

(assert (=> b!630876 m!605853))

(declare-fun m!605855 () Bool)

(assert (=> b!630865 m!605855))

(assert (=> b!630865 m!605837))

(assert (=> b!630865 m!605837))

(declare-fun m!605857 () Bool)

(assert (=> b!630865 m!605857))

(declare-fun m!605859 () Bool)

(assert (=> b!630868 m!605859))

(assert (=> b!630870 m!605837))

(assert (=> b!630870 m!605837))

(declare-fun m!605861 () Bool)

(assert (=> b!630870 m!605861))

(push 1)

