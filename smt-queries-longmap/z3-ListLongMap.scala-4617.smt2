; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64398 () Bool)

(assert start!64398)

(declare-fun b!723395 () Bool)

(declare-fun e!405382 () Bool)

(declare-fun e!405383 () Bool)

(assert (=> b!723395 (= e!405382 e!405383)))

(declare-fun res!484871 () Bool)

(assert (=> b!723395 (=> (not res!484871) (not e!405383))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!40912 0))(
  ( (array!40913 (arr!19576 (Array (_ BitVec 32) (_ BitVec 64))) (size!19996 (_ BitVec 32))) )
))
(declare-fun lt!320675 () array!40912)

(declare-fun lt!320676 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7132 0))(
  ( (MissingZero!7132 (index!30896 (_ BitVec 32))) (Found!7132 (index!30897 (_ BitVec 32))) (Intermediate!7132 (undefined!7944 Bool) (index!30898 (_ BitVec 32)) (x!62048 (_ BitVec 32))) (Undefined!7132) (MissingVacant!7132 (index!30899 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40912 (_ BitVec 32)) SeekEntryResult!7132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723395 (= res!484871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320676 mask!3328) lt!320676 lt!320675 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320676 lt!320675 mask!3328)))))

(declare-fun a!3186 () array!40912)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!723395 (= lt!320676 (select (store (arr!19576 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723395 (= lt!320675 (array!40913 (store (arr!19576 a!3186) i!1173 k0!2102) (size!19996 a!3186)))))

(declare-fun b!723396 () Bool)

(declare-fun res!484870 () Bool)

(declare-fun e!405381 () Bool)

(assert (=> b!723396 (=> (not res!484870) (not e!405381))))

(declare-datatypes ((List!13485 0))(
  ( (Nil!13482) (Cons!13481 (h!14538 (_ BitVec 64)) (t!19792 List!13485)) )
))
(declare-fun arrayNoDuplicates!0 (array!40912 (_ BitVec 32) List!13485) Bool)

(assert (=> b!723396 (= res!484870 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13482))))

(declare-fun b!723397 () Bool)

(declare-fun res!484872 () Bool)

(assert (=> b!723397 (=> (not res!484872) (not e!405381))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723397 (= res!484872 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19996 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19996 a!3186))))))

(declare-fun b!723398 () Bool)

(assert (=> b!723398 (= e!405381 e!405382)))

(declare-fun res!484875 () Bool)

(assert (=> b!723398 (=> (not res!484875) (not e!405382))))

(declare-fun lt!320677 () SeekEntryResult!7132)

(assert (=> b!723398 (= res!484875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19576 a!3186) j!159) mask!3328) (select (arr!19576 a!3186) j!159) a!3186 mask!3328) lt!320677))))

(assert (=> b!723398 (= lt!320677 (Intermediate!7132 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!484869 () Bool)

(declare-fun e!405379 () Bool)

(assert (=> start!64398 (=> (not res!484869) (not e!405379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64398 (= res!484869 (validMask!0 mask!3328))))

(assert (=> start!64398 e!405379))

(assert (=> start!64398 true))

(declare-fun array_inv!15435 (array!40912) Bool)

(assert (=> start!64398 (array_inv!15435 a!3186)))

(declare-fun b!723399 () Bool)

(declare-fun e!405380 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40912 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!723399 (= e!405380 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19576 a!3186) j!159) a!3186 mask!3328) (Found!7132 j!159)))))

(declare-fun b!723400 () Bool)

(declare-fun res!484879 () Bool)

(assert (=> b!723400 (=> (not res!484879) (not e!405382))))

