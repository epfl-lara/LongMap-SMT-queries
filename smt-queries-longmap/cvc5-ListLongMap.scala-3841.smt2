; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52796 () Bool)

(assert start!52796)

(declare-fun b!575801 () Bool)

(declare-fun e!331308 () Bool)

(declare-fun e!331309 () Bool)

(assert (=> b!575801 (= e!331308 e!331309)))

(declare-fun res!364220 () Bool)

(assert (=> b!575801 (=> (not res!364220) (not e!331309))))

(declare-datatypes ((SeekEntryResult!5702 0))(
  ( (MissingZero!5702 (index!25035 (_ BitVec 32))) (Found!5702 (index!25036 (_ BitVec 32))) (Intermediate!5702 (undefined!6514 Bool) (index!25037 (_ BitVec 32)) (x!53927 (_ BitVec 32))) (Undefined!5702) (MissingVacant!5702 (index!25038 (_ BitVec 32))) )
))
(declare-fun lt!263439 () SeekEntryResult!5702)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575801 (= res!364220 (or (= lt!263439 (MissingZero!5702 i!1132)) (= lt!263439 (MissingVacant!5702 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35941 0))(
  ( (array!35942 (arr!17253 (Array (_ BitVec 32) (_ BitVec 64))) (size!17617 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35941)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35941 (_ BitVec 32)) SeekEntryResult!5702)

(assert (=> b!575801 (= lt!263439 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!364224 () Bool)

(assert (=> start!52796 (=> (not res!364224) (not e!331308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52796 (= res!364224 (validMask!0 mask!3119))))

(assert (=> start!52796 e!331308))

(assert (=> start!52796 true))

(declare-fun array_inv!13049 (array!35941) Bool)

(assert (=> start!52796 (array_inv!13049 a!3118)))

(declare-fun b!575802 () Bool)

(declare-fun res!364225 () Bool)

(assert (=> b!575802 (=> (not res!364225) (not e!331309))))

(declare-datatypes ((List!11333 0))(
  ( (Nil!11330) (Cons!11329 (h!12368 (_ BitVec 64)) (t!17561 List!11333)) )
))
(declare-fun arrayNoDuplicates!0 (array!35941 (_ BitVec 32) List!11333) Bool)

(assert (=> b!575802 (= res!364225 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11330))))

(declare-fun b!575803 () Bool)

(declare-fun e!331310 () Bool)

(assert (=> b!575803 (= e!331309 e!331310)))

(declare-fun res!364226 () Bool)

(assert (=> b!575803 (=> (not res!364226) (not e!331310))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!263435 () (_ BitVec 32))

(declare-fun lt!263440 () SeekEntryResult!5702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35941 (_ BitVec 32)) SeekEntryResult!5702)

(assert (=> b!575803 (= res!364226 (= lt!263440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263435 (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118)) mask!3119)))))

(declare-fun lt!263438 () (_ BitVec 32))

(assert (=> b!575803 (= lt!263440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263438 (select (arr!17253 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575803 (= lt!263435 (toIndex!0 (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!575803 (= lt!263438 (toIndex!0 (select (arr!17253 a!3118) j!142) mask!3119))))

(declare-fun b!575804 () Bool)

(declare-fun res!364222 () Bool)

(assert (=> b!575804 (=> (not res!364222) (not e!331309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35941 (_ BitVec 32)) Bool)

(assert (=> b!575804 (= res!364222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575805 () Bool)

(declare-fun res!364219 () Bool)

(assert (=> b!575805 (=> (not res!364219) (not e!331308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575805 (= res!364219 (validKeyInArray!0 k!1914))))

(declare-fun e!331307 () Bool)

(declare-fun b!575806 () Bool)

(assert (=> b!575806 (= e!331307 (= (seekEntryOrOpen!0 (select (arr!17253 a!3118) j!142) a!3118 mask!3119) (Found!5702 j!142)))))

(declare-fun b!575807 () Bool)

(declare-fun res!364223 () Bool)

(assert (=> b!575807 (=> (not res!364223) (not e!331308))))

(assert (=> b!575807 (= res!364223 (and (= (size!17617 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17617 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17617 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575808 () Bool)

(declare-fun res!364217 () Bool)

(assert (=> b!575808 (=> (not res!364217) (not e!331308))))

(assert (=> b!575808 (= res!364217 (validKeyInArray!0 (select (arr!17253 a!3118) j!142)))))

(declare-fun b!575809 () Bool)

(declare-fun res!364221 () Bool)

(assert (=> b!575809 (=> (not res!364221) (not e!331308))))

(declare-fun arrayContainsKey!0 (array!35941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575809 (= res!364221 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575810 () Bool)

(declare-fun lt!263437 () Bool)

(assert (=> b!575810 (= e!331310 (not (or (and (not lt!263437) (undefined!6514 lt!263440)) (and (not lt!263437) (not (undefined!6514 lt!263440))))))))

(assert (=> b!575810 (= lt!263437 (not (is-Intermediate!5702 lt!263440)))))

(assert (=> b!575810 e!331307))

(declare-fun res!364218 () Bool)

(assert (=> b!575810 (=> (not res!364218) (not e!331307))))

(assert (=> b!575810 (= res!364218 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18106 0))(
  ( (Unit!18107) )
))
(declare-fun lt!263436 () Unit!18106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18106)

(assert (=> b!575810 (= lt!263436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52796 res!364224) b!575807))

(assert (= (and b!575807 res!364223) b!575808))

(assert (= (and b!575808 res!364217) b!575805))

(assert (= (and b!575805 res!364219) b!575809))

(assert (= (and b!575809 res!364221) b!575801))

(assert (= (and b!575801 res!364220) b!575804))

(assert (= (and b!575804 res!364222) b!575802))

(assert (= (and b!575802 res!364225) b!575803))

(assert (= (and b!575803 res!364226) b!575810))

(assert (= (and b!575810 res!364218) b!575806))

(declare-fun m!554781 () Bool)

(assert (=> b!575804 m!554781))

(declare-fun m!554783 () Bool)

(assert (=> b!575810 m!554783))

(declare-fun m!554785 () Bool)

(assert (=> b!575810 m!554785))

(declare-fun m!554787 () Bool)

(assert (=> b!575806 m!554787))

(assert (=> b!575806 m!554787))

(declare-fun m!554789 () Bool)

(assert (=> b!575806 m!554789))

(declare-fun m!554791 () Bool)

(assert (=> b!575809 m!554791))

(assert (=> b!575803 m!554787))

(declare-fun m!554793 () Bool)

(assert (=> b!575803 m!554793))

(assert (=> b!575803 m!554787))

(declare-fun m!554795 () Bool)

(assert (=> b!575803 m!554795))

(declare-fun m!554797 () Bool)

(assert (=> b!575803 m!554797))

(assert (=> b!575803 m!554793))

(declare-fun m!554799 () Bool)

(assert (=> b!575803 m!554799))

(assert (=> b!575803 m!554787))

(declare-fun m!554801 () Bool)

(assert (=> b!575803 m!554801))

(assert (=> b!575803 m!554793))

(declare-fun m!554803 () Bool)

(assert (=> b!575803 m!554803))

(assert (=> b!575808 m!554787))

(assert (=> b!575808 m!554787))

(declare-fun m!554805 () Bool)

(assert (=> b!575808 m!554805))

(declare-fun m!554807 () Bool)

(assert (=> b!575802 m!554807))

(declare-fun m!554809 () Bool)

(assert (=> b!575805 m!554809))

(declare-fun m!554811 () Bool)

(assert (=> start!52796 m!554811))

(declare-fun m!554813 () Bool)

(assert (=> start!52796 m!554813))

(declare-fun m!554815 () Bool)

(assert (=> b!575801 m!554815))

(push 1)

(assert (not b!575802))

(assert (not b!575804))

(assert (not b!575809))

(assert (not b!575803))

(assert (not b!575806))

(assert (not start!52796))

(assert (not b!575810))

(assert (not b!575805))

(assert (not b!575808))

(assert (not b!575801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!32711 () Bool)

(declare-fun call!32714 () Bool)

(declare-fun c!66167 () Bool)

(assert (=> bm!32711 (= call!32714 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66167 (Cons!11329 (select (arr!17253 a!3118) #b00000000000000000000000000000000) Nil!11330) Nil!11330)))))

(declare-fun b!575905 () Bool)

(declare-fun e!331366 () Bool)

(assert (=> b!575905 (= e!331366 call!32714)))

(declare-fun b!575906 () Bool)

(assert (=> b!575906 (= e!331366 call!32714)))

(declare-fun b!575907 () Bool)

(declare-fun e!331368 () Bool)

(declare-fun e!331367 () Bool)

(assert (=> b!575907 (= e!331368 e!331367)))

(declare-fun res!364300 () Bool)

(assert (=> b!575907 (=> (not res!364300) (not e!331367))))

(declare-fun e!331365 () Bool)

(assert (=> b!575907 (= res!364300 (not e!331365))))

(declare-fun res!364299 () Bool)

(assert (=> b!575907 (=> (not res!364299) (not e!331365))))

(assert (=> b!575907 (= res!364299 (validKeyInArray!0 (select (arr!17253 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85307 () Bool)

(declare-fun res!364301 () Bool)

(assert (=> d!85307 (=> res!364301 e!331368)))

(assert (=> d!85307 (= res!364301 (bvsge #b00000000000000000000000000000000 (size!17617 a!3118)))))

(assert (=> d!85307 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11330) e!331368)))

(declare-fun b!575908 () Bool)

(assert (=> b!575908 (= e!331367 e!331366)))

(assert (=> b!575908 (= c!66167 (validKeyInArray!0 (select (arr!17253 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575909 () Bool)

(declare-fun contains!2895 (List!11333 (_ BitVec 64)) Bool)

(assert (=> b!575909 (= e!331365 (contains!2895 Nil!11330 (select (arr!17253 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85307 (not res!364301)) b!575907))

(assert (= (and b!575907 res!364299) b!575909))

(assert (= (and b!575907 res!364300) b!575908))

(assert (= (and b!575908 c!66167) b!575906))

(assert (= (and b!575908 (not c!66167)) b!575905))

(assert (= (or b!575906 b!575905) bm!32711))

(declare-fun m!554895 () Bool)

(assert (=> bm!32711 m!554895))

(declare-fun m!554897 () Bool)

(assert (=> bm!32711 m!554897))

(assert (=> b!575907 m!554895))

(assert (=> b!575907 m!554895))

(declare-fun m!554899 () Bool)

(assert (=> b!575907 m!554899))

(assert (=> b!575908 m!554895))

(assert (=> b!575908 m!554895))

(assert (=> b!575908 m!554899))

(assert (=> b!575909 m!554895))

(assert (=> b!575909 m!554895))

(declare-fun m!554901 () Bool)

(assert (=> b!575909 m!554901))

(assert (=> b!575802 d!85307))

(declare-fun d!85311 () Bool)

(declare-fun lt!263511 () SeekEntryResult!5702)

(assert (=> d!85311 (and (or (is-Undefined!5702 lt!263511) (not (is-Found!5702 lt!263511)) (and (bvsge (index!25036 lt!263511) #b00000000000000000000000000000000) (bvslt (index!25036 lt!263511) (size!17617 a!3118)))) (or (is-Undefined!5702 lt!263511) (is-Found!5702 lt!263511) (not (is-MissingZero!5702 lt!263511)) (and (bvsge (index!25035 lt!263511) #b00000000000000000000000000000000) (bvslt (index!25035 lt!263511) (size!17617 a!3118)))) (or (is-Undefined!5702 lt!263511) (is-Found!5702 lt!263511) (is-MissingZero!5702 lt!263511) (not (is-MissingVacant!5702 lt!263511)) (and (bvsge (index!25038 lt!263511) #b00000000000000000000000000000000) (bvslt (index!25038 lt!263511) (size!17617 a!3118)))) (or (is-Undefined!5702 lt!263511) (ite (is-Found!5702 lt!263511) (= (select (arr!17253 a!3118) (index!25036 lt!263511)) k!1914) (ite (is-MissingZero!5702 lt!263511) (= (select (arr!17253 a!3118) (index!25035 lt!263511)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5702 lt!263511) (= (select (arr!17253 a!3118) (index!25038 lt!263511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!331410 () SeekEntryResult!5702)

(assert (=> d!85311 (= lt!263511 e!331410)))

(declare-fun c!66190 () Bool)

(declare-fun lt!263512 () SeekEntryResult!5702)

(assert (=> d!85311 (= c!66190 (and (is-Intermediate!5702 lt!263512) (undefined!6514 lt!263512)))))

(assert (=> d!85311 (= lt!263512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!85311 (validMask!0 mask!3119)))

(assert (=> d!85311 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!263511)))

(declare-fun b!575969 () Bool)

(declare-fun e!331409 () SeekEntryResult!5702)

(assert (=> b!575969 (= e!331409 (MissingZero!5702 (index!25037 lt!263512)))))

(declare-fun b!575970 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35941 (_ BitVec 32)) SeekEntryResult!5702)

(assert (=> b!575970 (= e!331409 (seekKeyOrZeroReturnVacant!0 (x!53927 lt!263512) (index!25037 lt!263512) (index!25037 lt!263512) k!1914 a!3118 mask!3119))))

(declare-fun b!575971 () Bool)

(declare-fun e!331411 () SeekEntryResult!5702)

(assert (=> b!575971 (= e!331410 e!331411)))

(declare-fun lt!263513 () (_ BitVec 64))

(assert (=> b!575971 (= lt!263513 (select (arr!17253 a!3118) (index!25037 lt!263512)))))

(declare-fun c!66191 () Bool)

(assert (=> b!575971 (= c!66191 (= lt!263513 k!1914))))

(declare-fun b!575972 () Bool)

(assert (=> b!575972 (= e!331410 Undefined!5702)))

(declare-fun b!575973 () Bool)

(declare-fun c!66189 () Bool)

(assert (=> b!575973 (= c!66189 (= lt!263513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575973 (= e!331411 e!331409)))

(declare-fun b!575974 () Bool)

(assert (=> b!575974 (= e!331411 (Found!5702 (index!25037 lt!263512)))))

(assert (= (and d!85311 c!66190) b!575972))

(assert (= (and d!85311 (not c!66190)) b!575971))

(assert (= (and b!575971 c!66191) b!575974))

(assert (= (and b!575971 (not c!66191)) b!575973))

(assert (= (and b!575973 c!66189) b!575969))

(assert (= (and b!575973 (not c!66189)) b!575970))

(declare-fun m!554941 () Bool)

(assert (=> d!85311 m!554941))

(assert (=> d!85311 m!554811))

(assert (=> d!85311 m!554941))

(declare-fun m!554943 () Bool)

(assert (=> d!85311 m!554943))

(declare-fun m!554945 () Bool)

(assert (=> d!85311 m!554945))

(declare-fun m!554947 () Bool)

(assert (=> d!85311 m!554947))

(declare-fun m!554949 () Bool)

(assert (=> d!85311 m!554949))

(declare-fun m!554951 () Bool)

(assert (=> b!575970 m!554951))

(declare-fun m!554953 () Bool)

(assert (=> b!575971 m!554953))

(assert (=> b!575801 d!85311))

(declare-fun d!85325 () Bool)

(declare-fun lt!263514 () SeekEntryResult!5702)

(assert (=> d!85325 (and (or (is-Undefined!5702 lt!263514) (not (is-Found!5702 lt!263514)) (and (bvsge (index!25036 lt!263514) #b00000000000000000000000000000000) (bvslt (index!25036 lt!263514) (size!17617 a!3118)))) (or (is-Undefined!5702 lt!263514) (is-Found!5702 lt!263514) (not (is-MissingZero!5702 lt!263514)) (and (bvsge (index!25035 lt!263514) #b00000000000000000000000000000000) (bvslt (index!25035 lt!263514) (size!17617 a!3118)))) (or (is-Undefined!5702 lt!263514) (is-Found!5702 lt!263514) (is-MissingZero!5702 lt!263514) (not (is-MissingVacant!5702 lt!263514)) (and (bvsge (index!25038 lt!263514) #b00000000000000000000000000000000) (bvslt (index!25038 lt!263514) (size!17617 a!3118)))) (or (is-Undefined!5702 lt!263514) (ite (is-Found!5702 lt!263514) (= (select (arr!17253 a!3118) (index!25036 lt!263514)) (select (arr!17253 a!3118) j!142)) (ite (is-MissingZero!5702 lt!263514) (= (select (arr!17253 a!3118) (index!25035 lt!263514)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5702 lt!263514) (= (select (arr!17253 a!3118) (index!25038 lt!263514)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!331413 () SeekEntryResult!5702)

(assert (=> d!85325 (= lt!263514 e!331413)))

(declare-fun c!66193 () Bool)

(declare-fun lt!263515 () SeekEntryResult!5702)

(assert (=> d!85325 (= c!66193 (and (is-Intermediate!5702 lt!263515) (undefined!6514 lt!263515)))))

(assert (=> d!85325 (= lt!263515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17253 a!3118) j!142) mask!3119) (select (arr!17253 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85325 (validMask!0 mask!3119)))

(assert (=> d!85325 (= (seekEntryOrOpen!0 (select (arr!17253 a!3118) j!142) a!3118 mask!3119) lt!263514)))

(declare-fun b!575979 () Bool)

(declare-fun e!331412 () SeekEntryResult!5702)

(assert (=> b!575979 (= e!331412 (MissingZero!5702 (index!25037 lt!263515)))))

(declare-fun b!575980 () Bool)

(assert (=> b!575980 (= e!331412 (seekKeyOrZeroReturnVacant!0 (x!53927 lt!263515) (index!25037 lt!263515) (index!25037 lt!263515) (select (arr!17253 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575981 () Bool)

(declare-fun e!331414 () SeekEntryResult!5702)

(assert (=> b!575981 (= e!331413 e!331414)))

(declare-fun lt!263516 () (_ BitVec 64))

(assert (=> b!575981 (= lt!263516 (select (arr!17253 a!3118) (index!25037 lt!263515)))))

(declare-fun c!66194 () Bool)

(assert (=> b!575981 (= c!66194 (= lt!263516 (select (arr!17253 a!3118) j!142)))))

(declare-fun b!575982 () Bool)

(assert (=> b!575982 (= e!331413 Undefined!5702)))

(declare-fun b!575983 () Bool)

(declare-fun c!66192 () Bool)

(assert (=> b!575983 (= c!66192 (= lt!263516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575983 (= e!331414 e!331412)))

(declare-fun b!575984 () Bool)

(assert (=> b!575984 (= e!331414 (Found!5702 (index!25037 lt!263515)))))

(assert (= (and d!85325 c!66193) b!575982))

(assert (= (and d!85325 (not c!66193)) b!575981))

(assert (= (and b!575981 c!66194) b!575984))

(assert (= (and b!575981 (not c!66194)) b!575983))

(assert (= (and b!575983 c!66192) b!575979))

(assert (= (and b!575983 (not c!66192)) b!575980))

(assert (=> d!85325 m!554787))

(assert (=> d!85325 m!554801))

(assert (=> d!85325 m!554811))

(assert (=> d!85325 m!554801))

(assert (=> d!85325 m!554787))

(declare-fun m!554955 () Bool)

(assert (=> d!85325 m!554955))

(declare-fun m!554957 () Bool)

(assert (=> d!85325 m!554957))

(declare-fun m!554959 () Bool)

(assert (=> d!85325 m!554959))

(declare-fun m!554961 () Bool)

(assert (=> d!85325 m!554961))

(assert (=> b!575980 m!554787))

(declare-fun m!554963 () Bool)

(assert (=> b!575980 m!554963))

(declare-fun m!554965 () Bool)

(assert (=> b!575981 m!554965))

(assert (=> b!575806 d!85325))

(declare-fun d!85327 () Bool)

(assert (=> d!85327 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!575805 d!85327))

(declare-fun d!85329 () Bool)

(declare-fun res!364341 () Bool)

(declare-fun e!331441 () Bool)

(assert (=> d!85329 (=> res!364341 e!331441)))

(assert (=> d!85329 (= res!364341 (bvsge j!142 (size!17617 a!3118)))))

(assert (=> d!85329 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331441)))

(declare-fun b!576023 () Bool)

(declare-fun e!331440 () Bool)

(declare-fun call!32723 () Bool)

(assert (=> b!576023 (= e!331440 call!32723)))

(declare-fun b!576024 () Bool)

(declare-fun e!331442 () Bool)

(assert (=> b!576024 (= e!331442 call!32723)))

(declare-fun b!576025 () Bool)

(assert (=> b!576025 (= e!331441 e!331440)))

(declare-fun c!66206 () Bool)

(assert (=> b!576025 (= c!66206 (validKeyInArray!0 (select (arr!17253 a!3118) j!142)))))

(declare-fun b!576026 () Bool)

(assert (=> b!576026 (= e!331440 e!331442)))

(declare-fun lt!263549 () (_ BitVec 64))

(assert (=> b!576026 (= lt!263549 (select (arr!17253 a!3118) j!142))))

(declare-fun lt!263547 () Unit!18106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35941 (_ BitVec 64) (_ BitVec 32)) Unit!18106)

(assert (=> b!576026 (= lt!263547 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263549 j!142))))

(assert (=> b!576026 (arrayContainsKey!0 a!3118 lt!263549 #b00000000000000000000000000000000)))

(declare-fun lt!263548 () Unit!18106)

(assert (=> b!576026 (= lt!263548 lt!263547)))

(declare-fun res!364340 () Bool)

(assert (=> b!576026 (= res!364340 (= (seekEntryOrOpen!0 (select (arr!17253 a!3118) j!142) a!3118 mask!3119) (Found!5702 j!142)))))

(assert (=> b!576026 (=> (not res!364340) (not e!331442))))

(declare-fun bm!32720 () Bool)

(assert (=> bm!32720 (= call!32723 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85329 (not res!364341)) b!576025))

(assert (= (and b!576025 c!66206) b!576026))

(assert (= (and b!576025 (not c!66206)) b!576023))

(assert (= (and b!576026 res!364340) b!576024))

(assert (= (or b!576024 b!576023) bm!32720))

(assert (=> b!576025 m!554787))

(assert (=> b!576025 m!554787))

(assert (=> b!576025 m!554805))

(assert (=> b!576026 m!554787))

(declare-fun m!554991 () Bool)

(assert (=> b!576026 m!554991))

(declare-fun m!554993 () Bool)

(assert (=> b!576026 m!554993))

(assert (=> b!576026 m!554787))

(assert (=> b!576026 m!554789))

(declare-fun m!554995 () Bool)

(assert (=> bm!32720 m!554995))

(assert (=> b!575810 d!85329))

(declare-fun d!85343 () Bool)

(assert (=> d!85343 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263552 () Unit!18106)

(declare-fun choose!38 (array!35941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18106)

(assert (=> d!85343 (= lt!263552 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85343 (validMask!0 mask!3119)))

(assert (=> d!85343 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263552)))

(declare-fun bs!17802 () Bool)

(assert (= bs!17802 d!85343))

(assert (=> bs!17802 m!554783))

(declare-fun m!554997 () Bool)

(assert (=> bs!17802 m!554997))

(assert (=> bs!17802 m!554811))

(assert (=> b!575810 d!85343))

(declare-fun d!85345 () Bool)

(declare-fun res!364343 () Bool)

(declare-fun e!331444 () Bool)

(assert (=> d!85345 (=> res!364343 e!331444)))

(assert (=> d!85345 (= res!364343 (bvsge #b00000000000000000000000000000000 (size!17617 a!3118)))))

(assert (=> d!85345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331444)))

(declare-fun b!576027 () Bool)

(declare-fun e!331443 () Bool)

(declare-fun call!32724 () Bool)

(assert (=> b!576027 (= e!331443 call!32724)))

(declare-fun b!576028 () Bool)

(declare-fun e!331445 () Bool)

(assert (=> b!576028 (= e!331445 call!32724)))

(declare-fun b!576029 () Bool)

(assert (=> b!576029 (= e!331444 e!331443)))

(declare-fun c!66207 () Bool)

(assert (=> b!576029 (= c!66207 (validKeyInArray!0 (select (arr!17253 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576030 () Bool)

(assert (=> b!576030 (= e!331443 e!331445)))

(declare-fun lt!263555 () (_ BitVec 64))

(assert (=> b!576030 (= lt!263555 (select (arr!17253 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263553 () Unit!18106)

(assert (=> b!576030 (= lt!263553 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263555 #b00000000000000000000000000000000))))

(assert (=> b!576030 (arrayContainsKey!0 a!3118 lt!263555 #b00000000000000000000000000000000)))

(declare-fun lt!263554 () Unit!18106)

(assert (=> b!576030 (= lt!263554 lt!263553)))

(declare-fun res!364342 () Bool)

(assert (=> b!576030 (= res!364342 (= (seekEntryOrOpen!0 (select (arr!17253 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5702 #b00000000000000000000000000000000)))))

(assert (=> b!576030 (=> (not res!364342) (not e!331445))))

(declare-fun bm!32721 () Bool)

(assert (=> bm!32721 (= call!32724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85345 (not res!364343)) b!576029))

(assert (= (and b!576029 c!66207) b!576030))

(assert (= (and b!576029 (not c!66207)) b!576027))

(assert (= (and b!576030 res!364342) b!576028))

(assert (= (or b!576028 b!576027) bm!32721))

(assert (=> b!576029 m!554895))

(assert (=> b!576029 m!554895))

(assert (=> b!576029 m!554899))

(assert (=> b!576030 m!554895))

(declare-fun m!554999 () Bool)

(assert (=> b!576030 m!554999))

(declare-fun m!555001 () Bool)

(assert (=> b!576030 m!555001))

(assert (=> b!576030 m!554895))

(declare-fun m!555003 () Bool)

(assert (=> b!576030 m!555003))

(declare-fun m!555005 () Bool)

(assert (=> bm!32721 m!555005))

(assert (=> b!575804 d!85345))

(declare-fun d!85347 () Bool)

(declare-fun res!364348 () Bool)

(declare-fun e!331450 () Bool)

(assert (=> d!85347 (=> res!364348 e!331450)))

(assert (=> d!85347 (= res!364348 (= (select (arr!17253 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!85347 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!331450)))

(declare-fun b!576035 () Bool)

(declare-fun e!331451 () Bool)

(assert (=> b!576035 (= e!331450 e!331451)))

(declare-fun res!364349 () Bool)

(assert (=> b!576035 (=> (not res!364349) (not e!331451))))

(assert (=> b!576035 (= res!364349 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17617 a!3118)))))

(declare-fun b!576036 () Bool)

(assert (=> b!576036 (= e!331451 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85347 (not res!364348)) b!576035))

(assert (= (and b!576035 res!364349) b!576036))

(assert (=> d!85347 m!554895))

(declare-fun m!555007 () Bool)

(assert (=> b!576036 m!555007))

(assert (=> b!575809 d!85347))

(declare-fun e!331506 () SeekEntryResult!5702)

(declare-fun b!576125 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576125 (= e!331506 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263435 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118)) mask!3119))))

(declare-fun b!576126 () Bool)

(declare-fun e!331503 () Bool)

(declare-fun e!331505 () Bool)

(assert (=> b!576126 (= e!331503 e!331505)))

(declare-fun res!364377 () Bool)

(declare-fun lt!263591 () SeekEntryResult!5702)

(assert (=> b!576126 (= res!364377 (and (is-Intermediate!5702 lt!263591) (not (undefined!6514 lt!263591)) (bvslt (x!53927 lt!263591) #b01111111111111111111111111111110) (bvsge (x!53927 lt!263591) #b00000000000000000000000000000000) (bvsge (x!53927 lt!263591) #b00000000000000000000000000000000)))))

(assert (=> b!576126 (=> (not res!364377) (not e!331505))))

(declare-fun b!576127 () Bool)

(assert (=> b!576127 (and (bvsge (index!25037 lt!263591) #b00000000000000000000000000000000) (bvslt (index!25037 lt!263591) (size!17617 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118)))))))

(declare-fun res!364379 () Bool)

(assert (=> b!576127 (= res!364379 (= (select (arr!17253 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118))) (index!25037 lt!263591)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331504 () Bool)

(assert (=> b!576127 (=> res!364379 e!331504)))

(declare-fun b!576128 () Bool)

(assert (=> b!576128 (= e!331503 (bvsge (x!53927 lt!263591) #b01111111111111111111111111111110))))

(declare-fun b!576129 () Bool)

(assert (=> b!576129 (and (bvsge (index!25037 lt!263591) #b00000000000000000000000000000000) (bvslt (index!25037 lt!263591) (size!17617 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118)))))))

(assert (=> b!576129 (= e!331504 (= (select (arr!17253 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118))) (index!25037 lt!263591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85349 () Bool)

(assert (=> d!85349 e!331503))

(declare-fun c!66240 () Bool)

(assert (=> d!85349 (= c!66240 (and (is-Intermediate!5702 lt!263591) (undefined!6514 lt!263591)))))

(declare-fun e!331507 () SeekEntryResult!5702)

(assert (=> d!85349 (= lt!263591 e!331507)))

(declare-fun c!66241 () Bool)

(assert (=> d!85349 (= c!66241 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263592 () (_ BitVec 64))

(assert (=> d!85349 (= lt!263592 (select (arr!17253 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118))) lt!263435))))

(assert (=> d!85349 (validMask!0 mask!3119)))

(assert (=> d!85349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263435 (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118)) mask!3119) lt!263591)))

(declare-fun b!576130 () Bool)

(assert (=> b!576130 (= e!331507 (Intermediate!5702 true lt!263435 #b00000000000000000000000000000000))))

(declare-fun b!576131 () Bool)

(assert (=> b!576131 (= e!331506 (Intermediate!5702 false lt!263435 #b00000000000000000000000000000000))))

(declare-fun b!576132 () Bool)

(assert (=> b!576132 (= e!331507 e!331506)))

(declare-fun c!66239 () Bool)

(assert (=> b!576132 (= c!66239 (or (= lt!263592 (select (store (arr!17253 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!263592 lt!263592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576133 () Bool)

(assert (=> b!576133 (and (bvsge (index!25037 lt!263591) #b00000000000000000000000000000000) (bvslt (index!25037 lt!263591) (size!17617 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118)))))))

(declare-fun res!364378 () Bool)

(assert (=> b!576133 (= res!364378 (= (select (arr!17253 (array!35942 (store (arr!17253 a!3118) i!1132 k!1914) (size!17617 a!3118))) (index!25037 lt!263591)) (select (store (arr!17253 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!576133 (=> res!364378 e!331504)))

(assert (=> b!576133 (= e!331505 e!331504)))

(assert (= (and d!85349 c!66241) b!576130))

(assert (= (and d!85349 (not c!66241)) b!576132))

(assert (= (and b!576132 c!66239) b!576131))

(assert (= (and b!576132 (not c!66239)) b!576125))

(assert (= (and d!85349 c!66240) b!576128))

(assert (= (and d!85349 (not c!66240)) b!576126))

(assert (= (and b!576126 res!364377) b!576133))

(assert (= (and b!576133 (not res!364378)) b!576127))

(assert (= (and b!576127 (not res!364379)) b!576129))

(declare-fun m!555065 () Bool)

(assert (=> b!576133 m!555065))

(assert (=> b!576127 m!555065))

(declare-fun m!555067 () Bool)

(assert (=> b!576125 m!555067))

(assert (=> b!576125 m!555067))

(assert (=> b!576125 m!554793))

(declare-fun m!555069 () Bool)

(assert (=> b!576125 m!555069))

(assert (=> b!576129 m!555065))

(declare-fun m!555071 () Bool)

(assert (=> d!85349 m!555071))

(assert (=> d!85349 m!554811))

(assert (=> b!575803 d!85349))

(declare-fun b!576134 () Bool)

(declare-fun e!331511 () SeekEntryResult!5702)

(assert (=> b!576134 (= e!331511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263438 #b00000000000000000000000000000000 mask!3119) (select (arr!17253 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576135 () Bool)

(declare-fun e!331508 () Bool)

(declare-fun e!331510 () Bool)

(assert (=> b!576135 (= e!331508 e!331510)))

(declare-fun res!364380 () Bool)

(declare-fun lt!263593 () SeekEntryResult!5702)

(assert (=> b!576135 (= res!364380 (and (is-Intermediate!5702 lt!263593) (not (undefined!6514 lt!263593)) (bvslt (x!53927 lt!263593) #b01111111111111111111111111111110) (bvsge (x!53927 lt!263593) #b00000000000000000000000000000000) (bvsge (x!53927 lt!263593) #b00000000000000000000000000000000)))))

(assert (=> b!576135 (=> (not res!364380) (not e!331510))))

(declare-fun b!576136 () Bool)

(assert (=> b!576136 (and (bvsge (index!25037 lt!263593) #b00000000000000000000000000000000) (bvslt (index!25037 lt!263593) (size!17617 a!3118)))))

(declare-fun res!364382 () Bool)

(assert (=> b!576136 (= res!364382 (= (select (arr!17253 a!3118) (index!25037 lt!263593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331509 () Bool)

(assert (=> b!576136 (=> res!364382 e!331509)))

(declare-fun b!576137 () Bool)

(assert (=> b!576137 (= e!331508 (bvsge (x!53927 lt!263593) #b01111111111111111111111111111110))))

(declare-fun b!576138 () Bool)

(assert (=> b!576138 (and (bvsge (index!25037 lt!263593) #b00000000000000000000000000000000) (bvslt (index!25037 lt!263593) (size!17617 a!3118)))))

(assert (=> b!576138 (= e!331509 (= (select (arr!17253 a!3118) (index!25037 lt!263593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85371 () Bool)

(assert (=> d!85371 e!331508))

(declare-fun c!66243 () Bool)

(assert (=> d!85371 (= c!66243 (and (is-Intermediate!5702 lt!263593) (undefined!6514 lt!263593)))))

(declare-fun e!331512 () SeekEntryResult!5702)

(assert (=> d!85371 (= lt!263593 e!331512)))

(declare-fun c!66244 () Bool)

(assert (=> d!85371 (= c!66244 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263594 () (_ BitVec 64))

(assert (=> d!85371 (= lt!263594 (select (arr!17253 a!3118) lt!263438))))

(assert (=> d!85371 (validMask!0 mask!3119)))

(assert (=> d!85371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263438 (select (arr!17253 a!3118) j!142) a!3118 mask!3119) lt!263593)))

(declare-fun b!576139 () Bool)

(assert (=> b!576139 (= e!331512 (Intermediate!5702 true lt!263438 #b00000000000000000000000000000000))))

(declare-fun b!576140 () Bool)

(assert (=> b!576140 (= e!331511 (Intermediate!5702 false lt!263438 #b00000000000000000000000000000000))))

(declare-fun b!576141 () Bool)

(assert (=> b!576141 (= e!331512 e!331511)))

(declare-fun c!66242 () Bool)

(assert (=> b!576141 (= c!66242 (or (= lt!263594 (select (arr!17253 a!3118) j!142)) (= (bvadd lt!263594 lt!263594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576142 () Bool)

(assert (=> b!576142 (and (bvsge (index!25037 lt!263593) #b00000000000000000000000000000000) (bvslt (index!25037 lt!263593) (size!17617 a!3118)))))

(declare-fun res!364381 () Bool)

(assert (=> b!576142 (= res!364381 (= (select (arr!17253 a!3118) (index!25037 lt!263593)) (select (arr!17253 a!3118) j!142)))))

(assert (=> b!576142 (=> res!364381 e!331509)))

(assert (=> b!576142 (= e!331510 e!331509)))

(assert (= (and d!85371 c!66244) b!576139))

(assert (= (and d!85371 (not c!66244)) b!576141))

(assert (= (and b!576141 c!66242) b!576140))

(assert (= (and b!576141 (not c!66242)) b!576134))

(assert (= (and d!85371 c!66243) b!576137))

(assert (= (and d!85371 (not c!66243)) b!576135))

(assert (= (and b!576135 res!364380) b!576142))

(assert (= (and b!576142 (not res!364381)) b!576136))

(assert (= (and b!576136 (not res!364382)) b!576138))

(declare-fun m!555073 () Bool)

(assert (=> b!576142 m!555073))

(assert (=> b!576136 m!555073))

(declare-fun m!555075 () Bool)

(assert (=> b!576134 m!555075))

(assert (=> b!576134 m!555075))

(assert (=> b!576134 m!554787))

(declare-fun m!555077 () Bool)

(assert (=> b!576134 m!555077))

(assert (=> b!576138 m!555073))

(declare-fun m!555079 () Bool)

(assert (=> d!85371 m!555079))

(assert (=> d!85371 m!554811))

(assert (=> b!575803 d!85371))

(declare-fun d!85373 () Bool)

(declare-fun lt!263600 () (_ BitVec 32))

(declare-fun lt!263599 () (_ BitVec 32))

(assert (=> d!85373 (= lt!263600 (bvmul (bvxor lt!263599 (bvlshr lt!263599 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85373 (= lt!263599 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85373 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364383 (let ((h!12373 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53935 (bvmul (bvxor h!12373 (bvlshr h!12373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53935 (bvlshr x!53935 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364383 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364383 #b00000000000000000000000000000000))))))

(assert (=> d!85373 (= (toIndex!0 (select (store (arr!17253 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!263600 (bvlshr lt!263600 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!575803 d!85373))

(declare-fun d!85375 () Bool)

(declare-fun lt!263602 () (_ BitVec 32))

(declare-fun lt!263601 () (_ BitVec 32))

(assert (=> d!85375 (= lt!263602 (bvmul (bvxor lt!263601 (bvlshr lt!263601 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85375 (= lt!263601 ((_ extract 31 0) (bvand (bvxor (select (arr!17253 a!3118) j!142) (bvlshr (select (arr!17253 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85375 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364383 (let ((h!12373 ((_ extract 31 0) (bvand (bvxor (select (arr!17253 a!3118) j!142) (bvlshr (select (arr!17253 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53935 (bvmul (bvxor h!12373 (bvlshr h!12373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53935 (bvlshr x!53935 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364383 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364383 #b00000000000000000000000000000000))))))

(assert (=> d!85375 (= (toIndex!0 (select (arr!17253 a!3118) j!142) mask!3119) (bvand (bvxor lt!263602 (bvlshr lt!263602 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!575803 d!85375))

(declare-fun d!85377 () Bool)

(assert (=> d!85377 (= (validKeyInArray!0 (select (arr!17253 a!3118) j!142)) (and (not (= (select (arr!17253 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17253 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!575808 d!85377))

(declare-fun d!85381 () Bool)

(assert (=> d!85381 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52796 d!85381))

(declare-fun d!85391 () Bool)

(assert (=> d!85391 (= (array_inv!13049 a!3118) (bvsge (size!17617 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52796 d!85391))

(push 1)

