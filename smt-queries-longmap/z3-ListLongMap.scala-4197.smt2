; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57274 () Bool)

(assert start!57274)

(declare-fun b!634134 () Bool)

(declare-fun res!410221 () Bool)

(declare-fun e!362616 () Bool)

(assert (=> b!634134 (=> (not res!410221) (not e!362616))))

(declare-datatypes ((array!38184 0))(
  ( (array!38185 (arr!18322 (Array (_ BitVec 32) (_ BitVec 64))) (size!18686 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38184)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38184 (_ BitVec 32)) Bool)

(assert (=> b!634134 (= res!410221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634135 () Bool)

(declare-fun e!362608 () Bool)

(declare-fun e!362607 () Bool)

(assert (=> b!634135 (= e!362608 (not e!362607))))

(declare-fun res!410212 () Bool)

(assert (=> b!634135 (=> res!410212 e!362607)))

(declare-datatypes ((SeekEntryResult!6762 0))(
  ( (MissingZero!6762 (index!29347 (_ BitVec 32))) (Found!6762 (index!29348 (_ BitVec 32))) (Intermediate!6762 (undefined!7574 Bool) (index!29349 (_ BitVec 32)) (x!58087 (_ BitVec 32))) (Undefined!6762) (MissingVacant!6762 (index!29350 (_ BitVec 32))) )
))
(declare-fun lt!293155 () SeekEntryResult!6762)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634135 (= res!410212 (not (= lt!293155 (Found!6762 index!984))))))

(declare-datatypes ((Unit!21382 0))(
  ( (Unit!21383) )
))
(declare-fun lt!293152 () Unit!21382)

(declare-fun e!362609 () Unit!21382)

(assert (=> b!634135 (= lt!293152 e!362609)))

(declare-fun c!72329 () Bool)

(assert (=> b!634135 (= c!72329 (= lt!293155 Undefined!6762))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!293153 () (_ BitVec 64))

(declare-fun lt!293156 () array!38184)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38184 (_ BitVec 32)) SeekEntryResult!6762)

(assert (=> b!634135 (= lt!293155 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293153 lt!293156 mask!3053))))

(declare-fun e!362615 () Bool)

(assert (=> b!634135 e!362615))

(declare-fun res!410219 () Bool)

(assert (=> b!634135 (=> (not res!410219) (not e!362615))))

(declare-fun lt!293157 () SeekEntryResult!6762)

(declare-fun lt!293161 () (_ BitVec 32))

