; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54412 () Bool)

(assert start!54412)

(declare-fun b!593951 () Bool)

(declare-fun res!380127 () Bool)

(declare-fun e!339310 () Bool)

(assert (=> b!593951 (=> (not res!380127) (not e!339310))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593951 (= res!380127 (validKeyInArray!0 k!1786))))

(declare-fun b!593952 () Bool)

(declare-fun e!339305 () Bool)

(assert (=> b!593952 (= e!339310 e!339305)))

(declare-fun res!380125 () Bool)

(assert (=> b!593952 (=> (not res!380125) (not e!339305))))

(declare-datatypes ((SeekEntryResult!6179 0))(
  ( (MissingZero!6179 (index!26961 (_ BitVec 32))) (Found!6179 (index!26962 (_ BitVec 32))) (Intermediate!6179 (undefined!6991 Bool) (index!26963 (_ BitVec 32)) (x!55766 (_ BitVec 32))) (Undefined!6179) (MissingVacant!6179 (index!26964 (_ BitVec 32))) )
))
(declare-fun lt!269640 () SeekEntryResult!6179)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!593952 (= res!380125 (or (= lt!269640 (MissingZero!6179 i!1108)) (= lt!269640 (MissingVacant!6179 i!1108))))))

(declare-datatypes ((array!36947 0))(
  ( (array!36948 (arr!17739 (Array (_ BitVec 32) (_ BitVec 64))) (size!18103 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36947)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36947 (_ BitVec 32)) SeekEntryResult!6179)

(assert (=> b!593952 (= lt!269640 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!593954 () Bool)

(declare-fun e!339314 () Bool)

(declare-datatypes ((List!11780 0))(
  ( (Nil!11777) (Cons!11776 (h!12821 (_ BitVec 64)) (t!18008 List!11780)) )
))
(declare-fun contains!2915 (List!11780 (_ BitVec 64)) Bool)

(assert (=> b!593954 (= e!339314 (not (contains!2915 Nil!11777 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593955 () Bool)

(declare-fun e!339318 () Bool)

(declare-fun lt!269646 () SeekEntryResult!6179)

(declare-fun lt!269647 () SeekEntryResult!6179)

(assert (=> b!593955 (= e!339318 (= lt!269646 lt!269647))))

(declare-fun b!593956 () Bool)

(declare-fun e!339316 () Bool)

(assert (=> b!593956 (= e!339316 e!339314)))

(declare-fun res!380143 () Bool)

(assert (=> b!593956 (=> (not res!380143) (not e!339314))))

(assert (=> b!593956 (= res!380143 (not (contains!2915 Nil!11777 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593957 () Bool)

(declare-datatypes ((Unit!18634 0))(
  ( (Unit!18635) )
))
(declare-fun e!339315 () Unit!18634)

(declare-fun Unit!18636 () Unit!18634)

(assert (=> b!593957 (= e!339315 Unit!18636)))

(assert (=> b!593957 false))

(declare-fun b!593958 () Bool)

(declare-fun e!339306 () Bool)

(declare-fun e!339317 () Bool)

(assert (=> b!593958 (= e!339306 e!339317)))

(declare-fun res!380133 () Bool)

(assert (=> b!593958 (=> (not res!380133) (not e!339317))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593958 (= res!380133 (and (= lt!269646 (Found!6179 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17739 a!2986) index!984) (select (arr!17739 a!2986) j!136))) (not (= (select (arr!17739 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36947 (_ BitVec 32)) SeekEntryResult!6179)

(assert (=> b!593958 (= lt!269646 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17739 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593959 () Bool)

(assert (=> b!593959 (= e!339305 e!339306)))

(declare-fun res!380129 () Bool)

(assert (=> b!593959 (=> (not res!380129) (not e!339306))))

(assert (=> b!593959 (= res!380129 (= (select (store (arr!17739 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!269641 () array!36947)

(assert (=> b!593959 (= lt!269641 (array!36948 (store (arr!17739 a!2986) i!1108 k!1786) (size!18103 a!2986)))))

(declare-fun b!593960 () Bool)

(declare-fun res!380144 () Bool)

(assert (=> b!593960 (=> (not res!380144) (not e!339305))))

(declare-fun arrayNoDuplicates!0 (array!36947 (_ BitVec 32) List!11780) Bool)

(assert (=> b!593960 (= res!380144 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11777))))

(declare-fun b!593961 () Bool)

(declare-fun res!380142 () Bool)

(assert (=> b!593961 (=> (not res!380142) (not e!339305))))

(assert (=> b!593961 (= res!380142 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17739 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593962 () Bool)

(declare-fun e!339309 () Bool)

(declare-fun e!339312 () Bool)

(assert (=> b!593962 (= e!339309 e!339312)))

(declare-fun res!380131 () Bool)

(assert (=> b!593962 (=> (not res!380131) (not e!339312))))

(declare-fun arrayContainsKey!0 (array!36947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593962 (= res!380131 (arrayContainsKey!0 lt!269641 (select (arr!17739 a!2986) j!136) j!136))))

(declare-fun res!380128 () Bool)

(assert (=> start!54412 (=> (not res!380128) (not e!339310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54412 (= res!380128 (validMask!0 mask!3053))))

(assert (=> start!54412 e!339310))

(assert (=> start!54412 true))

(declare-fun array_inv!13535 (array!36947) Bool)

(assert (=> start!54412 (array_inv!13535 a!2986)))

(declare-fun b!593953 () Bool)

(declare-fun res!380132 () Bool)

(assert (=> b!593953 (=> (not res!380132) (not e!339305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36947 (_ BitVec 32)) Bool)

(assert (=> b!593953 (= res!380132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593963 () Bool)

(declare-fun e!339313 () Bool)

(assert (=> b!593963 (= e!339317 (not e!339313))))

(declare-fun res!380138 () Bool)

(assert (=> b!593963 (=> res!380138 e!339313)))

(declare-fun lt!269644 () SeekEntryResult!6179)

(assert (=> b!593963 (= res!380138 (not (= lt!269644 (Found!6179 index!984))))))

(declare-fun lt!269648 () Unit!18634)

(assert (=> b!593963 (= lt!269648 e!339315)))

(declare-fun c!67280 () Bool)

(assert (=> b!593963 (= c!67280 (= lt!269644 Undefined!6179))))

(declare-fun lt!269650 () (_ BitVec 64))

(assert (=> b!593963 (= lt!269644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269650 lt!269641 mask!3053))))

(assert (=> b!593963 e!339318))

(declare-fun res!380136 () Bool)

(assert (=> b!593963 (=> (not res!380136) (not e!339318))))

(declare-fun lt!269645 () (_ BitVec 32))

(assert (=> b!593963 (= res!380136 (= lt!269647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269645 vacantSpotIndex!68 lt!269650 lt!269641 mask!3053)))))

(assert (=> b!593963 (= lt!269647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269645 vacantSpotIndex!68 (select (arr!17739 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593963 (= lt!269650 (select (store (arr!17739 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269649 () Unit!18634)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18634)

(assert (=> b!593963 (= lt!269649 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269645 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593963 (= lt!269645 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593964 () Bool)

(declare-fun Unit!18637 () Unit!18634)

(assert (=> b!593964 (= e!339315 Unit!18637)))

(declare-fun b!593965 () Bool)

(declare-fun res!380137 () Bool)

(assert (=> b!593965 (=> (not res!380137) (not e!339310))))

(assert (=> b!593965 (= res!380137 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593966 () Bool)

(declare-fun res!380134 () Bool)

(assert (=> b!593966 (=> (not res!380134) (not e!339310))))

(assert (=> b!593966 (= res!380134 (and (= (size!18103 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18103 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18103 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593967 () Bool)

(declare-fun res!380126 () Bool)

(assert (=> b!593967 (=> res!380126 e!339316)))

(declare-fun noDuplicate!234 (List!11780) Bool)

(assert (=> b!593967 (= res!380126 (not (noDuplicate!234 Nil!11777)))))

(declare-fun b!593968 () Bool)

(declare-fun e!339307 () Bool)

(assert (=> b!593968 (= e!339313 e!339307)))

(declare-fun res!380139 () Bool)

(assert (=> b!593968 (=> res!380139 e!339307)))

(declare-fun lt!269642 () (_ BitVec 64))

(assert (=> b!593968 (= res!380139 (or (not (= (select (arr!17739 a!2986) j!136) lt!269650)) (not (= (select (arr!17739 a!2986) j!136) lt!269642)) (bvsge j!136 index!984)))))

(declare-fun e!339311 () Bool)

(assert (=> b!593968 e!339311))

(declare-fun res!380141 () Bool)

(assert (=> b!593968 (=> (not res!380141) (not e!339311))))

(assert (=> b!593968 (= res!380141 (= lt!269642 (select (arr!17739 a!2986) j!136)))))

(assert (=> b!593968 (= lt!269642 (select (store (arr!17739 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!593969 () Bool)

(assert (=> b!593969 (= e!339312 (arrayContainsKey!0 lt!269641 (select (arr!17739 a!2986) j!136) index!984))))

(declare-fun b!593970 () Bool)

(assert (=> b!593970 (= e!339307 e!339316)))

(declare-fun res!380135 () Bool)

(assert (=> b!593970 (=> res!380135 e!339316)))

(assert (=> b!593970 (= res!380135 (or (bvsgt #b00000000000000000000000000000000 (size!18103 a!2986)) (bvsge (size!18103 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593970 (arrayContainsKey!0 lt!269641 (select (arr!17739 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269643 () Unit!18634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36947 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18634)

(assert (=> b!593970 (= lt!269643 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269641 (select (arr!17739 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593971 () Bool)

(declare-fun res!380140 () Bool)

(assert (=> b!593971 (=> (not res!380140) (not e!339310))))

(assert (=> b!593971 (= res!380140 (validKeyInArray!0 (select (arr!17739 a!2986) j!136)))))

(declare-fun b!593972 () Bool)

(assert (=> b!593972 (= e!339311 e!339309)))

(declare-fun res!380130 () Bool)

(assert (=> b!593972 (=> res!380130 e!339309)))

(assert (=> b!593972 (= res!380130 (or (not (= (select (arr!17739 a!2986) j!136) lt!269650)) (not (= (select (arr!17739 a!2986) j!136) lt!269642)) (bvsge j!136 index!984)))))

(assert (= (and start!54412 res!380128) b!593966))

(assert (= (and b!593966 res!380134) b!593971))

(assert (= (and b!593971 res!380140) b!593951))

(assert (= (and b!593951 res!380127) b!593965))

(assert (= (and b!593965 res!380137) b!593952))

(assert (= (and b!593952 res!380125) b!593953))

(assert (= (and b!593953 res!380132) b!593960))

(assert (= (and b!593960 res!380144) b!593961))

(assert (= (and b!593961 res!380142) b!593959))

(assert (= (and b!593959 res!380129) b!593958))

(assert (= (and b!593958 res!380133) b!593963))

(assert (= (and b!593963 res!380136) b!593955))

(assert (= (and b!593963 c!67280) b!593957))

(assert (= (and b!593963 (not c!67280)) b!593964))

(assert (= (and b!593963 (not res!380138)) b!593968))

(assert (= (and b!593968 res!380141) b!593972))

(assert (= (and b!593972 (not res!380130)) b!593962))

(assert (= (and b!593962 res!380131) b!593969))

(assert (= (and b!593968 (not res!380139)) b!593970))

(assert (= (and b!593970 (not res!380135)) b!593967))

(assert (= (and b!593967 (not res!380126)) b!593956))

(assert (= (and b!593956 res!380143) b!593954))

(declare-fun m!571829 () Bool)

(assert (=> b!593967 m!571829))

(declare-fun m!571831 () Bool)

(assert (=> b!593953 m!571831))

(declare-fun m!571833 () Bool)

(assert (=> b!593952 m!571833))

(declare-fun m!571835 () Bool)

(assert (=> b!593963 m!571835))

(declare-fun m!571837 () Bool)

(assert (=> b!593963 m!571837))

(declare-fun m!571839 () Bool)

(assert (=> b!593963 m!571839))

(declare-fun m!571841 () Bool)

(assert (=> b!593963 m!571841))

(declare-fun m!571843 () Bool)

(assert (=> b!593963 m!571843))

(declare-fun m!571845 () Bool)

(assert (=> b!593963 m!571845))

(declare-fun m!571847 () Bool)

(assert (=> b!593963 m!571847))

(assert (=> b!593963 m!571839))

(declare-fun m!571849 () Bool)

(assert (=> b!593963 m!571849))

(assert (=> b!593959 m!571841))

(declare-fun m!571851 () Bool)

(assert (=> b!593959 m!571851))

(declare-fun m!571853 () Bool)

(assert (=> b!593956 m!571853))

(declare-fun m!571855 () Bool)

(assert (=> b!593951 m!571855))

(declare-fun m!571857 () Bool)

(assert (=> start!54412 m!571857))

(declare-fun m!571859 () Bool)

(assert (=> start!54412 m!571859))

(assert (=> b!593969 m!571839))

(assert (=> b!593969 m!571839))

(declare-fun m!571861 () Bool)

(assert (=> b!593969 m!571861))

(assert (=> b!593968 m!571839))

(assert (=> b!593968 m!571841))

(declare-fun m!571863 () Bool)

(assert (=> b!593968 m!571863))

(assert (=> b!593971 m!571839))

(assert (=> b!593971 m!571839))

(declare-fun m!571865 () Bool)

(assert (=> b!593971 m!571865))

(assert (=> b!593962 m!571839))

(assert (=> b!593962 m!571839))

(declare-fun m!571867 () Bool)

(assert (=> b!593962 m!571867))

(assert (=> b!593972 m!571839))

(declare-fun m!571869 () Bool)

(assert (=> b!593965 m!571869))

(declare-fun m!571871 () Bool)

(assert (=> b!593960 m!571871))

(declare-fun m!571873 () Bool)

(assert (=> b!593958 m!571873))

(assert (=> b!593958 m!571839))

(assert (=> b!593958 m!571839))

(declare-fun m!571875 () Bool)

(assert (=> b!593958 m!571875))

(assert (=> b!593970 m!571839))

(assert (=> b!593970 m!571839))

(declare-fun m!571877 () Bool)

(assert (=> b!593970 m!571877))

(assert (=> b!593970 m!571839))

(declare-fun m!571879 () Bool)

(assert (=> b!593970 m!571879))

(declare-fun m!571881 () Bool)

(assert (=> b!593961 m!571881))

(declare-fun m!571883 () Bool)

(assert (=> b!593954 m!571883))

(push 1)

(assert (not b!593967))

(assert (not b!593970))

(assert (not b!593953))

(assert (not start!54412))

(assert (not b!593958))

(assert (not b!593963))

(assert (not b!593965))

(assert (not b!593971))

(assert (not b!593952))

(assert (not b!593969))

(assert (not b!593960))

(assert (not b!593962))

(assert (not b!593956))

(assert (not b!593951))

(assert (not b!593954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86585 () Bool)

(declare-fun lt!269741 () Bool)

(declare-fun content!236 (List!11780) (Set (_ BitVec 64)))

(assert (=> d!86585 (= lt!269741 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!236 Nil!11777)))))

(declare-fun e!339449 () Bool)

(assert (=> d!86585 (= lt!269741 e!339449)))

(declare-fun res!380302 () Bool)

(assert (=> d!86585 (=> (not res!380302) (not e!339449))))

(assert (=> d!86585 (= res!380302 (is-Cons!11776 Nil!11777))))

(assert (=> d!86585 (= (contains!2915 Nil!11777 #b0000000000000000000000000000000000000000000000000000000000000000) lt!269741)))

(declare-fun b!594160 () Bool)

(declare-fun e!339450 () Bool)

(assert (=> b!594160 (= e!339449 e!339450)))

(declare-fun res!380303 () Bool)

(assert (=> b!594160 (=> res!380303 e!339450)))

(assert (=> b!594160 (= res!380303 (= (h!12821 Nil!11777) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594161 () Bool)

(assert (=> b!594161 (= e!339450 (contains!2915 (t!18008 Nil!11777) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86585 res!380302) b!594160))

(assert (= (and b!594160 (not res!380303)) b!594161))

(declare-fun m!572049 () Bool)

(assert (=> d!86585 m!572049))

(declare-fun m!572051 () Bool)

(assert (=> d!86585 m!572051))

(declare-fun m!572053 () Bool)

(assert (=> b!594161 m!572053))

(assert (=> b!593956 d!86585))

(declare-fun d!86593 () Bool)

(declare-fun res!380308 () Bool)

(declare-fun e!339461 () Bool)

(assert (=> d!86593 (=> res!380308 e!339461)))

(assert (=> d!86593 (= res!380308 (is-Nil!11777 Nil!11777))))

(assert (=> d!86593 (= (noDuplicate!234 Nil!11777) e!339461)))

(declare-fun b!594178 () Bool)

(declare-fun e!339462 () Bool)

(assert (=> b!594178 (= e!339461 e!339462)))

(declare-fun res!380309 () Bool)

(assert (=> b!594178 (=> (not res!380309) (not e!339462))))

(assert (=> b!594178 (= res!380309 (not (contains!2915 (t!18008 Nil!11777) (h!12821 Nil!11777))))))

(declare-fun b!594179 () Bool)

(assert (=> b!594179 (= e!339462 (noDuplicate!234 (t!18008 Nil!11777)))))

(assert (= (and d!86593 (not res!380308)) b!594178))

(assert (= (and b!594178 res!380309) b!594179))

(declare-fun m!572055 () Bool)

(assert (=> b!594178 m!572055))

(declare-fun m!572057 () Bool)

(assert (=> b!594179 m!572057))

