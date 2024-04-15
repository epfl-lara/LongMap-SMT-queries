; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54630 () Bool)

(assert start!54630)

(declare-fun b!597135 () Bool)

(declare-fun e!341203 () Bool)

(declare-fun e!341209 () Bool)

(assert (=> b!597135 (= e!341203 e!341209)))

(declare-fun res!382809 () Bool)

(assert (=> b!597135 (=> (not res!382809) (not e!341209))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37035 0))(
  ( (array!37036 (arr!17780 (Array (_ BitVec 32) (_ BitVec 64))) (size!18145 (_ BitVec 32))) )
))
(declare-fun lt!271171 () array!37035)

(declare-fun a!2986 () array!37035)

(declare-fun arrayContainsKey!0 (array!37035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597135 (= res!382809 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) j!136))))

(declare-fun b!597136 () Bool)

(declare-fun e!341201 () Bool)

(declare-datatypes ((List!11860 0))(
  ( (Nil!11857) (Cons!11856 (h!12901 (_ BitVec 64)) (t!18079 List!11860)) )
))
(declare-fun noDuplicate!275 (List!11860) Bool)

(assert (=> b!597136 (= e!341201 (noDuplicate!275 Nil!11857))))

(declare-fun b!597138 () Bool)

(declare-fun e!341206 () Bool)

(declare-fun e!341205 () Bool)

(assert (=> b!597138 (= e!341206 (not e!341205))))

(declare-fun res!382798 () Bool)

(assert (=> b!597138 (=> res!382798 e!341205)))

(declare-datatypes ((SeekEntryResult!6217 0))(
  ( (MissingZero!6217 (index!27119 (_ BitVec 32))) (Found!6217 (index!27120 (_ BitVec 32))) (Intermediate!6217 (undefined!7029 Bool) (index!27121 (_ BitVec 32)) (x!55929 (_ BitVec 32))) (Undefined!6217) (MissingVacant!6217 (index!27122 (_ BitVec 32))) )
))
(declare-fun lt!271175 () SeekEntryResult!6217)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!597138 (= res!382798 (not (= lt!271175 (Found!6217 index!984))))))

(declare-datatypes ((Unit!18780 0))(
  ( (Unit!18781) )
))
(declare-fun lt!271168 () Unit!18780)

(declare-fun e!341208 () Unit!18780)

(assert (=> b!597138 (= lt!271168 e!341208)))

(declare-fun c!67536 () Bool)

(assert (=> b!597138 (= c!67536 (= lt!271175 Undefined!6217))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!271174 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37035 (_ BitVec 32)) SeekEntryResult!6217)

(assert (=> b!597138 (= lt!271175 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271174 lt!271171 mask!3053))))

(declare-fun e!341200 () Bool)

(assert (=> b!597138 e!341200))

(declare-fun res!382804 () Bool)

(assert (=> b!597138 (=> (not res!382804) (not e!341200))))

(declare-fun lt!271172 () (_ BitVec 32))

(declare-fun lt!271166 () SeekEntryResult!6217)

(assert (=> b!597138 (= res!382804 (= lt!271166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 lt!271174 lt!271171 mask!3053)))))

