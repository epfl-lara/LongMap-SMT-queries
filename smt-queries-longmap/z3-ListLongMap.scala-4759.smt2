; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65742 () Bool)

(assert start!65742)

(declare-fun b!751384 () Bool)

(declare-fun res!506980 () Bool)

(declare-fun e!419275 () Bool)

(assert (=> b!751384 (=> res!506980 e!419275)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41785 0))(
  ( (array!41786 (arr!20002 (Array (_ BitVec 32) (_ BitVec 64))) (size!20422 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41785)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7558 0))(
  ( (MissingZero!7558 (index!32600 (_ BitVec 32))) (Found!7558 (index!32601 (_ BitVec 32))) (Intermediate!7558 (undefined!8370 Bool) (index!32602 (_ BitVec 32)) (x!63688 (_ BitVec 32))) (Undefined!7558) (MissingVacant!7558 (index!32603 (_ BitVec 32))) )
))
(declare-fun lt!334098 () SeekEntryResult!7558)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41785 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!751384 (= res!506980 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!334098)))))

(declare-fun b!751385 () Bool)

(declare-fun e!419276 () Bool)

(declare-fun e!419269 () Bool)

(assert (=> b!751385 (= e!419276 e!419269)))

(declare-fun res!506968 () Bool)

(assert (=> b!751385 (=> (not res!506968) (not e!419269))))

