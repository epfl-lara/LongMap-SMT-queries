; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65370 () Bool)

(assert start!65370)

(declare-datatypes ((SeekEntryResult!7485 0))(
  ( (MissingZero!7485 (index!32308 (_ BitVec 32))) (Found!7485 (index!32309 (_ BitVec 32))) (Intermediate!7485 (undefined!8297 Bool) (index!32310 (_ BitVec 32)) (x!63275 (_ BitVec 32))) (Undefined!7485) (MissingVacant!7485 (index!32311 (_ BitVec 32))) )
))
(declare-fun lt!330229 () SeekEntryResult!7485)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41543 0))(
  ( (array!41544 (arr!19885 (Array (_ BitVec 32) (_ BitVec 64))) (size!20306 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41543)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!743369 () Bool)

(declare-fun e!415351 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41543 (_ BitVec 32)) SeekEntryResult!7485)

(assert (=> b!743369 (= e!415351 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330229))))

(declare-fun e!415354 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!743370 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330222 () SeekEntryResult!7485)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41543 (_ BitVec 32)) SeekEntryResult!7485)

(assert (=> b!743370 (= e!415354 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330222))))

(declare-fun b!743371 () Bool)

(declare-fun res!500478 () Bool)

(declare-fun e!415347 () Bool)

(assert (=> b!743371 (=> (not res!500478) (not e!415347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743371 (= res!500478 (validKeyInArray!0 (select (arr!19885 a!3186) j!159)))))

(declare-fun b!743372 () Bool)

(declare-fun e!415352 () Bool)

(declare-fun e!415353 () Bool)

(assert (=> b!743372 (= e!415352 e!415353)))

(declare-fun res!500472 () Bool)

(assert (=> b!743372 (=> (not res!500472) (not e!415353))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743372 (= res!500472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19885 a!3186) j!159) mask!3328) (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330222))))

