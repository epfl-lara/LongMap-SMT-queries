; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65030 () Bool)

(assert start!65030)

(declare-datatypes ((array!41272 0))(
  ( (array!41273 (arr!19751 (Array (_ BitVec 32) (_ BitVec 64))) (size!20172 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41272)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7351 0))(
  ( (MissingZero!7351 (index!31772 (_ BitVec 32))) (Found!7351 (index!31773 (_ BitVec 32))) (Intermediate!7351 (undefined!8163 Bool) (index!31774 (_ BitVec 32)) (x!62769 (_ BitVec 32))) (Undefined!7351) (MissingVacant!7351 (index!31775 (_ BitVec 32))) )
))
(declare-fun lt!325390 () SeekEntryResult!7351)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!410790 () Bool)

(declare-fun b!734165 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41272 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!734165 (= e!410790 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325390))))

(declare-fun res!493337 () Bool)

(declare-fun e!410789 () Bool)

(assert (=> start!65030 (=> (not res!493337) (not e!410789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65030 (= res!493337 (validMask!0 mask!3328))))

(assert (=> start!65030 e!410789))

(assert (=> start!65030 true))

(declare-fun array_inv!15547 (array!41272) Bool)

(assert (=> start!65030 (array_inv!15547 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!734166 () Bool)

(declare-fun e!410788 () Bool)

(declare-fun lt!325386 () SeekEntryResult!7351)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41272 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!734166 (= e!410788 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325386))))

(declare-fun b!734167 () Bool)

(declare-fun e!410787 () Bool)

(assert (=> b!734167 (= e!410789 e!410787)))

(declare-fun res!493340 () Bool)

(assert (=> b!734167 (=> (not res!493340) (not e!410787))))

(declare-fun lt!325388 () SeekEntryResult!7351)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734167 (= res!493340 (or (= lt!325388 (MissingZero!7351 i!1173)) (= lt!325388 (MissingVacant!7351 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41272 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!734167 (= lt!325388 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!734168 () Bool)

(declare-fun res!493341 () Bool)

(assert (=> b!734168 (=> (not res!493341) (not e!410789))))

(assert (=> b!734168 (= res!493341 (and (= (size!20172 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20172 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20172 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734169 () Bool)

(declare-fun res!493334 () Bool)

(assert (=> b!734169 (=> (not res!493334) (not e!410787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41272 (_ BitVec 32)) Bool)

(assert (=> b!734169 (= res!493334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!410786 () Bool)

(declare-fun b!734170 () Bool)

(declare-fun lt!325394 () (_ BitVec 32))

(assert (=> b!734170 (= e!410786 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325394 #b00000000000000000000000000000000) (bvsge lt!325394 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!734171 () Bool)

(declare-fun e!410785 () Bool)

(assert (=> b!734171 (= e!410787 e!410785)))

(declare-fun res!493342 () Bool)

(assert (=> b!734171 (=> (not res!493342) (not e!410785))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734171 (= res!493342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19751 a!3186) j!159) mask!3328) (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325390))))

(assert (=> b!734171 (= lt!325390 (Intermediate!7351 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734172 () Bool)

(declare-fun e!410791 () Bool)

(declare-fun e!410783 () Bool)

(assert (=> b!734172 (= e!410791 (not e!410783))))

(declare-fun res!493330 () Bool)

(assert (=> b!734172 (=> res!493330 e!410783)))

(declare-fun lt!325387 () SeekEntryResult!7351)

(assert (=> b!734172 (= res!493330 (or (not (is-Intermediate!7351 lt!325387)) (bvsge x!1131 (x!62769 lt!325387))))))

(declare-fun e!410792 () Bool)

(assert (=> b!734172 e!410792))

(declare-fun res!493339 () Bool)

(assert (=> b!734172 (=> (not res!493339) (not e!410792))))

(assert (=> b!734172 (= res!493339 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25020 0))(
  ( (Unit!25021) )
))
(declare-fun lt!325389 () Unit!25020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25020)

(assert (=> b!734172 (= lt!325389 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734173 () Bool)

(assert (=> b!734173 (= e!410790 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) (Found!7351 j!159)))))

(declare-fun b!734174 () Bool)

(declare-fun res!493333 () Bool)

(assert (=> b!734174 (=> (not res!493333) (not e!410785))))

(assert (=> b!734174 (= res!493333 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19751 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734175 () Bool)

(declare-fun res!493336 () Bool)

(assert (=> b!734175 (=> (not res!493336) (not e!410787))))

(declare-datatypes ((List!13753 0))(
  ( (Nil!13750) (Cons!13749 (h!14818 (_ BitVec 64)) (t!20068 List!13753)) )
))
(declare-fun arrayNoDuplicates!0 (array!41272 (_ BitVec 32) List!13753) Bool)

(assert (=> b!734175 (= res!493336 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13750))))

(declare-fun b!734176 () Bool)

(declare-fun res!493332 () Bool)

(assert (=> b!734176 (=> res!493332 e!410786)))

(assert (=> b!734176 (= res!493332 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) (Found!7351 j!159)))))

(declare-fun b!734177 () Bool)

(declare-fun res!493343 () Bool)

(assert (=> b!734177 (=> (not res!493343) (not e!410789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734177 (= res!493343 (validKeyInArray!0 k!2102))))

(declare-fun b!734178 () Bool)

(assert (=> b!734178 (= e!410785 e!410791)))

(declare-fun res!493345 () Bool)

(assert (=> b!734178 (=> (not res!493345) (not e!410791))))

(declare-fun lt!325392 () SeekEntryResult!7351)

(assert (=> b!734178 (= res!493345 (= lt!325392 lt!325387))))

(declare-fun lt!325391 () array!41272)

(declare-fun lt!325393 () (_ BitVec 64))

(assert (=> b!734178 (= lt!325387 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325393 lt!325391 mask!3328))))

(assert (=> b!734178 (= lt!325392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325393 mask!3328) lt!325393 lt!325391 mask!3328))))

(assert (=> b!734178 (= lt!325393 (select (store (arr!19751 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!734178 (= lt!325391 (array!41273 (store (arr!19751 a!3186) i!1173 k!2102) (size!20172 a!3186)))))

(declare-fun b!734179 () Bool)

(declare-fun res!493346 () Bool)

(assert (=> b!734179 (=> (not res!493346) (not e!410785))))

(assert (=> b!734179 (= res!493346 e!410790)))

(declare-fun c!80797 () Bool)

(assert (=> b!734179 (= c!80797 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734180 () Bool)

(assert (=> b!734180 (= e!410783 e!410786)))

(declare-fun res!493331 () Bool)

(assert (=> b!734180 (=> res!493331 e!410786)))

(assert (=> b!734180 (= res!493331 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734180 (= lt!325394 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734181 () Bool)

(assert (=> b!734181 (= e!410792 e!410788)))

(declare-fun res!493344 () Bool)

(assert (=> b!734181 (=> (not res!493344) (not e!410788))))

(assert (=> b!734181 (= res!493344 (= (seekEntryOrOpen!0 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325386))))

(assert (=> b!734181 (= lt!325386 (Found!7351 j!159))))

(declare-fun b!734182 () Bool)

(declare-fun res!493338 () Bool)

(assert (=> b!734182 (=> (not res!493338) (not e!410789))))

(assert (=> b!734182 (= res!493338 (validKeyInArray!0 (select (arr!19751 a!3186) j!159)))))

(declare-fun b!734183 () Bool)

(declare-fun res!493329 () Bool)

(assert (=> b!734183 (=> (not res!493329) (not e!410789))))

(declare-fun arrayContainsKey!0 (array!41272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734183 (= res!493329 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734184 () Bool)

(declare-fun res!493335 () Bool)

(assert (=> b!734184 (=> (not res!493335) (not e!410787))))

(assert (=> b!734184 (= res!493335 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20172 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20172 a!3186))))))

(assert (= (and start!65030 res!493337) b!734168))

(assert (= (and b!734168 res!493341) b!734182))

(assert (= (and b!734182 res!493338) b!734177))

(assert (= (and b!734177 res!493343) b!734183))

(assert (= (and b!734183 res!493329) b!734167))

(assert (= (and b!734167 res!493340) b!734169))

(assert (= (and b!734169 res!493334) b!734175))

(assert (= (and b!734175 res!493336) b!734184))

(assert (= (and b!734184 res!493335) b!734171))

(assert (= (and b!734171 res!493342) b!734174))

(assert (= (and b!734174 res!493333) b!734179))

(assert (= (and b!734179 c!80797) b!734165))

(assert (= (and b!734179 (not c!80797)) b!734173))

(assert (= (and b!734179 res!493346) b!734178))

(assert (= (and b!734178 res!493345) b!734172))

(assert (= (and b!734172 res!493339) b!734181))

(assert (= (and b!734181 res!493344) b!734166))

(assert (= (and b!734172 (not res!493330)) b!734180))

(assert (= (and b!734180 (not res!493331)) b!734176))

(assert (= (and b!734176 (not res!493332)) b!734170))

(declare-fun m!686857 () Bool)

(assert (=> b!734180 m!686857))

(declare-fun m!686859 () Bool)

(assert (=> b!734178 m!686859))

(declare-fun m!686861 () Bool)

(assert (=> b!734178 m!686861))

(declare-fun m!686863 () Bool)

(assert (=> b!734178 m!686863))

(declare-fun m!686865 () Bool)

(assert (=> b!734178 m!686865))

(assert (=> b!734178 m!686861))

(declare-fun m!686867 () Bool)

(assert (=> b!734178 m!686867))

(declare-fun m!686869 () Bool)

(assert (=> b!734183 m!686869))

(declare-fun m!686871 () Bool)

(assert (=> b!734177 m!686871))

(declare-fun m!686873 () Bool)

(assert (=> b!734171 m!686873))

(assert (=> b!734171 m!686873))

(declare-fun m!686875 () Bool)

(assert (=> b!734171 m!686875))

(assert (=> b!734171 m!686875))

(assert (=> b!734171 m!686873))

(declare-fun m!686877 () Bool)

(assert (=> b!734171 m!686877))

(declare-fun m!686879 () Bool)

(assert (=> b!734174 m!686879))

(declare-fun m!686881 () Bool)

(assert (=> start!65030 m!686881))

(declare-fun m!686883 () Bool)

(assert (=> start!65030 m!686883))

(declare-fun m!686885 () Bool)

(assert (=> b!734175 m!686885))

(assert (=> b!734181 m!686873))

(assert (=> b!734181 m!686873))

(declare-fun m!686887 () Bool)

(assert (=> b!734181 m!686887))

(assert (=> b!734165 m!686873))

(assert (=> b!734165 m!686873))

(declare-fun m!686889 () Bool)

(assert (=> b!734165 m!686889))

(assert (=> b!734166 m!686873))

(assert (=> b!734166 m!686873))

(declare-fun m!686891 () Bool)

(assert (=> b!734166 m!686891))

(assert (=> b!734176 m!686873))

(assert (=> b!734176 m!686873))

(declare-fun m!686893 () Bool)

(assert (=> b!734176 m!686893))

(assert (=> b!734173 m!686873))

(assert (=> b!734173 m!686873))

(assert (=> b!734173 m!686893))

(declare-fun m!686895 () Bool)

(assert (=> b!734169 m!686895))

(declare-fun m!686897 () Bool)

(assert (=> b!734167 m!686897))

(assert (=> b!734182 m!686873))

(assert (=> b!734182 m!686873))

(declare-fun m!686899 () Bool)

(assert (=> b!734182 m!686899))

(declare-fun m!686901 () Bool)

(assert (=> b!734172 m!686901))

(declare-fun m!686903 () Bool)

(assert (=> b!734172 m!686903))

(push 1)

(assert (not b!734171))

(assert (not b!734175))

(assert (not b!734182))

(assert (not b!734181))

(assert (not b!734169))

(assert (not b!734166))

(assert (not b!734176))

(assert (not b!734180))

(assert (not start!65030))

(assert (not b!734165))

(assert (not b!734183))

(assert (not b!734173))

(assert (not b!734177))

(assert (not b!734178))

(assert (not b!734167))

(assert (not b!734172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100009 () Bool)

(assert (=> d!100009 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734177 d!100009))

(declare-fun b!734300 () Bool)

(declare-fun e!410860 () SeekEntryResult!7351)

(declare-fun e!410863 () SeekEntryResult!7351)

(assert (=> b!734300 (= e!410860 e!410863)))

(declare-fun c!80840 () Bool)

(declare-fun lt!325446 () (_ BitVec 64))

(assert (=> b!734300 (= c!80840 (or (= lt!325446 lt!325393) (= (bvadd lt!325446 lt!325446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734301 () Bool)

(declare-fun lt!325447 () SeekEntryResult!7351)

(assert (=> b!734301 (and (bvsge (index!31774 lt!325447) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325447) (size!20172 lt!325391)))))

(declare-fun res!493386 () Bool)

(assert (=> b!734301 (= res!493386 (= (select (arr!19751 lt!325391) (index!31774 lt!325447)) lt!325393))))

(declare-fun e!410861 () Bool)

(assert (=> b!734301 (=> res!493386 e!410861)))

(declare-fun e!410859 () Bool)

(assert (=> b!734301 (= e!410859 e!410861)))

(declare-fun b!734302 () Bool)

(assert (=> b!734302 (and (bvsge (index!31774 lt!325447) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325447) (size!20172 lt!325391)))))

(assert (=> b!734302 (= e!410861 (= (select (arr!19751 lt!325391) (index!31774 lt!325447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734303 () Bool)

(assert (=> b!734303 (= e!410863 (Intermediate!7351 false index!1321 x!1131))))

(declare-fun b!734304 () Bool)

(assert (=> b!734304 (and (bvsge (index!31774 lt!325447) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325447) (size!20172 lt!325391)))))

(declare-fun res!493384 () Bool)

(assert (=> b!734304 (= res!493384 (= (select (arr!19751 lt!325391) (index!31774 lt!325447)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734304 (=> res!493384 e!410861)))

(declare-fun d!100011 () Bool)

(declare-fun e!410862 () Bool)

(assert (=> d!100011 e!410862))

(declare-fun c!80838 () Bool)

(assert (=> d!100011 (= c!80838 (and (is-Intermediate!7351 lt!325447) (undefined!8163 lt!325447)))))

(assert (=> d!100011 (= lt!325447 e!410860)))

(declare-fun c!80839 () Bool)

(assert (=> d!100011 (= c!80839 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100011 (= lt!325446 (select (arr!19751 lt!325391) index!1321))))

(assert (=> d!100011 (validMask!0 mask!3328)))

(assert (=> d!100011 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325393 lt!325391 mask!3328) lt!325447)))

(declare-fun b!734305 () Bool)

(assert (=> b!734305 (= e!410860 (Intermediate!7351 true index!1321 x!1131))))

(declare-fun b!734306 () Bool)

(assert (=> b!734306 (= e!410862 e!410859)))

(declare-fun res!493385 () Bool)

(assert (=> b!734306 (= res!493385 (and (is-Intermediate!7351 lt!325447) (not (undefined!8163 lt!325447)) (bvslt (x!62769 lt!325447) #b01111111111111111111111111111110) (bvsge (x!62769 lt!325447) #b00000000000000000000000000000000) (bvsge (x!62769 lt!325447) x!1131)))))

(assert (=> b!734306 (=> (not res!493385) (not e!410859))))

(declare-fun b!734307 () Bool)

(assert (=> b!734307 (= e!410863 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!325393 lt!325391 mask!3328))))

(declare-fun b!734308 () Bool)

(assert (=> b!734308 (= e!410862 (bvsge (x!62769 lt!325447) #b01111111111111111111111111111110))))

(assert (= (and d!100011 c!80839) b!734305))

(assert (= (and d!100011 (not c!80839)) b!734300))

(assert (= (and b!734300 c!80840) b!734303))

(assert (= (and b!734300 (not c!80840)) b!734307))

(assert (= (and d!100011 c!80838) b!734308))

(assert (= (and d!100011 (not c!80838)) b!734306))

(assert (= (and b!734306 res!493385) b!734301))

(assert (= (and b!734301 (not res!493386)) b!734304))

(assert (= (and b!734304 (not res!493384)) b!734302))

(assert (=> b!734307 m!686857))

(assert (=> b!734307 m!686857))

(declare-fun m!686955 () Bool)

(assert (=> b!734307 m!686955))

(declare-fun m!686957 () Bool)

(assert (=> d!100011 m!686957))

(assert (=> d!100011 m!686881))

(declare-fun m!686959 () Bool)

(assert (=> b!734304 m!686959))

(assert (=> b!734301 m!686959))

(assert (=> b!734302 m!686959))

(assert (=> b!734178 d!100011))

(declare-fun b!734321 () Bool)

(declare-fun e!410871 () SeekEntryResult!7351)

(declare-fun e!410874 () SeekEntryResult!7351)

(assert (=> b!734321 (= e!410871 e!410874)))

(declare-fun c!80849 () Bool)

(declare-fun lt!325452 () (_ BitVec 64))

(assert (=> b!734321 (= c!80849 (or (= lt!325452 lt!325393) (= (bvadd lt!325452 lt!325452) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734322 () Bool)

(declare-fun lt!325453 () SeekEntryResult!7351)

(assert (=> b!734322 (and (bvsge (index!31774 lt!325453) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325453) (size!20172 lt!325391)))))

(declare-fun res!493389 () Bool)

(assert (=> b!734322 (= res!493389 (= (select (arr!19751 lt!325391) (index!31774 lt!325453)) lt!325393))))

(declare-fun e!410872 () Bool)

(assert (=> b!734322 (=> res!493389 e!410872)))

(declare-fun e!410870 () Bool)

(assert (=> b!734322 (= e!410870 e!410872)))

(declare-fun b!734323 () Bool)

(assert (=> b!734323 (and (bvsge (index!31774 lt!325453) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325453) (size!20172 lt!325391)))))

(assert (=> b!734323 (= e!410872 (= (select (arr!19751 lt!325391) (index!31774 lt!325453)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734324 () Bool)

(assert (=> b!734324 (= e!410874 (Intermediate!7351 false (toIndex!0 lt!325393 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734325 () Bool)

(assert (=> b!734325 (and (bvsge (index!31774 lt!325453) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325453) (size!20172 lt!325391)))))

(declare-fun res!493387 () Bool)

(assert (=> b!734325 (= res!493387 (= (select (arr!19751 lt!325391) (index!31774 lt!325453)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734325 (=> res!493387 e!410872)))

(declare-fun d!100023 () Bool)

(declare-fun e!410873 () Bool)

(assert (=> d!100023 e!410873))

(declare-fun c!80847 () Bool)

(assert (=> d!100023 (= c!80847 (and (is-Intermediate!7351 lt!325453) (undefined!8163 lt!325453)))))

(assert (=> d!100023 (= lt!325453 e!410871)))

(declare-fun c!80848 () Bool)

(assert (=> d!100023 (= c!80848 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100023 (= lt!325452 (select (arr!19751 lt!325391) (toIndex!0 lt!325393 mask!3328)))))

(assert (=> d!100023 (validMask!0 mask!3328)))

(assert (=> d!100023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325393 mask!3328) lt!325393 lt!325391 mask!3328) lt!325453)))

(declare-fun b!734326 () Bool)

(assert (=> b!734326 (= e!410871 (Intermediate!7351 true (toIndex!0 lt!325393 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734327 () Bool)

(assert (=> b!734327 (= e!410873 e!410870)))

(declare-fun res!493388 () Bool)

(assert (=> b!734327 (= res!493388 (and (is-Intermediate!7351 lt!325453) (not (undefined!8163 lt!325453)) (bvslt (x!62769 lt!325453) #b01111111111111111111111111111110) (bvsge (x!62769 lt!325453) #b00000000000000000000000000000000) (bvsge (x!62769 lt!325453) #b00000000000000000000000000000000)))))

(assert (=> b!734327 (=> (not res!493388) (not e!410870))))

(declare-fun b!734328 () Bool)

(assert (=> b!734328 (= e!410874 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325393 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!325393 lt!325391 mask!3328))))

(declare-fun b!734329 () Bool)

(assert (=> b!734329 (= e!410873 (bvsge (x!62769 lt!325453) #b01111111111111111111111111111110))))

(assert (= (and d!100023 c!80848) b!734326))

(assert (= (and d!100023 (not c!80848)) b!734321))

(assert (= (and b!734321 c!80849) b!734324))

(assert (= (and b!734321 (not c!80849)) b!734328))

(assert (= (and d!100023 c!80847) b!734329))

(assert (= (and d!100023 (not c!80847)) b!734327))

(assert (= (and b!734327 res!493388) b!734322))

(assert (= (and b!734322 (not res!493389)) b!734325))

(assert (= (and b!734325 (not res!493387)) b!734323))

(assert (=> b!734328 m!686861))

(declare-fun m!686961 () Bool)

(assert (=> b!734328 m!686961))

(assert (=> b!734328 m!686961))

(declare-fun m!686963 () Bool)

(assert (=> b!734328 m!686963))

(assert (=> d!100023 m!686861))

(declare-fun m!686965 () Bool)

(assert (=> d!100023 m!686965))

(assert (=> d!100023 m!686881))

(declare-fun m!686967 () Bool)

(assert (=> b!734325 m!686967))

(assert (=> b!734322 m!686967))

(assert (=> b!734323 m!686967))

(assert (=> b!734178 d!100023))

(declare-fun d!100025 () Bool)

(declare-fun lt!325467 () (_ BitVec 32))

(declare-fun lt!325466 () (_ BitVec 32))

(assert (=> d!100025 (= lt!325467 (bvmul (bvxor lt!325466 (bvlshr lt!325466 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100025 (= lt!325466 ((_ extract 31 0) (bvand (bvxor lt!325393 (bvlshr lt!325393 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100025 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493390 (let ((h!14821 ((_ extract 31 0) (bvand (bvxor lt!325393 (bvlshr lt!325393 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62777 (bvmul (bvxor h!14821 (bvlshr h!14821 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62777 (bvlshr x!62777 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493390 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493390 #b00000000000000000000000000000000))))))

(assert (=> d!100025 (= (toIndex!0 lt!325393 mask!3328) (bvand (bvxor lt!325467 (bvlshr lt!325467 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734178 d!100025))

(declare-fun d!100029 () Bool)

(declare-fun lt!325506 () SeekEntryResult!7351)

(assert (=> d!100029 (and (or (is-Undefined!7351 lt!325506) (not (is-Found!7351 lt!325506)) (and (bvsge (index!31773 lt!325506) #b00000000000000000000000000000000) (bvslt (index!31773 lt!325506) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325506) (is-Found!7351 lt!325506) (not (is-MissingZero!7351 lt!325506)) (and (bvsge (index!31772 lt!325506) #b00000000000000000000000000000000) (bvslt (index!31772 lt!325506) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325506) (is-Found!7351 lt!325506) (is-MissingZero!7351 lt!325506) (not (is-MissingVacant!7351 lt!325506)) (and (bvsge (index!31775 lt!325506) #b00000000000000000000000000000000) (bvslt (index!31775 lt!325506) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325506) (ite (is-Found!7351 lt!325506) (= (select (arr!19751 a!3186) (index!31773 lt!325506)) k!2102) (ite (is-MissingZero!7351 lt!325506) (= (select (arr!19751 a!3186) (index!31772 lt!325506)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7351 lt!325506) (= (select (arr!19751 a!3186) (index!31775 lt!325506)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!410940 () SeekEntryResult!7351)

(assert (=> d!100029 (= lt!325506 e!410940)))

(declare-fun c!80900 () Bool)

(declare-fun lt!325505 () SeekEntryResult!7351)

(assert (=> d!100029 (= c!80900 (and (is-Intermediate!7351 lt!325505) (undefined!8163 lt!325505)))))

(assert (=> d!100029 (= lt!325505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100029 (validMask!0 mask!3328)))

(assert (=> d!100029 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!325506)))

(declare-fun b!734447 () Bool)

(declare-fun e!410941 () SeekEntryResult!7351)

(assert (=> b!734447 (= e!410941 (Found!7351 (index!31774 lt!325505)))))

(declare-fun b!734448 () Bool)

(assert (=> b!734448 (= e!410940 Undefined!7351)))

(declare-fun b!734449 () Bool)

(declare-fun c!80899 () Bool)

(declare-fun lt!325504 () (_ BitVec 64))

(assert (=> b!734449 (= c!80899 (= lt!325504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410942 () SeekEntryResult!7351)

(assert (=> b!734449 (= e!410941 e!410942)))

(declare-fun b!734450 () Bool)

(assert (=> b!734450 (= e!410940 e!410941)))

(assert (=> b!734450 (= lt!325504 (select (arr!19751 a!3186) (index!31774 lt!325505)))))

(declare-fun c!80898 () Bool)

(assert (=> b!734450 (= c!80898 (= lt!325504 k!2102))))

(declare-fun b!734451 () Bool)

(assert (=> b!734451 (= e!410942 (MissingZero!7351 (index!31774 lt!325505)))))

(declare-fun b!734452 () Bool)

(assert (=> b!734452 (= e!410942 (seekKeyOrZeroReturnVacant!0 (x!62769 lt!325505) (index!31774 lt!325505) (index!31774 lt!325505) k!2102 a!3186 mask!3328))))

(assert (= (and d!100029 c!80900) b!734448))

(assert (= (and d!100029 (not c!80900)) b!734450))

(assert (= (and b!734450 c!80898) b!734447))

(assert (= (and b!734450 (not c!80898)) b!734449))

(assert (= (and b!734449 c!80899) b!734451))

(assert (= (and b!734449 (not c!80899)) b!734452))

(declare-fun m!687053 () Bool)

(assert (=> d!100029 m!687053))

(declare-fun m!687055 () Bool)

(assert (=> d!100029 m!687055))

(declare-fun m!687057 () Bool)

(assert (=> d!100029 m!687057))

(assert (=> d!100029 m!687055))

(assert (=> d!100029 m!686881))

(declare-fun m!687059 () Bool)

(assert (=> d!100029 m!687059))

(declare-fun m!687061 () Bool)

(assert (=> d!100029 m!687061))

(declare-fun m!687063 () Bool)

(assert (=> b!734450 m!687063))

(declare-fun m!687065 () Bool)

(assert (=> b!734452 m!687065))

(assert (=> b!734167 d!100029))

(declare-fun e!410980 () SeekEntryResult!7351)

(declare-fun b!734507 () Bool)

(assert (=> b!734507 (= e!410980 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734508 () Bool)

(assert (=> b!734508 (= e!410980 (MissingVacant!7351 resIntermediateIndex!5))))

(declare-fun d!100053 () Bool)

(declare-fun lt!325521 () SeekEntryResult!7351)

(assert (=> d!100053 (and (or (is-Undefined!7351 lt!325521) (not (is-Found!7351 lt!325521)) (and (bvsge (index!31773 lt!325521) #b00000000000000000000000000000000) (bvslt (index!31773 lt!325521) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325521) (is-Found!7351 lt!325521) (not (is-MissingVacant!7351 lt!325521)) (not (= (index!31775 lt!325521) resIntermediateIndex!5)) (and (bvsge (index!31775 lt!325521) #b00000000000000000000000000000000) (bvslt (index!31775 lt!325521) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325521) (ite (is-Found!7351 lt!325521) (= (select (arr!19751 a!3186) (index!31773 lt!325521)) (select (arr!19751 a!3186) j!159)) (and (is-MissingVacant!7351 lt!325521) (= (index!31775 lt!325521) resIntermediateIndex!5) (= (select (arr!19751 a!3186) (index!31775 lt!325521)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!410978 () SeekEntryResult!7351)

(assert (=> d!100053 (= lt!325521 e!410978)))

(declare-fun c!80920 () Bool)

(assert (=> d!100053 (= c!80920 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325520 () (_ BitVec 64))

(assert (=> d!100053 (= lt!325520 (select (arr!19751 a!3186) index!1321))))

(assert (=> d!100053 (validMask!0 mask!3328)))

(assert (=> d!100053 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325521)))

(declare-fun b!734509 () Bool)

(assert (=> b!734509 (= e!410978 Undefined!7351)))

(declare-fun b!734510 () Bool)

(declare-fun e!410979 () SeekEntryResult!7351)

(assert (=> b!734510 (= e!410979 (Found!7351 index!1321))))

(declare-fun b!734511 () Bool)

(declare-fun c!80921 () Bool)

(assert (=> b!734511 (= c!80921 (= lt!325520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734511 (= e!410979 e!410980)))

(declare-fun b!734512 () Bool)

(assert (=> b!734512 (= e!410978 e!410979)))

(declare-fun c!80919 () Bool)

(assert (=> b!734512 (= c!80919 (= lt!325520 (select (arr!19751 a!3186) j!159)))))

(assert (= (and d!100053 c!80920) b!734509))

(assert (= (and d!100053 (not c!80920)) b!734512))

(assert (= (and b!734512 c!80919) b!734510))

(assert (= (and b!734512 (not c!80919)) b!734511))

(assert (= (and b!734511 c!80921) b!734508))

(assert (= (and b!734511 (not c!80921)) b!734507))

(assert (=> b!734507 m!686857))

(assert (=> b!734507 m!686857))

(assert (=> b!734507 m!686873))

(declare-fun m!687101 () Bool)

(assert (=> b!734507 m!687101))

(declare-fun m!687103 () Bool)

(assert (=> d!100053 m!687103))

(declare-fun m!687105 () Bool)

(assert (=> d!100053 m!687105))

(declare-fun m!687107 () Bool)

(assert (=> d!100053 m!687107))

(assert (=> d!100053 m!686881))

(assert (=> b!734176 d!100053))

(declare-fun b!734513 () Bool)

(declare-fun e!410982 () SeekEntryResult!7351)

(declare-fun e!410985 () SeekEntryResult!7351)

(assert (=> b!734513 (= e!410982 e!410985)))

(declare-fun c!80924 () Bool)

(declare-fun lt!325522 () (_ BitVec 64))

(assert (=> b!734513 (= c!80924 (or (= lt!325522 (select (arr!19751 a!3186) j!159)) (= (bvadd lt!325522 lt!325522) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734514 () Bool)

(declare-fun lt!325523 () SeekEntryResult!7351)

(assert (=> b!734514 (and (bvsge (index!31774 lt!325523) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325523) (size!20172 a!3186)))))

(declare-fun res!493432 () Bool)

(assert (=> b!734514 (= res!493432 (= (select (arr!19751 a!3186) (index!31774 lt!325523)) (select (arr!19751 a!3186) j!159)))))

(declare-fun e!410983 () Bool)

(assert (=> b!734514 (=> res!493432 e!410983)))

(declare-fun e!410981 () Bool)

(assert (=> b!734514 (= e!410981 e!410983)))

(declare-fun b!734515 () Bool)

(assert (=> b!734515 (and (bvsge (index!31774 lt!325523) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325523) (size!20172 a!3186)))))

(assert (=> b!734515 (= e!410983 (= (select (arr!19751 a!3186) (index!31774 lt!325523)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734516 () Bool)

(assert (=> b!734516 (= e!410985 (Intermediate!7351 false index!1321 x!1131))))

(declare-fun b!734517 () Bool)

(assert (=> b!734517 (and (bvsge (index!31774 lt!325523) #b00000000000000000000000000000000) (bvslt (index!31774 lt!325523) (size!20172 a!3186)))))

(declare-fun res!493430 () Bool)

(assert (=> b!734517 (= res!493430 (= (select (arr!19751 a!3186) (index!31774 lt!325523)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734517 (=> res!493430 e!410983)))

(declare-fun d!100067 () Bool)

(declare-fun e!410984 () Bool)

(assert (=> d!100067 e!410984))

(declare-fun c!80922 () Bool)

(assert (=> d!100067 (= c!80922 (and (is-Intermediate!7351 lt!325523) (undefined!8163 lt!325523)))))

(assert (=> d!100067 (= lt!325523 e!410982)))

(declare-fun c!80923 () Bool)

(assert (=> d!100067 (= c!80923 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100067 (= lt!325522 (select (arr!19751 a!3186) index!1321))))

(assert (=> d!100067 (validMask!0 mask!3328)))

(assert (=> d!100067 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325523)))

(declare-fun b!734518 () Bool)

(assert (=> b!734518 (= e!410982 (Intermediate!7351 true index!1321 x!1131))))

(declare-fun b!734519 () Bool)

(assert (=> b!734519 (= e!410984 e!410981)))

(declare-fun res!493431 () Bool)

(assert (=> b!734519 (= res!493431 (and (is-Intermediate!7351 lt!325523) (not (undefined!8163 lt!325523)) (bvslt (x!62769 lt!325523) #b01111111111111111111111111111110) (bvsge (x!62769 lt!325523) #b00000000000000000000000000000000) (bvsge (x!62769 lt!325523) x!1131)))))

(assert (=> b!734519 (=> (not res!493431) (not e!410981))))

(declare-fun b!734520 () Bool)

(assert (=> b!734520 (= e!410985 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19751 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734521 () Bool)

(assert (=> b!734521 (= e!410984 (bvsge (x!62769 lt!325523) #b01111111111111111111111111111110))))

(assert (= (and d!100067 c!80923) b!734518))

(assert (= (and d!100067 (not c!80923)) b!734513))

(assert (= (and b!734513 c!80924) b!734516))

(assert (= (and b!734513 (not c!80924)) b!734520))

(assert (= (and d!100067 c!80922) b!734521))

(assert (= (and d!100067 (not c!80922)) b!734519))

(assert (= (and b!734519 res!493431) b!734514))

(assert (= (and b!734514 (not res!493432)) b!734517))

(assert (= (and b!734517 (not res!493430)) b!734515))

(assert (=> b!734520 m!686857))

(assert (=> b!734520 m!686857))

(assert (=> b!734520 m!686873))

(declare-fun m!687109 () Bool)

(assert (=> b!734520 m!687109))

(assert (=> d!100067 m!687107))

(assert (=> d!100067 m!686881))

(declare-fun m!687111 () Bool)

(assert (=> b!734517 m!687111))

(assert (=> b!734514 m!687111))

(assert (=> b!734515 m!687111))

(assert (=> b!734165 d!100067))

(declare-fun e!410988 () SeekEntryResult!7351)

(declare-fun b!734522 () Bool)

(assert (=> b!734522 (= e!410988 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734523 () Bool)

(assert (=> b!734523 (= e!410988 (MissingVacant!7351 resIntermediateIndex!5))))

(declare-fun lt!325525 () SeekEntryResult!7351)

(declare-fun d!100069 () Bool)

(assert (=> d!100069 (and (or (is-Undefined!7351 lt!325525) (not (is-Found!7351 lt!325525)) (and (bvsge (index!31773 lt!325525) #b00000000000000000000000000000000) (bvslt (index!31773 lt!325525) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325525) (is-Found!7351 lt!325525) (not (is-MissingVacant!7351 lt!325525)) (not (= (index!31775 lt!325525) resIntermediateIndex!5)) (and (bvsge (index!31775 lt!325525) #b00000000000000000000000000000000) (bvslt (index!31775 lt!325525) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325525) (ite (is-Found!7351 lt!325525) (= (select (arr!19751 a!3186) (index!31773 lt!325525)) (select (arr!19751 a!3186) j!159)) (and (is-MissingVacant!7351 lt!325525) (= (index!31775 lt!325525) resIntermediateIndex!5) (= (select (arr!19751 a!3186) (index!31775 lt!325525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!410986 () SeekEntryResult!7351)

(assert (=> d!100069 (= lt!325525 e!410986)))

(declare-fun c!80926 () Bool)

(assert (=> d!100069 (= c!80926 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!325524 () (_ BitVec 64))

(assert (=> d!100069 (= lt!325524 (select (arr!19751 a!3186) resIntermediateIndex!5))))

(assert (=> d!100069 (validMask!0 mask!3328)))

(assert (=> d!100069 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) lt!325525)))

(declare-fun b!734524 () Bool)

(assert (=> b!734524 (= e!410986 Undefined!7351)))

(declare-fun b!734525 () Bool)

(declare-fun e!410987 () SeekEntryResult!7351)

(assert (=> b!734525 (= e!410987 (Found!7351 resIntermediateIndex!5))))

(declare-fun b!734526 () Bool)

(declare-fun c!80927 () Bool)

(assert (=> b!734526 (= c!80927 (= lt!325524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734526 (= e!410987 e!410988)))

(declare-fun b!734527 () Bool)

(assert (=> b!734527 (= e!410986 e!410987)))

(declare-fun c!80925 () Bool)

(assert (=> b!734527 (= c!80925 (= lt!325524 (select (arr!19751 a!3186) j!159)))))

(assert (= (and d!100069 c!80926) b!734524))

(assert (= (and d!100069 (not c!80926)) b!734527))

(assert (= (and b!734527 c!80925) b!734525))

(assert (= (and b!734527 (not c!80925)) b!734526))

(assert (= (and b!734526 c!80927) b!734523))

(assert (= (and b!734526 (not c!80927)) b!734522))

(declare-fun m!687113 () Bool)

(assert (=> b!734522 m!687113))

(assert (=> b!734522 m!687113))

(assert (=> b!734522 m!686873))

(declare-fun m!687115 () Bool)

(assert (=> b!734522 m!687115))

(declare-fun m!687117 () Bool)

(assert (=> d!100069 m!687117))

(declare-fun m!687119 () Bool)

(assert (=> d!100069 m!687119))

(assert (=> d!100069 m!686879))

(assert (=> d!100069 m!686881))

(assert (=> b!734166 d!100069))

(declare-fun b!734544 () Bool)

(declare-fun e!411004 () Bool)

(declare-fun e!411006 () Bool)

(assert (=> b!734544 (= e!411004 e!411006)))

(declare-fun res!493445 () Bool)

(assert (=> b!734544 (=> (not res!493445) (not e!411006))))

(declare-fun e!411005 () Bool)

(assert (=> b!734544 (= res!493445 (not e!411005))))

(declare-fun res!493446 () Bool)

(assert (=> b!734544 (=> (not res!493446) (not e!411005))))

(assert (=> b!734544 (= res!493446 (validKeyInArray!0 (select (arr!19751 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734545 () Bool)

(declare-fun e!411003 () Bool)

(declare-fun call!34903 () Bool)

(assert (=> b!734545 (= e!411003 call!34903)))

(declare-fun d!100071 () Bool)

(declare-fun res!493447 () Bool)

(assert (=> d!100071 (=> res!493447 e!411004)))

(assert (=> d!100071 (= res!493447 (bvsge #b00000000000000000000000000000000 (size!20172 a!3186)))))

(assert (=> d!100071 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13750) e!411004)))

(declare-fun b!734546 () Bool)

(assert (=> b!734546 (= e!411003 call!34903)))

(declare-fun b!734547 () Bool)

(declare-fun contains!4062 (List!13753 (_ BitVec 64)) Bool)

(assert (=> b!734547 (= e!411005 (contains!4062 Nil!13750 (select (arr!19751 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734548 () Bool)

(assert (=> b!734548 (= e!411006 e!411003)))

(declare-fun c!80930 () Bool)

(assert (=> b!734548 (= c!80930 (validKeyInArray!0 (select (arr!19751 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34900 () Bool)

(assert (=> bm!34900 (= call!34903 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80930 (Cons!13749 (select (arr!19751 a!3186) #b00000000000000000000000000000000) Nil!13750) Nil!13750)))))

(assert (= (and d!100071 (not res!493447)) b!734544))

(assert (= (and b!734544 res!493446) b!734547))

(assert (= (and b!734544 res!493445) b!734548))

(assert (= (and b!734548 c!80930) b!734546))

(assert (= (and b!734548 (not c!80930)) b!734545))

(assert (= (or b!734546 b!734545) bm!34900))

(declare-fun m!687123 () Bool)

(assert (=> b!734544 m!687123))

(assert (=> b!734544 m!687123))

(declare-fun m!687125 () Bool)

(assert (=> b!734544 m!687125))

(assert (=> b!734547 m!687123))

(assert (=> b!734547 m!687123))

(declare-fun m!687127 () Bool)

(assert (=> b!734547 m!687127))

(assert (=> b!734548 m!687123))

(assert (=> b!734548 m!687123))

(assert (=> b!734548 m!687125))

(assert (=> bm!34900 m!687123))

(declare-fun m!687129 () Bool)

(assert (=> bm!34900 m!687129))

(assert (=> b!734175 d!100071))

(assert (=> b!734173 d!100053))

(declare-fun bm!34906 () Bool)

(declare-fun call!34909 () Bool)

(assert (=> bm!34906 (= call!34909 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!734569 () Bool)

(declare-fun e!411023 () Bool)

(assert (=> b!734569 (= e!411023 call!34909)))

(declare-fun b!734570 () Bool)

(declare-fun e!411024 () Bool)

(assert (=> b!734570 (= e!411024 e!411023)))

(declare-fun c!80936 () Bool)

(assert (=> b!734570 (= c!80936 (validKeyInArray!0 (select (arr!19751 a!3186) j!159)))))

(declare-fun d!100079 () Bool)

(declare-fun res!493458 () Bool)

(assert (=> d!100079 (=> res!493458 e!411024)))

(assert (=> d!100079 (= res!493458 (bvsge j!159 (size!20172 a!3186)))))

(assert (=> d!100079 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!411024)))

(declare-fun b!734571 () Bool)

(declare-fun e!411022 () Bool)

(assert (=> b!734571 (= e!411023 e!411022)))

(declare-fun lt!325543 () (_ BitVec 64))

(assert (=> b!734571 (= lt!325543 (select (arr!19751 a!3186) j!159))))

(declare-fun lt!325541 () Unit!25020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41272 (_ BitVec 64) (_ BitVec 32)) Unit!25020)

(assert (=> b!734571 (= lt!325541 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325543 j!159))))

(assert (=> b!734571 (arrayContainsKey!0 a!3186 lt!325543 #b00000000000000000000000000000000)))

(declare-fun lt!325542 () Unit!25020)

(assert (=> b!734571 (= lt!325542 lt!325541)))

(declare-fun res!493459 () Bool)

(assert (=> b!734571 (= res!493459 (= (seekEntryOrOpen!0 (select (arr!19751 a!3186) j!159) a!3186 mask!3328) (Found!7351 j!159)))))

(assert (=> b!734571 (=> (not res!493459) (not e!411022))))

(declare-fun b!734572 () Bool)

(assert (=> b!734572 (= e!411022 call!34909)))

(assert (= (and d!100079 (not res!493458)) b!734570))

(assert (= (and b!734570 c!80936) b!734571))

(assert (= (and b!734570 (not c!80936)) b!734569))

(assert (= (and b!734571 res!493459) b!734572))

(assert (= (or b!734572 b!734569) bm!34906))

(declare-fun m!687137 () Bool)

(assert (=> bm!34906 m!687137))

(assert (=> b!734570 m!686873))

(assert (=> b!734570 m!686873))

(assert (=> b!734570 m!686899))

(assert (=> b!734571 m!686873))

(declare-fun m!687139 () Bool)

(assert (=> b!734571 m!687139))

(declare-fun m!687141 () Bool)

(assert (=> b!734571 m!687141))

(assert (=> b!734571 m!686873))

(assert (=> b!734571 m!686887))

(assert (=> b!734172 d!100079))

(declare-fun d!100083 () Bool)

(assert (=> d!100083 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325552 () Unit!25020)

(declare-fun choose!38 (array!41272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25020)

(assert (=> d!100083 (= lt!325552 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100083 (validMask!0 mask!3328)))

(assert (=> d!100083 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325552)))

(declare-fun bs!20983 () Bool)

(assert (= bs!20983 d!100083))

(assert (=> bs!20983 m!686901))

(declare-fun m!687153 () Bool)

(assert (=> bs!20983 m!687153))

(assert (=> bs!20983 m!686881))

(assert (=> b!734172 d!100083))

(declare-fun d!100091 () Bool)

(declare-fun res!493466 () Bool)

(declare-fun e!411032 () Bool)

(assert (=> d!100091 (=> res!493466 e!411032)))

(assert (=> d!100091 (= res!493466 (= (select (arr!19751 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100091 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!411032)))

(declare-fun b!734581 () Bool)

(declare-fun e!411033 () Bool)

(assert (=> b!734581 (= e!411032 e!411033)))

(declare-fun res!493467 () Bool)

(assert (=> b!734581 (=> (not res!493467) (not e!411033))))

(assert (=> b!734581 (= res!493467 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20172 a!3186)))))

(declare-fun b!734582 () Bool)

(assert (=> b!734582 (= e!411033 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100091 (not res!493466)) b!734581))

(assert (= (and b!734581 res!493467) b!734582))

(assert (=> d!100091 m!687123))

(declare-fun m!687157 () Bool)

(assert (=> b!734582 m!687157))

(assert (=> b!734183 d!100091))

(declare-fun d!100093 () Bool)

(declare-fun lt!325558 () SeekEntryResult!7351)

(assert (=> d!100093 (and (or (is-Undefined!7351 lt!325558) (not (is-Found!7351 lt!325558)) (and (bvsge (index!31773 lt!325558) #b00000000000000000000000000000000) (bvslt (index!31773 lt!325558) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325558) (is-Found!7351 lt!325558) (not (is-MissingZero!7351 lt!325558)) (and (bvsge (index!31772 lt!325558) #b00000000000000000000000000000000) (bvslt (index!31772 lt!325558) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325558) (is-Found!7351 lt!325558) (is-MissingZero!7351 lt!325558) (not (is-MissingVacant!7351 lt!325558)) (and (bvsge (index!31775 lt!325558) #b00000000000000000000000000000000) (bvslt (index!31775 lt!325558) (size!20172 a!3186)))) (or (is-Undefined!7351 lt!325558) (ite (is-Found!7351 lt!325558) (= (select (arr!19751 a!3186) (index!31773 lt!325558)) (select (arr!19751 a!3186) j!159)) (ite (is-MissingZero!7351 lt!325558) (= (select (arr!19751 a!3186) (index!31772 lt!325558)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7351 lt!325558) (= (select (arr!19751 a!3186) (index!31775 lt!325558)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

