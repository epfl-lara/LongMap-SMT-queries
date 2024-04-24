; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54558 () Bool)

(assert start!54558)

(declare-fun b!595104 () Bool)

(declare-fun e!340025 () Bool)

(declare-fun e!340032 () Bool)

(assert (=> b!595104 (= e!340025 (not e!340032))))

(declare-fun res!380927 () Bool)

(assert (=> b!595104 (=> res!380927 e!340032)))

(declare-datatypes ((SeekEntryResult!6139 0))(
  ( (MissingZero!6139 (index!26804 (_ BitVec 32))) (Found!6139 (index!26805 (_ BitVec 32))) (Intermediate!6139 (undefined!6951 Bool) (index!26806 (_ BitVec 32)) (x!55762 (_ BitVec 32))) (Undefined!6139) (MissingVacant!6139 (index!26807 (_ BitVec 32))) )
))
(declare-fun lt!270196 () SeekEntryResult!6139)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595104 (= res!380927 (not (= lt!270196 (Found!6139 index!984))))))

(declare-datatypes ((Unit!18649 0))(
  ( (Unit!18650) )
))
(declare-fun lt!270188 () Unit!18649)

(declare-fun e!340033 () Unit!18649)

(assert (=> b!595104 (= lt!270188 e!340033)))

(declare-fun c!67460 () Bool)

(assert (=> b!595104 (= c!67460 (= lt!270196 Undefined!6139))))

(declare-fun lt!270195 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36963 0))(
  ( (array!36964 (arr!17743 (Array (_ BitVec 32) (_ BitVec 64))) (size!18107 (_ BitVec 32))) )
))
(declare-fun lt!270189 () array!36963)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36963 (_ BitVec 32)) SeekEntryResult!6139)

(assert (=> b!595104 (= lt!270196 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270195 lt!270189 mask!3053))))

(declare-fun e!340035 () Bool)

(assert (=> b!595104 e!340035))

(declare-fun res!380922 () Bool)

(assert (=> b!595104 (=> (not res!380922) (not e!340035))))

(declare-fun lt!270191 () (_ BitVec 32))

(declare-fun lt!270190 () SeekEntryResult!6139)

