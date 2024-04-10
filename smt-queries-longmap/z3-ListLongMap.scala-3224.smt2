; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45092 () Bool)

(assert start!45092)

(declare-fun b!495040 () Bool)

(declare-fun res!297619 () Bool)

(declare-fun e!290436 () Bool)

(assert (=> b!495040 (=> (not res!297619) (not e!290436))))

(declare-datatypes ((array!32037 0))(
  ( (array!32038 (arr!15403 (Array (_ BitVec 32) (_ BitVec 64))) (size!15767 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32037)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32037 (_ BitVec 32)) Bool)

(assert (=> b!495040 (= res!297619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!297618 () Bool)

(declare-fun e!290434 () Bool)

(assert (=> start!45092 (=> (not res!297618) (not e!290434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45092 (= res!297618 (validMask!0 mask!3524))))

(assert (=> start!45092 e!290434))

(assert (=> start!45092 true))

(declare-fun array_inv!11199 (array!32037) Bool)

(assert (=> start!45092 (array_inv!11199 a!3235)))

(declare-fun b!495041 () Bool)

(declare-fun res!297617 () Bool)

(assert (=> b!495041 (=> (not res!297617) (not e!290434))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495041 (= res!297617 (validKeyInArray!0 (select (arr!15403 a!3235) j!176)))))

(declare-fun e!290435 () Bool)

(declare-fun b!495042 () Bool)

(declare-datatypes ((SeekEntryResult!3870 0))(
  ( (MissingZero!3870 (index!17659 (_ BitVec 32))) (Found!3870 (index!17660 (_ BitVec 32))) (Intermediate!3870 (undefined!4682 Bool) (index!17661 (_ BitVec 32)) (x!46724 (_ BitVec 32))) (Undefined!3870) (MissingVacant!3870 (index!17662 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32037 (_ BitVec 32)) SeekEntryResult!3870)

(assert (=> b!495042 (= e!290435 (= (seekEntryOrOpen!0 (select (arr!15403 a!3235) j!176) a!3235 mask!3524) (Found!3870 j!176)))))

(declare-fun b!495043 () Bool)

(declare-fun res!297612 () Bool)

(declare-fun e!290432 () Bool)

(assert (=> b!495043 (=> res!297612 e!290432)))

(declare-fun lt!224113 () SeekEntryResult!3870)

(get-info :version)

(assert (=> b!495043 (= res!297612 (or (undefined!4682 lt!224113) (not ((_ is Intermediate!3870) lt!224113))))))

(declare-fun b!495044 () Bool)

(declare-fun res!297611 () Bool)

(assert (=> b!495044 (=> (not res!297611) (not e!290434))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495044 (= res!297611 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495045 () Bool)

(assert (=> b!495045 (= e!290436 (not e!290432))))

(declare-fun res!297613 () Bool)

(assert (=> b!495045 (=> res!297613 e!290432)))

(declare-fun lt!224110 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32037 (_ BitVec 32)) SeekEntryResult!3870)

(assert (=> b!495045 (= res!297613 (= lt!224113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224110 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)) mask!3524)))))

(declare-fun lt!224111 () (_ BitVec 32))

(assert (=> b!495045 (= lt!224113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224111 (select (arr!15403 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495045 (= lt!224110 (toIndex!0 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495045 (= lt!224111 (toIndex!0 (select (arr!15403 a!3235) j!176) mask!3524))))

(assert (=> b!495045 e!290435))

(declare-fun res!297616 () Bool)

(assert (=> b!495045 (=> (not res!297616) (not e!290435))))

(assert (=> b!495045 (= res!297616 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14686 0))(
  ( (Unit!14687) )
))
(declare-fun lt!224109 () Unit!14686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14686)

(assert (=> b!495045 (= lt!224109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495046 () Bool)

(assert (=> b!495046 (= e!290432 (or (not (= (select (arr!15403 a!3235) (index!17661 lt!224113)) (select (arr!15403 a!3235) j!176))) (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!495046 (and (bvslt (x!46724 lt!224113) #b01111111111111111111111111111110) (or (= (select (arr!15403 a!3235) (index!17661 lt!224113)) (select (arr!15403 a!3235) j!176)) (= (select (arr!15403 a!3235) (index!17661 lt!224113)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15403 a!3235) (index!17661 lt!224113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495047 () Bool)

(declare-fun res!297620 () Bool)

(assert (=> b!495047 (=> (not res!297620) (not e!290436))))

(declare-datatypes ((List!9561 0))(
  ( (Nil!9558) (Cons!9557 (h!10425 (_ BitVec 64)) (t!15789 List!9561)) )
))
(declare-fun arrayNoDuplicates!0 (array!32037 (_ BitVec 32) List!9561) Bool)

(assert (=> b!495047 (= res!297620 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9558))))

(declare-fun b!495048 () Bool)

(declare-fun res!297610 () Bool)

(assert (=> b!495048 (=> (not res!297610) (not e!290434))))

(assert (=> b!495048 (= res!297610 (validKeyInArray!0 k0!2280))))

(declare-fun b!495049 () Bool)

(assert (=> b!495049 (= e!290434 e!290436)))

(declare-fun res!297614 () Bool)

(assert (=> b!495049 (=> (not res!297614) (not e!290436))))

(declare-fun lt!224112 () SeekEntryResult!3870)

(assert (=> b!495049 (= res!297614 (or (= lt!224112 (MissingZero!3870 i!1204)) (= lt!224112 (MissingVacant!3870 i!1204))))))

(assert (=> b!495049 (= lt!224112 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495050 () Bool)

(declare-fun res!297615 () Bool)

(assert (=> b!495050 (=> (not res!297615) (not e!290434))))

(assert (=> b!495050 (= res!297615 (and (= (size!15767 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15767 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15767 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45092 res!297618) b!495050))

(assert (= (and b!495050 res!297615) b!495041))

(assert (= (and b!495041 res!297617) b!495048))

(assert (= (and b!495048 res!297610) b!495044))

(assert (= (and b!495044 res!297611) b!495049))

(assert (= (and b!495049 res!297614) b!495040))

(assert (= (and b!495040 res!297619) b!495047))

(assert (= (and b!495047 res!297620) b!495045))

(assert (= (and b!495045 res!297616) b!495042))

(assert (= (and b!495045 (not res!297613)) b!495043))

(assert (= (and b!495043 (not res!297612)) b!495046))

(declare-fun m!476195 () Bool)

(assert (=> b!495040 m!476195))

(declare-fun m!476197 () Bool)

(assert (=> b!495044 m!476197))

(declare-fun m!476199 () Bool)

(assert (=> b!495046 m!476199))

(declare-fun m!476201 () Bool)

(assert (=> b!495046 m!476201))

(assert (=> b!495042 m!476201))

(assert (=> b!495042 m!476201))

(declare-fun m!476203 () Bool)

(assert (=> b!495042 m!476203))

(assert (=> b!495041 m!476201))

(assert (=> b!495041 m!476201))

(declare-fun m!476205 () Bool)

(assert (=> b!495041 m!476205))

(declare-fun m!476207 () Bool)

(assert (=> b!495049 m!476207))

(declare-fun m!476209 () Bool)

(assert (=> b!495047 m!476209))

(declare-fun m!476211 () Bool)

(assert (=> start!45092 m!476211))

(declare-fun m!476213 () Bool)

(assert (=> start!45092 m!476213))

(declare-fun m!476215 () Bool)

(assert (=> b!495048 m!476215))

(declare-fun m!476217 () Bool)

(assert (=> b!495045 m!476217))

(declare-fun m!476219 () Bool)

(assert (=> b!495045 m!476219))

(declare-fun m!476221 () Bool)

(assert (=> b!495045 m!476221))

(assert (=> b!495045 m!476201))

(declare-fun m!476223 () Bool)

(assert (=> b!495045 m!476223))

(assert (=> b!495045 m!476201))

(declare-fun m!476225 () Bool)

(assert (=> b!495045 m!476225))

(assert (=> b!495045 m!476201))

(declare-fun m!476227 () Bool)

(assert (=> b!495045 m!476227))

(assert (=> b!495045 m!476221))

(declare-fun m!476229 () Bool)

(assert (=> b!495045 m!476229))

(assert (=> b!495045 m!476221))

(declare-fun m!476231 () Bool)

(assert (=> b!495045 m!476231))

(check-sat (not b!495041) (not b!495045) (not start!45092) (not b!495047) (not b!495049) (not b!495042) (not b!495048) (not b!495040) (not b!495044))
(check-sat)
(get-model)

(declare-fun d!78239 () Bool)

(declare-fun res!297658 () Bool)

(declare-fun e!290456 () Bool)

(assert (=> d!78239 (=> res!297658 e!290456)))

(assert (=> d!78239 (= res!297658 (= (select (arr!15403 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78239 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!290456)))

(declare-fun b!495088 () Bool)

(declare-fun e!290457 () Bool)

(assert (=> b!495088 (= e!290456 e!290457)))

(declare-fun res!297659 () Bool)

(assert (=> b!495088 (=> (not res!297659) (not e!290457))))

(assert (=> b!495088 (= res!297659 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15767 a!3235)))))

(declare-fun b!495089 () Bool)

(assert (=> b!495089 (= e!290457 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78239 (not res!297658)) b!495088))

(assert (= (and b!495088 res!297659) b!495089))

(declare-fun m!476271 () Bool)

(assert (=> d!78239 m!476271))

(declare-fun m!476273 () Bool)

(assert (=> b!495089 m!476273))

(assert (=> b!495044 d!78239))

(declare-fun d!78241 () Bool)

(assert (=> d!78241 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45092 d!78241))

(declare-fun d!78245 () Bool)

(assert (=> d!78245 (= (array_inv!11199 a!3235) (bvsge (size!15767 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45092 d!78245))

(declare-fun d!78247 () Bool)

(declare-fun lt!224134 () (_ BitVec 32))

(declare-fun lt!224133 () (_ BitVec 32))

(assert (=> d!78247 (= lt!224134 (bvmul (bvxor lt!224133 (bvlshr lt!224133 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78247 (= lt!224133 ((_ extract 31 0) (bvand (bvxor (select (arr!15403 a!3235) j!176) (bvlshr (select (arr!15403 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78247 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297664 (let ((h!10427 ((_ extract 31 0) (bvand (bvxor (select (arr!15403 a!3235) j!176) (bvlshr (select (arr!15403 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46726 (bvmul (bvxor h!10427 (bvlshr h!10427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46726 (bvlshr x!46726 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297664 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297664 #b00000000000000000000000000000000))))))

(assert (=> d!78247 (= (toIndex!0 (select (arr!15403 a!3235) j!176) mask!3524) (bvand (bvxor lt!224134 (bvlshr lt!224134 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!495045 d!78247))

(declare-fun d!78255 () Bool)

(declare-fun res!297678 () Bool)

(declare-fun e!290476 () Bool)

(assert (=> d!78255 (=> res!297678 e!290476)))

(assert (=> d!78255 (= res!297678 (bvsge j!176 (size!15767 a!3235)))))

(assert (=> d!78255 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!290476)))

(declare-fun b!495110 () Bool)

(declare-fun e!290477 () Bool)

(declare-fun call!31412 () Bool)

(assert (=> b!495110 (= e!290477 call!31412)))

(declare-fun b!495111 () Bool)

(declare-fun e!290478 () Bool)

(assert (=> b!495111 (= e!290478 call!31412)))

(declare-fun b!495112 () Bool)

(assert (=> b!495112 (= e!290477 e!290478)))

(declare-fun lt!224141 () (_ BitVec 64))

(assert (=> b!495112 (= lt!224141 (select (arr!15403 a!3235) j!176))))

(declare-fun lt!224143 () Unit!14686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32037 (_ BitVec 64) (_ BitVec 32)) Unit!14686)

(assert (=> b!495112 (= lt!224143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224141 j!176))))

(assert (=> b!495112 (arrayContainsKey!0 a!3235 lt!224141 #b00000000000000000000000000000000)))

(declare-fun lt!224142 () Unit!14686)

(assert (=> b!495112 (= lt!224142 lt!224143)))

(declare-fun res!297677 () Bool)

(assert (=> b!495112 (= res!297677 (= (seekEntryOrOpen!0 (select (arr!15403 a!3235) j!176) a!3235 mask!3524) (Found!3870 j!176)))))

(assert (=> b!495112 (=> (not res!297677) (not e!290478))))

(declare-fun bm!31409 () Bool)

(assert (=> bm!31409 (= call!31412 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!495113 () Bool)

(assert (=> b!495113 (= e!290476 e!290477)))

(declare-fun c!58991 () Bool)

(assert (=> b!495113 (= c!58991 (validKeyInArray!0 (select (arr!15403 a!3235) j!176)))))

(assert (= (and d!78255 (not res!297678)) b!495113))

(assert (= (and b!495113 c!58991) b!495112))

(assert (= (and b!495113 (not c!58991)) b!495110))

(assert (= (and b!495112 res!297677) b!495111))

(assert (= (or b!495111 b!495110) bm!31409))

(assert (=> b!495112 m!476201))

(declare-fun m!476283 () Bool)

(assert (=> b!495112 m!476283))

(declare-fun m!476285 () Bool)

(assert (=> b!495112 m!476285))

(assert (=> b!495112 m!476201))

(assert (=> b!495112 m!476203))

(declare-fun m!476287 () Bool)

(assert (=> bm!31409 m!476287))

(assert (=> b!495113 m!476201))

(assert (=> b!495113 m!476201))

(assert (=> b!495113 m!476205))

(assert (=> b!495045 d!78255))

(declare-fun b!495150 () Bool)

(declare-fun e!290499 () SeekEntryResult!3870)

(declare-fun e!290502 () SeekEntryResult!3870)

(assert (=> b!495150 (= e!290499 e!290502)))

(declare-fun c!59008 () Bool)

(declare-fun lt!224158 () (_ BitVec 64))

(assert (=> b!495150 (= c!59008 (or (= lt!224158 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!224158 lt!224158) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495151 () Bool)

(declare-fun e!290501 () Bool)

(declare-fun lt!224157 () SeekEntryResult!3870)

(assert (=> b!495151 (= e!290501 (bvsge (x!46724 lt!224157) #b01111111111111111111111111111110))))

(declare-fun b!495152 () Bool)

(assert (=> b!495152 (and (bvsge (index!17661 lt!224157) #b00000000000000000000000000000000) (bvslt (index!17661 lt!224157) (size!15767 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)))))))

(declare-fun res!297686 () Bool)

(assert (=> b!495152 (= res!297686 (= (select (arr!15403 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235))) (index!17661 lt!224157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!290500 () Bool)

(assert (=> b!495152 (=> res!297686 e!290500)))

(declare-fun b!495153 () Bool)

(declare-fun e!290498 () Bool)

(assert (=> b!495153 (= e!290501 e!290498)))

(declare-fun res!297685 () Bool)

(assert (=> b!495153 (= res!297685 (and ((_ is Intermediate!3870) lt!224157) (not (undefined!4682 lt!224157)) (bvslt (x!46724 lt!224157) #b01111111111111111111111111111110) (bvsge (x!46724 lt!224157) #b00000000000000000000000000000000) (bvsge (x!46724 lt!224157) #b00000000000000000000000000000000)))))

(assert (=> b!495153 (=> (not res!297685) (not e!290498))))

(declare-fun b!495154 () Bool)

(assert (=> b!495154 (and (bvsge (index!17661 lt!224157) #b00000000000000000000000000000000) (bvslt (index!17661 lt!224157) (size!15767 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)))))))

(assert (=> b!495154 (= e!290500 (= (select (arr!15403 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235))) (index!17661 lt!224157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!495155 () Bool)

(assert (=> b!495155 (and (bvsge (index!17661 lt!224157) #b00000000000000000000000000000000) (bvslt (index!17661 lt!224157) (size!15767 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)))))))

(declare-fun res!297687 () Bool)

(assert (=> b!495155 (= res!297687 (= (select (arr!15403 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235))) (index!17661 lt!224157)) (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!495155 (=> res!297687 e!290500)))

(assert (=> b!495155 (= e!290498 e!290500)))

(declare-fun d!78263 () Bool)

(assert (=> d!78263 e!290501))

(declare-fun c!59009 () Bool)

(assert (=> d!78263 (= c!59009 (and ((_ is Intermediate!3870) lt!224157) (undefined!4682 lt!224157)))))

(assert (=> d!78263 (= lt!224157 e!290499)))

(declare-fun c!59007 () Bool)

(assert (=> d!78263 (= c!59007 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78263 (= lt!224158 (select (arr!15403 (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235))) lt!224110))))

(assert (=> d!78263 (validMask!0 mask!3524)))

(assert (=> d!78263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224110 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)) mask!3524) lt!224157)))

(declare-fun b!495156 () Bool)

(assert (=> b!495156 (= e!290499 (Intermediate!3870 true lt!224110 #b00000000000000000000000000000000))))

(declare-fun b!495157 () Bool)

(assert (=> b!495157 (= e!290502 (Intermediate!3870 false lt!224110 #b00000000000000000000000000000000))))

(declare-fun b!495158 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495158 (= e!290502 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224110 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) (array!32038 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)) mask!3524))))

(assert (= (and d!78263 c!59007) b!495156))

(assert (= (and d!78263 (not c!59007)) b!495150))

(assert (= (and b!495150 c!59008) b!495157))

(assert (= (and b!495150 (not c!59008)) b!495158))

(assert (= (and d!78263 c!59009) b!495151))

(assert (= (and d!78263 (not c!59009)) b!495153))

(assert (= (and b!495153 res!297685) b!495155))

(assert (= (and b!495155 (not res!297687)) b!495152))

(assert (= (and b!495152 (not res!297686)) b!495154))

(declare-fun m!476301 () Bool)

(assert (=> b!495158 m!476301))

(assert (=> b!495158 m!476301))

(assert (=> b!495158 m!476221))

(declare-fun m!476303 () Bool)

(assert (=> b!495158 m!476303))

(declare-fun m!476305 () Bool)

(assert (=> b!495155 m!476305))

(assert (=> b!495154 m!476305))

(declare-fun m!476307 () Bool)

(assert (=> d!78263 m!476307))

(assert (=> d!78263 m!476211))

(assert (=> b!495152 m!476305))

(assert (=> b!495045 d!78263))

(declare-fun d!78273 () Bool)

(assert (=> d!78273 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!224170 () Unit!14686)

(declare-fun choose!38 (array!32037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14686)

(assert (=> d!78273 (= lt!224170 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78273 (validMask!0 mask!3524)))

(assert (=> d!78273 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!224170)))

(declare-fun bs!15781 () Bool)

(assert (= bs!15781 d!78273))

(assert (=> bs!15781 m!476225))

(declare-fun m!476309 () Bool)

(assert (=> bs!15781 m!476309))

(assert (=> bs!15781 m!476211))

(assert (=> b!495045 d!78273))

(declare-fun d!78275 () Bool)

(declare-fun lt!224178 () (_ BitVec 32))

(declare-fun lt!224177 () (_ BitVec 32))

(assert (=> d!78275 (= lt!224178 (bvmul (bvxor lt!224177 (bvlshr lt!224177 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78275 (= lt!224177 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78275 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297664 (let ((h!10427 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46726 (bvmul (bvxor h!10427 (bvlshr h!10427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46726 (bvlshr x!46726 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297664 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297664 #b00000000000000000000000000000000))))))

(assert (=> d!78275 (= (toIndex!0 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!224178 (bvlshr lt!224178 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!495045 d!78275))

(declare-fun b!495191 () Bool)

(declare-fun e!290522 () SeekEntryResult!3870)

(declare-fun e!290525 () SeekEntryResult!3870)

(assert (=> b!495191 (= e!290522 e!290525)))

(declare-fun lt!224183 () (_ BitVec 64))

(declare-fun c!59025 () Bool)

(assert (=> b!495191 (= c!59025 (or (= lt!224183 (select (arr!15403 a!3235) j!176)) (= (bvadd lt!224183 lt!224183) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495192 () Bool)

(declare-fun e!290524 () Bool)

(declare-fun lt!224181 () SeekEntryResult!3870)

(assert (=> b!495192 (= e!290524 (bvsge (x!46724 lt!224181) #b01111111111111111111111111111110))))

(declare-fun b!495193 () Bool)

(assert (=> b!495193 (and (bvsge (index!17661 lt!224181) #b00000000000000000000000000000000) (bvslt (index!17661 lt!224181) (size!15767 a!3235)))))

(declare-fun res!297693 () Bool)

(assert (=> b!495193 (= res!297693 (= (select (arr!15403 a!3235) (index!17661 lt!224181)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!290523 () Bool)

(assert (=> b!495193 (=> res!297693 e!290523)))

(declare-fun b!495194 () Bool)

(declare-fun e!290521 () Bool)

(assert (=> b!495194 (= e!290524 e!290521)))

(declare-fun res!297692 () Bool)

(assert (=> b!495194 (= res!297692 (and ((_ is Intermediate!3870) lt!224181) (not (undefined!4682 lt!224181)) (bvslt (x!46724 lt!224181) #b01111111111111111111111111111110) (bvsge (x!46724 lt!224181) #b00000000000000000000000000000000) (bvsge (x!46724 lt!224181) #b00000000000000000000000000000000)))))

(assert (=> b!495194 (=> (not res!297692) (not e!290521))))

(declare-fun b!495195 () Bool)

(assert (=> b!495195 (and (bvsge (index!17661 lt!224181) #b00000000000000000000000000000000) (bvslt (index!17661 lt!224181) (size!15767 a!3235)))))

(assert (=> b!495195 (= e!290523 (= (select (arr!15403 a!3235) (index!17661 lt!224181)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!495196 () Bool)

(assert (=> b!495196 (and (bvsge (index!17661 lt!224181) #b00000000000000000000000000000000) (bvslt (index!17661 lt!224181) (size!15767 a!3235)))))

(declare-fun res!297694 () Bool)

(assert (=> b!495196 (= res!297694 (= (select (arr!15403 a!3235) (index!17661 lt!224181)) (select (arr!15403 a!3235) j!176)))))

(assert (=> b!495196 (=> res!297694 e!290523)))

(assert (=> b!495196 (= e!290521 e!290523)))

(declare-fun d!78277 () Bool)

(assert (=> d!78277 e!290524))

(declare-fun c!59026 () Bool)

(assert (=> d!78277 (= c!59026 (and ((_ is Intermediate!3870) lt!224181) (undefined!4682 lt!224181)))))

(assert (=> d!78277 (= lt!224181 e!290522)))

(declare-fun c!59023 () Bool)

(assert (=> d!78277 (= c!59023 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78277 (= lt!224183 (select (arr!15403 a!3235) lt!224111))))

(assert (=> d!78277 (validMask!0 mask!3524)))

(assert (=> d!78277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224111 (select (arr!15403 a!3235) j!176) a!3235 mask!3524) lt!224181)))

(declare-fun b!495197 () Bool)

(assert (=> b!495197 (= e!290522 (Intermediate!3870 true lt!224111 #b00000000000000000000000000000000))))

(declare-fun b!495198 () Bool)

(assert (=> b!495198 (= e!290525 (Intermediate!3870 false lt!224111 #b00000000000000000000000000000000))))

(declare-fun b!495199 () Bool)

(assert (=> b!495199 (= e!290525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224111 #b00000000000000000000000000000000 mask!3524) (select (arr!15403 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78277 c!59023) b!495197))

(assert (= (and d!78277 (not c!59023)) b!495191))

(assert (= (and b!495191 c!59025) b!495198))

(assert (= (and b!495191 (not c!59025)) b!495199))

(assert (= (and d!78277 c!59026) b!495192))

(assert (= (and d!78277 (not c!59026)) b!495194))

(assert (= (and b!495194 res!297692) b!495196))

(assert (= (and b!495196 (not res!297694)) b!495193))

(assert (= (and b!495193 (not res!297693)) b!495195))

(declare-fun m!476329 () Bool)

(assert (=> b!495199 m!476329))

(assert (=> b!495199 m!476329))

(assert (=> b!495199 m!476201))

(declare-fun m!476337 () Bool)

(assert (=> b!495199 m!476337))

(declare-fun m!476341 () Bool)

(assert (=> b!495196 m!476341))

(assert (=> b!495195 m!476341))

(declare-fun m!476343 () Bool)

(assert (=> d!78277 m!476343))

(assert (=> d!78277 m!476211))

(assert (=> b!495193 m!476341))

(assert (=> b!495045 d!78277))

(declare-fun d!78285 () Bool)

(assert (=> d!78285 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!495048 d!78285))

(declare-fun b!495245 () Bool)

(declare-fun e!290556 () SeekEntryResult!3870)

(declare-fun e!290555 () SeekEntryResult!3870)

(assert (=> b!495245 (= e!290556 e!290555)))

(declare-fun lt!224206 () (_ BitVec 64))

(declare-fun lt!224208 () SeekEntryResult!3870)

(assert (=> b!495245 (= lt!224206 (select (arr!15403 a!3235) (index!17661 lt!224208)))))

(declare-fun c!59045 () Bool)

(assert (=> b!495245 (= c!59045 (= lt!224206 k0!2280))))

(declare-fun d!78287 () Bool)

(declare-fun lt!224207 () SeekEntryResult!3870)

(assert (=> d!78287 (and (or ((_ is Undefined!3870) lt!224207) (not ((_ is Found!3870) lt!224207)) (and (bvsge (index!17660 lt!224207) #b00000000000000000000000000000000) (bvslt (index!17660 lt!224207) (size!15767 a!3235)))) (or ((_ is Undefined!3870) lt!224207) ((_ is Found!3870) lt!224207) (not ((_ is MissingZero!3870) lt!224207)) (and (bvsge (index!17659 lt!224207) #b00000000000000000000000000000000) (bvslt (index!17659 lt!224207) (size!15767 a!3235)))) (or ((_ is Undefined!3870) lt!224207) ((_ is Found!3870) lt!224207) ((_ is MissingZero!3870) lt!224207) (not ((_ is MissingVacant!3870) lt!224207)) (and (bvsge (index!17662 lt!224207) #b00000000000000000000000000000000) (bvslt (index!17662 lt!224207) (size!15767 a!3235)))) (or ((_ is Undefined!3870) lt!224207) (ite ((_ is Found!3870) lt!224207) (= (select (arr!15403 a!3235) (index!17660 lt!224207)) k0!2280) (ite ((_ is MissingZero!3870) lt!224207) (= (select (arr!15403 a!3235) (index!17659 lt!224207)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3870) lt!224207) (= (select (arr!15403 a!3235) (index!17662 lt!224207)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78287 (= lt!224207 e!290556)))

(declare-fun c!59046 () Bool)

(assert (=> d!78287 (= c!59046 (and ((_ is Intermediate!3870) lt!224208) (undefined!4682 lt!224208)))))

(assert (=> d!78287 (= lt!224208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78287 (validMask!0 mask!3524)))

(assert (=> d!78287 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!224207)))

(declare-fun b!495246 () Bool)

(assert (=> b!495246 (= e!290556 Undefined!3870)))

(declare-fun b!495247 () Bool)

(declare-fun e!290554 () SeekEntryResult!3870)

(assert (=> b!495247 (= e!290554 (MissingZero!3870 (index!17661 lt!224208)))))

(declare-fun b!495248 () Bool)

(declare-fun c!59044 () Bool)

(assert (=> b!495248 (= c!59044 (= lt!224206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495248 (= e!290555 e!290554)))

(declare-fun b!495249 () Bool)

(assert (=> b!495249 (= e!290555 (Found!3870 (index!17661 lt!224208)))))

(declare-fun b!495250 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32037 (_ BitVec 32)) SeekEntryResult!3870)

(assert (=> b!495250 (= e!290554 (seekKeyOrZeroReturnVacant!0 (x!46724 lt!224208) (index!17661 lt!224208) (index!17661 lt!224208) k0!2280 a!3235 mask!3524))))

(assert (= (and d!78287 c!59046) b!495246))

(assert (= (and d!78287 (not c!59046)) b!495245))

(assert (= (and b!495245 c!59045) b!495249))

(assert (= (and b!495245 (not c!59045)) b!495248))

(assert (= (and b!495248 c!59044) b!495247))

(assert (= (and b!495248 (not c!59044)) b!495250))

(declare-fun m!476373 () Bool)

(assert (=> b!495245 m!476373))

(declare-fun m!476375 () Bool)

(assert (=> d!78287 m!476375))

(assert (=> d!78287 m!476211))

(declare-fun m!476377 () Bool)

(assert (=> d!78287 m!476377))

(declare-fun m!476379 () Bool)

(assert (=> d!78287 m!476379))

(declare-fun m!476381 () Bool)

(assert (=> d!78287 m!476381))

(assert (=> d!78287 m!476379))

(declare-fun m!476383 () Bool)

(assert (=> d!78287 m!476383))

(declare-fun m!476385 () Bool)

(assert (=> b!495250 m!476385))

(assert (=> b!495049 d!78287))

(declare-fun d!78297 () Bool)

(declare-fun res!297730 () Bool)

(declare-fun e!290586 () Bool)

(assert (=> d!78297 (=> res!297730 e!290586)))

(assert (=> d!78297 (= res!297730 (bvsge #b00000000000000000000000000000000 (size!15767 a!3235)))))

(assert (=> d!78297 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9558) e!290586)))

(declare-fun b!495298 () Bool)

(declare-fun e!290588 () Bool)

(declare-fun call!31421 () Bool)

(assert (=> b!495298 (= e!290588 call!31421)))

(declare-fun b!495299 () Bool)

(declare-fun e!290587 () Bool)

(assert (=> b!495299 (= e!290587 e!290588)))

(declare-fun c!59060 () Bool)

(assert (=> b!495299 (= c!59060 (validKeyInArray!0 (select (arr!15403 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31418 () Bool)

(assert (=> bm!31418 (= call!31421 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59060 (Cons!9557 (select (arr!15403 a!3235) #b00000000000000000000000000000000) Nil!9558) Nil!9558)))))

(declare-fun b!495300 () Bool)

(assert (=> b!495300 (= e!290588 call!31421)))

(declare-fun b!495301 () Bool)

(declare-fun e!290589 () Bool)

(declare-fun contains!2715 (List!9561 (_ BitVec 64)) Bool)

(assert (=> b!495301 (= e!290589 (contains!2715 Nil!9558 (select (arr!15403 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!495302 () Bool)

(assert (=> b!495302 (= e!290586 e!290587)))

(declare-fun res!297729 () Bool)

(assert (=> b!495302 (=> (not res!297729) (not e!290587))))

(assert (=> b!495302 (= res!297729 (not e!290589))))

(declare-fun res!297728 () Bool)

(assert (=> b!495302 (=> (not res!297728) (not e!290589))))

(assert (=> b!495302 (= res!297728 (validKeyInArray!0 (select (arr!15403 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78297 (not res!297730)) b!495302))

(assert (= (and b!495302 res!297728) b!495301))

(assert (= (and b!495302 res!297729) b!495299))

(assert (= (and b!495299 c!59060) b!495300))

(assert (= (and b!495299 (not c!59060)) b!495298))

(assert (= (or b!495300 b!495298) bm!31418))

(assert (=> b!495299 m!476271))

(assert (=> b!495299 m!476271))

(declare-fun m!476395 () Bool)

(assert (=> b!495299 m!476395))

(assert (=> bm!31418 m!476271))

(declare-fun m!476397 () Bool)

(assert (=> bm!31418 m!476397))

(assert (=> b!495301 m!476271))

(assert (=> b!495301 m!476271))

(declare-fun m!476399 () Bool)

(assert (=> b!495301 m!476399))

(assert (=> b!495302 m!476271))

(assert (=> b!495302 m!476271))

(assert (=> b!495302 m!476395))

(assert (=> b!495047 d!78297))

(declare-fun b!495303 () Bool)

(declare-fun e!290592 () SeekEntryResult!3870)

(declare-fun e!290591 () SeekEntryResult!3870)

(assert (=> b!495303 (= e!290592 e!290591)))

(declare-fun lt!224215 () (_ BitVec 64))

(declare-fun lt!224217 () SeekEntryResult!3870)

(assert (=> b!495303 (= lt!224215 (select (arr!15403 a!3235) (index!17661 lt!224217)))))

(declare-fun c!59062 () Bool)

(assert (=> b!495303 (= c!59062 (= lt!224215 (select (arr!15403 a!3235) j!176)))))

(declare-fun d!78301 () Bool)

(declare-fun lt!224216 () SeekEntryResult!3870)

(assert (=> d!78301 (and (or ((_ is Undefined!3870) lt!224216) (not ((_ is Found!3870) lt!224216)) (and (bvsge (index!17660 lt!224216) #b00000000000000000000000000000000) (bvslt (index!17660 lt!224216) (size!15767 a!3235)))) (or ((_ is Undefined!3870) lt!224216) ((_ is Found!3870) lt!224216) (not ((_ is MissingZero!3870) lt!224216)) (and (bvsge (index!17659 lt!224216) #b00000000000000000000000000000000) (bvslt (index!17659 lt!224216) (size!15767 a!3235)))) (or ((_ is Undefined!3870) lt!224216) ((_ is Found!3870) lt!224216) ((_ is MissingZero!3870) lt!224216) (not ((_ is MissingVacant!3870) lt!224216)) (and (bvsge (index!17662 lt!224216) #b00000000000000000000000000000000) (bvslt (index!17662 lt!224216) (size!15767 a!3235)))) (or ((_ is Undefined!3870) lt!224216) (ite ((_ is Found!3870) lt!224216) (= (select (arr!15403 a!3235) (index!17660 lt!224216)) (select (arr!15403 a!3235) j!176)) (ite ((_ is MissingZero!3870) lt!224216) (= (select (arr!15403 a!3235) (index!17659 lt!224216)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3870) lt!224216) (= (select (arr!15403 a!3235) (index!17662 lt!224216)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78301 (= lt!224216 e!290592)))

(declare-fun c!59063 () Bool)

(assert (=> d!78301 (= c!59063 (and ((_ is Intermediate!3870) lt!224217) (undefined!4682 lt!224217)))))

(assert (=> d!78301 (= lt!224217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15403 a!3235) j!176) mask!3524) (select (arr!15403 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78301 (validMask!0 mask!3524)))

(assert (=> d!78301 (= (seekEntryOrOpen!0 (select (arr!15403 a!3235) j!176) a!3235 mask!3524) lt!224216)))

(declare-fun b!495304 () Bool)

(assert (=> b!495304 (= e!290592 Undefined!3870)))

(declare-fun b!495305 () Bool)

(declare-fun e!290590 () SeekEntryResult!3870)

(assert (=> b!495305 (= e!290590 (MissingZero!3870 (index!17661 lt!224217)))))

(declare-fun b!495306 () Bool)

(declare-fun c!59061 () Bool)

(assert (=> b!495306 (= c!59061 (= lt!224215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495306 (= e!290591 e!290590)))

(declare-fun b!495307 () Bool)

(assert (=> b!495307 (= e!290591 (Found!3870 (index!17661 lt!224217)))))

(declare-fun b!495308 () Bool)

(assert (=> b!495308 (= e!290590 (seekKeyOrZeroReturnVacant!0 (x!46724 lt!224217) (index!17661 lt!224217) (index!17661 lt!224217) (select (arr!15403 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78301 c!59063) b!495304))

(assert (= (and d!78301 (not c!59063)) b!495303))

(assert (= (and b!495303 c!59062) b!495307))

(assert (= (and b!495303 (not c!59062)) b!495306))

(assert (= (and b!495306 c!59061) b!495305))

(assert (= (and b!495306 (not c!59061)) b!495308))

(declare-fun m!476401 () Bool)

(assert (=> b!495303 m!476401))

(declare-fun m!476403 () Bool)

(assert (=> d!78301 m!476403))

(assert (=> d!78301 m!476211))

(declare-fun m!476405 () Bool)

(assert (=> d!78301 m!476405))

(assert (=> d!78301 m!476223))

(assert (=> d!78301 m!476201))

(declare-fun m!476407 () Bool)

(assert (=> d!78301 m!476407))

(assert (=> d!78301 m!476201))

(assert (=> d!78301 m!476223))

(declare-fun m!476409 () Bool)

(assert (=> d!78301 m!476409))

(assert (=> b!495308 m!476201))

(declare-fun m!476411 () Bool)

(assert (=> b!495308 m!476411))

(assert (=> b!495042 d!78301))

(declare-fun d!78303 () Bool)

(declare-fun res!297732 () Bool)

(declare-fun e!290593 () Bool)

(assert (=> d!78303 (=> res!297732 e!290593)))

(assert (=> d!78303 (= res!297732 (bvsge #b00000000000000000000000000000000 (size!15767 a!3235)))))

(assert (=> d!78303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!290593)))

(declare-fun b!495309 () Bool)

(declare-fun e!290594 () Bool)

(declare-fun call!31422 () Bool)

(assert (=> b!495309 (= e!290594 call!31422)))

(declare-fun b!495310 () Bool)

(declare-fun e!290595 () Bool)

(assert (=> b!495310 (= e!290595 call!31422)))

(declare-fun b!495311 () Bool)

(assert (=> b!495311 (= e!290594 e!290595)))

(declare-fun lt!224218 () (_ BitVec 64))

(assert (=> b!495311 (= lt!224218 (select (arr!15403 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!224220 () Unit!14686)

(assert (=> b!495311 (= lt!224220 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224218 #b00000000000000000000000000000000))))

(assert (=> b!495311 (arrayContainsKey!0 a!3235 lt!224218 #b00000000000000000000000000000000)))

(declare-fun lt!224219 () Unit!14686)

(assert (=> b!495311 (= lt!224219 lt!224220)))

(declare-fun res!297731 () Bool)

(assert (=> b!495311 (= res!297731 (= (seekEntryOrOpen!0 (select (arr!15403 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3870 #b00000000000000000000000000000000)))))

(assert (=> b!495311 (=> (not res!297731) (not e!290595))))

(declare-fun bm!31419 () Bool)

(assert (=> bm!31419 (= call!31422 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!495312 () Bool)

(assert (=> b!495312 (= e!290593 e!290594)))

(declare-fun c!59064 () Bool)

(assert (=> b!495312 (= c!59064 (validKeyInArray!0 (select (arr!15403 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78303 (not res!297732)) b!495312))

(assert (= (and b!495312 c!59064) b!495311))

(assert (= (and b!495312 (not c!59064)) b!495309))

(assert (= (and b!495311 res!297731) b!495310))

(assert (= (or b!495310 b!495309) bm!31419))

(assert (=> b!495311 m!476271))

(declare-fun m!476413 () Bool)

(assert (=> b!495311 m!476413))

(declare-fun m!476415 () Bool)

(assert (=> b!495311 m!476415))

(assert (=> b!495311 m!476271))

(declare-fun m!476417 () Bool)

(assert (=> b!495311 m!476417))

(declare-fun m!476419 () Bool)

(assert (=> bm!31419 m!476419))

(assert (=> b!495312 m!476271))

(assert (=> b!495312 m!476271))

(assert (=> b!495312 m!476395))

(assert (=> b!495040 d!78303))

(declare-fun d!78305 () Bool)

(assert (=> d!78305 (= (validKeyInArray!0 (select (arr!15403 a!3235) j!176)) (and (not (= (select (arr!15403 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15403 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!495041 d!78305))

(check-sat (not d!78277) (not b!495199) (not b!495158) (not b!495312) (not d!78273) (not b!495089) (not d!78301) (not b!495112) (not d!78287) (not b!495299) (not b!495308) (not b!495302) (not d!78263) (not b!495301) (not b!495250) (not b!495113) (not bm!31409) (not bm!31419) (not bm!31418) (not b!495311))
(check-sat)
