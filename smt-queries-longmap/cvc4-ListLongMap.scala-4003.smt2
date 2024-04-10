; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54416 () Bool)

(assert start!54416)

(declare-fun b!594083 () Bool)

(declare-fun res!380249 () Bool)

(declare-fun e!339401 () Bool)

(assert (=> b!594083 (=> (not res!380249) (not e!339401))))

(declare-datatypes ((array!36951 0))(
  ( (array!36952 (arr!17741 (Array (_ BitVec 32) (_ BitVec 64))) (size!18105 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36951)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36951 (_ BitVec 32)) Bool)

(assert (=> b!594083 (= res!380249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594084 () Bool)

(declare-fun e!339394 () Bool)

(declare-datatypes ((List!11782 0))(
  ( (Nil!11779) (Cons!11778 (h!12823 (_ BitVec 64)) (t!18010 List!11782)) )
))
(declare-fun contains!2917 (List!11782 (_ BitVec 64)) Bool)

(assert (=> b!594084 (= e!339394 (not (contains!2917 Nil!11779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594085 () Bool)

(declare-fun res!380247 () Bool)

(declare-fun e!339400 () Bool)

(assert (=> b!594085 (=> (not res!380247) (not e!339400))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594085 (= res!380247 (validKeyInArray!0 k!1786))))

(declare-fun b!594086 () Bool)

(declare-datatypes ((Unit!18642 0))(
  ( (Unit!18643) )
))
(declare-fun e!339399 () Unit!18642)

(declare-fun Unit!18644 () Unit!18642)

(assert (=> b!594086 (= e!339399 Unit!18644)))

(assert (=> b!594086 false))

(declare-fun b!594088 () Bool)

(declare-fun res!380256 () Bool)

(assert (=> b!594088 (=> (not res!380256) (not e!339401))))

(declare-fun arrayNoDuplicates!0 (array!36951 (_ BitVec 32) List!11782) Bool)

(assert (=> b!594088 (= res!380256 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11779))))

(declare-fun b!594089 () Bool)

(declare-fun res!380261 () Bool)

(assert (=> b!594089 (=> (not res!380261) (not e!339400))))

(declare-fun arrayContainsKey!0 (array!36951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594089 (= res!380261 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594090 () Bool)

(declare-fun e!339397 () Bool)

(declare-fun e!339390 () Bool)

(assert (=> b!594090 (= e!339397 e!339390)))

(declare-fun res!380264 () Bool)

(assert (=> b!594090 (=> (not res!380264) (not e!339390))))

(declare-fun lt!269706 () array!36951)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!594090 (= res!380264 (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) j!136))))

(declare-fun b!594091 () Bool)

(declare-fun res!380250 () Bool)

(assert (=> b!594091 (=> (not res!380250) (not e!339401))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594091 (= res!380250 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17741 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594092 () Bool)

(declare-fun Unit!18645 () Unit!18642)

(assert (=> b!594092 (= e!339399 Unit!18645)))

(declare-fun b!594093 () Bool)

(declare-fun e!339393 () Bool)

(assert (=> b!594093 (= e!339393 e!339394)))

(declare-fun res!380252 () Bool)

(assert (=> b!594093 (=> (not res!380252) (not e!339394))))

(assert (=> b!594093 (= res!380252 (not (contains!2917 Nil!11779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594094 () Bool)

(declare-fun e!339396 () Bool)

(assert (=> b!594094 (= e!339396 e!339397)))

(declare-fun res!380253 () Bool)

(assert (=> b!594094 (=> res!380253 e!339397)))

(declare-fun lt!269709 () (_ BitVec 64))

(declare-fun lt!269714 () (_ BitVec 64))

(assert (=> b!594094 (= res!380253 (or (not (= (select (arr!17741 a!2986) j!136) lt!269709)) (not (= (select (arr!17741 a!2986) j!136) lt!269714)) (bvsge j!136 index!984)))))

(declare-fun b!594095 () Bool)

(assert (=> b!594095 (= e!339390 (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) index!984))))

(declare-fun b!594096 () Bool)

(declare-fun e!339398 () Bool)

(declare-datatypes ((SeekEntryResult!6181 0))(
  ( (MissingZero!6181 (index!26969 (_ BitVec 32))) (Found!6181 (index!26970 (_ BitVec 32))) (Intermediate!6181 (undefined!6993 Bool) (index!26971 (_ BitVec 32)) (x!55768 (_ BitVec 32))) (Undefined!6181) (MissingVacant!6181 (index!26972 (_ BitVec 32))) )
))
(declare-fun lt!269716 () SeekEntryResult!6181)

(declare-fun lt!269715 () SeekEntryResult!6181)

(assert (=> b!594096 (= e!339398 (= lt!269716 lt!269715))))

(declare-fun res!380260 () Bool)

(assert (=> start!54416 (=> (not res!380260) (not e!339400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54416 (= res!380260 (validMask!0 mask!3053))))

(assert (=> start!54416 e!339400))

(assert (=> start!54416 true))

(declare-fun array_inv!13537 (array!36951) Bool)

(assert (=> start!54416 (array_inv!13537 a!2986)))

(declare-fun b!594087 () Bool)

(declare-fun res!380254 () Bool)

(assert (=> b!594087 (=> (not res!380254) (not e!339400))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594087 (= res!380254 (and (= (size!18105 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18105 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18105 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594097 () Bool)

(assert (=> b!594097 (= e!339400 e!339401)))

(declare-fun res!380258 () Bool)

(assert (=> b!594097 (=> (not res!380258) (not e!339401))))

(declare-fun lt!269711 () SeekEntryResult!6181)

(assert (=> b!594097 (= res!380258 (or (= lt!269711 (MissingZero!6181 i!1108)) (= lt!269711 (MissingVacant!6181 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36951 (_ BitVec 32)) SeekEntryResult!6181)

(assert (=> b!594097 (= lt!269711 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!594098 () Bool)

(declare-fun e!339391 () Bool)

(assert (=> b!594098 (= e!339401 e!339391)))

(declare-fun res!380257 () Bool)

(assert (=> b!594098 (=> (not res!380257) (not e!339391))))

(assert (=> b!594098 (= res!380257 (= (select (store (arr!17741 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594098 (= lt!269706 (array!36952 (store (arr!17741 a!2986) i!1108 k!1786) (size!18105 a!2986)))))

(declare-fun b!594099 () Bool)

(declare-fun res!380255 () Bool)

(assert (=> b!594099 (=> (not res!380255) (not e!339400))))

(assert (=> b!594099 (= res!380255 (validKeyInArray!0 (select (arr!17741 a!2986) j!136)))))

(declare-fun b!594100 () Bool)

(declare-fun e!339392 () Bool)

(declare-fun e!339395 () Bool)

(assert (=> b!594100 (= e!339392 (not e!339395))))

(declare-fun res!380245 () Bool)

(assert (=> b!594100 (=> res!380245 e!339395)))

(declare-fun lt!269707 () SeekEntryResult!6181)

(assert (=> b!594100 (= res!380245 (not (= lt!269707 (Found!6181 index!984))))))

(declare-fun lt!269708 () Unit!18642)

(assert (=> b!594100 (= lt!269708 e!339399)))

(declare-fun c!67286 () Bool)

(assert (=> b!594100 (= c!67286 (= lt!269707 Undefined!6181))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36951 (_ BitVec 32)) SeekEntryResult!6181)

(assert (=> b!594100 (= lt!269707 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269709 lt!269706 mask!3053))))

(assert (=> b!594100 e!339398))

(declare-fun res!380263 () Bool)

(assert (=> b!594100 (=> (not res!380263) (not e!339398))))

(declare-fun lt!269710 () (_ BitVec 32))

(assert (=> b!594100 (= res!380263 (= lt!269715 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269710 vacantSpotIndex!68 lt!269709 lt!269706 mask!3053)))))

(assert (=> b!594100 (= lt!269715 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269710 vacantSpotIndex!68 (select (arr!17741 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594100 (= lt!269709 (select (store (arr!17741 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269712 () Unit!18642)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36951 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18642)

(assert (=> b!594100 (= lt!269712 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269710 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594100 (= lt!269710 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594101 () Bool)

(declare-fun res!380246 () Bool)

(assert (=> b!594101 (=> res!380246 e!339393)))

(declare-fun noDuplicate!236 (List!11782) Bool)

(assert (=> b!594101 (= res!380246 (not (noDuplicate!236 Nil!11779)))))

(declare-fun b!594102 () Bool)

(declare-fun e!339389 () Bool)

(assert (=> b!594102 (= e!339395 e!339389)))

(declare-fun res!380259 () Bool)

(assert (=> b!594102 (=> res!380259 e!339389)))

(assert (=> b!594102 (= res!380259 (or (not (= (select (arr!17741 a!2986) j!136) lt!269709)) (not (= (select (arr!17741 a!2986) j!136) lt!269714)) (bvsge j!136 index!984)))))

(assert (=> b!594102 e!339396))

(declare-fun res!380248 () Bool)

(assert (=> b!594102 (=> (not res!380248) (not e!339396))))

(assert (=> b!594102 (= res!380248 (= lt!269714 (select (arr!17741 a!2986) j!136)))))

(assert (=> b!594102 (= lt!269714 (select (store (arr!17741 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!594103 () Bool)

(assert (=> b!594103 (= e!339391 e!339392)))

(declare-fun res!380251 () Bool)

(assert (=> b!594103 (=> (not res!380251) (not e!339392))))

(assert (=> b!594103 (= res!380251 (and (= lt!269716 (Found!6181 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17741 a!2986) index!984) (select (arr!17741 a!2986) j!136))) (not (= (select (arr!17741 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594103 (= lt!269716 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17741 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594104 () Bool)

(assert (=> b!594104 (= e!339389 e!339393)))

(declare-fun res!380262 () Bool)

(assert (=> b!594104 (=> res!380262 e!339393)))

(assert (=> b!594104 (= res!380262 (or (bvsgt #b00000000000000000000000000000000 (size!18105 a!2986)) (bvsge (size!18105 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!594104 (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269713 () Unit!18642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36951 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18642)

(assert (=> b!594104 (= lt!269713 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269706 (select (arr!17741 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54416 res!380260) b!594087))

(assert (= (and b!594087 res!380254) b!594099))

(assert (= (and b!594099 res!380255) b!594085))

(assert (= (and b!594085 res!380247) b!594089))

(assert (= (and b!594089 res!380261) b!594097))

(assert (= (and b!594097 res!380258) b!594083))

(assert (= (and b!594083 res!380249) b!594088))

(assert (= (and b!594088 res!380256) b!594091))

(assert (= (and b!594091 res!380250) b!594098))

(assert (= (and b!594098 res!380257) b!594103))

(assert (= (and b!594103 res!380251) b!594100))

(assert (= (and b!594100 res!380263) b!594096))

(assert (= (and b!594100 c!67286) b!594086))

(assert (= (and b!594100 (not c!67286)) b!594092))

(assert (= (and b!594100 (not res!380245)) b!594102))

(assert (= (and b!594102 res!380248) b!594094))

(assert (= (and b!594094 (not res!380253)) b!594090))

(assert (= (and b!594090 res!380264) b!594095))

(assert (= (and b!594102 (not res!380259)) b!594104))

(assert (= (and b!594104 (not res!380262)) b!594101))

(assert (= (and b!594101 (not res!380246)) b!594093))

(assert (= (and b!594093 res!380252) b!594084))

(declare-fun m!571941 () Bool)

(assert (=> b!594083 m!571941))

(declare-fun m!571943 () Bool)

(assert (=> b!594101 m!571943))

(declare-fun m!571945 () Bool)

(assert (=> b!594088 m!571945))

(declare-fun m!571947 () Bool)

(assert (=> b!594100 m!571947))

(declare-fun m!571949 () Bool)

(assert (=> b!594100 m!571949))

(declare-fun m!571951 () Bool)

(assert (=> b!594100 m!571951))

(declare-fun m!571953 () Bool)

(assert (=> b!594100 m!571953))

(declare-fun m!571955 () Bool)

(assert (=> b!594100 m!571955))

(assert (=> b!594100 m!571951))

(declare-fun m!571957 () Bool)

(assert (=> b!594100 m!571957))

(declare-fun m!571959 () Bool)

(assert (=> b!594100 m!571959))

(declare-fun m!571961 () Bool)

(assert (=> b!594100 m!571961))

(declare-fun m!571963 () Bool)

(assert (=> b!594103 m!571963))

(assert (=> b!594103 m!571951))

(assert (=> b!594103 m!571951))

(declare-fun m!571965 () Bool)

(assert (=> b!594103 m!571965))

(declare-fun m!571967 () Bool)

(assert (=> b!594085 m!571967))

(assert (=> b!594095 m!571951))

(assert (=> b!594095 m!571951))

(declare-fun m!571969 () Bool)

(assert (=> b!594095 m!571969))

(declare-fun m!571971 () Bool)

(assert (=> b!594089 m!571971))

(declare-fun m!571973 () Bool)

(assert (=> b!594097 m!571973))

(assert (=> b!594094 m!571951))

(declare-fun m!571975 () Bool)

(assert (=> b!594091 m!571975))

(declare-fun m!571977 () Bool)

(assert (=> b!594084 m!571977))

(assert (=> b!594102 m!571951))

(assert (=> b!594102 m!571953))

(declare-fun m!571979 () Bool)

(assert (=> b!594102 m!571979))

(assert (=> b!594098 m!571953))

(declare-fun m!571981 () Bool)

(assert (=> b!594098 m!571981))

(assert (=> b!594090 m!571951))

(assert (=> b!594090 m!571951))

(declare-fun m!571983 () Bool)

(assert (=> b!594090 m!571983))

(assert (=> b!594104 m!571951))

(assert (=> b!594104 m!571951))

(declare-fun m!571985 () Bool)

(assert (=> b!594104 m!571985))

(assert (=> b!594104 m!571951))

(declare-fun m!571987 () Bool)

(assert (=> b!594104 m!571987))

(declare-fun m!571989 () Bool)

(assert (=> b!594093 m!571989))

(declare-fun m!571991 () Bool)

(assert (=> start!54416 m!571991))

(declare-fun m!571993 () Bool)

(assert (=> start!54416 m!571993))

(assert (=> b!594099 m!571951))

(assert (=> b!594099 m!571951))

(declare-fun m!571995 () Bool)

(assert (=> b!594099 m!571995))

(push 1)

(assert (not b!594093))

(assert (not b!594095))

(assert (not b!594089))

(assert (not b!594101))

(assert (not b!594090))

(assert (not b!594088))

(assert (not b!594084))

(assert (not b!594099))

(assert (not start!54416))

(assert (not b!594083))

(assert (not b!594100))

(assert (not b!594085))

(assert (not b!594103))

(assert (not b!594104))

(assert (not b!594097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86579 () Bool)

(assert (=> d!86579 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!594085 d!86579))

(declare-fun d!86583 () Bool)

(declare-fun res!380288 () Bool)

(declare-fun e!339435 () Bool)

(assert (=> d!86583 (=> res!380288 e!339435)))

(assert (=> d!86583 (= res!380288 (= (select (arr!17741 lt!269706) index!984) (select (arr!17741 a!2986) j!136)))))

(assert (=> d!86583 (= (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) index!984) e!339435)))

(declare-fun b!594146 () Bool)

(declare-fun e!339436 () Bool)

(assert (=> b!594146 (= e!339435 e!339436)))

(declare-fun res!380289 () Bool)

(assert (=> b!594146 (=> (not res!380289) (not e!339436))))

(assert (=> b!594146 (= res!380289 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18105 lt!269706)))))

(declare-fun b!594147 () Bool)

(assert (=> b!594147 (= e!339436 (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86583 (not res!380288)) b!594146))

(assert (= (and b!594146 res!380289) b!594147))

(declare-fun m!572035 () Bool)

(assert (=> d!86583 m!572035))

(assert (=> b!594147 m!571951))

(declare-fun m!572037 () Bool)

(assert (=> b!594147 m!572037))

(assert (=> b!594095 d!86583))

(declare-fun d!86587 () Bool)

(declare-fun lt!269739 () Bool)

(declare-fun content!235 (List!11782) (Set (_ BitVec 64)))

(assert (=> d!86587 (= lt!269739 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!235 Nil!11779)))))

(declare-fun e!339446 () Bool)

(assert (=> d!86587 (= lt!269739 e!339446)))

(declare-fun res!380299 () Bool)

(assert (=> d!86587 (=> (not res!380299) (not e!339446))))

(assert (=> d!86587 (= res!380299 (is-Cons!11778 Nil!11779))))

(assert (=> d!86587 (= (contains!2917 Nil!11779 #b1000000000000000000000000000000000000000000000000000000000000000) lt!269739)))

(declare-fun b!594156 () Bool)

(declare-fun e!339445 () Bool)

(assert (=> b!594156 (= e!339446 e!339445)))

(declare-fun res!380298 () Bool)

(assert (=> b!594156 (=> res!380298 e!339445)))

(assert (=> b!594156 (= res!380298 (= (h!12823 Nil!11779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594157 () Bool)

(assert (=> b!594157 (= e!339445 (contains!2917 (t!18010 Nil!11779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86587 res!380299) b!594156))

(assert (= (and b!594156 (not res!380298)) b!594157))

(declare-fun m!572039 () Bool)

(assert (=> d!86587 m!572039))

(declare-fun m!572041 () Bool)

(assert (=> d!86587 m!572041))

(declare-fun m!572043 () Bool)

(assert (=> b!594157 m!572043))

(assert (=> b!594084 d!86587))

(declare-fun d!86589 () Bool)

(declare-fun lt!269740 () Bool)

(assert (=> d!86589 (= lt!269740 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!235 Nil!11779)))))

(declare-fun e!339448 () Bool)

(assert (=> d!86589 (= lt!269740 e!339448)))

(declare-fun res!380301 () Bool)

(assert (=> d!86589 (=> (not res!380301) (not e!339448))))

(assert (=> d!86589 (= res!380301 (is-Cons!11778 Nil!11779))))

(assert (=> d!86589 (= (contains!2917 Nil!11779 #b0000000000000000000000000000000000000000000000000000000000000000) lt!269740)))

(declare-fun b!594158 () Bool)

(declare-fun e!339447 () Bool)

(assert (=> b!594158 (= e!339448 e!339447)))

(declare-fun res!380300 () Bool)

(assert (=> b!594158 (=> res!380300 e!339447)))

(assert (=> b!594158 (= res!380300 (= (h!12823 Nil!11779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594159 () Bool)

(assert (=> b!594159 (= e!339447 (contains!2917 (t!18010 Nil!11779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86589 res!380301) b!594158))

(assert (= (and b!594158 (not res!380300)) b!594159))

(assert (=> d!86589 m!572039))

(declare-fun m!572045 () Bool)

(assert (=> d!86589 m!572045))

(declare-fun m!572047 () Bool)

(assert (=> b!594159 m!572047))

(assert (=> b!594093 d!86589))

(declare-fun d!86591 () Bool)

(declare-fun res!380320 () Bool)

(declare-fun e!339480 () Bool)

(assert (=> d!86591 (=> res!380320 e!339480)))

(assert (=> d!86591 (= res!380320 (bvsge #b00000000000000000000000000000000 (size!18105 a!2986)))))

(assert (=> d!86591 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!339480)))

(declare-fun b!594200 () Bool)

(declare-fun e!339478 () Bool)

(declare-fun e!339479 () Bool)

(assert (=> b!594200 (= e!339478 e!339479)))

(declare-fun lt!269755 () (_ BitVec 64))

(assert (=> b!594200 (= lt!269755 (select (arr!17741 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269757 () Unit!18642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36951 (_ BitVec 64) (_ BitVec 32)) Unit!18642)

(assert (=> b!594200 (= lt!269757 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269755 #b00000000000000000000000000000000))))

(assert (=> b!594200 (arrayContainsKey!0 a!2986 lt!269755 #b00000000000000000000000000000000)))

(declare-fun lt!269756 () Unit!18642)

(assert (=> b!594200 (= lt!269756 lt!269757)))

(declare-fun res!380321 () Bool)

(assert (=> b!594200 (= res!380321 (= (seekEntryOrOpen!0 (select (arr!17741 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6181 #b00000000000000000000000000000000)))))

(assert (=> b!594200 (=> (not res!380321) (not e!339479))))

(declare-fun b!594201 () Bool)

(declare-fun call!32888 () Bool)

(assert (=> b!594201 (= e!339479 call!32888)))

(declare-fun b!594202 () Bool)

(assert (=> b!594202 (= e!339478 call!32888)))

(declare-fun b!594203 () Bool)

(assert (=> b!594203 (= e!339480 e!339478)))

(declare-fun c!67307 () Bool)

(assert (=> b!594203 (= c!67307 (validKeyInArray!0 (select (arr!17741 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32885 () Bool)

(assert (=> bm!32885 (= call!32888 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!86591 (not res!380320)) b!594203))

(assert (= (and b!594203 c!67307) b!594200))

(assert (= (and b!594203 (not c!67307)) b!594202))

(assert (= (and b!594200 res!380321) b!594201))

(assert (= (or b!594201 b!594202) bm!32885))

(declare-fun m!572073 () Bool)

(assert (=> b!594200 m!572073))

(declare-fun m!572075 () Bool)

(assert (=> b!594200 m!572075))

(declare-fun m!572077 () Bool)

(assert (=> b!594200 m!572077))

(assert (=> b!594200 m!572073))

(declare-fun m!572079 () Bool)

(assert (=> b!594200 m!572079))

(assert (=> b!594203 m!572073))

(assert (=> b!594203 m!572073))

(declare-fun m!572081 () Bool)

(assert (=> b!594203 m!572081))

(declare-fun m!572083 () Bool)

(assert (=> bm!32885 m!572083))

(assert (=> b!594083 d!86591))

(declare-fun d!86601 () Bool)

(declare-fun res!380322 () Bool)

(declare-fun e!339481 () Bool)

(assert (=> d!86601 (=> res!380322 e!339481)))

(assert (=> d!86601 (= res!380322 (= (select (arr!17741 lt!269706) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17741 a!2986) j!136)))))

(assert (=> d!86601 (= (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339481)))

(declare-fun b!594204 () Bool)

(declare-fun e!339482 () Bool)

(assert (=> b!594204 (= e!339481 e!339482)))

(declare-fun res!380323 () Bool)

(assert (=> b!594204 (=> (not res!380323) (not e!339482))))

(assert (=> b!594204 (= res!380323 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18105 lt!269706)))))

(declare-fun b!594205 () Bool)

(assert (=> b!594205 (= e!339482 (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86601 (not res!380322)) b!594204))

(assert (= (and b!594204 res!380323) b!594205))

(declare-fun m!572085 () Bool)

(assert (=> d!86601 m!572085))

(assert (=> b!594205 m!571951))

(declare-fun m!572087 () Bool)

(assert (=> b!594205 m!572087))

(assert (=> b!594104 d!86601))

(declare-fun d!86603 () Bool)

(assert (=> d!86603 (arrayContainsKey!0 lt!269706 (select (arr!17741 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269767 () Unit!18642)

(declare-fun choose!114 (array!36951 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18642)

(assert (=> d!86603 (= lt!269767 (choose!114 lt!269706 (select (arr!17741 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86603 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86603 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269706 (select (arr!17741 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269767)))

(declare-fun bs!18321 () Bool)

(assert (= bs!18321 d!86603))

(assert (=> bs!18321 m!571951))

(assert (=> bs!18321 m!571985))

(assert (=> bs!18321 m!571951))

(declare-fun m!572109 () Bool)

(assert (=> bs!18321 m!572109))

(assert (=> b!594104 d!86603))

(declare-fun d!86613 () Bool)

(assert (=> d!86613 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54416 d!86613))

(declare-fun d!86617 () Bool)

(assert (=> d!86617 (= (array_inv!13537 a!2986) (bvsge (size!18105 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54416 d!86617))

(declare-fun b!594272 () Bool)

(declare-fun e!339529 () SeekEntryResult!6181)

(assert (=> b!594272 (= e!339529 (MissingVacant!6181 vacantSpotIndex!68))))

(declare-fun b!594273 () Bool)

(declare-fun e!339528 () SeekEntryResult!6181)

(assert (=> b!594273 (= e!339528 Undefined!6181)))

(declare-fun lt!269793 () SeekEntryResult!6181)

(declare-fun d!86619 () Bool)

(assert (=> d!86619 (and (or (is-Undefined!6181 lt!269793) (not (is-Found!6181 lt!269793)) (and (bvsge (index!26970 lt!269793) #b00000000000000000000000000000000) (bvslt (index!26970 lt!269793) (size!18105 a!2986)))) (or (is-Undefined!6181 lt!269793) (is-Found!6181 lt!269793) (not (is-MissingVacant!6181 lt!269793)) (not (= (index!26972 lt!269793) vacantSpotIndex!68)) (and (bvsge (index!26972 lt!269793) #b00000000000000000000000000000000) (bvslt (index!26972 lt!269793) (size!18105 a!2986)))) (or (is-Undefined!6181 lt!269793) (ite (is-Found!6181 lt!269793) (= (select (arr!17741 a!2986) (index!26970 lt!269793)) (select (arr!17741 a!2986) j!136)) (and (is-MissingVacant!6181 lt!269793) (= (index!26972 lt!269793) vacantSpotIndex!68) (= (select (arr!17741 a!2986) (index!26972 lt!269793)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86619 (= lt!269793 e!339528)))

(declare-fun c!67331 () Bool)

(assert (=> d!86619 (= c!67331 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269794 () (_ BitVec 64))

(assert (=> d!86619 (= lt!269794 (select (arr!17741 a!2986) index!984))))

(assert (=> d!86619 (validMask!0 mask!3053)))

(assert (=> d!86619 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17741 a!2986) j!136) a!2986 mask!3053) lt!269793)))

(declare-fun b!594274 () Bool)

