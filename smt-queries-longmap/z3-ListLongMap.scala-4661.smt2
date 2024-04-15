; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64718 () Bool)

(assert start!64718)

(declare-fun b!730436 () Bool)

(declare-fun e!408733 () Bool)

(declare-fun e!408734 () Bool)

(assert (=> b!730436 (= e!408733 (not e!408734))))

(declare-fun res!490844 () Bool)

(assert (=> b!730436 (=> res!490844 e!408734)))

(declare-datatypes ((SeekEntryResult!7309 0))(
  ( (MissingZero!7309 (index!31604 (_ BitVec 32))) (Found!7309 (index!31605 (_ BitVec 32))) (Intermediate!7309 (undefined!8121 Bool) (index!31606 (_ BitVec 32)) (x!62590 (_ BitVec 32))) (Undefined!7309) (MissingVacant!7309 (index!31607 (_ BitVec 32))) )
))
(declare-fun lt!323549 () SeekEntryResult!7309)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!730436 (= res!490844 (or (not ((_ is Intermediate!7309) lt!323549)) (bvsge x!1131 (x!62590 lt!323549))))))

(declare-fun e!408735 () Bool)

(assert (=> b!730436 e!408735))

(declare-fun res!490848 () Bool)

(assert (=> b!730436 (=> (not res!490848) (not e!408735))))

(declare-datatypes ((array!41184 0))(
  ( (array!41185 (arr!19712 (Array (_ BitVec 32) (_ BitVec 64))) (size!20133 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41184)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41184 (_ BitVec 32)) Bool)

(assert (=> b!730436 (= res!490848 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24908 0))(
  ( (Unit!24909) )
))
(declare-fun lt!323551 () Unit!24908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24908)

(assert (=> b!730436 (= lt!323551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!408739 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!323555 () SeekEntryResult!7309)

(declare-fun b!730437 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41184 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!730437 (= e!408739 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323555))))

(declare-fun b!730438 () Bool)

(declare-fun res!490852 () Bool)

(declare-fun e!408741 () Bool)

(assert (=> b!730438 (=> (not res!490852) (not e!408741))))

(assert (=> b!730438 (= res!490852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!408740 () Bool)

(declare-fun b!730440 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!730440 (= e!408740 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) (Found!7309 j!159)))))

(declare-fun b!730441 () Bool)

(declare-fun lt!323550 () SeekEntryResult!7309)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41184 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!730441 (= e!408740 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323550))))

(declare-fun b!730442 () Bool)

(declare-fun res!490850 () Bool)

(declare-fun e!408742 () Bool)

(assert (=> b!730442 (=> (not res!490850) (not e!408742))))

(assert (=> b!730442 (= res!490850 e!408740)))

(declare-fun c!80172 () Bool)

