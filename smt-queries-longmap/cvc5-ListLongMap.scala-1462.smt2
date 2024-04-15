; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28110 () Bool)

(assert start!28110)

(declare-fun b!287938 () Bool)

(declare-fun e!182309 () Bool)

(declare-fun e!182310 () Bool)

(assert (=> b!287938 (= e!182309 e!182310)))

(declare-fun res!149756 () Bool)

(assert (=> b!287938 (=> (not res!149756) (not e!182310))))

(declare-datatypes ((SeekEntryResult!2008 0))(
  ( (MissingZero!2008 (index!10202 (_ BitVec 32))) (Found!2008 (index!10203 (_ BitVec 32))) (Intermediate!2008 (undefined!2820 Bool) (index!10204 (_ BitVec 32)) (x!28430 (_ BitVec 32))) (Undefined!2008) (MissingVacant!2008 (index!10205 (_ BitVec 32))) )
))
(declare-fun lt!141702 () SeekEntryResult!2008)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!141700 () Bool)

(assert (=> b!287938 (= res!149756 (or lt!141700 (= lt!141702 (MissingVacant!2008 i!1256))))))

(assert (=> b!287938 (= lt!141700 (= lt!141702 (MissingZero!2008 i!1256)))))

(declare-datatypes ((array!14462 0))(
  ( (array!14463 (arr!6860 (Array (_ BitVec 32) (_ BitVec 64))) (size!7213 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14462)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14462 (_ BitVec 32)) SeekEntryResult!2008)

(assert (=> b!287938 (= lt!141702 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287939 () Bool)

(declare-fun res!149755 () Bool)

(assert (=> b!287939 (=> (not res!149755) (not e!182309))))

(declare-fun arrayContainsKey!0 (array!14462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287939 (= res!149755 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287940 () Bool)

(declare-fun res!149759 () Bool)

(assert (=> b!287940 (=> (not res!149759) (not e!182309))))

(assert (=> b!287940 (= res!149759 (and (= (size!7213 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7213 a!3312))))))

(declare-fun b!287941 () Bool)

(declare-fun e!182306 () Bool)

(assert (=> b!287941 (= e!182310 e!182306)))

(declare-fun res!149758 () Bool)

(assert (=> b!287941 (=> (not res!149758) (not e!182306))))

(assert (=> b!287941 (= res!149758 lt!141700)))

(declare-fun lt!141703 () (_ BitVec 32))

(declare-fun lt!141701 () SeekEntryResult!2008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14462 (_ BitVec 32)) SeekEntryResult!2008)

(assert (=> b!287941 (= lt!141701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141703 k!2524 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312)) mask!3809))))

(declare-fun lt!141704 () SeekEntryResult!2008)

(assert (=> b!287941 (= lt!141704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141703 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287941 (= lt!141703 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287942 () Bool)

(declare-fun res!149760 () Bool)

(assert (=> b!287942 (=> (not res!149760) (not e!182310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14462 (_ BitVec 32)) Bool)

(assert (=> b!287942 (= res!149760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287943 () Bool)

(declare-fun e!182307 () Bool)

(assert (=> b!287943 (= e!182307 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(assert (=> b!287943 (and (= (select (arr!6860 a!3312) (index!10204 lt!141704)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10204 lt!141704) i!1256))))

(declare-fun b!287944 () Bool)

(assert (=> b!287944 (= e!182306 e!182307)))

(declare-fun res!149754 () Bool)

(assert (=> b!287944 (=> (not res!149754) (not e!182307))))

(declare-fun lt!141705 () Bool)

(assert (=> b!287944 (= res!149754 (and (or lt!141705 (not (undefined!2820 lt!141704))) (or lt!141705 (not (= (select (arr!6860 a!3312) (index!10204 lt!141704)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141705 (not (= (select (arr!6860 a!3312) (index!10204 lt!141704)) k!2524))) (not lt!141705)))))

(assert (=> b!287944 (= lt!141705 (not (is-Intermediate!2008 lt!141704)))))

(declare-fun res!149757 () Bool)

(assert (=> start!28110 (=> (not res!149757) (not e!182309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28110 (= res!149757 (validMask!0 mask!3809))))

(assert (=> start!28110 e!182309))

(assert (=> start!28110 true))

(declare-fun array_inv!4832 (array!14462) Bool)

(assert (=> start!28110 (array_inv!4832 a!3312)))

(declare-fun b!287945 () Bool)

(declare-fun res!149761 () Bool)

(assert (=> b!287945 (=> (not res!149761) (not e!182309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287945 (= res!149761 (validKeyInArray!0 k!2524))))

(assert (= (and start!28110 res!149757) b!287940))

(assert (= (and b!287940 res!149759) b!287945))

(assert (= (and b!287945 res!149761) b!287939))

(assert (= (and b!287939 res!149755) b!287938))

(assert (= (and b!287938 res!149756) b!287942))

(assert (= (and b!287942 res!149760) b!287941))

(assert (= (and b!287941 res!149758) b!287944))

(assert (= (and b!287944 res!149754) b!287943))

(declare-fun m!301831 () Bool)

(assert (=> b!287945 m!301831))

(declare-fun m!301833 () Bool)

(assert (=> b!287943 m!301833))

(declare-fun m!301835 () Bool)

(assert (=> b!287939 m!301835))

(declare-fun m!301837 () Bool)

(assert (=> b!287938 m!301837))

(declare-fun m!301839 () Bool)

(assert (=> b!287942 m!301839))

(declare-fun m!301841 () Bool)

(assert (=> b!287941 m!301841))

(declare-fun m!301843 () Bool)

(assert (=> b!287941 m!301843))

(declare-fun m!301845 () Bool)

(assert (=> b!287941 m!301845))

(declare-fun m!301847 () Bool)

(assert (=> b!287941 m!301847))

(declare-fun m!301849 () Bool)

(assert (=> start!28110 m!301849))

(declare-fun m!301851 () Bool)

(assert (=> start!28110 m!301851))

(assert (=> b!287944 m!301833))

(push 1)

(assert (not b!287939))

(assert (not b!287942))

(assert (not start!28110))

(assert (not b!287941))

(assert (not b!287938))

(assert (not b!287945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66019 () Bool)

(assert (=> d!66019 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!287945 d!66019))

(declare-fun d!66021 () Bool)

(declare-fun res!149768 () Bool)

(declare-fun e!182317 () Bool)

(assert (=> d!66021 (=> res!149768 e!182317)))

(assert (=> d!66021 (= res!149768 (= (select (arr!6860 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66021 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!182317)))

(declare-fun b!287952 () Bool)

(declare-fun e!182318 () Bool)

(assert (=> b!287952 (= e!182317 e!182318)))

(declare-fun res!149769 () Bool)

(assert (=> b!287952 (=> (not res!149769) (not e!182318))))

(assert (=> b!287952 (= res!149769 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7213 a!3312)))))

(declare-fun b!287953 () Bool)

(assert (=> b!287953 (= e!182318 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66021 (not res!149768)) b!287952))

(assert (= (and b!287952 res!149769) b!287953))

(declare-fun m!301853 () Bool)

(assert (=> d!66021 m!301853))

(declare-fun m!301855 () Bool)

(assert (=> b!287953 m!301855))

(assert (=> b!287939 d!66021))

(declare-fun d!66023 () Bool)

(assert (=> d!66023 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28110 d!66023))

(declare-fun d!66029 () Bool)

(assert (=> d!66029 (= (array_inv!4832 a!3312) (bvsge (size!7213 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28110 d!66029))

(declare-fun b!288000 () Bool)

(declare-fun c!46670 () Bool)

(declare-fun lt!141737 () (_ BitVec 64))

(assert (=> b!288000 (= c!46670 (= lt!141737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182347 () SeekEntryResult!2008)

(declare-fun e!182349 () SeekEntryResult!2008)

(assert (=> b!288000 (= e!182347 e!182349)))

(declare-fun b!288001 () Bool)

(declare-fun e!182348 () SeekEntryResult!2008)

(assert (=> b!288001 (= e!182348 Undefined!2008)))

(declare-fun b!288002 () Bool)

(declare-fun lt!141736 () SeekEntryResult!2008)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14462 (_ BitVec 32)) SeekEntryResult!2008)

(assert (=> b!288002 (= e!182349 (seekKeyOrZeroReturnVacant!0 (x!28430 lt!141736) (index!10204 lt!141736) (index!10204 lt!141736) k!2524 a!3312 mask!3809))))

(declare-fun d!66031 () Bool)

(declare-fun lt!141738 () SeekEntryResult!2008)

(assert (=> d!66031 (and (or (is-Undefined!2008 lt!141738) (not (is-Found!2008 lt!141738)) (and (bvsge (index!10203 lt!141738) #b00000000000000000000000000000000) (bvslt (index!10203 lt!141738) (size!7213 a!3312)))) (or (is-Undefined!2008 lt!141738) (is-Found!2008 lt!141738) (not (is-MissingZero!2008 lt!141738)) (and (bvsge (index!10202 lt!141738) #b00000000000000000000000000000000) (bvslt (index!10202 lt!141738) (size!7213 a!3312)))) (or (is-Undefined!2008 lt!141738) (is-Found!2008 lt!141738) (is-MissingZero!2008 lt!141738) (not (is-MissingVacant!2008 lt!141738)) (and (bvsge (index!10205 lt!141738) #b00000000000000000000000000000000) (bvslt (index!10205 lt!141738) (size!7213 a!3312)))) (or (is-Undefined!2008 lt!141738) (ite (is-Found!2008 lt!141738) (= (select (arr!6860 a!3312) (index!10203 lt!141738)) k!2524) (ite (is-MissingZero!2008 lt!141738) (= (select (arr!6860 a!3312) (index!10202 lt!141738)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2008 lt!141738) (= (select (arr!6860 a!3312) (index!10205 lt!141738)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66031 (= lt!141738 e!182348)))

(declare-fun c!46672 () Bool)

(assert (=> d!66031 (= c!46672 (and (is-Intermediate!2008 lt!141736) (undefined!2820 lt!141736)))))

(assert (=> d!66031 (= lt!141736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66031 (validMask!0 mask!3809)))

(assert (=> d!66031 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141738)))

(declare-fun b!288003 () Bool)

(assert (=> b!288003 (= e!182347 (Found!2008 (index!10204 lt!141736)))))

(declare-fun b!288004 () Bool)

(assert (=> b!288004 (= e!182348 e!182347)))

(assert (=> b!288004 (= lt!141737 (select (arr!6860 a!3312) (index!10204 lt!141736)))))

(declare-fun c!46671 () Bool)

(assert (=> b!288004 (= c!46671 (= lt!141737 k!2524))))

(declare-fun b!288005 () Bool)

(assert (=> b!288005 (= e!182349 (MissingZero!2008 (index!10204 lt!141736)))))

(assert (= (and d!66031 c!46672) b!288001))

(assert (= (and d!66031 (not c!46672)) b!288004))

(assert (= (and b!288004 c!46671) b!288003))

(assert (= (and b!288004 (not c!46671)) b!288000))

(assert (= (and b!288000 c!46670) b!288005))

(assert (= (and b!288000 (not c!46670)) b!288002))

(declare-fun m!301881 () Bool)

(assert (=> b!288002 m!301881))

(assert (=> d!66031 m!301847))

(declare-fun m!301883 () Bool)

(assert (=> d!66031 m!301883))

(declare-fun m!301885 () Bool)

(assert (=> d!66031 m!301885))

(assert (=> d!66031 m!301847))

(declare-fun m!301887 () Bool)

(assert (=> d!66031 m!301887))

(assert (=> d!66031 m!301849))

(declare-fun m!301889 () Bool)

(assert (=> d!66031 m!301889))

(declare-fun m!301891 () Bool)

(assert (=> b!288004 m!301891))

(assert (=> b!287938 d!66031))

(declare-fun b!288020 () Bool)

(declare-fun e!182359 () Bool)

(declare-fun call!25609 () Bool)

(assert (=> b!288020 (= e!182359 call!25609)))

(declare-fun bm!25606 () Bool)

(assert (=> bm!25606 (= call!25609 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!288021 () Bool)

(declare-fun e!182360 () Bool)

(assert (=> b!288021 (= e!182360 call!25609)))

(declare-fun b!288022 () Bool)

(assert (=> b!288022 (= e!182359 e!182360)))

(declare-fun lt!141748 () (_ BitVec 64))

(assert (=> b!288022 (= lt!141748 (select (arr!6860 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9024 0))(
  ( (Unit!9025) )
))
(declare-fun lt!141749 () Unit!9024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14462 (_ BitVec 64) (_ BitVec 32)) Unit!9024)

(assert (=> b!288022 (= lt!141749 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141748 #b00000000000000000000000000000000))))

(assert (=> b!288022 (arrayContainsKey!0 a!3312 lt!141748 #b00000000000000000000000000000000)))

(declare-fun lt!141750 () Unit!9024)

(assert (=> b!288022 (= lt!141750 lt!141749)))

(declare-fun res!149784 () Bool)

(assert (=> b!288022 (= res!149784 (= (seekEntryOrOpen!0 (select (arr!6860 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2008 #b00000000000000000000000000000000)))))

(assert (=> b!288022 (=> (not res!149784) (not e!182360))))

(declare-fun d!66035 () Bool)

(declare-fun res!149785 () Bool)

(declare-fun e!182361 () Bool)

(assert (=> d!66035 (=> res!149785 e!182361)))

(assert (=> d!66035 (= res!149785 (bvsge #b00000000000000000000000000000000 (size!7213 a!3312)))))

(assert (=> d!66035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182361)))

(declare-fun b!288023 () Bool)

(assert (=> b!288023 (= e!182361 e!182359)))

(declare-fun c!46678 () Bool)

(assert (=> b!288023 (= c!46678 (validKeyInArray!0 (select (arr!6860 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66035 (not res!149785)) b!288023))

(assert (= (and b!288023 c!46678) b!288022))

(assert (= (and b!288023 (not c!46678)) b!288020))

(assert (= (and b!288022 res!149784) b!288021))

(assert (= (or b!288021 b!288020) bm!25606))

(declare-fun m!301905 () Bool)

(assert (=> bm!25606 m!301905))

(assert (=> b!288022 m!301853))

(declare-fun m!301907 () Bool)

(assert (=> b!288022 m!301907))

(declare-fun m!301909 () Bool)

(assert (=> b!288022 m!301909))

(assert (=> b!288022 m!301853))

(declare-fun m!301911 () Bool)

(assert (=> b!288022 m!301911))

(assert (=> b!288023 m!301853))

(assert (=> b!288023 m!301853))

(declare-fun m!301913 () Bool)

(assert (=> b!288023 m!301913))

(assert (=> b!287942 d!66035))

(declare-fun b!288084 () Bool)

(declare-fun lt!141764 () SeekEntryResult!2008)

(assert (=> b!288084 (and (bvsge (index!10204 lt!141764) #b00000000000000000000000000000000) (bvslt (index!10204 lt!141764) (size!7213 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312)))))))

(declare-fun e!182399 () Bool)

(assert (=> b!288084 (= e!182399 (= (select (arr!6860 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312))) (index!10204 lt!141764)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288085 () Bool)

(declare-fun e!182401 () Bool)

(declare-fun e!182398 () Bool)

(assert (=> b!288085 (= e!182401 e!182398)))

(declare-fun res!149813 () Bool)

(assert (=> b!288085 (= res!149813 (and (is-Intermediate!2008 lt!141764) (not (undefined!2820 lt!141764)) (bvslt (x!28430 lt!141764) #b01111111111111111111111111111110) (bvsge (x!28430 lt!141764) #b00000000000000000000000000000000) (bvsge (x!28430 lt!141764) #b00000000000000000000000000000000)))))

(assert (=> b!288085 (=> (not res!149813) (not e!182398))))

(declare-fun d!66039 () Bool)

(assert (=> d!66039 e!182401))

(declare-fun c!46697 () Bool)

(assert (=> d!66039 (= c!46697 (and (is-Intermediate!2008 lt!141764) (undefined!2820 lt!141764)))))

(declare-fun e!182402 () SeekEntryResult!2008)

(assert (=> d!66039 (= lt!141764 e!182402)))

(declare-fun c!46698 () Bool)

(assert (=> d!66039 (= c!46698 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!141763 () (_ BitVec 64))

(assert (=> d!66039 (= lt!141763 (select (arr!6860 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312))) lt!141703))))

(assert (=> d!66039 (validMask!0 mask!3809)))

(assert (=> d!66039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141703 k!2524 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312)) mask!3809) lt!141764)))

(declare-fun b!288086 () Bool)

(assert (=> b!288086 (and (bvsge (index!10204 lt!141764) #b00000000000000000000000000000000) (bvslt (index!10204 lt!141764) (size!7213 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312)))))))

(declare-fun res!149812 () Bool)

(assert (=> b!288086 (= res!149812 (= (select (arr!6860 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312))) (index!10204 lt!141764)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288086 (=> res!149812 e!182399)))

(declare-fun b!288087 () Bool)

(assert (=> b!288087 (= e!182401 (bvsge (x!28430 lt!141764) #b01111111111111111111111111111110))))

(declare-fun e!182400 () SeekEntryResult!2008)

(declare-fun b!288088 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288088 (= e!182400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141703 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312)) mask!3809))))

(declare-fun b!288089 () Bool)

(assert (=> b!288089 (= e!182402 (Intermediate!2008 true lt!141703 #b00000000000000000000000000000000))))

(declare-fun b!288090 () Bool)

(assert (=> b!288090 (= e!182400 (Intermediate!2008 false lt!141703 #b00000000000000000000000000000000))))

(declare-fun b!288091 () Bool)

(assert (=> b!288091 (= e!182402 e!182400)))

(declare-fun c!46699 () Bool)

(assert (=> b!288091 (= c!46699 (or (= lt!141763 k!2524) (= (bvadd lt!141763 lt!141763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288092 () Bool)

(assert (=> b!288092 (and (bvsge (index!10204 lt!141764) #b00000000000000000000000000000000) (bvslt (index!10204 lt!141764) (size!7213 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312)))))))

(declare-fun res!149811 () Bool)

(assert (=> b!288092 (= res!149811 (= (select (arr!6860 (array!14463 (store (arr!6860 a!3312) i!1256 k!2524) (size!7213 a!3312))) (index!10204 lt!141764)) k!2524))))

(assert (=> b!288092 (=> res!149811 e!182399)))

(assert (=> b!288092 (= e!182398 e!182399)))

(assert (= (and d!66039 c!46698) b!288089))

(assert (= (and d!66039 (not c!46698)) b!288091))

(assert (= (and b!288091 c!46699) b!288090))

(assert (= (and b!288091 (not c!46699)) b!288088))

(assert (= (and d!66039 c!46697) b!288087))

(assert (= (and d!66039 (not c!46697)) b!288085))

(assert (= (and b!288085 res!149813) b!288092))

(assert (= (and b!288092 (not res!149811)) b!288086))

(assert (= (and b!288086 (not res!149812)) b!288084))

(declare-fun m!301931 () Bool)

(assert (=> b!288088 m!301931))

(assert (=> b!288088 m!301931))

(declare-fun m!301933 () Bool)

(assert (=> b!288088 m!301933))

(declare-fun m!301935 () Bool)

(assert (=> b!288086 m!301935))

(declare-fun m!301937 () Bool)

(assert (=> d!66039 m!301937))

(assert (=> d!66039 m!301849))

(assert (=> b!288084 m!301935))

(assert (=> b!288092 m!301935))

(assert (=> b!287941 d!66039))

(declare-fun b!288093 () Bool)

(declare-fun lt!141766 () SeekEntryResult!2008)

(assert (=> b!288093 (and (bvsge (index!10204 lt!141766) #b00000000000000000000000000000000) (bvslt (index!10204 lt!141766) (size!7213 a!3312)))))

(declare-fun e!182404 () Bool)

(assert (=> b!288093 (= e!182404 (= (select (arr!6860 a!3312) (index!10204 lt!141766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288094 () Bool)

(declare-fun e!182406 () Bool)

(declare-fun e!182403 () Bool)

(assert (=> b!288094 (= e!182406 e!182403)))

(declare-fun res!149816 () Bool)

(assert (=> b!288094 (= res!149816 (and (is-Intermediate!2008 lt!141766) (not (undefined!2820 lt!141766)) (bvslt (x!28430 lt!141766) #b01111111111111111111111111111110) (bvsge (x!28430 lt!141766) #b00000000000000000000000000000000) (bvsge (x!28430 lt!141766) #b00000000000000000000000000000000)))))

(assert (=> b!288094 (=> (not res!149816) (not e!182403))))

(declare-fun d!66047 () Bool)

(assert (=> d!66047 e!182406))

(declare-fun c!46700 () Bool)

(assert (=> d!66047 (= c!46700 (and (is-Intermediate!2008 lt!141766) (undefined!2820 lt!141766)))))

(declare-fun e!182407 () SeekEntryResult!2008)

(assert (=> d!66047 (= lt!141766 e!182407)))

(declare-fun c!46701 () Bool)

(assert (=> d!66047 (= c!46701 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!141765 () (_ BitVec 64))

(assert (=> d!66047 (= lt!141765 (select (arr!6860 a!3312) lt!141703))))

(assert (=> d!66047 (validMask!0 mask!3809)))

(assert (=> d!66047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141703 k!2524 a!3312 mask!3809) lt!141766)))

(declare-fun b!288095 () Bool)

(assert (=> b!288095 (and (bvsge (index!10204 lt!141766) #b00000000000000000000000000000000) (bvslt (index!10204 lt!141766) (size!7213 a!3312)))))

(declare-fun res!149815 () Bool)

(assert (=> b!288095 (= res!149815 (= (select (arr!6860 a!3312) (index!10204 lt!141766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288095 (=> res!149815 e!182404)))

(declare-fun b!288096 () Bool)

(assert (=> b!288096 (= e!182406 (bvsge (x!28430 lt!141766) #b01111111111111111111111111111110))))

(declare-fun e!182405 () SeekEntryResult!2008)

(declare-fun b!288097 () Bool)

(assert (=> b!288097 (= e!182405 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141703 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!288098 () Bool)

(assert (=> b!288098 (= e!182407 (Intermediate!2008 true lt!141703 #b00000000000000000000000000000000))))

(declare-fun b!288099 () Bool)

(assert (=> b!288099 (= e!182405 (Intermediate!2008 false lt!141703 #b00000000000000000000000000000000))))

(declare-fun b!288100 () Bool)

(assert (=> b!288100 (= e!182407 e!182405)))

(declare-fun c!46702 () Bool)

(assert (=> b!288100 (= c!46702 (or (= lt!141765 k!2524) (= (bvadd lt!141765 lt!141765) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288101 () Bool)

(assert (=> b!288101 (and (bvsge (index!10204 lt!141766) #b00000000000000000000000000000000) (bvslt (index!10204 lt!141766) (size!7213 a!3312)))))

(declare-fun res!149814 () Bool)

(assert (=> b!288101 (= res!149814 (= (select (arr!6860 a!3312) (index!10204 lt!141766)) k!2524))))

(assert (=> b!288101 (=> res!149814 e!182404)))

(assert (=> b!288101 (= e!182403 e!182404)))

(assert (= (and d!66047 c!46701) b!288098))

(assert (= (and d!66047 (not c!46701)) b!288100))

(assert (= (and b!288100 c!46702) b!288099))

(assert (= (and b!288100 (not c!46702)) b!288097))

(assert (= (and d!66047 c!46700) b!288096))

(assert (= (and d!66047 (not c!46700)) b!288094))

(assert (= (and b!288094 res!149816) b!288101))

(assert (= (and b!288101 (not res!149814)) b!288095))

(assert (= (and b!288095 (not res!149815)) b!288093))

(assert (=> b!288097 m!301931))

(assert (=> b!288097 m!301931))

(declare-fun m!301939 () Bool)

(assert (=> b!288097 m!301939))

(declare-fun m!301941 () Bool)

(assert (=> b!288095 m!301941))

(declare-fun m!301943 () Bool)

(assert (=> d!66047 m!301943))

(assert (=> d!66047 m!301849))

(assert (=> b!288093 m!301941))

(assert (=> b!288101 m!301941))

(assert (=> b!287941 d!66047))

(declare-fun d!66049 () Bool)

(declare-fun lt!141782 () (_ BitVec 32))

(declare-fun lt!141781 () (_ BitVec 32))

(assert (=> d!66049 (= lt!141782 (bvmul (bvxor lt!141781 (bvlshr lt!141781 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66049 (= lt!141781 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66049 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149817 (let ((h!5225 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28434 (bvmul (bvxor h!5225 (bvlshr h!5225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28434 (bvlshr x!28434 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149817 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149817 #b00000000000000000000000000000000))))))

(assert (=> d!66049 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141782 (bvlshr lt!141782 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!287941 d!66049))

(push 1)

(assert (not b!288022))

(assert (not d!66031))

(assert (not b!288023))

(assert (not d!66047))

(assert (not d!66039))

(assert (not b!287953))

(assert (not b!288097))

(assert (not bm!25606))

(assert (not b!288088))

(assert (not b!288002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

