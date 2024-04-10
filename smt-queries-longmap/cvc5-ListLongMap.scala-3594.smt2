; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49350 () Bool)

(assert start!49350)

(declare-fun b!543799 () Bool)

(declare-fun res!338350 () Bool)

(declare-fun e!314420 () Bool)

(assert (=> b!543799 (=> (not res!338350) (not e!314420))))

(declare-datatypes ((array!34358 0))(
  ( (array!34359 (arr!16512 (Array (_ BitVec 32) (_ BitVec 64))) (size!16876 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34358)

(declare-datatypes ((List!10631 0))(
  ( (Nil!10628) (Cons!10627 (h!11582 (_ BitVec 64)) (t!16859 List!10631)) )
))
(declare-fun arrayNoDuplicates!0 (array!34358 (_ BitVec 32) List!10631) Bool)

(assert (=> b!543799 (= res!338350 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10628))))

(declare-fun b!543800 () Bool)

(declare-fun res!338357 () Bool)

(assert (=> b!543800 (=> (not res!338357) (not e!314420))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543800 (= res!338357 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16876 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16876 a!3154)) (= (select (arr!16512 a!3154) resIndex!32) (select (arr!16512 a!3154) j!147))))))

(declare-fun b!543801 () Bool)

(declare-fun res!338353 () Bool)

(declare-fun e!314421 () Bool)

(assert (=> b!543801 (=> (not res!338353) (not e!314421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543801 (= res!338353 (validKeyInArray!0 (select (arr!16512 a!3154) j!147)))))

(declare-fun b!543802 () Bool)

(declare-fun res!338351 () Bool)

(assert (=> b!543802 (=> (not res!338351) (not e!314421))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!543802 (= res!338351 (validKeyInArray!0 k!1998))))

(declare-fun b!543803 () Bool)

(declare-fun res!338360 () Bool)

(declare-fun e!314419 () Bool)

(assert (=> b!543803 (=> (not res!338360) (not e!314419))))

(declare-datatypes ((SeekEntryResult!4970 0))(
  ( (MissingZero!4970 (index!22104 (_ BitVec 32))) (Found!4970 (index!22105 (_ BitVec 32))) (Intermediate!4970 (undefined!5782 Bool) (index!22106 (_ BitVec 32)) (x!51009 (_ BitVec 32))) (Undefined!4970) (MissingVacant!4970 (index!22107 (_ BitVec 32))) )
))
(declare-fun lt!248261 () SeekEntryResult!4970)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34358 (_ BitVec 32)) SeekEntryResult!4970)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543803 (= res!338360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216) lt!248261))))

(declare-fun b!543804 () Bool)

(declare-fun res!338359 () Bool)

