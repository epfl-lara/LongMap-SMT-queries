; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65192 () Bool)

(assert start!65192)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41365 0))(
  ( (array!41366 (arr!19796 (Array (_ BitVec 32) (_ BitVec 64))) (size!20217 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41365)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7396 0))(
  ( (MissingZero!7396 (index!31952 (_ BitVec 32))) (Found!7396 (index!31953 (_ BitVec 32))) (Intermediate!7396 (undefined!8208 Bool) (index!31954 (_ BitVec 32)) (x!62946 (_ BitVec 32))) (Undefined!7396) (MissingVacant!7396 (index!31955 (_ BitVec 32))) )
))
(declare-fun lt!327331 () SeekEntryResult!7396)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!737692 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!412603 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41365 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!737692 (= e!412603 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327331))))

(declare-fun b!737693 () Bool)

(declare-fun e!412600 () Bool)

(assert (=> b!737693 (= e!412600 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327337 () SeekEntryResult!7396)

(declare-fun lt!327332 () array!41365)

(declare-fun lt!327328 () (_ BitVec 32))

(declare-fun lt!327341 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41365 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!737693 (= lt!327337 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327328 lt!327341 lt!327332 mask!3328))))

(declare-fun b!737694 () Bool)

(declare-fun e!412606 () Bool)

(declare-fun e!412607 () Bool)

(assert (=> b!737694 (= e!412606 e!412607)))

(declare-fun res!495871 () Bool)

(assert (=> b!737694 (=> (not res!495871) (not e!412607))))

(declare-fun lt!327335 () SeekEntryResult!7396)

(declare-fun lt!327329 () SeekEntryResult!7396)

