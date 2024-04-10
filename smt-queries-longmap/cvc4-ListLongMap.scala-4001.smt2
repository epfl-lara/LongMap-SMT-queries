; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54266 () Bool)

(assert start!54266)

(declare-fun b!593114 () Bool)

(declare-datatypes ((Unit!18618 0))(
  ( (Unit!18619) )
))
(declare-fun e!338756 () Unit!18618)

(declare-fun Unit!18620 () Unit!18618)

(assert (=> b!593114 (= e!338756 Unit!18620)))

(declare-fun b!593115 () Bool)

(declare-fun e!338759 () Bool)

(declare-fun e!338753 () Bool)

(assert (=> b!593115 (= e!338759 e!338753)))

(declare-fun res!379721 () Bool)

(assert (=> b!593115 (=> (not res!379721) (not e!338753))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36933 0))(
  ( (array!36934 (arr!17735 (Array (_ BitVec 32) (_ BitVec 64))) (size!18099 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36933)

(assert (=> b!593115 (= res!379721 (= (select (store (arr!17735 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!269283 () array!36933)

(assert (=> b!593115 (= lt!269283 (array!36934 (store (arr!17735 a!2986) i!1108 k!1786) (size!18099 a!2986)))))

(declare-fun b!593116 () Bool)

(declare-fun res!379723 () Bool)

(declare-fun e!338754 () Bool)

(assert (=> b!593116 (=> (not res!379723) (not e!338754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593116 (= res!379723 (validKeyInArray!0 k!1786))))

(declare-fun b!593117 () Bool)

(declare-fun e!338762 () Bool)

(declare-fun e!338758 () Bool)

(assert (=> b!593117 (= e!338762 (not e!338758))))

(declare-fun res!379708 () Bool)

(assert (=> b!593117 (=> res!379708 e!338758)))

(declare-datatypes ((SeekEntryResult!6175 0))(
  ( (MissingZero!6175 (index!26939 (_ BitVec 32))) (Found!6175 (index!26940 (_ BitVec 32))) (Intermediate!6175 (undefined!6987 Bool) (index!26941 (_ BitVec 32)) (x!55728 (_ BitVec 32))) (Undefined!6175) (MissingVacant!6175 (index!26942 (_ BitVec 32))) )
))
(declare-fun lt!269281 () SeekEntryResult!6175)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593117 (= res!379708 (not (= lt!269281 (Found!6175 index!984))))))

(declare-fun lt!269276 () Unit!18618)

(assert (=> b!593117 (= lt!269276 e!338756)))

(declare-fun c!67070 () Bool)

(assert (=> b!593117 (= c!67070 (= lt!269281 Undefined!6175))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!269275 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36933 (_ BitVec 32)) SeekEntryResult!6175)

(assert (=> b!593117 (= lt!269281 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269275 lt!269283 mask!3053))))

(declare-fun e!338755 () Bool)

(assert (=> b!593117 e!338755))

(declare-fun res!379717 () Bool)

(assert (=> b!593117 (=> (not res!379717) (not e!338755))))

(declare-fun lt!269277 () (_ BitVec 32))

(declare-fun lt!269279 () SeekEntryResult!6175)

(assert (=> b!593117 (= res!379717 (= lt!269279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269277 vacantSpotIndex!68 lt!269275 lt!269283 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!593117 (= lt!269279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269277 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593117 (= lt!269275 (select (store (arr!17735 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269280 () Unit!18618)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36933 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18618)

(assert (=> b!593117 (= lt!269280 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269277 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593117 (= lt!269277 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593118 () Bool)

(declare-fun res!379713 () Bool)

(assert (=> b!593118 (=> (not res!379713) (not e!338759))))

(declare-datatypes ((List!11776 0))(
  ( (Nil!11773) (Cons!11772 (h!12817 (_ BitVec 64)) (t!18004 List!11776)) )
))
(declare-fun arrayNoDuplicates!0 (array!36933 (_ BitVec 32) List!11776) Bool)

(assert (=> b!593118 (= res!379713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11773))))

(declare-fun b!593119 () Bool)

(declare-fun res!379711 () Bool)

(assert (=> b!593119 (=> (not res!379711) (not e!338754))))

(assert (=> b!593119 (= res!379711 (validKeyInArray!0 (select (arr!17735 a!2986) j!136)))))

(declare-fun b!593120 () Bool)

(declare-fun e!338752 () Bool)

(assert (=> b!593120 (= e!338758 e!338752)))

(declare-fun res!379716 () Bool)

(assert (=> b!593120 (=> res!379716 e!338752)))

(declare-fun lt!269278 () (_ BitVec 64))

(assert (=> b!593120 (= res!379716 (or (not (= (select (arr!17735 a!2986) j!136) lt!269275)) (not (= (select (arr!17735 a!2986) j!136) lt!269278)) (bvsge j!136 index!984)))))

(declare-fun e!338760 () Bool)

(assert (=> b!593120 e!338760))

(declare-fun res!379722 () Bool)

(assert (=> b!593120 (=> (not res!379722) (not e!338760))))

(assert (=> b!593120 (= res!379722 (= lt!269278 (select (arr!17735 a!2986) j!136)))))

(assert (=> b!593120 (= lt!269278 (select (store (arr!17735 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!593121 () Bool)

(declare-fun res!379715 () Bool)

(assert (=> b!593121 (=> (not res!379715) (not e!338759))))

(assert (=> b!593121 (= res!379715 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17735 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593122 () Bool)

(declare-fun e!338757 () Bool)

(assert (=> b!593122 (= e!338760 e!338757)))

(declare-fun res!379714 () Bool)

(assert (=> b!593122 (=> res!379714 e!338757)))

(assert (=> b!593122 (= res!379714 (or (not (= (select (arr!17735 a!2986) j!136) lt!269275)) (not (= (select (arr!17735 a!2986) j!136) lt!269278)) (bvsge j!136 index!984)))))

(declare-fun b!593123 () Bool)

(declare-fun res!379724 () Bool)

(assert (=> b!593123 (=> (not res!379724) (not e!338754))))

(assert (=> b!593123 (= res!379724 (and (= (size!18099 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18099 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18099 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593124 () Bool)

(declare-fun res!379718 () Bool)

(assert (=> b!593124 (=> (not res!379718) (not e!338759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36933 (_ BitVec 32)) Bool)

(assert (=> b!593124 (= res!379718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!338763 () Bool)

(declare-fun b!593125 () Bool)

(declare-fun arrayContainsKey!0 (array!36933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593125 (= e!338763 (arrayContainsKey!0 lt!269283 (select (arr!17735 a!2986) j!136) index!984))))

(declare-fun b!593127 () Bool)

(assert (=> b!593127 (= e!338757 e!338763)))

(declare-fun res!379720 () Bool)

(assert (=> b!593127 (=> (not res!379720) (not e!338763))))

(assert (=> b!593127 (= res!379720 (arrayContainsKey!0 lt!269283 (select (arr!17735 a!2986) j!136) j!136))))

(declare-fun b!593128 () Bool)

(declare-fun lt!269274 () SeekEntryResult!6175)

(assert (=> b!593128 (= e!338755 (= lt!269274 lt!269279))))

(declare-fun b!593129 () Bool)

(declare-fun res!379709 () Bool)

(assert (=> b!593129 (=> (not res!379709) (not e!338754))))

(assert (=> b!593129 (= res!379709 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593130 () Bool)

(assert (=> b!593130 (= e!338752 (or (bvsgt #b00000000000000000000000000000000 (size!18099 a!2986)) (bvslt (size!18099 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593130 (arrayContainsKey!0 lt!269283 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269282 () Unit!18618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36933 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18618)

(assert (=> b!593130 (= lt!269282 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269283 (select (arr!17735 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593131 () Bool)

(assert (=> b!593131 (= e!338754 e!338759)))

(declare-fun res!379710 () Bool)

(assert (=> b!593131 (=> (not res!379710) (not e!338759))))

(declare-fun lt!269284 () SeekEntryResult!6175)

(assert (=> b!593131 (= res!379710 (or (= lt!269284 (MissingZero!6175 i!1108)) (= lt!269284 (MissingVacant!6175 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36933 (_ BitVec 32)) SeekEntryResult!6175)

(assert (=> b!593131 (= lt!269284 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!593132 () Bool)

(assert (=> b!593132 (= e!338753 e!338762)))

(declare-fun res!379712 () Bool)

(assert (=> b!593132 (=> (not res!379712) (not e!338762))))

(assert (=> b!593132 (= res!379712 (and (= lt!269274 (Found!6175 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17735 a!2986) index!984) (select (arr!17735 a!2986) j!136))) (not (= (select (arr!17735 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593132 (= lt!269274 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!379719 () Bool)

(assert (=> start!54266 (=> (not res!379719) (not e!338754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54266 (= res!379719 (validMask!0 mask!3053))))

(assert (=> start!54266 e!338754))

(assert (=> start!54266 true))

(declare-fun array_inv!13531 (array!36933) Bool)

(assert (=> start!54266 (array_inv!13531 a!2986)))

(declare-fun b!593126 () Bool)

(declare-fun Unit!18621 () Unit!18618)

(assert (=> b!593126 (= e!338756 Unit!18621)))

(assert (=> b!593126 false))

(assert (= (and start!54266 res!379719) b!593123))

(assert (= (and b!593123 res!379724) b!593119))

(assert (= (and b!593119 res!379711) b!593116))

(assert (= (and b!593116 res!379723) b!593129))

(assert (= (and b!593129 res!379709) b!593131))

(assert (= (and b!593131 res!379710) b!593124))

(assert (= (and b!593124 res!379718) b!593118))

(assert (= (and b!593118 res!379713) b!593121))

(assert (= (and b!593121 res!379715) b!593115))

(assert (= (and b!593115 res!379721) b!593132))

(assert (= (and b!593132 res!379712) b!593117))

(assert (= (and b!593117 res!379717) b!593128))

(assert (= (and b!593117 c!67070) b!593126))

(assert (= (and b!593117 (not c!67070)) b!593114))

(assert (= (and b!593117 (not res!379708)) b!593120))

(assert (= (and b!593120 res!379722) b!593122))

(assert (= (and b!593122 (not res!379714)) b!593127))

(assert (= (and b!593127 res!379720) b!593125))

(assert (= (and b!593120 (not res!379716)) b!593130))

(declare-fun m!571133 () Bool)

(assert (=> b!593120 m!571133))

(declare-fun m!571135 () Bool)

(assert (=> b!593120 m!571135))

(declare-fun m!571137 () Bool)

(assert (=> b!593120 m!571137))

(assert (=> b!593127 m!571133))

(assert (=> b!593127 m!571133))

(declare-fun m!571139 () Bool)

(assert (=> b!593127 m!571139))

(declare-fun m!571141 () Bool)

(assert (=> b!593117 m!571141))

(declare-fun m!571143 () Bool)

(assert (=> b!593117 m!571143))

(assert (=> b!593117 m!571133))

(assert (=> b!593117 m!571135))

(declare-fun m!571145 () Bool)

(assert (=> b!593117 m!571145))

(declare-fun m!571147 () Bool)

(assert (=> b!593117 m!571147))

(assert (=> b!593117 m!571133))

(declare-fun m!571149 () Bool)

(assert (=> b!593117 m!571149))

(declare-fun m!571151 () Bool)

(assert (=> b!593117 m!571151))

(declare-fun m!571153 () Bool)

(assert (=> b!593124 m!571153))

(declare-fun m!571155 () Bool)

(assert (=> b!593129 m!571155))

(declare-fun m!571157 () Bool)

(assert (=> b!593131 m!571157))

(declare-fun m!571159 () Bool)

(assert (=> start!54266 m!571159))

(declare-fun m!571161 () Bool)

(assert (=> start!54266 m!571161))

(declare-fun m!571163 () Bool)

(assert (=> b!593116 m!571163))

(assert (=> b!593130 m!571133))

(assert (=> b!593130 m!571133))

(declare-fun m!571165 () Bool)

(assert (=> b!593130 m!571165))

(assert (=> b!593130 m!571133))

(declare-fun m!571167 () Bool)

(assert (=> b!593130 m!571167))

(assert (=> b!593122 m!571133))

(assert (=> b!593119 m!571133))

(assert (=> b!593119 m!571133))

(declare-fun m!571169 () Bool)

(assert (=> b!593119 m!571169))

(declare-fun m!571171 () Bool)

(assert (=> b!593121 m!571171))

(assert (=> b!593125 m!571133))

(assert (=> b!593125 m!571133))

(declare-fun m!571173 () Bool)

(assert (=> b!593125 m!571173))

(assert (=> b!593115 m!571135))

(declare-fun m!571175 () Bool)

(assert (=> b!593115 m!571175))

(declare-fun m!571177 () Bool)

(assert (=> b!593118 m!571177))

(declare-fun m!571179 () Bool)

(assert (=> b!593132 m!571179))

(assert (=> b!593132 m!571133))

(assert (=> b!593132 m!571133))

(declare-fun m!571181 () Bool)

(assert (=> b!593132 m!571181))

(push 1)

(assert (not b!593132))

(assert (not b!593117))

(assert (not b!593118))

(assert (not b!593125))

(assert (not b!593131))

(assert (not b!593127))

(assert (not b!593116))

(assert (not b!593130))

(assert (not b!593124))

(assert (not b!593129))

(assert (not start!54266))

(assert (not b!593119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86361 () Bool)

(declare-fun res!379751 () Bool)

(declare-fun e!338811 () Bool)

(assert (=> d!86361 (=> res!379751 e!338811)))

(assert (=> d!86361 (= res!379751 (= (select (arr!17735 lt!269283) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17735 a!2986) j!136)))))

(assert (=> d!86361 (= (arrayContainsKey!0 lt!269283 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338811)))

(declare-fun b!593201 () Bool)

(declare-fun e!338812 () Bool)

(assert (=> b!593201 (= e!338811 e!338812)))

(declare-fun res!379752 () Bool)

(assert (=> b!593201 (=> (not res!379752) (not e!338812))))

(assert (=> b!593201 (= res!379752 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18099 lt!269283)))))

(declare-fun b!593202 () Bool)

(assert (=> b!593202 (= e!338812 (arrayContainsKey!0 lt!269283 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86361 (not res!379751)) b!593201))

(assert (= (and b!593201 res!379752) b!593202))

(declare-fun m!571239 () Bool)

(assert (=> d!86361 m!571239))

(assert (=> b!593202 m!571133))

(declare-fun m!571243 () Bool)

(assert (=> b!593202 m!571243))

(assert (=> b!593130 d!86361))

(declare-fun d!86373 () Bool)

(assert (=> d!86373 (arrayContainsKey!0 lt!269283 (select (arr!17735 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269308 () Unit!18618)

(declare-fun choose!114 (array!36933 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18618)

(assert (=> d!86373 (= lt!269308 (choose!114 lt!269283 (select (arr!17735 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86373 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86373 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269283 (select (arr!17735 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269308)))

(declare-fun bs!18303 () Bool)

(assert (= bs!18303 d!86373))

(assert (=> bs!18303 m!571133))

(assert (=> bs!18303 m!571165))

(assert (=> bs!18303 m!571133))

(declare-fun m!571245 () Bool)

(assert (=> bs!18303 m!571245))

(assert (=> b!593130 d!86373))

(declare-fun d!86375 () Bool)

(assert (=> d!86375 (= (validKeyInArray!0 (select (arr!17735 a!2986) j!136)) (and (not (= (select (arr!17735 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17735 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593119 d!86375))

(declare-fun b!593249 () Bool)

(declare-fun e!338844 () SeekEntryResult!6175)

(declare-fun lt!269332 () SeekEntryResult!6175)

(assert (=> b!593249 (= e!338844 (MissingZero!6175 (index!26941 lt!269332)))))

(declare-fun b!593250 () Bool)

(declare-fun e!338845 () SeekEntryResult!6175)

(declare-fun e!338846 () SeekEntryResult!6175)

(assert (=> b!593250 (= e!338845 e!338846)))

(declare-fun lt!269330 () (_ BitVec 64))

(assert (=> b!593250 (= lt!269330 (select (arr!17735 a!2986) (index!26941 lt!269332)))))

(declare-fun c!67109 () Bool)

(assert (=> b!593250 (= c!67109 (= lt!269330 k!1786))))

(declare-fun d!86377 () Bool)

(declare-fun lt!269331 () SeekEntryResult!6175)

(assert (=> d!86377 (and (or (is-Undefined!6175 lt!269331) (not (is-Found!6175 lt!269331)) (and (bvsge (index!26940 lt!269331) #b00000000000000000000000000000000) (bvslt (index!26940 lt!269331) (size!18099 a!2986)))) (or (is-Undefined!6175 lt!269331) (is-Found!6175 lt!269331) (not (is-MissingZero!6175 lt!269331)) (and (bvsge (index!26939 lt!269331) #b00000000000000000000000000000000) (bvslt (index!26939 lt!269331) (size!18099 a!2986)))) (or (is-Undefined!6175 lt!269331) (is-Found!6175 lt!269331) (is-MissingZero!6175 lt!269331) (not (is-MissingVacant!6175 lt!269331)) (and (bvsge (index!26942 lt!269331) #b00000000000000000000000000000000) (bvslt (index!26942 lt!269331) (size!18099 a!2986)))) (or (is-Undefined!6175 lt!269331) (ite (is-Found!6175 lt!269331) (= (select (arr!17735 a!2986) (index!26940 lt!269331)) k!1786) (ite (is-MissingZero!6175 lt!269331) (= (select (arr!17735 a!2986) (index!26939 lt!269331)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6175 lt!269331) (= (select (arr!17735 a!2986) (index!26942 lt!269331)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86377 (= lt!269331 e!338845)))

(declare-fun c!67110 () Bool)

(assert (=> d!86377 (= c!67110 (and (is-Intermediate!6175 lt!269332) (undefined!6987 lt!269332)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36933 (_ BitVec 32)) SeekEntryResult!6175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86377 (= lt!269332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86377 (validMask!0 mask!3053)))

(assert (=> d!86377 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!269331)))

(declare-fun b!593251 () Bool)

(declare-fun c!67111 () Bool)

(assert (=> b!593251 (= c!67111 (= lt!269330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593251 (= e!338846 e!338844)))

(declare-fun b!593252 () Bool)

(assert (=> b!593252 (= e!338846 (Found!6175 (index!26941 lt!269332)))))

(declare-fun b!593253 () Bool)

(assert (=> b!593253 (= e!338845 Undefined!6175)))

(declare-fun b!593254 () Bool)

(assert (=> b!593254 (= e!338844 (seekKeyOrZeroReturnVacant!0 (x!55728 lt!269332) (index!26941 lt!269332) (index!26941 lt!269332) k!1786 a!2986 mask!3053))))

(assert (= (and d!86377 c!67110) b!593253))

(assert (= (and d!86377 (not c!67110)) b!593250))

(assert (= (and b!593250 c!67109) b!593252))

(assert (= (and b!593250 (not c!67109)) b!593251))

(assert (= (and b!593251 c!67111) b!593249))

(assert (= (and b!593251 (not c!67111)) b!593254))

(declare-fun m!571271 () Bool)

(assert (=> b!593250 m!571271))

(declare-fun m!571273 () Bool)

(assert (=> d!86377 m!571273))

(declare-fun m!571275 () Bool)

(assert (=> d!86377 m!571275))

(declare-fun m!571277 () Bool)

(assert (=> d!86377 m!571277))

(declare-fun m!571279 () Bool)

(assert (=> d!86377 m!571279))

(assert (=> d!86377 m!571159))

(assert (=> d!86377 m!571275))

(declare-fun m!571281 () Bool)

(assert (=> d!86377 m!571281))

(declare-fun m!571283 () Bool)

(assert (=> b!593254 m!571283))

(assert (=> b!593131 d!86377))

(declare-fun b!593302 () Bool)

(declare-fun e!338881 () SeekEntryResult!6175)

(assert (=> b!593302 (= e!338881 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun d!86391 () Bool)

(declare-fun lt!269349 () SeekEntryResult!6175)

(assert (=> d!86391 (and (or (is-Undefined!6175 lt!269349) (not (is-Found!6175 lt!269349)) (and (bvsge (index!26940 lt!269349) #b00000000000000000000000000000000) (bvslt (index!26940 lt!269349) (size!18099 a!2986)))) (or (is-Undefined!6175 lt!269349) (is-Found!6175 lt!269349) (not (is-MissingVacant!6175 lt!269349)) (not (= (index!26942 lt!269349) vacantSpotIndex!68)) (and (bvsge (index!26942 lt!269349) #b00000000000000000000000000000000) (bvslt (index!26942 lt!269349) (size!18099 a!2986)))) (or (is-Undefined!6175 lt!269349) (ite (is-Found!6175 lt!269349) (= (select (arr!17735 a!2986) (index!26940 lt!269349)) (select (arr!17735 a!2986) j!136)) (and (is-MissingVacant!6175 lt!269349) (= (index!26942 lt!269349) vacantSpotIndex!68) (= (select (arr!17735 a!2986) (index!26942 lt!269349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338880 () SeekEntryResult!6175)

(assert (=> d!86391 (= lt!269349 e!338880)))

(declare-fun c!67126 () Bool)

(assert (=> d!86391 (= c!67126 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269350 () (_ BitVec 64))

(assert (=> d!86391 (= lt!269350 (select (arr!17735 a!2986) index!984))))

(assert (=> d!86391 (validMask!0 mask!3053)))

(assert (=> d!86391 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17735 a!2986) j!136) a!2986 mask!3053) lt!269349)))

(declare-fun b!593303 () Bool)

(declare-fun e!338879 () SeekEntryResult!6175)

(assert (=> b!593303 (= e!338880 e!338879)))

(declare-fun c!67125 () Bool)

(assert (=> b!593303 (= c!67125 (= lt!269350 (select (arr!17735 a!2986) j!136)))))