(declare-fun lt!334104 () SeekEntryResult!7558)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41785 (_ BitVec 32)) SeekEntryResult!7558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751385 (= res!506968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20002 a!3186) j!159) mask!3328) (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!334104))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751385 (= lt!334104 (Intermediate!7558 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751386 () Bool)

(declare-fun res!506963 () Bool)

(assert (=> b!751386 (=> (not res!506963) (not e!419276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41785 (_ BitVec 32)) Bool)

(assert (=> b!751386 (= res!506963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751387 () Bool)

(declare-fun res!506970 () Bool)

(declare-fun e!419274 () Bool)

(assert (=> b!751387 (=> (not res!506970) (not e!419274))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751387 (= res!506970 (validKeyInArray!0 k0!2102))))

(declare-fun b!751388 () Bool)

(declare-fun res!506976 () Bool)

(assert (=> b!751388 (=> (not res!506976) (not e!419274))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751388 (= res!506976 (and (= (size!20422 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20422 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20422 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!419272 () Bool)

(declare-fun b!751389 () Bool)

(assert (=> b!751389 (= e!419272 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!334104))))

(declare-fun b!751390 () Bool)

(declare-datatypes ((Unit!25789 0))(
  ( (Unit!25790) )
))
(declare-fun e!419267 () Unit!25789)

(declare-fun Unit!25791 () Unit!25789)

(assert (=> b!751390 (= e!419267 Unit!25791)))

(assert (=> b!751390 false))

(declare-fun res!506964 () Bool)

(assert (=> start!65742 (=> (not res!506964) (not e!419274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65742 (= res!506964 (validMask!0 mask!3328))))

(assert (=> start!65742 e!419274))

(assert (=> start!65742 true))

(declare-fun array_inv!15861 (array!41785) Bool)

(assert (=> start!65742 (array_inv!15861 a!3186)))

(declare-fun e!419270 () Bool)

(declare-fun b!751391 () Bool)

(assert (=> b!751391 (= e!419270 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!334098))))

(declare-fun b!751392 () Bool)

(declare-fun e!419271 () Bool)

(assert (=> b!751392 (= e!419275 e!419271)))

(declare-fun res!506977 () Bool)

(assert (=> b!751392 (=> res!506977 e!419271)))

(declare-fun lt!334101 () (_ BitVec 64))

(declare-fun lt!334094 () (_ BitVec 64))

(assert (=> b!751392 (= res!506977 (= lt!334101 lt!334094))))

(assert (=> b!751392 (= lt!334101 (select (store (arr!20002 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751393 () Bool)

(declare-fun res!506965 () Bool)

(assert (=> b!751393 (=> (not res!506965) (not e!419274))))

(declare-fun arrayContainsKey!0 (array!41785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751393 (= res!506965 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751394 () Bool)

(declare-fun e!419277 () Bool)

(assert (=> b!751394 (= e!419269 e!419277)))

(declare-fun res!506969 () Bool)

(assert (=> b!751394 (=> (not res!506969) (not e!419277))))

(declare-fun lt!334102 () SeekEntryResult!7558)

(declare-fun lt!334103 () SeekEntryResult!7558)

(assert (=> b!751394 (= res!506969 (= lt!334102 lt!334103))))

(declare-fun lt!334099 () array!41785)

(assert (=> b!751394 (= lt!334103 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334094 lt!334099 mask!3328))))

(assert (=> b!751394 (= lt!334102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334094 mask!3328) lt!334094 lt!334099 mask!3328))))

(assert (=> b!751394 (= lt!334094 (select (store (arr!20002 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751394 (= lt!334099 (array!41786 (store (arr!20002 a!3186) i!1173 k0!2102) (size!20422 a!3186)))))

(declare-fun b!751395 () Bool)

(declare-fun res!506966 () Bool)

(assert (=> b!751395 (=> (not res!506966) (not e!419274))))

(assert (=> b!751395 (= res!506966 (validKeyInArray!0 (select (arr!20002 a!3186) j!159)))))

(declare-fun b!751396 () Bool)

(declare-fun Unit!25792 () Unit!25789)

(assert (=> b!751396 (= e!419267 Unit!25792)))

(declare-fun b!751397 () Bool)

(declare-fun res!506974 () Bool)

(assert (=> b!751397 (=> (not res!506974) (not e!419269))))

(assert (=> b!751397 (= res!506974 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20002 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751398 () Bool)

(assert (=> b!751398 (= e!419271 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!419273 () Bool)

(assert (=> b!751398 e!419273))

(declare-fun res!506972 () Bool)

(assert (=> b!751398 (=> (not res!506972) (not e!419273))))

(assert (=> b!751398 (= res!506972 (= lt!334101 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334095 () Unit!25789)

(assert (=> b!751398 (= lt!334095 e!419267)))

(declare-fun c!82595 () Bool)

(assert (=> b!751398 (= c!82595 (= lt!334101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751399 () Bool)

(declare-fun res!506975 () Bool)

(assert (=> b!751399 (=> (not res!506975) (not e!419276))))

(declare-datatypes ((List!13911 0))(
  ( (Nil!13908) (Cons!13907 (h!14985 (_ BitVec 64)) (t!20218 List!13911)) )
))
(declare-fun arrayNoDuplicates!0 (array!41785 (_ BitVec 32) List!13911) Bool)

(assert (=> b!751399 (= res!506975 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13908))))

(declare-fun b!751400 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41785 (_ BitVec 32)) SeekEntryResult!7558)

(assert (=> b!751400 (= e!419273 (= (seekEntryOrOpen!0 lt!334094 lt!334099 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334094 lt!334099 mask!3328)))))

(declare-fun b!751401 () Bool)

(declare-fun res!506978 () Bool)

(assert (=> b!751401 (=> (not res!506978) (not e!419276))))

(assert (=> b!751401 (= res!506978 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20422 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20422 a!3186))))))

(declare-fun b!751402 () Bool)

(declare-fun res!506979 () Bool)

(assert (=> b!751402 (=> (not res!506979) (not e!419269))))

(assert (=> b!751402 (= res!506979 e!419272)))

(declare-fun c!82594 () Bool)

(assert (=> b!751402 (= c!82594 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751403 () Bool)

(assert (=> b!751403 (= e!419277 (not e!419275))))

(declare-fun res!506973 () Bool)

(assert (=> b!751403 (=> res!506973 e!419275)))

(get-info :version)

(assert (=> b!751403 (= res!506973 (or (not ((_ is Intermediate!7558) lt!334103)) (bvslt x!1131 (x!63688 lt!334103)) (not (= x!1131 (x!63688 lt!334103))) (not (= index!1321 (index!32602 lt!334103)))))))

(assert (=> b!751403 e!419270))

(declare-fun res!506971 () Bool)

(assert (=> b!751403 (=> (not res!506971) (not e!419270))))

(declare-fun lt!334096 () SeekEntryResult!7558)

(assert (=> b!751403 (= res!506971 (= lt!334096 lt!334098))))

(assert (=> b!751403 (= lt!334098 (Found!7558 j!159))))

(assert (=> b!751403 (= lt!334096 (seekEntryOrOpen!0 (select (arr!20002 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751403 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334100 () Unit!25789)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25789)

(assert (=> b!751403 (= lt!334100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751404 () Bool)

(assert (=> b!751404 (= e!419272 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) (Found!7558 j!159)))))

(declare-fun b!751405 () Bool)

(assert (=> b!751405 (= e!419274 e!419276)))

(declare-fun res!506967 () Bool)

(assert (=> b!751405 (=> (not res!506967) (not e!419276))))

(declare-fun lt!334097 () SeekEntryResult!7558)

(assert (=> b!751405 (= res!506967 (or (= lt!334097 (MissingZero!7558 i!1173)) (= lt!334097 (MissingVacant!7558 i!1173))))))

(assert (=> b!751405 (= lt!334097 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65742 res!506964) b!751388))

(assert (= (and b!751388 res!506976) b!751395))

(assert (= (and b!751395 res!506966) b!751387))

(assert (= (and b!751387 res!506970) b!751393))

(assert (= (and b!751393 res!506965) b!751405))

(assert (= (and b!751405 res!506967) b!751386))

(assert (= (and b!751386 res!506963) b!751399))

(assert (= (and b!751399 res!506975) b!751401))

(assert (= (and b!751401 res!506978) b!751385))

(assert (= (and b!751385 res!506968) b!751397))

(assert (= (and b!751397 res!506974) b!751402))

(assert (= (and b!751402 c!82594) b!751389))

(assert (= (and b!751402 (not c!82594)) b!751404))

(assert (= (and b!751402 res!506979) b!751394))

(assert (= (and b!751394 res!506969) b!751403))

(assert (= (and b!751403 res!506971) b!751391))

(assert (= (and b!751403 (not res!506973)) b!751384))

(assert (= (and b!751384 (not res!506980)) b!751392))

(assert (= (and b!751392 (not res!506977)) b!751398))

(assert (= (and b!751398 c!82595) b!751390))

(assert (= (and b!751398 (not c!82595)) b!751396))

(assert (= (and b!751398 res!506972) b!751400))

(declare-fun m!701151 () Bool)

(assert (=> b!751384 m!701151))

(assert (=> b!751384 m!701151))

(declare-fun m!701153 () Bool)

(assert (=> b!751384 m!701153))

(declare-fun m!701155 () Bool)

(assert (=> b!751405 m!701155))

(declare-fun m!701157 () Bool)

(assert (=> start!65742 m!701157))

(declare-fun m!701159 () Bool)

(assert (=> start!65742 m!701159))

(assert (=> b!751395 m!701151))

(assert (=> b!751395 m!701151))

(declare-fun m!701161 () Bool)

(assert (=> b!751395 m!701161))

(declare-fun m!701163 () Bool)

(assert (=> b!751400 m!701163))

(declare-fun m!701165 () Bool)

(assert (=> b!751400 m!701165))

(declare-fun m!701167 () Bool)

(assert (=> b!751397 m!701167))

(declare-fun m!701169 () Bool)

(assert (=> b!751394 m!701169))

(declare-fun m!701171 () Bool)

(assert (=> b!751394 m!701171))

(declare-fun m!701173 () Bool)

(assert (=> b!751394 m!701173))

(assert (=> b!751394 m!701173))

(declare-fun m!701175 () Bool)

(assert (=> b!751394 m!701175))

(declare-fun m!701177 () Bool)

(assert (=> b!751394 m!701177))

(assert (=> b!751392 m!701171))

(declare-fun m!701179 () Bool)

(assert (=> b!751392 m!701179))

(declare-fun m!701181 () Bool)

(assert (=> b!751399 m!701181))

(declare-fun m!701183 () Bool)

(assert (=> b!751393 m!701183))

(declare-fun m!701185 () Bool)

(assert (=> b!751387 m!701185))

(declare-fun m!701187 () Bool)

(assert (=> b!751386 m!701187))

(assert (=> b!751403 m!701151))

(assert (=> b!751403 m!701151))

(declare-fun m!701189 () Bool)

(assert (=> b!751403 m!701189))

(declare-fun m!701191 () Bool)

(assert (=> b!751403 m!701191))

(declare-fun m!701193 () Bool)

(assert (=> b!751403 m!701193))

(assert (=> b!751404 m!701151))

(assert (=> b!751404 m!701151))

(assert (=> b!751404 m!701153))

(assert (=> b!751385 m!701151))

(assert (=> b!751385 m!701151))

(declare-fun m!701195 () Bool)

(assert (=> b!751385 m!701195))

(assert (=> b!751385 m!701195))

(assert (=> b!751385 m!701151))

(declare-fun m!701197 () Bool)

(assert (=> b!751385 m!701197))

(assert (=> b!751391 m!701151))

(assert (=> b!751391 m!701151))

(declare-fun m!701199 () Bool)

(assert (=> b!751391 m!701199))

(assert (=> b!751389 m!701151))

(assert (=> b!751389 m!701151))

(declare-fun m!701201 () Bool)

(assert (=> b!751389 m!701201))

(check-sat (not b!751405) (not b!751387) (not b!751394) (not b!751391) (not b!751400) (not b!751386) (not b!751384) (not b!751393) (not b!751389) (not b!751403) (not b!751385) (not start!65742) (not b!751404) (not b!751395) (not b!751399))
(check-sat)
