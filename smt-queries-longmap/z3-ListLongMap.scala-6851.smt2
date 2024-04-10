; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86308 () Bool)

(assert start!86308)

(declare-fun b!999062 () Bool)

(declare-fun res!668701 () Bool)

(declare-fun e!563329 () Bool)

(assert (=> b!999062 (=> (not res!668701) (not e!563329))))

(declare-datatypes ((array!63160 0))(
  ( (array!63161 (arr!30407 (Array (_ BitVec 32) (_ BitVec 64))) (size!30909 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63160)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999062 (= res!668701 (validKeyInArray!0 (select (arr!30407 a!3219) j!170)))))

(declare-fun b!999063 () Bool)

(declare-fun res!668699 () Bool)

(declare-fun e!563326 () Bool)

(assert (=> b!999063 (=> (not res!668699) (not e!563326))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9339 0))(
  ( (MissingZero!9339 (index!39727 (_ BitVec 32))) (Found!9339 (index!39728 (_ BitVec 32))) (Intermediate!9339 (undefined!10151 Bool) (index!39729 (_ BitVec 32)) (x!87161 (_ BitVec 32))) (Undefined!9339) (MissingVacant!9339 (index!39730 (_ BitVec 32))) )
))
(declare-fun lt!441894 () SeekEntryResult!9339)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63160 (_ BitVec 32)) SeekEntryResult!9339)

(assert (=> b!999063 (= res!668699 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30407 a!3219) j!170) a!3219 mask!3464) lt!441894))))

(declare-fun res!668707 () Bool)

