; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65404 () Bool)

(assert start!65404)

(declare-fun b!744340 () Bool)

(declare-fun res!501342 () Bool)

(declare-fun e!415810 () Bool)

(assert (=> b!744340 (=> (not res!501342) (not e!415810))))

(declare-datatypes ((array!41577 0))(
  ( (array!41578 (arr!19902 (Array (_ BitVec 32) (_ BitVec 64))) (size!20323 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41577)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41577 (_ BitVec 32)) Bool)

(assert (=> b!744340 (= res!501342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!415812 () Bool)

(declare-datatypes ((SeekEntryResult!7502 0))(
  ( (MissingZero!7502 (index!32376 (_ BitVec 32))) (Found!7502 (index!32377 (_ BitVec 32))) (Intermediate!7502 (undefined!8314 Bool) (index!32378 (_ BitVec 32)) (x!63340 (_ BitVec 32))) (Undefined!7502) (MissingVacant!7502 (index!32379 (_ BitVec 32))) )
))
(declare-fun lt!330670 () SeekEntryResult!7502)

(declare-fun b!744341 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41577 (_ BitVec 32)) SeekEntryResult!7502)

(assert (=> b!744341 (= e!415812 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19902 a!3186) j!159) a!3186 mask!3328) lt!330670))))

(declare-fun b!744343 () Bool)

(declare-fun res!501339 () Bool)

(declare-fun e!415811 () Bool)

(assert (=> b!744343 (=> (not res!501339) (not e!415811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744343 (= res!501339 (validKeyInArray!0 (select (arr!19902 a!3186) j!159)))))

(declare-fun e!415809 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!744344 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744344 (= e!415809 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19902 a!3186) j!159) a!3186 mask!3328) (Found!7502 j!159)))))

(declare-fun b!744345 () Bool)

(assert (=> b!744345 (= e!415811 e!415810)))

(declare-fun res!501346 () Bool)

(assert (=> b!744345 (=> (not res!501346) (not e!415810))))

