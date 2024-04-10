; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57708 () Bool)

(assert start!57708)

(declare-fun b!638155 () Bool)

(declare-fun e!365155 () Bool)

(declare-fun e!365153 () Bool)

(assert (=> b!638155 (= e!365155 e!365153)))

(declare-fun res!413014 () Bool)

(assert (=> b!638155 (=> (not res!413014) (not e!365153))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38279 0))(
  ( (array!38280 (arr!18362 (Array (_ BitVec 32) (_ BitVec 64))) (size!18726 (_ BitVec 32))) )
))
(declare-fun lt!295102 () array!38279)

(declare-fun a!2986 () array!38279)

(declare-fun arrayContainsKey!0 (array!38279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638155 (= res!413014 (arrayContainsKey!0 lt!295102 (select (arr!18362 a!2986) j!136) j!136))))

(declare-fun b!638156 () Bool)

(declare-fun res!413021 () Bool)

(declare-fun e!365162 () Bool)

(assert (=> b!638156 (=> (not res!413021) (not e!365162))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38279 (_ BitVec 32)) Bool)

(assert (=> b!638156 (= res!413021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638157 () Bool)

(declare-fun res!413001 () Bool)

(declare-fun e!365159 () Bool)

(assert (=> b!638157 (=> (not res!413001) (not e!365159))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!638157 (= res!413001 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638158 () Bool)

(declare-fun e!365163 () Bool)

(assert (=> b!638158 (= e!365163 true)))

(declare-fun lt!295106 () Bool)

(declare-datatypes ((List!12403 0))(
  ( (Nil!12400) (Cons!12399 (h!13444 (_ BitVec 64)) (t!18631 List!12403)) )
))
(declare-fun contains!3117 (List!12403 (_ BitVec 64)) Bool)

(assert (=> b!638158 (= lt!295106 (contains!3117 Nil!12400 k!1786))))

(declare-fun b!638159 () Bool)

(assert (=> b!638159 (= e!365159 e!365162)))

(declare-fun res!413019 () Bool)

(assert (=> b!638159 (=> (not res!413019) (not e!365162))))

(declare-datatypes ((SeekEntryResult!6802 0))(
  ( (MissingZero!6802 (index!29522 (_ BitVec 32))) (Found!6802 (index!29523 (_ BitVec 32))) (Intermediate!6802 (undefined!7614 Bool) (index!29524 (_ BitVec 32)) (x!58276 (_ BitVec 32))) (Undefined!6802) (MissingVacant!6802 (index!29525 (_ BitVec 32))) )
))
(declare-fun lt!295104 () SeekEntryResult!6802)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638159 (= res!413019 (or (= lt!295104 (MissingZero!6802 i!1108)) (= lt!295104 (MissingVacant!6802 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38279 (_ BitVec 32)) SeekEntryResult!6802)

(assert (=> b!638159 (= lt!295104 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638160 () Bool)

(declare-datatypes ((Unit!21542 0))(
  ( (Unit!21543) )
))
(declare-fun e!365160 () Unit!21542)

(declare-fun Unit!21544 () Unit!21542)

(assert (=> b!638160 (= e!365160 Unit!21544)))

(assert (=> b!638160 false))

(declare-fun b!638161 () Bool)

(declare-fun res!413006 () Bool)

(assert (=> b!638161 (=> (not res!413006) (not e!365162))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638161 (= res!413006 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18362 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638162 () Bool)

(declare-fun e!365151 () Bool)

(assert (=> b!638162 (= e!365151 e!365155)))

(declare-fun res!413003 () Bool)

(assert (=> b!638162 (=> res!413003 e!365155)))

(declare-fun lt!295099 () (_ BitVec 64))

(declare-fun lt!295105 () (_ BitVec 64))

(assert (=> b!638162 (= res!413003 (or (not (= (select (arr!18362 a!2986) j!136) lt!295099)) (not (= (select (arr!18362 a!2986) j!136) lt!295105)) (bvsge j!136 index!984)))))

(declare-fun b!638163 () Bool)

(declare-fun e!365157 () Bool)

(declare-fun e!365161 () Bool)

(assert (=> b!638163 (= e!365157 (not e!365161))))

(declare-fun res!413010 () Bool)

(assert (=> b!638163 (=> res!413010 e!365161)))

(declare-fun lt!295108 () SeekEntryResult!6802)

(assert (=> b!638163 (= res!413010 (not (= lt!295108 (Found!6802 index!984))))))

(declare-fun lt!295097 () Unit!21542)

(assert (=> b!638163 (= lt!295097 e!365160)))

(declare-fun c!72944 () Bool)

(assert (=> b!638163 (= c!72944 (= lt!295108 Undefined!6802))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38279 (_ BitVec 32)) SeekEntryResult!6802)

(assert (=> b!638163 (= lt!295108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295099 lt!295102 mask!3053))))

(declare-fun e!365156 () Bool)

(assert (=> b!638163 e!365156))

(declare-fun res!413020 () Bool)

(assert (=> b!638163 (=> (not res!413020) (not e!365156))))

(declare-fun lt!295101 () (_ BitVec 32))

(declare-fun lt!295107 () SeekEntryResult!6802)

(assert (=> b!638163 (= res!413020 (= lt!295107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295101 vacantSpotIndex!68 lt!295099 lt!295102 mask!3053)))))

(assert (=> b!638163 (= lt!295107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295101 vacantSpotIndex!68 (select (arr!18362 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638163 (= lt!295099 (select (store (arr!18362 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295100 () Unit!21542)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21542)

(assert (=> b!638163 (= lt!295100 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295101 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638163 (= lt!295101 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638164 () Bool)

(declare-fun res!413018 () Bool)

(assert (=> b!638164 (=> res!413018 e!365163)))

(declare-fun noDuplicate!395 (List!12403) Bool)

(assert (=> b!638164 (= res!413018 (not (noDuplicate!395 Nil!12400)))))

(declare-fun b!638165 () Bool)

(declare-fun res!413008 () Bool)

(assert (=> b!638165 (=> (not res!413008) (not e!365159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638165 (= res!413008 (validKeyInArray!0 k!1786))))

(declare-fun b!638166 () Bool)

(declare-fun e!365158 () Bool)

(assert (=> b!638166 (= e!365158 e!365157)))

(declare-fun res!413013 () Bool)

(assert (=> b!638166 (=> (not res!413013) (not e!365157))))

(declare-fun lt!295103 () SeekEntryResult!6802)

(assert (=> b!638166 (= res!413013 (and (= lt!295103 (Found!6802 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18362 a!2986) index!984) (select (arr!18362 a!2986) j!136))) (not (= (select (arr!18362 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638166 (= lt!295103 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18362 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638167 () Bool)

(declare-fun res!413002 () Bool)

(assert (=> b!638167 (=> res!413002 e!365163)))

(assert (=> b!638167 (= res!413002 (contains!3117 Nil!12400 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638168 () Bool)

(declare-fun res!413012 () Bool)

(assert (=> b!638168 (=> (not res!413012) (not e!365159))))

(assert (=> b!638168 (= res!413012 (and (= (size!18726 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18726 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18726 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638169 () Bool)

(declare-fun e!365152 () Bool)

(assert (=> b!638169 (= e!365152 e!365163)))

(declare-fun res!413005 () Bool)

(assert (=> b!638169 (=> res!413005 e!365163)))

(assert (=> b!638169 (= res!413005 (or (bvsge (size!18726 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18726 a!2986))))))

(assert (=> b!638169 (arrayContainsKey!0 lt!295102 (select (arr!18362 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295098 () Unit!21542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21542)

(assert (=> b!638169 (= lt!295098 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295102 (select (arr!18362 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638170 () Bool)

(declare-fun Unit!21545 () Unit!21542)

(assert (=> b!638170 (= e!365160 Unit!21545)))

(declare-fun b!638171 () Bool)

(assert (=> b!638171 (= e!365162 e!365158)))

(declare-fun res!413009 () Bool)

(assert (=> b!638171 (=> (not res!413009) (not e!365158))))

(assert (=> b!638171 (= res!413009 (= (select (store (arr!18362 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638171 (= lt!295102 (array!38280 (store (arr!18362 a!2986) i!1108 k!1786) (size!18726 a!2986)))))

(declare-fun b!638172 () Bool)

(assert (=> b!638172 (= e!365161 e!365152)))

(declare-fun res!413015 () Bool)

(assert (=> b!638172 (=> res!413015 e!365152)))

(assert (=> b!638172 (= res!413015 (or (not (= (select (arr!18362 a!2986) j!136) lt!295099)) (not (= (select (arr!18362 a!2986) j!136) lt!295105)) (bvsge j!136 index!984)))))

(assert (=> b!638172 e!365151))

(declare-fun res!413007 () Bool)

(assert (=> b!638172 (=> (not res!413007) (not e!365151))))

(assert (=> b!638172 (= res!413007 (= lt!295105 (select (arr!18362 a!2986) j!136)))))

(assert (=> b!638172 (= lt!295105 (select (store (arr!18362 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638173 () Bool)

(assert (=> b!638173 (= e!365153 (arrayContainsKey!0 lt!295102 (select (arr!18362 a!2986) j!136) index!984))))

(declare-fun res!413004 () Bool)

(assert (=> start!57708 (=> (not res!413004) (not e!365159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57708 (= res!413004 (validMask!0 mask!3053))))

(assert (=> start!57708 e!365159))

(assert (=> start!57708 true))

(declare-fun array_inv!14158 (array!38279) Bool)

(assert (=> start!57708 (array_inv!14158 a!2986)))

(declare-fun b!638174 () Bool)

(declare-fun res!413011 () Bool)

(assert (=> b!638174 (=> res!413011 e!365163)))

(assert (=> b!638174 (= res!413011 (contains!3117 Nil!12400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638175 () Bool)

(declare-fun res!413017 () Bool)

(assert (=> b!638175 (=> (not res!413017) (not e!365159))))

(assert (=> b!638175 (= res!413017 (validKeyInArray!0 (select (arr!18362 a!2986) j!136)))))

(declare-fun b!638176 () Bool)

(declare-fun res!413016 () Bool)

(assert (=> b!638176 (=> (not res!413016) (not e!365162))))

(declare-fun arrayNoDuplicates!0 (array!38279 (_ BitVec 32) List!12403) Bool)

(assert (=> b!638176 (= res!413016 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12400))))

(declare-fun b!638177 () Bool)

(assert (=> b!638177 (= e!365156 (= lt!295103 lt!295107))))

(assert (= (and start!57708 res!413004) b!638168))

(assert (= (and b!638168 res!413012) b!638175))

(assert (= (and b!638175 res!413017) b!638165))

(assert (= (and b!638165 res!413008) b!638157))

(assert (= (and b!638157 res!413001) b!638159))

(assert (= (and b!638159 res!413019) b!638156))

(assert (= (and b!638156 res!413021) b!638176))

(assert (= (and b!638176 res!413016) b!638161))

(assert (= (and b!638161 res!413006) b!638171))

(assert (= (and b!638171 res!413009) b!638166))

(assert (= (and b!638166 res!413013) b!638163))

(assert (= (and b!638163 res!413020) b!638177))

(assert (= (and b!638163 c!72944) b!638160))

(assert (= (and b!638163 (not c!72944)) b!638170))

(assert (= (and b!638163 (not res!413010)) b!638172))

(assert (= (and b!638172 res!413007) b!638162))

(assert (= (and b!638162 (not res!413003)) b!638155))

(assert (= (and b!638155 res!413014) b!638173))

(assert (= (and b!638172 (not res!413015)) b!638169))

(assert (= (and b!638169 (not res!413005)) b!638164))

(assert (= (and b!638164 (not res!413018)) b!638174))

(assert (= (and b!638174 (not res!413011)) b!638167))

(assert (= (and b!638167 (not res!413002)) b!638158))

(declare-fun m!612121 () Bool)

(assert (=> b!638173 m!612121))

(assert (=> b!638173 m!612121))

(declare-fun m!612123 () Bool)

(assert (=> b!638173 m!612123))

(assert (=> b!638155 m!612121))

(assert (=> b!638155 m!612121))

(declare-fun m!612125 () Bool)

(assert (=> b!638155 m!612125))

(assert (=> b!638162 m!612121))

(declare-fun m!612127 () Bool)

(assert (=> b!638174 m!612127))

(declare-fun m!612129 () Bool)

(assert (=> start!57708 m!612129))

(declare-fun m!612131 () Bool)

(assert (=> start!57708 m!612131))

(declare-fun m!612133 () Bool)

(assert (=> b!638163 m!612133))

(declare-fun m!612135 () Bool)

(assert (=> b!638163 m!612135))

(assert (=> b!638163 m!612121))

(declare-fun m!612137 () Bool)

(assert (=> b!638163 m!612137))

(declare-fun m!612139 () Bool)

(assert (=> b!638163 m!612139))

(assert (=> b!638163 m!612121))

(declare-fun m!612141 () Bool)

(assert (=> b!638163 m!612141))

(declare-fun m!612143 () Bool)

(assert (=> b!638163 m!612143))

(declare-fun m!612145 () Bool)

(assert (=> b!638163 m!612145))

(declare-fun m!612147 () Bool)

(assert (=> b!638161 m!612147))

(declare-fun m!612149 () Bool)

(assert (=> b!638167 m!612149))

(assert (=> b!638175 m!612121))

(assert (=> b!638175 m!612121))

(declare-fun m!612151 () Bool)

(assert (=> b!638175 m!612151))

(declare-fun m!612153 () Bool)

(assert (=> b!638165 m!612153))

(declare-fun m!612155 () Bool)

(assert (=> b!638164 m!612155))

(assert (=> b!638169 m!612121))

(assert (=> b!638169 m!612121))

(declare-fun m!612157 () Bool)

(assert (=> b!638169 m!612157))

(assert (=> b!638169 m!612121))

(declare-fun m!612159 () Bool)

(assert (=> b!638169 m!612159))

(declare-fun m!612161 () Bool)

(assert (=> b!638166 m!612161))

(assert (=> b!638166 m!612121))

(assert (=> b!638166 m!612121))

(declare-fun m!612163 () Bool)

(assert (=> b!638166 m!612163))

(declare-fun m!612165 () Bool)

(assert (=> b!638159 m!612165))

(declare-fun m!612167 () Bool)

(assert (=> b!638156 m!612167))

(declare-fun m!612169 () Bool)

(assert (=> b!638176 m!612169))

(assert (=> b!638172 m!612121))

(assert (=> b!638172 m!612137))

(declare-fun m!612171 () Bool)

(assert (=> b!638172 m!612171))

(declare-fun m!612173 () Bool)

(assert (=> b!638158 m!612173))

(declare-fun m!612175 () Bool)

(assert (=> b!638157 m!612175))

(assert (=> b!638171 m!612137))

(declare-fun m!612177 () Bool)

(assert (=> b!638171 m!612177))

(push 1)

