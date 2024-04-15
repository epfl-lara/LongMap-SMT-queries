; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64088 () Bool)

(assert start!64088)

(declare-fun b!719926 () Bool)

(declare-fun res!482438 () Bool)

(declare-fun e!403792 () Bool)

(assert (=> b!719926 (=> (not res!482438) (not e!403792))))

(declare-datatypes ((array!40800 0))(
  ( (array!40801 (arr!19526 (Array (_ BitVec 32) (_ BitVec 64))) (size!19947 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40800)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719926 (= res!482438 (and (= (size!19947 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19947 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19947 a!3186)) (not (= i!1173 j!159))))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7123 0))(
  ( (MissingZero!7123 (index!30860 (_ BitVec 32))) (Found!7123 (index!30861 (_ BitVec 32))) (Intermediate!7123 (undefined!7935 Bool) (index!30862 (_ BitVec 32)) (x!61869 (_ BitVec 32))) (Undefined!7123) (MissingVacant!7123 (index!30863 (_ BitVec 32))) )
))
(declare-fun lt!319481 () SeekEntryResult!7123)

(declare-fun e!403789 () Bool)

(declare-fun b!719927 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40800 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!719927 (= e!403789 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319481))))

(declare-fun b!719928 () Bool)

(declare-fun e!403788 () Bool)

(assert (=> b!719928 (= e!403792 e!403788)))

(declare-fun res!482445 () Bool)

(assert (=> b!719928 (=> (not res!482445) (not e!403788))))

(declare-fun lt!319480 () SeekEntryResult!7123)

