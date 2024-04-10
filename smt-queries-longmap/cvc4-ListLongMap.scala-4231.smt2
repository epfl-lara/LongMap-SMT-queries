; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58326 () Bool)

(assert start!58326)

(declare-fun b!644005 () Bool)

(declare-fun e!368941 () Bool)

(declare-fun e!368943 () Bool)

(assert (=> b!644005 (= e!368941 e!368943)))

(declare-fun res!417152 () Bool)

(assert (=> b!644005 (=> (not res!417152) (not e!368943))))

(declare-datatypes ((SeekEntryResult!6865 0))(
  ( (MissingZero!6865 (index!29792 (_ BitVec 32))) (Found!6865 (index!29793 (_ BitVec 32))) (Intermediate!6865 (undefined!7677 Bool) (index!29794 (_ BitVec 32)) (x!58561 (_ BitVec 32))) (Undefined!6865) (MissingVacant!6865 (index!29795 (_ BitVec 32))) )
))
(declare-fun lt!298431 () SeekEntryResult!6865)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!644005 (= res!417152 (or (= lt!298431 (MissingZero!6865 i!1108)) (= lt!298431 (MissingVacant!6865 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38423 0))(
  ( (array!38424 (arr!18425 (Array (_ BitVec 32) (_ BitVec 64))) (size!18789 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38423)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38423 (_ BitVec 32)) SeekEntryResult!6865)

(assert (=> b!644005 (= lt!298431 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644006 () Bool)

(declare-fun e!368948 () Bool)

(declare-fun e!368947 () Bool)

(assert (=> b!644006 (= e!368948 e!368947)))

(declare-fun res!417161 () Bool)

(assert (=> b!644006 (=> res!417161 e!368947)))

(declare-fun lt!298429 () (_ BitVec 64))

(declare-fun lt!298425 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!644006 (= res!417161 (or (not (= (select (arr!18425 a!2986) j!136) lt!298425)) (not (= (select (arr!18425 a!2986) j!136) lt!298429))))))

(declare-fun e!368950 () Bool)

(assert (=> b!644006 e!368950))

(declare-fun res!417153 () Bool)

(assert (=> b!644006 (=> (not res!417153) (not e!368950))))

(assert (=> b!644006 (= res!417153 (= lt!298429 (select (arr!18425 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644006 (= lt!298429 (select (store (arr!18425 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644007 () Bool)

(declare-fun e!368955 () Bool)

(declare-fun lt!298430 () SeekEntryResult!6865)

(declare-fun lt!298432 () SeekEntryResult!6865)

(assert (=> b!644007 (= e!368955 (= lt!298430 lt!298432))))

(declare-fun b!644008 () Bool)

(declare-fun e!368952 () Bool)

(assert (=> b!644008 (= e!368952 true)))

(declare-fun e!368954 () Bool)

(assert (=> b!644008 e!368954))

(declare-fun res!417163 () Bool)

(assert (=> b!644008 (=> (not res!417163) (not e!368954))))

(declare-fun lt!298427 () array!38423)

(declare-fun arrayContainsKey!0 (array!38423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644008 (= res!417163 (arrayContainsKey!0 lt!298427 (select (arr!18425 a!2986) j!136) j!136))))

(declare-fun b!644009 () Bool)

(declare-datatypes ((Unit!21816 0))(
  ( (Unit!21817) )
))
(declare-fun e!368945 () Unit!21816)

(declare-fun Unit!21818 () Unit!21816)

(assert (=> b!644009 (= e!368945 Unit!21818)))

(declare-fun lt!298420 () Unit!21816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21816)

(assert (=> b!644009 (= lt!298420 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298427 (select (arr!18425 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644009 (arrayContainsKey!0 lt!298427 (select (arr!18425 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298418 () Unit!21816)

(declare-datatypes ((List!12466 0))(
  ( (Nil!12463) (Cons!12462 (h!13507 (_ BitVec 64)) (t!18694 List!12466)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12466) Unit!21816)

(assert (=> b!644009 (= lt!298418 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12463))))

(declare-fun arrayNoDuplicates!0 (array!38423 (_ BitVec 32) List!12466) Bool)

(assert (=> b!644009 (arrayNoDuplicates!0 lt!298427 #b00000000000000000000000000000000 Nil!12463)))

(declare-fun lt!298424 () Unit!21816)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38423 (_ BitVec 32) (_ BitVec 32)) Unit!21816)

(assert (=> b!644009 (= lt!298424 (lemmaNoDuplicateFromThenFromBigger!0 lt!298427 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644009 (arrayNoDuplicates!0 lt!298427 j!136 Nil!12463)))

(declare-fun lt!298419 () Unit!21816)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38423 (_ BitVec 64) (_ BitVec 32) List!12466) Unit!21816)

(assert (=> b!644009 (= lt!298419 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298427 (select (arr!18425 a!2986) j!136) j!136 Nil!12463))))

(assert (=> b!644009 false))

(declare-fun b!644010 () Bool)

(declare-fun Unit!21819 () Unit!21816)

(assert (=> b!644010 (= e!368945 Unit!21819)))

(declare-fun b!644011 () Bool)

(assert (=> b!644011 (= e!368947 e!368952)))

(declare-fun res!417167 () Bool)

(assert (=> b!644011 (=> res!417167 e!368952)))

(assert (=> b!644011 (= res!417167 (bvsge index!984 j!136))))

(declare-fun lt!298421 () Unit!21816)

(assert (=> b!644011 (= lt!298421 e!368945)))

(declare-fun c!73796 () Bool)

(assert (=> b!644011 (= c!73796 (bvslt j!136 index!984))))

(declare-fun b!644012 () Bool)

(declare-fun e!368944 () Bool)

(assert (=> b!644012 (= e!368943 e!368944)))

(declare-fun res!417164 () Bool)

(assert (=> b!644012 (=> (not res!417164) (not e!368944))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!644012 (= res!417164 (= (select (store (arr!18425 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644012 (= lt!298427 (array!38424 (store (arr!18425 a!2986) i!1108 k!1786) (size!18789 a!2986)))))

(declare-fun b!644013 () Bool)

(declare-fun res!417154 () Bool)

(assert (=> b!644013 (=> (not res!417154) (not e!368941))))

(assert (=> b!644013 (= res!417154 (and (= (size!18789 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18789 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18789 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644014 () Bool)

(declare-fun res!417150 () Bool)

(assert (=> b!644014 (=> (not res!417150) (not e!368943))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644014 (= res!417150 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18425 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644015 () Bool)

(declare-fun res!417149 () Bool)

(assert (=> b!644015 (=> (not res!417149) (not e!368943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38423 (_ BitVec 32)) Bool)

(assert (=> b!644015 (= res!417149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644016 () Bool)

(declare-fun e!368951 () Bool)

(assert (=> b!644016 (= e!368951 (not e!368948))))

(declare-fun res!417156 () Bool)

(assert (=> b!644016 (=> res!417156 e!368948)))

(declare-fun lt!298428 () SeekEntryResult!6865)

(assert (=> b!644016 (= res!417156 (not (= lt!298428 (Found!6865 index!984))))))

(declare-fun lt!298422 () Unit!21816)

(declare-fun e!368953 () Unit!21816)

(assert (=> b!644016 (= lt!298422 e!368953)))

(declare-fun c!73795 () Bool)

(assert (=> b!644016 (= c!73795 (= lt!298428 Undefined!6865))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38423 (_ BitVec 32)) SeekEntryResult!6865)

(assert (=> b!644016 (= lt!298428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298425 lt!298427 mask!3053))))

(assert (=> b!644016 e!368955))

(declare-fun res!417157 () Bool)

(assert (=> b!644016 (=> (not res!417157) (not e!368955))))

(declare-fun lt!298426 () (_ BitVec 32))

(assert (=> b!644016 (= res!417157 (= lt!298432 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298426 vacantSpotIndex!68 lt!298425 lt!298427 mask!3053)))))

(assert (=> b!644016 (= lt!298432 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298426 vacantSpotIndex!68 (select (arr!18425 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644016 (= lt!298425 (select (store (arr!18425 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298423 () Unit!21816)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38423 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21816)

(assert (=> b!644016 (= lt!298423 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298426 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644016 (= lt!298426 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!417166 () Bool)

(assert (=> start!58326 (=> (not res!417166) (not e!368941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58326 (= res!417166 (validMask!0 mask!3053))))

(assert (=> start!58326 e!368941))

(assert (=> start!58326 true))

(declare-fun array_inv!14221 (array!38423) Bool)

(assert (=> start!58326 (array_inv!14221 a!2986)))

(declare-fun b!644017 () Bool)

(declare-fun res!417160 () Bool)

(assert (=> b!644017 (=> (not res!417160) (not e!368941))))

(assert (=> b!644017 (= res!417160 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644018 () Bool)

(declare-fun Unit!21820 () Unit!21816)

(assert (=> b!644018 (= e!368953 Unit!21820)))

(assert (=> b!644018 false))

(declare-fun b!644019 () Bool)

(declare-fun res!417151 () Bool)

(assert (=> b!644019 (=> (not res!417151) (not e!368941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644019 (= res!417151 (validKeyInArray!0 k!1786))))

(declare-fun b!644020 () Bool)

(assert (=> b!644020 (= e!368944 e!368951)))

(declare-fun res!417155 () Bool)

(assert (=> b!644020 (=> (not res!417155) (not e!368951))))

(assert (=> b!644020 (= res!417155 (and (= lt!298430 (Found!6865 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18425 a!2986) index!984) (select (arr!18425 a!2986) j!136))) (not (= (select (arr!18425 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644020 (= lt!298430 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18425 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644021 () Bool)

(declare-fun e!368946 () Bool)

(assert (=> b!644021 (= e!368946 (arrayContainsKey!0 lt!298427 (select (arr!18425 a!2986) j!136) index!984))))

(declare-fun b!644022 () Bool)

(declare-fun res!417158 () Bool)

(assert (=> b!644022 (=> (not res!417158) (not e!368941))))

(assert (=> b!644022 (= res!417158 (validKeyInArray!0 (select (arr!18425 a!2986) j!136)))))

(declare-fun b!644023 () Bool)

(declare-fun Unit!21821 () Unit!21816)

(assert (=> b!644023 (= e!368953 Unit!21821)))

(declare-fun b!644024 () Bool)

(declare-fun e!368942 () Bool)

(assert (=> b!644024 (= e!368942 e!368946)))

(declare-fun res!417162 () Bool)

(assert (=> b!644024 (=> (not res!417162) (not e!368946))))

(assert (=> b!644024 (= res!417162 (arrayContainsKey!0 lt!298427 (select (arr!18425 a!2986) j!136) j!136))))

(declare-fun b!644025 () Bool)

(assert (=> b!644025 (= e!368950 e!368942)))

(declare-fun res!417159 () Bool)

(assert (=> b!644025 (=> res!417159 e!368942)))

(assert (=> b!644025 (= res!417159 (or (not (= (select (arr!18425 a!2986) j!136) lt!298425)) (not (= (select (arr!18425 a!2986) j!136) lt!298429)) (bvsge j!136 index!984)))))

(declare-fun b!644026 () Bool)

(assert (=> b!644026 (= e!368954 (arrayContainsKey!0 lt!298427 (select (arr!18425 a!2986) j!136) index!984))))

(declare-fun b!644027 () Bool)

(declare-fun res!417165 () Bool)

(assert (=> b!644027 (=> (not res!417165) (not e!368943))))

(assert (=> b!644027 (= res!417165 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12463))))

(assert (= (and start!58326 res!417166) b!644013))

(assert (= (and b!644013 res!417154) b!644022))

(assert (= (and b!644022 res!417158) b!644019))

(assert (= (and b!644019 res!417151) b!644017))

(assert (= (and b!644017 res!417160) b!644005))

(assert (= (and b!644005 res!417152) b!644015))

(assert (= (and b!644015 res!417149) b!644027))

(assert (= (and b!644027 res!417165) b!644014))

(assert (= (and b!644014 res!417150) b!644012))

(assert (= (and b!644012 res!417164) b!644020))

(assert (= (and b!644020 res!417155) b!644016))

(assert (= (and b!644016 res!417157) b!644007))

(assert (= (and b!644016 c!73795) b!644018))

(assert (= (and b!644016 (not c!73795)) b!644023))

(assert (= (and b!644016 (not res!417156)) b!644006))

(assert (= (and b!644006 res!417153) b!644025))

(assert (= (and b!644025 (not res!417159)) b!644024))

(assert (= (and b!644024 res!417162) b!644021))

(assert (= (and b!644006 (not res!417161)) b!644011))

(assert (= (and b!644011 c!73796) b!644009))

(assert (= (and b!644011 (not c!73796)) b!644010))

(assert (= (and b!644011 (not res!417167)) b!644008))

(assert (= (and b!644008 res!417163) b!644026))

(declare-fun m!617669 () Bool)

(assert (=> b!644020 m!617669))

(declare-fun m!617671 () Bool)

(assert (=> b!644020 m!617671))

(assert (=> b!644020 m!617671))

(declare-fun m!617673 () Bool)

(assert (=> b!644020 m!617673))

(declare-fun m!617675 () Bool)

(assert (=> b!644015 m!617675))

(assert (=> b!644008 m!617671))

(assert (=> b!644008 m!617671))

(declare-fun m!617677 () Bool)

(assert (=> b!644008 m!617677))

(assert (=> b!644022 m!617671))

(assert (=> b!644022 m!617671))

(declare-fun m!617679 () Bool)

(assert (=> b!644022 m!617679))

(declare-fun m!617681 () Bool)

(assert (=> b!644012 m!617681))

(declare-fun m!617683 () Bool)

(assert (=> b!644012 m!617683))

(assert (=> b!644009 m!617671))

(declare-fun m!617685 () Bool)

(assert (=> b!644009 m!617685))

(assert (=> b!644009 m!617671))

(declare-fun m!617687 () Bool)

(assert (=> b!644009 m!617687))

(assert (=> b!644009 m!617671))

(declare-fun m!617689 () Bool)

(assert (=> b!644009 m!617689))

(declare-fun m!617691 () Bool)

(assert (=> b!644009 m!617691))

(declare-fun m!617693 () Bool)

(assert (=> b!644009 m!617693))

(assert (=> b!644009 m!617671))

(declare-fun m!617695 () Bool)

(assert (=> b!644009 m!617695))

(declare-fun m!617697 () Bool)

(assert (=> b!644009 m!617697))

(assert (=> b!644024 m!617671))

(assert (=> b!644024 m!617671))

(assert (=> b!644024 m!617677))

(assert (=> b!644026 m!617671))

(assert (=> b!644026 m!617671))

(declare-fun m!617699 () Bool)

(assert (=> b!644026 m!617699))

(assert (=> b!644021 m!617671))

(assert (=> b!644021 m!617671))

(assert (=> b!644021 m!617699))

(assert (=> b!644006 m!617671))

(assert (=> b!644006 m!617681))

(declare-fun m!617701 () Bool)

(assert (=> b!644006 m!617701))

(declare-fun m!617703 () Bool)

(assert (=> start!58326 m!617703))

(declare-fun m!617705 () Bool)

(assert (=> start!58326 m!617705))

(declare-fun m!617707 () Bool)

(assert (=> b!644016 m!617707))

(declare-fun m!617709 () Bool)

(assert (=> b!644016 m!617709))

(declare-fun m!617711 () Bool)

(assert (=> b!644016 m!617711))

(assert (=> b!644016 m!617671))

(assert (=> b!644016 m!617681))

(declare-fun m!617713 () Bool)

(assert (=> b!644016 m!617713))

(declare-fun m!617715 () Bool)

(assert (=> b!644016 m!617715))

(assert (=> b!644016 m!617671))

(declare-fun m!617717 () Bool)

(assert (=> b!644016 m!617717))

(assert (=> b!644025 m!617671))

(declare-fun m!617719 () Bool)

(assert (=> b!644005 m!617719))

(declare-fun m!617721 () Bool)

(assert (=> b!644014 m!617721))

(declare-fun m!617723 () Bool)

(assert (=> b!644027 m!617723))

(declare-fun m!617725 () Bool)

(assert (=> b!644017 m!617725))

(declare-fun m!617727 () Bool)

(assert (=> b!644019 m!617727))

(push 1)

(assert (not b!644024))

