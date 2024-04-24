; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54594 () Bool)

(assert start!54594)

(declare-fun b!596346 () Bool)

(declare-datatypes ((Unit!18721 0))(
  ( (Unit!18722) )
))
(declare-fun e!340726 () Unit!18721)

(declare-fun Unit!18723 () Unit!18721)

(assert (=> b!596346 (= e!340726 Unit!18723)))

(assert (=> b!596346 false))

(declare-fun b!596347 () Bool)

(declare-fun e!340737 () Bool)

(declare-datatypes ((SeekEntryResult!6157 0))(
  ( (MissingZero!6157 (index!26876 (_ BitVec 32))) (Found!6157 (index!26877 (_ BitVec 32))) (Intermediate!6157 (undefined!6969 Bool) (index!26878 (_ BitVec 32)) (x!55828 (_ BitVec 32))) (Undefined!6157) (MissingVacant!6157 (index!26879 (_ BitVec 32))) )
))
(declare-fun lt!270845 () SeekEntryResult!6157)

(declare-fun lt!270847 () SeekEntryResult!6157)

(assert (=> b!596347 (= e!340737 (= lt!270845 lt!270847))))

(declare-fun b!596348 () Bool)

(declare-fun e!340736 () Bool)

(declare-fun e!340728 () Bool)

(assert (=> b!596348 (= e!340736 e!340728)))

(declare-fun res!382065 () Bool)

