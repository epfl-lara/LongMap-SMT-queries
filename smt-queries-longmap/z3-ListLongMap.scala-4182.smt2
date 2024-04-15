; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56994 () Bool)

(assert start!56994)

(declare-fun b!630846 () Bool)

(declare-datatypes ((Unit!21176 0))(
  ( (Unit!21177) )
))
(declare-fun e!360676 () Unit!21176)

(declare-fun Unit!21178 () Unit!21176)

(assert (=> b!630846 (= e!360676 Unit!21178)))

(assert (=> b!630846 false))

(declare-fun b!630847 () Bool)

(declare-fun e!360681 () Bool)

(declare-datatypes ((SeekEntryResult!6712 0))(
  ( (MissingZero!6712 (index!29138 (_ BitVec 32))) (Found!6712 (index!29139 (_ BitVec 32))) (Intermediate!6712 (undefined!7524 Bool) (index!29140 (_ BitVec 32)) (x!57885 (_ BitVec 32))) (Undefined!6712) (MissingVacant!6712 (index!29141 (_ BitVec 32))) )
))
(declare-fun lt!291314 () SeekEntryResult!6712)

(declare-fun lt!291315 () SeekEntryResult!6712)

(assert (=> b!630847 (= e!360681 (= lt!291314 lt!291315))))

(declare-fun b!630848 () Bool)

(declare-fun res!407938 () Bool)

(declare-fun e!360675 () Bool)

(assert (=> b!630848 (=> (not res!407938) (not e!360675))))

