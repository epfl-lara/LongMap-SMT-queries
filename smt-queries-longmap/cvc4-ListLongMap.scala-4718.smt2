; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65372 () Bool)

(assert start!65372)

(declare-fun b!743429 () Bool)

(declare-fun e!415381 () Bool)

(assert (=> b!743429 (= e!415381 true)))

(declare-datatypes ((array!41545 0))(
  ( (array!41546 (arr!19886 (Array (_ BitVec 32) (_ BitVec 64))) (size!20307 (_ BitVec 32))) )
))
(declare-fun lt!330252 () array!41545)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!330251 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7486 0))(
  ( (MissingZero!7486 (index!32312 (_ BitVec 32))) (Found!7486 (index!32313 (_ BitVec 32))) (Intermediate!7486 (undefined!8298 Bool) (index!32314 (_ BitVec 32)) (x!63276 (_ BitVec 32))) (Undefined!7486) (MissingVacant!7486 (index!32315 (_ BitVec 32))) )
))
(declare-fun lt!330254 () SeekEntryResult!7486)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41545 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!743429 (= lt!330254 (seekEntryOrOpen!0 lt!330251 lt!330252 mask!3328))))

(declare-fun b!743430 () Bool)

(declare-fun e!415380 () Bool)

(declare-fun e!415375 () Bool)

(assert (=> b!743430 (= e!415380 e!415375)))

(declare-fun res!500533 () Bool)

(assert (=> b!743430 (=> (not res!500533) (not e!415375))))

(declare-fun lt!330255 () SeekEntryResult!7486)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743430 (= res!500533 (or (= lt!330255 (MissingZero!7486 i!1173)) (= lt!330255 (MissingVacant!7486 i!1173))))))

(declare-fun a!3186 () array!41545)

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!743430 (= lt!330255 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743431 () Bool)

(declare-fun e!415382 () Bool)

(declare-fun e!415377 () Bool)

(assert (=> b!743431 (= e!415382 e!415377)))

(declare-fun res!500526 () Bool)

(assert (=> b!743431 (=> (not res!500526) (not e!415377))))

(declare-fun lt!330256 () SeekEntryResult!7486)

(declare-fun lt!330250 () SeekEntryResult!7486)