(assert (=> b!596348 (=> (not res!382065) (not e!340728))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36999 0))(
  ( (array!37000 (arr!17761 (Array (_ BitVec 32) (_ BitVec 64))) (size!18125 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36999)

(assert (=> b!596348 (= res!382065 (and (= lt!270845 (Found!6157 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17761 a!2986) index!984) (select (arr!17761 a!2986) j!136))) (not (= (select (arr!17761 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36999 (_ BitVec 32)) SeekEntryResult!6157)

(assert (=> b!596348 (= lt!270845 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17761 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596349 () Bool)

(declare-fun res!382070 () Bool)

(declare-fun e!340729 () Bool)

(assert (=> b!596349 (=> res!382070 e!340729)))

(declare-datatypes ((List!11709 0))(
  ( (Nil!11706) (Cons!11705 (h!12753 (_ BitVec 64)) (t!17929 List!11709)) )
))
(declare-fun contains!2918 (List!11709 (_ BitVec 64)) Bool)

(assert (=> b!596349 (= res!382070 (contains!2918 Nil!11706 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596350 () Bool)

(declare-fun res!382072 () Bool)

(declare-fun e!340735 () Bool)

(assert (=> b!596350 (=> (not res!382072) (not e!340735))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596350 (= res!382072 (validKeyInArray!0 k0!1786))))

(declare-fun res!382060 () Bool)

(assert (=> start!54594 (=> (not res!382060) (not e!340735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54594 (= res!382060 (validMask!0 mask!3053))))

(assert (=> start!54594 e!340735))

(assert (=> start!54594 true))

(declare-fun array_inv!13620 (array!36999) Bool)

(assert (=> start!54594 (array_inv!13620 a!2986)))

(declare-fun b!596351 () Bool)

(declare-fun e!340725 () Bool)

(declare-fun e!340733 () Bool)

(assert (=> b!596351 (= e!340725 e!340733)))

(declare-fun res!382057 () Bool)

(assert (=> b!596351 (=> res!382057 e!340733)))

(declare-fun lt!270840 () (_ BitVec 64))

(declare-fun lt!270842 () (_ BitVec 64))

(assert (=> b!596351 (= res!382057 (or (not (= (select (arr!17761 a!2986) j!136) lt!270840)) (not (= (select (arr!17761 a!2986) j!136) lt!270842)) (bvsge j!136 index!984)))))

(declare-fun e!340727 () Bool)

(assert (=> b!596351 e!340727))

(declare-fun res!382066 () Bool)

(assert (=> b!596351 (=> (not res!382066) (not e!340727))))

(assert (=> b!596351 (= res!382066 (= lt!270842 (select (arr!17761 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596351 (= lt!270842 (select (store (arr!17761 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596352 () Bool)

(assert (=> b!596352 (= e!340728 (not e!340725))))

(declare-fun res!382069 () Bool)

(assert (=> b!596352 (=> res!382069 e!340725)))

(declare-fun lt!270846 () SeekEntryResult!6157)

(assert (=> b!596352 (= res!382069 (not (= lt!270846 (Found!6157 index!984))))))

(declare-fun lt!270837 () Unit!18721)

(assert (=> b!596352 (= lt!270837 e!340726)))

(declare-fun c!67514 () Bool)

(assert (=> b!596352 (= c!67514 (= lt!270846 Undefined!6157))))

(declare-fun lt!270841 () array!36999)

(assert (=> b!596352 (= lt!270846 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270840 lt!270841 mask!3053))))

(assert (=> b!596352 e!340737))

(declare-fun res!382056 () Bool)

(assert (=> b!596352 (=> (not res!382056) (not e!340737))))

(declare-fun lt!270838 () (_ BitVec 32))

(assert (=> b!596352 (= res!382056 (= lt!270847 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270838 vacantSpotIndex!68 lt!270840 lt!270841 mask!3053)))))

(assert (=> b!596352 (= lt!270847 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270838 vacantSpotIndex!68 (select (arr!17761 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596352 (= lt!270840 (select (store (arr!17761 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270844 () Unit!18721)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36999 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18721)

(assert (=> b!596352 (= lt!270844 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270838 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596352 (= lt!270838 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!596353 () Bool)

(declare-fun res!382055 () Bool)

(declare-fun e!340732 () Bool)

(assert (=> b!596353 (=> (not res!382055) (not e!340732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36999 (_ BitVec 32)) Bool)

(assert (=> b!596353 (= res!382055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596354 () Bool)

(declare-fun res!382075 () Bool)

(assert (=> b!596354 (=> (not res!382075) (not e!340732))))

(declare-fun arrayNoDuplicates!0 (array!36999 (_ BitVec 32) List!11709) Bool)

(assert (=> b!596354 (= res!382075 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11706))))

(declare-fun b!596355 () Bool)

(assert (=> b!596355 (= e!340729 true)))

(declare-fun lt!270839 () Bool)

(assert (=> b!596355 (= lt!270839 (contains!2918 Nil!11706 k0!1786))))

(declare-fun b!596356 () Bool)

(declare-fun res!382064 () Bool)

(assert (=> b!596356 (=> (not res!382064) (not e!340732))))

(assert (=> b!596356 (= res!382064 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17761 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596357 () Bool)

(declare-fun res!382074 () Bool)

(assert (=> b!596357 (=> res!382074 e!340729)))

(declare-fun noDuplicate!265 (List!11709) Bool)

(assert (=> b!596357 (= res!382074 (not (noDuplicate!265 Nil!11706)))))

(declare-fun b!596358 () Bool)

(declare-fun e!340731 () Bool)

(assert (=> b!596358 (= e!340727 e!340731)))

(declare-fun res!382071 () Bool)

(assert (=> b!596358 (=> res!382071 e!340731)))

(assert (=> b!596358 (= res!382071 (or (not (= (select (arr!17761 a!2986) j!136) lt!270840)) (not (= (select (arr!17761 a!2986) j!136) lt!270842)) (bvsge j!136 index!984)))))

(declare-fun b!596359 () Bool)

(assert (=> b!596359 (= e!340732 e!340736)))

(declare-fun res!382073 () Bool)

(assert (=> b!596359 (=> (not res!382073) (not e!340736))))

(assert (=> b!596359 (= res!382073 (= (select (store (arr!17761 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596359 (= lt!270841 (array!37000 (store (arr!17761 a!2986) i!1108 k0!1786) (size!18125 a!2986)))))

(declare-fun b!596360 () Bool)

(declare-fun res!382063 () Bool)

(assert (=> b!596360 (=> (not res!382063) (not e!340735))))

(assert (=> b!596360 (= res!382063 (validKeyInArray!0 (select (arr!17761 a!2986) j!136)))))

(declare-fun e!340730 () Bool)

(declare-fun b!596361 () Bool)

(declare-fun arrayContainsKey!0 (array!36999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596361 (= e!340730 (arrayContainsKey!0 lt!270841 (select (arr!17761 a!2986) j!136) index!984))))

(declare-fun b!596362 () Bool)

(declare-fun res!382062 () Bool)

(assert (=> b!596362 (=> res!382062 e!340729)))

(assert (=> b!596362 (= res!382062 (contains!2918 Nil!11706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596363 () Bool)

(assert (=> b!596363 (= e!340731 e!340730)))

(declare-fun res!382059 () Bool)

(assert (=> b!596363 (=> (not res!382059) (not e!340730))))

(assert (=> b!596363 (= res!382059 (arrayContainsKey!0 lt!270841 (select (arr!17761 a!2986) j!136) j!136))))

(declare-fun b!596364 () Bool)

(assert (=> b!596364 (= e!340733 e!340729)))

(declare-fun res!382068 () Bool)

(assert (=> b!596364 (=> res!382068 e!340729)))

(assert (=> b!596364 (= res!382068 (or (bvsge (size!18125 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18125 a!2986))))))

(assert (=> b!596364 (arrayContainsKey!0 lt!270841 (select (arr!17761 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270843 () Unit!18721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36999 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18721)

(assert (=> b!596364 (= lt!270843 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270841 (select (arr!17761 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596365 () Bool)

(assert (=> b!596365 (= e!340735 e!340732)))

(declare-fun res!382061 () Bool)

(assert (=> b!596365 (=> (not res!382061) (not e!340732))))

(declare-fun lt!270836 () SeekEntryResult!6157)

(assert (=> b!596365 (= res!382061 (or (= lt!270836 (MissingZero!6157 i!1108)) (= lt!270836 (MissingVacant!6157 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36999 (_ BitVec 32)) SeekEntryResult!6157)

(assert (=> b!596365 (= lt!270836 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596366 () Bool)

(declare-fun Unit!18724 () Unit!18721)

(assert (=> b!596366 (= e!340726 Unit!18724)))

(declare-fun b!596367 () Bool)

(declare-fun res!382058 () Bool)

(assert (=> b!596367 (=> (not res!382058) (not e!340735))))

(assert (=> b!596367 (= res!382058 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596368 () Bool)

(declare-fun res!382067 () Bool)

(assert (=> b!596368 (=> (not res!382067) (not e!340735))))

(assert (=> b!596368 (= res!382067 (and (= (size!18125 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18125 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18125 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54594 res!382060) b!596368))

(assert (= (and b!596368 res!382067) b!596360))

(assert (= (and b!596360 res!382063) b!596350))

(assert (= (and b!596350 res!382072) b!596367))

(assert (= (and b!596367 res!382058) b!596365))

(assert (= (and b!596365 res!382061) b!596353))

(assert (= (and b!596353 res!382055) b!596354))

(assert (= (and b!596354 res!382075) b!596356))

(assert (= (and b!596356 res!382064) b!596359))

(assert (= (and b!596359 res!382073) b!596348))

(assert (= (and b!596348 res!382065) b!596352))

(assert (= (and b!596352 res!382056) b!596347))

(assert (= (and b!596352 c!67514) b!596346))

(assert (= (and b!596352 (not c!67514)) b!596366))

(assert (= (and b!596352 (not res!382069)) b!596351))

(assert (= (and b!596351 res!382066) b!596358))

(assert (= (and b!596358 (not res!382071)) b!596363))

(assert (= (and b!596363 res!382059) b!596361))

(assert (= (and b!596351 (not res!382057)) b!596364))

(assert (= (and b!596364 (not res!382068)) b!596357))

(assert (= (and b!596357 (not res!382074)) b!596362))

(assert (= (and b!596362 (not res!382062)) b!596349))

(assert (= (and b!596349 (not res!382070)) b!596355))

(declare-fun m!574091 () Bool)

(assert (=> b!596352 m!574091))

(declare-fun m!574093 () Bool)

(assert (=> b!596352 m!574093))

(declare-fun m!574095 () Bool)

(assert (=> b!596352 m!574095))

(declare-fun m!574097 () Bool)

(assert (=> b!596352 m!574097))

(declare-fun m!574099 () Bool)

(assert (=> b!596352 m!574099))

(declare-fun m!574101 () Bool)

(assert (=> b!596352 m!574101))

(assert (=> b!596352 m!574099))

(declare-fun m!574103 () Bool)

(assert (=> b!596352 m!574103))

(declare-fun m!574105 () Bool)

(assert (=> b!596352 m!574105))

(declare-fun m!574107 () Bool)

(assert (=> b!596355 m!574107))

(declare-fun m!574109 () Bool)

(assert (=> b!596362 m!574109))

(declare-fun m!574111 () Bool)

(assert (=> b!596365 m!574111))

(assert (=> b!596360 m!574099))

(assert (=> b!596360 m!574099))

(declare-fun m!574113 () Bool)

(assert (=> b!596360 m!574113))

(declare-fun m!574115 () Bool)

(assert (=> b!596367 m!574115))

(assert (=> b!596361 m!574099))

(assert (=> b!596361 m!574099))

(declare-fun m!574117 () Bool)

(assert (=> b!596361 m!574117))

(declare-fun m!574119 () Bool)

(assert (=> b!596353 m!574119))

(assert (=> b!596351 m!574099))

(assert (=> b!596351 m!574101))

(declare-fun m!574121 () Bool)

(assert (=> b!596351 m!574121))

(declare-fun m!574123 () Bool)

(assert (=> b!596354 m!574123))

(assert (=> b!596363 m!574099))

(assert (=> b!596363 m!574099))

(declare-fun m!574125 () Bool)

(assert (=> b!596363 m!574125))

(declare-fun m!574127 () Bool)

(assert (=> b!596349 m!574127))

(declare-fun m!574129 () Bool)

(assert (=> start!54594 m!574129))

(declare-fun m!574131 () Bool)

(assert (=> start!54594 m!574131))

(declare-fun m!574133 () Bool)

(assert (=> b!596357 m!574133))

(assert (=> b!596358 m!574099))

(assert (=> b!596364 m!574099))

(assert (=> b!596364 m!574099))

(declare-fun m!574135 () Bool)

(assert (=> b!596364 m!574135))

(assert (=> b!596364 m!574099))

(declare-fun m!574137 () Bool)

(assert (=> b!596364 m!574137))

(declare-fun m!574139 () Bool)

(assert (=> b!596356 m!574139))

(declare-fun m!574141 () Bool)

(assert (=> b!596348 m!574141))

(assert (=> b!596348 m!574099))

(assert (=> b!596348 m!574099))

(declare-fun m!574143 () Bool)

(assert (=> b!596348 m!574143))

(declare-fun m!574145 () Bool)

(assert (=> b!596350 m!574145))

(assert (=> b!596359 m!574101))

(declare-fun m!574147 () Bool)

(assert (=> b!596359 m!574147))

(check-sat (not b!596354) (not b!596360) (not b!596362) (not b!596353) (not b!596357) (not b!596367) (not b!596363) (not b!596349) (not b!596352) (not b!596364) (not b!596348) (not b!596361) (not b!596350) (not b!596355) (not b!596365) (not start!54594))
(check-sat)
