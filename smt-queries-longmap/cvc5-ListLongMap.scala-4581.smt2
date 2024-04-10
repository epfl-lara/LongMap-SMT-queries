; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63952 () Bool)

(assert start!63952)

(declare-fun b!718465 () Bool)

(declare-fun e!403327 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!319369 () (_ BitVec 32))

(assert (=> b!718465 (= e!403327 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319369 #b00000000000000000000000000000000) (bvsge lt!319369 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-datatypes ((array!40692 0))(
  ( (array!40693 (arr!19473 (Array (_ BitVec 32) (_ BitVec 64))) (size!19894 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40692)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718465 (= lt!319369 (toIndex!0 (select (arr!19473 a!3186) j!159) mask!3328))))

(declare-fun b!718466 () Bool)

(declare-fun res!480948 () Bool)

(declare-fun e!403326 () Bool)

(assert (=> b!718466 (=> (not res!480948) (not e!403326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718466 (= res!480948 (validKeyInArray!0 (select (arr!19473 a!3186) j!159)))))

(declare-fun b!718467 () Bool)

(declare-fun res!480946 () Bool)

(assert (=> b!718467 (=> (not res!480946) (not e!403326))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718467 (= res!480946 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718469 () Bool)

(declare-fun res!480951 () Bool)

(assert (=> b!718469 (=> (not res!480951) (not e!403326))))

(assert (=> b!718469 (= res!480951 (validKeyInArray!0 k!2102))))

(declare-fun b!718470 () Bool)

(declare-fun res!480953 () Bool)

(assert (=> b!718470 (=> (not res!480953) (not e!403327))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718470 (= res!480953 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19894 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19894 a!3186))))))

(declare-fun b!718471 () Bool)

(declare-fun res!480950 () Bool)

(assert (=> b!718471 (=> (not res!480950) (not e!403327))))

(declare-datatypes ((List!13475 0))(
  ( (Nil!13472) (Cons!13471 (h!14516 (_ BitVec 64)) (t!19790 List!13475)) )
))
(declare-fun arrayNoDuplicates!0 (array!40692 (_ BitVec 32) List!13475) Bool)

(assert (=> b!718471 (= res!480950 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13472))))

(declare-fun b!718472 () Bool)

(declare-fun res!480952 () Bool)

(assert (=> b!718472 (=> (not res!480952) (not e!403327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40692 (_ BitVec 32)) Bool)

(assert (=> b!718472 (= res!480952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718473 () Bool)

(declare-fun res!480949 () Bool)

(assert (=> b!718473 (=> (not res!480949) (not e!403326))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718473 (= res!480949 (and (= (size!19894 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19894 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19894 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!480945 () Bool)

(assert (=> start!63952 (=> (not res!480945) (not e!403326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63952 (= res!480945 (validMask!0 mask!3328))))

(assert (=> start!63952 e!403326))

(assert (=> start!63952 true))

(declare-fun array_inv!15269 (array!40692) Bool)

(assert (=> start!63952 (array_inv!15269 a!3186)))

(declare-fun b!718468 () Bool)

(assert (=> b!718468 (= e!403326 e!403327)))

(declare-fun res!480947 () Bool)

(assert (=> b!718468 (=> (not res!480947) (not e!403327))))

(declare-datatypes ((SeekEntryResult!7073 0))(
  ( (MissingZero!7073 (index!30660 (_ BitVec 32))) (Found!7073 (index!30661 (_ BitVec 32))) (Intermediate!7073 (undefined!7885 Bool) (index!30662 (_ BitVec 32)) (x!61677 (_ BitVec 32))) (Undefined!7073) (MissingVacant!7073 (index!30663 (_ BitVec 32))) )
))
(declare-fun lt!319370 () SeekEntryResult!7073)

(assert (=> b!718468 (= res!480947 (or (= lt!319370 (MissingZero!7073 i!1173)) (= lt!319370 (MissingVacant!7073 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40692 (_ BitVec 32)) SeekEntryResult!7073)

(assert (=> b!718468 (= lt!319370 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63952 res!480945) b!718473))

(assert (= (and b!718473 res!480949) b!718466))

(assert (= (and b!718466 res!480948) b!718469))

(assert (= (and b!718469 res!480951) b!718467))

(assert (= (and b!718467 res!480946) b!718468))

(assert (= (and b!718468 res!480947) b!718472))

(assert (= (and b!718472 res!480952) b!718471))

(assert (= (and b!718471 res!480950) b!718470))

(assert (= (and b!718470 res!480953) b!718465))

(declare-fun m!674101 () Bool)

(assert (=> b!718472 m!674101))

(declare-fun m!674103 () Bool)

(assert (=> b!718467 m!674103))

(declare-fun m!674105 () Bool)

(assert (=> b!718469 m!674105))

(declare-fun m!674107 () Bool)

(assert (=> b!718468 m!674107))

(declare-fun m!674109 () Bool)

(assert (=> b!718465 m!674109))

(assert (=> b!718465 m!674109))

(declare-fun m!674111 () Bool)

(assert (=> b!718465 m!674111))

(declare-fun m!674113 () Bool)

(assert (=> start!63952 m!674113))

(declare-fun m!674115 () Bool)

(assert (=> start!63952 m!674115))

(declare-fun m!674117 () Bool)

(assert (=> b!718471 m!674117))

(assert (=> b!718466 m!674109))

(assert (=> b!718466 m!674109))

(declare-fun m!674119 () Bool)

(assert (=> b!718466 m!674119))

(push 1)

(assert (not b!718467))

(assert (not b!718469))

(assert (not b!718472))

(assert (not b!718468))

(assert (not b!718466))

(assert (not start!63952))

(assert (not b!718471))

(assert (not b!718465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99017 () Bool)

(declare-fun lt!319413 () SeekEntryResult!7073)

(assert (=> d!99017 (and (or (is-Undefined!7073 lt!319413) (not (is-Found!7073 lt!319413)) (and (bvsge (index!30661 lt!319413) #b00000000000000000000000000000000) (bvslt (index!30661 lt!319413) (size!19894 a!3186)))) (or (is-Undefined!7073 lt!319413) (is-Found!7073 lt!319413) (not (is-MissingZero!7073 lt!319413)) (and (bvsge (index!30660 lt!319413) #b00000000000000000000000000000000) (bvslt (index!30660 lt!319413) (size!19894 a!3186)))) (or (is-Undefined!7073 lt!319413) (is-Found!7073 lt!319413) (is-MissingZero!7073 lt!319413) (not (is-MissingVacant!7073 lt!319413)) (and (bvsge (index!30663 lt!319413) #b00000000000000000000000000000000) (bvslt (index!30663 lt!319413) (size!19894 a!3186)))) (or (is-Undefined!7073 lt!319413) (ite (is-Found!7073 lt!319413) (= (select (arr!19473 a!3186) (index!30661 lt!319413)) k!2102) (ite (is-MissingZero!7073 lt!319413) (= (select (arr!19473 a!3186) (index!30660 lt!319413)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7073 lt!319413) (= (select (arr!19473 a!3186) (index!30663 lt!319413)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!403389 () SeekEntryResult!7073)

(assert (=> d!99017 (= lt!319413 e!403389)))

(declare-fun c!79150 () Bool)

(declare-fun lt!319414 () SeekEntryResult!7073)

(assert (=> d!99017 (= c!79150 (and (is-Intermediate!7073 lt!319414) (undefined!7885 lt!319414)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40692 (_ BitVec 32)) SeekEntryResult!7073)

(assert (=> d!99017 (= lt!319414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99017 (validMask!0 mask!3328)))

(assert (=> d!99017 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319413)))

(declare-fun e!403390 () SeekEntryResult!7073)

(declare-fun b!718591 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40692 (_ BitVec 32)) SeekEntryResult!7073)

(assert (=> b!718591 (= e!403390 (seekKeyOrZeroReturnVacant!0 (x!61677 lt!319414) (index!30662 lt!319414) (index!30662 lt!319414) k!2102 a!3186 mask!3328))))

(declare-fun b!718592 () Bool)

(declare-fun e!403391 () SeekEntryResult!7073)

(assert (=> b!718592 (= e!403391 (Found!7073 (index!30662 lt!319414)))))

(declare-fun b!718593 () Bool)

(assert (=> b!718593 (= e!403389 Undefined!7073)))

(declare-fun b!718594 () Bool)

(assert (=> b!718594 (= e!403389 e!403391)))

(declare-fun lt!319415 () (_ BitVec 64))

(assert (=> b!718594 (= lt!319415 (select (arr!19473 a!3186) (index!30662 lt!319414)))))

(declare-fun c!79148 () Bool)

(assert (=> b!718594 (= c!79148 (= lt!319415 k!2102))))

(declare-fun b!718595 () Bool)

(assert (=> b!718595 (= e!403390 (MissingZero!7073 (index!30662 lt!319414)))))

(declare-fun b!718596 () Bool)

(declare-fun c!79149 () Bool)

(assert (=> b!718596 (= c!79149 (= lt!319415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!718596 (= e!403391 e!403390)))

(assert (= (and d!99017 c!79150) b!718593))

(assert (= (and d!99017 (not c!79150)) b!718594))

(assert (= (and b!718594 c!79148) b!718592))

(assert (= (and b!718594 (not c!79148)) b!718596))

(assert (= (and b!718596 c!79149) b!718595))

(assert (= (and b!718596 (not c!79149)) b!718591))

(declare-fun m!674189 () Bool)

(assert (=> d!99017 m!674189))

(assert (=> d!99017 m!674113))

(declare-fun m!674191 () Bool)

(assert (=> d!99017 m!674191))

(declare-fun m!674193 () Bool)

(assert (=> d!99017 m!674193))

(declare-fun m!674195 () Bool)

(assert (=> d!99017 m!674195))

(assert (=> d!99017 m!674193))

(declare-fun m!674197 () Bool)

(assert (=> d!99017 m!674197))

(declare-fun m!674199 () Bool)

(assert (=> b!718591 m!674199))

(declare-fun m!674201 () Bool)

(assert (=> b!718594 m!674201))

(assert (=> b!718468 d!99017))

(declare-fun d!99027 () Bool)

(assert (=> d!99027 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63952 d!99027))

(declare-fun d!99035 () Bool)

(assert (=> d!99035 (= (array_inv!15269 a!3186) (bvsge (size!19894 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63952 d!99035))

(declare-fun d!99037 () Bool)

(declare-fun res!481040 () Bool)

(declare-fun e!403411 () Bool)

(assert (=> d!99037 (=> res!481040 e!403411)))

(assert (=> d!99037 (= res!481040 (= (select (arr!19473 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99037 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!403411)))

(declare-fun b!718625 () Bool)

(declare-fun e!403412 () Bool)

(assert (=> b!718625 (= e!403411 e!403412)))

(declare-fun res!481041 () Bool)

(assert (=> b!718625 (=> (not res!481041) (not e!403412))))

(assert (=> b!718625 (= res!481041 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19894 a!3186)))))

(declare-fun b!718626 () Bool)

(assert (=> b!718626 (= e!403412 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99037 (not res!481040)) b!718625))

(assert (= (and b!718625 res!481041) b!718626))

(declare-fun m!674219 () Bool)

(assert (=> d!99037 m!674219))

(declare-fun m!674221 () Bool)

(assert (=> b!718626 m!674221))

(assert (=> b!718467 d!99037))

(declare-fun b!718641 () Bool)

(declare-fun e!403422 () Bool)

(declare-fun e!403424 () Bool)

(assert (=> b!718641 (= e!403422 e!403424)))

(declare-fun c!79165 () Bool)

(assert (=> b!718641 (= c!79165 (validKeyInArray!0 (select (arr!19473 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718642 () Bool)

(declare-fun e!403423 () Bool)

(assert (=> b!718642 (= e!403424 e!403423)))

(declare-fun lt!319447 () (_ BitVec 64))

(assert (=> b!718642 (= lt!319447 (select (arr!19473 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24670 0))(
  ( (Unit!24671) )
))
(declare-fun lt!319448 () Unit!24670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40692 (_ BitVec 64) (_ BitVec 32)) Unit!24670)

(assert (=> b!718642 (= lt!319448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319447 #b00000000000000000000000000000000))))

(assert (=> b!718642 (arrayContainsKey!0 a!3186 lt!319447 #b00000000000000000000000000000000)))

(declare-fun lt!319446 () Unit!24670)

(assert (=> b!718642 (= lt!319446 lt!319448)))

(declare-fun res!481047 () Bool)

(assert (=> b!718642 (= res!481047 (= (seekEntryOrOpen!0 (select (arr!19473 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7073 #b00000000000000000000000000000000)))))

(assert (=> b!718642 (=> (not res!481047) (not e!403423))))

(declare-fun bm!34740 () Bool)

(declare-fun call!34743 () Bool)

(assert (=> bm!34740 (= call!34743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!99043 () Bool)

(declare-fun res!481048 () Bool)

(assert (=> d!99043 (=> res!481048 e!403422)))

(assert (=> d!99043 (= res!481048 (bvsge #b00000000000000000000000000000000 (size!19894 a!3186)))))

(assert (=> d!99043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403422)))

(declare-fun b!718643 () Bool)

(assert (=> b!718643 (= e!403423 call!34743)))

(declare-fun b!718644 () Bool)

(assert (=> b!718644 (= e!403424 call!34743)))

(assert (= (and d!99043 (not res!481048)) b!718641))

(assert (= (and b!718641 c!79165) b!718642))

(assert (= (and b!718641 (not c!79165)) b!718644))

(assert (= (and b!718642 res!481047) b!718643))

(assert (= (or b!718643 b!718644) bm!34740))

(assert (=> b!718641 m!674219))

(assert (=> b!718641 m!674219))

(declare-fun m!674237 () Bool)

(assert (=> b!718641 m!674237))

(assert (=> b!718642 m!674219))

(declare-fun m!674239 () Bool)

(assert (=> b!718642 m!674239))

(declare-fun m!674241 () Bool)

(assert (=> b!718642 m!674241))

(assert (=> b!718642 m!674219))

(declare-fun m!674243 () Bool)

(assert (=> b!718642 m!674243))

(declare-fun m!674245 () Bool)

(assert (=> bm!34740 m!674245))

(assert (=> b!718472 d!99043))

(declare-fun d!99051 () Bool)

(assert (=> d!99051 (= (validKeyInArray!0 (select (arr!19473 a!3186) j!159)) (and (not (= (select (arr!19473 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19473 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718466 d!99051))

(declare-fun d!99053 () Bool)

(declare-fun res!481069 () Bool)

(declare-fun e!403449 () Bool)

(assert (=> d!99053 (=> res!481069 e!403449)))

(assert (=> d!99053 (= res!481069 (bvsge #b00000000000000000000000000000000 (size!19894 a!3186)))))

(assert (=> d!99053 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13472) e!403449)))

(declare-fun bm!34745 () Bool)

(declare-fun call!34748 () Bool)

(declare-fun c!79170 () Bool)

(assert (=> bm!34745 (= call!34748 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79170 (Cons!13471 (select (arr!19473 a!3186) #b00000000000000000000000000000000) Nil!13472) Nil!13472)))))

(declare-fun b!718671 () Bool)

(declare-fun e!403447 () Bool)

(assert (=> b!718671 (= e!403449 e!403447)))

(declare-fun res!481068 () Bool)

(assert (=> b!718671 (=> (not res!481068) (not e!403447))))

(declare-fun e!403450 () Bool)

(assert (=> b!718671 (= res!481068 (not e!403450))))

(declare-fun res!481067 () Bool)

(assert (=> b!718671 (=> (not res!481067) (not e!403450))))

(assert (=> b!718671 (= res!481067 (validKeyInArray!0 (select (arr!19473 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718672 () Bool)

(declare-fun e!403448 () Bool)

(assert (=> b!718672 (= e!403448 call!34748)))

(declare-fun b!718673 () Bool)

(declare-fun contains!4038 (List!13475 (_ BitVec 64)) Bool)

(assert (=> b!718673 (= e!403450 (contains!4038 Nil!13472 (select (arr!19473 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718674 () Bool)

(assert (=> b!718674 (= e!403448 call!34748)))

(declare-fun b!718675 () Bool)

(assert (=> b!718675 (= e!403447 e!403448)))

(assert (=> b!718675 (= c!79170 (validKeyInArray!0 (select (arr!19473 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99053 (not res!481069)) b!718671))

(assert (= (and b!718671 res!481067) b!718673))

(assert (= (and b!718671 res!481068) b!718675))

(assert (= (and b!718675 c!79170) b!718672))

(assert (= (and b!718675 (not c!79170)) b!718674))

(assert (= (or b!718672 b!718674) bm!34745))

(assert (=> bm!34745 m!674219))

(declare-fun m!674249 () Bool)

(assert (=> bm!34745 m!674249))

(assert (=> b!718671 m!674219))

(assert (=> b!718671 m!674219))

(assert (=> b!718671 m!674237))

(assert (=> b!718673 m!674219))

(assert (=> b!718673 m!674219))

(declare-fun m!674251 () Bool)

(assert (=> b!718673 m!674251))

(assert (=> b!718675 m!674219))

(assert (=> b!718675 m!674219))

(assert (=> b!718675 m!674237))

(assert (=> b!718471 d!99053))

(declare-fun d!99057 () Bool)

(declare-fun lt!319454 () (_ BitVec 32))

(declare-fun lt!319453 () (_ BitVec 32))

(assert (=> d!99057 (= lt!319454 (bvmul (bvxor lt!319453 (bvlshr lt!319453 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99057 (= lt!319453 ((_ extract 31 0) (bvand (bvxor (select (arr!19473 a!3186) j!159) (bvlshr (select (arr!19473 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99057 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!481073 (let ((h!14521 ((_ extract 31 0) (bvand (bvxor (select (arr!19473 a!3186) j!159) (bvlshr (select (arr!19473 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61682 (bvmul (bvxor h!14521 (bvlshr h!14521 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61682 (bvlshr x!61682 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!481073 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!481073 #b00000000000000000000000000000000))))))

(assert (=> d!99057 (= (toIndex!0 (select (arr!19473 a!3186) j!159) mask!3328) (bvand (bvxor lt!319454 (bvlshr lt!319454 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!718465 d!99057))

(declare-fun d!99061 () Bool)

(assert (=> d!99061 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718469 d!99061))

(push 1)

(assert (not b!718671))

(assert (not d!99017))

(assert (not b!718591))

(assert (not b!718673))

(assert (not bm!34745))

(assert (not b!718626))

(assert (not b!718641))

(assert (not b!718642))

(assert (not bm!34740))

(assert (not b!718675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