(assert (=> start!86308 (=> (not res!668707) (not e!563329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86308 (= res!668707 (validMask!0 mask!3464))))

(assert (=> start!86308 e!563329))

(declare-fun array_inv!23531 (array!63160) Bool)

(assert (=> start!86308 (array_inv!23531 a!3219)))

(assert (=> start!86308 true))

(declare-fun b!999064 () Bool)

(declare-fun res!668704 () Bool)

(assert (=> b!999064 (=> (not res!668704) (not e!563329))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999064 (= res!668704 (and (= (size!30909 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30909 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30909 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999065 () Bool)

(declare-fun res!668702 () Bool)

(declare-fun e!563328 () Bool)

(assert (=> b!999065 (=> (not res!668702) (not e!563328))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999065 (= res!668702 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30909 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30909 a!3219))))))

(declare-fun b!999066 () Bool)

(assert (=> b!999066 (= e!563328 e!563326)))

(declare-fun res!668705 () Bool)

(assert (=> b!999066 (=> (not res!668705) (not e!563326))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999066 (= res!668705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464) (select (arr!30407 a!3219) j!170) a!3219 mask!3464) lt!441894))))

(assert (=> b!999066 (= lt!441894 (Intermediate!9339 false resIndex!38 resX!38))))

(declare-fun b!999067 () Bool)

(declare-fun res!668708 () Bool)

(assert (=> b!999067 (=> (not res!668708) (not e!563329))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999067 (= res!668708 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999068 () Bool)

(declare-fun res!668709 () Bool)

(assert (=> b!999068 (=> (not res!668709) (not e!563328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63160 (_ BitVec 32)) Bool)

(assert (=> b!999068 (= res!668709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999069 () Bool)

(declare-fun res!668700 () Bool)

(assert (=> b!999069 (=> (not res!668700) (not e!563328))))

(declare-datatypes ((List!21083 0))(
  ( (Nil!21080) (Cons!21079 (h!22253 (_ BitVec 64)) (t!30084 List!21083)) )
))
(declare-fun arrayNoDuplicates!0 (array!63160 (_ BitVec 32) List!21083) Bool)

(assert (=> b!999069 (= res!668700 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21080))))

(declare-fun b!999070 () Bool)

(assert (=> b!999070 (= e!563329 e!563328)))

(declare-fun res!668703 () Bool)

(assert (=> b!999070 (=> (not res!668703) (not e!563328))))

(declare-fun lt!441895 () SeekEntryResult!9339)

(assert (=> b!999070 (= res!668703 (or (= lt!441895 (MissingVacant!9339 i!1194)) (= lt!441895 (MissingZero!9339 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63160 (_ BitVec 32)) SeekEntryResult!9339)

(assert (=> b!999070 (= lt!441895 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999071 () Bool)

(declare-fun res!668706 () Bool)

(assert (=> b!999071 (=> (not res!668706) (not e!563329))))

(assert (=> b!999071 (= res!668706 (validKeyInArray!0 k0!2224))))

(declare-fun b!999072 () Bool)

(declare-fun lt!441896 () (_ BitVec 32))

(assert (=> b!999072 (= e!563326 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441896 #b00000000000000000000000000000000) (bvsge lt!441896 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(assert (=> b!999072 (= lt!441896 (toIndex!0 (select (store (arr!30407 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(assert (= (and start!86308 res!668707) b!999064))

(assert (= (and b!999064 res!668704) b!999062))

(assert (= (and b!999062 res!668701) b!999071))

(assert (= (and b!999071 res!668706) b!999067))

(assert (= (and b!999067 res!668708) b!999070))

(assert (= (and b!999070 res!668703) b!999068))

(assert (= (and b!999068 res!668709) b!999069))

(assert (= (and b!999069 res!668700) b!999065))

(assert (= (and b!999065 res!668702) b!999066))

(assert (= (and b!999066 res!668705) b!999063))

(assert (= (and b!999063 res!668699) b!999072))

(declare-fun m!925433 () Bool)

(assert (=> b!999072 m!925433))

(declare-fun m!925435 () Bool)

(assert (=> b!999072 m!925435))

(assert (=> b!999072 m!925435))

(declare-fun m!925437 () Bool)

(assert (=> b!999072 m!925437))

(declare-fun m!925439 () Bool)

(assert (=> b!999066 m!925439))

(assert (=> b!999066 m!925439))

(declare-fun m!925441 () Bool)

(assert (=> b!999066 m!925441))

(assert (=> b!999066 m!925441))

(assert (=> b!999066 m!925439))

(declare-fun m!925443 () Bool)

(assert (=> b!999066 m!925443))

(declare-fun m!925445 () Bool)

(assert (=> b!999069 m!925445))

(declare-fun m!925447 () Bool)

(assert (=> b!999067 m!925447))

(assert (=> b!999062 m!925439))

(assert (=> b!999062 m!925439))

(declare-fun m!925449 () Bool)

(assert (=> b!999062 m!925449))

(declare-fun m!925451 () Bool)

(assert (=> start!86308 m!925451))

(declare-fun m!925453 () Bool)

(assert (=> start!86308 m!925453))

(declare-fun m!925455 () Bool)

(assert (=> b!999071 m!925455))

(declare-fun m!925457 () Bool)

(assert (=> b!999068 m!925457))

(assert (=> b!999063 m!925439))

(assert (=> b!999063 m!925439))

(declare-fun m!925459 () Bool)

(assert (=> b!999063 m!925459))

(declare-fun m!925461 () Bool)

(assert (=> b!999070 m!925461))

(check-sat (not b!999070) (not b!999071) (not start!86308) (not b!999063) (not b!999072) (not b!999067) (not b!999069) (not b!999062) (not b!999068) (not b!999066))
(check-sat)
(get-model)

(declare-fun d!119253 () Bool)

(declare-fun lt!441911 () (_ BitVec 32))

(declare-fun lt!441910 () (_ BitVec 32))

(assert (=> d!119253 (= lt!441911 (bvmul (bvxor lt!441910 (bvlshr lt!441910 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119253 (= lt!441910 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30407 a!3219) i!1194 k0!2224) j!170) (bvlshr (select (store (arr!30407 a!3219) i!1194 k0!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119253 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668743 (let ((h!22255 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30407 a!3219) i!1194 k0!2224) j!170) (bvlshr (select (store (arr!30407 a!3219) i!1194 k0!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87163 (bvmul (bvxor h!22255 (bvlshr h!22255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87163 (bvlshr x!87163 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668743 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668743 #b00000000000000000000000000000000))))))

(assert (=> d!119253 (= (toIndex!0 (select (store (arr!30407 a!3219) i!1194 k0!2224) j!170) mask!3464) (bvand (bvxor lt!441911 (bvlshr lt!441911 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999072 d!119253))

(declare-fun d!119255 () Bool)

(assert (=> d!119255 (= (validKeyInArray!0 (select (arr!30407 a!3219) j!170)) (and (not (= (select (arr!30407 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30407 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999062 d!119255))

(declare-fun d!119257 () Bool)

(declare-fun res!668748 () Bool)

(declare-fun e!563346 () Bool)

(assert (=> d!119257 (=> res!668748 e!563346)))

(assert (=> d!119257 (= res!668748 (= (select (arr!30407 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119257 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!563346)))

(declare-fun b!999110 () Bool)

(declare-fun e!563347 () Bool)

(assert (=> b!999110 (= e!563346 e!563347)))

(declare-fun res!668749 () Bool)

(assert (=> b!999110 (=> (not res!668749) (not e!563347))))

(assert (=> b!999110 (= res!668749 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30909 a!3219)))))

(declare-fun b!999111 () Bool)

(assert (=> b!999111 (= e!563347 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119257 (not res!668748)) b!999110))

(assert (= (and b!999110 res!668749) b!999111))

(declare-fun m!925493 () Bool)

(assert (=> d!119257 m!925493))

(declare-fun m!925495 () Bool)

(assert (=> b!999111 m!925495))

(assert (=> b!999067 d!119257))

(declare-fun d!119259 () Bool)

(assert (=> d!119259 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86308 d!119259))

(declare-fun d!119267 () Bool)

(assert (=> d!119267 (= (array_inv!23531 a!3219) (bvsge (size!30909 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86308 d!119267))

(declare-fun b!999157 () Bool)

(declare-fun e!563376 () Bool)

(declare-fun e!563374 () Bool)

(assert (=> b!999157 (= e!563376 e!563374)))

(declare-fun res!668769 () Bool)

(declare-fun lt!441922 () SeekEntryResult!9339)

(get-info :version)

(assert (=> b!999157 (= res!668769 (and ((_ is Intermediate!9339) lt!441922) (not (undefined!10151 lt!441922)) (bvslt (x!87161 lt!441922) #b01111111111111111111111111111110) (bvsge (x!87161 lt!441922) #b00000000000000000000000000000000) (bvsge (x!87161 lt!441922) #b00000000000000000000000000000000)))))

(assert (=> b!999157 (=> (not res!668769) (not e!563374))))

(declare-fun b!999158 () Bool)

(declare-fun e!563375 () SeekEntryResult!9339)

(assert (=> b!999158 (= e!563375 (Intermediate!9339 true (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun e!563377 () SeekEntryResult!9339)

(declare-fun b!999159 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999159 (= e!563377 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30407 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999160 () Bool)

(assert (=> b!999160 (and (bvsge (index!39729 lt!441922) #b00000000000000000000000000000000) (bvslt (index!39729 lt!441922) (size!30909 a!3219)))))

(declare-fun res!668768 () Bool)

(assert (=> b!999160 (= res!668768 (= (select (arr!30407 a!3219) (index!39729 lt!441922)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563373 () Bool)

(assert (=> b!999160 (=> res!668768 e!563373)))

(declare-fun b!999161 () Bool)

(assert (=> b!999161 (and (bvsge (index!39729 lt!441922) #b00000000000000000000000000000000) (bvslt (index!39729 lt!441922) (size!30909 a!3219)))))

(declare-fun res!668767 () Bool)

(assert (=> b!999161 (= res!668767 (= (select (arr!30407 a!3219) (index!39729 lt!441922)) (select (arr!30407 a!3219) j!170)))))

(assert (=> b!999161 (=> res!668767 e!563373)))

(assert (=> b!999161 (= e!563374 e!563373)))

(declare-fun b!999162 () Bool)

(assert (=> b!999162 (and (bvsge (index!39729 lt!441922) #b00000000000000000000000000000000) (bvslt (index!39729 lt!441922) (size!30909 a!3219)))))

(assert (=> b!999162 (= e!563373 (= (select (arr!30407 a!3219) (index!39729 lt!441922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999163 () Bool)

(assert (=> b!999163 (= e!563375 e!563377)))

(declare-fun lt!441923 () (_ BitVec 64))

(declare-fun c!101343 () Bool)

(assert (=> b!999163 (= c!101343 (or (= lt!441923 (select (arr!30407 a!3219) j!170)) (= (bvadd lt!441923 lt!441923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!119269 () Bool)

(assert (=> d!119269 e!563376))

(declare-fun c!101345 () Bool)

(assert (=> d!119269 (= c!101345 (and ((_ is Intermediate!9339) lt!441922) (undefined!10151 lt!441922)))))

(assert (=> d!119269 (= lt!441922 e!563375)))

(declare-fun c!101344 () Bool)

(assert (=> d!119269 (= c!101344 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119269 (= lt!441923 (select (arr!30407 a!3219) (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464)))))

(assert (=> d!119269 (validMask!0 mask!3464)))

(assert (=> d!119269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464) (select (arr!30407 a!3219) j!170) a!3219 mask!3464) lt!441922)))

(declare-fun b!999164 () Bool)

(assert (=> b!999164 (= e!563377 (Intermediate!9339 false (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!999165 () Bool)

(assert (=> b!999165 (= e!563376 (bvsge (x!87161 lt!441922) #b01111111111111111111111111111110))))

(assert (= (and d!119269 c!101344) b!999158))

(assert (= (and d!119269 (not c!101344)) b!999163))

(assert (= (and b!999163 c!101343) b!999164))

(assert (= (and b!999163 (not c!101343)) b!999159))

(assert (= (and d!119269 c!101345) b!999165))

(assert (= (and d!119269 (not c!101345)) b!999157))

(assert (= (and b!999157 res!668769) b!999161))

(assert (= (and b!999161 (not res!668767)) b!999160))

(assert (= (and b!999160 (not res!668768)) b!999162))

(assert (=> b!999159 m!925441))

(declare-fun m!925505 () Bool)

(assert (=> b!999159 m!925505))

(assert (=> b!999159 m!925505))

(assert (=> b!999159 m!925439))

(declare-fun m!925507 () Bool)

(assert (=> b!999159 m!925507))

(declare-fun m!925509 () Bool)

(assert (=> b!999162 m!925509))

(assert (=> b!999161 m!925509))

(assert (=> b!999160 m!925509))

(assert (=> d!119269 m!925441))

(declare-fun m!925511 () Bool)

(assert (=> d!119269 m!925511))

(assert (=> d!119269 m!925451))

(assert (=> b!999066 d!119269))

(declare-fun d!119279 () Bool)

(declare-fun lt!441925 () (_ BitVec 32))

(declare-fun lt!441924 () (_ BitVec 32))

(assert (=> d!119279 (= lt!441925 (bvmul (bvxor lt!441924 (bvlshr lt!441924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119279 (= lt!441924 ((_ extract 31 0) (bvand (bvxor (select (arr!30407 a!3219) j!170) (bvlshr (select (arr!30407 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119279 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668743 (let ((h!22255 ((_ extract 31 0) (bvand (bvxor (select (arr!30407 a!3219) j!170) (bvlshr (select (arr!30407 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87163 (bvmul (bvxor h!22255 (bvlshr h!22255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87163 (bvlshr x!87163 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668743 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668743 #b00000000000000000000000000000000))))))

(assert (=> d!119279 (= (toIndex!0 (select (arr!30407 a!3219) j!170) mask!3464) (bvand (bvxor lt!441925 (bvlshr lt!441925 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999066 d!119279))

(declare-fun d!119281 () Bool)

(assert (=> d!119281 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999071 d!119281))

(declare-fun b!999182 () Bool)

(declare-fun e!563395 () Bool)

(declare-fun call!42296 () Bool)

(assert (=> b!999182 (= e!563395 call!42296)))

(declare-fun b!999183 () Bool)

(declare-fun e!563393 () Bool)

(declare-fun e!563394 () Bool)

(assert (=> b!999183 (= e!563393 e!563394)))

(declare-fun res!668783 () Bool)

(assert (=> b!999183 (=> (not res!668783) (not e!563394))))

(declare-fun e!563392 () Bool)

(assert (=> b!999183 (= res!668783 (not e!563392))))

(declare-fun res!668782 () Bool)

(assert (=> b!999183 (=> (not res!668782) (not e!563392))))

(assert (=> b!999183 (= res!668782 (validKeyInArray!0 (select (arr!30407 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999184 () Bool)

(assert (=> b!999184 (= e!563395 call!42296)))

(declare-fun b!999185 () Bool)

(declare-fun contains!5877 (List!21083 (_ BitVec 64)) Bool)

(assert (=> b!999185 (= e!563392 (contains!5877 Nil!21080 (select (arr!30407 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119283 () Bool)

(declare-fun res!668784 () Bool)

(assert (=> d!119283 (=> res!668784 e!563393)))

(assert (=> d!119283 (= res!668784 (bvsge #b00000000000000000000000000000000 (size!30909 a!3219)))))

(assert (=> d!119283 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21080) e!563393)))

(declare-fun bm!42293 () Bool)

(declare-fun c!101348 () Bool)

(assert (=> bm!42293 (= call!42296 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101348 (Cons!21079 (select (arr!30407 a!3219) #b00000000000000000000000000000000) Nil!21080) Nil!21080)))))

(declare-fun b!999186 () Bool)

(assert (=> b!999186 (= e!563394 e!563395)))

(assert (=> b!999186 (= c!101348 (validKeyInArray!0 (select (arr!30407 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119283 (not res!668784)) b!999183))

(assert (= (and b!999183 res!668782) b!999185))

(assert (= (and b!999183 res!668783) b!999186))

(assert (= (and b!999186 c!101348) b!999182))

(assert (= (and b!999186 (not c!101348)) b!999184))

(assert (= (or b!999182 b!999184) bm!42293))

(assert (=> b!999183 m!925493))

(assert (=> b!999183 m!925493))

(declare-fun m!925517 () Bool)

(assert (=> b!999183 m!925517))

(assert (=> b!999185 m!925493))

(assert (=> b!999185 m!925493))

(declare-fun m!925519 () Bool)

(assert (=> b!999185 m!925519))

(assert (=> bm!42293 m!925493))

(declare-fun m!925521 () Bool)

(assert (=> bm!42293 m!925521))

(assert (=> b!999186 m!925493))

(assert (=> b!999186 m!925493))

(assert (=> b!999186 m!925517))

(assert (=> b!999069 d!119283))

(declare-fun b!999244 () Bool)

(declare-fun e!563429 () SeekEntryResult!9339)

(declare-fun lt!441959 () SeekEntryResult!9339)

(assert (=> b!999244 (= e!563429 (MissingZero!9339 (index!39729 lt!441959)))))

(declare-fun b!999245 () Bool)

(declare-fun c!101374 () Bool)

(declare-fun lt!441960 () (_ BitVec 64))

(assert (=> b!999245 (= c!101374 (= lt!441960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563430 () SeekEntryResult!9339)

(assert (=> b!999245 (= e!563430 e!563429)))

(declare-fun b!999246 () Bool)

(declare-fun e!563431 () SeekEntryResult!9339)

(assert (=> b!999246 (= e!563431 e!563430)))

(assert (=> b!999246 (= lt!441960 (select (arr!30407 a!3219) (index!39729 lt!441959)))))

(declare-fun c!101373 () Bool)

(assert (=> b!999246 (= c!101373 (= lt!441960 k0!2224))))

(declare-fun b!999247 () Bool)

(assert (=> b!999247 (= e!563431 Undefined!9339)))

(declare-fun b!999248 () Bool)

(assert (=> b!999248 (= e!563430 (Found!9339 (index!39729 lt!441959)))))

(declare-fun d!119295 () Bool)

(declare-fun lt!441961 () SeekEntryResult!9339)

(assert (=> d!119295 (and (or ((_ is Undefined!9339) lt!441961) (not ((_ is Found!9339) lt!441961)) (and (bvsge (index!39728 lt!441961) #b00000000000000000000000000000000) (bvslt (index!39728 lt!441961) (size!30909 a!3219)))) (or ((_ is Undefined!9339) lt!441961) ((_ is Found!9339) lt!441961) (not ((_ is MissingZero!9339) lt!441961)) (and (bvsge (index!39727 lt!441961) #b00000000000000000000000000000000) (bvslt (index!39727 lt!441961) (size!30909 a!3219)))) (or ((_ is Undefined!9339) lt!441961) ((_ is Found!9339) lt!441961) ((_ is MissingZero!9339) lt!441961) (not ((_ is MissingVacant!9339) lt!441961)) (and (bvsge (index!39730 lt!441961) #b00000000000000000000000000000000) (bvslt (index!39730 lt!441961) (size!30909 a!3219)))) (or ((_ is Undefined!9339) lt!441961) (ite ((_ is Found!9339) lt!441961) (= (select (arr!30407 a!3219) (index!39728 lt!441961)) k0!2224) (ite ((_ is MissingZero!9339) lt!441961) (= (select (arr!30407 a!3219) (index!39727 lt!441961)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9339) lt!441961) (= (select (arr!30407 a!3219) (index!39730 lt!441961)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119295 (= lt!441961 e!563431)))

(declare-fun c!101375 () Bool)

(assert (=> d!119295 (= c!101375 (and ((_ is Intermediate!9339) lt!441959) (undefined!10151 lt!441959)))))

(assert (=> d!119295 (= lt!441959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119295 (validMask!0 mask!3464)))

(assert (=> d!119295 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441961)))

(declare-fun b!999249 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63160 (_ BitVec 32)) SeekEntryResult!9339)

(assert (=> b!999249 (= e!563429 (seekKeyOrZeroReturnVacant!0 (x!87161 lt!441959) (index!39729 lt!441959) (index!39729 lt!441959) k0!2224 a!3219 mask!3464))))

(assert (= (and d!119295 c!101375) b!999247))

(assert (= (and d!119295 (not c!101375)) b!999246))

(assert (= (and b!999246 c!101373) b!999248))

(assert (= (and b!999246 (not c!101373)) b!999245))

(assert (= (and b!999245 c!101374) b!999244))

(assert (= (and b!999245 (not c!101374)) b!999249))

(declare-fun m!925543 () Bool)

(assert (=> b!999246 m!925543))

(assert (=> d!119295 m!925451))

(declare-fun m!925545 () Bool)

(assert (=> d!119295 m!925545))

(declare-fun m!925547 () Bool)

(assert (=> d!119295 m!925547))

(declare-fun m!925549 () Bool)

(assert (=> d!119295 m!925549))

(assert (=> d!119295 m!925547))

(declare-fun m!925551 () Bool)

(assert (=> d!119295 m!925551))

(declare-fun m!925553 () Bool)

(assert (=> d!119295 m!925553))

(declare-fun m!925555 () Bool)

(assert (=> b!999249 m!925555))

(assert (=> b!999070 d!119295))

(declare-fun b!999273 () Bool)

(declare-fun e!563446 () Bool)

(declare-fun call!42302 () Bool)

(assert (=> b!999273 (= e!563446 call!42302)))

(declare-fun b!999274 () Bool)

(declare-fun e!563448 () Bool)

(assert (=> b!999274 (= e!563448 call!42302)))

(declare-fun d!119301 () Bool)

(declare-fun res!668801 () Bool)

(declare-fun e!563447 () Bool)

(assert (=> d!119301 (=> res!668801 e!563447)))

(assert (=> d!119301 (= res!668801 (bvsge #b00000000000000000000000000000000 (size!30909 a!3219)))))

(assert (=> d!119301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563447)))

(declare-fun b!999275 () Bool)

(assert (=> b!999275 (= e!563447 e!563448)))

(declare-fun c!101384 () Bool)

(assert (=> b!999275 (= c!101384 (validKeyInArray!0 (select (arr!30407 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42299 () Bool)

(assert (=> bm!42299 (= call!42302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!999276 () Bool)

(assert (=> b!999276 (= e!563448 e!563446)))

(declare-fun lt!441975 () (_ BitVec 64))

(assert (=> b!999276 (= lt!441975 (select (arr!30407 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32992 0))(
  ( (Unit!32993) )
))
(declare-fun lt!441976 () Unit!32992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63160 (_ BitVec 64) (_ BitVec 32)) Unit!32992)

(assert (=> b!999276 (= lt!441976 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441975 #b00000000000000000000000000000000))))

(assert (=> b!999276 (arrayContainsKey!0 a!3219 lt!441975 #b00000000000000000000000000000000)))

(declare-fun lt!441977 () Unit!32992)

(assert (=> b!999276 (= lt!441977 lt!441976)))

(declare-fun res!668802 () Bool)

(assert (=> b!999276 (= res!668802 (= (seekEntryOrOpen!0 (select (arr!30407 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9339 #b00000000000000000000000000000000)))))

(assert (=> b!999276 (=> (not res!668802) (not e!563446))))

(assert (= (and d!119301 (not res!668801)) b!999275))

(assert (= (and b!999275 c!101384) b!999276))

(assert (= (and b!999275 (not c!101384)) b!999274))

(assert (= (and b!999276 res!668802) b!999273))

(assert (= (or b!999273 b!999274) bm!42299))

(assert (=> b!999275 m!925493))

(assert (=> b!999275 m!925493))

(assert (=> b!999275 m!925517))

(declare-fun m!925579 () Bool)

(assert (=> bm!42299 m!925579))

(assert (=> b!999276 m!925493))

(declare-fun m!925581 () Bool)

(assert (=> b!999276 m!925581))

(declare-fun m!925583 () Bool)

(assert (=> b!999276 m!925583))

(assert (=> b!999276 m!925493))

(declare-fun m!925585 () Bool)

(assert (=> b!999276 m!925585))

(assert (=> b!999068 d!119301))

(declare-fun b!999277 () Bool)

(declare-fun e!563452 () Bool)

(declare-fun e!563450 () Bool)

(assert (=> b!999277 (= e!563452 e!563450)))

(declare-fun res!668805 () Bool)

(declare-fun lt!441978 () SeekEntryResult!9339)

(assert (=> b!999277 (= res!668805 (and ((_ is Intermediate!9339) lt!441978) (not (undefined!10151 lt!441978)) (bvslt (x!87161 lt!441978) #b01111111111111111111111111111110) (bvsge (x!87161 lt!441978) #b00000000000000000000000000000000) (bvsge (x!87161 lt!441978) x!1245)))))

(assert (=> b!999277 (=> (not res!668805) (not e!563450))))

(declare-fun b!999278 () Bool)

(declare-fun e!563451 () SeekEntryResult!9339)

(assert (=> b!999278 (= e!563451 (Intermediate!9339 true index!1507 x!1245))))

(declare-fun b!999279 () Bool)

(declare-fun e!563453 () SeekEntryResult!9339)

(assert (=> b!999279 (= e!563453 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30407 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999280 () Bool)

(assert (=> b!999280 (and (bvsge (index!39729 lt!441978) #b00000000000000000000000000000000) (bvslt (index!39729 lt!441978) (size!30909 a!3219)))))

(declare-fun res!668804 () Bool)

(assert (=> b!999280 (= res!668804 (= (select (arr!30407 a!3219) (index!39729 lt!441978)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563449 () Bool)

(assert (=> b!999280 (=> res!668804 e!563449)))

(declare-fun b!999281 () Bool)

(assert (=> b!999281 (and (bvsge (index!39729 lt!441978) #b00000000000000000000000000000000) (bvslt (index!39729 lt!441978) (size!30909 a!3219)))))

(declare-fun res!668803 () Bool)

(assert (=> b!999281 (= res!668803 (= (select (arr!30407 a!3219) (index!39729 lt!441978)) (select (arr!30407 a!3219) j!170)))))

(assert (=> b!999281 (=> res!668803 e!563449)))

(assert (=> b!999281 (= e!563450 e!563449)))

(declare-fun b!999282 () Bool)

(assert (=> b!999282 (and (bvsge (index!39729 lt!441978) #b00000000000000000000000000000000) (bvslt (index!39729 lt!441978) (size!30909 a!3219)))))

(assert (=> b!999282 (= e!563449 (= (select (arr!30407 a!3219) (index!39729 lt!441978)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999283 () Bool)

(assert (=> b!999283 (= e!563451 e!563453)))

(declare-fun lt!441979 () (_ BitVec 64))

(declare-fun c!101385 () Bool)

(assert (=> b!999283 (= c!101385 (or (= lt!441979 (select (arr!30407 a!3219) j!170)) (= (bvadd lt!441979 lt!441979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!119309 () Bool)

(assert (=> d!119309 e!563452))

(declare-fun c!101387 () Bool)

(assert (=> d!119309 (= c!101387 (and ((_ is Intermediate!9339) lt!441978) (undefined!10151 lt!441978)))))

(assert (=> d!119309 (= lt!441978 e!563451)))

(declare-fun c!101386 () Bool)

(assert (=> d!119309 (= c!101386 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119309 (= lt!441979 (select (arr!30407 a!3219) index!1507))))

(assert (=> d!119309 (validMask!0 mask!3464)))

(assert (=> d!119309 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30407 a!3219) j!170) a!3219 mask!3464) lt!441978)))

(declare-fun b!999284 () Bool)

(assert (=> b!999284 (= e!563453 (Intermediate!9339 false index!1507 x!1245))))

(declare-fun b!999285 () Bool)

(assert (=> b!999285 (= e!563452 (bvsge (x!87161 lt!441978) #b01111111111111111111111111111110))))

(assert (= (and d!119309 c!101386) b!999278))

(assert (= (and d!119309 (not c!101386)) b!999283))

(assert (= (and b!999283 c!101385) b!999284))

(assert (= (and b!999283 (not c!101385)) b!999279))

(assert (= (and d!119309 c!101387) b!999285))

(assert (= (and d!119309 (not c!101387)) b!999277))

(assert (= (and b!999277 res!668805) b!999281))

(assert (= (and b!999281 (not res!668803)) b!999280))

(assert (= (and b!999280 (not res!668804)) b!999282))

(declare-fun m!925587 () Bool)

(assert (=> b!999279 m!925587))

(assert (=> b!999279 m!925587))

(assert (=> b!999279 m!925439))

(declare-fun m!925589 () Bool)

(assert (=> b!999279 m!925589))

(declare-fun m!925591 () Bool)

(assert (=> b!999282 m!925591))

(assert (=> b!999281 m!925591))

(assert (=> b!999280 m!925591))

(declare-fun m!925593 () Bool)

(assert (=> d!119309 m!925593))

(assert (=> d!119309 m!925451))

(assert (=> b!999063 d!119309))

(check-sat (not d!119309) (not b!999183) (not b!999111) (not b!999159) (not b!999249) (not bm!42299) (not b!999186) (not b!999185) (not b!999279) (not b!999276) (not d!119269) (not b!999275) (not bm!42293) (not d!119295))
(check-sat)
