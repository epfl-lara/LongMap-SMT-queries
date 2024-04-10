; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65750 () Bool)

(assert start!65750)

(declare-fun b!755288 () Bool)

(declare-datatypes ((Unit!26080 0))(
  ( (Unit!26081) )
))
(declare-fun e!421205 () Unit!26080)

(declare-fun Unit!26082 () Unit!26080)

(assert (=> b!755288 (= e!421205 Unit!26082)))

(declare-fun b!755289 () Bool)

(declare-fun e!421204 () Bool)

(declare-fun e!421201 () Bool)

(assert (=> b!755289 (= e!421204 (not e!421201))))

(declare-fun res!510500 () Bool)

(assert (=> b!755289 (=> res!510500 e!421201)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7675 0))(
  ( (MissingZero!7675 (index!33068 (_ BitVec 32))) (Found!7675 (index!33069 (_ BitVec 32))) (Intermediate!7675 (undefined!8487 Bool) (index!33070 (_ BitVec 32)) (x!63969 (_ BitVec 32))) (Undefined!7675) (MissingVacant!7675 (index!33071 (_ BitVec 32))) )
))
(declare-fun lt!336196 () SeekEntryResult!7675)

(assert (=> b!755289 (= res!510500 (or (not (is-Intermediate!7675 lt!336196)) (bvslt x!1131 (x!63969 lt!336196)) (not (= x!1131 (x!63969 lt!336196))) (not (= index!1321 (index!33070 lt!336196)))))))

(declare-fun e!421202 () Bool)

(assert (=> b!755289 e!421202))

(declare-fun res!510492 () Bool)

(assert (=> b!755289 (=> (not res!510492) (not e!421202))))

(declare-fun lt!336193 () SeekEntryResult!7675)

(declare-fun lt!336186 () SeekEntryResult!7675)

(assert (=> b!755289 (= res!510492 (= lt!336193 lt!336186))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!755289 (= lt!336186 (Found!7675 j!159))))

(declare-datatypes ((array!41923 0))(
  ( (array!41924 (arr!20075 (Array (_ BitVec 32) (_ BitVec 64))) (size!20496 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41923)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41923 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!755289 (= lt!336193 (seekEntryOrOpen!0 (select (arr!20075 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41923 (_ BitVec 32)) Bool)

(assert (=> b!755289 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336190 () Unit!26080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26080)

(assert (=> b!755289 (= lt!336190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755290 () Bool)

(declare-fun e!421198 () Bool)

(declare-fun e!421203 () Bool)

(assert (=> b!755290 (= e!421198 e!421203)))

(declare-fun res!510501 () Bool)

(assert (=> b!755290 (=> (not res!510501) (not e!421203))))

(declare-fun lt!336192 () SeekEntryResult!7675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41923 (_ BitVec 32)) SeekEntryResult!7675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755290 (= res!510501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20075 a!3186) j!159) mask!3328) (select (arr!20075 a!3186) j!159) a!3186 mask!3328) lt!336192))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755290 (= lt!336192 (Intermediate!7675 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755291 () Bool)

(declare-fun res!510496 () Bool)

(assert (=> b!755291 (=> (not res!510496) (not e!421198))))

(declare-datatypes ((List!14077 0))(
  ( (Nil!14074) (Cons!14073 (h!15145 (_ BitVec 64)) (t!20392 List!14077)) )
))
(declare-fun arrayNoDuplicates!0 (array!41923 (_ BitVec 32) List!14077) Bool)

(assert (=> b!755291 (= res!510496 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14074))))

(declare-fun b!755292 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41923 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!755292 (= e!421202 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20075 a!3186) j!159) a!3186 mask!3328) lt!336186))))

(declare-fun b!755293 () Bool)

(declare-fun res!510499 () Bool)

(declare-fun e!421199 () Bool)

