; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56292 () Bool)

(assert start!56292)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!289522 () (_ BitVec 64))

(declare-fun e!357961 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37717 0))(
  ( (array!37718 (arr!18103 (Array (_ BitVec 32) (_ BitVec 64))) (size!18467 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37717)

(declare-fun b!624135 () Bool)

(assert (=> b!624135 (= e!357961 (or (not (= (select (arr!18103 a!2986) j!136) lt!289522)) (= (select (arr!18103 a!2986) j!136) (select (store (arr!18103 a!2986) i!1108 k0!1786) index!984))))))

(assert (=> b!624135 (= (select (store (arr!18103 a!2986) i!1108 k0!1786) index!984) (select (arr!18103 a!2986) j!136))))

(declare-fun b!624136 () Bool)

(declare-fun res!402303 () Bool)

(declare-fun e!357964 () Bool)

(assert (=> b!624136 (=> (not res!402303) (not e!357964))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!624136 (= res!402303 (and (= (size!18467 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18467 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18467 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624137 () Bool)

(declare-fun res!402301 () Bool)

(assert (=> b!624137 (=> (not res!402301) (not e!357964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624137 (= res!402301 (validKeyInArray!0 (select (arr!18103 a!2986) j!136)))))

(declare-fun b!624138 () Bool)

(declare-fun e!357963 () Bool)

(assert (=> b!624138 (= e!357964 e!357963)))

(declare-fun res!402299 () Bool)

(assert (=> b!624138 (=> (not res!402299) (not e!357963))))

(declare-datatypes ((SeekEntryResult!6543 0))(
  ( (MissingZero!6543 (index!28456 (_ BitVec 32))) (Found!6543 (index!28457 (_ BitVec 32))) (Intermediate!6543 (undefined!7355 Bool) (index!28458 (_ BitVec 32)) (x!57218 (_ BitVec 32))) (Undefined!6543) (MissingVacant!6543 (index!28459 (_ BitVec 32))) )
))
(declare-fun lt!289521 () SeekEntryResult!6543)

(assert (=> b!624138 (= res!402299 (or (= lt!289521 (MissingZero!6543 i!1108)) (= lt!289521 (MissingVacant!6543 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37717 (_ BitVec 32)) SeekEntryResult!6543)

(assert (=> b!624138 (= lt!289521 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624139 () Bool)

(declare-fun e!357962 () Bool)

(declare-fun e!357966 () Bool)

(assert (=> b!624139 (= e!357962 e!357966)))

(declare-fun res!402293 () Bool)

(assert (=> b!624139 (=> (not res!402293) (not e!357966))))

(declare-fun lt!289517 () SeekEntryResult!6543)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!624139 (= res!402293 (and (= lt!289517 (Found!6543 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18103 a!2986) index!984) (select (arr!18103 a!2986) j!136))) (not (= (select (arr!18103 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37717 (_ BitVec 32)) SeekEntryResult!6543)

(assert (=> b!624139 (= lt!289517 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18103 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624140 () Bool)

(assert (=> b!624140 (= e!357966 (not e!357961))))

(declare-fun res!402305 () Bool)

(assert (=> b!624140 (=> res!402305 e!357961)))

(declare-fun lt!289516 () SeekEntryResult!6543)

(assert (=> b!624140 (= res!402305 (not (= lt!289516 (Found!6543 index!984))))))

(declare-datatypes ((Unit!21080 0))(
  ( (Unit!21081) )
))
(declare-fun lt!289514 () Unit!21080)

(declare-fun e!357960 () Unit!21080)

(assert (=> b!624140 (= lt!289514 e!357960)))

(declare-fun c!71288 () Bool)

(assert (=> b!624140 (= c!71288 (= lt!289516 Undefined!6543))))

(declare-fun lt!289515 () array!37717)

(assert (=> b!624140 (= lt!289516 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289522 lt!289515 mask!3053))))

(declare-fun e!357959 () Bool)

(assert (=> b!624140 e!357959))

(declare-fun res!402297 () Bool)

(assert (=> b!624140 (=> (not res!402297) (not e!357959))))

(declare-fun lt!289520 () SeekEntryResult!6543)

(declare-fun lt!289519 () (_ BitVec 32))

(assert (=> b!624140 (= res!402297 (= lt!289520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289519 vacantSpotIndex!68 lt!289522 lt!289515 mask!3053)))))

(assert (=> b!624140 (= lt!289520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289519 vacantSpotIndex!68 (select (arr!18103 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624140 (= lt!289522 (select (store (arr!18103 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289518 () Unit!21080)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37717 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21080)

(assert (=> b!624140 (= lt!289518 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289519 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624140 (= lt!289519 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!624141 () Bool)

(declare-fun res!402294 () Bool)

(assert (=> b!624141 (=> (not res!402294) (not e!357964))))

(declare-fun arrayContainsKey!0 (array!37717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624141 (= res!402294 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624142 () Bool)

(assert (=> b!624142 (= e!357963 e!357962)))

(declare-fun res!402296 () Bool)

(assert (=> b!624142 (=> (not res!402296) (not e!357962))))

(assert (=> b!624142 (= res!402296 (= (select (store (arr!18103 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624142 (= lt!289515 (array!37718 (store (arr!18103 a!2986) i!1108 k0!1786) (size!18467 a!2986)))))

(declare-fun b!624143 () Bool)

(declare-fun Unit!21082 () Unit!21080)

(assert (=> b!624143 (= e!357960 Unit!21082)))

(declare-fun b!624144 () Bool)

(assert (=> b!624144 (= e!357959 (= lt!289517 lt!289520))))

(declare-fun res!402295 () Bool)

(assert (=> start!56292 (=> (not res!402295) (not e!357964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56292 (= res!402295 (validMask!0 mask!3053))))

(assert (=> start!56292 e!357964))

(assert (=> start!56292 true))

(declare-fun array_inv!13899 (array!37717) Bool)

(assert (=> start!56292 (array_inv!13899 a!2986)))

(declare-fun b!624145 () Bool)

(declare-fun res!402298 () Bool)

(assert (=> b!624145 (=> (not res!402298) (not e!357964))))

(assert (=> b!624145 (= res!402298 (validKeyInArray!0 k0!1786))))

(declare-fun b!624146 () Bool)

(declare-fun res!402302 () Bool)

(assert (=> b!624146 (=> (not res!402302) (not e!357963))))

(assert (=> b!624146 (= res!402302 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18103 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624147 () Bool)

(declare-fun Unit!21083 () Unit!21080)

(assert (=> b!624147 (= e!357960 Unit!21083)))

(assert (=> b!624147 false))

(declare-fun b!624148 () Bool)

(declare-fun res!402300 () Bool)

(assert (=> b!624148 (=> (not res!402300) (not e!357963))))

(declare-datatypes ((List!12144 0))(
  ( (Nil!12141) (Cons!12140 (h!13185 (_ BitVec 64)) (t!18372 List!12144)) )
))
(declare-fun arrayNoDuplicates!0 (array!37717 (_ BitVec 32) List!12144) Bool)

(assert (=> b!624148 (= res!402300 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12141))))

(declare-fun b!624149 () Bool)

(declare-fun res!402304 () Bool)

(assert (=> b!624149 (=> (not res!402304) (not e!357963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37717 (_ BitVec 32)) Bool)

(assert (=> b!624149 (= res!402304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56292 res!402295) b!624136))

(assert (= (and b!624136 res!402303) b!624137))

(assert (= (and b!624137 res!402301) b!624145))

(assert (= (and b!624145 res!402298) b!624141))

(assert (= (and b!624141 res!402294) b!624138))

(assert (= (and b!624138 res!402299) b!624149))

(assert (= (and b!624149 res!402304) b!624148))

(assert (= (and b!624148 res!402300) b!624146))

(assert (= (and b!624146 res!402302) b!624142))

(assert (= (and b!624142 res!402296) b!624139))

(assert (= (and b!624139 res!402293) b!624140))

(assert (= (and b!624140 res!402297) b!624144))

(assert (= (and b!624140 c!71288) b!624147))

(assert (= (and b!624140 (not c!71288)) b!624143))

(assert (= (and b!624140 (not res!402305)) b!624135))

(declare-fun m!599873 () Bool)

(assert (=> b!624146 m!599873))

(declare-fun m!599875 () Bool)

(assert (=> b!624145 m!599875))

(declare-fun m!599877 () Bool)

(assert (=> b!624148 m!599877))

(declare-fun m!599879 () Bool)

(assert (=> start!56292 m!599879))

(declare-fun m!599881 () Bool)

(assert (=> start!56292 m!599881))

(declare-fun m!599883 () Bool)

(assert (=> b!624140 m!599883))

(declare-fun m!599885 () Bool)

(assert (=> b!624140 m!599885))

(declare-fun m!599887 () Bool)

(assert (=> b!624140 m!599887))

(declare-fun m!599889 () Bool)

(assert (=> b!624140 m!599889))

(assert (=> b!624140 m!599889))

(declare-fun m!599891 () Bool)

(assert (=> b!624140 m!599891))

(declare-fun m!599893 () Bool)

(assert (=> b!624140 m!599893))

(declare-fun m!599895 () Bool)

(assert (=> b!624140 m!599895))

(declare-fun m!599897 () Bool)

(assert (=> b!624140 m!599897))

(declare-fun m!599899 () Bool)

(assert (=> b!624139 m!599899))

(assert (=> b!624139 m!599889))

(assert (=> b!624139 m!599889))

(declare-fun m!599901 () Bool)

(assert (=> b!624139 m!599901))

(assert (=> b!624137 m!599889))

(assert (=> b!624137 m!599889))

(declare-fun m!599903 () Bool)

(assert (=> b!624137 m!599903))

(declare-fun m!599905 () Bool)

(assert (=> b!624138 m!599905))

(declare-fun m!599907 () Bool)

(assert (=> b!624149 m!599907))

(assert (=> b!624135 m!599889))

(assert (=> b!624135 m!599893))

(declare-fun m!599909 () Bool)

(assert (=> b!624135 m!599909))

(declare-fun m!599911 () Bool)

(assert (=> b!624141 m!599911))

(assert (=> b!624142 m!599893))

(declare-fun m!599913 () Bool)

(assert (=> b!624142 m!599913))

(check-sat (not b!624149) (not b!624148) (not b!624141) (not b!624140) (not b!624137) (not b!624145) (not b!624139) (not b!624138) (not start!56292))
(check-sat)
