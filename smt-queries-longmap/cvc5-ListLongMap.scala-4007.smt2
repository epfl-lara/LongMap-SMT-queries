; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54514 () Bool)

(assert start!54514)

(declare-fun b!595102 () Bool)

(declare-fun e!340014 () Bool)

(declare-fun e!340022 () Bool)

(assert (=> b!595102 (= e!340014 e!340022)))

(declare-fun res!381021 () Bool)

(assert (=> b!595102 (=> res!381021 e!340022)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270196 () (_ BitVec 64))

(declare-fun lt!270201 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36974 0))(
  ( (array!36975 (arr!17751 (Array (_ BitVec 32) (_ BitVec 64))) (size!18115 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36974)

(assert (=> b!595102 (= res!381021 (or (not (= (select (arr!17751 a!2986) j!136) lt!270196)) (not (= (select (arr!17751 a!2986) j!136) lt!270201)) (bvsge j!136 index!984)))))

(declare-fun b!595103 () Bool)

(declare-fun e!340011 () Bool)

(declare-datatypes ((SeekEntryResult!6191 0))(
  ( (MissingZero!6191 (index!27012 (_ BitVec 32))) (Found!6191 (index!27013 (_ BitVec 32))) (Intermediate!6191 (undefined!7003 Bool) (index!27014 (_ BitVec 32)) (x!55819 (_ BitVec 32))) (Undefined!6191) (MissingVacant!6191 (index!27015 (_ BitVec 32))) )
))
(declare-fun lt!270204 () SeekEntryResult!6191)

(declare-fun lt!270203 () SeekEntryResult!6191)

(assert (=> b!595103 (= e!340011 (= lt!270204 lt!270203))))

(declare-fun b!595104 () Bool)

(declare-fun res!381010 () Bool)

(declare-fun e!340023 () Bool)

(assert (=> b!595104 (=> (not res!381010) (not e!340023))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36974 (_ BitVec 32)) Bool)

(assert (=> b!595104 (= res!381010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595105 () Bool)

(declare-fun lt!270198 () array!36974)

(declare-fun e!340013 () Bool)

(declare-fun arrayContainsKey!0 (array!36974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595105 (= e!340013 (arrayContainsKey!0 lt!270198 (select (arr!17751 a!2986) j!136) index!984))))

(declare-fun b!595106 () Bool)

(declare-datatypes ((Unit!18682 0))(
  ( (Unit!18683) )
))
(declare-fun e!340021 () Unit!18682)

(declare-fun Unit!18684 () Unit!18682)

(assert (=> b!595106 (= e!340021 Unit!18684)))

(assert (=> b!595106 false))

(declare-fun b!595107 () Bool)

(declare-fun e!340020 () Bool)

(declare-fun e!340015 () Bool)

(assert (=> b!595107 (= e!340020 (not e!340015))))

(declare-fun res!381017 () Bool)

(assert (=> b!595107 (=> res!381017 e!340015)))

(declare-fun lt!270195 () SeekEntryResult!6191)

(assert (=> b!595107 (= res!381017 (not (= lt!270195 (Found!6191 index!984))))))

(declare-fun lt!270200 () Unit!18682)

(assert (=> b!595107 (= lt!270200 e!340021)))

(declare-fun c!67415 () Bool)

(assert (=> b!595107 (= c!67415 (= lt!270195 Undefined!6191))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36974 (_ BitVec 32)) SeekEntryResult!6191)

(assert (=> b!595107 (= lt!270195 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270196 lt!270198 mask!3053))))

(assert (=> b!595107 e!340011))

(declare-fun res!381020 () Bool)

(assert (=> b!595107 (=> (not res!381020) (not e!340011))))

(declare-fun lt!270197 () (_ BitVec 32))

(assert (=> b!595107 (= res!381020 (= lt!270203 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270197 vacantSpotIndex!68 lt!270196 lt!270198 mask!3053)))))

(assert (=> b!595107 (= lt!270203 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270197 vacantSpotIndex!68 (select (arr!17751 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!595107 (= lt!270196 (select (store (arr!17751 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270205 () Unit!18682)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36974 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18682)

(assert (=> b!595107 (= lt!270205 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270197 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595107 (= lt!270197 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595108 () Bool)

(declare-fun res!381012 () Bool)

(declare-fun e!340016 () Bool)

(assert (=> b!595108 (=> res!381012 e!340016)))

(declare-datatypes ((List!11792 0))(
  ( (Nil!11789) (Cons!11788 (h!12833 (_ BitVec 64)) (t!18020 List!11792)) )
))
(declare-fun contains!2927 (List!11792 (_ BitVec 64)) Bool)

(assert (=> b!595108 (= res!381012 (contains!2927 Nil!11789 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595109 () Bool)

(declare-fun e!340017 () Bool)

(assert (=> b!595109 (= e!340017 e!340020)))

(declare-fun res!381022 () Bool)

(assert (=> b!595109 (=> (not res!381022) (not e!340020))))

(assert (=> b!595109 (= res!381022 (and (= lt!270204 (Found!6191 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17751 a!2986) index!984) (select (arr!17751 a!2986) j!136))) (not (= (select (arr!17751 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595109 (= lt!270204 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17751 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595110 () Bool)

(declare-fun res!381008 () Bool)

(declare-fun e!340012 () Bool)

(assert (=> b!595110 (=> (not res!381008) (not e!340012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595110 (= res!381008 (validKeyInArray!0 (select (arr!17751 a!2986) j!136)))))

(declare-fun b!595111 () Bool)

(declare-fun e!340018 () Bool)

(assert (=> b!595111 (= e!340018 e!340016)))

(declare-fun res!381009 () Bool)

(assert (=> b!595111 (=> res!381009 e!340016)))

(assert (=> b!595111 (= res!381009 (or (bvsge (size!18115 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18115 a!2986))))))

(assert (=> b!595111 (arrayContainsKey!0 lt!270198 (select (arr!17751 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270199 () Unit!18682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36974 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18682)

(assert (=> b!595111 (= lt!270199 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270198 (select (arr!17751 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!381025 () Bool)

(assert (=> start!54514 (=> (not res!381025) (not e!340012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54514 (= res!381025 (validMask!0 mask!3053))))

(assert (=> start!54514 e!340012))

(assert (=> start!54514 true))

(declare-fun array_inv!13547 (array!36974) Bool)

(assert (=> start!54514 (array_inv!13547 a!2986)))

(declare-fun b!595112 () Bool)

(declare-fun res!381023 () Bool)

(assert (=> b!595112 (=> (not res!381023) (not e!340023))))

(declare-fun arrayNoDuplicates!0 (array!36974 (_ BitVec 32) List!11792) Bool)

(assert (=> b!595112 (= res!381023 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11789))))

(declare-fun b!595113 () Bool)

(assert (=> b!595113 (= e!340012 e!340023)))

(declare-fun res!381007 () Bool)

(assert (=> b!595113 (=> (not res!381007) (not e!340023))))

(declare-fun lt!270194 () SeekEntryResult!6191)

(assert (=> b!595113 (= res!381007 (or (= lt!270194 (MissingZero!6191 i!1108)) (= lt!270194 (MissingVacant!6191 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36974 (_ BitVec 32)) SeekEntryResult!6191)

(assert (=> b!595113 (= lt!270194 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595114 () Bool)

(declare-fun res!381014 () Bool)

(assert (=> b!595114 (=> (not res!381014) (not e!340012))))

(assert (=> b!595114 (= res!381014 (validKeyInArray!0 k!1786))))

(declare-fun b!595115 () Bool)

(declare-fun Unit!18685 () Unit!18682)

(assert (=> b!595115 (= e!340021 Unit!18685)))

(declare-fun b!595116 () Bool)

(declare-fun res!381026 () Bool)

(assert (=> b!595116 (=> (not res!381026) (not e!340023))))

(assert (=> b!595116 (= res!381026 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17751 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595117 () Bool)

(declare-fun res!381006 () Bool)

(assert (=> b!595117 (=> res!381006 e!340016)))

(assert (=> b!595117 (= res!381006 (contains!2927 Nil!11789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595118 () Bool)

(assert (=> b!595118 (= e!340015 e!340018)))

(declare-fun res!381016 () Bool)

(assert (=> b!595118 (=> res!381016 e!340018)))

(assert (=> b!595118 (= res!381016 (or (not (= (select (arr!17751 a!2986) j!136) lt!270196)) (not (= (select (arr!17751 a!2986) j!136) lt!270201)) (bvsge j!136 index!984)))))

(assert (=> b!595118 e!340014))

(declare-fun res!381018 () Bool)

(assert (=> b!595118 (=> (not res!381018) (not e!340014))))

(assert (=> b!595118 (= res!381018 (= lt!270201 (select (arr!17751 a!2986) j!136)))))

(assert (=> b!595118 (= lt!270201 (select (store (arr!17751 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595119 () Bool)

(declare-fun res!381019 () Bool)

(assert (=> b!595119 (=> res!381019 e!340016)))

(declare-fun noDuplicate!246 (List!11792) Bool)

(assert (=> b!595119 (= res!381019 (not (noDuplicate!246 Nil!11789)))))

(declare-fun b!595120 () Bool)

(assert (=> b!595120 (= e!340022 e!340013)))

(declare-fun res!381011 () Bool)

(assert (=> b!595120 (=> (not res!381011) (not e!340013))))

(assert (=> b!595120 (= res!381011 (arrayContainsKey!0 lt!270198 (select (arr!17751 a!2986) j!136) j!136))))

(declare-fun b!595121 () Bool)

(assert (=> b!595121 (= e!340016 true)))

(declare-fun lt!270202 () Bool)

(assert (=> b!595121 (= lt!270202 (contains!2927 Nil!11789 k!1786))))

(declare-fun b!595122 () Bool)

(assert (=> b!595122 (= e!340023 e!340017)))

(declare-fun res!381015 () Bool)

(assert (=> b!595122 (=> (not res!381015) (not e!340017))))

(assert (=> b!595122 (= res!381015 (= (select (store (arr!17751 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595122 (= lt!270198 (array!36975 (store (arr!17751 a!2986) i!1108 k!1786) (size!18115 a!2986)))))

(declare-fun b!595123 () Bool)

(declare-fun res!381024 () Bool)

(assert (=> b!595123 (=> (not res!381024) (not e!340012))))

(assert (=> b!595123 (= res!381024 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595124 () Bool)

(declare-fun res!381013 () Bool)

(assert (=> b!595124 (=> (not res!381013) (not e!340012))))

(assert (=> b!595124 (= res!381013 (and (= (size!18115 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18115 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18115 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54514 res!381025) b!595124))

(assert (= (and b!595124 res!381013) b!595110))

(assert (= (and b!595110 res!381008) b!595114))

(assert (= (and b!595114 res!381014) b!595123))

(assert (= (and b!595123 res!381024) b!595113))

(assert (= (and b!595113 res!381007) b!595104))

(assert (= (and b!595104 res!381010) b!595112))

(assert (= (and b!595112 res!381023) b!595116))

(assert (= (and b!595116 res!381026) b!595122))

(assert (= (and b!595122 res!381015) b!595109))

(assert (= (and b!595109 res!381022) b!595107))

(assert (= (and b!595107 res!381020) b!595103))

(assert (= (and b!595107 c!67415) b!595106))

(assert (= (and b!595107 (not c!67415)) b!595115))

(assert (= (and b!595107 (not res!381017)) b!595118))

(assert (= (and b!595118 res!381018) b!595102))

(assert (= (and b!595102 (not res!381021)) b!595120))

(assert (= (and b!595120 res!381011) b!595105))

(assert (= (and b!595118 (not res!381016)) b!595111))

(assert (= (and b!595111 (not res!381009)) b!595119))

(assert (= (and b!595119 (not res!381019)) b!595117))

(assert (= (and b!595117 (not res!381006)) b!595108))

(assert (= (and b!595108 (not res!381012)) b!595121))

(declare-fun m!572807 () Bool)

(assert (=> b!595120 m!572807))

(assert (=> b!595120 m!572807))

(declare-fun m!572809 () Bool)

(assert (=> b!595120 m!572809))

(assert (=> b!595102 m!572807))

(declare-fun m!572811 () Bool)

(assert (=> b!595116 m!572811))

(declare-fun m!572813 () Bool)

(assert (=> b!595123 m!572813))

(declare-fun m!572815 () Bool)

(assert (=> b!595119 m!572815))

(declare-fun m!572817 () Bool)

(assert (=> b!595107 m!572817))

(declare-fun m!572819 () Bool)

(assert (=> b!595107 m!572819))

(assert (=> b!595107 m!572807))

(declare-fun m!572821 () Bool)

(assert (=> b!595107 m!572821))

(declare-fun m!572823 () Bool)

(assert (=> b!595107 m!572823))

(declare-fun m!572825 () Bool)

(assert (=> b!595107 m!572825))

(assert (=> b!595107 m!572807))

(declare-fun m!572827 () Bool)

(assert (=> b!595107 m!572827))

(declare-fun m!572829 () Bool)

(assert (=> b!595107 m!572829))

(declare-fun m!572831 () Bool)

(assert (=> b!595117 m!572831))

(declare-fun m!572833 () Bool)

(assert (=> b!595108 m!572833))

(declare-fun m!572835 () Bool)

(assert (=> b!595113 m!572835))

(assert (=> b!595110 m!572807))

(assert (=> b!595110 m!572807))

(declare-fun m!572837 () Bool)

(assert (=> b!595110 m!572837))

(declare-fun m!572839 () Bool)

(assert (=> b!595114 m!572839))

(declare-fun m!572841 () Bool)

(assert (=> b!595104 m!572841))

(declare-fun m!572843 () Bool)

(assert (=> b!595112 m!572843))

(declare-fun m!572845 () Bool)

(assert (=> b!595109 m!572845))

(assert (=> b!595109 m!572807))

(assert (=> b!595109 m!572807))

(declare-fun m!572847 () Bool)

(assert (=> b!595109 m!572847))

(assert (=> b!595105 m!572807))

(assert (=> b!595105 m!572807))

(declare-fun m!572849 () Bool)

(assert (=> b!595105 m!572849))

(declare-fun m!572851 () Bool)

(assert (=> start!54514 m!572851))

(declare-fun m!572853 () Bool)

(assert (=> start!54514 m!572853))

(assert (=> b!595111 m!572807))

(assert (=> b!595111 m!572807))

(declare-fun m!572855 () Bool)

(assert (=> b!595111 m!572855))

(assert (=> b!595111 m!572807))

(declare-fun m!572857 () Bool)

(assert (=> b!595111 m!572857))

(assert (=> b!595118 m!572807))

(assert (=> b!595118 m!572821))

(declare-fun m!572859 () Bool)

(assert (=> b!595118 m!572859))

(assert (=> b!595122 m!572821))

(declare-fun m!572861 () Bool)

(assert (=> b!595122 m!572861))

(declare-fun m!572863 () Bool)

(assert (=> b!595121 m!572863))

(push 1)