(assert (=> b!719928 (= res!482445 (or (= lt!319480 (MissingZero!7123 i!1173)) (= lt!319480 (MissingVacant!7123 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40800 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!719928 (= lt!319480 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!482442 () Bool)

(assert (=> start!64088 (=> (not res!482442) (not e!403792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64088 (= res!482442 (validMask!0 mask!3328))))

(assert (=> start!64088 e!403792))

(assert (=> start!64088 true))

(declare-fun array_inv!15409 (array!40800) Bool)

(assert (=> start!64088 (array_inv!15409 a!3186)))

(declare-fun b!719929 () Bool)

(declare-fun res!482446 () Bool)

(assert (=> b!719929 (=> (not res!482446) (not e!403792))))

(declare-fun arrayContainsKey!0 (array!40800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719929 (= res!482446 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719930 () Bool)

(declare-fun res!482444 () Bool)

(declare-fun e!403791 () Bool)

(assert (=> b!719930 (=> (not res!482444) (not e!403791))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!719930 (= res!482444 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19526 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!719931 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40800 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!719931 (= e!403789 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19526 a!3186) j!159) a!3186 mask!3328) (Found!7123 j!159)))))

(declare-fun b!719932 () Bool)

(assert (=> b!719932 (= e!403788 e!403791)))

(declare-fun res!482437 () Bool)

(assert (=> b!719932 (=> (not res!482437) (not e!403791))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719932 (= res!482437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319481))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719932 (= lt!319481 (Intermediate!7123 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!719933 () Bool)

(assert (=> b!719933 (= e!403791 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!719934 () Bool)

(declare-fun res!482448 () Bool)

(assert (=> b!719934 (=> (not res!482448) (not e!403788))))

(declare-datatypes ((List!13567 0))(
  ( (Nil!13564) (Cons!13563 (h!14611 (_ BitVec 64)) (t!19873 List!13567)) )
))
(declare-fun arrayNoDuplicates!0 (array!40800 (_ BitVec 32) List!13567) Bool)

(assert (=> b!719934 (= res!482448 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13564))))

(declare-fun b!719935 () Bool)

(declare-fun res!482443 () Bool)

(assert (=> b!719935 (=> (not res!482443) (not e!403788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40800 (_ BitVec 32)) Bool)

(assert (=> b!719935 (= res!482443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719936 () Bool)

(declare-fun res!482439 () Bool)

(assert (=> b!719936 (=> (not res!482439) (not e!403792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719936 (= res!482439 (validKeyInArray!0 (select (arr!19526 a!3186) j!159)))))

(declare-fun b!719937 () Bool)

(declare-fun res!482441 () Bool)

(assert (=> b!719937 (=> (not res!482441) (not e!403792))))

(assert (=> b!719937 (= res!482441 (validKeyInArray!0 k0!2102))))

(declare-fun b!719938 () Bool)

(declare-fun res!482447 () Bool)

(assert (=> b!719938 (=> (not res!482447) (not e!403788))))

(assert (=> b!719938 (= res!482447 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19947 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19947 a!3186))))))

(declare-fun b!719939 () Bool)

(declare-fun res!482440 () Bool)

(assert (=> b!719939 (=> (not res!482440) (not e!403791))))

(assert (=> b!719939 (= res!482440 e!403789)))

(declare-fun c!79113 () Bool)

(assert (=> b!719939 (= c!79113 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64088 res!482442) b!719926))

(assert (= (and b!719926 res!482438) b!719936))

(assert (= (and b!719936 res!482439) b!719937))

(assert (= (and b!719937 res!482441) b!719929))

(assert (= (and b!719929 res!482446) b!719928))

(assert (= (and b!719928 res!482445) b!719935))

(assert (= (and b!719935 res!482443) b!719934))

(assert (= (and b!719934 res!482448) b!719938))

(assert (= (and b!719938 res!482447) b!719932))

(assert (= (and b!719932 res!482437) b!719930))

(assert (= (and b!719930 res!482444) b!719939))

(assert (= (and b!719939 c!79113) b!719927))

(assert (= (and b!719939 (not c!79113)) b!719931))

(assert (= (and b!719939 res!482440) b!719933))

(declare-fun m!674657 () Bool)

(assert (=> b!719934 m!674657))

(declare-fun m!674659 () Bool)

(assert (=> b!719927 m!674659))

(assert (=> b!719927 m!674659))

(declare-fun m!674661 () Bool)

(assert (=> b!719927 m!674661))

(declare-fun m!674663 () Bool)

(assert (=> b!719928 m!674663))

(assert (=> b!719932 m!674659))

(assert (=> b!719932 m!674659))

(declare-fun m!674665 () Bool)

(assert (=> b!719932 m!674665))

(assert (=> b!719932 m!674665))

(assert (=> b!719932 m!674659))

(declare-fun m!674667 () Bool)

(assert (=> b!719932 m!674667))

(declare-fun m!674669 () Bool)

(assert (=> b!719930 m!674669))

(declare-fun m!674671 () Bool)

(assert (=> b!719935 m!674671))

(assert (=> b!719931 m!674659))

(assert (=> b!719931 m!674659))

(declare-fun m!674673 () Bool)

(assert (=> b!719931 m!674673))

(declare-fun m!674675 () Bool)

(assert (=> b!719929 m!674675))

(assert (=> b!719936 m!674659))

(assert (=> b!719936 m!674659))

(declare-fun m!674677 () Bool)

(assert (=> b!719936 m!674677))

(declare-fun m!674679 () Bool)

(assert (=> start!64088 m!674679))

(declare-fun m!674681 () Bool)

(assert (=> start!64088 m!674681))

(declare-fun m!674683 () Bool)

(assert (=> b!719937 m!674683))

(check-sat (not b!719936) (not b!719928) (not b!719935) (not b!719932) (not b!719929) (not b!719937) (not b!719934) (not start!64088) (not b!719927) (not b!719931))
(check-sat)
(get-model)

(declare-fun b!720032 () Bool)

(declare-fun e!403831 () Bool)

(declare-fun call!34726 () Bool)

(assert (=> b!720032 (= e!403831 call!34726)))

(declare-fun b!720033 () Bool)

(declare-fun e!403829 () Bool)

(assert (=> b!720033 (= e!403829 e!403831)))

(declare-fun lt!319500 () (_ BitVec 64))

(assert (=> b!720033 (= lt!319500 (select (arr!19526 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24636 0))(
  ( (Unit!24637) )
))
(declare-fun lt!319502 () Unit!24636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40800 (_ BitVec 64) (_ BitVec 32)) Unit!24636)

(assert (=> b!720033 (= lt!319502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319500 #b00000000000000000000000000000000))))

(assert (=> b!720033 (arrayContainsKey!0 a!3186 lt!319500 #b00000000000000000000000000000000)))

(declare-fun lt!319501 () Unit!24636)

(assert (=> b!720033 (= lt!319501 lt!319502)))

(declare-fun res!482526 () Bool)

(assert (=> b!720033 (= res!482526 (= (seekEntryOrOpen!0 (select (arr!19526 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7123 #b00000000000000000000000000000000)))))

(assert (=> b!720033 (=> (not res!482526) (not e!403831))))

(declare-fun b!720034 () Bool)

(assert (=> b!720034 (= e!403829 call!34726)))

(declare-fun bm!34723 () Bool)

(assert (=> bm!34723 (= call!34726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!720035 () Bool)

(declare-fun e!403830 () Bool)

(assert (=> b!720035 (= e!403830 e!403829)))

(declare-fun c!79122 () Bool)

(assert (=> b!720035 (= c!79122 (validKeyInArray!0 (select (arr!19526 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!98909 () Bool)

(declare-fun res!482525 () Bool)

(assert (=> d!98909 (=> res!482525 e!403830)))

(assert (=> d!98909 (= res!482525 (bvsge #b00000000000000000000000000000000 (size!19947 a!3186)))))

(assert (=> d!98909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403830)))

(assert (= (and d!98909 (not res!482525)) b!720035))

(assert (= (and b!720035 c!79122) b!720033))

(assert (= (and b!720035 (not c!79122)) b!720034))

(assert (= (and b!720033 res!482526) b!720032))

(assert (= (or b!720032 b!720034) bm!34723))

(declare-fun m!674741 () Bool)

(assert (=> b!720033 m!674741))

(declare-fun m!674743 () Bool)

(assert (=> b!720033 m!674743))

(declare-fun m!674745 () Bool)

(assert (=> b!720033 m!674745))

(assert (=> b!720033 m!674741))

(declare-fun m!674747 () Bool)

(assert (=> b!720033 m!674747))

(declare-fun m!674749 () Bool)

(assert (=> bm!34723 m!674749))

(assert (=> b!720035 m!674741))

(assert (=> b!720035 m!674741))

(declare-fun m!674751 () Bool)

(assert (=> b!720035 m!674751))

(assert (=> b!719935 d!98909))

(declare-fun d!98911 () Bool)

(declare-fun res!482531 () Bool)

(declare-fun e!403836 () Bool)

(assert (=> d!98911 (=> res!482531 e!403836)))

(assert (=> d!98911 (= res!482531 (= (select (arr!19526 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98911 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403836)))

(declare-fun b!720040 () Bool)

(declare-fun e!403837 () Bool)

(assert (=> b!720040 (= e!403836 e!403837)))

(declare-fun res!482532 () Bool)

(assert (=> b!720040 (=> (not res!482532) (not e!403837))))

(assert (=> b!720040 (= res!482532 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19947 a!3186)))))

(declare-fun b!720041 () Bool)

(assert (=> b!720041 (= e!403837 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98911 (not res!482531)) b!720040))

(assert (= (and b!720040 res!482532) b!720041))

(assert (=> d!98911 m!674741))

(declare-fun m!674753 () Bool)

(assert (=> b!720041 m!674753))

(assert (=> b!719929 d!98911))

(declare-fun bm!34726 () Bool)

(declare-fun call!34729 () Bool)

(declare-fun c!79125 () Bool)

(assert (=> bm!34726 (= call!34729 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79125 (Cons!13563 (select (arr!19526 a!3186) #b00000000000000000000000000000000) Nil!13564) Nil!13564)))))

(declare-fun b!720053 () Bool)

(declare-fun e!403846 () Bool)

(declare-fun e!403847 () Bool)

(assert (=> b!720053 (= e!403846 e!403847)))

(declare-fun res!482540 () Bool)

(assert (=> b!720053 (=> (not res!482540) (not e!403847))))

(declare-fun e!403848 () Bool)

(assert (=> b!720053 (= res!482540 (not e!403848))))

(declare-fun res!482539 () Bool)

(assert (=> b!720053 (=> (not res!482539) (not e!403848))))

(assert (=> b!720053 (= res!482539 (validKeyInArray!0 (select (arr!19526 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720054 () Bool)

(declare-fun e!403849 () Bool)

(assert (=> b!720054 (= e!403849 call!34729)))

(declare-fun b!720055 () Bool)

(assert (=> b!720055 (= e!403849 call!34729)))

(declare-fun b!720056 () Bool)

(declare-fun contains!4023 (List!13567 (_ BitVec 64)) Bool)

(assert (=> b!720056 (= e!403848 (contains!4023 Nil!13564 (select (arr!19526 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!98913 () Bool)

(declare-fun res!482541 () Bool)

(assert (=> d!98913 (=> res!482541 e!403846)))

(assert (=> d!98913 (= res!482541 (bvsge #b00000000000000000000000000000000 (size!19947 a!3186)))))

(assert (=> d!98913 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13564) e!403846)))

(declare-fun b!720052 () Bool)

(assert (=> b!720052 (= e!403847 e!403849)))

(assert (=> b!720052 (= c!79125 (validKeyInArray!0 (select (arr!19526 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98913 (not res!482541)) b!720053))

(assert (= (and b!720053 res!482539) b!720056))

(assert (= (and b!720053 res!482540) b!720052))

(assert (= (and b!720052 c!79125) b!720055))

(assert (= (and b!720052 (not c!79125)) b!720054))

(assert (= (or b!720055 b!720054) bm!34726))

(assert (=> bm!34726 m!674741))

(declare-fun m!674755 () Bool)

(assert (=> bm!34726 m!674755))

(assert (=> b!720053 m!674741))

(assert (=> b!720053 m!674741))

(assert (=> b!720053 m!674751))

(assert (=> b!720056 m!674741))

(assert (=> b!720056 m!674741))

(declare-fun m!674757 () Bool)

(assert (=> b!720056 m!674757))

(assert (=> b!720052 m!674741))

(assert (=> b!720052 m!674741))

(assert (=> b!720052 m!674751))

(assert (=> b!719934 d!98913))

(declare-fun b!720069 () Bool)

(declare-fun e!403856 () SeekEntryResult!7123)

(declare-fun lt!319509 () SeekEntryResult!7123)

(assert (=> b!720069 (= e!403856 (MissingZero!7123 (index!30862 lt!319509)))))

(declare-fun b!720070 () Bool)

(declare-fun e!403858 () SeekEntryResult!7123)

(assert (=> b!720070 (= e!403858 Undefined!7123)))

(declare-fun b!720071 () Bool)

(assert (=> b!720071 (= e!403856 (seekKeyOrZeroReturnVacant!0 (x!61869 lt!319509) (index!30862 lt!319509) (index!30862 lt!319509) k0!2102 a!3186 mask!3328))))

(declare-fun b!720072 () Bool)

(declare-fun e!403857 () SeekEntryResult!7123)

(assert (=> b!720072 (= e!403858 e!403857)))

(declare-fun lt!319510 () (_ BitVec 64))

(assert (=> b!720072 (= lt!319510 (select (arr!19526 a!3186) (index!30862 lt!319509)))))

(declare-fun c!79132 () Bool)

(assert (=> b!720072 (= c!79132 (= lt!319510 k0!2102))))

(declare-fun d!98915 () Bool)

(declare-fun lt!319511 () SeekEntryResult!7123)

(get-info :version)

(assert (=> d!98915 (and (or ((_ is Undefined!7123) lt!319511) (not ((_ is Found!7123) lt!319511)) (and (bvsge (index!30861 lt!319511) #b00000000000000000000000000000000) (bvslt (index!30861 lt!319511) (size!19947 a!3186)))) (or ((_ is Undefined!7123) lt!319511) ((_ is Found!7123) lt!319511) (not ((_ is MissingZero!7123) lt!319511)) (and (bvsge (index!30860 lt!319511) #b00000000000000000000000000000000) (bvslt (index!30860 lt!319511) (size!19947 a!3186)))) (or ((_ is Undefined!7123) lt!319511) ((_ is Found!7123) lt!319511) ((_ is MissingZero!7123) lt!319511) (not ((_ is MissingVacant!7123) lt!319511)) (and (bvsge (index!30863 lt!319511) #b00000000000000000000000000000000) (bvslt (index!30863 lt!319511) (size!19947 a!3186)))) (or ((_ is Undefined!7123) lt!319511) (ite ((_ is Found!7123) lt!319511) (= (select (arr!19526 a!3186) (index!30861 lt!319511)) k0!2102) (ite ((_ is MissingZero!7123) lt!319511) (= (select (arr!19526 a!3186) (index!30860 lt!319511)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7123) lt!319511) (= (select (arr!19526 a!3186) (index!30863 lt!319511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98915 (= lt!319511 e!403858)))

(declare-fun c!79133 () Bool)

(assert (=> d!98915 (= c!79133 (and ((_ is Intermediate!7123) lt!319509) (undefined!7935 lt!319509)))))

(assert (=> d!98915 (= lt!319509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98915 (validMask!0 mask!3328)))

(assert (=> d!98915 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319511)))

(declare-fun b!720073 () Bool)

(assert (=> b!720073 (= e!403857 (Found!7123 (index!30862 lt!319509)))))

(declare-fun b!720074 () Bool)

(declare-fun c!79134 () Bool)

(assert (=> b!720074 (= c!79134 (= lt!319510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720074 (= e!403857 e!403856)))

(assert (= (and d!98915 c!79133) b!720070))

(assert (= (and d!98915 (not c!79133)) b!720072))

(assert (= (and b!720072 c!79132) b!720073))

(assert (= (and b!720072 (not c!79132)) b!720074))

(assert (= (and b!720074 c!79134) b!720069))

(assert (= (and b!720074 (not c!79134)) b!720071))

(declare-fun m!674759 () Bool)

(assert (=> b!720071 m!674759))

(declare-fun m!674761 () Bool)

(assert (=> b!720072 m!674761))

(declare-fun m!674763 () Bool)

(assert (=> d!98915 m!674763))

(declare-fun m!674765 () Bool)

(assert (=> d!98915 m!674765))

(declare-fun m!674767 () Bool)

(assert (=> d!98915 m!674767))

(declare-fun m!674769 () Bool)

(assert (=> d!98915 m!674769))

(assert (=> d!98915 m!674765))

(assert (=> d!98915 m!674679))

(declare-fun m!674771 () Bool)

(assert (=> d!98915 m!674771))

(assert (=> b!719928 d!98915))

(declare-fun d!98921 () Bool)

(assert (=> d!98921 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64088 d!98921))

(declare-fun d!98925 () Bool)

(assert (=> d!98925 (= (array_inv!15409 a!3186) (bvsge (size!19947 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64088 d!98925))

(declare-fun b!720168 () Bool)

(declare-fun e!403918 () SeekEntryResult!7123)

(declare-fun e!403919 () SeekEntryResult!7123)

(assert (=> b!720168 (= e!403918 e!403919)))

(declare-fun lt!319529 () (_ BitVec 64))

(declare-fun c!79166 () Bool)

(assert (=> b!720168 (= c!79166 (or (= lt!319529 (select (arr!19526 a!3186) j!159)) (= (bvadd lt!319529 lt!319529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720169 () Bool)

(assert (=> b!720169 (= e!403919 (Intermediate!7123 false index!1321 x!1131))))

(declare-fun b!720170 () Bool)

(assert (=> b!720170 (= e!403918 (Intermediate!7123 true index!1321 x!1131))))

(declare-fun b!720171 () Bool)

(declare-fun lt!319528 () SeekEntryResult!7123)

(assert (=> b!720171 (and (bvsge (index!30862 lt!319528) #b00000000000000000000000000000000) (bvslt (index!30862 lt!319528) (size!19947 a!3186)))))

(declare-fun res!482575 () Bool)

(assert (=> b!720171 (= res!482575 (= (select (arr!19526 a!3186) (index!30862 lt!319528)) (select (arr!19526 a!3186) j!159)))))

(declare-fun e!403920 () Bool)

(assert (=> b!720171 (=> res!482575 e!403920)))

(declare-fun e!403917 () Bool)

(assert (=> b!720171 (= e!403917 e!403920)))

(declare-fun b!720172 () Bool)

(declare-fun e!403921 () Bool)

(assert (=> b!720172 (= e!403921 (bvsge (x!61869 lt!319528) #b01111111111111111111111111111110))))

(declare-fun d!98927 () Bool)

(assert (=> d!98927 e!403921))

(declare-fun c!79167 () Bool)

(assert (=> d!98927 (= c!79167 (and ((_ is Intermediate!7123) lt!319528) (undefined!7935 lt!319528)))))

(assert (=> d!98927 (= lt!319528 e!403918)))

(declare-fun c!79165 () Bool)

(assert (=> d!98927 (= c!79165 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!98927 (= lt!319529 (select (arr!19526 a!3186) index!1321))))

(assert (=> d!98927 (validMask!0 mask!3328)))

(assert (=> d!98927 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319528)))

(declare-fun b!720173 () Bool)

(assert (=> b!720173 (and (bvsge (index!30862 lt!319528) #b00000000000000000000000000000000) (bvslt (index!30862 lt!319528) (size!19947 a!3186)))))

(declare-fun res!482577 () Bool)

(assert (=> b!720173 (= res!482577 (= (select (arr!19526 a!3186) (index!30862 lt!319528)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720173 (=> res!482577 e!403920)))

(declare-fun b!720174 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720174 (= e!403919 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19526 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720175 () Bool)

(assert (=> b!720175 (= e!403921 e!403917)))

(declare-fun res!482576 () Bool)

(assert (=> b!720175 (= res!482576 (and ((_ is Intermediate!7123) lt!319528) (not (undefined!7935 lt!319528)) (bvslt (x!61869 lt!319528) #b01111111111111111111111111111110) (bvsge (x!61869 lt!319528) #b00000000000000000000000000000000) (bvsge (x!61869 lt!319528) x!1131)))))

(assert (=> b!720175 (=> (not res!482576) (not e!403917))))

(declare-fun b!720176 () Bool)

(assert (=> b!720176 (and (bvsge (index!30862 lt!319528) #b00000000000000000000000000000000) (bvslt (index!30862 lt!319528) (size!19947 a!3186)))))

(assert (=> b!720176 (= e!403920 (= (select (arr!19526 a!3186) (index!30862 lt!319528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98927 c!79165) b!720170))

(assert (= (and d!98927 (not c!79165)) b!720168))

(assert (= (and b!720168 c!79166) b!720169))

(assert (= (and b!720168 (not c!79166)) b!720174))

(assert (= (and d!98927 c!79167) b!720172))

(assert (= (and d!98927 (not c!79167)) b!720175))

(assert (= (and b!720175 res!482576) b!720171))

(assert (= (and b!720171 (not res!482575)) b!720173))

(assert (= (and b!720173 (not res!482577)) b!720176))

(declare-fun m!674807 () Bool)

(assert (=> b!720176 m!674807))

(assert (=> b!720173 m!674807))

(declare-fun m!674809 () Bool)

(assert (=> d!98927 m!674809))

(assert (=> d!98927 m!674679))

(declare-fun m!674811 () Bool)

(assert (=> b!720174 m!674811))

(assert (=> b!720174 m!674811))

(assert (=> b!720174 m!674659))

(declare-fun m!674813 () Bool)

(assert (=> b!720174 m!674813))

(assert (=> b!720171 m!674807))

(assert (=> b!719927 d!98927))

(declare-fun b!720177 () Bool)

(declare-fun e!403923 () SeekEntryResult!7123)

(declare-fun e!403924 () SeekEntryResult!7123)

(assert (=> b!720177 (= e!403923 e!403924)))

(declare-fun c!79169 () Bool)

(declare-fun lt!319531 () (_ BitVec 64))

(assert (=> b!720177 (= c!79169 (or (= lt!319531 (select (arr!19526 a!3186) j!159)) (= (bvadd lt!319531 lt!319531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720178 () Bool)

(assert (=> b!720178 (= e!403924 (Intermediate!7123 false (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!720179 () Bool)

(assert (=> b!720179 (= e!403923 (Intermediate!7123 true (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!720180 () Bool)

(declare-fun lt!319530 () SeekEntryResult!7123)

(assert (=> b!720180 (and (bvsge (index!30862 lt!319530) #b00000000000000000000000000000000) (bvslt (index!30862 lt!319530) (size!19947 a!3186)))))

(declare-fun res!482578 () Bool)

(assert (=> b!720180 (= res!482578 (= (select (arr!19526 a!3186) (index!30862 lt!319530)) (select (arr!19526 a!3186) j!159)))))

(declare-fun e!403925 () Bool)

(assert (=> b!720180 (=> res!482578 e!403925)))

(declare-fun e!403922 () Bool)

(assert (=> b!720180 (= e!403922 e!403925)))

(declare-fun b!720181 () Bool)

(declare-fun e!403926 () Bool)

(assert (=> b!720181 (= e!403926 (bvsge (x!61869 lt!319530) #b01111111111111111111111111111110))))

(declare-fun d!98937 () Bool)

(assert (=> d!98937 e!403926))

(declare-fun c!79170 () Bool)

(assert (=> d!98937 (= c!79170 (and ((_ is Intermediate!7123) lt!319530) (undefined!7935 lt!319530)))))

(assert (=> d!98937 (= lt!319530 e!403923)))

(declare-fun c!79168 () Bool)

(assert (=> d!98937 (= c!79168 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!98937 (= lt!319531 (select (arr!19526 a!3186) (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328)))))

(assert (=> d!98937 (validMask!0 mask!3328)))

(assert (=> d!98937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319530)))

(declare-fun b!720182 () Bool)

(assert (=> b!720182 (and (bvsge (index!30862 lt!319530) #b00000000000000000000000000000000) (bvslt (index!30862 lt!319530) (size!19947 a!3186)))))

(declare-fun res!482580 () Bool)

(assert (=> b!720182 (= res!482580 (= (select (arr!19526 a!3186) (index!30862 lt!319530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720182 (=> res!482580 e!403925)))

(declare-fun b!720183 () Bool)

(assert (=> b!720183 (= e!403924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19526 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720184 () Bool)

(assert (=> b!720184 (= e!403926 e!403922)))

(declare-fun res!482579 () Bool)

(assert (=> b!720184 (= res!482579 (and ((_ is Intermediate!7123) lt!319530) (not (undefined!7935 lt!319530)) (bvslt (x!61869 lt!319530) #b01111111111111111111111111111110) (bvsge (x!61869 lt!319530) #b00000000000000000000000000000000) (bvsge (x!61869 lt!319530) #b00000000000000000000000000000000)))))

(assert (=> b!720184 (=> (not res!482579) (not e!403922))))

(declare-fun b!720185 () Bool)

(assert (=> b!720185 (and (bvsge (index!30862 lt!319530) #b00000000000000000000000000000000) (bvslt (index!30862 lt!319530) (size!19947 a!3186)))))

(assert (=> b!720185 (= e!403925 (= (select (arr!19526 a!3186) (index!30862 lt!319530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98937 c!79168) b!720179))

(assert (= (and d!98937 (not c!79168)) b!720177))

(assert (= (and b!720177 c!79169) b!720178))

(assert (= (and b!720177 (not c!79169)) b!720183))

(assert (= (and d!98937 c!79170) b!720181))

(assert (= (and d!98937 (not c!79170)) b!720184))

(assert (= (and b!720184 res!482579) b!720180))

(assert (= (and b!720180 (not res!482578)) b!720182))

(assert (= (and b!720182 (not res!482580)) b!720185))

(declare-fun m!674815 () Bool)

(assert (=> b!720185 m!674815))

(assert (=> b!720182 m!674815))

(assert (=> d!98937 m!674665))

(declare-fun m!674817 () Bool)

(assert (=> d!98937 m!674817))

(assert (=> d!98937 m!674679))

(assert (=> b!720183 m!674665))

(declare-fun m!674819 () Bool)

(assert (=> b!720183 m!674819))

(assert (=> b!720183 m!674819))

(assert (=> b!720183 m!674659))

(declare-fun m!674821 () Bool)

(assert (=> b!720183 m!674821))

(assert (=> b!720180 m!674815))

(assert (=> b!719932 d!98937))

(declare-fun d!98939 () Bool)

(declare-fun lt!319537 () (_ BitVec 32))

(declare-fun lt!319536 () (_ BitVec 32))

(assert (=> d!98939 (= lt!319537 (bvmul (bvxor lt!319536 (bvlshr lt!319536 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!98939 (= lt!319536 ((_ extract 31 0) (bvand (bvxor (select (arr!19526 a!3186) j!159) (bvlshr (select (arr!19526 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!98939 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!482585 (let ((h!14614 ((_ extract 31 0) (bvand (bvxor (select (arr!19526 a!3186) j!159) (bvlshr (select (arr!19526 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61875 (bvmul (bvxor h!14614 (bvlshr h!14614 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61875 (bvlshr x!61875 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!482585 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!482585 #b00000000000000000000000000000000))))))

(assert (=> d!98939 (= (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) (bvand (bvxor lt!319537 (bvlshr lt!319537 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!719932 d!98939))

(declare-fun d!98943 () Bool)

(assert (=> d!98943 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!719937 d!98943))

(declare-fun e!403965 () SeekEntryResult!7123)

(declare-fun b!720249 () Bool)

(assert (=> b!720249 (= e!403965 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19526 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720250 () Bool)

(declare-fun e!403964 () SeekEntryResult!7123)

(assert (=> b!720250 (= e!403964 (Found!7123 index!1321))))

(declare-fun b!720251 () Bool)

(declare-fun e!403963 () SeekEntryResult!7123)

(assert (=> b!720251 (= e!403963 e!403964)))

(declare-fun lt!319554 () (_ BitVec 64))

(declare-fun c!79196 () Bool)

(assert (=> b!720251 (= c!79196 (= lt!319554 (select (arr!19526 a!3186) j!159)))))

(declare-fun b!720252 () Bool)

(assert (=> b!720252 (= e!403965 (MissingVacant!7123 resIntermediateIndex!5))))

(declare-fun d!98945 () Bool)

(declare-fun lt!319555 () SeekEntryResult!7123)

(assert (=> d!98945 (and (or ((_ is Undefined!7123) lt!319555) (not ((_ is Found!7123) lt!319555)) (and (bvsge (index!30861 lt!319555) #b00000000000000000000000000000000) (bvslt (index!30861 lt!319555) (size!19947 a!3186)))) (or ((_ is Undefined!7123) lt!319555) ((_ is Found!7123) lt!319555) (not ((_ is MissingVacant!7123) lt!319555)) (not (= (index!30863 lt!319555) resIntermediateIndex!5)) (and (bvsge (index!30863 lt!319555) #b00000000000000000000000000000000) (bvslt (index!30863 lt!319555) (size!19947 a!3186)))) (or ((_ is Undefined!7123) lt!319555) (ite ((_ is Found!7123) lt!319555) (= (select (arr!19526 a!3186) (index!30861 lt!319555)) (select (arr!19526 a!3186) j!159)) (and ((_ is MissingVacant!7123) lt!319555) (= (index!30863 lt!319555) resIntermediateIndex!5) (= (select (arr!19526 a!3186) (index!30863 lt!319555)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!98945 (= lt!319555 e!403963)))

(declare-fun c!79197 () Bool)

(assert (=> d!98945 (= c!79197 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!98945 (= lt!319554 (select (arr!19526 a!3186) index!1321))))

(assert (=> d!98945 (validMask!0 mask!3328)))

(assert (=> d!98945 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319555)))

(declare-fun b!720253 () Bool)

(declare-fun c!79195 () Bool)

(assert (=> b!720253 (= c!79195 (= lt!319554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720253 (= e!403964 e!403965)))

(declare-fun b!720254 () Bool)

(assert (=> b!720254 (= e!403963 Undefined!7123)))

(assert (= (and d!98945 c!79197) b!720254))

(assert (= (and d!98945 (not c!79197)) b!720251))

(assert (= (and b!720251 c!79196) b!720250))

(assert (= (and b!720251 (not c!79196)) b!720253))

(assert (= (and b!720253 c!79195) b!720252))

(assert (= (and b!720253 (not c!79195)) b!720249))

(assert (=> b!720249 m!674811))

(assert (=> b!720249 m!674811))

(assert (=> b!720249 m!674659))

(declare-fun m!674835 () Bool)

(assert (=> b!720249 m!674835))

(declare-fun m!674837 () Bool)

(assert (=> d!98945 m!674837))

(declare-fun m!674839 () Bool)

(assert (=> d!98945 m!674839))

(assert (=> d!98945 m!674809))

(assert (=> d!98945 m!674679))

(assert (=> b!719931 d!98945))

(declare-fun d!98951 () Bool)

(assert (=> d!98951 (= (validKeyInArray!0 (select (arr!19526 a!3186) j!159)) (and (not (= (select (arr!19526 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19526 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!719936 d!98951))

(check-sat (not b!720033) (not d!98915) (not d!98945) (not b!720174) (not b!720249) (not b!720183) (not d!98927) (not b!720056) (not d!98937) (not bm!34723) (not b!720052) (not bm!34726) (not b!720035) (not b!720071) (not b!720053) (not b!720041))
(check-sat)
