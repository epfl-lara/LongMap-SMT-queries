; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65452 () Bool)

(assert start!65452)

(declare-fun b!745663 () Bool)

(declare-fun e!416459 () Bool)

(declare-fun e!416455 () Bool)

(assert (=> b!745663 (= e!416459 e!416455)))

(declare-fun res!502521 () Bool)

(assert (=> b!745663 (=> (not res!502521) (not e!416455))))

(declare-datatypes ((SeekEntryResult!7526 0))(
  ( (MissingZero!7526 (index!32472 (_ BitVec 32))) (Found!7526 (index!32473 (_ BitVec 32))) (Intermediate!7526 (undefined!8338 Bool) (index!32474 (_ BitVec 32)) (x!63428 (_ BitVec 32))) (Undefined!7526) (MissingVacant!7526 (index!32475 (_ BitVec 32))) )
))
(declare-fun lt!331295 () SeekEntryResult!7526)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745663 (= res!502521 (or (= lt!331295 (MissingZero!7526 i!1173)) (= lt!331295 (MissingVacant!7526 i!1173))))))

(declare-datatypes ((array!41625 0))(
  ( (array!41626 (arr!19926 (Array (_ BitVec 32) (_ BitVec 64))) (size!20347 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41625)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41625 (_ BitVec 32)) SeekEntryResult!7526)

(assert (=> b!745663 (= lt!331295 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745664 () Bool)

(declare-fun e!416461 () Bool)

(assert (=> b!745664 (= e!416455 e!416461)))

(declare-fun res!502520 () Bool)

(assert (=> b!745664 (=> (not res!502520) (not e!416461))))

(declare-fun lt!331288 () SeekEntryResult!7526)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41625 (_ BitVec 32)) SeekEntryResult!7526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745664 (= res!502520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19926 a!3186) j!159) mask!3328) (select (arr!19926 a!3186) j!159) a!3186 mask!3328) lt!331288))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745664 (= lt!331288 (Intermediate!7526 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745665 () Bool)

(declare-fun e!416457 () Bool)

(assert (=> b!745665 (= e!416457 true)))

(declare-fun lt!331287 () SeekEntryResult!7526)

(declare-fun lt!331290 () SeekEntryResult!7526)

(assert (=> b!745665 (= lt!331287 lt!331290)))

(declare-fun b!745666 () Bool)

(declare-fun res!502524 () Bool)

(assert (=> b!745666 (=> (not res!502524) (not e!416461))))

(declare-fun e!416454 () Bool)

(assert (=> b!745666 (= res!502524 e!416454)))

(declare-fun c!81955 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!745666 (= c!81955 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745667 () Bool)

(declare-fun res!502514 () Bool)

(assert (=> b!745667 (=> (not res!502514) (not e!416459))))

(declare-fun arrayContainsKey!0 (array!41625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745667 (= res!502514 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!502515 () Bool)

(assert (=> start!65452 (=> (not res!502515) (not e!416459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65452 (= res!502515 (validMask!0 mask!3328))))

(assert (=> start!65452 e!416459))

(assert (=> start!65452 true))

(declare-fun array_inv!15722 (array!41625) Bool)

(assert (=> start!65452 (array_inv!15722 a!3186)))

(declare-fun b!745668 () Bool)

(declare-fun res!502519 () Bool)

(assert (=> b!745668 (=> (not res!502519) (not e!416455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41625 (_ BitVec 32)) Bool)

(assert (=> b!745668 (= res!502519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745669 () Bool)

(declare-fun res!502522 () Bool)

(assert (=> b!745669 (=> (not res!502522) (not e!416459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745669 (= res!502522 (validKeyInArray!0 k!2102))))

(declare-fun b!745670 () Bool)

(declare-fun res!502527 () Bool)

(assert (=> b!745670 (=> (not res!502527) (not e!416459))))

(assert (=> b!745670 (= res!502527 (validKeyInArray!0 (select (arr!19926 a!3186) j!159)))))

(declare-fun e!416458 () Bool)

(declare-fun lt!331292 () SeekEntryResult!7526)

(declare-fun b!745671 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41625 (_ BitVec 32)) SeekEntryResult!7526)

(assert (=> b!745671 (= e!416458 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19926 a!3186) j!159) a!3186 mask!3328) lt!331292))))

(declare-fun b!745672 () Bool)

(declare-fun e!416460 () Bool)

(assert (=> b!745672 (= e!416460 e!416457)))

(declare-fun res!502523 () Bool)

(assert (=> b!745672 (=> res!502523 e!416457)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331291 () (_ BitVec 64))

(assert (=> b!745672 (= res!502523 (or (not (= lt!331290 lt!331292)) (= (select (store (arr!19926 a!3186) i!1173 k!2102) index!1321) lt!331291) (not (= (select (store (arr!19926 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745672 (= lt!331290 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19926 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745673 () Bool)

(declare-fun res!502525 () Bool)

(assert (=> b!745673 (=> (not res!502525) (not e!416459))))

(assert (=> b!745673 (= res!502525 (and (= (size!20347 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20347 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20347 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745674 () Bool)

(declare-fun res!502517 () Bool)

(assert (=> b!745674 (=> (not res!502517) (not e!416455))))

(assert (=> b!745674 (= res!502517 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20347 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20347 a!3186))))))

(declare-fun b!745675 () Bool)

(declare-fun res!502528 () Bool)

(assert (=> b!745675 (=> (not res!502528) (not e!416461))))

(assert (=> b!745675 (= res!502528 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19926 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745676 () Bool)

(assert (=> b!745676 (= e!416454 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19926 a!3186) j!159) a!3186 mask!3328) (Found!7526 j!159)))))

(declare-fun b!745677 () Bool)

(declare-fun res!502516 () Bool)

(assert (=> b!745677 (=> (not res!502516) (not e!416455))))

(declare-datatypes ((List!13928 0))(
  ( (Nil!13925) (Cons!13924 (h!14996 (_ BitVec 64)) (t!20243 List!13928)) )
))
(declare-fun arrayNoDuplicates!0 (array!41625 (_ BitVec 32) List!13928) Bool)

(assert (=> b!745677 (= res!502516 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13925))))

(declare-fun b!745678 () Bool)

(declare-fun e!416456 () Bool)

(assert (=> b!745678 (= e!416456 (not e!416460))))

(declare-fun res!502518 () Bool)

(assert (=> b!745678 (=> res!502518 e!416460)))

(declare-fun lt!331293 () SeekEntryResult!7526)

(assert (=> b!745678 (= res!502518 (or (not (is-Intermediate!7526 lt!331293)) (bvslt x!1131 (x!63428 lt!331293)) (not (= x!1131 (x!63428 lt!331293))) (not (= index!1321 (index!32474 lt!331293)))))))

(assert (=> b!745678 e!416458))

(declare-fun res!502529 () Bool)

(assert (=> b!745678 (=> (not res!502529) (not e!416458))))

(assert (=> b!745678 (= res!502529 (= lt!331287 lt!331292))))

(assert (=> b!745678 (= lt!331292 (Found!7526 j!159))))

(assert (=> b!745678 (= lt!331287 (seekEntryOrOpen!0 (select (arr!19926 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!745678 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25532 0))(
  ( (Unit!25533) )
))
(declare-fun lt!331294 () Unit!25532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25532)

(assert (=> b!745678 (= lt!331294 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745679 () Bool)

(assert (=> b!745679 (= e!416461 e!416456)))

(declare-fun res!502526 () Bool)

(assert (=> b!745679 (=> (not res!502526) (not e!416456))))

(declare-fun lt!331289 () SeekEntryResult!7526)

(assert (=> b!745679 (= res!502526 (= lt!331289 lt!331293))))

(declare-fun lt!331286 () array!41625)

(assert (=> b!745679 (= lt!331293 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331291 lt!331286 mask!3328))))

(assert (=> b!745679 (= lt!331289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331291 mask!3328) lt!331291 lt!331286 mask!3328))))

(assert (=> b!745679 (= lt!331291 (select (store (arr!19926 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745679 (= lt!331286 (array!41626 (store (arr!19926 a!3186) i!1173 k!2102) (size!20347 a!3186)))))

(declare-fun b!745680 () Bool)

(assert (=> b!745680 (= e!416454 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19926 a!3186) j!159) a!3186 mask!3328) lt!331288))))

(assert (= (and start!65452 res!502515) b!745673))

(assert (= (and b!745673 res!502525) b!745670))

(assert (= (and b!745670 res!502527) b!745669))

(assert (= (and b!745669 res!502522) b!745667))

(assert (= (and b!745667 res!502514) b!745663))

(assert (= (and b!745663 res!502521) b!745668))

(assert (= (and b!745668 res!502519) b!745677))

(assert (= (and b!745677 res!502516) b!745674))

(assert (= (and b!745674 res!502517) b!745664))

(assert (= (and b!745664 res!502520) b!745675))

(assert (= (and b!745675 res!502528) b!745666))

(assert (= (and b!745666 c!81955) b!745680))

(assert (= (and b!745666 (not c!81955)) b!745676))

(assert (= (and b!745666 res!502524) b!745679))

(assert (= (and b!745679 res!502526) b!745678))

(assert (= (and b!745678 res!502529) b!745671))

(assert (= (and b!745678 (not res!502518)) b!745672))

(assert (= (and b!745672 (not res!502523)) b!745665))

(declare-fun m!696007 () Bool)

(assert (=> b!745672 m!696007))

(declare-fun m!696009 () Bool)

(assert (=> b!745672 m!696009))

(declare-fun m!696011 () Bool)

(assert (=> b!745672 m!696011))

(assert (=> b!745672 m!696011))

(declare-fun m!696013 () Bool)

(assert (=> b!745672 m!696013))

(assert (=> b!745671 m!696011))

(assert (=> b!745671 m!696011))

(declare-fun m!696015 () Bool)

(assert (=> b!745671 m!696015))

(declare-fun m!696017 () Bool)

(assert (=> b!745679 m!696017))

(declare-fun m!696019 () Bool)

(assert (=> b!745679 m!696019))

(assert (=> b!745679 m!696007))

(assert (=> b!745679 m!696017))

(declare-fun m!696021 () Bool)

(assert (=> b!745679 m!696021))

(declare-fun m!696023 () Bool)

(assert (=> b!745679 m!696023))

(declare-fun m!696025 () Bool)

(assert (=> b!745675 m!696025))

(declare-fun m!696027 () Bool)

(assert (=> b!745677 m!696027))

(assert (=> b!745670 m!696011))

(assert (=> b!745670 m!696011))

(declare-fun m!696029 () Bool)

(assert (=> b!745670 m!696029))

(assert (=> b!745678 m!696011))

(assert (=> b!745678 m!696011))

(declare-fun m!696031 () Bool)

(assert (=> b!745678 m!696031))

(declare-fun m!696033 () Bool)

(assert (=> b!745678 m!696033))

(declare-fun m!696035 () Bool)

(assert (=> b!745678 m!696035))

(declare-fun m!696037 () Bool)

(assert (=> b!745668 m!696037))

(declare-fun m!696039 () Bool)

(assert (=> b!745663 m!696039))

(assert (=> b!745676 m!696011))

(assert (=> b!745676 m!696011))

(assert (=> b!745676 m!696013))

(declare-fun m!696041 () Bool)

(assert (=> b!745667 m!696041))

(declare-fun m!696043 () Bool)

(assert (=> b!745669 m!696043))

(assert (=> b!745664 m!696011))

(assert (=> b!745664 m!696011))

(declare-fun m!696045 () Bool)

(assert (=> b!745664 m!696045))

(assert (=> b!745664 m!696045))

(assert (=> b!745664 m!696011))

(declare-fun m!696047 () Bool)

(assert (=> b!745664 m!696047))

(assert (=> b!745680 m!696011))

(assert (=> b!745680 m!696011))

(declare-fun m!696049 () Bool)

(assert (=> b!745680 m!696049))

(declare-fun m!696051 () Bool)

(assert (=> start!65452 m!696051))

(declare-fun m!696053 () Bool)

(assert (=> start!65452 m!696053))

(push 1)

