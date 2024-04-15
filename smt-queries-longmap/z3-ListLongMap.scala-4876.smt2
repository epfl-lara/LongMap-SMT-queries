; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67148 () Bool)

(assert start!67148)

(declare-fun b!776346 () Bool)

(declare-fun res!525273 () Bool)

(declare-fun e!431991 () Bool)

(assert (=> b!776346 (=> (not res!525273) (not e!431991))))

(declare-fun e!431995 () Bool)

(assert (=> b!776346 (= res!525273 e!431995)))

(declare-fun c!85938 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776346 (= c!85938 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776347 () Bool)

(declare-fun res!525284 () Bool)

(assert (=> b!776347 (=> (not res!525284) (not e!431991))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42522 0))(
  ( (array!42523 (arr!20357 (Array (_ BitVec 32) (_ BitVec 64))) (size!20778 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42522)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776347 (= res!525284 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20357 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776348 () Bool)

(declare-fun e!431994 () Bool)

(assert (=> b!776348 (= e!431991 e!431994)))

(declare-fun res!525283 () Bool)

(assert (=> b!776348 (=> (not res!525283) (not e!431994))))

(declare-datatypes ((SeekEntryResult!7954 0))(
  ( (MissingZero!7954 (index!34184 (_ BitVec 32))) (Found!7954 (index!34185 (_ BitVec 32))) (Intermediate!7954 (undefined!8766 Bool) (index!34186 (_ BitVec 32)) (x!65132 (_ BitVec 32))) (Undefined!7954) (MissingVacant!7954 (index!34187 (_ BitVec 32))) )
))
(declare-fun lt!345759 () SeekEntryResult!7954)

(declare-fun lt!345766 () SeekEntryResult!7954)

(assert (=> b!776348 (= res!525283 (= lt!345759 lt!345766))))

(declare-fun lt!345765 () array!42522)

(declare-fun lt!345764 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42522 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!776348 (= lt!345766 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345764 lt!345765 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776348 (= lt!345759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345764 mask!3328) lt!345764 lt!345765 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776348 (= lt!345764 (select (store (arr!20357 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776348 (= lt!345765 (array!42523 (store (arr!20357 a!3186) i!1173 k0!2102) (size!20778 a!3186)))))

(declare-fun b!776349 () Bool)

(declare-fun res!525279 () Bool)

(declare-fun e!431998 () Bool)

(assert (=> b!776349 (=> (not res!525279) (not e!431998))))

(assert (=> b!776349 (= res!525279 (and (= (size!20778 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20778 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20778 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!525282 () Bool)

(assert (=> start!67148 (=> (not res!525282) (not e!431998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67148 (= res!525282 (validMask!0 mask!3328))))

(assert (=> start!67148 e!431998))

(assert (=> start!67148 true))

(declare-fun array_inv!16240 (array!42522) Bool)

(assert (=> start!67148 (array_inv!16240 a!3186)))

(declare-fun b!776350 () Bool)

(declare-fun res!525277 () Bool)

(assert (=> b!776350 (=> (not res!525277) (not e!431998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776350 (= res!525277 (validKeyInArray!0 (select (arr!20357 a!3186) j!159)))))

(declare-fun b!776351 () Bool)

(declare-fun res!525272 () Bool)

(assert (=> b!776351 (=> (not res!525272) (not e!431998))))

(declare-fun arrayContainsKey!0 (array!42522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776351 (= res!525272 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776352 () Bool)

(declare-fun res!525270 () Bool)

(assert (=> b!776352 (=> (not res!525270) (not e!431998))))

(assert (=> b!776352 (= res!525270 (validKeyInArray!0 k0!2102))))

(declare-fun b!776353 () Bool)

(declare-fun e!431996 () Bool)

(assert (=> b!776353 (= e!431994 (not e!431996))))

(declare-fun res!525280 () Bool)

(assert (=> b!776353 (=> res!525280 e!431996)))

(get-info :version)

(assert (=> b!776353 (= res!525280 (or (not ((_ is Intermediate!7954) lt!345766)) (bvslt x!1131 (x!65132 lt!345766)) (not (= x!1131 (x!65132 lt!345766))) (not (= index!1321 (index!34186 lt!345766)))))))

(declare-fun e!431992 () Bool)

(assert (=> b!776353 e!431992))

(declare-fun res!525274 () Bool)

(assert (=> b!776353 (=> (not res!525274) (not e!431992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42522 (_ BitVec 32)) Bool)

(assert (=> b!776353 (= res!525274 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26774 0))(
  ( (Unit!26775) )
))
(declare-fun lt!345762 () Unit!26774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26774)

(assert (=> b!776353 (= lt!345762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776354 () Bool)

(declare-fun res!525271 () Bool)

(declare-fun e!431993 () Bool)

(assert (=> b!776354 (=> (not res!525271) (not e!431993))))

(assert (=> b!776354 (= res!525271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776355 () Bool)

(declare-fun lt!345760 () SeekEntryResult!7954)

(declare-fun e!431990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42522 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!776355 (= e!431990 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345760))))

(declare-fun b!776356 () Bool)

(assert (=> b!776356 (= e!431992 e!431990)))

(declare-fun res!525285 () Bool)

(assert (=> b!776356 (=> (not res!525285) (not e!431990))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42522 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!776356 (= res!525285 (= (seekEntryOrOpen!0 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345760))))

(assert (=> b!776356 (= lt!345760 (Found!7954 j!159))))

(declare-fun b!776357 () Bool)

(assert (=> b!776357 (= e!431995 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) (Found!7954 j!159)))))

(declare-fun b!776358 () Bool)

(declare-fun res!525278 () Bool)

(assert (=> b!776358 (=> (not res!525278) (not e!431993))))

(assert (=> b!776358 (= res!525278 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20778 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20778 a!3186))))))

(declare-fun b!776359 () Bool)

(declare-fun res!525281 () Bool)

(assert (=> b!776359 (=> (not res!525281) (not e!431993))))

(declare-datatypes ((List!14398 0))(
  ( (Nil!14395) (Cons!14394 (h!15502 (_ BitVec 64)) (t!20704 List!14398)) )
))
(declare-fun arrayNoDuplicates!0 (array!42522 (_ BitVec 32) List!14398) Bool)

(assert (=> b!776359 (= res!525281 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14395))))

(declare-fun b!776360 () Bool)

(assert (=> b!776360 (= e!431998 e!431993)))

(declare-fun res!525276 () Bool)

(assert (=> b!776360 (=> (not res!525276) (not e!431993))))

(declare-fun lt!345761 () SeekEntryResult!7954)

(assert (=> b!776360 (= res!525276 (or (= lt!345761 (MissingZero!7954 i!1173)) (= lt!345761 (MissingVacant!7954 i!1173))))))

(assert (=> b!776360 (= lt!345761 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776361 () Bool)

(assert (=> b!776361 (= e!431996 true)))

(declare-fun lt!345763 () SeekEntryResult!7954)

(assert (=> b!776361 (= lt!345763 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20357 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776362 () Bool)

(assert (=> b!776362 (= e!431993 e!431991)))

(declare-fun res!525275 () Bool)

(assert (=> b!776362 (=> (not res!525275) (not e!431991))))

(declare-fun lt!345767 () SeekEntryResult!7954)

(assert (=> b!776362 (= res!525275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20357 a!3186) j!159) mask!3328) (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345767))))

(assert (=> b!776362 (= lt!345767 (Intermediate!7954 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776363 () Bool)

(assert (=> b!776363 (= e!431995 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345767))))

(assert (= (and start!67148 res!525282) b!776349))

(assert (= (and b!776349 res!525279) b!776350))

(assert (= (and b!776350 res!525277) b!776352))

(assert (= (and b!776352 res!525270) b!776351))

(assert (= (and b!776351 res!525272) b!776360))

(assert (= (and b!776360 res!525276) b!776354))

(assert (= (and b!776354 res!525271) b!776359))

(assert (= (and b!776359 res!525281) b!776358))

(assert (= (and b!776358 res!525278) b!776362))

(assert (= (and b!776362 res!525275) b!776347))

(assert (= (and b!776347 res!525284) b!776346))

(assert (= (and b!776346 c!85938) b!776363))

(assert (= (and b!776346 (not c!85938)) b!776357))

(assert (= (and b!776346 res!525273) b!776348))

(assert (= (and b!776348 res!525283) b!776353))

(assert (= (and b!776353 res!525274) b!776356))

(assert (= (and b!776356 res!525285) b!776355))

(assert (= (and b!776353 (not res!525280)) b!776361))

(declare-fun m!719895 () Bool)

(assert (=> start!67148 m!719895))

(declare-fun m!719897 () Bool)

(assert (=> start!67148 m!719897))

(declare-fun m!719899 () Bool)

(assert (=> b!776361 m!719899))

(assert (=> b!776361 m!719899))

(declare-fun m!719901 () Bool)

(assert (=> b!776361 m!719901))

(declare-fun m!719903 () Bool)

(assert (=> b!776347 m!719903))

(assert (=> b!776355 m!719899))

(assert (=> b!776355 m!719899))

(declare-fun m!719905 () Bool)

(assert (=> b!776355 m!719905))

(declare-fun m!719907 () Bool)

(assert (=> b!776354 m!719907))

(declare-fun m!719909 () Bool)

(assert (=> b!776348 m!719909))

(declare-fun m!719911 () Bool)

(assert (=> b!776348 m!719911))

(declare-fun m!719913 () Bool)

(assert (=> b!776348 m!719913))

(declare-fun m!719915 () Bool)

(assert (=> b!776348 m!719915))

(assert (=> b!776348 m!719915))

(declare-fun m!719917 () Bool)

(assert (=> b!776348 m!719917))

(assert (=> b!776357 m!719899))

(assert (=> b!776357 m!719899))

(assert (=> b!776357 m!719901))

(declare-fun m!719919 () Bool)

(assert (=> b!776353 m!719919))

(declare-fun m!719921 () Bool)

(assert (=> b!776353 m!719921))

(declare-fun m!719923 () Bool)

(assert (=> b!776351 m!719923))

(assert (=> b!776356 m!719899))

(assert (=> b!776356 m!719899))

(declare-fun m!719925 () Bool)

(assert (=> b!776356 m!719925))

(declare-fun m!719927 () Bool)

(assert (=> b!776359 m!719927))

(assert (=> b!776350 m!719899))

(assert (=> b!776350 m!719899))

(declare-fun m!719929 () Bool)

(assert (=> b!776350 m!719929))

(declare-fun m!719931 () Bool)

(assert (=> b!776360 m!719931))

(assert (=> b!776362 m!719899))

(assert (=> b!776362 m!719899))

(declare-fun m!719933 () Bool)

(assert (=> b!776362 m!719933))

(assert (=> b!776362 m!719933))

(assert (=> b!776362 m!719899))

(declare-fun m!719935 () Bool)

(assert (=> b!776362 m!719935))

(assert (=> b!776363 m!719899))

(assert (=> b!776363 m!719899))

(declare-fun m!719937 () Bool)

(assert (=> b!776363 m!719937))

(declare-fun m!719939 () Bool)

(assert (=> b!776352 m!719939))

(check-sat (not b!776350) (not b!776360) (not b!776359) (not b!776363) (not b!776361) (not b!776354) (not b!776348) (not b!776355) (not b!776351) (not b!776356) (not b!776357) (not start!67148) (not b!776353) (not b!776362) (not b!776352))
(check-sat)
