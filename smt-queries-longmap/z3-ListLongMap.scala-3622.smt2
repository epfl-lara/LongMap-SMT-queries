; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49916 () Bool)

(assert start!49916)

(declare-fun b!547461 () Bool)

(declare-fun res!341105 () Bool)

(declare-fun e!316320 () Bool)

(assert (=> b!547461 (=> (not res!341105) (not e!316320))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34546 0))(
  ( (array!34547 (arr!16595 (Array (_ BitVec 32) (_ BitVec 64))) (size!16960 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34546)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547461 (= res!341105 (and (= (size!16960 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16960 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16960 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547462 () Bool)

(declare-fun res!341101 () Bool)

(declare-fun e!316319 () Bool)

(assert (=> b!547462 (=> (not res!341101) (not e!316319))))

(declare-datatypes ((List!10714 0))(
  ( (Nil!10711) (Cons!10710 (h!11677 (_ BitVec 64)) (t!16933 List!10714)) )
))
(declare-fun arrayNoDuplicates!0 (array!34546 (_ BitVec 32) List!10714) Bool)

(assert (=> b!547462 (= res!341101 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10711))))

(declare-fun b!547463 () Bool)

(assert (=> b!547463 (= e!316319 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun b!547464 () Bool)

(declare-fun res!341107 () Bool)

(assert (=> b!547464 (=> (not res!341107) (not e!316320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547464 (= res!341107 (validKeyInArray!0 (select (arr!16595 a!3118) j!142)))))

(declare-fun b!547465 () Bool)

(declare-fun res!341106 () Bool)

(assert (=> b!547465 (=> (not res!341106) (not e!316320))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!547465 (= res!341106 (validKeyInArray!0 k0!1914))))

(declare-fun b!547466 () Bool)

(assert (=> b!547466 (= e!316320 e!316319)))

(declare-fun res!341108 () Bool)

(assert (=> b!547466 (=> (not res!341108) (not e!316319))))

(declare-datatypes ((SeekEntryResult!5041 0))(
  ( (MissingZero!5041 (index!22391 (_ BitVec 32))) (Found!5041 (index!22392 (_ BitVec 32))) (Intermediate!5041 (undefined!5853 Bool) (index!22393 (_ BitVec 32)) (x!51344 (_ BitVec 32))) (Undefined!5041) (MissingVacant!5041 (index!22394 (_ BitVec 32))) )
))
(declare-fun lt!249388 () SeekEntryResult!5041)

(assert (=> b!547466 (= res!341108 (or (= lt!249388 (MissingZero!5041 i!1132)) (= lt!249388 (MissingVacant!5041 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34546 (_ BitVec 32)) SeekEntryResult!5041)

(assert (=> b!547466 (= lt!249388 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!341103 () Bool)

(assert (=> start!49916 (=> (not res!341103) (not e!316320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49916 (= res!341103 (validMask!0 mask!3119))))

(assert (=> start!49916 e!316320))

(assert (=> start!49916 true))

(declare-fun array_inv!12478 (array!34546) Bool)

(assert (=> start!49916 (array_inv!12478 a!3118)))

(declare-fun b!547467 () Bool)

(declare-fun res!341104 () Bool)

(assert (=> b!547467 (=> (not res!341104) (not e!316319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34546 (_ BitVec 32)) Bool)

(assert (=> b!547467 (= res!341104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547468 () Bool)

(declare-fun res!341102 () Bool)

(assert (=> b!547468 (=> (not res!341102) (not e!316320))))

(declare-fun arrayContainsKey!0 (array!34546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547468 (= res!341102 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49916 res!341103) b!547461))

(assert (= (and b!547461 res!341105) b!547464))

(assert (= (and b!547464 res!341107) b!547465))

(assert (= (and b!547465 res!341106) b!547468))

(assert (= (and b!547468 res!341102) b!547466))

(assert (= (and b!547466 res!341108) b!547467))

(assert (= (and b!547467 res!341104) b!547462))

(assert (= (and b!547462 res!341101) b!547463))

(declare-fun m!524165 () Bool)

(assert (=> b!547467 m!524165))

(declare-fun m!524167 () Bool)

(assert (=> b!547465 m!524167))

(declare-fun m!524169 () Bool)

(assert (=> b!547466 m!524169))

(declare-fun m!524171 () Bool)

(assert (=> b!547464 m!524171))

(assert (=> b!547464 m!524171))

(declare-fun m!524173 () Bool)

(assert (=> b!547464 m!524173))

(declare-fun m!524175 () Bool)

(assert (=> b!547468 m!524175))

(declare-fun m!524177 () Bool)

(assert (=> b!547462 m!524177))

(declare-fun m!524179 () Bool)

(assert (=> start!49916 m!524179))

(declare-fun m!524181 () Bool)

(assert (=> start!49916 m!524181))

(check-sat (not b!547468) (not b!547462) (not b!547467) (not start!49916) (not b!547465) (not b!547464) (not b!547466))
(check-sat)
(get-model)

(declare-fun d!82347 () Bool)

(assert (=> d!82347 (= (validKeyInArray!0 (select (arr!16595 a!3118) j!142)) (and (not (= (select (arr!16595 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16595 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547464 d!82347))

(declare-fun bm!32149 () Bool)

(declare-fun call!32152 () Bool)

(declare-fun c!63510 () Bool)

(assert (=> bm!32149 (= call!32152 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63510 (Cons!10710 (select (arr!16595 a!3118) #b00000000000000000000000000000000) Nil!10711) Nil!10711)))))

(declare-fun b!547527 () Bool)

(declare-fun e!316347 () Bool)

(declare-fun e!316350 () Bool)

(assert (=> b!547527 (= e!316347 e!316350)))

(declare-fun res!341163 () Bool)

(assert (=> b!547527 (=> (not res!341163) (not e!316350))))

(declare-fun e!316349 () Bool)

(assert (=> b!547527 (= res!341163 (not e!316349))))

(declare-fun res!341165 () Bool)

(assert (=> b!547527 (=> (not res!341165) (not e!316349))))

(assert (=> b!547527 (= res!341165 (validKeyInArray!0 (select (arr!16595 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547529 () Bool)

(declare-fun e!316348 () Bool)

(assert (=> b!547529 (= e!316348 call!32152)))

(declare-fun b!547530 () Bool)

(declare-fun contains!2802 (List!10714 (_ BitVec 64)) Bool)

(assert (=> b!547530 (= e!316349 (contains!2802 Nil!10711 (select (arr!16595 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547531 () Bool)

(assert (=> b!547531 (= e!316350 e!316348)))

(assert (=> b!547531 (= c!63510 (validKeyInArray!0 (select (arr!16595 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82349 () Bool)

(declare-fun res!341164 () Bool)

(assert (=> d!82349 (=> res!341164 e!316347)))

(assert (=> d!82349 (= res!341164 (bvsge #b00000000000000000000000000000000 (size!16960 a!3118)))))

(assert (=> d!82349 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10711) e!316347)))

(declare-fun b!547528 () Bool)

(assert (=> b!547528 (= e!316348 call!32152)))

(assert (= (and d!82349 (not res!341164)) b!547527))

(assert (= (and b!547527 res!341165) b!547530))

(assert (= (and b!547527 res!341163) b!547531))

(assert (= (and b!547531 c!63510) b!547528))

(assert (= (and b!547531 (not c!63510)) b!547529))

(assert (= (or b!547528 b!547529) bm!32149))

(declare-fun m!524219 () Bool)

(assert (=> bm!32149 m!524219))

(declare-fun m!524221 () Bool)

(assert (=> bm!32149 m!524221))

(assert (=> b!547527 m!524219))

(assert (=> b!547527 m!524219))

(declare-fun m!524223 () Bool)

(assert (=> b!547527 m!524223))

(assert (=> b!547530 m!524219))

(assert (=> b!547530 m!524219))

(declare-fun m!524225 () Bool)

(assert (=> b!547530 m!524225))

(assert (=> b!547531 m!524219))

(assert (=> b!547531 m!524219))

(assert (=> b!547531 m!524223))

(assert (=> b!547462 d!82349))

(declare-fun d!82355 () Bool)

(declare-fun res!341200 () Bool)

(declare-fun e!316393 () Bool)

(assert (=> d!82355 (=> res!341200 e!316393)))

(assert (=> d!82355 (= res!341200 (bvsge #b00000000000000000000000000000000 (size!16960 a!3118)))))

(assert (=> d!82355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316393)))

(declare-fun b!547582 () Bool)

(declare-fun e!316394 () Bool)

(declare-fun call!32161 () Bool)

(assert (=> b!547582 (= e!316394 call!32161)))

(declare-fun b!547583 () Bool)

(declare-fun e!316395 () Bool)

(assert (=> b!547583 (= e!316393 e!316395)))

(declare-fun c!63519 () Bool)

(assert (=> b!547583 (= c!63519 (validKeyInArray!0 (select (arr!16595 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32158 () Bool)

(assert (=> bm!32158 (= call!32161 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547584 () Bool)

(assert (=> b!547584 (= e!316395 e!316394)))

(declare-fun lt!249401 () (_ BitVec 64))

(assert (=> b!547584 (= lt!249401 (select (arr!16595 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16942 0))(
  ( (Unit!16943) )
))
(declare-fun lt!249402 () Unit!16942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34546 (_ BitVec 64) (_ BitVec 32)) Unit!16942)

(assert (=> b!547584 (= lt!249402 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249401 #b00000000000000000000000000000000))))

(assert (=> b!547584 (arrayContainsKey!0 a!3118 lt!249401 #b00000000000000000000000000000000)))

(declare-fun lt!249403 () Unit!16942)

(assert (=> b!547584 (= lt!249403 lt!249402)))

(declare-fun res!341201 () Bool)

(assert (=> b!547584 (= res!341201 (= (seekEntryOrOpen!0 (select (arr!16595 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5041 #b00000000000000000000000000000000)))))

(assert (=> b!547584 (=> (not res!341201) (not e!316394))))

(declare-fun b!547585 () Bool)

(assert (=> b!547585 (= e!316395 call!32161)))

(assert (= (and d!82355 (not res!341200)) b!547583))

(assert (= (and b!547583 c!63519) b!547584))

(assert (= (and b!547583 (not c!63519)) b!547585))

(assert (= (and b!547584 res!341201) b!547582))

(assert (= (or b!547582 b!547585) bm!32158))

(assert (=> b!547583 m!524219))

(assert (=> b!547583 m!524219))

(assert (=> b!547583 m!524223))

(declare-fun m!524247 () Bool)

(assert (=> bm!32158 m!524247))

(assert (=> b!547584 m!524219))

(declare-fun m!524249 () Bool)

(assert (=> b!547584 m!524249))

(declare-fun m!524251 () Bool)

(assert (=> b!547584 m!524251))

(assert (=> b!547584 m!524219))

(declare-fun m!524253 () Bool)

(assert (=> b!547584 m!524253))

(assert (=> b!547467 d!82355))

(declare-fun d!82367 () Bool)

(declare-fun res!341206 () Bool)

(declare-fun e!316400 () Bool)

(assert (=> d!82367 (=> res!341206 e!316400)))

(assert (=> d!82367 (= res!341206 (= (select (arr!16595 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82367 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316400)))

(declare-fun b!547590 () Bool)

(declare-fun e!316401 () Bool)

(assert (=> b!547590 (= e!316400 e!316401)))

(declare-fun res!341207 () Bool)

(assert (=> b!547590 (=> (not res!341207) (not e!316401))))

(assert (=> b!547590 (= res!341207 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16960 a!3118)))))

(declare-fun b!547591 () Bool)

(assert (=> b!547591 (= e!316401 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82367 (not res!341206)) b!547590))

(assert (= (and b!547590 res!341207) b!547591))

(assert (=> d!82367 m!524219))

(declare-fun m!524255 () Bool)

(assert (=> b!547591 m!524255))

(assert (=> b!547468 d!82367))

(declare-fun b!547616 () Bool)

(declare-fun e!316418 () SeekEntryResult!5041)

(declare-fun lt!249419 () SeekEntryResult!5041)

(assert (=> b!547616 (= e!316418 (MissingZero!5041 (index!22393 lt!249419)))))

(declare-fun b!547617 () Bool)

(declare-fun e!316417 () SeekEntryResult!5041)

(declare-fun e!316419 () SeekEntryResult!5041)

(assert (=> b!547617 (= e!316417 e!316419)))

(declare-fun lt!249420 () (_ BitVec 64))

(assert (=> b!547617 (= lt!249420 (select (arr!16595 a!3118) (index!22393 lt!249419)))))

(declare-fun c!63530 () Bool)

(assert (=> b!547617 (= c!63530 (= lt!249420 k0!1914))))

(declare-fun b!547618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34546 (_ BitVec 32)) SeekEntryResult!5041)

(assert (=> b!547618 (= e!316418 (seekKeyOrZeroReturnVacant!0 (x!51344 lt!249419) (index!22393 lt!249419) (index!22393 lt!249419) k0!1914 a!3118 mask!3119))))

(declare-fun b!547619 () Bool)

(declare-fun c!63529 () Bool)

(assert (=> b!547619 (= c!63529 (= lt!249420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547619 (= e!316419 e!316418)))

(declare-fun d!82369 () Bool)

(declare-fun lt!249421 () SeekEntryResult!5041)

(get-info :version)

(assert (=> d!82369 (and (or ((_ is Undefined!5041) lt!249421) (not ((_ is Found!5041) lt!249421)) (and (bvsge (index!22392 lt!249421) #b00000000000000000000000000000000) (bvslt (index!22392 lt!249421) (size!16960 a!3118)))) (or ((_ is Undefined!5041) lt!249421) ((_ is Found!5041) lt!249421) (not ((_ is MissingZero!5041) lt!249421)) (and (bvsge (index!22391 lt!249421) #b00000000000000000000000000000000) (bvslt (index!22391 lt!249421) (size!16960 a!3118)))) (or ((_ is Undefined!5041) lt!249421) ((_ is Found!5041) lt!249421) ((_ is MissingZero!5041) lt!249421) (not ((_ is MissingVacant!5041) lt!249421)) (and (bvsge (index!22394 lt!249421) #b00000000000000000000000000000000) (bvslt (index!22394 lt!249421) (size!16960 a!3118)))) (or ((_ is Undefined!5041) lt!249421) (ite ((_ is Found!5041) lt!249421) (= (select (arr!16595 a!3118) (index!22392 lt!249421)) k0!1914) (ite ((_ is MissingZero!5041) lt!249421) (= (select (arr!16595 a!3118) (index!22391 lt!249421)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5041) lt!249421) (= (select (arr!16595 a!3118) (index!22394 lt!249421)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82369 (= lt!249421 e!316417)))

(declare-fun c!63531 () Bool)

(assert (=> d!82369 (= c!63531 (and ((_ is Intermediate!5041) lt!249419) (undefined!5853 lt!249419)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34546 (_ BitVec 32)) SeekEntryResult!5041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82369 (= lt!249419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82369 (validMask!0 mask!3119)))

(assert (=> d!82369 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249421)))

(declare-fun b!547620 () Bool)

(assert (=> b!547620 (= e!316419 (Found!5041 (index!22393 lt!249419)))))

(declare-fun b!547621 () Bool)

(assert (=> b!547621 (= e!316417 Undefined!5041)))

(assert (= (and d!82369 c!63531) b!547621))

(assert (= (and d!82369 (not c!63531)) b!547617))

(assert (= (and b!547617 c!63530) b!547620))

(assert (= (and b!547617 (not c!63530)) b!547619))

(assert (= (and b!547619 c!63529) b!547616))

(assert (= (and b!547619 (not c!63529)) b!547618))

(declare-fun m!524265 () Bool)

(assert (=> b!547617 m!524265))

(declare-fun m!524267 () Bool)

(assert (=> b!547618 m!524267))

(declare-fun m!524269 () Bool)

(assert (=> d!82369 m!524269))

(assert (=> d!82369 m!524179))

(declare-fun m!524271 () Bool)

(assert (=> d!82369 m!524271))

(declare-fun m!524273 () Bool)

(assert (=> d!82369 m!524273))

(declare-fun m!524275 () Bool)

(assert (=> d!82369 m!524275))

(assert (=> d!82369 m!524271))

(declare-fun m!524277 () Bool)

(assert (=> d!82369 m!524277))

(assert (=> b!547466 d!82369))

(declare-fun d!82385 () Bool)

(assert (=> d!82385 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49916 d!82385))

(declare-fun d!82389 () Bool)

(assert (=> d!82389 (= (array_inv!12478 a!3118) (bvsge (size!16960 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49916 d!82389))

(declare-fun d!82391 () Bool)

(assert (=> d!82391 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547465 d!82391))

(check-sat (not b!547618) (not b!547584) (not bm!32149) (not b!547583) (not b!547530) (not d!82369) (not b!547591) (not b!547531) (not b!547527) (not bm!32158))
(check-sat)
