; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63806 () Bool)

(assert start!63806)

(declare-fun b!717437 () Bool)

(declare-fun e!402783 () Bool)

(declare-fun e!402781 () Bool)

(assert (=> b!717437 (= e!402783 e!402781)))

(declare-fun res!480224 () Bool)

(assert (=> b!717437 (=> (not res!480224) (not e!402781))))

(declare-datatypes ((SeekEntryResult!7051 0))(
  ( (MissingZero!7051 (index!30572 (_ BitVec 32))) (Found!7051 (index!30573 (_ BitVec 32))) (Intermediate!7051 (undefined!7863 Bool) (index!30574 (_ BitVec 32)) (x!61602 (_ BitVec 32))) (Undefined!7051) (MissingVacant!7051 (index!30575 (_ BitVec 32))) )
))
(declare-fun lt!318926 () SeekEntryResult!7051)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717437 (= res!480224 (or (= lt!318926 (MissingZero!7051 i!1173)) (= lt!318926 (MissingVacant!7051 i!1173))))))

(declare-datatypes ((array!40647 0))(
  ( (array!40648 (arr!19454 (Array (_ BitVec 32) (_ BitVec 64))) (size!19875 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40647)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40647 (_ BitVec 32)) SeekEntryResult!7051)

(assert (=> b!717437 (= lt!318926 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717438 () Bool)

(declare-fun res!480226 () Bool)

(assert (=> b!717438 (=> (not res!480226) (not e!402783))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717438 (= res!480226 (and (= (size!19875 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19875 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19875 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717440 () Bool)

(declare-fun res!480222 () Bool)

(assert (=> b!717440 (=> (not res!480222) (not e!402783))))

(declare-fun arrayContainsKey!0 (array!40647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717440 (= res!480222 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717441 () Bool)

(declare-fun res!480228 () Bool)

(assert (=> b!717441 (=> (not res!480228) (not e!402783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717441 (= res!480228 (validKeyInArray!0 (select (arr!19454 a!3186) j!159)))))

(declare-fun b!717442 () Bool)

(declare-fun res!480220 () Bool)

(assert (=> b!717442 (=> (not res!480220) (not e!402781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40647 (_ BitVec 32)) Bool)

(assert (=> b!717442 (= res!480220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717443 () Bool)

(declare-fun res!480223 () Bool)

(assert (=> b!717443 (=> (not res!480223) (not e!402781))))

(declare-datatypes ((List!13495 0))(
  ( (Nil!13492) (Cons!13491 (h!14536 (_ BitVec 64)) (t!19801 List!13495)) )
))
(declare-fun noDuplicate!1286 (List!13495) Bool)

(assert (=> b!717443 (= res!480223 (noDuplicate!1286 Nil!13492))))

(declare-fun b!717444 () Bool)

(declare-fun res!480219 () Bool)

(assert (=> b!717444 (=> (not res!480219) (not e!402783))))

(assert (=> b!717444 (= res!480219 (validKeyInArray!0 k0!2102))))

(declare-fun b!717445 () Bool)

(declare-fun e!402782 () Bool)

(assert (=> b!717445 (= e!402781 e!402782)))

(declare-fun res!480221 () Bool)

(assert (=> b!717445 (=> res!480221 e!402782)))

(declare-fun contains!4015 (List!13495 (_ BitVec 64)) Bool)

(assert (=> b!717445 (= res!480221 (contains!4015 Nil!13492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717446 () Bool)

(declare-fun res!480225 () Bool)

(assert (=> b!717446 (=> (not res!480225) (not e!402781))))

(assert (=> b!717446 (= res!480225 (and (bvsle #b00000000000000000000000000000000 (size!19875 a!3186)) (bvslt (size!19875 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717439 () Bool)

(assert (=> b!717439 (= e!402782 (contains!4015 Nil!13492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!480227 () Bool)

(assert (=> start!63806 (=> (not res!480227) (not e!402783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63806 (= res!480227 (validMask!0 mask!3328))))

(assert (=> start!63806 e!402783))

(declare-fun array_inv!15337 (array!40647) Bool)

(assert (=> start!63806 (array_inv!15337 a!3186)))

(assert (=> start!63806 true))

(assert (= (and start!63806 res!480227) b!717438))

(assert (= (and b!717438 res!480226) b!717441))

(assert (= (and b!717441 res!480228) b!717444))

(assert (= (and b!717444 res!480219) b!717440))

(assert (= (and b!717440 res!480222) b!717437))

(assert (= (and b!717437 res!480224) b!717442))

(assert (= (and b!717442 res!480220) b!717446))

(assert (= (and b!717446 res!480225) b!717443))

(assert (= (and b!717443 res!480223) b!717445))

(assert (= (and b!717445 (not res!480221)) b!717439))

(declare-fun m!672795 () Bool)

(assert (=> b!717442 m!672795))

(declare-fun m!672797 () Bool)

(assert (=> b!717444 m!672797))

(declare-fun m!672799 () Bool)

(assert (=> b!717437 m!672799))

(declare-fun m!672801 () Bool)

(assert (=> b!717443 m!672801))

(declare-fun m!672803 () Bool)

(assert (=> b!717445 m!672803))

(declare-fun m!672805 () Bool)

(assert (=> b!717439 m!672805))

(declare-fun m!672807 () Bool)

(assert (=> start!63806 m!672807))

(declare-fun m!672809 () Bool)

(assert (=> start!63806 m!672809))

(declare-fun m!672811 () Bool)

(assert (=> b!717440 m!672811))

(declare-fun m!672813 () Bool)

(assert (=> b!717441 m!672813))

(assert (=> b!717441 m!672813))

(declare-fun m!672815 () Bool)

(assert (=> b!717441 m!672815))

(check-sat (not b!717439) (not b!717443) (not b!717442) (not b!717445) (not b!717441) (not b!717437) (not start!63806) (not b!717440) (not b!717444))
(check-sat)
(get-model)

(declare-fun b!717515 () Bool)

(declare-fun e!402817 () Bool)

(declare-fun call!34681 () Bool)

(assert (=> b!717515 (= e!402817 call!34681)))

(declare-fun b!717516 () Bool)

(declare-fun e!402816 () Bool)

(assert (=> b!717516 (= e!402816 call!34681)))

(declare-fun b!717517 () Bool)

(assert (=> b!717517 (= e!402816 e!402817)))

(declare-fun lt!318939 () (_ BitVec 64))

(assert (=> b!717517 (= lt!318939 (select (arr!19454 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24624 0))(
  ( (Unit!24625) )
))
(declare-fun lt!318941 () Unit!24624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40647 (_ BitVec 64) (_ BitVec 32)) Unit!24624)

(assert (=> b!717517 (= lt!318941 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!318939 #b00000000000000000000000000000000))))

(assert (=> b!717517 (arrayContainsKey!0 a!3186 lt!318939 #b00000000000000000000000000000000)))

(declare-fun lt!318940 () Unit!24624)

(assert (=> b!717517 (= lt!318940 lt!318941)))

(declare-fun res!480294 () Bool)

(assert (=> b!717517 (= res!480294 (= (seekEntryOrOpen!0 (select (arr!19454 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7051 #b00000000000000000000000000000000)))))

(assert (=> b!717517 (=> (not res!480294) (not e!402817))))

(declare-fun bm!34678 () Bool)

(assert (=> bm!34678 (= call!34681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!98703 () Bool)

(declare-fun res!480293 () Bool)

(declare-fun e!402815 () Bool)

(assert (=> d!98703 (=> res!480293 e!402815)))

(assert (=> d!98703 (= res!480293 (bvsge #b00000000000000000000000000000000 (size!19875 a!3186)))))

(assert (=> d!98703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402815)))

(declare-fun b!717518 () Bool)

(assert (=> b!717518 (= e!402815 e!402816)))

(declare-fun c!78978 () Bool)

(assert (=> b!717518 (= c!78978 (validKeyInArray!0 (select (arr!19454 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98703 (not res!480293)) b!717518))

(assert (= (and b!717518 c!78978) b!717517))

(assert (= (and b!717518 (not c!78978)) b!717516))

(assert (= (and b!717517 res!480294) b!717515))

(assert (= (or b!717515 b!717516) bm!34678))

(declare-fun m!672861 () Bool)

(assert (=> b!717517 m!672861))

(declare-fun m!672863 () Bool)

(assert (=> b!717517 m!672863))

(declare-fun m!672865 () Bool)

(assert (=> b!717517 m!672865))

(assert (=> b!717517 m!672861))

(declare-fun m!672867 () Bool)

(assert (=> b!717517 m!672867))

(declare-fun m!672869 () Bool)

(assert (=> bm!34678 m!672869))

(assert (=> b!717518 m!672861))

(assert (=> b!717518 m!672861))

(declare-fun m!672871 () Bool)

(assert (=> b!717518 m!672871))

(assert (=> b!717442 d!98703))

(declare-fun b!717557 () Bool)

(declare-fun c!78988 () Bool)

(declare-fun lt!318952 () (_ BitVec 64))

(assert (=> b!717557 (= c!78988 (= lt!318952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402850 () SeekEntryResult!7051)

(declare-fun e!402849 () SeekEntryResult!7051)

(assert (=> b!717557 (= e!402850 e!402849)))

(declare-fun b!717558 () Bool)

(declare-fun lt!318954 () SeekEntryResult!7051)

(assert (=> b!717558 (= e!402850 (Found!7051 (index!30574 lt!318954)))))

(declare-fun b!717559 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40647 (_ BitVec 32)) SeekEntryResult!7051)

(assert (=> b!717559 (= e!402849 (seekKeyOrZeroReturnVacant!0 (x!61602 lt!318954) (index!30574 lt!318954) (index!30574 lt!318954) k0!2102 a!3186 mask!3328))))

(declare-fun d!98709 () Bool)

(declare-fun lt!318953 () SeekEntryResult!7051)

(get-info :version)

(assert (=> d!98709 (and (or ((_ is Undefined!7051) lt!318953) (not ((_ is Found!7051) lt!318953)) (and (bvsge (index!30573 lt!318953) #b00000000000000000000000000000000) (bvslt (index!30573 lt!318953) (size!19875 a!3186)))) (or ((_ is Undefined!7051) lt!318953) ((_ is Found!7051) lt!318953) (not ((_ is MissingZero!7051) lt!318953)) (and (bvsge (index!30572 lt!318953) #b00000000000000000000000000000000) (bvslt (index!30572 lt!318953) (size!19875 a!3186)))) (or ((_ is Undefined!7051) lt!318953) ((_ is Found!7051) lt!318953) ((_ is MissingZero!7051) lt!318953) (not ((_ is MissingVacant!7051) lt!318953)) (and (bvsge (index!30575 lt!318953) #b00000000000000000000000000000000) (bvslt (index!30575 lt!318953) (size!19875 a!3186)))) (or ((_ is Undefined!7051) lt!318953) (ite ((_ is Found!7051) lt!318953) (= (select (arr!19454 a!3186) (index!30573 lt!318953)) k0!2102) (ite ((_ is MissingZero!7051) lt!318953) (= (select (arr!19454 a!3186) (index!30572 lt!318953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7051) lt!318953) (= (select (arr!19454 a!3186) (index!30575 lt!318953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!402848 () SeekEntryResult!7051)

(assert (=> d!98709 (= lt!318953 e!402848)))

(declare-fun c!78987 () Bool)

(assert (=> d!98709 (= c!78987 (and ((_ is Intermediate!7051) lt!318954) (undefined!7863 lt!318954)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40647 (_ BitVec 32)) SeekEntryResult!7051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98709 (= lt!318954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98709 (validMask!0 mask!3328)))

(assert (=> d!98709 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!318953)))

(declare-fun b!717560 () Bool)

(assert (=> b!717560 (= e!402848 Undefined!7051)))

(declare-fun b!717561 () Bool)

(assert (=> b!717561 (= e!402848 e!402850)))

(assert (=> b!717561 (= lt!318952 (select (arr!19454 a!3186) (index!30574 lt!318954)))))

(declare-fun c!78989 () Bool)

(assert (=> b!717561 (= c!78989 (= lt!318952 k0!2102))))

(declare-fun b!717562 () Bool)

(assert (=> b!717562 (= e!402849 (MissingZero!7051 (index!30574 lt!318954)))))

(assert (= (and d!98709 c!78987) b!717560))

(assert (= (and d!98709 (not c!78987)) b!717561))

(assert (= (and b!717561 c!78989) b!717558))

(assert (= (and b!717561 (not c!78989)) b!717557))

(assert (= (and b!717557 c!78988) b!717562))

(assert (= (and b!717557 (not c!78988)) b!717559))

(declare-fun m!672891 () Bool)

(assert (=> b!717559 m!672891))

(declare-fun m!672893 () Bool)

(assert (=> d!98709 m!672893))

(assert (=> d!98709 m!672807))

(declare-fun m!672895 () Bool)

(assert (=> d!98709 m!672895))

(declare-fun m!672897 () Bool)

(assert (=> d!98709 m!672897))

(declare-fun m!672899 () Bool)

(assert (=> d!98709 m!672899))

(assert (=> d!98709 m!672895))

(declare-fun m!672901 () Bool)

(assert (=> d!98709 m!672901))

(declare-fun m!672903 () Bool)

(assert (=> b!717561 m!672903))

(assert (=> b!717437 d!98709))

(declare-fun d!98723 () Bool)

(declare-fun res!480323 () Bool)

(declare-fun e!402857 () Bool)

(assert (=> d!98723 (=> res!480323 e!402857)))

(assert (=> d!98723 (= res!480323 (= (select (arr!19454 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98723 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!402857)))

(declare-fun b!717569 () Bool)

(declare-fun e!402858 () Bool)

(assert (=> b!717569 (= e!402857 e!402858)))

(declare-fun res!480324 () Bool)

(assert (=> b!717569 (=> (not res!480324) (not e!402858))))

(assert (=> b!717569 (= res!480324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19875 a!3186)))))

(declare-fun b!717570 () Bool)

(assert (=> b!717570 (= e!402858 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98723 (not res!480323)) b!717569))

(assert (= (and b!717569 res!480324) b!717570))

(assert (=> d!98723 m!672861))

(declare-fun m!672905 () Bool)

(assert (=> b!717570 m!672905))

(assert (=> b!717440 d!98723))

(declare-fun d!98725 () Bool)

(assert (=> d!98725 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63806 d!98725))

(declare-fun d!98735 () Bool)

(assert (=> d!98735 (= (array_inv!15337 a!3186) (bvsge (size!19875 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63806 d!98735))

(declare-fun d!98737 () Bool)

(assert (=> d!98737 (= (validKeyInArray!0 (select (arr!19454 a!3186) j!159)) (and (not (= (select (arr!19454 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19454 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717441 d!98737))

(declare-fun d!98739 () Bool)

(assert (=> d!98739 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717444 d!98739))

(declare-fun d!98741 () Bool)

(declare-fun lt!318966 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!376 (List!13495) (InoxSet (_ BitVec 64)))

(assert (=> d!98741 (= lt!318966 (select (content!376 Nil!13492) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402873 () Bool)

(assert (=> d!98741 (= lt!318966 e!402873)))

(declare-fun res!480337 () Bool)

(assert (=> d!98741 (=> (not res!480337) (not e!402873))))

(assert (=> d!98741 (= res!480337 ((_ is Cons!13491) Nil!13492))))

(assert (=> d!98741 (= (contains!4015 Nil!13492 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318966)))

(declare-fun b!717585 () Bool)

(declare-fun e!402872 () Bool)

(assert (=> b!717585 (= e!402873 e!402872)))

(declare-fun res!480338 () Bool)

(assert (=> b!717585 (=> res!480338 e!402872)))

(assert (=> b!717585 (= res!480338 (= (h!14536 Nil!13492) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717586 () Bool)

(assert (=> b!717586 (= e!402872 (contains!4015 (t!19801 Nil!13492) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98741 res!480337) b!717585))

(assert (= (and b!717585 (not res!480338)) b!717586))

(declare-fun m!672923 () Bool)

(assert (=> d!98741 m!672923))

(declare-fun m!672925 () Bool)

(assert (=> d!98741 m!672925))

(declare-fun m!672927 () Bool)

(assert (=> b!717586 m!672927))

(assert (=> b!717439 d!98741))

(declare-fun d!98743 () Bool)

(declare-fun lt!318967 () Bool)

(assert (=> d!98743 (= lt!318967 (select (content!376 Nil!13492) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402875 () Bool)

(assert (=> d!98743 (= lt!318967 e!402875)))

(declare-fun res!480339 () Bool)

(assert (=> d!98743 (=> (not res!480339) (not e!402875))))

(assert (=> d!98743 (= res!480339 ((_ is Cons!13491) Nil!13492))))

(assert (=> d!98743 (= (contains!4015 Nil!13492 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318967)))

(declare-fun b!717587 () Bool)

(declare-fun e!402874 () Bool)

(assert (=> b!717587 (= e!402875 e!402874)))

(declare-fun res!480340 () Bool)

(assert (=> b!717587 (=> res!480340 e!402874)))

(assert (=> b!717587 (= res!480340 (= (h!14536 Nil!13492) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717588 () Bool)

(assert (=> b!717588 (= e!402874 (contains!4015 (t!19801 Nil!13492) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98743 res!480339) b!717587))

(assert (= (and b!717587 (not res!480340)) b!717588))

(assert (=> d!98743 m!672923))

(declare-fun m!672929 () Bool)

(assert (=> d!98743 m!672929))

(declare-fun m!672931 () Bool)

(assert (=> b!717588 m!672931))

(assert (=> b!717445 d!98743))

(declare-fun d!98745 () Bool)

(declare-fun res!480349 () Bool)

(declare-fun e!402886 () Bool)

(assert (=> d!98745 (=> res!480349 e!402886)))

(assert (=> d!98745 (= res!480349 ((_ is Nil!13492) Nil!13492))))

(assert (=> d!98745 (= (noDuplicate!1286 Nil!13492) e!402886)))

(declare-fun b!717601 () Bool)

(declare-fun e!402887 () Bool)

(assert (=> b!717601 (= e!402886 e!402887)))

(declare-fun res!480350 () Bool)

(assert (=> b!717601 (=> (not res!480350) (not e!402887))))

(assert (=> b!717601 (= res!480350 (not (contains!4015 (t!19801 Nil!13492) (h!14536 Nil!13492))))))

(declare-fun b!717602 () Bool)

(assert (=> b!717602 (= e!402887 (noDuplicate!1286 (t!19801 Nil!13492)))))

(assert (= (and d!98745 (not res!480349)) b!717601))

(assert (= (and b!717601 res!480350) b!717602))

(declare-fun m!672933 () Bool)

(assert (=> b!717601 m!672933))

(declare-fun m!672935 () Bool)

(assert (=> b!717602 m!672935))

(assert (=> b!717443 d!98745))

(check-sat (not d!98709) (not b!717601) (not b!717517) (not b!717602) (not bm!34678) (not b!717518) (not b!717559) (not d!98743) (not d!98741) (not b!717586) (not b!717570) (not b!717588))
(check-sat)
