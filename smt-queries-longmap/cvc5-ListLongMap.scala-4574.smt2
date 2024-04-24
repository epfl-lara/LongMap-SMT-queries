; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63844 () Bool)

(assert start!63844)

(declare-fun b!717861 () Bool)

(declare-fun res!480431 () Bool)

(declare-fun e!403062 () Bool)

(assert (=> b!717861 (=> (not res!480431) (not e!403062))))

(declare-datatypes ((array!40640 0))(
  ( (array!40641 (arr!19449 (Array (_ BitVec 32) (_ BitVec 64))) (size!19869 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40640)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717861 (= res!480431 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!480428 () Bool)

(assert (=> start!63844 (=> (not res!480428) (not e!403062))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63844 (= res!480428 (validMask!0 mask!3328))))

(assert (=> start!63844 e!403062))

(declare-fun array_inv!15308 (array!40640) Bool)

(assert (=> start!63844 (array_inv!15308 a!3186)))

(assert (=> start!63844 true))

(declare-fun b!717862 () Bool)

(declare-fun e!403060 () Bool)

(assert (=> b!717862 (= e!403062 e!403060)))

(declare-fun res!480429 () Bool)

(assert (=> b!717862 (=> (not res!480429) (not e!403060))))

(declare-datatypes ((SeekEntryResult!7005 0))(
  ( (MissingZero!7005 (index!30388 (_ BitVec 32))) (Found!7005 (index!30389 (_ BitVec 32))) (Intermediate!7005 (undefined!7817 Bool) (index!30390 (_ BitVec 32)) (x!61556 (_ BitVec 32))) (Undefined!7005) (MissingVacant!7005 (index!30391 (_ BitVec 32))) )
))
(declare-fun lt!319239 () SeekEntryResult!7005)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717862 (= res!480429 (or (= lt!319239 (MissingZero!7005 i!1173)) (= lt!319239 (MissingVacant!7005 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40640 (_ BitVec 32)) SeekEntryResult!7005)

(assert (=> b!717862 (= lt!319239 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717863 () Bool)

(declare-fun res!480426 () Bool)

(assert (=> b!717863 (=> (not res!480426) (not e!403060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40640 (_ BitVec 32)) Bool)

(assert (=> b!717863 (= res!480426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717864 () Bool)

(declare-fun res!480433 () Bool)

(assert (=> b!717864 (=> (not res!480433) (not e!403060))))

(assert (=> b!717864 (= res!480433 (and (bvsle #b00000000000000000000000000000000 (size!19869 a!3186)) (bvslt (size!19869 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717865 () Bool)

(declare-datatypes ((List!13358 0))(
  ( (Nil!13355) (Cons!13354 (h!14402 (_ BitVec 64)) (t!19665 List!13358)) )
))
(declare-fun noDuplicate!1284 (List!13358) Bool)

(assert (=> b!717865 (= e!403060 (not (noDuplicate!1284 Nil!13355)))))

(declare-fun b!717866 () Bool)

(declare-fun res!480430 () Bool)

(assert (=> b!717866 (=> (not res!480430) (not e!403062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717866 (= res!480430 (validKeyInArray!0 k!2102))))

(declare-fun b!717867 () Bool)

(declare-fun res!480432 () Bool)

(assert (=> b!717867 (=> (not res!480432) (not e!403062))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717867 (= res!480432 (validKeyInArray!0 (select (arr!19449 a!3186) j!159)))))

(declare-fun b!717868 () Bool)

(declare-fun res!480427 () Bool)

(assert (=> b!717868 (=> (not res!480427) (not e!403062))))

(assert (=> b!717868 (= res!480427 (and (= (size!19869 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19869 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19869 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63844 res!480428) b!717868))

(assert (= (and b!717868 res!480427) b!717867))

(assert (= (and b!717867 res!480432) b!717866))

(assert (= (and b!717866 res!480430) b!717861))

(assert (= (and b!717861 res!480431) b!717862))

(assert (= (and b!717862 res!480429) b!717863))

(assert (= (and b!717863 res!480426) b!717864))

(assert (= (and b!717864 res!480433) b!717865))

(declare-fun m!674259 () Bool)

(assert (=> b!717867 m!674259))

(assert (=> b!717867 m!674259))

(declare-fun m!674261 () Bool)

(assert (=> b!717867 m!674261))

(declare-fun m!674263 () Bool)

(assert (=> b!717865 m!674263))

(declare-fun m!674265 () Bool)

(assert (=> b!717861 m!674265))

(declare-fun m!674267 () Bool)

(assert (=> b!717863 m!674267))

(declare-fun m!674269 () Bool)

(assert (=> start!63844 m!674269))

(declare-fun m!674271 () Bool)

(assert (=> start!63844 m!674271))

(declare-fun m!674273 () Bool)

(assert (=> b!717866 m!674273))

(declare-fun m!674275 () Bool)

(assert (=> b!717862 m!674275))

(push 1)

(assert (not b!717865))

(assert (not b!717867))

(assert (not start!63844))

(assert (not b!717861))

(assert (not b!717862))

(assert (not b!717866))

(assert (not b!717863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99039 () Bool)

(declare-fun res!480438 () Bool)

(declare-fun e!403067 () Bool)

(assert (=> d!99039 (=> res!480438 e!403067)))

(assert (=> d!99039 (= res!480438 (is-Nil!13355 Nil!13355))))

(assert (=> d!99039 (= (noDuplicate!1284 Nil!13355) e!403067)))

(declare-fun b!717873 () Bool)

(declare-fun e!403068 () Bool)

(assert (=> b!717873 (= e!403067 e!403068)))

(declare-fun res!480439 () Bool)

(assert (=> b!717873 (=> (not res!480439) (not e!403068))))

(declare-fun contains!4008 (List!13358 (_ BitVec 64)) Bool)

(assert (=> b!717873 (= res!480439 (not (contains!4008 (t!19665 Nil!13355) (h!14402 Nil!13355))))))

(declare-fun b!717874 () Bool)

(assert (=> b!717874 (= e!403068 (noDuplicate!1284 (t!19665 Nil!13355)))))

(assert (= (and d!99039 (not res!480438)) b!717873))

(assert (= (and b!717873 res!480439) b!717874))

(declare-fun m!674277 () Bool)

(assert (=> b!717873 m!674277))

(declare-fun m!674279 () Bool)

(assert (=> b!717874 m!674279))

(assert (=> b!717865 d!99039))

(declare-fun d!99043 () Bool)

(declare-fun res!480444 () Bool)

(declare-fun e!403073 () Bool)

(assert (=> d!99043 (=> res!480444 e!403073)))

(assert (=> d!99043 (= res!480444 (= (select (arr!19449 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99043 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!403073)))

(declare-fun b!717879 () Bool)

(declare-fun e!403074 () Bool)

(assert (=> b!717879 (= e!403073 e!403074)))

(declare-fun res!480445 () Bool)

(assert (=> b!717879 (=> (not res!480445) (not e!403074))))

(assert (=> b!717879 (= res!480445 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19869 a!3186)))))

(declare-fun b!717880 () Bool)

(assert (=> b!717880 (= e!403074 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99043 (not res!480444)) b!717879))

(assert (= (and b!717879 res!480445) b!717880))

(declare-fun m!674281 () Bool)

(assert (=> d!99043 m!674281))

(declare-fun m!674283 () Bool)

(assert (=> b!717880 m!674283))

(assert (=> b!717861 d!99043))

(declare-fun d!99045 () Bool)

(assert (=> d!99045 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717866 d!99045))

(declare-fun b!717923 () Bool)

(declare-fun e!403102 () SeekEntryResult!7005)

(declare-fun lt!319255 () SeekEntryResult!7005)

(assert (=> b!717923 (= e!403102 (Found!7005 (index!30390 lt!319255)))))

(declare-fun b!717924 () Bool)

(declare-fun e!403104 () SeekEntryResult!7005)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40640 (_ BitVec 32)) SeekEntryResult!7005)

(assert (=> b!717924 (= e!403104 (seekKeyOrZeroReturnVacant!0 (x!61556 lt!319255) (index!30390 lt!319255) (index!30390 lt!319255) k!2102 a!3186 mask!3328))))

(declare-fun b!717925 () Bool)

(declare-fun c!79102 () Bool)

(declare-fun lt!319257 () (_ BitVec 64))

(assert (=> b!717925 (= c!79102 (= lt!319257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717925 (= e!403102 e!403104)))

(declare-fun b!717926 () Bool)

(declare-fun e!403103 () SeekEntryResult!7005)

(assert (=> b!717926 (= e!403103 e!403102)))

(assert (=> b!717926 (= lt!319257 (select (arr!19449 a!3186) (index!30390 lt!319255)))))

(declare-fun c!79103 () Bool)

(assert (=> b!717926 (= c!79103 (= lt!319257 k!2102))))

(declare-fun d!99047 () Bool)

(declare-fun lt!319256 () SeekEntryResult!7005)

(assert (=> d!99047 (and (or (is-Undefined!7005 lt!319256) (not (is-Found!7005 lt!319256)) (and (bvsge (index!30389 lt!319256) #b00000000000000000000000000000000) (bvslt (index!30389 lt!319256) (size!19869 a!3186)))) (or (is-Undefined!7005 lt!319256) (is-Found!7005 lt!319256) (not (is-MissingZero!7005 lt!319256)) (and (bvsge (index!30388 lt!319256) #b00000000000000000000000000000000) (bvslt (index!30388 lt!319256) (size!19869 a!3186)))) (or (is-Undefined!7005 lt!319256) (is-Found!7005 lt!319256) (is-MissingZero!7005 lt!319256) (not (is-MissingVacant!7005 lt!319256)) (and (bvsge (index!30391 lt!319256) #b00000000000000000000000000000000) (bvslt (index!30391 lt!319256) (size!19869 a!3186)))) (or (is-Undefined!7005 lt!319256) (ite (is-Found!7005 lt!319256) (= (select (arr!19449 a!3186) (index!30389 lt!319256)) k!2102) (ite (is-MissingZero!7005 lt!319256) (= (select (arr!19449 a!3186) (index!30388 lt!319256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7005 lt!319256) (= (select (arr!19449 a!3186) (index!30391 lt!319256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99047 (= lt!319256 e!403103)))

(declare-fun c!79101 () Bool)

(assert (=> d!99047 (= c!79101 (and (is-Intermediate!7005 lt!319255) (undefined!7817 lt!319255)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40640 (_ BitVec 32)) SeekEntryResult!7005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99047 (= lt!319255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99047 (validMask!0 mask!3328)))

(assert (=> d!99047 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319256)))

(declare-fun b!717927 () Bool)

(assert (=> b!717927 (= e!403103 Undefined!7005)))

(declare-fun b!717928 () Bool)

(assert (=> b!717928 (= e!403104 (MissingZero!7005 (index!30390 lt!319255)))))

(assert (= (and d!99047 c!79101) b!717927))

(assert (= (and d!99047 (not c!79101)) b!717926))

(assert (= (and b!717926 c!79103) b!717923))

(assert (= (and b!717926 (not c!79103)) b!717925))

(assert (= (and b!717925 c!79102) b!717928))

(assert (= (and b!717925 (not c!79102)) b!717924))

(declare-fun m!674307 () Bool)

(assert (=> b!717924 m!674307))

(declare-fun m!674309 () Bool)

(assert (=> b!717926 m!674309))

(declare-fun m!674311 () Bool)

(assert (=> d!99047 m!674311))

(declare-fun m!674313 () Bool)

(assert (=> d!99047 m!674313))

(assert (=> d!99047 m!674269))

(declare-fun m!674315 () Bool)

(assert (=> d!99047 m!674315))

(declare-fun m!674317 () Bool)

(assert (=> d!99047 m!674317))

(assert (=> d!99047 m!674311))

(declare-fun m!674319 () Bool)

(assert (=> d!99047 m!674319))

(assert (=> b!717862 d!99047))

(declare-fun d!99065 () Bool)

(assert (=> d!99065 (= (validKeyInArray!0 (select (arr!19449 a!3186) j!159)) (and (not (= (select (arr!19449 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19449 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717867 d!99065))

(declare-fun d!99067 () Bool)

(assert (=> d!99067 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63844 d!99067))

(declare-fun d!99069 () Bool)

(assert (=> d!99069 (= (array_inv!15308 a!3186) (bvsge (size!19869 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63844 d!99069))

(declare-fun b!717949 () Bool)

(declare-fun e!403120 () Bool)

(declare-fun e!403121 () Bool)

(assert (=> b!717949 (= e!403120 e!403121)))

(declare-fun lt!319273 () (_ BitVec 64))

(assert (=> b!717949 (= lt!319273 (select (arr!19449 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24627 0))(
  ( (Unit!24628) )
))
(declare-fun lt!319274 () Unit!24627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40640 (_ BitVec 64) (_ BitVec 32)) Unit!24627)

(assert (=> b!717949 (= lt!319274 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319273 #b00000000000000000000000000000000))))

(assert (=> b!717949 (arrayContainsKey!0 a!3186 lt!319273 #b00000000000000000000000000000000)))

(declare-fun lt!319275 () Unit!24627)

(assert (=> b!717949 (= lt!319275 lt!319274)))

(declare-fun res!480469 () Bool)

(assert (=> b!717949 (= res!480469 (= (seekEntryOrOpen!0 (select (arr!19449 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7005 #b00000000000000000000000000000000)))))

(assert (=> b!717949 (=> (not res!480469) (not e!403121))))

(declare-fun bm!34707 () Bool)

(declare-fun call!34710 () Bool)

(assert (=> bm!34707 (= call!34710 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717950 () Bool)

(declare-fun e!403122 () Bool)

(assert (=> b!717950 (= e!403122 e!403120)))

(declare-fun c!79109 () Bool)

(assert (=> b!717950 (= c!79109 (validKeyInArray!0 (select (arr!19449 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717952 () Bool)

(assert (=> b!717952 (= e!403121 call!34710)))

(declare-fun d!99071 () Bool)

(declare-fun res!480468 () Bool)

(assert (=> d!99071 (=> res!480468 e!403122)))

(assert (=> d!99071 (= res!480468 (bvsge #b00000000000000000000000000000000 (size!19869 a!3186)))))

(assert (=> d!99071 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403122)))

(declare-fun b!717951 () Bool)

(assert (=> b!717951 (= e!403120 call!34710)))

(assert (= (and d!99071 (not res!480468)) b!717950))

(assert (= (and b!717950 c!79109) b!717949))

(assert (= (and b!717950 (not c!79109)) b!717951))

(assert (= (and b!717949 res!480469) b!717952))

(assert (= (or b!717952 b!717951) bm!34707))

(assert (=> b!717949 m!674281))

(declare-fun m!674333 () Bool)

(assert (=> b!717949 m!674333))

(declare-fun m!674335 () Bool)

(assert (=> b!717949 m!674335))

(assert (=> b!717949 m!674281))

(declare-fun m!674337 () Bool)

(assert (=> b!717949 m!674337))

(declare-fun m!674339 () Bool)

(assert (=> bm!34707 m!674339))

(assert (=> b!717950 m!674281))

(assert (=> b!717950 m!674281))

(declare-fun m!674341 () Bool)

(assert (=> b!717950 m!674341))

(assert (=> b!717863 d!99071))

(push 1)

(assert (not b!717949))

(assert (not b!717873))

(assert (not b!717874))

(assert (not bm!34707))

(assert (not d!99047))

(assert (not b!717950))

(assert (not b!717924))

(assert (not b!717880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

