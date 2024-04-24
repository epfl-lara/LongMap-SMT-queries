; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54918 () Bool)

(assert start!54918)

(declare-fun b!600130 () Bool)

(declare-fun res!384974 () Bool)

(declare-fun e!343122 () Bool)

(assert (=> b!600130 (=> (not res!384974) (not e!343122))))

(declare-datatypes ((array!37098 0))(
  ( (array!37099 (arr!17806 (Array (_ BitVec 32) (_ BitVec 64))) (size!18170 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37098)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600130 (= res!384974 (validKeyInArray!0 (select (arr!17806 a!2986) j!136)))))

(declare-fun b!600131 () Bool)

(declare-fun e!343127 () Bool)

(declare-fun e!343118 () Bool)

(assert (=> b!600131 (= e!343127 e!343118)))

(declare-fun res!384957 () Bool)

(assert (=> b!600131 (=> (not res!384957) (not e!343118))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!600131 (= res!384957 (= (select (store (arr!17806 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!272914 () array!37098)

(assert (=> b!600131 (= lt!272914 (array!37099 (store (arr!17806 a!2986) i!1108 k0!1786) (size!18170 a!2986)))))

(declare-fun b!600132 () Bool)

(declare-fun e!343119 () Bool)

(declare-fun e!343125 () Bool)

(assert (=> b!600132 (= e!343119 e!343125)))

(declare-fun res!384960 () Bool)

(assert (=> b!600132 (=> res!384960 e!343125)))

(declare-fun lt!272908 () (_ BitVec 64))

(declare-fun lt!272912 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600132 (= res!384960 (or (not (= (select (arr!17806 a!2986) j!136) lt!272908)) (not (= (select (arr!17806 a!2986) j!136) lt!272912)) (bvsge j!136 index!984)))))

(declare-fun e!343117 () Bool)

(assert (=> b!600132 e!343117))

(declare-fun res!384973 () Bool)

(assert (=> b!600132 (=> (not res!384973) (not e!343117))))

(assert (=> b!600132 (= res!384973 (= lt!272912 (select (arr!17806 a!2986) j!136)))))

(assert (=> b!600132 (= lt!272912 (select (store (arr!17806 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!384967 () Bool)

(assert (=> start!54918 (=> (not res!384967) (not e!343122))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54918 (= res!384967 (validMask!0 mask!3053))))

(assert (=> start!54918 e!343122))

(assert (=> start!54918 true))

(declare-fun array_inv!13665 (array!37098) Bool)

(assert (=> start!54918 (array_inv!13665 a!2986)))

(declare-fun b!600133 () Bool)

(declare-fun e!343128 () Bool)

(assert (=> b!600133 (= e!343128 (not e!343119))))

(declare-fun res!384975 () Bool)

(assert (=> b!600133 (=> res!384975 e!343119)))

(declare-datatypes ((SeekEntryResult!6202 0))(
  ( (MissingZero!6202 (index!27065 (_ BitVec 32))) (Found!6202 (index!27066 (_ BitVec 32))) (Intermediate!6202 (undefined!7014 Bool) (index!27067 (_ BitVec 32)) (x!56020 (_ BitVec 32))) (Undefined!6202) (MissingVacant!6202 (index!27068 (_ BitVec 32))) )
))
(declare-fun lt!272904 () SeekEntryResult!6202)

(assert (=> b!600133 (= res!384975 (not (= lt!272904 (Found!6202 index!984))))))

(declare-datatypes ((Unit!18901 0))(
  ( (Unit!18902) )
))
(declare-fun lt!272911 () Unit!18901)

(declare-fun e!343116 () Unit!18901)

(assert (=> b!600133 (= lt!272911 e!343116)))

(declare-fun c!67955 () Bool)

(assert (=> b!600133 (= c!67955 (= lt!272904 Undefined!6202))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37098 (_ BitVec 32)) SeekEntryResult!6202)

(assert (=> b!600133 (= lt!272904 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272908 lt!272914 mask!3053))))

(declare-fun e!343121 () Bool)

(assert (=> b!600133 e!343121))

(declare-fun res!384964 () Bool)

(assert (=> b!600133 (=> (not res!384964) (not e!343121))))

(declare-fun lt!272915 () SeekEntryResult!6202)

(declare-fun lt!272917 () (_ BitVec 32))

(assert (=> b!600133 (= res!384964 (= lt!272915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272917 vacantSpotIndex!68 lt!272908 lt!272914 mask!3053)))))

(assert (=> b!600133 (= lt!272915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272917 vacantSpotIndex!68 (select (arr!17806 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600133 (= lt!272908 (select (store (arr!17806 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272905 () Unit!18901)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18901)

(assert (=> b!600133 (= lt!272905 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272917 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600133 (= lt!272917 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!600134 () Bool)

(declare-fun Unit!18903 () Unit!18901)

(assert (=> b!600134 (= e!343116 Unit!18903)))

(assert (=> b!600134 false))

(declare-fun b!600135 () Bool)

(declare-fun res!384962 () Bool)

(declare-fun e!343123 () Bool)

(assert (=> b!600135 (=> res!384962 e!343123)))

(declare-datatypes ((List!11754 0))(
  ( (Nil!11751) (Cons!11750 (h!12798 (_ BitVec 64)) (t!17974 List!11754)) )
))
(declare-fun contains!2944 (List!11754 (_ BitVec 64)) Bool)

(assert (=> b!600135 (= res!384962 (contains!2944 Nil!11751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600136 () Bool)

(assert (=> b!600136 (= e!343122 e!343127)))

(declare-fun res!384966 () Bool)

(assert (=> b!600136 (=> (not res!384966) (not e!343127))))

(declare-fun lt!272907 () SeekEntryResult!6202)

(assert (=> b!600136 (= res!384966 (or (= lt!272907 (MissingZero!6202 i!1108)) (= lt!272907 (MissingVacant!6202 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37098 (_ BitVec 32)) SeekEntryResult!6202)

(assert (=> b!600136 (= lt!272907 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600137 () Bool)

(declare-fun res!384976 () Bool)

(assert (=> b!600137 (=> (not res!384976) (not e!343127))))

(assert (=> b!600137 (= res!384976 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17806 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600138 () Bool)

(assert (=> b!600138 (= e!343125 e!343123)))

(declare-fun res!384969 () Bool)

(assert (=> b!600138 (=> res!384969 e!343123)))

(assert (=> b!600138 (= res!384969 (or (bvsge (size!18170 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18170 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37098 (_ BitVec 32) List!11754) Bool)

(assert (=> b!600138 (arrayNoDuplicates!0 lt!272914 j!136 Nil!11751)))

(declare-fun lt!272906 () Unit!18901)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37098 (_ BitVec 32) (_ BitVec 32)) Unit!18901)

(assert (=> b!600138 (= lt!272906 (lemmaNoDuplicateFromThenFromBigger!0 lt!272914 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600138 (arrayNoDuplicates!0 lt!272914 #b00000000000000000000000000000000 Nil!11751)))

(declare-fun lt!272910 () Unit!18901)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37098 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11754) Unit!18901)

(assert (=> b!600138 (= lt!272910 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11751))))

(declare-fun arrayContainsKey!0 (array!37098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600138 (arrayContainsKey!0 lt!272914 (select (arr!17806 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272916 () Unit!18901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37098 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18901)

(assert (=> b!600138 (= lt!272916 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272914 (select (arr!17806 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600139 () Bool)

(declare-fun Unit!18904 () Unit!18901)

(assert (=> b!600139 (= e!343116 Unit!18904)))

(declare-fun b!600140 () Bool)

(declare-fun res!384958 () Bool)

(assert (=> b!600140 (=> (not res!384958) (not e!343127))))

(assert (=> b!600140 (= res!384958 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11751))))

(declare-fun b!600141 () Bool)

(declare-fun lt!272913 () SeekEntryResult!6202)

(assert (=> b!600141 (= e!343121 (= lt!272913 lt!272915))))

(declare-fun b!600142 () Bool)

(declare-fun e!343124 () Bool)

(declare-fun e!343120 () Bool)

(assert (=> b!600142 (= e!343124 e!343120)))

(declare-fun res!384961 () Bool)

(assert (=> b!600142 (=> (not res!384961) (not e!343120))))

(assert (=> b!600142 (= res!384961 (arrayContainsKey!0 lt!272914 (select (arr!17806 a!2986) j!136) j!136))))

(declare-fun b!600143 () Bool)

(assert (=> b!600143 (= e!343123 true)))

(declare-fun lt!272909 () Bool)

(assert (=> b!600143 (= lt!272909 (contains!2944 Nil!11751 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600144 () Bool)

(declare-fun res!384965 () Bool)

(assert (=> b!600144 (=> (not res!384965) (not e!343122))))

(assert (=> b!600144 (= res!384965 (validKeyInArray!0 k0!1786))))

(declare-fun b!600145 () Bool)

(assert (=> b!600145 (= e!343117 e!343124)))

(declare-fun res!384963 () Bool)

(assert (=> b!600145 (=> res!384963 e!343124)))

(assert (=> b!600145 (= res!384963 (or (not (= (select (arr!17806 a!2986) j!136) lt!272908)) (not (= (select (arr!17806 a!2986) j!136) lt!272912)) (bvsge j!136 index!984)))))

(declare-fun b!600146 () Bool)

(declare-fun res!384970 () Bool)

(assert (=> b!600146 (=> (not res!384970) (not e!343122))))

(assert (=> b!600146 (= res!384970 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600147 () Bool)

(assert (=> b!600147 (= e!343120 (arrayContainsKey!0 lt!272914 (select (arr!17806 a!2986) j!136) index!984))))

(declare-fun b!600148 () Bool)

(declare-fun res!384971 () Bool)

(assert (=> b!600148 (=> (not res!384971) (not e!343127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37098 (_ BitVec 32)) Bool)

(assert (=> b!600148 (= res!384971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600149 () Bool)

(declare-fun res!384972 () Bool)

(assert (=> b!600149 (=> (not res!384972) (not e!343122))))

(assert (=> b!600149 (= res!384972 (and (= (size!18170 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18170 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18170 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600150 () Bool)

(declare-fun res!384968 () Bool)

(assert (=> b!600150 (=> res!384968 e!343123)))

(declare-fun noDuplicate!289 (List!11754) Bool)

(assert (=> b!600150 (= res!384968 (not (noDuplicate!289 Nil!11751)))))

(declare-fun b!600151 () Bool)

(assert (=> b!600151 (= e!343118 e!343128)))

(declare-fun res!384959 () Bool)

(assert (=> b!600151 (=> (not res!384959) (not e!343128))))

(assert (=> b!600151 (= res!384959 (and (= lt!272913 (Found!6202 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17806 a!2986) index!984) (select (arr!17806 a!2986) j!136))) (not (= (select (arr!17806 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600151 (= lt!272913 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17806 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54918 res!384967) b!600149))

(assert (= (and b!600149 res!384972) b!600130))

(assert (= (and b!600130 res!384974) b!600144))

(assert (= (and b!600144 res!384965) b!600146))

(assert (= (and b!600146 res!384970) b!600136))

(assert (= (and b!600136 res!384966) b!600148))

(assert (= (and b!600148 res!384971) b!600140))

(assert (= (and b!600140 res!384958) b!600137))

(assert (= (and b!600137 res!384976) b!600131))

(assert (= (and b!600131 res!384957) b!600151))

(assert (= (and b!600151 res!384959) b!600133))

(assert (= (and b!600133 res!384964) b!600141))

(assert (= (and b!600133 c!67955) b!600134))

(assert (= (and b!600133 (not c!67955)) b!600139))

(assert (= (and b!600133 (not res!384975)) b!600132))

(assert (= (and b!600132 res!384973) b!600145))

(assert (= (and b!600145 (not res!384963)) b!600142))

(assert (= (and b!600142 res!384961) b!600147))

(assert (= (and b!600132 (not res!384960)) b!600138))

(assert (= (and b!600138 (not res!384969)) b!600150))

(assert (= (and b!600150 (not res!384968)) b!600135))

(assert (= (and b!600135 (not res!384962)) b!600143))

(declare-fun m!577589 () Bool)

(assert (=> b!600150 m!577589))

(declare-fun m!577591 () Bool)

(assert (=> b!600143 m!577591))

(declare-fun m!577593 () Bool)

(assert (=> b!600131 m!577593))

(declare-fun m!577595 () Bool)

(assert (=> b!600131 m!577595))

(declare-fun m!577597 () Bool)

(assert (=> b!600148 m!577597))

(declare-fun m!577599 () Bool)

(assert (=> b!600137 m!577599))

(declare-fun m!577601 () Bool)

(assert (=> b!600136 m!577601))

(declare-fun m!577603 () Bool)

(assert (=> b!600146 m!577603))

(declare-fun m!577605 () Bool)

(assert (=> b!600130 m!577605))

(assert (=> b!600130 m!577605))

(declare-fun m!577607 () Bool)

(assert (=> b!600130 m!577607))

(declare-fun m!577609 () Bool)

(assert (=> start!54918 m!577609))

(declare-fun m!577611 () Bool)

(assert (=> start!54918 m!577611))

(assert (=> b!600145 m!577605))

(declare-fun m!577613 () Bool)

(assert (=> b!600140 m!577613))

(assert (=> b!600147 m!577605))

(assert (=> b!600147 m!577605))

(declare-fun m!577615 () Bool)

(assert (=> b!600147 m!577615))

(declare-fun m!577617 () Bool)

(assert (=> b!600135 m!577617))

(assert (=> b!600142 m!577605))

(assert (=> b!600142 m!577605))

(declare-fun m!577619 () Bool)

(assert (=> b!600142 m!577619))

(assert (=> b!600132 m!577605))

(assert (=> b!600132 m!577593))

(declare-fun m!577621 () Bool)

(assert (=> b!600132 m!577621))

(declare-fun m!577623 () Bool)

(assert (=> b!600133 m!577623))

(declare-fun m!577625 () Bool)

(assert (=> b!600133 m!577625))

(declare-fun m!577627 () Bool)

(assert (=> b!600133 m!577627))

(assert (=> b!600133 m!577605))

(assert (=> b!600133 m!577593))

(declare-fun m!577629 () Bool)

(assert (=> b!600133 m!577629))

(declare-fun m!577631 () Bool)

(assert (=> b!600133 m!577631))

(assert (=> b!600133 m!577605))

(declare-fun m!577633 () Bool)

(assert (=> b!600133 m!577633))

(declare-fun m!577635 () Bool)

(assert (=> b!600151 m!577635))

(assert (=> b!600151 m!577605))

(assert (=> b!600151 m!577605))

(declare-fun m!577637 () Bool)

(assert (=> b!600151 m!577637))

(declare-fun m!577639 () Bool)

(assert (=> b!600144 m!577639))

(assert (=> b!600138 m!577605))

(declare-fun m!577641 () Bool)

(assert (=> b!600138 m!577641))

(assert (=> b!600138 m!577605))

(declare-fun m!577643 () Bool)

(assert (=> b!600138 m!577643))

(declare-fun m!577645 () Bool)

(assert (=> b!600138 m!577645))

(assert (=> b!600138 m!577605))

(declare-fun m!577647 () Bool)

(assert (=> b!600138 m!577647))

(declare-fun m!577649 () Bool)

(assert (=> b!600138 m!577649))

(declare-fun m!577651 () Bool)

(assert (=> b!600138 m!577651))

(check-sat (not b!600148) (not b!600150) (not b!600143) (not start!54918) (not b!600133) (not b!600136) (not b!600135) (not b!600138) (not b!600147) (not b!600130) (not b!600142) (not b!600144) (not b!600146) (not b!600140) (not b!600151))
(check-sat)
