; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66428 () Bool)

(assert start!66428)

(declare-fun b!765054 () Bool)

(declare-fun e!426155 () Bool)

(declare-fun e!426154 () Bool)

(assert (=> b!765054 (= e!426155 e!426154)))

(declare-fun res!517517 () Bool)

(assert (=> b!765054 (=> (not res!517517) (not e!426154))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!340422 () (_ BitVec 64))

(declare-datatypes ((array!42211 0))(
  ( (array!42212 (arr!20209 (Array (_ BitVec 32) (_ BitVec 64))) (size!20629 (_ BitVec 32))) )
))
(declare-fun lt!340420 () array!42211)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7765 0))(
  ( (MissingZero!7765 (index!33428 (_ BitVec 32))) (Found!7765 (index!33429 (_ BitVec 32))) (Intermediate!7765 (undefined!8577 Bool) (index!33430 (_ BitVec 32)) (x!64484 (_ BitVec 32))) (Undefined!7765) (MissingVacant!7765 (index!33431 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42211 (_ BitVec 32)) SeekEntryResult!7765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765054 (= res!517517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340422 mask!3328) lt!340422 lt!340420 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340422 lt!340420 mask!3328)))))

(declare-fun a!3186 () array!42211)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!765054 (= lt!340422 (select (store (arr!20209 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765054 (= lt!340420 (array!42212 (store (arr!20209 a!3186) i!1173 k0!2102) (size!20629 a!3186)))))

(declare-fun lt!340419 () SeekEntryResult!7765)

(declare-fun e!426151 () Bool)

(declare-fun b!765055 () Bool)

(assert (=> b!765055 (= e!426151 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340419))))

(declare-fun b!765056 () Bool)

(declare-fun res!517527 () Bool)

(declare-fun e!426152 () Bool)

(assert (=> b!765056 (=> (not res!517527) (not e!426152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765056 (= res!517527 (validKeyInArray!0 k0!2102))))

(declare-fun b!765057 () Bool)

(declare-fun res!517525 () Bool)

(declare-fun e!426153 () Bool)

(assert (=> b!765057 (=> (not res!517525) (not e!426153))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765057 (= res!517525 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20629 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20629 a!3186))))))

(declare-fun b!765058 () Bool)

(declare-fun res!517529 () Bool)

(assert (=> b!765058 (=> (not res!517529) (not e!426152))))

(assert (=> b!765058 (= res!517529 (validKeyInArray!0 (select (arr!20209 a!3186) j!159)))))

(declare-fun res!517522 () Bool)

