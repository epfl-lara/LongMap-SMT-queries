; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54560 () Bool)

(assert start!54560)

(declare-fun b!596689 () Bool)

(declare-datatypes ((Unit!18774 0))(
  ( (Unit!18775) )
))
(declare-fun e!340910 () Unit!18774)

(declare-fun Unit!18776 () Unit!18774)

(assert (=> b!596689 (= e!340910 Unit!18776)))

(assert (=> b!596689 false))

(declare-fun b!596690 () Bool)

(declare-fun res!382456 () Bool)

(declare-fun e!340914 () Bool)

(assert (=> b!596690 (=> (not res!382456) (not e!340914))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37020 0))(
  ( (array!37021 (arr!17774 (Array (_ BitVec 32) (_ BitVec 64))) (size!18138 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37020)

(assert (=> b!596690 (= res!382456 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17774 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596691 () Bool)

(declare-fun res!382470 () Bool)

(declare-fun e!340908 () Bool)

(assert (=> b!596691 (=> res!382470 e!340908)))

(declare-datatypes ((List!11815 0))(
  ( (Nil!11812) (Cons!11811 (h!12856 (_ BitVec 64)) (t!18043 List!11815)) )
))
(declare-fun noDuplicate!269 (List!11815) Bool)

(assert (=> b!596691 (= res!382470 (not (noDuplicate!269 Nil!11812)))))

(declare-fun b!596692 () Bool)

(declare-fun res!382475 () Bool)

(declare-fun e!340919 () Bool)

(assert (=> b!596692 (=> (not res!382475) (not e!340919))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596692 (= res!382475 (and (= (size!18138 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18138 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18138 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596693 () Bool)

(declare-fun res!382463 () Bool)

(assert (=> b!596693 (=> (not res!382463) (not e!340919))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596693 (= res!382463 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596694 () Bool)

(declare-fun e!340911 () Bool)

(declare-fun e!340912 () Bool)

(assert (=> b!596694 (= e!340911 e!340912)))

(declare-fun res!382469 () Bool)

(assert (=> b!596694 (=> (not res!382469) (not e!340912))))

(declare-datatypes ((SeekEntryResult!6214 0))(
  ( (MissingZero!6214 (index!27104 (_ BitVec 32))) (Found!6214 (index!27105 (_ BitVec 32))) (Intermediate!6214 (undefined!7026 Bool) (index!27106 (_ BitVec 32)) (x!55898 (_ BitVec 32))) (Undefined!6214) (MissingVacant!6214 (index!27107 (_ BitVec 32))) )
))
(declare-fun lt!271022 () SeekEntryResult!6214)

(assert (=> b!596694 (= res!382469 (and (= lt!271022 (Found!6214 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17774 a!2986) index!984) (select (arr!17774 a!2986) j!136))) (not (= (select (arr!17774 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37020 (_ BitVec 32)) SeekEntryResult!6214)

(assert (=> b!596694 (= lt!271022 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17774 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!382472 () Bool)

(assert (=> start!54560 (=> (not res!382472) (not e!340919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54560 (= res!382472 (validMask!0 mask!3053))))

(assert (=> start!54560 e!340919))

(assert (=> start!54560 true))

(declare-fun array_inv!13570 (array!37020) Bool)

(assert (=> start!54560 (array_inv!13570 a!2986)))

(declare-fun b!596695 () Bool)

(declare-fun e!340920 () Bool)

(declare-fun lt!271030 () SeekEntryResult!6214)

(assert (=> b!596695 (= e!340920 (= lt!271022 lt!271030))))

(declare-fun b!596696 () Bool)

(declare-fun e!340916 () Bool)

(declare-fun e!340918 () Bool)

(assert (=> b!596696 (= e!340916 e!340918)))

(declare-fun res!382464 () Bool)

(assert (=> b!596696 (=> res!382464 e!340918)))

(declare-fun lt!271027 () (_ BitVec 64))

(declare-fun lt!271025 () (_ BitVec 64))

(assert (=> b!596696 (= res!382464 (or (not (= (select (arr!17774 a!2986) j!136) lt!271025)) (not (= (select (arr!17774 a!2986) j!136) lt!271027)) (bvsge j!136 index!984)))))

(declare-fun e!340917 () Bool)

(assert (=> b!596696 e!340917))

(declare-fun res!382471 () Bool)

(assert (=> b!596696 (=> (not res!382471) (not e!340917))))

(assert (=> b!596696 (= res!382471 (= lt!271027 (select (arr!17774 a!2986) j!136)))))

(assert (=> b!596696 (= lt!271027 (select (store (arr!17774 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596697 () Bool)

(declare-fun res!382474 () Bool)

(assert (=> b!596697 (=> (not res!382474) (not e!340914))))

(declare-fun arrayNoDuplicates!0 (array!37020 (_ BitVec 32) List!11815) Bool)

(assert (=> b!596697 (= res!382474 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11812))))

(declare-fun b!596698 () Bool)

(declare-fun res!382459 () Bool)

(assert (=> b!596698 (=> res!382459 e!340908)))

(declare-fun contains!2950 (List!11815 (_ BitVec 64)) Bool)

(assert (=> b!596698 (= res!382459 (contains!2950 Nil!11812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596699 () Bool)

(declare-fun lt!271029 () array!37020)

(declare-fun e!340909 () Bool)

(assert (=> b!596699 (= e!340909 (arrayContainsKey!0 lt!271029 (select (arr!17774 a!2986) j!136) index!984))))

(declare-fun b!596700 () Bool)

(assert (=> b!596700 (= e!340919 e!340914)))

(declare-fun res!382465 () Bool)

(assert (=> b!596700 (=> (not res!382465) (not e!340914))))

(declare-fun lt!271026 () SeekEntryResult!6214)

(assert (=> b!596700 (= res!382465 (or (= lt!271026 (MissingZero!6214 i!1108)) (= lt!271026 (MissingVacant!6214 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37020 (_ BitVec 32)) SeekEntryResult!6214)

(assert (=> b!596700 (= lt!271026 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596701 () Bool)

(assert (=> b!596701 (= e!340918 e!340908)))

(declare-fun res!382458 () Bool)

(assert (=> b!596701 (=> res!382458 e!340908)))

(assert (=> b!596701 (= res!382458 (or (bvsge (size!18138 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18138 a!2986))))))

(assert (=> b!596701 (arrayContainsKey!0 lt!271029 (select (arr!17774 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271028 () Unit!18774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18774)

(assert (=> b!596701 (= lt!271028 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271029 (select (arr!17774 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596702 () Bool)

(assert (=> b!596702 (= e!340912 (not e!340916))))

(declare-fun res!382468 () Bool)

(assert (=> b!596702 (=> res!382468 e!340916)))

(declare-fun lt!271024 () SeekEntryResult!6214)

(assert (=> b!596702 (= res!382468 (not (= lt!271024 (Found!6214 index!984))))))

(declare-fun lt!271032 () Unit!18774)

(assert (=> b!596702 (= lt!271032 e!340910)))

(declare-fun c!67484 () Bool)

(assert (=> b!596702 (= c!67484 (= lt!271024 Undefined!6214))))

(assert (=> b!596702 (= lt!271024 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271025 lt!271029 mask!3053))))

(assert (=> b!596702 e!340920))

(declare-fun res!382466 () Bool)

(assert (=> b!596702 (=> (not res!382466) (not e!340920))))

(declare-fun lt!271023 () (_ BitVec 32))

(assert (=> b!596702 (= res!382466 (= lt!271030 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271023 vacantSpotIndex!68 lt!271025 lt!271029 mask!3053)))))

(assert (=> b!596702 (= lt!271030 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271023 vacantSpotIndex!68 (select (arr!17774 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596702 (= lt!271025 (select (store (arr!17774 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271031 () Unit!18774)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37020 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18774)

(assert (=> b!596702 (= lt!271031 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271023 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596702 (= lt!271023 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596703 () Bool)

(declare-fun Unit!18777 () Unit!18774)

(assert (=> b!596703 (= e!340910 Unit!18777)))

(declare-fun b!596704 () Bool)

(assert (=> b!596704 (= e!340908 true)))

(declare-fun lt!271033 () Bool)

(assert (=> b!596704 (= lt!271033 (contains!2950 Nil!11812 k!1786))))

(declare-fun b!596705 () Bool)

(declare-fun res!382473 () Bool)

(assert (=> b!596705 (=> (not res!382473) (not e!340919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596705 (= res!382473 (validKeyInArray!0 k!1786))))

(declare-fun b!596706 () Bool)

(declare-fun e!340913 () Bool)

(assert (=> b!596706 (= e!340917 e!340913)))

(declare-fun res!382455 () Bool)

(assert (=> b!596706 (=> res!382455 e!340913)))

(assert (=> b!596706 (= res!382455 (or (not (= (select (arr!17774 a!2986) j!136) lt!271025)) (not (= (select (arr!17774 a!2986) j!136) lt!271027)) (bvsge j!136 index!984)))))

(declare-fun b!596707 () Bool)

(declare-fun res!382461 () Bool)

(assert (=> b!596707 (=> (not res!382461) (not e!340914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37020 (_ BitVec 32)) Bool)

(assert (=> b!596707 (= res!382461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596708 () Bool)

(assert (=> b!596708 (= e!340913 e!340909)))

(declare-fun res!382457 () Bool)

(assert (=> b!596708 (=> (not res!382457) (not e!340909))))

(assert (=> b!596708 (= res!382457 (arrayContainsKey!0 lt!271029 (select (arr!17774 a!2986) j!136) j!136))))

(declare-fun b!596709 () Bool)

(declare-fun res!382467 () Bool)

(assert (=> b!596709 (=> res!382467 e!340908)))

(assert (=> b!596709 (= res!382467 (contains!2950 Nil!11812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596710 () Bool)

(assert (=> b!596710 (= e!340914 e!340911)))

(declare-fun res!382462 () Bool)

(assert (=> b!596710 (=> (not res!382462) (not e!340911))))

(assert (=> b!596710 (= res!382462 (= (select (store (arr!17774 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596710 (= lt!271029 (array!37021 (store (arr!17774 a!2986) i!1108 k!1786) (size!18138 a!2986)))))

(declare-fun b!596711 () Bool)

(declare-fun res!382460 () Bool)

(assert (=> b!596711 (=> (not res!382460) (not e!340919))))

(assert (=> b!596711 (= res!382460 (validKeyInArray!0 (select (arr!17774 a!2986) j!136)))))

(assert (= (and start!54560 res!382472) b!596692))

(assert (= (and b!596692 res!382475) b!596711))

(assert (= (and b!596711 res!382460) b!596705))

(assert (= (and b!596705 res!382473) b!596693))

(assert (= (and b!596693 res!382463) b!596700))

(assert (= (and b!596700 res!382465) b!596707))

(assert (= (and b!596707 res!382461) b!596697))

(assert (= (and b!596697 res!382474) b!596690))

(assert (= (and b!596690 res!382456) b!596710))

(assert (= (and b!596710 res!382462) b!596694))

(assert (= (and b!596694 res!382469) b!596702))

(assert (= (and b!596702 res!382466) b!596695))

(assert (= (and b!596702 c!67484) b!596689))

(assert (= (and b!596702 (not c!67484)) b!596703))

(assert (= (and b!596702 (not res!382468)) b!596696))

(assert (= (and b!596696 res!382471) b!596706))

(assert (= (and b!596706 (not res!382455)) b!596708))

(assert (= (and b!596708 res!382457) b!596699))

(assert (= (and b!596696 (not res!382464)) b!596701))

(assert (= (and b!596701 (not res!382458)) b!596691))

(assert (= (and b!596691 (not res!382470)) b!596709))

(assert (= (and b!596709 (not res!382467)) b!596698))

(assert (= (and b!596698 (not res!382459)) b!596704))

(declare-fun m!574141 () Bool)

(assert (=> b!596690 m!574141))

(declare-fun m!574143 () Bool)

(assert (=> b!596701 m!574143))

(assert (=> b!596701 m!574143))

(declare-fun m!574145 () Bool)

(assert (=> b!596701 m!574145))

(assert (=> b!596701 m!574143))

(declare-fun m!574147 () Bool)

(assert (=> b!596701 m!574147))

(assert (=> b!596711 m!574143))

(assert (=> b!596711 m!574143))

(declare-fun m!574149 () Bool)

(assert (=> b!596711 m!574149))

(declare-fun m!574151 () Bool)

(assert (=> b!596698 m!574151))

(declare-fun m!574153 () Bool)

(assert (=> b!596709 m!574153))

(declare-fun m!574155 () Bool)

(assert (=> start!54560 m!574155))

(declare-fun m!574157 () Bool)

(assert (=> start!54560 m!574157))

(assert (=> b!596699 m!574143))

(assert (=> b!596699 m!574143))

(declare-fun m!574159 () Bool)

(assert (=> b!596699 m!574159))

(declare-fun m!574161 () Bool)

(assert (=> b!596702 m!574161))

(declare-fun m!574163 () Bool)

(assert (=> b!596702 m!574163))

(assert (=> b!596702 m!574143))

(declare-fun m!574165 () Bool)

(assert (=> b!596702 m!574165))

(declare-fun m!574167 () Bool)

(assert (=> b!596702 m!574167))

(assert (=> b!596702 m!574143))

(declare-fun m!574169 () Bool)

(assert (=> b!596702 m!574169))

(declare-fun m!574171 () Bool)

(assert (=> b!596702 m!574171))

(declare-fun m!574173 () Bool)

(assert (=> b!596702 m!574173))

(assert (=> b!596696 m!574143))

(assert (=> b!596696 m!574165))

(declare-fun m!574175 () Bool)

(assert (=> b!596696 m!574175))

(declare-fun m!574177 () Bool)

(assert (=> b!596693 m!574177))

(declare-fun m!574179 () Bool)

(assert (=> b!596700 m!574179))

(declare-fun m!574181 () Bool)

(assert (=> b!596707 m!574181))

(declare-fun m!574183 () Bool)

(assert (=> b!596704 m!574183))

(declare-fun m!574185 () Bool)

(assert (=> b!596697 m!574185))

(assert (=> b!596708 m!574143))

(assert (=> b!596708 m!574143))

(declare-fun m!574187 () Bool)

(assert (=> b!596708 m!574187))

(assert (=> b!596706 m!574143))

(declare-fun m!574189 () Bool)

(assert (=> b!596691 m!574189))

(declare-fun m!574191 () Bool)

(assert (=> b!596705 m!574191))

(declare-fun m!574193 () Bool)

(assert (=> b!596694 m!574193))

(assert (=> b!596694 m!574143))

(assert (=> b!596694 m!574143))

(declare-fun m!574195 () Bool)

(assert (=> b!596694 m!574195))

(assert (=> b!596710 m!574165))

(declare-fun m!574197 () Bool)

(assert (=> b!596710 m!574197))

(push 1)

