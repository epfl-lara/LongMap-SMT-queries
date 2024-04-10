; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64634 () Bool)

(assert start!64634)

(declare-fun b!727876 () Bool)

(declare-fun res!488459 () Bool)

(declare-fun e!407488 () Bool)

(assert (=> b!727876 (=> (not res!488459) (not e!407488))))

(declare-fun e!407485 () Bool)

(assert (=> b!727876 (= res!488459 e!407485)))

(declare-fun c!80086 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727876 (= c!80086 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727877 () Bool)

(declare-fun e!407489 () Bool)

(assert (=> b!727877 (= e!407489 e!407488)))

(declare-fun res!488458 () Bool)

(assert (=> b!727877 (=> (not res!488458) (not e!407488))))

(declare-datatypes ((array!41083 0))(
  ( (array!41084 (arr!19661 (Array (_ BitVec 32) (_ BitVec 64))) (size!20082 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41083)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7261 0))(
  ( (MissingZero!7261 (index!31412 (_ BitVec 32))) (Found!7261 (index!31413 (_ BitVec 32))) (Intermediate!7261 (undefined!8073 Bool) (index!31414 (_ BitVec 32)) (x!62403 (_ BitVec 32))) (Undefined!7261) (MissingVacant!7261 (index!31415 (_ BitVec 32))) )
))
(declare-fun lt!322388 () SeekEntryResult!7261)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41083 (_ BitVec 32)) SeekEntryResult!7261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727877 (= res!488458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19661 a!3186) j!159) mask!3328) (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322388))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727877 (= lt!322388 (Intermediate!7261 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727878 () Bool)

(declare-fun res!488463 () Bool)

(declare-fun e!407482 () Bool)

(assert (=> b!727878 (=> (not res!488463) (not e!407482))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727878 (= res!488463 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727879 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41083 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!727879 (= e!407485 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) (Found!7261 j!159)))))

(declare-fun b!727880 () Bool)

(declare-fun res!488467 () Bool)

(assert (=> b!727880 (=> (not res!488467) (not e!407488))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727880 (= res!488467 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19661 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727881 () Bool)

(declare-fun e!407487 () Bool)

(declare-fun e!407483 () Bool)

(assert (=> b!727881 (= e!407487 e!407483)))

(declare-fun res!488455 () Bool)

(assert (=> b!727881 (=> (not res!488455) (not e!407483))))

(declare-fun lt!322385 () SeekEntryResult!7261)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41083 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!727881 (= res!488455 (= (seekEntryOrOpen!0 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322385))))

(assert (=> b!727881 (= lt!322385 (Found!7261 j!159))))

(declare-fun b!727882 () Bool)

(assert (=> b!727882 (= e!407483 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322385))))

(declare-fun b!727883 () Bool)

(declare-fun res!488464 () Bool)

(assert (=> b!727883 (=> (not res!488464) (not e!407482))))

