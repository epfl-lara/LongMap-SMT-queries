; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65406 () Bool)

(assert start!65406)

(declare-fun b!744394 () Bool)

(declare-fun res!501392 () Bool)

(declare-fun e!415835 () Bool)

(assert (=> b!744394 (=> (not res!501392) (not e!415835))))

(declare-datatypes ((array!41579 0))(
  ( (array!41580 (arr!19903 (Array (_ BitVec 32) (_ BitVec 64))) (size!20324 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41579)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744394 (= res!501392 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744395 () Bool)

(declare-fun e!415833 () Bool)

(assert (=> b!744395 (= e!415835 e!415833)))

(declare-fun res!501391 () Bool)

(assert (=> b!744395 (=> (not res!501391) (not e!415833))))

(declare-datatypes ((SeekEntryResult!7503 0))(
  ( (MissingZero!7503 (index!32380 (_ BitVec 32))) (Found!7503 (index!32381 (_ BitVec 32))) (Intermediate!7503 (undefined!8315 Bool) (index!32382 (_ BitVec 32)) (x!63341 (_ BitVec 32))) (Undefined!7503) (MissingVacant!7503 (index!32383 (_ BitVec 32))) )
))
(declare-fun lt!330696 () SeekEntryResult!7503)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744395 (= res!501391 (or (= lt!330696 (MissingZero!7503 i!1173)) (= lt!330696 (MissingVacant!7503 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41579 (_ BitVec 32)) SeekEntryResult!7503)

(assert (=> b!744395 (= lt!330696 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744396 () Bool)

(declare-fun res!501383 () Bool)

(assert (=> b!744396 (=> (not res!501383) (not e!415833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41579 (_ BitVec 32)) Bool)

(assert (=> b!744396 (= res!501383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744397 () Bool)

(declare-fun e!415840 () Bool)

(assert (=> b!744397 (= e!415840 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330694 () SeekEntryResult!7503)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41579 (_ BitVec 32)) SeekEntryResult!7503)

(assert (=> b!744397 (= lt!330694 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19903 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744398 () Bool)

(declare-fun res!501389 () Bool)

(declare-fun e!415836 () Bool)

(assert (=> b!744398 (=> (not res!501389) (not e!415836))))

(declare-fun e!415838 () Bool)

(assert (=> b!744398 (= res!501389 e!415838)))

(declare-fun c!81886 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744398 (= c!81886 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744399 () Bool)

(declare-fun res!501397 () Bool)

(assert (=> b!744399 (=> (not res!501397) (not e!415833))))

(assert (=> b!744399 (= res!501397 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20324 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20324 a!3186))))))

(declare-fun b!744400 () Bool)

(declare-fun res!501395 () Bool)

(assert (=> b!744400 (=> (not res!501395) (not e!415835))))

(assert (=> b!744400 (= res!501395 (and (= (size!20324 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20324 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20324 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!501394 () Bool)

(assert (=> start!65406 (=> (not res!501394) (not e!415835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65406 (= res!501394 (validMask!0 mask!3328))))

(assert (=> start!65406 e!415835))

(assert (=> start!65406 true))

(declare-fun array_inv!15699 (array!41579) Bool)

(assert (=> start!65406 (array_inv!15699 a!3186)))

(declare-fun b!744401 () Bool)

(declare-fun lt!330697 () SeekEntryResult!7503)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41579 (_ BitVec 32)) SeekEntryResult!7503)

(assert (=> b!744401 (= e!415838 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!330697))))

(declare-fun e!415834 () Bool)

(declare-fun b!744402 () Bool)

(declare-fun lt!330693 () SeekEntryResult!7503)

(assert (=> b!744402 (= e!415834 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!330693))))

(declare-fun b!744403 () Bool)

(declare-fun e!415841 () Bool)

(assert (=> b!744403 (= e!415841 (not e!415840))))

(declare-fun res!501388 () Bool)

(assert (=> b!744403 (=> res!501388 e!415840)))

(declare-fun lt!330690 () SeekEntryResult!7503)

(get-info :version)

(assert (=> b!744403 (= res!501388 (or (not ((_ is Intermediate!7503) lt!330690)) (bvslt x!1131 (x!63341 lt!330690)) (not (= x!1131 (x!63341 lt!330690))) (not (= index!1321 (index!32382 lt!330690)))))))

(declare-fun e!415837 () Bool)

(assert (=> b!744403 e!415837))

(declare-fun res!501393 () Bool)

(assert (=> b!744403 (=> (not res!501393) (not e!415837))))

(assert (=> b!744403 (= res!501393 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25486 0))(
  ( (Unit!25487) )
))
(declare-fun lt!330695 () Unit!25486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25486)

(assert (=> b!744403 (= lt!330695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744404 () Bool)

(assert (=> b!744404 (= e!415837 e!415834)))

(declare-fun res!501396 () Bool)

(assert (=> b!744404 (=> (not res!501396) (not e!415834))))

(assert (=> b!744404 (= res!501396 (= (seekEntryOrOpen!0 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!330693))))

(assert (=> b!744404 (= lt!330693 (Found!7503 j!159))))

(declare-fun b!744405 () Bool)

(declare-fun res!501387 () Bool)

(assert (=> b!744405 (=> (not res!501387) (not e!415835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744405 (= res!501387 (validKeyInArray!0 (select (arr!19903 a!3186) j!159)))))

(declare-fun b!744406 () Bool)

(declare-fun res!501398 () Bool)

(assert (=> b!744406 (=> (not res!501398) (not e!415835))))

(assert (=> b!744406 (= res!501398 (validKeyInArray!0 k0!2102))))

(declare-fun b!744407 () Bool)

(declare-fun res!501384 () Bool)

(assert (=> b!744407 (=> (not res!501384) (not e!415836))))

(assert (=> b!744407 (= res!501384 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19903 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744408 () Bool)

(assert (=> b!744408 (= e!415836 e!415841)))

(declare-fun res!501385 () Bool)

(assert (=> b!744408 (=> (not res!501385) (not e!415841))))

(declare-fun lt!330698 () SeekEntryResult!7503)

(assert (=> b!744408 (= res!501385 (= lt!330698 lt!330690))))

(declare-fun lt!330692 () (_ BitVec 64))

(declare-fun lt!330691 () array!41579)

(assert (=> b!744408 (= lt!330690 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330692 lt!330691 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744408 (= lt!330698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330692 mask!3328) lt!330692 lt!330691 mask!3328))))

(assert (=> b!744408 (= lt!330692 (select (store (arr!19903 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744408 (= lt!330691 (array!41580 (store (arr!19903 a!3186) i!1173 k0!2102) (size!20324 a!3186)))))

(declare-fun b!744409 () Bool)

(assert (=> b!744409 (= e!415833 e!415836)))

(declare-fun res!501386 () Bool)

(assert (=> b!744409 (=> (not res!501386) (not e!415836))))

(assert (=> b!744409 (= res!501386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19903 a!3186) j!159) mask!3328) (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!330697))))

(assert (=> b!744409 (= lt!330697 (Intermediate!7503 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744410 () Bool)

(declare-fun res!501390 () Bool)

(assert (=> b!744410 (=> (not res!501390) (not e!415833))))

(declare-datatypes ((List!13905 0))(
  ( (Nil!13902) (Cons!13901 (h!14973 (_ BitVec 64)) (t!20220 List!13905)) )
))
(declare-fun arrayNoDuplicates!0 (array!41579 (_ BitVec 32) List!13905) Bool)

(assert (=> b!744410 (= res!501390 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13902))))

(declare-fun b!744411 () Bool)

(assert (=> b!744411 (= e!415838 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) (Found!7503 j!159)))))

(assert (= (and start!65406 res!501394) b!744400))

(assert (= (and b!744400 res!501395) b!744405))

(assert (= (and b!744405 res!501387) b!744406))

(assert (= (and b!744406 res!501398) b!744394))

(assert (= (and b!744394 res!501392) b!744395))

(assert (= (and b!744395 res!501391) b!744396))

(assert (= (and b!744396 res!501383) b!744410))

(assert (= (and b!744410 res!501390) b!744399))

(assert (= (and b!744399 res!501397) b!744409))

(assert (= (and b!744409 res!501386) b!744407))

(assert (= (and b!744407 res!501384) b!744398))

(assert (= (and b!744398 c!81886) b!744401))

(assert (= (and b!744398 (not c!81886)) b!744411))

(assert (= (and b!744398 res!501389) b!744408))

(assert (= (and b!744408 res!501385) b!744403))

(assert (= (and b!744403 res!501393) b!744404))

(assert (= (and b!744404 res!501396) b!744402))

(assert (= (and b!744403 (not res!501388)) b!744397))

(declare-fun m!694931 () Bool)

(assert (=> b!744402 m!694931))

(assert (=> b!744402 m!694931))

(declare-fun m!694933 () Bool)

(assert (=> b!744402 m!694933))

(declare-fun m!694935 () Bool)

(assert (=> b!744403 m!694935))

(declare-fun m!694937 () Bool)

(assert (=> b!744403 m!694937))

(declare-fun m!694939 () Bool)

(assert (=> b!744407 m!694939))

(assert (=> b!744404 m!694931))

(assert (=> b!744404 m!694931))

(declare-fun m!694941 () Bool)

(assert (=> b!744404 m!694941))

(assert (=> b!744401 m!694931))

(assert (=> b!744401 m!694931))

(declare-fun m!694943 () Bool)

(assert (=> b!744401 m!694943))

(declare-fun m!694945 () Bool)

(assert (=> b!744395 m!694945))

(declare-fun m!694947 () Bool)

(assert (=> b!744406 m!694947))

(declare-fun m!694949 () Bool)

(assert (=> b!744396 m!694949))

(declare-fun m!694951 () Bool)

(assert (=> b!744394 m!694951))

(declare-fun m!694953 () Bool)

(assert (=> b!744408 m!694953))

(declare-fun m!694955 () Bool)

(assert (=> b!744408 m!694955))

(assert (=> b!744408 m!694953))

(declare-fun m!694957 () Bool)

(assert (=> b!744408 m!694957))

(declare-fun m!694959 () Bool)

(assert (=> b!744408 m!694959))

(declare-fun m!694961 () Bool)

(assert (=> b!744408 m!694961))

(declare-fun m!694963 () Bool)

(assert (=> start!65406 m!694963))

(declare-fun m!694965 () Bool)

(assert (=> start!65406 m!694965))

(assert (=> b!744397 m!694931))

(assert (=> b!744397 m!694931))

(declare-fun m!694967 () Bool)

(assert (=> b!744397 m!694967))

(assert (=> b!744409 m!694931))

(assert (=> b!744409 m!694931))

(declare-fun m!694969 () Bool)

(assert (=> b!744409 m!694969))

(assert (=> b!744409 m!694969))

(assert (=> b!744409 m!694931))

(declare-fun m!694971 () Bool)

(assert (=> b!744409 m!694971))

(declare-fun m!694973 () Bool)

(assert (=> b!744410 m!694973))

(assert (=> b!744405 m!694931))

(assert (=> b!744405 m!694931))

(declare-fun m!694975 () Bool)

(assert (=> b!744405 m!694975))

(assert (=> b!744411 m!694931))

(assert (=> b!744411 m!694931))

(assert (=> b!744411 m!694967))

(check-sat (not b!744406) (not b!744396) (not b!744402) (not b!744395) (not b!744401) (not b!744397) (not start!65406) (not b!744408) (not b!744405) (not b!744403) (not b!744394) (not b!744411) (not b!744404) (not b!744410) (not b!744409))
(check-sat)
