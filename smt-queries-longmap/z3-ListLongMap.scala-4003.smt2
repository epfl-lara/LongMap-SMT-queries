; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54396 () Bool)

(assert start!54396)

(declare-fun b!593680 () Bool)

(declare-fun e!339132 () Bool)

(declare-fun e!339142 () Bool)

(assert (=> b!593680 (= e!339132 (not e!339142))))

(declare-fun res!380008 () Bool)

(assert (=> b!593680 (=> res!380008 e!339142)))

(declare-datatypes ((SeekEntryResult!6175 0))(
  ( (MissingZero!6175 (index!26945 (_ BitVec 32))) (Found!6175 (index!26946 (_ BitVec 32))) (Intermediate!6175 (undefined!6987 Bool) (index!26947 (_ BitVec 32)) (x!55757 (_ BitVec 32))) (Undefined!6175) (MissingVacant!6175 (index!26948 (_ BitVec 32))) )
))
(declare-fun lt!269415 () SeekEntryResult!6175)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593680 (= res!380008 (not (= lt!269415 (Found!6175 index!984))))))

(declare-datatypes ((Unit!18612 0))(
  ( (Unit!18613) )
))
(declare-fun lt!269406 () Unit!18612)

(declare-fun e!339140 () Unit!18612)

(assert (=> b!593680 (= lt!269406 e!339140)))

(declare-fun c!67209 () Bool)

(assert (=> b!593680 (= c!67209 (= lt!269415 Undefined!6175))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!269414 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36945 0))(
  ( (array!36946 (arr!17738 (Array (_ BitVec 32) (_ BitVec 64))) (size!18103 (_ BitVec 32))) )
))
(declare-fun lt!269410 () array!36945)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36945 (_ BitVec 32)) SeekEntryResult!6175)

(assert (=> b!593680 (= lt!269415 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269414 lt!269410 mask!3053))))

(declare-fun e!339143 () Bool)

(assert (=> b!593680 e!339143))

(declare-fun res!379997 () Bool)

(assert (=> b!593680 (=> (not res!379997) (not e!339143))))

(declare-fun lt!269416 () (_ BitVec 32))

(declare-fun lt!269413 () SeekEntryResult!6175)

(assert (=> b!593680 (= res!379997 (= lt!269413 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 lt!269414 lt!269410 mask!3053)))))