(assert (=> b!743431 (= res!500526 (= lt!330256 lt!330250))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41545 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!743431 (= lt!330250 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330251 lt!330252 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743431 (= lt!330256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330251 mask!3328) lt!330251 lt!330252 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!743431 (= lt!330251 (select (store (arr!19886 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743431 (= lt!330252 (array!41546 (store (arr!19886 a!3186) i!1173 k!2102) (size!20307 a!3186)))))

(declare-fun res!500535 () Bool)

(assert (=> start!65372 (=> (not res!500535) (not e!415380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65372 (= res!500535 (validMask!0 mask!3328))))

(assert (=> start!65372 e!415380))

(assert (=> start!65372 true))

(declare-fun array_inv!15682 (array!41545) Bool)

(assert (=> start!65372 (array_inv!15682 a!3186)))

(declare-fun b!743432 () Bool)

(declare-fun res!500528 () Bool)

(assert (=> b!743432 (=> (not res!500528) (not e!415375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41545 (_ BitVec 32)) Bool)

(assert (=> b!743432 (= res!500528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743433 () Bool)

(declare-fun res!500525 () Bool)

(assert (=> b!743433 (=> (not res!500525) (not e!415380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743433 (= res!500525 (validKeyInArray!0 (select (arr!19886 a!3186) j!159)))))

(declare-fun b!743434 () Bool)

(declare-fun res!500521 () Bool)

(assert (=> b!743434 (=> (not res!500521) (not e!415375))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743434 (= res!500521 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20307 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20307 a!3186))))))

(declare-fun b!743435 () Bool)

(declare-fun res!500536 () Bool)

(assert (=> b!743435 (=> res!500536 e!415381)))

(assert (=> b!743435 (= res!500536 (or (not (= (select (store (arr!19886 a!3186) i!1173 k!2102) index!1321) lt!330251)) (undefined!8298 lt!330250)))))

(declare-fun b!743436 () Bool)

(declare-fun res!500529 () Bool)

(assert (=> b!743436 (=> (not res!500529) (not e!415382))))

(declare-fun e!415379 () Bool)

(assert (=> b!743436 (= res!500529 e!415379)))

(declare-fun c!81835 () Bool)

(assert (=> b!743436 (= c!81835 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743437 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41545 (_ BitVec 32)) SeekEntryResult!7486)

(assert (=> b!743437 (= e!415379 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) (Found!7486 j!159)))))

(declare-fun b!743438 () Bool)

(declare-fun res!500531 () Bool)

(assert (=> b!743438 (=> (not res!500531) (not e!415380))))

(declare-fun arrayContainsKey!0 (array!41545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743438 (= res!500531 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743439 () Bool)

(declare-fun e!415376 () Bool)

(declare-fun e!415374 () Bool)

(assert (=> b!743439 (= e!415376 e!415374)))

(declare-fun res!500520 () Bool)

(assert (=> b!743439 (=> (not res!500520) (not e!415374))))

(declare-fun lt!330257 () SeekEntryResult!7486)

(assert (=> b!743439 (= res!500520 (= (seekEntryOrOpen!0 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330257))))

(assert (=> b!743439 (= lt!330257 (Found!7486 j!159))))

(declare-fun b!743440 () Bool)

(declare-fun res!500530 () Bool)

(assert (=> b!743440 (=> (not res!500530) (not e!415382))))

(assert (=> b!743440 (= res!500530 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19886 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743441 () Bool)

(declare-fun res!500522 () Bool)

(assert (=> b!743441 (=> (not res!500522) (not e!415375))))

(declare-datatypes ((List!13888 0))(
  ( (Nil!13885) (Cons!13884 (h!14956 (_ BitVec 64)) (t!20203 List!13888)) )
))
(declare-fun arrayNoDuplicates!0 (array!41545 (_ BitVec 32) List!13888) Bool)

(assert (=> b!743441 (= res!500522 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13885))))

(declare-fun b!743442 () Bool)

(assert (=> b!743442 (= e!415377 (not e!415381))))

(declare-fun res!500523 () Bool)

(assert (=> b!743442 (=> res!500523 e!415381)))

(assert (=> b!743442 (= res!500523 (or (not (is-Intermediate!7486 lt!330250)) (bvslt x!1131 (x!63276 lt!330250)) (not (= x!1131 (x!63276 lt!330250))) (not (= index!1321 (index!32314 lt!330250)))))))

(assert (=> b!743442 e!415376))

(declare-fun res!500527 () Bool)

(assert (=> b!743442 (=> (not res!500527) (not e!415376))))

(assert (=> b!743442 (= res!500527 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25452 0))(
  ( (Unit!25453) )
))
(declare-fun lt!330253 () Unit!25452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25452)

(assert (=> b!743442 (= lt!330253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743443 () Bool)

(assert (=> b!743443 (= e!415374 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330257))))

(declare-fun b!743444 () Bool)

(declare-fun res!500524 () Bool)

(assert (=> b!743444 (=> (not res!500524) (not e!415380))))

(assert (=> b!743444 (= res!500524 (and (= (size!20307 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20307 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20307 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743445 () Bool)

(declare-fun res!500532 () Bool)

(assert (=> b!743445 (=> res!500532 e!415381)))

(assert (=> b!743445 (= res!500532 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) (Found!7486 j!159))))))

(declare-fun b!743446 () Bool)

(declare-fun lt!330249 () SeekEntryResult!7486)

(assert (=> b!743446 (= e!415379 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330249))))

(declare-fun b!743447 () Bool)

(assert (=> b!743447 (= e!415375 e!415382)))

(declare-fun res!500534 () Bool)

(assert (=> b!743447 (=> (not res!500534) (not e!415382))))

(assert (=> b!743447 (= res!500534 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19886 a!3186) j!159) mask!3328) (select (arr!19886 a!3186) j!159) a!3186 mask!3328) lt!330249))))

(assert (=> b!743447 (= lt!330249 (Intermediate!7486 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743448 () Bool)

(declare-fun res!500537 () Bool)

(assert (=> b!743448 (=> (not res!500537) (not e!415380))))

(assert (=> b!743448 (= res!500537 (validKeyInArray!0 k!2102))))

(assert (= (and start!65372 res!500535) b!743444))

(assert (= (and b!743444 res!500524) b!743433))

(assert (= (and b!743433 res!500525) b!743448))

(assert (= (and b!743448 res!500537) b!743438))

(assert (= (and b!743438 res!500531) b!743430))

(assert (= (and b!743430 res!500533) b!743432))

(assert (= (and b!743432 res!500528) b!743441))

(assert (= (and b!743441 res!500522) b!743434))

(assert (= (and b!743434 res!500521) b!743447))

(assert (= (and b!743447 res!500534) b!743440))

(assert (= (and b!743440 res!500530) b!743436))

(assert (= (and b!743436 c!81835) b!743446))

(assert (= (and b!743436 (not c!81835)) b!743437))

(assert (= (and b!743436 res!500529) b!743431))

(assert (= (and b!743431 res!500526) b!743442))

(assert (= (and b!743442 res!500527) b!743439))

(assert (= (and b!743439 res!500520) b!743443))

(assert (= (and b!743442 (not res!500523)) b!743445))

(assert (= (and b!743445 (not res!500532)) b!743435))

(assert (= (and b!743435 (not res!500536)) b!743429))

(declare-fun m!694121 () Bool)

(assert (=> b!743439 m!694121))

(assert (=> b!743439 m!694121))

(declare-fun m!694123 () Bool)

(assert (=> b!743439 m!694123))

(assert (=> b!743443 m!694121))

(assert (=> b!743443 m!694121))

(declare-fun m!694125 () Bool)

(assert (=> b!743443 m!694125))

(assert (=> b!743437 m!694121))

(assert (=> b!743437 m!694121))

(declare-fun m!694127 () Bool)

(assert (=> b!743437 m!694127))

(declare-fun m!694129 () Bool)

(assert (=> start!65372 m!694129))

(declare-fun m!694131 () Bool)

(assert (=> start!65372 m!694131))

(declare-fun m!694133 () Bool)

(assert (=> b!743435 m!694133))

(declare-fun m!694135 () Bool)

(assert (=> b!743435 m!694135))

(declare-fun m!694137 () Bool)

(assert (=> b!743448 m!694137))

(declare-fun m!694139 () Bool)

(assert (=> b!743429 m!694139))

(declare-fun m!694141 () Bool)

(assert (=> b!743430 m!694141))

(assert (=> b!743447 m!694121))

(assert (=> b!743447 m!694121))

(declare-fun m!694143 () Bool)

(assert (=> b!743447 m!694143))

(assert (=> b!743447 m!694143))

(assert (=> b!743447 m!694121))

(declare-fun m!694145 () Bool)

(assert (=> b!743447 m!694145))

(assert (=> b!743433 m!694121))

(assert (=> b!743433 m!694121))

(declare-fun m!694147 () Bool)

(assert (=> b!743433 m!694147))

(declare-fun m!694149 () Bool)

(assert (=> b!743432 m!694149))

(declare-fun m!694151 () Bool)

(assert (=> b!743442 m!694151))

(declare-fun m!694153 () Bool)

(assert (=> b!743442 m!694153))

(declare-fun m!694155 () Bool)

(assert (=> b!743440 m!694155))

(declare-fun m!694157 () Bool)

(assert (=> b!743441 m!694157))

(assert (=> b!743446 m!694121))

(assert (=> b!743446 m!694121))

(declare-fun m!694159 () Bool)

(assert (=> b!743446 m!694159))

(assert (=> b!743445 m!694121))

(assert (=> b!743445 m!694121))

(assert (=> b!743445 m!694127))

(declare-fun m!694161 () Bool)

(assert (=> b!743438 m!694161))

(declare-fun m!694163 () Bool)

(assert (=> b!743431 m!694163))

(declare-fun m!694165 () Bool)

(assert (=> b!743431 m!694165))

(assert (=> b!743431 m!694133))

(declare-fun m!694167 () Bool)

(assert (=> b!743431 m!694167))

(declare-fun m!694169 () Bool)

(assert (=> b!743431 m!694169))

(assert (=> b!743431 m!694163))

(push 1)

