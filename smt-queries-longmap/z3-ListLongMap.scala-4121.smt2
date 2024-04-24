; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56274 () Bool)

(assert start!56274)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun e!357794 () Bool)

(declare-fun b!623767 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37689 0))(
  ( (array!37690 (arr!18088 (Array (_ BitVec 32) (_ BitVec 64))) (size!18452 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37689)

(assert (=> b!623767 (= e!357794 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18088 a!2986) index!984) (select (arr!18088 a!2986) j!136)) (not (= index!984 j!136))))))

(declare-fun b!623769 () Bool)

(declare-fun res!401994 () Bool)

(declare-fun e!357793 () Bool)

(assert (=> b!623769 (=> (not res!401994) (not e!357793))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623769 (= res!401994 (and (= (size!18452 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18452 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18452 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623770 () Bool)

(declare-fun res!401996 () Bool)

(assert (=> b!623770 (=> (not res!401996) (not e!357794))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6484 0))(
  ( (MissingZero!6484 (index!28220 (_ BitVec 32))) (Found!6484 (index!28221 (_ BitVec 32))) (Intermediate!6484 (undefined!7296 Bool) (index!28222 (_ BitVec 32)) (x!57135 (_ BitVec 32))) (Undefined!6484) (MissingVacant!6484 (index!28223 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37689 (_ BitVec 32)) SeekEntryResult!6484)

(assert (=> b!623770 (= res!401996 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18088 a!2986) j!136) a!2986 mask!3053) (Found!6484 j!136)))))

(declare-fun b!623771 () Bool)

(declare-fun res!401995 () Bool)

(assert (=> b!623771 (=> (not res!401995) (not e!357793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623771 (= res!401995 (validKeyInArray!0 (select (arr!18088 a!2986) j!136)))))

(declare-fun b!623772 () Bool)

(assert (=> b!623772 (= e!357793 e!357794)))

(declare-fun res!401999 () Bool)

(assert (=> b!623772 (=> (not res!401999) (not e!357794))))

(declare-fun lt!289402 () SeekEntryResult!6484)

(assert (=> b!623772 (= res!401999 (or (= lt!289402 (MissingZero!6484 i!1108)) (= lt!289402 (MissingVacant!6484 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37689 (_ BitVec 32)) SeekEntryResult!6484)

(assert (=> b!623772 (= lt!289402 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623773 () Bool)

(declare-fun res!402000 () Bool)

(assert (=> b!623773 (=> (not res!402000) (not e!357794))))

(assert (=> b!623773 (= res!402000 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18088 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18088 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623774 () Bool)

(declare-fun res!401992 () Bool)

(assert (=> b!623774 (=> (not res!401992) (not e!357793))))

(declare-fun arrayContainsKey!0 (array!37689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623774 (= res!401992 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623775 () Bool)

(declare-fun res!401997 () Bool)

(assert (=> b!623775 (=> (not res!401997) (not e!357793))))

(assert (=> b!623775 (= res!401997 (validKeyInArray!0 k0!1786))))

(declare-fun b!623776 () Bool)

(declare-fun res!401993 () Bool)

(assert (=> b!623776 (=> (not res!401993) (not e!357794))))

(declare-datatypes ((List!12036 0))(
  ( (Nil!12033) (Cons!12032 (h!13080 (_ BitVec 64)) (t!18256 List!12036)) )
))
(declare-fun arrayNoDuplicates!0 (array!37689 (_ BitVec 32) List!12036) Bool)

(assert (=> b!623776 (= res!401993 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12033))))

(declare-fun res!402001 () Bool)

(assert (=> start!56274 (=> (not res!402001) (not e!357793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56274 (= res!402001 (validMask!0 mask!3053))))

(assert (=> start!56274 e!357793))

(assert (=> start!56274 true))

(declare-fun array_inv!13947 (array!37689) Bool)

(assert (=> start!56274 (array_inv!13947 a!2986)))

(declare-fun b!623768 () Bool)

(declare-fun res!401998 () Bool)

(assert (=> b!623768 (=> (not res!401998) (not e!357794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37689 (_ BitVec 32)) Bool)

(assert (=> b!623768 (= res!401998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56274 res!402001) b!623769))

(assert (= (and b!623769 res!401994) b!623771))

(assert (= (and b!623771 res!401995) b!623775))

(assert (= (and b!623775 res!401997) b!623774))

(assert (= (and b!623774 res!401992) b!623772))

(assert (= (and b!623772 res!401999) b!623768))

(assert (= (and b!623768 res!401998) b!623776))

(assert (= (and b!623776 res!401993) b!623773))

(assert (= (and b!623773 res!402000) b!623770))

(assert (= (and b!623770 res!401996) b!623767))

(declare-fun m!599903 () Bool)

(assert (=> b!623773 m!599903))

(declare-fun m!599905 () Bool)

(assert (=> b!623773 m!599905))

(declare-fun m!599907 () Bool)

(assert (=> b!623773 m!599907))

(declare-fun m!599909 () Bool)

(assert (=> b!623775 m!599909))

(declare-fun m!599911 () Bool)

(assert (=> b!623770 m!599911))

(assert (=> b!623770 m!599911))

(declare-fun m!599913 () Bool)

(assert (=> b!623770 m!599913))

(declare-fun m!599915 () Bool)

(assert (=> b!623768 m!599915))

(declare-fun m!599917 () Bool)

(assert (=> b!623767 m!599917))

(assert (=> b!623767 m!599911))

(declare-fun m!599919 () Bool)

(assert (=> start!56274 m!599919))

(declare-fun m!599921 () Bool)

(assert (=> start!56274 m!599921))

(assert (=> b!623771 m!599911))

(assert (=> b!623771 m!599911))

(declare-fun m!599923 () Bool)

(assert (=> b!623771 m!599923))

(declare-fun m!599925 () Bool)

(assert (=> b!623772 m!599925))

(declare-fun m!599927 () Bool)

(assert (=> b!623774 m!599927))

(declare-fun m!599929 () Bool)

(assert (=> b!623776 m!599929))

(check-sat (not b!623775) (not b!623770) (not b!623772) (not b!623768) (not start!56274) (not b!623771) (not b!623776) (not b!623774))
(check-sat)
(get-model)

(declare-fun b!623845 () Bool)

(declare-fun e!357821 () Bool)

(declare-fun e!357820 () Bool)

(assert (=> b!623845 (= e!357821 e!357820)))

(declare-fun lt!289417 () (_ BitVec 64))

(assert (=> b!623845 (= lt!289417 (select (arr!18088 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21037 0))(
  ( (Unit!21038) )
))
(declare-fun lt!289416 () Unit!21037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37689 (_ BitVec 64) (_ BitVec 32)) Unit!21037)

(assert (=> b!623845 (= lt!289416 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289417 #b00000000000000000000000000000000))))

(assert (=> b!623845 (arrayContainsKey!0 a!2986 lt!289417 #b00000000000000000000000000000000)))

(declare-fun lt!289415 () Unit!21037)

(assert (=> b!623845 (= lt!289415 lt!289416)))

(declare-fun res!402067 () Bool)

(assert (=> b!623845 (= res!402067 (= (seekEntryOrOpen!0 (select (arr!18088 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6484 #b00000000000000000000000000000000)))))

(assert (=> b!623845 (=> (not res!402067) (not e!357820))))

(declare-fun d!88795 () Bool)

(declare-fun res!402066 () Bool)

(declare-fun e!357822 () Bool)

(assert (=> d!88795 (=> res!402066 e!357822)))

(assert (=> d!88795 (= res!402066 (bvsge #b00000000000000000000000000000000 (size!18452 a!2986)))))

(assert (=> d!88795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!357822)))

(declare-fun b!623846 () Bool)

(declare-fun call!33189 () Bool)

(assert (=> b!623846 (= e!357820 call!33189)))

(declare-fun b!623847 () Bool)

(assert (=> b!623847 (= e!357821 call!33189)))

(declare-fun b!623848 () Bool)

(assert (=> b!623848 (= e!357822 e!357821)))

(declare-fun c!71258 () Bool)

(assert (=> b!623848 (= c!71258 (validKeyInArray!0 (select (arr!18088 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33186 () Bool)

(assert (=> bm!33186 (= call!33189 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88795 (not res!402066)) b!623848))

(assert (= (and b!623848 c!71258) b!623845))

(assert (= (and b!623848 (not c!71258)) b!623847))

(assert (= (and b!623845 res!402067) b!623846))

(assert (= (or b!623846 b!623847) bm!33186))

(declare-fun m!599987 () Bool)

(assert (=> b!623845 m!599987))

(declare-fun m!599989 () Bool)

(assert (=> b!623845 m!599989))

(declare-fun m!599991 () Bool)

(assert (=> b!623845 m!599991))

(assert (=> b!623845 m!599987))

(declare-fun m!599993 () Bool)

(assert (=> b!623845 m!599993))

(assert (=> b!623848 m!599987))

(assert (=> b!623848 m!599987))

(declare-fun m!599995 () Bool)

(assert (=> b!623848 m!599995))

(declare-fun m!599997 () Bool)

(assert (=> bm!33186 m!599997))

(assert (=> b!623768 d!88795))

(declare-fun d!88797 () Bool)

(assert (=> d!88797 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56274 d!88797))

(declare-fun d!88799 () Bool)

(assert (=> d!88799 (= (array_inv!13947 a!2986) (bvsge (size!18452 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56274 d!88799))

(declare-fun d!88801 () Bool)

(declare-fun res!402072 () Bool)

(declare-fun e!357827 () Bool)

(assert (=> d!88801 (=> res!402072 e!357827)))

(assert (=> d!88801 (= res!402072 (= (select (arr!18088 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88801 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!357827)))

(declare-fun b!623853 () Bool)

(declare-fun e!357828 () Bool)

(assert (=> b!623853 (= e!357827 e!357828)))

(declare-fun res!402073 () Bool)

(assert (=> b!623853 (=> (not res!402073) (not e!357828))))

(assert (=> b!623853 (= res!402073 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18452 a!2986)))))

(declare-fun b!623854 () Bool)

(assert (=> b!623854 (= e!357828 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88801 (not res!402072)) b!623853))

(assert (= (and b!623853 res!402073) b!623854))

(assert (=> d!88801 m!599987))

(declare-fun m!599999 () Bool)

(assert (=> b!623854 m!599999))

(assert (=> b!623774 d!88801))

(declare-fun b!623885 () Bool)

(declare-fun e!357850 () SeekEntryResult!6484)

(declare-fun lt!289435 () SeekEntryResult!6484)

(assert (=> b!623885 (= e!357850 (MissingZero!6484 (index!28222 lt!289435)))))

(declare-fun b!623886 () Bool)

(declare-fun e!357851 () SeekEntryResult!6484)

(declare-fun e!357852 () SeekEntryResult!6484)

(assert (=> b!623886 (= e!357851 e!357852)))

(declare-fun lt!289433 () (_ BitVec 64))

(assert (=> b!623886 (= lt!289433 (select (arr!18088 a!2986) (index!28222 lt!289435)))))

(declare-fun c!71270 () Bool)

(assert (=> b!623886 (= c!71270 (= lt!289433 k0!1786))))

(declare-fun b!623887 () Bool)

(declare-fun c!71269 () Bool)

(assert (=> b!623887 (= c!71269 (= lt!289433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623887 (= e!357852 e!357850)))

(declare-fun b!623888 () Bool)

(assert (=> b!623888 (= e!357851 Undefined!6484)))

(declare-fun b!623889 () Bool)

(assert (=> b!623889 (= e!357852 (Found!6484 (index!28222 lt!289435)))))

(declare-fun b!623890 () Bool)

(assert (=> b!623890 (= e!357850 (seekKeyOrZeroReturnVacant!0 (x!57135 lt!289435) (index!28222 lt!289435) (index!28222 lt!289435) k0!1786 a!2986 mask!3053))))

(declare-fun d!88805 () Bool)

(declare-fun lt!289434 () SeekEntryResult!6484)

(get-info :version)

(assert (=> d!88805 (and (or ((_ is Undefined!6484) lt!289434) (not ((_ is Found!6484) lt!289434)) (and (bvsge (index!28221 lt!289434) #b00000000000000000000000000000000) (bvslt (index!28221 lt!289434) (size!18452 a!2986)))) (or ((_ is Undefined!6484) lt!289434) ((_ is Found!6484) lt!289434) (not ((_ is MissingZero!6484) lt!289434)) (and (bvsge (index!28220 lt!289434) #b00000000000000000000000000000000) (bvslt (index!28220 lt!289434) (size!18452 a!2986)))) (or ((_ is Undefined!6484) lt!289434) ((_ is Found!6484) lt!289434) ((_ is MissingZero!6484) lt!289434) (not ((_ is MissingVacant!6484) lt!289434)) (and (bvsge (index!28223 lt!289434) #b00000000000000000000000000000000) (bvslt (index!28223 lt!289434) (size!18452 a!2986)))) (or ((_ is Undefined!6484) lt!289434) (ite ((_ is Found!6484) lt!289434) (= (select (arr!18088 a!2986) (index!28221 lt!289434)) k0!1786) (ite ((_ is MissingZero!6484) lt!289434) (= (select (arr!18088 a!2986) (index!28220 lt!289434)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6484) lt!289434) (= (select (arr!18088 a!2986) (index!28223 lt!289434)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88805 (= lt!289434 e!357851)))

(declare-fun c!71268 () Bool)

(assert (=> d!88805 (= c!71268 (and ((_ is Intermediate!6484) lt!289435) (undefined!7296 lt!289435)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37689 (_ BitVec 32)) SeekEntryResult!6484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88805 (= lt!289435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88805 (validMask!0 mask!3053)))

(assert (=> d!88805 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289434)))

(assert (= (and d!88805 c!71268) b!623888))

(assert (= (and d!88805 (not c!71268)) b!623886))

(assert (= (and b!623886 c!71270) b!623889))

(assert (= (and b!623886 (not c!71270)) b!623887))

(assert (= (and b!623887 c!71269) b!623885))

(assert (= (and b!623887 (not c!71269)) b!623890))

(declare-fun m!600015 () Bool)

(assert (=> b!623886 m!600015))

(declare-fun m!600017 () Bool)

(assert (=> b!623890 m!600017))

(declare-fun m!600019 () Bool)

(assert (=> d!88805 m!600019))

(declare-fun m!600021 () Bool)

(assert (=> d!88805 m!600021))

(declare-fun m!600023 () Bool)

(assert (=> d!88805 m!600023))

(assert (=> d!88805 m!599919))

(declare-fun m!600025 () Bool)

(assert (=> d!88805 m!600025))

(declare-fun m!600027 () Bool)

(assert (=> d!88805 m!600027))

(assert (=> d!88805 m!600021))

(assert (=> b!623772 d!88805))

(declare-fun d!88813 () Bool)

(assert (=> d!88813 (= (validKeyInArray!0 (select (arr!18088 a!2986) j!136)) (and (not (= (select (arr!18088 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18088 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623771 d!88813))

(declare-fun b!623920 () Bool)

(declare-fun e!357875 () Bool)

(declare-fun e!357873 () Bool)

(assert (=> b!623920 (= e!357875 e!357873)))

(declare-fun res!402101 () Bool)

(assert (=> b!623920 (=> (not res!402101) (not e!357873))))

(declare-fun e!357878 () Bool)

(assert (=> b!623920 (= res!402101 (not e!357878))))

(declare-fun res!402102 () Bool)

(assert (=> b!623920 (=> (not res!402102) (not e!357878))))

(assert (=> b!623920 (= res!402102 (validKeyInArray!0 (select (arr!18088 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88815 () Bool)

(declare-fun res!402103 () Bool)

(assert (=> d!88815 (=> res!402103 e!357875)))

(assert (=> d!88815 (= res!402103 (bvsge #b00000000000000000000000000000000 (size!18452 a!2986)))))

(assert (=> d!88815 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12033) e!357875)))

(declare-fun b!623921 () Bool)

(declare-fun e!357876 () Bool)

(assert (=> b!623921 (= e!357873 e!357876)))

(declare-fun c!71278 () Bool)

(assert (=> b!623921 (= c!71278 (validKeyInArray!0 (select (arr!18088 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33195 () Bool)

(declare-fun call!33198 () Bool)

(assert (=> bm!33195 (= call!33198 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71278 (Cons!12032 (select (arr!18088 a!2986) #b00000000000000000000000000000000) Nil!12033) Nil!12033)))))

(declare-fun b!623922 () Bool)

(declare-fun contains!3048 (List!12036 (_ BitVec 64)) Bool)

(assert (=> b!623922 (= e!357878 (contains!3048 Nil!12033 (select (arr!18088 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623923 () Bool)

(assert (=> b!623923 (= e!357876 call!33198)))

(declare-fun b!623924 () Bool)

(assert (=> b!623924 (= e!357876 call!33198)))

(assert (= (and d!88815 (not res!402103)) b!623920))

(assert (= (and b!623920 res!402102) b!623922))

(assert (= (and b!623920 res!402101) b!623921))

(assert (= (and b!623921 c!71278) b!623924))

(assert (= (and b!623921 (not c!71278)) b!623923))

(assert (= (or b!623924 b!623923) bm!33195))

(assert (=> b!623920 m!599987))

(assert (=> b!623920 m!599987))

(assert (=> b!623920 m!599995))

(assert (=> b!623921 m!599987))

(assert (=> b!623921 m!599987))

(assert (=> b!623921 m!599995))

(assert (=> bm!33195 m!599987))

(declare-fun m!600033 () Bool)

(assert (=> bm!33195 m!600033))

(assert (=> b!623922 m!599987))

(assert (=> b!623922 m!599987))

(declare-fun m!600035 () Bool)

(assert (=> b!623922 m!600035))

(assert (=> b!623776 d!88815))

(declare-fun d!88819 () Bool)

(assert (=> d!88819 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623775 d!88819))

(declare-fun b!623963 () Bool)

(declare-fun e!357903 () SeekEntryResult!6484)

(assert (=> b!623963 (= e!357903 (MissingVacant!6484 vacantSpotIndex!68))))

(declare-fun b!623964 () Bool)

(declare-fun e!357902 () SeekEntryResult!6484)

(assert (=> b!623964 (= e!357902 (Found!6484 index!984))))

(declare-fun b!623965 () Bool)

(declare-fun e!357901 () SeekEntryResult!6484)

(assert (=> b!623965 (= e!357901 e!357902)))

(declare-fun c!71297 () Bool)

(declare-fun lt!289455 () (_ BitVec 64))

(assert (=> b!623965 (= c!71297 (= lt!289455 (select (arr!18088 a!2986) j!136)))))

(declare-fun b!623966 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623966 (= e!357903 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18088 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623967 () Bool)

(declare-fun c!71295 () Bool)

(assert (=> b!623967 (= c!71295 (= lt!289455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623967 (= e!357902 e!357903)))

(declare-fun d!88821 () Bool)

(declare-fun lt!289456 () SeekEntryResult!6484)

(assert (=> d!88821 (and (or ((_ is Undefined!6484) lt!289456) (not ((_ is Found!6484) lt!289456)) (and (bvsge (index!28221 lt!289456) #b00000000000000000000000000000000) (bvslt (index!28221 lt!289456) (size!18452 a!2986)))) (or ((_ is Undefined!6484) lt!289456) ((_ is Found!6484) lt!289456) (not ((_ is MissingVacant!6484) lt!289456)) (not (= (index!28223 lt!289456) vacantSpotIndex!68)) (and (bvsge (index!28223 lt!289456) #b00000000000000000000000000000000) (bvslt (index!28223 lt!289456) (size!18452 a!2986)))) (or ((_ is Undefined!6484) lt!289456) (ite ((_ is Found!6484) lt!289456) (= (select (arr!18088 a!2986) (index!28221 lt!289456)) (select (arr!18088 a!2986) j!136)) (and ((_ is MissingVacant!6484) lt!289456) (= (index!28223 lt!289456) vacantSpotIndex!68) (= (select (arr!18088 a!2986) (index!28223 lt!289456)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88821 (= lt!289456 e!357901)))

(declare-fun c!71296 () Bool)

(assert (=> d!88821 (= c!71296 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88821 (= lt!289455 (select (arr!18088 a!2986) index!984))))

(assert (=> d!88821 (validMask!0 mask!3053)))

(assert (=> d!88821 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18088 a!2986) j!136) a!2986 mask!3053) lt!289456)))

(declare-fun b!623968 () Bool)

(assert (=> b!623968 (= e!357901 Undefined!6484)))

(assert (= (and d!88821 c!71296) b!623968))

(assert (= (and d!88821 (not c!71296)) b!623965))

(assert (= (and b!623965 c!71297) b!623964))

(assert (= (and b!623965 (not c!71297)) b!623967))

(assert (= (and b!623967 c!71295) b!623963))

(assert (= (and b!623967 (not c!71295)) b!623966))

(declare-fun m!600057 () Bool)

(assert (=> b!623966 m!600057))

(assert (=> b!623966 m!600057))

(assert (=> b!623966 m!599911))

(declare-fun m!600059 () Bool)

(assert (=> b!623966 m!600059))

(declare-fun m!600061 () Bool)

(assert (=> d!88821 m!600061))

(declare-fun m!600063 () Bool)

(assert (=> d!88821 m!600063))

(assert (=> d!88821 m!599917))

(assert (=> d!88821 m!599919))

(assert (=> b!623770 d!88821))

(check-sat (not b!623921) (not d!88805) (not b!623845) (not b!623966) (not b!623890) (not bm!33195) (not b!623920) (not b!623854) (not b!623848) (not b!623922) (not bm!33186) (not d!88821))
(check-sat)