(assert (=> b!634135 (= res!410219 (= lt!293157 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 lt!293153 lt!293156 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!634135 (= lt!293157 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!634135 (= lt!293153 (select (store (arr!18322 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293158 () Unit!21382)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38184 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21382)

(assert (=> b!634135 (= lt!293158 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634135 (= lt!293161 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634136 () Bool)

(declare-fun lt!293154 () (_ BitVec 64))

(assert (=> b!634136 (= e!362607 (or (not (= (select (arr!18322 a!2986) j!136) lt!293153)) (not (= (select (arr!18322 a!2986) j!136) lt!293154)) (bvsge j!136 index!984) (bvsge index!984 (size!18686 a!2986)) (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (size!18686 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!362612 () Bool)

(assert (=> b!634136 e!362612))

(declare-fun res!410210 () Bool)

(assert (=> b!634136 (=> (not res!410210) (not e!362612))))

(assert (=> b!634136 (= res!410210 (= lt!293154 (select (arr!18322 a!2986) j!136)))))

(assert (=> b!634136 (= lt!293154 (select (store (arr!18322 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634137 () Bool)

(declare-fun lt!293159 () SeekEntryResult!6762)

(assert (=> b!634137 (= e!362615 (= lt!293159 lt!293157))))

(declare-fun b!634138 () Bool)

(declare-fun res!410218 () Bool)

(assert (=> b!634138 (=> (not res!410218) (not e!362616))))

(assert (=> b!634138 (= res!410218 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18322 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634139 () Bool)

(declare-fun res!410225 () Bool)

(declare-fun e!362611 () Bool)

(assert (=> b!634139 (=> (not res!410225) (not e!362611))))

(assert (=> b!634139 (= res!410225 (and (= (size!18686 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18686 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18686 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634140 () Bool)

(declare-fun e!362610 () Bool)

(assert (=> b!634140 (= e!362612 e!362610)))

(declare-fun res!410220 () Bool)

(assert (=> b!634140 (=> res!410220 e!362610)))

(assert (=> b!634140 (= res!410220 (or (not (= (select (arr!18322 a!2986) j!136) lt!293153)) (not (= (select (arr!18322 a!2986) j!136) lt!293154)) (bvsge j!136 index!984)))))

(declare-fun b!634141 () Bool)

(declare-fun e!362613 () Bool)

(assert (=> b!634141 (= e!362616 e!362613)))

(declare-fun res!410222 () Bool)

(assert (=> b!634141 (=> (not res!410222) (not e!362613))))

(assert (=> b!634141 (= res!410222 (= (select (store (arr!18322 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634141 (= lt!293156 (array!38185 (store (arr!18322 a!2986) i!1108 k0!1786) (size!18686 a!2986)))))

(declare-fun b!634142 () Bool)

(declare-fun res!410211 () Bool)

(assert (=> b!634142 (=> (not res!410211) (not e!362611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634142 (= res!410211 (validKeyInArray!0 k0!1786))))

(declare-fun b!634143 () Bool)

(declare-fun Unit!21384 () Unit!21382)

(assert (=> b!634143 (= e!362609 Unit!21384)))

(assert (=> b!634143 false))

(declare-fun b!634144 () Bool)

(assert (=> b!634144 (= e!362611 e!362616)))

(declare-fun res!410217 () Bool)

(assert (=> b!634144 (=> (not res!410217) (not e!362616))))

(declare-fun lt!293160 () SeekEntryResult!6762)

(assert (=> b!634144 (= res!410217 (or (= lt!293160 (MissingZero!6762 i!1108)) (= lt!293160 (MissingVacant!6762 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38184 (_ BitVec 32)) SeekEntryResult!6762)

(assert (=> b!634144 (= lt!293160 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634145 () Bool)

(declare-fun e!362606 () Bool)

(assert (=> b!634145 (= e!362610 e!362606)))

(declare-fun res!410216 () Bool)

(assert (=> b!634145 (=> (not res!410216) (not e!362606))))

(declare-fun arrayContainsKey!0 (array!38184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634145 (= res!410216 (arrayContainsKey!0 lt!293156 (select (arr!18322 a!2986) j!136) j!136))))

(declare-fun b!634146 () Bool)

(declare-fun res!410214 () Bool)

(assert (=> b!634146 (=> (not res!410214) (not e!362616))))

(declare-datatypes ((List!12363 0))(
  ( (Nil!12360) (Cons!12359 (h!13404 (_ BitVec 64)) (t!18591 List!12363)) )
))
(declare-fun arrayNoDuplicates!0 (array!38184 (_ BitVec 32) List!12363) Bool)

(assert (=> b!634146 (= res!410214 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12360))))

(declare-fun b!634148 () Bool)

(declare-fun res!410213 () Bool)

(assert (=> b!634148 (=> (not res!410213) (not e!362611))))

(assert (=> b!634148 (= res!410213 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634149 () Bool)

(assert (=> b!634149 (= e!362606 (arrayContainsKey!0 lt!293156 (select (arr!18322 a!2986) j!136) index!984))))

(declare-fun b!634150 () Bool)

(assert (=> b!634150 (= e!362613 e!362608)))

(declare-fun res!410223 () Bool)

(assert (=> b!634150 (=> (not res!410223) (not e!362608))))

(assert (=> b!634150 (= res!410223 (and (= lt!293159 (Found!6762 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18322 a!2986) index!984) (select (arr!18322 a!2986) j!136))) (not (= (select (arr!18322 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634150 (= lt!293159 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634151 () Bool)

(declare-fun res!410224 () Bool)

(assert (=> b!634151 (=> (not res!410224) (not e!362611))))

(assert (=> b!634151 (= res!410224 (validKeyInArray!0 (select (arr!18322 a!2986) j!136)))))

(declare-fun res!410215 () Bool)

(assert (=> start!57274 (=> (not res!410215) (not e!362611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57274 (= res!410215 (validMask!0 mask!3053))))

(assert (=> start!57274 e!362611))

(assert (=> start!57274 true))

(declare-fun array_inv!14118 (array!38184) Bool)

(assert (=> start!57274 (array_inv!14118 a!2986)))

(declare-fun b!634147 () Bool)

(declare-fun Unit!21385 () Unit!21382)

(assert (=> b!634147 (= e!362609 Unit!21385)))

(assert (= (and start!57274 res!410215) b!634139))

(assert (= (and b!634139 res!410225) b!634151))

(assert (= (and b!634151 res!410224) b!634142))

(assert (= (and b!634142 res!410211) b!634148))

(assert (= (and b!634148 res!410213) b!634144))

(assert (= (and b!634144 res!410217) b!634134))

(assert (= (and b!634134 res!410221) b!634146))

(assert (= (and b!634146 res!410214) b!634138))

(assert (= (and b!634138 res!410218) b!634141))

(assert (= (and b!634141 res!410222) b!634150))

(assert (= (and b!634150 res!410223) b!634135))

(assert (= (and b!634135 res!410219) b!634137))

(assert (= (and b!634135 c!72329) b!634143))

(assert (= (and b!634135 (not c!72329)) b!634147))

(assert (= (and b!634135 (not res!410212)) b!634136))

(assert (= (and b!634136 res!410210) b!634140))

(assert (= (and b!634140 (not res!410220)) b!634145))

(assert (= (and b!634145 res!410216) b!634149))

(declare-fun m!608685 () Bool)

(assert (=> b!634150 m!608685))

(declare-fun m!608687 () Bool)

(assert (=> b!634150 m!608687))

(assert (=> b!634150 m!608687))

(declare-fun m!608689 () Bool)

(assert (=> b!634150 m!608689))

(declare-fun m!608691 () Bool)

(assert (=> start!57274 m!608691))

(declare-fun m!608693 () Bool)

(assert (=> start!57274 m!608693))

(declare-fun m!608695 () Bool)

(assert (=> b!634134 m!608695))

(assert (=> b!634136 m!608687))

(declare-fun m!608697 () Bool)

(assert (=> b!634136 m!608697))

(declare-fun m!608699 () Bool)

(assert (=> b!634136 m!608699))

(assert (=> b!634151 m!608687))

(assert (=> b!634151 m!608687))

(declare-fun m!608701 () Bool)

(assert (=> b!634151 m!608701))

(declare-fun m!608703 () Bool)

(assert (=> b!634135 m!608703))

(declare-fun m!608705 () Bool)

(assert (=> b!634135 m!608705))

(declare-fun m!608707 () Bool)

(assert (=> b!634135 m!608707))

(assert (=> b!634135 m!608687))

(assert (=> b!634135 m!608687))

(declare-fun m!608709 () Bool)

(assert (=> b!634135 m!608709))

(assert (=> b!634135 m!608697))

(declare-fun m!608711 () Bool)

(assert (=> b!634135 m!608711))

(declare-fun m!608713 () Bool)

(assert (=> b!634135 m!608713))

(declare-fun m!608715 () Bool)

(assert (=> b!634142 m!608715))

(assert (=> b!634145 m!608687))

(assert (=> b!634145 m!608687))

(declare-fun m!608717 () Bool)

(assert (=> b!634145 m!608717))

(declare-fun m!608719 () Bool)

(assert (=> b!634138 m!608719))

(declare-fun m!608721 () Bool)

(assert (=> b!634144 m!608721))

(declare-fun m!608723 () Bool)

(assert (=> b!634148 m!608723))

(declare-fun m!608725 () Bool)

(assert (=> b!634146 m!608725))

(assert (=> b!634149 m!608687))

(assert (=> b!634149 m!608687))

(declare-fun m!608727 () Bool)

(assert (=> b!634149 m!608727))

(assert (=> b!634141 m!608697))

(declare-fun m!608729 () Bool)

(assert (=> b!634141 m!608729))

(assert (=> b!634140 m!608687))

(check-sat (not b!634142) (not b!634146) (not b!634148) (not b!634134) (not b!634144) (not b!634145) (not b!634150) (not b!634149) (not b!634151) (not start!57274) (not b!634135))
(check-sat)
(get-model)

(declare-fun d!89605 () Bool)

(declare-fun res!410278 () Bool)

(declare-fun e!362654 () Bool)

(assert (=> d!89605 (=> res!410278 e!362654)))

(assert (=> d!89605 (= res!410278 (= (select (arr!18322 lt!293156) j!136) (select (arr!18322 a!2986) j!136)))))

(assert (=> d!89605 (= (arrayContainsKey!0 lt!293156 (select (arr!18322 a!2986) j!136) j!136) e!362654)))

(declare-fun b!634210 () Bool)

(declare-fun e!362655 () Bool)

(assert (=> b!634210 (= e!362654 e!362655)))

(declare-fun res!410279 () Bool)

(assert (=> b!634210 (=> (not res!410279) (not e!362655))))

(assert (=> b!634210 (= res!410279 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18686 lt!293156)))))

(declare-fun b!634211 () Bool)

(assert (=> b!634211 (= e!362655 (arrayContainsKey!0 lt!293156 (select (arr!18322 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89605 (not res!410278)) b!634210))

(assert (= (and b!634210 res!410279) b!634211))

(declare-fun m!608777 () Bool)

(assert (=> d!89605 m!608777))

(assert (=> b!634211 m!608687))

(declare-fun m!608779 () Bool)

(assert (=> b!634211 m!608779))

(assert (=> b!634145 d!89605))

(declare-fun e!362664 () SeekEntryResult!6762)

(declare-fun b!634224 () Bool)

(assert (=> b!634224 (= e!362664 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634225 () Bool)

(declare-fun e!362662 () SeekEntryResult!6762)

(assert (=> b!634225 (= e!362662 Undefined!6762)))

(declare-fun b!634226 () Bool)

(declare-fun e!362663 () SeekEntryResult!6762)

(assert (=> b!634226 (= e!362663 (Found!6762 index!984))))

(declare-fun b!634227 () Bool)

(assert (=> b!634227 (= e!362662 e!362663)))

(declare-fun lt!293196 () (_ BitVec 64))

(declare-fun c!72339 () Bool)

(assert (=> b!634227 (= c!72339 (= lt!293196 (select (arr!18322 a!2986) j!136)))))

(declare-fun b!634228 () Bool)

(declare-fun c!72341 () Bool)

(assert (=> b!634228 (= c!72341 (= lt!293196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634228 (= e!362663 e!362664)))

(declare-fun lt!293197 () SeekEntryResult!6762)

(declare-fun d!89607 () Bool)

(get-info :version)

(assert (=> d!89607 (and (or ((_ is Undefined!6762) lt!293197) (not ((_ is Found!6762) lt!293197)) (and (bvsge (index!29348 lt!293197) #b00000000000000000000000000000000) (bvslt (index!29348 lt!293197) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293197) ((_ is Found!6762) lt!293197) (not ((_ is MissingVacant!6762) lt!293197)) (not (= (index!29350 lt!293197) vacantSpotIndex!68)) (and (bvsge (index!29350 lt!293197) #b00000000000000000000000000000000) (bvslt (index!29350 lt!293197) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293197) (ite ((_ is Found!6762) lt!293197) (= (select (arr!18322 a!2986) (index!29348 lt!293197)) (select (arr!18322 a!2986) j!136)) (and ((_ is MissingVacant!6762) lt!293197) (= (index!29350 lt!293197) vacantSpotIndex!68) (= (select (arr!18322 a!2986) (index!29350 lt!293197)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89607 (= lt!293197 e!362662)))

(declare-fun c!72340 () Bool)

(assert (=> d!89607 (= c!72340 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89607 (= lt!293196 (select (arr!18322 a!2986) index!984))))

(assert (=> d!89607 (validMask!0 mask!3053)))

(assert (=> d!89607 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053) lt!293197)))

(declare-fun b!634229 () Bool)

(assert (=> b!634229 (= e!362664 (MissingVacant!6762 vacantSpotIndex!68))))

(assert (= (and d!89607 c!72340) b!634225))

(assert (= (and d!89607 (not c!72340)) b!634227))

(assert (= (and b!634227 c!72339) b!634226))

(assert (= (and b!634227 (not c!72339)) b!634228))

(assert (= (and b!634228 c!72341) b!634229))

(assert (= (and b!634228 (not c!72341)) b!634224))

(assert (=> b!634224 m!608705))

(assert (=> b!634224 m!608705))

(assert (=> b!634224 m!608687))

(declare-fun m!608781 () Bool)

(assert (=> b!634224 m!608781))

(declare-fun m!608783 () Bool)

(assert (=> d!89607 m!608783))

(declare-fun m!608785 () Bool)

(assert (=> d!89607 m!608785))

(assert (=> d!89607 m!608685))

(assert (=> d!89607 m!608691))

(assert (=> b!634150 d!89607))

(declare-fun bm!33377 () Bool)

(declare-fun call!33380 () Bool)

(assert (=> bm!33377 (= call!33380 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!634238 () Bool)

(declare-fun e!362671 () Bool)

(assert (=> b!634238 (= e!362671 call!33380)))

(declare-fun b!634239 () Bool)

(declare-fun e!362672 () Bool)

(assert (=> b!634239 (= e!362672 e!362671)))

(declare-fun lt!293205 () (_ BitVec 64))

(assert (=> b!634239 (= lt!293205 (select (arr!18322 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293204 () Unit!21382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38184 (_ BitVec 64) (_ BitVec 32)) Unit!21382)

(assert (=> b!634239 (= lt!293204 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293205 #b00000000000000000000000000000000))))

(assert (=> b!634239 (arrayContainsKey!0 a!2986 lt!293205 #b00000000000000000000000000000000)))

(declare-fun lt!293206 () Unit!21382)

(assert (=> b!634239 (= lt!293206 lt!293204)))

(declare-fun res!410285 () Bool)

(assert (=> b!634239 (= res!410285 (= (seekEntryOrOpen!0 (select (arr!18322 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6762 #b00000000000000000000000000000000)))))

(assert (=> b!634239 (=> (not res!410285) (not e!362671))))

(declare-fun b!634240 () Bool)

(assert (=> b!634240 (= e!362672 call!33380)))

(declare-fun d!89609 () Bool)

(declare-fun res!410284 () Bool)

(declare-fun e!362673 () Bool)

(assert (=> d!89609 (=> res!410284 e!362673)))

(assert (=> d!89609 (= res!410284 (bvsge #b00000000000000000000000000000000 (size!18686 a!2986)))))

(assert (=> d!89609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!362673)))

(declare-fun b!634241 () Bool)

(assert (=> b!634241 (= e!362673 e!362672)))

(declare-fun c!72344 () Bool)

(assert (=> b!634241 (= c!72344 (validKeyInArray!0 (select (arr!18322 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89609 (not res!410284)) b!634241))

(assert (= (and b!634241 c!72344) b!634239))

(assert (= (and b!634241 (not c!72344)) b!634240))

(assert (= (and b!634239 res!410285) b!634238))

(assert (= (or b!634238 b!634240) bm!33377))

(declare-fun m!608787 () Bool)

(assert (=> bm!33377 m!608787))

(declare-fun m!608789 () Bool)

(assert (=> b!634239 m!608789))

(declare-fun m!608791 () Bool)

(assert (=> b!634239 m!608791))

(declare-fun m!608793 () Bool)

(assert (=> b!634239 m!608793))

(assert (=> b!634239 m!608789))

(declare-fun m!608795 () Bool)

(assert (=> b!634239 m!608795))

(assert (=> b!634241 m!608789))

(assert (=> b!634241 m!608789))

(declare-fun m!608797 () Bool)

(assert (=> b!634241 m!608797))

(assert (=> b!634134 d!89609))

(declare-fun d!89611 () Bool)

(declare-fun lt!293214 () SeekEntryResult!6762)

(assert (=> d!89611 (and (or ((_ is Undefined!6762) lt!293214) (not ((_ is Found!6762) lt!293214)) (and (bvsge (index!29348 lt!293214) #b00000000000000000000000000000000) (bvslt (index!29348 lt!293214) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293214) ((_ is Found!6762) lt!293214) (not ((_ is MissingZero!6762) lt!293214)) (and (bvsge (index!29347 lt!293214) #b00000000000000000000000000000000) (bvslt (index!29347 lt!293214) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293214) ((_ is Found!6762) lt!293214) ((_ is MissingZero!6762) lt!293214) (not ((_ is MissingVacant!6762) lt!293214)) (and (bvsge (index!29350 lt!293214) #b00000000000000000000000000000000) (bvslt (index!29350 lt!293214) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293214) (ite ((_ is Found!6762) lt!293214) (= (select (arr!18322 a!2986) (index!29348 lt!293214)) k0!1786) (ite ((_ is MissingZero!6762) lt!293214) (= (select (arr!18322 a!2986) (index!29347 lt!293214)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6762) lt!293214) (= (select (arr!18322 a!2986) (index!29350 lt!293214)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!362681 () SeekEntryResult!6762)

(assert (=> d!89611 (= lt!293214 e!362681)))

(declare-fun c!72353 () Bool)

(declare-fun lt!293215 () SeekEntryResult!6762)

(assert (=> d!89611 (= c!72353 (and ((_ is Intermediate!6762) lt!293215) (undefined!7574 lt!293215)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38184 (_ BitVec 32)) SeekEntryResult!6762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89611 (= lt!293215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89611 (validMask!0 mask!3053)))

(assert (=> d!89611 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!293214)))

(declare-fun b!634254 () Bool)

(assert (=> b!634254 (= e!362681 Undefined!6762)))

(declare-fun b!634255 () Bool)

(declare-fun c!72352 () Bool)

(declare-fun lt!293213 () (_ BitVec 64))

(assert (=> b!634255 (= c!72352 (= lt!293213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362682 () SeekEntryResult!6762)

(declare-fun e!362680 () SeekEntryResult!6762)

(assert (=> b!634255 (= e!362682 e!362680)))

(declare-fun b!634256 () Bool)

(assert (=> b!634256 (= e!362681 e!362682)))

(assert (=> b!634256 (= lt!293213 (select (arr!18322 a!2986) (index!29349 lt!293215)))))

(declare-fun c!72351 () Bool)

(assert (=> b!634256 (= c!72351 (= lt!293213 k0!1786))))

(declare-fun b!634257 () Bool)

(assert (=> b!634257 (= e!362682 (Found!6762 (index!29349 lt!293215)))))

(declare-fun b!634258 () Bool)

(assert (=> b!634258 (= e!362680 (seekKeyOrZeroReturnVacant!0 (x!58087 lt!293215) (index!29349 lt!293215) (index!29349 lt!293215) k0!1786 a!2986 mask!3053))))

(declare-fun b!634259 () Bool)

(assert (=> b!634259 (= e!362680 (MissingZero!6762 (index!29349 lt!293215)))))

(assert (= (and d!89611 c!72353) b!634254))

(assert (= (and d!89611 (not c!72353)) b!634256))

(assert (= (and b!634256 c!72351) b!634257))

(assert (= (and b!634256 (not c!72351)) b!634255))

(assert (= (and b!634255 c!72352) b!634259))

(assert (= (and b!634255 (not c!72352)) b!634258))

(assert (=> d!89611 m!608691))

(declare-fun m!608799 () Bool)

(assert (=> d!89611 m!608799))

(declare-fun m!608801 () Bool)

(assert (=> d!89611 m!608801))

(declare-fun m!608803 () Bool)

(assert (=> d!89611 m!608803))

(declare-fun m!608805 () Bool)

(assert (=> d!89611 m!608805))

(declare-fun m!608807 () Bool)

(assert (=> d!89611 m!608807))

(assert (=> d!89611 m!608803))

(declare-fun m!608809 () Bool)

(assert (=> b!634256 m!608809))

(declare-fun m!608811 () Bool)

(assert (=> b!634258 m!608811))

(assert (=> b!634144 d!89611))

(declare-fun d!89613 () Bool)

(declare-fun res!410286 () Bool)

(declare-fun e!362683 () Bool)

(assert (=> d!89613 (=> res!410286 e!362683)))

(assert (=> d!89613 (= res!410286 (= (select (arr!18322 lt!293156) index!984) (select (arr!18322 a!2986) j!136)))))

(assert (=> d!89613 (= (arrayContainsKey!0 lt!293156 (select (arr!18322 a!2986) j!136) index!984) e!362683)))

(declare-fun b!634260 () Bool)

(declare-fun e!362684 () Bool)

(assert (=> b!634260 (= e!362683 e!362684)))

(declare-fun res!410287 () Bool)

(assert (=> b!634260 (=> (not res!410287) (not e!362684))))

(assert (=> b!634260 (= res!410287 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18686 lt!293156)))))

(declare-fun b!634261 () Bool)

(assert (=> b!634261 (= e!362684 (arrayContainsKey!0 lt!293156 (select (arr!18322 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89613 (not res!410286)) b!634260))

(assert (= (and b!634260 res!410287) b!634261))

(declare-fun m!608813 () Bool)

(assert (=> d!89613 m!608813))

(assert (=> b!634261 m!608687))

(declare-fun m!608815 () Bool)

(assert (=> b!634261 m!608815))

(assert (=> b!634149 d!89613))

(declare-fun d!89615 () Bool)

(assert (=> d!89615 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57274 d!89615))

(declare-fun d!89625 () Bool)

(assert (=> d!89625 (= (array_inv!14118 a!2986) (bvsge (size!18686 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57274 d!89625))

(declare-fun d!89627 () Bool)

(declare-fun res!410298 () Bool)

(declare-fun e!362697 () Bool)

(assert (=> d!89627 (=> res!410298 e!362697)))

(assert (=> d!89627 (= res!410298 (= (select (arr!18322 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89627 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!362697)))

(declare-fun b!634276 () Bool)

(declare-fun e!362698 () Bool)

(assert (=> b!634276 (= e!362697 e!362698)))

(declare-fun res!410299 () Bool)

(assert (=> b!634276 (=> (not res!410299) (not e!362698))))

(assert (=> b!634276 (= res!410299 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18686 a!2986)))))

(declare-fun b!634277 () Bool)

(assert (=> b!634277 (= e!362698 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89627 (not res!410298)) b!634276))

(assert (= (and b!634276 res!410299) b!634277))

(assert (=> d!89627 m!608789))

(declare-fun m!608821 () Bool)

(assert (=> b!634277 m!608821))

(assert (=> b!634148 d!89627))

(declare-fun d!89629 () Bool)

(assert (=> d!89629 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634142 d!89629))

(declare-fun b!634302 () Bool)

(declare-fun e!362718 () Bool)

(declare-fun e!362720 () Bool)

(assert (=> b!634302 (= e!362718 e!362720)))

(declare-fun res!410316 () Bool)

(assert (=> b!634302 (=> (not res!410316) (not e!362720))))

(declare-fun e!362721 () Bool)

(assert (=> b!634302 (= res!410316 (not e!362721))))

(declare-fun res!410314 () Bool)

(assert (=> b!634302 (=> (not res!410314) (not e!362721))))

(assert (=> b!634302 (= res!410314 (validKeyInArray!0 (select (arr!18322 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89631 () Bool)

(declare-fun res!410315 () Bool)

(assert (=> d!89631 (=> res!410315 e!362718)))

(assert (=> d!89631 (= res!410315 (bvsge #b00000000000000000000000000000000 (size!18686 a!2986)))))

(assert (=> d!89631 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12360) e!362718)))

(declare-fun b!634303 () Bool)

(declare-fun e!362719 () Bool)

(assert (=> b!634303 (= e!362720 e!362719)))

(declare-fun c!72361 () Bool)

(assert (=> b!634303 (= c!72361 (validKeyInArray!0 (select (arr!18322 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33385 () Bool)

(declare-fun call!33388 () Bool)

(assert (=> bm!33385 (= call!33388 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72361 (Cons!12359 (select (arr!18322 a!2986) #b00000000000000000000000000000000) Nil!12360) Nil!12360)))))

(declare-fun b!634304 () Bool)

(declare-fun contains!3094 (List!12363 (_ BitVec 64)) Bool)

(assert (=> b!634304 (= e!362721 (contains!3094 Nil!12360 (select (arr!18322 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634305 () Bool)

(assert (=> b!634305 (= e!362719 call!33388)))

(declare-fun b!634306 () Bool)

(assert (=> b!634306 (= e!362719 call!33388)))

(assert (= (and d!89631 (not res!410315)) b!634302))

(assert (= (and b!634302 res!410314) b!634304))

(assert (= (and b!634302 res!410316) b!634303))

(assert (= (and b!634303 c!72361) b!634305))

(assert (= (and b!634303 (not c!72361)) b!634306))

(assert (= (or b!634305 b!634306) bm!33385))

(assert (=> b!634302 m!608789))

(assert (=> b!634302 m!608789))

(assert (=> b!634302 m!608797))

(assert (=> b!634303 m!608789))

(assert (=> b!634303 m!608789))

(assert (=> b!634303 m!608797))

(assert (=> bm!33385 m!608789))

(declare-fun m!608835 () Bool)

(assert (=> bm!33385 m!608835))

(assert (=> b!634304 m!608789))

(assert (=> b!634304 m!608789))

(declare-fun m!608837 () Bool)

(assert (=> b!634304 m!608837))

(assert (=> b!634146 d!89631))

(declare-fun d!89639 () Bool)

(declare-fun e!362739 () Bool)

(assert (=> d!89639 e!362739))

(declare-fun res!410322 () Bool)

(assert (=> d!89639 (=> (not res!410322) (not e!362739))))

(assert (=> d!89639 (= res!410322 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18686 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18686 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18686 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18686 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18686 a!2986))))))

(declare-fun lt!293237 () Unit!21382)

(declare-fun choose!9 (array!38184 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21382)

(assert (=> d!89639 (= lt!293237 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89639 (validMask!0 mask!3053)))

(assert (=> d!89639 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 mask!3053) lt!293237)))

(declare-fun b!634337 () Bool)

(assert (=> b!634337 (= e!362739 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 (select (store (arr!18322 a!2986) i!1108 k0!1786) j!136) (array!38185 (store (arr!18322 a!2986) i!1108 k0!1786) (size!18686 a!2986)) mask!3053)))))

(assert (= (and d!89639 res!410322) b!634337))

(declare-fun m!608843 () Bool)

(assert (=> d!89639 m!608843))

(assert (=> d!89639 m!608691))

(assert (=> b!634337 m!608687))

(assert (=> b!634337 m!608709))

(assert (=> b!634337 m!608687))

(assert (=> b!634337 m!608697))

(assert (=> b!634337 m!608707))

(assert (=> b!634337 m!608707))

(declare-fun m!608845 () Bool)

(assert (=> b!634337 m!608845))

(assert (=> b!634135 d!89639))

(declare-fun e!362743 () SeekEntryResult!6762)

(declare-fun b!634339 () Bool)

(assert (=> b!634339 (= e!362743 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293161 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634340 () Bool)

(declare-fun e!362741 () SeekEntryResult!6762)

(assert (=> b!634340 (= e!362741 Undefined!6762)))

(declare-fun b!634341 () Bool)

(declare-fun e!362742 () SeekEntryResult!6762)

(assert (=> b!634341 (= e!362742 (Found!6762 lt!293161))))

(declare-fun b!634342 () Bool)

(assert (=> b!634342 (= e!362741 e!362742)))

(declare-fun lt!293238 () (_ BitVec 64))

(declare-fun c!72375 () Bool)

(assert (=> b!634342 (= c!72375 (= lt!293238 (select (arr!18322 a!2986) j!136)))))

(declare-fun b!634343 () Bool)

(declare-fun c!72377 () Bool)

(assert (=> b!634343 (= c!72377 (= lt!293238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634343 (= e!362742 e!362743)))

(declare-fun lt!293239 () SeekEntryResult!6762)

(declare-fun d!89643 () Bool)

(assert (=> d!89643 (and (or ((_ is Undefined!6762) lt!293239) (not ((_ is Found!6762) lt!293239)) (and (bvsge (index!29348 lt!293239) #b00000000000000000000000000000000) (bvslt (index!29348 lt!293239) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293239) ((_ is Found!6762) lt!293239) (not ((_ is MissingVacant!6762) lt!293239)) (not (= (index!29350 lt!293239) vacantSpotIndex!68)) (and (bvsge (index!29350 lt!293239) #b00000000000000000000000000000000) (bvslt (index!29350 lt!293239) (size!18686 a!2986)))) (or ((_ is Undefined!6762) lt!293239) (ite ((_ is Found!6762) lt!293239) (= (select (arr!18322 a!2986) (index!29348 lt!293239)) (select (arr!18322 a!2986) j!136)) (and ((_ is MissingVacant!6762) lt!293239) (= (index!29350 lt!293239) vacantSpotIndex!68) (= (select (arr!18322 a!2986) (index!29350 lt!293239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89643 (= lt!293239 e!362741)))

(declare-fun c!72376 () Bool)

(assert (=> d!89643 (= c!72376 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89643 (= lt!293238 (select (arr!18322 a!2986) lt!293161))))

(assert (=> d!89643 (validMask!0 mask!3053)))

(assert (=> d!89643 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053) lt!293239)))

(declare-fun b!634344 () Bool)

(assert (=> b!634344 (= e!362743 (MissingVacant!6762 vacantSpotIndex!68))))

(assert (= (and d!89643 c!72376) b!634340))

(assert (= (and d!89643 (not c!72376)) b!634342))

(assert (= (and b!634342 c!72375) b!634341))

(assert (= (and b!634342 (not c!72375)) b!634343))

(assert (= (and b!634343 c!72377) b!634344))

(assert (= (and b!634343 (not c!72377)) b!634339))

(declare-fun m!608847 () Bool)

(assert (=> b!634339 m!608847))

(assert (=> b!634339 m!608847))

(assert (=> b!634339 m!608687))

(declare-fun m!608849 () Bool)

(assert (=> b!634339 m!608849))

(declare-fun m!608851 () Bool)

(assert (=> d!89643 m!608851))

(declare-fun m!608853 () Bool)

(assert (=> d!89643 m!608853))

(declare-fun m!608855 () Bool)

(assert (=> d!89643 m!608855))

(assert (=> d!89643 m!608691))

(assert (=> b!634135 d!89643))

(declare-fun e!362749 () SeekEntryResult!6762)

(declare-fun b!634351 () Bool)

(assert (=> b!634351 (= e!362749 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293161 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293153 lt!293156 mask!3053))))

(declare-fun b!634352 () Bool)

(declare-fun e!362747 () SeekEntryResult!6762)

(assert (=> b!634352 (= e!362747 Undefined!6762)))

(declare-fun b!634353 () Bool)

(declare-fun e!362748 () SeekEntryResult!6762)

(assert (=> b!634353 (= e!362748 (Found!6762 lt!293161))))

(declare-fun b!634354 () Bool)

(assert (=> b!634354 (= e!362747 e!362748)))

(declare-fun c!72381 () Bool)

(declare-fun lt!293243 () (_ BitVec 64))

(assert (=> b!634354 (= c!72381 (= lt!293243 lt!293153))))

(declare-fun b!634355 () Bool)

(declare-fun c!72383 () Bool)

(assert (=> b!634355 (= c!72383 (= lt!293243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634355 (= e!362748 e!362749)))

(declare-fun d!89645 () Bool)

(declare-fun lt!293244 () SeekEntryResult!6762)

(assert (=> d!89645 (and (or ((_ is Undefined!6762) lt!293244) (not ((_ is Found!6762) lt!293244)) (and (bvsge (index!29348 lt!293244) #b00000000000000000000000000000000) (bvslt (index!29348 lt!293244) (size!18686 lt!293156)))) (or ((_ is Undefined!6762) lt!293244) ((_ is Found!6762) lt!293244) (not ((_ is MissingVacant!6762) lt!293244)) (not (= (index!29350 lt!293244) vacantSpotIndex!68)) (and (bvsge (index!29350 lt!293244) #b00000000000000000000000000000000) (bvslt (index!29350 lt!293244) (size!18686 lt!293156)))) (or ((_ is Undefined!6762) lt!293244) (ite ((_ is Found!6762) lt!293244) (= (select (arr!18322 lt!293156) (index!29348 lt!293244)) lt!293153) (and ((_ is MissingVacant!6762) lt!293244) (= (index!29350 lt!293244) vacantSpotIndex!68) (= (select (arr!18322 lt!293156) (index!29350 lt!293244)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89645 (= lt!293244 e!362747)))

(declare-fun c!72382 () Bool)

(assert (=> d!89645 (= c!72382 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89645 (= lt!293243 (select (arr!18322 lt!293156) lt!293161))))

(assert (=> d!89645 (validMask!0 mask!3053)))

(assert (=> d!89645 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293161 vacantSpotIndex!68 lt!293153 lt!293156 mask!3053) lt!293244)))

(declare-fun b!634356 () Bool)

(assert (=> b!634356 (= e!362749 (MissingVacant!6762 vacantSpotIndex!68))))

(assert (= (and d!89645 c!72382) b!634352))

(assert (= (and d!89645 (not c!72382)) b!634354))

(assert (= (and b!634354 c!72381) b!634353))

(assert (= (and b!634354 (not c!72381)) b!634355))

(assert (= (and b!634355 c!72383) b!634356))

(assert (= (and b!634355 (not c!72383)) b!634351))

(assert (=> b!634351 m!608847))

(assert (=> b!634351 m!608847))

(declare-fun m!608871 () Bool)

(assert (=> b!634351 m!608871))

(declare-fun m!608873 () Bool)

(assert (=> d!89645 m!608873))

(declare-fun m!608875 () Bool)

(assert (=> d!89645 m!608875))

(declare-fun m!608877 () Bool)

(assert (=> d!89645 m!608877))

(assert (=> d!89645 m!608691))

(assert (=> b!634135 d!89645))

(declare-fun e!362752 () SeekEntryResult!6762)

(declare-fun b!634357 () Bool)

(assert (=> b!634357 (= e!362752 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!293153 lt!293156 mask!3053))))

(declare-fun b!634358 () Bool)

(declare-fun e!362750 () SeekEntryResult!6762)

(assert (=> b!634358 (= e!362750 Undefined!6762)))

(declare-fun b!634359 () Bool)

(declare-fun e!362751 () SeekEntryResult!6762)

(assert (=> b!634359 (= e!362751 (Found!6762 index!984))))

(declare-fun b!634360 () Bool)

(assert (=> b!634360 (= e!362750 e!362751)))

(declare-fun c!72384 () Bool)

(declare-fun lt!293245 () (_ BitVec 64))

(assert (=> b!634360 (= c!72384 (= lt!293245 lt!293153))))

(declare-fun b!634361 () Bool)

(declare-fun c!72386 () Bool)

(assert (=> b!634361 (= c!72386 (= lt!293245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634361 (= e!362751 e!362752)))

(declare-fun lt!293246 () SeekEntryResult!6762)

(declare-fun d!89649 () Bool)

(assert (=> d!89649 (and (or ((_ is Undefined!6762) lt!293246) (not ((_ is Found!6762) lt!293246)) (and (bvsge (index!29348 lt!293246) #b00000000000000000000000000000000) (bvslt (index!29348 lt!293246) (size!18686 lt!293156)))) (or ((_ is Undefined!6762) lt!293246) ((_ is Found!6762) lt!293246) (not ((_ is MissingVacant!6762) lt!293246)) (not (= (index!29350 lt!293246) vacantSpotIndex!68)) (and (bvsge (index!29350 lt!293246) #b00000000000000000000000000000000) (bvslt (index!29350 lt!293246) (size!18686 lt!293156)))) (or ((_ is Undefined!6762) lt!293246) (ite ((_ is Found!6762) lt!293246) (= (select (arr!18322 lt!293156) (index!29348 lt!293246)) lt!293153) (and ((_ is MissingVacant!6762) lt!293246) (= (index!29350 lt!293246) vacantSpotIndex!68) (= (select (arr!18322 lt!293156) (index!29350 lt!293246)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89649 (= lt!293246 e!362750)))

(declare-fun c!72385 () Bool)

(assert (=> d!89649 (= c!72385 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89649 (= lt!293245 (select (arr!18322 lt!293156) index!984))))

(assert (=> d!89649 (validMask!0 mask!3053)))

(assert (=> d!89649 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293153 lt!293156 mask!3053) lt!293246)))

(declare-fun b!634362 () Bool)

(assert (=> b!634362 (= e!362752 (MissingVacant!6762 vacantSpotIndex!68))))

(assert (= (and d!89649 c!72385) b!634358))

(assert (= (and d!89649 (not c!72385)) b!634360))

(assert (= (and b!634360 c!72384) b!634359))

(assert (= (and b!634360 (not c!72384)) b!634361))

(assert (= (and b!634361 c!72386) b!634362))

(assert (= (and b!634361 (not c!72386)) b!634357))

(assert (=> b!634357 m!608705))

(assert (=> b!634357 m!608705))

(declare-fun m!608879 () Bool)

(assert (=> b!634357 m!608879))

(declare-fun m!608881 () Bool)

(assert (=> d!89649 m!608881))

(declare-fun m!608883 () Bool)

(assert (=> d!89649 m!608883))

(assert (=> d!89649 m!608813))

(assert (=> d!89649 m!608691))

(assert (=> b!634135 d!89649))

(declare-fun d!89651 () Bool)

(declare-fun lt!293251 () (_ BitVec 32))

(assert (=> d!89651 (and (bvsge lt!293251 #b00000000000000000000000000000000) (bvslt lt!293251 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89651 (= lt!293251 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89651 (validMask!0 mask!3053)))

(assert (=> d!89651 (= (nextIndex!0 index!984 x!910 mask!3053) lt!293251)))

(declare-fun bs!19075 () Bool)

(assert (= bs!19075 d!89651))

(declare-fun m!608895 () Bool)

(assert (=> bs!19075 m!608895))

(assert (=> bs!19075 m!608691))

(assert (=> b!634135 d!89651))

(declare-fun d!89655 () Bool)

(assert (=> d!89655 (= (validKeyInArray!0 (select (arr!18322 a!2986) j!136)) (and (not (= (select (arr!18322 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18322 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634151 d!89655))

(check-sat (not b!634277) (not d!89645) (not d!89639) (not b!634337) (not b!634351) (not b!634339) (not b!634239) (not d!89607) (not b!634357) (not b!634302) (not d!89611) (not bm!33385) (not d!89651) (not b!634258) (not b!634211) (not d!89643) (not b!634304) (not b!634241) (not b!634261) (not b!634303) (not d!89649) (not bm!33377) (not b!634224))
(check-sat)