(declare-fun a!2986 () array!36945)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!593680 (= lt!269413 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!593680 (= lt!269414 (select (store (arr!17738 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269411 () Unit!18612)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18612)

(assert (=> b!593680 (= lt!269411 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593680 (= lt!269416 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593681 () Bool)

(declare-fun e!339133 () Bool)

(declare-fun e!339136 () Bool)

(assert (=> b!593681 (= e!339133 e!339136)))

(declare-fun res!380014 () Bool)

(assert (=> b!593681 (=> (not res!380014) (not e!339136))))

(assert (=> b!593681 (= res!380014 (= (select (store (arr!17738 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593681 (= lt!269410 (array!36946 (store (arr!17738 a!2986) i!1108 k0!1786) (size!18103 a!2986)))))

(declare-fun b!593682 () Bool)

(declare-fun res!380009 () Bool)

(assert (=> b!593682 (=> (not res!380009) (not e!339133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36945 (_ BitVec 32)) Bool)

(assert (=> b!593682 (= res!380009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593683 () Bool)

(declare-fun res!380000 () Bool)

(assert (=> b!593683 (=> (not res!380000) (not e!339133))))

(assert (=> b!593683 (= res!380000 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17738 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593684 () Bool)

(declare-fun res!380015 () Bool)

(declare-fun e!339139 () Bool)

(assert (=> b!593684 (=> (not res!380015) (not e!339139))))

(declare-fun arrayContainsKey!0 (array!36945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593684 (= res!380015 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!380013 () Bool)

(assert (=> start!54396 (=> (not res!380013) (not e!339139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54396 (= res!380013 (validMask!0 mask!3053))))

(assert (=> start!54396 e!339139))

(assert (=> start!54396 true))

(declare-fun array_inv!13621 (array!36945) Bool)

(assert (=> start!54396 (array_inv!13621 a!2986)))

(declare-fun b!593685 () Bool)

(assert (=> b!593685 (= e!339136 e!339132)))

(declare-fun res!380010 () Bool)

(assert (=> b!593685 (=> (not res!380010) (not e!339132))))

(declare-fun lt!269407 () SeekEntryResult!6175)

(assert (=> b!593685 (= res!380010 (and (= lt!269407 (Found!6175 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17738 a!2986) index!984) (select (arr!17738 a!2986) j!136))) (not (= (select (arr!17738 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593685 (= lt!269407 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593686 () Bool)

(declare-fun Unit!18614 () Unit!18612)

(assert (=> b!593686 (= e!339140 Unit!18614)))

(declare-fun e!339141 () Bool)

(declare-fun b!593687 () Bool)

(assert (=> b!593687 (= e!339141 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) index!984))))

(declare-fun b!593688 () Bool)

(declare-fun res!380011 () Bool)

(declare-fun e!339134 () Bool)

(assert (=> b!593688 (=> res!380011 e!339134)))

(declare-datatypes ((List!11818 0))(
  ( (Nil!11815) (Cons!11814 (h!12859 (_ BitVec 64)) (t!18037 List!11818)) )
))
(declare-fun noDuplicate!239 (List!11818) Bool)

(assert (=> b!593688 (= res!380011 (not (noDuplicate!239 Nil!11815)))))

(declare-fun b!593689 () Bool)

(assert (=> b!593689 (= e!339139 e!339133)))

(declare-fun res!380012 () Bool)

(assert (=> b!593689 (=> (not res!380012) (not e!339133))))

(declare-fun lt!269412 () SeekEntryResult!6175)

(assert (=> b!593689 (= res!380012 (or (= lt!269412 (MissingZero!6175 i!1108)) (= lt!269412 (MissingVacant!6175 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36945 (_ BitVec 32)) SeekEntryResult!6175)

(assert (=> b!593689 (= lt!269412 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593690 () Bool)

(declare-fun e!339144 () Bool)

(declare-fun contains!2902 (List!11818 (_ BitVec 64)) Bool)

(assert (=> b!593690 (= e!339144 (not (contains!2902 Nil!11815 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593691 () Bool)

(declare-fun res!380003 () Bool)

(assert (=> b!593691 (=> (not res!380003) (not e!339139))))

(assert (=> b!593691 (= res!380003 (and (= (size!18103 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18103 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18103 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593692 () Bool)

(declare-fun Unit!18615 () Unit!18612)

(assert (=> b!593692 (= e!339140 Unit!18615)))

(assert (=> b!593692 false))

(declare-fun b!593693 () Bool)

(declare-fun res!380002 () Bool)

(assert (=> b!593693 (=> (not res!380002) (not e!339139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593693 (= res!380002 (validKeyInArray!0 k0!1786))))

(declare-fun b!593694 () Bool)

(assert (=> b!593694 (= e!339143 (= lt!269407 lt!269413))))

(declare-fun b!593695 () Bool)

(declare-fun e!339131 () Bool)

(assert (=> b!593695 (= e!339142 e!339131)))

(declare-fun res!380006 () Bool)

(assert (=> b!593695 (=> res!380006 e!339131)))

(declare-fun lt!269409 () (_ BitVec 64))

(assert (=> b!593695 (= res!380006 (or (not (= (select (arr!17738 a!2986) j!136) lt!269414)) (not (= (select (arr!17738 a!2986) j!136) lt!269409)) (bvsge j!136 index!984)))))

(declare-fun e!339135 () Bool)

(assert (=> b!593695 e!339135))

(declare-fun res!380007 () Bool)

(assert (=> b!593695 (=> (not res!380007) (not e!339135))))

(assert (=> b!593695 (= res!380007 (= lt!269409 (select (arr!17738 a!2986) j!136)))))

(assert (=> b!593695 (= lt!269409 (select (store (arr!17738 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593696 () Bool)

(assert (=> b!593696 (= e!339134 e!339144)))

(declare-fun res!379999 () Bool)

(assert (=> b!593696 (=> (not res!379999) (not e!339144))))

(assert (=> b!593696 (= res!379999 (not (contains!2902 Nil!11815 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593697 () Bool)

(declare-fun res!379996 () Bool)

(assert (=> b!593697 (=> (not res!379996) (not e!339139))))

(assert (=> b!593697 (= res!379996 (validKeyInArray!0 (select (arr!17738 a!2986) j!136)))))

(declare-fun b!593698 () Bool)

(declare-fun e!339137 () Bool)

(assert (=> b!593698 (= e!339135 e!339137)))

(declare-fun res!380001 () Bool)

(assert (=> b!593698 (=> res!380001 e!339137)))

(assert (=> b!593698 (= res!380001 (or (not (= (select (arr!17738 a!2986) j!136) lt!269414)) (not (= (select (arr!17738 a!2986) j!136) lt!269409)) (bvsge j!136 index!984)))))

(declare-fun b!593699 () Bool)

(declare-fun res!379998 () Bool)

(assert (=> b!593699 (=> (not res!379998) (not e!339133))))

(declare-fun arrayNoDuplicates!0 (array!36945 (_ BitVec 32) List!11818) Bool)

(assert (=> b!593699 (= res!379998 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11815))))

(declare-fun b!593700 () Bool)

(assert (=> b!593700 (= e!339131 e!339134)))

(declare-fun res!380004 () Bool)

(assert (=> b!593700 (=> res!380004 e!339134)))

(assert (=> b!593700 (= res!380004 (or (bvsgt #b00000000000000000000000000000000 (size!18103 a!2986)) (bvsge (size!18103 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593700 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269408 () Unit!18612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36945 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18612)

(assert (=> b!593700 (= lt!269408 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269410 (select (arr!17738 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593701 () Bool)

(assert (=> b!593701 (= e!339137 e!339141)))

(declare-fun res!380005 () Bool)

(assert (=> b!593701 (=> (not res!380005) (not e!339141))))

(assert (=> b!593701 (= res!380005 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) j!136))))

(assert (= (and start!54396 res!380013) b!593691))

(assert (= (and b!593691 res!380003) b!593697))

(assert (= (and b!593697 res!379996) b!593693))

(assert (= (and b!593693 res!380002) b!593684))

(assert (= (and b!593684 res!380015) b!593689))

(assert (= (and b!593689 res!380012) b!593682))

(assert (= (and b!593682 res!380009) b!593699))

(assert (= (and b!593699 res!379998) b!593683))

(assert (= (and b!593683 res!380000) b!593681))

(assert (= (and b!593681 res!380014) b!593685))

(assert (= (and b!593685 res!380010) b!593680))

(assert (= (and b!593680 res!379997) b!593694))

(assert (= (and b!593680 c!67209) b!593692))

(assert (= (and b!593680 (not c!67209)) b!593686))

(assert (= (and b!593680 (not res!380008)) b!593695))

(assert (= (and b!593695 res!380007) b!593698))

(assert (= (and b!593698 (not res!380001)) b!593701))

(assert (= (and b!593701 res!380005) b!593687))

(assert (= (and b!593695 (not res!380006)) b!593700))

(assert (= (and b!593700 (not res!380004)) b!593688))

(assert (= (and b!593688 (not res!380011)) b!593696))

(assert (= (and b!593696 res!379999) b!593690))

(declare-fun m!571057 () Bool)

(assert (=> b!593700 m!571057))

(assert (=> b!593700 m!571057))

(declare-fun m!571059 () Bool)

(assert (=> b!593700 m!571059))

(assert (=> b!593700 m!571057))

(declare-fun m!571061 () Bool)

(assert (=> b!593700 m!571061))

(declare-fun m!571063 () Bool)

(assert (=> b!593699 m!571063))

(declare-fun m!571065 () Bool)

(assert (=> start!54396 m!571065))

(declare-fun m!571067 () Bool)

(assert (=> start!54396 m!571067))

(declare-fun m!571069 () Bool)

(assert (=> b!593693 m!571069))

(declare-fun m!571071 () Bool)

(assert (=> b!593689 m!571071))

(assert (=> b!593701 m!571057))

(assert (=> b!593701 m!571057))

(declare-fun m!571073 () Bool)

(assert (=> b!593701 m!571073))

(declare-fun m!571075 () Bool)

(assert (=> b!593681 m!571075))

(declare-fun m!571077 () Bool)

(assert (=> b!593681 m!571077))

(assert (=> b!593687 m!571057))

(assert (=> b!593687 m!571057))

(declare-fun m!571079 () Bool)

(assert (=> b!593687 m!571079))

(assert (=> b!593697 m!571057))

(assert (=> b!593697 m!571057))

(declare-fun m!571081 () Bool)

(assert (=> b!593697 m!571081))

(declare-fun m!571083 () Bool)

(assert (=> b!593685 m!571083))

(assert (=> b!593685 m!571057))

(assert (=> b!593685 m!571057))

(declare-fun m!571085 () Bool)

(assert (=> b!593685 m!571085))

(declare-fun m!571087 () Bool)

(assert (=> b!593683 m!571087))

(assert (=> b!593698 m!571057))

(assert (=> b!593695 m!571057))

(assert (=> b!593695 m!571075))

(declare-fun m!571089 () Bool)

(assert (=> b!593695 m!571089))

(declare-fun m!571091 () Bool)

(assert (=> b!593680 m!571091))

(declare-fun m!571093 () Bool)

(assert (=> b!593680 m!571093))

(assert (=> b!593680 m!571057))

(assert (=> b!593680 m!571075))

(declare-fun m!571095 () Bool)

(assert (=> b!593680 m!571095))

(assert (=> b!593680 m!571057))

(declare-fun m!571097 () Bool)

(assert (=> b!593680 m!571097))

(declare-fun m!571099 () Bool)

(assert (=> b!593680 m!571099))

(declare-fun m!571101 () Bool)

(assert (=> b!593680 m!571101))

(declare-fun m!571103 () Bool)

(assert (=> b!593682 m!571103))

(declare-fun m!571105 () Bool)

(assert (=> b!593690 m!571105))

(declare-fun m!571107 () Bool)

(assert (=> b!593688 m!571107))

(declare-fun m!571109 () Bool)

(assert (=> b!593684 m!571109))

(declare-fun m!571111 () Bool)

(assert (=> b!593696 m!571111))

(check-sat (not start!54396) (not b!593696) (not b!593701) (not b!593685) (not b!593689) (not b!593690) (not b!593699) (not b!593693) (not b!593684) (not b!593688) (not b!593687) (not b!593682) (not b!593697) (not b!593700) (not b!593680))
(check-sat)
(get-model)

(declare-fun b!593842 () Bool)

(declare-fun e!339235 () Bool)

(declare-fun call!32863 () Bool)

(assert (=> b!593842 (= e!339235 call!32863)))

(declare-fun b!593843 () Bool)

(declare-fun e!339236 () Bool)

(assert (=> b!593843 (= e!339236 call!32863)))

(declare-fun b!593844 () Bool)

(assert (=> b!593844 (= e!339235 e!339236)))

(declare-fun lt!269489 () (_ BitVec 64))

(assert (=> b!593844 (= lt!269489 (select (arr!17738 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269490 () Unit!18612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36945 (_ BitVec 64) (_ BitVec 32)) Unit!18612)

(assert (=> b!593844 (= lt!269490 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269489 #b00000000000000000000000000000000))))

(assert (=> b!593844 (arrayContainsKey!0 a!2986 lt!269489 #b00000000000000000000000000000000)))

(declare-fun lt!269491 () Unit!18612)

(assert (=> b!593844 (= lt!269491 lt!269490)))

(declare-fun res!380141 () Bool)

(assert (=> b!593844 (= res!380141 (= (seekEntryOrOpen!0 (select (arr!17738 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6175 #b00000000000000000000000000000000)))))

(assert (=> b!593844 (=> (not res!380141) (not e!339236))))

(declare-fun bm!32860 () Bool)

(assert (=> bm!32860 (= call!32863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!593845 () Bool)

(declare-fun e!339237 () Bool)

(assert (=> b!593845 (= e!339237 e!339235)))

(declare-fun c!67218 () Bool)

(assert (=> b!593845 (= c!67218 (validKeyInArray!0 (select (arr!17738 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86349 () Bool)

(declare-fun res!380140 () Bool)

(assert (=> d!86349 (=> res!380140 e!339237)))

(assert (=> d!86349 (= res!380140 (bvsge #b00000000000000000000000000000000 (size!18103 a!2986)))))

(assert (=> d!86349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!339237)))

(assert (= (and d!86349 (not res!380140)) b!593845))

(assert (= (and b!593845 c!67218) b!593844))

(assert (= (and b!593845 (not c!67218)) b!593842))

(assert (= (and b!593844 res!380141) b!593843))

(assert (= (or b!593843 b!593842) bm!32860))

(declare-fun m!571225 () Bool)

(assert (=> b!593844 m!571225))

(declare-fun m!571227 () Bool)

(assert (=> b!593844 m!571227))

(declare-fun m!571229 () Bool)

(assert (=> b!593844 m!571229))

(assert (=> b!593844 m!571225))

(declare-fun m!571231 () Bool)

(assert (=> b!593844 m!571231))

(declare-fun m!571233 () Bool)

(assert (=> bm!32860 m!571233))

(assert (=> b!593845 m!571225))

(assert (=> b!593845 m!571225))

(declare-fun m!571235 () Bool)

(assert (=> b!593845 m!571235))

(assert (=> b!593682 d!86349))

(declare-fun d!86351 () Bool)

(assert (=> d!86351 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593693 d!86351))

(declare-fun d!86353 () Bool)

(declare-fun res!380146 () Bool)

(declare-fun e!339242 () Bool)

(assert (=> d!86353 (=> res!380146 e!339242)))

(assert (=> d!86353 (= res!380146 (= (select (arr!17738 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86353 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!339242)))

(declare-fun b!593850 () Bool)

(declare-fun e!339243 () Bool)

(assert (=> b!593850 (= e!339242 e!339243)))

(declare-fun res!380147 () Bool)

(assert (=> b!593850 (=> (not res!380147) (not e!339243))))

(assert (=> b!593850 (= res!380147 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18103 a!2986)))))

(declare-fun b!593851 () Bool)

(assert (=> b!593851 (= e!339243 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86353 (not res!380146)) b!593850))

(assert (= (and b!593850 res!380147) b!593851))

(assert (=> d!86353 m!571225))

(declare-fun m!571237 () Bool)

(assert (=> b!593851 m!571237))

(assert (=> b!593684 d!86353))

(declare-fun b!593864 () Bool)

(declare-fun e!339251 () SeekEntryResult!6175)

(assert (=> b!593864 (= e!339251 Undefined!6175)))

(declare-fun b!593865 () Bool)

(declare-fun e!339252 () SeekEntryResult!6175)

(assert (=> b!593865 (= e!339252 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!593866 () Bool)

(assert (=> b!593866 (= e!339252 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593867 () Bool)

(declare-fun e!339250 () SeekEntryResult!6175)

(assert (=> b!593867 (= e!339250 (Found!6175 index!984))))

(declare-fun d!86355 () Bool)

(declare-fun lt!269496 () SeekEntryResult!6175)

(get-info :version)

(assert (=> d!86355 (and (or ((_ is Undefined!6175) lt!269496) (not ((_ is Found!6175) lt!269496)) (and (bvsge (index!26946 lt!269496) #b00000000000000000000000000000000) (bvslt (index!26946 lt!269496) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269496) ((_ is Found!6175) lt!269496) (not ((_ is MissingVacant!6175) lt!269496)) (not (= (index!26948 lt!269496) vacantSpotIndex!68)) (and (bvsge (index!26948 lt!269496) #b00000000000000000000000000000000) (bvslt (index!26948 lt!269496) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269496) (ite ((_ is Found!6175) lt!269496) (= (select (arr!17738 a!2986) (index!26946 lt!269496)) (select (arr!17738 a!2986) j!136)) (and ((_ is MissingVacant!6175) lt!269496) (= (index!26948 lt!269496) vacantSpotIndex!68) (= (select (arr!17738 a!2986) (index!26948 lt!269496)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86355 (= lt!269496 e!339251)))

(declare-fun c!67227 () Bool)

(assert (=> d!86355 (= c!67227 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269497 () (_ BitVec 64))

(assert (=> d!86355 (= lt!269497 (select (arr!17738 a!2986) index!984))))

(assert (=> d!86355 (validMask!0 mask!3053)))

(assert (=> d!86355 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053) lt!269496)))

(declare-fun b!593868 () Bool)

(assert (=> b!593868 (= e!339251 e!339250)))

(declare-fun c!67226 () Bool)

(assert (=> b!593868 (= c!67226 (= lt!269497 (select (arr!17738 a!2986) j!136)))))

(declare-fun b!593869 () Bool)

(declare-fun c!67225 () Bool)

(assert (=> b!593869 (= c!67225 (= lt!269497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593869 (= e!339250 e!339252)))

(assert (= (and d!86355 c!67227) b!593864))

(assert (= (and d!86355 (not c!67227)) b!593868))

(assert (= (and b!593868 c!67226) b!593867))

(assert (= (and b!593868 (not c!67226)) b!593869))

(assert (= (and b!593869 c!67225) b!593865))

(assert (= (and b!593869 (not c!67225)) b!593866))

(assert (=> b!593866 m!571101))

(assert (=> b!593866 m!571101))

(assert (=> b!593866 m!571057))

(declare-fun m!571239 () Bool)

(assert (=> b!593866 m!571239))

(declare-fun m!571241 () Bool)

(assert (=> d!86355 m!571241))

(declare-fun m!571243 () Bool)

(assert (=> d!86355 m!571243))

(assert (=> d!86355 m!571083))

(assert (=> d!86355 m!571065))

(assert (=> b!593685 d!86355))

(declare-fun d!86357 () Bool)

(declare-fun lt!269500 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!231 (List!11818) (InoxSet (_ BitVec 64)))

(assert (=> d!86357 (= lt!269500 (select (content!231 Nil!11815) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339258 () Bool)

(assert (=> d!86357 (= lt!269500 e!339258)))

(declare-fun res!380152 () Bool)

(assert (=> d!86357 (=> (not res!380152) (not e!339258))))

(assert (=> d!86357 (= res!380152 ((_ is Cons!11814) Nil!11815))))

(assert (=> d!86357 (= (contains!2902 Nil!11815 #b0000000000000000000000000000000000000000000000000000000000000000) lt!269500)))

(declare-fun b!593874 () Bool)

(declare-fun e!339257 () Bool)

(assert (=> b!593874 (= e!339258 e!339257)))

(declare-fun res!380153 () Bool)

(assert (=> b!593874 (=> res!380153 e!339257)))

(assert (=> b!593874 (= res!380153 (= (h!12859 Nil!11815) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!593875 () Bool)

(assert (=> b!593875 (= e!339257 (contains!2902 (t!18037 Nil!11815) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86357 res!380152) b!593874))

(assert (= (and b!593874 (not res!380153)) b!593875))

(declare-fun m!571245 () Bool)

(assert (=> d!86357 m!571245))

(declare-fun m!571247 () Bool)

(assert (=> d!86357 m!571247))

(declare-fun m!571249 () Bool)

(assert (=> b!593875 m!571249))

(assert (=> b!593696 d!86357))

(declare-fun d!86359 () Bool)

(assert (=> d!86359 (= (validKeyInArray!0 (select (arr!17738 a!2986) j!136)) (and (not (= (select (arr!17738 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17738 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593697 d!86359))

(declare-fun d!86361 () Bool)

(declare-fun res!380154 () Bool)

(declare-fun e!339259 () Bool)

(assert (=> d!86361 (=> res!380154 e!339259)))

(assert (=> d!86361 (= res!380154 (= (select (arr!17738 lt!269410) index!984) (select (arr!17738 a!2986) j!136)))))

(assert (=> d!86361 (= (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) index!984) e!339259)))

(declare-fun b!593876 () Bool)

(declare-fun e!339260 () Bool)

(assert (=> b!593876 (= e!339259 e!339260)))

(declare-fun res!380155 () Bool)

(assert (=> b!593876 (=> (not res!380155) (not e!339260))))

(assert (=> b!593876 (= res!380155 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18103 lt!269410)))))

(declare-fun b!593877 () Bool)

(assert (=> b!593877 (= e!339260 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86361 (not res!380154)) b!593876))

(assert (= (and b!593876 res!380155) b!593877))

(declare-fun m!571251 () Bool)

(assert (=> d!86361 m!571251))

(assert (=> b!593877 m!571057))

(declare-fun m!571253 () Bool)

(assert (=> b!593877 m!571253))

(assert (=> b!593687 d!86361))

(declare-fun d!86365 () Bool)

(declare-fun res!380162 () Bool)

(declare-fun e!339267 () Bool)

(assert (=> d!86365 (=> res!380162 e!339267)))

(assert (=> d!86365 (= res!380162 ((_ is Nil!11815) Nil!11815))))

(assert (=> d!86365 (= (noDuplicate!239 Nil!11815) e!339267)))

(declare-fun b!593884 () Bool)

(declare-fun e!339268 () Bool)

(assert (=> b!593884 (= e!339267 e!339268)))

(declare-fun res!380163 () Bool)

(assert (=> b!593884 (=> (not res!380163) (not e!339268))))

(assert (=> b!593884 (= res!380163 (not (contains!2902 (t!18037 Nil!11815) (h!12859 Nil!11815))))))

(declare-fun b!593885 () Bool)

(assert (=> b!593885 (= e!339268 (noDuplicate!239 (t!18037 Nil!11815)))))

(assert (= (and d!86365 (not res!380162)) b!593884))

(assert (= (and b!593884 res!380163) b!593885))

(declare-fun m!571255 () Bool)

(assert (=> b!593884 m!571255))

(declare-fun m!571257 () Bool)

(assert (=> b!593885 m!571257))

(assert (=> b!593688 d!86365))

(declare-fun b!593910 () Bool)

(declare-fun e!339291 () Bool)

(assert (=> b!593910 (= e!339291 (contains!2902 Nil!11815 (select (arr!17738 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593911 () Bool)

(declare-fun e!339292 () Bool)

(declare-fun e!339289 () Bool)

(assert (=> b!593911 (= e!339292 e!339289)))

(declare-fun c!67232 () Bool)

(assert (=> b!593911 (= c!67232 (validKeyInArray!0 (select (arr!17738 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593912 () Bool)

(declare-fun call!32868 () Bool)

(assert (=> b!593912 (= e!339289 call!32868)))

(declare-fun d!86367 () Bool)

(declare-fun res!380181 () Bool)

(declare-fun e!339290 () Bool)

(assert (=> d!86367 (=> res!380181 e!339290)))

(assert (=> d!86367 (= res!380181 (bvsge #b00000000000000000000000000000000 (size!18103 a!2986)))))

(assert (=> d!86367 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11815) e!339290)))

(declare-fun b!593913 () Bool)

(assert (=> b!593913 (= e!339289 call!32868)))

(declare-fun b!593914 () Bool)

(assert (=> b!593914 (= e!339290 e!339292)))

(declare-fun res!380182 () Bool)

(assert (=> b!593914 (=> (not res!380182) (not e!339292))))

(assert (=> b!593914 (= res!380182 (not e!339291))))

(declare-fun res!380180 () Bool)

(assert (=> b!593914 (=> (not res!380180) (not e!339291))))

(assert (=> b!593914 (= res!380180 (validKeyInArray!0 (select (arr!17738 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32865 () Bool)

(assert (=> bm!32865 (= call!32868 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67232 (Cons!11814 (select (arr!17738 a!2986) #b00000000000000000000000000000000) Nil!11815) Nil!11815)))))

(assert (= (and d!86367 (not res!380181)) b!593914))

(assert (= (and b!593914 res!380180) b!593910))

(assert (= (and b!593914 res!380182) b!593911))

(assert (= (and b!593911 c!67232) b!593913))

(assert (= (and b!593911 (not c!67232)) b!593912))

(assert (= (or b!593913 b!593912) bm!32865))

(assert (=> b!593910 m!571225))

(assert (=> b!593910 m!571225))

(declare-fun m!571265 () Bool)

(assert (=> b!593910 m!571265))

(assert (=> b!593911 m!571225))

(assert (=> b!593911 m!571225))

(assert (=> b!593911 m!571235))

(assert (=> b!593914 m!571225))

(assert (=> b!593914 m!571225))

(assert (=> b!593914 m!571235))

(assert (=> bm!32865 m!571225))

(declare-fun m!571275 () Bool)

(assert (=> bm!32865 m!571275))

(assert (=> b!593699 d!86367))

(declare-fun d!86375 () Bool)

(declare-fun lt!269520 () SeekEntryResult!6175)

(assert (=> d!86375 (and (or ((_ is Undefined!6175) lt!269520) (not ((_ is Found!6175) lt!269520)) (and (bvsge (index!26946 lt!269520) #b00000000000000000000000000000000) (bvslt (index!26946 lt!269520) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269520) ((_ is Found!6175) lt!269520) (not ((_ is MissingZero!6175) lt!269520)) (and (bvsge (index!26945 lt!269520) #b00000000000000000000000000000000) (bvslt (index!26945 lt!269520) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269520) ((_ is Found!6175) lt!269520) ((_ is MissingZero!6175) lt!269520) (not ((_ is MissingVacant!6175) lt!269520)) (and (bvsge (index!26948 lt!269520) #b00000000000000000000000000000000) (bvslt (index!26948 lt!269520) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269520) (ite ((_ is Found!6175) lt!269520) (= (select (arr!17738 a!2986) (index!26946 lt!269520)) k0!1786) (ite ((_ is MissingZero!6175) lt!269520) (= (select (arr!17738 a!2986) (index!26945 lt!269520)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6175) lt!269520) (= (select (arr!17738 a!2986) (index!26948 lt!269520)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!339319 () SeekEntryResult!6175)

(assert (=> d!86375 (= lt!269520 e!339319)))

(declare-fun c!67246 () Bool)

(declare-fun lt!269522 () SeekEntryResult!6175)

(assert (=> d!86375 (= c!67246 (and ((_ is Intermediate!6175) lt!269522) (undefined!6987 lt!269522)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36945 (_ BitVec 32)) SeekEntryResult!6175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86375 (= lt!269522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86375 (validMask!0 mask!3053)))

(assert (=> d!86375 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269520)))

(declare-fun b!593953 () Bool)

(declare-fun c!67247 () Bool)

(declare-fun lt!269521 () (_ BitVec 64))

(assert (=> b!593953 (= c!67247 (= lt!269521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339320 () SeekEntryResult!6175)

(declare-fun e!339318 () SeekEntryResult!6175)

(assert (=> b!593953 (= e!339320 e!339318)))

(declare-fun b!593954 () Bool)

(assert (=> b!593954 (= e!339318 (MissingZero!6175 (index!26947 lt!269522)))))

(declare-fun b!593955 () Bool)

(assert (=> b!593955 (= e!339320 (Found!6175 (index!26947 lt!269522)))))

(declare-fun b!593956 () Bool)

(assert (=> b!593956 (= e!339319 e!339320)))

(assert (=> b!593956 (= lt!269521 (select (arr!17738 a!2986) (index!26947 lt!269522)))))

(declare-fun c!67248 () Bool)

(assert (=> b!593956 (= c!67248 (= lt!269521 k0!1786))))

(declare-fun b!593957 () Bool)

(assert (=> b!593957 (= e!339318 (seekKeyOrZeroReturnVacant!0 (x!55757 lt!269522) (index!26947 lt!269522) (index!26947 lt!269522) k0!1786 a!2986 mask!3053))))

(declare-fun b!593958 () Bool)

(assert (=> b!593958 (= e!339319 Undefined!6175)))

(assert (= (and d!86375 c!67246) b!593958))

(assert (= (and d!86375 (not c!67246)) b!593956))

(assert (= (and b!593956 c!67248) b!593955))

(assert (= (and b!593956 (not c!67248)) b!593953))

(assert (= (and b!593953 c!67247) b!593954))

(assert (= (and b!593953 (not c!67247)) b!593957))

(declare-fun m!571287 () Bool)

(assert (=> d!86375 m!571287))

(declare-fun m!571289 () Bool)

(assert (=> d!86375 m!571289))

(assert (=> d!86375 m!571065))

(declare-fun m!571291 () Bool)

(assert (=> d!86375 m!571291))

(assert (=> d!86375 m!571291))

(declare-fun m!571293 () Bool)

(assert (=> d!86375 m!571293))

(declare-fun m!571295 () Bool)

(assert (=> d!86375 m!571295))

(declare-fun m!571297 () Bool)

(assert (=> b!593956 m!571297))

(declare-fun m!571299 () Bool)

(assert (=> b!593957 m!571299))

(assert (=> b!593689 d!86375))

(declare-fun d!86391 () Bool)

(assert (=> d!86391 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54396 d!86391))

(declare-fun d!86407 () Bool)

(assert (=> d!86407 (= (array_inv!13621 a!2986) (bvsge (size!18103 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54396 d!86407))

(declare-fun d!86413 () Bool)

(declare-fun res!380220 () Bool)

(declare-fun e!339367 () Bool)

(assert (=> d!86413 (=> res!380220 e!339367)))

(assert (=> d!86413 (= res!380220 (= (select (arr!17738 lt!269410) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17738 a!2986) j!136)))))

(assert (=> d!86413 (= (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339367)))

(declare-fun b!594026 () Bool)

(declare-fun e!339368 () Bool)

(assert (=> b!594026 (= e!339367 e!339368)))

(declare-fun res!380221 () Bool)

(assert (=> b!594026 (=> (not res!380221) (not e!339368))))

(assert (=> b!594026 (= res!380221 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18103 lt!269410)))))

(declare-fun b!594027 () Bool)

(assert (=> b!594027 (= e!339368 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86413 (not res!380220)) b!594026))

(assert (= (and b!594026 res!380221) b!594027))

(declare-fun m!571365 () Bool)

(assert (=> d!86413 m!571365))

(assert (=> b!594027 m!571057))

(declare-fun m!571367 () Bool)

(assert (=> b!594027 m!571367))

(assert (=> b!593700 d!86413))

(declare-fun d!86417 () Bool)

(assert (=> d!86417 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269545 () Unit!18612)

(declare-fun choose!114 (array!36945 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18612)

(assert (=> d!86417 (= lt!269545 (choose!114 lt!269410 (select (arr!17738 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86417 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86417 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269410 (select (arr!17738 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269545)))

(declare-fun bs!18290 () Bool)

(assert (= bs!18290 d!86417))

(assert (=> bs!18290 m!571057))

(assert (=> bs!18290 m!571059))

(assert (=> bs!18290 m!571057))

(declare-fun m!571371 () Bool)

(assert (=> bs!18290 m!571371))

(assert (=> b!593700 d!86417))

(declare-fun d!86421 () Bool)

(declare-fun lt!269546 () Bool)

(assert (=> d!86421 (= lt!269546 (select (content!231 Nil!11815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339372 () Bool)

(assert (=> d!86421 (= lt!269546 e!339372)))

(declare-fun res!380224 () Bool)

(assert (=> d!86421 (=> (not res!380224) (not e!339372))))

(assert (=> d!86421 (= res!380224 ((_ is Cons!11814) Nil!11815))))

(assert (=> d!86421 (= (contains!2902 Nil!11815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!269546)))

(declare-fun b!594030 () Bool)

(declare-fun e!339371 () Bool)

(assert (=> b!594030 (= e!339372 e!339371)))

(declare-fun res!380225 () Bool)

(assert (=> b!594030 (=> res!380225 e!339371)))

(assert (=> b!594030 (= res!380225 (= (h!12859 Nil!11815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594031 () Bool)

(assert (=> b!594031 (= e!339371 (contains!2902 (t!18037 Nil!11815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86421 res!380224) b!594030))

(assert (= (and b!594030 (not res!380225)) b!594031))

(assert (=> d!86421 m!571245))

(declare-fun m!571373 () Bool)

(assert (=> d!86421 m!571373))

(declare-fun m!571375 () Bool)

(assert (=> b!594031 m!571375))

(assert (=> b!593690 d!86421))

(declare-fun d!86423 () Bool)

(declare-fun res!380226 () Bool)

(declare-fun e!339373 () Bool)

(assert (=> d!86423 (=> res!380226 e!339373)))

(assert (=> d!86423 (= res!380226 (= (select (arr!17738 lt!269410) j!136) (select (arr!17738 a!2986) j!136)))))

(assert (=> d!86423 (= (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) j!136) e!339373)))

(declare-fun b!594032 () Bool)

(declare-fun e!339374 () Bool)

(assert (=> b!594032 (= e!339373 e!339374)))

(declare-fun res!380227 () Bool)

(assert (=> b!594032 (=> (not res!380227) (not e!339374))))

(assert (=> b!594032 (= res!380227 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18103 lt!269410)))))

(declare-fun b!594033 () Bool)

(assert (=> b!594033 (= e!339374 (arrayContainsKey!0 lt!269410 (select (arr!17738 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86423 (not res!380226)) b!594032))

(assert (= (and b!594032 res!380227) b!594033))

(declare-fun m!571377 () Bool)

(assert (=> d!86423 m!571377))

(assert (=> b!594033 m!571057))

(declare-fun m!571379 () Bool)

(assert (=> b!594033 m!571379))

(assert (=> b!593701 d!86423))

(declare-fun b!594034 () Bool)

(declare-fun e!339376 () SeekEntryResult!6175)

(assert (=> b!594034 (= e!339376 Undefined!6175)))

(declare-fun b!594035 () Bool)

(declare-fun e!339377 () SeekEntryResult!6175)

(assert (=> b!594035 (= e!339377 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!594036 () Bool)

(assert (=> b!594036 (= e!339377 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!269414 lt!269410 mask!3053))))

(declare-fun b!594037 () Bool)

(declare-fun e!339375 () SeekEntryResult!6175)

(assert (=> b!594037 (= e!339375 (Found!6175 index!984))))

(declare-fun d!86425 () Bool)

(declare-fun lt!269547 () SeekEntryResult!6175)

(assert (=> d!86425 (and (or ((_ is Undefined!6175) lt!269547) (not ((_ is Found!6175) lt!269547)) (and (bvsge (index!26946 lt!269547) #b00000000000000000000000000000000) (bvslt (index!26946 lt!269547) (size!18103 lt!269410)))) (or ((_ is Undefined!6175) lt!269547) ((_ is Found!6175) lt!269547) (not ((_ is MissingVacant!6175) lt!269547)) (not (= (index!26948 lt!269547) vacantSpotIndex!68)) (and (bvsge (index!26948 lt!269547) #b00000000000000000000000000000000) (bvslt (index!26948 lt!269547) (size!18103 lt!269410)))) (or ((_ is Undefined!6175) lt!269547) (ite ((_ is Found!6175) lt!269547) (= (select (arr!17738 lt!269410) (index!26946 lt!269547)) lt!269414) (and ((_ is MissingVacant!6175) lt!269547) (= (index!26948 lt!269547) vacantSpotIndex!68) (= (select (arr!17738 lt!269410) (index!26948 lt!269547)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86425 (= lt!269547 e!339376)))

(declare-fun c!67272 () Bool)

(assert (=> d!86425 (= c!67272 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269548 () (_ BitVec 64))

(assert (=> d!86425 (= lt!269548 (select (arr!17738 lt!269410) index!984))))

(assert (=> d!86425 (validMask!0 mask!3053)))

(assert (=> d!86425 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269414 lt!269410 mask!3053) lt!269547)))

(declare-fun b!594038 () Bool)

(assert (=> b!594038 (= e!339376 e!339375)))

(declare-fun c!67271 () Bool)

(assert (=> b!594038 (= c!67271 (= lt!269548 lt!269414))))

(declare-fun b!594039 () Bool)

(declare-fun c!67270 () Bool)

(assert (=> b!594039 (= c!67270 (= lt!269548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594039 (= e!339375 e!339377)))

(assert (= (and d!86425 c!67272) b!594034))

(assert (= (and d!86425 (not c!67272)) b!594038))

(assert (= (and b!594038 c!67271) b!594037))

(assert (= (and b!594038 (not c!67271)) b!594039))

(assert (= (and b!594039 c!67270) b!594035))

(assert (= (and b!594039 (not c!67270)) b!594036))

(assert (=> b!594036 m!571101))

(assert (=> b!594036 m!571101))

(declare-fun m!571381 () Bool)

(assert (=> b!594036 m!571381))

(declare-fun m!571383 () Bool)

(assert (=> d!86425 m!571383))

(declare-fun m!571385 () Bool)

(assert (=> d!86425 m!571385))

(assert (=> d!86425 m!571251))

(assert (=> d!86425 m!571065))

(assert (=> b!593680 d!86425))

(declare-fun b!594040 () Bool)

(declare-fun e!339379 () SeekEntryResult!6175)

(assert (=> b!594040 (= e!339379 Undefined!6175)))

(declare-fun b!594041 () Bool)

(declare-fun e!339380 () SeekEntryResult!6175)

(assert (=> b!594041 (= e!339380 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!594042 () Bool)

(assert (=> b!594042 (= e!339380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269416 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594043 () Bool)

(declare-fun e!339378 () SeekEntryResult!6175)

(assert (=> b!594043 (= e!339378 (Found!6175 lt!269416))))

(declare-fun d!86427 () Bool)

(declare-fun lt!269549 () SeekEntryResult!6175)

(assert (=> d!86427 (and (or ((_ is Undefined!6175) lt!269549) (not ((_ is Found!6175) lt!269549)) (and (bvsge (index!26946 lt!269549) #b00000000000000000000000000000000) (bvslt (index!26946 lt!269549) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269549) ((_ is Found!6175) lt!269549) (not ((_ is MissingVacant!6175) lt!269549)) (not (= (index!26948 lt!269549) vacantSpotIndex!68)) (and (bvsge (index!26948 lt!269549) #b00000000000000000000000000000000) (bvslt (index!26948 lt!269549) (size!18103 a!2986)))) (or ((_ is Undefined!6175) lt!269549) (ite ((_ is Found!6175) lt!269549) (= (select (arr!17738 a!2986) (index!26946 lt!269549)) (select (arr!17738 a!2986) j!136)) (and ((_ is MissingVacant!6175) lt!269549) (= (index!26948 lt!269549) vacantSpotIndex!68) (= (select (arr!17738 a!2986) (index!26948 lt!269549)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86427 (= lt!269549 e!339379)))

(declare-fun c!67275 () Bool)

(assert (=> d!86427 (= c!67275 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269550 () (_ BitVec 64))

(assert (=> d!86427 (= lt!269550 (select (arr!17738 a!2986) lt!269416))))

(assert (=> d!86427 (validMask!0 mask!3053)))

(assert (=> d!86427 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053) lt!269549)))

(declare-fun b!594044 () Bool)

(assert (=> b!594044 (= e!339379 e!339378)))

(declare-fun c!67274 () Bool)

(assert (=> b!594044 (= c!67274 (= lt!269550 (select (arr!17738 a!2986) j!136)))))

(declare-fun b!594045 () Bool)

(declare-fun c!67273 () Bool)

(assert (=> b!594045 (= c!67273 (= lt!269550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594045 (= e!339378 e!339380)))

(assert (= (and d!86427 c!67275) b!594040))

(assert (= (and d!86427 (not c!67275)) b!594044))

(assert (= (and b!594044 c!67274) b!594043))

(assert (= (and b!594044 (not c!67274)) b!594045))

(assert (= (and b!594045 c!67273) b!594041))

(assert (= (and b!594045 (not c!67273)) b!594042))

(declare-fun m!571387 () Bool)

(assert (=> b!594042 m!571387))

(assert (=> b!594042 m!571387))

(assert (=> b!594042 m!571057))

(declare-fun m!571389 () Bool)

(assert (=> b!594042 m!571389))

(declare-fun m!571391 () Bool)

(assert (=> d!86427 m!571391))

(declare-fun m!571393 () Bool)

(assert (=> d!86427 m!571393))

(declare-fun m!571395 () Bool)

(assert (=> d!86427 m!571395))

(assert (=> d!86427 m!571065))

(assert (=> b!593680 d!86427))

(declare-fun b!594052 () Bool)

(declare-fun e!339386 () SeekEntryResult!6175)

(assert (=> b!594052 (= e!339386 Undefined!6175)))

(declare-fun b!594053 () Bool)

(declare-fun e!339387 () SeekEntryResult!6175)

(assert (=> b!594053 (= e!339387 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!594054 () Bool)

(assert (=> b!594054 (= e!339387 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269416 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!269414 lt!269410 mask!3053))))

(declare-fun b!594055 () Bool)

(declare-fun e!339385 () SeekEntryResult!6175)

(assert (=> b!594055 (= e!339385 (Found!6175 lt!269416))))

(declare-fun lt!269557 () SeekEntryResult!6175)

(declare-fun d!86429 () Bool)

(assert (=> d!86429 (and (or ((_ is Undefined!6175) lt!269557) (not ((_ is Found!6175) lt!269557)) (and (bvsge (index!26946 lt!269557) #b00000000000000000000000000000000) (bvslt (index!26946 lt!269557) (size!18103 lt!269410)))) (or ((_ is Undefined!6175) lt!269557) ((_ is Found!6175) lt!269557) (not ((_ is MissingVacant!6175) lt!269557)) (not (= (index!26948 lt!269557) vacantSpotIndex!68)) (and (bvsge (index!26948 lt!269557) #b00000000000000000000000000000000) (bvslt (index!26948 lt!269557) (size!18103 lt!269410)))) (or ((_ is Undefined!6175) lt!269557) (ite ((_ is Found!6175) lt!269557) (= (select (arr!17738 lt!269410) (index!26946 lt!269557)) lt!269414) (and ((_ is MissingVacant!6175) lt!269557) (= (index!26948 lt!269557) vacantSpotIndex!68) (= (select (arr!17738 lt!269410) (index!26948 lt!269557)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86429 (= lt!269557 e!339386)))

(declare-fun c!67280 () Bool)

(assert (=> d!86429 (= c!67280 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269558 () (_ BitVec 64))

(assert (=> d!86429 (= lt!269558 (select (arr!17738 lt!269410) lt!269416))))

(assert (=> d!86429 (validMask!0 mask!3053)))

(assert (=> d!86429 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 lt!269414 lt!269410 mask!3053) lt!269557)))

(declare-fun b!594056 () Bool)

(assert (=> b!594056 (= e!339386 e!339385)))

(declare-fun c!67279 () Bool)

(assert (=> b!594056 (= c!67279 (= lt!269558 lt!269414))))

(declare-fun b!594057 () Bool)

(declare-fun c!67278 () Bool)

(assert (=> b!594057 (= c!67278 (= lt!269558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594057 (= e!339385 e!339387)))

(assert (= (and d!86429 c!67280) b!594052))

(assert (= (and d!86429 (not c!67280)) b!594056))

(assert (= (and b!594056 c!67279) b!594055))

(assert (= (and b!594056 (not c!67279)) b!594057))

(assert (= (and b!594057 c!67278) b!594053))

(assert (= (and b!594057 (not c!67278)) b!594054))

(assert (=> b!594054 m!571387))

(assert (=> b!594054 m!571387))

(declare-fun m!571397 () Bool)

(assert (=> b!594054 m!571397))

(declare-fun m!571399 () Bool)

(assert (=> d!86429 m!571399))

(declare-fun m!571401 () Bool)

(assert (=> d!86429 m!571401))

(declare-fun m!571403 () Bool)

(assert (=> d!86429 m!571403))

(assert (=> d!86429 m!571065))

(assert (=> b!593680 d!86429))

(declare-fun d!86431 () Bool)

(declare-fun lt!269564 () (_ BitVec 32))

(assert (=> d!86431 (and (bvsge lt!269564 #b00000000000000000000000000000000) (bvslt lt!269564 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86431 (= lt!269564 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86431 (validMask!0 mask!3053)))

(assert (=> d!86431 (= (nextIndex!0 index!984 x!910 mask!3053) lt!269564)))

(declare-fun bs!18291 () Bool)

(assert (= bs!18291 d!86431))

(declare-fun m!571413 () Bool)

(assert (=> bs!18291 m!571413))

(assert (=> bs!18291 m!571065))

(assert (=> b!593680 d!86431))

(declare-fun d!86435 () Bool)

(declare-fun e!339419 () Bool)

(assert (=> d!86435 e!339419))

(declare-fun res!380251 () Bool)

(assert (=> d!86435 (=> (not res!380251) (not e!339419))))

(assert (=> d!86435 (= res!380251 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18103 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18103 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18103 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18103 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18103 a!2986))))))

(declare-fun lt!269582 () Unit!18612)

(declare-fun choose!9 (array!36945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18612)

(assert (=> d!86435 (= lt!269582 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86435 (validMask!0 mask!3053)))

(assert (=> d!86435 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 mask!3053) lt!269582)))

(declare-fun b!594099 () Bool)

(assert (=> b!594099 (= e!339419 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269416 vacantSpotIndex!68 (select (store (arr!17738 a!2986) i!1108 k0!1786) j!136) (array!36946 (store (arr!17738 a!2986) i!1108 k0!1786) (size!18103 a!2986)) mask!3053)))))

(assert (= (and d!86435 res!380251) b!594099))

(declare-fun m!571449 () Bool)

(assert (=> d!86435 m!571449))

(assert (=> d!86435 m!571065))

(assert (=> b!594099 m!571091))

(declare-fun m!571451 () Bool)

(assert (=> b!594099 m!571451))

(assert (=> b!594099 m!571075))

(assert (=> b!594099 m!571091))

(assert (=> b!594099 m!571057))

(assert (=> b!594099 m!571057))

(assert (=> b!594099 m!571097))

(assert (=> b!593680 d!86435))

(check-sat (not b!593957) (not d!86357) (not bm!32865) (not b!593885) (not b!593877) (not b!594099) (not b!594027) (not b!594042) (not d!86425) (not b!593911) (not d!86431) (not d!86429) (not d!86427) (not b!594031) (not d!86421) (not b!593884) (not b!593866) (not b!594036) (not b!593844) (not b!593875) (not d!86375) (not b!594033) (not b!593910) (not b!593845) (not d!86417) (not d!86435) (not b!594054) (not d!86355) (not bm!32860) (not b!593851) (not b!593914))
(check-sat)