(assert (=> b!730442 (= c!80172 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730443 () Bool)

(assert (=> b!730443 (= e!408735 e!408739)))

(declare-fun res!490854 () Bool)

(assert (=> b!730443 (=> (not res!490854) (not e!408739))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41184 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!730443 (= res!490854 (= (seekEntryOrOpen!0 (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323555))))

(assert (=> b!730443 (= lt!323555 (Found!7309 j!159))))

(declare-fun b!730444 () Bool)

(declare-fun res!490842 () Bool)

(assert (=> b!730444 (=> (not res!490842) (not e!408742))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730444 (= res!490842 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19712 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730445 () Bool)

(declare-fun e!408738 () Bool)

(assert (=> b!730445 (= e!408738 e!408741)))

(declare-fun res!490856 () Bool)

(assert (=> b!730445 (=> (not res!490856) (not e!408741))))

(declare-fun lt!323548 () SeekEntryResult!7309)

(assert (=> b!730445 (= res!490856 (or (= lt!323548 (MissingZero!7309 i!1173)) (= lt!323548 (MissingVacant!7309 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730445 (= lt!323548 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730446 () Bool)

(declare-fun res!490853 () Bool)

(assert (=> b!730446 (=> (not res!490853) (not e!408738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730446 (= res!490853 (validKeyInArray!0 k0!2102))))

(declare-fun b!730447 () Bool)

(declare-fun e!408737 () Bool)

(assert (=> b!730447 (= e!408737 true)))

(declare-fun lt!323554 () SeekEntryResult!7309)

(assert (=> b!730447 (= lt!323554 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19712 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!730448 () Bool)

(declare-fun res!490843 () Bool)

(assert (=> b!730448 (=> (not res!490843) (not e!408738))))

(declare-fun arrayContainsKey!0 (array!41184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730448 (= res!490843 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730449 () Bool)

(assert (=> b!730449 (= e!408734 e!408737)))

(declare-fun res!490857 () Bool)

(assert (=> b!730449 (=> res!490857 e!408737)))

(assert (=> b!730449 (= res!490857 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323547 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730449 (= lt!323547 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730450 () Bool)

(declare-fun res!490841 () Bool)

(assert (=> b!730450 (=> (not res!490841) (not e!408741))))

(declare-datatypes ((List!13753 0))(
  ( (Nil!13750) (Cons!13749 (h!14809 (_ BitVec 64)) (t!20059 List!13753)) )
))
(declare-fun arrayNoDuplicates!0 (array!41184 (_ BitVec 32) List!13753) Bool)

(assert (=> b!730450 (= res!490841 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13750))))

(declare-fun b!730451 () Bool)

(assert (=> b!730451 (= e!408742 e!408733)))

(declare-fun res!490855 () Bool)

(assert (=> b!730451 (=> (not res!490855) (not e!408733))))

(declare-fun lt!323546 () SeekEntryResult!7309)

(assert (=> b!730451 (= res!490855 (= lt!323546 lt!323549))))

(declare-fun lt!323552 () array!41184)

(declare-fun lt!323553 () (_ BitVec 64))

(assert (=> b!730451 (= lt!323549 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323553 lt!323552 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730451 (= lt!323546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323553 mask!3328) lt!323553 lt!323552 mask!3328))))

(assert (=> b!730451 (= lt!323553 (select (store (arr!19712 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730451 (= lt!323552 (array!41185 (store (arr!19712 a!3186) i!1173 k0!2102) (size!20133 a!3186)))))

(declare-fun b!730439 () Bool)

(declare-fun res!490851 () Bool)

(assert (=> b!730439 (=> (not res!490851) (not e!408738))))

(assert (=> b!730439 (= res!490851 (and (= (size!20133 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20133 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20133 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!490849 () Bool)

(assert (=> start!64718 (=> (not res!490849) (not e!408738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64718 (= res!490849 (validMask!0 mask!3328))))

(assert (=> start!64718 e!408738))

(assert (=> start!64718 true))

(declare-fun array_inv!15595 (array!41184) Bool)

(assert (=> start!64718 (array_inv!15595 a!3186)))

(declare-fun b!730452 () Bool)

(assert (=> b!730452 (= e!408741 e!408742)))

(declare-fun res!490846 () Bool)

(assert (=> b!730452 (=> (not res!490846) (not e!408742))))

(assert (=> b!730452 (= res!490846 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19712 a!3186) j!159) mask!3328) (select (arr!19712 a!3186) j!159) a!3186 mask!3328) lt!323550))))

(assert (=> b!730452 (= lt!323550 (Intermediate!7309 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730453 () Bool)

(declare-fun res!490845 () Bool)

(assert (=> b!730453 (=> (not res!490845) (not e!408741))))

(assert (=> b!730453 (= res!490845 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20133 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20133 a!3186))))))

(declare-fun b!730454 () Bool)

(declare-fun res!490847 () Bool)

(assert (=> b!730454 (=> (not res!490847) (not e!408738))))

(assert (=> b!730454 (= res!490847 (validKeyInArray!0 (select (arr!19712 a!3186) j!159)))))

(assert (= (and start!64718 res!490849) b!730439))

(assert (= (and b!730439 res!490851) b!730454))

(assert (= (and b!730454 res!490847) b!730446))

(assert (= (and b!730446 res!490853) b!730448))

(assert (= (and b!730448 res!490843) b!730445))

(assert (= (and b!730445 res!490856) b!730438))

(assert (= (and b!730438 res!490852) b!730450))

(assert (= (and b!730450 res!490841) b!730453))

(assert (= (and b!730453 res!490845) b!730452))

(assert (= (and b!730452 res!490846) b!730444))

(assert (= (and b!730444 res!490842) b!730442))

(assert (= (and b!730442 c!80172) b!730441))

(assert (= (and b!730442 (not c!80172)) b!730440))

(assert (= (and b!730442 res!490850) b!730451))

(assert (= (and b!730451 res!490855) b!730436))

(assert (= (and b!730436 res!490848) b!730443))

(assert (= (and b!730443 res!490854) b!730437))

(assert (= (and b!730436 (not res!490844)) b!730449))

(assert (= (and b!730449 (not res!490857)) b!730447))

(declare-fun m!683429 () Bool)

(assert (=> b!730445 m!683429))

(declare-fun m!683431 () Bool)

(assert (=> b!730451 m!683431))

(declare-fun m!683433 () Bool)

(assert (=> b!730451 m!683433))

(declare-fun m!683435 () Bool)

(assert (=> b!730451 m!683435))

(declare-fun m!683437 () Bool)

(assert (=> b!730451 m!683437))

(assert (=> b!730451 m!683431))

(declare-fun m!683439 () Bool)

(assert (=> b!730451 m!683439))

(declare-fun m!683441 () Bool)

(assert (=> b!730452 m!683441))

(assert (=> b!730452 m!683441))

(declare-fun m!683443 () Bool)

(assert (=> b!730452 m!683443))

(assert (=> b!730452 m!683443))

(assert (=> b!730452 m!683441))

(declare-fun m!683445 () Bool)

(assert (=> b!730452 m!683445))

(declare-fun m!683447 () Bool)

(assert (=> b!730450 m!683447))

(declare-fun m!683449 () Bool)

(assert (=> b!730444 m!683449))

(declare-fun m!683451 () Bool)

(assert (=> start!64718 m!683451))

(declare-fun m!683453 () Bool)

(assert (=> start!64718 m!683453))

(declare-fun m!683455 () Bool)

(assert (=> b!730438 m!683455))

(declare-fun m!683457 () Bool)

(assert (=> b!730436 m!683457))

(declare-fun m!683459 () Bool)

(assert (=> b!730436 m!683459))

(assert (=> b!730437 m!683441))

(assert (=> b!730437 m!683441))

(declare-fun m!683461 () Bool)

(assert (=> b!730437 m!683461))

(assert (=> b!730443 m!683441))

(assert (=> b!730443 m!683441))

(declare-fun m!683463 () Bool)

(assert (=> b!730443 m!683463))

(assert (=> b!730454 m!683441))

(assert (=> b!730454 m!683441))

(declare-fun m!683465 () Bool)

(assert (=> b!730454 m!683465))

(declare-fun m!683467 () Bool)

(assert (=> b!730448 m!683467))

(assert (=> b!730441 m!683441))

(assert (=> b!730441 m!683441))

(declare-fun m!683469 () Bool)

(assert (=> b!730441 m!683469))

(declare-fun m!683471 () Bool)

(assert (=> b!730449 m!683471))

(assert (=> b!730440 m!683441))

(assert (=> b!730440 m!683441))

(declare-fun m!683473 () Bool)

(assert (=> b!730440 m!683473))

(assert (=> b!730447 m!683441))

(assert (=> b!730447 m!683441))

(assert (=> b!730447 m!683473))

(declare-fun m!683475 () Bool)

(assert (=> b!730446 m!683475))

(check-sat (not b!730449) (not b!730438) (not b!730445) (not b!730451) (not b!730448) (not b!730450) (not b!730452) (not b!730437) (not b!730447) (not start!64718) (not b!730446) (not b!730441) (not b!730454) (not b!730440) (not b!730436) (not b!730443))
(check-sat)
