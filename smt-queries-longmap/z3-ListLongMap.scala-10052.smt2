; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118412 () Bool)

(assert start!118412)

(declare-fun b!1385100 () Bool)

(declare-fun res!926428 () Bool)

(declare-fun e!784810 () Bool)

(assert (=> b!1385100 (=> (not res!926428) (not e!784810))))

(declare-datatypes ((array!94668 0))(
  ( (array!94669 (arr!45712 (Array (_ BitVec 32) (_ BitVec 64))) (size!46264 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94668)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385100 (= res!926428 (validKeyInArray!0 (select (arr!45712 a!2938) i!1065)))))

(declare-fun b!1385101 () Bool)

(declare-fun res!926432 () Bool)

(assert (=> b!1385101 (=> (not res!926432) (not e!784810))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385101 (= res!926432 (and (= (size!46264 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46264 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46264 a!2938))))))

(declare-fun b!1385102 () Bool)

(declare-fun res!926430 () Bool)

(assert (=> b!1385102 (=> (not res!926430) (not e!784810))))

(declare-datatypes ((List!32318 0))(
  ( (Nil!32315) (Cons!32314 (h!33523 (_ BitVec 64)) (t!47004 List!32318)) )
))
(declare-fun arrayNoDuplicates!0 (array!94668 (_ BitVec 32) List!32318) Bool)

(assert (=> b!1385102 (= res!926430 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32315))))

(declare-fun b!1385103 () Bool)

(declare-fun res!926431 () Bool)

(assert (=> b!1385103 (=> (not res!926431) (not e!784810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94668 (_ BitVec 32)) Bool)

(assert (=> b!1385103 (= res!926431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385099 () Bool)

(assert (=> b!1385099 (= e!784810 (or (= (select (arr!45712 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45712 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!926429 () Bool)

(assert (=> start!118412 (=> (not res!926429) (not e!784810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118412 (= res!926429 (validMask!0 mask!2987))))

(assert (=> start!118412 e!784810))

(assert (=> start!118412 true))

(declare-fun array_inv!34945 (array!94668) Bool)

(assert (=> start!118412 (array_inv!34945 a!2938)))

(assert (= (and start!118412 res!926429) b!1385101))

(assert (= (and b!1385101 res!926432) b!1385100))

(assert (= (and b!1385100 res!926428) b!1385102))

(assert (= (and b!1385102 res!926430) b!1385103))

(assert (= (and b!1385103 res!926431) b!1385099))

(declare-fun m!1270005 () Bool)

(assert (=> b!1385100 m!1270005))

(assert (=> b!1385100 m!1270005))

(declare-fun m!1270007 () Bool)

(assert (=> b!1385100 m!1270007))

(declare-fun m!1270009 () Bool)

(assert (=> start!118412 m!1270009))

(declare-fun m!1270011 () Bool)

(assert (=> start!118412 m!1270011))

(assert (=> b!1385099 m!1270005))

(declare-fun m!1270013 () Bool)

(assert (=> b!1385102 m!1270013))

(declare-fun m!1270015 () Bool)

(assert (=> b!1385103 m!1270015))

(check-sat (not start!118412) (not b!1385100) (not b!1385103) (not b!1385102))
(check-sat)
(get-model)

(declare-fun d!149237 () Bool)

(assert (=> d!149237 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118412 d!149237))

(declare-fun d!149245 () Bool)

(assert (=> d!149245 (= (array_inv!34945 a!2938) (bvsge (size!46264 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118412 d!149245))

(declare-fun d!149247 () Bool)

(assert (=> d!149247 (= (validKeyInArray!0 (select (arr!45712 a!2938) i!1065)) (and (not (= (select (arr!45712 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45712 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1385100 d!149247))

(declare-fun b!1385166 () Bool)

(declare-fun e!784849 () Bool)

(declare-fun call!66525 () Bool)

(assert (=> b!1385166 (= e!784849 call!66525)))

(declare-fun b!1385167 () Bool)

(declare-fun e!784848 () Bool)

(declare-fun e!784847 () Bool)

(assert (=> b!1385167 (= e!784848 e!784847)))

(declare-fun c!128786 () Bool)

(assert (=> b!1385167 (= c!128786 (validKeyInArray!0 (select (arr!45712 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385168 () Bool)

(assert (=> b!1385168 (= e!784847 e!784849)))

(declare-fun lt!609031 () (_ BitVec 64))

(assert (=> b!1385168 (= lt!609031 (select (arr!45712 a!2938) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46089 0))(
  ( (Unit!46090) )
))
(declare-fun lt!609032 () Unit!46089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94668 (_ BitVec 64) (_ BitVec 32)) Unit!46089)

(assert (=> b!1385168 (= lt!609032 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609031 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1385168 (arrayContainsKey!0 a!2938 lt!609031 #b00000000000000000000000000000000)))

(declare-fun lt!609030 () Unit!46089)

(assert (=> b!1385168 (= lt!609030 lt!609032)))

(declare-fun res!926479 () Bool)

(declare-datatypes ((SeekEntryResult!10129 0))(
  ( (MissingZero!10129 (index!42887 (_ BitVec 32))) (Found!10129 (index!42888 (_ BitVec 32))) (Intermediate!10129 (undefined!10941 Bool) (index!42889 (_ BitVec 32)) (x!124383 (_ BitVec 32))) (Undefined!10129) (MissingVacant!10129 (index!42890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94668 (_ BitVec 32)) SeekEntryResult!10129)

(assert (=> b!1385168 (= res!926479 (= (seekEntryOrOpen!0 (select (arr!45712 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10129 #b00000000000000000000000000000000)))))

(assert (=> b!1385168 (=> (not res!926479) (not e!784849))))

(declare-fun bm!66522 () Bool)

(assert (=> bm!66522 (= call!66525 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1385169 () Bool)

(assert (=> b!1385169 (= e!784847 call!66525)))

(declare-fun d!149249 () Bool)

(declare-fun res!926480 () Bool)

(assert (=> d!149249 (=> res!926480 e!784848)))

(assert (=> d!149249 (= res!926480 (bvsge #b00000000000000000000000000000000 (size!46264 a!2938)))))

(assert (=> d!149249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!784848)))

(assert (= (and d!149249 (not res!926480)) b!1385167))

(assert (= (and b!1385167 c!128786) b!1385168))

(assert (= (and b!1385167 (not c!128786)) b!1385169))

(assert (= (and b!1385168 res!926479) b!1385166))

(assert (= (or b!1385166 b!1385169) bm!66522))

(declare-fun m!1270065 () Bool)

(assert (=> b!1385167 m!1270065))

(assert (=> b!1385167 m!1270065))

(declare-fun m!1270067 () Bool)

(assert (=> b!1385167 m!1270067))

(assert (=> b!1385168 m!1270065))

(declare-fun m!1270069 () Bool)

(assert (=> b!1385168 m!1270069))

(declare-fun m!1270071 () Bool)

(assert (=> b!1385168 m!1270071))

(assert (=> b!1385168 m!1270065))

(declare-fun m!1270073 () Bool)

(assert (=> b!1385168 m!1270073))

(declare-fun m!1270075 () Bool)

(assert (=> bm!66522 m!1270075))

(assert (=> b!1385103 d!149249))

(declare-fun d!149257 () Bool)

(declare-fun res!926488 () Bool)

(declare-fun e!784858 () Bool)

(assert (=> d!149257 (=> res!926488 e!784858)))

(assert (=> d!149257 (= res!926488 (bvsge #b00000000000000000000000000000000 (size!46264 a!2938)))))

(assert (=> d!149257 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32315) e!784858)))

(declare-fun b!1385180 () Bool)

(declare-fun e!784859 () Bool)

(assert (=> b!1385180 (= e!784858 e!784859)))

(declare-fun res!926489 () Bool)

(assert (=> b!1385180 (=> (not res!926489) (not e!784859))))

(declare-fun e!784861 () Bool)

(assert (=> b!1385180 (= res!926489 (not e!784861))))

(declare-fun res!926487 () Bool)

(assert (=> b!1385180 (=> (not res!926487) (not e!784861))))

(assert (=> b!1385180 (= res!926487 (validKeyInArray!0 (select (arr!45712 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385181 () Bool)

(declare-fun e!784860 () Bool)

(declare-fun call!66528 () Bool)

(assert (=> b!1385181 (= e!784860 call!66528)))

(declare-fun bm!66525 () Bool)

(declare-fun c!128789 () Bool)

(assert (=> bm!66525 (= call!66528 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128789 (Cons!32314 (select (arr!45712 a!2938) #b00000000000000000000000000000000) Nil!32315) Nil!32315)))))

(declare-fun b!1385182 () Bool)

(assert (=> b!1385182 (= e!784859 e!784860)))

(assert (=> b!1385182 (= c!128789 (validKeyInArray!0 (select (arr!45712 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385183 () Bool)

(assert (=> b!1385183 (= e!784860 call!66528)))

(declare-fun b!1385184 () Bool)

(declare-fun contains!9705 (List!32318 (_ BitVec 64)) Bool)

(assert (=> b!1385184 (= e!784861 (contains!9705 Nil!32315 (select (arr!45712 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149257 (not res!926488)) b!1385180))

(assert (= (and b!1385180 res!926487) b!1385184))

(assert (= (and b!1385180 res!926489) b!1385182))

(assert (= (and b!1385182 c!128789) b!1385181))

(assert (= (and b!1385182 (not c!128789)) b!1385183))

(assert (= (or b!1385181 b!1385183) bm!66525))

(assert (=> b!1385180 m!1270065))

(assert (=> b!1385180 m!1270065))

(assert (=> b!1385180 m!1270067))

(assert (=> bm!66525 m!1270065))

(declare-fun m!1270077 () Bool)

(assert (=> bm!66525 m!1270077))

(assert (=> b!1385182 m!1270065))

(assert (=> b!1385182 m!1270065))

(assert (=> b!1385182 m!1270067))

(assert (=> b!1385184 m!1270065))

(assert (=> b!1385184 m!1270065))

(declare-fun m!1270079 () Bool)

(assert (=> b!1385184 m!1270079))

(assert (=> b!1385102 d!149257))

(check-sat (not b!1385184) (not bm!66525) (not bm!66522) (not b!1385180) (not b!1385167) (not b!1385182) (not b!1385168))
(check-sat)
