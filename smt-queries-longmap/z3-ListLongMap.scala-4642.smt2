; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64532 () Bool)

(assert start!64532)

(declare-fun b!726939 () Bool)

(declare-fun e!406945 () Bool)

(declare-fun e!406946 () Bool)

(assert (=> b!726939 (= e!406945 e!406946)))

(declare-fun res!487978 () Bool)

(assert (=> b!726939 (=> (not res!487978) (not e!406946))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7252 0))(
  ( (MissingZero!7252 (index!31376 (_ BitVec 32))) (Found!7252 (index!31377 (_ BitVec 32))) (Intermediate!7252 (undefined!8064 Bool) (index!31378 (_ BitVec 32)) (x!62369 (_ BitVec 32))) (Undefined!7252) (MissingVacant!7252 (index!31379 (_ BitVec 32))) )
))
(declare-fun lt!321834 () SeekEntryResult!7252)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41067 0))(
  ( (array!41068 (arr!19655 (Array (_ BitVec 32) (_ BitVec 64))) (size!20076 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41067)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41067 (_ BitVec 32)) SeekEntryResult!7252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726939 (= res!487978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321834))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726939 (= lt!321834 (Intermediate!7252 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!406948 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!726940 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41067 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!726940 (= e!406948 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) (Found!7252 j!159)))))

(declare-fun b!726941 () Bool)

(declare-fun e!406941 () Bool)

(declare-fun e!406943 () Bool)

(assert (=> b!726941 (= e!406941 (not e!406943))))

(declare-fun res!487980 () Bool)

(assert (=> b!726941 (=> res!487980 e!406943)))

(declare-fun lt!321839 () SeekEntryResult!7252)

(get-info :version)

(assert (=> b!726941 (= res!487980 (or (not ((_ is Intermediate!7252) lt!321839)) (bvsge x!1131 (x!62369 lt!321839))))))

(declare-fun e!406940 () Bool)

(assert (=> b!726941 e!406940))

(declare-fun res!487983 () Bool)