(declare-datatypes ((array!38082 0))(
  ( (array!38083 (arr!18275 (Array (_ BitVec 32) (_ BitVec 64))) (size!18640 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38082)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38082 (_ BitVec 32)) Bool)

(assert (=> b!630848 (= res!407938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630849 () Bool)

(declare-fun e!360680 () Bool)

(declare-fun e!360677 () Bool)

(assert (=> b!630849 (= e!360680 e!360677)))

(declare-fun res!407929 () Bool)

(assert (=> b!630849 (=> (not res!407929) (not e!360677))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630849 (= res!407929 (and (= lt!291314 (Found!6712 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18275 a!2986) index!984) (select (arr!18275 a!2986) j!136))) (not (= (select (arr!18275 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38082 (_ BitVec 32)) SeekEntryResult!6712)

(assert (=> b!630849 (= lt!291314 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18275 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630850 () Bool)

(declare-fun res!407936 () Bool)

(declare-fun e!360679 () Bool)

(assert (=> b!630850 (=> (not res!407936) (not e!360679))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630850 (= res!407936 (and (= (size!18640 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18640 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18640 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630851 () Bool)

(assert (=> b!630851 (= e!360679 e!360675)))

(declare-fun res!407931 () Bool)

(assert (=> b!630851 (=> (not res!407931) (not e!360675))))

(declare-fun lt!291313 () SeekEntryResult!6712)

(assert (=> b!630851 (= res!407931 (or (= lt!291313 (MissingZero!6712 i!1108)) (= lt!291313 (MissingVacant!6712 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38082 (_ BitVec 32)) SeekEntryResult!6712)

(assert (=> b!630851 (= lt!291313 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630852 () Bool)

(declare-fun res!407930 () Bool)

(assert (=> b!630852 (=> (not res!407930) (not e!360679))))

(declare-fun arrayContainsKey!0 (array!38082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630852 (= res!407930 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630853 () Bool)

(assert (=> b!630853 (= e!360675 e!360680)))

(declare-fun res!407937 () Bool)

(assert (=> b!630853 (=> (not res!407937) (not e!360680))))

(assert (=> b!630853 (= res!407937 (= (select (store (arr!18275 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291317 () array!38082)

(assert (=> b!630853 (= lt!291317 (array!38083 (store (arr!18275 a!2986) i!1108 k0!1786) (size!18640 a!2986)))))

(declare-fun lt!291311 () SeekEntryResult!6712)

(declare-fun b!630854 () Bool)

(assert (=> b!630854 (= e!360677 (not (or (not (= lt!291311 (Found!6712 index!984))) (bvslt index!984 (size!18640 a!2986)))))))

(declare-fun lt!291316 () Unit!21176)

(assert (=> b!630854 (= lt!291316 e!360676)))

(declare-fun c!71826 () Bool)

(assert (=> b!630854 (= c!71826 (= lt!291311 Undefined!6712))))

(declare-fun lt!291318 () (_ BitVec 64))

(assert (=> b!630854 (= lt!291311 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291318 lt!291317 mask!3053))))

(assert (=> b!630854 e!360681))

(declare-fun res!407928 () Bool)

(assert (=> b!630854 (=> (not res!407928) (not e!360681))))

(declare-fun lt!291319 () (_ BitVec 32))

(assert (=> b!630854 (= res!407928 (= lt!291315 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291319 vacantSpotIndex!68 lt!291318 lt!291317 mask!3053)))))

(assert (=> b!630854 (= lt!291315 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291319 vacantSpotIndex!68 (select (arr!18275 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630854 (= lt!291318 (select (store (arr!18275 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291312 () Unit!21176)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38082 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21176)

(assert (=> b!630854 (= lt!291312 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291319 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630854 (= lt!291319 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!407934 () Bool)

(assert (=> start!56994 (=> (not res!407934) (not e!360679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56994 (= res!407934 (validMask!0 mask!3053))))

(assert (=> start!56994 e!360679))

(assert (=> start!56994 true))

(declare-fun array_inv!14158 (array!38082) Bool)

(assert (=> start!56994 (array_inv!14158 a!2986)))

(declare-fun b!630855 () Bool)

(declare-fun res!407933 () Bool)

(assert (=> b!630855 (=> (not res!407933) (not e!360679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630855 (= res!407933 (validKeyInArray!0 k0!1786))))

(declare-fun b!630856 () Bool)

(declare-fun res!407935 () Bool)

(assert (=> b!630856 (=> (not res!407935) (not e!360675))))

(assert (=> b!630856 (= res!407935 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18275 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630857 () Bool)

(declare-fun Unit!21179 () Unit!21176)

(assert (=> b!630857 (= e!360676 Unit!21179)))

(declare-fun b!630858 () Bool)

(declare-fun res!407939 () Bool)

(assert (=> b!630858 (=> (not res!407939) (not e!360675))))

(declare-datatypes ((List!12355 0))(
  ( (Nil!12352) (Cons!12351 (h!13396 (_ BitVec 64)) (t!18574 List!12355)) )
))
(declare-fun arrayNoDuplicates!0 (array!38082 (_ BitVec 32) List!12355) Bool)

(assert (=> b!630858 (= res!407939 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12352))))

(declare-fun b!630859 () Bool)

(declare-fun res!407932 () Bool)

(assert (=> b!630859 (=> (not res!407932) (not e!360679))))

(assert (=> b!630859 (= res!407932 (validKeyInArray!0 (select (arr!18275 a!2986) j!136)))))

(assert (= (and start!56994 res!407934) b!630850))

(assert (= (and b!630850 res!407936) b!630859))

(assert (= (and b!630859 res!407932) b!630855))

(assert (= (and b!630855 res!407933) b!630852))

(assert (= (and b!630852 res!407930) b!630851))

(assert (= (and b!630851 res!407931) b!630848))

(assert (= (and b!630848 res!407938) b!630858))

(assert (= (and b!630858 res!407939) b!630856))

(assert (= (and b!630856 res!407935) b!630853))

(assert (= (and b!630853 res!407937) b!630849))

(assert (= (and b!630849 res!407929) b!630854))

(assert (= (and b!630854 res!407928) b!630847))

(assert (= (and b!630854 c!71826) b!630846))

(assert (= (and b!630854 (not c!71826)) b!630857))

(declare-fun m!605299 () Bool)

(assert (=> b!630853 m!605299))

(declare-fun m!605301 () Bool)

(assert (=> b!630853 m!605301))

(declare-fun m!605303 () Bool)

(assert (=> b!630849 m!605303))

(declare-fun m!605305 () Bool)

(assert (=> b!630849 m!605305))

(assert (=> b!630849 m!605305))

(declare-fun m!605307 () Bool)

(assert (=> b!630849 m!605307))

(declare-fun m!605309 () Bool)

(assert (=> b!630854 m!605309))

(assert (=> b!630854 m!605305))

(assert (=> b!630854 m!605299))

(assert (=> b!630854 m!605305))

(declare-fun m!605311 () Bool)

(assert (=> b!630854 m!605311))

(declare-fun m!605313 () Bool)

(assert (=> b!630854 m!605313))

(declare-fun m!605315 () Bool)

(assert (=> b!630854 m!605315))

(declare-fun m!605317 () Bool)

(assert (=> b!630854 m!605317))

(declare-fun m!605319 () Bool)

(assert (=> b!630854 m!605319))

(declare-fun m!605321 () Bool)

(assert (=> b!630858 m!605321))

(declare-fun m!605323 () Bool)

(assert (=> b!630855 m!605323))

(declare-fun m!605325 () Bool)

(assert (=> start!56994 m!605325))

(declare-fun m!605327 () Bool)

(assert (=> start!56994 m!605327))

(assert (=> b!630859 m!605305))

(assert (=> b!630859 m!605305))

(declare-fun m!605329 () Bool)

(assert (=> b!630859 m!605329))

(declare-fun m!605331 () Bool)

(assert (=> b!630851 m!605331))

(declare-fun m!605333 () Bool)

(assert (=> b!630848 m!605333))

(declare-fun m!605335 () Bool)

(assert (=> b!630852 m!605335))

(declare-fun m!605337 () Bool)

(assert (=> b!630856 m!605337))

(check-sat (not b!630851) (not b!630852) (not b!630859) (not b!630858) (not b!630855) (not b!630854) (not b!630849) (not start!56994) (not b!630848))
(check-sat)
