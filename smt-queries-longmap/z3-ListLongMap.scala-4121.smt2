; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56226 () Bool)

(assert start!56226)

(declare-fun res!401920 () Bool)

(declare-fun e!357675 () Bool)

(assert (=> start!56226 (=> (not res!401920) (not e!357675))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56226 (= res!401920 (validMask!0 mask!3053))))

(assert (=> start!56226 e!357675))

(assert (=> start!56226 true))

(declare-datatypes ((array!37696 0))(
  ( (array!37697 (arr!18094 (Array (_ BitVec 32) (_ BitVec 64))) (size!18458 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37696)

(declare-fun array_inv!13890 (array!37696) Bool)

(assert (=> start!56226 (array_inv!13890 a!2986)))

(declare-fun b!623588 () Bool)

(declare-fun res!401922 () Bool)

(declare-fun e!357673 () Bool)

(assert (=> b!623588 (=> (not res!401922) (not e!357673))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623588 (= res!401922 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18094 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18094 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623589 () Bool)

(declare-fun res!401919 () Bool)

(assert (=> b!623589 (=> (not res!401919) (not e!357675))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!623589 (= res!401919 (and (= (size!18458 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18458 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18458 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623590 () Bool)

(assert (=> b!623590 (= e!357675 e!357673)))

(declare-fun res!401924 () Bool)

(assert (=> b!623590 (=> (not res!401924) (not e!357673))))

(declare-datatypes ((SeekEntryResult!6534 0))(
  ( (MissingZero!6534 (index!28420 (_ BitVec 32))) (Found!6534 (index!28421 (_ BitVec 32))) (Intermediate!6534 (undefined!7346 Bool) (index!28422 (_ BitVec 32)) (x!57182 (_ BitVec 32))) (Undefined!6534) (MissingVacant!6534 (index!28423 (_ BitVec 32))) )
))
(declare-fun lt!289303 () SeekEntryResult!6534)

(assert (=> b!623590 (= res!401924 (or (= lt!289303 (MissingZero!6534 i!1108)) (= lt!289303 (MissingVacant!6534 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37696 (_ BitVec 32)) SeekEntryResult!6534)

(assert (=> b!623590 (= lt!289303 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623591 () Bool)

(declare-fun res!401923 () Bool)

(assert (=> b!623591 (=> (not res!401923) (not e!357675))))

(declare-fun arrayContainsKey!0 (array!37696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623591 (= res!401923 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623592 () Bool)

(declare-fun res!401927 () Bool)

(assert (=> b!623592 (=> (not res!401927) (not e!357673))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37696 (_ BitVec 32)) SeekEntryResult!6534)

(assert (=> b!623592 (= res!401927 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18094 a!2986) j!136) a!2986 mask!3053) (Found!6534 j!136)))))

(declare-fun b!623593 () Bool)

(declare-fun res!401921 () Bool)

(assert (=> b!623593 (=> (not res!401921) (not e!357673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37696 (_ BitVec 32)) Bool)

(assert (=> b!623593 (= res!401921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623594 () Bool)

(declare-fun res!401925 () Bool)

(assert (=> b!623594 (=> (not res!401925) (not e!357675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623594 (= res!401925 (validKeyInArray!0 k0!1786))))

(declare-fun b!623595 () Bool)

(assert (=> b!623595 (= e!357673 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18094 a!2986) index!984) (select (arr!18094 a!2986) j!136)) (not (= index!984 j!136))))))

(declare-fun b!623596 () Bool)

(declare-fun res!401926 () Bool)

(assert (=> b!623596 (=> (not res!401926) (not e!357673))))

(declare-datatypes ((List!12135 0))(
  ( (Nil!12132) (Cons!12131 (h!13176 (_ BitVec 64)) (t!18363 List!12135)) )
))
(declare-fun arrayNoDuplicates!0 (array!37696 (_ BitVec 32) List!12135) Bool)

(assert (=> b!623596 (= res!401926 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12132))))

(declare-fun b!623597 () Bool)

(declare-fun res!401918 () Bool)

(assert (=> b!623597 (=> (not res!401918) (not e!357675))))

(assert (=> b!623597 (= res!401918 (validKeyInArray!0 (select (arr!18094 a!2986) j!136)))))

(assert (= (and start!56226 res!401920) b!623589))

(assert (= (and b!623589 res!401919) b!623597))

(assert (= (and b!623597 res!401918) b!623594))

(assert (= (and b!623594 res!401925) b!623591))

(assert (= (and b!623591 res!401923) b!623590))

(assert (= (and b!623590 res!401924) b!623593))

(assert (= (and b!623593 res!401921) b!623596))

(assert (= (and b!623596 res!401926) b!623588))

(assert (= (and b!623588 res!401922) b!623592))

(assert (= (and b!623592 res!401927) b!623595))

(declare-fun m!599445 () Bool)

(assert (=> b!623597 m!599445))

(assert (=> b!623597 m!599445))

(declare-fun m!599447 () Bool)

(assert (=> b!623597 m!599447))

(declare-fun m!599449 () Bool)

(assert (=> b!623591 m!599449))

(assert (=> b!623592 m!599445))

(assert (=> b!623592 m!599445))

(declare-fun m!599451 () Bool)

(assert (=> b!623592 m!599451))

(declare-fun m!599453 () Bool)

(assert (=> b!623593 m!599453))

(declare-fun m!599455 () Bool)

(assert (=> b!623588 m!599455))

(declare-fun m!599457 () Bool)

(assert (=> b!623588 m!599457))

(declare-fun m!599459 () Bool)

(assert (=> b!623588 m!599459))

(declare-fun m!599461 () Bool)

(assert (=> b!623590 m!599461))

(declare-fun m!599463 () Bool)

(assert (=> b!623594 m!599463))

(declare-fun m!599465 () Bool)

(assert (=> start!56226 m!599465))

(declare-fun m!599467 () Bool)

(assert (=> start!56226 m!599467))

(declare-fun m!599469 () Bool)

(assert (=> b!623596 m!599469))

(declare-fun m!599471 () Bool)

(assert (=> b!623595 m!599471))

(assert (=> b!623595 m!599445))

(check-sat (not b!623593) (not b!623592) (not start!56226) (not b!623590) (not b!623596) (not b!623597) (not b!623594) (not b!623591))
(check-sat)
(get-model)

(declare-fun d!88683 () Bool)

(declare-fun lt!289314 () SeekEntryResult!6534)

(get-info :version)

(assert (=> d!88683 (and (or ((_ is Undefined!6534) lt!289314) (not ((_ is Found!6534) lt!289314)) (and (bvsge (index!28421 lt!289314) #b00000000000000000000000000000000) (bvslt (index!28421 lt!289314) (size!18458 a!2986)))) (or ((_ is Undefined!6534) lt!289314) ((_ is Found!6534) lt!289314) (not ((_ is MissingZero!6534) lt!289314)) (and (bvsge (index!28420 lt!289314) #b00000000000000000000000000000000) (bvslt (index!28420 lt!289314) (size!18458 a!2986)))) (or ((_ is Undefined!6534) lt!289314) ((_ is Found!6534) lt!289314) ((_ is MissingZero!6534) lt!289314) (not ((_ is MissingVacant!6534) lt!289314)) (and (bvsge (index!28423 lt!289314) #b00000000000000000000000000000000) (bvslt (index!28423 lt!289314) (size!18458 a!2986)))) (or ((_ is Undefined!6534) lt!289314) (ite ((_ is Found!6534) lt!289314) (= (select (arr!18094 a!2986) (index!28421 lt!289314)) k0!1786) (ite ((_ is MissingZero!6534) lt!289314) (= (select (arr!18094 a!2986) (index!28420 lt!289314)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6534) lt!289314) (= (select (arr!18094 a!2986) (index!28423 lt!289314)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!357692 () SeekEntryResult!6534)

(assert (=> d!88683 (= lt!289314 e!357692)))

(declare-fun c!71210 () Bool)

(declare-fun lt!289313 () SeekEntryResult!6534)

(assert (=> d!88683 (= c!71210 (and ((_ is Intermediate!6534) lt!289313) (undefined!7346 lt!289313)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37696 (_ BitVec 32)) SeekEntryResult!6534)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88683 (= lt!289313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88683 (validMask!0 mask!3053)))

(assert (=> d!88683 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289314)))

(declare-fun b!623640 () Bool)

(declare-fun e!357693 () SeekEntryResult!6534)

(assert (=> b!623640 (= e!357692 e!357693)))

(declare-fun lt!289315 () (_ BitVec 64))

(assert (=> b!623640 (= lt!289315 (select (arr!18094 a!2986) (index!28422 lt!289313)))))

(declare-fun c!71209 () Bool)

(assert (=> b!623640 (= c!71209 (= lt!289315 k0!1786))))

(declare-fun b!623641 () Bool)

(declare-fun c!71208 () Bool)

(assert (=> b!623641 (= c!71208 (= lt!289315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!357691 () SeekEntryResult!6534)

(assert (=> b!623641 (= e!357693 e!357691)))

(declare-fun b!623642 () Bool)

(assert (=> b!623642 (= e!357691 (MissingZero!6534 (index!28422 lt!289313)))))

(declare-fun b!623643 () Bool)

(assert (=> b!623643 (= e!357692 Undefined!6534)))

(declare-fun b!623644 () Bool)

(assert (=> b!623644 (= e!357693 (Found!6534 (index!28422 lt!289313)))))

(declare-fun b!623645 () Bool)

(assert (=> b!623645 (= e!357691 (seekKeyOrZeroReturnVacant!0 (x!57182 lt!289313) (index!28422 lt!289313) (index!28422 lt!289313) k0!1786 a!2986 mask!3053))))

(assert (= (and d!88683 c!71210) b!623643))

(assert (= (and d!88683 (not c!71210)) b!623640))

(assert (= (and b!623640 c!71209) b!623644))

(assert (= (and b!623640 (not c!71209)) b!623641))

(assert (= (and b!623641 c!71208) b!623642))

(assert (= (and b!623641 (not c!71208)) b!623645))

(declare-fun m!599501 () Bool)

(assert (=> d!88683 m!599501))

(assert (=> d!88683 m!599465))

(declare-fun m!599503 () Bool)

(assert (=> d!88683 m!599503))

(declare-fun m!599505 () Bool)

(assert (=> d!88683 m!599505))

(declare-fun m!599507 () Bool)

(assert (=> d!88683 m!599507))

(declare-fun m!599509 () Bool)

(assert (=> d!88683 m!599509))

(assert (=> d!88683 m!599507))

(declare-fun m!599511 () Bool)

(assert (=> b!623640 m!599511))

(declare-fun m!599513 () Bool)

(assert (=> b!623645 m!599513))

(assert (=> b!623590 d!88683))

(declare-fun d!88687 () Bool)

(assert (=> d!88687 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623594 d!88687))

(declare-fun d!88689 () Bool)

(assert (=> d!88689 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56226 d!88689))

(declare-fun d!88695 () Bool)

(assert (=> d!88695 (= (array_inv!13890 a!2986) (bvsge (size!18458 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56226 d!88695))

(declare-fun b!623710 () Bool)

(declare-fun e!357737 () SeekEntryResult!6534)

(assert (=> b!623710 (= e!357737 (Found!6534 index!984))))

(declare-fun b!623711 () Bool)

(declare-fun c!71236 () Bool)

(declare-fun lt!289345 () (_ BitVec 64))

(assert (=> b!623711 (= c!71236 (= lt!289345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!357736 () SeekEntryResult!6534)

(assert (=> b!623711 (= e!357737 e!357736)))

(declare-fun b!623712 () Bool)

(declare-fun e!357735 () SeekEntryResult!6534)

(assert (=> b!623712 (= e!357735 Undefined!6534)))

(declare-fun d!88697 () Bool)

(declare-fun lt!289344 () SeekEntryResult!6534)

(assert (=> d!88697 (and (or ((_ is Undefined!6534) lt!289344) (not ((_ is Found!6534) lt!289344)) (and (bvsge (index!28421 lt!289344) #b00000000000000000000000000000000) (bvslt (index!28421 lt!289344) (size!18458 a!2986)))) (or ((_ is Undefined!6534) lt!289344) ((_ is Found!6534) lt!289344) (not ((_ is MissingVacant!6534) lt!289344)) (not (= (index!28423 lt!289344) vacantSpotIndex!68)) (and (bvsge (index!28423 lt!289344) #b00000000000000000000000000000000) (bvslt (index!28423 lt!289344) (size!18458 a!2986)))) (or ((_ is Undefined!6534) lt!289344) (ite ((_ is Found!6534) lt!289344) (= (select (arr!18094 a!2986) (index!28421 lt!289344)) (select (arr!18094 a!2986) j!136)) (and ((_ is MissingVacant!6534) lt!289344) (= (index!28423 lt!289344) vacantSpotIndex!68) (= (select (arr!18094 a!2986) (index!28423 lt!289344)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88697 (= lt!289344 e!357735)))

(declare-fun c!71234 () Bool)

(assert (=> d!88697 (= c!71234 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88697 (= lt!289345 (select (arr!18094 a!2986) index!984))))

(assert (=> d!88697 (validMask!0 mask!3053)))

(assert (=> d!88697 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18094 a!2986) j!136) a!2986 mask!3053) lt!289344)))

(declare-fun b!623713 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623713 (= e!357736 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18094 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623714 () Bool)

(assert (=> b!623714 (= e!357736 (MissingVacant!6534 vacantSpotIndex!68))))

(declare-fun b!623715 () Bool)

(assert (=> b!623715 (= e!357735 e!357737)))

(declare-fun c!71235 () Bool)

(assert (=> b!623715 (= c!71235 (= lt!289345 (select (arr!18094 a!2986) j!136)))))

(assert (= (and d!88697 c!71234) b!623712))

(assert (= (and d!88697 (not c!71234)) b!623715))

(assert (= (and b!623715 c!71235) b!623710))

(assert (= (and b!623715 (not c!71235)) b!623711))

(assert (= (and b!623711 c!71236) b!623714))

(assert (= (and b!623711 (not c!71236)) b!623713))

(declare-fun m!599547 () Bool)

(assert (=> d!88697 m!599547))

(declare-fun m!599549 () Bool)

(assert (=> d!88697 m!599549))

(assert (=> d!88697 m!599471))

(assert (=> d!88697 m!599465))

(declare-fun m!599551 () Bool)

(assert (=> b!623713 m!599551))

(assert (=> b!623713 m!599551))

(assert (=> b!623713 m!599445))

(declare-fun m!599553 () Bool)

(assert (=> b!623713 m!599553))

(assert (=> b!623592 d!88697))

(declare-fun b!623735 () Bool)

(declare-fun e!357754 () Bool)

(declare-fun e!357756 () Bool)

(assert (=> b!623735 (= e!357754 e!357756)))

(declare-fun c!71240 () Bool)

(assert (=> b!623735 (= c!71240 (validKeyInArray!0 (select (arr!18094 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623737 () Bool)

(declare-fun e!357755 () Bool)

(declare-fun call!33194 () Bool)

(assert (=> b!623737 (= e!357755 call!33194)))

(declare-fun b!623738 () Bool)

(assert (=> b!623738 (= e!357756 e!357755)))

(declare-fun lt!289352 () (_ BitVec 64))

(assert (=> b!623738 (= lt!289352 (select (arr!18094 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21060 0))(
  ( (Unit!21061) )
))
(declare-fun lt!289353 () Unit!21060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37696 (_ BitVec 64) (_ BitVec 32)) Unit!21060)

(assert (=> b!623738 (= lt!289353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289352 #b00000000000000000000000000000000))))

(assert (=> b!623738 (arrayContainsKey!0 a!2986 lt!289352 #b00000000000000000000000000000000)))

(declare-fun lt!289354 () Unit!21060)

(assert (=> b!623738 (= lt!289354 lt!289353)))

(declare-fun res!401990 () Bool)

(assert (=> b!623738 (= res!401990 (= (seekEntryOrOpen!0 (select (arr!18094 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6534 #b00000000000000000000000000000000)))))

(assert (=> b!623738 (=> (not res!401990) (not e!357755))))

(declare-fun bm!33191 () Bool)

(assert (=> bm!33191 (= call!33194 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!88711 () Bool)

(declare-fun res!401989 () Bool)

(assert (=> d!88711 (=> res!401989 e!357754)))

(assert (=> d!88711 (= res!401989 (bvsge #b00000000000000000000000000000000 (size!18458 a!2986)))))

(assert (=> d!88711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!357754)))

(declare-fun b!623736 () Bool)

(assert (=> b!623736 (= e!357756 call!33194)))

(assert (= (and d!88711 (not res!401989)) b!623735))

(assert (= (and b!623735 c!71240) b!623738))

(assert (= (and b!623735 (not c!71240)) b!623736))

(assert (= (and b!623738 res!401990) b!623737))

(assert (= (or b!623737 b!623736) bm!33191))

(declare-fun m!599561 () Bool)

(assert (=> b!623735 m!599561))

(assert (=> b!623735 m!599561))

(declare-fun m!599563 () Bool)

(assert (=> b!623735 m!599563))

(assert (=> b!623738 m!599561))

(declare-fun m!599565 () Bool)

(assert (=> b!623738 m!599565))

(declare-fun m!599567 () Bool)

(assert (=> b!623738 m!599567))

(assert (=> b!623738 m!599561))

(declare-fun m!599569 () Bool)

(assert (=> b!623738 m!599569))

(declare-fun m!599571 () Bool)

(assert (=> bm!33191 m!599571))

(assert (=> b!623593 d!88711))

(declare-fun d!88719 () Bool)

(declare-fun res!401999 () Bool)

(declare-fun e!357771 () Bool)

(assert (=> d!88719 (=> res!401999 e!357771)))

(assert (=> d!88719 (= res!401999 (bvsge #b00000000000000000000000000000000 (size!18458 a!2986)))))

(assert (=> d!88719 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12132) e!357771)))

(declare-fun b!623761 () Bool)

(declare-fun e!357772 () Bool)

(declare-fun call!33197 () Bool)

(assert (=> b!623761 (= e!357772 call!33197)))

(declare-fun b!623762 () Bool)

(declare-fun e!357773 () Bool)

(assert (=> b!623762 (= e!357773 e!357772)))

(declare-fun c!71249 () Bool)

(assert (=> b!623762 (= c!71249 (validKeyInArray!0 (select (arr!18094 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623763 () Bool)

(declare-fun e!357774 () Bool)

(declare-fun contains!3072 (List!12135 (_ BitVec 64)) Bool)

(assert (=> b!623763 (= e!357774 (contains!3072 Nil!12132 (select (arr!18094 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623764 () Bool)

(assert (=> b!623764 (= e!357772 call!33197)))

(declare-fun b!623765 () Bool)

(assert (=> b!623765 (= e!357771 e!357773)))

(declare-fun res!401998 () Bool)

(assert (=> b!623765 (=> (not res!401998) (not e!357773))))

(assert (=> b!623765 (= res!401998 (not e!357774))))

(declare-fun res!401997 () Bool)

(assert (=> b!623765 (=> (not res!401997) (not e!357774))))

(assert (=> b!623765 (= res!401997 (validKeyInArray!0 (select (arr!18094 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33194 () Bool)

(assert (=> bm!33194 (= call!33197 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71249 (Cons!12131 (select (arr!18094 a!2986) #b00000000000000000000000000000000) Nil!12132) Nil!12132)))))

(assert (= (and d!88719 (not res!401999)) b!623765))

(assert (= (and b!623765 res!401997) b!623763))

(assert (= (and b!623765 res!401998) b!623762))

(assert (= (and b!623762 c!71249) b!623761))

(assert (= (and b!623762 (not c!71249)) b!623764))

(assert (= (or b!623761 b!623764) bm!33194))

(assert (=> b!623762 m!599561))

(assert (=> b!623762 m!599561))

(assert (=> b!623762 m!599563))

(assert (=> b!623763 m!599561))

(assert (=> b!623763 m!599561))

(declare-fun m!599573 () Bool)

(assert (=> b!623763 m!599573))

(assert (=> b!623765 m!599561))

(assert (=> b!623765 m!599561))

(assert (=> b!623765 m!599563))

(assert (=> bm!33194 m!599561))

(declare-fun m!599575 () Bool)

(assert (=> bm!33194 m!599575))

(assert (=> b!623596 d!88719))

(declare-fun d!88725 () Bool)

(declare-fun res!402008 () Bool)

(declare-fun e!357786 () Bool)

(assert (=> d!88725 (=> res!402008 e!357786)))

(assert (=> d!88725 (= res!402008 (= (select (arr!18094 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88725 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!357786)))

(declare-fun b!623780 () Bool)

(declare-fun e!357787 () Bool)

(assert (=> b!623780 (= e!357786 e!357787)))

(declare-fun res!402009 () Bool)

(assert (=> b!623780 (=> (not res!402009) (not e!357787))))

(assert (=> b!623780 (= res!402009 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18458 a!2986)))))

(declare-fun b!623781 () Bool)

(assert (=> b!623781 (= e!357787 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88725 (not res!402008)) b!623780))

(assert (= (and b!623780 res!402009) b!623781))

(assert (=> d!88725 m!599561))

(declare-fun m!599591 () Bool)

(assert (=> b!623781 m!599591))

(assert (=> b!623591 d!88725))

(declare-fun d!88729 () Bool)

(assert (=> d!88729 (= (validKeyInArray!0 (select (arr!18094 a!2986) j!136)) (and (not (= (select (arr!18094 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18094 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623597 d!88729))

(check-sat (not b!623762) (not b!623735) (not b!623763) (not d!88683) (not bm!33191) (not b!623738) (not b!623765) (not b!623713) (not d!88697) (not b!623781) (not bm!33194) (not b!623645))
(check-sat)
