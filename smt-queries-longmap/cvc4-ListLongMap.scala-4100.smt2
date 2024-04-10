; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56102 () Bool)

(assert start!56102)

(declare-fun b!619148 () Bool)

(declare-fun res!398932 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619148 (= res!398932 (bvsge j!136 index!984))))

(declare-fun e!355088 () Bool)

(assert (=> b!619148 (=> res!398932 e!355088)))

(declare-fun e!355091 () Bool)

(assert (=> b!619148 (= e!355091 e!355088)))

(declare-fun b!619149 () Bool)

(declare-fun e!355090 () Bool)

(declare-datatypes ((array!37572 0))(
  ( (array!37573 (arr!18032 (Array (_ BitVec 32) (_ BitVec 64))) (size!18396 (_ BitVec 32))) )
))
(declare-fun lt!285678 () array!37572)

(declare-fun a!2986 () array!37572)

(declare-fun arrayContainsKey!0 (array!37572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619149 (= e!355090 (arrayContainsKey!0 lt!285678 (select (arr!18032 a!2986) j!136) index!984))))

(declare-fun b!619150 () Bool)

(declare-fun res!398934 () Bool)

(declare-fun e!355081 () Bool)

(assert (=> b!619150 (=> (not res!398934) (not e!355081))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619150 (= res!398934 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18032 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619151 () Bool)

(declare-fun res!398937 () Bool)

(declare-fun e!355089 () Bool)

(assert (=> b!619151 (=> (not res!398937) (not e!355089))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619151 (= res!398937 (validKeyInArray!0 k!1786))))

(declare-fun b!619153 () Bool)

(declare-datatypes ((Unit!20448 0))(
  ( (Unit!20449) )
))
(declare-fun e!355082 () Unit!20448)

(declare-fun Unit!20450 () Unit!20448)

(assert (=> b!619153 (= e!355082 Unit!20450)))

(declare-fun b!619154 () Bool)

(assert (=> b!619154 false))

(declare-fun lt!285681 () Unit!20448)

(declare-datatypes ((List!12073 0))(
  ( (Nil!12070) (Cons!12069 (h!13114 (_ BitVec 64)) (t!18301 List!12073)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37572 (_ BitVec 64) (_ BitVec 32) List!12073) Unit!20448)

(assert (=> b!619154 (= lt!285681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285678 (select (arr!18032 a!2986) j!136) index!984 Nil!12070))))

(declare-fun arrayNoDuplicates!0 (array!37572 (_ BitVec 32) List!12073) Bool)

(assert (=> b!619154 (arrayNoDuplicates!0 lt!285678 index!984 Nil!12070)))

(declare-fun lt!285688 () Unit!20448)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37572 (_ BitVec 32) (_ BitVec 32)) Unit!20448)

(assert (=> b!619154 (= lt!285688 (lemmaNoDuplicateFromThenFromBigger!0 lt!285678 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619154 (arrayNoDuplicates!0 lt!285678 #b00000000000000000000000000000000 Nil!12070)))

(declare-fun lt!285680 () Unit!20448)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37572 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12073) Unit!20448)

(assert (=> b!619154 (= lt!285680 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12070))))

(assert (=> b!619154 (arrayContainsKey!0 lt!285678 (select (arr!18032 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285696 () Unit!20448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37572 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20448)

(assert (=> b!619154 (= lt!285696 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285678 (select (arr!18032 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355079 () Bool)

(assert (=> b!619154 e!355079))

(declare-fun res!398929 () Bool)

(assert (=> b!619154 (=> (not res!398929) (not e!355079))))

(assert (=> b!619154 (= res!398929 (arrayContainsKey!0 lt!285678 (select (arr!18032 a!2986) j!136) j!136))))

(declare-fun e!355086 () Unit!20448)

(declare-fun Unit!20451 () Unit!20448)

(assert (=> b!619154 (= e!355086 Unit!20451)))

(declare-fun b!619155 () Bool)

(declare-fun e!355087 () Bool)

(assert (=> b!619155 (= e!355081 e!355087)))

(declare-fun res!398935 () Bool)

(assert (=> b!619155 (=> (not res!398935) (not e!355087))))

(assert (=> b!619155 (= res!398935 (= (select (store (arr!18032 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619155 (= lt!285678 (array!37573 (store (arr!18032 a!2986) i!1108 k!1786) (size!18396 a!2986)))))

(declare-fun b!619156 () Bool)

(declare-fun e!355080 () Unit!20448)

(declare-fun Unit!20452 () Unit!20448)

(assert (=> b!619156 (= e!355080 Unit!20452)))

(declare-fun b!619157 () Bool)

(declare-fun res!398933 () Bool)

(assert (=> b!619157 (=> (not res!398933) (not e!355081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37572 (_ BitVec 32)) Bool)

(assert (=> b!619157 (= res!398933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619158 () Bool)

(declare-fun e!355085 () Bool)

(declare-datatypes ((SeekEntryResult!6472 0))(
  ( (MissingZero!6472 (index!28172 (_ BitVec 32))) (Found!6472 (index!28173 (_ BitVec 32))) (Intermediate!6472 (undefined!7284 Bool) (index!28174 (_ BitVec 32)) (x!56952 (_ BitVec 32))) (Undefined!6472) (MissingVacant!6472 (index!28175 (_ BitVec 32))) )
))
(declare-fun lt!285692 () SeekEntryResult!6472)

(declare-fun lt!285683 () SeekEntryResult!6472)

(assert (=> b!619158 (= e!355085 (= lt!285692 lt!285683))))

(declare-fun b!619159 () Bool)

(declare-fun Unit!20453 () Unit!20448)

(assert (=> b!619159 (= e!355082 Unit!20453)))

(assert (=> b!619159 false))

(declare-fun b!619160 () Bool)

(declare-fun Unit!20454 () Unit!20448)

(assert (=> b!619160 (= e!355086 Unit!20454)))

(declare-fun b!619161 () Bool)

(declare-fun res!398939 () Bool)

(assert (=> b!619161 (=> (not res!398939) (not e!355089))))

(assert (=> b!619161 (= res!398939 (validKeyInArray!0 (select (arr!18032 a!2986) j!136)))))

(declare-fun b!619162 () Bool)

(declare-fun e!355084 () Bool)

(assert (=> b!619162 (= e!355084 true)))

(assert (=> b!619162 (= (select (store (arr!18032 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619163 () Bool)

(declare-fun res!398927 () Bool)

(assert (=> b!619163 (=> (not res!398927) (not e!355089))))

(assert (=> b!619163 (= res!398927 (and (= (size!18396 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18396 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18396 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619164 () Bool)

(assert (=> b!619164 false))

(declare-fun lt!285695 () Unit!20448)

(assert (=> b!619164 (= lt!285695 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285678 (select (arr!18032 a!2986) j!136) j!136 Nil!12070))))

(assert (=> b!619164 (arrayNoDuplicates!0 lt!285678 j!136 Nil!12070)))

(declare-fun lt!285679 () Unit!20448)

(assert (=> b!619164 (= lt!285679 (lemmaNoDuplicateFromThenFromBigger!0 lt!285678 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619164 (arrayNoDuplicates!0 lt!285678 #b00000000000000000000000000000000 Nil!12070)))

(declare-fun lt!285693 () Unit!20448)

(assert (=> b!619164 (= lt!285693 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12070))))

(assert (=> b!619164 (arrayContainsKey!0 lt!285678 (select (arr!18032 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285682 () Unit!20448)

(assert (=> b!619164 (= lt!285682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285678 (select (arr!18032 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355083 () Unit!20448)

(declare-fun Unit!20455 () Unit!20448)

(assert (=> b!619164 (= e!355083 Unit!20455)))

(declare-fun b!619152 () Bool)

(assert (=> b!619152 (= e!355089 e!355081)))

(declare-fun res!398940 () Bool)

(assert (=> b!619152 (=> (not res!398940) (not e!355081))))

(declare-fun lt!285687 () SeekEntryResult!6472)

(assert (=> b!619152 (= res!398940 (or (= lt!285687 (MissingZero!6472 i!1108)) (= lt!285687 (MissingVacant!6472 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37572 (_ BitVec 32)) SeekEntryResult!6472)

(assert (=> b!619152 (= lt!285687 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!398928 () Bool)

(assert (=> start!56102 (=> (not res!398928) (not e!355089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56102 (= res!398928 (validMask!0 mask!3053))))

(assert (=> start!56102 e!355089))

(assert (=> start!56102 true))

(declare-fun array_inv!13828 (array!37572) Bool)

(assert (=> start!56102 (array_inv!13828 a!2986)))

(declare-fun b!619165 () Bool)

(declare-fun Unit!20456 () Unit!20448)

(assert (=> b!619165 (= e!355080 Unit!20456)))

(declare-fun res!398930 () Bool)

(assert (=> b!619165 (= res!398930 (= (select (store (arr!18032 a!2986) i!1108 k!1786) index!984) (select (arr!18032 a!2986) j!136)))))

(assert (=> b!619165 (=> (not res!398930) (not e!355091))))

(assert (=> b!619165 e!355091))

(declare-fun c!70478 () Bool)

(assert (=> b!619165 (= c!70478 (bvslt j!136 index!984))))

(declare-fun lt!285691 () Unit!20448)

(assert (=> b!619165 (= lt!285691 e!355083)))

(declare-fun c!70480 () Bool)

(assert (=> b!619165 (= c!70480 (bvslt index!984 j!136))))

(declare-fun lt!285686 () Unit!20448)

(assert (=> b!619165 (= lt!285686 e!355086)))

(assert (=> b!619165 false))

(declare-fun res!398942 () Bool)

(declare-fun b!619166 () Bool)

(assert (=> b!619166 (= res!398942 (arrayContainsKey!0 lt!285678 (select (arr!18032 a!2986) j!136) j!136))))

(assert (=> b!619166 (=> (not res!398942) (not e!355090))))

(assert (=> b!619166 (= e!355088 e!355090)))

(declare-fun b!619167 () Bool)

(declare-fun res!398936 () Bool)

(assert (=> b!619167 (=> (not res!398936) (not e!355089))))

(assert (=> b!619167 (= res!398936 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619168 () Bool)

(declare-fun Unit!20457 () Unit!20448)

(assert (=> b!619168 (= e!355083 Unit!20457)))

(declare-fun b!619169 () Bool)

(assert (=> b!619169 (= e!355079 (arrayContainsKey!0 lt!285678 (select (arr!18032 a!2986) j!136) index!984))))

(declare-fun b!619170 () Bool)

(declare-fun res!398938 () Bool)

(assert (=> b!619170 (=> (not res!398938) (not e!355081))))

(assert (=> b!619170 (= res!398938 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12070))))

(declare-fun b!619171 () Bool)

(declare-fun e!355092 () Bool)

(assert (=> b!619171 (= e!355087 e!355092)))

(declare-fun res!398926 () Bool)

(assert (=> b!619171 (=> (not res!398926) (not e!355092))))

(assert (=> b!619171 (= res!398926 (and (= lt!285692 (Found!6472 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18032 a!2986) index!984) (select (arr!18032 a!2986) j!136))) (not (= (select (arr!18032 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37572 (_ BitVec 32)) SeekEntryResult!6472)

(assert (=> b!619171 (= lt!285692 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18032 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619172 () Bool)

(assert (=> b!619172 (= e!355092 (not e!355084))))

(declare-fun res!398941 () Bool)

(assert (=> b!619172 (=> res!398941 e!355084)))

(declare-fun lt!285690 () SeekEntryResult!6472)

(assert (=> b!619172 (= res!398941 (not (= lt!285690 (MissingVacant!6472 vacantSpotIndex!68))))))

(declare-fun lt!285685 () Unit!20448)

(assert (=> b!619172 (= lt!285685 e!355080)))

(declare-fun c!70479 () Bool)

(assert (=> b!619172 (= c!70479 (= lt!285690 (Found!6472 index!984)))))

(declare-fun lt!285684 () Unit!20448)

(assert (=> b!619172 (= lt!285684 e!355082)))

(declare-fun c!70481 () Bool)

(assert (=> b!619172 (= c!70481 (= lt!285690 Undefined!6472))))

(declare-fun lt!285694 () (_ BitVec 64))

(assert (=> b!619172 (= lt!285690 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285694 lt!285678 mask!3053))))

(assert (=> b!619172 e!355085))

(declare-fun res!398931 () Bool)

(assert (=> b!619172 (=> (not res!398931) (not e!355085))))

(declare-fun lt!285697 () (_ BitVec 32))

(assert (=> b!619172 (= res!398931 (= lt!285683 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285697 vacantSpotIndex!68 lt!285694 lt!285678 mask!3053)))))

(assert (=> b!619172 (= lt!285683 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285697 vacantSpotIndex!68 (select (arr!18032 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619172 (= lt!285694 (select (store (arr!18032 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285689 () Unit!20448)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37572 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20448)

(assert (=> b!619172 (= lt!285689 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285697 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619172 (= lt!285697 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56102 res!398928) b!619163))

(assert (= (and b!619163 res!398927) b!619161))

(assert (= (and b!619161 res!398939) b!619151))

(assert (= (and b!619151 res!398937) b!619167))

(assert (= (and b!619167 res!398936) b!619152))

(assert (= (and b!619152 res!398940) b!619157))

(assert (= (and b!619157 res!398933) b!619170))

(assert (= (and b!619170 res!398938) b!619150))

(assert (= (and b!619150 res!398934) b!619155))

(assert (= (and b!619155 res!398935) b!619171))

(assert (= (and b!619171 res!398926) b!619172))

(assert (= (and b!619172 res!398931) b!619158))

(assert (= (and b!619172 c!70481) b!619159))

(assert (= (and b!619172 (not c!70481)) b!619153))

(assert (= (and b!619172 c!70479) b!619165))

(assert (= (and b!619172 (not c!70479)) b!619156))

(assert (= (and b!619165 res!398930) b!619148))

(assert (= (and b!619148 (not res!398932)) b!619166))

(assert (= (and b!619166 res!398942) b!619149))

(assert (= (and b!619165 c!70478) b!619164))

(assert (= (and b!619165 (not c!70478)) b!619168))

(assert (= (and b!619165 c!70480) b!619154))

(assert (= (and b!619165 (not c!70480)) b!619160))

(assert (= (and b!619154 res!398929) b!619169))

(assert (= (and b!619172 (not res!398941)) b!619162))

(declare-fun m!595141 () Bool)

(assert (=> b!619169 m!595141))

(assert (=> b!619169 m!595141))

(declare-fun m!595143 () Bool)

(assert (=> b!619169 m!595143))

(declare-fun m!595145 () Bool)

(assert (=> start!56102 m!595145))

(declare-fun m!595147 () Bool)

(assert (=> start!56102 m!595147))

(assert (=> b!619149 m!595141))

(assert (=> b!619149 m!595141))

(assert (=> b!619149 m!595143))

(declare-fun m!595149 () Bool)

(assert (=> b!619157 m!595149))

(declare-fun m!595151 () Bool)

(assert (=> b!619170 m!595151))

(assert (=> b!619166 m!595141))

(assert (=> b!619166 m!595141))

(declare-fun m!595153 () Bool)

(assert (=> b!619166 m!595153))

(assert (=> b!619161 m!595141))

(assert (=> b!619161 m!595141))

(declare-fun m!595155 () Bool)

(assert (=> b!619161 m!595155))

(declare-fun m!595157 () Bool)

(assert (=> b!619154 m!595157))

(declare-fun m!595159 () Bool)

(assert (=> b!619154 m!595159))

(assert (=> b!619154 m!595141))

(declare-fun m!595161 () Bool)

(assert (=> b!619154 m!595161))

(assert (=> b!619154 m!595141))

(assert (=> b!619154 m!595141))

(declare-fun m!595163 () Bool)

(assert (=> b!619154 m!595163))

(declare-fun m!595165 () Bool)

(assert (=> b!619154 m!595165))

(assert (=> b!619154 m!595141))

(declare-fun m!595167 () Bool)

(assert (=> b!619154 m!595167))

(assert (=> b!619154 m!595141))

(assert (=> b!619154 m!595153))

(declare-fun m!595169 () Bool)

(assert (=> b!619154 m!595169))

(declare-fun m!595171 () Bool)

(assert (=> b!619152 m!595171))

(assert (=> b!619164 m!595159))

(assert (=> b!619164 m!595141))

(declare-fun m!595173 () Bool)

(assert (=> b!619164 m!595173))

(assert (=> b!619164 m!595141))

(assert (=> b!619164 m!595141))

(declare-fun m!595175 () Bool)

(assert (=> b!619164 m!595175))

(assert (=> b!619164 m!595141))

(declare-fun m!595177 () Bool)

(assert (=> b!619164 m!595177))

(assert (=> b!619164 m!595169))

(declare-fun m!595179 () Bool)

(assert (=> b!619164 m!595179))

(declare-fun m!595181 () Bool)

(assert (=> b!619164 m!595181))

(declare-fun m!595183 () Bool)

(assert (=> b!619167 m!595183))

(declare-fun m!595185 () Bool)

(assert (=> b!619150 m!595185))

(declare-fun m!595187 () Bool)

(assert (=> b!619151 m!595187))

(declare-fun m!595189 () Bool)

(assert (=> b!619162 m!595189))

(declare-fun m!595191 () Bool)

(assert (=> b!619162 m!595191))

(assert (=> b!619155 m!595189))

(declare-fun m!595193 () Bool)

(assert (=> b!619155 m!595193))

(declare-fun m!595195 () Bool)

(assert (=> b!619172 m!595195))

(declare-fun m!595197 () Bool)

(assert (=> b!619172 m!595197))

(assert (=> b!619172 m!595141))

(assert (=> b!619172 m!595189))

(declare-fun m!595199 () Bool)

(assert (=> b!619172 m!595199))

(declare-fun m!595201 () Bool)

(assert (=> b!619172 m!595201))

(assert (=> b!619172 m!595141))

(declare-fun m!595203 () Bool)

(assert (=> b!619172 m!595203))

(declare-fun m!595205 () Bool)

(assert (=> b!619172 m!595205))

(declare-fun m!595207 () Bool)

(assert (=> b!619171 m!595207))

(assert (=> b!619171 m!595141))

(assert (=> b!619171 m!595141))

(declare-fun m!595209 () Bool)

(assert (=> b!619171 m!595209))

(assert (=> b!619165 m!595189))

(assert (=> b!619165 m!595191))

(assert (=> b!619165 m!595141))

(push 1)

