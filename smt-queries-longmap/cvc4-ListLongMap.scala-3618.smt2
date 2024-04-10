; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49782 () Bool)

(assert start!49782)

(declare-fun b!547091 () Bool)

(declare-fun res!340809 () Bool)

(declare-fun e!316119 () Bool)

(assert (=> b!547091 (=> (not res!340809) (not e!316119))))

(declare-datatypes ((array!34520 0))(
  ( (array!34521 (arr!16586 (Array (_ BitVec 32) (_ BitVec 64))) (size!16950 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34520)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34520 (_ BitVec 32)) Bool)

(assert (=> b!547091 (= res!340809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547092 () Bool)

(assert (=> b!547092 (= e!316119 (and (bvsle #b00000000000000000000000000000000 (size!16950 a!3118)) (bvsge (size!16950 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547093 () Bool)

(declare-fun res!340808 () Bool)

(declare-fun e!316117 () Bool)

(assert (=> b!547093 (=> (not res!340808) (not e!316117))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547093 (= res!340808 (validKeyInArray!0 k!1914))))

(declare-fun b!547094 () Bool)

(declare-fun res!340807 () Bool)

(assert (=> b!547094 (=> (not res!340807) (not e!316117))))

(declare-fun arrayContainsKey!0 (array!34520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547094 (= res!340807 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547095 () Bool)

(declare-fun res!340810 () Bool)

(assert (=> b!547095 (=> (not res!340810) (not e!316117))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547095 (= res!340810 (and (= (size!16950 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16950 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16950 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547096 () Bool)

(assert (=> b!547096 (= e!316117 e!316119)))

(declare-fun res!340805 () Bool)

(assert (=> b!547096 (=> (not res!340805) (not e!316119))))

(declare-datatypes ((SeekEntryResult!5035 0))(
  ( (MissingZero!5035 (index!22367 (_ BitVec 32))) (Found!5035 (index!22368 (_ BitVec 32))) (Intermediate!5035 (undefined!5847 Bool) (index!22369 (_ BitVec 32)) (x!51311 (_ BitVec 32))) (Undefined!5035) (MissingVacant!5035 (index!22370 (_ BitVec 32))) )
))
(declare-fun lt!249418 () SeekEntryResult!5035)

(assert (=> b!547096 (= res!340805 (or (= lt!249418 (MissingZero!5035 i!1132)) (= lt!249418 (MissingVacant!5035 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34520 (_ BitVec 32)) SeekEntryResult!5035)

(assert (=> b!547096 (= lt!249418 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340811 () Bool)

(assert (=> start!49782 (=> (not res!340811) (not e!316117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49782 (= res!340811 (validMask!0 mask!3119))))

(assert (=> start!49782 e!316117))

(assert (=> start!49782 true))

(declare-fun array_inv!12382 (array!34520) Bool)

(assert (=> start!49782 (array_inv!12382 a!3118)))

(declare-fun b!547097 () Bool)

(declare-fun res!340806 () Bool)

(assert (=> b!547097 (=> (not res!340806) (not e!316117))))

(assert (=> b!547097 (= res!340806 (validKeyInArray!0 (select (arr!16586 a!3118) j!142)))))

(assert (= (and start!49782 res!340811) b!547095))

(assert (= (and b!547095 res!340810) b!547097))

(assert (= (and b!547097 res!340806) b!547093))

(assert (= (and b!547093 res!340808) b!547094))

(assert (= (and b!547094 res!340807) b!547096))

(assert (= (and b!547096 res!340805) b!547091))

(assert (= (and b!547091 res!340809) b!547092))

(declare-fun m!524441 () Bool)

(assert (=> b!547096 m!524441))

(declare-fun m!524443 () Bool)

(assert (=> b!547094 m!524443))

(declare-fun m!524445 () Bool)

(assert (=> b!547093 m!524445))

(declare-fun m!524447 () Bool)

(assert (=> start!49782 m!524447))

(declare-fun m!524449 () Bool)

(assert (=> start!49782 m!524449))

(declare-fun m!524451 () Bool)

(assert (=> b!547091 m!524451))

(declare-fun m!524453 () Bool)

(assert (=> b!547097 m!524453))

(assert (=> b!547097 m!524453))

(declare-fun m!524455 () Bool)

(assert (=> b!547097 m!524455))

(push 1)

(assert (not start!49782))

(assert (not b!547094))

(assert (not b!547091))

(assert (not b!547097))

(assert (not b!547093))

(assert (not b!547096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82403 () Bool)

(assert (=> d!82403 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547093 d!82403))

(declare-fun d!82405 () Bool)

(assert (=> d!82405 (= (validKeyInArray!0 (select (arr!16586 a!3118) j!142)) (and (not (= (select (arr!16586 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16586 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547097 d!82405))

(declare-fun d!82407 () Bool)

(declare-fun res!340827 () Bool)

(declare-fun e!316138 () Bool)

(assert (=> d!82407 (=> res!340827 e!316138)))

(assert (=> d!82407 (= res!340827 (bvsge #b00000000000000000000000000000000 (size!16950 a!3118)))))

(assert (=> d!82407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316138)))

(declare-fun b!547120 () Bool)

(declare-fun e!316139 () Bool)

(declare-fun e!316140 () Bool)

(assert (=> b!547120 (= e!316139 e!316140)))

(declare-fun lt!249433 () (_ BitVec 64))

(assert (=> b!547120 (= lt!249433 (select (arr!16586 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16946 0))(
  ( (Unit!16947) )
))
(declare-fun lt!249432 () Unit!16946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34520 (_ BitVec 64) (_ BitVec 32)) Unit!16946)

(assert (=> b!547120 (= lt!249432 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249433 #b00000000000000000000000000000000))))

(assert (=> b!547120 (arrayContainsKey!0 a!3118 lt!249433 #b00000000000000000000000000000000)))

(declare-fun lt!249431 () Unit!16946)

(assert (=> b!547120 (= lt!249431 lt!249432)))

(declare-fun res!340826 () Bool)

(assert (=> b!547120 (= res!340826 (= (seekEntryOrOpen!0 (select (arr!16586 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5035 #b00000000000000000000000000000000)))))

(assert (=> b!547120 (=> (not res!340826) (not e!316140))))

(declare-fun b!547121 () Bool)

(assert (=> b!547121 (= e!316138 e!316139)))

(declare-fun c!63475 () Bool)

(assert (=> b!547121 (= c!63475 (validKeyInArray!0 (select (arr!16586 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547122 () Bool)

(declare-fun call!32152 () Bool)

(assert (=> b!547122 (= e!316140 call!32152)))

(declare-fun bm!32149 () Bool)

(assert (=> bm!32149 (= call!32152 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547123 () Bool)

(assert (=> b!547123 (= e!316139 call!32152)))

(assert (= (and d!82407 (not res!340827)) b!547121))

(assert (= (and b!547121 c!63475) b!547120))

(assert (= (and b!547121 (not c!63475)) b!547123))

(assert (= (and b!547120 res!340826) b!547122))

(assert (= (or b!547122 b!547123) bm!32149))

(declare-fun m!524461 () Bool)

(assert (=> b!547120 m!524461))

(declare-fun m!524463 () Bool)

(assert (=> b!547120 m!524463))

(declare-fun m!524465 () Bool)

(assert (=> b!547120 m!524465))

(assert (=> b!547120 m!524461))

(declare-fun m!524467 () Bool)

(assert (=> b!547120 m!524467))

(assert (=> b!547121 m!524461))

(assert (=> b!547121 m!524461))

(declare-fun m!524469 () Bool)

(assert (=> b!547121 m!524469))

(declare-fun m!524471 () Bool)

(assert (=> bm!32149 m!524471))

(assert (=> b!547091 d!82407))

(declare-fun d!82413 () Bool)

(assert (=> d!82413 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49782 d!82413))

(declare-fun d!82417 () Bool)

(assert (=> d!82417 (= (array_inv!12382 a!3118) (bvsge (size!16950 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49782 d!82417))

(declare-fun b!547170 () Bool)

(declare-fun e!316166 () SeekEntryResult!5035)

(declare-fun lt!249459 () SeekEntryResult!5035)

(assert (=> b!547170 (= e!316166 (Found!5035 (index!22369 lt!249459)))))

(declare-fun d!82419 () Bool)

(declare-fun lt!249458 () SeekEntryResult!5035)

(assert (=> d!82419 (and (or (is-Undefined!5035 lt!249458) (not (is-Found!5035 lt!249458)) (and (bvsge (index!22368 lt!249458) #b00000000000000000000000000000000) (bvslt (index!22368 lt!249458) (size!16950 a!3118)))) (or (is-Undefined!5035 lt!249458) (is-Found!5035 lt!249458) (not (is-MissingZero!5035 lt!249458)) (and (bvsge (index!22367 lt!249458) #b00000000000000000000000000000000) (bvslt (index!22367 lt!249458) (size!16950 a!3118)))) (or (is-Undefined!5035 lt!249458) (is-Found!5035 lt!249458) (is-MissingZero!5035 lt!249458) (not (is-MissingVacant!5035 lt!249458)) (and (bvsge (index!22370 lt!249458) #b00000000000000000000000000000000) (bvslt (index!22370 lt!249458) (size!16950 a!3118)))) (or (is-Undefined!5035 lt!249458) (ite (is-Found!5035 lt!249458) (= (select (arr!16586 a!3118) (index!22368 lt!249458)) k!1914) (ite (is-MissingZero!5035 lt!249458) (= (select (arr!16586 a!3118) (index!22367 lt!249458)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5035 lt!249458) (= (select (arr!16586 a!3118) (index!22370 lt!249458)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316167 () SeekEntryResult!5035)

(assert (=> d!82419 (= lt!249458 e!316167)))

(declare-fun c!63500 () Bool)

(assert (=> d!82419 (= c!63500 (and (is-Intermediate!5035 lt!249459) (undefined!5847 lt!249459)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34520 (_ BitVec 32)) SeekEntryResult!5035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82419 (= lt!249459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82419 (validMask!0 mask!3119)))

(assert (=> d!82419 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249458)))

(declare-fun e!316165 () SeekEntryResult!5035)

(declare-fun b!547171 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34520 (_ BitVec 32)) SeekEntryResult!5035)

(assert (=> b!547171 (= e!316165 (seekKeyOrZeroReturnVacant!0 (x!51311 lt!249459) (index!22369 lt!249459) (index!22369 lt!249459) k!1914 a!3118 mask!3119))))

(declare-fun b!547172 () Bool)

(assert (=> b!547172 (= e!316165 (MissingZero!5035 (index!22369 lt!249459)))))

(declare-fun b!547173 () Bool)

(assert (=> b!547173 (= e!316167 e!316166)))

(declare-fun lt!249460 () (_ BitVec 64))

(assert (=> b!547173 (= lt!249460 (select (arr!16586 a!3118) (index!22369 lt!249459)))))

(declare-fun c!63498 () Bool)

(assert (=> b!547173 (= c!63498 (= lt!249460 k!1914))))

(declare-fun b!547174 () Bool)

(declare-fun c!63499 () Bool)

(assert (=> b!547174 (= c!63499 (= lt!249460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547174 (= e!316166 e!316165)))

(declare-fun b!547175 () Bool)

(assert (=> b!547175 (= e!316167 Undefined!5035)))

(assert (= (and d!82419 c!63500) b!547175))

(assert (= (and d!82419 (not c!63500)) b!547173))

(assert (= (and b!547173 c!63498) b!547170))

(assert (= (and b!547173 (not c!63498)) b!547174))

(assert (= (and b!547174 c!63499) b!547172))

(assert (= (and b!547174 (not c!63499)) b!547171))

(declare-fun m!524499 () Bool)

(assert (=> d!82419 m!524499))

(declare-fun m!524501 () Bool)

(assert (=> d!82419 m!524501))

(declare-fun m!524503 () Bool)

(assert (=> d!82419 m!524503))

(assert (=> d!82419 m!524447))

(declare-fun m!524505 () Bool)

(assert (=> d!82419 m!524505))

(assert (=> d!82419 m!524501))

(declare-fun m!524507 () Bool)

(assert (=> d!82419 m!524507))

(declare-fun m!524509 () Bool)

(assert (=> b!547171 m!524509))

(declare-fun m!524511 () Bool)

(assert (=> b!547173 m!524511))

(assert (=> b!547096 d!82419))

(declare-fun d!82423 () Bool)

(declare-fun res!340834 () Bool)

(declare-fun e!316172 () Bool)

(assert (=> d!82423 (=> res!340834 e!316172)))

(assert (=> d!82423 (= res!340834 (= (select (arr!16586 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82423 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316172)))

(declare-fun b!547180 () Bool)

(declare-fun e!316173 () Bool)

(assert (=> b!547180 (= e!316172 e!316173)))

(declare-fun res!340835 () Bool)

(assert (=> b!547180 (=> (not res!340835) (not e!316173))))

(assert (=> b!547180 (= res!340835 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16950 a!3118)))))

(declare-fun b!547181 () Bool)

(assert (=> b!547181 (= e!316173 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82423 (not res!340834)) b!547180))

(assert (= (and b!547180 res!340835) b!547181))

(assert (=> d!82423 m!524461))

(declare-fun m!524513 () Bool)

(assert (=> b!547181 m!524513))

(assert (=> b!547094 d!82423))

(push 1)

(assert (not b!547121))

(assert (not d!82419))

(assert (not b!547171))

(assert (not bm!32149))

(assert (not b!547181))

(assert (not b!547120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