(assert (=> b!726941 (=> (not res!487983) (not e!406940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41067 (_ BitVec 32)) Bool)

(assert (=> b!726941 (= res!487983 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24794 0))(
  ( (Unit!24795) )
))
(declare-fun lt!321833 () Unit!24794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24794)

(assert (=> b!726941 (= lt!321833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726942 () Bool)

(declare-fun res!487977 () Bool)

(assert (=> b!726942 (=> (not res!487977) (not e!406945))))

(declare-datatypes ((List!13696 0))(
  ( (Nil!13693) (Cons!13692 (h!14749 (_ BitVec 64)) (t!20002 List!13696)) )
))
(declare-fun arrayNoDuplicates!0 (array!41067 (_ BitVec 32) List!13696) Bool)

(assert (=> b!726942 (= res!487977 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13693))))

(declare-fun b!726943 () Bool)

(declare-fun res!487981 () Bool)

(declare-fun e!406944 () Bool)

(assert (=> b!726943 (=> (not res!487981) (not e!406944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726943 (= res!487981 (validKeyInArray!0 (select (arr!19655 a!3186) j!159)))))

(declare-fun b!726944 () Bool)

(declare-fun res!487982 () Bool)

(assert (=> b!726944 (=> (not res!487982) (not e!406944))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726944 (= res!487982 (validKeyInArray!0 k0!2102))))

(declare-fun b!726945 () Bool)

(declare-fun res!487985 () Bool)

(assert (=> b!726945 (=> (not res!487985) (not e!406945))))

(assert (=> b!726945 (= res!487985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726946 () Bool)

(declare-fun res!487989 () Bool)

(assert (=> b!726946 (=> (not res!487989) (not e!406944))))

(declare-fun arrayContainsKey!0 (array!41067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726946 (= res!487989 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726947 () Bool)

(declare-fun lt!321837 () (_ BitVec 32))

(assert (=> b!726947 (= e!406943 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!321837 #b00000000000000000000000000000000) (bvslt lt!321837 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726947 (= lt!321837 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726948 () Bool)

(declare-fun res!487979 () Bool)

(assert (=> b!726948 (=> (not res!487979) (not e!406946))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726948 (= res!487979 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19655 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726949 () Bool)

(declare-fun res!487991 () Bool)

(assert (=> b!726949 (=> (not res!487991) (not e!406945))))

(assert (=> b!726949 (= res!487991 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20076 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20076 a!3186))))))

(declare-fun b!726950 () Bool)

(declare-fun res!487984 () Bool)

(assert (=> b!726950 (=> (not res!487984) (not e!406944))))

(assert (=> b!726950 (= res!487984 (and (= (size!20076 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20076 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20076 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!321831 () SeekEntryResult!7252)

(declare-fun e!406947 () Bool)

(declare-fun b!726951 () Bool)

(assert (=> b!726951 (= e!406947 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321831))))

(declare-fun b!726952 () Bool)

(assert (=> b!726952 (= e!406940 e!406947)))

(declare-fun res!487990 () Bool)

(assert (=> b!726952 (=> (not res!487990) (not e!406947))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41067 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!726952 (= res!487990 (= (seekEntryOrOpen!0 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321831))))

(assert (=> b!726952 (= lt!321831 (Found!7252 j!159))))

(declare-fun res!487987 () Bool)

(assert (=> start!64532 (=> (not res!487987) (not e!406944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64532 (= res!487987 (validMask!0 mask!3328))))

(assert (=> start!64532 e!406944))

(assert (=> start!64532 true))

(declare-fun array_inv!15538 (array!41067) Bool)

(assert (=> start!64532 (array_inv!15538 a!3186)))

(declare-fun b!726953 () Bool)

(declare-fun res!487986 () Bool)

(assert (=> b!726953 (=> (not res!487986) (not e!406946))))

(assert (=> b!726953 (= res!487986 e!406948)))

(declare-fun c!79854 () Bool)

(assert (=> b!726953 (= c!79854 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726954 () Bool)

(assert (=> b!726954 (= e!406944 e!406945)))

(declare-fun res!487992 () Bool)

(assert (=> b!726954 (=> (not res!487992) (not e!406945))))

(declare-fun lt!321835 () SeekEntryResult!7252)

(assert (=> b!726954 (= res!487992 (or (= lt!321835 (MissingZero!7252 i!1173)) (= lt!321835 (MissingVacant!7252 i!1173))))))

(assert (=> b!726954 (= lt!321835 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726955 () Bool)

(assert (=> b!726955 (= e!406946 e!406941)))

(declare-fun res!487988 () Bool)

(assert (=> b!726955 (=> (not res!487988) (not e!406941))))

(declare-fun lt!321836 () SeekEntryResult!7252)

(assert (=> b!726955 (= res!487988 (= lt!321836 lt!321839))))

(declare-fun lt!321832 () (_ BitVec 64))

(declare-fun lt!321838 () array!41067)

(assert (=> b!726955 (= lt!321839 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321832 lt!321838 mask!3328))))

(assert (=> b!726955 (= lt!321836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321832 mask!3328) lt!321832 lt!321838 mask!3328))))

(assert (=> b!726955 (= lt!321832 (select (store (arr!19655 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726955 (= lt!321838 (array!41068 (store (arr!19655 a!3186) i!1173 k0!2102) (size!20076 a!3186)))))

(declare-fun b!726956 () Bool)

(assert (=> b!726956 (= e!406948 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321834))))

(assert (= (and start!64532 res!487987) b!726950))

(assert (= (and b!726950 res!487984) b!726943))

(assert (= (and b!726943 res!487981) b!726944))

(assert (= (and b!726944 res!487982) b!726946))

(assert (= (and b!726946 res!487989) b!726954))

(assert (= (and b!726954 res!487992) b!726945))

(assert (= (and b!726945 res!487985) b!726942))

(assert (= (and b!726942 res!487977) b!726949))

(assert (= (and b!726949 res!487991) b!726939))

(assert (= (and b!726939 res!487978) b!726948))

(assert (= (and b!726948 res!487979) b!726953))

(assert (= (and b!726953 c!79854) b!726956))

(assert (= (and b!726953 (not c!79854)) b!726940))

(assert (= (and b!726953 res!487986) b!726955))

(assert (= (and b!726955 res!487988) b!726941))

(assert (= (and b!726941 res!487983) b!726952))

(assert (= (and b!726952 res!487990) b!726951))

(assert (= (and b!726941 (not res!487980)) b!726947))

(declare-fun m!680411 () Bool)

(assert (=> b!726943 m!680411))

(assert (=> b!726943 m!680411))

(declare-fun m!680413 () Bool)

(assert (=> b!726943 m!680413))

(declare-fun m!680415 () Bool)

(assert (=> b!726941 m!680415))

(declare-fun m!680417 () Bool)

(assert (=> b!726941 m!680417))

(assert (=> b!726956 m!680411))

(assert (=> b!726956 m!680411))

(declare-fun m!680419 () Bool)

(assert (=> b!726956 m!680419))

(declare-fun m!680421 () Bool)

(assert (=> b!726948 m!680421))

(declare-fun m!680423 () Bool)

(assert (=> b!726942 m!680423))

(declare-fun m!680425 () Bool)

(assert (=> b!726955 m!680425))

(declare-fun m!680427 () Bool)

(assert (=> b!726955 m!680427))

(declare-fun m!680429 () Bool)

(assert (=> b!726955 m!680429))

(declare-fun m!680431 () Bool)

(assert (=> b!726955 m!680431))

(declare-fun m!680433 () Bool)

(assert (=> b!726955 m!680433))

(assert (=> b!726955 m!680427))

(assert (=> b!726952 m!680411))

(assert (=> b!726952 m!680411))

(declare-fun m!680435 () Bool)

(assert (=> b!726952 m!680435))

(assert (=> b!726940 m!680411))

(assert (=> b!726940 m!680411))

(declare-fun m!680437 () Bool)

(assert (=> b!726940 m!680437))

(declare-fun m!680439 () Bool)

(assert (=> b!726945 m!680439))

(declare-fun m!680441 () Bool)

(assert (=> b!726947 m!680441))

(assert (=> b!726951 m!680411))

(assert (=> b!726951 m!680411))

(declare-fun m!680443 () Bool)

(assert (=> b!726951 m!680443))

(assert (=> b!726939 m!680411))

(assert (=> b!726939 m!680411))

(declare-fun m!680445 () Bool)

(assert (=> b!726939 m!680445))

(assert (=> b!726939 m!680445))

(assert (=> b!726939 m!680411))

(declare-fun m!680447 () Bool)

(assert (=> b!726939 m!680447))

(declare-fun m!680449 () Bool)

(assert (=> b!726946 m!680449))

(declare-fun m!680451 () Bool)

(assert (=> b!726944 m!680451))

(declare-fun m!680453 () Bool)

(assert (=> b!726954 m!680453))

(declare-fun m!680455 () Bool)

(assert (=> start!64532 m!680455))

(declare-fun m!680457 () Bool)

(assert (=> start!64532 m!680457))

(check-sat (not b!726944) (not b!726951) (not b!726952) (not b!726954) (not b!726943) (not b!726946) (not b!726940) (not b!726942) (not b!726947) (not start!64532) (not b!726955) (not b!726956) (not b!726945) (not b!726939) (not b!726941))
(check-sat)
(get-model)

(declare-fun b!727079 () Bool)

(declare-fun e!407013 () SeekEntryResult!7252)

(declare-fun lt!321900 () SeekEntryResult!7252)

(assert (=> b!727079 (= e!407013 (Found!7252 (index!31378 lt!321900)))))

(declare-fun b!727080 () Bool)

(declare-fun e!407012 () SeekEntryResult!7252)

(assert (=> b!727080 (= e!407012 Undefined!7252)))

(declare-fun e!407011 () SeekEntryResult!7252)

(declare-fun b!727081 () Bool)

(assert (=> b!727081 (= e!407011 (seekKeyOrZeroReturnVacant!0 (x!62369 lt!321900) (index!31378 lt!321900) (index!31378 lt!321900) (select (arr!19655 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727082 () Bool)

(assert (=> b!727082 (= e!407011 (MissingZero!7252 (index!31378 lt!321900)))))

(declare-fun b!727083 () Bool)

(assert (=> b!727083 (= e!407012 e!407013)))

(declare-fun lt!321901 () (_ BitVec 64))

(assert (=> b!727083 (= lt!321901 (select (arr!19655 a!3186) (index!31378 lt!321900)))))

(declare-fun c!79868 () Bool)

(assert (=> b!727083 (= c!79868 (= lt!321901 (select (arr!19655 a!3186) j!159)))))

(declare-fun d!99253 () Bool)

(declare-fun lt!321902 () SeekEntryResult!7252)

(assert (=> d!99253 (and (or ((_ is Undefined!7252) lt!321902) (not ((_ is Found!7252) lt!321902)) (and (bvsge (index!31377 lt!321902) #b00000000000000000000000000000000) (bvslt (index!31377 lt!321902) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321902) ((_ is Found!7252) lt!321902) (not ((_ is MissingZero!7252) lt!321902)) (and (bvsge (index!31376 lt!321902) #b00000000000000000000000000000000) (bvslt (index!31376 lt!321902) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321902) ((_ is Found!7252) lt!321902) ((_ is MissingZero!7252) lt!321902) (not ((_ is MissingVacant!7252) lt!321902)) (and (bvsge (index!31379 lt!321902) #b00000000000000000000000000000000) (bvslt (index!31379 lt!321902) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321902) (ite ((_ is Found!7252) lt!321902) (= (select (arr!19655 a!3186) (index!31377 lt!321902)) (select (arr!19655 a!3186) j!159)) (ite ((_ is MissingZero!7252) lt!321902) (= (select (arr!19655 a!3186) (index!31376 lt!321902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7252) lt!321902) (= (select (arr!19655 a!3186) (index!31379 lt!321902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99253 (= lt!321902 e!407012)))

(declare-fun c!79869 () Bool)

(assert (=> d!99253 (= c!79869 (and ((_ is Intermediate!7252) lt!321900) (undefined!8064 lt!321900)))))

(assert (=> d!99253 (= lt!321900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) (select (arr!19655 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99253 (validMask!0 mask!3328)))

(assert (=> d!99253 (= (seekEntryOrOpen!0 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321902)))

(declare-fun b!727084 () Bool)

(declare-fun c!79867 () Bool)

(assert (=> b!727084 (= c!79867 (= lt!321901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727084 (= e!407013 e!407011)))

(assert (= (and d!99253 c!79869) b!727080))

(assert (= (and d!99253 (not c!79869)) b!727083))

(assert (= (and b!727083 c!79868) b!727079))

(assert (= (and b!727083 (not c!79868)) b!727084))

(assert (= (and b!727084 c!79867) b!727082))

(assert (= (and b!727084 (not c!79867)) b!727081))

(assert (=> b!727081 m!680411))

(declare-fun m!680555 () Bool)

(assert (=> b!727081 m!680555))

(declare-fun m!680557 () Bool)

(assert (=> b!727083 m!680557))

(assert (=> d!99253 m!680411))

(assert (=> d!99253 m!680445))

(assert (=> d!99253 m!680445))

(assert (=> d!99253 m!680411))

(assert (=> d!99253 m!680447))

(declare-fun m!680559 () Bool)

(assert (=> d!99253 m!680559))

(assert (=> d!99253 m!680455))

(declare-fun m!680561 () Bool)

(assert (=> d!99253 m!680561))

(declare-fun m!680563 () Bool)

(assert (=> d!99253 m!680563))

(assert (=> b!726952 d!99253))

(declare-fun b!727106 () Bool)

(declare-fun e!407032 () Bool)

(declare-fun e!407030 () Bool)

(assert (=> b!727106 (= e!407032 e!407030)))

(declare-fun lt!321911 () (_ BitVec 64))

(assert (=> b!727106 (= lt!321911 (select (arr!19655 a!3186) j!159))))

(declare-fun lt!321909 () Unit!24794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41067 (_ BitVec 64) (_ BitVec 32)) Unit!24794)

(assert (=> b!727106 (= lt!321909 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321911 j!159))))

(assert (=> b!727106 (arrayContainsKey!0 a!3186 lt!321911 #b00000000000000000000000000000000)))

(declare-fun lt!321910 () Unit!24794)

(assert (=> b!727106 (= lt!321910 lt!321909)))

(declare-fun res!488103 () Bool)

(assert (=> b!727106 (= res!488103 (= (seekEntryOrOpen!0 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) (Found!7252 j!159)))))

(assert (=> b!727106 (=> (not res!488103) (not e!407030))))

(declare-fun b!727107 () Bool)

(declare-fun e!407031 () Bool)

(assert (=> b!727107 (= e!407031 e!407032)))

(declare-fun c!79875 () Bool)

(assert (=> b!727107 (= c!79875 (validKeyInArray!0 (select (arr!19655 a!3186) j!159)))))

(declare-fun bm!34783 () Bool)

(declare-fun call!34786 () Bool)

(assert (=> bm!34783 (= call!34786 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!727109 () Bool)

(assert (=> b!727109 (= e!407032 call!34786)))

(declare-fun b!727108 () Bool)

(assert (=> b!727108 (= e!407030 call!34786)))

(declare-fun d!99257 () Bool)

(declare-fun res!488102 () Bool)

(assert (=> d!99257 (=> res!488102 e!407031)))

(assert (=> d!99257 (= res!488102 (bvsge j!159 (size!20076 a!3186)))))

(assert (=> d!99257 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!407031)))

(assert (= (and d!99257 (not res!488102)) b!727107))

(assert (= (and b!727107 c!79875) b!727106))

(assert (= (and b!727107 (not c!79875)) b!727109))

(assert (= (and b!727106 res!488103) b!727108))

(assert (= (or b!727108 b!727109) bm!34783))

(assert (=> b!727106 m!680411))

(declare-fun m!680573 () Bool)

(assert (=> b!727106 m!680573))

(declare-fun m!680575 () Bool)

(assert (=> b!727106 m!680575))

(assert (=> b!727106 m!680411))

(assert (=> b!727106 m!680435))

(assert (=> b!727107 m!680411))

(assert (=> b!727107 m!680411))

(assert (=> b!727107 m!680413))

(declare-fun m!680577 () Bool)

(assert (=> bm!34783 m!680577))

(assert (=> b!726941 d!99257))

(declare-fun d!99267 () Bool)

(assert (=> d!99267 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!321920 () Unit!24794)

(declare-fun choose!38 (array!41067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24794)

(assert (=> d!99267 (= lt!321920 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99267 (validMask!0 mask!3328)))

(assert (=> d!99267 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!321920)))

(declare-fun bs!20832 () Bool)

(assert (= bs!20832 d!99267))

(assert (=> bs!20832 m!680415))

(declare-fun m!680585 () Bool)

(assert (=> bs!20832 m!680585))

(assert (=> bs!20832 m!680455))

(assert (=> b!726941 d!99267))

(declare-fun d!99271 () Bool)

(declare-fun lt!321946 () SeekEntryResult!7252)

(assert (=> d!99271 (and (or ((_ is Undefined!7252) lt!321946) (not ((_ is Found!7252) lt!321946)) (and (bvsge (index!31377 lt!321946) #b00000000000000000000000000000000) (bvslt (index!31377 lt!321946) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321946) ((_ is Found!7252) lt!321946) (not ((_ is MissingVacant!7252) lt!321946)) (not (= (index!31379 lt!321946) resIntermediateIndex!5)) (and (bvsge (index!31379 lt!321946) #b00000000000000000000000000000000) (bvslt (index!31379 lt!321946) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321946) (ite ((_ is Found!7252) lt!321946) (= (select (arr!19655 a!3186) (index!31377 lt!321946)) (select (arr!19655 a!3186) j!159)) (and ((_ is MissingVacant!7252) lt!321946) (= (index!31379 lt!321946) resIntermediateIndex!5) (= (select (arr!19655 a!3186) (index!31379 lt!321946)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!407076 () SeekEntryResult!7252)

(assert (=> d!99271 (= lt!321946 e!407076)))

(declare-fun c!79911 () Bool)

(assert (=> d!99271 (= c!79911 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!321945 () (_ BitVec 64))

(assert (=> d!99271 (= lt!321945 (select (arr!19655 a!3186) resIntermediateIndex!5))))

(assert (=> d!99271 (validMask!0 mask!3328)))

(assert (=> d!99271 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321946)))

(declare-fun b!727188 () Bool)

(declare-fun e!407074 () SeekEntryResult!7252)

(assert (=> b!727188 (= e!407074 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727189 () Bool)

(declare-fun e!407075 () SeekEntryResult!7252)

(assert (=> b!727189 (= e!407075 (Found!7252 resIntermediateIndex!5))))

(declare-fun b!727190 () Bool)

(declare-fun c!79909 () Bool)

(assert (=> b!727190 (= c!79909 (= lt!321945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727190 (= e!407075 e!407074)))

(declare-fun b!727191 () Bool)

(assert (=> b!727191 (= e!407076 e!407075)))

(declare-fun c!79910 () Bool)

(assert (=> b!727191 (= c!79910 (= lt!321945 (select (arr!19655 a!3186) j!159)))))

(declare-fun b!727192 () Bool)

(assert (=> b!727192 (= e!407074 (MissingVacant!7252 resIntermediateIndex!5))))

(declare-fun b!727193 () Bool)

(assert (=> b!727193 (= e!407076 Undefined!7252)))

(assert (= (and d!99271 c!79911) b!727193))

(assert (= (and d!99271 (not c!79911)) b!727191))

(assert (= (and b!727191 c!79910) b!727189))

(assert (= (and b!727191 (not c!79910)) b!727190))

(assert (= (and b!727190 c!79909) b!727192))

(assert (= (and b!727190 (not c!79909)) b!727188))

(declare-fun m!680603 () Bool)

(assert (=> d!99271 m!680603))

(declare-fun m!680605 () Bool)

(assert (=> d!99271 m!680605))

(assert (=> d!99271 m!680421))

(assert (=> d!99271 m!680455))

(declare-fun m!680607 () Bool)

(assert (=> b!727188 m!680607))

(assert (=> b!727188 m!680607))

(assert (=> b!727188 m!680411))

(declare-fun m!680609 () Bool)

(assert (=> b!727188 m!680609))

(assert (=> b!726951 d!99271))

(declare-fun lt!321951 () SeekEntryResult!7252)

(declare-fun d!99279 () Bool)

(assert (=> d!99279 (and (or ((_ is Undefined!7252) lt!321951) (not ((_ is Found!7252) lt!321951)) (and (bvsge (index!31377 lt!321951) #b00000000000000000000000000000000) (bvslt (index!31377 lt!321951) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321951) ((_ is Found!7252) lt!321951) (not ((_ is MissingVacant!7252) lt!321951)) (not (= (index!31379 lt!321951) resIntermediateIndex!5)) (and (bvsge (index!31379 lt!321951) #b00000000000000000000000000000000) (bvslt (index!31379 lt!321951) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!321951) (ite ((_ is Found!7252) lt!321951) (= (select (arr!19655 a!3186) (index!31377 lt!321951)) (select (arr!19655 a!3186) j!159)) (and ((_ is MissingVacant!7252) lt!321951) (= (index!31379 lt!321951) resIntermediateIndex!5) (= (select (arr!19655 a!3186) (index!31379 lt!321951)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!407082 () SeekEntryResult!7252)

(assert (=> d!99279 (= lt!321951 e!407082)))

(declare-fun c!79917 () Bool)

(assert (=> d!99279 (= c!79917 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!321950 () (_ BitVec 64))

(assert (=> d!99279 (= lt!321950 (select (arr!19655 a!3186) index!1321))))

(assert (=> d!99279 (validMask!0 mask!3328)))

(assert (=> d!99279 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321951)))

(declare-fun e!407080 () SeekEntryResult!7252)

(declare-fun b!727200 () Bool)

(assert (=> b!727200 (= e!407080 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727201 () Bool)

(declare-fun e!407081 () SeekEntryResult!7252)

(assert (=> b!727201 (= e!407081 (Found!7252 index!1321))))

(declare-fun b!727202 () Bool)

(declare-fun c!79915 () Bool)

(assert (=> b!727202 (= c!79915 (= lt!321950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727202 (= e!407081 e!407080)))

(declare-fun b!727203 () Bool)

(assert (=> b!727203 (= e!407082 e!407081)))

(declare-fun c!79916 () Bool)

(assert (=> b!727203 (= c!79916 (= lt!321950 (select (arr!19655 a!3186) j!159)))))

(declare-fun b!727204 () Bool)

(assert (=> b!727204 (= e!407080 (MissingVacant!7252 resIntermediateIndex!5))))

(declare-fun b!727205 () Bool)

(assert (=> b!727205 (= e!407082 Undefined!7252)))

(assert (= (and d!99279 c!79917) b!727205))

(assert (= (and d!99279 (not c!79917)) b!727203))

(assert (= (and b!727203 c!79916) b!727201))

(assert (= (and b!727203 (not c!79916)) b!727202))

(assert (= (and b!727202 c!79915) b!727204))

(assert (= (and b!727202 (not c!79915)) b!727200))

(declare-fun m!680625 () Bool)

(assert (=> d!99279 m!680625))

(declare-fun m!680627 () Bool)

(assert (=> d!99279 m!680627))

(declare-fun m!680629 () Bool)

(assert (=> d!99279 m!680629))

(assert (=> d!99279 m!680455))

(assert (=> b!727200 m!680441))

(assert (=> b!727200 m!680441))

(assert (=> b!727200 m!680411))

(declare-fun m!680631 () Bool)

(assert (=> b!727200 m!680631))

(assert (=> b!726940 d!99279))

(declare-fun b!727304 () Bool)

(declare-fun lt!321985 () SeekEntryResult!7252)

(assert (=> b!727304 (and (bvsge (index!31378 lt!321985) #b00000000000000000000000000000000) (bvslt (index!31378 lt!321985) (size!20076 a!3186)))))

(declare-fun e!407144 () Bool)

(assert (=> b!727304 (= e!407144 (= (select (arr!19655 a!3186) (index!31378 lt!321985)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727305 () Bool)

(declare-fun e!407145 () SeekEntryResult!7252)

(declare-fun e!407147 () SeekEntryResult!7252)

(assert (=> b!727305 (= e!407145 e!407147)))

(declare-fun lt!321986 () (_ BitVec 64))

(declare-fun c!79953 () Bool)

(assert (=> b!727305 (= c!79953 (or (= lt!321986 (select (arr!19655 a!3186) j!159)) (= (bvadd lt!321986 lt!321986) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99283 () Bool)

(declare-fun e!407146 () Bool)

(assert (=> d!99283 e!407146))

(declare-fun c!79954 () Bool)

(assert (=> d!99283 (= c!79954 (and ((_ is Intermediate!7252) lt!321985) (undefined!8064 lt!321985)))))

(assert (=> d!99283 (= lt!321985 e!407145)))

(declare-fun c!79955 () Bool)

(assert (=> d!99283 (= c!79955 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99283 (= lt!321986 (select (arr!19655 a!3186) (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328)))))

(assert (=> d!99283 (validMask!0 mask!3328)))

(assert (=> d!99283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!321985)))

(declare-fun b!727306 () Bool)

(assert (=> b!727306 (= e!407146 (bvsge (x!62369 lt!321985) #b01111111111111111111111111111110))))

(declare-fun b!727307 () Bool)

(assert (=> b!727307 (and (bvsge (index!31378 lt!321985) #b00000000000000000000000000000000) (bvslt (index!31378 lt!321985) (size!20076 a!3186)))))

(declare-fun res!488145 () Bool)

(assert (=> b!727307 (= res!488145 (= (select (arr!19655 a!3186) (index!31378 lt!321985)) (select (arr!19655 a!3186) j!159)))))

(assert (=> b!727307 (=> res!488145 e!407144)))

(declare-fun e!407143 () Bool)

(assert (=> b!727307 (= e!407143 e!407144)))

(declare-fun b!727308 () Bool)

(assert (=> b!727308 (= e!407146 e!407143)))

(declare-fun res!488147 () Bool)

(assert (=> b!727308 (= res!488147 (and ((_ is Intermediate!7252) lt!321985) (not (undefined!8064 lt!321985)) (bvslt (x!62369 lt!321985) #b01111111111111111111111111111110) (bvsge (x!62369 lt!321985) #b00000000000000000000000000000000) (bvsge (x!62369 lt!321985) #b00000000000000000000000000000000)))))

(assert (=> b!727308 (=> (not res!488147) (not e!407143))))

(declare-fun b!727309 () Bool)

(assert (=> b!727309 (= e!407147 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19655 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727310 () Bool)

(assert (=> b!727310 (= e!407145 (Intermediate!7252 true (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727311 () Bool)

(assert (=> b!727311 (and (bvsge (index!31378 lt!321985) #b00000000000000000000000000000000) (bvslt (index!31378 lt!321985) (size!20076 a!3186)))))

(declare-fun res!488146 () Bool)

(assert (=> b!727311 (= res!488146 (= (select (arr!19655 a!3186) (index!31378 lt!321985)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727311 (=> res!488146 e!407144)))

(declare-fun b!727312 () Bool)

(assert (=> b!727312 (= e!407147 (Intermediate!7252 false (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99283 c!79955) b!727310))

(assert (= (and d!99283 (not c!79955)) b!727305))

(assert (= (and b!727305 c!79953) b!727312))

(assert (= (and b!727305 (not c!79953)) b!727309))

(assert (= (and d!99283 c!79954) b!727306))

(assert (= (and d!99283 (not c!79954)) b!727308))

(assert (= (and b!727308 res!488147) b!727307))

(assert (= (and b!727307 (not res!488145)) b!727311))

(assert (= (and b!727311 (not res!488146)) b!727304))

(assert (=> d!99283 m!680445))

(declare-fun m!680681 () Bool)

(assert (=> d!99283 m!680681))

(assert (=> d!99283 m!680455))

(declare-fun m!680683 () Bool)

(assert (=> b!727307 m!680683))

(assert (=> b!727304 m!680683))

(assert (=> b!727309 m!680445))

(declare-fun m!680685 () Bool)

(assert (=> b!727309 m!680685))

(assert (=> b!727309 m!680685))

(assert (=> b!727309 m!680411))

(declare-fun m!680687 () Bool)

(assert (=> b!727309 m!680687))

(assert (=> b!727311 m!680683))

(assert (=> b!726939 d!99283))

(declare-fun d!99299 () Bool)

(declare-fun lt!322009 () (_ BitVec 32))

(declare-fun lt!322008 () (_ BitVec 32))

(assert (=> d!99299 (= lt!322009 (bvmul (bvxor lt!322008 (bvlshr lt!322008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99299 (= lt!322008 ((_ extract 31 0) (bvand (bvxor (select (arr!19655 a!3186) j!159) (bvlshr (select (arr!19655 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99299 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488154 (let ((h!14753 ((_ extract 31 0) (bvand (bvxor (select (arr!19655 a!3186) j!159) (bvlshr (select (arr!19655 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62379 (bvmul (bvxor h!14753 (bvlshr h!14753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62379 (bvlshr x!62379 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488154 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488154 #b00000000000000000000000000000000))))))

(assert (=> d!99299 (= (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) (bvand (bvxor lt!322009 (bvlshr lt!322009 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!726939 d!99299))

(declare-fun d!99307 () Bool)

(declare-fun lt!322018 () (_ BitVec 32))

(assert (=> d!99307 (and (bvsge lt!322018 #b00000000000000000000000000000000) (bvslt lt!322018 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99307 (= lt!322018 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99307 (validMask!0 mask!3328)))

(assert (=> d!99307 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!322018)))

(declare-fun bs!20835 () Bool)

(assert (= bs!20835 d!99307))

(declare-fun m!680731 () Bool)

(assert (=> bs!20835 m!680731))

(assert (=> bs!20835 m!680455))

(assert (=> b!726947 d!99307))

(declare-fun d!99315 () Bool)

(declare-fun res!488163 () Bool)

(declare-fun e!407173 () Bool)

(assert (=> d!99315 (=> res!488163 e!407173)))

(assert (=> d!99315 (= res!488163 (= (select (arr!19655 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99315 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!407173)))

(declare-fun b!727349 () Bool)

(declare-fun e!407174 () Bool)

(assert (=> b!727349 (= e!407173 e!407174)))

(declare-fun res!488164 () Bool)

(assert (=> b!727349 (=> (not res!488164) (not e!407174))))

(assert (=> b!727349 (= res!488164 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20076 a!3186)))))

(declare-fun b!727350 () Bool)

(assert (=> b!727350 (= e!407174 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99315 (not res!488163)) b!727349))

(assert (= (and b!727349 res!488164) b!727350))

(declare-fun m!680733 () Bool)

(assert (=> d!99315 m!680733))

(declare-fun m!680735 () Bool)

(assert (=> b!727350 m!680735))

(assert (=> b!726946 d!99315))

(declare-fun b!727351 () Bool)

(declare-fun lt!322019 () SeekEntryResult!7252)

(assert (=> b!727351 (and (bvsge (index!31378 lt!322019) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322019) (size!20076 a!3186)))))

(declare-fun e!407176 () Bool)

(assert (=> b!727351 (= e!407176 (= (select (arr!19655 a!3186) (index!31378 lt!322019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727352 () Bool)

(declare-fun e!407177 () SeekEntryResult!7252)

(declare-fun e!407179 () SeekEntryResult!7252)

(assert (=> b!727352 (= e!407177 e!407179)))

(declare-fun lt!322020 () (_ BitVec 64))

(declare-fun c!79967 () Bool)

(assert (=> b!727352 (= c!79967 (or (= lt!322020 (select (arr!19655 a!3186) j!159)) (= (bvadd lt!322020 lt!322020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99317 () Bool)

(declare-fun e!407178 () Bool)

(assert (=> d!99317 e!407178))

(declare-fun c!79968 () Bool)

(assert (=> d!99317 (= c!79968 (and ((_ is Intermediate!7252) lt!322019) (undefined!8064 lt!322019)))))

(assert (=> d!99317 (= lt!322019 e!407177)))

(declare-fun c!79969 () Bool)

(assert (=> d!99317 (= c!79969 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99317 (= lt!322020 (select (arr!19655 a!3186) index!1321))))

(assert (=> d!99317 (validMask!0 mask!3328)))

(assert (=> d!99317 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!322019)))

(declare-fun b!727353 () Bool)

(assert (=> b!727353 (= e!407178 (bvsge (x!62369 lt!322019) #b01111111111111111111111111111110))))

(declare-fun b!727354 () Bool)

(assert (=> b!727354 (and (bvsge (index!31378 lt!322019) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322019) (size!20076 a!3186)))))

(declare-fun res!488165 () Bool)

(assert (=> b!727354 (= res!488165 (= (select (arr!19655 a!3186) (index!31378 lt!322019)) (select (arr!19655 a!3186) j!159)))))

(assert (=> b!727354 (=> res!488165 e!407176)))

(declare-fun e!407175 () Bool)

(assert (=> b!727354 (= e!407175 e!407176)))

(declare-fun b!727355 () Bool)

(assert (=> b!727355 (= e!407178 e!407175)))

(declare-fun res!488167 () Bool)

(assert (=> b!727355 (= res!488167 (and ((_ is Intermediate!7252) lt!322019) (not (undefined!8064 lt!322019)) (bvslt (x!62369 lt!322019) #b01111111111111111111111111111110) (bvsge (x!62369 lt!322019) #b00000000000000000000000000000000) (bvsge (x!62369 lt!322019) x!1131)))))

(assert (=> b!727355 (=> (not res!488167) (not e!407175))))

(declare-fun b!727356 () Bool)

(assert (=> b!727356 (= e!407179 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19655 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727357 () Bool)

(assert (=> b!727357 (= e!407177 (Intermediate!7252 true index!1321 x!1131))))

(declare-fun b!727358 () Bool)

(assert (=> b!727358 (and (bvsge (index!31378 lt!322019) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322019) (size!20076 a!3186)))))

(declare-fun res!488166 () Bool)

(assert (=> b!727358 (= res!488166 (= (select (arr!19655 a!3186) (index!31378 lt!322019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727358 (=> res!488166 e!407176)))

(declare-fun b!727359 () Bool)

(assert (=> b!727359 (= e!407179 (Intermediate!7252 false index!1321 x!1131))))

(assert (= (and d!99317 c!79969) b!727357))

(assert (= (and d!99317 (not c!79969)) b!727352))

(assert (= (and b!727352 c!79967) b!727359))

(assert (= (and b!727352 (not c!79967)) b!727356))

(assert (= (and d!99317 c!79968) b!727353))

(assert (= (and d!99317 (not c!79968)) b!727355))

(assert (= (and b!727355 res!488167) b!727354))

(assert (= (and b!727354 (not res!488165)) b!727358))

(assert (= (and b!727358 (not res!488166)) b!727351))

(assert (=> d!99317 m!680629))

(assert (=> d!99317 m!680455))

(declare-fun m!680737 () Bool)

(assert (=> b!727354 m!680737))

(assert (=> b!727351 m!680737))

(assert (=> b!727356 m!680441))

(assert (=> b!727356 m!680441))

(assert (=> b!727356 m!680411))

(declare-fun m!680739 () Bool)

(assert (=> b!727356 m!680739))

(assert (=> b!727358 m!680737))

(assert (=> b!726956 d!99317))

(declare-fun d!99319 () Bool)

(assert (=> d!99319 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64532 d!99319))

(declare-fun d!99331 () Bool)

(assert (=> d!99331 (= (array_inv!15538 a!3186) (bvsge (size!20076 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64532 d!99331))

(declare-fun b!727396 () Bool)

(declare-fun e!407202 () Bool)

(declare-fun e!407200 () Bool)

(assert (=> b!727396 (= e!407202 e!407200)))

(declare-fun lt!322036 () (_ BitVec 64))

(assert (=> b!727396 (= lt!322036 (select (arr!19655 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!322034 () Unit!24794)

(assert (=> b!727396 (= lt!322034 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322036 #b00000000000000000000000000000000))))

(assert (=> b!727396 (arrayContainsKey!0 a!3186 lt!322036 #b00000000000000000000000000000000)))

(declare-fun lt!322035 () Unit!24794)

(assert (=> b!727396 (= lt!322035 lt!322034)))

(declare-fun res!488181 () Bool)

(assert (=> b!727396 (= res!488181 (= (seekEntryOrOpen!0 (select (arr!19655 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7252 #b00000000000000000000000000000000)))))

(assert (=> b!727396 (=> (not res!488181) (not e!407200))))

(declare-fun b!727397 () Bool)

(declare-fun e!407201 () Bool)

(assert (=> b!727397 (= e!407201 e!407202)))

(declare-fun c!79982 () Bool)

(assert (=> b!727397 (= c!79982 (validKeyInArray!0 (select (arr!19655 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34794 () Bool)

(declare-fun call!34797 () Bool)

(assert (=> bm!34794 (= call!34797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!727399 () Bool)

(assert (=> b!727399 (= e!407202 call!34797)))

(declare-fun b!727398 () Bool)

(assert (=> b!727398 (= e!407200 call!34797)))

(declare-fun d!99333 () Bool)

(declare-fun res!488180 () Bool)

(assert (=> d!99333 (=> res!488180 e!407201)))

(assert (=> d!99333 (= res!488180 (bvsge #b00000000000000000000000000000000 (size!20076 a!3186)))))

(assert (=> d!99333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!407201)))

(assert (= (and d!99333 (not res!488180)) b!727397))

(assert (= (and b!727397 c!79982) b!727396))

(assert (= (and b!727397 (not c!79982)) b!727399))

(assert (= (and b!727396 res!488181) b!727398))

(assert (= (or b!727398 b!727399) bm!34794))

(assert (=> b!727396 m!680733))

(declare-fun m!680757 () Bool)

(assert (=> b!727396 m!680757))

(declare-fun m!680759 () Bool)

(assert (=> b!727396 m!680759))

(assert (=> b!727396 m!680733))

(declare-fun m!680761 () Bool)

(assert (=> b!727396 m!680761))

(assert (=> b!727397 m!680733))

(assert (=> b!727397 m!680733))

(declare-fun m!680763 () Bool)

(assert (=> b!727397 m!680763))

(declare-fun m!680765 () Bool)

(assert (=> bm!34794 m!680765))

(assert (=> b!726945 d!99333))

(declare-fun b!727406 () Bool)

(declare-fun lt!322039 () SeekEntryResult!7252)

(assert (=> b!727406 (and (bvsge (index!31378 lt!322039) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322039) (size!20076 lt!321838)))))

(declare-fun e!407207 () Bool)

(assert (=> b!727406 (= e!407207 (= (select (arr!19655 lt!321838) (index!31378 lt!322039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727407 () Bool)

(declare-fun e!407208 () SeekEntryResult!7252)

(declare-fun e!407210 () SeekEntryResult!7252)

(assert (=> b!727407 (= e!407208 e!407210)))

(declare-fun c!79986 () Bool)

(declare-fun lt!322040 () (_ BitVec 64))

(assert (=> b!727407 (= c!79986 (or (= lt!322040 lt!321832) (= (bvadd lt!322040 lt!322040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99337 () Bool)

(declare-fun e!407209 () Bool)

(assert (=> d!99337 e!407209))

(declare-fun c!79987 () Bool)

(assert (=> d!99337 (= c!79987 (and ((_ is Intermediate!7252) lt!322039) (undefined!8064 lt!322039)))))

(assert (=> d!99337 (= lt!322039 e!407208)))

(declare-fun c!79988 () Bool)

(assert (=> d!99337 (= c!79988 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99337 (= lt!322040 (select (arr!19655 lt!321838) index!1321))))

(assert (=> d!99337 (validMask!0 mask!3328)))

(assert (=> d!99337 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321832 lt!321838 mask!3328) lt!322039)))

(declare-fun b!727408 () Bool)

(assert (=> b!727408 (= e!407209 (bvsge (x!62369 lt!322039) #b01111111111111111111111111111110))))

(declare-fun b!727409 () Bool)

(assert (=> b!727409 (and (bvsge (index!31378 lt!322039) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322039) (size!20076 lt!321838)))))

(declare-fun res!488182 () Bool)

(assert (=> b!727409 (= res!488182 (= (select (arr!19655 lt!321838) (index!31378 lt!322039)) lt!321832))))

(assert (=> b!727409 (=> res!488182 e!407207)))

(declare-fun e!407206 () Bool)

(assert (=> b!727409 (= e!407206 e!407207)))

(declare-fun b!727410 () Bool)

(assert (=> b!727410 (= e!407209 e!407206)))

(declare-fun res!488184 () Bool)

(assert (=> b!727410 (= res!488184 (and ((_ is Intermediate!7252) lt!322039) (not (undefined!8064 lt!322039)) (bvslt (x!62369 lt!322039) #b01111111111111111111111111111110) (bvsge (x!62369 lt!322039) #b00000000000000000000000000000000) (bvsge (x!62369 lt!322039) x!1131)))))

(assert (=> b!727410 (=> (not res!488184) (not e!407206))))

(declare-fun b!727411 () Bool)

(assert (=> b!727411 (= e!407210 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!321832 lt!321838 mask!3328))))

(declare-fun b!727412 () Bool)

(assert (=> b!727412 (= e!407208 (Intermediate!7252 true index!1321 x!1131))))

(declare-fun b!727413 () Bool)

(assert (=> b!727413 (and (bvsge (index!31378 lt!322039) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322039) (size!20076 lt!321838)))))

(declare-fun res!488183 () Bool)

(assert (=> b!727413 (= res!488183 (= (select (arr!19655 lt!321838) (index!31378 lt!322039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727413 (=> res!488183 e!407207)))

(declare-fun b!727414 () Bool)

(assert (=> b!727414 (= e!407210 (Intermediate!7252 false index!1321 x!1131))))

(assert (= (and d!99337 c!79988) b!727412))

(assert (= (and d!99337 (not c!79988)) b!727407))

(assert (= (and b!727407 c!79986) b!727414))

(assert (= (and b!727407 (not c!79986)) b!727411))

(assert (= (and d!99337 c!79987) b!727408))

(assert (= (and d!99337 (not c!79987)) b!727410))

(assert (= (and b!727410 res!488184) b!727409))

(assert (= (and b!727409 (not res!488182)) b!727413))

(assert (= (and b!727413 (not res!488183)) b!727406))

(declare-fun m!680773 () Bool)

(assert (=> d!99337 m!680773))

(assert (=> d!99337 m!680455))

(declare-fun m!680775 () Bool)

(assert (=> b!727409 m!680775))

(assert (=> b!727406 m!680775))

(assert (=> b!727411 m!680441))

(assert (=> b!727411 m!680441))

(declare-fun m!680777 () Bool)

(assert (=> b!727411 m!680777))

(assert (=> b!727413 m!680775))

(assert (=> b!726955 d!99337))

(declare-fun b!727424 () Bool)

(declare-fun lt!322043 () SeekEntryResult!7252)

(assert (=> b!727424 (and (bvsge (index!31378 lt!322043) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322043) (size!20076 lt!321838)))))

(declare-fun e!407217 () Bool)

(assert (=> b!727424 (= e!407217 (= (select (arr!19655 lt!321838) (index!31378 lt!322043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727425 () Bool)

(declare-fun e!407218 () SeekEntryResult!7252)

(declare-fun e!407220 () SeekEntryResult!7252)

(assert (=> b!727425 (= e!407218 e!407220)))

(declare-fun c!79992 () Bool)

(declare-fun lt!322044 () (_ BitVec 64))

(assert (=> b!727425 (= c!79992 (or (= lt!322044 lt!321832) (= (bvadd lt!322044 lt!322044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99341 () Bool)

(declare-fun e!407219 () Bool)

(assert (=> d!99341 e!407219))

(declare-fun c!79993 () Bool)

(assert (=> d!99341 (= c!79993 (and ((_ is Intermediate!7252) lt!322043) (undefined!8064 lt!322043)))))

(assert (=> d!99341 (= lt!322043 e!407218)))

(declare-fun c!79994 () Bool)

(assert (=> d!99341 (= c!79994 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99341 (= lt!322044 (select (arr!19655 lt!321838) (toIndex!0 lt!321832 mask!3328)))))

(assert (=> d!99341 (validMask!0 mask!3328)))

(assert (=> d!99341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321832 mask!3328) lt!321832 lt!321838 mask!3328) lt!322043)))

(declare-fun b!727426 () Bool)

(assert (=> b!727426 (= e!407219 (bvsge (x!62369 lt!322043) #b01111111111111111111111111111110))))

(declare-fun b!727427 () Bool)

(assert (=> b!727427 (and (bvsge (index!31378 lt!322043) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322043) (size!20076 lt!321838)))))

(declare-fun res!488188 () Bool)

(assert (=> b!727427 (= res!488188 (= (select (arr!19655 lt!321838) (index!31378 lt!322043)) lt!321832))))

(assert (=> b!727427 (=> res!488188 e!407217)))

(declare-fun e!407216 () Bool)

(assert (=> b!727427 (= e!407216 e!407217)))

(declare-fun b!727428 () Bool)

(assert (=> b!727428 (= e!407219 e!407216)))

(declare-fun res!488190 () Bool)

(assert (=> b!727428 (= res!488190 (and ((_ is Intermediate!7252) lt!322043) (not (undefined!8064 lt!322043)) (bvslt (x!62369 lt!322043) #b01111111111111111111111111111110) (bvsge (x!62369 lt!322043) #b00000000000000000000000000000000) (bvsge (x!62369 lt!322043) #b00000000000000000000000000000000)))))

(assert (=> b!727428 (=> (not res!488190) (not e!407216))))

(declare-fun b!727429 () Bool)

(assert (=> b!727429 (= e!407220 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!321832 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!321832 lt!321838 mask!3328))))

(declare-fun b!727430 () Bool)

(assert (=> b!727430 (= e!407218 (Intermediate!7252 true (toIndex!0 lt!321832 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727431 () Bool)

(assert (=> b!727431 (and (bvsge (index!31378 lt!322043) #b00000000000000000000000000000000) (bvslt (index!31378 lt!322043) (size!20076 lt!321838)))))

(declare-fun res!488189 () Bool)

(assert (=> b!727431 (= res!488189 (= (select (arr!19655 lt!321838) (index!31378 lt!322043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727431 (=> res!488189 e!407217)))

(declare-fun b!727432 () Bool)

(assert (=> b!727432 (= e!407220 (Intermediate!7252 false (toIndex!0 lt!321832 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99341 c!79994) b!727430))

(assert (= (and d!99341 (not c!79994)) b!727425))

(assert (= (and b!727425 c!79992) b!727432))

(assert (= (and b!727425 (not c!79992)) b!727429))

(assert (= (and d!99341 c!79993) b!727426))

(assert (= (and d!99341 (not c!79993)) b!727428))

(assert (= (and b!727428 res!488190) b!727427))

(assert (= (and b!727427 (not res!488188)) b!727431))

(assert (= (and b!727431 (not res!488189)) b!727424))

(assert (=> d!99341 m!680427))

(declare-fun m!680785 () Bool)

(assert (=> d!99341 m!680785))

(assert (=> d!99341 m!680455))

(declare-fun m!680787 () Bool)

(assert (=> b!727427 m!680787))

(assert (=> b!727424 m!680787))

(assert (=> b!727429 m!680427))

(declare-fun m!680789 () Bool)

(assert (=> b!727429 m!680789))

(assert (=> b!727429 m!680789))

(declare-fun m!680791 () Bool)

(assert (=> b!727429 m!680791))

(assert (=> b!727431 m!680787))

(assert (=> b!726955 d!99341))

(declare-fun d!99345 () Bool)

(declare-fun lt!322048 () (_ BitVec 32))

(declare-fun lt!322047 () (_ BitVec 32))

(assert (=> d!99345 (= lt!322048 (bvmul (bvxor lt!322047 (bvlshr lt!322047 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99345 (= lt!322047 ((_ extract 31 0) (bvand (bvxor lt!321832 (bvlshr lt!321832 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99345 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488154 (let ((h!14753 ((_ extract 31 0) (bvand (bvxor lt!321832 (bvlshr lt!321832 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62379 (bvmul (bvxor h!14753 (bvlshr h!14753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62379 (bvlshr x!62379 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488154 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488154 #b00000000000000000000000000000000))))))

(assert (=> d!99345 (= (toIndex!0 lt!321832 mask!3328) (bvand (bvxor lt!322048 (bvlshr lt!322048 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!726955 d!99345))

(declare-fun d!99347 () Bool)

(assert (=> d!99347 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!726944 d!99347))

(declare-fun b!727442 () Bool)

(declare-fun e!407228 () SeekEntryResult!7252)

(declare-fun lt!322049 () SeekEntryResult!7252)

(assert (=> b!727442 (= e!407228 (Found!7252 (index!31378 lt!322049)))))

(declare-fun b!727443 () Bool)

(declare-fun e!407227 () SeekEntryResult!7252)

(assert (=> b!727443 (= e!407227 Undefined!7252)))

(declare-fun e!407226 () SeekEntryResult!7252)

(declare-fun b!727444 () Bool)

(assert (=> b!727444 (= e!407226 (seekKeyOrZeroReturnVacant!0 (x!62369 lt!322049) (index!31378 lt!322049) (index!31378 lt!322049) k0!2102 a!3186 mask!3328))))

(declare-fun b!727445 () Bool)

(assert (=> b!727445 (= e!407226 (MissingZero!7252 (index!31378 lt!322049)))))

(declare-fun b!727446 () Bool)

(assert (=> b!727446 (= e!407227 e!407228)))

(declare-fun lt!322050 () (_ BitVec 64))

(assert (=> b!727446 (= lt!322050 (select (arr!19655 a!3186) (index!31378 lt!322049)))))

(declare-fun c!79999 () Bool)

(assert (=> b!727446 (= c!79999 (= lt!322050 k0!2102))))

(declare-fun d!99351 () Bool)

(declare-fun lt!322051 () SeekEntryResult!7252)

(assert (=> d!99351 (and (or ((_ is Undefined!7252) lt!322051) (not ((_ is Found!7252) lt!322051)) (and (bvsge (index!31377 lt!322051) #b00000000000000000000000000000000) (bvslt (index!31377 lt!322051) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!322051) ((_ is Found!7252) lt!322051) (not ((_ is MissingZero!7252) lt!322051)) (and (bvsge (index!31376 lt!322051) #b00000000000000000000000000000000) (bvslt (index!31376 lt!322051) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!322051) ((_ is Found!7252) lt!322051) ((_ is MissingZero!7252) lt!322051) (not ((_ is MissingVacant!7252) lt!322051)) (and (bvsge (index!31379 lt!322051) #b00000000000000000000000000000000) (bvslt (index!31379 lt!322051) (size!20076 a!3186)))) (or ((_ is Undefined!7252) lt!322051) (ite ((_ is Found!7252) lt!322051) (= (select (arr!19655 a!3186) (index!31377 lt!322051)) k0!2102) (ite ((_ is MissingZero!7252) lt!322051) (= (select (arr!19655 a!3186) (index!31376 lt!322051)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7252) lt!322051) (= (select (arr!19655 a!3186) (index!31379 lt!322051)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99351 (= lt!322051 e!407227)))

(declare-fun c!80000 () Bool)

(assert (=> d!99351 (= c!80000 (and ((_ is Intermediate!7252) lt!322049) (undefined!8064 lt!322049)))))

(assert (=> d!99351 (= lt!322049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99351 (validMask!0 mask!3328)))

(assert (=> d!99351 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!322051)))

(declare-fun b!727447 () Bool)

(declare-fun c!79998 () Bool)

(assert (=> b!727447 (= c!79998 (= lt!322050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727447 (= e!407228 e!407226)))

(assert (= (and d!99351 c!80000) b!727443))

(assert (= (and d!99351 (not c!80000)) b!727446))

(assert (= (and b!727446 c!79999) b!727442))

(assert (= (and b!727446 (not c!79999)) b!727447))

(assert (= (and b!727447 c!79998) b!727445))

(assert (= (and b!727447 (not c!79998)) b!727444))

(declare-fun m!680801 () Bool)

(assert (=> b!727444 m!680801))

(declare-fun m!680803 () Bool)

(assert (=> b!727446 m!680803))

(declare-fun m!680805 () Bool)

(assert (=> d!99351 m!680805))

(assert (=> d!99351 m!680805))

(declare-fun m!680807 () Bool)

(assert (=> d!99351 m!680807))

(declare-fun m!680809 () Bool)

(assert (=> d!99351 m!680809))

(assert (=> d!99351 m!680455))

(declare-fun m!680811 () Bool)

(assert (=> d!99351 m!680811))

(declare-fun m!680813 () Bool)

(assert (=> d!99351 m!680813))

(assert (=> b!726954 d!99351))

(declare-fun d!99353 () Bool)

(assert (=> d!99353 (= (validKeyInArray!0 (select (arr!19655 a!3186) j!159)) (and (not (= (select (arr!19655 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19655 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!726943 d!99353))

(declare-fun b!727458 () Bool)

(declare-fun e!407238 () Bool)

(declare-fun call!34800 () Bool)

(assert (=> b!727458 (= e!407238 call!34800)))

(declare-fun b!727459 () Bool)

(declare-fun e!407239 () Bool)

(declare-fun contains!4033 (List!13696 (_ BitVec 64)) Bool)

(assert (=> b!727459 (= e!407239 (contains!4033 Nil!13693 (select (arr!19655 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34797 () Bool)

(declare-fun c!80003 () Bool)

(assert (=> bm!34797 (= call!34800 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80003 (Cons!13692 (select (arr!19655 a!3186) #b00000000000000000000000000000000) Nil!13693) Nil!13693)))))

(declare-fun b!727460 () Bool)

(assert (=> b!727460 (= e!407238 call!34800)))

(declare-fun b!727461 () Bool)

(declare-fun e!407240 () Bool)

(assert (=> b!727461 (= e!407240 e!407238)))

(assert (=> b!727461 (= c!80003 (validKeyInArray!0 (select (arr!19655 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727462 () Bool)

(declare-fun e!407237 () Bool)

(assert (=> b!727462 (= e!407237 e!407240)))

(declare-fun res!488201 () Bool)

(assert (=> b!727462 (=> (not res!488201) (not e!407240))))

(assert (=> b!727462 (= res!488201 (not e!407239))))

(declare-fun res!488202 () Bool)

(assert (=> b!727462 (=> (not res!488202) (not e!407239))))

(assert (=> b!727462 (= res!488202 (validKeyInArray!0 (select (arr!19655 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99355 () Bool)

(declare-fun res!488203 () Bool)

(assert (=> d!99355 (=> res!488203 e!407237)))

(assert (=> d!99355 (= res!488203 (bvsge #b00000000000000000000000000000000 (size!20076 a!3186)))))

(assert (=> d!99355 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13693) e!407237)))

(assert (= (and d!99355 (not res!488203)) b!727462))

(assert (= (and b!727462 res!488202) b!727459))

(assert (= (and b!727462 res!488201) b!727461))

(assert (= (and b!727461 c!80003) b!727458))

(assert (= (and b!727461 (not c!80003)) b!727460))

(assert (= (or b!727458 b!727460) bm!34797))

(assert (=> b!727459 m!680733))

(assert (=> b!727459 m!680733))

(declare-fun m!680815 () Bool)

(assert (=> b!727459 m!680815))

(assert (=> bm!34797 m!680733))

(declare-fun m!680817 () Bool)

(assert (=> bm!34797 m!680817))

(assert (=> b!727461 m!680733))

(assert (=> b!727461 m!680733))

(assert (=> b!727461 m!680763))

(assert (=> b!727462 m!680733))

(assert (=> b!727462 m!680733))

(assert (=> b!727462 m!680763))

(assert (=> b!726942 d!99355))

(check-sat (not d!99283) (not b!727459) (not b!727444) (not b!727356) (not b!727081) (not d!99351) (not b!727462) (not b!727429) (not d!99317) (not d!99271) (not b!727411) (not b!727107) (not b!727396) (not bm!34797) (not d!99279) (not bm!34783) (not b!727188) (not d!99253) (not b!727397) (not b!727200) (not bm!34794) (not d!99337) (not b!727461) (not b!727350) (not d!99267) (not d!99341) (not d!99307) (not b!727106) (not b!727309))
(check-sat)
