; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86248 () Bool)

(assert start!86248)

(declare-fun b!998025 () Bool)

(declare-fun res!667582 () Bool)

(declare-fun e!563020 () Bool)

(assert (=> b!998025 (=> (not res!667582) (not e!563020))))

(declare-datatypes ((array!63123 0))(
  ( (array!63124 (arr!30388 (Array (_ BitVec 32) (_ BitVec 64))) (size!30891 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63123)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9256 0))(
  ( (MissingZero!9256 (index!39395 (_ BitVec 32))) (Found!9256 (index!39396 (_ BitVec 32))) (Intermediate!9256 (undefined!10068 Bool) (index!39397 (_ BitVec 32)) (x!86978 (_ BitVec 32))) (Undefined!9256) (MissingVacant!9256 (index!39398 (_ BitVec 32))) )
))
(declare-fun lt!441709 () SeekEntryResult!9256)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63123 (_ BitVec 32)) SeekEntryResult!9256)

(assert (=> b!998025 (= res!667582 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30388 a!3219) j!170) a!3219 mask!3464) lt!441709))))

(declare-fun b!998026 () Bool)

(declare-fun res!667573 () Bool)

(declare-fun e!563019 () Bool)

(assert (=> b!998026 (=> (not res!667573) (not e!563019))))

(declare-datatypes ((List!21035 0))(
  ( (Nil!21032) (Cons!21031 (h!22202 (_ BitVec 64)) (t!30028 List!21035)) )
))
(declare-fun arrayNoDuplicates!0 (array!63123 (_ BitVec 32) List!21035) Bool)

(assert (=> b!998026 (= res!667573 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21032))))

(declare-fun b!998027 () Bool)

(declare-fun res!667580 () Bool)

(declare-fun e!563021 () Bool)

