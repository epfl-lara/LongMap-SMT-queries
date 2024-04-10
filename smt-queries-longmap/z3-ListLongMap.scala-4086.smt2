; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56016 () Bool)

(assert start!56016)

(declare-fun b!615936 () Bool)

(declare-datatypes ((Unit!20018 0))(
  ( (Unit!20019) )
))
(declare-fun e!353166 () Unit!20018)

(declare-fun Unit!20020 () Unit!20018)

(assert (=> b!615936 (= e!353166 Unit!20020)))

(declare-fun b!615937 () Bool)

(declare-fun res!396746 () Bool)

(declare-fun e!353167 () Bool)

(assert (=> b!615937 (=> (not res!396746) (not e!353167))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37486 0))(
  ( (array!37487 (arr!17989 (Array (_ BitVec 32) (_ BitVec 64))) (size!18353 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37486)

(assert (=> b!615937 (= res!396746 (and (= (size!18353 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18353 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18353 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615938 () Bool)

(declare-fun e!353160 () Unit!20018)

(declare-fun Unit!20021 () Unit!20018)

(assert (=> b!615938 (= e!353160 Unit!20021)))

(declare-fun b!615939 () Bool)

(declare-fun res!396754 () Bool)

(assert (=> b!615939 (=> (not res!396754) (not e!353167))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615939 (= res!396754 (validKeyInArray!0 k0!1786))))

(declare-fun b!615940 () Bool)

(declare-fun lt!283110 () array!37486)

(declare-fun res!396750 () Bool)

(declare-fun arrayContainsKey!0 (array!37486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615940 (= res!396750 (arrayContainsKey!0 lt!283110 (select (arr!17989 a!2986) j!136) j!136))))

(declare-fun e!353159 () Bool)

(assert (=> b!615940 (=> (not res!396750) (not e!353159))))

(declare-fun e!353158 () Bool)

(assert (=> b!615940 (= e!353158 e!353159)))

(declare-fun b!615941 () Bool)

(assert (=> b!615941 false))

(declare-fun lt!283111 () Unit!20018)

(declare-datatypes ((List!12030 0))(
  ( (Nil!12027) (Cons!12026 (h!13071 (_ BitVec 64)) (t!18258 List!12030)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37486 (_ BitVec 64) (_ BitVec 32) List!12030) Unit!20018)

(assert (=> b!615941 (= lt!283111 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283110 (select (arr!17989 a!2986) j!136) j!136 Nil!12027))))

(declare-fun arrayNoDuplicates!0 (array!37486 (_ BitVec 32) List!12030) Bool)

(assert (=> b!615941 (arrayNoDuplicates!0 lt!283110 j!136 Nil!12027)))

(declare-fun lt!283103 () Unit!20018)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37486 (_ BitVec 32) (_ BitVec 32)) Unit!20018)

(assert (=> b!615941 (= lt!283103 (lemmaNoDuplicateFromThenFromBigger!0 lt!283110 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615941 (arrayNoDuplicates!0 lt!283110 #b00000000000000000000000000000000 Nil!12027)))

(declare-fun lt!283112 () Unit!20018)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37486 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12030) Unit!20018)

(assert (=> b!615941 (= lt!283112 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12027))))

(assert (=> b!615941 (arrayContainsKey!0 lt!283110 (select (arr!17989 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283106 () Unit!20018)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37486 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20018)

(assert (=> b!615941 (= lt!283106 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283110 (select (arr!17989 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20022 () Unit!20018)

(assert (=> b!615941 (= e!353166 Unit!20022)))

(declare-fun b!615942 () Bool)

(assert (=> b!615942 (= e!353159 (arrayContainsKey!0 lt!283110 (select (arr!17989 a!2986) j!136) index!984))))

(declare-fun b!615943 () Bool)

(declare-fun e!353162 () Unit!20018)

(declare-fun Unit!20023 () Unit!20018)

(assert (=> b!615943 (= e!353162 Unit!20023)))

(assert (=> b!615943 false))

(declare-fun b!615944 () Bool)

(declare-fun e!353163 () Bool)

(declare-fun e!353168 () Bool)

(assert (=> b!615944 (= e!353163 e!353168)))

(declare-fun res!396751 () Bool)

(assert (=> b!615944 (=> (not res!396751) (not e!353168))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!615944 (= res!396751 (= (select (store (arr!17989 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615944 (= lt!283110 (array!37487 (store (arr!17989 a!2986) i!1108 k0!1786) (size!18353 a!2986)))))

(declare-fun b!615945 () Bool)

(declare-fun e!353157 () Bool)

(assert (=> b!615945 (= e!353157 (not true))))

(declare-fun lt!283102 () Unit!20018)

(declare-fun e!353169 () Unit!20018)

(assert (=> b!615945 (= lt!283102 e!353169)))

(declare-fun c!69965 () Bool)

(declare-datatypes ((SeekEntryResult!6429 0))(
  ( (MissingZero!6429 (index!28000 (_ BitVec 32))) (Found!6429 (index!28001 (_ BitVec 32))) (Intermediate!6429 (undefined!7241 Bool) (index!28002 (_ BitVec 32)) (x!56797 (_ BitVec 32))) (Undefined!6429) (MissingVacant!6429 (index!28003 (_ BitVec 32))) )
))
(declare-fun lt!283109 () SeekEntryResult!6429)

(assert (=> b!615945 (= c!69965 (= lt!283109 (Found!6429 index!984)))))

(declare-fun lt!283114 () Unit!20018)

(assert (=> b!615945 (= lt!283114 e!353162)))

(declare-fun c!69962 () Bool)

(assert (=> b!615945 (= c!69962 (= lt!283109 Undefined!6429))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!283115 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37486 (_ BitVec 32)) SeekEntryResult!6429)

(assert (=> b!615945 (= lt!283109 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283115 lt!283110 mask!3053))))

(declare-fun e!353161 () Bool)

(assert (=> b!615945 e!353161))

(declare-fun res!396760 () Bool)

(assert (=> b!615945 (=> (not res!396760) (not e!353161))))

(declare-fun lt!283117 () (_ BitVec 32))

(declare-fun lt!283099 () SeekEntryResult!6429)

(assert (=> b!615945 (= res!396760 (= lt!283099 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283117 vacantSpotIndex!68 lt!283115 lt!283110 mask!3053)))))

(assert (=> b!615945 (= lt!283099 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283117 vacantSpotIndex!68 (select (arr!17989 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615945 (= lt!283115 (select (store (arr!17989 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283116 () Unit!20018)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20018)

(assert (=> b!615945 (= lt!283116 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283117 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615945 (= lt!283117 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615946 () Bool)

(declare-fun res!396748 () Bool)

(assert (=> b!615946 (=> (not res!396748) (not e!353167))))

(assert (=> b!615946 (= res!396748 (validKeyInArray!0 (select (arr!17989 a!2986) j!136)))))

(declare-fun b!615947 () Bool)

(declare-fun Unit!20024 () Unit!20018)

(assert (=> b!615947 (= e!353162 Unit!20024)))

(declare-fun b!615948 () Bool)

(declare-fun Unit!20025 () Unit!20018)

(assert (=> b!615948 (= e!353169 Unit!20025)))

(declare-fun b!615949 () Bool)

(declare-fun lt!283108 () SeekEntryResult!6429)

(assert (=> b!615949 (= e!353161 (= lt!283108 lt!283099))))

(declare-fun b!615950 () Bool)

(declare-fun res!396758 () Bool)

(assert (=> b!615950 (=> (not res!396758) (not e!353163))))

(assert (=> b!615950 (= res!396758 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17989 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615951 () Bool)

(declare-fun res!396749 () Bool)

(assert (=> b!615951 (=> (not res!396749) (not e!353163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37486 (_ BitVec 32)) Bool)

(assert (=> b!615951 (= res!396749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!353156 () Bool)

(declare-fun b!615952 () Bool)

(assert (=> b!615952 (= e!353156 (arrayContainsKey!0 lt!283110 (select (arr!17989 a!2986) j!136) index!984))))

(declare-fun res!396755 () Bool)

(assert (=> start!56016 (=> (not res!396755) (not e!353167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56016 (= res!396755 (validMask!0 mask!3053))))

(assert (=> start!56016 e!353167))

(assert (=> start!56016 true))

(declare-fun array_inv!13785 (array!37486) Bool)

(assert (=> start!56016 (array_inv!13785 a!2986)))

(declare-fun b!615953 () Bool)

(declare-fun res!396757 () Bool)

(assert (=> b!615953 (= res!396757 (bvsge j!136 index!984))))

(assert (=> b!615953 (=> res!396757 e!353158)))

(declare-fun e!353164 () Bool)

(assert (=> b!615953 (= e!353164 e!353158)))

(declare-fun b!615954 () Bool)

(declare-fun res!396752 () Bool)

(assert (=> b!615954 (=> (not res!396752) (not e!353163))))

(assert (=> b!615954 (= res!396752 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12027))))

(declare-fun b!615955 () Bool)

(assert (=> b!615955 false))

(declare-fun lt!283105 () Unit!20018)

(assert (=> b!615955 (= lt!283105 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283110 (select (arr!17989 a!2986) j!136) index!984 Nil!12027))))

(assert (=> b!615955 (arrayNoDuplicates!0 lt!283110 index!984 Nil!12027)))

(declare-fun lt!283107 () Unit!20018)

(assert (=> b!615955 (= lt!283107 (lemmaNoDuplicateFromThenFromBigger!0 lt!283110 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615955 (arrayNoDuplicates!0 lt!283110 #b00000000000000000000000000000000 Nil!12027)))

(declare-fun lt!283098 () Unit!20018)

(assert (=> b!615955 (= lt!283098 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12027))))

(assert (=> b!615955 (arrayContainsKey!0 lt!283110 (select (arr!17989 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283113 () Unit!20018)

(assert (=> b!615955 (= lt!283113 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283110 (select (arr!17989 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615955 e!353156))

(declare-fun res!396761 () Bool)

(assert (=> b!615955 (=> (not res!396761) (not e!353156))))

(assert (=> b!615955 (= res!396761 (arrayContainsKey!0 lt!283110 (select (arr!17989 a!2986) j!136) j!136))))

(declare-fun Unit!20026 () Unit!20018)

(assert (=> b!615955 (= e!353160 Unit!20026)))

(declare-fun b!615956 () Bool)

(assert (=> b!615956 (= e!353167 e!353163)))

(declare-fun res!396753 () Bool)

(assert (=> b!615956 (=> (not res!396753) (not e!353163))))

(declare-fun lt!283101 () SeekEntryResult!6429)

(assert (=> b!615956 (= res!396753 (or (= lt!283101 (MissingZero!6429 i!1108)) (= lt!283101 (MissingVacant!6429 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37486 (_ BitVec 32)) SeekEntryResult!6429)

(assert (=> b!615956 (= lt!283101 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615957 () Bool)

(assert (=> b!615957 (= e!353168 e!353157)))

(declare-fun res!396756 () Bool)

(assert (=> b!615957 (=> (not res!396756) (not e!353157))))

(assert (=> b!615957 (= res!396756 (and (= lt!283108 (Found!6429 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17989 a!2986) index!984) (select (arr!17989 a!2986) j!136))) (not (= (select (arr!17989 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615957 (= lt!283108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17989 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615958 () Bool)

(declare-fun res!396747 () Bool)

(assert (=> b!615958 (=> (not res!396747) (not e!353167))))

(assert (=> b!615958 (= res!396747 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615959 () Bool)

(declare-fun Unit!20027 () Unit!20018)

(assert (=> b!615959 (= e!353169 Unit!20027)))

(declare-fun res!396759 () Bool)

(assert (=> b!615959 (= res!396759 (= (select (store (arr!17989 a!2986) i!1108 k0!1786) index!984) (select (arr!17989 a!2986) j!136)))))

(assert (=> b!615959 (=> (not res!396759) (not e!353164))))

(assert (=> b!615959 e!353164))

(declare-fun c!69964 () Bool)

(assert (=> b!615959 (= c!69964 (bvslt j!136 index!984))))

(declare-fun lt!283100 () Unit!20018)

(assert (=> b!615959 (= lt!283100 e!353166)))

(declare-fun c!69963 () Bool)

(assert (=> b!615959 (= c!69963 (bvslt index!984 j!136))))

(declare-fun lt!283104 () Unit!20018)

(assert (=> b!615959 (= lt!283104 e!353160)))

(assert (=> b!615959 false))

(assert (= (and start!56016 res!396755) b!615937))

(assert (= (and b!615937 res!396746) b!615946))

(assert (= (and b!615946 res!396748) b!615939))

(assert (= (and b!615939 res!396754) b!615958))

(assert (= (and b!615958 res!396747) b!615956))

(assert (= (and b!615956 res!396753) b!615951))

(assert (= (and b!615951 res!396749) b!615954))

(assert (= (and b!615954 res!396752) b!615950))

(assert (= (and b!615950 res!396758) b!615944))

(assert (= (and b!615944 res!396751) b!615957))

(assert (= (and b!615957 res!396756) b!615945))

(assert (= (and b!615945 res!396760) b!615949))

(assert (= (and b!615945 c!69962) b!615943))

(assert (= (and b!615945 (not c!69962)) b!615947))

(assert (= (and b!615945 c!69965) b!615959))

(assert (= (and b!615945 (not c!69965)) b!615948))

(assert (= (and b!615959 res!396759) b!615953))

(assert (= (and b!615953 (not res!396757)) b!615940))

(assert (= (and b!615940 res!396750) b!615942))

(assert (= (and b!615959 c!69964) b!615941))

(assert (= (and b!615959 (not c!69964)) b!615936))

(assert (= (and b!615959 c!69963) b!615955))

(assert (= (and b!615959 (not c!69963)) b!615938))

(assert (= (and b!615955 res!396761) b!615952))

(declare-fun m!592125 () Bool)

(assert (=> b!615954 m!592125))

(declare-fun m!592127 () Bool)

(assert (=> b!615957 m!592127))

(declare-fun m!592129 () Bool)

(assert (=> b!615957 m!592129))

(assert (=> b!615957 m!592129))

(declare-fun m!592131 () Bool)

(assert (=> b!615957 m!592131))

(declare-fun m!592133 () Bool)

(assert (=> b!615939 m!592133))

(declare-fun m!592135 () Bool)

(assert (=> b!615945 m!592135))

(declare-fun m!592137 () Bool)

(assert (=> b!615945 m!592137))

(assert (=> b!615945 m!592129))

(declare-fun m!592139 () Bool)

(assert (=> b!615945 m!592139))

(declare-fun m!592141 () Bool)

(assert (=> b!615945 m!592141))

(declare-fun m!592143 () Bool)

(assert (=> b!615945 m!592143))

(assert (=> b!615945 m!592129))

(declare-fun m!592145 () Bool)

(assert (=> b!615945 m!592145))

(declare-fun m!592147 () Bool)

(assert (=> b!615945 m!592147))

(declare-fun m!592149 () Bool)

(assert (=> start!56016 m!592149))

(declare-fun m!592151 () Bool)

(assert (=> start!56016 m!592151))

(assert (=> b!615942 m!592129))

(assert (=> b!615942 m!592129))

(declare-fun m!592153 () Bool)

(assert (=> b!615942 m!592153))

(assert (=> b!615940 m!592129))

(assert (=> b!615940 m!592129))

(declare-fun m!592155 () Bool)

(assert (=> b!615940 m!592155))

(declare-fun m!592157 () Bool)

(assert (=> b!615956 m!592157))

(assert (=> b!615959 m!592139))

(declare-fun m!592159 () Bool)

(assert (=> b!615959 m!592159))

(assert (=> b!615959 m!592129))

(assert (=> b!615952 m!592129))

(assert (=> b!615952 m!592129))

(assert (=> b!615952 m!592153))

(assert (=> b!615946 m!592129))

(assert (=> b!615946 m!592129))

(declare-fun m!592161 () Bool)

(assert (=> b!615946 m!592161))

(declare-fun m!592163 () Bool)

(assert (=> b!615955 m!592163))

(assert (=> b!615955 m!592129))

(assert (=> b!615955 m!592129))

(declare-fun m!592165 () Bool)

(assert (=> b!615955 m!592165))

(assert (=> b!615955 m!592129))

(declare-fun m!592167 () Bool)

(assert (=> b!615955 m!592167))

(assert (=> b!615955 m!592129))

(assert (=> b!615955 m!592155))

(assert (=> b!615955 m!592129))

(declare-fun m!592169 () Bool)

(assert (=> b!615955 m!592169))

(declare-fun m!592171 () Bool)

(assert (=> b!615955 m!592171))

(declare-fun m!592173 () Bool)

(assert (=> b!615955 m!592173))

(declare-fun m!592175 () Bool)

(assert (=> b!615955 m!592175))

(declare-fun m!592177 () Bool)

(assert (=> b!615950 m!592177))

(assert (=> b!615941 m!592129))

(declare-fun m!592179 () Bool)

(assert (=> b!615941 m!592179))

(declare-fun m!592181 () Bool)

(assert (=> b!615941 m!592181))

(assert (=> b!615941 m!592171))

(assert (=> b!615941 m!592129))

(declare-fun m!592183 () Bool)

(assert (=> b!615941 m!592183))

(declare-fun m!592185 () Bool)

(assert (=> b!615941 m!592185))

(assert (=> b!615941 m!592175))

(assert (=> b!615941 m!592129))

(declare-fun m!592187 () Bool)

(assert (=> b!615941 m!592187))

(assert (=> b!615941 m!592129))

(declare-fun m!592189 () Bool)

(assert (=> b!615958 m!592189))

(declare-fun m!592191 () Bool)

(assert (=> b!615951 m!592191))

(assert (=> b!615944 m!592139))

(declare-fun m!592193 () Bool)

(assert (=> b!615944 m!592193))

(check-sat (not b!615954) (not b!615952) (not start!56016) (not b!615958) (not b!615940) (not b!615955) (not b!615945) (not b!615957) (not b!615942) (not b!615941) (not b!615939) (not b!615951) (not b!615956) (not b!615946))
(check-sat)