(assert (=> b!543804 (=> (not res!338359) (not e!314420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34358 (_ BitVec 32)) Bool)

(assert (=> b!543804 (= res!338359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543798 () Bool)

(declare-fun res!338355 () Bool)

(assert (=> b!543798 (=> (not res!338355) (not e!314419))))

(assert (=> b!543798 (= res!338355 (and (not (= (select (arr!16512 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16512 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16512 a!3154) index!1177) (select (arr!16512 a!3154) j!147)))))))

(declare-fun res!338349 () Bool)

(assert (=> start!49350 (=> (not res!338349) (not e!314421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49350 (= res!338349 (validMask!0 mask!3216))))

(assert (=> start!49350 e!314421))

(assert (=> start!49350 true))

(declare-fun array_inv!12308 (array!34358) Bool)

(assert (=> start!49350 (array_inv!12308 a!3154)))

(declare-fun b!543805 () Bool)

(assert (=> b!543805 (= e!314421 e!314420)))

(declare-fun res!338356 () Bool)

(assert (=> b!543805 (=> (not res!338356) (not e!314420))))

(declare-fun lt!248262 () SeekEntryResult!4970)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543805 (= res!338356 (or (= lt!248262 (MissingZero!4970 i!1153)) (= lt!248262 (MissingVacant!4970 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34358 (_ BitVec 32)) SeekEntryResult!4970)

(assert (=> b!543805 (= lt!248262 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543806 () Bool)

(declare-fun res!338354 () Bool)

(assert (=> b!543806 (=> (not res!338354) (not e!314421))))

(assert (=> b!543806 (= res!338354 (and (= (size!16876 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16876 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16876 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543807 () Bool)

(assert (=> b!543807 (= e!314420 e!314419)))

(declare-fun res!338352 () Bool)

(assert (=> b!543807 (=> (not res!338352) (not e!314419))))

(assert (=> b!543807 (= res!338352 (= lt!248261 (Intermediate!4970 false resIndex!32 resX!32)))))

(assert (=> b!543807 (= lt!248261 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16512 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543808 () Bool)

(declare-fun res!338358 () Bool)

(assert (=> b!543808 (=> (not res!338358) (not e!314421))))

(declare-fun arrayContainsKey!0 (array!34358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543808 (= res!338358 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543809 () Bool)

(assert (=> b!543809 (= e!314419 (bvsgt (bvadd #b00000000000000000000000000000001 x!1030) resX!32))))

(declare-fun lt!248263 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543809 (= lt!248263 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!49350 res!338349) b!543806))

(assert (= (and b!543806 res!338354) b!543801))

(assert (= (and b!543801 res!338353) b!543802))

(assert (= (and b!543802 res!338351) b!543808))

(assert (= (and b!543808 res!338358) b!543805))

(assert (= (and b!543805 res!338356) b!543804))

(assert (= (and b!543804 res!338359) b!543799))

(assert (= (and b!543799 res!338350) b!543800))

(assert (= (and b!543800 res!338357) b!543807))

(assert (= (and b!543807 res!338352) b!543803))

(assert (= (and b!543803 res!338360) b!543798))

(assert (= (and b!543798 res!338355) b!543809))

(declare-fun m!521829 () Bool)

(assert (=> start!49350 m!521829))

(declare-fun m!521831 () Bool)

(assert (=> start!49350 m!521831))

(declare-fun m!521833 () Bool)

(assert (=> b!543807 m!521833))

(assert (=> b!543807 m!521833))

(declare-fun m!521835 () Bool)

(assert (=> b!543807 m!521835))

(declare-fun m!521837 () Bool)

(assert (=> b!543804 m!521837))

(declare-fun m!521839 () Bool)

(assert (=> b!543809 m!521839))

(assert (=> b!543803 m!521833))

(assert (=> b!543803 m!521833))

(declare-fun m!521841 () Bool)

(assert (=> b!543803 m!521841))

(assert (=> b!543803 m!521841))

(assert (=> b!543803 m!521833))

(declare-fun m!521843 () Bool)

(assert (=> b!543803 m!521843))

(declare-fun m!521845 () Bool)

(assert (=> b!543800 m!521845))

(assert (=> b!543800 m!521833))

(declare-fun m!521847 () Bool)

(assert (=> b!543799 m!521847))

(assert (=> b!543801 m!521833))

(assert (=> b!543801 m!521833))

(declare-fun m!521849 () Bool)

(assert (=> b!543801 m!521849))

(declare-fun m!521851 () Bool)

(assert (=> b!543805 m!521851))

(declare-fun m!521853 () Bool)

(assert (=> b!543802 m!521853))

(declare-fun m!521855 () Bool)

(assert (=> b!543798 m!521855))

(assert (=> b!543798 m!521833))

(declare-fun m!521857 () Bool)

(assert (=> b!543808 m!521857))

(push 1)

(assert (not start!49350))

(assert (not b!543808))

(assert (not b!543801))

(assert (not b!543802))

(assert (not b!543803))

(assert (not b!543805))

(assert (not b!543807))

(assert (not b!543799))

(assert (not b!543809))

(assert (not b!543804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!543905 () Bool)

(declare-fun e!314465 () Bool)

(declare-fun e!314466 () Bool)

(assert (=> b!543905 (= e!314465 e!314466)))

(declare-fun lt!248289 () (_ BitVec 64))

(assert (=> b!543905 (= lt!248289 (select (arr!16512 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16904 0))(
  ( (Unit!16905) )
))
(declare-fun lt!248290 () Unit!16904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34358 (_ BitVec 64) (_ BitVec 32)) Unit!16904)

(assert (=> b!543905 (= lt!248290 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248289 #b00000000000000000000000000000000))))

(assert (=> b!543905 (arrayContainsKey!0 a!3154 lt!248289 #b00000000000000000000000000000000)))

(declare-fun lt!248288 () Unit!16904)

(assert (=> b!543905 (= lt!248288 lt!248290)))

(declare-fun res!338447 () Bool)

(assert (=> b!543905 (= res!338447 (= (seekEntryOrOpen!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4970 #b00000000000000000000000000000000)))))

(assert (=> b!543905 (=> (not res!338447) (not e!314466))))

(declare-fun bm!32072 () Bool)

(declare-fun call!32075 () Bool)

(assert (=> bm!32072 (= call!32075 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!543906 () Bool)

(declare-fun e!314464 () Bool)

(assert (=> b!543906 (= e!314464 e!314465)))

(declare-fun c!63047 () Bool)

(assert (=> b!543906 (= c!63047 (validKeyInArray!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543907 () Bool)

(assert (=> b!543907 (= e!314465 call!32075)))

(declare-fun d!81929 () Bool)

(declare-fun res!338446 () Bool)

(assert (=> d!81929 (=> res!338446 e!314464)))

(assert (=> d!81929 (= res!338446 (bvsge #b00000000000000000000000000000000 (size!16876 a!3154)))))

(assert (=> d!81929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314464)))

(declare-fun b!543908 () Bool)

(assert (=> b!543908 (= e!314466 call!32075)))

(assert (= (and d!81929 (not res!338446)) b!543906))

(assert (= (and b!543906 c!63047) b!543905))

(assert (= (and b!543906 (not c!63047)) b!543907))

(assert (= (and b!543905 res!338447) b!543908))

(assert (= (or b!543908 b!543907) bm!32072))

(declare-fun m!521927 () Bool)

(assert (=> b!543905 m!521927))

(declare-fun m!521929 () Bool)

(assert (=> b!543905 m!521929))

(declare-fun m!521931 () Bool)

(assert (=> b!543905 m!521931))

(assert (=> b!543905 m!521927))

(declare-fun m!521933 () Bool)

(assert (=> b!543905 m!521933))

(declare-fun m!521935 () Bool)

(assert (=> bm!32072 m!521935))

(assert (=> b!543906 m!521927))

(assert (=> b!543906 m!521927))

(declare-fun m!521937 () Bool)

(assert (=> b!543906 m!521937))

(assert (=> b!543804 d!81929))

(declare-fun b!543919 () Bool)

(declare-fun e!314477 () Bool)

(declare-fun e!314478 () Bool)

(assert (=> b!543919 (= e!314477 e!314478)))

(declare-fun res!338455 () Bool)

(assert (=> b!543919 (=> (not res!338455) (not e!314478))))

(declare-fun e!314476 () Bool)

(assert (=> b!543919 (= res!338455 (not e!314476))))

(declare-fun res!338456 () Bool)

(assert (=> b!543919 (=> (not res!338456) (not e!314476))))

(assert (=> b!543919 (= res!338456 (validKeyInArray!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543920 () Bool)

(declare-fun contains!2806 (List!10631 (_ BitVec 64)) Bool)

(assert (=> b!543920 (= e!314476 (contains!2806 Nil!10628 (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543921 () Bool)

(declare-fun e!314475 () Bool)

(declare-fun call!32078 () Bool)

(assert (=> b!543921 (= e!314475 call!32078)))

(declare-fun d!81935 () Bool)

(declare-fun res!338454 () Bool)

(assert (=> d!81935 (=> res!338454 e!314477)))

(assert (=> d!81935 (= res!338454 (bvsge #b00000000000000000000000000000000 (size!16876 a!3154)))))

(assert (=> d!81935 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10628) e!314477)))

(declare-fun b!543922 () Bool)

(assert (=> b!543922 (= e!314475 call!32078)))

(declare-fun bm!32075 () Bool)

(declare-fun c!63050 () Bool)

(assert (=> bm!32075 (= call!32078 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63050 (Cons!10627 (select (arr!16512 a!3154) #b00000000000000000000000000000000) Nil!10628) Nil!10628)))))

(declare-fun b!543923 () Bool)

(assert (=> b!543923 (= e!314478 e!314475)))

(assert (=> b!543923 (= c!63050 (validKeyInArray!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81935 (not res!338454)) b!543919))

(assert (= (and b!543919 res!338456) b!543920))

(assert (= (and b!543919 res!338455) b!543923))

(assert (= (and b!543923 c!63050) b!543922))

(assert (= (and b!543923 (not c!63050)) b!543921))

(assert (= (or b!543922 b!543921) bm!32075))

(assert (=> b!543919 m!521927))

(assert (=> b!543919 m!521927))

(assert (=> b!543919 m!521937))

(assert (=> b!543920 m!521927))

(assert (=> b!543920 m!521927))

(declare-fun m!521939 () Bool)

(assert (=> b!543920 m!521939))

(assert (=> bm!32075 m!521927))

(declare-fun m!521941 () Bool)

(assert (=> bm!32075 m!521941))

(assert (=> b!543923 m!521927))

(assert (=> b!543923 m!521927))

(assert (=> b!543923 m!521937))

(assert (=> b!543799 d!81935))

(declare-fun e!314510 () SeekEntryResult!4970)

(declare-fun lt!248314 () SeekEntryResult!4970)

(declare-fun b!543978 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34358 (_ BitVec 32)) SeekEntryResult!4970)

(assert (=> b!543978 (= e!314510 (seekKeyOrZeroReturnVacant!0 (x!51009 lt!248314) (index!22106 lt!248314) (index!22106 lt!248314) k!1998 a!3154 mask!3216))))

(declare-fun b!543979 () Bool)

(assert (=> b!543979 (= e!314510 (MissingZero!4970 (index!22106 lt!248314)))))

(declare-fun b!543980 () Bool)

(declare-fun e!314512 () SeekEntryResult!4970)

(assert (=> b!543980 (= e!314512 (Found!4970 (index!22106 lt!248314)))))

(declare-fun d!81941 () Bool)

(declare-fun lt!248315 () SeekEntryResult!4970)

(assert (=> d!81941 (and (or (is-Undefined!4970 lt!248315) (not (is-Found!4970 lt!248315)) (and (bvsge (index!22105 lt!248315) #b00000000000000000000000000000000) (bvslt (index!22105 lt!248315) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248315) (is-Found!4970 lt!248315) (not (is-MissingZero!4970 lt!248315)) (and (bvsge (index!22104 lt!248315) #b00000000000000000000000000000000) (bvslt (index!22104 lt!248315) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248315) (is-Found!4970 lt!248315) (is-MissingZero!4970 lt!248315) (not (is-MissingVacant!4970 lt!248315)) (and (bvsge (index!22107 lt!248315) #b00000000000000000000000000000000) (bvslt (index!22107 lt!248315) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248315) (ite (is-Found!4970 lt!248315) (= (select (arr!16512 a!3154) (index!22105 lt!248315)) k!1998) (ite (is-MissingZero!4970 lt!248315) (= (select (arr!16512 a!3154) (index!22104 lt!248315)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4970 lt!248315) (= (select (arr!16512 a!3154) (index!22107 lt!248315)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!314511 () SeekEntryResult!4970)

(assert (=> d!81941 (= lt!248315 e!314511)))

(declare-fun c!63074 () Bool)

(assert (=> d!81941 (= c!63074 (and (is-Intermediate!4970 lt!248314) (undefined!5782 lt!248314)))))

(assert (=> d!81941 (= lt!248314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81941 (validMask!0 mask!3216)))

(assert (=> d!81941 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!248315)))

(declare-fun b!543981 () Bool)

(assert (=> b!543981 (= e!314511 Undefined!4970)))

(declare-fun b!543982 () Bool)

(declare-fun c!63072 () Bool)

(declare-fun lt!248313 () (_ BitVec 64))

(assert (=> b!543982 (= c!63072 (= lt!248313 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543982 (= e!314512 e!314510)))

(declare-fun b!543983 () Bool)

(assert (=> b!543983 (= e!314511 e!314512)))

(assert (=> b!543983 (= lt!248313 (select (arr!16512 a!3154) (index!22106 lt!248314)))))

(declare-fun c!63073 () Bool)

(assert (=> b!543983 (= c!63073 (= lt!248313 k!1998))))

(assert (= (and d!81941 c!63074) b!543981))

(assert (= (and d!81941 (not c!63074)) b!543983))

(assert (= (and b!543983 c!63073) b!543980))

(assert (= (and b!543983 (not c!63073)) b!543982))

(assert (= (and b!543982 c!63072) b!543979))

(assert (= (and b!543982 (not c!63072)) b!543978))

(declare-fun m!521961 () Bool)

(assert (=> b!543978 m!521961))

(declare-fun m!521963 () Bool)

(assert (=> d!81941 m!521963))

(declare-fun m!521965 () Bool)

(assert (=> d!81941 m!521965))

(declare-fun m!521967 () Bool)

(assert (=> d!81941 m!521967))

(declare-fun m!521969 () Bool)

(assert (=> d!81941 m!521969))

(assert (=> d!81941 m!521829))

(assert (=> d!81941 m!521965))

(declare-fun m!521971 () Bool)

(assert (=> d!81941 m!521971))

(declare-fun m!521973 () Bool)

(assert (=> b!543983 m!521973))

(assert (=> b!543805 d!81941))

(declare-fun d!81949 () Bool)

(assert (=> d!81949 (= (validKeyInArray!0 (select (arr!16512 a!3154) j!147)) (and (not (= (select (arr!16512 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16512 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543801 d!81949))

(declare-fun d!81951 () Bool)

(assert (=> d!81951 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49350 d!81951))

(declare-fun d!81961 () Bool)

(assert (=> d!81961 (= (array_inv!12308 a!3154) (bvsge (size!16876 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49350 d!81961))

(declare-fun b!544080 () Bool)

(declare-fun lt!248348 () SeekEntryResult!4970)

(assert (=> b!544080 (and (bvsge (index!22106 lt!248348) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248348) (size!16876 a!3154)))))

(declare-fun e!314579 () Bool)

(assert (=> b!544080 (= e!314579 (= (select (arr!16512 a!3154) (index!22106 lt!248348)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544081 () Bool)

(declare-fun e!314578 () SeekEntryResult!4970)

(declare-fun e!314575 () SeekEntryResult!4970)

(assert (=> b!544081 (= e!314578 e!314575)))

(declare-fun lt!248351 () (_ BitVec 64))

(declare-fun c!63104 () Bool)

(assert (=> b!544081 (= c!63104 (or (= lt!248351 (select (arr!16512 a!3154) j!147)) (= (bvadd lt!248351 lt!248351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544082 () Bool)

(assert (=> b!544082 (and (bvsge (index!22106 lt!248348) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248348) (size!16876 a!3154)))))

(declare-fun res!338515 () Bool)

(assert (=> b!544082 (= res!338515 (= (select (arr!16512 a!3154) (index!22106 lt!248348)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544082 (=> res!338515 e!314579)))

(declare-fun b!544083 () Bool)

(declare-fun e!314577 () Bool)

(assert (=> b!544083 (= e!314577 (bvsge (x!51009 lt!248348) #b01111111111111111111111111111110))))

(declare-fun b!544084 () Bool)

(assert (=> b!544084 (= e!314578 (Intermediate!4970 true index!1177 x!1030))))

(declare-fun b!544085 () Bool)

(assert (=> b!544085 (= e!314575 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544086 () Bool)

(declare-fun e!314576 () Bool)

(assert (=> b!544086 (= e!314577 e!314576)))

(declare-fun res!338513 () Bool)

(assert (=> b!544086 (= res!338513 (and (is-Intermediate!4970 lt!248348) (not (undefined!5782 lt!248348)) (bvslt (x!51009 lt!248348) #b01111111111111111111111111111110) (bvsge (x!51009 lt!248348) #b00000000000000000000000000000000) (bvsge (x!51009 lt!248348) x!1030)))))

(assert (=> b!544086 (=> (not res!338513) (not e!314576))))

(declare-fun d!81963 () Bool)

(assert (=> d!81963 e!314577))

(declare-fun c!63102 () Bool)

(assert (=> d!81963 (= c!63102 (and (is-Intermediate!4970 lt!248348) (undefined!5782 lt!248348)))))

(assert (=> d!81963 (= lt!248348 e!314578)))

(declare-fun c!63103 () Bool)

(assert (=> d!81963 (= c!63103 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81963 (= lt!248351 (select (arr!16512 a!3154) index!1177))))

(assert (=> d!81963 (validMask!0 mask!3216)))

(assert (=> d!81963 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16512 a!3154) j!147) a!3154 mask!3216) lt!248348)))

(declare-fun b!544087 () Bool)

(assert (=> b!544087 (and (bvsge (index!22106 lt!248348) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248348) (size!16876 a!3154)))))

(declare-fun res!338514 () Bool)

(assert (=> b!544087 (= res!338514 (= (select (arr!16512 a!3154) (index!22106 lt!248348)) (select (arr!16512 a!3154) j!147)))))

(assert (=> b!544087 (=> res!338514 e!314579)))

(assert (=> b!544087 (= e!314576 e!314579)))

(declare-fun b!544088 () Bool)

(assert (=> b!544088 (= e!314575 (Intermediate!4970 false index!1177 x!1030))))

(assert (= (and d!81963 c!63103) b!544084))

(assert (= (and d!81963 (not c!63103)) b!544081))

(assert (= (and b!544081 c!63104) b!544088))

(assert (= (and b!544081 (not c!63104)) b!544085))

(assert (= (and d!81963 c!63102) b!544083))

(assert (= (and d!81963 (not c!63102)) b!544086))

(assert (= (and b!544086 res!338513) b!544087))

(assert (= (and b!544087 (not res!338514)) b!544082))

(assert (= (and b!544082 (not res!338515)) b!544080))

(declare-fun m!522015 () Bool)

(assert (=> b!544087 m!522015))

(assert (=> b!544082 m!522015))

(assert (=> b!544085 m!521839))

(assert (=> b!544085 m!521839))

(assert (=> b!544085 m!521833))

(declare-fun m!522017 () Bool)

(assert (=> b!544085 m!522017))

(assert (=> b!544080 m!522015))

(assert (=> d!81963 m!521855))

(assert (=> d!81963 m!521829))

(assert (=> b!543807 d!81963))

(declare-fun d!81981 () Bool)

(assert (=> d!81981 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543802 d!81981))

(declare-fun d!81983 () Bool)

(declare-fun res!338524 () Bool)

(declare-fun e!314590 () Bool)

(assert (=> d!81983 (=> res!338524 e!314590)))

(assert (=> d!81983 (= res!338524 (= (select (arr!16512 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81983 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!314590)))

(declare-fun b!544101 () Bool)

(declare-fun e!314591 () Bool)

(assert (=> b!544101 (= e!314590 e!314591)))

(declare-fun res!338525 () Bool)

(assert (=> b!544101 (=> (not res!338525) (not e!314591))))

(assert (=> b!544101 (= res!338525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(declare-fun b!544102 () Bool)

(assert (=> b!544102 (= e!314591 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81983 (not res!338524)) b!544101))

(assert (= (and b!544101 res!338525) b!544102))

(assert (=> d!81983 m!521927))

(declare-fun m!522019 () Bool)

(assert (=> b!544102 m!522019))

(assert (=> b!543808 d!81983))

(declare-fun b!544103 () Bool)

(declare-fun lt!248362 () SeekEntryResult!4970)

(assert (=> b!544103 (and (bvsge (index!22106 lt!248362) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248362) (size!16876 a!3154)))))

(declare-fun e!314596 () Bool)

(assert (=> b!544103 (= e!314596 (= (select (arr!16512 a!3154) (index!22106 lt!248362)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544104 () Bool)

(declare-fun e!314595 () SeekEntryResult!4970)

(declare-fun e!314592 () SeekEntryResult!4970)

(assert (=> b!544104 (= e!314595 e!314592)))

(declare-fun c!63109 () Bool)

(declare-fun lt!248363 () (_ BitVec 64))

(assert (=> b!544104 (= c!63109 (or (= lt!248363 (select (arr!16512 a!3154) j!147)) (= (bvadd lt!248363 lt!248363) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544105 () Bool)

(assert (=> b!544105 (and (bvsge (index!22106 lt!248362) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248362) (size!16876 a!3154)))))

(declare-fun res!338528 () Bool)

(assert (=> b!544105 (= res!338528 (= (select (arr!16512 a!3154) (index!22106 lt!248362)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544105 (=> res!338528 e!314596)))

(declare-fun b!544106 () Bool)

(declare-fun e!314594 () Bool)

(assert (=> b!544106 (= e!314594 (bvsge (x!51009 lt!248362) #b01111111111111111111111111111110))))

(declare-fun b!544107 () Bool)

(assert (=> b!544107 (= e!314595 (Intermediate!4970 true (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544108 () Bool)

(assert (=> b!544108 (= e!314592 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544109 () Bool)

(declare-fun e!314593 () Bool)

(assert (=> b!544109 (= e!314594 e!314593)))

(declare-fun res!338526 () Bool)

(assert (=> b!544109 (= res!338526 (and (is-Intermediate!4970 lt!248362) (not (undefined!5782 lt!248362)) (bvslt (x!51009 lt!248362) #b01111111111111111111111111111110) (bvsge (x!51009 lt!248362) #b00000000000000000000000000000000) (bvsge (x!51009 lt!248362) #b00000000000000000000000000000000)))))

(assert (=> b!544109 (=> (not res!338526) (not e!314593))))

(declare-fun d!81985 () Bool)

(assert (=> d!81985 e!314594))

(declare-fun c!63107 () Bool)

(assert (=> d!81985 (= c!63107 (and (is-Intermediate!4970 lt!248362) (undefined!5782 lt!248362)))))

(assert (=> d!81985 (= lt!248362 e!314595)))

(declare-fun c!63108 () Bool)

(assert (=> d!81985 (= c!63108 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81985 (= lt!248363 (select (arr!16512 a!3154) (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216)))))

(assert (=> d!81985 (validMask!0 mask!3216)))

(assert (=> d!81985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216) lt!248362)))

(declare-fun b!544110 () Bool)

(assert (=> b!544110 (and (bvsge (index!22106 lt!248362) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248362) (size!16876 a!3154)))))

(declare-fun res!338527 () Bool)

(assert (=> b!544110 (= res!338527 (= (select (arr!16512 a!3154) (index!22106 lt!248362)) (select (arr!16512 a!3154) j!147)))))

(assert (=> b!544110 (=> res!338527 e!314596)))

(assert (=> b!544110 (= e!314593 e!314596)))

(declare-fun b!544111 () Bool)

(assert (=> b!544111 (= e!314592 (Intermediate!4970 false (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!81985 c!63108) b!544107))

(assert (= (and d!81985 (not c!63108)) b!544104))

(assert (= (and b!544104 c!63109) b!544111))

(assert (= (and b!544104 (not c!63109)) b!544108))

(assert (= (and d!81985 c!63107) b!544106))

(assert (= (and d!81985 (not c!63107)) b!544109))

(assert (= (and b!544109 res!338526) b!544110))

(assert (= (and b!544110 (not res!338527)) b!544105))

(assert (= (and b!544105 (not res!338528)) b!544103))

(declare-fun m!522021 () Bool)

(assert (=> b!544110 m!522021))

(assert (=> b!544105 m!522021))

(assert (=> b!544108 m!521841))

(declare-fun m!522023 () Bool)

(assert (=> b!544108 m!522023))

(assert (=> b!544108 m!522023))

(assert (=> b!544108 m!521833))

(declare-fun m!522025 () Bool)

(assert (=> b!544108 m!522025))

(assert (=> b!544103 m!522021))

(assert (=> d!81985 m!521841))

(declare-fun m!522027 () Bool)

(assert (=> d!81985 m!522027))

(assert (=> d!81985 m!521829))

(assert (=> b!543803 d!81985))

(declare-fun d!81987 () Bool)

(declare-fun lt!248372 () (_ BitVec 32))

(declare-fun lt!248371 () (_ BitVec 32))

(assert (=> d!81987 (= lt!248372 (bvmul (bvxor lt!248371 (bvlshr lt!248371 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81987 (= lt!248371 ((_ extract 31 0) (bvand (bvxor (select (arr!16512 a!3154) j!147) (bvlshr (select (arr!16512 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81987 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338531 (let ((h!11587 ((_ extract 31 0) (bvand (bvxor (select (arr!16512 a!3154) j!147) (bvlshr (select (arr!16512 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51019 (bvmul (bvxor h!11587 (bvlshr h!11587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51019 (bvlshr x!51019 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338531 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338531 #b00000000000000000000000000000000))))))

(assert (=> d!81987 (= (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) (bvand (bvxor lt!248372 (bvlshr lt!248372 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!543803 d!81987))

(declare-fun d!81991 () Bool)

(declare-fun lt!248375 () (_ BitVec 32))

(assert (=> d!81991 (and (bvsge lt!248375 #b00000000000000000000000000000000) (bvslt lt!248375 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81991 (= lt!248375 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!81991 (validMask!0 mask!3216)))

(assert (=> d!81991 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248375)))

(declare-fun bs!16977 () Bool)

(assert (= bs!16977 d!81991))

(declare-fun m!522037 () Bool)

(assert (=> bs!16977 m!522037))

(assert (=> bs!16977 m!521829))

(assert (=> b!543809 d!81991))

(push 1)

(assert (not b!543923))

(assert (not b!543919))

(assert (not d!81991))

(assert (not b!543906))

(assert (not b!543920))

(assert (not b!543905))

(assert (not d!81963))

(assert (not d!81941))

(assert (not b!543978))

(assert (not b!544102))

(assert (not b!544108))

(assert (not b!544085))

(assert (not bm!32072))

(assert (not bm!32075))

(assert (not d!81985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81995 () Bool)

(declare-fun res!338535 () Bool)

(declare-fun e!314614 () Bool)

(assert (=> d!81995 (=> res!338535 e!314614)))

(assert (=> d!81995 (= res!338535 (= (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!1998))))

(assert (=> d!81995 (= (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!314614)))

(declare-fun b!544143 () Bool)

(declare-fun e!314615 () Bool)

(assert (=> b!544143 (= e!314614 e!314615)))

(declare-fun res!338536 () Bool)

(assert (=> b!544143 (=> (not res!338536) (not e!314615))))

(assert (=> b!544143 (= res!338536 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(declare-fun b!544144 () Bool)

(assert (=> b!544144 (= e!314615 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!81995 (not res!338535)) b!544143))

(assert (= (and b!544143 res!338536) b!544144))

(declare-fun m!522057 () Bool)

(assert (=> d!81995 m!522057))

(declare-fun m!522059 () Bool)

(assert (=> b!544144 m!522059))

(assert (=> b!544102 d!81995))

(declare-fun d!81997 () Bool)

(assert (=> d!81997 (= (validKeyInArray!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000)) (and (not (= (select (arr!16512 a!3154) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16512 a!3154) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543919 d!81997))

(assert (=> d!81963 d!81951))

(assert (=> b!543906 d!81997))

(declare-fun b!544145 () Bool)

(declare-fun e!314617 () Bool)

(declare-fun e!314618 () Bool)

(assert (=> b!544145 (= e!314617 e!314618)))

(declare-fun lt!248388 () (_ BitVec 64))

(assert (=> b!544145 (= lt!248388 (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!248389 () Unit!16904)

(assert (=> b!544145 (= lt!248389 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!544145 (arrayContainsKey!0 a!3154 lt!248388 #b00000000000000000000000000000000)))

(declare-fun lt!248387 () Unit!16904)

(assert (=> b!544145 (= lt!248387 lt!248389)))

(declare-fun res!338538 () Bool)

(assert (=> b!544145 (= res!338538 (= (seekEntryOrOpen!0 (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3154 mask!3216) (Found!4970 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544145 (=> (not res!338538) (not e!314618))))

(declare-fun bm!32085 () Bool)

(declare-fun call!32088 () Bool)

(assert (=> bm!32085 (= call!32088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544146 () Bool)

(declare-fun e!314616 () Bool)

(assert (=> b!544146 (= e!314616 e!314617)))

(declare-fun c!63123 () Bool)

(assert (=> b!544146 (= c!63123 (validKeyInArray!0 (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544147 () Bool)

(assert (=> b!544147 (= e!314617 call!32088)))

(declare-fun d!81999 () Bool)

(declare-fun res!338537 () Bool)

(assert (=> d!81999 (=> res!338537 e!314616)))

(assert (=> d!81999 (= res!338537 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(assert (=> d!81999 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216) e!314616)))

(declare-fun b!544148 () Bool)

(assert (=> b!544148 (= e!314618 call!32088)))

(assert (= (and d!81999 (not res!338537)) b!544146))

(assert (= (and b!544146 c!63123) b!544145))

(assert (= (and b!544146 (not c!63123)) b!544147))

(assert (= (and b!544145 res!338538) b!544148))

(assert (= (or b!544148 b!544147) bm!32085))

(assert (=> b!544145 m!522057))

(declare-fun m!522061 () Bool)

(assert (=> b!544145 m!522061))

(declare-fun m!522063 () Bool)

(assert (=> b!544145 m!522063))

(assert (=> b!544145 m!522057))

(declare-fun m!522065 () Bool)

(assert (=> b!544145 m!522065))

(declare-fun m!522067 () Bool)

(assert (=> bm!32085 m!522067))

(assert (=> b!544146 m!522057))

(assert (=> b!544146 m!522057))

(declare-fun m!522069 () Bool)

(assert (=> b!544146 m!522069))

(assert (=> bm!32072 d!81999))

(declare-fun d!82001 () Bool)

(declare-fun res!338541 () (_ BitVec 32))

(assert (=> d!82001 (and (bvsge res!338541 #b00000000000000000000000000000000) (bvslt res!338541 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82001 true))

(assert (=> d!82001 (= (choose!52 index!1177 x!1030 mask!3216) res!338541)))

(assert (=> d!81991 d!82001))

(assert (=> d!81991 d!81951))

(assert (=> b!543923 d!81997))

(declare-fun d!82003 () Bool)

(assert (=> d!82003 (arrayContainsKey!0 a!3154 lt!248289 #b00000000000000000000000000000000)))

(declare-fun lt!248392 () Unit!16904)

(declare-fun choose!13 (array!34358 (_ BitVec 64) (_ BitVec 32)) Unit!16904)

(assert (=> d!82003 (= lt!248392 (choose!13 a!3154 lt!248289 #b00000000000000000000000000000000))))

(assert (=> d!82003 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!82003 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248289 #b00000000000000000000000000000000) lt!248392)))

(declare-fun bs!16978 () Bool)

(assert (= bs!16978 d!82003))

(assert (=> bs!16978 m!521931))

(declare-fun m!522071 () Bool)

(assert (=> bs!16978 m!522071))

(assert (=> b!543905 d!82003))

(declare-fun d!82005 () Bool)

(declare-fun res!338542 () Bool)

(declare-fun e!314619 () Bool)

(assert (=> d!82005 (=> res!338542 e!314619)))

(assert (=> d!82005 (= res!338542 (= (select (arr!16512 a!3154) #b00000000000000000000000000000000) lt!248289))))

(assert (=> d!82005 (= (arrayContainsKey!0 a!3154 lt!248289 #b00000000000000000000000000000000) e!314619)))

(declare-fun b!544149 () Bool)

(declare-fun e!314620 () Bool)

(assert (=> b!544149 (= e!314619 e!314620)))

(declare-fun res!338543 () Bool)

(assert (=> b!544149 (=> (not res!338543) (not e!314620))))

(assert (=> b!544149 (= res!338543 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(declare-fun b!544150 () Bool)

(assert (=> b!544150 (= e!314620 (arrayContainsKey!0 a!3154 lt!248289 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82005 (not res!338542)) b!544149))

(assert (= (and b!544149 res!338543) b!544150))

(assert (=> d!82005 m!521927))

(declare-fun m!522073 () Bool)

(assert (=> b!544150 m!522073))

(assert (=> b!543905 d!82005))

(declare-fun b!544151 () Bool)

(declare-fun lt!248394 () SeekEntryResult!4970)

(declare-fun e!314621 () SeekEntryResult!4970)

(assert (=> b!544151 (= e!314621 (seekKeyOrZeroReturnVacant!0 (x!51009 lt!248394) (index!22106 lt!248394) (index!22106 lt!248394) (select (arr!16512 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(declare-fun b!544152 () Bool)

(assert (=> b!544152 (= e!314621 (MissingZero!4970 (index!22106 lt!248394)))))

(declare-fun b!544153 () Bool)

(declare-fun e!314623 () SeekEntryResult!4970)

(assert (=> b!544153 (= e!314623 (Found!4970 (index!22106 lt!248394)))))

(declare-fun d!82007 () Bool)

(declare-fun lt!248395 () SeekEntryResult!4970)

(assert (=> d!82007 (and (or (is-Undefined!4970 lt!248395) (not (is-Found!4970 lt!248395)) (and (bvsge (index!22105 lt!248395) #b00000000000000000000000000000000) (bvslt (index!22105 lt!248395) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248395) (is-Found!4970 lt!248395) (not (is-MissingZero!4970 lt!248395)) (and (bvsge (index!22104 lt!248395) #b00000000000000000000000000000000) (bvslt (index!22104 lt!248395) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248395) (is-Found!4970 lt!248395) (is-MissingZero!4970 lt!248395) (not (is-MissingVacant!4970 lt!248395)) (and (bvsge (index!22107 lt!248395) #b00000000000000000000000000000000) (bvslt (index!22107 lt!248395) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248395) (ite (is-Found!4970 lt!248395) (= (select (arr!16512 a!3154) (index!22105 lt!248395)) (select (arr!16512 a!3154) #b00000000000000000000000000000000)) (ite (is-MissingZero!4970 lt!248395) (= (select (arr!16512 a!3154) (index!22104 lt!248395)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4970 lt!248395) (= (select (arr!16512 a!3154) (index!22107 lt!248395)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!314622 () SeekEntryResult!4970)

(assert (=> d!82007 (= lt!248395 e!314622)))

(declare-fun c!63126 () Bool)

(assert (=> d!82007 (= c!63126 (and (is-Intermediate!4970 lt!248394) (undefined!5782 lt!248394)))))

(assert (=> d!82007 (= lt!248394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000) mask!3216) (select (arr!16512 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(assert (=> d!82007 (validMask!0 mask!3216)))

(assert (=> d!82007 (= (seekEntryOrOpen!0 (select (arr!16512 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) lt!248395)))

(declare-fun b!544154 () Bool)

(assert (=> b!544154 (= e!314622 Undefined!4970)))

(declare-fun b!544155 () Bool)

(declare-fun c!63124 () Bool)

(declare-fun lt!248393 () (_ BitVec 64))

(assert (=> b!544155 (= c!63124 (= lt!248393 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544155 (= e!314623 e!314621)))

(declare-fun b!544156 () Bool)

(assert (=> b!544156 (= e!314622 e!314623)))

(assert (=> b!544156 (= lt!248393 (select (arr!16512 a!3154) (index!22106 lt!248394)))))

(declare-fun c!63125 () Bool)

(assert (=> b!544156 (= c!63125 (= lt!248393 (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82007 c!63126) b!544154))

(assert (= (and d!82007 (not c!63126)) b!544156))

(assert (= (and b!544156 c!63125) b!544153))

(assert (= (and b!544156 (not c!63125)) b!544155))

(assert (= (and b!544155 c!63124) b!544152))

(assert (= (and b!544155 (not c!63124)) b!544151))

(assert (=> b!544151 m!521927))

(declare-fun m!522075 () Bool)

(assert (=> b!544151 m!522075))

(declare-fun m!522077 () Bool)

(assert (=> d!82007 m!522077))

(declare-fun m!522079 () Bool)

(assert (=> d!82007 m!522079))

(assert (=> d!82007 m!521927))

(declare-fun m!522081 () Bool)

(assert (=> d!82007 m!522081))

(declare-fun m!522083 () Bool)

(assert (=> d!82007 m!522083))

(assert (=> d!82007 m!521829))

(assert (=> d!82007 m!521927))

(assert (=> d!82007 m!522079))

(declare-fun m!522085 () Bool)

(assert (=> d!82007 m!522085))

(declare-fun m!522087 () Bool)

(assert (=> b!544156 m!522087))

(assert (=> b!543905 d!82007))

(assert (=> d!81985 d!81951))

(declare-fun b!544157 () Bool)

(declare-fun e!314626 () Bool)

(declare-fun e!314627 () Bool)

(assert (=> b!544157 (= e!314626 e!314627)))

(declare-fun res!338545 () Bool)

(assert (=> b!544157 (=> (not res!338545) (not e!314627))))

(declare-fun e!314625 () Bool)

(assert (=> b!544157 (= res!338545 (not e!314625))))

(declare-fun res!338546 () Bool)

(assert (=> b!544157 (=> (not res!338546) (not e!314625))))

(assert (=> b!544157 (= res!338546 (validKeyInArray!0 (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544158 () Bool)

(assert (=> b!544158 (= e!314625 (contains!2806 (ite c!63050 (Cons!10627 (select (arr!16512 a!3154) #b00000000000000000000000000000000) Nil!10628) Nil!10628) (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544159 () Bool)

(declare-fun e!314624 () Bool)

(declare-fun call!32089 () Bool)

(assert (=> b!544159 (= e!314624 call!32089)))

(declare-fun d!82009 () Bool)

(declare-fun res!338544 () Bool)

(assert (=> d!82009 (=> res!338544 e!314626)))

(assert (=> d!82009 (= res!338544 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16876 a!3154)))))

(assert (=> d!82009 (= (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63050 (Cons!10627 (select (arr!16512 a!3154) #b00000000000000000000000000000000) Nil!10628) Nil!10628)) e!314626)))

(declare-fun b!544160 () Bool)

(assert (=> b!544160 (= e!314624 call!32089)))

(declare-fun c!63127 () Bool)

(declare-fun bm!32086 () Bool)

(assert (=> bm!32086 (= call!32089 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!63127 (Cons!10627 (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!63050 (Cons!10627 (select (arr!16512 a!3154) #b00000000000000000000000000000000) Nil!10628) Nil!10628)) (ite c!63050 (Cons!10627 (select (arr!16512 a!3154) #b00000000000000000000000000000000) Nil!10628) Nil!10628))))))

(declare-fun b!544161 () Bool)

(assert (=> b!544161 (= e!314627 e!314624)))

(assert (=> b!544161 (= c!63127 (validKeyInArray!0 (select (arr!16512 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!82009 (not res!338544)) b!544157))

(assert (= (and b!544157 res!338546) b!544158))

(assert (= (and b!544157 res!338545) b!544161))

(assert (= (and b!544161 c!63127) b!544160))

(assert (= (and b!544161 (not c!63127)) b!544159))

(assert (= (or b!544160 b!544159) bm!32086))

(assert (=> b!544157 m!522057))

(assert (=> b!544157 m!522057))

(assert (=> b!544157 m!522069))

(assert (=> b!544158 m!522057))

(assert (=> b!544158 m!522057))

(declare-fun m!522089 () Bool)

(assert (=> b!544158 m!522089))

(assert (=> bm!32086 m!522057))

(declare-fun m!522091 () Bool)

(assert (=> bm!32086 m!522091))

(assert (=> b!544161 m!522057))

(assert (=> b!544161 m!522057))

(assert (=> b!544161 m!522069))

(assert (=> bm!32075 d!82009))

(declare-fun b!544174 () Bool)

(declare-fun c!63134 () Bool)

(declare-fun lt!248401 () (_ BitVec 64))

(assert (=> b!544174 (= c!63134 (= lt!248401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314634 () SeekEntryResult!4970)

(declare-fun e!314636 () SeekEntryResult!4970)

(assert (=> b!544174 (= e!314634 e!314636)))

(declare-fun d!82011 () Bool)

(declare-fun lt!248400 () SeekEntryResult!4970)

(assert (=> d!82011 (and (or (is-Undefined!4970 lt!248400) (not (is-Found!4970 lt!248400)) (and (bvsge (index!22105 lt!248400) #b00000000000000000000000000000000) (bvslt (index!22105 lt!248400) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248400) (is-Found!4970 lt!248400) (not (is-MissingVacant!4970 lt!248400)) (not (= (index!22107 lt!248400) (index!22106 lt!248314))) (and (bvsge (index!22107 lt!248400) #b00000000000000000000000000000000) (bvslt (index!22107 lt!248400) (size!16876 a!3154)))) (or (is-Undefined!4970 lt!248400) (ite (is-Found!4970 lt!248400) (= (select (arr!16512 a!3154) (index!22105 lt!248400)) k!1998) (and (is-MissingVacant!4970 lt!248400) (= (index!22107 lt!248400) (index!22106 lt!248314)) (= (select (arr!16512 a!3154) (index!22107 lt!248400)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!314635 () SeekEntryResult!4970)

(assert (=> d!82011 (= lt!248400 e!314635)))

(declare-fun c!63136 () Bool)

(assert (=> d!82011 (= c!63136 (bvsge (x!51009 lt!248314) #b01111111111111111111111111111110))))

(assert (=> d!82011 (= lt!248401 (select (arr!16512 a!3154) (index!22106 lt!248314)))))

(assert (=> d!82011 (validMask!0 mask!3216)))

(assert (=> d!82011 (= (seekKeyOrZeroReturnVacant!0 (x!51009 lt!248314) (index!22106 lt!248314) (index!22106 lt!248314) k!1998 a!3154 mask!3216) lt!248400)))

(declare-fun b!544175 () Bool)

(assert (=> b!544175 (= e!314634 (Found!4970 (index!22106 lt!248314)))))

(declare-fun b!544176 () Bool)

(assert (=> b!544176 (= e!314635 Undefined!4970)))

(declare-fun b!544177 () Bool)

(assert (=> b!544177 (= e!314635 e!314634)))

(declare-fun c!63135 () Bool)

(assert (=> b!544177 (= c!63135 (= lt!248401 k!1998))))

(declare-fun b!544178 () Bool)

(assert (=> b!544178 (= e!314636 (seekKeyOrZeroReturnVacant!0 (bvadd (x!51009 lt!248314) #b00000000000000000000000000000001) (nextIndex!0 (index!22106 lt!248314) (x!51009 lt!248314) mask!3216) (index!22106 lt!248314) k!1998 a!3154 mask!3216))))

(declare-fun b!544179 () Bool)

(assert (=> b!544179 (= e!314636 (MissingVacant!4970 (index!22106 lt!248314)))))

(assert (= (and d!82011 c!63136) b!544176))

(assert (= (and d!82011 (not c!63136)) b!544177))

(assert (= (and b!544177 c!63135) b!544175))

(assert (= (and b!544177 (not c!63135)) b!544174))

(assert (= (and b!544174 c!63134) b!544179))

(assert (= (and b!544174 (not c!63134)) b!544178))

(declare-fun m!522093 () Bool)

(assert (=> d!82011 m!522093))

(declare-fun m!522095 () Bool)

(assert (=> d!82011 m!522095))

(assert (=> d!82011 m!521973))

(assert (=> d!82011 m!521829))

(declare-fun m!522097 () Bool)

(assert (=> b!544178 m!522097))

(assert (=> b!544178 m!522097))

(declare-fun m!522099 () Bool)

(assert (=> b!544178 m!522099))

(assert (=> b!543978 d!82011))

(declare-fun b!544180 () Bool)

(declare-fun lt!248402 () SeekEntryResult!4970)

(assert (=> b!544180 (and (bvsge (index!22106 lt!248402) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248402) (size!16876 a!3154)))))

(declare-fun e!314641 () Bool)

(assert (=> b!544180 (= e!314641 (= (select (arr!16512 a!3154) (index!22106 lt!248402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544181 () Bool)

(declare-fun e!314640 () SeekEntryResult!4970)

(declare-fun e!314637 () SeekEntryResult!4970)

(assert (=> b!544181 (= e!314640 e!314637)))

(declare-fun lt!248403 () (_ BitVec 64))

(declare-fun c!63139 () Bool)

(assert (=> b!544181 (= c!63139 (or (= lt!248403 (select (arr!16512 a!3154) j!147)) (= (bvadd lt!248403 lt!248403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544182 () Bool)

(assert (=> b!544182 (and (bvsge (index!22106 lt!248402) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248402) (size!16876 a!3154)))))

(declare-fun res!338549 () Bool)

(assert (=> b!544182 (= res!338549 (= (select (arr!16512 a!3154) (index!22106 lt!248402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544182 (=> res!338549 e!314641)))

(declare-fun b!544183 () Bool)

(declare-fun e!314639 () Bool)

(assert (=> b!544183 (= e!314639 (bvsge (x!51009 lt!248402) #b01111111111111111111111111111110))))

(declare-fun b!544184 () Bool)

(assert (=> b!544184 (= e!314640 (Intermediate!4970 true (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!544185 () Bool)

(assert (=> b!544185 (= e!314637 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544186 () Bool)

(declare-fun e!314638 () Bool)

(assert (=> b!544186 (= e!314639 e!314638)))

(declare-fun res!338547 () Bool)

(assert (=> b!544186 (= res!338547 (and (is-Intermediate!4970 lt!248402) (not (undefined!5782 lt!248402)) (bvslt (x!51009 lt!248402) #b01111111111111111111111111111110) (bvsge (x!51009 lt!248402) #b00000000000000000000000000000000) (bvsge (x!51009 lt!248402) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544186 (=> (not res!338547) (not e!314638))))

(declare-fun d!82013 () Bool)

(assert (=> d!82013 e!314639))

(declare-fun c!63137 () Bool)

(assert (=> d!82013 (= c!63137 (and (is-Intermediate!4970 lt!248402) (undefined!5782 lt!248402)))))

(assert (=> d!82013 (= lt!248402 e!314640)))

(declare-fun c!63138 () Bool)

(assert (=> d!82013 (= c!63138 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!82013 (= lt!248403 (select (arr!16512 a!3154) (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216)))))

(assert (=> d!82013 (validMask!0 mask!3216)))

(assert (=> d!82013 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216) lt!248402)))

(declare-fun b!544187 () Bool)

(assert (=> b!544187 (and (bvsge (index!22106 lt!248402) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248402) (size!16876 a!3154)))))

(declare-fun res!338548 () Bool)

(assert (=> b!544187 (= res!338548 (= (select (arr!16512 a!3154) (index!22106 lt!248402)) (select (arr!16512 a!3154) j!147)))))

(assert (=> b!544187 (=> res!338548 e!314641)))

(assert (=> b!544187 (= e!314638 e!314641)))

(declare-fun b!544188 () Bool)

(assert (=> b!544188 (= e!314637 (Intermediate!4970 false (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82013 c!63138) b!544184))

(assert (= (and d!82013 (not c!63138)) b!544181))

(assert (= (and b!544181 c!63139) b!544188))

(assert (= (and b!544181 (not c!63139)) b!544185))

(assert (= (and d!82013 c!63137) b!544183))

(assert (= (and d!82013 (not c!63137)) b!544186))

(assert (= (and b!544186 res!338547) b!544187))

(assert (= (and b!544187 (not res!338548)) b!544182))

(assert (= (and b!544182 (not res!338549)) b!544180))

(declare-fun m!522101 () Bool)

(assert (=> b!544187 m!522101))

(assert (=> b!544182 m!522101))

(assert (=> b!544185 m!522023))

(declare-fun m!522103 () Bool)

(assert (=> b!544185 m!522103))

(assert (=> b!544185 m!522103))

(assert (=> b!544185 m!521833))

(declare-fun m!522105 () Bool)

(assert (=> b!544185 m!522105))

(assert (=> b!544180 m!522101))

(assert (=> d!82013 m!522023))

(declare-fun m!522107 () Bool)

(assert (=> d!82013 m!522107))

(assert (=> d!82013 m!521829))

(assert (=> b!544108 d!82013))

(declare-fun d!82015 () Bool)

(declare-fun lt!248404 () (_ BitVec 32))

(assert (=> d!82015 (and (bvsge lt!248404 #b00000000000000000000000000000000) (bvslt lt!248404 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82015 (= lt!248404 (choose!52 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216))))

(assert (=> d!82015 (validMask!0 mask!3216)))

(assert (=> d!82015 (= (nextIndex!0 (toIndex!0 (select (arr!16512 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) lt!248404)))

(declare-fun bs!16979 () Bool)

(assert (= bs!16979 d!82015))

(assert (=> bs!16979 m!521841))

(declare-fun m!522109 () Bool)

(assert (=> bs!16979 m!522109))

(assert (=> bs!16979 m!521829))

(assert (=> b!544108 d!82015))

(declare-fun b!544189 () Bool)

(declare-fun lt!248405 () SeekEntryResult!4970)

(assert (=> b!544189 (and (bvsge (index!22106 lt!248405) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248405) (size!16876 a!3154)))))

(declare-fun e!314646 () Bool)

(assert (=> b!544189 (= e!314646 (= (select (arr!16512 a!3154) (index!22106 lt!248405)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544190 () Bool)

(declare-fun e!314645 () SeekEntryResult!4970)

(declare-fun e!314642 () SeekEntryResult!4970)

(assert (=> b!544190 (= e!314645 e!314642)))

(declare-fun lt!248406 () (_ BitVec 64))

(declare-fun c!63142 () Bool)

(assert (=> b!544190 (= c!63142 (or (= lt!248406 (select (arr!16512 a!3154) j!147)) (= (bvadd lt!248406 lt!248406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544191 () Bool)

(assert (=> b!544191 (and (bvsge (index!22106 lt!248405) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248405) (size!16876 a!3154)))))

(declare-fun res!338552 () Bool)

(assert (=> b!544191 (= res!338552 (= (select (arr!16512 a!3154) (index!22106 lt!248405)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544191 (=> res!338552 e!314646)))

(declare-fun b!544192 () Bool)

(declare-fun e!314644 () Bool)

(assert (=> b!544192 (= e!314644 (bvsge (x!51009 lt!248405) #b01111111111111111111111111111110))))

(declare-fun b!544193 () Bool)

(assert (=> b!544193 (= e!314645 (Intermediate!4970 true (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544194 () Bool)

(assert (=> b!544194 (= e!314642 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544195 () Bool)

(declare-fun e!314643 () Bool)

(assert (=> b!544195 (= e!314644 e!314643)))

(declare-fun res!338550 () Bool)

(assert (=> b!544195 (= res!338550 (and (is-Intermediate!4970 lt!248405) (not (undefined!5782 lt!248405)) (bvslt (x!51009 lt!248405) #b01111111111111111111111111111110) (bvsge (x!51009 lt!248405) #b00000000000000000000000000000000) (bvsge (x!51009 lt!248405) (bvadd x!1030 #b00000000000000000000000000000001))))))

(assert (=> b!544195 (=> (not res!338550) (not e!314643))))

(declare-fun d!82017 () Bool)

(assert (=> d!82017 e!314644))

(declare-fun c!63140 () Bool)

(assert (=> d!82017 (= c!63140 (and (is-Intermediate!4970 lt!248405) (undefined!5782 lt!248405)))))

(assert (=> d!82017 (= lt!248405 e!314645)))

(declare-fun c!63141 () Bool)

(assert (=> d!82017 (= c!63141 (bvsge (bvadd x!1030 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!82017 (= lt!248406 (select (arr!16512 a!3154) (nextIndex!0 index!1177 x!1030 mask!3216)))))

(assert (=> d!82017 (validMask!0 mask!3216)))

(assert (=> d!82017 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16512 a!3154) j!147) a!3154 mask!3216) lt!248405)))

(declare-fun b!544196 () Bool)

(assert (=> b!544196 (and (bvsge (index!22106 lt!248405) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248405) (size!16876 a!3154)))))

(declare-fun res!338551 () Bool)

(assert (=> b!544196 (= res!338551 (= (select (arr!16512 a!3154) (index!22106 lt!248405)) (select (arr!16512 a!3154) j!147)))))

(assert (=> b!544196 (=> res!338551 e!314646)))

(assert (=> b!544196 (= e!314643 e!314646)))

(declare-fun b!544197 () Bool)

(assert (=> b!544197 (= e!314642 (Intermediate!4970 false (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(assert (= (and d!82017 c!63141) b!544193))

(assert (= (and d!82017 (not c!63141)) b!544190))

(assert (= (and b!544190 c!63142) b!544197))

(assert (= (and b!544190 (not c!63142)) b!544194))

(assert (= (and d!82017 c!63140) b!544192))

(assert (= (and d!82017 (not c!63140)) b!544195))

(assert (= (and b!544195 res!338550) b!544196))

(assert (= (and b!544196 (not res!338551)) b!544191))

(assert (= (and b!544191 (not res!338552)) b!544189))

(declare-fun m!522111 () Bool)

(assert (=> b!544196 m!522111))

(assert (=> b!544191 m!522111))

(assert (=> b!544194 m!521839))

(declare-fun m!522113 () Bool)

(assert (=> b!544194 m!522113))

(assert (=> b!544194 m!522113))

(assert (=> b!544194 m!521833))

(declare-fun m!522115 () Bool)

(assert (=> b!544194 m!522115))

(assert (=> b!544189 m!522111))

(assert (=> d!82017 m!521839))

(declare-fun m!522117 () Bool)

(assert (=> d!82017 m!522117))

(assert (=> d!82017 m!521829))

(assert (=> b!544085 d!82017))

(assert (=> b!544085 d!81991))

(declare-fun d!82019 () Bool)

(declare-fun lt!248409 () Bool)

(declare-fun content!225 (List!10631) (Set (_ BitVec 64)))

(assert (=> d!82019 (= lt!248409 (set.member (select (arr!16512 a!3154) #b00000000000000000000000000000000) (content!225 Nil!10628)))))

(declare-fun e!314652 () Bool)

(assert (=> d!82019 (= lt!248409 e!314652)))

(declare-fun res!338558 () Bool)

(assert (=> d!82019 (=> (not res!338558) (not e!314652))))

(assert (=> d!82019 (= res!338558 (is-Cons!10627 Nil!10628))))

(assert (=> d!82019 (= (contains!2806 Nil!10628 (select (arr!16512 a!3154) #b00000000000000000000000000000000)) lt!248409)))

(declare-fun b!544202 () Bool)

(declare-fun e!314651 () Bool)

(assert (=> b!544202 (= e!314652 e!314651)))

(declare-fun res!338557 () Bool)

(assert (=> b!544202 (=> res!338557 e!314651)))

(assert (=> b!544202 (= res!338557 (= (h!11582 Nil!10628) (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544203 () Bool)

(assert (=> b!544203 (= e!314651 (contains!2806 (t!16859 Nil!10628) (select (arr!16512 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82019 res!338558) b!544202))

(assert (= (and b!544202 (not res!338557)) b!544203))

(declare-fun m!522119 () Bool)

(assert (=> d!82019 m!522119))

(assert (=> d!82019 m!521927))

(declare-fun m!522121 () Bool)

(assert (=> d!82019 m!522121))

(assert (=> b!544203 m!521927))

(declare-fun m!522123 () Bool)

(assert (=> b!544203 m!522123))

(assert (=> b!543920 d!82019))

(declare-fun b!544204 () Bool)

(declare-fun lt!248410 () SeekEntryResult!4970)

(assert (=> b!544204 (and (bvsge (index!22106 lt!248410) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248410) (size!16876 a!3154)))))

(declare-fun e!314657 () Bool)

(assert (=> b!544204 (= e!314657 (= (select (arr!16512 a!3154) (index!22106 lt!248410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544205 () Bool)

(declare-fun e!314656 () SeekEntryResult!4970)

(declare-fun e!314653 () SeekEntryResult!4970)

(assert (=> b!544205 (= e!314656 e!314653)))

(declare-fun c!63145 () Bool)

(declare-fun lt!248411 () (_ BitVec 64))

(assert (=> b!544205 (= c!63145 (or (= lt!248411 k!1998) (= (bvadd lt!248411 lt!248411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544206 () Bool)

(assert (=> b!544206 (and (bvsge (index!22106 lt!248410) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248410) (size!16876 a!3154)))))

(declare-fun res!338561 () Bool)

(assert (=> b!544206 (= res!338561 (= (select (arr!16512 a!3154) (index!22106 lt!248410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544206 (=> res!338561 e!314657)))

(declare-fun b!544207 () Bool)

(declare-fun e!314655 () Bool)

(assert (=> b!544207 (= e!314655 (bvsge (x!51009 lt!248410) #b01111111111111111111111111111110))))

(declare-fun b!544208 () Bool)

(assert (=> b!544208 (= e!314656 (Intermediate!4970 true (toIndex!0 k!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544209 () Bool)

(assert (=> b!544209 (= e!314653 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!1998 mask!3216) #b00000000000000000000000000000000 mask!3216) k!1998 a!3154 mask!3216))))

(declare-fun b!544210 () Bool)

(declare-fun e!314654 () Bool)

(assert (=> b!544210 (= e!314655 e!314654)))

(declare-fun res!338559 () Bool)

(assert (=> b!544210 (= res!338559 (and (is-Intermediate!4970 lt!248410) (not (undefined!5782 lt!248410)) (bvslt (x!51009 lt!248410) #b01111111111111111111111111111110) (bvsge (x!51009 lt!248410) #b00000000000000000000000000000000) (bvsge (x!51009 lt!248410) #b00000000000000000000000000000000)))))

(assert (=> b!544210 (=> (not res!338559) (not e!314654))))

(declare-fun d!82021 () Bool)

(assert (=> d!82021 e!314655))

(declare-fun c!63143 () Bool)

(assert (=> d!82021 (= c!63143 (and (is-Intermediate!4970 lt!248410) (undefined!5782 lt!248410)))))

(assert (=> d!82021 (= lt!248410 e!314656)))

(declare-fun c!63144 () Bool)

(assert (=> d!82021 (= c!63144 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82021 (= lt!248411 (select (arr!16512 a!3154) (toIndex!0 k!1998 mask!3216)))))

(assert (=> d!82021 (validMask!0 mask!3216)))

(assert (=> d!82021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216) lt!248410)))

(declare-fun b!544211 () Bool)

(assert (=> b!544211 (and (bvsge (index!22106 lt!248410) #b00000000000000000000000000000000) (bvslt (index!22106 lt!248410) (size!16876 a!3154)))))

(declare-fun res!338560 () Bool)

(assert (=> b!544211 (= res!338560 (= (select (arr!16512 a!3154) (index!22106 lt!248410)) k!1998))))

(assert (=> b!544211 (=> res!338560 e!314657)))

(assert (=> b!544211 (= e!314654 e!314657)))

(declare-fun b!544212 () Bool)

(assert (=> b!544212 (= e!314653 (Intermediate!4970 false (toIndex!0 k!1998 mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!82021 c!63144) b!544208))

(assert (= (and d!82021 (not c!63144)) b!544205))

(assert (= (and b!544205 c!63145) b!544212))

(assert (= (and b!544205 (not c!63145)) b!544209))

(assert (= (and d!82021 c!63143) b!544207))

(assert (= (and d!82021 (not c!63143)) b!544210))

(assert (= (and b!544210 res!338559) b!544211))

(assert (= (and b!544211 (not res!338560)) b!544206))

(assert (= (and b!544206 (not res!338561)) b!544204))

(declare-fun m!522125 () Bool)

(assert (=> b!544211 m!522125))

(assert (=> b!544206 m!522125))

(assert (=> b!544209 m!521965))

(declare-fun m!522127 () Bool)

(assert (=> b!544209 m!522127))

(assert (=> b!544209 m!522127))

(declare-fun m!522129 () Bool)

(assert (=> b!544209 m!522129))

(assert (=> b!544204 m!522125))

(assert (=> d!82021 m!521965))

(declare-fun m!522131 () Bool)

(assert (=> d!82021 m!522131))

(assert (=> d!82021 m!521829))

(assert (=> d!81941 d!82021))

(declare-fun d!82023 () Bool)

(declare-fun lt!248413 () (_ BitVec 32))

(declare-fun lt!248412 () (_ BitVec 32))

(assert (=> d!82023 (= lt!248413 (bvmul (bvxor lt!248412 (bvlshr lt!248412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82023 (= lt!248412 ((_ extract 31 0) (bvand (bvxor k!1998 (bvlshr k!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82023 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338531 (let ((h!11587 ((_ extract 31 0) (bvand (bvxor k!1998 (bvlshr k!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51019 (bvmul (bvxor h!11587 (bvlshr h!11587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51019 (bvlshr x!51019 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338531 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338531 #b00000000000000000000000000000000))))))

(assert (=> d!82023 (= (toIndex!0 k!1998 mask!3216) (bvand (bvxor lt!248413 (bvlshr lt!248413 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> d!81941 d!82023))

(assert (=> d!81941 d!81951))

(push 1)

(assert (not d!82021))

(assert (not b!544185))

(assert (not d!82003))

(assert (not b!544146))

(assert (not d!82011))

(assert (not b!544151))

(assert (not d!82007))

(assert (not b!544209))

(assert (not b!544144))

(assert (not d!82019))

(assert (not b!544203))

(assert (not bm!32085))

(assert (not bm!32086))

(assert (not d!82017))

(assert (not b!544161))

(assert (not b!544178))

(assert (not b!544145))

(assert (not d!82013))

(assert (not b!544150))

(assert (not b!544194))

(assert (not b!544158))

(assert (not b!544157))

(assert (not d!82015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