(assert (=> b!998027 (=> (not res!667580) (not e!563021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998027 (= res!667580 (validKeyInArray!0 (select (arr!30388 a!3219) j!170)))))

(declare-fun b!998028 () Bool)

(assert (=> b!998028 (= e!563020 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!998029 () Bool)

(assert (=> b!998029 (= e!563021 e!563019)))

(declare-fun res!667575 () Bool)

(assert (=> b!998029 (=> (not res!667575) (not e!563019))))

(declare-fun lt!441710 () SeekEntryResult!9256)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998029 (= res!667575 (or (= lt!441710 (MissingVacant!9256 i!1194)) (= lt!441710 (MissingZero!9256 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63123 (_ BitVec 32)) SeekEntryResult!9256)

(assert (=> b!998029 (= lt!441710 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998030 () Bool)

(declare-fun res!667583 () Bool)

(assert (=> b!998030 (=> (not res!667583) (not e!563021))))

(assert (=> b!998030 (= res!667583 (validKeyInArray!0 k0!2224))))

(declare-fun b!998031 () Bool)

(declare-fun res!667579 () Bool)

(assert (=> b!998031 (=> (not res!667579) (not e!563019))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998031 (= res!667579 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30891 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30891 a!3219))))))

(declare-fun res!667576 () Bool)

(assert (=> start!86248 (=> (not res!667576) (not e!563021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86248 (= res!667576 (validMask!0 mask!3464))))

(assert (=> start!86248 e!563021))

(declare-fun array_inv!23524 (array!63123) Bool)

(assert (=> start!86248 (array_inv!23524 a!3219)))

(assert (=> start!86248 true))

(declare-fun b!998032 () Bool)

(declare-fun res!667581 () Bool)

(assert (=> b!998032 (=> (not res!667581) (not e!563021))))

(assert (=> b!998032 (= res!667581 (and (= (size!30891 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30891 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30891 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998033 () Bool)

(assert (=> b!998033 (= e!563019 e!563020)))

(declare-fun res!667578 () Bool)

(assert (=> b!998033 (=> (not res!667578) (not e!563020))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998033 (= res!667578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) (select (arr!30388 a!3219) j!170) a!3219 mask!3464) lt!441709))))

(assert (=> b!998033 (= lt!441709 (Intermediate!9256 false resIndex!38 resX!38))))

(declare-fun b!998034 () Bool)

(declare-fun res!667574 () Bool)

(assert (=> b!998034 (=> (not res!667574) (not e!563019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63123 (_ BitVec 32)) Bool)

(assert (=> b!998034 (= res!667574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998035 () Bool)

(declare-fun res!667577 () Bool)

(assert (=> b!998035 (=> (not res!667577) (not e!563021))))

(declare-fun arrayContainsKey!0 (array!63123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998035 (= res!667577 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86248 res!667576) b!998032))

(assert (= (and b!998032 res!667581) b!998027))

(assert (= (and b!998027 res!667580) b!998030))

(assert (= (and b!998030 res!667583) b!998035))

(assert (= (and b!998035 res!667577) b!998029))

(assert (= (and b!998029 res!667575) b!998034))

(assert (= (and b!998034 res!667574) b!998026))

(assert (= (and b!998026 res!667573) b!998031))

(assert (= (and b!998031 res!667579) b!998033))

(assert (= (and b!998033 res!667578) b!998025))

(assert (= (and b!998025 res!667582) b!998028))

(declare-fun m!925391 () Bool)

(assert (=> b!998027 m!925391))

(assert (=> b!998027 m!925391))

(declare-fun m!925393 () Bool)

(assert (=> b!998027 m!925393))

(declare-fun m!925395 () Bool)

(assert (=> b!998034 m!925395))

(declare-fun m!925397 () Bool)

(assert (=> b!998030 m!925397))

(declare-fun m!925399 () Bool)

(assert (=> b!998035 m!925399))

(assert (=> b!998033 m!925391))

(assert (=> b!998033 m!925391))

(declare-fun m!925401 () Bool)

(assert (=> b!998033 m!925401))

(assert (=> b!998033 m!925401))

(assert (=> b!998033 m!925391))

(declare-fun m!925403 () Bool)

(assert (=> b!998033 m!925403))

(declare-fun m!925405 () Bool)

(assert (=> b!998026 m!925405))

(declare-fun m!925407 () Bool)

(assert (=> start!86248 m!925407))

(declare-fun m!925409 () Bool)

(assert (=> start!86248 m!925409))

(assert (=> b!998025 m!925391))

(assert (=> b!998025 m!925391))

(declare-fun m!925411 () Bool)

(assert (=> b!998025 m!925411))

(declare-fun m!925413 () Bool)

(assert (=> b!998029 m!925413))

(check-sat (not b!998035) (not b!998027) (not b!998029) (not b!998030) (not start!86248) (not b!998033) (not b!998026) (not b!998034) (not b!998025))
(check-sat)
(get-model)

(declare-fun b!998120 () Bool)

(declare-fun lt!441728 () SeekEntryResult!9256)

(assert (=> b!998120 (and (bvsge (index!39397 lt!441728) #b00000000000000000000000000000000) (bvslt (index!39397 lt!441728) (size!30891 a!3219)))))

(declare-fun e!563061 () Bool)

(assert (=> b!998120 (= e!563061 (= (select (arr!30388 a!3219) (index!39397 lt!441728)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998121 () Bool)

(declare-fun e!563059 () SeekEntryResult!9256)

(declare-fun e!563057 () SeekEntryResult!9256)

(assert (=> b!998121 (= e!563059 e!563057)))

(declare-fun c!101378 () Bool)

(declare-fun lt!441727 () (_ BitVec 64))

(assert (=> b!998121 (= c!101378 (or (= lt!441727 (select (arr!30388 a!3219) j!170)) (= (bvadd lt!441727 lt!441727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998122 () Bool)

(declare-fun e!563058 () Bool)

(assert (=> b!998122 (= e!563058 (bvsge (x!86978 lt!441728) #b01111111111111111111111111111110))))

(declare-fun d!119381 () Bool)

(assert (=> d!119381 e!563058))

(declare-fun c!101379 () Bool)

(get-info :version)

(assert (=> d!119381 (= c!101379 (and ((_ is Intermediate!9256) lt!441728) (undefined!10068 lt!441728)))))

(assert (=> d!119381 (= lt!441728 e!563059)))

(declare-fun c!101380 () Bool)

(assert (=> d!119381 (= c!101380 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119381 (= lt!441727 (select (arr!30388 a!3219) index!1507))))

(assert (=> d!119381 (validMask!0 mask!3464)))

(assert (=> d!119381 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30388 a!3219) j!170) a!3219 mask!3464) lt!441728)))

(declare-fun b!998123 () Bool)

(assert (=> b!998123 (and (bvsge (index!39397 lt!441728) #b00000000000000000000000000000000) (bvslt (index!39397 lt!441728) (size!30891 a!3219)))))

(declare-fun res!667657 () Bool)

(assert (=> b!998123 (= res!667657 (= (select (arr!30388 a!3219) (index!39397 lt!441728)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998123 (=> res!667657 e!563061)))

(declare-fun b!998124 () Bool)

(assert (=> b!998124 (and (bvsge (index!39397 lt!441728) #b00000000000000000000000000000000) (bvslt (index!39397 lt!441728) (size!30891 a!3219)))))

(declare-fun res!667658 () Bool)

(assert (=> b!998124 (= res!667658 (= (select (arr!30388 a!3219) (index!39397 lt!441728)) (select (arr!30388 a!3219) j!170)))))

(assert (=> b!998124 (=> res!667658 e!563061)))

(declare-fun e!563060 () Bool)

(assert (=> b!998124 (= e!563060 e!563061)))

(declare-fun b!998125 () Bool)

(assert (=> b!998125 (= e!563057 (Intermediate!9256 false index!1507 x!1245))))

(declare-fun b!998126 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998126 (= e!563057 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30388 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998127 () Bool)

(assert (=> b!998127 (= e!563058 e!563060)))

(declare-fun res!667656 () Bool)

(assert (=> b!998127 (= res!667656 (and ((_ is Intermediate!9256) lt!441728) (not (undefined!10068 lt!441728)) (bvslt (x!86978 lt!441728) #b01111111111111111111111111111110) (bvsge (x!86978 lt!441728) #b00000000000000000000000000000000) (bvsge (x!86978 lt!441728) x!1245)))))

(assert (=> b!998127 (=> (not res!667656) (not e!563060))))

(declare-fun b!998128 () Bool)

(assert (=> b!998128 (= e!563059 (Intermediate!9256 true index!1507 x!1245))))

(assert (= (and d!119381 c!101380) b!998128))

(assert (= (and d!119381 (not c!101380)) b!998121))

(assert (= (and b!998121 c!101378) b!998125))

(assert (= (and b!998121 (not c!101378)) b!998126))

(assert (= (and d!119381 c!101379) b!998122))

(assert (= (and d!119381 (not c!101379)) b!998127))

(assert (= (and b!998127 res!667656) b!998124))

(assert (= (and b!998124 (not res!667658)) b!998123))

(assert (= (and b!998123 (not res!667657)) b!998120))

(declare-fun m!925463 () Bool)

(assert (=> b!998124 m!925463))

(declare-fun m!925465 () Bool)

(assert (=> b!998126 m!925465))

(assert (=> b!998126 m!925465))

(assert (=> b!998126 m!925391))

(declare-fun m!925467 () Bool)

(assert (=> b!998126 m!925467))

(assert (=> b!998123 m!925463))

(assert (=> b!998120 m!925463))

(declare-fun m!925469 () Bool)

(assert (=> d!119381 m!925469))

(assert (=> d!119381 m!925407))

(assert (=> b!998025 d!119381))

(declare-fun d!119383 () Bool)

(declare-fun res!667663 () Bool)

(declare-fun e!563066 () Bool)

(assert (=> d!119383 (=> res!667663 e!563066)))

(assert (=> d!119383 (= res!667663 (= (select (arr!30388 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119383 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!563066)))

(declare-fun b!998133 () Bool)

(declare-fun e!563067 () Bool)

(assert (=> b!998133 (= e!563066 e!563067)))

(declare-fun res!667664 () Bool)

(assert (=> b!998133 (=> (not res!667664) (not e!563067))))

(assert (=> b!998133 (= res!667664 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30891 a!3219)))))

(declare-fun b!998134 () Bool)

(assert (=> b!998134 (= e!563067 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119383 (not res!667663)) b!998133))

(assert (= (and b!998133 res!667664) b!998134))

(declare-fun m!925471 () Bool)

(assert (=> d!119383 m!925471))

(declare-fun m!925473 () Bool)

(assert (=> b!998134 m!925473))

(assert (=> b!998035 d!119383))

(declare-fun d!119389 () Bool)

(assert (=> d!119389 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998030 d!119389))

(declare-fun d!119391 () Bool)

(assert (=> d!119391 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86248 d!119391))

(declare-fun d!119403 () Bool)

(assert (=> d!119403 (= (array_inv!23524 a!3219) (bvsge (size!30891 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86248 d!119403))

(declare-fun d!119405 () Bool)

(declare-fun res!667697 () Bool)

(declare-fun e!563110 () Bool)

(assert (=> d!119405 (=> res!667697 e!563110)))

(assert (=> d!119405 (= res!667697 (bvsge #b00000000000000000000000000000000 (size!30891 a!3219)))))

(assert (=> d!119405 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21032) e!563110)))

(declare-fun b!998186 () Bool)

(declare-fun e!563111 () Bool)

(declare-fun contains!5889 (List!21035 (_ BitVec 64)) Bool)

(assert (=> b!998186 (= e!563111 (contains!5889 Nil!21032 (select (arr!30388 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998187 () Bool)

(declare-fun e!563109 () Bool)

(declare-fun call!42297 () Bool)

(assert (=> b!998187 (= e!563109 call!42297)))

(declare-fun b!998188 () Bool)

(assert (=> b!998188 (= e!563109 call!42297)))

(declare-fun b!998189 () Bool)

(declare-fun e!563112 () Bool)

(assert (=> b!998189 (= e!563112 e!563109)))

(declare-fun c!101391 () Bool)

(assert (=> b!998189 (= c!101391 (validKeyInArray!0 (select (arr!30388 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998190 () Bool)

(assert (=> b!998190 (= e!563110 e!563112)))

(declare-fun res!667696 () Bool)

(assert (=> b!998190 (=> (not res!667696) (not e!563112))))

(assert (=> b!998190 (= res!667696 (not e!563111))))

(declare-fun res!667698 () Bool)

(assert (=> b!998190 (=> (not res!667698) (not e!563111))))

(assert (=> b!998190 (= res!667698 (validKeyInArray!0 (select (arr!30388 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42294 () Bool)

(assert (=> bm!42294 (= call!42297 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101391 (Cons!21031 (select (arr!30388 a!3219) #b00000000000000000000000000000000) Nil!21032) Nil!21032)))))

(assert (= (and d!119405 (not res!667697)) b!998190))

(assert (= (and b!998190 res!667698) b!998186))

(assert (= (and b!998190 res!667696) b!998189))

(assert (= (and b!998189 c!101391) b!998187))

(assert (= (and b!998189 (not c!101391)) b!998188))

(assert (= (or b!998187 b!998188) bm!42294))

(assert (=> b!998186 m!925471))

(assert (=> b!998186 m!925471))

(declare-fun m!925497 () Bool)

(assert (=> b!998186 m!925497))

(assert (=> b!998189 m!925471))

(assert (=> b!998189 m!925471))

(declare-fun m!925499 () Bool)

(assert (=> b!998189 m!925499))

(assert (=> b!998190 m!925471))

(assert (=> b!998190 m!925471))

(assert (=> b!998190 m!925499))

(assert (=> bm!42294 m!925471))

(declare-fun m!925501 () Bool)

(assert (=> bm!42294 m!925501))

(assert (=> b!998026 d!119405))

(declare-fun b!998191 () Bool)

(declare-fun lt!441745 () SeekEntryResult!9256)

(assert (=> b!998191 (and (bvsge (index!39397 lt!441745) #b00000000000000000000000000000000) (bvslt (index!39397 lt!441745) (size!30891 a!3219)))))

(declare-fun e!563117 () Bool)

(assert (=> b!998191 (= e!563117 (= (select (arr!30388 a!3219) (index!39397 lt!441745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998192 () Bool)

(declare-fun e!563115 () SeekEntryResult!9256)

(declare-fun e!563113 () SeekEntryResult!9256)

(assert (=> b!998192 (= e!563115 e!563113)))

(declare-fun lt!441744 () (_ BitVec 64))

(declare-fun c!101392 () Bool)

(assert (=> b!998192 (= c!101392 (or (= lt!441744 (select (arr!30388 a!3219) j!170)) (= (bvadd lt!441744 lt!441744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998193 () Bool)

(declare-fun e!563114 () Bool)

(assert (=> b!998193 (= e!563114 (bvsge (x!86978 lt!441745) #b01111111111111111111111111111110))))

(declare-fun d!119407 () Bool)

(assert (=> d!119407 e!563114))

(declare-fun c!101393 () Bool)

(assert (=> d!119407 (= c!101393 (and ((_ is Intermediate!9256) lt!441745) (undefined!10068 lt!441745)))))

(assert (=> d!119407 (= lt!441745 e!563115)))

(declare-fun c!101394 () Bool)

(assert (=> d!119407 (= c!101394 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119407 (= lt!441744 (select (arr!30388 a!3219) (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464)))))

(assert (=> d!119407 (validMask!0 mask!3464)))

(assert (=> d!119407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) (select (arr!30388 a!3219) j!170) a!3219 mask!3464) lt!441745)))

(declare-fun b!998194 () Bool)

(assert (=> b!998194 (and (bvsge (index!39397 lt!441745) #b00000000000000000000000000000000) (bvslt (index!39397 lt!441745) (size!30891 a!3219)))))

(declare-fun res!667700 () Bool)

(assert (=> b!998194 (= res!667700 (= (select (arr!30388 a!3219) (index!39397 lt!441745)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998194 (=> res!667700 e!563117)))

(declare-fun b!998195 () Bool)

(assert (=> b!998195 (and (bvsge (index!39397 lt!441745) #b00000000000000000000000000000000) (bvslt (index!39397 lt!441745) (size!30891 a!3219)))))

(declare-fun res!667701 () Bool)

(assert (=> b!998195 (= res!667701 (= (select (arr!30388 a!3219) (index!39397 lt!441745)) (select (arr!30388 a!3219) j!170)))))

(assert (=> b!998195 (=> res!667701 e!563117)))

(declare-fun e!563116 () Bool)

(assert (=> b!998195 (= e!563116 e!563117)))

(declare-fun b!998196 () Bool)

(assert (=> b!998196 (= e!563113 (Intermediate!9256 false (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998197 () Bool)

(assert (=> b!998197 (= e!563113 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30388 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998198 () Bool)

(assert (=> b!998198 (= e!563114 e!563116)))

(declare-fun res!667699 () Bool)

(assert (=> b!998198 (= res!667699 (and ((_ is Intermediate!9256) lt!441745) (not (undefined!10068 lt!441745)) (bvslt (x!86978 lt!441745) #b01111111111111111111111111111110) (bvsge (x!86978 lt!441745) #b00000000000000000000000000000000) (bvsge (x!86978 lt!441745) #b00000000000000000000000000000000)))))

(assert (=> b!998198 (=> (not res!667699) (not e!563116))))

(declare-fun b!998199 () Bool)

(assert (=> b!998199 (= e!563115 (Intermediate!9256 true (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119407 c!101394) b!998199))

(assert (= (and d!119407 (not c!101394)) b!998192))

(assert (= (and b!998192 c!101392) b!998196))

(assert (= (and b!998192 (not c!101392)) b!998197))

(assert (= (and d!119407 c!101393) b!998193))

(assert (= (and d!119407 (not c!101393)) b!998198))

(assert (= (and b!998198 res!667699) b!998195))

(assert (= (and b!998195 (not res!667701)) b!998194))

(assert (= (and b!998194 (not res!667700)) b!998191))

(declare-fun m!925503 () Bool)

(assert (=> b!998195 m!925503))

(assert (=> b!998197 m!925401))

(declare-fun m!925505 () Bool)

(assert (=> b!998197 m!925505))

(assert (=> b!998197 m!925505))

(assert (=> b!998197 m!925391))

(declare-fun m!925507 () Bool)

(assert (=> b!998197 m!925507))

(assert (=> b!998194 m!925503))

(assert (=> b!998191 m!925503))

(assert (=> d!119407 m!925401))

(declare-fun m!925509 () Bool)

(assert (=> d!119407 m!925509))

(assert (=> d!119407 m!925407))

(assert (=> b!998033 d!119407))

(declare-fun d!119409 () Bool)

(declare-fun lt!441758 () (_ BitVec 32))

(declare-fun lt!441757 () (_ BitVec 32))

(assert (=> d!119409 (= lt!441758 (bvmul (bvxor lt!441757 (bvlshr lt!441757 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119409 (= lt!441757 ((_ extract 31 0) (bvand (bvxor (select (arr!30388 a!3219) j!170) (bvlshr (select (arr!30388 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119409 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667704 (let ((h!22205 ((_ extract 31 0) (bvand (bvxor (select (arr!30388 a!3219) j!170) (bvlshr (select (arr!30388 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!86982 (bvmul (bvxor h!22205 (bvlshr h!22205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!86982 (bvlshr x!86982 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667704 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667704 #b00000000000000000000000000000000))))))

(assert (=> d!119409 (= (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) (bvand (bvxor lt!441758 (bvlshr lt!441758 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998033 d!119409))

(declare-fun d!119413 () Bool)

(assert (=> d!119413 (= (validKeyInArray!0 (select (arr!30388 a!3219) j!170)) (and (not (= (select (arr!30388 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30388 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998027 d!119413))

(declare-fun d!119415 () Bool)

(declare-fun lt!441784 () SeekEntryResult!9256)

(assert (=> d!119415 (and (or ((_ is Undefined!9256) lt!441784) (not ((_ is Found!9256) lt!441784)) (and (bvsge (index!39396 lt!441784) #b00000000000000000000000000000000) (bvslt (index!39396 lt!441784) (size!30891 a!3219)))) (or ((_ is Undefined!9256) lt!441784) ((_ is Found!9256) lt!441784) (not ((_ is MissingZero!9256) lt!441784)) (and (bvsge (index!39395 lt!441784) #b00000000000000000000000000000000) (bvslt (index!39395 lt!441784) (size!30891 a!3219)))) (or ((_ is Undefined!9256) lt!441784) ((_ is Found!9256) lt!441784) ((_ is MissingZero!9256) lt!441784) (not ((_ is MissingVacant!9256) lt!441784)) (and (bvsge (index!39398 lt!441784) #b00000000000000000000000000000000) (bvslt (index!39398 lt!441784) (size!30891 a!3219)))) (or ((_ is Undefined!9256) lt!441784) (ite ((_ is Found!9256) lt!441784) (= (select (arr!30388 a!3219) (index!39396 lt!441784)) k0!2224) (ite ((_ is MissingZero!9256) lt!441784) (= (select (arr!30388 a!3219) (index!39395 lt!441784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9256) lt!441784) (= (select (arr!30388 a!3219) (index!39398 lt!441784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!563173 () SeekEntryResult!9256)

(assert (=> d!119415 (= lt!441784 e!563173)))

(declare-fun c!101427 () Bool)

(declare-fun lt!441785 () SeekEntryResult!9256)

(assert (=> d!119415 (= c!101427 (and ((_ is Intermediate!9256) lt!441785) (undefined!10068 lt!441785)))))

(assert (=> d!119415 (= lt!441785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119415 (validMask!0 mask!3464)))

(assert (=> d!119415 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441784)))

(declare-fun b!998294 () Bool)

(declare-fun c!101426 () Bool)

(declare-fun lt!441783 () (_ BitVec 64))

(assert (=> b!998294 (= c!101426 (= lt!441783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563175 () SeekEntryResult!9256)

(declare-fun e!563174 () SeekEntryResult!9256)

(assert (=> b!998294 (= e!563175 e!563174)))

(declare-fun b!998295 () Bool)

(assert (=> b!998295 (= e!563174 (MissingZero!9256 (index!39397 lt!441785)))))

(declare-fun b!998296 () Bool)

(assert (=> b!998296 (= e!563173 Undefined!9256)))

(declare-fun b!998297 () Bool)

(assert (=> b!998297 (= e!563173 e!563175)))

(assert (=> b!998297 (= lt!441783 (select (arr!30388 a!3219) (index!39397 lt!441785)))))

(declare-fun c!101428 () Bool)

(assert (=> b!998297 (= c!101428 (= lt!441783 k0!2224))))

(declare-fun b!998298 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63123 (_ BitVec 32)) SeekEntryResult!9256)

(assert (=> b!998298 (= e!563174 (seekKeyOrZeroReturnVacant!0 (x!86978 lt!441785) (index!39397 lt!441785) (index!39397 lt!441785) k0!2224 a!3219 mask!3464))))

(declare-fun b!998299 () Bool)

(assert (=> b!998299 (= e!563175 (Found!9256 (index!39397 lt!441785)))))

(assert (= (and d!119415 c!101427) b!998296))

(assert (= (and d!119415 (not c!101427)) b!998297))

(assert (= (and b!998297 c!101428) b!998299))

(assert (= (and b!998297 (not c!101428)) b!998294))

(assert (= (and b!998294 c!101426) b!998295))

(assert (= (and b!998294 (not c!101426)) b!998298))

(declare-fun m!925553 () Bool)

(assert (=> d!119415 m!925553))

(declare-fun m!925555 () Bool)

(assert (=> d!119415 m!925555))

(assert (=> d!119415 m!925555))

(declare-fun m!925557 () Bool)

(assert (=> d!119415 m!925557))

(declare-fun m!925559 () Bool)

(assert (=> d!119415 m!925559))

(declare-fun m!925561 () Bool)

(assert (=> d!119415 m!925561))

(assert (=> d!119415 m!925407))

(declare-fun m!925563 () Bool)

(assert (=> b!998297 m!925563))

(declare-fun m!925565 () Bool)

(assert (=> b!998298 m!925565))

(assert (=> b!998029 d!119415))

(declare-fun d!119433 () Bool)

(declare-fun res!667741 () Bool)

(declare-fun e!563184 () Bool)

(assert (=> d!119433 (=> res!667741 e!563184)))

(assert (=> d!119433 (= res!667741 (bvsge #b00000000000000000000000000000000 (size!30891 a!3219)))))

(assert (=> d!119433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563184)))

(declare-fun b!998308 () Bool)

(declare-fun e!563182 () Bool)

(declare-fun e!563183 () Bool)

(assert (=> b!998308 (= e!563182 e!563183)))

(declare-fun lt!441799 () (_ BitVec 64))

(assert (=> b!998308 (= lt!441799 (select (arr!30388 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32963 0))(
  ( (Unit!32964) )
))
(declare-fun lt!441800 () Unit!32963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63123 (_ BitVec 64) (_ BitVec 32)) Unit!32963)

(assert (=> b!998308 (= lt!441800 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441799 #b00000000000000000000000000000000))))

(assert (=> b!998308 (arrayContainsKey!0 a!3219 lt!441799 #b00000000000000000000000000000000)))

(declare-fun lt!441798 () Unit!32963)

(assert (=> b!998308 (= lt!441798 lt!441800)))

(declare-fun res!667742 () Bool)

(assert (=> b!998308 (= res!667742 (= (seekEntryOrOpen!0 (select (arr!30388 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9256 #b00000000000000000000000000000000)))))

(assert (=> b!998308 (=> (not res!667742) (not e!563183))))

(declare-fun b!998309 () Bool)

(declare-fun call!42301 () Bool)

(assert (=> b!998309 (= e!563182 call!42301)))

(declare-fun b!998310 () Bool)

(assert (=> b!998310 (= e!563184 e!563182)))

(declare-fun c!101431 () Bool)

(assert (=> b!998310 (= c!101431 (validKeyInArray!0 (select (arr!30388 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998311 () Bool)

(assert (=> b!998311 (= e!563183 call!42301)))

(declare-fun bm!42298 () Bool)

(assert (=> bm!42298 (= call!42301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119433 (not res!667741)) b!998310))

(assert (= (and b!998310 c!101431) b!998308))

(assert (= (and b!998310 (not c!101431)) b!998309))

(assert (= (and b!998308 res!667742) b!998311))

(assert (= (or b!998311 b!998309) bm!42298))

(assert (=> b!998308 m!925471))

(declare-fun m!925567 () Bool)

(assert (=> b!998308 m!925567))

(declare-fun m!925569 () Bool)

(assert (=> b!998308 m!925569))

(assert (=> b!998308 m!925471))

(declare-fun m!925571 () Bool)

(assert (=> b!998308 m!925571))

(assert (=> b!998310 m!925471))

(assert (=> b!998310 m!925471))

(assert (=> b!998310 m!925499))

(declare-fun m!925573 () Bool)

(assert (=> bm!42298 m!925573))

(assert (=> b!998034 d!119433))

(check-sat (not b!998134) (not bm!42294) (not b!998126) (not b!998186) (not d!119381) (not bm!42298) (not b!998190) (not b!998310) (not b!998189) (not d!119415) (not b!998308) (not d!119407) (not b!998197) (not b!998298))
(check-sat)
