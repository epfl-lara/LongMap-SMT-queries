; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56512 () Bool)

(assert start!56512)

(declare-fun b!626279 () Bool)

(declare-fun e!358835 () Bool)

(declare-fun e!358834 () Bool)

(assert (=> b!626279 (= e!358835 e!358834)))

(declare-fun res!404125 () Bool)

(assert (=> b!626279 (=> (not res!404125) (not e!358834))))

(declare-datatypes ((SeekEntryResult!6606 0))(
  ( (MissingZero!6606 (index!28708 (_ BitVec 32))) (Found!6606 (index!28709 (_ BitVec 32))) (Intermediate!6606 (undefined!7418 Bool) (index!28710 (_ BitVec 32)) (x!57455 (_ BitVec 32))) (Undefined!6606) (MissingVacant!6606 (index!28711 (_ BitVec 32))) )
))
(declare-fun lt!290020 () SeekEntryResult!6606)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626279 (= res!404125 (or (= lt!290020 (MissingZero!6606 i!1108)) (= lt!290020 (MissingVacant!6606 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37849 0))(
  ( (array!37850 (arr!18166 (Array (_ BitVec 32) (_ BitVec 64))) (size!18530 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37849)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37849 (_ BitVec 32)) SeekEntryResult!6606)

(assert (=> b!626279 (= lt!290020 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626280 () Bool)

(declare-fun res!404124 () Bool)

(assert (=> b!626280 (=> (not res!404124) (not e!358834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37849 (_ BitVec 32)) Bool)

(assert (=> b!626280 (= res!404124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626281 () Bool)

(declare-fun res!404132 () Bool)

(assert (=> b!626281 (=> (not res!404132) (not e!358834))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626281 (= res!404132 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18166 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18166 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!404127 () Bool)

(assert (=> start!56512 (=> (not res!404127) (not e!358835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56512 (= res!404127 (validMask!0 mask!3053))))

(assert (=> start!56512 e!358835))

(assert (=> start!56512 true))

(declare-fun array_inv!13962 (array!37849) Bool)

(assert (=> start!56512 (array_inv!13962 a!2986)))

(declare-fun b!626282 () Bool)

(declare-fun res!404126 () Bool)

(assert (=> b!626282 (=> (not res!404126) (not e!358835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626282 (= res!404126 (validKeyInArray!0 k0!1786))))

(declare-fun b!626283 () Bool)

(declare-fun res!404129 () Bool)

(assert (=> b!626283 (=> (not res!404129) (not e!358835))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626283 (= res!404129 (validKeyInArray!0 (select (arr!18166 a!2986) j!136)))))

(declare-fun b!626284 () Bool)

(assert (=> b!626284 (= e!358834 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18166 a!2986) index!984) (select (arr!18166 a!2986) j!136))) (= (select (arr!18166 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626285 () Bool)

(declare-fun res!404131 () Bool)

(assert (=> b!626285 (=> (not res!404131) (not e!358834))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37849 (_ BitVec 32)) SeekEntryResult!6606)

(assert (=> b!626285 (= res!404131 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18166 a!2986) j!136) a!2986 mask!3053) (Found!6606 j!136)))))

(declare-fun b!626286 () Bool)

(declare-fun res!404128 () Bool)

(assert (=> b!626286 (=> (not res!404128) (not e!358834))))

(declare-datatypes ((List!12207 0))(
  ( (Nil!12204) (Cons!12203 (h!13248 (_ BitVec 64)) (t!18435 List!12207)) )
))
(declare-fun arrayNoDuplicates!0 (array!37849 (_ BitVec 32) List!12207) Bool)

(assert (=> b!626286 (= res!404128 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12204))))

(declare-fun b!626287 () Bool)

(declare-fun res!404123 () Bool)

(assert (=> b!626287 (=> (not res!404123) (not e!358835))))

(assert (=> b!626287 (= res!404123 (and (= (size!18530 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18530 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18530 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626288 () Bool)

(declare-fun res!404130 () Bool)

(assert (=> b!626288 (=> (not res!404130) (not e!358835))))

(declare-fun arrayContainsKey!0 (array!37849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626288 (= res!404130 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56512 res!404127) b!626287))

(assert (= (and b!626287 res!404123) b!626283))

(assert (= (and b!626283 res!404129) b!626282))

(assert (= (and b!626282 res!404126) b!626288))

(assert (= (and b!626288 res!404130) b!626279))

(assert (= (and b!626279 res!404125) b!626280))

(assert (= (and b!626280 res!404124) b!626286))

(assert (= (and b!626286 res!404128) b!626281))

(assert (= (and b!626281 res!404132) b!626285))

(assert (= (and b!626285 res!404131) b!626284))

(declare-fun m!601741 () Bool)

(assert (=> b!626280 m!601741))

(declare-fun m!601743 () Bool)

(assert (=> start!56512 m!601743))

(declare-fun m!601745 () Bool)

(assert (=> start!56512 m!601745))

(declare-fun m!601747 () Bool)

(assert (=> b!626283 m!601747))

(assert (=> b!626283 m!601747))

(declare-fun m!601749 () Bool)

(assert (=> b!626283 m!601749))

(declare-fun m!601751 () Bool)

(assert (=> b!626282 m!601751))

(declare-fun m!601753 () Bool)

(assert (=> b!626279 m!601753))

(declare-fun m!601755 () Bool)

(assert (=> b!626281 m!601755))

(declare-fun m!601757 () Bool)

(assert (=> b!626281 m!601757))

(declare-fun m!601759 () Bool)

(assert (=> b!626281 m!601759))

(declare-fun m!601761 () Bool)

(assert (=> b!626286 m!601761))

(declare-fun m!601763 () Bool)

(assert (=> b!626288 m!601763))

(assert (=> b!626285 m!601747))

(assert (=> b!626285 m!601747))

(declare-fun m!601765 () Bool)

(assert (=> b!626285 m!601765))

(declare-fun m!601767 () Bool)

(assert (=> b!626284 m!601767))

(assert (=> b!626284 m!601747))

(check-sat (not b!626288) (not b!626286) (not start!56512) (not b!626285) (not b!626280) (not b!626282) (not b!626283) (not b!626279))
(check-sat)
(get-model)

(declare-fun d!88895 () Bool)

(assert (=> d!88895 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626282 d!88895))

(declare-fun b!626329 () Bool)

(declare-fun e!358854 () Bool)

(declare-fun contains!3078 (List!12207 (_ BitVec 64)) Bool)

(assert (=> b!626329 (= e!358854 (contains!3078 Nil!12204 (select (arr!18166 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626330 () Bool)

(declare-fun e!358855 () Bool)

(declare-fun e!358856 () Bool)

(assert (=> b!626330 (= e!358855 e!358856)))

(declare-fun res!404169 () Bool)

(assert (=> b!626330 (=> (not res!404169) (not e!358856))))

(assert (=> b!626330 (= res!404169 (not e!358854))))

(declare-fun res!404171 () Bool)

(assert (=> b!626330 (=> (not res!404171) (not e!358854))))

(assert (=> b!626330 (= res!404171 (validKeyInArray!0 (select (arr!18166 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626331 () Bool)

(declare-fun e!358857 () Bool)

(declare-fun call!33239 () Bool)

(assert (=> b!626331 (= e!358857 call!33239)))

(declare-fun bm!33236 () Bool)

(declare-fun c!71447 () Bool)

(assert (=> bm!33236 (= call!33239 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71447 (Cons!12203 (select (arr!18166 a!2986) #b00000000000000000000000000000000) Nil!12204) Nil!12204)))))

(declare-fun d!88897 () Bool)

(declare-fun res!404170 () Bool)

(assert (=> d!88897 (=> res!404170 e!358855)))

(assert (=> d!88897 (= res!404170 (bvsge #b00000000000000000000000000000000 (size!18530 a!2986)))))

(assert (=> d!88897 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12204) e!358855)))

(declare-fun b!626332 () Bool)

(assert (=> b!626332 (= e!358856 e!358857)))

(assert (=> b!626332 (= c!71447 (validKeyInArray!0 (select (arr!18166 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626333 () Bool)

(assert (=> b!626333 (= e!358857 call!33239)))

(assert (= (and d!88897 (not res!404170)) b!626330))

(assert (= (and b!626330 res!404171) b!626329))

(assert (= (and b!626330 res!404169) b!626332))

(assert (= (and b!626332 c!71447) b!626331))

(assert (= (and b!626332 (not c!71447)) b!626333))

(assert (= (or b!626331 b!626333) bm!33236))

(declare-fun m!601797 () Bool)

(assert (=> b!626329 m!601797))

(assert (=> b!626329 m!601797))

(declare-fun m!601799 () Bool)

(assert (=> b!626329 m!601799))

(assert (=> b!626330 m!601797))

(assert (=> b!626330 m!601797))

(declare-fun m!601801 () Bool)

(assert (=> b!626330 m!601801))

(assert (=> bm!33236 m!601797))

(declare-fun m!601803 () Bool)

(assert (=> bm!33236 m!601803))

(assert (=> b!626332 m!601797))

(assert (=> b!626332 m!601797))

(assert (=> b!626332 m!601801))

(assert (=> b!626286 d!88897))

(declare-fun d!88899 () Bool)

(declare-fun lt!290032 () SeekEntryResult!6606)

(get-info :version)

(assert (=> d!88899 (and (or ((_ is Undefined!6606) lt!290032) (not ((_ is Found!6606) lt!290032)) (and (bvsge (index!28709 lt!290032) #b00000000000000000000000000000000) (bvslt (index!28709 lt!290032) (size!18530 a!2986)))) (or ((_ is Undefined!6606) lt!290032) ((_ is Found!6606) lt!290032) (not ((_ is MissingVacant!6606) lt!290032)) (not (= (index!28711 lt!290032) vacantSpotIndex!68)) (and (bvsge (index!28711 lt!290032) #b00000000000000000000000000000000) (bvslt (index!28711 lt!290032) (size!18530 a!2986)))) (or ((_ is Undefined!6606) lt!290032) (ite ((_ is Found!6606) lt!290032) (= (select (arr!18166 a!2986) (index!28709 lt!290032)) (select (arr!18166 a!2986) j!136)) (and ((_ is MissingVacant!6606) lt!290032) (= (index!28711 lt!290032) vacantSpotIndex!68) (= (select (arr!18166 a!2986) (index!28711 lt!290032)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!358873 () SeekEntryResult!6606)

(assert (=> d!88899 (= lt!290032 e!358873)))

(declare-fun c!71460 () Bool)

(assert (=> d!88899 (= c!71460 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290033 () (_ BitVec 64))

(assert (=> d!88899 (= lt!290033 (select (arr!18166 a!2986) index!984))))

(assert (=> d!88899 (validMask!0 mask!3053)))

(assert (=> d!88899 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18166 a!2986) j!136) a!2986 mask!3053) lt!290032)))

(declare-fun b!626360 () Bool)

(declare-fun e!358872 () SeekEntryResult!6606)

(assert (=> b!626360 (= e!358872 (MissingVacant!6606 vacantSpotIndex!68))))

(declare-fun b!626361 () Bool)

(declare-fun e!358874 () SeekEntryResult!6606)

(assert (=> b!626361 (= e!358874 (Found!6606 index!984))))

(declare-fun b!626362 () Bool)

(declare-fun c!71462 () Bool)

(assert (=> b!626362 (= c!71462 (= lt!290033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!626362 (= e!358874 e!358872)))

(declare-fun b!626363 () Bool)

(assert (=> b!626363 (= e!358873 e!358874)))

(declare-fun c!71461 () Bool)

(assert (=> b!626363 (= c!71461 (= lt!290033 (select (arr!18166 a!2986) j!136)))))

(declare-fun b!626364 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626364 (= e!358872 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18166 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626365 () Bool)

(assert (=> b!626365 (= e!358873 Undefined!6606)))

(assert (= (and d!88899 c!71460) b!626365))

(assert (= (and d!88899 (not c!71460)) b!626363))

(assert (= (and b!626363 c!71461) b!626361))

(assert (= (and b!626363 (not c!71461)) b!626362))

(assert (= (and b!626362 c!71462) b!626360))

(assert (= (and b!626362 (not c!71462)) b!626364))

(declare-fun m!601805 () Bool)

(assert (=> d!88899 m!601805))

(declare-fun m!601807 () Bool)

(assert (=> d!88899 m!601807))

(assert (=> d!88899 m!601767))

(assert (=> d!88899 m!601743))

(declare-fun m!601809 () Bool)

(assert (=> b!626364 m!601809))

(assert (=> b!626364 m!601809))

(assert (=> b!626364 m!601747))

(declare-fun m!601811 () Bool)

(assert (=> b!626364 m!601811))

(assert (=> b!626285 d!88899))

(declare-fun bm!33242 () Bool)

(declare-fun call!33245 () Bool)

(assert (=> bm!33242 (= call!33245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!626396 () Bool)

(declare-fun e!358899 () Bool)

(assert (=> b!626396 (= e!358899 call!33245)))

(declare-fun d!88905 () Bool)

(declare-fun res!404188 () Bool)

(declare-fun e!358897 () Bool)

(assert (=> d!88905 (=> res!404188 e!358897)))

(assert (=> d!88905 (= res!404188 (bvsge #b00000000000000000000000000000000 (size!18530 a!2986)))))

(assert (=> d!88905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358897)))

(declare-fun b!626397 () Bool)

(declare-fun e!358898 () Bool)

(assert (=> b!626397 (= e!358899 e!358898)))

(declare-fun lt!290053 () (_ BitVec 64))

(assert (=> b!626397 (= lt!290053 (select (arr!18166 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21094 0))(
  ( (Unit!21095) )
))
(declare-fun lt!290051 () Unit!21094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37849 (_ BitVec 64) (_ BitVec 32)) Unit!21094)

(assert (=> b!626397 (= lt!290051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290053 #b00000000000000000000000000000000))))

(assert (=> b!626397 (arrayContainsKey!0 a!2986 lt!290053 #b00000000000000000000000000000000)))

(declare-fun lt!290052 () Unit!21094)

(assert (=> b!626397 (= lt!290052 lt!290051)))

(declare-fun res!404189 () Bool)

(assert (=> b!626397 (= res!404189 (= (seekEntryOrOpen!0 (select (arr!18166 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6606 #b00000000000000000000000000000000)))))

(assert (=> b!626397 (=> (not res!404189) (not e!358898))))

(declare-fun b!626398 () Bool)

(assert (=> b!626398 (= e!358898 call!33245)))

(declare-fun b!626399 () Bool)

(assert (=> b!626399 (= e!358897 e!358899)))

(declare-fun c!71471 () Bool)

(assert (=> b!626399 (= c!71471 (validKeyInArray!0 (select (arr!18166 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88905 (not res!404188)) b!626399))

(assert (= (and b!626399 c!71471) b!626397))

(assert (= (and b!626399 (not c!71471)) b!626396))

(assert (= (and b!626397 res!404189) b!626398))

(assert (= (or b!626398 b!626396) bm!33242))

(declare-fun m!601835 () Bool)

(assert (=> bm!33242 m!601835))

(assert (=> b!626397 m!601797))

(declare-fun m!601837 () Bool)

(assert (=> b!626397 m!601837))

(declare-fun m!601839 () Bool)

(assert (=> b!626397 m!601839))

(assert (=> b!626397 m!601797))

(declare-fun m!601841 () Bool)

(assert (=> b!626397 m!601841))

(assert (=> b!626399 m!601797))

(assert (=> b!626399 m!601797))

(assert (=> b!626399 m!601801))

(assert (=> b!626280 d!88905))

(declare-fun d!88917 () Bool)

(assert (=> d!88917 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56512 d!88917))

(declare-fun d!88925 () Bool)

(assert (=> d!88925 (= (array_inv!13962 a!2986) (bvsge (size!18530 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56512 d!88925))

(declare-fun b!626469 () Bool)

(declare-fun c!71501 () Bool)

(declare-fun lt!290076 () (_ BitVec 64))

(assert (=> b!626469 (= c!71501 (= lt!290076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358942 () SeekEntryResult!6606)

(declare-fun e!358943 () SeekEntryResult!6606)

(assert (=> b!626469 (= e!358942 e!358943)))

(declare-fun b!626470 () Bool)

(declare-fun lt!290077 () SeekEntryResult!6606)

(assert (=> b!626470 (= e!358943 (seekKeyOrZeroReturnVacant!0 (x!57455 lt!290077) (index!28710 lt!290077) (index!28710 lt!290077) k0!1786 a!2986 mask!3053))))

(declare-fun b!626471 () Bool)

(assert (=> b!626471 (= e!358942 (Found!6606 (index!28710 lt!290077)))))

(declare-fun b!626472 () Bool)

(assert (=> b!626472 (= e!358943 (MissingZero!6606 (index!28710 lt!290077)))))

(declare-fun b!626473 () Bool)

(declare-fun e!358944 () SeekEntryResult!6606)

(assert (=> b!626473 (= e!358944 e!358942)))

(assert (=> b!626473 (= lt!290076 (select (arr!18166 a!2986) (index!28710 lt!290077)))))

(declare-fun c!71500 () Bool)

(assert (=> b!626473 (= c!71500 (= lt!290076 k0!1786))))

(declare-fun b!626474 () Bool)

(assert (=> b!626474 (= e!358944 Undefined!6606)))

(declare-fun d!88927 () Bool)

(declare-fun lt!290075 () SeekEntryResult!6606)

(assert (=> d!88927 (and (or ((_ is Undefined!6606) lt!290075) (not ((_ is Found!6606) lt!290075)) (and (bvsge (index!28709 lt!290075) #b00000000000000000000000000000000) (bvslt (index!28709 lt!290075) (size!18530 a!2986)))) (or ((_ is Undefined!6606) lt!290075) ((_ is Found!6606) lt!290075) (not ((_ is MissingZero!6606) lt!290075)) (and (bvsge (index!28708 lt!290075) #b00000000000000000000000000000000) (bvslt (index!28708 lt!290075) (size!18530 a!2986)))) (or ((_ is Undefined!6606) lt!290075) ((_ is Found!6606) lt!290075) ((_ is MissingZero!6606) lt!290075) (not ((_ is MissingVacant!6606) lt!290075)) (and (bvsge (index!28711 lt!290075) #b00000000000000000000000000000000) (bvslt (index!28711 lt!290075) (size!18530 a!2986)))) (or ((_ is Undefined!6606) lt!290075) (ite ((_ is Found!6606) lt!290075) (= (select (arr!18166 a!2986) (index!28709 lt!290075)) k0!1786) (ite ((_ is MissingZero!6606) lt!290075) (= (select (arr!18166 a!2986) (index!28708 lt!290075)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6606) lt!290075) (= (select (arr!18166 a!2986) (index!28711 lt!290075)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88927 (= lt!290075 e!358944)))

(declare-fun c!71499 () Bool)

(assert (=> d!88927 (= c!71499 (and ((_ is Intermediate!6606) lt!290077) (undefined!7418 lt!290077)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37849 (_ BitVec 32)) SeekEntryResult!6606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88927 (= lt!290077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88927 (validMask!0 mask!3053)))

(assert (=> d!88927 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290075)))

(assert (= (and d!88927 c!71499) b!626474))

(assert (= (and d!88927 (not c!71499)) b!626473))

(assert (= (and b!626473 c!71500) b!626471))

(assert (= (and b!626473 (not c!71500)) b!626469))

(assert (= (and b!626469 c!71501) b!626472))

(assert (= (and b!626469 (not c!71501)) b!626470))

(declare-fun m!601873 () Bool)

(assert (=> b!626470 m!601873))

(declare-fun m!601875 () Bool)

(assert (=> b!626473 m!601875))

(declare-fun m!601877 () Bool)

(assert (=> d!88927 m!601877))

(declare-fun m!601879 () Bool)

(assert (=> d!88927 m!601879))

(declare-fun m!601881 () Bool)

(assert (=> d!88927 m!601881))

(declare-fun m!601883 () Bool)

(assert (=> d!88927 m!601883))

(assert (=> d!88927 m!601743))

(assert (=> d!88927 m!601877))

(declare-fun m!601885 () Bool)

(assert (=> d!88927 m!601885))

(assert (=> b!626279 d!88927))

(declare-fun d!88937 () Bool)

(assert (=> d!88937 (= (validKeyInArray!0 (select (arr!18166 a!2986) j!136)) (and (not (= (select (arr!18166 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18166 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626283 d!88937))

(declare-fun d!88939 () Bool)

(declare-fun res!404209 () Bool)

(declare-fun e!358949 () Bool)

(assert (=> d!88939 (=> res!404209 e!358949)))

(assert (=> d!88939 (= res!404209 (= (select (arr!18166 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88939 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358949)))

(declare-fun b!626479 () Bool)

(declare-fun e!358950 () Bool)

(assert (=> b!626479 (= e!358949 e!358950)))

(declare-fun res!404210 () Bool)

(assert (=> b!626479 (=> (not res!404210) (not e!358950))))

(assert (=> b!626479 (= res!404210 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18530 a!2986)))))

(declare-fun b!626480 () Bool)

(assert (=> b!626480 (= e!358950 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88939 (not res!404209)) b!626479))

(assert (= (and b!626479 res!404210) b!626480))

(assert (=> d!88939 m!601797))

(declare-fun m!601887 () Bool)

(assert (=> b!626480 m!601887))

(assert (=> b!626288 d!88939))

(check-sat (not b!626480) (not b!626332) (not b!626470) (not d!88927) (not b!626364) (not b!626330) (not bm!33242) (not b!626397) (not d!88899) (not b!626329) (not bm!33236) (not b!626399))
(check-sat)