(assert (=> b!597138 (= lt!271166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!597138 (= lt!271174 (select (store (arr!17780 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271173 () Unit!18780)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18780)

(assert (=> b!597138 (= lt!271173 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597138 (= lt!271172 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597139 () Bool)

(declare-fun res!382799 () Bool)

(declare-fun e!341199 () Bool)

(assert (=> b!597139 (=> (not res!382799) (not e!341199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597139 (= res!382799 (validKeyInArray!0 (select (arr!17780 a!2986) j!136)))))

(declare-fun b!597140 () Bool)

(declare-fun e!341204 () Bool)

(assert (=> b!597140 (= e!341204 e!341206)))

(declare-fun res!382806 () Bool)

(assert (=> b!597140 (=> (not res!382806) (not e!341206))))

(declare-fun lt!271177 () SeekEntryResult!6217)

(assert (=> b!597140 (= res!382806 (and (= lt!271177 (Found!6217 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17780 a!2986) index!984) (select (arr!17780 a!2986) j!136))) (not (= (select (arr!17780 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!597140 (= lt!271177 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597141 () Bool)

(declare-fun res!382803 () Bool)

(declare-fun e!341207 () Bool)

(assert (=> b!597141 (=> (not res!382803) (not e!341207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37035 (_ BitVec 32)) Bool)

(assert (=> b!597141 (= res!382803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597142 () Bool)

(declare-fun e!341202 () Bool)

(assert (=> b!597142 (= e!341205 e!341202)))

(declare-fun res!382805 () Bool)

(assert (=> b!597142 (=> res!382805 e!341202)))

(declare-fun lt!271169 () (_ BitVec 64))

(assert (=> b!597142 (= res!382805 (or (not (= (select (arr!17780 a!2986) j!136) lt!271174)) (not (= (select (arr!17780 a!2986) j!136) lt!271169)) (bvsge j!136 index!984)))))

(declare-fun e!341210 () Bool)

(assert (=> b!597142 e!341210))

(declare-fun res!382811 () Bool)

(assert (=> b!597142 (=> (not res!382811) (not e!341210))))

(assert (=> b!597142 (= res!382811 (= lt!271169 (select (arr!17780 a!2986) j!136)))))

(assert (=> b!597142 (= lt!271169 (select (store (arr!17780 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!597143 () Bool)

(assert (=> b!597143 (= e!341199 e!341207)))

(declare-fun res!382801 () Bool)

(assert (=> b!597143 (=> (not res!382801) (not e!341207))))

(declare-fun lt!271170 () SeekEntryResult!6217)

(assert (=> b!597143 (= res!382801 (or (= lt!271170 (MissingZero!6217 i!1108)) (= lt!271170 (MissingVacant!6217 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37035 (_ BitVec 32)) SeekEntryResult!6217)

(assert (=> b!597143 (= lt!271170 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!597144 () Bool)

(declare-fun Unit!18782 () Unit!18780)

(assert (=> b!597144 (= e!341208 Unit!18782)))

(assert (=> b!597144 false))

(declare-fun res!382808 () Bool)

(assert (=> start!54630 (=> (not res!382808) (not e!341199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54630 (= res!382808 (validMask!0 mask!3053))))

(assert (=> start!54630 e!341199))

(assert (=> start!54630 true))

(declare-fun array_inv!13663 (array!37035) Bool)

(assert (=> start!54630 (array_inv!13663 a!2986)))

(declare-fun b!597137 () Bool)

(declare-fun res!382810 () Bool)

(assert (=> b!597137 (=> (not res!382810) (not e!341207))))

(declare-fun arrayNoDuplicates!0 (array!37035 (_ BitVec 32) List!11860) Bool)

(assert (=> b!597137 (= res!382810 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11857))))

(declare-fun b!597145 () Bool)

(declare-fun res!382802 () Bool)

(assert (=> b!597145 (=> (not res!382802) (not e!341199))))

(assert (=> b!597145 (= res!382802 (validKeyInArray!0 k0!1786))))

(declare-fun b!597146 () Bool)

(assert (=> b!597146 (= e!341210 e!341203)))

(declare-fun res!382800 () Bool)

(assert (=> b!597146 (=> res!382800 e!341203)))

(assert (=> b!597146 (= res!382800 (or (not (= (select (arr!17780 a!2986) j!136) lt!271174)) (not (= (select (arr!17780 a!2986) j!136) lt!271169)) (bvsge j!136 index!984)))))

(declare-fun b!597147 () Bool)

(assert (=> b!597147 (= e!341202 e!341201)))

(declare-fun res!382797 () Bool)

(assert (=> b!597147 (=> res!382797 e!341201)))

(assert (=> b!597147 (= res!382797 (or (bvsgt #b00000000000000000000000000000000 (size!18145 a!2986)) (bvsge (size!18145 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!597147 (arrayNoDuplicates!0 lt!271171 #b00000000000000000000000000000000 Nil!11857)))

(declare-fun lt!271167 () Unit!18780)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37035 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11860) Unit!18780)

(assert (=> b!597147 (= lt!271167 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11857))))

(assert (=> b!597147 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271176 () Unit!18780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37035 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18780)

(assert (=> b!597147 (= lt!271176 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271171 (select (arr!17780 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597148 () Bool)

(declare-fun res!382807 () Bool)

(assert (=> b!597148 (=> (not res!382807) (not e!341207))))

(assert (=> b!597148 (= res!382807 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17780 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597149 () Bool)

(assert (=> b!597149 (= e!341207 e!341204)))

(declare-fun res!382814 () Bool)

(assert (=> b!597149 (=> (not res!382814) (not e!341204))))

(assert (=> b!597149 (= res!382814 (= (select (store (arr!17780 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597149 (= lt!271171 (array!37036 (store (arr!17780 a!2986) i!1108 k0!1786) (size!18145 a!2986)))))

(declare-fun b!597150 () Bool)

(declare-fun res!382813 () Bool)

(assert (=> b!597150 (=> (not res!382813) (not e!341199))))

(assert (=> b!597150 (= res!382813 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597151 () Bool)

(declare-fun Unit!18783 () Unit!18780)

(assert (=> b!597151 (= e!341208 Unit!18783)))

(declare-fun b!597152 () Bool)

(assert (=> b!597152 (= e!341209 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) index!984))))

(declare-fun b!597153 () Bool)

(assert (=> b!597153 (= e!341200 (= lt!271177 lt!271166))))

(declare-fun b!597154 () Bool)

(declare-fun res!382812 () Bool)

(assert (=> b!597154 (=> (not res!382812) (not e!341199))))

(assert (=> b!597154 (= res!382812 (and (= (size!18145 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18145 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54630 res!382808) b!597154))

(assert (= (and b!597154 res!382812) b!597139))

(assert (= (and b!597139 res!382799) b!597145))

(assert (= (and b!597145 res!382802) b!597150))

(assert (= (and b!597150 res!382813) b!597143))

(assert (= (and b!597143 res!382801) b!597141))

(assert (= (and b!597141 res!382803) b!597137))

(assert (= (and b!597137 res!382810) b!597148))

(assert (= (and b!597148 res!382807) b!597149))

(assert (= (and b!597149 res!382814) b!597140))

(assert (= (and b!597140 res!382806) b!597138))

(assert (= (and b!597138 res!382804) b!597153))

(assert (= (and b!597138 c!67536) b!597144))

(assert (= (and b!597138 (not c!67536)) b!597151))

(assert (= (and b!597138 (not res!382798)) b!597142))

(assert (= (and b!597142 res!382811) b!597146))

(assert (= (and b!597146 (not res!382800)) b!597135))

(assert (= (and b!597135 res!382809) b!597152))

(assert (= (and b!597142 (not res!382805)) b!597147))

(assert (= (and b!597147 (not res!382797)) b!597136))

(declare-fun m!574033 () Bool)

(assert (=> b!597135 m!574033))

(assert (=> b!597135 m!574033))

(declare-fun m!574035 () Bool)

(assert (=> b!597135 m!574035))

(assert (=> b!597146 m!574033))

(assert (=> b!597139 m!574033))

(assert (=> b!597139 m!574033))

(declare-fun m!574037 () Bool)

(assert (=> b!597139 m!574037))

(assert (=> b!597142 m!574033))

(declare-fun m!574039 () Bool)

(assert (=> b!597142 m!574039))

(declare-fun m!574041 () Bool)

(assert (=> b!597142 m!574041))

(declare-fun m!574043 () Bool)

(assert (=> b!597148 m!574043))

(declare-fun m!574045 () Bool)

(assert (=> b!597136 m!574045))

(assert (=> b!597147 m!574033))

(assert (=> b!597147 m!574033))

(declare-fun m!574047 () Bool)

(assert (=> b!597147 m!574047))

(declare-fun m!574049 () Bool)

(assert (=> b!597147 m!574049))

(declare-fun m!574051 () Bool)

(assert (=> b!597147 m!574051))

(assert (=> b!597147 m!574033))

(declare-fun m!574053 () Bool)

(assert (=> b!597147 m!574053))

(assert (=> b!597152 m!574033))

(assert (=> b!597152 m!574033))

(declare-fun m!574055 () Bool)

(assert (=> b!597152 m!574055))

(declare-fun m!574057 () Bool)

(assert (=> start!54630 m!574057))

(declare-fun m!574059 () Bool)

(assert (=> start!54630 m!574059))

(declare-fun m!574061 () Bool)

(assert (=> b!597150 m!574061))

(declare-fun m!574063 () Bool)

(assert (=> b!597143 m!574063))

(assert (=> b!597149 m!574039))

(declare-fun m!574065 () Bool)

(assert (=> b!597149 m!574065))

(declare-fun m!574067 () Bool)

(assert (=> b!597138 m!574067))

(declare-fun m!574069 () Bool)

(assert (=> b!597138 m!574069))

(assert (=> b!597138 m!574033))

(assert (=> b!597138 m!574039))

(declare-fun m!574071 () Bool)

(assert (=> b!597138 m!574071))

(declare-fun m!574073 () Bool)

(assert (=> b!597138 m!574073))

(declare-fun m!574075 () Bool)

(assert (=> b!597138 m!574075))

(assert (=> b!597138 m!574033))

(declare-fun m!574077 () Bool)

(assert (=> b!597138 m!574077))

(declare-fun m!574079 () Bool)

(assert (=> b!597137 m!574079))

(declare-fun m!574081 () Bool)

(assert (=> b!597141 m!574081))

(declare-fun m!574083 () Bool)

(assert (=> b!597145 m!574083))

(declare-fun m!574085 () Bool)

(assert (=> b!597140 m!574085))

(assert (=> b!597140 m!574033))

(assert (=> b!597140 m!574033))

(declare-fun m!574087 () Bool)

(assert (=> b!597140 m!574087))

(check-sat (not b!597147) (not b!597140) (not b!597141) (not b!597152) (not b!597150) (not b!597137) (not b!597139) (not b!597145) (not b!597136) (not start!54630) (not b!597143) (not b!597138) (not b!597135))
(check-sat)
(get-model)

(declare-fun d!86623 () Bool)

(declare-fun res!382927 () Bool)

(declare-fun e!341294 () Bool)

(assert (=> d!86623 (=> res!382927 e!341294)))

(assert (=> d!86623 (= res!382927 (= (select (arr!17780 lt!271171) index!984) (select (arr!17780 a!2986) j!136)))))

(assert (=> d!86623 (= (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) index!984) e!341294)))

(declare-fun b!597279 () Bool)

(declare-fun e!341295 () Bool)

(assert (=> b!597279 (= e!341294 e!341295)))

(declare-fun res!382928 () Bool)

(assert (=> b!597279 (=> (not res!382928) (not e!341295))))

(assert (=> b!597279 (= res!382928 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18145 lt!271171)))))

(declare-fun b!597280 () Bool)

(assert (=> b!597280 (= e!341295 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86623 (not res!382927)) b!597279))

(assert (= (and b!597279 res!382928) b!597280))

(declare-fun m!574201 () Bool)

(assert (=> d!86623 m!574201))

(assert (=> b!597280 m!574033))

(declare-fun m!574203 () Bool)

(assert (=> b!597280 m!574203))

(assert (=> b!597152 d!86623))

(declare-fun b!597289 () Bool)

(declare-fun e!341304 () Bool)

(declare-fun call!32902 () Bool)

(assert (=> b!597289 (= e!341304 call!32902)))

(declare-fun b!597290 () Bool)

(declare-fun e!341303 () Bool)

(assert (=> b!597290 (= e!341303 e!341304)))

(declare-fun c!67545 () Bool)

(assert (=> b!597290 (= c!67545 (validKeyInArray!0 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597292 () Bool)

(declare-fun e!341302 () Bool)

(assert (=> b!597292 (= e!341302 call!32902)))

(declare-fun bm!32899 () Bool)

(assert (=> bm!32899 (= call!32902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597291 () Bool)

(assert (=> b!597291 (= e!341304 e!341302)))

(declare-fun lt!271257 () (_ BitVec 64))

(assert (=> b!597291 (= lt!271257 (select (arr!17780 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271256 () Unit!18780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37035 (_ BitVec 64) (_ BitVec 32)) Unit!18780)

(assert (=> b!597291 (= lt!271256 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271257 #b00000000000000000000000000000000))))

(assert (=> b!597291 (arrayContainsKey!0 a!2986 lt!271257 #b00000000000000000000000000000000)))

(declare-fun lt!271258 () Unit!18780)

(assert (=> b!597291 (= lt!271258 lt!271256)))

(declare-fun res!382933 () Bool)

(assert (=> b!597291 (= res!382933 (= (seekEntryOrOpen!0 (select (arr!17780 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6217 #b00000000000000000000000000000000)))))

(assert (=> b!597291 (=> (not res!382933) (not e!341302))))

(declare-fun d!86625 () Bool)

(declare-fun res!382934 () Bool)

(assert (=> d!86625 (=> res!382934 e!341303)))

(assert (=> d!86625 (= res!382934 (bvsge #b00000000000000000000000000000000 (size!18145 a!2986)))))

(assert (=> d!86625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341303)))

(assert (= (and d!86625 (not res!382934)) b!597290))

(assert (= (and b!597290 c!67545) b!597291))

(assert (= (and b!597290 (not c!67545)) b!597289))

(assert (= (and b!597291 res!382933) b!597292))

(assert (= (or b!597292 b!597289) bm!32899))

(declare-fun m!574205 () Bool)

(assert (=> b!597290 m!574205))

(assert (=> b!597290 m!574205))

(declare-fun m!574207 () Bool)

(assert (=> b!597290 m!574207))

(declare-fun m!574209 () Bool)

(assert (=> bm!32899 m!574209))

(assert (=> b!597291 m!574205))

(declare-fun m!574211 () Bool)

(assert (=> b!597291 m!574211))

(declare-fun m!574213 () Bool)

(assert (=> b!597291 m!574213))

(assert (=> b!597291 m!574205))

(declare-fun m!574215 () Bool)

(assert (=> b!597291 m!574215))

(assert (=> b!597141 d!86625))

(declare-fun b!597305 () Bool)

(declare-fun e!341312 () SeekEntryResult!6217)

(assert (=> b!597305 (= e!341312 (Found!6217 index!984))))

(declare-fun b!597306 () Bool)

(declare-fun e!341313 () SeekEntryResult!6217)

(assert (=> b!597306 (= e!341313 Undefined!6217)))

(declare-fun b!597307 () Bool)

(declare-fun c!67552 () Bool)

(declare-fun lt!271263 () (_ BitVec 64))

(assert (=> b!597307 (= c!67552 (= lt!271263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341311 () SeekEntryResult!6217)

(assert (=> b!597307 (= e!341312 e!341311)))

(declare-fun b!597308 () Bool)

(assert (=> b!597308 (= e!341311 (MissingVacant!6217 vacantSpotIndex!68))))

(declare-fun b!597309 () Bool)

(assert (=> b!597309 (= e!341311 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!86627 () Bool)

(declare-fun lt!271264 () SeekEntryResult!6217)

(get-info :version)

(assert (=> d!86627 (and (or ((_ is Undefined!6217) lt!271264) (not ((_ is Found!6217) lt!271264)) (and (bvsge (index!27120 lt!271264) #b00000000000000000000000000000000) (bvslt (index!27120 lt!271264) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271264) ((_ is Found!6217) lt!271264) (not ((_ is MissingVacant!6217) lt!271264)) (not (= (index!27122 lt!271264) vacantSpotIndex!68)) (and (bvsge (index!27122 lt!271264) #b00000000000000000000000000000000) (bvslt (index!27122 lt!271264) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271264) (ite ((_ is Found!6217) lt!271264) (= (select (arr!17780 a!2986) (index!27120 lt!271264)) (select (arr!17780 a!2986) j!136)) (and ((_ is MissingVacant!6217) lt!271264) (= (index!27122 lt!271264) vacantSpotIndex!68) (= (select (arr!17780 a!2986) (index!27122 lt!271264)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86627 (= lt!271264 e!341313)))

(declare-fun c!67554 () Bool)

(assert (=> d!86627 (= c!67554 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86627 (= lt!271263 (select (arr!17780 a!2986) index!984))))

(assert (=> d!86627 (validMask!0 mask!3053)))

(assert (=> d!86627 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053) lt!271264)))

(declare-fun b!597310 () Bool)

(assert (=> b!597310 (= e!341313 e!341312)))

(declare-fun c!67553 () Bool)

(assert (=> b!597310 (= c!67553 (= lt!271263 (select (arr!17780 a!2986) j!136)))))

(assert (= (and d!86627 c!67554) b!597306))

(assert (= (and d!86627 (not c!67554)) b!597310))

(assert (= (and b!597310 c!67553) b!597305))

(assert (= (and b!597310 (not c!67553)) b!597307))

(assert (= (and b!597307 c!67552) b!597308))

(assert (= (and b!597307 (not c!67552)) b!597309))

(assert (=> b!597309 m!574067))

(assert (=> b!597309 m!574067))

(assert (=> b!597309 m!574033))

(declare-fun m!574217 () Bool)

(assert (=> b!597309 m!574217))

(declare-fun m!574219 () Bool)

(assert (=> d!86627 m!574219))

(declare-fun m!574221 () Bool)

(assert (=> d!86627 m!574221))

(assert (=> d!86627 m!574085))

(assert (=> d!86627 m!574057))

(assert (=> b!597140 d!86627))

(declare-fun d!86629 () Bool)

(declare-fun res!382935 () Bool)

(declare-fun e!341314 () Bool)

(assert (=> d!86629 (=> res!382935 e!341314)))

(assert (=> d!86629 (= res!382935 (= (select (arr!17780 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86629 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341314)))

(declare-fun b!597311 () Bool)

(declare-fun e!341315 () Bool)

(assert (=> b!597311 (= e!341314 e!341315)))

(declare-fun res!382936 () Bool)

(assert (=> b!597311 (=> (not res!382936) (not e!341315))))

(assert (=> b!597311 (= res!382936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18145 a!2986)))))

(declare-fun b!597312 () Bool)

(assert (=> b!597312 (= e!341315 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86629 (not res!382935)) b!597311))

(assert (= (and b!597311 res!382936) b!597312))

(assert (=> d!86629 m!574205))

(declare-fun m!574223 () Bool)

(assert (=> b!597312 m!574223))

(assert (=> b!597150 d!86629))

(declare-fun d!86631 () Bool)

(assert (=> d!86631 (= (validKeyInArray!0 (select (arr!17780 a!2986) j!136)) (and (not (= (select (arr!17780 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17780 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597139 d!86631))

(declare-fun b!597313 () Bool)

(declare-fun e!341317 () SeekEntryResult!6217)

(assert (=> b!597313 (= e!341317 (Found!6217 index!984))))

(declare-fun b!597314 () Bool)

(declare-fun e!341318 () SeekEntryResult!6217)

(assert (=> b!597314 (= e!341318 Undefined!6217)))

(declare-fun b!597315 () Bool)

(declare-fun c!67555 () Bool)

(declare-fun lt!271265 () (_ BitVec 64))

(assert (=> b!597315 (= c!67555 (= lt!271265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341316 () SeekEntryResult!6217)

(assert (=> b!597315 (= e!341317 e!341316)))

(declare-fun b!597316 () Bool)

(assert (=> b!597316 (= e!341316 (MissingVacant!6217 vacantSpotIndex!68))))

(declare-fun b!597317 () Bool)

(assert (=> b!597317 (= e!341316 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271174 lt!271171 mask!3053))))

(declare-fun d!86633 () Bool)

(declare-fun lt!271266 () SeekEntryResult!6217)

(assert (=> d!86633 (and (or ((_ is Undefined!6217) lt!271266) (not ((_ is Found!6217) lt!271266)) (and (bvsge (index!27120 lt!271266) #b00000000000000000000000000000000) (bvslt (index!27120 lt!271266) (size!18145 lt!271171)))) (or ((_ is Undefined!6217) lt!271266) ((_ is Found!6217) lt!271266) (not ((_ is MissingVacant!6217) lt!271266)) (not (= (index!27122 lt!271266) vacantSpotIndex!68)) (and (bvsge (index!27122 lt!271266) #b00000000000000000000000000000000) (bvslt (index!27122 lt!271266) (size!18145 lt!271171)))) (or ((_ is Undefined!6217) lt!271266) (ite ((_ is Found!6217) lt!271266) (= (select (arr!17780 lt!271171) (index!27120 lt!271266)) lt!271174) (and ((_ is MissingVacant!6217) lt!271266) (= (index!27122 lt!271266) vacantSpotIndex!68) (= (select (arr!17780 lt!271171) (index!27122 lt!271266)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86633 (= lt!271266 e!341318)))

(declare-fun c!67557 () Bool)

(assert (=> d!86633 (= c!67557 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86633 (= lt!271265 (select (arr!17780 lt!271171) index!984))))

(assert (=> d!86633 (validMask!0 mask!3053)))

(assert (=> d!86633 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271174 lt!271171 mask!3053) lt!271266)))

(declare-fun b!597318 () Bool)

(assert (=> b!597318 (= e!341318 e!341317)))

(declare-fun c!67556 () Bool)

(assert (=> b!597318 (= c!67556 (= lt!271265 lt!271174))))

(assert (= (and d!86633 c!67557) b!597314))

(assert (= (and d!86633 (not c!67557)) b!597318))

(assert (= (and b!597318 c!67556) b!597313))

(assert (= (and b!597318 (not c!67556)) b!597315))

(assert (= (and b!597315 c!67555) b!597316))

(assert (= (and b!597315 (not c!67555)) b!597317))

(assert (=> b!597317 m!574067))

(assert (=> b!597317 m!574067))

(declare-fun m!574225 () Bool)

(assert (=> b!597317 m!574225))

(declare-fun m!574227 () Bool)

(assert (=> d!86633 m!574227))

(declare-fun m!574229 () Bool)

(assert (=> d!86633 m!574229))

(assert (=> d!86633 m!574201))

(assert (=> d!86633 m!574057))

(assert (=> b!597138 d!86633))

(declare-fun d!86635 () Bool)

(declare-fun e!341321 () Bool)

(assert (=> d!86635 e!341321))

(declare-fun res!382939 () Bool)

(assert (=> d!86635 (=> (not res!382939) (not e!341321))))

(assert (=> d!86635 (= res!382939 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18145 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18145 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18145 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986))))))

(declare-fun lt!271269 () Unit!18780)

(declare-fun choose!9 (array!37035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18780)

(assert (=> d!86635 (= lt!271269 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86635 (validMask!0 mask!3053)))

(assert (=> d!86635 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 mask!3053) lt!271269)))

(declare-fun b!597321 () Bool)

(assert (=> b!597321 (= e!341321 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 (select (store (arr!17780 a!2986) i!1108 k0!1786) j!136) (array!37036 (store (arr!17780 a!2986) i!1108 k0!1786) (size!18145 a!2986)) mask!3053)))))

(assert (= (and d!86635 res!382939) b!597321))

(declare-fun m!574231 () Bool)

(assert (=> d!86635 m!574231))

(assert (=> d!86635 m!574057))

(assert (=> b!597321 m!574033))

(assert (=> b!597321 m!574077))

(assert (=> b!597321 m!574039))

(assert (=> b!597321 m!574069))

(declare-fun m!574233 () Bool)

(assert (=> b!597321 m!574233))

(assert (=> b!597321 m!574069))

(assert (=> b!597321 m!574033))

(assert (=> b!597138 d!86635))

(declare-fun d!86641 () Bool)

(declare-fun lt!271272 () (_ BitVec 32))

(assert (=> d!86641 (and (bvsge lt!271272 #b00000000000000000000000000000000) (bvslt lt!271272 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86641 (= lt!271272 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86641 (validMask!0 mask!3053)))

(assert (=> d!86641 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271272)))

(declare-fun bs!18343 () Bool)

(assert (= bs!18343 d!86641))

(declare-fun m!574235 () Bool)

(assert (=> bs!18343 m!574235))

(assert (=> bs!18343 m!574057))

(assert (=> b!597138 d!86641))

(declare-fun b!597322 () Bool)

(declare-fun e!341323 () SeekEntryResult!6217)

(assert (=> b!597322 (= e!341323 (Found!6217 lt!271172))))

(declare-fun b!597323 () Bool)

(declare-fun e!341324 () SeekEntryResult!6217)

(assert (=> b!597323 (= e!341324 Undefined!6217)))

(declare-fun b!597324 () Bool)

(declare-fun c!67558 () Bool)

(declare-fun lt!271273 () (_ BitVec 64))

(assert (=> b!597324 (= c!67558 (= lt!271273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341322 () SeekEntryResult!6217)

(assert (=> b!597324 (= e!341323 e!341322)))

(declare-fun b!597325 () Bool)

(assert (=> b!597325 (= e!341322 (MissingVacant!6217 vacantSpotIndex!68))))

(declare-fun b!597326 () Bool)

(assert (=> b!597326 (= e!341322 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271172 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271174 lt!271171 mask!3053))))

(declare-fun d!86643 () Bool)

(declare-fun lt!271274 () SeekEntryResult!6217)

(assert (=> d!86643 (and (or ((_ is Undefined!6217) lt!271274) (not ((_ is Found!6217) lt!271274)) (and (bvsge (index!27120 lt!271274) #b00000000000000000000000000000000) (bvslt (index!27120 lt!271274) (size!18145 lt!271171)))) (or ((_ is Undefined!6217) lt!271274) ((_ is Found!6217) lt!271274) (not ((_ is MissingVacant!6217) lt!271274)) (not (= (index!27122 lt!271274) vacantSpotIndex!68)) (and (bvsge (index!27122 lt!271274) #b00000000000000000000000000000000) (bvslt (index!27122 lt!271274) (size!18145 lt!271171)))) (or ((_ is Undefined!6217) lt!271274) (ite ((_ is Found!6217) lt!271274) (= (select (arr!17780 lt!271171) (index!27120 lt!271274)) lt!271174) (and ((_ is MissingVacant!6217) lt!271274) (= (index!27122 lt!271274) vacantSpotIndex!68) (= (select (arr!17780 lt!271171) (index!27122 lt!271274)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86643 (= lt!271274 e!341324)))

(declare-fun c!67560 () Bool)

(assert (=> d!86643 (= c!67560 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86643 (= lt!271273 (select (arr!17780 lt!271171) lt!271172))))

(assert (=> d!86643 (validMask!0 mask!3053)))

(assert (=> d!86643 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 lt!271174 lt!271171 mask!3053) lt!271274)))

(declare-fun b!597327 () Bool)

(assert (=> b!597327 (= e!341324 e!341323)))

(declare-fun c!67559 () Bool)

(assert (=> b!597327 (= c!67559 (= lt!271273 lt!271174))))

(assert (= (and d!86643 c!67560) b!597323))

(assert (= (and d!86643 (not c!67560)) b!597327))

(assert (= (and b!597327 c!67559) b!597322))

(assert (= (and b!597327 (not c!67559)) b!597324))

(assert (= (and b!597324 c!67558) b!597325))

(assert (= (and b!597324 (not c!67558)) b!597326))

(declare-fun m!574237 () Bool)

(assert (=> b!597326 m!574237))

(assert (=> b!597326 m!574237))

(declare-fun m!574239 () Bool)

(assert (=> b!597326 m!574239))

(declare-fun m!574241 () Bool)

(assert (=> d!86643 m!574241))

(declare-fun m!574243 () Bool)

(assert (=> d!86643 m!574243))

(declare-fun m!574245 () Bool)

(assert (=> d!86643 m!574245))

(assert (=> d!86643 m!574057))

(assert (=> b!597138 d!86643))

(declare-fun b!597328 () Bool)

(declare-fun e!341326 () SeekEntryResult!6217)

(assert (=> b!597328 (= e!341326 (Found!6217 lt!271172))))

(declare-fun b!597329 () Bool)

(declare-fun e!341327 () SeekEntryResult!6217)

(assert (=> b!597329 (= e!341327 Undefined!6217)))

(declare-fun b!597330 () Bool)

(declare-fun c!67561 () Bool)

(declare-fun lt!271275 () (_ BitVec 64))

(assert (=> b!597330 (= c!67561 (= lt!271275 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341325 () SeekEntryResult!6217)

(assert (=> b!597330 (= e!341326 e!341325)))

(declare-fun b!597331 () Bool)

(assert (=> b!597331 (= e!341325 (MissingVacant!6217 vacantSpotIndex!68))))

(declare-fun b!597332 () Bool)

(assert (=> b!597332 (= e!341325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271172 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!86645 () Bool)

(declare-fun lt!271276 () SeekEntryResult!6217)

(assert (=> d!86645 (and (or ((_ is Undefined!6217) lt!271276) (not ((_ is Found!6217) lt!271276)) (and (bvsge (index!27120 lt!271276) #b00000000000000000000000000000000) (bvslt (index!27120 lt!271276) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271276) ((_ is Found!6217) lt!271276) (not ((_ is MissingVacant!6217) lt!271276)) (not (= (index!27122 lt!271276) vacantSpotIndex!68)) (and (bvsge (index!27122 lt!271276) #b00000000000000000000000000000000) (bvslt (index!27122 lt!271276) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271276) (ite ((_ is Found!6217) lt!271276) (= (select (arr!17780 a!2986) (index!27120 lt!271276)) (select (arr!17780 a!2986) j!136)) (and ((_ is MissingVacant!6217) lt!271276) (= (index!27122 lt!271276) vacantSpotIndex!68) (= (select (arr!17780 a!2986) (index!27122 lt!271276)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86645 (= lt!271276 e!341327)))

(declare-fun c!67563 () Bool)

(assert (=> d!86645 (= c!67563 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86645 (= lt!271275 (select (arr!17780 a!2986) lt!271172))))

(assert (=> d!86645 (validMask!0 mask!3053)))

(assert (=> d!86645 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271172 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053) lt!271276)))

(declare-fun b!597333 () Bool)

(assert (=> b!597333 (= e!341327 e!341326)))

(declare-fun c!67562 () Bool)

(assert (=> b!597333 (= c!67562 (= lt!271275 (select (arr!17780 a!2986) j!136)))))

(assert (= (and d!86645 c!67563) b!597329))

(assert (= (and d!86645 (not c!67563)) b!597333))

(assert (= (and b!597333 c!67562) b!597328))

(assert (= (and b!597333 (not c!67562)) b!597330))

(assert (= (and b!597330 c!67561) b!597331))

(assert (= (and b!597330 (not c!67561)) b!597332))

(assert (=> b!597332 m!574237))

(assert (=> b!597332 m!574237))

(assert (=> b!597332 m!574033))

(declare-fun m!574247 () Bool)

(assert (=> b!597332 m!574247))

(declare-fun m!574249 () Bool)

(assert (=> d!86645 m!574249))

(declare-fun m!574251 () Bool)

(assert (=> d!86645 m!574251))

(declare-fun m!574253 () Bool)

(assert (=> d!86645 m!574253))

(assert (=> d!86645 m!574057))

(assert (=> b!597138 d!86645))

(declare-fun d!86647 () Bool)

(declare-fun res!382947 () Bool)

(declare-fun e!341354 () Bool)

(assert (=> d!86647 (=> res!382947 e!341354)))

(assert (=> d!86647 (= res!382947 (bvsge #b00000000000000000000000000000000 (size!18145 a!2986)))))

(assert (=> d!86647 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11857) e!341354)))

(declare-fun b!597374 () Bool)

(declare-fun e!341351 () Bool)

(declare-fun e!341353 () Bool)

(assert (=> b!597374 (= e!341351 e!341353)))

(declare-fun c!67581 () Bool)

(assert (=> b!597374 (= c!67581 (validKeyInArray!0 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32902 () Bool)

(declare-fun call!32905 () Bool)

(assert (=> bm!32902 (= call!32905 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67581 (Cons!11856 (select (arr!17780 a!2986) #b00000000000000000000000000000000) Nil!11857) Nil!11857)))))

(declare-fun b!597375 () Bool)

(assert (=> b!597375 (= e!341353 call!32905)))

(declare-fun b!597376 () Bool)

(assert (=> b!597376 (= e!341354 e!341351)))

(declare-fun res!382948 () Bool)

(assert (=> b!597376 (=> (not res!382948) (not e!341351))))

(declare-fun e!341352 () Bool)

(assert (=> b!597376 (= res!382948 (not e!341352))))

(declare-fun res!382946 () Bool)

(assert (=> b!597376 (=> (not res!382946) (not e!341352))))

(assert (=> b!597376 (= res!382946 (validKeyInArray!0 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597377 () Bool)

(declare-fun contains!2941 (List!11860 (_ BitVec 64)) Bool)

(assert (=> b!597377 (= e!341352 (contains!2941 Nil!11857 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597378 () Bool)

(assert (=> b!597378 (= e!341353 call!32905)))

(assert (= (and d!86647 (not res!382947)) b!597376))

(assert (= (and b!597376 res!382946) b!597377))

(assert (= (and b!597376 res!382948) b!597374))

(assert (= (and b!597374 c!67581) b!597378))

(assert (= (and b!597374 (not c!67581)) b!597375))

(assert (= (or b!597378 b!597375) bm!32902))

(assert (=> b!597374 m!574205))

(assert (=> b!597374 m!574205))

(assert (=> b!597374 m!574207))

(assert (=> bm!32902 m!574205))

(declare-fun m!574265 () Bool)

(assert (=> bm!32902 m!574265))

(assert (=> b!597376 m!574205))

(assert (=> b!597376 m!574205))

(assert (=> b!597376 m!574207))

(assert (=> b!597377 m!574205))

(assert (=> b!597377 m!574205))

(declare-fun m!574267 () Bool)

(assert (=> b!597377 m!574267))

(assert (=> b!597137 d!86647))

(declare-fun d!86651 () Bool)

(declare-fun res!382950 () Bool)

(declare-fun e!341358 () Bool)

(assert (=> d!86651 (=> res!382950 e!341358)))

(assert (=> d!86651 (= res!382950 (bvsge #b00000000000000000000000000000000 (size!18145 lt!271171)))))

(assert (=> d!86651 (= (arrayNoDuplicates!0 lt!271171 #b00000000000000000000000000000000 Nil!11857) e!341358)))

(declare-fun b!597379 () Bool)

(declare-fun e!341355 () Bool)

(declare-fun e!341357 () Bool)

(assert (=> b!597379 (= e!341355 e!341357)))

(declare-fun c!67582 () Bool)

(assert (=> b!597379 (= c!67582 (validKeyInArray!0 (select (arr!17780 lt!271171) #b00000000000000000000000000000000)))))

(declare-fun bm!32903 () Bool)

(declare-fun call!32906 () Bool)

(assert (=> bm!32903 (= call!32906 (arrayNoDuplicates!0 lt!271171 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67582 (Cons!11856 (select (arr!17780 lt!271171) #b00000000000000000000000000000000) Nil!11857) Nil!11857)))))

(declare-fun b!597380 () Bool)

(assert (=> b!597380 (= e!341357 call!32906)))

(declare-fun b!597381 () Bool)

(assert (=> b!597381 (= e!341358 e!341355)))

(declare-fun res!382951 () Bool)

(assert (=> b!597381 (=> (not res!382951) (not e!341355))))

(declare-fun e!341356 () Bool)

(assert (=> b!597381 (= res!382951 (not e!341356))))

(declare-fun res!382949 () Bool)

(assert (=> b!597381 (=> (not res!382949) (not e!341356))))

(assert (=> b!597381 (= res!382949 (validKeyInArray!0 (select (arr!17780 lt!271171) #b00000000000000000000000000000000)))))

(declare-fun b!597382 () Bool)

(assert (=> b!597382 (= e!341356 (contains!2941 Nil!11857 (select (arr!17780 lt!271171) #b00000000000000000000000000000000)))))

(declare-fun b!597383 () Bool)

(assert (=> b!597383 (= e!341357 call!32906)))

(assert (= (and d!86651 (not res!382950)) b!597381))

(assert (= (and b!597381 res!382949) b!597382))

(assert (= (and b!597381 res!382951) b!597379))

(assert (= (and b!597379 c!67582) b!597383))

(assert (= (and b!597379 (not c!67582)) b!597380))

(assert (= (or b!597383 b!597380) bm!32903))

(declare-fun m!574269 () Bool)

(assert (=> b!597379 m!574269))

(assert (=> b!597379 m!574269))

(declare-fun m!574271 () Bool)

(assert (=> b!597379 m!574271))

(assert (=> bm!32903 m!574269))

(declare-fun m!574273 () Bool)

(assert (=> bm!32903 m!574273))

(assert (=> b!597381 m!574269))

(assert (=> b!597381 m!574269))

(assert (=> b!597381 m!574271))

(assert (=> b!597382 m!574269))

(assert (=> b!597382 m!574269))

(declare-fun m!574275 () Bool)

(assert (=> b!597382 m!574275))

(assert (=> b!597147 d!86651))

(declare-fun d!86653 () Bool)

(declare-fun e!341376 () Bool)

(assert (=> d!86653 e!341376))

(declare-fun res!382960 () Bool)

(assert (=> d!86653 (=> (not res!382960) (not e!341376))))

(assert (=> d!86653 (= res!382960 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986))))))

(declare-fun lt!271298 () Unit!18780)

(declare-fun choose!41 (array!37035 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11860) Unit!18780)

(assert (=> d!86653 (= lt!271298 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11857))))

(assert (=> d!86653 (bvslt (size!18145 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86653 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11857) lt!271298)))

(declare-fun b!597410 () Bool)

(assert (=> b!597410 (= e!341376 (arrayNoDuplicates!0 (array!37036 (store (arr!17780 a!2986) i!1108 k0!1786) (size!18145 a!2986)) #b00000000000000000000000000000000 Nil!11857))))

(assert (= (and d!86653 res!382960) b!597410))

(declare-fun m!574307 () Bool)

(assert (=> d!86653 m!574307))

(assert (=> b!597410 m!574039))

(declare-fun m!574309 () Bool)

(assert (=> b!597410 m!574309))

(assert (=> b!597147 d!86653))

(declare-fun d!86665 () Bool)

(declare-fun res!382961 () Bool)

(declare-fun e!341377 () Bool)

(assert (=> d!86665 (=> res!382961 e!341377)))

(assert (=> d!86665 (= res!382961 (= (select (arr!17780 lt!271171) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17780 a!2986) j!136)))))

(assert (=> d!86665 (= (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341377)))

(declare-fun b!597411 () Bool)

(declare-fun e!341378 () Bool)

(assert (=> b!597411 (= e!341377 e!341378)))

(declare-fun res!382962 () Bool)

(assert (=> b!597411 (=> (not res!382962) (not e!341378))))

(assert (=> b!597411 (= res!382962 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18145 lt!271171)))))

(declare-fun b!597412 () Bool)

(assert (=> b!597412 (= e!341378 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86665 (not res!382961)) b!597411))

(assert (= (and b!597411 res!382962) b!597412))

(declare-fun m!574311 () Bool)

(assert (=> d!86665 m!574311))

(assert (=> b!597412 m!574033))

(declare-fun m!574313 () Bool)

(assert (=> b!597412 m!574313))

(assert (=> b!597147 d!86665))

(declare-fun d!86667 () Bool)

(assert (=> d!86667 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271306 () Unit!18780)

(declare-fun choose!114 (array!37035 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18780)

(assert (=> d!86667 (= lt!271306 (choose!114 lt!271171 (select (arr!17780 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86667 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86667 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271171 (select (arr!17780 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271306)))

(declare-fun bs!18346 () Bool)

(assert (= bs!18346 d!86667))

(assert (=> bs!18346 m!574033))

(assert (=> bs!18346 m!574047))

(assert (=> bs!18346 m!574033))

(declare-fun m!574323 () Bool)

(assert (=> bs!18346 m!574323))

(assert (=> b!597147 d!86667))

(declare-fun d!86671 () Bool)

(declare-fun res!382967 () Bool)

(declare-fun e!341389 () Bool)

(assert (=> d!86671 (=> res!382967 e!341389)))

(assert (=> d!86671 (= res!382967 ((_ is Nil!11857) Nil!11857))))

(assert (=> d!86671 (= (noDuplicate!275 Nil!11857) e!341389)))

(declare-fun b!597429 () Bool)

(declare-fun e!341390 () Bool)

(assert (=> b!597429 (= e!341389 e!341390)))

(declare-fun res!382968 () Bool)

(assert (=> b!597429 (=> (not res!382968) (not e!341390))))

(assert (=> b!597429 (= res!382968 (not (contains!2941 (t!18079 Nil!11857) (h!12901 Nil!11857))))))

(declare-fun b!597430 () Bool)

(assert (=> b!597430 (= e!341390 (noDuplicate!275 (t!18079 Nil!11857)))))

(assert (= (and d!86671 (not res!382967)) b!597429))

(assert (= (and b!597429 res!382968) b!597430))

(declare-fun m!574335 () Bool)

(assert (=> b!597429 m!574335))

(declare-fun m!574337 () Bool)

(assert (=> b!597430 m!574337))

(assert (=> b!597136 d!86671))

(declare-fun d!86677 () Bool)

(declare-fun res!382969 () Bool)

(declare-fun e!341391 () Bool)

(assert (=> d!86677 (=> res!382969 e!341391)))

(assert (=> d!86677 (= res!382969 (= (select (arr!17780 lt!271171) j!136) (select (arr!17780 a!2986) j!136)))))

(assert (=> d!86677 (= (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) j!136) e!341391)))

(declare-fun b!597431 () Bool)

(declare-fun e!341392 () Bool)

(assert (=> b!597431 (= e!341391 e!341392)))

(declare-fun res!382970 () Bool)

(assert (=> b!597431 (=> (not res!382970) (not e!341392))))

(assert (=> b!597431 (= res!382970 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18145 lt!271171)))))

(declare-fun b!597432 () Bool)

(assert (=> b!597432 (= e!341392 (arrayContainsKey!0 lt!271171 (select (arr!17780 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86677 (not res!382969)) b!597431))

(assert (= (and b!597431 res!382970) b!597432))

(declare-fun m!574339 () Bool)

(assert (=> d!86677 m!574339))

(assert (=> b!597432 m!574033))

(declare-fun m!574341 () Bool)

(assert (=> b!597432 m!574341))

(assert (=> b!597135 d!86677))

(declare-fun d!86679 () Bool)

(assert (=> d!86679 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597145 d!86679))

(declare-fun d!86681 () Bool)

(assert (=> d!86681 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54630 d!86681))

(declare-fun d!86687 () Bool)

(assert (=> d!86687 (= (array_inv!13663 a!2986) (bvsge (size!18145 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54630 d!86687))

(declare-fun b!597469 () Bool)

(declare-fun c!67615 () Bool)

(declare-fun lt!271331 () (_ BitVec 64))

(assert (=> b!597469 (= c!67615 (= lt!271331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341414 () SeekEntryResult!6217)

(declare-fun e!341416 () SeekEntryResult!6217)

(assert (=> b!597469 (= e!341414 e!341416)))

(declare-fun b!597470 () Bool)

(declare-fun lt!271330 () SeekEntryResult!6217)

(assert (=> b!597470 (= e!341416 (seekKeyOrZeroReturnVacant!0 (x!55929 lt!271330) (index!27121 lt!271330) (index!27121 lt!271330) k0!1786 a!2986 mask!3053))))

(declare-fun b!597472 () Bool)

(declare-fun e!341415 () SeekEntryResult!6217)

(assert (=> b!597472 (= e!341415 Undefined!6217)))

(declare-fun b!597473 () Bool)

(assert (=> b!597473 (= e!341416 (MissingZero!6217 (index!27121 lt!271330)))))

(declare-fun b!597474 () Bool)

(assert (=> b!597474 (= e!341415 e!341414)))

(assert (=> b!597474 (= lt!271331 (select (arr!17780 a!2986) (index!27121 lt!271330)))))

(declare-fun c!67614 () Bool)

(assert (=> b!597474 (= c!67614 (= lt!271331 k0!1786))))

(declare-fun b!597471 () Bool)

(assert (=> b!597471 (= e!341414 (Found!6217 (index!27121 lt!271330)))))

(declare-fun d!86689 () Bool)

(declare-fun lt!271329 () SeekEntryResult!6217)

(assert (=> d!86689 (and (or ((_ is Undefined!6217) lt!271329) (not ((_ is Found!6217) lt!271329)) (and (bvsge (index!27120 lt!271329) #b00000000000000000000000000000000) (bvslt (index!27120 lt!271329) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271329) ((_ is Found!6217) lt!271329) (not ((_ is MissingZero!6217) lt!271329)) (and (bvsge (index!27119 lt!271329) #b00000000000000000000000000000000) (bvslt (index!27119 lt!271329) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271329) ((_ is Found!6217) lt!271329) ((_ is MissingZero!6217) lt!271329) (not ((_ is MissingVacant!6217) lt!271329)) (and (bvsge (index!27122 lt!271329) #b00000000000000000000000000000000) (bvslt (index!27122 lt!271329) (size!18145 a!2986)))) (or ((_ is Undefined!6217) lt!271329) (ite ((_ is Found!6217) lt!271329) (= (select (arr!17780 a!2986) (index!27120 lt!271329)) k0!1786) (ite ((_ is MissingZero!6217) lt!271329) (= (select (arr!17780 a!2986) (index!27119 lt!271329)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6217) lt!271329) (= (select (arr!17780 a!2986) (index!27122 lt!271329)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86689 (= lt!271329 e!341415)))

(declare-fun c!67613 () Bool)

(assert (=> d!86689 (= c!67613 (and ((_ is Intermediate!6217) lt!271330) (undefined!7029 lt!271330)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37035 (_ BitVec 32)) SeekEntryResult!6217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86689 (= lt!271330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86689 (validMask!0 mask!3053)))

(assert (=> d!86689 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271329)))

(assert (= (and d!86689 c!67613) b!597472))

(assert (= (and d!86689 (not c!67613)) b!597474))

(assert (= (and b!597474 c!67614) b!597471))

(assert (= (and b!597474 (not c!67614)) b!597469))

(assert (= (and b!597469 c!67615) b!597473))

(assert (= (and b!597469 (not c!67615)) b!597470))

(declare-fun m!574359 () Bool)

(assert (=> b!597470 m!574359))

(declare-fun m!574361 () Bool)

(assert (=> b!597474 m!574361))

(declare-fun m!574363 () Bool)

(assert (=> d!86689 m!574363))

(declare-fun m!574365 () Bool)

(assert (=> d!86689 m!574365))

(assert (=> d!86689 m!574363))

(declare-fun m!574367 () Bool)

(assert (=> d!86689 m!574367))

(declare-fun m!574369 () Bool)

(assert (=> d!86689 m!574369))

(declare-fun m!574371 () Bool)

(assert (=> d!86689 m!574371))

(assert (=> d!86689 m!574057))

(assert (=> b!597143 d!86689))

(check-sat (not bm!32899) (not b!597470) (not b!597291) (not b!597430) (not bm!32902) (not d!86667) (not d!86641) (not d!86645) (not b!597317) (not b!597410) (not b!597312) (not d!86689) (not d!86635) (not b!597309) (not d!86643) (not b!597381) (not b!597374) (not b!597382) (not b!597379) (not b!597377) (not b!597332) (not d!86627) (not d!86633) (not b!597321) (not d!86653) (not b!597280) (not b!597412) (not b!597326) (not b!597376) (not b!597290) (not b!597432) (not b!597429) (not bm!32903))
(check-sat)
