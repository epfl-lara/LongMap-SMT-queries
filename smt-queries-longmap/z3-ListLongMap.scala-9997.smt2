; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118202 () Bool)

(assert start!118202)

(declare-fun b!1383392 () Bool)

(declare-fun res!924233 () Bool)

(declare-fun e!784225 () Bool)

(assert (=> b!1383392 (=> (not res!924233) (not e!784225))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94489 0))(
  ( (array!94490 (arr!45625 (Array (_ BitVec 32) (_ BitVec 64))) (size!46176 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94489)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383392 (= res!924233 (and (= (size!46176 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46176 a!2971))))))

(declare-fun res!924231 () Bool)

(assert (=> start!118202 (=> (not res!924231) (not e!784225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118202 (= res!924231 (validMask!0 mask!3034))))

(assert (=> start!118202 e!784225))

(assert (=> start!118202 true))

(declare-fun array_inv!34906 (array!94489) Bool)

(assert (=> start!118202 (array_inv!34906 a!2971)))

(declare-fun b!1383393 () Bool)

(declare-fun res!924232 () Bool)

(assert (=> b!1383393 (=> (not res!924232) (not e!784225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383393 (= res!924232 (validKeyInArray!0 (select (arr!45625 a!2971) i!1094)))))

(declare-fun b!1383394 () Bool)

(declare-fun res!924234 () Bool)

(assert (=> b!1383394 (=> (not res!924234) (not e!784225))))

(declare-datatypes ((List!32146 0))(
  ( (Nil!32143) (Cons!32142 (h!33360 (_ BitVec 64)) (t!46832 List!32146)) )
))
(declare-fun arrayNoDuplicates!0 (array!94489 (_ BitVec 32) List!32146) Bool)

(assert (=> b!1383394 (= res!924234 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32143))))

(declare-fun b!1383395 () Bool)

(assert (=> b!1383395 (= e!784225 (or (= (select (arr!45625 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45625 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1383396 () Bool)

(declare-fun res!924235 () Bool)

(assert (=> b!1383396 (=> (not res!924235) (not e!784225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94489 (_ BitVec 32)) Bool)

(assert (=> b!1383396 (= res!924235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118202 res!924231) b!1383392))

(assert (= (and b!1383392 res!924233) b!1383393))

(assert (= (and b!1383393 res!924232) b!1383394))

(assert (= (and b!1383394 res!924234) b!1383396))

(assert (= (and b!1383396 res!924235) b!1383395))

(declare-fun m!1268895 () Bool)

(assert (=> b!1383396 m!1268895))

(declare-fun m!1268897 () Bool)

(assert (=> b!1383395 m!1268897))

(declare-fun m!1268899 () Bool)

(assert (=> b!1383394 m!1268899))

(assert (=> b!1383393 m!1268897))

(assert (=> b!1383393 m!1268897))

(declare-fun m!1268901 () Bool)

(assert (=> b!1383393 m!1268901))

(declare-fun m!1268903 () Bool)

(assert (=> start!118202 m!1268903))

(declare-fun m!1268905 () Bool)

(assert (=> start!118202 m!1268905))

(check-sat (not b!1383394) (not b!1383396) (not start!118202) (not b!1383393))
(check-sat)
(get-model)

(declare-fun b!1383438 () Bool)

(declare-fun e!784248 () Bool)

(declare-fun call!66587 () Bool)

(assert (=> b!1383438 (= e!784248 call!66587)))

(declare-fun b!1383439 () Bool)

(declare-fun e!784246 () Bool)

(declare-fun contains!9779 (List!32146 (_ BitVec 64)) Bool)

(assert (=> b!1383439 (= e!784246 (contains!9779 Nil!32143 (select (arr!45625 a!2971) #b00000000000000000000000000000000)))))

(declare-fun bm!66584 () Bool)

(declare-fun c!129030 () Bool)

(assert (=> bm!66584 (= call!66587 (arrayNoDuplicates!0 a!2971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129030 (Cons!32142 (select (arr!45625 a!2971) #b00000000000000000000000000000000) Nil!32143) Nil!32143)))))

(declare-fun d!149583 () Bool)

(declare-fun res!924273 () Bool)

(declare-fun e!784247 () Bool)

(assert (=> d!149583 (=> res!924273 e!784247)))

(assert (=> d!149583 (= res!924273 (bvsge #b00000000000000000000000000000000 (size!46176 a!2971)))))

(assert (=> d!149583 (= (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32143) e!784247)))

(declare-fun b!1383437 () Bool)

(assert (=> b!1383437 (= e!784248 call!66587)))

(declare-fun b!1383440 () Bool)

(declare-fun e!784249 () Bool)

(assert (=> b!1383440 (= e!784247 e!784249)))

(declare-fun res!924274 () Bool)

(assert (=> b!1383440 (=> (not res!924274) (not e!784249))))

(assert (=> b!1383440 (= res!924274 (not e!784246))))

(declare-fun res!924272 () Bool)

(assert (=> b!1383440 (=> (not res!924272) (not e!784246))))

(assert (=> b!1383440 (= res!924272 (validKeyInArray!0 (select (arr!45625 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1383441 () Bool)

(assert (=> b!1383441 (= e!784249 e!784248)))

(assert (=> b!1383441 (= c!129030 (validKeyInArray!0 (select (arr!45625 a!2971) #b00000000000000000000000000000000)))))

(assert (= (and d!149583 (not res!924273)) b!1383440))

(assert (= (and b!1383440 res!924272) b!1383439))

(assert (= (and b!1383440 res!924274) b!1383441))

(assert (= (and b!1383441 c!129030) b!1383438))

(assert (= (and b!1383441 (not c!129030)) b!1383437))

(assert (= (or b!1383438 b!1383437) bm!66584))

(declare-fun m!1268931 () Bool)

(assert (=> b!1383439 m!1268931))

(assert (=> b!1383439 m!1268931))

(declare-fun m!1268933 () Bool)

(assert (=> b!1383439 m!1268933))

(assert (=> bm!66584 m!1268931))

(declare-fun m!1268935 () Bool)

(assert (=> bm!66584 m!1268935))

(assert (=> b!1383440 m!1268931))

(assert (=> b!1383440 m!1268931))

(declare-fun m!1268937 () Bool)

(assert (=> b!1383440 m!1268937))

(assert (=> b!1383441 m!1268931))

(assert (=> b!1383441 m!1268931))

(assert (=> b!1383441 m!1268937))

(assert (=> b!1383394 d!149583))

(declare-fun d!149591 () Bool)

(declare-fun res!924289 () Bool)

(declare-fun e!784270 () Bool)

(assert (=> d!149591 (=> res!924289 e!784270)))

(assert (=> d!149591 (= res!924289 (bvsge #b00000000000000000000000000000000 (size!46176 a!2971)))))

(assert (=> d!149591 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034) e!784270)))

(declare-fun b!1383465 () Bool)

(declare-fun e!784269 () Bool)

(assert (=> b!1383465 (= e!784270 e!784269)))

(declare-fun c!129036 () Bool)

(assert (=> b!1383465 (= c!129036 (validKeyInArray!0 (select (arr!45625 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1383466 () Bool)

(declare-fun e!784268 () Bool)

(declare-fun call!66593 () Bool)

(assert (=> b!1383466 (= e!784268 call!66593)))

(declare-fun b!1383467 () Bool)

(assert (=> b!1383467 (= e!784269 call!66593)))

(declare-fun bm!66590 () Bool)

(assert (=> bm!66590 (= call!66593 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2971 mask!3034))))

(declare-fun b!1383468 () Bool)

(assert (=> b!1383468 (= e!784269 e!784268)))

(declare-fun lt!608829 () (_ BitVec 64))

(assert (=> b!1383468 (= lt!608829 (select (arr!45625 a!2971) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!45988 0))(
  ( (Unit!45989) )
))
(declare-fun lt!608827 () Unit!45988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94489 (_ BitVec 64) (_ BitVec 32)) Unit!45988)

(assert (=> b!1383468 (= lt!608827 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2971 lt!608829 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1383468 (arrayContainsKey!0 a!2971 lt!608829 #b00000000000000000000000000000000)))

(declare-fun lt!608828 () Unit!45988)

(assert (=> b!1383468 (= lt!608828 lt!608827)))

(declare-fun res!924288 () Bool)

(declare-datatypes ((SeekEntryResult!10017 0))(
  ( (MissingZero!10017 (index!42439 (_ BitVec 32))) (Found!10017 (index!42440 (_ BitVec 32))) (Intermediate!10017 (undefined!10829 Bool) (index!42441 (_ BitVec 32)) (x!123856 (_ BitVec 32))) (Undefined!10017) (MissingVacant!10017 (index!42442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94489 (_ BitVec 32)) SeekEntryResult!10017)

(assert (=> b!1383468 (= res!924288 (= (seekEntryOrOpen!0 (select (arr!45625 a!2971) #b00000000000000000000000000000000) a!2971 mask!3034) (Found!10017 #b00000000000000000000000000000000)))))

(assert (=> b!1383468 (=> (not res!924288) (not e!784268))))

(assert (= (and d!149591 (not res!924289)) b!1383465))

(assert (= (and b!1383465 c!129036) b!1383468))

(assert (= (and b!1383465 (not c!129036)) b!1383467))

(assert (= (and b!1383468 res!924288) b!1383466))

(assert (= (or b!1383466 b!1383467) bm!66590))

(assert (=> b!1383465 m!1268931))

(assert (=> b!1383465 m!1268931))

(assert (=> b!1383465 m!1268937))

(declare-fun m!1268947 () Bool)

(assert (=> bm!66590 m!1268947))

(assert (=> b!1383468 m!1268931))

(declare-fun m!1268949 () Bool)

(assert (=> b!1383468 m!1268949))

(declare-fun m!1268951 () Bool)

(assert (=> b!1383468 m!1268951))

(assert (=> b!1383468 m!1268931))

(declare-fun m!1268953 () Bool)

(assert (=> b!1383468 m!1268953))

(assert (=> b!1383396 d!149591))

(declare-fun d!149601 () Bool)

(assert (=> d!149601 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!118202 d!149601))

(declare-fun d!149609 () Bool)

(assert (=> d!149609 (= (array_inv!34906 a!2971) (bvsge (size!46176 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!118202 d!149609))

(declare-fun d!149611 () Bool)

(assert (=> d!149611 (= (validKeyInArray!0 (select (arr!45625 a!2971) i!1094)) (and (not (= (select (arr!45625 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45625 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1383393 d!149611))

(check-sat (not b!1383441) (not b!1383468) (not bm!66590) (not b!1383440) (not b!1383465) (not b!1383439) (not bm!66584))
(check-sat)
