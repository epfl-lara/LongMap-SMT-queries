; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54260 () Bool)

(assert start!54260)

(declare-fun b!592943 () Bool)

(declare-fun res!379555 () Bool)

(declare-fun e!338648 () Bool)

(assert (=> b!592943 (=> (not res!379555) (not e!338648))))

(declare-datatypes ((array!36927 0))(
  ( (array!36928 (arr!17732 (Array (_ BitVec 32) (_ BitVec 64))) (size!18096 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36927)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36927 (_ BitVec 32)) Bool)

(assert (=> b!592943 (= res!379555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592944 () Bool)

(declare-fun e!338645 () Bool)

(declare-fun e!338647 () Bool)

(assert (=> b!592944 (= e!338645 e!338647)))

(declare-fun res!379566 () Bool)

(assert (=> b!592944 (=> res!379566 e!338647)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!269184 () (_ BitVec 64))

(declare-fun lt!269177 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592944 (= res!379566 (or (not (= (select (arr!17732 a!2986) j!136) lt!269184)) (not (= (select (arr!17732 a!2986) j!136) lt!269177)) (bvsge j!136 index!984)))))

(declare-fun e!338646 () Bool)

(assert (=> b!592944 e!338646))

(declare-fun res!379561 () Bool)

(assert (=> b!592944 (=> (not res!379561) (not e!338646))))

(assert (=> b!592944 (= res!379561 (= lt!269177 (select (arr!17732 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!592944 (= lt!269177 (select (store (arr!17732 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592945 () Bool)

(declare-fun e!338653 () Bool)

(assert (=> b!592945 (= e!338648 e!338653)))

(declare-fun res!379565 () Bool)

(assert (=> b!592945 (=> (not res!379565) (not e!338653))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!592945 (= res!379565 (= (select (store (arr!17732 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!269175 () array!36927)

(assert (=> b!592945 (= lt!269175 (array!36928 (store (arr!17732 a!2986) i!1108 k!1786) (size!18096 a!2986)))))

(declare-fun b!592946 () Bool)

(declare-fun res!379571 () Bool)

(assert (=> b!592946 (=> (not res!379571) (not e!338648))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!592946 (= res!379571 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17732 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!338655 () Bool)

(declare-fun b!592947 () Bool)

(declare-fun arrayContainsKey!0 (array!36927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592947 (= e!338655 (arrayContainsKey!0 lt!269175 (select (arr!17732 a!2986) j!136) index!984))))

(declare-fun b!592948 () Bool)

(declare-datatypes ((Unit!18606 0))(
  ( (Unit!18607) )
))
(declare-fun e!338654 () Unit!18606)

(declare-fun Unit!18608 () Unit!18606)

(assert (=> b!592948 (= e!338654 Unit!18608)))

(declare-fun b!592949 () Bool)

(declare-fun e!338644 () Bool)

(assert (=> b!592949 (= e!338644 (not e!338645))))

(declare-fun res!379564 () Bool)

(assert (=> b!592949 (=> res!379564 e!338645)))

(declare-datatypes ((SeekEntryResult!6172 0))(
  ( (MissingZero!6172 (index!26927 (_ BitVec 32))) (Found!6172 (index!26928 (_ BitVec 32))) (Intermediate!6172 (undefined!6984 Bool) (index!26929 (_ BitVec 32)) (x!55717 (_ BitVec 32))) (Undefined!6172) (MissingVacant!6172 (index!26930 (_ BitVec 32))) )
))
(declare-fun lt!269185 () SeekEntryResult!6172)

(assert (=> b!592949 (= res!379564 (not (= lt!269185 (Found!6172 index!984))))))

(declare-fun lt!269180 () Unit!18606)

(assert (=> b!592949 (= lt!269180 e!338654)))

(declare-fun c!67061 () Bool)

(assert (=> b!592949 (= c!67061 (= lt!269185 Undefined!6172))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36927 (_ BitVec 32)) SeekEntryResult!6172)

(assert (=> b!592949 (= lt!269185 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269184 lt!269175 mask!3053))))

(declare-fun e!338651 () Bool)

(assert (=> b!592949 e!338651))

(declare-fun res!379557 () Bool)

(assert (=> b!592949 (=> (not res!379557) (not e!338651))))

(declare-fun lt!269179 () SeekEntryResult!6172)

(declare-fun lt!269182 () (_ BitVec 32))

(assert (=> b!592949 (= res!379557 (= lt!269179 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269182 vacantSpotIndex!68 lt!269184 lt!269175 mask!3053)))))

(assert (=> b!592949 (= lt!269179 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269182 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592949 (= lt!269184 (select (store (arr!17732 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269183 () Unit!18606)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36927 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18606)

(assert (=> b!592949 (= lt!269183 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269182 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592949 (= lt!269182 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!379570 () Bool)

(declare-fun e!338652 () Bool)

(assert (=> start!54260 (=> (not res!379570) (not e!338652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54260 (= res!379570 (validMask!0 mask!3053))))

(assert (=> start!54260 e!338652))

(assert (=> start!54260 true))

(declare-fun array_inv!13528 (array!36927) Bool)

(assert (=> start!54260 (array_inv!13528 a!2986)))

(declare-fun b!592950 () Bool)

(declare-fun e!338649 () Bool)

(assert (=> b!592950 (= e!338646 e!338649)))

(declare-fun res!379567 () Bool)

(assert (=> b!592950 (=> res!379567 e!338649)))

(assert (=> b!592950 (= res!379567 (or (not (= (select (arr!17732 a!2986) j!136) lt!269184)) (not (= (select (arr!17732 a!2986) j!136) lt!269177)) (bvsge j!136 index!984)))))

(declare-fun b!592951 () Bool)

(declare-fun Unit!18609 () Unit!18606)

(assert (=> b!592951 (= e!338654 Unit!18609)))

(assert (=> b!592951 false))

(declare-fun b!592952 () Bool)

(declare-fun res!379562 () Bool)

(assert (=> b!592952 (=> (not res!379562) (not e!338652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592952 (= res!379562 (validKeyInArray!0 k!1786))))

(declare-fun b!592953 () Bool)

(declare-fun res!379569 () Bool)

(assert (=> b!592953 (=> (not res!379569) (not e!338652))))

(assert (=> b!592953 (= res!379569 (validKeyInArray!0 (select (arr!17732 a!2986) j!136)))))

(declare-fun b!592954 () Bool)

(assert (=> b!592954 (= e!338653 e!338644)))

(declare-fun res!379568 () Bool)

(assert (=> b!592954 (=> (not res!379568) (not e!338644))))

(declare-fun lt!269178 () SeekEntryResult!6172)

(assert (=> b!592954 (= res!379568 (and (= lt!269178 (Found!6172 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17732 a!2986) index!984) (select (arr!17732 a!2986) j!136))) (not (= (select (arr!17732 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592954 (= lt!269178 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592955 () Bool)

(declare-fun res!379559 () Bool)

(assert (=> b!592955 (=> (not res!379559) (not e!338652))))

(assert (=> b!592955 (= res!379559 (and (= (size!18096 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18096 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18096 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592956 () Bool)

(assert (=> b!592956 (= e!338651 (= lt!269178 lt!269179))))

(declare-fun b!592957 () Bool)

(assert (=> b!592957 (= e!338649 e!338655)))

(declare-fun res!379558 () Bool)

(assert (=> b!592957 (=> (not res!379558) (not e!338655))))

(assert (=> b!592957 (= res!379558 (arrayContainsKey!0 lt!269175 (select (arr!17732 a!2986) j!136) j!136))))

(declare-fun b!592958 () Bool)

(declare-fun res!379556 () Bool)

(assert (=> b!592958 (=> (not res!379556) (not e!338648))))

(declare-datatypes ((List!11773 0))(
  ( (Nil!11770) (Cons!11769 (h!12814 (_ BitVec 64)) (t!18001 List!11773)) )
))
(declare-fun arrayNoDuplicates!0 (array!36927 (_ BitVec 32) List!11773) Bool)

(assert (=> b!592958 (= res!379556 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11770))))

(declare-fun b!592959 () Bool)

(declare-fun res!379560 () Bool)

(assert (=> b!592959 (=> (not res!379560) (not e!338652))))

(assert (=> b!592959 (= res!379560 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592960 () Bool)

(assert (=> b!592960 (= e!338652 e!338648)))

(declare-fun res!379563 () Bool)

(assert (=> b!592960 (=> (not res!379563) (not e!338648))))

(declare-fun lt!269176 () SeekEntryResult!6172)

(assert (=> b!592960 (= res!379563 (or (= lt!269176 (MissingZero!6172 i!1108)) (= lt!269176 (MissingVacant!6172 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36927 (_ BitVec 32)) SeekEntryResult!6172)

(assert (=> b!592960 (= lt!269176 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592961 () Bool)

(assert (=> b!592961 (= e!338647 (bvsle #b00000000000000000000000000000000 (size!18096 a!2986)))))

(assert (=> b!592961 (arrayContainsKey!0 lt!269175 (select (arr!17732 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269181 () Unit!18606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36927 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18606)

(assert (=> b!592961 (= lt!269181 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269175 (select (arr!17732 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54260 res!379570) b!592955))

(assert (= (and b!592955 res!379559) b!592953))

(assert (= (and b!592953 res!379569) b!592952))

(assert (= (and b!592952 res!379562) b!592959))

(assert (= (and b!592959 res!379560) b!592960))

(assert (= (and b!592960 res!379563) b!592943))

(assert (= (and b!592943 res!379555) b!592958))

(assert (= (and b!592958 res!379556) b!592946))

(assert (= (and b!592946 res!379571) b!592945))

(assert (= (and b!592945 res!379565) b!592954))

(assert (= (and b!592954 res!379568) b!592949))

(assert (= (and b!592949 res!379557) b!592956))

(assert (= (and b!592949 c!67061) b!592951))

(assert (= (and b!592949 (not c!67061)) b!592948))

(assert (= (and b!592949 (not res!379564)) b!592944))

(assert (= (and b!592944 res!379561) b!592950))

(assert (= (and b!592950 (not res!379567)) b!592957))

(assert (= (and b!592957 res!379558) b!592947))

(assert (= (and b!592944 (not res!379566)) b!592961))

(declare-fun m!570983 () Bool)

(assert (=> b!592957 m!570983))

(assert (=> b!592957 m!570983))

(declare-fun m!570985 () Bool)

(assert (=> b!592957 m!570985))

(declare-fun m!570987 () Bool)

(assert (=> b!592952 m!570987))

(declare-fun m!570989 () Bool)

(assert (=> b!592945 m!570989))

(declare-fun m!570991 () Bool)

(assert (=> b!592945 m!570991))

(assert (=> b!592950 m!570983))

(declare-fun m!570993 () Bool)

(assert (=> b!592954 m!570993))

(assert (=> b!592954 m!570983))

(assert (=> b!592954 m!570983))

(declare-fun m!570995 () Bool)

(assert (=> b!592954 m!570995))

(declare-fun m!570997 () Bool)

(assert (=> b!592943 m!570997))

(declare-fun m!570999 () Bool)

(assert (=> start!54260 m!570999))

(declare-fun m!571001 () Bool)

(assert (=> start!54260 m!571001))

(assert (=> b!592953 m!570983))

(assert (=> b!592953 m!570983))

(declare-fun m!571003 () Bool)

(assert (=> b!592953 m!571003))

(declare-fun m!571005 () Bool)

(assert (=> b!592949 m!571005))

(declare-fun m!571007 () Bool)

(assert (=> b!592949 m!571007))

(declare-fun m!571009 () Bool)

(assert (=> b!592949 m!571009))

(assert (=> b!592949 m!570983))

(assert (=> b!592949 m!570989))

(declare-fun m!571011 () Bool)

(assert (=> b!592949 m!571011))

(declare-fun m!571013 () Bool)

(assert (=> b!592949 m!571013))

(assert (=> b!592949 m!570983))

(declare-fun m!571015 () Bool)

(assert (=> b!592949 m!571015))

(assert (=> b!592961 m!570983))

(assert (=> b!592961 m!570983))

(declare-fun m!571017 () Bool)

(assert (=> b!592961 m!571017))

(assert (=> b!592961 m!570983))

(declare-fun m!571019 () Bool)

(assert (=> b!592961 m!571019))

(assert (=> b!592947 m!570983))

(assert (=> b!592947 m!570983))

(declare-fun m!571021 () Bool)

(assert (=> b!592947 m!571021))

(assert (=> b!592944 m!570983))

(assert (=> b!592944 m!570989))

(declare-fun m!571023 () Bool)

(assert (=> b!592944 m!571023))

(declare-fun m!571025 () Bool)

(assert (=> b!592959 m!571025))

(declare-fun m!571027 () Bool)

(assert (=> b!592958 m!571027))

(declare-fun m!571029 () Bool)

(assert (=> b!592946 m!571029))

(declare-fun m!571031 () Bool)

(assert (=> b!592960 m!571031))

(push 1)

