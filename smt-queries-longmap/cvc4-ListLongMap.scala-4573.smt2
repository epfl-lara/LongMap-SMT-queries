; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63740 () Bool)

(assert start!63740)

(declare-fun b!717354 () Bool)

(declare-fun e!402736 () Bool)

(declare-fun e!402737 () Bool)

(assert (=> b!717354 (= e!402736 e!402737)))

(declare-fun res!480143 () Bool)

(assert (=> b!717354 (=> (not res!480143) (not e!402737))))

(declare-datatypes ((SeekEntryResult!7051 0))(
  ( (MissingZero!7051 (index!30572 (_ BitVec 32))) (Found!7051 (index!30573 (_ BitVec 32))) (Intermediate!7051 (undefined!7863 Bool) (index!30574 (_ BitVec 32)) (x!61591 (_ BitVec 32))) (Undefined!7051) (MissingVacant!7051 (index!30575 (_ BitVec 32))) )
))
(declare-fun lt!319046 () SeekEntryResult!7051)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717354 (= res!480143 (or (= lt!319046 (MissingZero!7051 i!1173)) (= lt!319046 (MissingVacant!7051 i!1173))))))

(declare-datatypes ((array!40636 0))(
  ( (array!40637 (arr!19451 (Array (_ BitVec 32) (_ BitVec 64))) (size!19872 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40636)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40636 (_ BitVec 32)) SeekEntryResult!7051)

(assert (=> b!717354 (= lt!319046 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!480141 () Bool)

(assert (=> start!63740 (=> (not res!480141) (not e!402736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63740 (= res!480141 (validMask!0 mask!3328))))

(assert (=> start!63740 e!402736))

(declare-fun array_inv!15247 (array!40636) Bool)

(assert (=> start!63740 (array_inv!15247 a!3186)))

(assert (=> start!63740 true))

(declare-fun b!717355 () Bool)

(declare-fun res!480144 () Bool)

(assert (=> b!717355 (=> (not res!480144) (not e!402736))))

(declare-fun arrayContainsKey!0 (array!40636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717355 (= res!480144 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717356 () Bool)

(declare-fun res!480146 () Bool)

(assert (=> b!717356 (=> (not res!480146) (not e!402736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717356 (= res!480146 (validKeyInArray!0 k!2102))))

(declare-fun b!717357 () Bool)

(declare-fun res!480140 () Bool)

(assert (=> b!717357 (=> (not res!480140) (not e!402737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40636 (_ BitVec 32)) Bool)

(assert (=> b!717357 (= res!480140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717358 () Bool)

(declare-fun res!480145 () Bool)

(assert (=> b!717358 (=> (not res!480145) (not e!402736))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717358 (= res!480145 (validKeyInArray!0 (select (arr!19451 a!3186) j!159)))))

(declare-fun b!717359 () Bool)

(declare-fun res!480142 () Bool)

(assert (=> b!717359 (=> (not res!480142) (not e!402736))))

(assert (=> b!717359 (= res!480142 (and (= (size!19872 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19872 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19872 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717360 () Bool)

(assert (=> b!717360 (= e!402737 (and (bvsle #b00000000000000000000000000000000 (size!19872 a!3186)) (bvsge (size!19872 a!3186) #b01111111111111111111111111111111)))))

(assert (= (and start!63740 res!480141) b!717359))

(assert (= (and b!717359 res!480142) b!717358))

(assert (= (and b!717358 res!480145) b!717356))

(assert (= (and b!717356 res!480146) b!717355))

(assert (= (and b!717355 res!480144) b!717354))

(assert (= (and b!717354 res!480143) b!717357))

(assert (= (and b!717357 res!480140) b!717360))

(declare-fun m!673275 () Bool)

(assert (=> start!63740 m!673275))

(declare-fun m!673277 () Bool)

(assert (=> start!63740 m!673277))

(declare-fun m!673279 () Bool)

(assert (=> b!717358 m!673279))

(assert (=> b!717358 m!673279))

(declare-fun m!673281 () Bool)

(assert (=> b!717358 m!673281))

(declare-fun m!673283 () Bool)

(assert (=> b!717354 m!673283))

(declare-fun m!673285 () Bool)

(assert (=> b!717357 m!673285))

(declare-fun m!673287 () Bool)

(assert (=> b!717356 m!673287))

(declare-fun m!673289 () Bool)

(assert (=> b!717355 m!673289))

(push 1)

(assert (not start!63740))

(assert (not b!717358))

(assert (not b!717357))

(assert (not b!717354))

(assert (not b!717356))

(assert (not b!717355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!717379 () Bool)

(declare-fun e!402754 () Bool)

(declare-fun e!402753 () Bool)

(assert (=> b!717379 (= e!402754 e!402753)))

(declare-fun c!78976 () Bool)

(assert (=> b!717379 (= c!78976 (validKeyInArray!0 (select (arr!19451 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717380 () Bool)

(declare-fun call!34689 () Bool)

(assert (=> b!717380 (= e!402753 call!34689)))

(declare-fun b!717381 () Bool)

(declare-fun e!402752 () Bool)

(assert (=> b!717381 (= e!402752 call!34689)))

(declare-fun b!717382 () Bool)

(assert (=> b!717382 (= e!402753 e!402752)))

(declare-fun lt!319054 () (_ BitVec 64))

(assert (=> b!717382 (= lt!319054 (select (arr!19451 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24644 0))(
  ( (Unit!24645) )
))
(declare-fun lt!319055 () Unit!24644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40636 (_ BitVec 64) (_ BitVec 32)) Unit!24644)

(assert (=> b!717382 (= lt!319055 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319054 #b00000000000000000000000000000000))))

(assert (=> b!717382 (arrayContainsKey!0 a!3186 lt!319054 #b00000000000000000000000000000000)))

(declare-fun lt!319053 () Unit!24644)

(assert (=> b!717382 (= lt!319053 lt!319055)))

(declare-fun res!480160 () Bool)

(assert (=> b!717382 (= res!480160 (= (seekEntryOrOpen!0 (select (arr!19451 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7051 #b00000000000000000000000000000000)))))

(assert (=> b!717382 (=> (not res!480160) (not e!402752))))

(declare-fun d!98809 () Bool)

(declare-fun res!480159 () Bool)

(assert (=> d!98809 (=> res!480159 e!402754)))

(assert (=> d!98809 (= res!480159 (bvsge #b00000000000000000000000000000000 (size!19872 a!3186)))))

(assert (=> d!98809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402754)))

(declare-fun bm!34686 () Bool)

(assert (=> bm!34686 (= call!34689 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!98809 (not res!480159)) b!717379))

(assert (= (and b!717379 c!78976) b!717382))

(assert (= (and b!717379 (not c!78976)) b!717380))

(assert (= (and b!717382 res!480160) b!717381))

(assert (= (or b!717381 b!717380) bm!34686))

(declare-fun m!673295 () Bool)

(assert (=> b!717379 m!673295))

(assert (=> b!717379 m!673295))

(declare-fun m!673297 () Bool)

(assert (=> b!717379 m!673297))

(assert (=> b!717382 m!673295))

(declare-fun m!673299 () Bool)

(assert (=> b!717382 m!673299))

(declare-fun m!673301 () Bool)

(assert (=> b!717382 m!673301))

(assert (=> b!717382 m!673295))

(declare-fun m!673303 () Bool)

(assert (=> b!717382 m!673303))

(declare-fun m!673305 () Bool)

(assert (=> bm!34686 m!673305))

(assert (=> b!717357 d!98809))

(declare-fun d!98819 () Bool)

(assert (=> d!98819 (= (validKeyInArray!0 (select (arr!19451 a!3186) j!159)) (and (not (= (select (arr!19451 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19451 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717358 d!98819))

(declare-fun d!98821 () Bool)

(assert (=> d!98821 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717356 d!98821))

(declare-fun d!98823 () Bool)

(declare-fun res!480175 () Bool)

(declare-fun e!402772 () Bool)

(assert (=> d!98823 (=> res!480175 e!402772)))

(assert (=> d!98823 (= res!480175 (= (select (arr!19451 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98823 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!402772)))

(declare-fun b!717401 () Bool)

(declare-fun e!402773 () Bool)

(assert (=> b!717401 (= e!402772 e!402773)))

(declare-fun res!480176 () Bool)

(assert (=> b!717401 (=> (not res!480176) (not e!402773))))

(assert (=> b!717401 (= res!480176 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19872 a!3186)))))

(declare-fun b!717402 () Bool)

(assert (=> b!717402 (= e!402773 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98823 (not res!480175)) b!717401))

(assert (= (and b!717401 res!480176) b!717402))

(assert (=> d!98823 m!673295))

(declare-fun m!673321 () Bool)

(assert (=> b!717402 m!673321))

(assert (=> b!717355 d!98823))

(declare-fun lt!319088 () SeekEntryResult!7051)

(declare-fun e!402795 () SeekEntryResult!7051)

(declare-fun b!717446 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40636 (_ BitVec 32)) SeekEntryResult!7051)

(assert (=> b!717446 (= e!402795 (seekKeyOrZeroReturnVacant!0 (x!61591 lt!319088) (index!30574 lt!319088) (index!30574 lt!319088) k!2102 a!3186 mask!3328))))

