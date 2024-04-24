; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54966 () Bool)

(assert start!54966)

(declare-fun b!601694 () Bool)

(declare-fun res!386347 () Bool)

(declare-fun e!344061 () Bool)

(assert (=> b!601694 (=> (not res!386347) (not e!344061))))

(declare-datatypes ((array!37146 0))(
  ( (array!37147 (arr!17830 (Array (_ BitVec 32) (_ BitVec 64))) (size!18194 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37146)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37146 (_ BitVec 32)) Bool)

(assert (=> b!601694 (= res!386347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601695 () Bool)

(declare-fun res!386344 () Bool)

(assert (=> b!601695 (=> (not res!386344) (not e!344061))))

(declare-datatypes ((List!11778 0))(
  ( (Nil!11775) (Cons!11774 (h!12822 (_ BitVec 64)) (t!17998 List!11778)) )
))
(declare-fun arrayNoDuplicates!0 (array!37146 (_ BitVec 32) List!11778) Bool)

(assert (=> b!601695 (= res!386344 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11775))))

(declare-fun b!601696 () Bool)

(declare-fun e!344059 () Bool)

(assert (=> b!601696 (= e!344059 e!344061)))

(declare-fun res!386338 () Bool)

(assert (=> b!601696 (=> (not res!386338) (not e!344061))))

(declare-datatypes ((SeekEntryResult!6226 0))(
  ( (MissingZero!6226 (index!27161 (_ BitVec 32))) (Found!6226 (index!27162 (_ BitVec 32))) (Intermediate!6226 (undefined!7038 Bool) (index!27163 (_ BitVec 32)) (x!56108 (_ BitVec 32))) (Undefined!6226) (MissingVacant!6226 (index!27164 (_ BitVec 32))) )
))
(declare-fun lt!273946 () SeekEntryResult!6226)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!601696 (= res!386338 (or (= lt!273946 (MissingZero!6226 i!1108)) (= lt!273946 (MissingVacant!6226 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37146 (_ BitVec 32)) SeekEntryResult!6226)

(assert (=> b!601696 (= lt!273946 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601697 () Bool)

(declare-fun res!386340 () Bool)

(assert (=> b!601697 (=> (not res!386340) (not e!344059))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601697 (= res!386340 (validKeyInArray!0 (select (arr!17830 a!2986) j!136)))))

(declare-fun b!601698 () Bool)

(declare-fun e!344054 () Bool)

(declare-fun e!344060 () Bool)

(assert (=> b!601698 (= e!344054 e!344060)))

(declare-fun res!386350 () Bool)

(assert (=> b!601698 (=> res!386350 e!344060)))

(declare-fun lt!273941 () (_ BitVec 64))

(declare-fun lt!273933 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601698 (= res!386350 (or (not (= (select (arr!17830 a!2986) j!136) lt!273933)) (not (= (select (arr!17830 a!2986) j!136) lt!273941)) (bvsge j!136 index!984)))))

(declare-fun b!601699 () Bool)

(declare-datatypes ((Unit!19009 0))(
  ( (Unit!19010) )
))
(declare-fun e!344062 () Unit!19009)

(declare-fun Unit!19011 () Unit!19009)

(assert (=> b!601699 (= e!344062 Unit!19011)))

(assert (=> b!601699 false))

(declare-fun b!601700 () Bool)

(declare-fun e!344064 () Unit!19009)

(declare-fun Unit!19012 () Unit!19009)

(assert (=> b!601700 (= e!344064 Unit!19012)))

(declare-fun lt!273944 () Unit!19009)

(declare-fun lt!273945 () array!37146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37146 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> b!601700 (= lt!273944 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273945 (select (arr!17830 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601700 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273938 () Unit!19009)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37146 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11778) Unit!19009)

(assert (=> b!601700 (= lt!273938 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11775))))

(assert (=> b!601700 (arrayNoDuplicates!0 lt!273945 #b00000000000000000000000000000000 Nil!11775)))

(declare-fun lt!273942 () Unit!19009)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37146 (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> b!601700 (= lt!273942 (lemmaNoDuplicateFromThenFromBigger!0 lt!273945 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601700 (arrayNoDuplicates!0 lt!273945 j!136 Nil!11775)))

(declare-fun lt!273943 () Unit!19009)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37146 (_ BitVec 64) (_ BitVec 32) List!11778) Unit!19009)

(assert (=> b!601700 (= lt!273943 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273945 (select (arr!17830 a!2986) j!136) j!136 Nil!11775))))

(assert (=> b!601700 false))

(declare-fun b!601701 () Bool)

(declare-fun Unit!19013 () Unit!19009)

(assert (=> b!601701 (= e!344062 Unit!19013)))

(declare-fun b!601702 () Bool)

(declare-fun res!386339 () Bool)

(assert (=> b!601702 (=> (not res!386339) (not e!344059))))

(assert (=> b!601702 (= res!386339 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601703 () Bool)

(declare-fun res!386343 () Bool)

(assert (=> b!601703 (=> (not res!386343) (not e!344059))))

(assert (=> b!601703 (= res!386343 (and (= (size!18194 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18194 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18194 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601704 () Bool)

(declare-fun e!344056 () Bool)

(declare-fun e!344063 () Bool)

(assert (=> b!601704 (= e!344056 e!344063)))

(declare-fun res!386337 () Bool)

(assert (=> b!601704 (=> (not res!386337) (not e!344063))))

(declare-fun lt!273934 () SeekEntryResult!6226)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!601704 (= res!386337 (and (= lt!273934 (Found!6226 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17830 a!2986) index!984) (select (arr!17830 a!2986) j!136))) (not (= (select (arr!17830 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37146 (_ BitVec 32)) SeekEntryResult!6226)

(assert (=> b!601704 (= lt!273934 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601705 () Bool)

(declare-fun res!386351 () Bool)

(assert (=> b!601705 (=> (not res!386351) (not e!344061))))

(assert (=> b!601705 (= res!386351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17830 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601706 () Bool)

(declare-fun e!344055 () Bool)

(assert (=> b!601706 (= e!344055 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) index!984))))

(declare-fun b!601707 () Bool)

(declare-fun res!386352 () Bool)

(assert (=> b!601707 (=> (not res!386352) (not e!344059))))

(assert (=> b!601707 (= res!386352 (validKeyInArray!0 k0!1786))))

(declare-fun b!601708 () Bool)

(assert (=> b!601708 (= e!344061 e!344056)))

(declare-fun res!386346 () Bool)

(assert (=> b!601708 (=> (not res!386346) (not e!344056))))

(assert (=> b!601708 (= res!386346 (= (select (store (arr!17830 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601708 (= lt!273945 (array!37147 (store (arr!17830 a!2986) i!1108 k0!1786) (size!18194 a!2986)))))

(declare-fun e!344057 () Bool)

(declare-fun b!601709 () Bool)

(assert (=> b!601709 (= e!344057 (or (bvsge index!984 j!136) (bvslt (size!18194 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!273936 () Unit!19009)

(assert (=> b!601709 (= lt!273936 e!344064)))

(declare-fun c!68047 () Bool)

(assert (=> b!601709 (= c!68047 (bvslt j!136 index!984))))

(declare-fun b!601710 () Bool)

(declare-fun e!344052 () Bool)

(assert (=> b!601710 (= e!344063 (not e!344052))))

(declare-fun res!386353 () Bool)

(assert (=> b!601710 (=> res!386353 e!344052)))

(declare-fun lt!273937 () SeekEntryResult!6226)

(assert (=> b!601710 (= res!386353 (not (= lt!273937 (Found!6226 index!984))))))

(declare-fun lt!273935 () Unit!19009)

(assert (=> b!601710 (= lt!273935 e!344062)))

(declare-fun c!68048 () Bool)

(assert (=> b!601710 (= c!68048 (= lt!273937 Undefined!6226))))

(assert (=> b!601710 (= lt!273937 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273933 lt!273945 mask!3053))))

(declare-fun e!344058 () Bool)

(assert (=> b!601710 e!344058))

(declare-fun res!386349 () Bool)

(assert (=> b!601710 (=> (not res!386349) (not e!344058))))

(declare-fun lt!273940 () (_ BitVec 32))

(declare-fun lt!273939 () SeekEntryResult!6226)

(assert (=> b!601710 (= res!386349 (= lt!273939 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 lt!273933 lt!273945 mask!3053)))))

(assert (=> b!601710 (= lt!273939 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601710 (= lt!273933 (select (store (arr!17830 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273932 () Unit!19009)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37146 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> b!601710 (= lt!273932 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601710 (= lt!273940 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!386348 () Bool)

(assert (=> start!54966 (=> (not res!386348) (not e!344059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54966 (= res!386348 (validMask!0 mask!3053))))

(assert (=> start!54966 e!344059))

(assert (=> start!54966 true))

(declare-fun array_inv!13689 (array!37146) Bool)

(assert (=> start!54966 (array_inv!13689 a!2986)))

(declare-fun b!601711 () Bool)

(assert (=> b!601711 (= e!344052 e!344057)))

(declare-fun res!386345 () Bool)

(assert (=> b!601711 (=> res!386345 e!344057)))

(assert (=> b!601711 (= res!386345 (or (not (= (select (arr!17830 a!2986) j!136) lt!273933)) (not (= (select (arr!17830 a!2986) j!136) lt!273941))))))

(assert (=> b!601711 e!344054))

(declare-fun res!386342 () Bool)

(assert (=> b!601711 (=> (not res!386342) (not e!344054))))

(assert (=> b!601711 (= res!386342 (= lt!273941 (select (arr!17830 a!2986) j!136)))))

(assert (=> b!601711 (= lt!273941 (select (store (arr!17830 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601712 () Bool)

(declare-fun Unit!19014 () Unit!19009)

(assert (=> b!601712 (= e!344064 Unit!19014)))

(declare-fun b!601713 () Bool)

(assert (=> b!601713 (= e!344058 (= lt!273934 lt!273939))))

(declare-fun b!601714 () Bool)

(assert (=> b!601714 (= e!344060 e!344055)))

(declare-fun res!386341 () Bool)

(assert (=> b!601714 (=> (not res!386341) (not e!344055))))

(assert (=> b!601714 (= res!386341 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) j!136))))

(assert (= (and start!54966 res!386348) b!601703))

(assert (= (and b!601703 res!386343) b!601697))

(assert (= (and b!601697 res!386340) b!601707))

(assert (= (and b!601707 res!386352) b!601702))

(assert (= (and b!601702 res!386339) b!601696))

(assert (= (and b!601696 res!386338) b!601694))

(assert (= (and b!601694 res!386347) b!601695))

(assert (= (and b!601695 res!386344) b!601705))

(assert (= (and b!601705 res!386351) b!601708))

(assert (= (and b!601708 res!386346) b!601704))

(assert (= (and b!601704 res!386337) b!601710))

(assert (= (and b!601710 res!386349) b!601713))

(assert (= (and b!601710 c!68048) b!601699))

(assert (= (and b!601710 (not c!68048)) b!601701))

(assert (= (and b!601710 (not res!386353)) b!601711))

(assert (= (and b!601711 res!386342) b!601698))

(assert (= (and b!601698 (not res!386350)) b!601714))

(assert (= (and b!601714 res!386341) b!601706))

(assert (= (and b!601711 (not res!386345)) b!601709))

(assert (= (and b!601709 c!68047) b!601700))

(assert (= (and b!601709 (not c!68047)) b!601712))

(declare-fun m!579101 () Bool)

(assert (=> b!601714 m!579101))

(assert (=> b!601714 m!579101))

(declare-fun m!579103 () Bool)

(assert (=> b!601714 m!579103))

(declare-fun m!579105 () Bool)

(assert (=> b!601710 m!579105))

(assert (=> b!601710 m!579101))

(declare-fun m!579107 () Bool)

(assert (=> b!601710 m!579107))

(declare-fun m!579109 () Bool)

(assert (=> b!601710 m!579109))

(assert (=> b!601710 m!579101))

(declare-fun m!579111 () Bool)

(assert (=> b!601710 m!579111))

(declare-fun m!579113 () Bool)

(assert (=> b!601710 m!579113))

(declare-fun m!579115 () Bool)

(assert (=> b!601710 m!579115))

(declare-fun m!579117 () Bool)

(assert (=> b!601710 m!579117))

(assert (=> b!601698 m!579101))

(declare-fun m!579119 () Bool)

(assert (=> start!54966 m!579119))

(declare-fun m!579121 () Bool)

(assert (=> start!54966 m!579121))

(assert (=> b!601697 m!579101))

(assert (=> b!601697 m!579101))

(declare-fun m!579123 () Bool)

(assert (=> b!601697 m!579123))

(declare-fun m!579125 () Bool)

(assert (=> b!601695 m!579125))

(assert (=> b!601706 m!579101))

(assert (=> b!601706 m!579101))

(declare-fun m!579127 () Bool)

(assert (=> b!601706 m!579127))

(declare-fun m!579129 () Bool)

(assert (=> b!601704 m!579129))

(assert (=> b!601704 m!579101))

(assert (=> b!601704 m!579101))

(declare-fun m!579131 () Bool)

(assert (=> b!601704 m!579131))

(assert (=> b!601708 m!579109))

(declare-fun m!579133 () Bool)

(assert (=> b!601708 m!579133))

(declare-fun m!579135 () Bool)

(assert (=> b!601702 m!579135))

(declare-fun m!579137 () Bool)

(assert (=> b!601696 m!579137))

(assert (=> b!601711 m!579101))

(assert (=> b!601711 m!579109))

(declare-fun m!579139 () Bool)

(assert (=> b!601711 m!579139))

(declare-fun m!579141 () Bool)

(assert (=> b!601707 m!579141))

(declare-fun m!579143 () Bool)

(assert (=> b!601694 m!579143))

(declare-fun m!579145 () Bool)

(assert (=> b!601705 m!579145))

(declare-fun m!579147 () Bool)

(assert (=> b!601700 m!579147))

(assert (=> b!601700 m!579101))

(declare-fun m!579149 () Bool)

(assert (=> b!601700 m!579149))

(declare-fun m!579151 () Bool)

(assert (=> b!601700 m!579151))

(assert (=> b!601700 m!579101))

(declare-fun m!579153 () Bool)

(assert (=> b!601700 m!579153))

(assert (=> b!601700 m!579101))

(declare-fun m!579155 () Bool)

(assert (=> b!601700 m!579155))

(declare-fun m!579157 () Bool)

(assert (=> b!601700 m!579157))

(assert (=> b!601700 m!579101))

(declare-fun m!579159 () Bool)

(assert (=> b!601700 m!579159))

(check-sat (not b!601697) (not b!601694) (not b!601696) (not b!601714) (not b!601702) (not b!601700) (not b!601707) (not b!601706) (not b!601704) (not b!601710) (not b!601695) (not start!54966))
(check-sat)
(get-model)

(declare-fun d!87249 () Bool)

(assert (=> d!87249 (= (validKeyInArray!0 (select (arr!17830 a!2986) j!136)) (and (not (= (select (arr!17830 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17830 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601697 d!87249))

(declare-fun d!87251 () Bool)

(declare-fun e!344145 () Bool)

(assert (=> d!87251 e!344145))

(declare-fun res!386458 () Bool)

(assert (=> d!87251 (=> (not res!386458) (not e!344145))))

(assert (=> d!87251 (= res!386458 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18194 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18194 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18194 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18194 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18194 a!2986))))))

(declare-fun lt!274039 () Unit!19009)

(declare-fun choose!9 (array!37146 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> d!87251 (= lt!274039 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87251 (validMask!0 mask!3053)))

(assert (=> d!87251 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 mask!3053) lt!274039)))

(declare-fun b!601843 () Bool)

(assert (=> b!601843 (= e!344145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 (select (store (arr!17830 a!2986) i!1108 k0!1786) j!136) (array!37147 (store (arr!17830 a!2986) i!1108 k0!1786) (size!18194 a!2986)) mask!3053)))))

(assert (= (and d!87251 res!386458) b!601843))

(declare-fun m!579281 () Bool)

(assert (=> d!87251 m!579281))

(assert (=> d!87251 m!579119))

(assert (=> b!601843 m!579105))

(assert (=> b!601843 m!579101))

(assert (=> b!601843 m!579109))

(assert (=> b!601843 m!579101))

(assert (=> b!601843 m!579111))

(assert (=> b!601843 m!579105))

(declare-fun m!579283 () Bool)

(assert (=> b!601843 m!579283))

(assert (=> b!601710 d!87251))

(declare-fun d!87253 () Bool)

(declare-fun lt!274045 () SeekEntryResult!6226)

(get-info :version)

(assert (=> d!87253 (and (or ((_ is Undefined!6226) lt!274045) (not ((_ is Found!6226) lt!274045)) (and (bvsge (index!27162 lt!274045) #b00000000000000000000000000000000) (bvslt (index!27162 lt!274045) (size!18194 lt!273945)))) (or ((_ is Undefined!6226) lt!274045) ((_ is Found!6226) lt!274045) (not ((_ is MissingVacant!6226) lt!274045)) (not (= (index!27164 lt!274045) vacantSpotIndex!68)) (and (bvsge (index!27164 lt!274045) #b00000000000000000000000000000000) (bvslt (index!27164 lt!274045) (size!18194 lt!273945)))) (or ((_ is Undefined!6226) lt!274045) (ite ((_ is Found!6226) lt!274045) (= (select (arr!17830 lt!273945) (index!27162 lt!274045)) lt!273933) (and ((_ is MissingVacant!6226) lt!274045) (= (index!27164 lt!274045) vacantSpotIndex!68) (= (select (arr!17830 lt!273945) (index!27164 lt!274045)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!344154 () SeekEntryResult!6226)

(assert (=> d!87253 (= lt!274045 e!344154)))

(declare-fun c!68068 () Bool)

(assert (=> d!87253 (= c!68068 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!274044 () (_ BitVec 64))

(assert (=> d!87253 (= lt!274044 (select (arr!17830 lt!273945) lt!273940))))

(assert (=> d!87253 (validMask!0 mask!3053)))

(assert (=> d!87253 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 lt!273933 lt!273945 mask!3053) lt!274045)))

(declare-fun b!601856 () Bool)

(declare-fun e!344153 () SeekEntryResult!6226)

(assert (=> b!601856 (= e!344154 e!344153)))

(declare-fun c!68067 () Bool)

(assert (=> b!601856 (= c!68067 (= lt!274044 lt!273933))))

(declare-fun b!601857 () Bool)

(declare-fun e!344152 () SeekEntryResult!6226)

(assert (=> b!601857 (= e!344152 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!601858 () Bool)

(assert (=> b!601858 (= e!344152 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273940 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!273933 lt!273945 mask!3053))))

(declare-fun b!601859 () Bool)

(assert (=> b!601859 (= e!344153 (Found!6226 lt!273940))))

(declare-fun b!601860 () Bool)

(assert (=> b!601860 (= e!344154 Undefined!6226)))

(declare-fun b!601861 () Bool)

(declare-fun c!68069 () Bool)

(assert (=> b!601861 (= c!68069 (= lt!274044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601861 (= e!344153 e!344152)))

(assert (= (and d!87253 c!68068) b!601860))

(assert (= (and d!87253 (not c!68068)) b!601856))

(assert (= (and b!601856 c!68067) b!601859))

(assert (= (and b!601856 (not c!68067)) b!601861))

(assert (= (and b!601861 c!68069) b!601857))

(assert (= (and b!601861 (not c!68069)) b!601858))

(declare-fun m!579285 () Bool)

(assert (=> d!87253 m!579285))

(declare-fun m!579287 () Bool)

(assert (=> d!87253 m!579287))

(declare-fun m!579289 () Bool)

(assert (=> d!87253 m!579289))

(assert (=> d!87253 m!579119))

(declare-fun m!579291 () Bool)

(assert (=> b!601858 m!579291))

(assert (=> b!601858 m!579291))

(declare-fun m!579293 () Bool)

(assert (=> b!601858 m!579293))

(assert (=> b!601710 d!87253))

(declare-fun d!87255 () Bool)

(declare-fun lt!274048 () (_ BitVec 32))

(assert (=> d!87255 (and (bvsge lt!274048 #b00000000000000000000000000000000) (bvslt lt!274048 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87255 (= lt!274048 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!87255 (validMask!0 mask!3053)))

(assert (=> d!87255 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!274048)))

(declare-fun bs!18458 () Bool)

(assert (= bs!18458 d!87255))

(declare-fun m!579295 () Bool)

(assert (=> bs!18458 m!579295))

(assert (=> bs!18458 m!579119))

(assert (=> b!601710 d!87255))

(declare-fun d!87257 () Bool)

(declare-fun lt!274050 () SeekEntryResult!6226)

(assert (=> d!87257 (and (or ((_ is Undefined!6226) lt!274050) (not ((_ is Found!6226) lt!274050)) (and (bvsge (index!27162 lt!274050) #b00000000000000000000000000000000) (bvslt (index!27162 lt!274050) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274050) ((_ is Found!6226) lt!274050) (not ((_ is MissingVacant!6226) lt!274050)) (not (= (index!27164 lt!274050) vacantSpotIndex!68)) (and (bvsge (index!27164 lt!274050) #b00000000000000000000000000000000) (bvslt (index!27164 lt!274050) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274050) (ite ((_ is Found!6226) lt!274050) (= (select (arr!17830 a!2986) (index!27162 lt!274050)) (select (arr!17830 a!2986) j!136)) (and ((_ is MissingVacant!6226) lt!274050) (= (index!27164 lt!274050) vacantSpotIndex!68) (= (select (arr!17830 a!2986) (index!27164 lt!274050)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!344157 () SeekEntryResult!6226)

(assert (=> d!87257 (= lt!274050 e!344157)))

(declare-fun c!68071 () Bool)

(assert (=> d!87257 (= c!68071 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!274049 () (_ BitVec 64))

(assert (=> d!87257 (= lt!274049 (select (arr!17830 a!2986) lt!273940))))

(assert (=> d!87257 (validMask!0 mask!3053)))

(assert (=> d!87257 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273940 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053) lt!274050)))

(declare-fun b!601862 () Bool)

(declare-fun e!344156 () SeekEntryResult!6226)

(assert (=> b!601862 (= e!344157 e!344156)))

(declare-fun c!68070 () Bool)

(assert (=> b!601862 (= c!68070 (= lt!274049 (select (arr!17830 a!2986) j!136)))))

(declare-fun b!601863 () Bool)

(declare-fun e!344155 () SeekEntryResult!6226)

(assert (=> b!601863 (= e!344155 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!601864 () Bool)

(assert (=> b!601864 (= e!344155 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273940 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601865 () Bool)

(assert (=> b!601865 (= e!344156 (Found!6226 lt!273940))))

(declare-fun b!601866 () Bool)

(assert (=> b!601866 (= e!344157 Undefined!6226)))

(declare-fun b!601867 () Bool)

(declare-fun c!68072 () Bool)

(assert (=> b!601867 (= c!68072 (= lt!274049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601867 (= e!344156 e!344155)))

(assert (= (and d!87257 c!68071) b!601866))

(assert (= (and d!87257 (not c!68071)) b!601862))

(assert (= (and b!601862 c!68070) b!601865))

(assert (= (and b!601862 (not c!68070)) b!601867))

(assert (= (and b!601867 c!68072) b!601863))

(assert (= (and b!601867 (not c!68072)) b!601864))

(declare-fun m!579297 () Bool)

(assert (=> d!87257 m!579297))

(declare-fun m!579299 () Bool)

(assert (=> d!87257 m!579299))

(declare-fun m!579301 () Bool)

(assert (=> d!87257 m!579301))

(assert (=> d!87257 m!579119))

(assert (=> b!601864 m!579291))

(assert (=> b!601864 m!579291))

(assert (=> b!601864 m!579101))

(declare-fun m!579303 () Bool)

(assert (=> b!601864 m!579303))

(assert (=> b!601710 d!87257))

(declare-fun lt!274052 () SeekEntryResult!6226)

(declare-fun d!87259 () Bool)

(assert (=> d!87259 (and (or ((_ is Undefined!6226) lt!274052) (not ((_ is Found!6226) lt!274052)) (and (bvsge (index!27162 lt!274052) #b00000000000000000000000000000000) (bvslt (index!27162 lt!274052) (size!18194 lt!273945)))) (or ((_ is Undefined!6226) lt!274052) ((_ is Found!6226) lt!274052) (not ((_ is MissingVacant!6226) lt!274052)) (not (= (index!27164 lt!274052) vacantSpotIndex!68)) (and (bvsge (index!27164 lt!274052) #b00000000000000000000000000000000) (bvslt (index!27164 lt!274052) (size!18194 lt!273945)))) (or ((_ is Undefined!6226) lt!274052) (ite ((_ is Found!6226) lt!274052) (= (select (arr!17830 lt!273945) (index!27162 lt!274052)) lt!273933) (and ((_ is MissingVacant!6226) lt!274052) (= (index!27164 lt!274052) vacantSpotIndex!68) (= (select (arr!17830 lt!273945) (index!27164 lt!274052)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!344160 () SeekEntryResult!6226)

(assert (=> d!87259 (= lt!274052 e!344160)))

(declare-fun c!68074 () Bool)

(assert (=> d!87259 (= c!68074 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!274051 () (_ BitVec 64))

(assert (=> d!87259 (= lt!274051 (select (arr!17830 lt!273945) index!984))))

(assert (=> d!87259 (validMask!0 mask!3053)))

(assert (=> d!87259 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273933 lt!273945 mask!3053) lt!274052)))

(declare-fun b!601868 () Bool)

(declare-fun e!344159 () SeekEntryResult!6226)

(assert (=> b!601868 (= e!344160 e!344159)))

(declare-fun c!68073 () Bool)

(assert (=> b!601868 (= c!68073 (= lt!274051 lt!273933))))

(declare-fun b!601869 () Bool)

(declare-fun e!344158 () SeekEntryResult!6226)

(assert (=> b!601869 (= e!344158 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!601870 () Bool)

(assert (=> b!601870 (= e!344158 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!273933 lt!273945 mask!3053))))

(declare-fun b!601871 () Bool)

(assert (=> b!601871 (= e!344159 (Found!6226 index!984))))

(declare-fun b!601872 () Bool)

(assert (=> b!601872 (= e!344160 Undefined!6226)))

(declare-fun b!601873 () Bool)

(declare-fun c!68075 () Bool)

(assert (=> b!601873 (= c!68075 (= lt!274051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601873 (= e!344159 e!344158)))

(assert (= (and d!87259 c!68074) b!601872))

(assert (= (and d!87259 (not c!68074)) b!601868))

(assert (= (and b!601868 c!68073) b!601871))

(assert (= (and b!601868 (not c!68073)) b!601873))

(assert (= (and b!601873 c!68075) b!601869))

(assert (= (and b!601873 (not c!68075)) b!601870))

(declare-fun m!579305 () Bool)

(assert (=> d!87259 m!579305))

(declare-fun m!579307 () Bool)

(assert (=> d!87259 m!579307))

(declare-fun m!579309 () Bool)

(assert (=> d!87259 m!579309))

(assert (=> d!87259 m!579119))

(declare-fun m!579311 () Bool)

(assert (=> b!601870 m!579311))

(assert (=> b!601870 m!579311))

(declare-fun m!579313 () Bool)

(assert (=> b!601870 m!579313))

(assert (=> b!601710 d!87259))

(declare-fun b!601884 () Bool)

(declare-fun e!344169 () Bool)

(declare-fun e!344172 () Bool)

(assert (=> b!601884 (= e!344169 e!344172)))

(declare-fun c!68078 () Bool)

(assert (=> b!601884 (= c!68078 (validKeyInArray!0 (select (arr!17830 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87261 () Bool)

(declare-fun res!386466 () Bool)

(declare-fun e!344171 () Bool)

(assert (=> d!87261 (=> res!386466 e!344171)))

(assert (=> d!87261 (= res!386466 (bvsge #b00000000000000000000000000000000 (size!18194 a!2986)))))

(assert (=> d!87261 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11775) e!344171)))

(declare-fun b!601885 () Bool)

(declare-fun call!32973 () Bool)

(assert (=> b!601885 (= e!344172 call!32973)))

(declare-fun b!601886 () Bool)

(assert (=> b!601886 (= e!344172 call!32973)))

(declare-fun bm!32970 () Bool)

(assert (=> bm!32970 (= call!32973 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68078 (Cons!11774 (select (arr!17830 a!2986) #b00000000000000000000000000000000) Nil!11775) Nil!11775)))))

(declare-fun b!601887 () Bool)

(declare-fun e!344170 () Bool)

(declare-fun contains!2962 (List!11778 (_ BitVec 64)) Bool)

(assert (=> b!601887 (= e!344170 (contains!2962 Nil!11775 (select (arr!17830 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601888 () Bool)

(assert (=> b!601888 (= e!344171 e!344169)))

(declare-fun res!386467 () Bool)

(assert (=> b!601888 (=> (not res!386467) (not e!344169))))

(assert (=> b!601888 (= res!386467 (not e!344170))))

(declare-fun res!386465 () Bool)

(assert (=> b!601888 (=> (not res!386465) (not e!344170))))

(assert (=> b!601888 (= res!386465 (validKeyInArray!0 (select (arr!17830 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87261 (not res!386466)) b!601888))

(assert (= (and b!601888 res!386465) b!601887))

(assert (= (and b!601888 res!386467) b!601884))

(assert (= (and b!601884 c!68078) b!601885))

(assert (= (and b!601884 (not c!68078)) b!601886))

(assert (= (or b!601885 b!601886) bm!32970))

(declare-fun m!579315 () Bool)

(assert (=> b!601884 m!579315))

(assert (=> b!601884 m!579315))

(declare-fun m!579317 () Bool)

(assert (=> b!601884 m!579317))

(assert (=> bm!32970 m!579315))

(declare-fun m!579319 () Bool)

(assert (=> bm!32970 m!579319))

(assert (=> b!601887 m!579315))

(assert (=> b!601887 m!579315))

(declare-fun m!579321 () Bool)

(assert (=> b!601887 m!579321))

(assert (=> b!601888 m!579315))

(assert (=> b!601888 m!579315))

(assert (=> b!601888 m!579317))

(assert (=> b!601695 d!87261))

(declare-fun d!87263 () Bool)

(declare-fun res!386472 () Bool)

(declare-fun e!344177 () Bool)

(assert (=> d!87263 (=> res!386472 e!344177)))

(assert (=> d!87263 (= res!386472 (= (select (arr!17830 lt!273945) index!984) (select (arr!17830 a!2986) j!136)))))

(assert (=> d!87263 (= (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) index!984) e!344177)))

(declare-fun b!601893 () Bool)

(declare-fun e!344178 () Bool)

(assert (=> b!601893 (= e!344177 e!344178)))

(declare-fun res!386473 () Bool)

(assert (=> b!601893 (=> (not res!386473) (not e!344178))))

(assert (=> b!601893 (= res!386473 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18194 lt!273945)))))

(declare-fun b!601894 () Bool)

(assert (=> b!601894 (= e!344178 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87263 (not res!386472)) b!601893))

(assert (= (and b!601893 res!386473) b!601894))

(assert (=> d!87263 m!579309))

(assert (=> b!601894 m!579101))

(declare-fun m!579323 () Bool)

(assert (=> b!601894 m!579323))

(assert (=> b!601706 d!87263))

(declare-fun d!87265 () Bool)

(assert (=> d!87265 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601707 d!87265))

(declare-fun d!87267 () Bool)

(declare-fun lt!274061 () SeekEntryResult!6226)

(assert (=> d!87267 (and (or ((_ is Undefined!6226) lt!274061) (not ((_ is Found!6226) lt!274061)) (and (bvsge (index!27162 lt!274061) #b00000000000000000000000000000000) (bvslt (index!27162 lt!274061) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274061) ((_ is Found!6226) lt!274061) (not ((_ is MissingZero!6226) lt!274061)) (and (bvsge (index!27161 lt!274061) #b00000000000000000000000000000000) (bvslt (index!27161 lt!274061) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274061) ((_ is Found!6226) lt!274061) ((_ is MissingZero!6226) lt!274061) (not ((_ is MissingVacant!6226) lt!274061)) (and (bvsge (index!27164 lt!274061) #b00000000000000000000000000000000) (bvslt (index!27164 lt!274061) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274061) (ite ((_ is Found!6226) lt!274061) (= (select (arr!17830 a!2986) (index!27162 lt!274061)) k0!1786) (ite ((_ is MissingZero!6226) lt!274061) (= (select (arr!17830 a!2986) (index!27161 lt!274061)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6226) lt!274061) (= (select (arr!17830 a!2986) (index!27164 lt!274061)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!344197 () SeekEntryResult!6226)

(assert (=> d!87267 (= lt!274061 e!344197)))

(declare-fun c!68085 () Bool)

(declare-fun lt!274059 () SeekEntryResult!6226)

(assert (=> d!87267 (= c!68085 (and ((_ is Intermediate!6226) lt!274059) (undefined!7038 lt!274059)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37146 (_ BitVec 32)) SeekEntryResult!6226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87267 (= lt!274059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87267 (validMask!0 mask!3053)))

(assert (=> d!87267 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!274061)))

(declare-fun b!601919 () Bool)

(declare-fun c!68087 () Bool)

(declare-fun lt!274060 () (_ BitVec 64))

(assert (=> b!601919 (= c!68087 (= lt!274060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344198 () SeekEntryResult!6226)

(declare-fun e!344199 () SeekEntryResult!6226)

(assert (=> b!601919 (= e!344198 e!344199)))

(declare-fun b!601920 () Bool)

(assert (=> b!601920 (= e!344199 (MissingZero!6226 (index!27163 lt!274059)))))

(declare-fun b!601921 () Bool)

(assert (=> b!601921 (= e!344198 (Found!6226 (index!27163 lt!274059)))))

(declare-fun b!601922 () Bool)

(assert (=> b!601922 (= e!344197 e!344198)))

(assert (=> b!601922 (= lt!274060 (select (arr!17830 a!2986) (index!27163 lt!274059)))))

(declare-fun c!68086 () Bool)

(assert (=> b!601922 (= c!68086 (= lt!274060 k0!1786))))

(declare-fun b!601923 () Bool)

(assert (=> b!601923 (= e!344199 (seekKeyOrZeroReturnVacant!0 (x!56108 lt!274059) (index!27163 lt!274059) (index!27163 lt!274059) k0!1786 a!2986 mask!3053))))

(declare-fun b!601924 () Bool)

(assert (=> b!601924 (= e!344197 Undefined!6226)))

(assert (= (and d!87267 c!68085) b!601924))

(assert (= (and d!87267 (not c!68085)) b!601922))

(assert (= (and b!601922 c!68086) b!601921))

(assert (= (and b!601922 (not c!68086)) b!601919))

(assert (= (and b!601919 c!68087) b!601920))

(assert (= (and b!601919 (not c!68087)) b!601923))

(declare-fun m!579333 () Bool)

(assert (=> d!87267 m!579333))

(declare-fun m!579335 () Bool)

(assert (=> d!87267 m!579335))

(declare-fun m!579337 () Bool)

(assert (=> d!87267 m!579337))

(assert (=> d!87267 m!579119))

(declare-fun m!579339 () Bool)

(assert (=> d!87267 m!579339))

(declare-fun m!579341 () Bool)

(assert (=> d!87267 m!579341))

(assert (=> d!87267 m!579339))

(declare-fun m!579343 () Bool)

(assert (=> b!601922 m!579343))

(declare-fun m!579345 () Bool)

(assert (=> b!601923 m!579345))

(assert (=> b!601696 d!87267))

(declare-fun d!87281 () Bool)

(declare-fun res!386486 () Bool)

(declare-fun e!344200 () Bool)

(assert (=> d!87281 (=> res!386486 e!344200)))

(assert (=> d!87281 (= res!386486 (= (select (arr!17830 lt!273945) j!136) (select (arr!17830 a!2986) j!136)))))

(assert (=> d!87281 (= (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) j!136) e!344200)))

(declare-fun b!601925 () Bool)

(declare-fun e!344201 () Bool)

(assert (=> b!601925 (= e!344200 e!344201)))

(declare-fun res!386487 () Bool)

(assert (=> b!601925 (=> (not res!386487) (not e!344201))))

(assert (=> b!601925 (= res!386487 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18194 lt!273945)))))

(declare-fun b!601926 () Bool)

(assert (=> b!601926 (= e!344201 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87281 (not res!386486)) b!601925))

(assert (= (and b!601925 res!386487) b!601926))

(declare-fun m!579347 () Bool)

(assert (=> d!87281 m!579347))

(assert (=> b!601926 m!579101))

(declare-fun m!579349 () Bool)

(assert (=> b!601926 m!579349))

(assert (=> b!601714 d!87281))

(declare-fun b!601965 () Bool)

(declare-fun e!344229 () Bool)

(declare-fun call!32979 () Bool)

(assert (=> b!601965 (= e!344229 call!32979)))

(declare-fun bm!32976 () Bool)

(assert (=> bm!32976 (= call!32979 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!601966 () Bool)

(declare-fun e!344230 () Bool)

(assert (=> b!601966 (= e!344229 e!344230)))

(declare-fun lt!274077 () (_ BitVec 64))

(assert (=> b!601966 (= lt!274077 (select (arr!17830 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!274079 () Unit!19009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37146 (_ BitVec 64) (_ BitVec 32)) Unit!19009)

(assert (=> b!601966 (= lt!274079 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!274077 #b00000000000000000000000000000000))))

(assert (=> b!601966 (arrayContainsKey!0 a!2986 lt!274077 #b00000000000000000000000000000000)))

(declare-fun lt!274078 () Unit!19009)

(assert (=> b!601966 (= lt!274078 lt!274079)))

(declare-fun res!386504 () Bool)

(assert (=> b!601966 (= res!386504 (= (seekEntryOrOpen!0 (select (arr!17830 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6226 #b00000000000000000000000000000000)))))

(assert (=> b!601966 (=> (not res!386504) (not e!344230))))

(declare-fun b!601967 () Bool)

(declare-fun e!344228 () Bool)

(assert (=> b!601967 (= e!344228 e!344229)))

(declare-fun c!68099 () Bool)

(assert (=> b!601967 (= c!68099 (validKeyInArray!0 (select (arr!17830 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87283 () Bool)

(declare-fun res!386503 () Bool)

(assert (=> d!87283 (=> res!386503 e!344228)))

(assert (=> d!87283 (= res!386503 (bvsge #b00000000000000000000000000000000 (size!18194 a!2986)))))

(assert (=> d!87283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!344228)))

(declare-fun b!601964 () Bool)

(assert (=> b!601964 (= e!344230 call!32979)))

(assert (= (and d!87283 (not res!386503)) b!601967))

(assert (= (and b!601967 c!68099) b!601966))

(assert (= (and b!601967 (not c!68099)) b!601965))

(assert (= (and b!601966 res!386504) b!601964))

(assert (= (or b!601964 b!601965) bm!32976))

(declare-fun m!579365 () Bool)

(assert (=> bm!32976 m!579365))

(assert (=> b!601966 m!579315))

(declare-fun m!579367 () Bool)

(assert (=> b!601966 m!579367))

(declare-fun m!579369 () Bool)

(assert (=> b!601966 m!579369))

(assert (=> b!601966 m!579315))

(declare-fun m!579371 () Bool)

(assert (=> b!601966 m!579371))

(assert (=> b!601967 m!579315))

(assert (=> b!601967 m!579315))

(assert (=> b!601967 m!579317))

(assert (=> b!601694 d!87283))

(declare-fun lt!274081 () SeekEntryResult!6226)

(declare-fun d!87291 () Bool)

(assert (=> d!87291 (and (or ((_ is Undefined!6226) lt!274081) (not ((_ is Found!6226) lt!274081)) (and (bvsge (index!27162 lt!274081) #b00000000000000000000000000000000) (bvslt (index!27162 lt!274081) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274081) ((_ is Found!6226) lt!274081) (not ((_ is MissingVacant!6226) lt!274081)) (not (= (index!27164 lt!274081) vacantSpotIndex!68)) (and (bvsge (index!27164 lt!274081) #b00000000000000000000000000000000) (bvslt (index!27164 lt!274081) (size!18194 a!2986)))) (or ((_ is Undefined!6226) lt!274081) (ite ((_ is Found!6226) lt!274081) (= (select (arr!17830 a!2986) (index!27162 lt!274081)) (select (arr!17830 a!2986) j!136)) (and ((_ is MissingVacant!6226) lt!274081) (= (index!27164 lt!274081) vacantSpotIndex!68) (= (select (arr!17830 a!2986) (index!27164 lt!274081)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!344233 () SeekEntryResult!6226)

(assert (=> d!87291 (= lt!274081 e!344233)))

(declare-fun c!68101 () Bool)

(assert (=> d!87291 (= c!68101 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!274080 () (_ BitVec 64))

(assert (=> d!87291 (= lt!274080 (select (arr!17830 a!2986) index!984))))

(assert (=> d!87291 (validMask!0 mask!3053)))

(assert (=> d!87291 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053) lt!274081)))

(declare-fun b!601968 () Bool)

(declare-fun e!344232 () SeekEntryResult!6226)

(assert (=> b!601968 (= e!344233 e!344232)))

(declare-fun c!68100 () Bool)

(assert (=> b!601968 (= c!68100 (= lt!274080 (select (arr!17830 a!2986) j!136)))))

(declare-fun b!601969 () Bool)

(declare-fun e!344231 () SeekEntryResult!6226)

(assert (=> b!601969 (= e!344231 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!601970 () Bool)

(assert (=> b!601970 (= e!344231 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601971 () Bool)

(assert (=> b!601971 (= e!344232 (Found!6226 index!984))))

(declare-fun b!601972 () Bool)

(assert (=> b!601972 (= e!344233 Undefined!6226)))

(declare-fun b!601973 () Bool)

(declare-fun c!68102 () Bool)

(assert (=> b!601973 (= c!68102 (= lt!274080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601973 (= e!344232 e!344231)))

(assert (= (and d!87291 c!68101) b!601972))

(assert (= (and d!87291 (not c!68101)) b!601968))

(assert (= (and b!601968 c!68100) b!601971))

(assert (= (and b!601968 (not c!68100)) b!601973))

(assert (= (and b!601973 c!68102) b!601969))

(assert (= (and b!601973 (not c!68102)) b!601970))

(declare-fun m!579373 () Bool)

(assert (=> d!87291 m!579373))

(declare-fun m!579375 () Bool)

(assert (=> d!87291 m!579375))

(assert (=> d!87291 m!579129))

(assert (=> d!87291 m!579119))

(assert (=> b!601970 m!579311))

(assert (=> b!601970 m!579311))

(assert (=> b!601970 m!579101))

(declare-fun m!579377 () Bool)

(assert (=> b!601970 m!579377))

(assert (=> b!601704 d!87291))

(declare-fun d!87293 () Bool)

(assert (=> d!87293 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18194 lt!273945)) (not (= (select (arr!17830 lt!273945) j!136) (select (arr!17830 a!2986) j!136))))))

(declare-fun lt!274092 () Unit!19009)

(declare-fun choose!21 (array!37146 (_ BitVec 64) (_ BitVec 32) List!11778) Unit!19009)

(assert (=> d!87293 (= lt!274092 (choose!21 lt!273945 (select (arr!17830 a!2986) j!136) j!136 Nil!11775))))

(assert (=> d!87293 (bvslt (size!18194 lt!273945) #b01111111111111111111111111111111)))

(assert (=> d!87293 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273945 (select (arr!17830 a!2986) j!136) j!136 Nil!11775) lt!274092)))

(declare-fun bs!18461 () Bool)

(assert (= bs!18461 d!87293))

(assert (=> bs!18461 m!579347))

(assert (=> bs!18461 m!579101))

(declare-fun m!579395 () Bool)

(assert (=> bs!18461 m!579395))

(assert (=> b!601700 d!87293))

(declare-fun b!601980 () Bool)

(declare-fun e!344237 () Bool)

(declare-fun e!344240 () Bool)

(assert (=> b!601980 (= e!344237 e!344240)))

(declare-fun c!68106 () Bool)

(assert (=> b!601980 (= c!68106 (validKeyInArray!0 (select (arr!17830 lt!273945) j!136)))))

(declare-fun d!87299 () Bool)

(declare-fun res!386506 () Bool)

(declare-fun e!344239 () Bool)

(assert (=> d!87299 (=> res!386506 e!344239)))

(assert (=> d!87299 (= res!386506 (bvsge j!136 (size!18194 lt!273945)))))

(assert (=> d!87299 (= (arrayNoDuplicates!0 lt!273945 j!136 Nil!11775) e!344239)))

(declare-fun b!601981 () Bool)

(declare-fun call!32980 () Bool)

(assert (=> b!601981 (= e!344240 call!32980)))

(declare-fun b!601982 () Bool)

(assert (=> b!601982 (= e!344240 call!32980)))

(declare-fun bm!32977 () Bool)

(assert (=> bm!32977 (= call!32980 (arrayNoDuplicates!0 lt!273945 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68106 (Cons!11774 (select (arr!17830 lt!273945) j!136) Nil!11775) Nil!11775)))))

(declare-fun b!601983 () Bool)

(declare-fun e!344238 () Bool)

(assert (=> b!601983 (= e!344238 (contains!2962 Nil!11775 (select (arr!17830 lt!273945) j!136)))))

(declare-fun b!601984 () Bool)

(assert (=> b!601984 (= e!344239 e!344237)))

(declare-fun res!386507 () Bool)

(assert (=> b!601984 (=> (not res!386507) (not e!344237))))

(assert (=> b!601984 (= res!386507 (not e!344238))))

(declare-fun res!386505 () Bool)

(assert (=> b!601984 (=> (not res!386505) (not e!344238))))

(assert (=> b!601984 (= res!386505 (validKeyInArray!0 (select (arr!17830 lt!273945) j!136)))))

(assert (= (and d!87299 (not res!386506)) b!601984))

(assert (= (and b!601984 res!386505) b!601983))

(assert (= (and b!601984 res!386507) b!601980))

(assert (= (and b!601980 c!68106) b!601981))

(assert (= (and b!601980 (not c!68106)) b!601982))

(assert (= (or b!601981 b!601982) bm!32977))

(assert (=> b!601980 m!579347))

(assert (=> b!601980 m!579347))

(declare-fun m!579401 () Bool)

(assert (=> b!601980 m!579401))

(assert (=> bm!32977 m!579347))

(declare-fun m!579403 () Bool)

(assert (=> bm!32977 m!579403))

(assert (=> b!601983 m!579347))

(assert (=> b!601983 m!579347))

(declare-fun m!579405 () Bool)

(assert (=> b!601983 m!579405))

(assert (=> b!601984 m!579347))

(assert (=> b!601984 m!579347))

(assert (=> b!601984 m!579401))

(assert (=> b!601700 d!87299))

(declare-fun b!601990 () Bool)

(declare-fun e!344245 () Bool)

(declare-fun e!344248 () Bool)

(assert (=> b!601990 (= e!344245 e!344248)))

(declare-fun c!68108 () Bool)

(assert (=> b!601990 (= c!68108 (validKeyInArray!0 (select (arr!17830 lt!273945) #b00000000000000000000000000000000)))))

(declare-fun d!87303 () Bool)

(declare-fun res!386512 () Bool)

(declare-fun e!344247 () Bool)

(assert (=> d!87303 (=> res!386512 e!344247)))

(assert (=> d!87303 (= res!386512 (bvsge #b00000000000000000000000000000000 (size!18194 lt!273945)))))

(assert (=> d!87303 (= (arrayNoDuplicates!0 lt!273945 #b00000000000000000000000000000000 Nil!11775) e!344247)))

(declare-fun b!601991 () Bool)

(declare-fun call!32982 () Bool)

(assert (=> b!601991 (= e!344248 call!32982)))

(declare-fun b!601992 () Bool)

(assert (=> b!601992 (= e!344248 call!32982)))

(declare-fun bm!32979 () Bool)

(assert (=> bm!32979 (= call!32982 (arrayNoDuplicates!0 lt!273945 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68108 (Cons!11774 (select (arr!17830 lt!273945) #b00000000000000000000000000000000) Nil!11775) Nil!11775)))))

(declare-fun b!601993 () Bool)

(declare-fun e!344246 () Bool)

(assert (=> b!601993 (= e!344246 (contains!2962 Nil!11775 (select (arr!17830 lt!273945) #b00000000000000000000000000000000)))))

(declare-fun b!601994 () Bool)

(assert (=> b!601994 (= e!344247 e!344245)))

(declare-fun res!386513 () Bool)

(assert (=> b!601994 (=> (not res!386513) (not e!344245))))

(assert (=> b!601994 (= res!386513 (not e!344246))))

(declare-fun res!386511 () Bool)

(assert (=> b!601994 (=> (not res!386511) (not e!344246))))

(assert (=> b!601994 (= res!386511 (validKeyInArray!0 (select (arr!17830 lt!273945) #b00000000000000000000000000000000)))))

(assert (= (and d!87303 (not res!386512)) b!601994))

(assert (= (and b!601994 res!386511) b!601993))

(assert (= (and b!601994 res!386513) b!601990))

(assert (= (and b!601990 c!68108) b!601991))

(assert (= (and b!601990 (not c!68108)) b!601992))

(assert (= (or b!601991 b!601992) bm!32979))

(declare-fun m!579413 () Bool)

(assert (=> b!601990 m!579413))

(assert (=> b!601990 m!579413))

(declare-fun m!579415 () Bool)

(assert (=> b!601990 m!579415))

(assert (=> bm!32979 m!579413))

(declare-fun m!579417 () Bool)

(assert (=> bm!32979 m!579417))

(assert (=> b!601993 m!579413))

(assert (=> b!601993 m!579413))

(declare-fun m!579419 () Bool)

(assert (=> b!601993 m!579419))

(assert (=> b!601994 m!579413))

(assert (=> b!601994 m!579413))

(assert (=> b!601994 m!579415))

(assert (=> b!601700 d!87303))

(declare-fun d!87307 () Bool)

(assert (=> d!87307 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274096 () Unit!19009)

(declare-fun choose!114 (array!37146 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> d!87307 (= lt!274096 (choose!114 lt!273945 (select (arr!17830 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87307 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87307 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273945 (select (arr!17830 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274096)))

(declare-fun bs!18463 () Bool)

(assert (= bs!18463 d!87307))

(assert (=> bs!18463 m!579101))

(assert (=> bs!18463 m!579153))

(assert (=> bs!18463 m!579101))

(declare-fun m!579421 () Bool)

(assert (=> bs!18463 m!579421))

(assert (=> b!601700 d!87307))

(declare-fun d!87309 () Bool)

(declare-fun res!386514 () Bool)

(declare-fun e!344249 () Bool)

(assert (=> d!87309 (=> res!386514 e!344249)))

(assert (=> d!87309 (= res!386514 (= (select (arr!17830 lt!273945) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17830 a!2986) j!136)))))

(assert (=> d!87309 (= (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344249)))

(declare-fun b!601995 () Bool)

(declare-fun e!344250 () Bool)

(assert (=> b!601995 (= e!344249 e!344250)))

(declare-fun res!386515 () Bool)

(assert (=> b!601995 (=> (not res!386515) (not e!344250))))

(assert (=> b!601995 (= res!386515 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18194 lt!273945)))))

(declare-fun b!601996 () Bool)

(assert (=> b!601996 (= e!344250 (arrayContainsKey!0 lt!273945 (select (arr!17830 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87309 (not res!386514)) b!601995))

(assert (= (and b!601995 res!386515) b!601996))

(declare-fun m!579423 () Bool)

(assert (=> d!87309 m!579423))

(assert (=> b!601996 m!579101))

(declare-fun m!579425 () Bool)

(assert (=> b!601996 m!579425))

(assert (=> b!601700 d!87309))

(declare-fun d!87311 () Bool)

(declare-fun e!344261 () Bool)

(assert (=> d!87311 e!344261))

(declare-fun res!386523 () Bool)

(assert (=> d!87311 (=> (not res!386523) (not e!344261))))

(assert (=> d!87311 (= res!386523 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18194 a!2986))))))

(declare-fun lt!274106 () Unit!19009)

(declare-fun choose!41 (array!37146 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11778) Unit!19009)

(assert (=> d!87311 (= lt!274106 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11775))))

(assert (=> d!87311 (bvslt (size!18194 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87311 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11775) lt!274106)))

(declare-fun b!602012 () Bool)

(assert (=> b!602012 (= e!344261 (arrayNoDuplicates!0 (array!37147 (store (arr!17830 a!2986) i!1108 k0!1786) (size!18194 a!2986)) #b00000000000000000000000000000000 Nil!11775))))

(assert (= (and d!87311 res!386523) b!602012))

(declare-fun m!579435 () Bool)

(assert (=> d!87311 m!579435))

(assert (=> b!602012 m!579109))

(declare-fun m!579437 () Bool)

(assert (=> b!602012 m!579437))

(assert (=> b!601700 d!87311))

(declare-fun d!87317 () Bool)

(assert (=> d!87317 (arrayNoDuplicates!0 lt!273945 j!136 Nil!11775)))

(declare-fun lt!274109 () Unit!19009)

(declare-fun choose!39 (array!37146 (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> d!87317 (= lt!274109 (choose!39 lt!273945 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87317 (bvslt (size!18194 lt!273945) #b01111111111111111111111111111111)))

(assert (=> d!87317 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!273945 #b00000000000000000000000000000000 j!136) lt!274109)))

(declare-fun bs!18464 () Bool)

(assert (= bs!18464 d!87317))

(assert (=> bs!18464 m!579149))

(declare-fun m!579439 () Bool)

(assert (=> bs!18464 m!579439))

(assert (=> b!601700 d!87317))

(declare-fun d!87319 () Bool)

(declare-fun res!386524 () Bool)

(declare-fun e!344265 () Bool)

(assert (=> d!87319 (=> res!386524 e!344265)))

(assert (=> d!87319 (= res!386524 (= (select (arr!17830 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87319 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!344265)))

(declare-fun b!602017 () Bool)

(declare-fun e!344266 () Bool)

(assert (=> b!602017 (= e!344265 e!344266)))

(declare-fun res!386525 () Bool)

(assert (=> b!602017 (=> (not res!386525) (not e!344266))))

(assert (=> b!602017 (= res!386525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18194 a!2986)))))

(declare-fun b!602018 () Bool)

(assert (=> b!602018 (= e!344266 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87319 (not res!386524)) b!602017))

(assert (= (and b!602017 res!386525) b!602018))

(assert (=> d!87319 m!579315))

(declare-fun m!579441 () Bool)

(assert (=> b!602018 m!579441))

(assert (=> b!601702 d!87319))

(declare-fun d!87321 () Bool)

(assert (=> d!87321 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54966 d!87321))

(declare-fun d!87327 () Bool)

(assert (=> d!87327 (= (array_inv!13689 a!2986) (bvsge (size!18194 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54966 d!87327))

(check-sat (not d!87311) (not b!601923) (not b!601858) (not b!601843) (not d!87257) (not bm!32976) (not d!87307) (not b!601984) (not b!601870) (not b!601884) (not d!87293) (not b!601983) (not bm!32977) (not b!602012) (not d!87259) (not b!601993) (not b!601888) (not d!87291) (not b!601970) (not d!87267) (not b!601980) (not b!601887) (not bm!32970) (not b!601864) (not b!601996) (not d!87317) (not b!601990) (not d!87251) (not b!601966) (not b!602018) (not b!601994) (not b!601926) (not d!87255) (not b!601967) (not b!601894) (not bm!32979) (not d!87253))
(check-sat)
