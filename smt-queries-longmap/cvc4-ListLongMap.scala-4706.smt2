; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65300 () Bool)

(assert start!65300)

(declare-fun b!741443 () Bool)

(declare-fun e!414453 () Bool)

(declare-fun e!414449 () Bool)

(assert (=> b!741443 (= e!414453 e!414449)))

(declare-fun res!498755 () Bool)

(assert (=> b!741443 (=> (not res!498755) (not e!414449))))

(declare-datatypes ((SeekEntryResult!7450 0))(
  ( (MissingZero!7450 (index!32168 (_ BitVec 32))) (Found!7450 (index!32169 (_ BitVec 32))) (Intermediate!7450 (undefined!8262 Bool) (index!32170 (_ BitVec 32)) (x!63144 (_ BitVec 32))) (Undefined!7450) (MissingVacant!7450 (index!32171 (_ BitVec 32))) )
))
(declare-fun lt!329408 () SeekEntryResult!7450)

(declare-datatypes ((array!41473 0))(
  ( (array!41474 (arr!19850 (Array (_ BitVec 32) (_ BitVec 64))) (size!20271 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41473)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41473 (_ BitVec 32)) SeekEntryResult!7450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741443 (= res!498755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19850 a!3186) j!159) mask!3328) (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329408))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741443 (= lt!329408 (Intermediate!7450 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741444 () Bool)

(declare-fun res!498763 () Bool)

(assert (=> b!741444 (=> (not res!498763) (not e!414449))))

(declare-fun e!414452 () Bool)

(assert (=> b!741444 (= res!498763 e!414452)))

(declare-fun c!81727 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!741444 (= c!81727 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741445 () Bool)

(declare-fun res!498759 () Bool)

(declare-fun e!414448 () Bool)

(assert (=> b!741445 (=> (not res!498759) (not e!414448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741445 (= res!498759 (validKeyInArray!0 (select (arr!19850 a!3186) j!159)))))

(declare-fun b!741446 () Bool)

(declare-fun e!414454 () Bool)

(assert (=> b!741446 (= e!414449 e!414454)))

(declare-fun res!498761 () Bool)

(assert (=> b!741446 (=> (not res!498761) (not e!414454))))

(declare-fun lt!329410 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329406 () array!41473)

(assert (=> b!741446 (= res!498761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329410 mask!3328) lt!329410 lt!329406 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329410 lt!329406 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!741446 (= lt!329410 (select (store (arr!19850 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741446 (= lt!329406 (array!41474 (store (arr!19850 a!3186) i!1173 k!2102) (size!20271 a!3186)))))

(declare-fun b!741447 () Bool)

(declare-fun res!498752 () Bool)

(assert (=> b!741447 (=> (not res!498752) (not e!414453))))

(declare-datatypes ((List!13852 0))(
  ( (Nil!13849) (Cons!13848 (h!14920 (_ BitVec 64)) (t!20167 List!13852)) )
))
(declare-fun arrayNoDuplicates!0 (array!41473 (_ BitVec 32) List!13852) Bool)

(assert (=> b!741447 (= res!498752 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13849))))

(declare-fun b!741448 () Bool)

(assert (=> b!741448 (= e!414452 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329408))))

(declare-fun b!741449 () Bool)

(declare-fun e!414455 () Bool)

(declare-fun e!414450 () Bool)

(assert (=> b!741449 (= e!414455 e!414450)))

(declare-fun res!498753 () Bool)

(assert (=> b!741449 (=> (not res!498753) (not e!414450))))

(declare-fun lt!329409 () SeekEntryResult!7450)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41473 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!741449 (= res!498753 (= (seekEntryOrOpen!0 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329409))))

(assert (=> b!741449 (= lt!329409 (Found!7450 j!159))))

(declare-fun b!741450 () Bool)

(declare-fun res!498751 () Bool)

(assert (=> b!741450 (=> (not res!498751) (not e!414448))))

(assert (=> b!741450 (= res!498751 (validKeyInArray!0 k!2102))))

(declare-fun res!498756 () Bool)

(assert (=> start!65300 (=> (not res!498756) (not e!414448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65300 (= res!498756 (validMask!0 mask!3328))))

(assert (=> start!65300 e!414448))

(assert (=> start!65300 true))

(declare-fun array_inv!15646 (array!41473) Bool)

(assert (=> start!65300 (array_inv!15646 a!3186)))

(declare-fun b!741451 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41473 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!741451 (= e!414450 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) lt!329409))))

(declare-fun b!741452 () Bool)

(assert (=> b!741452 (= e!414454 (not true))))

(assert (=> b!741452 e!414455))

(declare-fun res!498762 () Bool)

(assert (=> b!741452 (=> (not res!498762) (not e!414455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41473 (_ BitVec 32)) Bool)

(assert (=> b!741452 (= res!498762 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25380 0))(
  ( (Unit!25381) )
))
(declare-fun lt!329411 () Unit!25380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25380)

(assert (=> b!741452 (= lt!329411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741453 () Bool)

(declare-fun res!498754 () Bool)

(assert (=> b!741453 (=> (not res!498754) (not e!414449))))

(assert (=> b!741453 (= res!498754 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19850 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741454 () Bool)

(declare-fun res!498764 () Bool)

(assert (=> b!741454 (=> (not res!498764) (not e!414453))))

(assert (=> b!741454 (= res!498764 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20271 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20271 a!3186))))))

(declare-fun b!741455 () Bool)

(declare-fun res!498758 () Bool)

(assert (=> b!741455 (=> (not res!498758) (not e!414448))))

(assert (=> b!741455 (= res!498758 (and (= (size!20271 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20271 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20271 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741456 () Bool)

(declare-fun res!498760 () Bool)

(assert (=> b!741456 (=> (not res!498760) (not e!414448))))

(declare-fun arrayContainsKey!0 (array!41473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741456 (= res!498760 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741457 () Bool)

(assert (=> b!741457 (= e!414448 e!414453)))

(declare-fun res!498750 () Bool)

(assert (=> b!741457 (=> (not res!498750) (not e!414453))))

(declare-fun lt!329407 () SeekEntryResult!7450)

(assert (=> b!741457 (= res!498750 (or (= lt!329407 (MissingZero!7450 i!1173)) (= lt!329407 (MissingVacant!7450 i!1173))))))

(assert (=> b!741457 (= lt!329407 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741458 () Bool)

(assert (=> b!741458 (= e!414452 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19850 a!3186) j!159) a!3186 mask!3328) (Found!7450 j!159)))))

(declare-fun b!741459 () Bool)

(declare-fun res!498757 () Bool)

(assert (=> b!741459 (=> (not res!498757) (not e!414453))))

(assert (=> b!741459 (= res!498757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65300 res!498756) b!741455))

(assert (= (and b!741455 res!498758) b!741445))

(assert (= (and b!741445 res!498759) b!741450))

(assert (= (and b!741450 res!498751) b!741456))

(assert (= (and b!741456 res!498760) b!741457))

(assert (= (and b!741457 res!498750) b!741459))

(assert (= (and b!741459 res!498757) b!741447))

(assert (= (and b!741447 res!498752) b!741454))

(assert (= (and b!741454 res!498764) b!741443))

(assert (= (and b!741443 res!498755) b!741453))

(assert (= (and b!741453 res!498754) b!741444))

(assert (= (and b!741444 c!81727) b!741448))

(assert (= (and b!741444 (not c!81727)) b!741458))

(assert (= (and b!741444 res!498763) b!741446))

(assert (= (and b!741446 res!498761) b!741452))

(assert (= (and b!741452 res!498762) b!741449))

(assert (= (and b!741449 res!498753) b!741451))

(declare-fun m!692415 () Bool)

(assert (=> b!741443 m!692415))

(assert (=> b!741443 m!692415))

(declare-fun m!692417 () Bool)

(assert (=> b!741443 m!692417))

(assert (=> b!741443 m!692417))

(assert (=> b!741443 m!692415))

(declare-fun m!692419 () Bool)

(assert (=> b!741443 m!692419))

(assert (=> b!741448 m!692415))

(assert (=> b!741448 m!692415))

(declare-fun m!692421 () Bool)

(assert (=> b!741448 m!692421))

(assert (=> b!741458 m!692415))

(assert (=> b!741458 m!692415))

(declare-fun m!692423 () Bool)

(assert (=> b!741458 m!692423))

(declare-fun m!692425 () Bool)

(assert (=> b!741453 m!692425))

(declare-fun m!692427 () Bool)

(assert (=> start!65300 m!692427))

(declare-fun m!692429 () Bool)

(assert (=> start!65300 m!692429))

(declare-fun m!692431 () Bool)

(assert (=> b!741452 m!692431))

(declare-fun m!692433 () Bool)

(assert (=> b!741452 m!692433))

(declare-fun m!692435 () Bool)

(assert (=> b!741459 m!692435))

(assert (=> b!741451 m!692415))

(assert (=> b!741451 m!692415))

(declare-fun m!692437 () Bool)

(assert (=> b!741451 m!692437))

(declare-fun m!692439 () Bool)

(assert (=> b!741447 m!692439))

(declare-fun m!692441 () Bool)

(assert (=> b!741446 m!692441))

(declare-fun m!692443 () Bool)

(assert (=> b!741446 m!692443))

(declare-fun m!692445 () Bool)

(assert (=> b!741446 m!692445))

(declare-fun m!692447 () Bool)

(assert (=> b!741446 m!692447))

(assert (=> b!741446 m!692445))

(declare-fun m!692449 () Bool)

(assert (=> b!741446 m!692449))

(declare-fun m!692451 () Bool)

(assert (=> b!741450 m!692451))

(assert (=> b!741445 m!692415))

(assert (=> b!741445 m!692415))

(declare-fun m!692453 () Bool)

(assert (=> b!741445 m!692453))

(declare-fun m!692455 () Bool)

(assert (=> b!741457 m!692455))

(assert (=> b!741449 m!692415))

(assert (=> b!741449 m!692415))

(declare-fun m!692457 () Bool)

(assert (=> b!741449 m!692457))

(declare-fun m!692459 () Bool)

(assert (=> b!741456 m!692459))

(push 1)

