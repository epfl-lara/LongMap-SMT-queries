; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57174 () Bool)

(assert start!57174)

(declare-fun b!632732 () Bool)

(declare-fun e!361737 () Bool)

(declare-fun e!361739 () Bool)

(assert (=> b!632732 (= e!361737 e!361739)))

(declare-fun res!409238 () Bool)

(assert (=> b!632732 (=> (not res!409238) (not e!361739))))

(declare-datatypes ((SeekEntryResult!6742 0))(
  ( (MissingZero!6742 (index!29264 (_ BitVec 32))) (Found!6742 (index!29265 (_ BitVec 32))) (Intermediate!6742 (undefined!7554 Bool) (index!29266 (_ BitVec 32)) (x!58013 (_ BitVec 32))) (Undefined!6742) (MissingVacant!6742 (index!29267 (_ BitVec 32))) )
))
(declare-fun lt!292337 () SeekEntryResult!6742)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632732 (= res!409238 (or (= lt!292337 (MissingZero!6742 i!1108)) (= lt!292337 (MissingVacant!6742 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38148 0))(
  ( (array!38149 (arr!18305 (Array (_ BitVec 32) (_ BitVec 64))) (size!18670 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38148)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38148 (_ BitVec 32)) SeekEntryResult!6742)

(assert (=> b!632732 (= lt!292337 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!409242 () Bool)

(assert (=> start!57174 (=> (not res!409242) (not e!361737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57174 (= res!409242 (validMask!0 mask!3053))))

(assert (=> start!57174 e!361737))

(assert (=> start!57174 true))

(declare-fun array_inv!14188 (array!38148) Bool)

(assert (=> start!57174 (array_inv!14188 a!2986)))

(declare-fun b!632733 () Bool)

(declare-fun e!361738 () Bool)

(declare-fun e!361734 () Bool)

(assert (=> b!632733 (= e!361738 e!361734)))

(declare-fun res!409246 () Bool)

(assert (=> b!632733 (=> (not res!409246) (not e!361734))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292338 () SeekEntryResult!6742)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632733 (= res!409246 (and (= lt!292338 (Found!6742 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18305 a!2986) index!984) (select (arr!18305 a!2986) j!136))) (not (= (select (arr!18305 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38148 (_ BitVec 32)) SeekEntryResult!6742)

(assert (=> b!632733 (= lt!292338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632734 () Bool)

(declare-fun res!409252 () Bool)

(assert (=> b!632734 (=> (not res!409252) (not e!361739))))

(declare-datatypes ((List!12385 0))(
  ( (Nil!12382) (Cons!12381 (h!13426 (_ BitVec 64)) (t!18604 List!12385)) )
))
(declare-fun arrayNoDuplicates!0 (array!38148 (_ BitVec 32) List!12385) Bool)

(assert (=> b!632734 (= res!409252 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12382))))

(declare-fun b!632735 () Bool)

(declare-fun res!409250 () Bool)

(assert (=> b!632735 (=> (not res!409250) (not e!361737))))

(declare-fun arrayContainsKey!0 (array!38148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632735 (= res!409250 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632736 () Bool)

(declare-datatypes ((Unit!21296 0))(
  ( (Unit!21297) )
))
(declare-fun e!361736 () Unit!21296)

(declare-fun Unit!21298 () Unit!21296)

(assert (=> b!632736 (= e!361736 Unit!21298)))

(assert (=> b!632736 false))

(declare-fun b!632737 () Bool)

(declare-fun e!361743 () Bool)

(declare-fun e!361741 () Bool)

(assert (=> b!632737 (= e!361743 e!361741)))

(declare-fun res!409245 () Bool)

(assert (=> b!632737 (=> res!409245 e!361741)))

(declare-fun lt!292333 () (_ BitVec 64))

(declare-fun lt!292331 () (_ BitVec 64))

(assert (=> b!632737 (= res!409245 (or (not (= (select (arr!18305 a!2986) j!136) lt!292333)) (not (= (select (arr!18305 a!2986) j!136) lt!292331)) (bvsge j!136 index!984)))))

(declare-fun b!632738 () Bool)

(declare-fun e!361733 () Bool)

(declare-fun e!361735 () Bool)

(assert (=> b!632738 (= e!361733 e!361735)))

(declare-fun res!409248 () Bool)

(assert (=> b!632738 (=> res!409248 e!361735)))

(assert (=> b!632738 (= res!409248 (or (not (= (select (arr!18305 a!2986) j!136) lt!292333)) (not (= (select (arr!18305 a!2986) j!136) lt!292331)) (bvsge j!136 index!984)))))

(assert (=> b!632738 e!361743))

(declare-fun res!409240 () Bool)

(assert (=> b!632738 (=> (not res!409240) (not e!361743))))

(assert (=> b!632738 (= res!409240 (= lt!292331 (select (arr!18305 a!2986) j!136)))))

(assert (=> b!632738 (= lt!292331 (select (store (arr!18305 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!632739 () Bool)

(declare-fun res!409244 () Bool)

(assert (=> b!632739 (=> (not res!409244) (not e!361739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38148 (_ BitVec 32)) Bool)

(assert (=> b!632739 (= res!409244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632740 () Bool)

(declare-fun lt!292339 () array!38148)

(assert (=> b!632740 (= e!361735 (arrayContainsKey!0 lt!292339 (select (arr!18305 a!2986) j!136) index!984))))

(declare-fun b!632741 () Bool)

(declare-fun res!409249 () Bool)

(assert (=> b!632741 (=> (not res!409249) (not e!361739))))

(assert (=> b!632741 (= res!409249 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18305 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632742 () Bool)

(assert (=> b!632742 (= e!361741 (arrayContainsKey!0 lt!292339 (select (arr!18305 a!2986) j!136) j!136))))

(declare-fun b!632743 () Bool)

(declare-fun e!361740 () Bool)

(declare-fun lt!292330 () SeekEntryResult!6742)

(assert (=> b!632743 (= e!361740 (= lt!292338 lt!292330))))

(declare-fun b!632744 () Bool)

(declare-fun res!409241 () Bool)

(assert (=> b!632744 (=> (not res!409241) (not e!361737))))

(assert (=> b!632744 (= res!409241 (and (= (size!18670 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18670 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18670 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632745 () Bool)

(declare-fun res!409243 () Bool)

(assert (=> b!632745 (=> (not res!409243) (not e!361737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632745 (= res!409243 (validKeyInArray!0 (select (arr!18305 a!2986) j!136)))))

(declare-fun b!632746 () Bool)

(assert (=> b!632746 (= e!361734 (not e!361733))))

(declare-fun res!409251 () Bool)

(assert (=> b!632746 (=> res!409251 e!361733)))

(declare-fun lt!292332 () SeekEntryResult!6742)

(assert (=> b!632746 (= res!409251 (not (= lt!292332 (Found!6742 index!984))))))

(declare-fun lt!292336 () Unit!21296)

(assert (=> b!632746 (= lt!292336 e!361736)))

(declare-fun c!72114 () Bool)

(assert (=> b!632746 (= c!72114 (= lt!292332 Undefined!6742))))

(assert (=> b!632746 (= lt!292332 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292333 lt!292339 mask!3053))))

(assert (=> b!632746 e!361740))

(declare-fun res!409239 () Bool)

(assert (=> b!632746 (=> (not res!409239) (not e!361740))))

(declare-fun lt!292335 () (_ BitVec 32))

(assert (=> b!632746 (= res!409239 (= lt!292330 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 lt!292333 lt!292339 mask!3053)))))

(assert (=> b!632746 (= lt!292330 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632746 (= lt!292333 (select (store (arr!18305 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292334 () Unit!21296)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38148 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21296)

(assert (=> b!632746 (= lt!292334 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632746 (= lt!292335 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632747 () Bool)

(declare-fun res!409253 () Bool)

(assert (=> b!632747 (=> (not res!409253) (not e!361737))))

(assert (=> b!632747 (= res!409253 (validKeyInArray!0 k0!1786))))

(declare-fun b!632748 () Bool)

(declare-fun Unit!21299 () Unit!21296)

(assert (=> b!632748 (= e!361736 Unit!21299)))

(declare-fun b!632749 () Bool)

(assert (=> b!632749 (= e!361739 e!361738)))

(declare-fun res!409247 () Bool)

(assert (=> b!632749 (=> (not res!409247) (not e!361738))))

(assert (=> b!632749 (= res!409247 (= (select (store (arr!18305 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632749 (= lt!292339 (array!38149 (store (arr!18305 a!2986) i!1108 k0!1786) (size!18670 a!2986)))))

(assert (= (and start!57174 res!409242) b!632744))

(assert (= (and b!632744 res!409241) b!632745))

(assert (= (and b!632745 res!409243) b!632747))

(assert (= (and b!632747 res!409253) b!632735))

(assert (= (and b!632735 res!409250) b!632732))

(assert (= (and b!632732 res!409238) b!632739))

(assert (= (and b!632739 res!409244) b!632734))

(assert (= (and b!632734 res!409252) b!632741))

(assert (= (and b!632741 res!409249) b!632749))

(assert (= (and b!632749 res!409247) b!632733))

(assert (= (and b!632733 res!409246) b!632746))

(assert (= (and b!632746 res!409239) b!632743))

(assert (= (and b!632746 c!72114) b!632736))

(assert (= (and b!632746 (not c!72114)) b!632748))

(assert (= (and b!632746 (not res!409251)) b!632738))

(assert (= (and b!632738 res!409240) b!632737))

(assert (= (and b!632737 (not res!409245)) b!632742))

(assert (= (and b!632738 (not res!409248)) b!632740))

(declare-fun m!606985 () Bool)

(assert (=> b!632747 m!606985))

(declare-fun m!606987 () Bool)

(assert (=> b!632741 m!606987))

(declare-fun m!606989 () Bool)

(assert (=> b!632732 m!606989))

(declare-fun m!606991 () Bool)

(assert (=> b!632749 m!606991))

(declare-fun m!606993 () Bool)

(assert (=> b!632749 m!606993))

(declare-fun m!606995 () Bool)

(assert (=> b!632742 m!606995))

(assert (=> b!632742 m!606995))

(declare-fun m!606997 () Bool)

(assert (=> b!632742 m!606997))

(declare-fun m!606999 () Bool)

(assert (=> b!632733 m!606999))

(assert (=> b!632733 m!606995))

(assert (=> b!632733 m!606995))

(declare-fun m!607001 () Bool)

(assert (=> b!632733 m!607001))

(declare-fun m!607003 () Bool)

(assert (=> b!632739 m!607003))

(declare-fun m!607005 () Bool)

(assert (=> b!632734 m!607005))

(declare-fun m!607007 () Bool)

(assert (=> b!632735 m!607007))

(assert (=> b!632737 m!606995))

(assert (=> b!632740 m!606995))

(assert (=> b!632740 m!606995))

(declare-fun m!607009 () Bool)

(assert (=> b!632740 m!607009))

(assert (=> b!632745 m!606995))

(assert (=> b!632745 m!606995))

(declare-fun m!607011 () Bool)

(assert (=> b!632745 m!607011))

(assert (=> b!632738 m!606995))

(assert (=> b!632738 m!606991))

(declare-fun m!607013 () Bool)

(assert (=> b!632738 m!607013))

(declare-fun m!607015 () Bool)

(assert (=> b!632746 m!607015))

(declare-fun m!607017 () Bool)

(assert (=> b!632746 m!607017))

(assert (=> b!632746 m!606991))

(declare-fun m!607019 () Bool)

(assert (=> b!632746 m!607019))

(declare-fun m!607021 () Bool)

(assert (=> b!632746 m!607021))

(assert (=> b!632746 m!606995))

(declare-fun m!607023 () Bool)

(assert (=> b!632746 m!607023))

(declare-fun m!607025 () Bool)

(assert (=> b!632746 m!607025))

(assert (=> b!632746 m!606995))

(declare-fun m!607027 () Bool)

(assert (=> start!57174 m!607027))

(declare-fun m!607029 () Bool)

(assert (=> start!57174 m!607029))

(check-sat (not b!632742) (not b!632747) (not b!632735) (not b!632734) (not b!632733) (not b!632740) (not b!632732) (not b!632745) (not start!57174) (not b!632739) (not b!632746))
(check-sat)
(get-model)

(declare-fun b!632866 () Bool)

(declare-fun e!361818 () Bool)

(declare-fun e!361816 () Bool)

(assert (=> b!632866 (= e!361818 e!361816)))

(declare-fun lt!292406 () (_ BitVec 64))

(assert (=> b!632866 (= lt!292406 (select (arr!18305 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292408 () Unit!21296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38148 (_ BitVec 64) (_ BitVec 32)) Unit!21296)

(assert (=> b!632866 (= lt!292408 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292406 #b00000000000000000000000000000000))))

(assert (=> b!632866 (arrayContainsKey!0 a!2986 lt!292406 #b00000000000000000000000000000000)))

(declare-fun lt!292407 () Unit!21296)

(assert (=> b!632866 (= lt!292407 lt!292408)))

(declare-fun res!409354 () Bool)

(assert (=> b!632866 (= res!409354 (= (seekEntryOrOpen!0 (select (arr!18305 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6742 #b00000000000000000000000000000000)))))

(assert (=> b!632866 (=> (not res!409354) (not e!361816))))

(declare-fun b!632867 () Bool)

(declare-fun call!33340 () Bool)

(assert (=> b!632867 (= e!361816 call!33340)))

(declare-fun b!632868 () Bool)

(assert (=> b!632868 (= e!361818 call!33340)))

(declare-fun d!89295 () Bool)

(declare-fun res!409355 () Bool)

(declare-fun e!361817 () Bool)

(assert (=> d!89295 (=> res!409355 e!361817)))

(assert (=> d!89295 (= res!409355 (bvsge #b00000000000000000000000000000000 (size!18670 a!2986)))))

(assert (=> d!89295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361817)))

(declare-fun bm!33337 () Bool)

(assert (=> bm!33337 (= call!33340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!632869 () Bool)

(assert (=> b!632869 (= e!361817 e!361818)))

(declare-fun c!72123 () Bool)

(assert (=> b!632869 (= c!72123 (validKeyInArray!0 (select (arr!18305 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89295 (not res!409355)) b!632869))

(assert (= (and b!632869 c!72123) b!632866))

(assert (= (and b!632869 (not c!72123)) b!632868))

(assert (= (and b!632866 res!409354) b!632867))

(assert (= (or b!632867 b!632868) bm!33337))

(declare-fun m!607123 () Bool)

(assert (=> b!632866 m!607123))

(declare-fun m!607125 () Bool)

(assert (=> b!632866 m!607125))

(declare-fun m!607127 () Bool)

(assert (=> b!632866 m!607127))

(assert (=> b!632866 m!607123))

(declare-fun m!607129 () Bool)

(assert (=> b!632866 m!607129))

(declare-fun m!607131 () Bool)

(assert (=> bm!33337 m!607131))

(assert (=> b!632869 m!607123))

(assert (=> b!632869 m!607123))

(declare-fun m!607133 () Bool)

(assert (=> b!632869 m!607133))

(assert (=> b!632739 d!89295))

(declare-fun d!89297 () Bool)

(assert (=> d!89297 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632747 d!89297))

(declare-fun b!632882 () Bool)

(declare-fun c!72131 () Bool)

(declare-fun lt!292413 () (_ BitVec 64))

(assert (=> b!632882 (= c!72131 (= lt!292413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361827 () SeekEntryResult!6742)

(declare-fun e!361826 () SeekEntryResult!6742)

(assert (=> b!632882 (= e!361827 e!361826)))

(declare-fun lt!292414 () SeekEntryResult!6742)

(declare-fun d!89299 () Bool)

(get-info :version)

(assert (=> d!89299 (and (or ((_ is Undefined!6742) lt!292414) (not ((_ is Found!6742) lt!292414)) (and (bvsge (index!29265 lt!292414) #b00000000000000000000000000000000) (bvslt (index!29265 lt!292414) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292414) ((_ is Found!6742) lt!292414) (not ((_ is MissingVacant!6742) lt!292414)) (not (= (index!29267 lt!292414) vacantSpotIndex!68)) (and (bvsge (index!29267 lt!292414) #b00000000000000000000000000000000) (bvslt (index!29267 lt!292414) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292414) (ite ((_ is Found!6742) lt!292414) (= (select (arr!18305 a!2986) (index!29265 lt!292414)) (select (arr!18305 a!2986) j!136)) (and ((_ is MissingVacant!6742) lt!292414) (= (index!29267 lt!292414) vacantSpotIndex!68) (= (select (arr!18305 a!2986) (index!29267 lt!292414)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361825 () SeekEntryResult!6742)

(assert (=> d!89299 (= lt!292414 e!361825)))

(declare-fun c!72130 () Bool)

(assert (=> d!89299 (= c!72130 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89299 (= lt!292413 (select (arr!18305 a!2986) lt!292335))))

(assert (=> d!89299 (validMask!0 mask!3053)))

(assert (=> d!89299 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053) lt!292414)))

(declare-fun b!632883 () Bool)

(assert (=> b!632883 (= e!361826 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292335 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632884 () Bool)

(assert (=> b!632884 (= e!361827 (Found!6742 lt!292335))))

(declare-fun b!632885 () Bool)

(assert (=> b!632885 (= e!361825 Undefined!6742)))

(declare-fun b!632886 () Bool)

(assert (=> b!632886 (= e!361825 e!361827)))

(declare-fun c!72132 () Bool)

(assert (=> b!632886 (= c!72132 (= lt!292413 (select (arr!18305 a!2986) j!136)))))

(declare-fun b!632887 () Bool)

(assert (=> b!632887 (= e!361826 (MissingVacant!6742 vacantSpotIndex!68))))

(assert (= (and d!89299 c!72130) b!632885))

(assert (= (and d!89299 (not c!72130)) b!632886))

(assert (= (and b!632886 c!72132) b!632884))

(assert (= (and b!632886 (not c!72132)) b!632882))

(assert (= (and b!632882 c!72131) b!632887))

(assert (= (and b!632882 (not c!72131)) b!632883))

(declare-fun m!607135 () Bool)

(assert (=> d!89299 m!607135))

(declare-fun m!607137 () Bool)

(assert (=> d!89299 m!607137))

(declare-fun m!607139 () Bool)

(assert (=> d!89299 m!607139))

(assert (=> d!89299 m!607027))

(declare-fun m!607141 () Bool)

(assert (=> b!632883 m!607141))

(assert (=> b!632883 m!607141))

(assert (=> b!632883 m!606995))

(declare-fun m!607143 () Bool)

(assert (=> b!632883 m!607143))

(assert (=> b!632746 d!89299))

(declare-fun d!89301 () Bool)

(declare-fun lt!292417 () (_ BitVec 32))

(assert (=> d!89301 (and (bvsge lt!292417 #b00000000000000000000000000000000) (bvslt lt!292417 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89301 (= lt!292417 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89301 (validMask!0 mask!3053)))

(assert (=> d!89301 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292417)))

(declare-fun bs!19027 () Bool)

(assert (= bs!19027 d!89301))

(declare-fun m!607145 () Bool)

(assert (=> bs!19027 m!607145))

(assert (=> bs!19027 m!607027))

(assert (=> b!632746 d!89301))

(declare-fun b!632888 () Bool)

(declare-fun c!72134 () Bool)

(declare-fun lt!292418 () (_ BitVec 64))

(assert (=> b!632888 (= c!72134 (= lt!292418 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361830 () SeekEntryResult!6742)

(declare-fun e!361829 () SeekEntryResult!6742)

(assert (=> b!632888 (= e!361830 e!361829)))

(declare-fun lt!292419 () SeekEntryResult!6742)

(declare-fun d!89303 () Bool)

(assert (=> d!89303 (and (or ((_ is Undefined!6742) lt!292419) (not ((_ is Found!6742) lt!292419)) (and (bvsge (index!29265 lt!292419) #b00000000000000000000000000000000) (bvslt (index!29265 lt!292419) (size!18670 lt!292339)))) (or ((_ is Undefined!6742) lt!292419) ((_ is Found!6742) lt!292419) (not ((_ is MissingVacant!6742) lt!292419)) (not (= (index!29267 lt!292419) vacantSpotIndex!68)) (and (bvsge (index!29267 lt!292419) #b00000000000000000000000000000000) (bvslt (index!29267 lt!292419) (size!18670 lt!292339)))) (or ((_ is Undefined!6742) lt!292419) (ite ((_ is Found!6742) lt!292419) (= (select (arr!18305 lt!292339) (index!29265 lt!292419)) lt!292333) (and ((_ is MissingVacant!6742) lt!292419) (= (index!29267 lt!292419) vacantSpotIndex!68) (= (select (arr!18305 lt!292339) (index!29267 lt!292419)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361828 () SeekEntryResult!6742)

(assert (=> d!89303 (= lt!292419 e!361828)))

(declare-fun c!72133 () Bool)

(assert (=> d!89303 (= c!72133 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89303 (= lt!292418 (select (arr!18305 lt!292339) lt!292335))))

(assert (=> d!89303 (validMask!0 mask!3053)))

(assert (=> d!89303 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 lt!292333 lt!292339 mask!3053) lt!292419)))

(declare-fun b!632889 () Bool)

(assert (=> b!632889 (= e!361829 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292335 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292333 lt!292339 mask!3053))))

(declare-fun b!632890 () Bool)

(assert (=> b!632890 (= e!361830 (Found!6742 lt!292335))))

(declare-fun b!632891 () Bool)

(assert (=> b!632891 (= e!361828 Undefined!6742)))

(declare-fun b!632892 () Bool)

(assert (=> b!632892 (= e!361828 e!361830)))

(declare-fun c!72135 () Bool)

(assert (=> b!632892 (= c!72135 (= lt!292418 lt!292333))))

(declare-fun b!632893 () Bool)

(assert (=> b!632893 (= e!361829 (MissingVacant!6742 vacantSpotIndex!68))))

(assert (= (and d!89303 c!72133) b!632891))

(assert (= (and d!89303 (not c!72133)) b!632892))

(assert (= (and b!632892 c!72135) b!632890))

(assert (= (and b!632892 (not c!72135)) b!632888))

(assert (= (and b!632888 c!72134) b!632893))

(assert (= (and b!632888 (not c!72134)) b!632889))

(declare-fun m!607147 () Bool)

(assert (=> d!89303 m!607147))

(declare-fun m!607149 () Bool)

(assert (=> d!89303 m!607149))

(declare-fun m!607151 () Bool)

(assert (=> d!89303 m!607151))

(assert (=> d!89303 m!607027))

(assert (=> b!632889 m!607141))

(assert (=> b!632889 m!607141))

(declare-fun m!607153 () Bool)

(assert (=> b!632889 m!607153))

(assert (=> b!632746 d!89303))

(declare-fun d!89305 () Bool)

(declare-fun e!361833 () Bool)

(assert (=> d!89305 e!361833))

(declare-fun res!409358 () Bool)

(assert (=> d!89305 (=> (not res!409358) (not e!361833))))

(assert (=> d!89305 (= res!409358 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18670 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18670 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18670 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18670 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18670 a!2986))))))

(declare-fun lt!292422 () Unit!21296)

(declare-fun choose!9 (array!38148 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21296)

(assert (=> d!89305 (= lt!292422 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89305 (validMask!0 mask!3053)))

(assert (=> d!89305 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 mask!3053) lt!292422)))

(declare-fun b!632896 () Bool)

(assert (=> b!632896 (= e!361833 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292335 vacantSpotIndex!68 (select (store (arr!18305 a!2986) i!1108 k0!1786) j!136) (array!38149 (store (arr!18305 a!2986) i!1108 k0!1786) (size!18670 a!2986)) mask!3053)))))

(assert (= (and d!89305 res!409358) b!632896))

(declare-fun m!607155 () Bool)

(assert (=> d!89305 m!607155))

(assert (=> d!89305 m!607027))

(assert (=> b!632896 m!606995))

(assert (=> b!632896 m!606995))

(assert (=> b!632896 m!607023))

(assert (=> b!632896 m!607017))

(assert (=> b!632896 m!606991))

(assert (=> b!632896 m!607017))

(declare-fun m!607157 () Bool)

(assert (=> b!632896 m!607157))

(assert (=> b!632746 d!89305))

(declare-fun b!632897 () Bool)

(declare-fun c!72137 () Bool)

(declare-fun lt!292423 () (_ BitVec 64))

(assert (=> b!632897 (= c!72137 (= lt!292423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361836 () SeekEntryResult!6742)

(declare-fun e!361835 () SeekEntryResult!6742)

(assert (=> b!632897 (= e!361836 e!361835)))

(declare-fun lt!292424 () SeekEntryResult!6742)

(declare-fun d!89309 () Bool)

(assert (=> d!89309 (and (or ((_ is Undefined!6742) lt!292424) (not ((_ is Found!6742) lt!292424)) (and (bvsge (index!29265 lt!292424) #b00000000000000000000000000000000) (bvslt (index!29265 lt!292424) (size!18670 lt!292339)))) (or ((_ is Undefined!6742) lt!292424) ((_ is Found!6742) lt!292424) (not ((_ is MissingVacant!6742) lt!292424)) (not (= (index!29267 lt!292424) vacantSpotIndex!68)) (and (bvsge (index!29267 lt!292424) #b00000000000000000000000000000000) (bvslt (index!29267 lt!292424) (size!18670 lt!292339)))) (or ((_ is Undefined!6742) lt!292424) (ite ((_ is Found!6742) lt!292424) (= (select (arr!18305 lt!292339) (index!29265 lt!292424)) lt!292333) (and ((_ is MissingVacant!6742) lt!292424) (= (index!29267 lt!292424) vacantSpotIndex!68) (= (select (arr!18305 lt!292339) (index!29267 lt!292424)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361834 () SeekEntryResult!6742)

(assert (=> d!89309 (= lt!292424 e!361834)))

(declare-fun c!72136 () Bool)

(assert (=> d!89309 (= c!72136 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89309 (= lt!292423 (select (arr!18305 lt!292339) index!984))))

(assert (=> d!89309 (validMask!0 mask!3053)))

(assert (=> d!89309 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292333 lt!292339 mask!3053) lt!292424)))

(declare-fun b!632898 () Bool)

(assert (=> b!632898 (= e!361835 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292333 lt!292339 mask!3053))))

(declare-fun b!632899 () Bool)

(assert (=> b!632899 (= e!361836 (Found!6742 index!984))))

(declare-fun b!632900 () Bool)

(assert (=> b!632900 (= e!361834 Undefined!6742)))

(declare-fun b!632901 () Bool)

(assert (=> b!632901 (= e!361834 e!361836)))

(declare-fun c!72138 () Bool)

(assert (=> b!632901 (= c!72138 (= lt!292423 lt!292333))))

(declare-fun b!632902 () Bool)

(assert (=> b!632902 (= e!361835 (MissingVacant!6742 vacantSpotIndex!68))))

(assert (= (and d!89309 c!72136) b!632900))

(assert (= (and d!89309 (not c!72136)) b!632901))

(assert (= (and b!632901 c!72138) b!632899))

(assert (= (and b!632901 (not c!72138)) b!632897))

(assert (= (and b!632897 c!72137) b!632902))

(assert (= (and b!632897 (not c!72137)) b!632898))

(declare-fun m!607159 () Bool)

(assert (=> d!89309 m!607159))

(declare-fun m!607161 () Bool)

(assert (=> d!89309 m!607161))

(declare-fun m!607163 () Bool)

(assert (=> d!89309 m!607163))

(assert (=> d!89309 m!607027))

(assert (=> b!632898 m!607015))

(assert (=> b!632898 m!607015))

(declare-fun m!607165 () Bool)

(assert (=> b!632898 m!607165))

(assert (=> b!632746 d!89309))

(declare-fun d!89311 () Bool)

(declare-fun res!409363 () Bool)

(declare-fun e!361841 () Bool)

(assert (=> d!89311 (=> res!409363 e!361841)))

(assert (=> d!89311 (= res!409363 (= (select (arr!18305 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89311 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!361841)))

(declare-fun b!632907 () Bool)

(declare-fun e!361842 () Bool)

(assert (=> b!632907 (= e!361841 e!361842)))

(declare-fun res!409364 () Bool)

(assert (=> b!632907 (=> (not res!409364) (not e!361842))))

(assert (=> b!632907 (= res!409364 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18670 a!2986)))))

(declare-fun b!632908 () Bool)

(assert (=> b!632908 (= e!361842 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89311 (not res!409363)) b!632907))

(assert (= (and b!632907 res!409364) b!632908))

(assert (=> d!89311 m!607123))

(declare-fun m!607167 () Bool)

(assert (=> b!632908 m!607167))

(assert (=> b!632735 d!89311))

(declare-fun b!632919 () Bool)

(declare-fun e!361852 () Bool)

(declare-fun contains!3076 (List!12385 (_ BitVec 64)) Bool)

(assert (=> b!632919 (= e!361852 (contains!3076 Nil!12382 (select (arr!18305 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89313 () Bool)

(declare-fun res!409372 () Bool)

(declare-fun e!361853 () Bool)

(assert (=> d!89313 (=> res!409372 e!361853)))

(assert (=> d!89313 (= res!409372 (bvsge #b00000000000000000000000000000000 (size!18670 a!2986)))))

(assert (=> d!89313 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12382) e!361853)))

(declare-fun b!632920 () Bool)

(declare-fun e!361854 () Bool)

(declare-fun call!33343 () Bool)

(assert (=> b!632920 (= e!361854 call!33343)))

(declare-fun b!632921 () Bool)

(declare-fun e!361851 () Bool)

(assert (=> b!632921 (= e!361853 e!361851)))

(declare-fun res!409373 () Bool)

(assert (=> b!632921 (=> (not res!409373) (not e!361851))))

(assert (=> b!632921 (= res!409373 (not e!361852))))

(declare-fun res!409371 () Bool)

(assert (=> b!632921 (=> (not res!409371) (not e!361852))))

(assert (=> b!632921 (= res!409371 (validKeyInArray!0 (select (arr!18305 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33340 () Bool)

(declare-fun c!72141 () Bool)

(assert (=> bm!33340 (= call!33343 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72141 (Cons!12381 (select (arr!18305 a!2986) #b00000000000000000000000000000000) Nil!12382) Nil!12382)))))

(declare-fun b!632922 () Bool)

(assert (=> b!632922 (= e!361854 call!33343)))

(declare-fun b!632923 () Bool)

(assert (=> b!632923 (= e!361851 e!361854)))

(assert (=> b!632923 (= c!72141 (validKeyInArray!0 (select (arr!18305 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89313 (not res!409372)) b!632921))

(assert (= (and b!632921 res!409371) b!632919))

(assert (= (and b!632921 res!409373) b!632923))

(assert (= (and b!632923 c!72141) b!632922))

(assert (= (and b!632923 (not c!72141)) b!632920))

(assert (= (or b!632922 b!632920) bm!33340))

(assert (=> b!632919 m!607123))

(assert (=> b!632919 m!607123))

(declare-fun m!607169 () Bool)

(assert (=> b!632919 m!607169))

(assert (=> b!632921 m!607123))

(assert (=> b!632921 m!607123))

(assert (=> b!632921 m!607133))

(assert (=> bm!33340 m!607123))

(declare-fun m!607171 () Bool)

(assert (=> bm!33340 m!607171))

(assert (=> b!632923 m!607123))

(assert (=> b!632923 m!607123))

(assert (=> b!632923 m!607133))

(assert (=> b!632734 d!89313))

(declare-fun d!89315 () Bool)

(assert (=> d!89315 (= (validKeyInArray!0 (select (arr!18305 a!2986) j!136)) (and (not (= (select (arr!18305 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18305 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632745 d!89315))

(declare-fun b!632924 () Bool)

(declare-fun c!72143 () Bool)

(declare-fun lt!292425 () (_ BitVec 64))

(assert (=> b!632924 (= c!72143 (= lt!292425 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361857 () SeekEntryResult!6742)

(declare-fun e!361856 () SeekEntryResult!6742)

(assert (=> b!632924 (= e!361857 e!361856)))

(declare-fun lt!292426 () SeekEntryResult!6742)

(declare-fun d!89317 () Bool)

(assert (=> d!89317 (and (or ((_ is Undefined!6742) lt!292426) (not ((_ is Found!6742) lt!292426)) (and (bvsge (index!29265 lt!292426) #b00000000000000000000000000000000) (bvslt (index!29265 lt!292426) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292426) ((_ is Found!6742) lt!292426) (not ((_ is MissingVacant!6742) lt!292426)) (not (= (index!29267 lt!292426) vacantSpotIndex!68)) (and (bvsge (index!29267 lt!292426) #b00000000000000000000000000000000) (bvslt (index!29267 lt!292426) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292426) (ite ((_ is Found!6742) lt!292426) (= (select (arr!18305 a!2986) (index!29265 lt!292426)) (select (arr!18305 a!2986) j!136)) (and ((_ is MissingVacant!6742) lt!292426) (= (index!29267 lt!292426) vacantSpotIndex!68) (= (select (arr!18305 a!2986) (index!29267 lt!292426)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361855 () SeekEntryResult!6742)

(assert (=> d!89317 (= lt!292426 e!361855)))

(declare-fun c!72142 () Bool)

(assert (=> d!89317 (= c!72142 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89317 (= lt!292425 (select (arr!18305 a!2986) index!984))))

(assert (=> d!89317 (validMask!0 mask!3053)))

(assert (=> d!89317 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053) lt!292426)))

(declare-fun b!632925 () Bool)

(assert (=> b!632925 (= e!361856 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632926 () Bool)

(assert (=> b!632926 (= e!361857 (Found!6742 index!984))))

(declare-fun b!632927 () Bool)

(assert (=> b!632927 (= e!361855 Undefined!6742)))

(declare-fun b!632928 () Bool)

(assert (=> b!632928 (= e!361855 e!361857)))

(declare-fun c!72144 () Bool)

(assert (=> b!632928 (= c!72144 (= lt!292425 (select (arr!18305 a!2986) j!136)))))

(declare-fun b!632929 () Bool)

(assert (=> b!632929 (= e!361856 (MissingVacant!6742 vacantSpotIndex!68))))

(assert (= (and d!89317 c!72142) b!632927))

(assert (= (and d!89317 (not c!72142)) b!632928))

(assert (= (and b!632928 c!72144) b!632926))

(assert (= (and b!632928 (not c!72144)) b!632924))

(assert (= (and b!632924 c!72143) b!632929))

(assert (= (and b!632924 (not c!72143)) b!632925))

(declare-fun m!607173 () Bool)

(assert (=> d!89317 m!607173))

(declare-fun m!607175 () Bool)

(assert (=> d!89317 m!607175))

(assert (=> d!89317 m!606999))

(assert (=> d!89317 m!607027))

(assert (=> b!632925 m!607015))

(assert (=> b!632925 m!607015))

(assert (=> b!632925 m!606995))

(declare-fun m!607177 () Bool)

(assert (=> b!632925 m!607177))

(assert (=> b!632733 d!89317))

(declare-fun b!632972 () Bool)

(declare-fun e!361883 () SeekEntryResult!6742)

(declare-fun e!361882 () SeekEntryResult!6742)

(assert (=> b!632972 (= e!361883 e!361882)))

(declare-fun lt!292452 () (_ BitVec 64))

(declare-fun lt!292451 () SeekEntryResult!6742)

(assert (=> b!632972 (= lt!292452 (select (arr!18305 a!2986) (index!29266 lt!292451)))))

(declare-fun c!72164 () Bool)

(assert (=> b!632972 (= c!72164 (= lt!292452 k0!1786))))

(declare-fun b!632973 () Bool)

(assert (=> b!632973 (= e!361883 Undefined!6742)))

(declare-fun b!632974 () Bool)

(declare-fun c!72163 () Bool)

(assert (=> b!632974 (= c!72163 (= lt!292452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361884 () SeekEntryResult!6742)

(assert (=> b!632974 (= e!361882 e!361884)))

(declare-fun b!632975 () Bool)

(assert (=> b!632975 (= e!361884 (seekKeyOrZeroReturnVacant!0 (x!58013 lt!292451) (index!29266 lt!292451) (index!29266 lt!292451) k0!1786 a!2986 mask!3053))))

(declare-fun d!89319 () Bool)

(declare-fun lt!292453 () SeekEntryResult!6742)

(assert (=> d!89319 (and (or ((_ is Undefined!6742) lt!292453) (not ((_ is Found!6742) lt!292453)) (and (bvsge (index!29265 lt!292453) #b00000000000000000000000000000000) (bvslt (index!29265 lt!292453) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292453) ((_ is Found!6742) lt!292453) (not ((_ is MissingZero!6742) lt!292453)) (and (bvsge (index!29264 lt!292453) #b00000000000000000000000000000000) (bvslt (index!29264 lt!292453) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292453) ((_ is Found!6742) lt!292453) ((_ is MissingZero!6742) lt!292453) (not ((_ is MissingVacant!6742) lt!292453)) (and (bvsge (index!29267 lt!292453) #b00000000000000000000000000000000) (bvslt (index!29267 lt!292453) (size!18670 a!2986)))) (or ((_ is Undefined!6742) lt!292453) (ite ((_ is Found!6742) lt!292453) (= (select (arr!18305 a!2986) (index!29265 lt!292453)) k0!1786) (ite ((_ is MissingZero!6742) lt!292453) (= (select (arr!18305 a!2986) (index!29264 lt!292453)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6742) lt!292453) (= (select (arr!18305 a!2986) (index!29267 lt!292453)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89319 (= lt!292453 e!361883)))

(declare-fun c!72165 () Bool)

(assert (=> d!89319 (= c!72165 (and ((_ is Intermediate!6742) lt!292451) (undefined!7554 lt!292451)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38148 (_ BitVec 32)) SeekEntryResult!6742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89319 (= lt!292451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89319 (validMask!0 mask!3053)))

(assert (=> d!89319 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292453)))

(declare-fun b!632976 () Bool)

(assert (=> b!632976 (= e!361882 (Found!6742 (index!29266 lt!292451)))))

(declare-fun b!632977 () Bool)

(assert (=> b!632977 (= e!361884 (MissingZero!6742 (index!29266 lt!292451)))))

(assert (= (and d!89319 c!72165) b!632973))

(assert (= (and d!89319 (not c!72165)) b!632972))

(assert (= (and b!632972 c!72164) b!632976))

(assert (= (and b!632972 (not c!72164)) b!632974))

(assert (= (and b!632974 c!72163) b!632977))

(assert (= (and b!632974 (not c!72163)) b!632975))

(declare-fun m!607205 () Bool)

(assert (=> b!632972 m!607205))

(declare-fun m!607207 () Bool)

(assert (=> b!632975 m!607207))

(assert (=> d!89319 m!607027))

(declare-fun m!607209 () Bool)

(assert (=> d!89319 m!607209))

(declare-fun m!607211 () Bool)

(assert (=> d!89319 m!607211))

(declare-fun m!607213 () Bool)

(assert (=> d!89319 m!607213))

(declare-fun m!607215 () Bool)

(assert (=> d!89319 m!607215))

(assert (=> d!89319 m!607215))

(declare-fun m!607217 () Bool)

(assert (=> d!89319 m!607217))

(assert (=> b!632732 d!89319))

(declare-fun d!89329 () Bool)

(declare-fun res!409382 () Bool)

(declare-fun e!361887 () Bool)

(assert (=> d!89329 (=> res!409382 e!361887)))

(assert (=> d!89329 (= res!409382 (= (select (arr!18305 lt!292339) j!136) (select (arr!18305 a!2986) j!136)))))

(assert (=> d!89329 (= (arrayContainsKey!0 lt!292339 (select (arr!18305 a!2986) j!136) j!136) e!361887)))

(declare-fun b!632980 () Bool)

(declare-fun e!361888 () Bool)

(assert (=> b!632980 (= e!361887 e!361888)))

(declare-fun res!409383 () Bool)

(assert (=> b!632980 (=> (not res!409383) (not e!361888))))

(assert (=> b!632980 (= res!409383 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18670 lt!292339)))))

(declare-fun b!632981 () Bool)

(assert (=> b!632981 (= e!361888 (arrayContainsKey!0 lt!292339 (select (arr!18305 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89329 (not res!409382)) b!632980))

(assert (= (and b!632980 res!409383) b!632981))

(declare-fun m!607219 () Bool)

(assert (=> d!89329 m!607219))

(assert (=> b!632981 m!606995))

(declare-fun m!607221 () Bool)

(assert (=> b!632981 m!607221))

(assert (=> b!632742 d!89329))

(declare-fun d!89331 () Bool)

(assert (=> d!89331 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57174 d!89331))

(declare-fun d!89339 () Bool)

(assert (=> d!89339 (= (array_inv!14188 a!2986) (bvsge (size!18670 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57174 d!89339))

(declare-fun d!89341 () Bool)

(declare-fun res!409400 () Bool)

(declare-fun e!361911 () Bool)

(assert (=> d!89341 (=> res!409400 e!361911)))

(assert (=> d!89341 (= res!409400 (= (select (arr!18305 lt!292339) index!984) (select (arr!18305 a!2986) j!136)))))

(assert (=> d!89341 (= (arrayContainsKey!0 lt!292339 (select (arr!18305 a!2986) j!136) index!984) e!361911)))

(declare-fun b!633010 () Bool)

(declare-fun e!361912 () Bool)

(assert (=> b!633010 (= e!361911 e!361912)))

(declare-fun res!409401 () Bool)

(assert (=> b!633010 (=> (not res!409401) (not e!361912))))

(assert (=> b!633010 (= res!409401 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18670 lt!292339)))))

(declare-fun b!633011 () Bool)

(assert (=> b!633011 (= e!361912 (arrayContainsKey!0 lt!292339 (select (arr!18305 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89341 (not res!409400)) b!633010))

(assert (= (and b!633010 res!409401) b!633011))

(assert (=> d!89341 m!607163))

(assert (=> b!633011 m!606995))

(declare-fun m!607235 () Bool)

(assert (=> b!633011 m!607235))

(assert (=> b!632740 d!89341))

(check-sat (not b!632975) (not d!89299) (not d!89319) (not b!632889) (not bm!33337) (not b!632921) (not d!89309) (not b!632896) (not b!632883) (not b!632869) (not d!89305) (not b!632908) (not b!632866) (not d!89317) (not b!632919) (not d!89303) (not b!632923) (not b!632898) (not bm!33340) (not b!632981) (not b!632925) (not b!633011) (not d!89301))
(check-sat)
