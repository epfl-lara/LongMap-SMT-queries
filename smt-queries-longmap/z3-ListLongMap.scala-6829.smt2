; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86140 () Bool)

(assert start!86140)

(declare-fun b!997013 () Bool)

(declare-fun e!562632 () Bool)

(declare-fun e!562630 () Bool)

(assert (=> b!997013 (= e!562632 e!562630)))

(declare-fun res!666655 () Bool)

(assert (=> b!997013 (=> (not res!666655) (not e!562630))))

(declare-datatypes ((SeekEntryResult!9226 0))(
  ( (MissingZero!9226 (index!39275 (_ BitVec 32))) (Found!9226 (index!39276 (_ BitVec 32))) (Intermediate!9226 (undefined!10038 Bool) (index!39277 (_ BitVec 32)) (x!86865 (_ BitVec 32))) (Undefined!9226) (MissingVacant!9226 (index!39278 (_ BitVec 32))) )
))
(declare-fun lt!441485 () SeekEntryResult!9226)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997013 (= res!666655 (or (= lt!441485 (MissingVacant!9226 i!1194)) (= lt!441485 (MissingZero!9226 i!1194))))))

(declare-datatypes ((array!63060 0))(
  ( (array!63061 (arr!30358 (Array (_ BitVec 32) (_ BitVec 64))) (size!30861 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63060)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63060 (_ BitVec 32)) SeekEntryResult!9226)

(assert (=> b!997013 (= lt!441485 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997014 () Bool)

(declare-fun res!666648 () Bool)

(assert (=> b!997014 (=> (not res!666648) (not e!562632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997014 (= res!666648 (validKeyInArray!0 k0!2224))))

(declare-fun b!997015 () Bool)

(declare-fun res!666649 () Bool)

(assert (=> b!997015 (=> (not res!666649) (not e!562632))))

(declare-fun arrayContainsKey!0 (array!63060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997015 (= res!666649 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!666652 () Bool)

(assert (=> start!86140 (=> (not res!666652) (not e!562632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86140 (= res!666652 (validMask!0 mask!3464))))

(assert (=> start!86140 e!562632))

(declare-fun array_inv!23494 (array!63060) Bool)

(assert (=> start!86140 (array_inv!23494 a!3219)))

(assert (=> start!86140 true))

(declare-fun b!997016 () Bool)

(declare-fun res!666654 () Bool)

(assert (=> b!997016 (=> (not res!666654) (not e!562630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63060 (_ BitVec 32)) Bool)

(assert (=> b!997016 (= res!666654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997017 () Bool)

(declare-fun lt!441484 () (_ BitVec 32))

(assert (=> b!997017 (= e!562630 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441484 #b00000000000000000000000000000000) (bvsge lt!441484 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997017 (= lt!441484 (toIndex!0 (select (arr!30358 a!3219) j!170) mask!3464))))

(declare-fun b!997018 () Bool)

(declare-fun res!666653 () Bool)

(assert (=> b!997018 (=> (not res!666653) (not e!562630))))

(declare-datatypes ((List!21005 0))(
  ( (Nil!21002) (Cons!21001 (h!22169 (_ BitVec 64)) (t!29998 List!21005)) )
))
(declare-fun arrayNoDuplicates!0 (array!63060 (_ BitVec 32) List!21005) Bool)

(assert (=> b!997018 (= res!666653 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21002))))

(declare-fun b!997019 () Bool)

(declare-fun res!666656 () Bool)

(assert (=> b!997019 (=> (not res!666656) (not e!562632))))

(assert (=> b!997019 (= res!666656 (validKeyInArray!0 (select (arr!30358 a!3219) j!170)))))

(declare-fun b!997020 () Bool)

(declare-fun res!666651 () Bool)

(assert (=> b!997020 (=> (not res!666651) (not e!562632))))

(assert (=> b!997020 (= res!666651 (and (= (size!30861 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30861 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30861 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997021 () Bool)

(declare-fun res!666650 () Bool)

(assert (=> b!997021 (=> (not res!666650) (not e!562630))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997021 (= res!666650 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30861 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30861 a!3219))))))

(assert (= (and start!86140 res!666652) b!997020))

(assert (= (and b!997020 res!666651) b!997019))

(assert (= (and b!997019 res!666656) b!997014))

(assert (= (and b!997014 res!666648) b!997015))

(assert (= (and b!997015 res!666649) b!997013))

(assert (= (and b!997013 res!666655) b!997016))

(assert (= (and b!997016 res!666654) b!997018))

(assert (= (and b!997018 res!666653) b!997021))

(assert (= (and b!997021 res!666650) b!997017))

(declare-fun m!924647 () Bool)

(assert (=> b!997014 m!924647))

(declare-fun m!924649 () Bool)

(assert (=> b!997013 m!924649))

(declare-fun m!924651 () Bool)

(assert (=> b!997018 m!924651))

(declare-fun m!924653 () Bool)

(assert (=> b!997019 m!924653))

(assert (=> b!997019 m!924653))

(declare-fun m!924655 () Bool)

(assert (=> b!997019 m!924655))

(declare-fun m!924657 () Bool)

(assert (=> start!86140 m!924657))

(declare-fun m!924659 () Bool)

(assert (=> start!86140 m!924659))

(declare-fun m!924661 () Bool)

(assert (=> b!997016 m!924661))

(assert (=> b!997017 m!924653))

(assert (=> b!997017 m!924653))

(declare-fun m!924663 () Bool)

(assert (=> b!997017 m!924663))

(declare-fun m!924665 () Bool)

(assert (=> b!997015 m!924665))

(check-sat (not b!997018) (not b!997015) (not b!997014) (not b!997017) (not start!86140) (not b!997019) (not b!997016) (not b!997013))
(check-sat)
(get-model)

(declare-fun b!997088 () Bool)

(declare-fun e!562658 () SeekEntryResult!9226)

(declare-fun lt!441511 () SeekEntryResult!9226)

(assert (=> b!997088 (= e!562658 (Found!9226 (index!39277 lt!441511)))))

(declare-fun d!119307 () Bool)

(declare-fun lt!441512 () SeekEntryResult!9226)

(get-info :version)

(assert (=> d!119307 (and (or ((_ is Undefined!9226) lt!441512) (not ((_ is Found!9226) lt!441512)) (and (bvsge (index!39276 lt!441512) #b00000000000000000000000000000000) (bvslt (index!39276 lt!441512) (size!30861 a!3219)))) (or ((_ is Undefined!9226) lt!441512) ((_ is Found!9226) lt!441512) (not ((_ is MissingZero!9226) lt!441512)) (and (bvsge (index!39275 lt!441512) #b00000000000000000000000000000000) (bvslt (index!39275 lt!441512) (size!30861 a!3219)))) (or ((_ is Undefined!9226) lt!441512) ((_ is Found!9226) lt!441512) ((_ is MissingZero!9226) lt!441512) (not ((_ is MissingVacant!9226) lt!441512)) (and (bvsge (index!39278 lt!441512) #b00000000000000000000000000000000) (bvslt (index!39278 lt!441512) (size!30861 a!3219)))) (or ((_ is Undefined!9226) lt!441512) (ite ((_ is Found!9226) lt!441512) (= (select (arr!30358 a!3219) (index!39276 lt!441512)) k0!2224) (ite ((_ is MissingZero!9226) lt!441512) (= (select (arr!30358 a!3219) (index!39275 lt!441512)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9226) lt!441512) (= (select (arr!30358 a!3219) (index!39278 lt!441512)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!562657 () SeekEntryResult!9226)

(assert (=> d!119307 (= lt!441512 e!562657)))

(declare-fun c!101335 () Bool)

(assert (=> d!119307 (= c!101335 (and ((_ is Intermediate!9226) lt!441511) (undefined!10038 lt!441511)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63060 (_ BitVec 32)) SeekEntryResult!9226)

(assert (=> d!119307 (= lt!441511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119307 (validMask!0 mask!3464)))

(assert (=> d!119307 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441512)))

(declare-fun b!997089 () Bool)

(assert (=> b!997089 (= e!562657 e!562658)))

(declare-fun lt!441510 () (_ BitVec 64))

(assert (=> b!997089 (= lt!441510 (select (arr!30358 a!3219) (index!39277 lt!441511)))))

(declare-fun c!101334 () Bool)

(assert (=> b!997089 (= c!101334 (= lt!441510 k0!2224))))

(declare-fun b!997090 () Bool)

(assert (=> b!997090 (= e!562657 Undefined!9226)))

(declare-fun b!997091 () Bool)

(declare-fun e!562659 () SeekEntryResult!9226)

(assert (=> b!997091 (= e!562659 (MissingZero!9226 (index!39277 lt!441511)))))

(declare-fun b!997092 () Bool)

(declare-fun c!101333 () Bool)

(assert (=> b!997092 (= c!101333 (= lt!441510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997092 (= e!562658 e!562659)))

(declare-fun b!997093 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63060 (_ BitVec 32)) SeekEntryResult!9226)

(assert (=> b!997093 (= e!562659 (seekKeyOrZeroReturnVacant!0 (x!86865 lt!441511) (index!39277 lt!441511) (index!39277 lt!441511) k0!2224 a!3219 mask!3464))))

(assert (= (and d!119307 c!101335) b!997090))

(assert (= (and d!119307 (not c!101335)) b!997089))

(assert (= (and b!997089 c!101334) b!997088))

(assert (= (and b!997089 (not c!101334)) b!997092))

(assert (= (and b!997092 c!101333) b!997091))

(assert (= (and b!997092 (not c!101333)) b!997093))

(declare-fun m!924707 () Bool)

(assert (=> d!119307 m!924707))

(declare-fun m!924709 () Bool)

(assert (=> d!119307 m!924709))

(declare-fun m!924711 () Bool)

(assert (=> d!119307 m!924711))

(assert (=> d!119307 m!924707))

(declare-fun m!924713 () Bool)

(assert (=> d!119307 m!924713))

(declare-fun m!924715 () Bool)

(assert (=> d!119307 m!924715))

(assert (=> d!119307 m!924657))

(declare-fun m!924717 () Bool)

(assert (=> b!997089 m!924717))

(declare-fun m!924719 () Bool)

(assert (=> b!997093 m!924719))

(assert (=> b!997013 d!119307))

(declare-fun b!997112 () Bool)

(declare-fun e!562674 () Bool)

(declare-fun e!562676 () Bool)

(assert (=> b!997112 (= e!562674 e!562676)))

(declare-fun res!666723 () Bool)

(assert (=> b!997112 (=> (not res!666723) (not e!562676))))

(declare-fun e!562675 () Bool)

(assert (=> b!997112 (= res!666723 (not e!562675))))

(declare-fun res!666722 () Bool)

(assert (=> b!997112 (=> (not res!666722) (not e!562675))))

(assert (=> b!997112 (= res!666722 (validKeyInArray!0 (select (arr!30358 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42270 () Bool)

(declare-fun call!42273 () Bool)

(declare-fun c!101340 () Bool)

(assert (=> bm!42270 (= call!42273 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101340 (Cons!21001 (select (arr!30358 a!3219) #b00000000000000000000000000000000) Nil!21002) Nil!21002)))))

(declare-fun b!997113 () Bool)

(declare-fun contains!5886 (List!21005 (_ BitVec 64)) Bool)

(assert (=> b!997113 (= e!562675 (contains!5886 Nil!21002 (select (arr!30358 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997114 () Bool)

(declare-fun e!562677 () Bool)

(assert (=> b!997114 (= e!562677 call!42273)))

(declare-fun d!119323 () Bool)

(declare-fun res!666724 () Bool)

(assert (=> d!119323 (=> res!666724 e!562674)))

(assert (=> d!119323 (= res!666724 (bvsge #b00000000000000000000000000000000 (size!30861 a!3219)))))

(assert (=> d!119323 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21002) e!562674)))

(declare-fun b!997115 () Bool)

(assert (=> b!997115 (= e!562676 e!562677)))

(assert (=> b!997115 (= c!101340 (validKeyInArray!0 (select (arr!30358 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997116 () Bool)

(assert (=> b!997116 (= e!562677 call!42273)))

(assert (= (and d!119323 (not res!666724)) b!997112))

(assert (= (and b!997112 res!666722) b!997113))

(assert (= (and b!997112 res!666723) b!997115))

(assert (= (and b!997115 c!101340) b!997116))

(assert (= (and b!997115 (not c!101340)) b!997114))

(assert (= (or b!997116 b!997114) bm!42270))

(declare-fun m!924721 () Bool)

(assert (=> b!997112 m!924721))

(assert (=> b!997112 m!924721))

(declare-fun m!924723 () Bool)

(assert (=> b!997112 m!924723))

(assert (=> bm!42270 m!924721))

(declare-fun m!924725 () Bool)

(assert (=> bm!42270 m!924725))

(assert (=> b!997113 m!924721))

(assert (=> b!997113 m!924721))

(declare-fun m!924727 () Bool)

(assert (=> b!997113 m!924727))

(assert (=> b!997115 m!924721))

(assert (=> b!997115 m!924721))

(assert (=> b!997115 m!924723))

(assert (=> b!997018 d!119323))

(declare-fun d!119325 () Bool)

(declare-fun lt!441527 () (_ BitVec 32))

(declare-fun lt!441526 () (_ BitVec 32))

(assert (=> d!119325 (= lt!441527 (bvmul (bvxor lt!441526 (bvlshr lt!441526 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119325 (= lt!441526 ((_ extract 31 0) (bvand (bvxor (select (arr!30358 a!3219) j!170) (bvlshr (select (arr!30358 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119325 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!666725 (let ((h!22173 ((_ extract 31 0) (bvand (bvxor (select (arr!30358 a!3219) j!170) (bvlshr (select (arr!30358 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!86869 (bvmul (bvxor h!22173 (bvlshr h!22173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!86869 (bvlshr x!86869 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!666725 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!666725 #b00000000000000000000000000000000))))))

(assert (=> d!119325 (= (toIndex!0 (select (arr!30358 a!3219) j!170) mask!3464) (bvand (bvxor lt!441527 (bvlshr lt!441527 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997017 d!119325))

(declare-fun b!997159 () Bool)

(declare-fun e!562712 () Bool)

(declare-fun e!562713 () Bool)

(assert (=> b!997159 (= e!562712 e!562713)))

(declare-fun c!101350 () Bool)

(assert (=> b!997159 (= c!101350 (validKeyInArray!0 (select (arr!30358 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42280 () Bool)

(declare-fun call!42283 () Bool)

(assert (=> bm!42280 (= call!42283 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!997160 () Bool)

(declare-fun e!562711 () Bool)

(assert (=> b!997160 (= e!562711 call!42283)))

(declare-fun b!997161 () Bool)

(assert (=> b!997161 (= e!562713 call!42283)))

(declare-fun d!119333 () Bool)

(declare-fun res!666752 () Bool)

(assert (=> d!119333 (=> res!666752 e!562712)))

(assert (=> d!119333 (= res!666752 (bvsge #b00000000000000000000000000000000 (size!30861 a!3219)))))

(assert (=> d!119333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562712)))

(declare-fun b!997162 () Bool)

(assert (=> b!997162 (= e!562713 e!562711)))

(declare-fun lt!441541 () (_ BitVec 64))

(assert (=> b!997162 (= lt!441541 (select (arr!30358 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32955 0))(
  ( (Unit!32956) )
))
(declare-fun lt!441542 () Unit!32955)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63060 (_ BitVec 64) (_ BitVec 32)) Unit!32955)

(assert (=> b!997162 (= lt!441542 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441541 #b00000000000000000000000000000000))))

(assert (=> b!997162 (arrayContainsKey!0 a!3219 lt!441541 #b00000000000000000000000000000000)))

(declare-fun lt!441540 () Unit!32955)

(assert (=> b!997162 (= lt!441540 lt!441542)))

(declare-fun res!666751 () Bool)

(assert (=> b!997162 (= res!666751 (= (seekEntryOrOpen!0 (select (arr!30358 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9226 #b00000000000000000000000000000000)))))

(assert (=> b!997162 (=> (not res!666751) (not e!562711))))

(assert (= (and d!119333 (not res!666752)) b!997159))

(assert (= (and b!997159 c!101350) b!997162))

(assert (= (and b!997159 (not c!101350)) b!997161))

(assert (= (and b!997162 res!666751) b!997160))

(assert (= (or b!997160 b!997161) bm!42280))

(assert (=> b!997159 m!924721))

(assert (=> b!997159 m!924721))

(assert (=> b!997159 m!924723))

(declare-fun m!924753 () Bool)

(assert (=> bm!42280 m!924753))

(assert (=> b!997162 m!924721))

(declare-fun m!924755 () Bool)

(assert (=> b!997162 m!924755))

(declare-fun m!924757 () Bool)

(assert (=> b!997162 m!924757))

(assert (=> b!997162 m!924721))

(declare-fun m!924759 () Bool)

(assert (=> b!997162 m!924759))

(assert (=> b!997016 d!119333))

(declare-fun d!119343 () Bool)

(assert (=> d!119343 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86140 d!119343))

(declare-fun d!119351 () Bool)

(assert (=> d!119351 (= (array_inv!23494 a!3219) (bvsge (size!30861 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86140 d!119351))

(declare-fun d!119353 () Bool)

(declare-fun res!666769 () Bool)

(declare-fun e!562733 () Bool)

(assert (=> d!119353 (=> res!666769 e!562733)))

(assert (=> d!119353 (= res!666769 (= (select (arr!30358 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119353 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562733)))

(declare-fun b!997185 () Bool)

(declare-fun e!562734 () Bool)

(assert (=> b!997185 (= e!562733 e!562734)))

(declare-fun res!666770 () Bool)

(assert (=> b!997185 (=> (not res!666770) (not e!562734))))

(assert (=> b!997185 (= res!666770 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30861 a!3219)))))

(declare-fun b!997186 () Bool)

(assert (=> b!997186 (= e!562734 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119353 (not res!666769)) b!997185))

(assert (= (and b!997185 res!666770) b!997186))

(assert (=> d!119353 m!924721))

(declare-fun m!924771 () Bool)

(assert (=> b!997186 m!924771))

(assert (=> b!997015 d!119353))

(declare-fun d!119355 () Bool)

(assert (=> d!119355 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997014 d!119355))

(declare-fun d!119357 () Bool)

(assert (=> d!119357 (= (validKeyInArray!0 (select (arr!30358 a!3219) j!170)) (and (not (= (select (arr!30358 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30358 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997019 d!119357))

(check-sat (not b!997115) (not bm!42270) (not bm!42280) (not b!997159) (not b!997162) (not b!997093) (not d!119307) (not b!997113) (not b!997112) (not b!997186))
(check-sat)