(declare-fun lt!330663 () SeekEntryResult!7502)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744345 (= res!501346 (or (= lt!330663 (MissingZero!7502 i!1173)) (= lt!330663 (MissingVacant!7502 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41577 (_ BitVec 32)) SeekEntryResult!7502)

(assert (=> b!744345 (= lt!330663 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744346 () Bool)

(declare-fun e!415814 () Bool)

(assert (=> b!744346 (= e!415814 true)))

(declare-fun lt!330666 () SeekEntryResult!7502)

(assert (=> b!744346 (= lt!330666 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19902 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744347 () Bool)

(declare-fun e!415808 () Bool)

(assert (=> b!744347 (= e!415808 e!415812)))

(declare-fun res!501335 () Bool)

(assert (=> b!744347 (=> (not res!501335) (not e!415812))))

(assert (=> b!744347 (= res!501335 (= (seekEntryOrOpen!0 (select (arr!19902 a!3186) j!159) a!3186 mask!3328) lt!330670))))

(assert (=> b!744347 (= lt!330670 (Found!7502 j!159))))

(declare-fun b!744348 () Bool)

(declare-fun res!501343 () Bool)

(assert (=> b!744348 (=> (not res!501343) (not e!415811))))

(declare-fun arrayContainsKey!0 (array!41577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744348 (= res!501343 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744349 () Bool)

(declare-fun res!501338 () Bool)

(assert (=> b!744349 (=> (not res!501338) (not e!415811))))

(assert (=> b!744349 (= res!501338 (validKeyInArray!0 k!2102))))

(declare-fun b!744350 () Bool)

(declare-fun e!415806 () Bool)

(assert (=> b!744350 (= e!415806 (not e!415814))))

(declare-fun res!501349 () Bool)

(assert (=> b!744350 (=> res!501349 e!415814)))

(declare-fun lt!330667 () SeekEntryResult!7502)

(assert (=> b!744350 (= res!501349 (or (not (is-Intermediate!7502 lt!330667)) (bvslt x!1131 (x!63340 lt!330667)) (not (= x!1131 (x!63340 lt!330667))) (not (= index!1321 (index!32378 lt!330667)))))))

(assert (=> b!744350 e!415808))

(declare-fun res!501337 () Bool)

(assert (=> b!744350 (=> (not res!501337) (not e!415808))))

(assert (=> b!744350 (= res!501337 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25484 0))(
  ( (Unit!25485) )
))
(declare-fun lt!330665 () Unit!25484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25484)

(assert (=> b!744350 (= lt!330665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744351 () Bool)

(declare-fun res!501347 () Bool)

(declare-fun e!415813 () Bool)

(assert (=> b!744351 (=> (not res!501347) (not e!415813))))

(assert (=> b!744351 (= res!501347 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19902 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744352 () Bool)

(assert (=> b!744352 (= e!415810 e!415813)))

(declare-fun res!501341 () Bool)

(assert (=> b!744352 (=> (not res!501341) (not e!415813))))

(declare-fun lt!330664 () SeekEntryResult!7502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41577 (_ BitVec 32)) SeekEntryResult!7502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744352 (= res!501341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19902 a!3186) j!159) mask!3328) (select (arr!19902 a!3186) j!159) a!3186 mask!3328) lt!330664))))

(assert (=> b!744352 (= lt!330664 (Intermediate!7502 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744353 () Bool)

(declare-fun res!501350 () Bool)

(assert (=> b!744353 (=> (not res!501350) (not e!415810))))

(assert (=> b!744353 (= res!501350 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20323 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20323 a!3186))))))

(declare-fun b!744354 () Bool)

(assert (=> b!744354 (= e!415813 e!415806)))

(declare-fun res!501348 () Bool)

(assert (=> b!744354 (=> (not res!501348) (not e!415806))))

(declare-fun lt!330668 () SeekEntryResult!7502)

(assert (=> b!744354 (= res!501348 (= lt!330668 lt!330667))))

(declare-fun lt!330669 () (_ BitVec 64))

(declare-fun lt!330671 () array!41577)

(assert (=> b!744354 (= lt!330667 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330669 lt!330671 mask!3328))))

(assert (=> b!744354 (= lt!330668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330669 mask!3328) lt!330669 lt!330671 mask!3328))))

(assert (=> b!744354 (= lt!330669 (select (store (arr!19902 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744354 (= lt!330671 (array!41578 (store (arr!19902 a!3186) i!1173 k!2102) (size!20323 a!3186)))))

(declare-fun b!744355 () Bool)

(assert (=> b!744355 (= e!415809 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19902 a!3186) j!159) a!3186 mask!3328) lt!330664))))

(declare-fun res!501345 () Bool)

(assert (=> start!65404 (=> (not res!501345) (not e!415811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65404 (= res!501345 (validMask!0 mask!3328))))

(assert (=> start!65404 e!415811))

(assert (=> start!65404 true))

(declare-fun array_inv!15698 (array!41577) Bool)

(assert (=> start!65404 (array_inv!15698 a!3186)))

(declare-fun b!744342 () Bool)

(declare-fun res!501340 () Bool)

(assert (=> b!744342 (=> (not res!501340) (not e!415810))))

(declare-datatypes ((List!13904 0))(
  ( (Nil!13901) (Cons!13900 (h!14972 (_ BitVec 64)) (t!20219 List!13904)) )
))
(declare-fun arrayNoDuplicates!0 (array!41577 (_ BitVec 32) List!13904) Bool)

(assert (=> b!744342 (= res!501340 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13901))))

(declare-fun b!744356 () Bool)

(declare-fun res!501336 () Bool)

(assert (=> b!744356 (=> (not res!501336) (not e!415813))))

(assert (=> b!744356 (= res!501336 e!415809)))

(declare-fun c!81883 () Bool)

(assert (=> b!744356 (= c!81883 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744357 () Bool)

(declare-fun res!501344 () Bool)

(assert (=> b!744357 (=> (not res!501344) (not e!415811))))

(assert (=> b!744357 (= res!501344 (and (= (size!20323 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20323 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20323 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65404 res!501345) b!744357))

(assert (= (and b!744357 res!501344) b!744343))

(assert (= (and b!744343 res!501339) b!744349))

(assert (= (and b!744349 res!501338) b!744348))

(assert (= (and b!744348 res!501343) b!744345))

(assert (= (and b!744345 res!501346) b!744340))

(assert (= (and b!744340 res!501342) b!744342))

(assert (= (and b!744342 res!501340) b!744353))

(assert (= (and b!744353 res!501350) b!744352))

(assert (= (and b!744352 res!501341) b!744351))

(assert (= (and b!744351 res!501347) b!744356))

(assert (= (and b!744356 c!81883) b!744355))

(assert (= (and b!744356 (not c!81883)) b!744344))

(assert (= (and b!744356 res!501336) b!744354))

(assert (= (and b!744354 res!501348) b!744350))

(assert (= (and b!744350 res!501337) b!744347))

(assert (= (and b!744347 res!501335) b!744341))

(assert (= (and b!744350 (not res!501349)) b!744346))

(declare-fun m!694885 () Bool)

(assert (=> b!744341 m!694885))

(assert (=> b!744341 m!694885))

(declare-fun m!694887 () Bool)

(assert (=> b!744341 m!694887))

(assert (=> b!744355 m!694885))

(assert (=> b!744355 m!694885))

(declare-fun m!694889 () Bool)

(assert (=> b!744355 m!694889))

(declare-fun m!694891 () Bool)

(assert (=> b!744342 m!694891))

(declare-fun m!694893 () Bool)

(assert (=> b!744349 m!694893))

(declare-fun m!694895 () Bool)

(assert (=> b!744345 m!694895))

(assert (=> b!744352 m!694885))

(assert (=> b!744352 m!694885))

(declare-fun m!694897 () Bool)

(assert (=> b!744352 m!694897))

(assert (=> b!744352 m!694897))

(assert (=> b!744352 m!694885))

(declare-fun m!694899 () Bool)

(assert (=> b!744352 m!694899))

(assert (=> b!744344 m!694885))

(assert (=> b!744344 m!694885))

(declare-fun m!694901 () Bool)

(assert (=> b!744344 m!694901))

(assert (=> b!744343 m!694885))

(assert (=> b!744343 m!694885))

(declare-fun m!694903 () Bool)

(assert (=> b!744343 m!694903))

(declare-fun m!694905 () Bool)

(assert (=> b!744340 m!694905))

(assert (=> b!744346 m!694885))

(assert (=> b!744346 m!694885))

(assert (=> b!744346 m!694901))

(declare-fun m!694907 () Bool)

(assert (=> b!744354 m!694907))

(declare-fun m!694909 () Bool)

(assert (=> b!744354 m!694909))

(declare-fun m!694911 () Bool)

(assert (=> b!744354 m!694911))

(declare-fun m!694913 () Bool)

(assert (=> b!744354 m!694913))

(assert (=> b!744354 m!694909))

(declare-fun m!694915 () Bool)

(assert (=> b!744354 m!694915))

(declare-fun m!694917 () Bool)

(assert (=> b!744348 m!694917))

(declare-fun m!694919 () Bool)

(assert (=> b!744351 m!694919))

(declare-fun m!694921 () Bool)

(assert (=> start!65404 m!694921))

(declare-fun m!694923 () Bool)

(assert (=> start!65404 m!694923))

(assert (=> b!744347 m!694885))

(assert (=> b!744347 m!694885))

(declare-fun m!694925 () Bool)

(assert (=> b!744347 m!694925))

(declare-fun m!694927 () Bool)

(assert (=> b!744350 m!694927))

(declare-fun m!694929 () Bool)

(assert (=> b!744350 m!694929))

(push 1)

