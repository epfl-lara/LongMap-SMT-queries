; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44376 () Bool)

(assert start!44376)

(declare-fun b!487607 () Bool)

(declare-fun res!291027 () Bool)

(declare-fun e!286854 () Bool)

(assert (=> b!487607 (=> (not res!291027) (not e!286854))))

(declare-datatypes ((array!31592 0))(
  ( (array!31593 (arr!15188 (Array (_ BitVec 32) (_ BitVec 64))) (size!15553 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31592)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487607 (= res!291027 (validKeyInArray!0 (select (arr!15188 a!3235) j!176)))))

(declare-fun res!291028 () Bool)

(assert (=> start!44376 (=> (not res!291028) (not e!286854))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44376 (= res!291028 (validMask!0 mask!3524))))

(assert (=> start!44376 e!286854))

(assert (=> start!44376 true))

(declare-fun array_inv!11071 (array!31592) Bool)

(assert (=> start!44376 (array_inv!11071 a!3235)))

(declare-fun b!487608 () Bool)

(declare-fun res!291025 () Bool)

(declare-fun e!286857 () Bool)

(assert (=> b!487608 (=> (not res!291025) (not e!286857))))

(declare-datatypes ((List!9385 0))(
  ( (Nil!9382) (Cons!9381 (h!10237 (_ BitVec 64)) (t!15604 List!9385)) )
))
(declare-fun arrayNoDuplicates!0 (array!31592 (_ BitVec 32) List!9385) Bool)

(assert (=> b!487608 (= res!291025 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9382))))

(declare-fun e!286855 () Bool)

(declare-fun b!487609 () Bool)

(declare-datatypes ((SeekEntryResult!3652 0))(
  ( (MissingZero!3652 (index!16787 (_ BitVec 32))) (Found!3652 (index!16788 (_ BitVec 32))) (Intermediate!3652 (undefined!4464 Bool) (index!16789 (_ BitVec 32)) (x!45915 (_ BitVec 32))) (Undefined!3652) (MissingVacant!3652 (index!16790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31592 (_ BitVec 32)) SeekEntryResult!3652)

(assert (=> b!487609 (= e!286855 (= (seekEntryOrOpen!0 (select (arr!15188 a!3235) j!176) a!3235 mask!3524) (Found!3652 j!176)))))

(declare-fun b!487610 () Bool)

(declare-fun res!291026 () Bool)

(assert (=> b!487610 (=> (not res!291026) (not e!286854))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!487610 (= res!291026 (validKeyInArray!0 k0!2280))))

(declare-fun b!487611 () Bool)

(declare-fun res!291021 () Bool)

(assert (=> b!487611 (=> (not res!291021) (not e!286857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31592 (_ BitVec 32)) Bool)

(assert (=> b!487611 (= res!291021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487612 () Bool)

(assert (=> b!487612 (= e!286854 e!286857)))

(declare-fun res!291022 () Bool)

(assert (=> b!487612 (=> (not res!291022) (not e!286857))))

(declare-fun lt!219955 () SeekEntryResult!3652)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487612 (= res!291022 (or (= lt!219955 (MissingZero!3652 i!1204)) (= lt!219955 (MissingVacant!3652 i!1204))))))

(assert (=> b!487612 (= lt!219955 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487613 () Bool)

(declare-fun res!291024 () Bool)

(assert (=> b!487613 (=> (not res!291024) (not e!286854))))

(assert (=> b!487613 (= res!291024 (and (= (size!15553 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15553 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15553 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487614 () Bool)

(declare-fun res!291029 () Bool)

(assert (=> b!487614 (=> (not res!291029) (not e!286854))))

(declare-fun arrayContainsKey!0 (array!31592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487614 (= res!291029 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487615 () Bool)

(declare-fun lt!219954 () (_ BitVec 32))

(assert (=> b!487615 (= e!286857 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!219954 #b00000000000000000000000000000000) (bvslt lt!219954 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487615 (= lt!219954 (toIndex!0 (select (arr!15188 a!3235) j!176) mask!3524))))

(assert (=> b!487615 e!286855))

(declare-fun res!291023 () Bool)

(assert (=> b!487615 (=> (not res!291023) (not e!286855))))

(assert (=> b!487615 (= res!291023 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14236 0))(
  ( (Unit!14237) )
))
(declare-fun lt!219953 () Unit!14236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14236)

(assert (=> b!487615 (= lt!219953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44376 res!291028) b!487613))

(assert (= (and b!487613 res!291024) b!487607))

(assert (= (and b!487607 res!291027) b!487610))

(assert (= (and b!487610 res!291026) b!487614))

(assert (= (and b!487614 res!291029) b!487612))

(assert (= (and b!487612 res!291022) b!487611))

(assert (= (and b!487611 res!291021) b!487608))

(assert (= (and b!487608 res!291025) b!487615))

(assert (= (and b!487615 res!291023) b!487609))

(declare-fun m!466909 () Bool)

(assert (=> b!487610 m!466909))

(declare-fun m!466911 () Bool)

(assert (=> b!487607 m!466911))

(assert (=> b!487607 m!466911))

(declare-fun m!466913 () Bool)

(assert (=> b!487607 m!466913))

(declare-fun m!466915 () Bool)

(assert (=> b!487614 m!466915))

(declare-fun m!466917 () Bool)

(assert (=> b!487612 m!466917))

(declare-fun m!466919 () Bool)

(assert (=> b!487608 m!466919))

(declare-fun m!466921 () Bool)

(assert (=> start!44376 m!466921))

(declare-fun m!466923 () Bool)

(assert (=> start!44376 m!466923))

(declare-fun m!466925 () Bool)

(assert (=> b!487611 m!466925))

(assert (=> b!487609 m!466911))

(assert (=> b!487609 m!466911))

(declare-fun m!466927 () Bool)

(assert (=> b!487609 m!466927))

(assert (=> b!487615 m!466911))

(assert (=> b!487615 m!466911))

(declare-fun m!466929 () Bool)

(assert (=> b!487615 m!466929))

(declare-fun m!466931 () Bool)

(assert (=> b!487615 m!466931))

(declare-fun m!466933 () Bool)

(assert (=> b!487615 m!466933))

(check-sat (not b!487610) (not start!44376) (not b!487608) (not b!487611) (not b!487607) (not b!487609) (not b!487612) (not b!487615) (not b!487614))
(check-sat)
(get-model)

(declare-fun d!77503 () Bool)

(assert (=> d!77503 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487610 d!77503))

(declare-fun d!77505 () Bool)

(assert (=> d!77505 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44376 d!77505))

(declare-fun d!77513 () Bool)

(assert (=> d!77513 (= (array_inv!11071 a!3235) (bvsge (size!15553 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44376 d!77513))

(declare-fun d!77515 () Bool)

(declare-fun lt!219979 () (_ BitVec 32))

(declare-fun lt!219978 () (_ BitVec 32))

(assert (=> d!77515 (= lt!219979 (bvmul (bvxor lt!219978 (bvlshr lt!219978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77515 (= lt!219978 ((_ extract 31 0) (bvand (bvxor (select (arr!15188 a!3235) j!176) (bvlshr (select (arr!15188 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77515 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291090 (let ((h!10240 ((_ extract 31 0) (bvand (bvxor (select (arr!15188 a!3235) j!176) (bvlshr (select (arr!15188 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!45918 (bvmul (bvxor h!10240 (bvlshr h!10240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!45918 (bvlshr x!45918 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291090 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291090 #b00000000000000000000000000000000))))))

(assert (=> d!77515 (= (toIndex!0 (select (arr!15188 a!3235) j!176) mask!3524) (bvand (bvxor lt!219979 (bvlshr lt!219979 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!487615 d!77515))

(declare-fun b!487705 () Bool)

(declare-fun e!286911 () Bool)

(declare-fun call!31288 () Bool)

(assert (=> b!487705 (= e!286911 call!31288)))

(declare-fun b!487706 () Bool)

(declare-fun e!286909 () Bool)

(assert (=> b!487706 (= e!286909 e!286911)))

(declare-fun lt!219997 () (_ BitVec 64))

(assert (=> b!487706 (= lt!219997 (select (arr!15188 a!3235) j!176))))

(declare-fun lt!219996 () Unit!14236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31592 (_ BitVec 64) (_ BitVec 32)) Unit!14236)

(assert (=> b!487706 (= lt!219996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219997 j!176))))

(assert (=> b!487706 (arrayContainsKey!0 a!3235 lt!219997 #b00000000000000000000000000000000)))

(declare-fun lt!219995 () Unit!14236)

(assert (=> b!487706 (= lt!219995 lt!219996)))

(declare-fun res!291105 () Bool)

(assert (=> b!487706 (= res!291105 (= (seekEntryOrOpen!0 (select (arr!15188 a!3235) j!176) a!3235 mask!3524) (Found!3652 j!176)))))

(assert (=> b!487706 (=> (not res!291105) (not e!286911))))

(declare-fun b!487707 () Bool)

(declare-fun e!286910 () Bool)

(assert (=> b!487707 (= e!286910 e!286909)))

(declare-fun c!58569 () Bool)

(assert (=> b!487707 (= c!58569 (validKeyInArray!0 (select (arr!15188 a!3235) j!176)))))

(declare-fun bm!31285 () Bool)

(assert (=> bm!31285 (= call!31288 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77519 () Bool)

(declare-fun res!291104 () Bool)

(assert (=> d!77519 (=> res!291104 e!286910)))

(assert (=> d!77519 (= res!291104 (bvsge j!176 (size!15553 a!3235)))))

(assert (=> d!77519 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!286910)))

(declare-fun b!487708 () Bool)

(assert (=> b!487708 (= e!286909 call!31288)))

(assert (= (and d!77519 (not res!291104)) b!487707))

(assert (= (and b!487707 c!58569) b!487706))

(assert (= (and b!487707 (not c!58569)) b!487708))

(assert (= (and b!487706 res!291105) b!487705))

(assert (= (or b!487705 b!487708) bm!31285))

(assert (=> b!487706 m!466911))

(declare-fun m!467007 () Bool)

(assert (=> b!487706 m!467007))

(declare-fun m!467009 () Bool)

(assert (=> b!487706 m!467009))

(assert (=> b!487706 m!466911))

(assert (=> b!487706 m!466927))

(assert (=> b!487707 m!466911))

(assert (=> b!487707 m!466911))

(assert (=> b!487707 m!466913))

(declare-fun m!467011 () Bool)

(assert (=> bm!31285 m!467011))

(assert (=> b!487615 d!77519))

(declare-fun d!77523 () Bool)

(assert (=> d!77523 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220000 () Unit!14236)

(declare-fun choose!38 (array!31592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14236)

(assert (=> d!77523 (= lt!220000 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77523 (validMask!0 mask!3524)))

(assert (=> d!77523 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220000)))

(declare-fun bs!15523 () Bool)

(assert (= bs!15523 d!77523))

(assert (=> bs!15523 m!466931))

(declare-fun m!467013 () Bool)

(assert (=> bs!15523 m!467013))

(assert (=> bs!15523 m!466921))

(assert (=> b!487615 d!77523))

(declare-fun b!487709 () Bool)

(declare-fun e!286914 () Bool)

(declare-fun call!31289 () Bool)

(assert (=> b!487709 (= e!286914 call!31289)))

(declare-fun b!487710 () Bool)

(declare-fun e!286912 () Bool)

(assert (=> b!487710 (= e!286912 e!286914)))

(declare-fun lt!220003 () (_ BitVec 64))

(assert (=> b!487710 (= lt!220003 (select (arr!15188 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220002 () Unit!14236)

(assert (=> b!487710 (= lt!220002 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220003 #b00000000000000000000000000000000))))

(assert (=> b!487710 (arrayContainsKey!0 a!3235 lt!220003 #b00000000000000000000000000000000)))

(declare-fun lt!220001 () Unit!14236)

(assert (=> b!487710 (= lt!220001 lt!220002)))

(declare-fun res!291107 () Bool)

(assert (=> b!487710 (= res!291107 (= (seekEntryOrOpen!0 (select (arr!15188 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3652 #b00000000000000000000000000000000)))))

(assert (=> b!487710 (=> (not res!291107) (not e!286914))))

(declare-fun b!487711 () Bool)

(declare-fun e!286913 () Bool)

(assert (=> b!487711 (= e!286913 e!286912)))

(declare-fun c!58570 () Bool)

(assert (=> b!487711 (= c!58570 (validKeyInArray!0 (select (arr!15188 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31286 () Bool)

(assert (=> bm!31286 (= call!31289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77525 () Bool)

(declare-fun res!291106 () Bool)

(assert (=> d!77525 (=> res!291106 e!286913)))

(assert (=> d!77525 (= res!291106 (bvsge #b00000000000000000000000000000000 (size!15553 a!3235)))))

(assert (=> d!77525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286913)))

(declare-fun b!487712 () Bool)

(assert (=> b!487712 (= e!286912 call!31289)))

(assert (= (and d!77525 (not res!291106)) b!487711))

(assert (= (and b!487711 c!58570) b!487710))

(assert (= (and b!487711 (not c!58570)) b!487712))

(assert (= (and b!487710 res!291107) b!487709))

(assert (= (or b!487709 b!487712) bm!31286))

(declare-fun m!467015 () Bool)

(assert (=> b!487710 m!467015))

(declare-fun m!467017 () Bool)

(assert (=> b!487710 m!467017))

(declare-fun m!467019 () Bool)

(assert (=> b!487710 m!467019))

(assert (=> b!487710 m!467015))

(declare-fun m!467021 () Bool)

(assert (=> b!487710 m!467021))

(assert (=> b!487711 m!467015))

(assert (=> b!487711 m!467015))

(declare-fun m!467023 () Bool)

(assert (=> b!487711 m!467023))

(declare-fun m!467025 () Bool)

(assert (=> bm!31286 m!467025))

(assert (=> b!487611 d!77525))

(declare-fun b!487787 () Bool)

(declare-fun e!286957 () SeekEntryResult!3652)

(declare-fun lt!220047 () SeekEntryResult!3652)

(assert (=> b!487787 (= e!286957 (MissingZero!3652 (index!16789 lt!220047)))))

(declare-fun b!487788 () Bool)

(declare-fun e!286958 () SeekEntryResult!3652)

(assert (=> b!487788 (= e!286958 (Found!3652 (index!16789 lt!220047)))))

(declare-fun b!487789 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31592 (_ BitVec 32)) SeekEntryResult!3652)

(assert (=> b!487789 (= e!286957 (seekKeyOrZeroReturnVacant!0 (x!45915 lt!220047) (index!16789 lt!220047) (index!16789 lt!220047) k0!2280 a!3235 mask!3524))))

(declare-fun d!77527 () Bool)

(declare-fun lt!220048 () SeekEntryResult!3652)

(get-info :version)

(assert (=> d!77527 (and (or ((_ is Undefined!3652) lt!220048) (not ((_ is Found!3652) lt!220048)) (and (bvsge (index!16788 lt!220048) #b00000000000000000000000000000000) (bvslt (index!16788 lt!220048) (size!15553 a!3235)))) (or ((_ is Undefined!3652) lt!220048) ((_ is Found!3652) lt!220048) (not ((_ is MissingZero!3652) lt!220048)) (and (bvsge (index!16787 lt!220048) #b00000000000000000000000000000000) (bvslt (index!16787 lt!220048) (size!15553 a!3235)))) (or ((_ is Undefined!3652) lt!220048) ((_ is Found!3652) lt!220048) ((_ is MissingZero!3652) lt!220048) (not ((_ is MissingVacant!3652) lt!220048)) (and (bvsge (index!16790 lt!220048) #b00000000000000000000000000000000) (bvslt (index!16790 lt!220048) (size!15553 a!3235)))) (or ((_ is Undefined!3652) lt!220048) (ite ((_ is Found!3652) lt!220048) (= (select (arr!15188 a!3235) (index!16788 lt!220048)) k0!2280) (ite ((_ is MissingZero!3652) lt!220048) (= (select (arr!15188 a!3235) (index!16787 lt!220048)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3652) lt!220048) (= (select (arr!15188 a!3235) (index!16790 lt!220048)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286959 () SeekEntryResult!3652)

(assert (=> d!77527 (= lt!220048 e!286959)))

(declare-fun c!58604 () Bool)

(assert (=> d!77527 (= c!58604 (and ((_ is Intermediate!3652) lt!220047) (undefined!4464 lt!220047)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31592 (_ BitVec 32)) SeekEntryResult!3652)

(assert (=> d!77527 (= lt!220047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77527 (validMask!0 mask!3524)))

(assert (=> d!77527 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220048)))

(declare-fun b!487790 () Bool)

(declare-fun c!58605 () Bool)

(declare-fun lt!220046 () (_ BitVec 64))

(assert (=> b!487790 (= c!58605 (= lt!220046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487790 (= e!286958 e!286957)))

(declare-fun b!487791 () Bool)

(assert (=> b!487791 (= e!286959 e!286958)))

(assert (=> b!487791 (= lt!220046 (select (arr!15188 a!3235) (index!16789 lt!220047)))))

(declare-fun c!58603 () Bool)

(assert (=> b!487791 (= c!58603 (= lt!220046 k0!2280))))

(declare-fun b!487792 () Bool)

(assert (=> b!487792 (= e!286959 Undefined!3652)))

(assert (= (and d!77527 c!58604) b!487792))

(assert (= (and d!77527 (not c!58604)) b!487791))

(assert (= (and b!487791 c!58603) b!487788))

(assert (= (and b!487791 (not c!58603)) b!487790))

(assert (= (and b!487790 c!58605) b!487787))

(assert (= (and b!487790 (not c!58605)) b!487789))

(declare-fun m!467081 () Bool)

(assert (=> b!487789 m!467081))

(declare-fun m!467083 () Bool)

(assert (=> d!77527 m!467083))

(assert (=> d!77527 m!466921))

(declare-fun m!467085 () Bool)

(assert (=> d!77527 m!467085))

(declare-fun m!467087 () Bool)

(assert (=> d!77527 m!467087))

(declare-fun m!467089 () Bool)

(assert (=> d!77527 m!467089))

(assert (=> d!77527 m!467087))

(declare-fun m!467091 () Bool)

(assert (=> d!77527 m!467091))

(declare-fun m!467093 () Bool)

(assert (=> b!487791 m!467093))

(assert (=> b!487612 d!77527))

(declare-fun d!77545 () Bool)

(assert (=> d!77545 (= (validKeyInArray!0 (select (arr!15188 a!3235) j!176)) (and (not (= (select (arr!15188 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15188 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487607 d!77545))

(declare-fun d!77547 () Bool)

(declare-fun res!291125 () Bool)

(declare-fun e!286967 () Bool)

(assert (=> d!77547 (=> res!291125 e!286967)))

(assert (=> d!77547 (= res!291125 (= (select (arr!15188 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77547 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286967)))

(declare-fun b!487801 () Bool)

(declare-fun e!286968 () Bool)

(assert (=> b!487801 (= e!286967 e!286968)))

(declare-fun res!291126 () Bool)

(assert (=> b!487801 (=> (not res!291126) (not e!286968))))

(assert (=> b!487801 (= res!291126 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15553 a!3235)))))

(declare-fun b!487802 () Bool)

(assert (=> b!487802 (= e!286968 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77547 (not res!291125)) b!487801))

(assert (= (and b!487801 res!291126) b!487802))

(assert (=> d!77547 m!467015))

(declare-fun m!467101 () Bool)

(assert (=> b!487802 m!467101))

(assert (=> b!487614 d!77547))

(declare-fun b!487803 () Bool)

(declare-fun e!286969 () SeekEntryResult!3652)

(declare-fun lt!220053 () SeekEntryResult!3652)

(assert (=> b!487803 (= e!286969 (MissingZero!3652 (index!16789 lt!220053)))))

(declare-fun b!487804 () Bool)

(declare-fun e!286970 () SeekEntryResult!3652)

(assert (=> b!487804 (= e!286970 (Found!3652 (index!16789 lt!220053)))))

(declare-fun b!487805 () Bool)

(assert (=> b!487805 (= e!286969 (seekKeyOrZeroReturnVacant!0 (x!45915 lt!220053) (index!16789 lt!220053) (index!16789 lt!220053) (select (arr!15188 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!77553 () Bool)

(declare-fun lt!220054 () SeekEntryResult!3652)

(assert (=> d!77553 (and (or ((_ is Undefined!3652) lt!220054) (not ((_ is Found!3652) lt!220054)) (and (bvsge (index!16788 lt!220054) #b00000000000000000000000000000000) (bvslt (index!16788 lt!220054) (size!15553 a!3235)))) (or ((_ is Undefined!3652) lt!220054) ((_ is Found!3652) lt!220054) (not ((_ is MissingZero!3652) lt!220054)) (and (bvsge (index!16787 lt!220054) #b00000000000000000000000000000000) (bvslt (index!16787 lt!220054) (size!15553 a!3235)))) (or ((_ is Undefined!3652) lt!220054) ((_ is Found!3652) lt!220054) ((_ is MissingZero!3652) lt!220054) (not ((_ is MissingVacant!3652) lt!220054)) (and (bvsge (index!16790 lt!220054) #b00000000000000000000000000000000) (bvslt (index!16790 lt!220054) (size!15553 a!3235)))) (or ((_ is Undefined!3652) lt!220054) (ite ((_ is Found!3652) lt!220054) (= (select (arr!15188 a!3235) (index!16788 lt!220054)) (select (arr!15188 a!3235) j!176)) (ite ((_ is MissingZero!3652) lt!220054) (= (select (arr!15188 a!3235) (index!16787 lt!220054)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3652) lt!220054) (= (select (arr!15188 a!3235) (index!16790 lt!220054)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286971 () SeekEntryResult!3652)

(assert (=> d!77553 (= lt!220054 e!286971)))

(declare-fun c!58608 () Bool)

(assert (=> d!77553 (= c!58608 (and ((_ is Intermediate!3652) lt!220053) (undefined!4464 lt!220053)))))

(assert (=> d!77553 (= lt!220053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15188 a!3235) j!176) mask!3524) (select (arr!15188 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77553 (validMask!0 mask!3524)))

(assert (=> d!77553 (= (seekEntryOrOpen!0 (select (arr!15188 a!3235) j!176) a!3235 mask!3524) lt!220054)))

(declare-fun b!487806 () Bool)

(declare-fun c!58609 () Bool)

(declare-fun lt!220052 () (_ BitVec 64))

(assert (=> b!487806 (= c!58609 (= lt!220052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487806 (= e!286970 e!286969)))

(declare-fun b!487807 () Bool)

(assert (=> b!487807 (= e!286971 e!286970)))

(assert (=> b!487807 (= lt!220052 (select (arr!15188 a!3235) (index!16789 lt!220053)))))

(declare-fun c!58607 () Bool)

(assert (=> b!487807 (= c!58607 (= lt!220052 (select (arr!15188 a!3235) j!176)))))

(declare-fun b!487808 () Bool)

(assert (=> b!487808 (= e!286971 Undefined!3652)))

(assert (= (and d!77553 c!58608) b!487808))

(assert (= (and d!77553 (not c!58608)) b!487807))

(assert (= (and b!487807 c!58607) b!487804))

(assert (= (and b!487807 (not c!58607)) b!487806))

(assert (= (and b!487806 c!58609) b!487803))

(assert (= (and b!487806 (not c!58609)) b!487805))

(assert (=> b!487805 m!466911))

(declare-fun m!467103 () Bool)

(assert (=> b!487805 m!467103))

(declare-fun m!467105 () Bool)

(assert (=> d!77553 m!467105))

(assert (=> d!77553 m!466921))

(declare-fun m!467107 () Bool)

(assert (=> d!77553 m!467107))

(assert (=> d!77553 m!466911))

(assert (=> d!77553 m!466929))

(declare-fun m!467109 () Bool)

(assert (=> d!77553 m!467109))

(assert (=> d!77553 m!466929))

(assert (=> d!77553 m!466911))

(declare-fun m!467111 () Bool)

(assert (=> d!77553 m!467111))

(declare-fun m!467113 () Bool)

(assert (=> b!487807 m!467113))

(assert (=> b!487609 d!77553))

(declare-fun b!487833 () Bool)

(declare-fun e!286992 () Bool)

(declare-fun call!31297 () Bool)

(assert (=> b!487833 (= e!286992 call!31297)))

(declare-fun b!487834 () Bool)

(assert (=> b!487834 (= e!286992 call!31297)))

(declare-fun b!487835 () Bool)

(declare-fun e!286995 () Bool)

(assert (=> b!487835 (= e!286995 e!286992)))

(declare-fun c!58614 () Bool)

(assert (=> b!487835 (= c!58614 (validKeyInArray!0 (select (arr!15188 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487836 () Bool)

(declare-fun e!286993 () Bool)

(declare-fun contains!2684 (List!9385 (_ BitVec 64)) Bool)

(assert (=> b!487836 (= e!286993 (contains!2684 Nil!9382 (select (arr!15188 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31294 () Bool)

(assert (=> bm!31294 (= call!31297 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58614 (Cons!9381 (select (arr!15188 a!3235) #b00000000000000000000000000000000) Nil!9382) Nil!9382)))))

(declare-fun b!487837 () Bool)

(declare-fun e!286994 () Bool)

(assert (=> b!487837 (= e!286994 e!286995)))

(declare-fun res!291145 () Bool)

(assert (=> b!487837 (=> (not res!291145) (not e!286995))))

(assert (=> b!487837 (= res!291145 (not e!286993))))

(declare-fun res!291146 () Bool)

(assert (=> b!487837 (=> (not res!291146) (not e!286993))))

(assert (=> b!487837 (= res!291146 (validKeyInArray!0 (select (arr!15188 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77557 () Bool)

(declare-fun res!291144 () Bool)

(assert (=> d!77557 (=> res!291144 e!286994)))

(assert (=> d!77557 (= res!291144 (bvsge #b00000000000000000000000000000000 (size!15553 a!3235)))))

(assert (=> d!77557 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9382) e!286994)))

(assert (= (and d!77557 (not res!291144)) b!487837))

(assert (= (and b!487837 res!291146) b!487836))

(assert (= (and b!487837 res!291145) b!487835))

(assert (= (and b!487835 c!58614) b!487833))

(assert (= (and b!487835 (not c!58614)) b!487834))

(assert (= (or b!487833 b!487834) bm!31294))

(assert (=> b!487835 m!467015))

(assert (=> b!487835 m!467015))

(assert (=> b!487835 m!467023))

(assert (=> b!487836 m!467015))

(assert (=> b!487836 m!467015))

(declare-fun m!467133 () Bool)

(assert (=> b!487836 m!467133))

(assert (=> bm!31294 m!467015))

(declare-fun m!467135 () Bool)

(assert (=> bm!31294 m!467135))

(assert (=> b!487837 m!467015))

(assert (=> b!487837 m!467015))

(assert (=> b!487837 m!467023))

(assert (=> b!487608 d!77557))

(check-sat (not b!487789) (not b!487805) (not b!487836) (not b!487835) (not d!77523) (not d!77527) (not b!487711) (not b!487707) (not bm!31294) (not bm!31286) (not b!487837) (not b!487802) (not b!487710) (not d!77553) (not b!487706) (not bm!31285))
(check-sat)
