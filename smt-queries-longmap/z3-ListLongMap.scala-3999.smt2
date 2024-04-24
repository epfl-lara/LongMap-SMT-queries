; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54234 () Bool)

(assert start!54234)

(declare-fun b!592579 () Bool)

(declare-fun e!338412 () Bool)

(declare-fun e!338409 () Bool)

(assert (=> b!592579 (= e!338412 e!338409)))

(declare-fun res!379318 () Bool)

(assert (=> b!592579 (=> (not res!379318) (not e!338409))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6118 0))(
  ( (MissingZero!6118 (index!26708 (_ BitVec 32))) (Found!6118 (index!26709 (_ BitVec 32))) (Intermediate!6118 (undefined!6930 Bool) (index!26710 (_ BitVec 32)) (x!55649 (_ BitVec 32))) (Undefined!6118) (MissingVacant!6118 (index!26711 (_ BitVec 32))) )
))
(declare-fun lt!268995 () SeekEntryResult!6118)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36909 0))(
  ( (array!36910 (arr!17722 (Array (_ BitVec 32) (_ BitVec 64))) (size!18086 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36909)

(assert (=> b!592579 (= res!379318 (and (= lt!268995 (Found!6118 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17722 a!2986) index!984) (select (arr!17722 a!2986) j!136))) (not (= (select (arr!17722 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36909 (_ BitVec 32)) SeekEntryResult!6118)

(assert (=> b!592579 (= lt!268995 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592580 () Bool)

(declare-fun e!338407 () Bool)

(declare-fun e!338405 () Bool)

(assert (=> b!592580 (= e!338407 e!338405)))

(declare-fun res!379328 () Bool)

(assert (=> b!592580 (=> res!379328 e!338405)))

(declare-fun lt!268998 () (_ BitVec 64))

(declare-fun lt!268996 () (_ BitVec 64))

(assert (=> b!592580 (= res!379328 (or (not (= (select (arr!17722 a!2986) j!136) lt!268996)) (not (= (select (arr!17722 a!2986) j!136) lt!268998)) (bvsge j!136 index!984)))))

(declare-fun b!592581 () Bool)

(declare-datatypes ((Unit!18565 0))(
  ( (Unit!18566) )
))
(declare-fun e!338410 () Unit!18565)

(declare-fun Unit!18567 () Unit!18565)

(assert (=> b!592581 (= e!338410 Unit!18567)))

(assert (=> b!592581 false))

(declare-fun b!592582 () Bool)

(declare-fun e!338413 () Bool)

(declare-fun e!338408 () Bool)

(assert (=> b!592582 (= e!338413 e!338408)))

(declare-fun res!379319 () Bool)

(assert (=> b!592582 (=> (not res!379319) (not e!338408))))

(declare-fun lt!269005 () SeekEntryResult!6118)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592582 (= res!379319 (or (= lt!269005 (MissingZero!6118 i!1108)) (= lt!269005 (MissingVacant!6118 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36909 (_ BitVec 32)) SeekEntryResult!6118)

(assert (=> b!592582 (= lt!269005 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592583 () Bool)

(declare-fun e!338414 () Bool)

(assert (=> b!592583 (= e!338409 (not e!338414))))

(declare-fun res!379320 () Bool)

(assert (=> b!592583 (=> res!379320 e!338414)))

(declare-fun lt!268999 () SeekEntryResult!6118)

(assert (=> b!592583 (= res!379320 (not (= lt!268999 (Found!6118 index!984))))))

(declare-fun lt!268997 () Unit!18565)

(assert (=> b!592583 (= lt!268997 e!338410)))

(declare-fun c!67001 () Bool)

(assert (=> b!592583 (= c!67001 (= lt!268999 Undefined!6118))))

(declare-fun lt!269000 () array!36909)

(assert (=> b!592583 (= lt!268999 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268996 lt!269000 mask!3053))))

(declare-fun e!338415 () Bool)

(assert (=> b!592583 e!338415))

(declare-fun res!379314 () Bool)

(assert (=> b!592583 (=> (not res!379314) (not e!338415))))

(declare-fun lt!269001 () (_ BitVec 32))

(declare-fun lt!269002 () SeekEntryResult!6118)

(assert (=> b!592583 (= res!379314 (= lt!269002 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 lt!268996 lt!269000 mask!3053)))))

(assert (=> b!592583 (= lt!269002 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592583 (= lt!268996 (select (store (arr!17722 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269004 () Unit!18565)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18565)

(assert (=> b!592583 (= lt!269004 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592583 (= lt!269001 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!592584 () Bool)

(declare-fun res!379323 () Bool)

(assert (=> b!592584 (=> (not res!379323) (not e!338413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592584 (= res!379323 (validKeyInArray!0 (select (arr!17722 a!2986) j!136)))))

(declare-fun b!592585 () Bool)

(declare-fun e!338411 () Bool)

(assert (=> b!592585 (= e!338411 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18086 a!2986)) (bvslt (size!18086 a!2986) #b01111111111111111111111111111111)))))

(declare-fun arrayContainsKey!0 (array!36909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592585 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269003 () Unit!18565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36909 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18565)

(assert (=> b!592585 (= lt!269003 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269000 (select (arr!17722 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592586 () Bool)

(assert (=> b!592586 (= e!338415 (= lt!268995 lt!269002))))

(declare-fun res!379325 () Bool)

(assert (=> start!54234 (=> (not res!379325) (not e!338413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54234 (= res!379325 (validMask!0 mask!3053))))

(assert (=> start!54234 e!338413))

(assert (=> start!54234 true))

(declare-fun array_inv!13581 (array!36909) Bool)

(assert (=> start!54234 (array_inv!13581 a!2986)))

(declare-fun b!592587 () Bool)

(declare-fun res!379321 () Bool)

(assert (=> b!592587 (=> (not res!379321) (not e!338408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36909 (_ BitVec 32)) Bool)

(assert (=> b!592587 (= res!379321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592588 () Bool)

(declare-fun Unit!18568 () Unit!18565)

(assert (=> b!592588 (= e!338410 Unit!18568)))

(declare-fun e!338406 () Bool)

(declare-fun b!592589 () Bool)

(assert (=> b!592589 (= e!338406 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) index!984))))

(declare-fun b!592590 () Bool)

(assert (=> b!592590 (= e!338405 e!338406)))

(declare-fun res!379315 () Bool)

(assert (=> b!592590 (=> (not res!379315) (not e!338406))))

(assert (=> b!592590 (= res!379315 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) j!136))))

(declare-fun b!592591 () Bool)

(declare-fun res!379316 () Bool)

(assert (=> b!592591 (=> (not res!379316) (not e!338413))))

(assert (=> b!592591 (= res!379316 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592592 () Bool)

(declare-fun res!379330 () Bool)

(assert (=> b!592592 (=> (not res!379330) (not e!338408))))

(declare-datatypes ((List!11670 0))(
  ( (Nil!11667) (Cons!11666 (h!12714 (_ BitVec 64)) (t!17890 List!11670)) )
))
(declare-fun arrayNoDuplicates!0 (array!36909 (_ BitVec 32) List!11670) Bool)

(assert (=> b!592592 (= res!379330 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11667))))

(declare-fun b!592593 () Bool)

(assert (=> b!592593 (= e!338408 e!338412)))

(declare-fun res!379327 () Bool)

(assert (=> b!592593 (=> (not res!379327) (not e!338412))))

(assert (=> b!592593 (= res!379327 (= (select (store (arr!17722 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592593 (= lt!269000 (array!36910 (store (arr!17722 a!2986) i!1108 k0!1786) (size!18086 a!2986)))))

(declare-fun b!592594 () Bool)

(declare-fun res!379329 () Bool)

(assert (=> b!592594 (=> (not res!379329) (not e!338408))))

(assert (=> b!592594 (= res!379329 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17722 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592595 () Bool)

(declare-fun res!379326 () Bool)

(assert (=> b!592595 (=> (not res!379326) (not e!338413))))

(assert (=> b!592595 (= res!379326 (and (= (size!18086 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18086 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18086 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592596 () Bool)

(assert (=> b!592596 (= e!338414 e!338411)))

(declare-fun res!379317 () Bool)

(assert (=> b!592596 (=> res!379317 e!338411)))

(assert (=> b!592596 (= res!379317 (or (not (= (select (arr!17722 a!2986) j!136) lt!268996)) (not (= (select (arr!17722 a!2986) j!136) lt!268998)) (bvsge j!136 index!984)))))

(assert (=> b!592596 e!338407))

(declare-fun res!379324 () Bool)

(assert (=> b!592596 (=> (not res!379324) (not e!338407))))

(assert (=> b!592596 (= res!379324 (= lt!268998 (select (arr!17722 a!2986) j!136)))))

(assert (=> b!592596 (= lt!268998 (select (store (arr!17722 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592597 () Bool)

(declare-fun res!379322 () Bool)

(assert (=> b!592597 (=> (not res!379322) (not e!338413))))

(assert (=> b!592597 (= res!379322 (validKeyInArray!0 k0!1786))))

(assert (= (and start!54234 res!379325) b!592595))

(assert (= (and b!592595 res!379326) b!592584))

(assert (= (and b!592584 res!379323) b!592597))

(assert (= (and b!592597 res!379322) b!592591))

(assert (= (and b!592591 res!379316) b!592582))

(assert (= (and b!592582 res!379319) b!592587))

(assert (= (and b!592587 res!379321) b!592592))

(assert (= (and b!592592 res!379330) b!592594))

(assert (= (and b!592594 res!379329) b!592593))

(assert (= (and b!592593 res!379327) b!592579))

(assert (= (and b!592579 res!379318) b!592583))

(assert (= (and b!592583 res!379314) b!592586))

(assert (= (and b!592583 c!67001) b!592581))

(assert (= (and b!592583 (not c!67001)) b!592588))

(assert (= (and b!592583 (not res!379320)) b!592596))

(assert (= (and b!592596 res!379324) b!592580))

(assert (= (and b!592580 (not res!379328)) b!592590))

(assert (= (and b!592590 res!379315) b!592589))

(assert (= (and b!592596 (not res!379317)) b!592585))

(declare-fun m!570863 () Bool)

(assert (=> b!592592 m!570863))

(declare-fun m!570865 () Bool)

(assert (=> b!592587 m!570865))

(declare-fun m!570867 () Bool)

(assert (=> b!592596 m!570867))

(declare-fun m!570869 () Bool)

(assert (=> b!592596 m!570869))

(declare-fun m!570871 () Bool)

(assert (=> b!592596 m!570871))

(declare-fun m!570873 () Bool)

(assert (=> b!592583 m!570873))

(declare-fun m!570875 () Bool)

(assert (=> b!592583 m!570875))

(declare-fun m!570877 () Bool)

(assert (=> b!592583 m!570877))

(assert (=> b!592583 m!570869))

(declare-fun m!570879 () Bool)

(assert (=> b!592583 m!570879))

(declare-fun m!570881 () Bool)

(assert (=> b!592583 m!570881))

(assert (=> b!592583 m!570867))

(assert (=> b!592583 m!570867))

(declare-fun m!570883 () Bool)

(assert (=> b!592583 m!570883))

(declare-fun m!570885 () Bool)

(assert (=> b!592579 m!570885))

(assert (=> b!592579 m!570867))

(assert (=> b!592579 m!570867))

(declare-fun m!570887 () Bool)

(assert (=> b!592579 m!570887))

(assert (=> b!592589 m!570867))

(assert (=> b!592589 m!570867))

(declare-fun m!570889 () Bool)

(assert (=> b!592589 m!570889))

(assert (=> b!592593 m!570869))

(declare-fun m!570891 () Bool)

(assert (=> b!592593 m!570891))

(assert (=> b!592585 m!570867))

(assert (=> b!592585 m!570867))

(declare-fun m!570893 () Bool)

(assert (=> b!592585 m!570893))

(assert (=> b!592585 m!570867))

(declare-fun m!570895 () Bool)

(assert (=> b!592585 m!570895))

(assert (=> b!592584 m!570867))

(assert (=> b!592584 m!570867))

(declare-fun m!570897 () Bool)

(assert (=> b!592584 m!570897))

(declare-fun m!570899 () Bool)

(assert (=> b!592582 m!570899))

(declare-fun m!570901 () Bool)

(assert (=> start!54234 m!570901))

(declare-fun m!570903 () Bool)

(assert (=> start!54234 m!570903))

(assert (=> b!592580 m!570867))

(declare-fun m!570905 () Bool)

(assert (=> b!592591 m!570905))

(assert (=> b!592590 m!570867))

(assert (=> b!592590 m!570867))

(declare-fun m!570907 () Bool)

(assert (=> b!592590 m!570907))

(declare-fun m!570909 () Bool)

(assert (=> b!592594 m!570909))

(declare-fun m!570911 () Bool)

(assert (=> b!592597 m!570911))

(check-sat (not b!592585) (not start!54234) (not b!592590) (not b!592583) (not b!592592) (not b!592579) (not b!592582) (not b!592591) (not b!592587) (not b!592589) (not b!592597) (not b!592584))
(check-sat)
(get-model)

(declare-fun d!86337 () Bool)

(assert (=> d!86337 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54234 d!86337))

(declare-fun d!86339 () Bool)

(assert (=> d!86339 (= (array_inv!13581 a!2986) (bvsge (size!18086 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54234 d!86339))

(declare-fun b!592720 () Bool)

(declare-fun e!338495 () Bool)

(declare-fun call!32838 () Bool)

(assert (=> b!592720 (= e!338495 call!32838)))

(declare-fun b!592721 () Bool)

(declare-fun e!338494 () Bool)

(assert (=> b!592721 (= e!338494 e!338495)))

(declare-fun lt!269080 () (_ BitVec 64))

(assert (=> b!592721 (= lt!269080 (select (arr!17722 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269079 () Unit!18565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36909 (_ BitVec 64) (_ BitVec 32)) Unit!18565)

(assert (=> b!592721 (= lt!269079 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269080 #b00000000000000000000000000000000))))

(assert (=> b!592721 (arrayContainsKey!0 a!2986 lt!269080 #b00000000000000000000000000000000)))

(declare-fun lt!269078 () Unit!18565)

(assert (=> b!592721 (= lt!269078 lt!269079)))

(declare-fun res!379437 () Bool)

(assert (=> b!592721 (= res!379437 (= (seekEntryOrOpen!0 (select (arr!17722 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6118 #b00000000000000000000000000000000)))))

(assert (=> b!592721 (=> (not res!379437) (not e!338495))))

(declare-fun d!86341 () Bool)

(declare-fun res!379438 () Bool)

(declare-fun e!338496 () Bool)

(assert (=> d!86341 (=> res!379438 e!338496)))

(assert (=> d!86341 (= res!379438 (bvsge #b00000000000000000000000000000000 (size!18086 a!2986)))))

(assert (=> d!86341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338496)))

(declare-fun b!592722 () Bool)

(assert (=> b!592722 (= e!338494 call!32838)))

(declare-fun bm!32835 () Bool)

(assert (=> bm!32835 (= call!32838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!592723 () Bool)

(assert (=> b!592723 (= e!338496 e!338494)))

(declare-fun c!67010 () Bool)

(assert (=> b!592723 (= c!67010 (validKeyInArray!0 (select (arr!17722 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86341 (not res!379438)) b!592723))

(assert (= (and b!592723 c!67010) b!592721))

(assert (= (and b!592723 (not c!67010)) b!592722))

(assert (= (and b!592721 res!379437) b!592720))

(assert (= (or b!592720 b!592722) bm!32835))

(declare-fun m!571013 () Bool)

(assert (=> b!592721 m!571013))

(declare-fun m!571015 () Bool)

(assert (=> b!592721 m!571015))

(declare-fun m!571017 () Bool)

(assert (=> b!592721 m!571017))

(assert (=> b!592721 m!571013))

(declare-fun m!571019 () Bool)

(assert (=> b!592721 m!571019))

(declare-fun m!571021 () Bool)

(assert (=> bm!32835 m!571021))

(assert (=> b!592723 m!571013))

(assert (=> b!592723 m!571013))

(declare-fun m!571023 () Bool)

(assert (=> b!592723 m!571023))

(assert (=> b!592587 d!86341))

(declare-fun d!86343 () Bool)

(assert (=> d!86343 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592597 d!86343))

(declare-fun d!86345 () Bool)

(declare-fun res!379443 () Bool)

(declare-fun e!338501 () Bool)

(assert (=> d!86345 (=> res!379443 e!338501)))

(assert (=> d!86345 (= res!379443 (= (select (arr!17722 lt!269000) j!136) (select (arr!17722 a!2986) j!136)))))

(assert (=> d!86345 (= (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) j!136) e!338501)))

(declare-fun b!592728 () Bool)

(declare-fun e!338502 () Bool)

(assert (=> b!592728 (= e!338501 e!338502)))

(declare-fun res!379444 () Bool)

(assert (=> b!592728 (=> (not res!379444) (not e!338502))))

(assert (=> b!592728 (= res!379444 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18086 lt!269000)))))

(declare-fun b!592729 () Bool)

(assert (=> b!592729 (= e!338502 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86345 (not res!379443)) b!592728))

(assert (= (and b!592728 res!379444) b!592729))

(declare-fun m!571025 () Bool)

(assert (=> d!86345 m!571025))

(assert (=> b!592729 m!570867))

(declare-fun m!571027 () Bool)

(assert (=> b!592729 m!571027))

(assert (=> b!592590 d!86345))

(declare-fun b!592742 () Bool)

(declare-fun e!338511 () SeekEntryResult!6118)

(assert (=> b!592742 (= e!338511 Undefined!6118)))

(declare-fun b!592743 () Bool)

(declare-fun e!338510 () SeekEntryResult!6118)

(assert (=> b!592743 (= e!338510 (Found!6118 index!984))))

(declare-fun lt!269086 () SeekEntryResult!6118)

(declare-fun d!86347 () Bool)

(get-info :version)

(assert (=> d!86347 (and (or ((_ is Undefined!6118) lt!269086) (not ((_ is Found!6118) lt!269086)) (and (bvsge (index!26709 lt!269086) #b00000000000000000000000000000000) (bvslt (index!26709 lt!269086) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269086) ((_ is Found!6118) lt!269086) (not ((_ is MissingVacant!6118) lt!269086)) (not (= (index!26711 lt!269086) vacantSpotIndex!68)) (and (bvsge (index!26711 lt!269086) #b00000000000000000000000000000000) (bvslt (index!26711 lt!269086) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269086) (ite ((_ is Found!6118) lt!269086) (= (select (arr!17722 a!2986) (index!26709 lt!269086)) (select (arr!17722 a!2986) j!136)) (and ((_ is MissingVacant!6118) lt!269086) (= (index!26711 lt!269086) vacantSpotIndex!68) (= (select (arr!17722 a!2986) (index!26711 lt!269086)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86347 (= lt!269086 e!338511)))

(declare-fun c!67019 () Bool)

(assert (=> d!86347 (= c!67019 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269085 () (_ BitVec 64))

(assert (=> d!86347 (= lt!269085 (select (arr!17722 a!2986) index!984))))

(assert (=> d!86347 (validMask!0 mask!3053)))

(assert (=> d!86347 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053) lt!269086)))

(declare-fun e!338509 () SeekEntryResult!6118)

(declare-fun b!592744 () Bool)

(assert (=> b!592744 (= e!338509 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592745 () Bool)

(declare-fun c!67018 () Bool)

(assert (=> b!592745 (= c!67018 (= lt!269085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592745 (= e!338510 e!338509)))

(declare-fun b!592746 () Bool)

(assert (=> b!592746 (= e!338511 e!338510)))

(declare-fun c!67017 () Bool)

(assert (=> b!592746 (= c!67017 (= lt!269085 (select (arr!17722 a!2986) j!136)))))

(declare-fun b!592747 () Bool)

(assert (=> b!592747 (= e!338509 (MissingVacant!6118 vacantSpotIndex!68))))

(assert (= (and d!86347 c!67019) b!592742))

(assert (= (and d!86347 (not c!67019)) b!592746))

(assert (= (and b!592746 c!67017) b!592743))

(assert (= (and b!592746 (not c!67017)) b!592745))

(assert (= (and b!592745 c!67018) b!592747))

(assert (= (and b!592745 (not c!67018)) b!592744))

(declare-fun m!571029 () Bool)

(assert (=> d!86347 m!571029))

(declare-fun m!571031 () Bool)

(assert (=> d!86347 m!571031))

(assert (=> d!86347 m!570885))

(assert (=> d!86347 m!570901))

(declare-fun m!571033 () Bool)

(assert (=> b!592744 m!571033))

(assert (=> b!592744 m!571033))

(assert (=> b!592744 m!570867))

(declare-fun m!571035 () Bool)

(assert (=> b!592744 m!571035))

(assert (=> b!592579 d!86347))

(declare-fun d!86349 () Bool)

(declare-fun res!379445 () Bool)

(declare-fun e!338512 () Bool)

(assert (=> d!86349 (=> res!379445 e!338512)))

(assert (=> d!86349 (= res!379445 (= (select (arr!17722 lt!269000) index!984) (select (arr!17722 a!2986) j!136)))))

(assert (=> d!86349 (= (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) index!984) e!338512)))

(declare-fun b!592748 () Bool)

(declare-fun e!338513 () Bool)

(assert (=> b!592748 (= e!338512 e!338513)))

(declare-fun res!379446 () Bool)

(assert (=> b!592748 (=> (not res!379446) (not e!338513))))

(assert (=> b!592748 (= res!379446 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18086 lt!269000)))))

(declare-fun b!592749 () Bool)

(assert (=> b!592749 (= e!338513 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86349 (not res!379445)) b!592748))

(assert (= (and b!592748 res!379446) b!592749))

(declare-fun m!571037 () Bool)

(assert (=> d!86349 m!571037))

(assert (=> b!592749 m!570867))

(declare-fun m!571039 () Bool)

(assert (=> b!592749 m!571039))

(assert (=> b!592589 d!86349))

(declare-fun b!592798 () Bool)

(declare-fun e!338541 () SeekEntryResult!6118)

(assert (=> b!592798 (= e!338541 Undefined!6118)))

(declare-fun d!86351 () Bool)

(declare-fun lt!269106 () SeekEntryResult!6118)

(assert (=> d!86351 (and (or ((_ is Undefined!6118) lt!269106) (not ((_ is Found!6118) lt!269106)) (and (bvsge (index!26709 lt!269106) #b00000000000000000000000000000000) (bvslt (index!26709 lt!269106) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269106) ((_ is Found!6118) lt!269106) (not ((_ is MissingZero!6118) lt!269106)) (and (bvsge (index!26708 lt!269106) #b00000000000000000000000000000000) (bvslt (index!26708 lt!269106) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269106) ((_ is Found!6118) lt!269106) ((_ is MissingZero!6118) lt!269106) (not ((_ is MissingVacant!6118) lt!269106)) (and (bvsge (index!26711 lt!269106) #b00000000000000000000000000000000) (bvslt (index!26711 lt!269106) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269106) (ite ((_ is Found!6118) lt!269106) (= (select (arr!17722 a!2986) (index!26709 lt!269106)) k0!1786) (ite ((_ is MissingZero!6118) lt!269106) (= (select (arr!17722 a!2986) (index!26708 lt!269106)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6118) lt!269106) (= (select (arr!17722 a!2986) (index!26711 lt!269106)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86351 (= lt!269106 e!338541)))

(declare-fun c!67041 () Bool)

(declare-fun lt!269105 () SeekEntryResult!6118)

(assert (=> d!86351 (= c!67041 (and ((_ is Intermediate!6118) lt!269105) (undefined!6930 lt!269105)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36909 (_ BitVec 32)) SeekEntryResult!6118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86351 (= lt!269105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86351 (validMask!0 mask!3053)))

(assert (=> d!86351 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269106)))

(declare-fun b!592799 () Bool)

(declare-fun c!67042 () Bool)

(declare-fun lt!269107 () (_ BitVec 64))

(assert (=> b!592799 (= c!67042 (= lt!269107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338543 () SeekEntryResult!6118)

(declare-fun e!338542 () SeekEntryResult!6118)

(assert (=> b!592799 (= e!338543 e!338542)))

(declare-fun b!592800 () Bool)

(assert (=> b!592800 (= e!338542 (MissingZero!6118 (index!26710 lt!269105)))))

(declare-fun b!592801 () Bool)

(assert (=> b!592801 (= e!338541 e!338543)))

(assert (=> b!592801 (= lt!269107 (select (arr!17722 a!2986) (index!26710 lt!269105)))))

(declare-fun c!67043 () Bool)

(assert (=> b!592801 (= c!67043 (= lt!269107 k0!1786))))

(declare-fun b!592802 () Bool)

(assert (=> b!592802 (= e!338543 (Found!6118 (index!26710 lt!269105)))))

(declare-fun b!592803 () Bool)

(assert (=> b!592803 (= e!338542 (seekKeyOrZeroReturnVacant!0 (x!55649 lt!269105) (index!26710 lt!269105) (index!26710 lt!269105) k0!1786 a!2986 mask!3053))))

(assert (= (and d!86351 c!67041) b!592798))

(assert (= (and d!86351 (not c!67041)) b!592801))

(assert (= (and b!592801 c!67043) b!592802))

(assert (= (and b!592801 (not c!67043)) b!592799))

(assert (= (and b!592799 c!67042) b!592800))

(assert (= (and b!592799 (not c!67042)) b!592803))

(declare-fun m!571053 () Bool)

(assert (=> d!86351 m!571053))

(declare-fun m!571055 () Bool)

(assert (=> d!86351 m!571055))

(assert (=> d!86351 m!571053))

(declare-fun m!571057 () Bool)

(assert (=> d!86351 m!571057))

(declare-fun m!571059 () Bool)

(assert (=> d!86351 m!571059))

(assert (=> d!86351 m!570901))

(declare-fun m!571061 () Bool)

(assert (=> d!86351 m!571061))

(declare-fun m!571063 () Bool)

(assert (=> b!592801 m!571063))

(declare-fun m!571065 () Bool)

(assert (=> b!592803 m!571065))

(assert (=> b!592582 d!86351))

(declare-fun b!592836 () Bool)

(declare-fun e!338570 () Bool)

(declare-fun e!338572 () Bool)

(assert (=> b!592836 (= e!338570 e!338572)))

(declare-fun res!379472 () Bool)

(assert (=> b!592836 (=> (not res!379472) (not e!338572))))

(declare-fun e!338569 () Bool)

(assert (=> b!592836 (= res!379472 (not e!338569))))

(declare-fun res!379471 () Bool)

(assert (=> b!592836 (=> (not res!379471) (not e!338569))))

(assert (=> b!592836 (= res!379471 (validKeyInArray!0 (select (arr!17722 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592837 () Bool)

(declare-fun e!338571 () Bool)

(declare-fun call!32843 () Bool)

(assert (=> b!592837 (= e!338571 call!32843)))

(declare-fun d!86365 () Bool)

(declare-fun res!379473 () Bool)

(assert (=> d!86365 (=> res!379473 e!338570)))

(assert (=> d!86365 (= res!379473 (bvsge #b00000000000000000000000000000000 (size!18086 a!2986)))))

(assert (=> d!86365 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11667) e!338570)))

(declare-fun b!592838 () Bool)

(declare-fun contains!2885 (List!11670 (_ BitVec 64)) Bool)

(assert (=> b!592838 (= e!338569 (contains!2885 Nil!11667 (select (arr!17722 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592839 () Bool)

(assert (=> b!592839 (= e!338571 call!32843)))

(declare-fun bm!32840 () Bool)

(declare-fun c!67051 () Bool)

(assert (=> bm!32840 (= call!32843 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67051 (Cons!11666 (select (arr!17722 a!2986) #b00000000000000000000000000000000) Nil!11667) Nil!11667)))))

(declare-fun b!592840 () Bool)

(assert (=> b!592840 (= e!338572 e!338571)))

(assert (=> b!592840 (= c!67051 (validKeyInArray!0 (select (arr!17722 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86365 (not res!379473)) b!592836))

(assert (= (and b!592836 res!379471) b!592838))

(assert (= (and b!592836 res!379472) b!592840))

(assert (= (and b!592840 c!67051) b!592837))

(assert (= (and b!592840 (not c!67051)) b!592839))

(assert (= (or b!592837 b!592839) bm!32840))

(assert (=> b!592836 m!571013))

(assert (=> b!592836 m!571013))

(assert (=> b!592836 m!571023))

(assert (=> b!592838 m!571013))

(assert (=> b!592838 m!571013))

(declare-fun m!571087 () Bool)

(assert (=> b!592838 m!571087))

(assert (=> bm!32840 m!571013))

(declare-fun m!571091 () Bool)

(assert (=> bm!32840 m!571091))

(assert (=> b!592840 m!571013))

(assert (=> b!592840 m!571013))

(assert (=> b!592840 m!571023))

(assert (=> b!592592 d!86365))

(declare-fun d!86371 () Bool)

(declare-fun res!379477 () Bool)

(declare-fun e!338577 () Bool)

(assert (=> d!86371 (=> res!379477 e!338577)))

(assert (=> d!86371 (= res!379477 (= (select (arr!17722 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86371 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338577)))

(declare-fun b!592846 () Bool)

(declare-fun e!338578 () Bool)

(assert (=> b!592846 (= e!338577 e!338578)))

(declare-fun res!379478 () Bool)

(assert (=> b!592846 (=> (not res!379478) (not e!338578))))

(assert (=> b!592846 (= res!379478 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18086 a!2986)))))

(declare-fun b!592847 () Bool)

(assert (=> b!592847 (= e!338578 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86371 (not res!379477)) b!592846))

(assert (= (and b!592846 res!379478) b!592847))

(assert (=> d!86371 m!571013))

(declare-fun m!571097 () Bool)

(assert (=> b!592847 m!571097))

(assert (=> b!592591 d!86371))

(declare-fun d!86375 () Bool)

(declare-fun res!379479 () Bool)

(declare-fun e!338579 () Bool)

(assert (=> d!86375 (=> res!379479 e!338579)))

(assert (=> d!86375 (= res!379479 (= (select (arr!17722 lt!269000) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17722 a!2986) j!136)))))

(assert (=> d!86375 (= (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338579)))

(declare-fun b!592848 () Bool)

(declare-fun e!338580 () Bool)

(assert (=> b!592848 (= e!338579 e!338580)))

(declare-fun res!379480 () Bool)

(assert (=> b!592848 (=> (not res!379480) (not e!338580))))

(assert (=> b!592848 (= res!379480 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18086 lt!269000)))))

(declare-fun b!592849 () Bool)

(assert (=> b!592849 (= e!338580 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86375 (not res!379479)) b!592848))

(assert (= (and b!592848 res!379480) b!592849))

(declare-fun m!571099 () Bool)

(assert (=> d!86375 m!571099))

(assert (=> b!592849 m!570867))

(declare-fun m!571101 () Bool)

(assert (=> b!592849 m!571101))

(assert (=> b!592585 d!86375))

(declare-fun d!86377 () Bool)

(assert (=> d!86377 (arrayContainsKey!0 lt!269000 (select (arr!17722 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269113 () Unit!18565)

(declare-fun choose!114 (array!36909 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18565)

(assert (=> d!86377 (= lt!269113 (choose!114 lt!269000 (select (arr!17722 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86377 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86377 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269000 (select (arr!17722 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269113)))

(declare-fun bs!18308 () Bool)

(assert (= bs!18308 d!86377))

(assert (=> bs!18308 m!570867))

(assert (=> bs!18308 m!570893))

(assert (=> bs!18308 m!570867))

(declare-fun m!571103 () Bool)

(assert (=> bs!18308 m!571103))

(assert (=> b!592585 d!86377))

(declare-fun d!86379 () Bool)

(assert (=> d!86379 (= (validKeyInArray!0 (select (arr!17722 a!2986) j!136)) (and (not (= (select (arr!17722 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17722 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592584 d!86379))

(declare-fun d!86381 () Bool)

(declare-fun e!338587 () Bool)

(assert (=> d!86381 e!338587))

(declare-fun res!379485 () Bool)

(assert (=> d!86381 (=> (not res!379485) (not e!338587))))

(assert (=> d!86381 (= res!379485 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18086 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18086 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18086 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18086 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18086 a!2986))))))

(declare-fun lt!269122 () Unit!18565)

(declare-fun choose!9 (array!36909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18565)

(assert (=> d!86381 (= lt!269122 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86381 (validMask!0 mask!3053)))

(assert (=> d!86381 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 mask!3053) lt!269122)))

(declare-fun b!592858 () Bool)

(assert (=> b!592858 (= e!338587 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 (select (store (arr!17722 a!2986) i!1108 k0!1786) j!136) (array!36910 (store (arr!17722 a!2986) i!1108 k0!1786) (size!18086 a!2986)) mask!3053)))))

(assert (= (and d!86381 res!379485) b!592858))

(declare-fun m!571109 () Bool)

(assert (=> d!86381 m!571109))

(assert (=> d!86381 m!570901))

(assert (=> b!592858 m!570869))

(assert (=> b!592858 m!570875))

(declare-fun m!571111 () Bool)

(assert (=> b!592858 m!571111))

(assert (=> b!592858 m!570867))

(assert (=> b!592858 m!570883))

(assert (=> b!592858 m!570867))

(assert (=> b!592858 m!570875))

(assert (=> b!592583 d!86381))

(declare-fun d!86389 () Bool)

(declare-fun lt!269125 () (_ BitVec 32))

(assert (=> d!86389 (and (bvsge lt!269125 #b00000000000000000000000000000000) (bvslt lt!269125 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86389 (= lt!269125 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86389 (validMask!0 mask!3053)))

(assert (=> d!86389 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!269125)))

(declare-fun bs!18309 () Bool)

(assert (= bs!18309 d!86389))

(declare-fun m!571113 () Bool)

(assert (=> bs!18309 m!571113))

(assert (=> bs!18309 m!570901))

(assert (=> b!592583 d!86389))

(declare-fun b!592867 () Bool)

(declare-fun e!338594 () SeekEntryResult!6118)

(assert (=> b!592867 (= e!338594 Undefined!6118)))

(declare-fun b!592868 () Bool)

(declare-fun e!338593 () SeekEntryResult!6118)

(assert (=> b!592868 (= e!338593 (Found!6118 lt!269001))))

(declare-fun lt!269127 () SeekEntryResult!6118)

(declare-fun d!86391 () Bool)

(assert (=> d!86391 (and (or ((_ is Undefined!6118) lt!269127) (not ((_ is Found!6118) lt!269127)) (and (bvsge (index!26709 lt!269127) #b00000000000000000000000000000000) (bvslt (index!26709 lt!269127) (size!18086 lt!269000)))) (or ((_ is Undefined!6118) lt!269127) ((_ is Found!6118) lt!269127) (not ((_ is MissingVacant!6118) lt!269127)) (not (= (index!26711 lt!269127) vacantSpotIndex!68)) (and (bvsge (index!26711 lt!269127) #b00000000000000000000000000000000) (bvslt (index!26711 lt!269127) (size!18086 lt!269000)))) (or ((_ is Undefined!6118) lt!269127) (ite ((_ is Found!6118) lt!269127) (= (select (arr!17722 lt!269000) (index!26709 lt!269127)) lt!268996) (and ((_ is MissingVacant!6118) lt!269127) (= (index!26711 lt!269127) vacantSpotIndex!68) (= (select (arr!17722 lt!269000) (index!26711 lt!269127)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86391 (= lt!269127 e!338594)))

(declare-fun c!67061 () Bool)

(assert (=> d!86391 (= c!67061 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269126 () (_ BitVec 64))

(assert (=> d!86391 (= lt!269126 (select (arr!17722 lt!269000) lt!269001))))

(assert (=> d!86391 (validMask!0 mask!3053)))

(assert (=> d!86391 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 lt!268996 lt!269000 mask!3053) lt!269127)))

(declare-fun b!592869 () Bool)

(declare-fun e!338592 () SeekEntryResult!6118)

(assert (=> b!592869 (= e!338592 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269001 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!268996 lt!269000 mask!3053))))

(declare-fun b!592870 () Bool)

(declare-fun c!67060 () Bool)

(assert (=> b!592870 (= c!67060 (= lt!269126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592870 (= e!338593 e!338592)))

(declare-fun b!592871 () Bool)

(assert (=> b!592871 (= e!338594 e!338593)))

(declare-fun c!67059 () Bool)

(assert (=> b!592871 (= c!67059 (= lt!269126 lt!268996))))

(declare-fun b!592872 () Bool)

(assert (=> b!592872 (= e!338592 (MissingVacant!6118 vacantSpotIndex!68))))

(assert (= (and d!86391 c!67061) b!592867))

(assert (= (and d!86391 (not c!67061)) b!592871))

(assert (= (and b!592871 c!67059) b!592868))

(assert (= (and b!592871 (not c!67059)) b!592870))

(assert (= (and b!592870 c!67060) b!592872))

(assert (= (and b!592870 (not c!67060)) b!592869))

(declare-fun m!571115 () Bool)

(assert (=> d!86391 m!571115))

(declare-fun m!571117 () Bool)

(assert (=> d!86391 m!571117))

(declare-fun m!571119 () Bool)

(assert (=> d!86391 m!571119))

(assert (=> d!86391 m!570901))

(declare-fun m!571121 () Bool)

(assert (=> b!592869 m!571121))

(assert (=> b!592869 m!571121))

(declare-fun m!571123 () Bool)

(assert (=> b!592869 m!571123))

(assert (=> b!592583 d!86391))

(declare-fun b!592881 () Bool)

(declare-fun e!338602 () SeekEntryResult!6118)

(assert (=> b!592881 (= e!338602 Undefined!6118)))

(declare-fun b!592882 () Bool)

(declare-fun e!338601 () SeekEntryResult!6118)

(assert (=> b!592882 (= e!338601 (Found!6118 index!984))))

(declare-fun d!86393 () Bool)

(declare-fun lt!269134 () SeekEntryResult!6118)

(assert (=> d!86393 (and (or ((_ is Undefined!6118) lt!269134) (not ((_ is Found!6118) lt!269134)) (and (bvsge (index!26709 lt!269134) #b00000000000000000000000000000000) (bvslt (index!26709 lt!269134) (size!18086 lt!269000)))) (or ((_ is Undefined!6118) lt!269134) ((_ is Found!6118) lt!269134) (not ((_ is MissingVacant!6118) lt!269134)) (not (= (index!26711 lt!269134) vacantSpotIndex!68)) (and (bvsge (index!26711 lt!269134) #b00000000000000000000000000000000) (bvslt (index!26711 lt!269134) (size!18086 lt!269000)))) (or ((_ is Undefined!6118) lt!269134) (ite ((_ is Found!6118) lt!269134) (= (select (arr!17722 lt!269000) (index!26709 lt!269134)) lt!268996) (and ((_ is MissingVacant!6118) lt!269134) (= (index!26711 lt!269134) vacantSpotIndex!68) (= (select (arr!17722 lt!269000) (index!26711 lt!269134)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86393 (= lt!269134 e!338602)))

(declare-fun c!67067 () Bool)

(assert (=> d!86393 (= c!67067 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269133 () (_ BitVec 64))

(assert (=> d!86393 (= lt!269133 (select (arr!17722 lt!269000) index!984))))

(assert (=> d!86393 (validMask!0 mask!3053)))

(assert (=> d!86393 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268996 lt!269000 mask!3053) lt!269134)))

(declare-fun b!592883 () Bool)

(declare-fun e!338600 () SeekEntryResult!6118)

(assert (=> b!592883 (= e!338600 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!268996 lt!269000 mask!3053))))

(declare-fun b!592884 () Bool)

(declare-fun c!67066 () Bool)

(assert (=> b!592884 (= c!67066 (= lt!269133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592884 (= e!338601 e!338600)))

(declare-fun b!592885 () Bool)

(assert (=> b!592885 (= e!338602 e!338601)))

(declare-fun c!67065 () Bool)

(assert (=> b!592885 (= c!67065 (= lt!269133 lt!268996))))

(declare-fun b!592886 () Bool)

(assert (=> b!592886 (= e!338600 (MissingVacant!6118 vacantSpotIndex!68))))

(assert (= (and d!86393 c!67067) b!592881))

(assert (= (and d!86393 (not c!67067)) b!592885))

(assert (= (and b!592885 c!67065) b!592882))

(assert (= (and b!592885 (not c!67065)) b!592884))

(assert (= (and b!592884 c!67066) b!592886))

(assert (= (and b!592884 (not c!67066)) b!592883))

(declare-fun m!571125 () Bool)

(assert (=> d!86393 m!571125))

(declare-fun m!571129 () Bool)

(assert (=> d!86393 m!571129))

(assert (=> d!86393 m!571037))

(assert (=> d!86393 m!570901))

(assert (=> b!592883 m!571033))

(assert (=> b!592883 m!571033))

(declare-fun m!571141 () Bool)

(assert (=> b!592883 m!571141))

(assert (=> b!592583 d!86393))

(declare-fun b!592887 () Bool)

(declare-fun e!338605 () SeekEntryResult!6118)

(assert (=> b!592887 (= e!338605 Undefined!6118)))

(declare-fun b!592888 () Bool)

(declare-fun e!338604 () SeekEntryResult!6118)

(assert (=> b!592888 (= e!338604 (Found!6118 lt!269001))))

(declare-fun lt!269136 () SeekEntryResult!6118)

(declare-fun d!86395 () Bool)

(assert (=> d!86395 (and (or ((_ is Undefined!6118) lt!269136) (not ((_ is Found!6118) lt!269136)) (and (bvsge (index!26709 lt!269136) #b00000000000000000000000000000000) (bvslt (index!26709 lt!269136) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269136) ((_ is Found!6118) lt!269136) (not ((_ is MissingVacant!6118) lt!269136)) (not (= (index!26711 lt!269136) vacantSpotIndex!68)) (and (bvsge (index!26711 lt!269136) #b00000000000000000000000000000000) (bvslt (index!26711 lt!269136) (size!18086 a!2986)))) (or ((_ is Undefined!6118) lt!269136) (ite ((_ is Found!6118) lt!269136) (= (select (arr!17722 a!2986) (index!26709 lt!269136)) (select (arr!17722 a!2986) j!136)) (and ((_ is MissingVacant!6118) lt!269136) (= (index!26711 lt!269136) vacantSpotIndex!68) (= (select (arr!17722 a!2986) (index!26711 lt!269136)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86395 (= lt!269136 e!338605)))

(declare-fun c!67070 () Bool)

(assert (=> d!86395 (= c!67070 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269135 () (_ BitVec 64))

(assert (=> d!86395 (= lt!269135 (select (arr!17722 a!2986) lt!269001))))

(assert (=> d!86395 (validMask!0 mask!3053)))

(assert (=> d!86395 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269001 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053) lt!269136)))

(declare-fun b!592889 () Bool)

(declare-fun e!338603 () SeekEntryResult!6118)

(assert (=> b!592889 (= e!338603 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269001 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592890 () Bool)

(declare-fun c!67069 () Bool)

(assert (=> b!592890 (= c!67069 (= lt!269135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592890 (= e!338604 e!338603)))

(declare-fun b!592891 () Bool)

(assert (=> b!592891 (= e!338605 e!338604)))

(declare-fun c!67068 () Bool)

(assert (=> b!592891 (= c!67068 (= lt!269135 (select (arr!17722 a!2986) j!136)))))

(declare-fun b!592892 () Bool)

(assert (=> b!592892 (= e!338603 (MissingVacant!6118 vacantSpotIndex!68))))

(assert (= (and d!86395 c!67070) b!592887))

(assert (= (and d!86395 (not c!67070)) b!592891))

(assert (= (and b!592891 c!67068) b!592888))

(assert (= (and b!592891 (not c!67068)) b!592890))

(assert (= (and b!592890 c!67069) b!592892))

(assert (= (and b!592890 (not c!67069)) b!592889))

(declare-fun m!571149 () Bool)

(assert (=> d!86395 m!571149))

(declare-fun m!571151 () Bool)

(assert (=> d!86395 m!571151))

(declare-fun m!571153 () Bool)

(assert (=> d!86395 m!571153))

(assert (=> d!86395 m!570901))

(assert (=> b!592889 m!571121))

(assert (=> b!592889 m!571121))

(assert (=> b!592889 m!570867))

(declare-fun m!571155 () Bool)

(assert (=> b!592889 m!571155))

(assert (=> b!592583 d!86395))

(check-sat (not b!592889) (not b!592838) (not b!592883) (not d!86347) (not d!86391) (not b!592729) (not b!592858) (not b!592749) (not b!592744) (not d!86395) (not b!592721) (not b!592849) (not d!86393) (not d!86351) (not d!86377) (not b!592836) (not bm!32835) (not d!86381) (not bm!32840) (not b!592847) (not b!592803) (not b!592840) (not b!592723) (not b!592869) (not d!86389))
(check-sat)