(assert (=> b!723400 (= res!484879 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19576 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723401 () Bool)

(declare-fun res!484874 () Bool)

(assert (=> b!723401 (=> (not res!484874) (not e!405379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723401 (= res!484874 (validKeyInArray!0 k0!2102))))

(declare-fun b!723402 () Bool)

(declare-fun res!484878 () Bool)

(assert (=> b!723402 (=> (not res!484878) (not e!405382))))

(assert (=> b!723402 (= res!484878 e!405380)))

(declare-fun c!79637 () Bool)

(assert (=> b!723402 (= c!79637 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723403 () Bool)

(assert (=> b!723403 (= e!405380 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19576 a!3186) j!159) a!3186 mask!3328) lt!320677))))

(declare-fun b!723404 () Bool)

(declare-fun res!484873 () Bool)

(assert (=> b!723404 (=> (not res!484873) (not e!405379))))

(declare-fun arrayContainsKey!0 (array!40912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723404 (= res!484873 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723405 () Bool)

(declare-fun res!484868 () Bool)

(assert (=> b!723405 (=> (not res!484868) (not e!405381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40912 (_ BitVec 32)) Bool)

(assert (=> b!723405 (= res!484868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723406 () Bool)

(assert (=> b!723406 (= e!405379 e!405381)))

(declare-fun res!484877 () Bool)

(assert (=> b!723406 (=> (not res!484877) (not e!405381))))

(declare-fun lt!320679 () SeekEntryResult!7132)

(assert (=> b!723406 (= res!484877 (or (= lt!320679 (MissingZero!7132 i!1173)) (= lt!320679 (MissingVacant!7132 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40912 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!723406 (= lt!320679 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723407 () Bool)

(declare-fun res!484876 () Bool)

(assert (=> b!723407 (=> (not res!484876) (not e!405379))))

(assert (=> b!723407 (= res!484876 (and (= (size!19996 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19996 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19996 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723408 () Bool)

(assert (=> b!723408 (= e!405383 (not true))))

(assert (=> b!723408 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24661 0))(
  ( (Unit!24662) )
))
(declare-fun lt!320678 () Unit!24661)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24661)

(assert (=> b!723408 (= lt!320678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723409 () Bool)

(declare-fun res!484867 () Bool)

(assert (=> b!723409 (=> (not res!484867) (not e!405379))))

(assert (=> b!723409 (= res!484867 (validKeyInArray!0 (select (arr!19576 a!3186) j!159)))))

(assert (= (and start!64398 res!484869) b!723407))

(assert (= (and b!723407 res!484876) b!723409))

(assert (= (and b!723409 res!484867) b!723401))

(assert (= (and b!723401 res!484874) b!723404))

(assert (= (and b!723404 res!484873) b!723406))

(assert (= (and b!723406 res!484877) b!723405))

(assert (= (and b!723405 res!484868) b!723396))

(assert (= (and b!723396 res!484870) b!723397))

(assert (= (and b!723397 res!484872) b!723398))

(assert (= (and b!723398 res!484875) b!723400))

(assert (= (and b!723400 res!484879) b!723402))

(assert (= (and b!723402 c!79637) b!723403))

(assert (= (and b!723402 (not c!79637)) b!723399))

(assert (= (and b!723402 res!484878) b!723395))

(assert (= (and b!723395 res!484871) b!723408))

(declare-fun m!678381 () Bool)

(assert (=> b!723400 m!678381))

(declare-fun m!678383 () Bool)

(assert (=> b!723398 m!678383))

(assert (=> b!723398 m!678383))

(declare-fun m!678385 () Bool)

(assert (=> b!723398 m!678385))

(assert (=> b!723398 m!678385))

(assert (=> b!723398 m!678383))

(declare-fun m!678387 () Bool)

(assert (=> b!723398 m!678387))

(assert (=> b!723409 m!678383))

(assert (=> b!723409 m!678383))

(declare-fun m!678389 () Bool)

(assert (=> b!723409 m!678389))

(declare-fun m!678391 () Bool)

(assert (=> b!723404 m!678391))

(declare-fun m!678393 () Bool)

(assert (=> b!723395 m!678393))

(declare-fun m!678395 () Bool)

(assert (=> b!723395 m!678395))

(declare-fun m!678397 () Bool)

(assert (=> b!723395 m!678397))

(declare-fun m!678399 () Bool)

(assert (=> b!723395 m!678399))

(assert (=> b!723395 m!678395))

(declare-fun m!678401 () Bool)

(assert (=> b!723395 m!678401))

(declare-fun m!678403 () Bool)

(assert (=> b!723401 m!678403))

(assert (=> b!723403 m!678383))

(assert (=> b!723403 m!678383))

(declare-fun m!678405 () Bool)

(assert (=> b!723403 m!678405))

(declare-fun m!678407 () Bool)

(assert (=> b!723406 m!678407))

(declare-fun m!678409 () Bool)

(assert (=> b!723405 m!678409))

(declare-fun m!678411 () Bool)

(assert (=> b!723396 m!678411))

(declare-fun m!678413 () Bool)

(assert (=> start!64398 m!678413))

(declare-fun m!678415 () Bool)

(assert (=> start!64398 m!678415))

(assert (=> b!723399 m!678383))

(assert (=> b!723399 m!678383))

(declare-fun m!678417 () Bool)

(assert (=> b!723399 m!678417))

(declare-fun m!678419 () Bool)

(assert (=> b!723408 m!678419))

(declare-fun m!678421 () Bool)

(assert (=> b!723408 m!678421))

(check-sat (not b!723399) (not b!723401) (not b!723395) (not b!723404) (not b!723403) (not b!723408) (not start!64398) (not b!723409) (not b!723396) (not b!723398) (not b!723406) (not b!723405))
(check-sat)
