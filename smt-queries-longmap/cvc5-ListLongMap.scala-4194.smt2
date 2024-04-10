; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57254 () Bool)

(assert start!57254)

(declare-fun b!633594 () Bool)

(declare-fun res!409735 () Bool)

(declare-fun e!362280 () Bool)

(assert (=> b!633594 (=> (not res!409735) (not e!362280))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38164 0))(
  ( (array!38165 (arr!18312 (Array (_ BitVec 32) (_ BitVec 64))) (size!18676 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38164)

(assert (=> b!633594 (= res!409735 (and (= (size!18676 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18676 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18676 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633595 () Bool)

(declare-fun res!409745 () Bool)

(assert (=> b!633595 (=> (not res!409745) (not e!362280))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633595 (= res!409745 (validKeyInArray!0 k!1786))))

(declare-fun b!633596 () Bool)

(declare-fun e!362279 () Bool)

(declare-fun lt!292852 () array!38164)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633596 (= e!362279 (arrayContainsKey!0 lt!292852 (select (arr!18312 a!2986) j!136) index!984))))

(declare-fun b!633597 () Bool)

(declare-fun e!362283 () Bool)

(assert (=> b!633597 (= e!362280 e!362283)))

(declare-fun res!409736 () Bool)

(assert (=> b!633597 (=> (not res!409736) (not e!362283))))

(declare-datatypes ((SeekEntryResult!6752 0))(
  ( (MissingZero!6752 (index!29307 (_ BitVec 32))) (Found!6752 (index!29308 (_ BitVec 32))) (Intermediate!6752 (undefined!7564 Bool) (index!29309 (_ BitVec 32)) (x!58053 (_ BitVec 32))) (Undefined!6752) (MissingVacant!6752 (index!29310 (_ BitVec 32))) )
))
(declare-fun lt!292855 () SeekEntryResult!6752)

(assert (=> b!633597 (= res!409736 (or (= lt!292855 (MissingZero!6752 i!1108)) (= lt!292855 (MissingVacant!6752 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38164 (_ BitVec 32)) SeekEntryResult!6752)

(assert (=> b!633597 (= lt!292855 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633598 () Bool)

(declare-fun e!362284 () Bool)

(declare-fun lt!292854 () (_ BitVec 64))

(declare-fun lt!292858 () (_ BitVec 64))

(assert (=> b!633598 (= e!362284 (or (not (= (select (arr!18312 a!2986) j!136) lt!292854)) (not (= (select (arr!18312 a!2986) j!136) lt!292858)) (bvsge j!136 index!984) (bvslt index!984 (size!18676 a!2986))))))

(declare-fun e!362277 () Bool)

(assert (=> b!633598 e!362277))

(declare-fun res!409740 () Bool)

(assert (=> b!633598 (=> (not res!409740) (not e!362277))))

(assert (=> b!633598 (= res!409740 (= lt!292858 (select (arr!18312 a!2986) j!136)))))

(assert (=> b!633598 (= lt!292858 (select (store (arr!18312 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633599 () Bool)

(declare-fun res!409733 () Bool)

(assert (=> b!633599 (=> (not res!409733) (not e!362283))))

(declare-datatypes ((List!12353 0))(
  ( (Nil!12350) (Cons!12349 (h!13394 (_ BitVec 64)) (t!18581 List!12353)) )
))
(declare-fun arrayNoDuplicates!0 (array!38164 (_ BitVec 32) List!12353) Bool)

(assert (=> b!633599 (= res!409733 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12350))))

(declare-fun b!633600 () Bool)

(declare-fun e!362278 () Bool)

(assert (=> b!633600 (= e!362277 e!362278)))

(declare-fun res!409734 () Bool)

(assert (=> b!633600 (=> res!409734 e!362278)))

(assert (=> b!633600 (= res!409734 (or (not (= (select (arr!18312 a!2986) j!136) lt!292854)) (not (= (select (arr!18312 a!2986) j!136) lt!292858)) (bvsge j!136 index!984)))))

(declare-fun b!633601 () Bool)

(declare-fun res!409732 () Bool)

(assert (=> b!633601 (=> (not res!409732) (not e!362280))))

(assert (=> b!633601 (= res!409732 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633602 () Bool)

(declare-datatypes ((Unit!21342 0))(
  ( (Unit!21343) )
))
(declare-fun e!362281 () Unit!21342)

(declare-fun Unit!21344 () Unit!21342)

(assert (=> b!633602 (= e!362281 Unit!21344)))

(assert (=> b!633602 false))

(declare-fun b!633603 () Bool)

(declare-fun e!362286 () Bool)

(assert (=> b!633603 (= e!362283 e!362286)))

(declare-fun res!409738 () Bool)

(assert (=> b!633603 (=> (not res!409738) (not e!362286))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!633603 (= res!409738 (= (select (store (arr!18312 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633603 (= lt!292852 (array!38165 (store (arr!18312 a!2986) i!1108 k!1786) (size!18676 a!2986)))))

(declare-fun b!633604 () Bool)

(declare-fun res!409730 () Bool)

(assert (=> b!633604 (=> (not res!409730) (not e!362283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38164 (_ BitVec 32)) Bool)

(assert (=> b!633604 (= res!409730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633605 () Bool)

(declare-fun res!409741 () Bool)

(assert (=> b!633605 (=> (not res!409741) (not e!362280))))

(assert (=> b!633605 (= res!409741 (validKeyInArray!0 (select (arr!18312 a!2986) j!136)))))

(declare-fun b!633606 () Bool)

(declare-fun Unit!21345 () Unit!21342)

(assert (=> b!633606 (= e!362281 Unit!21345)))

(declare-fun b!633607 () Bool)

(declare-fun e!362285 () Bool)

(assert (=> b!633607 (= e!362285 (not e!362284))))

(declare-fun res!409744 () Bool)

(assert (=> b!633607 (=> res!409744 e!362284)))

(declare-fun lt!292853 () SeekEntryResult!6752)

(assert (=> b!633607 (= res!409744 (not (= lt!292853 (Found!6752 index!984))))))

(declare-fun lt!292860 () Unit!21342)

(assert (=> b!633607 (= lt!292860 e!362281)))

(declare-fun c!72299 () Bool)

(assert (=> b!633607 (= c!72299 (= lt!292853 Undefined!6752))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38164 (_ BitVec 32)) SeekEntryResult!6752)

(assert (=> b!633607 (= lt!292853 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292854 lt!292852 mask!3053))))

(declare-fun e!362282 () Bool)

(assert (=> b!633607 e!362282))

(declare-fun res!409737 () Bool)

(assert (=> b!633607 (=> (not res!409737) (not e!362282))))

(declare-fun lt!292857 () (_ BitVec 32))

(declare-fun lt!292861 () SeekEntryResult!6752)

(assert (=> b!633607 (= res!409737 (= lt!292861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292857 vacantSpotIndex!68 lt!292854 lt!292852 mask!3053)))))

(assert (=> b!633607 (= lt!292861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292857 vacantSpotIndex!68 (select (arr!18312 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633607 (= lt!292854 (select (store (arr!18312 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292859 () Unit!21342)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38164 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21342)

(assert (=> b!633607 (= lt!292859 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292857 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633607 (= lt!292857 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633608 () Bool)

(declare-fun lt!292856 () SeekEntryResult!6752)

(assert (=> b!633608 (= e!362282 (= lt!292856 lt!292861))))

(declare-fun res!409731 () Bool)

(assert (=> start!57254 (=> (not res!409731) (not e!362280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57254 (= res!409731 (validMask!0 mask!3053))))

(assert (=> start!57254 e!362280))

(assert (=> start!57254 true))

(declare-fun array_inv!14108 (array!38164) Bool)

(assert (=> start!57254 (array_inv!14108 a!2986)))

(declare-fun b!633609 () Bool)

(declare-fun res!409739 () Bool)

(assert (=> b!633609 (=> (not res!409739) (not e!362283))))

(assert (=> b!633609 (= res!409739 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18312 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633610 () Bool)

(assert (=> b!633610 (= e!362278 e!362279)))

(declare-fun res!409742 () Bool)

(assert (=> b!633610 (=> (not res!409742) (not e!362279))))

(assert (=> b!633610 (= res!409742 (arrayContainsKey!0 lt!292852 (select (arr!18312 a!2986) j!136) j!136))))

(declare-fun b!633611 () Bool)

(assert (=> b!633611 (= e!362286 e!362285)))

(declare-fun res!409743 () Bool)

(assert (=> b!633611 (=> (not res!409743) (not e!362285))))

(assert (=> b!633611 (= res!409743 (and (= lt!292856 (Found!6752 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18312 a!2986) index!984) (select (arr!18312 a!2986) j!136))) (not (= (select (arr!18312 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633611 (= lt!292856 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18312 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57254 res!409731) b!633594))

(assert (= (and b!633594 res!409735) b!633605))

(assert (= (and b!633605 res!409741) b!633595))

(assert (= (and b!633595 res!409745) b!633601))

(assert (= (and b!633601 res!409732) b!633597))

(assert (= (and b!633597 res!409736) b!633604))

(assert (= (and b!633604 res!409730) b!633599))

(assert (= (and b!633599 res!409733) b!633609))

(assert (= (and b!633609 res!409739) b!633603))

(assert (= (and b!633603 res!409738) b!633611))

(assert (= (and b!633611 res!409743) b!633607))

(assert (= (and b!633607 res!409737) b!633608))

(assert (= (and b!633607 c!72299) b!633602))

(assert (= (and b!633607 (not c!72299)) b!633606))

(assert (= (and b!633607 (not res!409744)) b!633598))

(assert (= (and b!633598 res!409740) b!633600))

(assert (= (and b!633600 (not res!409734)) b!633610))

(assert (= (and b!633610 res!409742) b!633596))

(declare-fun m!608225 () Bool)

(assert (=> start!57254 m!608225))

(declare-fun m!608227 () Bool)

(assert (=> start!57254 m!608227))

(declare-fun m!608229 () Bool)

(assert (=> b!633603 m!608229))

(declare-fun m!608231 () Bool)

(assert (=> b!633603 m!608231))

(declare-fun m!608233 () Bool)

(assert (=> b!633609 m!608233))

(declare-fun m!608235 () Bool)

(assert (=> b!633599 m!608235))

(declare-fun m!608237 () Bool)

(assert (=> b!633595 m!608237))

(declare-fun m!608239 () Bool)

(assert (=> b!633601 m!608239))

(declare-fun m!608241 () Bool)

(assert (=> b!633605 m!608241))

(assert (=> b!633605 m!608241))

(declare-fun m!608243 () Bool)

(assert (=> b!633605 m!608243))

(assert (=> b!633610 m!608241))

(assert (=> b!633610 m!608241))

(declare-fun m!608245 () Bool)

(assert (=> b!633610 m!608245))

(declare-fun m!608247 () Bool)

(assert (=> b!633607 m!608247))

(declare-fun m!608249 () Bool)

(assert (=> b!633607 m!608249))

(assert (=> b!633607 m!608241))

(assert (=> b!633607 m!608229))

(declare-fun m!608251 () Bool)

(assert (=> b!633607 m!608251))

(assert (=> b!633607 m!608241))

(declare-fun m!608253 () Bool)

(assert (=> b!633607 m!608253))

(declare-fun m!608255 () Bool)

(assert (=> b!633607 m!608255))

(declare-fun m!608257 () Bool)

(assert (=> b!633607 m!608257))

(assert (=> b!633600 m!608241))

(declare-fun m!608259 () Bool)

(assert (=> b!633604 m!608259))

(declare-fun m!608261 () Bool)

(assert (=> b!633597 m!608261))

(assert (=> b!633596 m!608241))

(assert (=> b!633596 m!608241))

(declare-fun m!608263 () Bool)

(assert (=> b!633596 m!608263))

(declare-fun m!608265 () Bool)

(assert (=> b!633611 m!608265))

(assert (=> b!633611 m!608241))

(assert (=> b!633611 m!608241))

(declare-fun m!608267 () Bool)

(assert (=> b!633611 m!608267))

(assert (=> b!633598 m!608241))

(assert (=> b!633598 m!608229))

(declare-fun m!608269 () Bool)

(assert (=> b!633598 m!608269))

(push 1)

(assert (not b!633605))

(assert (not b!633611))

(assert (not b!633597))

(assert (not b!633604))

(assert (not b!633601))

(assert (not b!633607))

(assert (not b!633595))

(assert (not start!57254))

(assert (not b!633599))

(assert (not b!633610))

(assert (not b!633596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