(assert (=> b!755293 (=> (not res!510499) (not e!421199))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755293 (= res!510499 (and (= (size!20496 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20496 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20496 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755294 () Bool)

(declare-fun res!510498 () Bool)

(assert (=> b!755294 (=> (not res!510498) (not e!421199))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755294 (= res!510498 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755295 () Bool)

(declare-fun res!510502 () Bool)

(declare-fun e!421200 () Bool)

(assert (=> b!755295 (=> (not res!510502) (not e!421200))))

(declare-fun lt!336189 () (_ BitVec 64))

(declare-fun lt!336194 () array!41923)

(assert (=> b!755295 (= res!510502 (= (seekEntryOrOpen!0 lt!336189 lt!336194 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336189 lt!336194 mask!3328)))))

(declare-fun b!755296 () Bool)

(declare-fun res!510495 () Bool)

(assert (=> b!755296 (=> (not res!510495) (not e!421203))))

(assert (=> b!755296 (= res!510495 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20075 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755297 () Bool)

(declare-fun e!421195 () Bool)

(declare-fun e!421194 () Bool)

(assert (=> b!755297 (= e!421195 e!421194)))

(declare-fun res!510504 () Bool)

(assert (=> b!755297 (=> res!510504 e!421194)))

(declare-fun lt!336197 () (_ BitVec 64))

(assert (=> b!755297 (= res!510504 (= lt!336197 lt!336189))))

(assert (=> b!755297 (= lt!336197 (select (store (arr!20075 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755298 () Bool)

(declare-fun Unit!26083 () Unit!26080)

(assert (=> b!755298 (= e!421205 Unit!26083)))

(assert (=> b!755298 false))

(declare-fun b!755299 () Bool)

(assert (=> b!755299 (= e!421201 e!421195)))

(declare-fun res!510509 () Bool)

(assert (=> b!755299 (=> res!510509 e!421195)))

(declare-fun lt!336187 () SeekEntryResult!7675)

(assert (=> b!755299 (= res!510509 (not (= lt!336187 lt!336186)))))

(assert (=> b!755299 (= lt!336187 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20075 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755300 () Bool)

(assert (=> b!755300 (= e!421200 (= lt!336193 lt!336187))))

(declare-fun b!755301 () Bool)

(assert (=> b!755301 (= e!421194 true)))

(assert (=> b!755301 e!421200))

(declare-fun res!510491 () Bool)

(assert (=> b!755301 (=> (not res!510491) (not e!421200))))

(assert (=> b!755301 (= res!510491 (= lt!336197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336191 () Unit!26080)

(assert (=> b!755301 (= lt!336191 e!421205)))

(declare-fun c!82779 () Bool)

(assert (=> b!755301 (= c!82779 (= lt!336197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755302 () Bool)

(declare-fun res!510497 () Bool)

(assert (=> b!755302 (=> (not res!510497) (not e!421203))))

(declare-fun e!421197 () Bool)

(assert (=> b!755302 (= res!510497 e!421197)))

(declare-fun c!82780 () Bool)

(assert (=> b!755302 (= c!82780 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755303 () Bool)

(assert (=> b!755303 (= e!421197 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20075 a!3186) j!159) a!3186 mask!3328) lt!336192))))

(declare-fun b!755304 () Bool)

(declare-fun res!510493 () Bool)

(assert (=> b!755304 (=> (not res!510493) (not e!421199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755304 (= res!510493 (validKeyInArray!0 (select (arr!20075 a!3186) j!159)))))

(declare-fun b!755305 () Bool)

(assert (=> b!755305 (= e!421199 e!421198)))

(declare-fun res!510507 () Bool)

(assert (=> b!755305 (=> (not res!510507) (not e!421198))))

(declare-fun lt!336195 () SeekEntryResult!7675)

(assert (=> b!755305 (= res!510507 (or (= lt!336195 (MissingZero!7675 i!1173)) (= lt!336195 (MissingVacant!7675 i!1173))))))

(assert (=> b!755305 (= lt!336195 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755306 () Bool)

(declare-fun res!510503 () Bool)

(assert (=> b!755306 (=> (not res!510503) (not e!421199))))

(assert (=> b!755306 (= res!510503 (validKeyInArray!0 k!2102))))

(declare-fun b!755307 () Bool)

(declare-fun res!510505 () Bool)

(assert (=> b!755307 (=> (not res!510505) (not e!421198))))

(assert (=> b!755307 (= res!510505 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20496 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20496 a!3186))))))

(declare-fun b!755308 () Bool)

(declare-fun res!510494 () Bool)

(assert (=> b!755308 (=> (not res!510494) (not e!421198))))

(assert (=> b!755308 (= res!510494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755309 () Bool)

(assert (=> b!755309 (= e!421197 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20075 a!3186) j!159) a!3186 mask!3328) (Found!7675 j!159)))))

(declare-fun b!755310 () Bool)

(assert (=> b!755310 (= e!421203 e!421204)))

(declare-fun res!510508 () Bool)

(assert (=> b!755310 (=> (not res!510508) (not e!421204))))

(declare-fun lt!336188 () SeekEntryResult!7675)

(assert (=> b!755310 (= res!510508 (= lt!336188 lt!336196))))

(assert (=> b!755310 (= lt!336196 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336189 lt!336194 mask!3328))))

(assert (=> b!755310 (= lt!336188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336189 mask!3328) lt!336189 lt!336194 mask!3328))))

(assert (=> b!755310 (= lt!336189 (select (store (arr!20075 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755310 (= lt!336194 (array!41924 (store (arr!20075 a!3186) i!1173 k!2102) (size!20496 a!3186)))))

(declare-fun res!510506 () Bool)

(assert (=> start!65750 (=> (not res!510506) (not e!421199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65750 (= res!510506 (validMask!0 mask!3328))))

(assert (=> start!65750 e!421199))

(assert (=> start!65750 true))

(declare-fun array_inv!15871 (array!41923) Bool)

(assert (=> start!65750 (array_inv!15871 a!3186)))

(assert (= (and start!65750 res!510506) b!755293))

(assert (= (and b!755293 res!510499) b!755304))

(assert (= (and b!755304 res!510493) b!755306))

(assert (= (and b!755306 res!510503) b!755294))

(assert (= (and b!755294 res!510498) b!755305))

(assert (= (and b!755305 res!510507) b!755308))

(assert (= (and b!755308 res!510494) b!755291))

(assert (= (and b!755291 res!510496) b!755307))

(assert (= (and b!755307 res!510505) b!755290))

(assert (= (and b!755290 res!510501) b!755296))

(assert (= (and b!755296 res!510495) b!755302))

(assert (= (and b!755302 c!82780) b!755303))

(assert (= (and b!755302 (not c!82780)) b!755309))

(assert (= (and b!755302 res!510497) b!755310))

(assert (= (and b!755310 res!510508) b!755289))

(assert (= (and b!755289 res!510492) b!755292))

(assert (= (and b!755289 (not res!510500)) b!755299))

(assert (= (and b!755299 (not res!510509)) b!755297))

(assert (= (and b!755297 (not res!510504)) b!755301))

(assert (= (and b!755301 c!82779) b!755298))

(assert (= (and b!755301 (not c!82779)) b!755288))

(assert (= (and b!755301 res!510491) b!755295))

(assert (= (and b!755295 res!510502) b!755300))

(declare-fun m!703527 () Bool)

(assert (=> b!755304 m!703527))

(assert (=> b!755304 m!703527))

(declare-fun m!703529 () Bool)

(assert (=> b!755304 m!703529))

(declare-fun m!703531 () Bool)

(assert (=> b!755295 m!703531))

(declare-fun m!703533 () Bool)

(assert (=> b!755295 m!703533))

(assert (=> b!755289 m!703527))

(assert (=> b!755289 m!703527))

(declare-fun m!703535 () Bool)

(assert (=> b!755289 m!703535))

(declare-fun m!703537 () Bool)

(assert (=> b!755289 m!703537))

(declare-fun m!703539 () Bool)

(assert (=> b!755289 m!703539))

(assert (=> b!755290 m!703527))

(assert (=> b!755290 m!703527))

(declare-fun m!703541 () Bool)

(assert (=> b!755290 m!703541))

(assert (=> b!755290 m!703541))

(assert (=> b!755290 m!703527))

(declare-fun m!703543 () Bool)

(assert (=> b!755290 m!703543))

(assert (=> b!755309 m!703527))

(assert (=> b!755309 m!703527))

(declare-fun m!703545 () Bool)

(assert (=> b!755309 m!703545))

(assert (=> b!755299 m!703527))

(assert (=> b!755299 m!703527))

(assert (=> b!755299 m!703545))

(assert (=> b!755303 m!703527))

(assert (=> b!755303 m!703527))

(declare-fun m!703547 () Bool)

(assert (=> b!755303 m!703547))

(assert (=> b!755292 m!703527))

(assert (=> b!755292 m!703527))

(declare-fun m!703549 () Bool)

(assert (=> b!755292 m!703549))

(declare-fun m!703551 () Bool)

(assert (=> b!755305 m!703551))

(declare-fun m!703553 () Bool)

(assert (=> b!755306 m!703553))

(declare-fun m!703555 () Bool)

(assert (=> start!65750 m!703555))

(declare-fun m!703557 () Bool)

(assert (=> start!65750 m!703557))

(declare-fun m!703559 () Bool)

(assert (=> b!755296 m!703559))

(declare-fun m!703561 () Bool)

(assert (=> b!755308 m!703561))

(declare-fun m!703563 () Bool)

(assert (=> b!755297 m!703563))

(declare-fun m!703565 () Bool)

(assert (=> b!755297 m!703565))

(declare-fun m!703567 () Bool)

(assert (=> b!755291 m!703567))

(declare-fun m!703569 () Bool)

(assert (=> b!755294 m!703569))

(declare-fun m!703571 () Bool)

(assert (=> b!755310 m!703571))

(assert (=> b!755310 m!703563))

(declare-fun m!703573 () Bool)

(assert (=> b!755310 m!703573))

(declare-fun m!703575 () Bool)

(assert (=> b!755310 m!703575))

(assert (=> b!755310 m!703573))

(declare-fun m!703577 () Bool)

(assert (=> b!755310 m!703577))

(push 1)

