; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67276 () Bool)

(assert start!67276)

(declare-fun b!778199 () Bool)

(declare-fun res!526571 () Bool)

(declare-fun e!432948 () Bool)

(assert (=> b!778199 (=> (not res!526571) (not e!432948))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((array!42568 0))(
  ( (array!42569 (arr!20378 (Array (_ BitVec 32) (_ BitVec 64))) (size!20799 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42568)

(assert (=> b!778199 (= res!526571 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20378 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778200 () Bool)

(declare-fun res!526563 () Bool)

(declare-fun e!432949 () Bool)

(assert (=> b!778200 (=> (not res!526563) (not e!432949))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!778200 (= res!526563 (and (= (size!20799 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20799 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20799 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7978 0))(
  ( (MissingZero!7978 (index!34280 (_ BitVec 32))) (Found!7978 (index!34281 (_ BitVec 32))) (Intermediate!7978 (undefined!8790 Bool) (index!34282 (_ BitVec 32)) (x!65218 (_ BitVec 32))) (Undefined!7978) (MissingVacant!7978 (index!34283 (_ BitVec 32))) )
))
(declare-fun lt!346721 () SeekEntryResult!7978)

(declare-fun b!778201 () Bool)

(declare-fun e!432946 () Bool)

(declare-fun lt!346712 () SeekEntryResult!7978)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!778201 (= e!432946 (or (not (= lt!346721 (Found!7978 index!1321))) (= lt!346721 lt!346712)))))

(declare-fun lt!346716 () array!42568)

(declare-fun lt!346718 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42568 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!778201 (= lt!346721 (seekEntryOrOpen!0 lt!346718 lt!346716 mask!3328))))

(declare-fun b!778202 () Bool)

(declare-fun e!432947 () Bool)

(declare-fun e!432953 () Bool)

(assert (=> b!778202 (= e!432947 e!432953)))

(declare-fun res!526558 () Bool)

(assert (=> b!778202 (=> (not res!526558) (not e!432953))))

(declare-fun lt!346714 () SeekEntryResult!7978)

(assert (=> b!778202 (= res!526558 (= (seekEntryOrOpen!0 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346714))))

(assert (=> b!778202 (= lt!346714 (Found!7978 j!159))))

(declare-fun b!778203 () Bool)

(declare-fun res!526562 () Bool)

(assert (=> b!778203 (=> (not res!526562) (not e!432949))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778203 (= res!526562 (validKeyInArray!0 k!2102))))

(declare-fun b!778204 () Bool)

(declare-fun res!526555 () Bool)

(assert (=> b!778204 (=> res!526555 e!432946)))

(declare-fun lt!346715 () SeekEntryResult!7978)

(assert (=> b!778204 (= res!526555 (or (not (= (select (store (arr!20378 a!3186) i!1173 k!2102) index!1321) lt!346718)) (undefined!8790 lt!346715)))))

(declare-fun lt!346720 () SeekEntryResult!7978)

(declare-fun e!432952 () Bool)

(declare-fun b!778205 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42568 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!778205 (= e!432952 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346720))))

(declare-fun b!778206 () Bool)

(declare-fun res!526565 () Bool)

(assert (=> b!778206 (=> (not res!526565) (not e!432949))))

(assert (=> b!778206 (= res!526565 (validKeyInArray!0 (select (arr!20378 a!3186) j!159)))))

(declare-fun b!778208 () Bool)

(declare-fun res!526560 () Bool)

(assert (=> b!778208 (=> res!526560 e!432946)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42568 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!778208 (= res!526560 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346712)))))

(declare-fun b!778209 () Bool)

(assert (=> b!778209 (= e!432952 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) (Found!7978 j!159)))))

(declare-fun b!778210 () Bool)

(declare-fun e!432945 () Bool)

(assert (=> b!778210 (= e!432945 e!432948)))

(declare-fun res!526564 () Bool)

(assert (=> b!778210 (=> (not res!526564) (not e!432948))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778210 (= res!526564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346720))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778210 (= lt!346720 (Intermediate!7978 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778211 () Bool)

(declare-fun res!526559 () Bool)

(assert (=> b!778211 (=> (not res!526559) (not e!432945))))

(declare-datatypes ((List!14380 0))(
  ( (Nil!14377) (Cons!14376 (h!15487 (_ BitVec 64)) (t!20695 List!14380)) )
))
(declare-fun arrayNoDuplicates!0 (array!42568 (_ BitVec 32) List!14380) Bool)

(assert (=> b!778211 (= res!526559 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14377))))

(declare-fun b!778212 () Bool)

(declare-fun res!526569 () Bool)

(assert (=> b!778212 (=> (not res!526569) (not e!432949))))

(declare-fun arrayContainsKey!0 (array!42568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778212 (= res!526569 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778213 () Bool)

(declare-fun res!526570 () Bool)

(assert (=> b!778213 (=> (not res!526570) (not e!432945))))

(assert (=> b!778213 (= res!526570 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20799 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20799 a!3186))))))

(declare-fun b!778214 () Bool)

(declare-fun res!526554 () Bool)

(assert (=> b!778214 (=> (not res!526554) (not e!432948))))

(assert (=> b!778214 (= res!526554 e!432952)))

(declare-fun c!86224 () Bool)

(assert (=> b!778214 (= c!86224 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778215 () Bool)

(declare-fun res!526566 () Bool)

(assert (=> b!778215 (=> (not res!526566) (not e!432945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42568 (_ BitVec 32)) Bool)

(assert (=> b!778215 (= res!526566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778216 () Bool)

(assert (=> b!778216 (= e!432949 e!432945)))

(declare-fun res!526567 () Bool)

(assert (=> b!778216 (=> (not res!526567) (not e!432945))))

(declare-fun lt!346713 () SeekEntryResult!7978)

(assert (=> b!778216 (= res!526567 (or (= lt!346713 (MissingZero!7978 i!1173)) (= lt!346713 (MissingVacant!7978 i!1173))))))

(assert (=> b!778216 (= lt!346713 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!778217 () Bool)

(assert (=> b!778217 (= e!432953 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346714))))

(declare-fun b!778218 () Bool)

(declare-fun e!432950 () Bool)

(assert (=> b!778218 (= e!432948 e!432950)))

(declare-fun res!526557 () Bool)

(assert (=> b!778218 (=> (not res!526557) (not e!432950))))

(declare-fun lt!346717 () SeekEntryResult!7978)

(assert (=> b!778218 (= res!526557 (= lt!346717 lt!346715))))

(assert (=> b!778218 (= lt!346715 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346718 lt!346716 mask!3328))))

(assert (=> b!778218 (= lt!346717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346718 mask!3328) lt!346718 lt!346716 mask!3328))))

(assert (=> b!778218 (= lt!346718 (select (store (arr!20378 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778218 (= lt!346716 (array!42569 (store (arr!20378 a!3186) i!1173 k!2102) (size!20799 a!3186)))))

(declare-fun b!778207 () Bool)

(assert (=> b!778207 (= e!432950 (not e!432946))))

(declare-fun res!526568 () Bool)

(assert (=> b!778207 (=> res!526568 e!432946)))

(assert (=> b!778207 (= res!526568 (or (not (is-Intermediate!7978 lt!346715)) (bvslt x!1131 (x!65218 lt!346715)) (not (= x!1131 (x!65218 lt!346715))) (not (= index!1321 (index!34282 lt!346715)))))))

(assert (=> b!778207 (= lt!346712 (Found!7978 j!159))))

(assert (=> b!778207 e!432947))

(declare-fun res!526556 () Bool)

(assert (=> b!778207 (=> (not res!526556) (not e!432947))))

(assert (=> b!778207 (= res!526556 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26850 0))(
  ( (Unit!26851) )
))
(declare-fun lt!346719 () Unit!26850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26850)

(assert (=> b!778207 (= lt!346719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!526561 () Bool)

(assert (=> start!67276 (=> (not res!526561) (not e!432949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67276 (= res!526561 (validMask!0 mask!3328))))

(assert (=> start!67276 e!432949))

(assert (=> start!67276 true))

(declare-fun array_inv!16174 (array!42568) Bool)

(assert (=> start!67276 (array_inv!16174 a!3186)))

(assert (= (and start!67276 res!526561) b!778200))

(assert (= (and b!778200 res!526563) b!778206))

(assert (= (and b!778206 res!526565) b!778203))

(assert (= (and b!778203 res!526562) b!778212))

(assert (= (and b!778212 res!526569) b!778216))

(assert (= (and b!778216 res!526567) b!778215))

(assert (= (and b!778215 res!526566) b!778211))

(assert (= (and b!778211 res!526559) b!778213))

(assert (= (and b!778213 res!526570) b!778210))

(assert (= (and b!778210 res!526564) b!778199))

(assert (= (and b!778199 res!526571) b!778214))

(assert (= (and b!778214 c!86224) b!778205))

(assert (= (and b!778214 (not c!86224)) b!778209))

(assert (= (and b!778214 res!526554) b!778218))

(assert (= (and b!778218 res!526557) b!778207))

(assert (= (and b!778207 res!526556) b!778202))

(assert (= (and b!778202 res!526558) b!778217))

(assert (= (and b!778207 (not res!526568)) b!778208))

(assert (= (and b!778208 (not res!526560)) b!778204))

(assert (= (and b!778204 (not res!526555)) b!778201))

(declare-fun m!721941 () Bool)

(assert (=> b!778208 m!721941))

(assert (=> b!778208 m!721941))

(declare-fun m!721943 () Bool)

(assert (=> b!778208 m!721943))

(declare-fun m!721945 () Bool)

(assert (=> b!778201 m!721945))

(declare-fun m!721947 () Bool)

(assert (=> b!778203 m!721947))

(assert (=> b!778205 m!721941))

(assert (=> b!778205 m!721941))

(declare-fun m!721949 () Bool)

(assert (=> b!778205 m!721949))

(assert (=> b!778217 m!721941))

(assert (=> b!778217 m!721941))

(declare-fun m!721951 () Bool)

(assert (=> b!778217 m!721951))

(assert (=> b!778210 m!721941))

(assert (=> b!778210 m!721941))

(declare-fun m!721953 () Bool)

(assert (=> b!778210 m!721953))

(assert (=> b!778210 m!721953))

(assert (=> b!778210 m!721941))

(declare-fun m!721955 () Bool)

(assert (=> b!778210 m!721955))

(declare-fun m!721957 () Bool)

(assert (=> b!778199 m!721957))

(declare-fun m!721959 () Bool)

(assert (=> b!778207 m!721959))

(declare-fun m!721961 () Bool)

(assert (=> b!778207 m!721961))

(assert (=> b!778206 m!721941))

(assert (=> b!778206 m!721941))

(declare-fun m!721963 () Bool)

(assert (=> b!778206 m!721963))

(declare-fun m!721965 () Bool)

(assert (=> b!778204 m!721965))

(declare-fun m!721967 () Bool)

(assert (=> b!778204 m!721967))

(declare-fun m!721969 () Bool)

(assert (=> b!778211 m!721969))

(declare-fun m!721971 () Bool)

(assert (=> b!778218 m!721971))

(declare-fun m!721973 () Bool)

(assert (=> b!778218 m!721973))

(assert (=> b!778218 m!721965))

(declare-fun m!721975 () Bool)

(assert (=> b!778218 m!721975))

(assert (=> b!778218 m!721973))

(declare-fun m!721977 () Bool)

(assert (=> b!778218 m!721977))

(declare-fun m!721979 () Bool)

(assert (=> b!778216 m!721979))

(declare-fun m!721981 () Bool)

(assert (=> b!778212 m!721981))

(declare-fun m!721983 () Bool)

(assert (=> b!778215 m!721983))

(assert (=> b!778202 m!721941))

(assert (=> b!778202 m!721941))

(declare-fun m!721985 () Bool)

(assert (=> b!778202 m!721985))

(assert (=> b!778209 m!721941))

(assert (=> b!778209 m!721941))

(assert (=> b!778209 m!721943))

(declare-fun m!721987 () Bool)

(assert (=> start!67276 m!721987))

(declare-fun m!721989 () Bool)

(assert (=> start!67276 m!721989))

(push 1)

(assert (not b!778201))

(assert (not b!778211))

(assert (not b!778205))

(assert (not b!778210))

(assert (not b!778207))

(assert (not b!778215))

(assert (not b!778218))

(assert (not b!778209))

(assert (not b!778202))

(assert (not b!778203))

(assert (not b!778217))

(assert (not b!778216))

(assert (not start!67276))

(assert (not b!778206))

(assert (not b!778212))

(assert (not b!778208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102285 () Bool)

(declare-fun e!433023 () Bool)

(assert (=> d!102285 e!433023))

(declare-fun c!86275 () Bool)

(declare-fun lt!346771 () SeekEntryResult!7978)

(assert (=> d!102285 (= c!86275 (and (is-Intermediate!7978 lt!346771) (undefined!8790 lt!346771)))))

(declare-fun e!433022 () SeekEntryResult!7978)

(assert (=> d!102285 (= lt!346771 e!433022)))

(declare-fun c!86274 () Bool)

(assert (=> d!102285 (= c!86274 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346770 () (_ BitVec 64))

(assert (=> d!102285 (= lt!346770 (select (arr!20378 a!3186) index!1321))))

(assert (=> d!102285 (validMask!0 mask!3328)))

(assert (=> d!102285 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346771)))

(declare-fun b!778339 () Bool)

(assert (=> b!778339 (and (bvsge (index!34282 lt!346771) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346771) (size!20799 a!3186)))))

(declare-fun res!526599 () Bool)

(assert (=> b!778339 (= res!526599 (= (select (arr!20378 a!3186) (index!34282 lt!346771)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433020 () Bool)

(assert (=> b!778339 (=> res!526599 e!433020)))

(declare-fun b!778340 () Bool)

(declare-fun e!433021 () SeekEntryResult!7978)

(assert (=> b!778340 (= e!433021 (Intermediate!7978 false index!1321 x!1131))))

(declare-fun b!778341 () Bool)

(assert (=> b!778341 (= e!433023 (bvsge (x!65218 lt!346771) #b01111111111111111111111111111110))))

(declare-fun b!778342 () Bool)

(declare-fun e!433024 () Bool)

(assert (=> b!778342 (= e!433023 e!433024)))

(declare-fun res!526597 () Bool)

(assert (=> b!778342 (= res!526597 (and (is-Intermediate!7978 lt!346771) (not (undefined!8790 lt!346771)) (bvslt (x!65218 lt!346771) #b01111111111111111111111111111110) (bvsge (x!65218 lt!346771) #b00000000000000000000000000000000) (bvsge (x!65218 lt!346771) x!1131)))))

(assert (=> b!778342 (=> (not res!526597) (not e!433024))))

(declare-fun b!778343 () Bool)

(assert (=> b!778343 (= e!433022 (Intermediate!7978 true index!1321 x!1131))))

(declare-fun b!778344 () Bool)

(assert (=> b!778344 (and (bvsge (index!34282 lt!346771) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346771) (size!20799 a!3186)))))

(declare-fun res!526598 () Bool)

(assert (=> b!778344 (= res!526598 (= (select (arr!20378 a!3186) (index!34282 lt!346771)) (select (arr!20378 a!3186) j!159)))))

(assert (=> b!778344 (=> res!526598 e!433020)))

(assert (=> b!778344 (= e!433024 e!433020)))

(declare-fun b!778345 () Bool)

(assert (=> b!778345 (= e!433022 e!433021)))

(declare-fun c!86273 () Bool)

(assert (=> b!778345 (= c!86273 (or (= lt!346770 (select (arr!20378 a!3186) j!159)) (= (bvadd lt!346770 lt!346770) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778346 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778346 (= e!433021 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20378 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778347 () Bool)

(assert (=> b!778347 (and (bvsge (index!34282 lt!346771) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346771) (size!20799 a!3186)))))

(assert (=> b!778347 (= e!433020 (= (select (arr!20378 a!3186) (index!34282 lt!346771)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102285 c!86274) b!778343))

(assert (= (and d!102285 (not c!86274)) b!778345))

(assert (= (and b!778345 c!86273) b!778340))

(assert (= (and b!778345 (not c!86273)) b!778346))

(assert (= (and d!102285 c!86275) b!778341))

(assert (= (and d!102285 (not c!86275)) b!778342))

(assert (= (and b!778342 res!526597) b!778344))

(assert (= (and b!778344 (not res!526598)) b!778339))

(assert (= (and b!778339 (not res!526599)) b!778347))

(declare-fun m!722049 () Bool)

(assert (=> b!778344 m!722049))

(assert (=> b!778339 m!722049))

(declare-fun m!722051 () Bool)

(assert (=> d!102285 m!722051))

(assert (=> d!102285 m!721987))

(declare-fun m!722053 () Bool)

(assert (=> b!778346 m!722053))

(assert (=> b!778346 m!722053))

(assert (=> b!778346 m!721941))

(declare-fun m!722055 () Bool)

(assert (=> b!778346 m!722055))

(assert (=> b!778347 m!722049))

(assert (=> b!778205 d!102285))

(declare-fun b!778428 () Bool)

(declare-fun e!433072 () SeekEntryResult!7978)

(declare-fun lt!346807 () SeekEntryResult!7978)

(assert (=> b!778428 (= e!433072 (Found!7978 (index!34282 lt!346807)))))

(declare-fun b!778429 () Bool)

(declare-fun c!86307 () Bool)

(declare-fun lt!346806 () (_ BitVec 64))

(assert (=> b!778429 (= c!86307 (= lt!346806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433073 () SeekEntryResult!7978)

(assert (=> b!778429 (= e!433072 e!433073)))

(declare-fun d!102293 () Bool)

(declare-fun lt!346808 () SeekEntryResult!7978)

(assert (=> d!102293 (and (or (is-Undefined!7978 lt!346808) (not (is-Found!7978 lt!346808)) (and (bvsge (index!34281 lt!346808) #b00000000000000000000000000000000) (bvslt (index!34281 lt!346808) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346808) (is-Found!7978 lt!346808) (not (is-MissingZero!7978 lt!346808)) (and (bvsge (index!34280 lt!346808) #b00000000000000000000000000000000) (bvslt (index!34280 lt!346808) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346808) (is-Found!7978 lt!346808) (is-MissingZero!7978 lt!346808) (not (is-MissingVacant!7978 lt!346808)) (and (bvsge (index!34283 lt!346808) #b00000000000000000000000000000000) (bvslt (index!34283 lt!346808) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346808) (ite (is-Found!7978 lt!346808) (= (select (arr!20378 a!3186) (index!34281 lt!346808)) k!2102) (ite (is-MissingZero!7978 lt!346808) (= (select (arr!20378 a!3186) (index!34280 lt!346808)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7978 lt!346808) (= (select (arr!20378 a!3186) (index!34283 lt!346808)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433074 () SeekEntryResult!7978)

(assert (=> d!102293 (= lt!346808 e!433074)))

(declare-fun c!86306 () Bool)

(assert (=> d!102293 (= c!86306 (and (is-Intermediate!7978 lt!346807) (undefined!8790 lt!346807)))))

(assert (=> d!102293 (= lt!346807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102293 (validMask!0 mask!3328)))

(assert (=> d!102293 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!346808)))

(declare-fun b!778430 () Bool)

(assert (=> b!778430 (= e!433073 (MissingZero!7978 (index!34282 lt!346807)))))

(declare-fun b!778431 () Bool)

(assert (=> b!778431 (= e!433074 e!433072)))

(assert (=> b!778431 (= lt!346806 (select (arr!20378 a!3186) (index!34282 lt!346807)))))

(declare-fun c!86305 () Bool)

(assert (=> b!778431 (= c!86305 (= lt!346806 k!2102))))

(declare-fun b!778432 () Bool)

(assert (=> b!778432 (= e!433074 Undefined!7978)))

(declare-fun b!778433 () Bool)

(assert (=> b!778433 (= e!433073 (seekKeyOrZeroReturnVacant!0 (x!65218 lt!346807) (index!34282 lt!346807) (index!34282 lt!346807) k!2102 a!3186 mask!3328))))

(assert (= (and d!102293 c!86306) b!778432))

(assert (= (and d!102293 (not c!86306)) b!778431))

(assert (= (and b!778431 c!86305) b!778428))

(assert (= (and b!778431 (not c!86305)) b!778429))

(assert (= (and b!778429 c!86307) b!778430))

(assert (= (and b!778429 (not c!86307)) b!778433))

(declare-fun m!722103 () Bool)

(assert (=> d!102293 m!722103))

(assert (=> d!102293 m!721987))

(declare-fun m!722105 () Bool)

(assert (=> d!102293 m!722105))

(declare-fun m!722107 () Bool)

(assert (=> d!102293 m!722107))

(declare-fun m!722109 () Bool)

(assert (=> d!102293 m!722109))

(declare-fun m!722111 () Bool)

(assert (=> d!102293 m!722111))

(assert (=> d!102293 m!722109))

(declare-fun m!722113 () Bool)

(assert (=> b!778431 m!722113))

(declare-fun m!722115 () Bool)

(assert (=> b!778433 m!722115))

(assert (=> b!778216 d!102293))

(declare-fun b!778476 () Bool)

(declare-fun e!433101 () Bool)

(declare-fun call!35202 () Bool)

(assert (=> b!778476 (= e!433101 call!35202)))

(declare-fun b!778477 () Bool)

(declare-fun e!433100 () Bool)

(assert (=> b!778477 (= e!433100 e!433101)))

(declare-fun lt!346835 () (_ BitVec 64))

(assert (=> b!778477 (= lt!346835 (select (arr!20378 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346833 () Unit!26850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42568 (_ BitVec 64) (_ BitVec 32)) Unit!26850)

(assert (=> b!778477 (= lt!346833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346835 #b00000000000000000000000000000000))))

(assert (=> b!778477 (arrayContainsKey!0 a!3186 lt!346835 #b00000000000000000000000000000000)))

(declare-fun lt!346834 () Unit!26850)

(assert (=> b!778477 (= lt!346834 lt!346833)))

(declare-fun res!526636 () Bool)

(assert (=> b!778477 (= res!526636 (= (seekEntryOrOpen!0 (select (arr!20378 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7978 #b00000000000000000000000000000000)))))

(assert (=> b!778477 (=> (not res!526636) (not e!433101))))

(declare-fun bm!35199 () Bool)

(assert (=> bm!35199 (= call!35202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!778478 () Bool)

(declare-fun e!433102 () Bool)

(assert (=> b!778478 (= e!433102 e!433100)))

(declare-fun c!86323 () Bool)

(assert (=> b!778478 (= c!86323 (validKeyInArray!0 (select (arr!20378 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778479 () Bool)

(assert (=> b!778479 (= e!433100 call!35202)))

(declare-fun d!102315 () Bool)

(declare-fun res!526635 () Bool)

(assert (=> d!102315 (=> res!526635 e!433102)))

(assert (=> d!102315 (= res!526635 (bvsge #b00000000000000000000000000000000 (size!20799 a!3186)))))

(assert (=> d!102315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!433102)))

(assert (= (and d!102315 (not res!526635)) b!778478))

(assert (= (and b!778478 c!86323) b!778477))

(assert (= (and b!778478 (not c!86323)) b!778479))

(assert (= (and b!778477 res!526636) b!778476))

(assert (= (or b!778476 b!778479) bm!35199))

(declare-fun m!722139 () Bool)

(assert (=> b!778477 m!722139))

(declare-fun m!722141 () Bool)

(assert (=> b!778477 m!722141))

(declare-fun m!722143 () Bool)

(assert (=> b!778477 m!722143))

(assert (=> b!778477 m!722139))

(declare-fun m!722145 () Bool)

(assert (=> b!778477 m!722145))

(declare-fun m!722147 () Bool)

(assert (=> bm!35199 m!722147))

(assert (=> b!778478 m!722139))

(assert (=> b!778478 m!722139))

(declare-fun m!722149 () Bool)

(assert (=> b!778478 m!722149))

(assert (=> b!778215 d!102315))

(declare-fun d!102327 () Bool)

(declare-fun e!433109 () Bool)

(assert (=> d!102327 e!433109))

(declare-fun c!86327 () Bool)

(declare-fun lt!346840 () SeekEntryResult!7978)

(assert (=> d!102327 (= c!86327 (and (is-Intermediate!7978 lt!346840) (undefined!8790 lt!346840)))))

(declare-fun e!433108 () SeekEntryResult!7978)

(assert (=> d!102327 (= lt!346840 e!433108)))

(declare-fun c!86326 () Bool)

(assert (=> d!102327 (= c!86326 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346839 () (_ BitVec 64))

(assert (=> d!102327 (= lt!346839 (select (arr!20378 lt!346716) index!1321))))

(assert (=> d!102327 (validMask!0 mask!3328)))

(assert (=> d!102327 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346718 lt!346716 mask!3328) lt!346840)))

(declare-fun b!778484 () Bool)

(assert (=> b!778484 (and (bvsge (index!34282 lt!346840) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346840) (size!20799 lt!346716)))))

(declare-fun res!526641 () Bool)

(assert (=> b!778484 (= res!526641 (= (select (arr!20378 lt!346716) (index!34282 lt!346840)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433106 () Bool)

(assert (=> b!778484 (=> res!526641 e!433106)))

(declare-fun b!778485 () Bool)

(declare-fun e!433107 () SeekEntryResult!7978)

(assert (=> b!778485 (= e!433107 (Intermediate!7978 false index!1321 x!1131))))

(declare-fun b!778486 () Bool)

(assert (=> b!778486 (= e!433109 (bvsge (x!65218 lt!346840) #b01111111111111111111111111111110))))

(declare-fun b!778487 () Bool)

(declare-fun e!433110 () Bool)

(assert (=> b!778487 (= e!433109 e!433110)))

(declare-fun res!526639 () Bool)

(assert (=> b!778487 (= res!526639 (and (is-Intermediate!7978 lt!346840) (not (undefined!8790 lt!346840)) (bvslt (x!65218 lt!346840) #b01111111111111111111111111111110) (bvsge (x!65218 lt!346840) #b00000000000000000000000000000000) (bvsge (x!65218 lt!346840) x!1131)))))

(assert (=> b!778487 (=> (not res!526639) (not e!433110))))

(declare-fun b!778488 () Bool)

(assert (=> b!778488 (= e!433108 (Intermediate!7978 true index!1321 x!1131))))

(declare-fun b!778489 () Bool)

(assert (=> b!778489 (and (bvsge (index!34282 lt!346840) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346840) (size!20799 lt!346716)))))

(declare-fun res!526640 () Bool)

(assert (=> b!778489 (= res!526640 (= (select (arr!20378 lt!346716) (index!34282 lt!346840)) lt!346718))))

(assert (=> b!778489 (=> res!526640 e!433106)))

(assert (=> b!778489 (= e!433110 e!433106)))

(declare-fun b!778490 () Bool)

(assert (=> b!778490 (= e!433108 e!433107)))

(declare-fun c!86325 () Bool)

(assert (=> b!778490 (= c!86325 (or (= lt!346839 lt!346718) (= (bvadd lt!346839 lt!346839) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778491 () Bool)

(assert (=> b!778491 (= e!433107 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346718 lt!346716 mask!3328))))

(declare-fun b!778492 () Bool)

(assert (=> b!778492 (and (bvsge (index!34282 lt!346840) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346840) (size!20799 lt!346716)))))

(assert (=> b!778492 (= e!433106 (= (select (arr!20378 lt!346716) (index!34282 lt!346840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102327 c!86326) b!778488))

(assert (= (and d!102327 (not c!86326)) b!778490))

(assert (= (and b!778490 c!86325) b!778485))

(assert (= (and b!778490 (not c!86325)) b!778491))

(assert (= (and d!102327 c!86327) b!778486))

(assert (= (and d!102327 (not c!86327)) b!778487))

(assert (= (and b!778487 res!526639) b!778489))

(assert (= (and b!778489 (not res!526640)) b!778484))

(assert (= (and b!778484 (not res!526641)) b!778492))

(declare-fun m!722161 () Bool)

(assert (=> b!778489 m!722161))

(assert (=> b!778484 m!722161))

(declare-fun m!722163 () Bool)

(assert (=> d!102327 m!722163))

(assert (=> d!102327 m!721987))

(assert (=> b!778491 m!722053))

(assert (=> b!778491 m!722053))

(declare-fun m!722165 () Bool)

(assert (=> b!778491 m!722165))

(assert (=> b!778492 m!722161))

(assert (=> b!778218 d!102327))

(declare-fun d!102331 () Bool)

(declare-fun e!433114 () Bool)

(assert (=> d!102331 e!433114))

(declare-fun c!86330 () Bool)

(declare-fun lt!346842 () SeekEntryResult!7978)

(assert (=> d!102331 (= c!86330 (and (is-Intermediate!7978 lt!346842) (undefined!8790 lt!346842)))))

(declare-fun e!433113 () SeekEntryResult!7978)

(assert (=> d!102331 (= lt!346842 e!433113)))

(declare-fun c!86329 () Bool)

(assert (=> d!102331 (= c!86329 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346841 () (_ BitVec 64))

(assert (=> d!102331 (= lt!346841 (select (arr!20378 lt!346716) (toIndex!0 lt!346718 mask!3328)))))

(assert (=> d!102331 (validMask!0 mask!3328)))

(assert (=> d!102331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346718 mask!3328) lt!346718 lt!346716 mask!3328) lt!346842)))

(declare-fun b!778493 () Bool)

(assert (=> b!778493 (and (bvsge (index!34282 lt!346842) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346842) (size!20799 lt!346716)))))

(declare-fun res!526644 () Bool)

(assert (=> b!778493 (= res!526644 (= (select (arr!20378 lt!346716) (index!34282 lt!346842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433111 () Bool)

(assert (=> b!778493 (=> res!526644 e!433111)))

(declare-fun b!778494 () Bool)

(declare-fun e!433112 () SeekEntryResult!7978)

(assert (=> b!778494 (= e!433112 (Intermediate!7978 false (toIndex!0 lt!346718 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778495 () Bool)

(assert (=> b!778495 (= e!433114 (bvsge (x!65218 lt!346842) #b01111111111111111111111111111110))))

(declare-fun b!778496 () Bool)

(declare-fun e!433115 () Bool)

(assert (=> b!778496 (= e!433114 e!433115)))

(declare-fun res!526642 () Bool)

(assert (=> b!778496 (= res!526642 (and (is-Intermediate!7978 lt!346842) (not (undefined!8790 lt!346842)) (bvslt (x!65218 lt!346842) #b01111111111111111111111111111110) (bvsge (x!65218 lt!346842) #b00000000000000000000000000000000) (bvsge (x!65218 lt!346842) #b00000000000000000000000000000000)))))

(assert (=> b!778496 (=> (not res!526642) (not e!433115))))

(declare-fun b!778497 () Bool)

(assert (=> b!778497 (= e!433113 (Intermediate!7978 true (toIndex!0 lt!346718 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778498 () Bool)

(assert (=> b!778498 (and (bvsge (index!34282 lt!346842) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346842) (size!20799 lt!346716)))))

(declare-fun res!526643 () Bool)

(assert (=> b!778498 (= res!526643 (= (select (arr!20378 lt!346716) (index!34282 lt!346842)) lt!346718))))

(assert (=> b!778498 (=> res!526643 e!433111)))

(assert (=> b!778498 (= e!433115 e!433111)))

(declare-fun b!778499 () Bool)

(assert (=> b!778499 (= e!433113 e!433112)))

(declare-fun c!86328 () Bool)

(assert (=> b!778499 (= c!86328 (or (= lt!346841 lt!346718) (= (bvadd lt!346841 lt!346841) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778500 () Bool)

(assert (=> b!778500 (= e!433112 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346718 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346718 lt!346716 mask!3328))))

(declare-fun b!778501 () Bool)

(assert (=> b!778501 (and (bvsge (index!34282 lt!346842) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346842) (size!20799 lt!346716)))))

(assert (=> b!778501 (= e!433111 (= (select (arr!20378 lt!346716) (index!34282 lt!346842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102331 c!86329) b!778497))

(assert (= (and d!102331 (not c!86329)) b!778499))

(assert (= (and b!778499 c!86328) b!778494))

(assert (= (and b!778499 (not c!86328)) b!778500))

(assert (= (and d!102331 c!86330) b!778495))

(assert (= (and d!102331 (not c!86330)) b!778496))

(assert (= (and b!778496 res!526642) b!778498))

(assert (= (and b!778498 (not res!526643)) b!778493))

(assert (= (and b!778493 (not res!526644)) b!778501))

(declare-fun m!722167 () Bool)

(assert (=> b!778498 m!722167))

(assert (=> b!778493 m!722167))

(assert (=> d!102331 m!721973))

(declare-fun m!722169 () Bool)

(assert (=> d!102331 m!722169))

(assert (=> d!102331 m!721987))

(assert (=> b!778500 m!721973))

(declare-fun m!722171 () Bool)

(assert (=> b!778500 m!722171))

(assert (=> b!778500 m!722171))

(declare-fun m!722173 () Bool)

(assert (=> b!778500 m!722173))

(assert (=> b!778501 m!722167))

(assert (=> b!778218 d!102331))

(declare-fun d!102333 () Bool)

(declare-fun lt!346853 () (_ BitVec 32))

(declare-fun lt!346852 () (_ BitVec 32))

(assert (=> d!102333 (= lt!346853 (bvmul (bvxor lt!346852 (bvlshr lt!346852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102333 (= lt!346852 ((_ extract 31 0) (bvand (bvxor lt!346718 (bvlshr lt!346718 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102333 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526645 (let ((h!15490 ((_ extract 31 0) (bvand (bvxor lt!346718 (bvlshr lt!346718 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65226 (bvmul (bvxor h!15490 (bvlshr h!15490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65226 (bvlshr x!65226 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526645 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526645 #b00000000000000000000000000000000))))))

(assert (=> d!102333 (= (toIndex!0 lt!346718 mask!3328) (bvand (bvxor lt!346853 (bvlshr lt!346853 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778218 d!102333))

(declare-fun b!778583 () Bool)

(declare-fun c!86360 () Bool)

(declare-fun lt!346869 () (_ BitVec 64))

(assert (=> b!778583 (= c!86360 (= lt!346869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433169 () SeekEntryResult!7978)

(declare-fun e!433171 () SeekEntryResult!7978)

(assert (=> b!778583 (= e!433169 e!433171)))

(declare-fun d!102339 () Bool)

(declare-fun lt!346868 () SeekEntryResult!7978)

(assert (=> d!102339 (and (or (is-Undefined!7978 lt!346868) (not (is-Found!7978 lt!346868)) (and (bvsge (index!34281 lt!346868) #b00000000000000000000000000000000) (bvslt (index!34281 lt!346868) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346868) (is-Found!7978 lt!346868) (not (is-MissingVacant!7978 lt!346868)) (not (= (index!34283 lt!346868) resIntermediateIndex!5)) (and (bvsge (index!34283 lt!346868) #b00000000000000000000000000000000) (bvslt (index!34283 lt!346868) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346868) (ite (is-Found!7978 lt!346868) (= (select (arr!20378 a!3186) (index!34281 lt!346868)) (select (arr!20378 a!3186) j!159)) (and (is-MissingVacant!7978 lt!346868) (= (index!34283 lt!346868) resIntermediateIndex!5) (= (select (arr!20378 a!3186) (index!34283 lt!346868)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!433170 () SeekEntryResult!7978)

(assert (=> d!102339 (= lt!346868 e!433170)))

(declare-fun c!86359 () Bool)

(assert (=> d!102339 (= c!86359 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102339 (= lt!346869 (select (arr!20378 a!3186) index!1321))))

(assert (=> d!102339 (validMask!0 mask!3328)))

(assert (=> d!102339 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346868)))

(declare-fun b!778584 () Bool)

(assert (=> b!778584 (= e!433171 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778585 () Bool)

(assert (=> b!778585 (= e!433171 (MissingVacant!7978 resIntermediateIndex!5))))

(declare-fun b!778586 () Bool)

(assert (=> b!778586 (= e!433169 (Found!7978 index!1321))))

(declare-fun b!778587 () Bool)

(assert (=> b!778587 (= e!433170 Undefined!7978)))

(declare-fun b!778588 () Bool)

(assert (=> b!778588 (= e!433170 e!433169)))

(declare-fun c!86358 () Bool)

(assert (=> b!778588 (= c!86358 (= lt!346869 (select (arr!20378 a!3186) j!159)))))

(assert (= (and d!102339 c!86359) b!778587))

(assert (= (and d!102339 (not c!86359)) b!778588))

(assert (= (and b!778588 c!86358) b!778586))

(assert (= (and b!778588 (not c!86358)) b!778583))

(assert (= (and b!778583 c!86360) b!778585))

(assert (= (and b!778583 (not c!86360)) b!778584))

(declare-fun m!722235 () Bool)

(assert (=> d!102339 m!722235))

(declare-fun m!722237 () Bool)

(assert (=> d!102339 m!722237))

(assert (=> d!102339 m!722051))

(assert (=> d!102339 m!721987))

(assert (=> b!778584 m!722053))

(assert (=> b!778584 m!722053))

(assert (=> b!778584 m!721941))

(declare-fun m!722239 () Bool)

(assert (=> b!778584 m!722239))

(assert (=> b!778208 d!102339))

(declare-fun b!778589 () Bool)

(declare-fun c!86363 () Bool)

(declare-fun lt!346871 () (_ BitVec 64))

(assert (=> b!778589 (= c!86363 (= lt!346871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433172 () SeekEntryResult!7978)

(declare-fun e!433174 () SeekEntryResult!7978)

(assert (=> b!778589 (= e!433172 e!433174)))

(declare-fun lt!346870 () SeekEntryResult!7978)

(declare-fun d!102353 () Bool)

(assert (=> d!102353 (and (or (is-Undefined!7978 lt!346870) (not (is-Found!7978 lt!346870)) (and (bvsge (index!34281 lt!346870) #b00000000000000000000000000000000) (bvslt (index!34281 lt!346870) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346870) (is-Found!7978 lt!346870) (not (is-MissingVacant!7978 lt!346870)) (not (= (index!34283 lt!346870) resIntermediateIndex!5)) (and (bvsge (index!34283 lt!346870) #b00000000000000000000000000000000) (bvslt (index!34283 lt!346870) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346870) (ite (is-Found!7978 lt!346870) (= (select (arr!20378 a!3186) (index!34281 lt!346870)) (select (arr!20378 a!3186) j!159)) (and (is-MissingVacant!7978 lt!346870) (= (index!34283 lt!346870) resIntermediateIndex!5) (= (select (arr!20378 a!3186) (index!34283 lt!346870)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!433173 () SeekEntryResult!7978)

(assert (=> d!102353 (= lt!346870 e!433173)))

(declare-fun c!86362 () Bool)

(assert (=> d!102353 (= c!86362 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102353 (= lt!346871 (select (arr!20378 a!3186) resIntermediateIndex!5))))

(assert (=> d!102353 (validMask!0 mask!3328)))

(assert (=> d!102353 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346870)))

(declare-fun b!778590 () Bool)

(assert (=> b!778590 (= e!433174 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778591 () Bool)

(assert (=> b!778591 (= e!433174 (MissingVacant!7978 resIntermediateIndex!5))))

(declare-fun b!778592 () Bool)

(assert (=> b!778592 (= e!433172 (Found!7978 resIntermediateIndex!5))))

(declare-fun b!778593 () Bool)

(assert (=> b!778593 (= e!433173 Undefined!7978)))

(declare-fun b!778594 () Bool)

(assert (=> b!778594 (= e!433173 e!433172)))

(declare-fun c!86361 () Bool)

(assert (=> b!778594 (= c!86361 (= lt!346871 (select (arr!20378 a!3186) j!159)))))

(assert (= (and d!102353 c!86362) b!778593))

(assert (= (and d!102353 (not c!86362)) b!778594))

(assert (= (and b!778594 c!86361) b!778592))

(assert (= (and b!778594 (not c!86361)) b!778589))

(assert (= (and b!778589 c!86363) b!778591))

(assert (= (and b!778589 (not c!86363)) b!778590))

(declare-fun m!722241 () Bool)

(assert (=> d!102353 m!722241))

(declare-fun m!722243 () Bool)

(assert (=> d!102353 m!722243))

(assert (=> d!102353 m!721957))

(assert (=> d!102353 m!721987))

(declare-fun m!722245 () Bool)

(assert (=> b!778590 m!722245))

(assert (=> b!778590 m!722245))

(assert (=> b!778590 m!721941))

(declare-fun m!722247 () Bool)

(assert (=> b!778590 m!722247))

(assert (=> b!778217 d!102353))

(declare-fun d!102355 () Bool)

(assert (=> d!102355 (= (validKeyInArray!0 (select (arr!20378 a!3186) j!159)) (and (not (= (select (arr!20378 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20378 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778206 d!102355))

(declare-fun b!778595 () Bool)

(declare-fun e!433176 () Bool)

(declare-fun call!35210 () Bool)

(assert (=> b!778595 (= e!433176 call!35210)))

(declare-fun b!778596 () Bool)

(declare-fun e!433175 () Bool)

(assert (=> b!778596 (= e!433175 e!433176)))

(declare-fun lt!346874 () (_ BitVec 64))

(assert (=> b!778596 (= lt!346874 (select (arr!20378 a!3186) j!159))))

(declare-fun lt!346872 () Unit!26850)

(assert (=> b!778596 (= lt!346872 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346874 j!159))))

(assert (=> b!778596 (arrayContainsKey!0 a!3186 lt!346874 #b00000000000000000000000000000000)))

(declare-fun lt!346873 () Unit!26850)

(assert (=> b!778596 (= lt!346873 lt!346872)))

(declare-fun res!526674 () Bool)

(assert (=> b!778596 (= res!526674 (= (seekEntryOrOpen!0 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) (Found!7978 j!159)))))

(assert (=> b!778596 (=> (not res!526674) (not e!433176))))

(declare-fun bm!35207 () Bool)

(assert (=> bm!35207 (= call!35210 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!778597 () Bool)

(declare-fun e!433177 () Bool)

(assert (=> b!778597 (= e!433177 e!433175)))

(declare-fun c!86364 () Bool)

(assert (=> b!778597 (= c!86364 (validKeyInArray!0 (select (arr!20378 a!3186) j!159)))))

(declare-fun b!778598 () Bool)

(assert (=> b!778598 (= e!433175 call!35210)))

(declare-fun d!102357 () Bool)

(declare-fun res!526673 () Bool)

(assert (=> d!102357 (=> res!526673 e!433177)))

(assert (=> d!102357 (= res!526673 (bvsge j!159 (size!20799 a!3186)))))

(assert (=> d!102357 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!433177)))

(assert (= (and d!102357 (not res!526673)) b!778597))

(assert (= (and b!778597 c!86364) b!778596))

(assert (= (and b!778597 (not c!86364)) b!778598))

(assert (= (and b!778596 res!526674) b!778595))

(assert (= (or b!778595 b!778598) bm!35207))

(assert (=> b!778596 m!721941))

(declare-fun m!722249 () Bool)

(assert (=> b!778596 m!722249))

(declare-fun m!722251 () Bool)

(assert (=> b!778596 m!722251))

(assert (=> b!778596 m!721941))

(assert (=> b!778596 m!721985))

(declare-fun m!722253 () Bool)

(assert (=> bm!35207 m!722253))

(assert (=> b!778597 m!721941))

(assert (=> b!778597 m!721941))

(assert (=> b!778597 m!721963))

(assert (=> b!778207 d!102357))

(declare-fun d!102361 () Bool)

(assert (=> d!102361 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346882 () Unit!26850)

(declare-fun choose!38 (array!42568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26850)

(assert (=> d!102361 (= lt!346882 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102361 (validMask!0 mask!3328)))

(assert (=> d!102361 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346882)))

(declare-fun bs!21692 () Bool)

(assert (= bs!21692 d!102361))

(assert (=> bs!21692 m!721959))

(declare-fun m!722265 () Bool)

(assert (=> bs!21692 m!722265))

(assert (=> bs!21692 m!721987))

(assert (=> b!778207 d!102361))

(declare-fun d!102369 () Bool)

(declare-fun e!433189 () Bool)

(assert (=> d!102369 e!433189))

(declare-fun c!86371 () Bool)

(declare-fun lt!346884 () SeekEntryResult!7978)

(assert (=> d!102369 (= c!86371 (and (is-Intermediate!7978 lt!346884) (undefined!8790 lt!346884)))))

(declare-fun e!433188 () SeekEntryResult!7978)

(assert (=> d!102369 (= lt!346884 e!433188)))

(declare-fun c!86370 () Bool)

(assert (=> d!102369 (= c!86370 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346883 () (_ BitVec 64))

(assert (=> d!102369 (= lt!346883 (select (arr!20378 a!3186) (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328)))))

(assert (=> d!102369 (validMask!0 mask!3328)))

(assert (=> d!102369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346884)))

(declare-fun b!778612 () Bool)

(assert (=> b!778612 (and (bvsge (index!34282 lt!346884) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346884) (size!20799 a!3186)))))

(declare-fun res!526682 () Bool)

(assert (=> b!778612 (= res!526682 (= (select (arr!20378 a!3186) (index!34282 lt!346884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433186 () Bool)

(assert (=> b!778612 (=> res!526682 e!433186)))

(declare-fun b!778613 () Bool)

(declare-fun e!433187 () SeekEntryResult!7978)

(assert (=> b!778613 (= e!433187 (Intermediate!7978 false (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778614 () Bool)

(assert (=> b!778614 (= e!433189 (bvsge (x!65218 lt!346884) #b01111111111111111111111111111110))))

(declare-fun b!778615 () Bool)

(declare-fun e!433190 () Bool)

(assert (=> b!778615 (= e!433189 e!433190)))

(declare-fun res!526680 () Bool)

(assert (=> b!778615 (= res!526680 (and (is-Intermediate!7978 lt!346884) (not (undefined!8790 lt!346884)) (bvslt (x!65218 lt!346884) #b01111111111111111111111111111110) (bvsge (x!65218 lt!346884) #b00000000000000000000000000000000) (bvsge (x!65218 lt!346884) #b00000000000000000000000000000000)))))

(assert (=> b!778615 (=> (not res!526680) (not e!433190))))

(declare-fun b!778616 () Bool)

(assert (=> b!778616 (= e!433188 (Intermediate!7978 true (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778617 () Bool)

(assert (=> b!778617 (and (bvsge (index!34282 lt!346884) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346884) (size!20799 a!3186)))))

(declare-fun res!526681 () Bool)

(assert (=> b!778617 (= res!526681 (= (select (arr!20378 a!3186) (index!34282 lt!346884)) (select (arr!20378 a!3186) j!159)))))

(assert (=> b!778617 (=> res!526681 e!433186)))

(assert (=> b!778617 (= e!433190 e!433186)))

(declare-fun b!778618 () Bool)

(assert (=> b!778618 (= e!433188 e!433187)))

(declare-fun c!86369 () Bool)

(assert (=> b!778618 (= c!86369 (or (= lt!346883 (select (arr!20378 a!3186) j!159)) (= (bvadd lt!346883 lt!346883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778619 () Bool)

(assert (=> b!778619 (= e!433187 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20378 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778620 () Bool)

(assert (=> b!778620 (and (bvsge (index!34282 lt!346884) #b00000000000000000000000000000000) (bvslt (index!34282 lt!346884) (size!20799 a!3186)))))

(assert (=> b!778620 (= e!433186 (= (select (arr!20378 a!3186) (index!34282 lt!346884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102369 c!86370) b!778616))

(assert (= (and d!102369 (not c!86370)) b!778618))

(assert (= (and b!778618 c!86369) b!778613))

(assert (= (and b!778618 (not c!86369)) b!778619))

(assert (= (and d!102369 c!86371) b!778614))

(assert (= (and d!102369 (not c!86371)) b!778615))

(assert (= (and b!778615 res!526680) b!778617))

(assert (= (and b!778617 (not res!526681)) b!778612))

(assert (= (and b!778612 (not res!526682)) b!778620))

(declare-fun m!722267 () Bool)

(assert (=> b!778617 m!722267))

(assert (=> b!778612 m!722267))

(assert (=> d!102369 m!721953))

(declare-fun m!722269 () Bool)

(assert (=> d!102369 m!722269))

(assert (=> d!102369 m!721987))

(assert (=> b!778619 m!721953))

(declare-fun m!722271 () Bool)

(assert (=> b!778619 m!722271))

(assert (=> b!778619 m!722271))

(assert (=> b!778619 m!721941))

(declare-fun m!722275 () Bool)

(assert (=> b!778619 m!722275))

(assert (=> b!778620 m!722267))

(assert (=> b!778210 d!102369))

(declare-fun d!102371 () Bool)

(declare-fun lt!346889 () (_ BitVec 32))

(declare-fun lt!346888 () (_ BitVec 32))

(assert (=> d!102371 (= lt!346889 (bvmul (bvxor lt!346888 (bvlshr lt!346888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102371 (= lt!346888 ((_ extract 31 0) (bvand (bvxor (select (arr!20378 a!3186) j!159) (bvlshr (select (arr!20378 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102371 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526645 (let ((h!15490 ((_ extract 31 0) (bvand (bvxor (select (arr!20378 a!3186) j!159) (bvlshr (select (arr!20378 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65226 (bvmul (bvxor h!15490 (bvlshr h!15490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65226 (bvlshr x!65226 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526645 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526645 #b00000000000000000000000000000000))))))

(assert (=> d!102371 (= (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) (bvand (bvxor lt!346889 (bvlshr lt!346889 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778210 d!102371))

(declare-fun b!778631 () Bool)

(declare-fun e!433200 () Bool)

(declare-fun call!35214 () Bool)

(assert (=> b!778631 (= e!433200 call!35214)))

(declare-fun b!778632 () Bool)

(assert (=> b!778632 (= e!433200 call!35214)))

(declare-fun b!778633 () Bool)

(declare-fun e!433202 () Bool)

(declare-fun e!433199 () Bool)

(assert (=> b!778633 (= e!433202 e!433199)))

(declare-fun res!526691 () Bool)

(assert (=> b!778633 (=> (not res!526691) (not e!433199))))

(declare-fun e!433201 () Bool)

(assert (=> b!778633 (= res!526691 (not e!433201))))

(declare-fun res!526689 () Bool)

(assert (=> b!778633 (=> (not res!526689) (not e!433201))))

(assert (=> b!778633 (= res!526689 (validKeyInArray!0 (select (arr!20378 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102373 () Bool)

(declare-fun res!526690 () Bool)

(assert (=> d!102373 (=> res!526690 e!433202)))

(assert (=> d!102373 (= res!526690 (bvsge #b00000000000000000000000000000000 (size!20799 a!3186)))))

(assert (=> d!102373 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14377) e!433202)))

(declare-fun bm!35211 () Bool)

(declare-fun c!86374 () Bool)

(assert (=> bm!35211 (= call!35214 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86374 (Cons!14376 (select (arr!20378 a!3186) #b00000000000000000000000000000000) Nil!14377) Nil!14377)))))

(declare-fun b!778634 () Bool)

(assert (=> b!778634 (= e!433199 e!433200)))

(assert (=> b!778634 (= c!86374 (validKeyInArray!0 (select (arr!20378 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778635 () Bool)

(declare-fun contains!4101 (List!14380 (_ BitVec 64)) Bool)

(assert (=> b!778635 (= e!433201 (contains!4101 Nil!14377 (select (arr!20378 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102373 (not res!526690)) b!778633))

(assert (= (and b!778633 res!526689) b!778635))

(assert (= (and b!778633 res!526691) b!778634))

(assert (= (and b!778634 c!86374) b!778632))

(assert (= (and b!778634 (not c!86374)) b!778631))

(assert (= (or b!778632 b!778631) bm!35211))

(assert (=> b!778633 m!722139))

(assert (=> b!778633 m!722139))

(assert (=> b!778633 m!722149))

(assert (=> bm!35211 m!722139))

(declare-fun m!722277 () Bool)

(assert (=> bm!35211 m!722277))

(assert (=> b!778634 m!722139))

(assert (=> b!778634 m!722139))

(assert (=> b!778634 m!722149))

(assert (=> b!778635 m!722139))

(assert (=> b!778635 m!722139))

(declare-fun m!722279 () Bool)

(assert (=> b!778635 m!722279))

(assert (=> b!778211 d!102373))

(assert (=> b!778209 d!102339))

(declare-fun b!778636 () Bool)

(declare-fun e!433203 () SeekEntryResult!7978)

(declare-fun lt!346891 () SeekEntryResult!7978)

(assert (=> b!778636 (= e!433203 (Found!7978 (index!34282 lt!346891)))))

(declare-fun b!778637 () Bool)

(declare-fun c!86377 () Bool)

(declare-fun lt!346890 () (_ BitVec 64))

(assert (=> b!778637 (= c!86377 (= lt!346890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433204 () SeekEntryResult!7978)

(assert (=> b!778637 (= e!433203 e!433204)))

(declare-fun d!102375 () Bool)

(declare-fun lt!346892 () SeekEntryResult!7978)

(assert (=> d!102375 (and (or (is-Undefined!7978 lt!346892) (not (is-Found!7978 lt!346892)) (and (bvsge (index!34281 lt!346892) #b00000000000000000000000000000000) (bvslt (index!34281 lt!346892) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346892) (is-Found!7978 lt!346892) (not (is-MissingZero!7978 lt!346892)) (and (bvsge (index!34280 lt!346892) #b00000000000000000000000000000000) (bvslt (index!34280 lt!346892) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346892) (is-Found!7978 lt!346892) (is-MissingZero!7978 lt!346892) (not (is-MissingVacant!7978 lt!346892)) (and (bvsge (index!34283 lt!346892) #b00000000000000000000000000000000) (bvslt (index!34283 lt!346892) (size!20799 a!3186)))) (or (is-Undefined!7978 lt!346892) (ite (is-Found!7978 lt!346892) (= (select (arr!20378 a!3186) (index!34281 lt!346892)) (select (arr!20378 a!3186) j!159)) (ite (is-MissingZero!7978 lt!346892) (= (select (arr!20378 a!3186) (index!34280 lt!346892)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7978 lt!346892) (= (select (arr!20378 a!3186) (index!34283 lt!346892)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433205 () SeekEntryResult!7978)

(assert (=> d!102375 (= lt!346892 e!433205)))

