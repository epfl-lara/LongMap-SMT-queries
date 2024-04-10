; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54172 () Bool)

(assert start!54172)

(declare-fun res!378912 () Bool)

(declare-fun e!338066 () Bool)

(assert (=> start!54172 (=> (not res!378912) (not e!338066))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54172 (= res!378912 (validMask!0 mask!3053))))

(assert (=> start!54172 e!338066))

(assert (=> start!54172 true))

(declare-datatypes ((array!36902 0))(
  ( (array!36903 (arr!17721 (Array (_ BitVec 32) (_ BitVec 64))) (size!18085 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36902)

(declare-fun array_inv!13517 (array!36902) Bool)

(assert (=> start!54172 (array_inv!13517 a!2986)))

(declare-fun b!592028 () Bool)

(declare-fun e!338060 () Bool)

(declare-fun e!338059 () Bool)

(assert (=> b!592028 (= e!338060 e!338059)))

(declare-fun res!378905 () Bool)

(assert (=> b!592028 (=> (not res!378905) (not e!338059))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6161 0))(
  ( (MissingZero!6161 (index!26880 (_ BitVec 32))) (Found!6161 (index!26881 (_ BitVec 32))) (Intermediate!6161 (undefined!6973 Bool) (index!26882 (_ BitVec 32)) (x!55673 (_ BitVec 32))) (Undefined!6161) (MissingVacant!6161 (index!26883 (_ BitVec 32))) )
))
(declare-fun lt!268701 () SeekEntryResult!6161)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592028 (= res!378905 (and (= lt!268701 (Found!6161 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17721 a!2986) index!984) (select (arr!17721 a!2986) j!136))) (not (= (select (arr!17721 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36902 (_ BitVec 32)) SeekEntryResult!6161)

(assert (=> b!592028 (= lt!268701 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17721 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592029 () Bool)

(declare-fun e!338063 () Bool)

(assert (=> b!592029 (= e!338063 (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000))))

(declare-fun lt!268705 () array!36902)

(declare-fun arrayContainsKey!0 (array!36902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592029 (arrayContainsKey!0 lt!268705 (select (arr!17721 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18562 0))(
  ( (Unit!18563) )
))
(declare-fun lt!268702 () Unit!18562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36902 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18562)

(assert (=> b!592029 (= lt!268702 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268705 (select (arr!17721 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592030 () Bool)

(declare-fun res!378911 () Bool)

(declare-fun e!338062 () Bool)

(assert (=> b!592030 (=> (not res!378911) (not e!338062))))

(declare-datatypes ((List!11762 0))(
  ( (Nil!11759) (Cons!11758 (h!12803 (_ BitVec 64)) (t!17990 List!11762)) )
))
(declare-fun arrayNoDuplicates!0 (array!36902 (_ BitVec 32) List!11762) Bool)

(assert (=> b!592030 (= res!378911 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11759))))

(declare-fun b!592031 () Bool)

(declare-fun res!378915 () Bool)

(assert (=> b!592031 (=> (not res!378915) (not e!338066))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!592031 (= res!378915 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592032 () Bool)

(declare-fun e!338069 () Unit!18562)

(declare-fun Unit!18564 () Unit!18562)

(assert (=> b!592032 (= e!338069 Unit!18564)))

(assert (=> b!592032 false))

(declare-fun b!592033 () Bool)

(declare-fun res!378909 () Bool)

(assert (=> b!592033 (=> (not res!378909) (not e!338066))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592033 (= res!378909 (and (= (size!18085 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18085 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18085 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592034 () Bool)

(assert (=> b!592034 (= e!338062 e!338060)))

(declare-fun res!378916 () Bool)

(assert (=> b!592034 (=> (not res!378916) (not e!338060))))

(assert (=> b!592034 (= res!378916 (= (select (store (arr!17721 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592034 (= lt!268705 (array!36903 (store (arr!17721 a!2986) i!1108 k!1786) (size!18085 a!2986)))))

(declare-fun b!592035 () Bool)

(declare-fun e!338065 () Bool)

(declare-fun e!338064 () Bool)

(assert (=> b!592035 (= e!338065 e!338064)))

(declare-fun res!378920 () Bool)

(assert (=> b!592035 (=> res!378920 e!338064)))

(declare-fun lt!268698 () (_ BitVec 64))

(declare-fun lt!268703 () (_ BitVec 64))

(assert (=> b!592035 (= res!378920 (or (not (= (select (arr!17721 a!2986) j!136) lt!268703)) (not (= (select (arr!17721 a!2986) j!136) lt!268698)) (bvsge j!136 index!984)))))

(declare-fun b!592036 () Bool)

(declare-fun res!378910 () Bool)

(assert (=> b!592036 (=> (not res!378910) (not e!338062))))

(assert (=> b!592036 (= res!378910 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17721 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592037 () Bool)

(declare-fun e!338068 () Bool)

(assert (=> b!592037 (= e!338059 (not e!338068))))

(declare-fun res!378913 () Bool)

(assert (=> b!592037 (=> res!378913 e!338068)))

(declare-fun lt!268696 () SeekEntryResult!6161)

(assert (=> b!592037 (= res!378913 (not (= lt!268696 (Found!6161 index!984))))))

(declare-fun lt!268704 () Unit!18562)

(assert (=> b!592037 (= lt!268704 e!338069)))

(declare-fun c!66929 () Bool)

(assert (=> b!592037 (= c!66929 (= lt!268696 Undefined!6161))))

(assert (=> b!592037 (= lt!268696 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268703 lt!268705 mask!3053))))

(declare-fun e!338061 () Bool)

(assert (=> b!592037 e!338061))

(declare-fun res!378919 () Bool)

(assert (=> b!592037 (=> (not res!378919) (not e!338061))))

(declare-fun lt!268700 () SeekEntryResult!6161)

(declare-fun lt!268697 () (_ BitVec 32))

(assert (=> b!592037 (= res!378919 (= lt!268700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268697 vacantSpotIndex!68 lt!268703 lt!268705 mask!3053)))))

(assert (=> b!592037 (= lt!268700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268697 vacantSpotIndex!68 (select (arr!17721 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592037 (= lt!268703 (select (store (arr!17721 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268699 () Unit!18562)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36902 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18562)

(assert (=> b!592037 (= lt!268699 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268697 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592037 (= lt!268697 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592038 () Bool)

(declare-fun res!378906 () Bool)

(assert (=> b!592038 (=> (not res!378906) (not e!338066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592038 (= res!378906 (validKeyInArray!0 k!1786))))

(declare-fun b!592039 () Bool)

(declare-fun e!338070 () Bool)

(assert (=> b!592039 (= e!338064 e!338070)))

(declare-fun res!378918 () Bool)

(assert (=> b!592039 (=> (not res!378918) (not e!338070))))

(assert (=> b!592039 (= res!378918 (arrayContainsKey!0 lt!268705 (select (arr!17721 a!2986) j!136) j!136))))

(declare-fun b!592040 () Bool)

(declare-fun Unit!18565 () Unit!18562)

(assert (=> b!592040 (= e!338069 Unit!18565)))

(declare-fun b!592041 () Bool)

(declare-fun res!378914 () Bool)

(assert (=> b!592041 (=> (not res!378914) (not e!338062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36902 (_ BitVec 32)) Bool)

(assert (=> b!592041 (= res!378914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592042 () Bool)

(assert (=> b!592042 (= e!338070 (arrayContainsKey!0 lt!268705 (select (arr!17721 a!2986) j!136) index!984))))

(declare-fun b!592043 () Bool)

(assert (=> b!592043 (= e!338068 e!338063)))

(declare-fun res!378917 () Bool)

(assert (=> b!592043 (=> res!378917 e!338063)))

(assert (=> b!592043 (= res!378917 (or (not (= (select (arr!17721 a!2986) j!136) lt!268703)) (not (= (select (arr!17721 a!2986) j!136) lt!268698)) (bvsge j!136 index!984)))))

(assert (=> b!592043 e!338065))

(declare-fun res!378907 () Bool)

(assert (=> b!592043 (=> (not res!378907) (not e!338065))))

(assert (=> b!592043 (= res!378907 (= lt!268698 (select (arr!17721 a!2986) j!136)))))

(assert (=> b!592043 (= lt!268698 (select (store (arr!17721 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592044 () Bool)

(assert (=> b!592044 (= e!338066 e!338062)))

(declare-fun res!378904 () Bool)

(assert (=> b!592044 (=> (not res!378904) (not e!338062))))

(declare-fun lt!268695 () SeekEntryResult!6161)

(assert (=> b!592044 (= res!378904 (or (= lt!268695 (MissingZero!6161 i!1108)) (= lt!268695 (MissingVacant!6161 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36902 (_ BitVec 32)) SeekEntryResult!6161)

(assert (=> b!592044 (= lt!268695 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592045 () Bool)

(assert (=> b!592045 (= e!338061 (= lt!268701 lt!268700))))

(declare-fun b!592046 () Bool)

(declare-fun res!378908 () Bool)

(assert (=> b!592046 (=> (not res!378908) (not e!338066))))

(assert (=> b!592046 (= res!378908 (validKeyInArray!0 (select (arr!17721 a!2986) j!136)))))

(assert (= (and start!54172 res!378912) b!592033))

(assert (= (and b!592033 res!378909) b!592046))

(assert (= (and b!592046 res!378908) b!592038))

(assert (= (and b!592038 res!378906) b!592031))

(assert (= (and b!592031 res!378915) b!592044))

(assert (= (and b!592044 res!378904) b!592041))

(assert (= (and b!592041 res!378914) b!592030))

(assert (= (and b!592030 res!378911) b!592036))

(assert (= (and b!592036 res!378910) b!592034))

(assert (= (and b!592034 res!378916) b!592028))

(assert (= (and b!592028 res!378905) b!592037))

(assert (= (and b!592037 res!378919) b!592045))

(assert (= (and b!592037 c!66929) b!592032))

(assert (= (and b!592037 (not c!66929)) b!592040))

(assert (= (and b!592037 (not res!378913)) b!592043))

(assert (= (and b!592043 res!378907) b!592035))

(assert (= (and b!592035 (not res!378920)) b!592039))

(assert (= (and b!592039 res!378918) b!592042))

(assert (= (and b!592043 (not res!378917)) b!592029))

(declare-fun m!570187 () Bool)

(assert (=> b!592044 m!570187))

(declare-fun m!570189 () Bool)

(assert (=> b!592042 m!570189))

(assert (=> b!592042 m!570189))

(declare-fun m!570191 () Bool)

(assert (=> b!592042 m!570191))

(declare-fun m!570193 () Bool)

(assert (=> b!592034 m!570193))

(declare-fun m!570195 () Bool)

(assert (=> b!592034 m!570195))

(declare-fun m!570197 () Bool)

(assert (=> b!592028 m!570197))

(assert (=> b!592028 m!570189))

(assert (=> b!592028 m!570189))

(declare-fun m!570199 () Bool)

(assert (=> b!592028 m!570199))

(declare-fun m!570201 () Bool)

(assert (=> start!54172 m!570201))

(declare-fun m!570203 () Bool)

(assert (=> start!54172 m!570203))

(declare-fun m!570205 () Bool)

(assert (=> b!592030 m!570205))

(declare-fun m!570207 () Bool)

(assert (=> b!592038 m!570207))

(assert (=> b!592046 m!570189))

(assert (=> b!592046 m!570189))

(declare-fun m!570209 () Bool)

(assert (=> b!592046 m!570209))

(assert (=> b!592043 m!570189))

(assert (=> b!592043 m!570193))

(declare-fun m!570211 () Bool)

(assert (=> b!592043 m!570211))

(declare-fun m!570213 () Bool)

(assert (=> b!592041 m!570213))

(declare-fun m!570215 () Bool)

(assert (=> b!592031 m!570215))

(assert (=> b!592029 m!570189))

(assert (=> b!592029 m!570189))

(declare-fun m!570217 () Bool)

(assert (=> b!592029 m!570217))

(assert (=> b!592029 m!570189))

(declare-fun m!570219 () Bool)

(assert (=> b!592029 m!570219))

(declare-fun m!570221 () Bool)

(assert (=> b!592036 m!570221))

(assert (=> b!592039 m!570189))

(assert (=> b!592039 m!570189))

(declare-fun m!570223 () Bool)

(assert (=> b!592039 m!570223))

(assert (=> b!592035 m!570189))

(declare-fun m!570225 () Bool)

(assert (=> b!592037 m!570225))

(declare-fun m!570227 () Bool)

(assert (=> b!592037 m!570227))

(assert (=> b!592037 m!570189))

(assert (=> b!592037 m!570193))

(declare-fun m!570229 () Bool)

(assert (=> b!592037 m!570229))

(assert (=> b!592037 m!570189))

(declare-fun m!570231 () Bool)

(assert (=> b!592037 m!570231))

(declare-fun m!570233 () Bool)

(assert (=> b!592037 m!570233))

(declare-fun m!570235 () Bool)

(assert (=> b!592037 m!570235))

(push 1)

