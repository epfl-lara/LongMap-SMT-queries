; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93414 () Bool)

(assert start!93414)

(declare-fun b!1058047 () Bool)

(declare-fun e!601663 () Bool)

(declare-fun lt!466706 () (_ BitVec 32))

(assert (=> b!1058047 (= e!601663 (bvsge (bvadd #b00000000000000000000000000000001 lt!466706) #b00000000000000000000000000000000))))

(declare-datatypes ((array!66700 0))(
  ( (array!66701 (arr!32068 (Array (_ BitVec 32) (_ BitVec 64))) (size!32605 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66700)

(declare-datatypes ((List!22350 0))(
  ( (Nil!22347) (Cons!22346 (h!23564 (_ BitVec 64)) (t!31649 List!22350)) )
))
(declare-fun arrayNoDuplicates!0 (array!66700 (_ BitVec 32) List!22350) Bool)

(assert (=> b!1058047 (arrayNoDuplicates!0 a!3488 lt!466706 Nil!22347)))

(declare-datatypes ((Unit!34627 0))(
  ( (Unit!34628) )
))
(declare-fun lt!466704 () Unit!34627)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66700 (_ BitVec 32) (_ BitVec 32)) Unit!34627)

(assert (=> b!1058047 (= lt!466704 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466706))))

(declare-fun res!705990 () Bool)

(declare-fun e!601666 () Bool)

(assert (=> start!93414 (=> (not res!705990) (not e!601666))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!93414 (= res!705990 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32605 a!3488)) (bvslt (size!32605 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93414 e!601666))

(assert (=> start!93414 true))

(declare-fun array_inv!24850 (array!66700) Bool)

(assert (=> start!93414 (array_inv!24850 a!3488)))

(declare-fun b!1058048 () Bool)

(declare-fun res!705987 () Bool)

(assert (=> b!1058048 (=> (not res!705987) (not e!601666))))

(assert (=> b!1058048 (= res!705987 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22347))))

(declare-fun e!601664 () Bool)

(declare-fun b!1058049 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058049 (= e!601664 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058050 () Bool)

(declare-fun res!705986 () Bool)

(assert (=> b!1058050 (=> (not res!705986) (not e!601666))))

(assert (=> b!1058050 (= res!705986 (= (select (arr!32068 a!3488) i!1381) k0!2747))))

(declare-fun b!1058051 () Bool)

(declare-fun e!601665 () Bool)

(declare-fun e!601667 () Bool)

(assert (=> b!1058051 (= e!601665 e!601667)))

(declare-fun res!705984 () Bool)

(assert (=> b!1058051 (=> (not res!705984) (not e!601667))))

(assert (=> b!1058051 (= res!705984 (not (= lt!466706 i!1381)))))

(declare-fun lt!466705 () array!66700)

(declare-fun arrayScanForKey!0 (array!66700 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058051 (= lt!466706 (arrayScanForKey!0 lt!466705 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058052 () Bool)

(declare-fun e!601669 () Bool)

(assert (=> b!1058052 (= e!601669 e!601664)))

(declare-fun res!705989 () Bool)

(assert (=> b!1058052 (=> res!705989 e!601664)))

(assert (=> b!1058052 (= res!705989 (or (bvsgt lt!466706 i!1381) (bvsle i!1381 lt!466706)))))

(declare-fun b!1058053 () Bool)

(assert (=> b!1058053 (= e!601666 e!601665)))

(declare-fun res!705992 () Bool)

(assert (=> b!1058053 (=> (not res!705992) (not e!601665))))

(assert (=> b!1058053 (= res!705992 (arrayContainsKey!0 lt!466705 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058053 (= lt!466705 (array!66701 (store (arr!32068 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32605 a!3488)))))

(declare-fun b!1058054 () Bool)

(declare-fun res!705988 () Bool)

(assert (=> b!1058054 (=> (not res!705988) (not e!601666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058054 (= res!705988 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058055 () Bool)

(assert (=> b!1058055 (= e!601667 (not e!601663))))

(declare-fun res!705991 () Bool)

(assert (=> b!1058055 (=> res!705991 e!601663)))

(assert (=> b!1058055 (= res!705991 (or (bvsgt lt!466706 i!1381) (bvsle i!1381 lt!466706)))))

(assert (=> b!1058055 e!601669))

(declare-fun res!705985 () Bool)

(assert (=> b!1058055 (=> (not res!705985) (not e!601669))))

(assert (=> b!1058055 (= res!705985 (= (select (store (arr!32068 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466706) k0!2747))))

(assert (= (and start!93414 res!705990) b!1058048))

(assert (= (and b!1058048 res!705987) b!1058054))

(assert (= (and b!1058054 res!705988) b!1058050))

(assert (= (and b!1058050 res!705986) b!1058053))

(assert (= (and b!1058053 res!705992) b!1058051))

(assert (= (and b!1058051 res!705984) b!1058055))

(assert (= (and b!1058055 res!705985) b!1058052))

(assert (= (and b!1058052 (not res!705989)) b!1058049))

(assert (= (and b!1058055 (not res!705991)) b!1058047))

(declare-fun m!978185 () Bool)

(assert (=> b!1058054 m!978185))

(declare-fun m!978187 () Bool)

(assert (=> start!93414 m!978187))

(declare-fun m!978189 () Bool)

(assert (=> b!1058047 m!978189))

(declare-fun m!978191 () Bool)

(assert (=> b!1058047 m!978191))

(declare-fun m!978193 () Bool)

(assert (=> b!1058051 m!978193))

(declare-fun m!978195 () Bool)

(assert (=> b!1058049 m!978195))

(declare-fun m!978197 () Bool)

(assert (=> b!1058053 m!978197))

(declare-fun m!978199 () Bool)

(assert (=> b!1058053 m!978199))

(declare-fun m!978201 () Bool)

(assert (=> b!1058048 m!978201))

(assert (=> b!1058055 m!978199))

(declare-fun m!978203 () Bool)

(assert (=> b!1058055 m!978203))

(declare-fun m!978205 () Bool)

(assert (=> b!1058050 m!978205))

(check-sat (not b!1058051) (not b!1058047) (not start!93414) (not b!1058054) (not b!1058053) (not b!1058049) (not b!1058048))
(check-sat)
(get-model)

(declare-fun b!1058120 () Bool)

(declare-fun e!601723 () Bool)

(declare-fun e!601721 () Bool)

(assert (=> b!1058120 (= e!601723 e!601721)))

(declare-fun res!706053 () Bool)

(assert (=> b!1058120 (=> (not res!706053) (not e!601721))))

(declare-fun e!601722 () Bool)

(assert (=> b!1058120 (= res!706053 (not e!601722))))

(declare-fun res!706055 () Bool)

(assert (=> b!1058120 (=> (not res!706055) (not e!601722))))

(assert (=> b!1058120 (= res!706055 (validKeyInArray!0 (select (arr!32068 a!3488) lt!466706)))))

(declare-fun b!1058121 () Bool)

(declare-fun e!601720 () Bool)

(declare-fun call!44894 () Bool)

(assert (=> b!1058121 (= e!601720 call!44894)))

(declare-fun d!128789 () Bool)

(declare-fun res!706054 () Bool)

(assert (=> d!128789 (=> res!706054 e!601723)))

(assert (=> d!128789 (= res!706054 (bvsge lt!466706 (size!32605 a!3488)))))

(assert (=> d!128789 (= (arrayNoDuplicates!0 a!3488 lt!466706 Nil!22347) e!601723)))

(declare-fun b!1058122 () Bool)

(assert (=> b!1058122 (= e!601721 e!601720)))

(declare-fun c!107501 () Bool)

(assert (=> b!1058122 (= c!107501 (validKeyInArray!0 (select (arr!32068 a!3488) lt!466706)))))

(declare-fun b!1058123 () Bool)

(assert (=> b!1058123 (= e!601720 call!44894)))

(declare-fun bm!44891 () Bool)

(assert (=> bm!44891 (= call!44894 (arrayNoDuplicates!0 a!3488 (bvadd lt!466706 #b00000000000000000000000000000001) (ite c!107501 (Cons!22346 (select (arr!32068 a!3488) lt!466706) Nil!22347) Nil!22347)))))

(declare-fun b!1058124 () Bool)

(declare-fun contains!6219 (List!22350 (_ BitVec 64)) Bool)

(assert (=> b!1058124 (= e!601722 (contains!6219 Nil!22347 (select (arr!32068 a!3488) lt!466706)))))

(assert (= (and d!128789 (not res!706054)) b!1058120))

(assert (= (and b!1058120 res!706055) b!1058124))

(assert (= (and b!1058120 res!706053) b!1058122))

(assert (= (and b!1058122 c!107501) b!1058123))

(assert (= (and b!1058122 (not c!107501)) b!1058121))

(assert (= (or b!1058123 b!1058121) bm!44891))

(declare-fun m!978251 () Bool)

(assert (=> b!1058120 m!978251))

(assert (=> b!1058120 m!978251))

(declare-fun m!978253 () Bool)

(assert (=> b!1058120 m!978253))

(assert (=> b!1058122 m!978251))

(assert (=> b!1058122 m!978251))

(assert (=> b!1058122 m!978253))

(assert (=> bm!44891 m!978251))

(declare-fun m!978255 () Bool)

(assert (=> bm!44891 m!978255))

(assert (=> b!1058124 m!978251))

(assert (=> b!1058124 m!978251))

(declare-fun m!978257 () Bool)

(assert (=> b!1058124 m!978257))

(assert (=> b!1058047 d!128789))

(declare-fun d!128791 () Bool)

(assert (=> d!128791 (arrayNoDuplicates!0 a!3488 lt!466706 Nil!22347)))

(declare-fun lt!466727 () Unit!34627)

(declare-fun choose!39 (array!66700 (_ BitVec 32) (_ BitVec 32)) Unit!34627)

(assert (=> d!128791 (= lt!466727 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466706))))

(assert (=> d!128791 (bvslt (size!32605 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128791 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466706) lt!466727)))

(declare-fun bs!31002 () Bool)

(assert (= bs!31002 d!128791))

(assert (=> bs!31002 m!978189))

(declare-fun m!978259 () Bool)

(assert (=> bs!31002 m!978259))

(assert (=> b!1058047 d!128791))

(declare-fun b!1058125 () Bool)

(declare-fun e!601727 () Bool)

(declare-fun e!601725 () Bool)

(assert (=> b!1058125 (= e!601727 e!601725)))

(declare-fun res!706056 () Bool)

(assert (=> b!1058125 (=> (not res!706056) (not e!601725))))

(declare-fun e!601726 () Bool)

(assert (=> b!1058125 (= res!706056 (not e!601726))))

(declare-fun res!706058 () Bool)

(assert (=> b!1058125 (=> (not res!706058) (not e!601726))))

(assert (=> b!1058125 (= res!706058 (validKeyInArray!0 (select (arr!32068 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1058126 () Bool)

(declare-fun e!601724 () Bool)

(declare-fun call!44895 () Bool)

(assert (=> b!1058126 (= e!601724 call!44895)))

(declare-fun d!128793 () Bool)

(declare-fun res!706057 () Bool)

(assert (=> d!128793 (=> res!706057 e!601727)))

(assert (=> d!128793 (= res!706057 (bvsge #b00000000000000000000000000000000 (size!32605 a!3488)))))

(assert (=> d!128793 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22347) e!601727)))

(declare-fun b!1058127 () Bool)

(assert (=> b!1058127 (= e!601725 e!601724)))

(declare-fun c!107502 () Bool)

(assert (=> b!1058127 (= c!107502 (validKeyInArray!0 (select (arr!32068 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1058128 () Bool)

(assert (=> b!1058128 (= e!601724 call!44895)))

(declare-fun bm!44892 () Bool)

(assert (=> bm!44892 (= call!44895 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107502 (Cons!22346 (select (arr!32068 a!3488) #b00000000000000000000000000000000) Nil!22347) Nil!22347)))))

(declare-fun b!1058129 () Bool)

(assert (=> b!1058129 (= e!601726 (contains!6219 Nil!22347 (select (arr!32068 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128793 (not res!706057)) b!1058125))

(assert (= (and b!1058125 res!706058) b!1058129))

(assert (= (and b!1058125 res!706056) b!1058127))

(assert (= (and b!1058127 c!107502) b!1058128))

(assert (= (and b!1058127 (not c!107502)) b!1058126))

(assert (= (or b!1058128 b!1058126) bm!44892))

(declare-fun m!978261 () Bool)

(assert (=> b!1058125 m!978261))

(assert (=> b!1058125 m!978261))

(declare-fun m!978263 () Bool)

(assert (=> b!1058125 m!978263))

(assert (=> b!1058127 m!978261))

(assert (=> b!1058127 m!978261))

(assert (=> b!1058127 m!978263))

(assert (=> bm!44892 m!978261))

(declare-fun m!978265 () Bool)

(assert (=> bm!44892 m!978265))

(assert (=> b!1058129 m!978261))

(assert (=> b!1058129 m!978261))

(declare-fun m!978267 () Bool)

(assert (=> b!1058129 m!978267))

(assert (=> b!1058048 d!128793))

(declare-fun d!128797 () Bool)

(declare-fun res!706063 () Bool)

(declare-fun e!601732 () Bool)

(assert (=> d!128797 (=> res!706063 e!601732)))

(assert (=> d!128797 (= res!706063 (= (select (arr!32068 lt!466705) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128797 (= (arrayContainsKey!0 lt!466705 k0!2747 #b00000000000000000000000000000000) e!601732)))

(declare-fun b!1058134 () Bool)

(declare-fun e!601733 () Bool)

(assert (=> b!1058134 (= e!601732 e!601733)))

(declare-fun res!706064 () Bool)

(assert (=> b!1058134 (=> (not res!706064) (not e!601733))))

(assert (=> b!1058134 (= res!706064 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32605 lt!466705)))))

(declare-fun b!1058135 () Bool)

(assert (=> b!1058135 (= e!601733 (arrayContainsKey!0 lt!466705 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128797 (not res!706063)) b!1058134))

(assert (= (and b!1058134 res!706064) b!1058135))

(declare-fun m!978269 () Bool)

(assert (=> d!128797 m!978269))

(declare-fun m!978271 () Bool)

(assert (=> b!1058135 m!978271))

(assert (=> b!1058053 d!128797))

(declare-fun d!128799 () Bool)

(declare-fun res!706065 () Bool)

(declare-fun e!601734 () Bool)

(assert (=> d!128799 (=> res!706065 e!601734)))

(assert (=> d!128799 (= res!706065 (= (select (arr!32068 a!3488) i!1381) k0!2747))))

(assert (=> d!128799 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601734)))

(declare-fun b!1058136 () Bool)

(declare-fun e!601735 () Bool)

(assert (=> b!1058136 (= e!601734 e!601735)))

(declare-fun res!706066 () Bool)

(assert (=> b!1058136 (=> (not res!706066) (not e!601735))))

(assert (=> b!1058136 (= res!706066 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32605 a!3488)))))

(declare-fun b!1058137 () Bool)

(assert (=> b!1058137 (= e!601735 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128799 (not res!706065)) b!1058136))

(assert (= (and b!1058136 res!706066) b!1058137))

(assert (=> d!128799 m!978205))

(declare-fun m!978273 () Bool)

(assert (=> b!1058137 m!978273))

(assert (=> b!1058049 d!128799))

(declare-fun d!128801 () Bool)

(assert (=> d!128801 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1058054 d!128801))

(declare-fun d!128803 () Bool)

(assert (=> d!128803 (= (array_inv!24850 a!3488) (bvsge (size!32605 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93414 d!128803))

(declare-fun d!128805 () Bool)

(declare-fun lt!466730 () (_ BitVec 32))

(assert (=> d!128805 (and (or (bvslt lt!466730 #b00000000000000000000000000000000) (bvsge lt!466730 (size!32605 lt!466705)) (and (bvsge lt!466730 #b00000000000000000000000000000000) (bvslt lt!466730 (size!32605 lt!466705)))) (bvsge lt!466730 #b00000000000000000000000000000000) (bvslt lt!466730 (size!32605 lt!466705)) (= (select (arr!32068 lt!466705) lt!466730) k0!2747))))

(declare-fun e!601754 () (_ BitVec 32))

(assert (=> d!128805 (= lt!466730 e!601754)))

(declare-fun c!107508 () Bool)

(assert (=> d!128805 (= c!107508 (= (select (arr!32068 lt!466705) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32605 lt!466705)) (bvslt (size!32605 lt!466705) #b01111111111111111111111111111111))))

(assert (=> d!128805 (= (arrayScanForKey!0 lt!466705 k0!2747 #b00000000000000000000000000000000) lt!466730)))

(declare-fun b!1058161 () Bool)

(assert (=> b!1058161 (= e!601754 #b00000000000000000000000000000000)))

(declare-fun b!1058162 () Bool)

(assert (=> b!1058162 (= e!601754 (arrayScanForKey!0 lt!466705 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128805 c!107508) b!1058161))

(assert (= (and d!128805 (not c!107508)) b!1058162))

(declare-fun m!978283 () Bool)

(assert (=> d!128805 m!978283))

(assert (=> d!128805 m!978269))

(declare-fun m!978285 () Bool)

(assert (=> b!1058162 m!978285))

(assert (=> b!1058051 d!128805))

(check-sat (not bm!44892) (not b!1058135) (not d!128791) (not b!1058162) (not b!1058137) (not b!1058120) (not b!1058125) (not b!1058129) (not b!1058122) (not bm!44891) (not b!1058124) (not b!1058127))
(check-sat)