(assert (=> b!595104 (= res!380922 (= lt!270190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270191 vacantSpotIndex!68 lt!270195 lt!270189 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36963)

(assert (=> b!595104 (= lt!270190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270191 vacantSpotIndex!68 (select (arr!17743 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!595104 (= lt!270195 (select (store (arr!17743 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270197 () Unit!18649)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18649)

(assert (=> b!595104 (= lt!270197 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270191 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595104 (= lt!270191 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!595105 () Bool)

(declare-fun e!340026 () Bool)

(assert (=> b!595105 (= e!340032 e!340026)))

(declare-fun res!380936 () Bool)

(assert (=> b!595105 (=> res!380936 e!340026)))

(declare-fun lt!270193 () (_ BitVec 64))

(assert (=> b!595105 (= res!380936 (or (not (= (select (arr!17743 a!2986) j!136) lt!270195)) (not (= (select (arr!17743 a!2986) j!136) lt!270193)) (bvsge j!136 index!984)))))

(declare-fun e!340027 () Bool)

(assert (=> b!595105 e!340027))

(declare-fun res!380938 () Bool)

(assert (=> b!595105 (=> (not res!380938) (not e!340027))))

(assert (=> b!595105 (= res!380938 (= lt!270193 (select (arr!17743 a!2986) j!136)))))

(assert (=> b!595105 (= lt!270193 (select (store (arr!17743 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595106 () Bool)

(declare-fun res!380940 () Bool)

(declare-fun e!340024 () Bool)

(assert (=> b!595106 (=> (not res!380940) (not e!340024))))

(declare-datatypes ((List!11691 0))(
  ( (Nil!11688) (Cons!11687 (h!12735 (_ BitVec 64)) (t!17911 List!11691)) )
))
(declare-fun arrayNoDuplicates!0 (array!36963 (_ BitVec 32) List!11691) Bool)

(assert (=> b!595106 (= res!380940 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11688))))

(declare-fun b!595107 () Bool)

(declare-fun res!380925 () Bool)

(declare-fun e!340029 () Bool)

(assert (=> b!595107 (=> (not res!380925) (not e!340029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595107 (= res!380925 (validKeyInArray!0 k0!1786))))

(declare-fun res!380923 () Bool)

(assert (=> start!54558 (=> (not res!380923) (not e!340029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54558 (= res!380923 (validMask!0 mask!3053))))

(assert (=> start!54558 e!340029))

(assert (=> start!54558 true))

(declare-fun array_inv!13602 (array!36963) Bool)

(assert (=> start!54558 (array_inv!13602 a!2986)))

(declare-fun b!595108 () Bool)

(declare-fun Unit!18651 () Unit!18649)

(assert (=> b!595108 (= e!340033 Unit!18651)))

(declare-fun b!595109 () Bool)

(declare-fun res!380929 () Bool)

(assert (=> b!595109 (=> (not res!380929) (not e!340029))))

(assert (=> b!595109 (= res!380929 (and (= (size!18107 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18107 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18107 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595110 () Bool)

(declare-fun lt!270192 () SeekEntryResult!6139)

(assert (=> b!595110 (= e!340035 (= lt!270192 lt!270190))))

(declare-fun b!595111 () Bool)

(declare-fun res!380934 () Bool)

(declare-fun e!340028 () Bool)

(assert (=> b!595111 (=> res!380934 e!340028)))

(declare-fun noDuplicate!247 (List!11691) Bool)

(assert (=> b!595111 (= res!380934 (not (noDuplicate!247 Nil!11688)))))

(declare-fun b!595112 () Bool)

(declare-fun e!340031 () Bool)

(declare-fun e!340034 () Bool)

(assert (=> b!595112 (= e!340031 e!340034)))

(declare-fun res!380933 () Bool)

(assert (=> b!595112 (=> (not res!380933) (not e!340034))))

(declare-fun arrayContainsKey!0 (array!36963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595112 (= res!380933 (arrayContainsKey!0 lt!270189 (select (arr!17743 a!2986) j!136) j!136))))

(declare-fun b!595113 () Bool)

(declare-fun res!380932 () Bool)

(assert (=> b!595113 (=> res!380932 e!340028)))

(declare-fun contains!2900 (List!11691 (_ BitVec 64)) Bool)

(assert (=> b!595113 (= res!380932 (contains!2900 Nil!11688 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595114 () Bool)

(declare-fun res!380931 () Bool)

(assert (=> b!595114 (=> res!380931 e!340028)))

(assert (=> b!595114 (= res!380931 (contains!2900 Nil!11688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595115 () Bool)

(declare-fun res!380924 () Bool)

(assert (=> b!595115 (=> (not res!380924) (not e!340029))))

(assert (=> b!595115 (= res!380924 (validKeyInArray!0 (select (arr!17743 a!2986) j!136)))))

(declare-fun b!595116 () Bool)

(assert (=> b!595116 (= e!340026 e!340028)))

(declare-fun res!380921 () Bool)

(assert (=> b!595116 (=> res!380921 e!340028)))

(assert (=> b!595116 (= res!380921 (or (bvsge (size!18107 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18107 a!2986))))))

(assert (=> b!595116 (arrayContainsKey!0 lt!270189 (select (arr!17743 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270199 () Unit!18649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36963 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18649)

(assert (=> b!595116 (= lt!270199 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270189 (select (arr!17743 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595117 () Bool)

(declare-fun res!380928 () Bool)

(assert (=> b!595117 (=> (not res!380928) (not e!340029))))

(assert (=> b!595117 (= res!380928 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595118 () Bool)

(assert (=> b!595118 (= e!340034 (arrayContainsKey!0 lt!270189 (select (arr!17743 a!2986) j!136) index!984))))

(declare-fun b!595119 () Bool)

(declare-fun e!340023 () Bool)

(assert (=> b!595119 (= e!340023 e!340025)))

(declare-fun res!380926 () Bool)

(assert (=> b!595119 (=> (not res!380926) (not e!340025))))

(assert (=> b!595119 (= res!380926 (and (= lt!270192 (Found!6139 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17743 a!2986) index!984) (select (arr!17743 a!2986) j!136))) (not (= (select (arr!17743 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595119 (= lt!270192 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17743 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595120 () Bool)

(declare-fun res!380937 () Bool)

(assert (=> b!595120 (=> (not res!380937) (not e!340024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36963 (_ BitVec 32)) Bool)

(assert (=> b!595120 (= res!380937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595121 () Bool)

(assert (=> b!595121 (= e!340029 e!340024)))

(declare-fun res!380930 () Bool)

(assert (=> b!595121 (=> (not res!380930) (not e!340024))))

(declare-fun lt!270194 () SeekEntryResult!6139)

(assert (=> b!595121 (= res!380930 (or (= lt!270194 (MissingZero!6139 i!1108)) (= lt!270194 (MissingVacant!6139 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36963 (_ BitVec 32)) SeekEntryResult!6139)

(assert (=> b!595121 (= lt!270194 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595122 () Bool)

(declare-fun Unit!18652 () Unit!18649)

(assert (=> b!595122 (= e!340033 Unit!18652)))

(assert (=> b!595122 false))

(declare-fun b!595123 () Bool)

(assert (=> b!595123 (= e!340028 true)))

(declare-fun lt!270198 () Bool)

(assert (=> b!595123 (= lt!270198 (contains!2900 Nil!11688 k0!1786))))

(declare-fun b!595124 () Bool)

(declare-fun res!380941 () Bool)

(assert (=> b!595124 (=> (not res!380941) (not e!340024))))

(assert (=> b!595124 (= res!380941 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17743 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595125 () Bool)

(assert (=> b!595125 (= e!340024 e!340023)))

(declare-fun res!380935 () Bool)

(assert (=> b!595125 (=> (not res!380935) (not e!340023))))

(assert (=> b!595125 (= res!380935 (= (select (store (arr!17743 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595125 (= lt!270189 (array!36964 (store (arr!17743 a!2986) i!1108 k0!1786) (size!18107 a!2986)))))

(declare-fun b!595126 () Bool)

(assert (=> b!595126 (= e!340027 e!340031)))

(declare-fun res!380939 () Bool)

(assert (=> b!595126 (=> res!380939 e!340031)))

(assert (=> b!595126 (= res!380939 (or (not (= (select (arr!17743 a!2986) j!136) lt!270195)) (not (= (select (arr!17743 a!2986) j!136) lt!270193)) (bvsge j!136 index!984)))))

(assert (= (and start!54558 res!380923) b!595109))

(assert (= (and b!595109 res!380929) b!595115))

(assert (= (and b!595115 res!380924) b!595107))

(assert (= (and b!595107 res!380925) b!595117))

(assert (= (and b!595117 res!380928) b!595121))

(assert (= (and b!595121 res!380930) b!595120))

(assert (= (and b!595120 res!380937) b!595106))

(assert (= (and b!595106 res!380940) b!595124))

(assert (= (and b!595124 res!380941) b!595125))

(assert (= (and b!595125 res!380935) b!595119))

(assert (= (and b!595119 res!380926) b!595104))

(assert (= (and b!595104 res!380922) b!595110))

(assert (= (and b!595104 c!67460) b!595122))

(assert (= (and b!595104 (not c!67460)) b!595108))

(assert (= (and b!595104 (not res!380927)) b!595105))

(assert (= (and b!595105 res!380938) b!595126))

(assert (= (and b!595126 (not res!380939)) b!595112))

(assert (= (and b!595112 res!380933) b!595118))

(assert (= (and b!595105 (not res!380936)) b!595116))

(assert (= (and b!595116 (not res!380921)) b!595111))

(assert (= (and b!595111 (not res!380934)) b!595114))

(assert (= (and b!595114 (not res!380931)) b!595113))

(assert (= (and b!595113 (not res!380932)) b!595123))

(declare-fun m!573047 () Bool)

(assert (=> b!595104 m!573047))

(declare-fun m!573049 () Bool)

(assert (=> b!595104 m!573049))

(declare-fun m!573051 () Bool)

(assert (=> b!595104 m!573051))

(declare-fun m!573053 () Bool)

(assert (=> b!595104 m!573053))

(assert (=> b!595104 m!573053))

(declare-fun m!573055 () Bool)

(assert (=> b!595104 m!573055))

(declare-fun m!573057 () Bool)

(assert (=> b!595104 m!573057))

(declare-fun m!573059 () Bool)

(assert (=> b!595104 m!573059))

(declare-fun m!573061 () Bool)

(assert (=> b!595104 m!573061))

(declare-fun m!573063 () Bool)

(assert (=> b!595121 m!573063))

(declare-fun m!573065 () Bool)

(assert (=> b!595113 m!573065))

(assert (=> b!595118 m!573053))

(assert (=> b!595118 m!573053))

(declare-fun m!573067 () Bool)

(assert (=> b!595118 m!573067))

(declare-fun m!573069 () Bool)

(assert (=> b!595117 m!573069))

(assert (=> b!595126 m!573053))

(declare-fun m!573071 () Bool)

(assert (=> b!595106 m!573071))

(assert (=> b!595105 m!573053))

(assert (=> b!595105 m!573061))

(declare-fun m!573073 () Bool)

(assert (=> b!595105 m!573073))

(declare-fun m!573075 () Bool)

(assert (=> b!595111 m!573075))

(assert (=> b!595115 m!573053))

(assert (=> b!595115 m!573053))

(declare-fun m!573077 () Bool)

(assert (=> b!595115 m!573077))

(declare-fun m!573079 () Bool)

(assert (=> start!54558 m!573079))

(declare-fun m!573081 () Bool)

(assert (=> start!54558 m!573081))

(declare-fun m!573083 () Bool)

(assert (=> b!595107 m!573083))

(assert (=> b!595112 m!573053))

(assert (=> b!595112 m!573053))

(declare-fun m!573085 () Bool)

(assert (=> b!595112 m!573085))

(declare-fun m!573087 () Bool)

(assert (=> b!595114 m!573087))

(declare-fun m!573089 () Bool)

(assert (=> b!595124 m!573089))

(assert (=> b!595125 m!573061))

(declare-fun m!573091 () Bool)

(assert (=> b!595125 m!573091))

(declare-fun m!573093 () Bool)

(assert (=> b!595123 m!573093))

(declare-fun m!573095 () Bool)

(assert (=> b!595119 m!573095))

(assert (=> b!595119 m!573053))

(assert (=> b!595119 m!573053))

(declare-fun m!573097 () Bool)

(assert (=> b!595119 m!573097))

(declare-fun m!573099 () Bool)

(assert (=> b!595120 m!573099))

(assert (=> b!595116 m!573053))

(assert (=> b!595116 m!573053))

(declare-fun m!573101 () Bool)

(assert (=> b!595116 m!573101))

(assert (=> b!595116 m!573053))

(declare-fun m!573103 () Bool)

(assert (=> b!595116 m!573103))

(check-sat (not b!595121) (not b!595115) (not b!595113) (not b!595104) (not b!595123) (not b!595112) (not b!595114) (not b!595119) (not b!595116) (not b!595118) (not b!595117) (not b!595120) (not start!54558) (not b!595106) (not b!595107) (not b!595111))
(check-sat)