(assert (=> b!743372 (= lt!330222 (Intermediate!7485 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!500471 () Bool)

(assert (=> start!65370 (=> (not res!500471) (not e!415347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65370 (= res!500471 (validMask!0 mask!3328))))

(assert (=> start!65370 e!415347))

(assert (=> start!65370 true))

(declare-fun array_inv!15681 (array!41543) Bool)

(assert (=> start!65370 (array_inv!15681 a!3186)))

(declare-fun b!743373 () Bool)

(declare-fun res!500469 () Bool)

(assert (=> b!743373 (=> (not res!500469) (not e!415347))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743373 (= res!500469 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743374 () Bool)

(declare-fun e!415355 () Bool)

(declare-fun e!415350 () Bool)

(assert (=> b!743374 (= e!415355 (not e!415350))))

(declare-fun res!500481 () Bool)

(assert (=> b!743374 (=> res!500481 e!415350)))

(declare-fun lt!330230 () SeekEntryResult!7485)

(get-info :version)

(assert (=> b!743374 (= res!500481 (or (not ((_ is Intermediate!7485) lt!330230)) (bvslt x!1131 (x!63275 lt!330230)) (not (= x!1131 (x!63275 lt!330230))) (not (= index!1321 (index!32310 lt!330230)))))))

(declare-fun e!415348 () Bool)

(assert (=> b!743374 e!415348))

(declare-fun res!500473 () Bool)

(assert (=> b!743374 (=> (not res!500473) (not e!415348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41543 (_ BitVec 32)) Bool)

(assert (=> b!743374 (= res!500473 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25450 0))(
  ( (Unit!25451) )
))
(declare-fun lt!330223 () Unit!25450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25450)

(assert (=> b!743374 (= lt!330223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743375 () Bool)

(assert (=> b!743375 (= e!415354 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) (Found!7485 j!159)))))

(declare-fun b!743376 () Bool)

(declare-fun res!500467 () Bool)

(assert (=> b!743376 (=> (not res!500467) (not e!415347))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743376 (= res!500467 (and (= (size!20306 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20306 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20306 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743377 () Bool)

(declare-fun res!500476 () Bool)

(assert (=> b!743377 (=> (not res!500476) (not e!415352))))

(assert (=> b!743377 (= res!500476 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20306 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20306 a!3186))))))

(declare-fun b!743378 () Bool)

(declare-fun res!500479 () Bool)

(assert (=> b!743378 (=> (not res!500479) (not e!415353))))

(assert (=> b!743378 (= res!500479 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19885 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743379 () Bool)

(assert (=> b!743379 (= e!415348 e!415351)))

(declare-fun res!500474 () Bool)

(assert (=> b!743379 (=> (not res!500474) (not e!415351))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41543 (_ BitVec 32)) SeekEntryResult!7485)

(assert (=> b!743379 (= res!500474 (= (seekEntryOrOpen!0 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) lt!330229))))

(assert (=> b!743379 (= lt!330229 (Found!7485 j!159))))

(declare-fun b!743380 () Bool)

(declare-fun res!500470 () Bool)

(assert (=> b!743380 (=> (not res!500470) (not e!415347))))

(assert (=> b!743380 (= res!500470 (validKeyInArray!0 k0!2102))))

(declare-fun b!743381 () Bool)

(declare-fun res!500477 () Bool)

(assert (=> b!743381 (=> res!500477 e!415350)))

(assert (=> b!743381 (= res!500477 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19885 a!3186) j!159) a!3186 mask!3328) (Found!7485 j!159))))))

(declare-fun b!743382 () Bool)

(assert (=> b!743382 (= e!415350 true)))

(declare-fun lt!330227 () (_ BitVec 64))

(declare-fun lt!330228 () SeekEntryResult!7485)

(declare-fun lt!330225 () array!41543)

(assert (=> b!743382 (= lt!330228 (seekEntryOrOpen!0 lt!330227 lt!330225 mask!3328))))

(declare-fun b!743383 () Bool)

(assert (=> b!743383 (= e!415347 e!415352)))

(declare-fun res!500468 () Bool)

(assert (=> b!743383 (=> (not res!500468) (not e!415352))))

(declare-fun lt!330224 () SeekEntryResult!7485)

(assert (=> b!743383 (= res!500468 (or (= lt!330224 (MissingZero!7485 i!1173)) (= lt!330224 (MissingVacant!7485 i!1173))))))

(assert (=> b!743383 (= lt!330224 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743384 () Bool)

(declare-fun res!500475 () Bool)

(assert (=> b!743384 (=> (not res!500475) (not e!415353))))

(assert (=> b!743384 (= res!500475 e!415354)))

(declare-fun c!81832 () Bool)

(assert (=> b!743384 (= c!81832 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743385 () Bool)

(declare-fun res!500480 () Bool)

(assert (=> b!743385 (=> res!500480 e!415350)))

(assert (=> b!743385 (= res!500480 (or (not (= (select (store (arr!19885 a!3186) i!1173 k0!2102) index!1321) lt!330227)) (undefined!8297 lt!330230)))))

(declare-fun b!743386 () Bool)

(declare-fun res!500483 () Bool)

(assert (=> b!743386 (=> (not res!500483) (not e!415352))))

(declare-datatypes ((List!13887 0))(
  ( (Nil!13884) (Cons!13883 (h!14955 (_ BitVec 64)) (t!20202 List!13887)) )
))
(declare-fun arrayNoDuplicates!0 (array!41543 (_ BitVec 32) List!13887) Bool)

(assert (=> b!743386 (= res!500483 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13884))))

(declare-fun b!743387 () Bool)

(declare-fun res!500482 () Bool)

(assert (=> b!743387 (=> (not res!500482) (not e!415352))))

(assert (=> b!743387 (= res!500482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743388 () Bool)

(assert (=> b!743388 (= e!415353 e!415355)))

(declare-fun res!500466 () Bool)

(assert (=> b!743388 (=> (not res!500466) (not e!415355))))

(declare-fun lt!330226 () SeekEntryResult!7485)

(assert (=> b!743388 (= res!500466 (= lt!330226 lt!330230))))

(assert (=> b!743388 (= lt!330230 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330227 lt!330225 mask!3328))))

(assert (=> b!743388 (= lt!330226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330227 mask!3328) lt!330227 lt!330225 mask!3328))))

(assert (=> b!743388 (= lt!330227 (select (store (arr!19885 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743388 (= lt!330225 (array!41544 (store (arr!19885 a!3186) i!1173 k0!2102) (size!20306 a!3186)))))

(assert (= (and start!65370 res!500471) b!743376))

(assert (= (and b!743376 res!500467) b!743371))

(assert (= (and b!743371 res!500478) b!743380))

(assert (= (and b!743380 res!500470) b!743373))

(assert (= (and b!743373 res!500469) b!743383))

(assert (= (and b!743383 res!500468) b!743387))

(assert (= (and b!743387 res!500482) b!743386))

(assert (= (and b!743386 res!500483) b!743377))

(assert (= (and b!743377 res!500476) b!743372))

(assert (= (and b!743372 res!500472) b!743378))

(assert (= (and b!743378 res!500479) b!743384))

(assert (= (and b!743384 c!81832) b!743370))

(assert (= (and b!743384 (not c!81832)) b!743375))

(assert (= (and b!743384 res!500475) b!743388))

(assert (= (and b!743388 res!500466) b!743374))

(assert (= (and b!743374 res!500473) b!743379))

(assert (= (and b!743379 res!500474) b!743369))

(assert (= (and b!743374 (not res!500481)) b!743381))

(assert (= (and b!743381 (not res!500477)) b!743385))

(assert (= (and b!743385 (not res!500480)) b!743382))

(declare-fun m!694071 () Bool)

(assert (=> b!743372 m!694071))

(assert (=> b!743372 m!694071))

(declare-fun m!694073 () Bool)

(assert (=> b!743372 m!694073))

(assert (=> b!743372 m!694073))

(assert (=> b!743372 m!694071))

(declare-fun m!694075 () Bool)

(assert (=> b!743372 m!694075))

(declare-fun m!694077 () Bool)

(assert (=> b!743385 m!694077))

(declare-fun m!694079 () Bool)

(assert (=> b!743385 m!694079))

(assert (=> b!743375 m!694071))

(assert (=> b!743375 m!694071))

(declare-fun m!694081 () Bool)

(assert (=> b!743375 m!694081))

(assert (=> b!743381 m!694071))

(assert (=> b!743381 m!694071))

(assert (=> b!743381 m!694081))

(assert (=> b!743369 m!694071))

(assert (=> b!743369 m!694071))

(declare-fun m!694083 () Bool)

(assert (=> b!743369 m!694083))

(declare-fun m!694085 () Bool)

(assert (=> start!65370 m!694085))

(declare-fun m!694087 () Bool)

(assert (=> start!65370 m!694087))

(assert (=> b!743379 m!694071))

(assert (=> b!743379 m!694071))

(declare-fun m!694089 () Bool)

(assert (=> b!743379 m!694089))

(declare-fun m!694091 () Bool)

(assert (=> b!743387 m!694091))

(assert (=> b!743370 m!694071))

(assert (=> b!743370 m!694071))

(declare-fun m!694093 () Bool)

(assert (=> b!743370 m!694093))

(declare-fun m!694095 () Bool)

(assert (=> b!743383 m!694095))

(declare-fun m!694097 () Bool)

(assert (=> b!743388 m!694097))

(declare-fun m!694099 () Bool)

(assert (=> b!743388 m!694099))

(assert (=> b!743388 m!694097))

(assert (=> b!743388 m!694077))

(declare-fun m!694101 () Bool)

(assert (=> b!743388 m!694101))

(declare-fun m!694103 () Bool)

(assert (=> b!743388 m!694103))

(declare-fun m!694105 () Bool)

(assert (=> b!743386 m!694105))

(assert (=> b!743371 m!694071))

(assert (=> b!743371 m!694071))

(declare-fun m!694107 () Bool)

(assert (=> b!743371 m!694107))

(declare-fun m!694109 () Bool)

(assert (=> b!743380 m!694109))

(declare-fun m!694111 () Bool)

(assert (=> b!743374 m!694111))

(declare-fun m!694113 () Bool)

(assert (=> b!743374 m!694113))

(declare-fun m!694115 () Bool)

(assert (=> b!743382 m!694115))

(declare-fun m!694117 () Bool)

(assert (=> b!743373 m!694117))

(declare-fun m!694119 () Bool)

(assert (=> b!743378 m!694119))

(check-sat (not b!743372) (not b!743375) (not b!743374) (not b!743383) (not b!743379) (not b!743371) (not b!743380) (not start!65370) (not b!743387) (not b!743373) (not b!743370) (not b!743381) (not b!743369) (not b!743388) (not b!743382) (not b!743386))
(check-sat)
