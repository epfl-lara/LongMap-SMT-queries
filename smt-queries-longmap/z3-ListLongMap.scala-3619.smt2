; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49822 () Bool)

(assert start!49822)

(declare-fun b!547246 () Bool)

(declare-fun res!340891 () Bool)

(declare-fun e!316207 () Bool)

(assert (=> b!547246 (=> (not res!340891) (not e!316207))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34527 0))(
  ( (array!34528 (arr!16588 (Array (_ BitVec 32) (_ BitVec 64))) (size!16952 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34527)

(assert (=> b!547246 (= res!340891 (and (= (size!16952 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16952 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16952 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547247 () Bool)

(declare-fun res!340892 () Bool)

(declare-fun e!316209 () Bool)

(assert (=> b!547247 (=> (not res!340892) (not e!316209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34527 (_ BitVec 32)) Bool)

(assert (=> b!547247 (= res!340892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547248 () Bool)

(declare-fun res!340893 () Bool)

(assert (=> b!547248 (=> (not res!340893) (not e!316209))))

(assert (=> b!547248 (= res!340893 (and (bvsle #b00000000000000000000000000000000 (size!16952 a!3118)) (bvslt (size!16952 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547249 () Bool)

(declare-fun res!340894 () Bool)

(assert (=> b!547249 (=> (not res!340894) (not e!316207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547249 (= res!340894 (validKeyInArray!0 (select (arr!16588 a!3118) j!142)))))

(declare-fun b!547250 () Bool)

(assert (=> b!547250 (= e!316207 e!316209)))

(declare-fun res!340889 () Bool)

(assert (=> b!547250 (=> (not res!340889) (not e!316209))))

(declare-datatypes ((SeekEntryResult!5037 0))(
  ( (MissingZero!5037 (index!22375 (_ BitVec 32))) (Found!5037 (index!22376 (_ BitVec 32))) (Intermediate!5037 (undefined!5849 Bool) (index!22377 (_ BitVec 32)) (x!51321 (_ BitVec 32))) (Undefined!5037) (MissingVacant!5037 (index!22378 (_ BitVec 32))) )
))
(declare-fun lt!249478 () SeekEntryResult!5037)

(assert (=> b!547250 (= res!340889 (or (= lt!249478 (MissingZero!5037 i!1132)) (= lt!249478 (MissingVacant!5037 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34527 (_ BitVec 32)) SeekEntryResult!5037)

(assert (=> b!547250 (= lt!249478 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!340890 () Bool)

(assert (=> start!49822 (=> (not res!340890) (not e!316207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49822 (= res!340890 (validMask!0 mask!3119))))

(assert (=> start!49822 e!316207))

(assert (=> start!49822 true))

(declare-fun array_inv!12384 (array!34527) Bool)

(assert (=> start!49822 (array_inv!12384 a!3118)))

(declare-fun b!547251 () Bool)

(declare-datatypes ((List!10668 0))(
  ( (Nil!10665) (Cons!10664 (h!11631 (_ BitVec 64)) (t!16896 List!10668)) )
))
(declare-fun noDuplicate!220 (List!10668) Bool)

(assert (=> b!547251 (= e!316209 (not (noDuplicate!220 Nil!10665)))))

(declare-fun b!547252 () Bool)

(declare-fun res!340888 () Bool)

(assert (=> b!547252 (=> (not res!340888) (not e!316207))))

(declare-fun arrayContainsKey!0 (array!34527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547252 (= res!340888 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547253 () Bool)

(declare-fun res!340895 () Bool)

(assert (=> b!547253 (=> (not res!340895) (not e!316207))))

(assert (=> b!547253 (= res!340895 (validKeyInArray!0 k0!1914))))

(assert (= (and start!49822 res!340890) b!547246))

(assert (= (and b!547246 res!340891) b!547249))

(assert (= (and b!547249 res!340894) b!547253))

(assert (= (and b!547253 res!340895) b!547252))

(assert (= (and b!547252 res!340888) b!547250))

(assert (= (and b!547250 res!340889) b!547247))

(assert (= (and b!547247 res!340892) b!547248))

(assert (= (and b!547248 res!340893) b!547251))

(declare-fun m!524559 () Bool)

(assert (=> b!547252 m!524559))

(declare-fun m!524561 () Bool)

(assert (=> start!49822 m!524561))

(declare-fun m!524563 () Bool)

(assert (=> start!49822 m!524563))

(declare-fun m!524565 () Bool)

(assert (=> b!547253 m!524565))

(declare-fun m!524567 () Bool)

(assert (=> b!547251 m!524567))

(declare-fun m!524569 () Bool)

(assert (=> b!547250 m!524569))

(declare-fun m!524571 () Bool)

(assert (=> b!547249 m!524571))

(assert (=> b!547249 m!524571))

(declare-fun m!524573 () Bool)

(assert (=> b!547249 m!524573))

(declare-fun m!524575 () Bool)

(assert (=> b!547247 m!524575))

(check-sat (not b!547249) (not start!49822) (not b!547253) (not b!547247) (not b!547252) (not b!547250) (not b!547251))
(check-sat)
(get-model)

(declare-fun b!547290 () Bool)

(declare-fun c!63513 () Bool)

(declare-fun lt!249489 () (_ BitVec 64))

(assert (=> b!547290 (= c!63513 (= lt!249489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316225 () SeekEntryResult!5037)

(declare-fun e!316226 () SeekEntryResult!5037)

(assert (=> b!547290 (= e!316225 e!316226)))

(declare-fun b!547291 () Bool)

(declare-fun e!316227 () SeekEntryResult!5037)

(assert (=> b!547291 (= e!316227 Undefined!5037)))

(declare-fun b!547292 () Bool)

(declare-fun lt!249488 () SeekEntryResult!5037)

(assert (=> b!547292 (= e!316226 (MissingZero!5037 (index!22377 lt!249488)))))

(declare-fun b!547293 () Bool)

(assert (=> b!547293 (= e!316225 (Found!5037 (index!22377 lt!249488)))))

(declare-fun b!547294 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34527 (_ BitVec 32)) SeekEntryResult!5037)

(assert (=> b!547294 (= e!316226 (seekKeyOrZeroReturnVacant!0 (x!51321 lt!249488) (index!22377 lt!249488) (index!22377 lt!249488) k0!1914 a!3118 mask!3119))))

(declare-fun b!547295 () Bool)

(assert (=> b!547295 (= e!316227 e!316225)))

(assert (=> b!547295 (= lt!249489 (select (arr!16588 a!3118) (index!22377 lt!249488)))))

(declare-fun c!63515 () Bool)

(assert (=> b!547295 (= c!63515 (= lt!249489 k0!1914))))

(declare-fun d!82441 () Bool)

(declare-fun lt!249490 () SeekEntryResult!5037)

(get-info :version)

(assert (=> d!82441 (and (or ((_ is Undefined!5037) lt!249490) (not ((_ is Found!5037) lt!249490)) (and (bvsge (index!22376 lt!249490) #b00000000000000000000000000000000) (bvslt (index!22376 lt!249490) (size!16952 a!3118)))) (or ((_ is Undefined!5037) lt!249490) ((_ is Found!5037) lt!249490) (not ((_ is MissingZero!5037) lt!249490)) (and (bvsge (index!22375 lt!249490) #b00000000000000000000000000000000) (bvslt (index!22375 lt!249490) (size!16952 a!3118)))) (or ((_ is Undefined!5037) lt!249490) ((_ is Found!5037) lt!249490) ((_ is MissingZero!5037) lt!249490) (not ((_ is MissingVacant!5037) lt!249490)) (and (bvsge (index!22378 lt!249490) #b00000000000000000000000000000000) (bvslt (index!22378 lt!249490) (size!16952 a!3118)))) (or ((_ is Undefined!5037) lt!249490) (ite ((_ is Found!5037) lt!249490) (= (select (arr!16588 a!3118) (index!22376 lt!249490)) k0!1914) (ite ((_ is MissingZero!5037) lt!249490) (= (select (arr!16588 a!3118) (index!22375 lt!249490)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5037) lt!249490) (= (select (arr!16588 a!3118) (index!22378 lt!249490)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82441 (= lt!249490 e!316227)))

(declare-fun c!63514 () Bool)

(assert (=> d!82441 (= c!63514 (and ((_ is Intermediate!5037) lt!249488) (undefined!5849 lt!249488)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34527 (_ BitVec 32)) SeekEntryResult!5037)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82441 (= lt!249488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82441 (validMask!0 mask!3119)))

(assert (=> d!82441 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249490)))

(assert (= (and d!82441 c!63514) b!547291))

(assert (= (and d!82441 (not c!63514)) b!547295))

(assert (= (and b!547295 c!63515) b!547293))

(assert (= (and b!547295 (not c!63515)) b!547290))

(assert (= (and b!547290 c!63513) b!547292))

(assert (= (and b!547290 (not c!63513)) b!547294))

(declare-fun m!524595 () Bool)

(assert (=> b!547294 m!524595))

(declare-fun m!524597 () Bool)

(assert (=> b!547295 m!524597))

(declare-fun m!524599 () Bool)

(assert (=> d!82441 m!524599))

(declare-fun m!524601 () Bool)

(assert (=> d!82441 m!524601))

(declare-fun m!524603 () Bool)

(assert (=> d!82441 m!524603))

(assert (=> d!82441 m!524599))

(declare-fun m!524605 () Bool)

(assert (=> d!82441 m!524605))

(declare-fun m!524607 () Bool)

(assert (=> d!82441 m!524607))

(assert (=> d!82441 m!524561))

(assert (=> b!547250 d!82441))

(declare-fun d!82451 () Bool)

(assert (=> d!82451 (= (validKeyInArray!0 (select (arr!16588 a!3118) j!142)) (and (not (= (select (arr!16588 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16588 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547249 d!82451))

(declare-fun d!82453 () Bool)

(assert (=> d!82453 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547253 d!82453))

(declare-fun bm!32156 () Bool)

(declare-fun call!32159 () Bool)

(assert (=> bm!32156 (= call!32159 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547322 () Bool)

(declare-fun e!316244 () Bool)

(assert (=> b!547322 (= e!316244 call!32159)))

(declare-fun b!547323 () Bool)

(declare-fun e!316243 () Bool)

(assert (=> b!547323 (= e!316243 call!32159)))

(declare-fun b!547324 () Bool)

(assert (=> b!547324 (= e!316244 e!316243)))

(declare-fun lt!249507 () (_ BitVec 64))

(assert (=> b!547324 (= lt!249507 (select (arr!16588 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16952 0))(
  ( (Unit!16953) )
))
(declare-fun lt!249506 () Unit!16952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34527 (_ BitVec 64) (_ BitVec 32)) Unit!16952)

(assert (=> b!547324 (= lt!249506 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249507 #b00000000000000000000000000000000))))

(assert (=> b!547324 (arrayContainsKey!0 a!3118 lt!249507 #b00000000000000000000000000000000)))

(declare-fun lt!249508 () Unit!16952)

(assert (=> b!547324 (= lt!249508 lt!249506)))

(declare-fun res!340925 () Bool)

(assert (=> b!547324 (= res!340925 (= (seekEntryOrOpen!0 (select (arr!16588 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5037 #b00000000000000000000000000000000)))))

(assert (=> b!547324 (=> (not res!340925) (not e!316243))))

(declare-fun d!82455 () Bool)

(declare-fun res!340924 () Bool)

(declare-fun e!316245 () Bool)

(assert (=> d!82455 (=> res!340924 e!316245)))

(assert (=> d!82455 (= res!340924 (bvsge #b00000000000000000000000000000000 (size!16952 a!3118)))))

(assert (=> d!82455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316245)))

(declare-fun b!547325 () Bool)

(assert (=> b!547325 (= e!316245 e!316244)))

(declare-fun c!63527 () Bool)

(assert (=> b!547325 (= c!63527 (validKeyInArray!0 (select (arr!16588 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82455 (not res!340924)) b!547325))

(assert (= (and b!547325 c!63527) b!547324))

(assert (= (and b!547325 (not c!63527)) b!547322))

(assert (= (and b!547324 res!340925) b!547323))

(assert (= (or b!547323 b!547322) bm!32156))

(declare-fun m!524623 () Bool)

(assert (=> bm!32156 m!524623))

(declare-fun m!524625 () Bool)

(assert (=> b!547324 m!524625))

(declare-fun m!524627 () Bool)

(assert (=> b!547324 m!524627))

(declare-fun m!524629 () Bool)

(assert (=> b!547324 m!524629))

(assert (=> b!547324 m!524625))

(declare-fun m!524631 () Bool)

(assert (=> b!547324 m!524631))

(assert (=> b!547325 m!524625))

(assert (=> b!547325 m!524625))

(declare-fun m!524633 () Bool)

(assert (=> b!547325 m!524633))

(assert (=> b!547247 d!82455))

(declare-fun d!82459 () Bool)

(assert (=> d!82459 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49822 d!82459))

(declare-fun d!82469 () Bool)

(assert (=> d!82469 (= (array_inv!12384 a!3118) (bvsge (size!16952 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49822 d!82469))

(declare-fun d!82471 () Bool)

(declare-fun res!340948 () Bool)

(declare-fun e!316277 () Bool)

(assert (=> d!82471 (=> res!340948 e!316277)))

(assert (=> d!82471 (= res!340948 (= (select (arr!16588 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82471 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316277)))

(declare-fun b!547366 () Bool)

(declare-fun e!316278 () Bool)

(assert (=> b!547366 (= e!316277 e!316278)))

(declare-fun res!340949 () Bool)

(assert (=> b!547366 (=> (not res!340949) (not e!316278))))

(assert (=> b!547366 (= res!340949 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16952 a!3118)))))

(declare-fun b!547367 () Bool)

(assert (=> b!547367 (= e!316278 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82471 (not res!340948)) b!547366))

(assert (= (and b!547366 res!340949) b!547367))

(assert (=> d!82471 m!524625))

(declare-fun m!524661 () Bool)

(assert (=> b!547367 m!524661))

(assert (=> b!547252 d!82471))

(declare-fun d!82475 () Bool)

(declare-fun res!340954 () Bool)

(declare-fun e!316283 () Bool)

(assert (=> d!82475 (=> res!340954 e!316283)))

(assert (=> d!82475 (= res!340954 ((_ is Nil!10665) Nil!10665))))

(assert (=> d!82475 (= (noDuplicate!220 Nil!10665) e!316283)))

(declare-fun b!547372 () Bool)

(declare-fun e!316284 () Bool)

(assert (=> b!547372 (= e!316283 e!316284)))

(declare-fun res!340955 () Bool)

(assert (=> b!547372 (=> (not res!340955) (not e!316284))))

(declare-fun contains!2817 (List!10668 (_ BitVec 64)) Bool)

(assert (=> b!547372 (= res!340955 (not (contains!2817 (t!16896 Nil!10665) (h!11631 Nil!10665))))))

(declare-fun b!547373 () Bool)

(assert (=> b!547373 (= e!316284 (noDuplicate!220 (t!16896 Nil!10665)))))

(assert (= (and d!82475 (not res!340954)) b!547372))

(assert (= (and b!547372 res!340955) b!547373))

(declare-fun m!524663 () Bool)

(assert (=> b!547372 m!524663))

(declare-fun m!524665 () Bool)

(assert (=> b!547373 m!524665))

(assert (=> b!547251 d!82475))

(check-sat (not d!82441) (not b!547373) (not b!547325) (not b!547324) (not bm!32156) (not b!547367) (not b!547372) (not b!547294))
(check-sat)
