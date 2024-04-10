; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27262 () Bool)

(assert start!27262)

(declare-fun res!145438 () Bool)

(declare-fun e!179281 () Bool)

(assert (=> start!27262 (=> (not res!145438) (not e!179281))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27262 (= res!145438 (validMask!0 mask!3868))))

(assert (=> start!27262 e!179281))

(declare-datatypes ((array!14080 0))(
  ( (array!14081 (arr!6682 (Array (_ BitVec 32) (_ BitVec 64))) (size!7034 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14080)

(declare-fun array_inv!4645 (array!14080) Bool)

(assert (=> start!27262 (array_inv!4645 a!3325)))

(assert (=> start!27262 true))

(declare-fun b!282363 () Bool)

(declare-fun e!179282 () Bool)

(assert (=> b!282363 (= e!179282 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14080 (_ BitVec 32)) Bool)

(assert (=> b!282363 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8964 0))(
  ( (Unit!8965) )
))
(declare-fun lt!139505 () Unit!8964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282363 (= lt!139505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139503 () array!14080)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1840 0))(
  ( (MissingZero!1840 (index!9530 (_ BitVec 32))) (Found!1840 (index!9531 (_ BitVec 32))) (Intermediate!1840 (undefined!2652 Bool) (index!9532 (_ BitVec 32)) (x!27742 (_ BitVec 32))) (Undefined!1840) (MissingVacant!1840 (index!9533 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14080 (_ BitVec 32)) SeekEntryResult!1840)

(assert (=> b!282363 (= (seekEntryOrOpen!0 (select (arr!6682 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6682 a!3325) i!1267 k!2581) startIndex!26) lt!139503 mask!3868))))

(declare-fun lt!139504 () Unit!8964)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14080 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282363 (= lt!139504 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4490 0))(
  ( (Nil!4487) (Cons!4486 (h!5156 (_ BitVec 64)) (t!9572 List!4490)) )
))
(declare-fun arrayNoDuplicates!0 (array!14080 (_ BitVec 32) List!4490) Bool)

(assert (=> b!282363 (arrayNoDuplicates!0 lt!139503 #b00000000000000000000000000000000 Nil!4487)))

(declare-fun lt!139506 () Unit!8964)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14080 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4490) Unit!8964)

(assert (=> b!282363 (= lt!139506 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4487))))

(declare-fun b!282364 () Bool)

(declare-fun res!145437 () Bool)

(assert (=> b!282364 (=> (not res!145437) (not e!179281))))

(assert (=> b!282364 (= res!145437 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4487))))

(declare-fun b!282365 () Bool)

(declare-fun res!145439 () Bool)

(declare-fun e!179279 () Bool)

(assert (=> b!282365 (=> (not res!145439) (not e!179279))))

(assert (=> b!282365 (= res!145439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282366 () Bool)

(declare-fun res!145433 () Bool)

(assert (=> b!282366 (=> (not res!145433) (not e!179282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282366 (= res!145433 (validKeyInArray!0 (select (arr!6682 a!3325) startIndex!26)))))

(declare-fun b!282367 () Bool)

(assert (=> b!282367 (= e!179281 e!179279)))

(declare-fun res!145436 () Bool)

(assert (=> b!282367 (=> (not res!145436) (not e!179279))))

(declare-fun lt!139507 () SeekEntryResult!1840)

(assert (=> b!282367 (= res!145436 (or (= lt!139507 (MissingZero!1840 i!1267)) (= lt!139507 (MissingVacant!1840 i!1267))))))

(assert (=> b!282367 (= lt!139507 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282368 () Bool)

(declare-fun res!145435 () Bool)

(assert (=> b!282368 (=> (not res!145435) (not e!179281))))

(declare-fun arrayContainsKey!0 (array!14080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282368 (= res!145435 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282369 () Bool)

(declare-fun res!145434 () Bool)

(assert (=> b!282369 (=> (not res!145434) (not e!179281))))

(assert (=> b!282369 (= res!145434 (and (= (size!7034 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7034 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7034 a!3325))))))

(declare-fun b!282370 () Bool)

(declare-fun res!145432 () Bool)

(assert (=> b!282370 (=> (not res!145432) (not e!179281))))

(assert (=> b!282370 (= res!145432 (validKeyInArray!0 k!2581))))

(declare-fun b!282371 () Bool)

(assert (=> b!282371 (= e!179279 e!179282)))

(declare-fun res!145440 () Bool)

(assert (=> b!282371 (=> (not res!145440) (not e!179282))))

(assert (=> b!282371 (= res!145440 (not (= startIndex!26 i!1267)))))

(assert (=> b!282371 (= lt!139503 (array!14081 (store (arr!6682 a!3325) i!1267 k!2581) (size!7034 a!3325)))))

(assert (= (and start!27262 res!145438) b!282369))

(assert (= (and b!282369 res!145434) b!282370))

(assert (= (and b!282370 res!145432) b!282364))

(assert (= (and b!282364 res!145437) b!282368))

(assert (= (and b!282368 res!145435) b!282367))

(assert (= (and b!282367 res!145436) b!282365))

(assert (= (and b!282365 res!145439) b!282371))

(assert (= (and b!282371 res!145440) b!282366))

(assert (= (and b!282366 res!145433) b!282363))

(declare-fun m!296907 () Bool)

(assert (=> b!282371 m!296907))

(declare-fun m!296909 () Bool)

(assert (=> b!282368 m!296909))

(declare-fun m!296911 () Bool)

(assert (=> b!282363 m!296911))

(declare-fun m!296913 () Bool)

(assert (=> b!282363 m!296913))

(assert (=> b!282363 m!296907))

(declare-fun m!296915 () Bool)

(assert (=> b!282363 m!296915))

(declare-fun m!296917 () Bool)

(assert (=> b!282363 m!296917))

(declare-fun m!296919 () Bool)

(assert (=> b!282363 m!296919))

(declare-fun m!296921 () Bool)

(assert (=> b!282363 m!296921))

(declare-fun m!296923 () Bool)

(assert (=> b!282363 m!296923))

(declare-fun m!296925 () Bool)

(assert (=> b!282363 m!296925))

(assert (=> b!282363 m!296913))

(declare-fun m!296927 () Bool)

(assert (=> b!282363 m!296927))

(assert (=> b!282363 m!296919))

(declare-fun m!296929 () Bool)

(assert (=> b!282370 m!296929))

(declare-fun m!296931 () Bool)

(assert (=> b!282367 m!296931))

(declare-fun m!296933 () Bool)

(assert (=> b!282365 m!296933))

(declare-fun m!296935 () Bool)

(assert (=> b!282364 m!296935))

(assert (=> b!282366 m!296919))

(assert (=> b!282366 m!296919))

(declare-fun m!296937 () Bool)

(assert (=> b!282366 m!296937))

(declare-fun m!296939 () Bool)

(assert (=> start!27262 m!296939))

(declare-fun m!296941 () Bool)

(assert (=> start!27262 m!296941))

(push 1)