(assert (=> start!66428 (=> (not res!517522) (not e!426152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66428 (= res!517522 (validMask!0 mask!3328))))

(assert (=> start!66428 e!426152))

(assert (=> start!66428 true))

(declare-fun array_inv!16068 (array!42211) Bool)

(assert (=> start!66428 (array_inv!16068 a!3186)))

(declare-fun b!765059 () Bool)

(declare-fun res!517526 () Bool)

(assert (=> b!765059 (=> (not res!517526) (not e!426152))))

(declare-fun arrayContainsKey!0 (array!42211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765059 (= res!517526 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765060 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42211 (_ BitVec 32)) SeekEntryResult!7765)

(assert (=> b!765060 (= e!426154 (not (= (seekEntryOrOpen!0 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) (Found!7765 j!159))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42211 (_ BitVec 32)) Bool)

(assert (=> b!765060 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26335 0))(
  ( (Unit!26336) )
))
(declare-fun lt!340421 () Unit!26335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26335)

(assert (=> b!765060 (= lt!340421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765061 () Bool)

(declare-fun res!517528 () Bool)

(assert (=> b!765061 (=> (not res!517528) (not e!426153))))

(assert (=> b!765061 (= res!517528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765062 () Bool)

(assert (=> b!765062 (= e!426153 e!426155)))

(declare-fun res!517518 () Bool)

(assert (=> b!765062 (=> (not res!517518) (not e!426155))))

(assert (=> b!765062 (= res!517518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340419))))

(assert (=> b!765062 (= lt!340419 (Intermediate!7765 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765063 () Bool)

(declare-fun res!517523 () Bool)

(assert (=> b!765063 (=> (not res!517523) (not e!426153))))

(declare-datatypes ((List!14118 0))(
  ( (Nil!14115) (Cons!14114 (h!15204 (_ BitVec 64)) (t!20425 List!14118)) )
))
(declare-fun arrayNoDuplicates!0 (array!42211 (_ BitVec 32) List!14118) Bool)

(assert (=> b!765063 (= res!517523 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14115))))

(declare-fun b!765064 () Bool)

(declare-fun res!517521 () Bool)

(assert (=> b!765064 (=> (not res!517521) (not e!426152))))

(assert (=> b!765064 (= res!517521 (and (= (size!20629 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20629 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20629 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765065 () Bool)

(assert (=> b!765065 (= e!426152 e!426153)))

(declare-fun res!517524 () Bool)

(assert (=> b!765065 (=> (not res!517524) (not e!426153))))

(declare-fun lt!340418 () SeekEntryResult!7765)

(assert (=> b!765065 (= res!517524 (or (= lt!340418 (MissingZero!7765 i!1173)) (= lt!340418 (MissingVacant!7765 i!1173))))))

(assert (=> b!765065 (= lt!340418 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765066 () Bool)

(declare-fun res!517520 () Bool)

(assert (=> b!765066 (=> (not res!517520) (not e!426155))))

(assert (=> b!765066 (= res!517520 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20209 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765067 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42211 (_ BitVec 32)) SeekEntryResult!7765)

(assert (=> b!765067 (= e!426151 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) (Found!7765 j!159)))))

(declare-fun b!765068 () Bool)

(declare-fun res!517519 () Bool)

(assert (=> b!765068 (=> (not res!517519) (not e!426155))))

(assert (=> b!765068 (= res!517519 e!426151)))

(declare-fun c!84158 () Bool)

(assert (=> b!765068 (= c!84158 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66428 res!517522) b!765064))

(assert (= (and b!765064 res!517521) b!765058))

(assert (= (and b!765058 res!517529) b!765056))

(assert (= (and b!765056 res!517527) b!765059))

(assert (= (and b!765059 res!517526) b!765065))

(assert (= (and b!765065 res!517524) b!765061))

(assert (= (and b!765061 res!517528) b!765063))

(assert (= (and b!765063 res!517523) b!765057))

(assert (= (and b!765057 res!517525) b!765062))

(assert (= (and b!765062 res!517518) b!765066))

(assert (= (and b!765066 res!517520) b!765068))

(assert (= (and b!765068 c!84158) b!765055))

(assert (= (and b!765068 (not c!84158)) b!765067))

(assert (= (and b!765068 res!517519) b!765054))

(assert (= (and b!765054 res!517517) b!765060))

(declare-fun m!711805 () Bool)

(assert (=> b!765055 m!711805))

(assert (=> b!765055 m!711805))

(declare-fun m!711807 () Bool)

(assert (=> b!765055 m!711807))

(assert (=> b!765060 m!711805))

(assert (=> b!765060 m!711805))

(declare-fun m!711809 () Bool)

(assert (=> b!765060 m!711809))

(declare-fun m!711811 () Bool)

(assert (=> b!765060 m!711811))

(declare-fun m!711813 () Bool)

(assert (=> b!765060 m!711813))

(assert (=> b!765062 m!711805))

(assert (=> b!765062 m!711805))

(declare-fun m!711815 () Bool)

(assert (=> b!765062 m!711815))

(assert (=> b!765062 m!711815))

(assert (=> b!765062 m!711805))

(declare-fun m!711817 () Bool)

(assert (=> b!765062 m!711817))

(declare-fun m!711819 () Bool)

(assert (=> b!765056 m!711819))

(declare-fun m!711821 () Bool)

(assert (=> b!765059 m!711821))

(declare-fun m!711823 () Bool)

(assert (=> b!765063 m!711823))

(declare-fun m!711825 () Bool)

(assert (=> b!765066 m!711825))

(declare-fun m!711827 () Bool)

(assert (=> b!765054 m!711827))

(declare-fun m!711829 () Bool)

(assert (=> b!765054 m!711829))

(declare-fun m!711831 () Bool)

(assert (=> b!765054 m!711831))

(declare-fun m!711833 () Bool)

(assert (=> b!765054 m!711833))

(declare-fun m!711835 () Bool)

(assert (=> b!765054 m!711835))

(assert (=> b!765054 m!711827))

(declare-fun m!711837 () Bool)

(assert (=> b!765061 m!711837))

(declare-fun m!711839 () Bool)

(assert (=> b!765065 m!711839))

(assert (=> b!765067 m!711805))

(assert (=> b!765067 m!711805))

(declare-fun m!711841 () Bool)

(assert (=> b!765067 m!711841))

(declare-fun m!711843 () Bool)

(assert (=> start!66428 m!711843))

(declare-fun m!711845 () Bool)

(assert (=> start!66428 m!711845))

(assert (=> b!765058 m!711805))

(assert (=> b!765058 m!711805))

(declare-fun m!711847 () Bool)

(assert (=> b!765058 m!711847))

(check-sat (not b!765056) (not b!765063) (not start!66428) (not b!765065) (not b!765067) (not b!765059) (not b!765062) (not b!765060) (not b!765054) (not b!765061) (not b!765058) (not b!765055))
(check-sat)
(get-model)

(declare-fun d!101233 () Bool)

(assert (=> d!101233 (= (validKeyInArray!0 (select (arr!20209 a!3186) j!159)) (and (not (= (select (arr!20209 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20209 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765058 d!101233))

(declare-fun d!101235 () Bool)

(declare-fun res!517612 () Bool)

(declare-fun e!426196 () Bool)

(assert (=> d!101235 (=> res!517612 e!426196)))

(assert (=> d!101235 (= res!517612 (= (select (arr!20209 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101235 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!426196)))

(declare-fun b!765163 () Bool)

(declare-fun e!426197 () Bool)

(assert (=> b!765163 (= e!426196 e!426197)))

(declare-fun res!517613 () Bool)

(assert (=> b!765163 (=> (not res!517613) (not e!426197))))

(assert (=> b!765163 (= res!517613 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20629 a!3186)))))

(declare-fun b!765164 () Bool)

(assert (=> b!765164 (= e!426197 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101235 (not res!517612)) b!765163))

(assert (= (and b!765163 res!517613) b!765164))

(declare-fun m!711937 () Bool)

(assert (=> d!101235 m!711937))

(declare-fun m!711939 () Bool)

(assert (=> b!765164 m!711939))

(assert (=> b!765059 d!101235))

(declare-fun b!765178 () Bool)

(declare-fun e!426204 () SeekEntryResult!7765)

(declare-fun lt!340460 () SeekEntryResult!7765)

(assert (=> b!765178 (= e!426204 (MissingZero!7765 (index!33430 lt!340460)))))

(declare-fun b!765179 () Bool)

(assert (=> b!765179 (= e!426204 (seekKeyOrZeroReturnVacant!0 (x!64484 lt!340460) (index!33430 lt!340460) (index!33430 lt!340460) (select (arr!20209 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765180 () Bool)

(declare-fun e!426205 () SeekEntryResult!7765)

(assert (=> b!765180 (= e!426205 Undefined!7765)))

(declare-fun b!765181 () Bool)

(declare-fun e!426206 () SeekEntryResult!7765)

(assert (=> b!765181 (= e!426205 e!426206)))

(declare-fun lt!340461 () (_ BitVec 64))

(assert (=> b!765181 (= lt!340461 (select (arr!20209 a!3186) (index!33430 lt!340460)))))

(declare-fun c!84173 () Bool)

(assert (=> b!765181 (= c!84173 (= lt!340461 (select (arr!20209 a!3186) j!159)))))

(declare-fun b!765182 () Bool)

(assert (=> b!765182 (= e!426206 (Found!7765 (index!33430 lt!340460)))))

(declare-fun d!101237 () Bool)

(declare-fun lt!340459 () SeekEntryResult!7765)

(get-info :version)

(assert (=> d!101237 (and (or ((_ is Undefined!7765) lt!340459) (not ((_ is Found!7765) lt!340459)) (and (bvsge (index!33429 lt!340459) #b00000000000000000000000000000000) (bvslt (index!33429 lt!340459) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340459) ((_ is Found!7765) lt!340459) (not ((_ is MissingZero!7765) lt!340459)) (and (bvsge (index!33428 lt!340459) #b00000000000000000000000000000000) (bvslt (index!33428 lt!340459) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340459) ((_ is Found!7765) lt!340459) ((_ is MissingZero!7765) lt!340459) (not ((_ is MissingVacant!7765) lt!340459)) (and (bvsge (index!33431 lt!340459) #b00000000000000000000000000000000) (bvslt (index!33431 lt!340459) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340459) (ite ((_ is Found!7765) lt!340459) (= (select (arr!20209 a!3186) (index!33429 lt!340459)) (select (arr!20209 a!3186) j!159)) (ite ((_ is MissingZero!7765) lt!340459) (= (select (arr!20209 a!3186) (index!33428 lt!340459)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7765) lt!340459) (= (select (arr!20209 a!3186) (index!33431 lt!340459)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101237 (= lt!340459 e!426205)))

(declare-fun c!84171 () Bool)

(assert (=> d!101237 (= c!84171 (and ((_ is Intermediate!7765) lt!340460) (undefined!8577 lt!340460)))))

(assert (=> d!101237 (= lt!340460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) (select (arr!20209 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101237 (validMask!0 mask!3328)))

(assert (=> d!101237 (= (seekEntryOrOpen!0 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340459)))

(declare-fun b!765177 () Bool)

(declare-fun c!84172 () Bool)

(assert (=> b!765177 (= c!84172 (= lt!340461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765177 (= e!426206 e!426204)))

(assert (= (and d!101237 c!84171) b!765180))

(assert (= (and d!101237 (not c!84171)) b!765181))

(assert (= (and b!765181 c!84173) b!765182))

(assert (= (and b!765181 (not c!84173)) b!765177))

(assert (= (and b!765177 c!84172) b!765178))

(assert (= (and b!765177 (not c!84172)) b!765179))

(assert (=> b!765179 m!711805))

(declare-fun m!711941 () Bool)

(assert (=> b!765179 m!711941))

(declare-fun m!711943 () Bool)

(assert (=> b!765181 m!711943))

(assert (=> d!101237 m!711843))

(declare-fun m!711945 () Bool)

(assert (=> d!101237 m!711945))

(declare-fun m!711947 () Bool)

(assert (=> d!101237 m!711947))

(declare-fun m!711949 () Bool)

(assert (=> d!101237 m!711949))

(assert (=> d!101237 m!711815))

(assert (=> d!101237 m!711805))

(assert (=> d!101237 m!711817))

(assert (=> d!101237 m!711805))

(assert (=> d!101237 m!711815))

(assert (=> b!765060 d!101237))

(declare-fun d!101239 () Bool)

(declare-fun res!517619 () Bool)

(declare-fun e!426215 () Bool)

(assert (=> d!101239 (=> res!517619 e!426215)))

(assert (=> d!101239 (= res!517619 (bvsge j!159 (size!20629 a!3186)))))

(assert (=> d!101239 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!426215)))

(declare-fun b!765191 () Bool)

(declare-fun e!426213 () Bool)

(declare-fun call!35031 () Bool)

(assert (=> b!765191 (= e!426213 call!35031)))

(declare-fun b!765192 () Bool)

(declare-fun e!426214 () Bool)

(assert (=> b!765192 (= e!426213 e!426214)))

(declare-fun lt!340469 () (_ BitVec 64))

(assert (=> b!765192 (= lt!340469 (select (arr!20209 a!3186) j!159))))

(declare-fun lt!340470 () Unit!26335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42211 (_ BitVec 64) (_ BitVec 32)) Unit!26335)

(assert (=> b!765192 (= lt!340470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340469 j!159))))

(assert (=> b!765192 (arrayContainsKey!0 a!3186 lt!340469 #b00000000000000000000000000000000)))

(declare-fun lt!340468 () Unit!26335)

(assert (=> b!765192 (= lt!340468 lt!340470)))

(declare-fun res!517618 () Bool)

(assert (=> b!765192 (= res!517618 (= (seekEntryOrOpen!0 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) (Found!7765 j!159)))))

(assert (=> b!765192 (=> (not res!517618) (not e!426214))))

(declare-fun b!765193 () Bool)

(assert (=> b!765193 (= e!426214 call!35031)))

(declare-fun bm!35028 () Bool)

(assert (=> bm!35028 (= call!35031 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!765194 () Bool)

(assert (=> b!765194 (= e!426215 e!426213)))

(declare-fun c!84176 () Bool)

(assert (=> b!765194 (= c!84176 (validKeyInArray!0 (select (arr!20209 a!3186) j!159)))))

(assert (= (and d!101239 (not res!517619)) b!765194))

(assert (= (and b!765194 c!84176) b!765192))

(assert (= (and b!765194 (not c!84176)) b!765191))

(assert (= (and b!765192 res!517618) b!765193))

(assert (= (or b!765193 b!765191) bm!35028))

(assert (=> b!765192 m!711805))

(declare-fun m!711951 () Bool)

(assert (=> b!765192 m!711951))

(declare-fun m!711953 () Bool)

(assert (=> b!765192 m!711953))

(assert (=> b!765192 m!711805))

(assert (=> b!765192 m!711809))

(declare-fun m!711955 () Bool)

(assert (=> bm!35028 m!711955))

(assert (=> b!765194 m!711805))

(assert (=> b!765194 m!711805))

(assert (=> b!765194 m!711847))

(assert (=> b!765060 d!101239))

(declare-fun d!101243 () Bool)

(assert (=> d!101243 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340473 () Unit!26335)

(declare-fun choose!38 (array!42211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26335)

(assert (=> d!101243 (= lt!340473 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101243 (validMask!0 mask!3328)))

(assert (=> d!101243 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340473)))

(declare-fun bs!21492 () Bool)

(assert (= bs!21492 d!101243))

(assert (=> bs!21492 m!711811))

(declare-fun m!711957 () Bool)

(assert (=> bs!21492 m!711957))

(assert (=> bs!21492 m!711843))

(assert (=> b!765060 d!101243))

(declare-fun d!101251 () Bool)

(declare-fun res!517621 () Bool)

(declare-fun e!426218 () Bool)

(assert (=> d!101251 (=> res!517621 e!426218)))

(assert (=> d!101251 (= res!517621 (bvsge #b00000000000000000000000000000000 (size!20629 a!3186)))))

(assert (=> d!101251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!426218)))

(declare-fun b!765195 () Bool)

(declare-fun e!426216 () Bool)

(declare-fun call!35032 () Bool)

(assert (=> b!765195 (= e!426216 call!35032)))

(declare-fun b!765196 () Bool)

(declare-fun e!426217 () Bool)

(assert (=> b!765196 (= e!426216 e!426217)))

(declare-fun lt!340475 () (_ BitVec 64))

(assert (=> b!765196 (= lt!340475 (select (arr!20209 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!340476 () Unit!26335)

(assert (=> b!765196 (= lt!340476 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340475 #b00000000000000000000000000000000))))

(assert (=> b!765196 (arrayContainsKey!0 a!3186 lt!340475 #b00000000000000000000000000000000)))

(declare-fun lt!340474 () Unit!26335)

(assert (=> b!765196 (= lt!340474 lt!340476)))

(declare-fun res!517620 () Bool)

(assert (=> b!765196 (= res!517620 (= (seekEntryOrOpen!0 (select (arr!20209 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7765 #b00000000000000000000000000000000)))))

(assert (=> b!765196 (=> (not res!517620) (not e!426217))))

(declare-fun b!765197 () Bool)

(assert (=> b!765197 (= e!426217 call!35032)))

(declare-fun bm!35029 () Bool)

(assert (=> bm!35029 (= call!35032 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!765198 () Bool)

(assert (=> b!765198 (= e!426218 e!426216)))

(declare-fun c!84177 () Bool)

(assert (=> b!765198 (= c!84177 (validKeyInArray!0 (select (arr!20209 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101251 (not res!517621)) b!765198))

(assert (= (and b!765198 c!84177) b!765196))

(assert (= (and b!765198 (not c!84177)) b!765195))

(assert (= (and b!765196 res!517620) b!765197))

(assert (= (or b!765197 b!765195) bm!35029))

(assert (=> b!765196 m!711937))

(declare-fun m!711959 () Bool)

(assert (=> b!765196 m!711959))

(declare-fun m!711961 () Bool)

(assert (=> b!765196 m!711961))

(assert (=> b!765196 m!711937))

(declare-fun m!711963 () Bool)

(assert (=> b!765196 m!711963))

(declare-fun m!711965 () Bool)

(assert (=> bm!35029 m!711965))

(assert (=> b!765198 m!711937))

(assert (=> b!765198 m!711937))

(declare-fun m!711967 () Bool)

(assert (=> b!765198 m!711967))

(assert (=> b!765061 d!101251))

(declare-fun b!765271 () Bool)

(declare-fun e!426259 () Bool)

(declare-fun e!426261 () Bool)

(assert (=> b!765271 (= e!426259 e!426261)))

(declare-fun res!517643 () Bool)

(declare-fun lt!340505 () SeekEntryResult!7765)

(assert (=> b!765271 (= res!517643 (and ((_ is Intermediate!7765) lt!340505) (not (undefined!8577 lt!340505)) (bvslt (x!64484 lt!340505) #b01111111111111111111111111111110) (bvsge (x!64484 lt!340505) #b00000000000000000000000000000000) (bvsge (x!64484 lt!340505) #b00000000000000000000000000000000)))))

(assert (=> b!765271 (=> (not res!517643) (not e!426261))))

(declare-fun b!765272 () Bool)

(declare-fun e!426262 () SeekEntryResult!7765)

(declare-fun e!426258 () SeekEntryResult!7765)

(assert (=> b!765272 (= e!426262 e!426258)))

(declare-fun lt!340504 () (_ BitVec 64))

(declare-fun c!84205 () Bool)

(assert (=> b!765272 (= c!84205 (or (= lt!340504 (select (arr!20209 a!3186) j!159)) (= (bvadd lt!340504 lt!340504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765273 () Bool)

(assert (=> b!765273 (= e!426262 (Intermediate!7765 true (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101253 () Bool)

(assert (=> d!101253 e!426259))

(declare-fun c!84207 () Bool)

(assert (=> d!101253 (= c!84207 (and ((_ is Intermediate!7765) lt!340505) (undefined!8577 lt!340505)))))

(assert (=> d!101253 (= lt!340505 e!426262)))

(declare-fun c!84206 () Bool)

(assert (=> d!101253 (= c!84206 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101253 (= lt!340504 (select (arr!20209 a!3186) (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328)))))

(assert (=> d!101253 (validMask!0 mask!3328)))

(assert (=> d!101253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340505)))

(declare-fun b!765274 () Bool)

(assert (=> b!765274 (= e!426259 (bvsge (x!64484 lt!340505) #b01111111111111111111111111111110))))

(declare-fun b!765275 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765275 (= e!426258 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20209 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765276 () Bool)

(assert (=> b!765276 (and (bvsge (index!33430 lt!340505) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340505) (size!20629 a!3186)))))

(declare-fun res!517641 () Bool)

(assert (=> b!765276 (= res!517641 (= (select (arr!20209 a!3186) (index!33430 lt!340505)) (select (arr!20209 a!3186) j!159)))))

(declare-fun e!426260 () Bool)

(assert (=> b!765276 (=> res!517641 e!426260)))

(assert (=> b!765276 (= e!426261 e!426260)))

(declare-fun b!765277 () Bool)

(assert (=> b!765277 (and (bvsge (index!33430 lt!340505) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340505) (size!20629 a!3186)))))

(declare-fun res!517642 () Bool)

(assert (=> b!765277 (= res!517642 (= (select (arr!20209 a!3186) (index!33430 lt!340505)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765277 (=> res!517642 e!426260)))

(declare-fun b!765278 () Bool)

(assert (=> b!765278 (and (bvsge (index!33430 lt!340505) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340505) (size!20629 a!3186)))))

(assert (=> b!765278 (= e!426260 (= (select (arr!20209 a!3186) (index!33430 lt!340505)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765279 () Bool)

(assert (=> b!765279 (= e!426258 (Intermediate!7765 false (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101253 c!84206) b!765273))

(assert (= (and d!101253 (not c!84206)) b!765272))

(assert (= (and b!765272 c!84205) b!765279))

(assert (= (and b!765272 (not c!84205)) b!765275))

(assert (= (and d!101253 c!84207) b!765274))

(assert (= (and d!101253 (not c!84207)) b!765271))

(assert (= (and b!765271 res!517643) b!765276))

(assert (= (and b!765276 (not res!517641)) b!765277))

(assert (= (and b!765277 (not res!517642)) b!765278))

(declare-fun m!711999 () Bool)

(assert (=> b!765276 m!711999))

(assert (=> b!765275 m!711815))

(declare-fun m!712001 () Bool)

(assert (=> b!765275 m!712001))

(assert (=> b!765275 m!712001))

(assert (=> b!765275 m!711805))

(declare-fun m!712003 () Bool)

(assert (=> b!765275 m!712003))

(assert (=> b!765277 m!711999))

(assert (=> d!101253 m!711815))

(declare-fun m!712005 () Bool)

(assert (=> d!101253 m!712005))

(assert (=> d!101253 m!711843))

(assert (=> b!765278 m!711999))

(assert (=> b!765062 d!101253))

(declare-fun d!101263 () Bool)

(declare-fun lt!340517 () (_ BitVec 32))

(declare-fun lt!340516 () (_ BitVec 32))

(assert (=> d!101263 (= lt!340517 (bvmul (bvxor lt!340516 (bvlshr lt!340516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101263 (= lt!340516 ((_ extract 31 0) (bvand (bvxor (select (arr!20209 a!3186) j!159) (bvlshr (select (arr!20209 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101263 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517644 (let ((h!15208 ((_ extract 31 0) (bvand (bvxor (select (arr!20209 a!3186) j!159) (bvlshr (select (arr!20209 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64490 (bvmul (bvxor h!15208 (bvlshr h!15208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64490 (bvlshr x!64490 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517644 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517644 #b00000000000000000000000000000000))))))

(assert (=> d!101263 (= (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) (bvand (bvxor lt!340517 (bvlshr lt!340517 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765062 d!101263))

(declare-fun b!765332 () Bool)

(declare-fun e!426294 () Bool)

(declare-fun contains!4055 (List!14118 (_ BitVec 64)) Bool)

(assert (=> b!765332 (= e!426294 (contains!4055 Nil!14115 (select (arr!20209 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101267 () Bool)

(declare-fun res!517651 () Bool)

(declare-fun e!426292 () Bool)

(assert (=> d!101267 (=> res!517651 e!426292)))

(assert (=> d!101267 (= res!517651 (bvsge #b00000000000000000000000000000000 (size!20629 a!3186)))))

(assert (=> d!101267 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14115) e!426292)))

(declare-fun b!765333 () Bool)

(declare-fun e!426293 () Bool)

(assert (=> b!765333 (= e!426292 e!426293)))

(declare-fun res!517653 () Bool)

(assert (=> b!765333 (=> (not res!517653) (not e!426293))))

(assert (=> b!765333 (= res!517653 (not e!426294))))

(declare-fun res!517652 () Bool)

(assert (=> b!765333 (=> (not res!517652) (not e!426294))))

(assert (=> b!765333 (= res!517652 (validKeyInArray!0 (select (arr!20209 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!765334 () Bool)

(declare-fun e!426295 () Bool)

(declare-fun call!35035 () Bool)

(assert (=> b!765334 (= e!426295 call!35035)))

(declare-fun bm!35032 () Bool)

(declare-fun c!84231 () Bool)

(assert (=> bm!35032 (= call!35035 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84231 (Cons!14114 (select (arr!20209 a!3186) #b00000000000000000000000000000000) Nil!14115) Nil!14115)))))

(declare-fun b!765335 () Bool)

(assert (=> b!765335 (= e!426295 call!35035)))

(declare-fun b!765336 () Bool)

(assert (=> b!765336 (= e!426293 e!426295)))

(assert (=> b!765336 (= c!84231 (validKeyInArray!0 (select (arr!20209 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101267 (not res!517651)) b!765333))

(assert (= (and b!765333 res!517652) b!765332))

(assert (= (and b!765333 res!517653) b!765336))

(assert (= (and b!765336 c!84231) b!765334))

(assert (= (and b!765336 (not c!84231)) b!765335))

(assert (= (or b!765334 b!765335) bm!35032))

(assert (=> b!765332 m!711937))

(assert (=> b!765332 m!711937))

(declare-fun m!712033 () Bool)

(assert (=> b!765332 m!712033))

(assert (=> b!765333 m!711937))

(assert (=> b!765333 m!711937))

(assert (=> b!765333 m!711967))

(assert (=> bm!35032 m!711937))

(declare-fun m!712035 () Bool)

(assert (=> bm!35032 m!712035))

(assert (=> b!765336 m!711937))

(assert (=> b!765336 m!711937))

(assert (=> b!765336 m!711967))

(assert (=> b!765063 d!101267))

(declare-fun b!765337 () Bool)

(declare-fun e!426297 () Bool)

(declare-fun e!426299 () Bool)

(assert (=> b!765337 (= e!426297 e!426299)))

(declare-fun res!517656 () Bool)

(declare-fun lt!340528 () SeekEntryResult!7765)

(assert (=> b!765337 (= res!517656 (and ((_ is Intermediate!7765) lt!340528) (not (undefined!8577 lt!340528)) (bvslt (x!64484 lt!340528) #b01111111111111111111111111111110) (bvsge (x!64484 lt!340528) #b00000000000000000000000000000000) (bvsge (x!64484 lt!340528) #b00000000000000000000000000000000)))))

(assert (=> b!765337 (=> (not res!517656) (not e!426299))))

(declare-fun b!765338 () Bool)

(declare-fun e!426300 () SeekEntryResult!7765)

(declare-fun e!426296 () SeekEntryResult!7765)

(assert (=> b!765338 (= e!426300 e!426296)))

(declare-fun c!84232 () Bool)

(declare-fun lt!340527 () (_ BitVec 64))

(assert (=> b!765338 (= c!84232 (or (= lt!340527 lt!340422) (= (bvadd lt!340527 lt!340527) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765339 () Bool)

(assert (=> b!765339 (= e!426300 (Intermediate!7765 true (toIndex!0 lt!340422 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101277 () Bool)

(assert (=> d!101277 e!426297))

(declare-fun c!84234 () Bool)

(assert (=> d!101277 (= c!84234 (and ((_ is Intermediate!7765) lt!340528) (undefined!8577 lt!340528)))))

(assert (=> d!101277 (= lt!340528 e!426300)))

(declare-fun c!84233 () Bool)

(assert (=> d!101277 (= c!84233 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101277 (= lt!340527 (select (arr!20209 lt!340420) (toIndex!0 lt!340422 mask!3328)))))

(assert (=> d!101277 (validMask!0 mask!3328)))

(assert (=> d!101277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340422 mask!3328) lt!340422 lt!340420 mask!3328) lt!340528)))

(declare-fun b!765340 () Bool)

(assert (=> b!765340 (= e!426297 (bvsge (x!64484 lt!340528) #b01111111111111111111111111111110))))

(declare-fun b!765341 () Bool)

(assert (=> b!765341 (= e!426296 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340422 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!340422 lt!340420 mask!3328))))

(declare-fun b!765342 () Bool)

(assert (=> b!765342 (and (bvsge (index!33430 lt!340528) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340528) (size!20629 lt!340420)))))

(declare-fun res!517654 () Bool)

(assert (=> b!765342 (= res!517654 (= (select (arr!20209 lt!340420) (index!33430 lt!340528)) lt!340422))))

(declare-fun e!426298 () Bool)

(assert (=> b!765342 (=> res!517654 e!426298)))

(assert (=> b!765342 (= e!426299 e!426298)))

(declare-fun b!765343 () Bool)

(assert (=> b!765343 (and (bvsge (index!33430 lt!340528) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340528) (size!20629 lt!340420)))))

(declare-fun res!517655 () Bool)

(assert (=> b!765343 (= res!517655 (= (select (arr!20209 lt!340420) (index!33430 lt!340528)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765343 (=> res!517655 e!426298)))

(declare-fun b!765344 () Bool)

(assert (=> b!765344 (and (bvsge (index!33430 lt!340528) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340528) (size!20629 lt!340420)))))

(assert (=> b!765344 (= e!426298 (= (select (arr!20209 lt!340420) (index!33430 lt!340528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765345 () Bool)

(assert (=> b!765345 (= e!426296 (Intermediate!7765 false (toIndex!0 lt!340422 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101277 c!84233) b!765339))

(assert (= (and d!101277 (not c!84233)) b!765338))

(assert (= (and b!765338 c!84232) b!765345))

(assert (= (and b!765338 (not c!84232)) b!765341))

(assert (= (and d!101277 c!84234) b!765340))

(assert (= (and d!101277 (not c!84234)) b!765337))

(assert (= (and b!765337 res!517656) b!765342))

(assert (= (and b!765342 (not res!517654)) b!765343))

(assert (= (and b!765343 (not res!517655)) b!765344))

(declare-fun m!712037 () Bool)

(assert (=> b!765342 m!712037))

(assert (=> b!765341 m!711827))

(declare-fun m!712039 () Bool)

(assert (=> b!765341 m!712039))

(assert (=> b!765341 m!712039))

(declare-fun m!712041 () Bool)

(assert (=> b!765341 m!712041))

(assert (=> b!765343 m!712037))

(assert (=> d!101277 m!711827))

(declare-fun m!712043 () Bool)

(assert (=> d!101277 m!712043))

(assert (=> d!101277 m!711843))

(assert (=> b!765344 m!712037))

(assert (=> b!765054 d!101277))

(declare-fun d!101279 () Bool)

(declare-fun lt!340530 () (_ BitVec 32))

(declare-fun lt!340529 () (_ BitVec 32))

(assert (=> d!101279 (= lt!340530 (bvmul (bvxor lt!340529 (bvlshr lt!340529 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101279 (= lt!340529 ((_ extract 31 0) (bvand (bvxor lt!340422 (bvlshr lt!340422 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101279 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517644 (let ((h!15208 ((_ extract 31 0) (bvand (bvxor lt!340422 (bvlshr lt!340422 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64490 (bvmul (bvxor h!15208 (bvlshr h!15208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64490 (bvlshr x!64490 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517644 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517644 #b00000000000000000000000000000000))))))

(assert (=> d!101279 (= (toIndex!0 lt!340422 mask!3328) (bvand (bvxor lt!340530 (bvlshr lt!340530 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765054 d!101279))

(declare-fun b!765356 () Bool)

(declare-fun e!426310 () Bool)

(declare-fun e!426312 () Bool)

(assert (=> b!765356 (= e!426310 e!426312)))

(declare-fun res!517665 () Bool)

(declare-fun lt!340532 () SeekEntryResult!7765)

(assert (=> b!765356 (= res!517665 (and ((_ is Intermediate!7765) lt!340532) (not (undefined!8577 lt!340532)) (bvslt (x!64484 lt!340532) #b01111111111111111111111111111110) (bvsge (x!64484 lt!340532) #b00000000000000000000000000000000) (bvsge (x!64484 lt!340532) x!1131)))))

(assert (=> b!765356 (=> (not res!517665) (not e!426312))))

(declare-fun b!765357 () Bool)

(declare-fun e!426313 () SeekEntryResult!7765)

(declare-fun e!426309 () SeekEntryResult!7765)

(assert (=> b!765357 (= e!426313 e!426309)))

(declare-fun c!84237 () Bool)

(declare-fun lt!340531 () (_ BitVec 64))

(assert (=> b!765357 (= c!84237 (or (= lt!340531 lt!340422) (= (bvadd lt!340531 lt!340531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765358 () Bool)

(assert (=> b!765358 (= e!426313 (Intermediate!7765 true index!1321 x!1131))))

(declare-fun d!101281 () Bool)

(assert (=> d!101281 e!426310))

(declare-fun c!84239 () Bool)

(assert (=> d!101281 (= c!84239 (and ((_ is Intermediate!7765) lt!340532) (undefined!8577 lt!340532)))))

(assert (=> d!101281 (= lt!340532 e!426313)))

(declare-fun c!84238 () Bool)

(assert (=> d!101281 (= c!84238 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101281 (= lt!340531 (select (arr!20209 lt!340420) index!1321))))

(assert (=> d!101281 (validMask!0 mask!3328)))

(assert (=> d!101281 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340422 lt!340420 mask!3328) lt!340532)))

(declare-fun b!765359 () Bool)

(assert (=> b!765359 (= e!426310 (bvsge (x!64484 lt!340532) #b01111111111111111111111111111110))))

(declare-fun b!765360 () Bool)

(assert (=> b!765360 (= e!426309 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!340422 lt!340420 mask!3328))))

(declare-fun b!765361 () Bool)

(assert (=> b!765361 (and (bvsge (index!33430 lt!340532) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340532) (size!20629 lt!340420)))))

(declare-fun res!517663 () Bool)

(assert (=> b!765361 (= res!517663 (= (select (arr!20209 lt!340420) (index!33430 lt!340532)) lt!340422))))

(declare-fun e!426311 () Bool)

(assert (=> b!765361 (=> res!517663 e!426311)))

(assert (=> b!765361 (= e!426312 e!426311)))

(declare-fun b!765362 () Bool)

(assert (=> b!765362 (and (bvsge (index!33430 lt!340532) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340532) (size!20629 lt!340420)))))

(declare-fun res!517664 () Bool)

(assert (=> b!765362 (= res!517664 (= (select (arr!20209 lt!340420) (index!33430 lt!340532)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765362 (=> res!517664 e!426311)))

(declare-fun b!765363 () Bool)

(assert (=> b!765363 (and (bvsge (index!33430 lt!340532) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340532) (size!20629 lt!340420)))))

(assert (=> b!765363 (= e!426311 (= (select (arr!20209 lt!340420) (index!33430 lt!340532)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765364 () Bool)

(assert (=> b!765364 (= e!426309 (Intermediate!7765 false index!1321 x!1131))))

(assert (= (and d!101281 c!84238) b!765358))

(assert (= (and d!101281 (not c!84238)) b!765357))

(assert (= (and b!765357 c!84237) b!765364))

(assert (= (and b!765357 (not c!84237)) b!765360))

(assert (= (and d!101281 c!84239) b!765359))

(assert (= (and d!101281 (not c!84239)) b!765356))

(assert (= (and b!765356 res!517665) b!765361))

(assert (= (and b!765361 (not res!517663)) b!765362))

(assert (= (and b!765362 (not res!517664)) b!765363))

(declare-fun m!712045 () Bool)

(assert (=> b!765361 m!712045))

(declare-fun m!712047 () Bool)

(assert (=> b!765360 m!712047))

(assert (=> b!765360 m!712047))

(declare-fun m!712049 () Bool)

(assert (=> b!765360 m!712049))

(assert (=> b!765362 m!712045))

(declare-fun m!712051 () Bool)

(assert (=> d!101281 m!712051))

(assert (=> d!101281 m!711843))

(assert (=> b!765363 m!712045))

(assert (=> b!765054 d!101281))

(declare-fun d!101283 () Bool)

(assert (=> d!101283 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66428 d!101283))

(declare-fun d!101289 () Bool)

(assert (=> d!101289 (= (array_inv!16068 a!3186) (bvsge (size!20629 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66428 d!101289))

(declare-fun b!765395 () Bool)

(declare-fun e!426333 () SeekEntryResult!7765)

(declare-fun lt!340552 () SeekEntryResult!7765)

(assert (=> b!765395 (= e!426333 (MissingZero!7765 (index!33430 lt!340552)))))

(declare-fun b!765396 () Bool)

(assert (=> b!765396 (= e!426333 (seekKeyOrZeroReturnVacant!0 (x!64484 lt!340552) (index!33430 lt!340552) (index!33430 lt!340552) k0!2102 a!3186 mask!3328))))

(declare-fun b!765397 () Bool)

(declare-fun e!426334 () SeekEntryResult!7765)

(assert (=> b!765397 (= e!426334 Undefined!7765)))

(declare-fun b!765398 () Bool)

(declare-fun e!426335 () SeekEntryResult!7765)

(assert (=> b!765398 (= e!426334 e!426335)))

(declare-fun lt!340553 () (_ BitVec 64))

(assert (=> b!765398 (= lt!340553 (select (arr!20209 a!3186) (index!33430 lt!340552)))))

(declare-fun c!84252 () Bool)

(assert (=> b!765398 (= c!84252 (= lt!340553 k0!2102))))

(declare-fun b!765399 () Bool)

(assert (=> b!765399 (= e!426335 (Found!7765 (index!33430 lt!340552)))))

(declare-fun d!101292 () Bool)

(declare-fun lt!340551 () SeekEntryResult!7765)

(assert (=> d!101292 (and (or ((_ is Undefined!7765) lt!340551) (not ((_ is Found!7765) lt!340551)) (and (bvsge (index!33429 lt!340551) #b00000000000000000000000000000000) (bvslt (index!33429 lt!340551) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340551) ((_ is Found!7765) lt!340551) (not ((_ is MissingZero!7765) lt!340551)) (and (bvsge (index!33428 lt!340551) #b00000000000000000000000000000000) (bvslt (index!33428 lt!340551) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340551) ((_ is Found!7765) lt!340551) ((_ is MissingZero!7765) lt!340551) (not ((_ is MissingVacant!7765) lt!340551)) (and (bvsge (index!33431 lt!340551) #b00000000000000000000000000000000) (bvslt (index!33431 lt!340551) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340551) (ite ((_ is Found!7765) lt!340551) (= (select (arr!20209 a!3186) (index!33429 lt!340551)) k0!2102) (ite ((_ is MissingZero!7765) lt!340551) (= (select (arr!20209 a!3186) (index!33428 lt!340551)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7765) lt!340551) (= (select (arr!20209 a!3186) (index!33431 lt!340551)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101292 (= lt!340551 e!426334)))

(declare-fun c!84250 () Bool)

(assert (=> d!101292 (= c!84250 (and ((_ is Intermediate!7765) lt!340552) (undefined!8577 lt!340552)))))

(assert (=> d!101292 (= lt!340552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101292 (validMask!0 mask!3328)))

(assert (=> d!101292 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!340551)))

(declare-fun b!765394 () Bool)

(declare-fun c!84251 () Bool)

(assert (=> b!765394 (= c!84251 (= lt!340553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765394 (= e!426335 e!426333)))

(assert (= (and d!101292 c!84250) b!765397))

(assert (= (and d!101292 (not c!84250)) b!765398))

(assert (= (and b!765398 c!84252) b!765399))

(assert (= (and b!765398 (not c!84252)) b!765394))

(assert (= (and b!765394 c!84251) b!765395))

(assert (= (and b!765394 (not c!84251)) b!765396))

(declare-fun m!712069 () Bool)

(assert (=> b!765396 m!712069))

(declare-fun m!712071 () Bool)

(assert (=> b!765398 m!712071))

(assert (=> d!101292 m!711843))

(declare-fun m!712073 () Bool)

(assert (=> d!101292 m!712073))

(declare-fun m!712075 () Bool)

(assert (=> d!101292 m!712075))

(declare-fun m!712077 () Bool)

(assert (=> d!101292 m!712077))

(declare-fun m!712079 () Bool)

(assert (=> d!101292 m!712079))

(declare-fun m!712081 () Bool)

(assert (=> d!101292 m!712081))

(assert (=> d!101292 m!712079))

(assert (=> b!765065 d!101292))

(declare-fun b!765400 () Bool)

(declare-fun e!426337 () Bool)

(declare-fun e!426339 () Bool)

(assert (=> b!765400 (= e!426337 e!426339)))

(declare-fun res!517677 () Bool)

(declare-fun lt!340555 () SeekEntryResult!7765)

(assert (=> b!765400 (= res!517677 (and ((_ is Intermediate!7765) lt!340555) (not (undefined!8577 lt!340555)) (bvslt (x!64484 lt!340555) #b01111111111111111111111111111110) (bvsge (x!64484 lt!340555) #b00000000000000000000000000000000) (bvsge (x!64484 lt!340555) x!1131)))))

(assert (=> b!765400 (=> (not res!517677) (not e!426339))))

(declare-fun b!765401 () Bool)

(declare-fun e!426340 () SeekEntryResult!7765)

(declare-fun e!426336 () SeekEntryResult!7765)

(assert (=> b!765401 (= e!426340 e!426336)))

(declare-fun lt!340554 () (_ BitVec 64))

(declare-fun c!84253 () Bool)

(assert (=> b!765401 (= c!84253 (or (= lt!340554 (select (arr!20209 a!3186) j!159)) (= (bvadd lt!340554 lt!340554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765402 () Bool)

(assert (=> b!765402 (= e!426340 (Intermediate!7765 true index!1321 x!1131))))

(declare-fun d!101295 () Bool)

(assert (=> d!101295 e!426337))

(declare-fun c!84255 () Bool)

(assert (=> d!101295 (= c!84255 (and ((_ is Intermediate!7765) lt!340555) (undefined!8577 lt!340555)))))

(assert (=> d!101295 (= lt!340555 e!426340)))

(declare-fun c!84254 () Bool)

(assert (=> d!101295 (= c!84254 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101295 (= lt!340554 (select (arr!20209 a!3186) index!1321))))

(assert (=> d!101295 (validMask!0 mask!3328)))

(assert (=> d!101295 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340555)))

(declare-fun b!765403 () Bool)

(assert (=> b!765403 (= e!426337 (bvsge (x!64484 lt!340555) #b01111111111111111111111111111110))))

(declare-fun b!765404 () Bool)

(assert (=> b!765404 (= e!426336 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20209 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765405 () Bool)

(assert (=> b!765405 (and (bvsge (index!33430 lt!340555) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340555) (size!20629 a!3186)))))

(declare-fun res!517675 () Bool)

(assert (=> b!765405 (= res!517675 (= (select (arr!20209 a!3186) (index!33430 lt!340555)) (select (arr!20209 a!3186) j!159)))))

(declare-fun e!426338 () Bool)

(assert (=> b!765405 (=> res!517675 e!426338)))

(assert (=> b!765405 (= e!426339 e!426338)))

(declare-fun b!765406 () Bool)

(assert (=> b!765406 (and (bvsge (index!33430 lt!340555) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340555) (size!20629 a!3186)))))

(declare-fun res!517676 () Bool)

(assert (=> b!765406 (= res!517676 (= (select (arr!20209 a!3186) (index!33430 lt!340555)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765406 (=> res!517676 e!426338)))

(declare-fun b!765407 () Bool)

(assert (=> b!765407 (and (bvsge (index!33430 lt!340555) #b00000000000000000000000000000000) (bvslt (index!33430 lt!340555) (size!20629 a!3186)))))

(assert (=> b!765407 (= e!426338 (= (select (arr!20209 a!3186) (index!33430 lt!340555)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765408 () Bool)

(assert (=> b!765408 (= e!426336 (Intermediate!7765 false index!1321 x!1131))))

(assert (= (and d!101295 c!84254) b!765402))

(assert (= (and d!101295 (not c!84254)) b!765401))

(assert (= (and b!765401 c!84253) b!765408))

(assert (= (and b!765401 (not c!84253)) b!765404))

(assert (= (and d!101295 c!84255) b!765403))

(assert (= (and d!101295 (not c!84255)) b!765400))

(assert (= (and b!765400 res!517677) b!765405))

(assert (= (and b!765405 (not res!517675)) b!765406))

(assert (= (and b!765406 (not res!517676)) b!765407))

(declare-fun m!712083 () Bool)

(assert (=> b!765405 m!712083))

(assert (=> b!765404 m!712047))

(assert (=> b!765404 m!712047))

(assert (=> b!765404 m!711805))

(declare-fun m!712085 () Bool)

(assert (=> b!765404 m!712085))

(assert (=> b!765406 m!712083))

(declare-fun m!712087 () Bool)

(assert (=> d!101295 m!712087))

(assert (=> d!101295 m!711843))

(assert (=> b!765407 m!712083))

(assert (=> b!765055 d!101295))

(declare-fun d!101297 () Bool)

(assert (=> d!101297 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765056 d!101297))

(declare-fun d!101299 () Bool)

(declare-fun lt!340587 () SeekEntryResult!7765)

(assert (=> d!101299 (and (or ((_ is Undefined!7765) lt!340587) (not ((_ is Found!7765) lt!340587)) (and (bvsge (index!33429 lt!340587) #b00000000000000000000000000000000) (bvslt (index!33429 lt!340587) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340587) ((_ is Found!7765) lt!340587) (not ((_ is MissingVacant!7765) lt!340587)) (not (= (index!33431 lt!340587) resIntermediateIndex!5)) (and (bvsge (index!33431 lt!340587) #b00000000000000000000000000000000) (bvslt (index!33431 lt!340587) (size!20629 a!3186)))) (or ((_ is Undefined!7765) lt!340587) (ite ((_ is Found!7765) lt!340587) (= (select (arr!20209 a!3186) (index!33429 lt!340587)) (select (arr!20209 a!3186) j!159)) (and ((_ is MissingVacant!7765) lt!340587) (= (index!33431 lt!340587) resIntermediateIndex!5) (= (select (arr!20209 a!3186) (index!33431 lt!340587)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!426381 () SeekEntryResult!7765)

(assert (=> d!101299 (= lt!340587 e!426381)))

(declare-fun c!84279 () Bool)

(assert (=> d!101299 (= c!84279 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340588 () (_ BitVec 64))

(assert (=> d!101299 (= lt!340588 (select (arr!20209 a!3186) index!1321))))

(assert (=> d!101299 (validMask!0 mask!3328)))

(assert (=> d!101299 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340587)))

(declare-fun b!765473 () Bool)

(declare-fun e!426382 () SeekEntryResult!7765)

(assert (=> b!765473 (= e!426382 (MissingVacant!7765 resIntermediateIndex!5))))

(declare-fun b!765474 () Bool)

(declare-fun e!426383 () SeekEntryResult!7765)

(assert (=> b!765474 (= e!426381 e!426383)))

(declare-fun c!84278 () Bool)

(assert (=> b!765474 (= c!84278 (= lt!340588 (select (arr!20209 a!3186) j!159)))))

(declare-fun b!765475 () Bool)

(declare-fun c!84280 () Bool)

(assert (=> b!765475 (= c!84280 (= lt!340588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765475 (= e!426383 e!426382)))

(declare-fun b!765476 () Bool)

(assert (=> b!765476 (= e!426382 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20209 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765477 () Bool)

(assert (=> b!765477 (= e!426383 (Found!7765 index!1321))))

(declare-fun b!765478 () Bool)

(assert (=> b!765478 (= e!426381 Undefined!7765)))

(assert (= (and d!101299 c!84279) b!765478))

(assert (= (and d!101299 (not c!84279)) b!765474))

(assert (= (and b!765474 c!84278) b!765477))

(assert (= (and b!765474 (not c!84278)) b!765475))

(assert (= (and b!765475 c!84280) b!765473))

(assert (= (and b!765475 (not c!84280)) b!765476))

(declare-fun m!712145 () Bool)

(assert (=> d!101299 m!712145))

(declare-fun m!712147 () Bool)

(assert (=> d!101299 m!712147))

(assert (=> d!101299 m!712087))

(assert (=> d!101299 m!711843))

(assert (=> b!765476 m!712047))

(assert (=> b!765476 m!712047))

(assert (=> b!765476 m!711805))

(declare-fun m!712149 () Bool)

(assert (=> b!765476 m!712149))

(assert (=> b!765067 d!101299))

(check-sat (not d!101237) (not b!765275) (not bm!35029) (not b!765332) (not b!765194) (not b!765198) (not b!765336) (not b!765476) (not b!765333) (not d!101243) (not b!765192) (not bm!35028) (not b!765179) (not b!765404) (not d!101277) (not d!101292) (not d!101295) (not b!765360) (not d!101281) (not d!101299) (not b!765396) (not bm!35032) (not b!765341) (not d!101253) (not b!765164) (not b!765196))
(check-sat)
