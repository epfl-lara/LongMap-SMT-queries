; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65814 () Bool)

(assert start!65814)

(declare-fun b!757496 () Bool)

(declare-fun e!422350 () Bool)

(assert (=> b!757496 (= e!422350 true)))

(declare-fun e!422353 () Bool)

(assert (=> b!757496 e!422353))

(declare-fun res!512332 () Bool)

(assert (=> b!757496 (=> (not res!512332) (not e!422353))))

(declare-fun lt!337342 () (_ BitVec 64))

(assert (=> b!757496 (= res!512332 (= lt!337342 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26208 0))(
  ( (Unit!26209) )
))
(declare-fun lt!337349 () Unit!26208)

(declare-fun e!422346 () Unit!26208)

(assert (=> b!757496 (= lt!337349 e!422346)))

(declare-fun c!82972 () Bool)

(assert (=> b!757496 (= c!82972 (= lt!337342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757497 () Bool)

(declare-fun Unit!26210 () Unit!26208)

(assert (=> b!757497 (= e!422346 Unit!26210)))

(assert (=> b!757497 false))

(declare-fun b!757498 () Bool)

(declare-fun res!512325 () Bool)

(declare-fun e!422351 () Bool)

(assert (=> b!757498 (=> (not res!512325) (not e!422351))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757498 (= res!512325 (validKeyInArray!0 k0!2102))))

(declare-fun b!757499 () Bool)

(declare-fun res!512319 () Bool)

(assert (=> b!757499 (=> (not res!512319) (not e!422353))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337348 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41987 0))(
  ( (array!41988 (arr!20107 (Array (_ BitVec 32) (_ BitVec 64))) (size!20528 (_ BitVec 32))) )
))
(declare-fun lt!337347 () array!41987)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7707 0))(
  ( (MissingZero!7707 (index!33196 (_ BitVec 32))) (Found!7707 (index!33197 (_ BitVec 32))) (Intermediate!7707 (undefined!8519 Bool) (index!33198 (_ BitVec 32)) (x!64089 (_ BitVec 32))) (Undefined!7707) (MissingVacant!7707 (index!33199 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41987 (_ BitVec 32)) SeekEntryResult!7707)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41987 (_ BitVec 32)) SeekEntryResult!7707)

(assert (=> b!757499 (= res!512319 (= (seekEntryOrOpen!0 lt!337348 lt!337347 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337348 lt!337347 mask!3328)))))

(declare-fun b!757500 () Bool)

(declare-fun e!422356 () Bool)

(declare-fun e!422352 () Bool)

(assert (=> b!757500 (= e!422356 e!422352)))

(declare-fun res!512327 () Bool)

(assert (=> b!757500 (=> res!512327 e!422352)))

(declare-fun lt!337344 () SeekEntryResult!7707)

(declare-fun lt!337340 () SeekEntryResult!7707)

(assert (=> b!757500 (= res!512327 (not (= lt!337344 lt!337340)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!41987)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!757500 (= lt!337344 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20107 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757501 () Bool)

(declare-fun res!512331 () Bool)

(assert (=> b!757501 (=> (not res!512331) (not e!422351))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757501 (= res!512331 (and (= (size!20528 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20528 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20528 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757502 () Bool)

(assert (=> b!757502 (= e!422352 e!422350)))

(declare-fun res!512318 () Bool)

(assert (=> b!757502 (=> res!512318 e!422350)))

(assert (=> b!757502 (= res!512318 (= lt!337342 lt!337348))))

(assert (=> b!757502 (= lt!337342 (select (store (arr!20107 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!512315 () Bool)

(assert (=> start!65814 (=> (not res!512315) (not e!422351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65814 (= res!512315 (validMask!0 mask!3328))))

(assert (=> start!65814 e!422351))

(assert (=> start!65814 true))

(declare-fun array_inv!15903 (array!41987) Bool)

(assert (=> start!65814 (array_inv!15903 a!3186)))

(declare-fun b!757503 () Bool)

(declare-fun res!512320 () Bool)

(declare-fun e!422349 () Bool)

(assert (=> b!757503 (=> (not res!512320) (not e!422349))))

(declare-fun e!422354 () Bool)

(assert (=> b!757503 (= res!512320 e!422354)))

(declare-fun c!82971 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757503 (= c!82971 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!422348 () Bool)

(declare-fun b!757504 () Bool)

(assert (=> b!757504 (= e!422348 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20107 a!3186) j!159) a!3186 mask!3328) lt!337340))))

(declare-fun b!757505 () Bool)

(declare-fun res!512329 () Bool)

(assert (=> b!757505 (=> (not res!512329) (not e!422349))))

(assert (=> b!757505 (= res!512329 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20107 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757506 () Bool)

(declare-fun res!512317 () Bool)

(declare-fun e!422357 () Bool)

(assert (=> b!757506 (=> (not res!512317) (not e!422357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41987 (_ BitVec 32)) Bool)

(assert (=> b!757506 (= res!512317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757507 () Bool)

(declare-fun lt!337345 () SeekEntryResult!7707)

(assert (=> b!757507 (= e!422353 (= lt!337345 lt!337344))))

(declare-fun b!757508 () Bool)

(declare-fun res!512328 () Bool)

(assert (=> b!757508 (=> (not res!512328) (not e!422357))))

(declare-datatypes ((List!14109 0))(
  ( (Nil!14106) (Cons!14105 (h!15177 (_ BitVec 64)) (t!20424 List!14109)) )
))
(declare-fun arrayNoDuplicates!0 (array!41987 (_ BitVec 32) List!14109) Bool)

(assert (=> b!757508 (= res!512328 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14106))))

(declare-fun b!757509 () Bool)

(assert (=> b!757509 (= e!422351 e!422357)))

(declare-fun res!512326 () Bool)

(assert (=> b!757509 (=> (not res!512326) (not e!422357))))

(declare-fun lt!337338 () SeekEntryResult!7707)

(assert (=> b!757509 (= res!512326 (or (= lt!337338 (MissingZero!7707 i!1173)) (= lt!337338 (MissingVacant!7707 i!1173))))))

(assert (=> b!757509 (= lt!337338 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757510 () Bool)

(declare-fun e!422347 () Bool)

(assert (=> b!757510 (= e!422349 e!422347)))

(declare-fun res!512323 () Bool)

(assert (=> b!757510 (=> (not res!512323) (not e!422347))))

(declare-fun lt!337339 () SeekEntryResult!7707)

(declare-fun lt!337346 () SeekEntryResult!7707)

(assert (=> b!757510 (= res!512323 (= lt!337339 lt!337346))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41987 (_ BitVec 32)) SeekEntryResult!7707)

(assert (=> b!757510 (= lt!337346 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337348 lt!337347 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757510 (= lt!337339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337348 mask!3328) lt!337348 lt!337347 mask!3328))))

(assert (=> b!757510 (= lt!337348 (select (store (arr!20107 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757510 (= lt!337347 (array!41988 (store (arr!20107 a!3186) i!1173 k0!2102) (size!20528 a!3186)))))

(declare-fun b!757511 () Bool)

(assert (=> b!757511 (= e!422354 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20107 a!3186) j!159) a!3186 mask!3328) (Found!7707 j!159)))))

(declare-fun b!757512 () Bool)

(assert (=> b!757512 (= e!422347 (not e!422356))))

(declare-fun res!512333 () Bool)

(assert (=> b!757512 (=> res!512333 e!422356)))

(get-info :version)

(assert (=> b!757512 (= res!512333 (or (not ((_ is Intermediate!7707) lt!337346)) (bvslt x!1131 (x!64089 lt!337346)) (not (= x!1131 (x!64089 lt!337346))) (not (= index!1321 (index!33198 lt!337346)))))))

(assert (=> b!757512 e!422348))

(declare-fun res!512316 () Bool)

(assert (=> b!757512 (=> (not res!512316) (not e!422348))))

(assert (=> b!757512 (= res!512316 (= lt!337345 lt!337340))))

(assert (=> b!757512 (= lt!337340 (Found!7707 j!159))))

(assert (=> b!757512 (= lt!337345 (seekEntryOrOpen!0 (select (arr!20107 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757512 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337341 () Unit!26208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26208)

(assert (=> b!757512 (= lt!337341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757513 () Bool)

(assert (=> b!757513 (= e!422357 e!422349)))

(declare-fun res!512324 () Bool)

(assert (=> b!757513 (=> (not res!512324) (not e!422349))))

(declare-fun lt!337343 () SeekEntryResult!7707)

(assert (=> b!757513 (= res!512324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20107 a!3186) j!159) mask!3328) (select (arr!20107 a!3186) j!159) a!3186 mask!3328) lt!337343))))

(assert (=> b!757513 (= lt!337343 (Intermediate!7707 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757514 () Bool)

(declare-fun res!512330 () Bool)

(assert (=> b!757514 (=> (not res!512330) (not e!422351))))

(declare-fun arrayContainsKey!0 (array!41987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757514 (= res!512330 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757515 () Bool)

(assert (=> b!757515 (= e!422354 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20107 a!3186) j!159) a!3186 mask!3328) lt!337343))))

(declare-fun b!757516 () Bool)

(declare-fun res!512321 () Bool)

(assert (=> b!757516 (=> (not res!512321) (not e!422357))))

(assert (=> b!757516 (= res!512321 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20528 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20528 a!3186))))))

(declare-fun b!757517 () Bool)

(declare-fun res!512322 () Bool)

(assert (=> b!757517 (=> (not res!512322) (not e!422351))))

(assert (=> b!757517 (= res!512322 (validKeyInArray!0 (select (arr!20107 a!3186) j!159)))))

(declare-fun b!757518 () Bool)

(declare-fun Unit!26211 () Unit!26208)

(assert (=> b!757518 (= e!422346 Unit!26211)))

(assert (= (and start!65814 res!512315) b!757501))

(assert (= (and b!757501 res!512331) b!757517))

(assert (= (and b!757517 res!512322) b!757498))

(assert (= (and b!757498 res!512325) b!757514))

(assert (= (and b!757514 res!512330) b!757509))

(assert (= (and b!757509 res!512326) b!757506))

(assert (= (and b!757506 res!512317) b!757508))

(assert (= (and b!757508 res!512328) b!757516))

(assert (= (and b!757516 res!512321) b!757513))

(assert (= (and b!757513 res!512324) b!757505))

(assert (= (and b!757505 res!512329) b!757503))

(assert (= (and b!757503 c!82971) b!757515))

(assert (= (and b!757503 (not c!82971)) b!757511))

(assert (= (and b!757503 res!512320) b!757510))

(assert (= (and b!757510 res!512323) b!757512))

(assert (= (and b!757512 res!512316) b!757504))

(assert (= (and b!757512 (not res!512333)) b!757500))

(assert (= (and b!757500 (not res!512327)) b!757502))

(assert (= (and b!757502 (not res!512318)) b!757496))

(assert (= (and b!757496 c!82972) b!757497))

(assert (= (and b!757496 (not c!82972)) b!757518))

(assert (= (and b!757496 res!512332) b!757499))

(assert (= (and b!757499 res!512319) b!757507))

(declare-fun m!705191 () Bool)

(assert (=> b!757510 m!705191))

(declare-fun m!705193 () Bool)

(assert (=> b!757510 m!705193))

(declare-fun m!705195 () Bool)

(assert (=> b!757510 m!705195))

(declare-fun m!705197 () Bool)

(assert (=> b!757510 m!705197))

(assert (=> b!757510 m!705195))

(declare-fun m!705199 () Bool)

(assert (=> b!757510 m!705199))

(declare-fun m!705201 () Bool)

(assert (=> b!757514 m!705201))

(declare-fun m!705203 () Bool)

(assert (=> b!757513 m!705203))

(assert (=> b!757513 m!705203))

(declare-fun m!705205 () Bool)

(assert (=> b!757513 m!705205))

(assert (=> b!757513 m!705205))

(assert (=> b!757513 m!705203))

(declare-fun m!705207 () Bool)

(assert (=> b!757513 m!705207))

(assert (=> b!757517 m!705203))

(assert (=> b!757517 m!705203))

(declare-fun m!705209 () Bool)

(assert (=> b!757517 m!705209))

(declare-fun m!705211 () Bool)

(assert (=> start!65814 m!705211))

(declare-fun m!705213 () Bool)

(assert (=> start!65814 m!705213))

(assert (=> b!757504 m!705203))

(assert (=> b!757504 m!705203))

(declare-fun m!705215 () Bool)

(assert (=> b!757504 m!705215))

(declare-fun m!705217 () Bool)

(assert (=> b!757506 m!705217))

(assert (=> b!757515 m!705203))

(assert (=> b!757515 m!705203))

(declare-fun m!705219 () Bool)

(assert (=> b!757515 m!705219))

(assert (=> b!757511 m!705203))

(assert (=> b!757511 m!705203))

(declare-fun m!705221 () Bool)

(assert (=> b!757511 m!705221))

(assert (=> b!757512 m!705203))

(assert (=> b!757512 m!705203))

(declare-fun m!705223 () Bool)

(assert (=> b!757512 m!705223))

(declare-fun m!705225 () Bool)

(assert (=> b!757512 m!705225))

(declare-fun m!705227 () Bool)

(assert (=> b!757512 m!705227))

(declare-fun m!705229 () Bool)

(assert (=> b!757499 m!705229))

(declare-fun m!705231 () Bool)

(assert (=> b!757499 m!705231))

(declare-fun m!705233 () Bool)

(assert (=> b!757505 m!705233))

(assert (=> b!757502 m!705191))

(declare-fun m!705235 () Bool)

(assert (=> b!757502 m!705235))

(assert (=> b!757500 m!705203))

(assert (=> b!757500 m!705203))

(assert (=> b!757500 m!705221))

(declare-fun m!705237 () Bool)

(assert (=> b!757508 m!705237))

(declare-fun m!705239 () Bool)

(assert (=> b!757498 m!705239))

(declare-fun m!705241 () Bool)

(assert (=> b!757509 m!705241))

(check-sat (not b!757511) (not start!65814) (not b!757499) (not b!757513) (not b!757506) (not b!757504) (not b!757509) (not b!757510) (not b!757515) (not b!757514) (not b!757517) (not b!757508) (not b!757498) (not b!757500) (not b!757512))
(check-sat)
