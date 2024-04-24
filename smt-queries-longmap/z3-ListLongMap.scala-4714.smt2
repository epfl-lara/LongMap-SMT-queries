; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65472 () Bool)

(assert start!65472)

(declare-fun b!743339 () Bool)

(declare-fun res!500074 () Bool)

(declare-fun e!415475 () Bool)

(assert (=> b!743339 (=> (not res!500074) (not e!415475))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41515 0))(
  ( (array!41516 (arr!19867 (Array (_ BitVec 32) (_ BitVec 64))) (size!20287 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41515)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743339 (= res!500074 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20287 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20287 a!3186))))))

(declare-fun b!743340 () Bool)

(declare-fun res!500087 () Bool)

(declare-fun e!415478 () Bool)

(assert (=> b!743340 (=> (not res!500087) (not e!415478))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743340 (= res!500087 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743341 () Bool)

(declare-fun e!415474 () Bool)

(declare-fun e!415476 () Bool)

(assert (=> b!743341 (= e!415474 e!415476)))

(declare-fun res!500078 () Bool)

(assert (=> b!743341 (=> (not res!500078) (not e!415476))))

(declare-datatypes ((SeekEntryResult!7423 0))(
  ( (MissingZero!7423 (index!32060 (_ BitVec 32))) (Found!7423 (index!32061 (_ BitVec 32))) (Intermediate!7423 (undefined!8235 Bool) (index!32062 (_ BitVec 32)) (x!63193 (_ BitVec 32))) (Undefined!7423) (MissingVacant!7423 (index!32063 (_ BitVec 32))) )
))
(declare-fun lt!330210 () SeekEntryResult!7423)

(declare-fun lt!330202 () SeekEntryResult!7423)

(assert (=> b!743341 (= res!500078 (= lt!330210 lt!330202))))

(declare-fun lt!330208 () array!41515)

(declare-fun lt!330205 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41515 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!743341 (= lt!330202 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330205 lt!330208 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743341 (= lt!330210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330205 mask!3328) lt!330205 lt!330208 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743341 (= lt!330205 (select (store (arr!19867 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743341 (= lt!330208 (array!41516 (store (arr!19867 a!3186) i!1173 k0!2102) (size!20287 a!3186)))))

(declare-fun b!743342 () Bool)

(declare-fun res!500088 () Bool)

(assert (=> b!743342 (=> (not res!500088) (not e!415478))))

(assert (=> b!743342 (= res!500088 (and (= (size!20287 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20287 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20287 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743343 () Bool)

(declare-fun e!415482 () Bool)

(declare-fun lt!330209 () SeekEntryResult!7423)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41515 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!743343 (= e!415482 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!330209))))

(declare-fun b!743344 () Bool)

(declare-fun e!415479 () Bool)

(assert (=> b!743344 (= e!415479 e!415482)))

(declare-fun res!500083 () Bool)

(assert (=> b!743344 (=> (not res!500083) (not e!415482))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41515 (_ BitVec 32)) SeekEntryResult!7423)

(assert (=> b!743344 (= res!500083 (= (seekEntryOrOpen!0 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!330209))))

(assert (=> b!743344 (= lt!330209 (Found!7423 j!159))))

(declare-fun b!743346 () Bool)

(declare-fun res!500089 () Bool)

(assert (=> b!743346 (=> (not res!500089) (not e!415474))))

(declare-fun e!415477 () Bool)

(assert (=> b!743346 (= res!500089 e!415477)))

(declare-fun c!82016 () Bool)

(assert (=> b!743346 (= c!82016 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743347 () Bool)

(declare-fun res!500082 () Bool)

(assert (=> b!743347 (=> (not res!500082) (not e!415475))))

(declare-datatypes ((List!13776 0))(
  ( (Nil!13773) (Cons!13772 (h!14850 (_ BitVec 64)) (t!20083 List!13776)) )
))
(declare-fun arrayNoDuplicates!0 (array!41515 (_ BitVec 32) List!13776) Bool)

(assert (=> b!743347 (= res!500082 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13773))))

(declare-fun b!743348 () Bool)

(declare-fun res!500085 () Bool)

(assert (=> b!743348 (=> (not res!500085) (not e!415474))))

(assert (=> b!743348 (= res!500085 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19867 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743349 () Bool)

(declare-fun res!500084 () Bool)

(assert (=> b!743349 (=> (not res!500084) (not e!415478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743349 (= res!500084 (validKeyInArray!0 (select (arr!19867 a!3186) j!159)))))

(declare-fun b!743350 () Bool)

(assert (=> b!743350 (= e!415477 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) (Found!7423 j!159)))))

(declare-fun b!743351 () Bool)

(assert (=> b!743351 (= e!415475 e!415474)))

(declare-fun res!500080 () Bool)

(assert (=> b!743351 (=> (not res!500080) (not e!415474))))

(declare-fun lt!330206 () SeekEntryResult!7423)

(assert (=> b!743351 (= res!500080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19867 a!3186) j!159) mask!3328) (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!330206))))

(assert (=> b!743351 (= lt!330206 (Intermediate!7423 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743352 () Bool)

(assert (=> b!743352 (= e!415477 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!330206))))

(declare-fun b!743353 () Bool)

(declare-fun e!415481 () Bool)

(assert (=> b!743353 (= e!415481 true)))

(declare-fun lt!330207 () SeekEntryResult!7423)

(assert (=> b!743353 (= lt!330207 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19867 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743354 () Bool)

(assert (=> b!743354 (= e!415476 (not e!415481))))

(declare-fun res!500079 () Bool)

(assert (=> b!743354 (=> res!500079 e!415481)))

(get-info :version)

(assert (=> b!743354 (= res!500079 (or (not ((_ is Intermediate!7423) lt!330202)) (bvslt x!1131 (x!63193 lt!330202)) (not (= x!1131 (x!63193 lt!330202))) (not (= index!1321 (index!32062 lt!330202)))))))

(assert (=> b!743354 e!415479))

(declare-fun res!500086 () Bool)

(assert (=> b!743354 (=> (not res!500086) (not e!415479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41515 (_ BitVec 32)) Bool)

(assert (=> b!743354 (= res!500086 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25405 0))(
  ( (Unit!25406) )
))
(declare-fun lt!330204 () Unit!25405)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25405)

(assert (=> b!743354 (= lt!330204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743345 () Bool)

(declare-fun res!500081 () Bool)

(assert (=> b!743345 (=> (not res!500081) (not e!415475))))

(assert (=> b!743345 (= res!500081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!500075 () Bool)

(assert (=> start!65472 (=> (not res!500075) (not e!415478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65472 (= res!500075 (validMask!0 mask!3328))))

(assert (=> start!65472 e!415478))

(assert (=> start!65472 true))

(declare-fun array_inv!15726 (array!41515) Bool)

(assert (=> start!65472 (array_inv!15726 a!3186)))

(declare-fun b!743355 () Bool)

(declare-fun res!500076 () Bool)

(assert (=> b!743355 (=> (not res!500076) (not e!415478))))

(assert (=> b!743355 (= res!500076 (validKeyInArray!0 k0!2102))))

(declare-fun b!743356 () Bool)

(assert (=> b!743356 (= e!415478 e!415475)))

(declare-fun res!500077 () Bool)

(assert (=> b!743356 (=> (not res!500077) (not e!415475))))

(declare-fun lt!330203 () SeekEntryResult!7423)

(assert (=> b!743356 (= res!500077 (or (= lt!330203 (MissingZero!7423 i!1173)) (= lt!330203 (MissingVacant!7423 i!1173))))))

(assert (=> b!743356 (= lt!330203 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65472 res!500075) b!743342))

(assert (= (and b!743342 res!500088) b!743349))

(assert (= (and b!743349 res!500084) b!743355))

(assert (= (and b!743355 res!500076) b!743340))

(assert (= (and b!743340 res!500087) b!743356))

(assert (= (and b!743356 res!500077) b!743345))

(assert (= (and b!743345 res!500081) b!743347))

(assert (= (and b!743347 res!500082) b!743339))

(assert (= (and b!743339 res!500074) b!743351))

(assert (= (and b!743351 res!500080) b!743348))

(assert (= (and b!743348 res!500085) b!743346))

(assert (= (and b!743346 c!82016) b!743352))

(assert (= (and b!743346 (not c!82016)) b!743350))

(assert (= (and b!743346 res!500089) b!743341))

(assert (= (and b!743341 res!500078) b!743354))

(assert (= (and b!743354 res!500086) b!743344))

(assert (= (and b!743344 res!500083) b!743343))

(assert (= (and b!743354 (not res!500079)) b!743353))

(declare-fun m!694593 () Bool)

(assert (=> b!743349 m!694593))

(assert (=> b!743349 m!694593))

(declare-fun m!694595 () Bool)

(assert (=> b!743349 m!694595))

(declare-fun m!694597 () Bool)

(assert (=> b!743356 m!694597))

(declare-fun m!694599 () Bool)

(assert (=> b!743347 m!694599))

(declare-fun m!694601 () Bool)

(assert (=> b!743341 m!694601))

(declare-fun m!694603 () Bool)

(assert (=> b!743341 m!694603))

(declare-fun m!694605 () Bool)

(assert (=> b!743341 m!694605))

(declare-fun m!694607 () Bool)

(assert (=> b!743341 m!694607))

(declare-fun m!694609 () Bool)

(assert (=> b!743341 m!694609))

(assert (=> b!743341 m!694601))

(assert (=> b!743350 m!694593))

(assert (=> b!743350 m!694593))

(declare-fun m!694611 () Bool)

(assert (=> b!743350 m!694611))

(assert (=> b!743344 m!694593))

(assert (=> b!743344 m!694593))

(declare-fun m!694613 () Bool)

(assert (=> b!743344 m!694613))

(assert (=> b!743353 m!694593))

(assert (=> b!743353 m!694593))

(assert (=> b!743353 m!694611))

(assert (=> b!743351 m!694593))

(assert (=> b!743351 m!694593))

(declare-fun m!694615 () Bool)

(assert (=> b!743351 m!694615))

(assert (=> b!743351 m!694615))

(assert (=> b!743351 m!694593))

(declare-fun m!694617 () Bool)

(assert (=> b!743351 m!694617))

(declare-fun m!694619 () Bool)

(assert (=> b!743354 m!694619))

(declare-fun m!694621 () Bool)

(assert (=> b!743354 m!694621))

(assert (=> b!743343 m!694593))

(assert (=> b!743343 m!694593))

(declare-fun m!694623 () Bool)

(assert (=> b!743343 m!694623))

(declare-fun m!694625 () Bool)

(assert (=> b!743345 m!694625))

(declare-fun m!694627 () Bool)

(assert (=> start!65472 m!694627))

(declare-fun m!694629 () Bool)

(assert (=> start!65472 m!694629))

(assert (=> b!743352 m!694593))

(assert (=> b!743352 m!694593))

(declare-fun m!694631 () Bool)

(assert (=> b!743352 m!694631))

(declare-fun m!694633 () Bool)

(assert (=> b!743340 m!694633))

(declare-fun m!694635 () Bool)

(assert (=> b!743355 m!694635))

(declare-fun m!694637 () Bool)

(assert (=> b!743348 m!694637))

(check-sat (not b!743353) (not b!743341) (not b!743352) (not start!65472) (not b!743345) (not b!743355) (not b!743347) (not b!743340) (not b!743351) (not b!743344) (not b!743349) (not b!743343) (not b!743350) (not b!743354) (not b!743356))
(check-sat)