(assert (=> b!737694 (= res!495871 (= lt!327335 lt!327329))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!737694 (= lt!327329 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327341 lt!327332 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737694 (= lt!327335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327341 mask!3328) lt!327341 lt!327332 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737694 (= lt!327341 (select (store (arr!19796 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737694 (= lt!327332 (array!41366 (store (arr!19796 a!3186) i!1173 k!2102) (size!20217 a!3186)))))

(declare-fun e!412604 () Bool)

(declare-fun b!737695 () Bool)

(assert (=> b!737695 (= e!412604 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) (Found!7396 j!159)))))

(declare-fun b!737696 () Bool)

(declare-fun res!495869 () Bool)

(assert (=> b!737696 (=> (not res!495869) (not e!412606))))

(assert (=> b!737696 (= res!495869 e!412604)))

(declare-fun c!81294 () Bool)

(assert (=> b!737696 (= c!81294 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737697 () Bool)

(declare-fun res!495876 () Bool)

(declare-fun e!412605 () Bool)

(assert (=> b!737697 (=> (not res!495876) (not e!412605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737697 (= res!495876 (validKeyInArray!0 k!2102))))

(declare-fun b!737698 () Bool)

(declare-fun res!495870 () Bool)

(assert (=> b!737698 (=> (not res!495870) (not e!412605))))

(assert (=> b!737698 (= res!495870 (and (= (size!20217 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20217 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20217 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737699 () Bool)

(declare-fun e!412610 () Bool)

(assert (=> b!737699 (= e!412610 e!412606)))

(declare-fun res!495877 () Bool)

(assert (=> b!737699 (=> (not res!495877) (not e!412606))))

(declare-fun lt!327340 () SeekEntryResult!7396)

(assert (=> b!737699 (= res!495877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19796 a!3186) j!159) mask!3328) (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327340))))

(assert (=> b!737699 (= lt!327340 (Intermediate!7396 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737700 () Bool)

(declare-fun e!412608 () Bool)

(assert (=> b!737700 (= e!412607 (not e!412608))))

(declare-fun res!495879 () Bool)

(assert (=> b!737700 (=> res!495879 e!412608)))

(assert (=> b!737700 (= res!495879 (or (not (is-Intermediate!7396 lt!327329)) (bvsge x!1131 (x!62946 lt!327329))))))

(declare-fun lt!327338 () SeekEntryResult!7396)

(assert (=> b!737700 (= lt!327338 (Found!7396 j!159))))

(declare-fun e!412602 () Bool)

(assert (=> b!737700 e!412602))

(declare-fun res!495868 () Bool)

(assert (=> b!737700 (=> (not res!495868) (not e!412602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41365 (_ BitVec 32)) Bool)

(assert (=> b!737700 (= res!495868 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25180 0))(
  ( (Unit!25181) )
))
(declare-fun lt!327330 () Unit!25180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25180)

(assert (=> b!737700 (= lt!327330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737701 () Bool)

(assert (=> b!737701 (= e!412605 e!412610)))

(declare-fun res!495881 () Bool)

(assert (=> b!737701 (=> (not res!495881) (not e!412610))))

(declare-fun lt!327339 () SeekEntryResult!7396)

(assert (=> b!737701 (= res!495881 (or (= lt!327339 (MissingZero!7396 i!1173)) (= lt!327339 (MissingVacant!7396 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41365 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!737701 (= lt!327339 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737702 () Bool)

(declare-fun e!412599 () Bool)

(assert (=> b!737702 (= e!412599 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327328 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327338)))))

(declare-fun b!737703 () Bool)

(assert (=> b!737703 (= e!412599 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327328 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327340)))))

(declare-fun b!737704 () Bool)

(assert (=> b!737704 (= e!412604 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327340))))

(declare-fun b!737705 () Bool)

(declare-fun res!495873 () Bool)

(assert (=> b!737705 (=> (not res!495873) (not e!412605))))

(assert (=> b!737705 (= res!495873 (validKeyInArray!0 (select (arr!19796 a!3186) j!159)))))

(declare-fun b!737706 () Bool)

(declare-fun res!495867 () Bool)

(assert (=> b!737706 (=> (not res!495867) (not e!412610))))

(assert (=> b!737706 (= res!495867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!495874 () Bool)

(assert (=> start!65192 (=> (not res!495874) (not e!412605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65192 (= res!495874 (validMask!0 mask!3328))))

(assert (=> start!65192 e!412605))

(assert (=> start!65192 true))

(declare-fun array_inv!15592 (array!41365) Bool)

(assert (=> start!65192 (array_inv!15592 a!3186)))

(declare-fun b!737707 () Bool)

(assert (=> b!737707 (= e!412608 e!412600)))

(declare-fun res!495875 () Bool)

(assert (=> b!737707 (=> res!495875 e!412600)))

(assert (=> b!737707 (= res!495875 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327328 #b00000000000000000000000000000000) (bvsge lt!327328 (size!20217 a!3186))))))

(declare-fun lt!327336 () Unit!25180)

(declare-fun e!412609 () Unit!25180)

(assert (=> b!737707 (= lt!327336 e!412609)))

(declare-fun c!81295 () Bool)

(declare-fun lt!327333 () Bool)

(assert (=> b!737707 (= c!81295 lt!327333)))

(assert (=> b!737707 (= lt!327333 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737707 (= lt!327328 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737708 () Bool)

(declare-fun Unit!25182 () Unit!25180)

(assert (=> b!737708 (= e!412609 Unit!25182)))

(assert (=> b!737708 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327328 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327340)))

(declare-fun b!737709 () Bool)

(declare-fun res!495880 () Bool)

(assert (=> b!737709 (=> (not res!495880) (not e!412605))))

(declare-fun arrayContainsKey!0 (array!41365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737709 (= res!495880 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737710 () Bool)

(declare-fun res!495872 () Bool)

(assert (=> b!737710 (=> res!495872 e!412600)))

(assert (=> b!737710 (= res!495872 e!412599)))

(declare-fun c!81293 () Bool)

(assert (=> b!737710 (= c!81293 lt!327333)))

(declare-fun b!737711 () Bool)

(declare-fun res!495884 () Bool)

(assert (=> b!737711 (=> (not res!495884) (not e!412610))))

(assert (=> b!737711 (= res!495884 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20217 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20217 a!3186))))))

(declare-fun b!737712 () Bool)

(declare-fun res!495882 () Bool)

(assert (=> b!737712 (=> (not res!495882) (not e!412610))))

(declare-datatypes ((List!13798 0))(
  ( (Nil!13795) (Cons!13794 (h!14866 (_ BitVec 64)) (t!20113 List!13798)) )
))
(declare-fun arrayNoDuplicates!0 (array!41365 (_ BitVec 32) List!13798) Bool)

(assert (=> b!737712 (= res!495882 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13795))))

(declare-fun b!737713 () Bool)

(declare-fun res!495883 () Bool)

(assert (=> b!737713 (=> (not res!495883) (not e!412606))))

(assert (=> b!737713 (= res!495883 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19796 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737714 () Bool)

(declare-fun Unit!25183 () Unit!25180)

(assert (=> b!737714 (= e!412609 Unit!25183)))

(declare-fun lt!327334 () SeekEntryResult!7396)

(assert (=> b!737714 (= lt!327334 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737714 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327328 resIntermediateIndex!5 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327338)))

(declare-fun b!737715 () Bool)

(assert (=> b!737715 (= e!412602 e!412603)))

(declare-fun res!495878 () Bool)

(assert (=> b!737715 (=> (not res!495878) (not e!412603))))

(assert (=> b!737715 (= res!495878 (= (seekEntryOrOpen!0 (select (arr!19796 a!3186) j!159) a!3186 mask!3328) lt!327331))))

(assert (=> b!737715 (= lt!327331 (Found!7396 j!159))))

(assert (= (and start!65192 res!495874) b!737698))

(assert (= (and b!737698 res!495870) b!737705))

(assert (= (and b!737705 res!495873) b!737697))

(assert (= (and b!737697 res!495876) b!737709))

(assert (= (and b!737709 res!495880) b!737701))

(assert (= (and b!737701 res!495881) b!737706))

(assert (= (and b!737706 res!495867) b!737712))

(assert (= (and b!737712 res!495882) b!737711))

(assert (= (and b!737711 res!495884) b!737699))

(assert (= (and b!737699 res!495877) b!737713))

(assert (= (and b!737713 res!495883) b!737696))

(assert (= (and b!737696 c!81294) b!737704))

(assert (= (and b!737696 (not c!81294)) b!737695))

(assert (= (and b!737696 res!495869) b!737694))

(assert (= (and b!737694 res!495871) b!737700))

(assert (= (and b!737700 res!495868) b!737715))

(assert (= (and b!737715 res!495878) b!737692))

(assert (= (and b!737700 (not res!495879)) b!737707))

(assert (= (and b!737707 c!81295) b!737708))

(assert (= (and b!737707 (not c!81295)) b!737714))

(assert (= (and b!737707 (not res!495875)) b!737710))

(assert (= (and b!737710 c!81293) b!737703))

(assert (= (and b!737710 (not c!81293)) b!737702))

(assert (= (and b!737710 (not res!495872)) b!737693))

(declare-fun m!689509 () Bool)

(assert (=> b!737714 m!689509))

(assert (=> b!737714 m!689509))

(declare-fun m!689511 () Bool)

(assert (=> b!737714 m!689511))

(assert (=> b!737714 m!689509))

(declare-fun m!689513 () Bool)

(assert (=> b!737714 m!689513))

(declare-fun m!689515 () Bool)

(assert (=> start!65192 m!689515))

(declare-fun m!689517 () Bool)

(assert (=> start!65192 m!689517))

(assert (=> b!737702 m!689509))

(assert (=> b!737702 m!689509))

(assert (=> b!737702 m!689513))

(assert (=> b!737708 m!689509))

(assert (=> b!737708 m!689509))

(declare-fun m!689519 () Bool)

(assert (=> b!737708 m!689519))

(declare-fun m!689521 () Bool)

(assert (=> b!737709 m!689521))

(declare-fun m!689523 () Bool)

(assert (=> b!737697 m!689523))

(assert (=> b!737692 m!689509))

(assert (=> b!737692 m!689509))

(declare-fun m!689525 () Bool)

(assert (=> b!737692 m!689525))

(declare-fun m!689527 () Bool)

(assert (=> b!737693 m!689527))

(assert (=> b!737695 m!689509))

(assert (=> b!737695 m!689509))

(assert (=> b!737695 m!689511))

(assert (=> b!737699 m!689509))

(assert (=> b!737699 m!689509))

(declare-fun m!689529 () Bool)

(assert (=> b!737699 m!689529))

(assert (=> b!737699 m!689529))

(assert (=> b!737699 m!689509))

(declare-fun m!689531 () Bool)

(assert (=> b!737699 m!689531))

(assert (=> b!737705 m!689509))

(assert (=> b!737705 m!689509))

(declare-fun m!689533 () Bool)

(assert (=> b!737705 m!689533))

(declare-fun m!689535 () Bool)

(assert (=> b!737694 m!689535))

(declare-fun m!689537 () Bool)

(assert (=> b!737694 m!689537))

(declare-fun m!689539 () Bool)

(assert (=> b!737694 m!689539))

(declare-fun m!689541 () Bool)

(assert (=> b!737694 m!689541))

(assert (=> b!737694 m!689535))

(declare-fun m!689543 () Bool)

(assert (=> b!737694 m!689543))

(declare-fun m!689545 () Bool)

(assert (=> b!737712 m!689545))

(assert (=> b!737715 m!689509))

(assert (=> b!737715 m!689509))

(declare-fun m!689547 () Bool)

(assert (=> b!737715 m!689547))

(declare-fun m!689549 () Bool)

(assert (=> b!737701 m!689549))

(assert (=> b!737703 m!689509))

(assert (=> b!737703 m!689509))

(assert (=> b!737703 m!689519))

(declare-fun m!689551 () Bool)

(assert (=> b!737706 m!689551))

(declare-fun m!689553 () Bool)

(assert (=> b!737700 m!689553))

(declare-fun m!689555 () Bool)

(assert (=> b!737700 m!689555))

(declare-fun m!689557 () Bool)

(assert (=> b!737713 m!689557))

(declare-fun m!689559 () Bool)

(assert (=> b!737707 m!689559))

(assert (=> b!737704 m!689509))

(assert (=> b!737704 m!689509))

(declare-fun m!689561 () Bool)

(assert (=> b!737704 m!689561))

(push 1)

