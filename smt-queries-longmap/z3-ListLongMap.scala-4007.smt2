; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54516 () Bool)

(assert start!54516)

(declare-fun b!595171 () Bool)

(declare-fun e!340052 () Bool)

(declare-fun e!340051 () Bool)

(assert (=> b!595171 (= e!340052 e!340051)))

(declare-fun res!381080 () Bool)

(assert (=> b!595171 (=> (not res!381080) (not e!340051))))

(declare-datatypes ((SeekEntryResult!6192 0))(
  ( (MissingZero!6192 (index!27016 (_ BitVec 32))) (Found!6192 (index!27017 (_ BitVec 32))) (Intermediate!6192 (undefined!7004 Bool) (index!27018 (_ BitVec 32)) (x!55820 (_ BitVec 32))) (Undefined!6192) (MissingVacant!6192 (index!27019 (_ BitVec 32))) )
))
(declare-fun lt!270234 () SeekEntryResult!6192)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595171 (= res!381080 (or (= lt!270234 (MissingZero!6192 i!1108)) (= lt!270234 (MissingVacant!6192 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36976 0))(
  ( (array!36977 (arr!17752 (Array (_ BitVec 32) (_ BitVec 64))) (size!18116 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36976)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36976 (_ BitVec 32)) SeekEntryResult!6192)

(assert (=> b!595171 (= lt!270234 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595172 () Bool)

(declare-datatypes ((Unit!18686 0))(
  ( (Unit!18687) )
))
(declare-fun e!340055 () Unit!18686)

(declare-fun Unit!18688 () Unit!18686)

(assert (=> b!595172 (= e!340055 Unit!18688)))

(assert (=> b!595172 false))

(declare-fun b!595173 () Bool)

(declare-fun res!381078 () Bool)

(assert (=> b!595173 (=> (not res!381078) (not e!340052))))

(declare-fun arrayContainsKey!0 (array!36976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595173 (= res!381078 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595174 () Bool)

(declare-fun e!340059 () Bool)

(declare-fun lt!270233 () SeekEntryResult!6192)

(declare-fun lt!270236 () SeekEntryResult!6192)

(assert (=> b!595174 (= e!340059 (= lt!270233 lt!270236))))

(declare-fun b!595175 () Bool)

(declare-fun e!340053 () Bool)

(declare-fun e!340050 () Bool)

(assert (=> b!595175 (= e!340053 e!340050)))

(declare-fun res!381074 () Bool)

(assert (=> b!595175 (=> res!381074 e!340050)))

(assert (=> b!595175 (= res!381074 (or (bvsge (size!18116 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18116 a!2986))))))

(declare-fun lt!270241 () array!36976)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595175 (arrayContainsKey!0 lt!270241 (select (arr!17752 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270230 () Unit!18686)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36976 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18686)

(assert (=> b!595175 (= lt!270230 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270241 (select (arr!17752 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595176 () Bool)

(assert (=> b!595176 (= e!340050 true)))

(declare-fun lt!270235 () Bool)

(declare-datatypes ((List!11793 0))(
  ( (Nil!11790) (Cons!11789 (h!12834 (_ BitVec 64)) (t!18021 List!11793)) )
))
(declare-fun contains!2928 (List!11793 (_ BitVec 64)) Bool)

(assert (=> b!595176 (= lt!270235 (contains!2928 Nil!11790 k0!1786))))

(declare-fun b!595177 () Bool)

(declare-fun e!340060 () Bool)

(declare-fun e!340056 () Bool)

(assert (=> b!595177 (= e!340060 (not e!340056))))

(declare-fun res!381083 () Bool)

(assert (=> b!595177 (=> res!381083 e!340056)))

(declare-fun lt!270232 () SeekEntryResult!6192)

(assert (=> b!595177 (= res!381083 (not (= lt!270232 (Found!6192 index!984))))))

(declare-fun lt!270237 () Unit!18686)

(assert (=> b!595177 (= lt!270237 e!340055)))

(declare-fun c!67418 () Bool)

(assert (=> b!595177 (= c!67418 (= lt!270232 Undefined!6192))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!270239 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36976 (_ BitVec 32)) SeekEntryResult!6192)

(assert (=> b!595177 (= lt!270232 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270239 lt!270241 mask!3053))))

(assert (=> b!595177 e!340059))

(declare-fun res!381086 () Bool)

(assert (=> b!595177 (=> (not res!381086) (not e!340059))))

(declare-fun lt!270231 () (_ BitVec 32))

(assert (=> b!595177 (= res!381086 (= lt!270236 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270231 vacantSpotIndex!68 lt!270239 lt!270241 mask!3053)))))

(assert (=> b!595177 (= lt!270236 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270231 vacantSpotIndex!68 (select (arr!17752 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595177 (= lt!270239 (select (store (arr!17752 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270238 () Unit!18686)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36976 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18686)

(assert (=> b!595177 (= lt!270238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270231 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595177 (= lt!270231 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!381079 () Bool)

(assert (=> start!54516 (=> (not res!381079) (not e!340052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54516 (= res!381079 (validMask!0 mask!3053))))

(assert (=> start!54516 e!340052))

(assert (=> start!54516 true))

(declare-fun array_inv!13548 (array!36976) Bool)

(assert (=> start!54516 (array_inv!13548 a!2986)))

(declare-fun b!595178 () Bool)

(assert (=> b!595178 (= e!340056 e!340053)))

(declare-fun res!381072 () Bool)

(assert (=> b!595178 (=> res!381072 e!340053)))

(declare-fun lt!270240 () (_ BitVec 64))

(assert (=> b!595178 (= res!381072 (or (not (= (select (arr!17752 a!2986) j!136) lt!270239)) (not (= (select (arr!17752 a!2986) j!136) lt!270240)) (bvsge j!136 index!984)))))

(declare-fun e!340062 () Bool)

(assert (=> b!595178 e!340062))

(declare-fun res!381088 () Bool)

(assert (=> b!595178 (=> (not res!381088) (not e!340062))))

(assert (=> b!595178 (= res!381088 (= lt!270240 (select (arr!17752 a!2986) j!136)))))

(assert (=> b!595178 (= lt!270240 (select (store (arr!17752 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595179 () Bool)

(declare-fun res!381087 () Bool)

(assert (=> b!595179 (=> res!381087 e!340050)))

(declare-fun noDuplicate!247 (List!11793) Bool)

(assert (=> b!595179 (= res!381087 (not (noDuplicate!247 Nil!11790)))))

(declare-fun b!595180 () Bool)

(declare-fun res!381069 () Bool)

(assert (=> b!595180 (=> (not res!381069) (not e!340052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595180 (= res!381069 (validKeyInArray!0 k0!1786))))

(declare-fun b!595181 () Bool)

(declare-fun e!340058 () Bool)

(declare-fun e!340057 () Bool)

(assert (=> b!595181 (= e!340058 e!340057)))

(declare-fun res!381089 () Bool)

(assert (=> b!595181 (=> (not res!381089) (not e!340057))))

(assert (=> b!595181 (= res!381089 (arrayContainsKey!0 lt!270241 (select (arr!17752 a!2986) j!136) j!136))))

(declare-fun b!595182 () Bool)

(declare-fun res!381071 () Bool)

(assert (=> b!595182 (=> (not res!381071) (not e!340052))))

(assert (=> b!595182 (= res!381071 (validKeyInArray!0 (select (arr!17752 a!2986) j!136)))))

(declare-fun b!595183 () Bool)

(declare-fun res!381077 () Bool)

(assert (=> b!595183 (=> (not res!381077) (not e!340051))))

(assert (=> b!595183 (= res!381077 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17752 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595184 () Bool)

(declare-fun res!381084 () Bool)

(assert (=> b!595184 (=> (not res!381084) (not e!340051))))

(declare-fun arrayNoDuplicates!0 (array!36976 (_ BitVec 32) List!11793) Bool)

(assert (=> b!595184 (= res!381084 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11790))))

(declare-fun b!595185 () Bool)

(declare-fun res!381085 () Bool)

(assert (=> b!595185 (=> res!381085 e!340050)))

(assert (=> b!595185 (= res!381085 (contains!2928 Nil!11790 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595186 () Bool)

(declare-fun res!381076 () Bool)

(assert (=> b!595186 (=> (not res!381076) (not e!340051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36976 (_ BitVec 32)) Bool)

(assert (=> b!595186 (= res!381076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595187 () Bool)

(declare-fun res!381070 () Bool)

(assert (=> b!595187 (=> res!381070 e!340050)))

(assert (=> b!595187 (= res!381070 (contains!2928 Nil!11790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595188 () Bool)

(declare-fun Unit!18689 () Unit!18686)

(assert (=> b!595188 (= e!340055 Unit!18689)))

(declare-fun b!595189 () Bool)

(declare-fun e!340054 () Bool)

(assert (=> b!595189 (= e!340051 e!340054)))

(declare-fun res!381075 () Bool)

(assert (=> b!595189 (=> (not res!381075) (not e!340054))))

(assert (=> b!595189 (= res!381075 (= (select (store (arr!17752 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595189 (= lt!270241 (array!36977 (store (arr!17752 a!2986) i!1108 k0!1786) (size!18116 a!2986)))))

(declare-fun b!595190 () Bool)

(assert (=> b!595190 (= e!340054 e!340060)))

(declare-fun res!381082 () Bool)

(assert (=> b!595190 (=> (not res!381082) (not e!340060))))

(assert (=> b!595190 (= res!381082 (and (= lt!270233 (Found!6192 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17752 a!2986) index!984) (select (arr!17752 a!2986) j!136))) (not (= (select (arr!17752 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595190 (= lt!270233 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17752 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595191 () Bool)

(declare-fun res!381073 () Bool)

(assert (=> b!595191 (=> (not res!381073) (not e!340052))))

(assert (=> b!595191 (= res!381073 (and (= (size!18116 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18116 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18116 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595192 () Bool)

(assert (=> b!595192 (= e!340057 (arrayContainsKey!0 lt!270241 (select (arr!17752 a!2986) j!136) index!984))))

(declare-fun b!595193 () Bool)

(assert (=> b!595193 (= e!340062 e!340058)))

(declare-fun res!381081 () Bool)

(assert (=> b!595193 (=> res!381081 e!340058)))

(assert (=> b!595193 (= res!381081 (or (not (= (select (arr!17752 a!2986) j!136) lt!270239)) (not (= (select (arr!17752 a!2986) j!136) lt!270240)) (bvsge j!136 index!984)))))

(assert (= (and start!54516 res!381079) b!595191))

(assert (= (and b!595191 res!381073) b!595182))

(assert (= (and b!595182 res!381071) b!595180))

(assert (= (and b!595180 res!381069) b!595173))

(assert (= (and b!595173 res!381078) b!595171))

(assert (= (and b!595171 res!381080) b!595186))

(assert (= (and b!595186 res!381076) b!595184))

(assert (= (and b!595184 res!381084) b!595183))

(assert (= (and b!595183 res!381077) b!595189))

(assert (= (and b!595189 res!381075) b!595190))

(assert (= (and b!595190 res!381082) b!595177))

(assert (= (and b!595177 res!381086) b!595174))

(assert (= (and b!595177 c!67418) b!595172))

(assert (= (and b!595177 (not c!67418)) b!595188))

(assert (= (and b!595177 (not res!381083)) b!595178))

(assert (= (and b!595178 res!381088) b!595193))

(assert (= (and b!595193 (not res!381081)) b!595181))

(assert (= (and b!595181 res!381089) b!595192))

(assert (= (and b!595178 (not res!381072)) b!595175))

(assert (= (and b!595175 (not res!381074)) b!595179))

(assert (= (and b!595179 (not res!381087)) b!595187))

(assert (= (and b!595187 (not res!381070)) b!595185))

(assert (= (and b!595185 (not res!381085)) b!595176))

(declare-fun m!572865 () Bool)

(assert (=> b!595192 m!572865))

(assert (=> b!595192 m!572865))

(declare-fun m!572867 () Bool)

(assert (=> b!595192 m!572867))

(declare-fun m!572869 () Bool)

(assert (=> b!595179 m!572869))

(declare-fun m!572871 () Bool)

(assert (=> b!595180 m!572871))

(declare-fun m!572873 () Bool)

(assert (=> b!595186 m!572873))

(declare-fun m!572875 () Bool)

(assert (=> b!595183 m!572875))

(declare-fun m!572877 () Bool)

(assert (=> b!595190 m!572877))

(assert (=> b!595190 m!572865))

(assert (=> b!595190 m!572865))

(declare-fun m!572879 () Bool)

(assert (=> b!595190 m!572879))

(declare-fun m!572881 () Bool)

(assert (=> b!595176 m!572881))

(declare-fun m!572883 () Bool)

(assert (=> b!595185 m!572883))

(assert (=> b!595193 m!572865))

(declare-fun m!572885 () Bool)

(assert (=> start!54516 m!572885))

(declare-fun m!572887 () Bool)

(assert (=> start!54516 m!572887))

(declare-fun m!572889 () Bool)

(assert (=> b!595187 m!572889))

(declare-fun m!572891 () Bool)

(assert (=> b!595177 m!572891))

(declare-fun m!572893 () Bool)

(assert (=> b!595177 m!572893))

(assert (=> b!595177 m!572865))

(declare-fun m!572895 () Bool)

(assert (=> b!595177 m!572895))

(declare-fun m!572897 () Bool)

(assert (=> b!595177 m!572897))

(assert (=> b!595177 m!572865))

(declare-fun m!572899 () Bool)

(assert (=> b!595177 m!572899))

(declare-fun m!572901 () Bool)

(assert (=> b!595177 m!572901))

(declare-fun m!572903 () Bool)

(assert (=> b!595177 m!572903))

(assert (=> b!595175 m!572865))

(assert (=> b!595175 m!572865))

(declare-fun m!572905 () Bool)

(assert (=> b!595175 m!572905))

(assert (=> b!595175 m!572865))

(declare-fun m!572907 () Bool)

(assert (=> b!595175 m!572907))

(assert (=> b!595181 m!572865))

(assert (=> b!595181 m!572865))

(declare-fun m!572909 () Bool)

(assert (=> b!595181 m!572909))

(assert (=> b!595182 m!572865))

(assert (=> b!595182 m!572865))

(declare-fun m!572911 () Bool)

(assert (=> b!595182 m!572911))

(declare-fun m!572913 () Bool)

(assert (=> b!595173 m!572913))

(assert (=> b!595178 m!572865))

(assert (=> b!595178 m!572895))

(declare-fun m!572915 () Bool)

(assert (=> b!595178 m!572915))

(declare-fun m!572917 () Bool)

(assert (=> b!595171 m!572917))

(assert (=> b!595189 m!572895))

(declare-fun m!572919 () Bool)

(assert (=> b!595189 m!572919))

(declare-fun m!572921 () Bool)

(assert (=> b!595184 m!572921))

(check-sat (not b!595192) (not b!595186) (not b!595177) (not b!595185) (not start!54516) (not b!595176) (not b!595173) (not b!595175) (not b!595187) (not b!595182) (not b!595179) (not b!595180) (not b!595171) (not b!595184) (not b!595190) (not b!595181))
(check-sat)
