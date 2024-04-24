; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86644 () Bool)

(assert start!86644)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun b!1002133 () Bool)

(declare-fun e!564793 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!1002133 (= e!564793 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000))))))

(declare-fun b!1002134 () Bool)

(declare-fun res!671047 () Bool)

(declare-fun e!564797 () Bool)

(assert (=> b!1002134 (=> (not res!671047) (not e!564797))))

(declare-datatypes ((array!63315 0))(
  ( (array!63316 (arr!30478 (Array (_ BitVec 32) (_ BitVec 64))) (size!30981 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63315)

(declare-datatypes ((List!21125 0))(
  ( (Nil!21122) (Cons!21121 (h!22304 (_ BitVec 64)) (t!30118 List!21125)) )
))
(declare-fun arrayNoDuplicates!0 (array!63315 (_ BitVec 32) List!21125) Bool)

(assert (=> b!1002134 (= res!671047 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21122))))

(declare-fun b!1002135 () Bool)

(declare-fun res!671046 () Bool)

(assert (=> b!1002135 (=> (not res!671046) (not e!564797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63315 (_ BitVec 32)) Bool)

(assert (=> b!1002135 (= res!671046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002136 () Bool)

(declare-fun e!564798 () Bool)

(declare-fun e!564795 () Bool)

(assert (=> b!1002136 (= e!564798 e!564795)))

(declare-fun res!671052 () Bool)

(assert (=> b!1002136 (=> (not res!671052) (not e!564795))))

(declare-datatypes ((SeekEntryResult!9346 0))(
  ( (MissingZero!9346 (index!39755 (_ BitVec 32))) (Found!9346 (index!39756 (_ BitVec 32))) (Intermediate!9346 (undefined!10158 Bool) (index!39757 (_ BitVec 32)) (x!87332 (_ BitVec 32))) (Undefined!9346) (MissingVacant!9346 (index!39758 (_ BitVec 32))) )
))
(declare-fun lt!442926 () SeekEntryResult!9346)

(declare-fun lt!442931 () SeekEntryResult!9346)

(assert (=> b!1002136 (= res!671052 (= lt!442926 lt!442931))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63315 (_ BitVec 32)) SeekEntryResult!9346)

(assert (=> b!1002136 (= lt!442926 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30478 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002137 () Bool)

(declare-fun res!671051 () Bool)

(assert (=> b!1002137 (=> (not res!671051) (not e!564793))))

(declare-fun lt!442928 () array!63315)

(declare-fun lt!442927 () (_ BitVec 64))

(assert (=> b!1002137 (= res!671051 (not (= lt!442926 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442927 lt!442928 mask!3464))))))

(declare-fun b!1002138 () Bool)

(declare-fun e!564796 () Bool)

(assert (=> b!1002138 (= e!564796 e!564797)))

(declare-fun res!671045 () Bool)

(assert (=> b!1002138 (=> (not res!671045) (not e!564797))))

(declare-fun lt!442929 () SeekEntryResult!9346)

(assert (=> b!1002138 (= res!671045 (or (= lt!442929 (MissingVacant!9346 i!1194)) (= lt!442929 (MissingZero!9346 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63315 (_ BitVec 32)) SeekEntryResult!9346)

(assert (=> b!1002138 (= lt!442929 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002139 () Bool)

(assert (=> b!1002139 (= e!564797 e!564798)))

(declare-fun res!671057 () Bool)

(assert (=> b!1002139 (=> (not res!671057) (not e!564798))))

(declare-fun lt!442930 () SeekEntryResult!9346)

(assert (=> b!1002139 (= res!671057 (= lt!442930 lt!442931))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002139 (= lt!442931 (Intermediate!9346 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002139 (= lt!442930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) (select (arr!30478 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002140 () Bool)

(declare-fun res!671053 () Bool)

(assert (=> b!1002140 (=> (not res!671053) (not e!564796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002140 (= res!671053 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002142 () Bool)

(declare-fun res!671049 () Bool)

(assert (=> b!1002142 (=> (not res!671049) (not e!564797))))

(assert (=> b!1002142 (= res!671049 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30981 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30981 a!3219))))))

(declare-fun b!1002143 () Bool)

(declare-fun res!671055 () Bool)

(assert (=> b!1002143 (=> (not res!671055) (not e!564796))))

(assert (=> b!1002143 (= res!671055 (validKeyInArray!0 (select (arr!30478 a!3219) j!170)))))

(declare-fun b!1002144 () Bool)

(assert (=> b!1002144 (= e!564795 e!564793)))

(declare-fun res!671056 () Bool)

(assert (=> b!1002144 (=> (not res!671056) (not e!564793))))

(assert (=> b!1002144 (= res!671056 (not (= lt!442930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442927 mask!3464) lt!442927 lt!442928 mask!3464))))))

(assert (=> b!1002144 (= lt!442927 (select (store (arr!30478 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002144 (= lt!442928 (array!63316 (store (arr!30478 a!3219) i!1194 k0!2224) (size!30981 a!3219)))))

(declare-fun b!1002145 () Bool)

(declare-fun res!671050 () Bool)

(assert (=> b!1002145 (=> (not res!671050) (not e!564796))))

(assert (=> b!1002145 (= res!671050 (and (= (size!30981 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30981 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30981 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!671048 () Bool)

(assert (=> start!86644 (=> (not res!671048) (not e!564796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86644 (= res!671048 (validMask!0 mask!3464))))

(assert (=> start!86644 e!564796))

(declare-fun array_inv!23614 (array!63315) Bool)

(assert (=> start!86644 (array_inv!23614 a!3219)))

(assert (=> start!86644 true))

(declare-fun b!1002141 () Bool)

(declare-fun res!671054 () Bool)

(assert (=> b!1002141 (=> (not res!671054) (not e!564796))))

(declare-fun arrayContainsKey!0 (array!63315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002141 (= res!671054 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86644 res!671048) b!1002145))

(assert (= (and b!1002145 res!671050) b!1002143))

(assert (= (and b!1002143 res!671055) b!1002140))

(assert (= (and b!1002140 res!671053) b!1002141))

(assert (= (and b!1002141 res!671054) b!1002138))

(assert (= (and b!1002138 res!671045) b!1002135))

(assert (= (and b!1002135 res!671046) b!1002134))

(assert (= (and b!1002134 res!671047) b!1002142))

(assert (= (and b!1002142 res!671049) b!1002139))

(assert (= (and b!1002139 res!671057) b!1002136))

(assert (= (and b!1002136 res!671052) b!1002144))

(assert (= (and b!1002144 res!671056) b!1002137))

(assert (= (and b!1002137 res!671051) b!1002133))

(declare-fun m!928625 () Bool)

(assert (=> b!1002137 m!928625))

(declare-fun m!928627 () Bool)

(assert (=> b!1002144 m!928627))

(assert (=> b!1002144 m!928627))

(declare-fun m!928629 () Bool)

(assert (=> b!1002144 m!928629))

(declare-fun m!928631 () Bool)

(assert (=> b!1002144 m!928631))

(declare-fun m!928633 () Bool)

(assert (=> b!1002144 m!928633))

(declare-fun m!928635 () Bool)

(assert (=> b!1002135 m!928635))

(declare-fun m!928637 () Bool)

(assert (=> start!86644 m!928637))

(declare-fun m!928639 () Bool)

(assert (=> start!86644 m!928639))

(declare-fun m!928641 () Bool)

(assert (=> b!1002141 m!928641))

(declare-fun m!928643 () Bool)

(assert (=> b!1002143 m!928643))

(assert (=> b!1002143 m!928643))

(declare-fun m!928645 () Bool)

(assert (=> b!1002143 m!928645))

(declare-fun m!928647 () Bool)

(assert (=> b!1002134 m!928647))

(assert (=> b!1002139 m!928643))

(assert (=> b!1002139 m!928643))

(declare-fun m!928649 () Bool)

(assert (=> b!1002139 m!928649))

(assert (=> b!1002139 m!928649))

(assert (=> b!1002139 m!928643))

(declare-fun m!928651 () Bool)

(assert (=> b!1002139 m!928651))

(declare-fun m!928653 () Bool)

(assert (=> b!1002138 m!928653))

(assert (=> b!1002136 m!928643))

(assert (=> b!1002136 m!928643))

(declare-fun m!928655 () Bool)

(assert (=> b!1002136 m!928655))

(declare-fun m!928657 () Bool)

(assert (=> b!1002140 m!928657))

(check-sat (not b!1002141) (not b!1002144) (not b!1002143) (not b!1002137) (not b!1002139) (not b!1002136) (not b!1002134) (not b!1002135) (not b!1002138) (not start!86644) (not b!1002140))
(check-sat)
(get-model)

(declare-fun d!119711 () Bool)

(assert (=> d!119711 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1002140 d!119711))

(declare-fun b!1002242 () Bool)

(declare-fun lt!442972 () SeekEntryResult!9346)

(assert (=> b!1002242 (and (bvsge (index!39757 lt!442972) #b00000000000000000000000000000000) (bvslt (index!39757 lt!442972) (size!30981 a!3219)))))

(declare-fun res!671142 () Bool)

(assert (=> b!1002242 (= res!671142 (= (select (arr!30478 a!3219) (index!39757 lt!442972)) (select (arr!30478 a!3219) j!170)))))

(declare-fun e!564846 () Bool)

(assert (=> b!1002242 (=> res!671142 e!564846)))

(declare-fun e!564849 () Bool)

(assert (=> b!1002242 (= e!564849 e!564846)))

(declare-fun b!1002243 () Bool)

(declare-fun e!564848 () SeekEntryResult!9346)

(declare-fun e!564845 () SeekEntryResult!9346)

(assert (=> b!1002243 (= e!564848 e!564845)))

(declare-fun lt!442973 () (_ BitVec 64))

(declare-fun c!101704 () Bool)

(assert (=> b!1002243 (= c!101704 (or (= lt!442973 (select (arr!30478 a!3219) j!170)) (= (bvadd lt!442973 lt!442973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1002244 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002244 (= e!564845 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30478 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002245 () Bool)

(assert (=> b!1002245 (and (bvsge (index!39757 lt!442972) #b00000000000000000000000000000000) (bvslt (index!39757 lt!442972) (size!30981 a!3219)))))

(assert (=> b!1002245 (= e!564846 (= (select (arr!30478 a!3219) (index!39757 lt!442972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1002247 () Bool)

(assert (=> b!1002247 (= e!564848 (Intermediate!9346 true (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1002248 () Bool)

(assert (=> b!1002248 (and (bvsge (index!39757 lt!442972) #b00000000000000000000000000000000) (bvslt (index!39757 lt!442972) (size!30981 a!3219)))))

(declare-fun res!671144 () Bool)

(assert (=> b!1002248 (= res!671144 (= (select (arr!30478 a!3219) (index!39757 lt!442972)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1002248 (=> res!671144 e!564846)))

(declare-fun b!1002249 () Bool)

(assert (=> b!1002249 (= e!564845 (Intermediate!9346 false (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1002250 () Bool)

(declare-fun e!564847 () Bool)

(assert (=> b!1002250 (= e!564847 (bvsge (x!87332 lt!442972) #b01111111111111111111111111111110))))

(declare-fun d!119713 () Bool)

(assert (=> d!119713 e!564847))

(declare-fun c!101703 () Bool)

(get-info :version)

(assert (=> d!119713 (= c!101703 (and ((_ is Intermediate!9346) lt!442972) (undefined!10158 lt!442972)))))

(assert (=> d!119713 (= lt!442972 e!564848)))

(declare-fun c!101702 () Bool)

(assert (=> d!119713 (= c!101702 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119713 (= lt!442973 (select (arr!30478 a!3219) (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464)))))

(assert (=> d!119713 (validMask!0 mask!3464)))

(assert (=> d!119713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) (select (arr!30478 a!3219) j!170) a!3219 mask!3464) lt!442972)))

(declare-fun b!1002246 () Bool)

(assert (=> b!1002246 (= e!564847 e!564849)))

(declare-fun res!671143 () Bool)

(assert (=> b!1002246 (= res!671143 (and ((_ is Intermediate!9346) lt!442972) (not (undefined!10158 lt!442972)) (bvslt (x!87332 lt!442972) #b01111111111111111111111111111110) (bvsge (x!87332 lt!442972) #b00000000000000000000000000000000) (bvsge (x!87332 lt!442972) #b00000000000000000000000000000000)))))

(assert (=> b!1002246 (=> (not res!671143) (not e!564849))))

(assert (= (and d!119713 c!101702) b!1002247))

(assert (= (and d!119713 (not c!101702)) b!1002243))

(assert (= (and b!1002243 c!101704) b!1002249))

(assert (= (and b!1002243 (not c!101704)) b!1002244))

(assert (= (and d!119713 c!101703) b!1002250))

(assert (= (and d!119713 (not c!101703)) b!1002246))

(assert (= (and b!1002246 res!671143) b!1002242))

(assert (= (and b!1002242 (not res!671142)) b!1002248))

(assert (= (and b!1002248 (not res!671144)) b!1002245))

(declare-fun m!928727 () Bool)

(assert (=> b!1002248 m!928727))

(assert (=> b!1002244 m!928649))

(declare-fun m!928729 () Bool)

(assert (=> b!1002244 m!928729))

(assert (=> b!1002244 m!928729))

(assert (=> b!1002244 m!928643))

(declare-fun m!928731 () Bool)

(assert (=> b!1002244 m!928731))

(assert (=> b!1002245 m!928727))

(assert (=> b!1002242 m!928727))

(assert (=> d!119713 m!928649))

(declare-fun m!928733 () Bool)

(assert (=> d!119713 m!928733))

(assert (=> d!119713 m!928637))

(assert (=> b!1002139 d!119713))

(declare-fun d!119715 () Bool)

(declare-fun lt!442979 () (_ BitVec 32))

(declare-fun lt!442978 () (_ BitVec 32))

(assert (=> d!119715 (= lt!442979 (bvmul (bvxor lt!442978 (bvlshr lt!442978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119715 (= lt!442978 ((_ extract 31 0) (bvand (bvxor (select (arr!30478 a!3219) j!170) (bvlshr (select (arr!30478 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119715 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!671145 (let ((h!22307 ((_ extract 31 0) (bvand (bvxor (select (arr!30478 a!3219) j!170) (bvlshr (select (arr!30478 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87336 (bvmul (bvxor h!22307 (bvlshr h!22307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87336 (bvlshr x!87336 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!671145 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!671145 #b00000000000000000000000000000000))))))

(assert (=> d!119715 (= (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) (bvand (bvxor lt!442979 (bvlshr lt!442979 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1002139 d!119715))

(declare-fun bm!42358 () Bool)

(declare-fun call!42361 () Bool)

(declare-fun c!101707 () Bool)

(assert (=> bm!42358 (= call!42361 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101707 (Cons!21121 (select (arr!30478 a!3219) #b00000000000000000000000000000000) Nil!21122) Nil!21122)))))

(declare-fun b!1002261 () Bool)

(declare-fun e!564860 () Bool)

(assert (=> b!1002261 (= e!564860 call!42361)))

(declare-fun d!119717 () Bool)

(declare-fun res!671154 () Bool)

(declare-fun e!564861 () Bool)

(assert (=> d!119717 (=> res!671154 e!564861)))

(assert (=> d!119717 (= res!671154 (bvsge #b00000000000000000000000000000000 (size!30981 a!3219)))))

(assert (=> d!119717 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21122) e!564861)))

(declare-fun b!1002262 () Bool)

(declare-fun e!564859 () Bool)

(assert (=> b!1002262 (= e!564859 e!564860)))

(assert (=> b!1002262 (= c!101707 (validKeyInArray!0 (select (arr!30478 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1002263 () Bool)

(assert (=> b!1002263 (= e!564860 call!42361)))

(declare-fun b!1002264 () Bool)

(declare-fun e!564858 () Bool)

(declare-fun contains!5896 (List!21125 (_ BitVec 64)) Bool)

(assert (=> b!1002264 (= e!564858 (contains!5896 Nil!21122 (select (arr!30478 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1002265 () Bool)

(assert (=> b!1002265 (= e!564861 e!564859)))

(declare-fun res!671153 () Bool)

(assert (=> b!1002265 (=> (not res!671153) (not e!564859))))

(assert (=> b!1002265 (= res!671153 (not e!564858))))

(declare-fun res!671152 () Bool)

(assert (=> b!1002265 (=> (not res!671152) (not e!564858))))

(assert (=> b!1002265 (= res!671152 (validKeyInArray!0 (select (arr!30478 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119717 (not res!671154)) b!1002265))

(assert (= (and b!1002265 res!671152) b!1002264))

(assert (= (and b!1002265 res!671153) b!1002262))

(assert (= (and b!1002262 c!101707) b!1002263))

(assert (= (and b!1002262 (not c!101707)) b!1002261))

(assert (= (or b!1002263 b!1002261) bm!42358))

(declare-fun m!928735 () Bool)

(assert (=> bm!42358 m!928735))

(declare-fun m!928737 () Bool)

(assert (=> bm!42358 m!928737))

(assert (=> b!1002262 m!928735))

(assert (=> b!1002262 m!928735))

(declare-fun m!928739 () Bool)

(assert (=> b!1002262 m!928739))

(assert (=> b!1002264 m!928735))

(assert (=> b!1002264 m!928735))

(declare-fun m!928741 () Bool)

(assert (=> b!1002264 m!928741))

(assert (=> b!1002265 m!928735))

(assert (=> b!1002265 m!928735))

(assert (=> b!1002265 m!928739))

(assert (=> b!1002134 d!119717))

(declare-fun b!1002266 () Bool)

(declare-fun lt!442980 () SeekEntryResult!9346)

(assert (=> b!1002266 (and (bvsge (index!39757 lt!442980) #b00000000000000000000000000000000) (bvslt (index!39757 lt!442980) (size!30981 lt!442928)))))

(declare-fun res!671155 () Bool)

(assert (=> b!1002266 (= res!671155 (= (select (arr!30478 lt!442928) (index!39757 lt!442980)) lt!442927))))

(declare-fun e!564863 () Bool)

(assert (=> b!1002266 (=> res!671155 e!564863)))

(declare-fun e!564866 () Bool)

(assert (=> b!1002266 (= e!564866 e!564863)))

(declare-fun b!1002267 () Bool)

(declare-fun e!564865 () SeekEntryResult!9346)

(declare-fun e!564862 () SeekEntryResult!9346)

(assert (=> b!1002267 (= e!564865 e!564862)))

(declare-fun c!101710 () Bool)

(declare-fun lt!442981 () (_ BitVec 64))

(assert (=> b!1002267 (= c!101710 (or (= lt!442981 lt!442927) (= (bvadd lt!442981 lt!442981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1002268 () Bool)

(assert (=> b!1002268 (= e!564862 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!442927 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!442927 lt!442928 mask!3464))))

(declare-fun b!1002269 () Bool)

(assert (=> b!1002269 (and (bvsge (index!39757 lt!442980) #b00000000000000000000000000000000) (bvslt (index!39757 lt!442980) (size!30981 lt!442928)))))

(assert (=> b!1002269 (= e!564863 (= (select (arr!30478 lt!442928) (index!39757 lt!442980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1002271 () Bool)

(assert (=> b!1002271 (= e!564865 (Intermediate!9346 true (toIndex!0 lt!442927 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1002272 () Bool)

(assert (=> b!1002272 (and (bvsge (index!39757 lt!442980) #b00000000000000000000000000000000) (bvslt (index!39757 lt!442980) (size!30981 lt!442928)))))

(declare-fun res!671157 () Bool)

(assert (=> b!1002272 (= res!671157 (= (select (arr!30478 lt!442928) (index!39757 lt!442980)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1002272 (=> res!671157 e!564863)))

(declare-fun b!1002273 () Bool)

(assert (=> b!1002273 (= e!564862 (Intermediate!9346 false (toIndex!0 lt!442927 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1002274 () Bool)

(declare-fun e!564864 () Bool)

(assert (=> b!1002274 (= e!564864 (bvsge (x!87332 lt!442980) #b01111111111111111111111111111110))))

(declare-fun d!119725 () Bool)

(assert (=> d!119725 e!564864))

(declare-fun c!101709 () Bool)

(assert (=> d!119725 (= c!101709 (and ((_ is Intermediate!9346) lt!442980) (undefined!10158 lt!442980)))))

(assert (=> d!119725 (= lt!442980 e!564865)))

(declare-fun c!101708 () Bool)

(assert (=> d!119725 (= c!101708 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119725 (= lt!442981 (select (arr!30478 lt!442928) (toIndex!0 lt!442927 mask!3464)))))

(assert (=> d!119725 (validMask!0 mask!3464)))

(assert (=> d!119725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442927 mask!3464) lt!442927 lt!442928 mask!3464) lt!442980)))

(declare-fun b!1002270 () Bool)

(assert (=> b!1002270 (= e!564864 e!564866)))

(declare-fun res!671156 () Bool)

(assert (=> b!1002270 (= res!671156 (and ((_ is Intermediate!9346) lt!442980) (not (undefined!10158 lt!442980)) (bvslt (x!87332 lt!442980) #b01111111111111111111111111111110) (bvsge (x!87332 lt!442980) #b00000000000000000000000000000000) (bvsge (x!87332 lt!442980) #b00000000000000000000000000000000)))))

(assert (=> b!1002270 (=> (not res!671156) (not e!564866))))

(assert (= (and d!119725 c!101708) b!1002271))

(assert (= (and d!119725 (not c!101708)) b!1002267))

(assert (= (and b!1002267 c!101710) b!1002273))

(assert (= (and b!1002267 (not c!101710)) b!1002268))

(assert (= (and d!119725 c!101709) b!1002274))

(assert (= (and d!119725 (not c!101709)) b!1002270))

(assert (= (and b!1002270 res!671156) b!1002266))

(assert (= (and b!1002266 (not res!671155)) b!1002272))

(assert (= (and b!1002272 (not res!671157)) b!1002269))

(declare-fun m!928743 () Bool)

(assert (=> b!1002272 m!928743))

(assert (=> b!1002268 m!928627))

(declare-fun m!928745 () Bool)

(assert (=> b!1002268 m!928745))

(assert (=> b!1002268 m!928745))

(declare-fun m!928747 () Bool)

(assert (=> b!1002268 m!928747))

(assert (=> b!1002269 m!928743))

(assert (=> b!1002266 m!928743))

(assert (=> d!119725 m!928627))

(declare-fun m!928749 () Bool)

(assert (=> d!119725 m!928749))

(assert (=> d!119725 m!928637))

(assert (=> b!1002144 d!119725))

(declare-fun d!119727 () Bool)

(declare-fun lt!442983 () (_ BitVec 32))

(declare-fun lt!442982 () (_ BitVec 32))

(assert (=> d!119727 (= lt!442983 (bvmul (bvxor lt!442982 (bvlshr lt!442982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119727 (= lt!442982 ((_ extract 31 0) (bvand (bvxor lt!442927 (bvlshr lt!442927 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119727 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!671145 (let ((h!22307 ((_ extract 31 0) (bvand (bvxor lt!442927 (bvlshr lt!442927 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87336 (bvmul (bvxor h!22307 (bvlshr h!22307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87336 (bvlshr x!87336 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!671145 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!671145 #b00000000000000000000000000000000))))))

(assert (=> d!119727 (= (toIndex!0 lt!442927 mask!3464) (bvand (bvxor lt!442983 (bvlshr lt!442983 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1002144 d!119727))

(declare-fun d!119729 () Bool)

(assert (=> d!119729 (= (validKeyInArray!0 (select (arr!30478 a!3219) j!170)) (and (not (= (select (arr!30478 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30478 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1002143 d!119729))

(declare-fun d!119731 () Bool)

(assert (=> d!119731 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86644 d!119731))

(declare-fun d!119733 () Bool)

(assert (=> d!119733 (= (array_inv!23614 a!3219) (bvsge (size!30981 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86644 d!119733))

(declare-fun b!1002383 () Bool)

(declare-fun e!564931 () SeekEntryResult!9346)

(declare-fun lt!443016 () SeekEntryResult!9346)

(assert (=> b!1002383 (= e!564931 (Found!9346 (index!39757 lt!443016)))))

(declare-fun d!119735 () Bool)

(declare-fun lt!443017 () SeekEntryResult!9346)

(assert (=> d!119735 (and (or ((_ is Undefined!9346) lt!443017) (not ((_ is Found!9346) lt!443017)) (and (bvsge (index!39756 lt!443017) #b00000000000000000000000000000000) (bvslt (index!39756 lt!443017) (size!30981 a!3219)))) (or ((_ is Undefined!9346) lt!443017) ((_ is Found!9346) lt!443017) (not ((_ is MissingZero!9346) lt!443017)) (and (bvsge (index!39755 lt!443017) #b00000000000000000000000000000000) (bvslt (index!39755 lt!443017) (size!30981 a!3219)))) (or ((_ is Undefined!9346) lt!443017) ((_ is Found!9346) lt!443017) ((_ is MissingZero!9346) lt!443017) (not ((_ is MissingVacant!9346) lt!443017)) (and (bvsge (index!39758 lt!443017) #b00000000000000000000000000000000) (bvslt (index!39758 lt!443017) (size!30981 a!3219)))) (or ((_ is Undefined!9346) lt!443017) (ite ((_ is Found!9346) lt!443017) (= (select (arr!30478 a!3219) (index!39756 lt!443017)) k0!2224) (ite ((_ is MissingZero!9346) lt!443017) (= (select (arr!30478 a!3219) (index!39755 lt!443017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9346) lt!443017) (= (select (arr!30478 a!3219) (index!39758 lt!443017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!564930 () SeekEntryResult!9346)

(assert (=> d!119735 (= lt!443017 e!564930)))

(declare-fun c!101747 () Bool)

(assert (=> d!119735 (= c!101747 (and ((_ is Intermediate!9346) lt!443016) (undefined!10158 lt!443016)))))

(assert (=> d!119735 (= lt!443016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119735 (validMask!0 mask!3464)))

(assert (=> d!119735 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!443017)))

(declare-fun b!1002384 () Bool)

(declare-fun e!564932 () SeekEntryResult!9346)

(assert (=> b!1002384 (= e!564932 (MissingZero!9346 (index!39757 lt!443016)))))

(declare-fun b!1002385 () Bool)

(assert (=> b!1002385 (= e!564930 e!564931)))

(declare-fun lt!443018 () (_ BitVec 64))

(assert (=> b!1002385 (= lt!443018 (select (arr!30478 a!3219) (index!39757 lt!443016)))))

(declare-fun c!101749 () Bool)

(assert (=> b!1002385 (= c!101749 (= lt!443018 k0!2224))))

(declare-fun b!1002386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63315 (_ BitVec 32)) SeekEntryResult!9346)

(assert (=> b!1002386 (= e!564932 (seekKeyOrZeroReturnVacant!0 (x!87332 lt!443016) (index!39757 lt!443016) (index!39757 lt!443016) k0!2224 a!3219 mask!3464))))

(declare-fun b!1002387 () Bool)

(declare-fun c!101748 () Bool)

(assert (=> b!1002387 (= c!101748 (= lt!443018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1002387 (= e!564931 e!564932)))

(declare-fun b!1002388 () Bool)

(assert (=> b!1002388 (= e!564930 Undefined!9346)))

(assert (= (and d!119735 c!101747) b!1002388))

(assert (= (and d!119735 (not c!101747)) b!1002385))

(assert (= (and b!1002385 c!101749) b!1002383))

(assert (= (and b!1002385 (not c!101749)) b!1002387))

(assert (= (and b!1002387 c!101748) b!1002384))

(assert (= (and b!1002387 (not c!101748)) b!1002386))

(declare-fun m!928799 () Bool)

(assert (=> d!119735 m!928799))

(declare-fun m!928801 () Bool)

(assert (=> d!119735 m!928801))

(assert (=> d!119735 m!928799))

(assert (=> d!119735 m!928637))

(declare-fun m!928803 () Bool)

(assert (=> d!119735 m!928803))

(declare-fun m!928805 () Bool)

(assert (=> d!119735 m!928805))

(declare-fun m!928807 () Bool)

(assert (=> d!119735 m!928807))

(declare-fun m!928809 () Bool)

(assert (=> b!1002385 m!928809))

(declare-fun m!928811 () Bool)

(assert (=> b!1002386 m!928811))

(assert (=> b!1002138 d!119735))

(declare-fun b!1002389 () Bool)

(declare-fun lt!443019 () SeekEntryResult!9346)

(assert (=> b!1002389 (and (bvsge (index!39757 lt!443019) #b00000000000000000000000000000000) (bvslt (index!39757 lt!443019) (size!30981 lt!442928)))))

(declare-fun res!671196 () Bool)

(assert (=> b!1002389 (= res!671196 (= (select (arr!30478 lt!442928) (index!39757 lt!443019)) lt!442927))))

(declare-fun e!564934 () Bool)

(assert (=> b!1002389 (=> res!671196 e!564934)))

(declare-fun e!564937 () Bool)

(assert (=> b!1002389 (= e!564937 e!564934)))

(declare-fun b!1002390 () Bool)

(declare-fun e!564936 () SeekEntryResult!9346)

(declare-fun e!564933 () SeekEntryResult!9346)

(assert (=> b!1002390 (= e!564936 e!564933)))

(declare-fun c!101752 () Bool)

(declare-fun lt!443020 () (_ BitVec 64))

(assert (=> b!1002390 (= c!101752 (or (= lt!443020 lt!442927) (= (bvadd lt!443020 lt!443020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1002391 () Bool)

(assert (=> b!1002391 (= e!564933 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!442927 lt!442928 mask!3464))))

(declare-fun b!1002392 () Bool)

(assert (=> b!1002392 (and (bvsge (index!39757 lt!443019) #b00000000000000000000000000000000) (bvslt (index!39757 lt!443019) (size!30981 lt!442928)))))

(assert (=> b!1002392 (= e!564934 (= (select (arr!30478 lt!442928) (index!39757 lt!443019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1002394 () Bool)

(assert (=> b!1002394 (= e!564936 (Intermediate!9346 true index!1507 x!1245))))

(declare-fun b!1002395 () Bool)

(assert (=> b!1002395 (and (bvsge (index!39757 lt!443019) #b00000000000000000000000000000000) (bvslt (index!39757 lt!443019) (size!30981 lt!442928)))))

(declare-fun res!671198 () Bool)

(assert (=> b!1002395 (= res!671198 (= (select (arr!30478 lt!442928) (index!39757 lt!443019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1002395 (=> res!671198 e!564934)))

(declare-fun b!1002396 () Bool)

(assert (=> b!1002396 (= e!564933 (Intermediate!9346 false index!1507 x!1245))))

(declare-fun b!1002397 () Bool)

(declare-fun e!564935 () Bool)

(assert (=> b!1002397 (= e!564935 (bvsge (x!87332 lt!443019) #b01111111111111111111111111111110))))

(declare-fun d!119755 () Bool)

(assert (=> d!119755 e!564935))

(declare-fun c!101751 () Bool)

(assert (=> d!119755 (= c!101751 (and ((_ is Intermediate!9346) lt!443019) (undefined!10158 lt!443019)))))

(assert (=> d!119755 (= lt!443019 e!564936)))

(declare-fun c!101750 () Bool)

(assert (=> d!119755 (= c!101750 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119755 (= lt!443020 (select (arr!30478 lt!442928) index!1507))))

(assert (=> d!119755 (validMask!0 mask!3464)))

(assert (=> d!119755 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442927 lt!442928 mask!3464) lt!443019)))

(declare-fun b!1002393 () Bool)

(assert (=> b!1002393 (= e!564935 e!564937)))

(declare-fun res!671197 () Bool)

(assert (=> b!1002393 (= res!671197 (and ((_ is Intermediate!9346) lt!443019) (not (undefined!10158 lt!443019)) (bvslt (x!87332 lt!443019) #b01111111111111111111111111111110) (bvsge (x!87332 lt!443019) #b00000000000000000000000000000000) (bvsge (x!87332 lt!443019) x!1245)))))

(assert (=> b!1002393 (=> (not res!671197) (not e!564937))))

(assert (= (and d!119755 c!101750) b!1002394))

(assert (= (and d!119755 (not c!101750)) b!1002390))

(assert (= (and b!1002390 c!101752) b!1002396))

(assert (= (and b!1002390 (not c!101752)) b!1002391))

(assert (= (and d!119755 c!101751) b!1002397))

(assert (= (and d!119755 (not c!101751)) b!1002393))

(assert (= (and b!1002393 res!671197) b!1002389))

(assert (= (and b!1002389 (not res!671196)) b!1002395))

(assert (= (and b!1002395 (not res!671198)) b!1002392))

(declare-fun m!928813 () Bool)

(assert (=> b!1002395 m!928813))

(declare-fun m!928815 () Bool)

(assert (=> b!1002391 m!928815))

(assert (=> b!1002391 m!928815))

(declare-fun m!928817 () Bool)

(assert (=> b!1002391 m!928817))

(assert (=> b!1002392 m!928813))

(assert (=> b!1002389 m!928813))

(declare-fun m!928819 () Bool)

(assert (=> d!119755 m!928819))

(assert (=> d!119755 m!928637))

(assert (=> b!1002137 d!119755))

(declare-fun d!119757 () Bool)

(declare-fun res!671203 () Bool)

(declare-fun e!564942 () Bool)

(assert (=> d!119757 (=> res!671203 e!564942)))

(assert (=> d!119757 (= res!671203 (= (select (arr!30478 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119757 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!564942)))

(declare-fun b!1002402 () Bool)

(declare-fun e!564943 () Bool)

(assert (=> b!1002402 (= e!564942 e!564943)))

(declare-fun res!671204 () Bool)

(assert (=> b!1002402 (=> (not res!671204) (not e!564943))))

(assert (=> b!1002402 (= res!671204 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30981 a!3219)))))

(declare-fun b!1002403 () Bool)

(assert (=> b!1002403 (= e!564943 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119757 (not res!671203)) b!1002402))

(assert (= (and b!1002402 res!671204) b!1002403))

(assert (=> d!119757 m!928735))

(declare-fun m!928821 () Bool)

(assert (=> b!1002403 m!928821))

(assert (=> b!1002141 d!119757))

(declare-fun b!1002404 () Bool)

(declare-fun lt!443027 () SeekEntryResult!9346)

(assert (=> b!1002404 (and (bvsge (index!39757 lt!443027) #b00000000000000000000000000000000) (bvslt (index!39757 lt!443027) (size!30981 a!3219)))))

(declare-fun res!671205 () Bool)

(assert (=> b!1002404 (= res!671205 (= (select (arr!30478 a!3219) (index!39757 lt!443027)) (select (arr!30478 a!3219) j!170)))))

(declare-fun e!564945 () Bool)

(assert (=> b!1002404 (=> res!671205 e!564945)))

(declare-fun e!564948 () Bool)

(assert (=> b!1002404 (= e!564948 e!564945)))

(declare-fun b!1002405 () Bool)

(declare-fun e!564947 () SeekEntryResult!9346)

(declare-fun e!564944 () SeekEntryResult!9346)

(assert (=> b!1002405 (= e!564947 e!564944)))

(declare-fun lt!443028 () (_ BitVec 64))

(declare-fun c!101755 () Bool)

(assert (=> b!1002405 (= c!101755 (or (= lt!443028 (select (arr!30478 a!3219) j!170)) (= (bvadd lt!443028 lt!443028) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1002406 () Bool)

(assert (=> b!1002406 (= e!564944 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30478 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002407 () Bool)

(assert (=> b!1002407 (and (bvsge (index!39757 lt!443027) #b00000000000000000000000000000000) (bvslt (index!39757 lt!443027) (size!30981 a!3219)))))

(assert (=> b!1002407 (= e!564945 (= (select (arr!30478 a!3219) (index!39757 lt!443027)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1002409 () Bool)

(assert (=> b!1002409 (= e!564947 (Intermediate!9346 true index!1507 x!1245))))

(declare-fun b!1002410 () Bool)

(assert (=> b!1002410 (and (bvsge (index!39757 lt!443027) #b00000000000000000000000000000000) (bvslt (index!39757 lt!443027) (size!30981 a!3219)))))

(declare-fun res!671207 () Bool)

(assert (=> b!1002410 (= res!671207 (= (select (arr!30478 a!3219) (index!39757 lt!443027)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1002410 (=> res!671207 e!564945)))

(declare-fun b!1002411 () Bool)

(assert (=> b!1002411 (= e!564944 (Intermediate!9346 false index!1507 x!1245))))

(declare-fun b!1002412 () Bool)

(declare-fun e!564946 () Bool)

(assert (=> b!1002412 (= e!564946 (bvsge (x!87332 lt!443027) #b01111111111111111111111111111110))))

(declare-fun d!119761 () Bool)

(assert (=> d!119761 e!564946))

(declare-fun c!101754 () Bool)

(assert (=> d!119761 (= c!101754 (and ((_ is Intermediate!9346) lt!443027) (undefined!10158 lt!443027)))))

(assert (=> d!119761 (= lt!443027 e!564947)))

(declare-fun c!101753 () Bool)

(assert (=> d!119761 (= c!101753 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119761 (= lt!443028 (select (arr!30478 a!3219) index!1507))))

(assert (=> d!119761 (validMask!0 mask!3464)))

(assert (=> d!119761 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30478 a!3219) j!170) a!3219 mask!3464) lt!443027)))

(declare-fun b!1002408 () Bool)

(assert (=> b!1002408 (= e!564946 e!564948)))

(declare-fun res!671206 () Bool)

(assert (=> b!1002408 (= res!671206 (and ((_ is Intermediate!9346) lt!443027) (not (undefined!10158 lt!443027)) (bvslt (x!87332 lt!443027) #b01111111111111111111111111111110) (bvsge (x!87332 lt!443027) #b00000000000000000000000000000000) (bvsge (x!87332 lt!443027) x!1245)))))

(assert (=> b!1002408 (=> (not res!671206) (not e!564948))))

(assert (= (and d!119761 c!101753) b!1002409))

(assert (= (and d!119761 (not c!101753)) b!1002405))

(assert (= (and b!1002405 c!101755) b!1002411))

(assert (= (and b!1002405 (not c!101755)) b!1002406))

(assert (= (and d!119761 c!101754) b!1002412))

(assert (= (and d!119761 (not c!101754)) b!1002408))

(assert (= (and b!1002408 res!671206) b!1002404))

(assert (= (and b!1002404 (not res!671205)) b!1002410))

(assert (= (and b!1002410 (not res!671207)) b!1002407))

(declare-fun m!928823 () Bool)

(assert (=> b!1002410 m!928823))

(assert (=> b!1002406 m!928815))

(assert (=> b!1002406 m!928815))

(assert (=> b!1002406 m!928643))

(declare-fun m!928825 () Bool)

(assert (=> b!1002406 m!928825))

(assert (=> b!1002407 m!928823))

(assert (=> b!1002404 m!928823))

(declare-fun m!928827 () Bool)

(assert (=> d!119761 m!928827))

(assert (=> d!119761 m!928637))

(assert (=> b!1002136 d!119761))

(declare-fun b!1002475 () Bool)

(declare-fun e!564993 () Bool)

(declare-fun call!42373 () Bool)

(assert (=> b!1002475 (= e!564993 call!42373)))

(declare-fun b!1002476 () Bool)

(declare-fun e!564991 () Bool)

(assert (=> b!1002476 (= e!564993 e!564991)))

(declare-fun lt!443051 () (_ BitVec 64))

(assert (=> b!1002476 (= lt!443051 (select (arr!30478 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32981 0))(
  ( (Unit!32982) )
))
(declare-fun lt!443052 () Unit!32981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63315 (_ BitVec 64) (_ BitVec 32)) Unit!32981)

(assert (=> b!1002476 (= lt!443052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!443051 #b00000000000000000000000000000000))))

(assert (=> b!1002476 (arrayContainsKey!0 a!3219 lt!443051 #b00000000000000000000000000000000)))

(declare-fun lt!443050 () Unit!32981)

(assert (=> b!1002476 (= lt!443050 lt!443052)))

(declare-fun res!671237 () Bool)

(assert (=> b!1002476 (= res!671237 (= (seekEntryOrOpen!0 (select (arr!30478 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9346 #b00000000000000000000000000000000)))))

(assert (=> b!1002476 (=> (not res!671237) (not e!564991))))

(declare-fun b!1002477 () Bool)

(assert (=> b!1002477 (= e!564991 call!42373)))

(declare-fun b!1002478 () Bool)

(declare-fun e!564992 () Bool)

(assert (=> b!1002478 (= e!564992 e!564993)))

(declare-fun c!101773 () Bool)

(assert (=> b!1002478 (= c!101773 (validKeyInArray!0 (select (arr!30478 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119767 () Bool)

(declare-fun res!671236 () Bool)

(assert (=> d!119767 (=> res!671236 e!564992)))

(assert (=> d!119767 (= res!671236 (bvsge #b00000000000000000000000000000000 (size!30981 a!3219)))))

(assert (=> d!119767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!564992)))

(declare-fun bm!42370 () Bool)

(assert (=> bm!42370 (= call!42373 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119767 (not res!671236)) b!1002478))

(assert (= (and b!1002478 c!101773) b!1002476))

(assert (= (and b!1002478 (not c!101773)) b!1002475))

(assert (= (and b!1002476 res!671237) b!1002477))

(assert (= (or b!1002477 b!1002475) bm!42370))

(assert (=> b!1002476 m!928735))

(declare-fun m!928865 () Bool)

(assert (=> b!1002476 m!928865))

(declare-fun m!928867 () Bool)

(assert (=> b!1002476 m!928867))

(assert (=> b!1002476 m!928735))

(declare-fun m!928869 () Bool)

(assert (=> b!1002476 m!928869))

(assert (=> b!1002478 m!928735))

(assert (=> b!1002478 m!928735))

(assert (=> b!1002478 m!928739))

(declare-fun m!928871 () Bool)

(assert (=> bm!42370 m!928871))

(assert (=> b!1002135 d!119767))

(check-sat (not b!1002403) (not b!1002268) (not b!1002391) (not bm!42358) (not b!1002478) (not d!119761) (not bm!42370) (not b!1002386) (not b!1002244) (not b!1002262) (not d!119755) (not b!1002265) (not d!119725) (not d!119735) (not b!1002406) (not d!119713) (not b!1002264) (not b!1002476))
(check-sat)