(assert (=> b!727883 (= res!488464 (and (= (size!20082 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20082 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20082 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!488454 () Bool)

(assert (=> start!64634 (=> (not res!488454) (not e!407482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64634 (= res!488454 (validMask!0 mask!3328))))

(assert (=> start!64634 e!407482))

(assert (=> start!64634 true))

(declare-fun array_inv!15457 (array!41083) Bool)

(assert (=> start!64634 (array_inv!15457 a!3186)))

(declare-fun b!727884 () Bool)

(declare-fun e!407481 () Bool)

(declare-fun e!407484 () Bool)

(assert (=> b!727884 (= e!407481 (not e!407484))))

(declare-fun res!488460 () Bool)

(assert (=> b!727884 (=> res!488460 e!407484)))

(declare-fun lt!322383 () SeekEntryResult!7261)

(assert (=> b!727884 (= res!488460 (or (not (is-Intermediate!7261 lt!322383)) (bvsge x!1131 (x!62403 lt!322383))))))

(assert (=> b!727884 e!407487))

(declare-fun res!488457 () Bool)

(assert (=> b!727884 (=> (not res!488457) (not e!407487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41083 (_ BitVec 32)) Bool)

(assert (=> b!727884 (= res!488457 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24840 0))(
  ( (Unit!24841) )
))
(declare-fun lt!322384 () Unit!24840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24840)

(assert (=> b!727884 (= lt!322384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727885 () Bool)

(declare-fun res!488462 () Bool)

(assert (=> b!727885 (=> (not res!488462) (not e!407482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727885 (= res!488462 (validKeyInArray!0 (select (arr!19661 a!3186) j!159)))))

(declare-fun b!727886 () Bool)

(declare-fun res!488465 () Bool)

(assert (=> b!727886 (=> (not res!488465) (not e!407489))))

(declare-datatypes ((List!13663 0))(
  ( (Nil!13660) (Cons!13659 (h!14719 (_ BitVec 64)) (t!19978 List!13663)) )
))
(declare-fun arrayNoDuplicates!0 (array!41083 (_ BitVec 32) List!13663) Bool)

(assert (=> b!727886 (= res!488465 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13660))))

(declare-fun b!727887 () Bool)

(declare-fun res!488461 () Bool)

(assert (=> b!727887 (=> (not res!488461) (not e!407489))))

(assert (=> b!727887 (= res!488461 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20082 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20082 a!3186))))))

(declare-fun b!727888 () Bool)

(assert (=> b!727888 (= e!407482 e!407489)))

(declare-fun res!488456 () Bool)

(assert (=> b!727888 (=> (not res!488456) (not e!407489))))

(declare-fun lt!322387 () SeekEntryResult!7261)

(assert (=> b!727888 (= res!488456 (or (= lt!322387 (MissingZero!7261 i!1173)) (= lt!322387 (MissingVacant!7261 i!1173))))))

(assert (=> b!727888 (= lt!322387 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!727889 () Bool)

(assert (=> b!727889 (= e!407485 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19661 a!3186) j!159) a!3186 mask!3328) lt!322388))))

(declare-fun b!727890 () Bool)

(assert (=> b!727890 (= e!407488 e!407481)))

(declare-fun res!488468 () Bool)

(assert (=> b!727890 (=> (not res!488468) (not e!407481))))

(declare-fun lt!322381 () SeekEntryResult!7261)

(assert (=> b!727890 (= res!488468 (= lt!322381 lt!322383))))

(declare-fun lt!322386 () array!41083)

(declare-fun lt!322380 () (_ BitVec 64))

(assert (=> b!727890 (= lt!322383 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322380 lt!322386 mask!3328))))

(assert (=> b!727890 (= lt!322381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322380 mask!3328) lt!322380 lt!322386 mask!3328))))

(assert (=> b!727890 (= lt!322380 (select (store (arr!19661 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727890 (= lt!322386 (array!41084 (store (arr!19661 a!3186) i!1173 k!2102) (size!20082 a!3186)))))

(declare-fun lt!322382 () (_ BitVec 32))

(declare-fun b!727891 () Bool)

(assert (=> b!727891 (= e!407484 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!322382 #b00000000000000000000000000000000) (bvsge lt!322382 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727891 (= lt!322382 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727892 () Bool)

(declare-fun res!488453 () Bool)

(assert (=> b!727892 (=> (not res!488453) (not e!407482))))

(assert (=> b!727892 (= res!488453 (validKeyInArray!0 k!2102))))

(declare-fun b!727893 () Bool)

(declare-fun res!488466 () Bool)

(assert (=> b!727893 (=> (not res!488466) (not e!407489))))

(assert (=> b!727893 (= res!488466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64634 res!488454) b!727883))

(assert (= (and b!727883 res!488464) b!727885))

(assert (= (and b!727885 res!488462) b!727892))

(assert (= (and b!727892 res!488453) b!727878))

(assert (= (and b!727878 res!488463) b!727888))

(assert (= (and b!727888 res!488456) b!727893))

(assert (= (and b!727893 res!488466) b!727886))

(assert (= (and b!727886 res!488465) b!727887))

(assert (= (and b!727887 res!488461) b!727877))

(assert (= (and b!727877 res!488458) b!727880))

(assert (= (and b!727880 res!488467) b!727876))

(assert (= (and b!727876 c!80086) b!727889))

(assert (= (and b!727876 (not c!80086)) b!727879))

(assert (= (and b!727876 res!488459) b!727890))

(assert (= (and b!727890 res!488468) b!727884))

(assert (= (and b!727884 res!488457) b!727881))

(assert (= (and b!727881 res!488455) b!727882))

(assert (= (and b!727884 (not res!488460)) b!727891))

(declare-fun m!681691 () Bool)

(assert (=> start!64634 m!681691))

(declare-fun m!681693 () Bool)

(assert (=> start!64634 m!681693))

(declare-fun m!681695 () Bool)

(assert (=> b!727880 m!681695))

(declare-fun m!681697 () Bool)

(assert (=> b!727886 m!681697))

(declare-fun m!681699 () Bool)

(assert (=> b!727884 m!681699))

(declare-fun m!681701 () Bool)

(assert (=> b!727884 m!681701))

(declare-fun m!681703 () Bool)

(assert (=> b!727877 m!681703))

(assert (=> b!727877 m!681703))

(declare-fun m!681705 () Bool)

(assert (=> b!727877 m!681705))

(assert (=> b!727877 m!681705))

(assert (=> b!727877 m!681703))

(declare-fun m!681707 () Bool)

(assert (=> b!727877 m!681707))

(assert (=> b!727879 m!681703))

(assert (=> b!727879 m!681703))

(declare-fun m!681709 () Bool)

(assert (=> b!727879 m!681709))

(assert (=> b!727885 m!681703))

(assert (=> b!727885 m!681703))

(declare-fun m!681711 () Bool)

(assert (=> b!727885 m!681711))

(declare-fun m!681713 () Bool)

(assert (=> b!727893 m!681713))

(assert (=> b!727889 m!681703))

(assert (=> b!727889 m!681703))

(declare-fun m!681715 () Bool)

(assert (=> b!727889 m!681715))

(declare-fun m!681717 () Bool)

(assert (=> b!727878 m!681717))

(declare-fun m!681719 () Bool)

(assert (=> b!727890 m!681719))

(declare-fun m!681721 () Bool)

(assert (=> b!727890 m!681721))

(declare-fun m!681723 () Bool)

(assert (=> b!727890 m!681723))

(declare-fun m!681725 () Bool)

(assert (=> b!727890 m!681725))

(assert (=> b!727890 m!681723))

(declare-fun m!681727 () Bool)

(assert (=> b!727890 m!681727))

(assert (=> b!727882 m!681703))

(assert (=> b!727882 m!681703))

(declare-fun m!681729 () Bool)

(assert (=> b!727882 m!681729))

(assert (=> b!727881 m!681703))

(assert (=> b!727881 m!681703))

(declare-fun m!681731 () Bool)

(assert (=> b!727881 m!681731))

(declare-fun m!681733 () Bool)

(assert (=> b!727891 m!681733))

(declare-fun m!681735 () Bool)

(assert (=> b!727888 m!681735))

(declare-fun m!681737 () Bool)

(assert (=> b!727892 m!681737))

(push 1)

(assert (not b!727884))

(assert (not b!727881))

(assert (not b!727877))

(assert (not b!727882))

(assert (not b!727886))

(assert (not b!727885))

(assert (not b!727878))

(assert (not b!727889))

