; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66766 () Bool)

(assert start!66766)

(declare-fun b!769376 () Bool)

(declare-fun e!428428 () Bool)

(declare-fun e!428429 () Bool)

(assert (=> b!769376 (= e!428428 e!428429)))

(declare-fun res!520303 () Bool)

(assert (=> b!769376 (=> (not res!520303) (not e!428429))))

(declare-datatypes ((array!42328 0))(
  ( (array!42329 (arr!20264 (Array (_ BitVec 32) (_ BitVec 64))) (size!20685 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42328)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7864 0))(
  ( (MissingZero!7864 (index!33824 (_ BitVec 32))) (Found!7864 (index!33825 (_ BitVec 32))) (Intermediate!7864 (undefined!8676 Bool) (index!33826 (_ BitVec 32)) (x!64755 (_ BitVec 32))) (Undefined!7864) (MissingVacant!7864 (index!33827 (_ BitVec 32))) )
))
(declare-fun lt!342316 () SeekEntryResult!7864)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42328 (_ BitVec 32)) SeekEntryResult!7864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769376 (= res!520303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20264 a!3186) j!159) mask!3328) (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342316))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769376 (= lt!342316 (Intermediate!7864 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769377 () Bool)

(declare-fun e!428422 () Bool)

(declare-fun e!428423 () Bool)

(assert (=> b!769377 (= e!428422 e!428423)))

(declare-fun res!520311 () Bool)

(assert (=> b!769377 (=> (not res!520311) (not e!428423))))

(declare-fun lt!342312 () SeekEntryResult!7864)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42328 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!769377 (= res!520311 (= (seekEntryOrOpen!0 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342312))))

(assert (=> b!769377 (= lt!342312 (Found!7864 j!159))))

(declare-fun res!520314 () Bool)

(declare-fun e!428426 () Bool)

(assert (=> start!66766 (=> (not res!520314) (not e!428426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66766 (= res!520314 (validMask!0 mask!3328))))

(assert (=> start!66766 e!428426))

(assert (=> start!66766 true))

(declare-fun array_inv!16060 (array!42328) Bool)

(assert (=> start!66766 (array_inv!16060 a!3186)))

(declare-fun b!769378 () Bool)

(declare-fun e!428425 () Bool)

(declare-fun e!428421 () Bool)

(assert (=> b!769378 (= e!428425 (not e!428421))))

(declare-fun res!520305 () Bool)

(assert (=> b!769378 (=> res!520305 e!428421)))

(declare-fun lt!342315 () SeekEntryResult!7864)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!769378 (= res!520305 (or (not (is-Intermediate!7864 lt!342315)) (bvsge x!1131 (x!64755 lt!342315))))))

(assert (=> b!769378 e!428422))

(declare-fun res!520312 () Bool)

