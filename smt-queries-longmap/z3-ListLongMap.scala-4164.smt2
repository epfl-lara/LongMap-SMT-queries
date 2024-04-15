; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56658 () Bool)

(assert start!56658)

(declare-fun b!627969 () Bool)

(declare-fun e!359299 () Bool)

(declare-fun e!359301 () Bool)

(assert (=> b!627969 (= e!359299 e!359301)))

(declare-fun res!405816 () Bool)

(assert (=> b!627969 (=> (not res!405816) (not e!359301))))

(declare-datatypes ((SeekEntryResult!6658 0))(
  ( (MissingZero!6658 (index!28916 (_ BitVec 32))) (Found!6658 (index!28917 (_ BitVec 32))) (Intermediate!6658 (undefined!7470 Bool) (index!28918 (_ BitVec 32)) (x!57657 (_ BitVec 32))) (Undefined!6658) (MissingVacant!6658 (index!28919 (_ BitVec 32))) )
))
(declare-fun lt!290191 () SeekEntryResult!6658)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627969 (= res!405816 (or (= lt!290191 (MissingZero!6658 i!1108)) (= lt!290191 (MissingVacant!6658 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37962 0))(
  ( (array!37963 (arr!18221 (Array (_ BitVec 32) (_ BitVec 64))) (size!18586 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37962)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37962 (_ BitVec 32)) SeekEntryResult!6658)

(assert (=> b!627969 (= lt!290191 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627970 () Bool)

(declare-fun res!405819 () Bool)

(assert (=> b!627970 (=> (not res!405819) (not e!359299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627970 (= res!405819 (validKeyInArray!0 k0!1786))))

(declare-fun b!627971 () Bool)

(declare-fun res!405815 () Bool)

(assert (=> b!627971 (=> (not res!405815) (not e!359301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37962 (_ BitVec 32)) Bool)

(assert (=> b!627971 (= res!405815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!405812 () Bool)

(assert (=> start!56658 (=> (not res!405812) (not e!359299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56658 (= res!405812 (validMask!0 mask!3053))))

(assert (=> start!56658 e!359299))

(assert (=> start!56658 true))

(declare-fun array_inv!14104 (array!37962) Bool)

(assert (=> start!56658 (array_inv!14104 a!2986)))

(declare-fun b!627972 () Bool)

(declare-fun res!405811 () Bool)

(assert (=> b!627972 (=> (not res!405811) (not e!359301))))

(declare-datatypes ((List!12301 0))(
  ( (Nil!12298) (Cons!12297 (h!13342 (_ BitVec 64)) (t!18520 List!12301)) )
))
(declare-fun arrayNoDuplicates!0 (array!37962 (_ BitVec 32) List!12301) Bool)

(assert (=> b!627972 (= res!405811 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12298))))

(declare-fun b!627973 () Bool)

(declare-fun res!405813 () Bool)

(assert (=> b!627973 (=> (not res!405813) (not e!359301))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627973 (= res!405813 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18221 a!2986) index!984) (select (arr!18221 a!2986) j!136))) (not (= (select (arr!18221 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627974 () Bool)

(declare-fun res!405818 () Bool)

(assert (=> b!627974 (=> (not res!405818) (not e!359299))))

(assert (=> b!627974 (= res!405818 (validKeyInArray!0 (select (arr!18221 a!2986) j!136)))))

(declare-fun b!627975 () Bool)

(declare-fun lt!290190 () (_ BitVec 32))

(assert (=> b!627975 (= e!359301 (or (bvslt lt!290190 #b00000000000000000000000000000000) (bvsge lt!290190 (bvadd mask!3053 #b00000000000000000000000000000001))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627975 (= lt!290190 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627976 () Bool)

(declare-fun res!405817 () Bool)

(assert (=> b!627976 (=> (not res!405817) (not e!359299))))

(declare-fun arrayContainsKey!0 (array!37962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627976 (= res!405817 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627977 () Bool)

(declare-fun res!405814 () Bool)

(assert (=> b!627977 (=> (not res!405814) (not e!359301))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37962 (_ BitVec 32)) SeekEntryResult!6658)

(assert (=> b!627977 (= res!405814 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18221 a!2986) j!136) a!2986 mask!3053) (Found!6658 j!136)))))

(declare-fun b!627978 () Bool)

(declare-fun res!405820 () Bool)

(assert (=> b!627978 (=> (not res!405820) (not e!359299))))

(assert (=> b!627978 (= res!405820 (and (= (size!18586 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18586 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18586 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627979 () Bool)

(declare-fun res!405821 () Bool)

(assert (=> b!627979 (=> (not res!405821) (not e!359301))))

(assert (=> b!627979 (= res!405821 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18221 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18221 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56658 res!405812) b!627978))

(assert (= (and b!627978 res!405820) b!627974))

(assert (= (and b!627974 res!405818) b!627970))

(assert (= (and b!627970 res!405819) b!627976))

(assert (= (and b!627976 res!405817) b!627969))

(assert (= (and b!627969 res!405816) b!627971))

(assert (= (and b!627971 res!405815) b!627972))

(assert (= (and b!627972 res!405811) b!627979))

(assert (= (and b!627979 res!405821) b!627977))

(assert (= (and b!627977 res!405814) b!627973))

(assert (= (and b!627973 res!405813) b!627975))

(declare-fun m!602713 () Bool)

(assert (=> b!627970 m!602713))

(declare-fun m!602715 () Bool)

(assert (=> b!627977 m!602715))

(assert (=> b!627977 m!602715))

(declare-fun m!602717 () Bool)

(assert (=> b!627977 m!602717))

(declare-fun m!602719 () Bool)

(assert (=> b!627976 m!602719))

(declare-fun m!602721 () Bool)

(assert (=> b!627973 m!602721))

(assert (=> b!627973 m!602715))

(assert (=> b!627974 m!602715))

(assert (=> b!627974 m!602715))

(declare-fun m!602723 () Bool)

(assert (=> b!627974 m!602723))

(declare-fun m!602725 () Bool)

(assert (=> b!627971 m!602725))

(declare-fun m!602727 () Bool)

(assert (=> b!627979 m!602727))

(declare-fun m!602729 () Bool)

(assert (=> b!627979 m!602729))

(declare-fun m!602731 () Bool)

(assert (=> b!627979 m!602731))

(declare-fun m!602733 () Bool)

(assert (=> b!627975 m!602733))

(declare-fun m!602735 () Bool)

(assert (=> b!627972 m!602735))

(declare-fun m!602737 () Bool)

(assert (=> start!56658 m!602737))

(declare-fun m!602739 () Bool)

(assert (=> start!56658 m!602739))

(declare-fun m!602741 () Bool)

(assert (=> b!627969 m!602741))

(check-sat (not b!627971) (not b!627976) (not b!627969) (not b!627977) (not b!627975) (not b!627972) (not start!56658) (not b!627974) (not b!627970))
(check-sat)
(get-model)

(declare-fun d!88777 () Bool)

(assert (=> d!88777 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56658 d!88777))

(declare-fun d!88779 () Bool)

(assert (=> d!88779 (= (array_inv!14104 a!2986) (bvsge (size!18586 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56658 d!88779))

(declare-fun b!628064 () Bool)

(declare-fun e!359332 () SeekEntryResult!6658)

(assert (=> b!628064 (= e!359332 (Found!6658 index!984))))

(declare-fun d!88781 () Bool)

(declare-fun lt!290209 () SeekEntryResult!6658)

(get-info :version)

(assert (=> d!88781 (and (or ((_ is Undefined!6658) lt!290209) (not ((_ is Found!6658) lt!290209)) (and (bvsge (index!28917 lt!290209) #b00000000000000000000000000000000) (bvslt (index!28917 lt!290209) (size!18586 a!2986)))) (or ((_ is Undefined!6658) lt!290209) ((_ is Found!6658) lt!290209) (not ((_ is MissingVacant!6658) lt!290209)) (not (= (index!28919 lt!290209) vacantSpotIndex!68)) (and (bvsge (index!28919 lt!290209) #b00000000000000000000000000000000) (bvslt (index!28919 lt!290209) (size!18586 a!2986)))) (or ((_ is Undefined!6658) lt!290209) (ite ((_ is Found!6658) lt!290209) (= (select (arr!18221 a!2986) (index!28917 lt!290209)) (select (arr!18221 a!2986) j!136)) (and ((_ is MissingVacant!6658) lt!290209) (= (index!28919 lt!290209) vacantSpotIndex!68) (= (select (arr!18221 a!2986) (index!28919 lt!290209)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359334 () SeekEntryResult!6658)

(assert (=> d!88781 (= lt!290209 e!359334)))

(declare-fun c!71454 () Bool)

(assert (=> d!88781 (= c!71454 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290208 () (_ BitVec 64))

(assert (=> d!88781 (= lt!290208 (select (arr!18221 a!2986) index!984))))

(assert (=> d!88781 (validMask!0 mask!3053)))

(assert (=> d!88781 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18221 a!2986) j!136) a!2986 mask!3053) lt!290209)))

(declare-fun b!628065 () Bool)

(declare-fun e!359333 () SeekEntryResult!6658)

(assert (=> b!628065 (= e!359333 (MissingVacant!6658 vacantSpotIndex!68))))

(declare-fun b!628066 () Bool)

(assert (=> b!628066 (= e!359334 e!359332)))

(declare-fun c!71453 () Bool)

(assert (=> b!628066 (= c!71453 (= lt!290208 (select (arr!18221 a!2986) j!136)))))

(declare-fun b!628067 () Bool)

(assert (=> b!628067 (= e!359333 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18221 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628068 () Bool)

(assert (=> b!628068 (= e!359334 Undefined!6658)))

(declare-fun b!628069 () Bool)

(declare-fun c!71452 () Bool)

(assert (=> b!628069 (= c!71452 (= lt!290208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628069 (= e!359332 e!359333)))

(assert (= (and d!88781 c!71454) b!628068))

(assert (= (and d!88781 (not c!71454)) b!628066))

(assert (= (and b!628066 c!71453) b!628064))

(assert (= (and b!628066 (not c!71453)) b!628069))

(assert (= (and b!628069 c!71452) b!628065))

(assert (= (and b!628069 (not c!71452)) b!628067))

(declare-fun m!602807 () Bool)

(assert (=> d!88781 m!602807))

(declare-fun m!602809 () Bool)

(assert (=> d!88781 m!602809))

(assert (=> d!88781 m!602721))

(assert (=> d!88781 m!602737))

(assert (=> b!628067 m!602733))

(assert (=> b!628067 m!602733))

(assert (=> b!628067 m!602715))

(declare-fun m!602811 () Bool)

(assert (=> b!628067 m!602811))

(assert (=> b!627977 d!88781))

(declare-fun b!628080 () Bool)

(declare-fun e!359344 () Bool)

(declare-fun call!33232 () Bool)

(assert (=> b!628080 (= e!359344 call!33232)))

(declare-fun d!88787 () Bool)

(declare-fun res!405900 () Bool)

(declare-fun e!359343 () Bool)

(assert (=> d!88787 (=> res!405900 e!359343)))

(assert (=> d!88787 (= res!405900 (bvsge #b00000000000000000000000000000000 (size!18586 a!2986)))))

(assert (=> d!88787 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12298) e!359343)))

(declare-fun bm!33229 () Bool)

(declare-fun c!71457 () Bool)

(assert (=> bm!33229 (= call!33232 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71457 (Cons!12297 (select (arr!18221 a!2986) #b00000000000000000000000000000000) Nil!12298) Nil!12298)))))

(declare-fun b!628081 () Bool)

(declare-fun e!359346 () Bool)

(assert (=> b!628081 (= e!359346 e!359344)))

(assert (=> b!628081 (= c!71457 (validKeyInArray!0 (select (arr!18221 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628082 () Bool)

(assert (=> b!628082 (= e!359344 call!33232)))

(declare-fun b!628083 () Bool)

(assert (=> b!628083 (= e!359343 e!359346)))

(declare-fun res!405902 () Bool)

(assert (=> b!628083 (=> (not res!405902) (not e!359346))))

(declare-fun e!359345 () Bool)

(assert (=> b!628083 (= res!405902 (not e!359345))))

(declare-fun res!405901 () Bool)

(assert (=> b!628083 (=> (not res!405901) (not e!359345))))

(assert (=> b!628083 (= res!405901 (validKeyInArray!0 (select (arr!18221 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628084 () Bool)

(declare-fun contains!3066 (List!12301 (_ BitVec 64)) Bool)

(assert (=> b!628084 (= e!359345 (contains!3066 Nil!12298 (select (arr!18221 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88787 (not res!405900)) b!628083))

(assert (= (and b!628083 res!405901) b!628084))

(assert (= (and b!628083 res!405902) b!628081))

(assert (= (and b!628081 c!71457) b!628082))

(assert (= (and b!628081 (not c!71457)) b!628080))

(assert (= (or b!628082 b!628080) bm!33229))

(declare-fun m!602813 () Bool)

(assert (=> bm!33229 m!602813))

(declare-fun m!602815 () Bool)

(assert (=> bm!33229 m!602815))

(assert (=> b!628081 m!602813))

(assert (=> b!628081 m!602813))

(declare-fun m!602817 () Bool)

(assert (=> b!628081 m!602817))

(assert (=> b!628083 m!602813))

(assert (=> b!628083 m!602813))

(assert (=> b!628083 m!602817))

(assert (=> b!628084 m!602813))

(assert (=> b!628084 m!602813))

(declare-fun m!602819 () Bool)

(assert (=> b!628084 m!602819))

(assert (=> b!627972 d!88787))

(declare-fun bm!33232 () Bool)

(declare-fun call!33235 () Bool)

(assert (=> bm!33232 (= call!33235 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!628105 () Bool)

(declare-fun e!359361 () Bool)

(declare-fun e!359359 () Bool)

(assert (=> b!628105 (= e!359361 e!359359)))

(declare-fun c!71466 () Bool)

(assert (=> b!628105 (= c!71466 (validKeyInArray!0 (select (arr!18221 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628106 () Bool)

(assert (=> b!628106 (= e!359359 call!33235)))

(declare-fun d!88789 () Bool)

(declare-fun res!405908 () Bool)

(assert (=> d!88789 (=> res!405908 e!359361)))

(assert (=> d!88789 (= res!405908 (bvsge #b00000000000000000000000000000000 (size!18586 a!2986)))))

(assert (=> d!88789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359361)))

(declare-fun b!628107 () Bool)

(declare-fun e!359360 () Bool)

(assert (=> b!628107 (= e!359359 e!359360)))

(declare-fun lt!290224 () (_ BitVec 64))

(assert (=> b!628107 (= lt!290224 (select (arr!18221 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21078 0))(
  ( (Unit!21079) )
))
(declare-fun lt!290222 () Unit!21078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37962 (_ BitVec 64) (_ BitVec 32)) Unit!21078)

(assert (=> b!628107 (= lt!290222 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290224 #b00000000000000000000000000000000))))

(assert (=> b!628107 (arrayContainsKey!0 a!2986 lt!290224 #b00000000000000000000000000000000)))

(declare-fun lt!290223 () Unit!21078)

(assert (=> b!628107 (= lt!290223 lt!290222)))

(declare-fun res!405907 () Bool)

(assert (=> b!628107 (= res!405907 (= (seekEntryOrOpen!0 (select (arr!18221 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6658 #b00000000000000000000000000000000)))))

(assert (=> b!628107 (=> (not res!405907) (not e!359360))))

(declare-fun b!628108 () Bool)

(assert (=> b!628108 (= e!359360 call!33235)))

(assert (= (and d!88789 (not res!405908)) b!628105))

(assert (= (and b!628105 c!71466) b!628107))

(assert (= (and b!628105 (not c!71466)) b!628106))

(assert (= (and b!628107 res!405907) b!628108))

(assert (= (or b!628108 b!628106) bm!33232))

(declare-fun m!602821 () Bool)

(assert (=> bm!33232 m!602821))

(assert (=> b!628105 m!602813))

(assert (=> b!628105 m!602813))

(assert (=> b!628105 m!602817))

(assert (=> b!628107 m!602813))

(declare-fun m!602823 () Bool)

(assert (=> b!628107 m!602823))

(declare-fun m!602825 () Bool)

(assert (=> b!628107 m!602825))

(assert (=> b!628107 m!602813))

(declare-fun m!602827 () Bool)

(assert (=> b!628107 m!602827))

(assert (=> b!627971 d!88789))

(declare-fun d!88793 () Bool)

(declare-fun res!405913 () Bool)

(declare-fun e!359369 () Bool)

(assert (=> d!88793 (=> res!405913 e!359369)))

(assert (=> d!88793 (= res!405913 (= (select (arr!18221 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88793 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359369)))

(declare-fun b!628119 () Bool)

(declare-fun e!359370 () Bool)

(assert (=> b!628119 (= e!359369 e!359370)))

(declare-fun res!405914 () Bool)

(assert (=> b!628119 (=> (not res!405914) (not e!359370))))

(assert (=> b!628119 (= res!405914 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18586 a!2986)))))

(declare-fun b!628120 () Bool)

(assert (=> b!628120 (= e!359370 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88793 (not res!405913)) b!628119))

(assert (= (and b!628119 res!405914) b!628120))

(assert (=> d!88793 m!602813))

(declare-fun m!602843 () Bool)

(assert (=> b!628120 m!602843))

(assert (=> b!627976 d!88793))

(declare-fun d!88799 () Bool)

(declare-fun lt!290230 () (_ BitVec 32))

(assert (=> d!88799 (and (bvsge lt!290230 #b00000000000000000000000000000000) (bvslt lt!290230 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88799 (= lt!290230 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88799 (validMask!0 mask!3053)))

(assert (=> d!88799 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290230)))

(declare-fun bs!18925 () Bool)

(assert (= bs!18925 d!88799))

(declare-fun m!602845 () Bool)

(assert (=> bs!18925 m!602845))

(assert (=> bs!18925 m!602737))

(assert (=> b!627975 d!88799))

(declare-fun d!88801 () Bool)

(assert (=> d!88801 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!627970 d!88801))

(declare-fun b!628179 () Bool)

(declare-fun c!71491 () Bool)

(declare-fun lt!290254 () (_ BitVec 64))

(assert (=> b!628179 (= c!71491 (= lt!290254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359410 () SeekEntryResult!6658)

(declare-fun e!359409 () SeekEntryResult!6658)

(assert (=> b!628179 (= e!359410 e!359409)))

(declare-fun b!628180 () Bool)

(declare-fun lt!290252 () SeekEntryResult!6658)

(assert (=> b!628180 (= e!359409 (seekKeyOrZeroReturnVacant!0 (x!57657 lt!290252) (index!28918 lt!290252) (index!28918 lt!290252) k0!1786 a!2986 mask!3053))))

(declare-fun b!628181 () Bool)

(assert (=> b!628181 (= e!359410 (Found!6658 (index!28918 lt!290252)))))

(declare-fun d!88807 () Bool)

(declare-fun lt!290253 () SeekEntryResult!6658)

(assert (=> d!88807 (and (or ((_ is Undefined!6658) lt!290253) (not ((_ is Found!6658) lt!290253)) (and (bvsge (index!28917 lt!290253) #b00000000000000000000000000000000) (bvslt (index!28917 lt!290253) (size!18586 a!2986)))) (or ((_ is Undefined!6658) lt!290253) ((_ is Found!6658) lt!290253) (not ((_ is MissingZero!6658) lt!290253)) (and (bvsge (index!28916 lt!290253) #b00000000000000000000000000000000) (bvslt (index!28916 lt!290253) (size!18586 a!2986)))) (or ((_ is Undefined!6658) lt!290253) ((_ is Found!6658) lt!290253) ((_ is MissingZero!6658) lt!290253) (not ((_ is MissingVacant!6658) lt!290253)) (and (bvsge (index!28919 lt!290253) #b00000000000000000000000000000000) (bvslt (index!28919 lt!290253) (size!18586 a!2986)))) (or ((_ is Undefined!6658) lt!290253) (ite ((_ is Found!6658) lt!290253) (= (select (arr!18221 a!2986) (index!28917 lt!290253)) k0!1786) (ite ((_ is MissingZero!6658) lt!290253) (= (select (arr!18221 a!2986) (index!28916 lt!290253)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6658) lt!290253) (= (select (arr!18221 a!2986) (index!28919 lt!290253)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!359411 () SeekEntryResult!6658)

(assert (=> d!88807 (= lt!290253 e!359411)))

(declare-fun c!71490 () Bool)

(assert (=> d!88807 (= c!71490 (and ((_ is Intermediate!6658) lt!290252) (undefined!7470 lt!290252)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37962 (_ BitVec 32)) SeekEntryResult!6658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88807 (= lt!290252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88807 (validMask!0 mask!3053)))

(assert (=> d!88807 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290253)))

(declare-fun b!628182 () Bool)

(assert (=> b!628182 (= e!359411 e!359410)))

(assert (=> b!628182 (= lt!290254 (select (arr!18221 a!2986) (index!28918 lt!290252)))))

(declare-fun c!71492 () Bool)

(assert (=> b!628182 (= c!71492 (= lt!290254 k0!1786))))

(declare-fun b!628183 () Bool)

(assert (=> b!628183 (= e!359411 Undefined!6658)))

(declare-fun b!628184 () Bool)

(assert (=> b!628184 (= e!359409 (MissingZero!6658 (index!28918 lt!290252)))))

(assert (= (and d!88807 c!71490) b!628183))

(assert (= (and d!88807 (not c!71490)) b!628182))

(assert (= (and b!628182 c!71492) b!628181))

(assert (= (and b!628182 (not c!71492)) b!628179))

(assert (= (and b!628179 c!71491) b!628184))

(assert (= (and b!628179 (not c!71491)) b!628180))

(declare-fun m!602867 () Bool)

(assert (=> b!628180 m!602867))

(declare-fun m!602869 () Bool)

(assert (=> d!88807 m!602869))

(assert (=> d!88807 m!602737))

(declare-fun m!602871 () Bool)

(assert (=> d!88807 m!602871))

(assert (=> d!88807 m!602869))

(declare-fun m!602873 () Bool)

(assert (=> d!88807 m!602873))

(declare-fun m!602875 () Bool)

(assert (=> d!88807 m!602875))

(declare-fun m!602877 () Bool)

(assert (=> d!88807 m!602877))

(declare-fun m!602879 () Bool)

(assert (=> b!628182 m!602879))

(assert (=> b!627969 d!88807))

(declare-fun d!88815 () Bool)

(assert (=> d!88815 (= (validKeyInArray!0 (select (arr!18221 a!2986) j!136)) (and (not (= (select (arr!18221 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18221 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!627974 d!88815))

(check-sat (not bm!33232) (not b!628107) (not b!628180) (not b!628083) (not d!88781) (not b!628067) (not b!628120) (not b!628105) (not b!628084) (not d!88807) (not d!88799) (not bm!33229) (not b!628081))
(check-sat)
