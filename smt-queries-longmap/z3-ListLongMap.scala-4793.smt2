; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65798 () Bool)

(assert start!65798)

(declare-fun b!757385 () Bool)

(declare-fun res!512337 () Bool)

(declare-fun e!422271 () Bool)

(assert (=> b!757385 (=> (not res!512337) (not e!422271))))

(declare-datatypes ((array!41988 0))(
  ( (array!41989 (arr!20108 (Array (_ BitVec 32) (_ BitVec 64))) (size!20529 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41988)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!757385 (= res!512337 (and (= (size!20529 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20529 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20529 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757386 () Bool)

(declare-fun e!422269 () Bool)

(declare-fun e!422267 () Bool)

(assert (=> b!757386 (= e!422269 e!422267)))

(declare-fun res!512327 () Bool)

(assert (=> b!757386 (=> (not res!512327) (not e!422267))))

(declare-datatypes ((SeekEntryResult!7705 0))(
  ( (MissingZero!7705 (index!33188 (_ BitVec 32))) (Found!7705 (index!33189 (_ BitVec 32))) (Intermediate!7705 (undefined!8517 Bool) (index!33190 (_ BitVec 32)) (x!64090 (_ BitVec 32))) (Undefined!7705) (MissingVacant!7705 (index!33191 (_ BitVec 32))) )
))
(declare-fun lt!337178 () SeekEntryResult!7705)

(declare-fun lt!337174 () SeekEntryResult!7705)

(assert (=> b!757386 (= res!512327 (= lt!337178 lt!337174))))

(declare-fun lt!337171 () array!41988)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337181 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41988 (_ BitVec 32)) SeekEntryResult!7705)

(assert (=> b!757386 (= lt!337174 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337181 lt!337171 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757386 (= lt!337178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337181 mask!3328) lt!337181 lt!337171 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757386 (= lt!337181 (select (store (arr!20108 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757386 (= lt!337171 (array!41989 (store (arr!20108 a!3186) i!1173 k0!2102) (size!20529 a!3186)))))

(declare-fun b!757387 () Bool)

(declare-fun res!512335 () Bool)

(assert (=> b!757387 (=> (not res!512335) (not e!422271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757387 (= res!512335 (validKeyInArray!0 (select (arr!20108 a!3186) j!159)))))

(declare-fun b!757388 () Bool)

(declare-fun e!422275 () Bool)

(assert (=> b!757388 (= e!422271 e!422275)))

(declare-fun res!512330 () Bool)

(assert (=> b!757388 (=> (not res!512330) (not e!422275))))

(declare-fun lt!337179 () SeekEntryResult!7705)

(assert (=> b!757388 (= res!512330 (or (= lt!337179 (MissingZero!7705 i!1173)) (= lt!337179 (MissingVacant!7705 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41988 (_ BitVec 32)) SeekEntryResult!7705)

(assert (=> b!757388 (= lt!337179 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757389 () Bool)

(declare-fun res!512319 () Bool)

(assert (=> b!757389 (=> (not res!512319) (not e!422269))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757389 (= res!512319 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20108 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757390 () Bool)

(declare-fun res!512321 () Bool)

(assert (=> b!757390 (=> (not res!512321) (not e!422271))))

(declare-fun arrayContainsKey!0 (array!41988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757390 (= res!512321 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757391 () Bool)

(declare-fun e!422274 () Bool)

(assert (=> b!757391 (= e!422274 true)))

(declare-fun e!422272 () Bool)

(assert (=> b!757391 e!422272))

(declare-fun res!512333 () Bool)

(assert (=> b!757391 (=> (not res!512333) (not e!422272))))

(declare-fun lt!337170 () (_ BitVec 64))

(assert (=> b!757391 (= res!512333 (= lt!337170 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26180 0))(
  ( (Unit!26181) )
))
(declare-fun lt!337173 () Unit!26180)

(declare-fun e!422265 () Unit!26180)

(assert (=> b!757391 (= lt!337173 e!422265)))

(declare-fun c!82913 () Bool)

(assert (=> b!757391 (= c!82913 (= lt!337170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!512336 () Bool)

(assert (=> start!65798 (=> (not res!512336) (not e!422271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65798 (= res!512336 (validMask!0 mask!3328))))

(assert (=> start!65798 e!422271))

(assert (=> start!65798 true))

(declare-fun array_inv!15991 (array!41988) Bool)

(assert (=> start!65798 (array_inv!15991 a!3186)))

(declare-fun b!757384 () Bool)

(declare-fun lt!337177 () SeekEntryResult!7705)

(declare-fun lt!337176 () SeekEntryResult!7705)

(assert (=> b!757384 (= e!422272 (= lt!337177 lt!337176))))

(declare-fun b!757392 () Bool)

(declare-fun res!512323 () Bool)

(assert (=> b!757392 (=> (not res!512323) (not e!422275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41988 (_ BitVec 32)) Bool)

(assert (=> b!757392 (= res!512323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757393 () Bool)

(declare-fun res!512331 () Bool)

(assert (=> b!757393 (=> (not res!512331) (not e!422269))))

(declare-fun e!422268 () Bool)

(assert (=> b!757393 (= res!512331 e!422268)))

(declare-fun c!82914 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757393 (= c!82914 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757394 () Bool)

(declare-fun Unit!26182 () Unit!26180)

(assert (=> b!757394 (= e!422265 Unit!26182)))

(assert (=> b!757394 false))

(declare-fun b!757395 () Bool)

(declare-fun res!512329 () Bool)

(assert (=> b!757395 (=> (not res!512329) (not e!422271))))

(assert (=> b!757395 (= res!512329 (validKeyInArray!0 k0!2102))))

(declare-fun b!757396 () Bool)

(declare-fun e!422264 () Bool)

(assert (=> b!757396 (= e!422267 (not e!422264))))

(declare-fun res!512325 () Bool)

(assert (=> b!757396 (=> res!512325 e!422264)))

(get-info :version)

(assert (=> b!757396 (= res!512325 (or (not ((_ is Intermediate!7705) lt!337174)) (bvslt x!1131 (x!64090 lt!337174)) (not (= x!1131 (x!64090 lt!337174))) (not (= index!1321 (index!33190 lt!337174)))))))

(declare-fun e!422273 () Bool)

(assert (=> b!757396 e!422273))

(declare-fun res!512322 () Bool)

(assert (=> b!757396 (=> (not res!512322) (not e!422273))))

(declare-fun lt!337175 () SeekEntryResult!7705)

(assert (=> b!757396 (= res!512322 (= lt!337177 lt!337175))))

(assert (=> b!757396 (= lt!337175 (Found!7705 j!159))))

(assert (=> b!757396 (= lt!337177 (seekEntryOrOpen!0 (select (arr!20108 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757396 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337172 () Unit!26180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26180)

(assert (=> b!757396 (= lt!337172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757397 () Bool)

(declare-fun res!512320 () Bool)

(assert (=> b!757397 (=> (not res!512320) (not e!422275))))

(declare-datatypes ((List!14149 0))(
  ( (Nil!14146) (Cons!14145 (h!15217 (_ BitVec 64)) (t!20455 List!14149)) )
))
(declare-fun arrayNoDuplicates!0 (array!41988 (_ BitVec 32) List!14149) Bool)

(assert (=> b!757397 (= res!512320 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14146))))

(declare-fun b!757398 () Bool)

(assert (=> b!757398 (= e!422275 e!422269)))

(declare-fun res!512324 () Bool)

(assert (=> b!757398 (=> (not res!512324) (not e!422269))))

(declare-fun lt!337180 () SeekEntryResult!7705)

(assert (=> b!757398 (= res!512324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20108 a!3186) j!159) mask!3328) (select (arr!20108 a!3186) j!159) a!3186 mask!3328) lt!337180))))

(assert (=> b!757398 (= lt!337180 (Intermediate!7705 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757399 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41988 (_ BitVec 32)) SeekEntryResult!7705)

(assert (=> b!757399 (= e!422273 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20108 a!3186) j!159) a!3186 mask!3328) lt!337175))))

(declare-fun b!757400 () Bool)

(declare-fun res!512334 () Bool)

(assert (=> b!757400 (=> (not res!512334) (not e!422275))))

(assert (=> b!757400 (= res!512334 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20529 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20529 a!3186))))))

(declare-fun b!757401 () Bool)

(declare-fun res!512332 () Bool)

(assert (=> b!757401 (=> (not res!512332) (not e!422272))))

(assert (=> b!757401 (= res!512332 (= (seekEntryOrOpen!0 lt!337181 lt!337171 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337181 lt!337171 mask!3328)))))

(declare-fun b!757402 () Bool)

(declare-fun e!422266 () Bool)

(assert (=> b!757402 (= e!422264 e!422266)))

(declare-fun res!512326 () Bool)

(assert (=> b!757402 (=> res!512326 e!422266)))

(assert (=> b!757402 (= res!512326 (not (= lt!337176 lt!337175)))))

(assert (=> b!757402 (= lt!337176 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20108 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757403 () Bool)

(declare-fun Unit!26183 () Unit!26180)

(assert (=> b!757403 (= e!422265 Unit!26183)))

(declare-fun b!757404 () Bool)

(assert (=> b!757404 (= e!422268 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20108 a!3186) j!159) a!3186 mask!3328) lt!337180))))

(declare-fun b!757405 () Bool)

(assert (=> b!757405 (= e!422266 e!422274)))

(declare-fun res!512328 () Bool)

(assert (=> b!757405 (=> res!512328 e!422274)))

(assert (=> b!757405 (= res!512328 (= lt!337170 lt!337181))))

(assert (=> b!757405 (= lt!337170 (select (store (arr!20108 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757406 () Bool)

(assert (=> b!757406 (= e!422268 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20108 a!3186) j!159) a!3186 mask!3328) (Found!7705 j!159)))))

(assert (= (and start!65798 res!512336) b!757385))

(assert (= (and b!757385 res!512337) b!757387))

(assert (= (and b!757387 res!512335) b!757395))

(assert (= (and b!757395 res!512329) b!757390))

(assert (= (and b!757390 res!512321) b!757388))

(assert (= (and b!757388 res!512330) b!757392))

(assert (= (and b!757392 res!512323) b!757397))

(assert (= (and b!757397 res!512320) b!757400))

(assert (= (and b!757400 res!512334) b!757398))

(assert (= (and b!757398 res!512324) b!757389))

(assert (= (and b!757389 res!512319) b!757393))

(assert (= (and b!757393 c!82914) b!757404))

(assert (= (and b!757393 (not c!82914)) b!757406))

(assert (= (and b!757393 res!512331) b!757386))

(assert (= (and b!757386 res!512327) b!757396))

(assert (= (and b!757396 res!512322) b!757399))

(assert (= (and b!757396 (not res!512325)) b!757402))

(assert (= (and b!757402 (not res!512326)) b!757405))

(assert (= (and b!757405 (not res!512328)) b!757391))

(assert (= (and b!757391 c!82913) b!757394))

(assert (= (and b!757391 (not c!82913)) b!757403))

(assert (= (and b!757391 res!512333) b!757401))

(assert (= (and b!757401 res!512332) b!757384))

(declare-fun m!704537 () Bool)

(assert (=> b!757389 m!704537))

(declare-fun m!704539 () Bool)

(assert (=> b!757404 m!704539))

(assert (=> b!757404 m!704539))

(declare-fun m!704541 () Bool)

(assert (=> b!757404 m!704541))

(assert (=> b!757402 m!704539))

(assert (=> b!757402 m!704539))

(declare-fun m!704543 () Bool)

(assert (=> b!757402 m!704543))

(assert (=> b!757387 m!704539))

(assert (=> b!757387 m!704539))

(declare-fun m!704545 () Bool)

(assert (=> b!757387 m!704545))

(assert (=> b!757398 m!704539))

(assert (=> b!757398 m!704539))

(declare-fun m!704547 () Bool)

(assert (=> b!757398 m!704547))

(assert (=> b!757398 m!704547))

(assert (=> b!757398 m!704539))

(declare-fun m!704549 () Bool)

(assert (=> b!757398 m!704549))

(declare-fun m!704551 () Bool)

(assert (=> b!757395 m!704551))

(declare-fun m!704553 () Bool)

(assert (=> b!757390 m!704553))

(declare-fun m!704555 () Bool)

(assert (=> b!757397 m!704555))

(assert (=> b!757399 m!704539))

(assert (=> b!757399 m!704539))

(declare-fun m!704557 () Bool)

(assert (=> b!757399 m!704557))

(declare-fun m!704559 () Bool)

(assert (=> b!757405 m!704559))

(declare-fun m!704561 () Bool)

(assert (=> b!757405 m!704561))

(declare-fun m!704563 () Bool)

(assert (=> b!757388 m!704563))

(assert (=> b!757396 m!704539))

(assert (=> b!757396 m!704539))

(declare-fun m!704565 () Bool)

(assert (=> b!757396 m!704565))

(declare-fun m!704567 () Bool)

(assert (=> b!757396 m!704567))

(declare-fun m!704569 () Bool)

(assert (=> b!757396 m!704569))

(declare-fun m!704571 () Bool)

(assert (=> b!757401 m!704571))

(declare-fun m!704573 () Bool)

(assert (=> b!757401 m!704573))

(declare-fun m!704575 () Bool)

(assert (=> start!65798 m!704575))

(declare-fun m!704577 () Bool)

(assert (=> start!65798 m!704577))

(declare-fun m!704579 () Bool)

(assert (=> b!757386 m!704579))

(declare-fun m!704581 () Bool)

(assert (=> b!757386 m!704581))

(declare-fun m!704583 () Bool)

(assert (=> b!757386 m!704583))

(assert (=> b!757386 m!704559))

(declare-fun m!704585 () Bool)

(assert (=> b!757386 m!704585))

(assert (=> b!757386 m!704579))

(assert (=> b!757406 m!704539))

(assert (=> b!757406 m!704539))

(assert (=> b!757406 m!704543))

(declare-fun m!704587 () Bool)

(assert (=> b!757392 m!704587))

(check-sat (not b!757395) (not b!757387) (not b!757404) (not b!757396) (not b!757402) (not b!757399) (not b!757401) (not start!65798) (not b!757398) (not b!757406) (not b!757390) (not b!757386) (not b!757388) (not b!757397) (not b!757392))
(check-sat)