(assert (=> b!769378 (=> (not res!520312) (not e!428422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42328 (_ BitVec 32)) Bool)

(assert (=> b!769378 (= res!520312 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26470 0))(
  ( (Unit!26471) )
))
(declare-fun lt!342317 () Unit!26470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26470)

(assert (=> b!769378 (= lt!342317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769379 () Bool)

(declare-fun res!520306 () Bool)

(assert (=> b!769379 (=> (not res!520306) (not e!428426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769379 (= res!520306 (validKeyInArray!0 (select (arr!20264 a!3186) j!159)))))

(declare-fun b!769380 () Bool)

(assert (=> b!769380 (= e!428421 true)))

(declare-fun lt!342320 () Unit!26470)

(declare-fun e!428427 () Unit!26470)

(assert (=> b!769380 (= lt!342320 e!428427)))

(declare-fun c!84933 () Bool)

(assert (=> b!769380 (= c!84933 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342313 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769380 (= lt!342313 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769381 () Bool)

(assert (=> b!769381 (= e!428429 e!428425)))

(declare-fun res!520302 () Bool)

(assert (=> b!769381 (=> (not res!520302) (not e!428425))))

(declare-fun lt!342318 () SeekEntryResult!7864)

(assert (=> b!769381 (= res!520302 (= lt!342318 lt!342315))))

(declare-fun lt!342319 () (_ BitVec 64))

(declare-fun lt!342310 () array!42328)

(assert (=> b!769381 (= lt!342315 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342319 lt!342310 mask!3328))))

(assert (=> b!769381 (= lt!342318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342319 mask!3328) lt!342319 lt!342310 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!769381 (= lt!342319 (select (store (arr!20264 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769381 (= lt!342310 (array!42329 (store (arr!20264 a!3186) i!1173 k!2102) (size!20685 a!3186)))))

(declare-fun b!769382 () Bool)

(declare-fun Unit!26472 () Unit!26470)

(assert (=> b!769382 (= e!428427 Unit!26472)))

(assert (=> b!769382 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342313 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342316)))

(declare-fun b!769383 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42328 (_ BitVec 32)) SeekEntryResult!7864)

(assert (=> b!769383 (= e!428423 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342312))))

(declare-fun b!769384 () Bool)

(declare-fun Unit!26473 () Unit!26470)

(assert (=> b!769384 (= e!428427 Unit!26473)))

(declare-fun lt!342311 () SeekEntryResult!7864)

(assert (=> b!769384 (= lt!342311 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769384 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342313 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) (Found!7864 j!159))))

(declare-fun b!769385 () Bool)

(declare-fun res!520309 () Bool)

(assert (=> b!769385 (=> (not res!520309) (not e!428426))))

(assert (=> b!769385 (= res!520309 (and (= (size!20685 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20685 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20685 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769386 () Bool)

(declare-fun res!520301 () Bool)

(assert (=> b!769386 (=> (not res!520301) (not e!428428))))

(assert (=> b!769386 (= res!520301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769387 () Bool)

(declare-fun res!520310 () Bool)

(assert (=> b!769387 (=> (not res!520310) (not e!428426))))

(declare-fun arrayContainsKey!0 (array!42328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769387 (= res!520310 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769388 () Bool)

(declare-fun e!428420 () Bool)

(assert (=> b!769388 (= e!428420 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) (Found!7864 j!159)))))

(declare-fun b!769389 () Bool)

(declare-fun res!520313 () Bool)

(assert (=> b!769389 (=> (not res!520313) (not e!428428))))

(declare-datatypes ((List!14266 0))(
  ( (Nil!14263) (Cons!14262 (h!15361 (_ BitVec 64)) (t!20581 List!14266)) )
))
(declare-fun arrayNoDuplicates!0 (array!42328 (_ BitVec 32) List!14266) Bool)

(assert (=> b!769389 (= res!520313 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14263))))

(declare-fun b!769390 () Bool)

(declare-fun res!520308 () Bool)

(assert (=> b!769390 (=> (not res!520308) (not e!428428))))

(assert (=> b!769390 (= res!520308 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20685 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20685 a!3186))))))

(declare-fun b!769391 () Bool)

(declare-fun res!520315 () Bool)

(assert (=> b!769391 (=> (not res!520315) (not e!428429))))

(assert (=> b!769391 (= res!520315 e!428420)))

(declare-fun c!84934 () Bool)

(assert (=> b!769391 (= c!84934 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769392 () Bool)

(assert (=> b!769392 (= e!428426 e!428428)))

(declare-fun res!520304 () Bool)

(assert (=> b!769392 (=> (not res!520304) (not e!428428))))

(declare-fun lt!342314 () SeekEntryResult!7864)

(assert (=> b!769392 (= res!520304 (or (= lt!342314 (MissingZero!7864 i!1173)) (= lt!342314 (MissingVacant!7864 i!1173))))))

(assert (=> b!769392 (= lt!342314 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769393 () Bool)

(declare-fun res!520316 () Bool)

(assert (=> b!769393 (=> (not res!520316) (not e!428429))))

(assert (=> b!769393 (= res!520316 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20264 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769394 () Bool)

(assert (=> b!769394 (= e!428420 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342316))))

(declare-fun b!769395 () Bool)

(declare-fun res!520307 () Bool)

(assert (=> b!769395 (=> (not res!520307) (not e!428426))))

(assert (=> b!769395 (= res!520307 (validKeyInArray!0 k!2102))))

(assert (= (and start!66766 res!520314) b!769385))

(assert (= (and b!769385 res!520309) b!769379))

(assert (= (and b!769379 res!520306) b!769395))

(assert (= (and b!769395 res!520307) b!769387))

(assert (= (and b!769387 res!520310) b!769392))

(assert (= (and b!769392 res!520304) b!769386))

(assert (= (and b!769386 res!520301) b!769389))

(assert (= (and b!769389 res!520313) b!769390))

(assert (= (and b!769390 res!520308) b!769376))

(assert (= (and b!769376 res!520303) b!769393))

(assert (= (and b!769393 res!520316) b!769391))

(assert (= (and b!769391 c!84934) b!769394))

(assert (= (and b!769391 (not c!84934)) b!769388))

(assert (= (and b!769391 res!520315) b!769381))

(assert (= (and b!769381 res!520302) b!769378))

(assert (= (and b!769378 res!520312) b!769377))

(assert (= (and b!769377 res!520311) b!769383))

(assert (= (and b!769378 (not res!520305)) b!769380))

(assert (= (and b!769380 c!84933) b!769382))

(assert (= (and b!769380 (not c!84933)) b!769384))

(declare-fun m!714799 () Bool)

(assert (=> b!769384 m!714799))

(assert (=> b!769384 m!714799))

(declare-fun m!714801 () Bool)

(assert (=> b!769384 m!714801))

(assert (=> b!769384 m!714799))

(declare-fun m!714803 () Bool)

(assert (=> b!769384 m!714803))

(declare-fun m!714805 () Bool)

(assert (=> start!66766 m!714805))

(declare-fun m!714807 () Bool)

(assert (=> start!66766 m!714807))

(assert (=> b!769394 m!714799))

(assert (=> b!769394 m!714799))

(declare-fun m!714809 () Bool)

(assert (=> b!769394 m!714809))

(declare-fun m!714811 () Bool)

(assert (=> b!769386 m!714811))

(assert (=> b!769388 m!714799))

(assert (=> b!769388 m!714799))

(assert (=> b!769388 m!714801))

(declare-fun m!714813 () Bool)

(assert (=> b!769387 m!714813))

(declare-fun m!714815 () Bool)

(assert (=> b!769381 m!714815))

(declare-fun m!714817 () Bool)

(assert (=> b!769381 m!714817))

(declare-fun m!714819 () Bool)

(assert (=> b!769381 m!714819))

(declare-fun m!714821 () Bool)

(assert (=> b!769381 m!714821))

(assert (=> b!769381 m!714821))

(declare-fun m!714823 () Bool)

(assert (=> b!769381 m!714823))

(assert (=> b!769379 m!714799))

(assert (=> b!769379 m!714799))

(declare-fun m!714825 () Bool)

(assert (=> b!769379 m!714825))

(assert (=> b!769382 m!714799))

(assert (=> b!769382 m!714799))

(declare-fun m!714827 () Bool)

(assert (=> b!769382 m!714827))

(declare-fun m!714829 () Bool)

(assert (=> b!769393 m!714829))

(declare-fun m!714831 () Bool)

(assert (=> b!769380 m!714831))

(declare-fun m!714833 () Bool)

(assert (=> b!769389 m!714833))

(assert (=> b!769376 m!714799))

(assert (=> b!769376 m!714799))

(declare-fun m!714835 () Bool)

(assert (=> b!769376 m!714835))

(assert (=> b!769376 m!714835))

(assert (=> b!769376 m!714799))

(declare-fun m!714837 () Bool)

(assert (=> b!769376 m!714837))

(assert (=> b!769383 m!714799))

(assert (=> b!769383 m!714799))

(declare-fun m!714839 () Bool)

(assert (=> b!769383 m!714839))

(declare-fun m!714841 () Bool)

(assert (=> b!769378 m!714841))

(declare-fun m!714843 () Bool)

(assert (=> b!769378 m!714843))

(assert (=> b!769377 m!714799))

(assert (=> b!769377 m!714799))

(declare-fun m!714845 () Bool)

(assert (=> b!769377 m!714845))

(declare-fun m!714847 () Bool)

(assert (=> b!769392 m!714847))

(declare-fun m!714849 () Bool)

(assert (=> b!769395 m!714849))

(push 1)

