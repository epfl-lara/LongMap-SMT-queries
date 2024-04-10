; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65758 () Bool)

(assert start!65758)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41931 0))(
  ( (array!41932 (arr!20079 (Array (_ BitVec 32) (_ BitVec 64))) (size!20500 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41931)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!755564 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!421340 () Bool)

(declare-datatypes ((SeekEntryResult!7679 0))(
  ( (MissingZero!7679 (index!33084 (_ BitVec 32))) (Found!7679 (index!33085 (_ BitVec 32))) (Intermediate!7679 (undefined!8491 Bool) (index!33086 (_ BitVec 32)) (x!63989 (_ BitVec 32))) (Undefined!7679) (MissingVacant!7679 (index!33087 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41931 (_ BitVec 32)) SeekEntryResult!7679)

(assert (=> b!755564 (= e!421340 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20079 a!3186) j!159) a!3186 mask!3328) (Found!7679 j!159)))))

(declare-fun b!755565 () Bool)

(declare-fun e!421338 () Bool)

(declare-fun lt!336330 () SeekEntryResult!7679)

(declare-fun lt!336331 () SeekEntryResult!7679)

(assert (=> b!755565 (= e!421338 (= lt!336330 lt!336331))))

(declare-fun b!755566 () Bool)

(declare-fun e!421342 () Bool)

(declare-fun e!421341 () Bool)

(assert (=> b!755566 (= e!421342 e!421341)))

(declare-fun res!510732 () Bool)

(assert (=> b!755566 (=> res!510732 e!421341)))

(declare-fun lt!336333 () SeekEntryResult!7679)

(assert (=> b!755566 (= res!510732 (not (= lt!336331 lt!336333)))))

(assert (=> b!755566 (= lt!336331 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20079 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755567 () Bool)

(declare-fun res!510736 () Bool)

(declare-fun e!421343 () Bool)

(assert (=> b!755567 (=> (not res!510736) (not e!421343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755567 (= res!510736 (validKeyInArray!0 (select (arr!20079 a!3186) j!159)))))

(declare-fun res!510729 () Bool)

(assert (=> start!65758 (=> (not res!510729) (not e!421343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65758 (= res!510729 (validMask!0 mask!3328))))

(assert (=> start!65758 e!421343))

(assert (=> start!65758 true))

(declare-fun array_inv!15875 (array!41931) Bool)

(assert (=> start!65758 (array_inv!15875 a!3186)))

(declare-fun b!755568 () Bool)

(declare-fun e!421345 () Bool)

(declare-fun e!421344 () Bool)

(assert (=> b!755568 (= e!421345 e!421344)))

(declare-fun res!510728 () Bool)

(assert (=> b!755568 (=> (not res!510728) (not e!421344))))

(declare-fun lt!336336 () SeekEntryResult!7679)

(declare-fun lt!336340 () SeekEntryResult!7679)

(assert (=> b!755568 (= res!510728 (= lt!336336 lt!336340))))

(declare-fun lt!336332 () (_ BitVec 64))

(declare-fun lt!336338 () array!41931)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41931 (_ BitVec 32)) SeekEntryResult!7679)

(assert (=> b!755568 (= lt!336340 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336332 lt!336338 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755568 (= lt!336336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336332 mask!3328) lt!336332 lt!336338 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!755568 (= lt!336332 (select (store (arr!20079 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755568 (= lt!336338 (array!41932 (store (arr!20079 a!3186) i!1173 k!2102) (size!20500 a!3186)))))

(declare-fun b!755569 () Bool)

(declare-fun e!421348 () Bool)

(assert (=> b!755569 (= e!421343 e!421348)))

(declare-fun res!510726 () Bool)

(assert (=> b!755569 (=> (not res!510726) (not e!421348))))

(declare-fun lt!336337 () SeekEntryResult!7679)

(assert (=> b!755569 (= res!510726 (or (= lt!336337 (MissingZero!7679 i!1173)) (= lt!336337 (MissingVacant!7679 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41931 (_ BitVec 32)) SeekEntryResult!7679)

(assert (=> b!755569 (= lt!336337 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755570 () Bool)

(declare-fun res!510722 () Bool)

(assert (=> b!755570 (=> (not res!510722) (not e!421348))))

(declare-datatypes ((List!14081 0))(
  ( (Nil!14078) (Cons!14077 (h!15149 (_ BitVec 64)) (t!20396 List!14081)) )
))
(declare-fun arrayNoDuplicates!0 (array!41931 (_ BitVec 32) List!14081) Bool)

(assert (=> b!755570 (= res!510722 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14078))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!755571 () Bool)

(declare-fun e!421349 () Bool)

(assert (=> b!755571 (= e!421349 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20079 a!3186) j!159) a!3186 mask!3328) lt!336333))))

(declare-fun b!755572 () Bool)

(declare-datatypes ((Unit!26096 0))(
  ( (Unit!26097) )
))
(declare-fun e!421346 () Unit!26096)

(declare-fun Unit!26098 () Unit!26096)

(assert (=> b!755572 (= e!421346 Unit!26098)))

(declare-fun b!755573 () Bool)

(declare-fun res!510731 () Bool)

(assert (=> b!755573 (=> (not res!510731) (not e!421345))))

(assert (=> b!755573 (= res!510731 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20079 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755574 () Bool)

(declare-fun lt!336335 () SeekEntryResult!7679)

(assert (=> b!755574 (= e!421340 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20079 a!3186) j!159) a!3186 mask!3328) lt!336335))))

(declare-fun b!755575 () Bool)

(declare-fun Unit!26099 () Unit!26096)

(assert (=> b!755575 (= e!421346 Unit!26099)))

(assert (=> b!755575 false))

(declare-fun b!755576 () Bool)

(declare-fun e!421339 () Bool)

(assert (=> b!755576 (= e!421339 true)))

(assert (=> b!755576 e!421338))

(declare-fun res!510733 () Bool)

(assert (=> b!755576 (=> (not res!510733) (not e!421338))))

(declare-fun lt!336334 () (_ BitVec 64))

(assert (=> b!755576 (= res!510733 (= lt!336334 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336339 () Unit!26096)

(assert (=> b!755576 (= lt!336339 e!421346)))

(declare-fun c!82803 () Bool)

(assert (=> b!755576 (= c!82803 (= lt!336334 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755577 () Bool)

(declare-fun res!510724 () Bool)

(assert (=> b!755577 (=> (not res!510724) (not e!421338))))

(assert (=> b!755577 (= res!510724 (= (seekEntryOrOpen!0 lt!336332 lt!336338 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336332 lt!336338 mask!3328)))))

(declare-fun b!755578 () Bool)

(declare-fun res!510734 () Bool)

(assert (=> b!755578 (=> (not res!510734) (not e!421343))))

(declare-fun arrayContainsKey!0 (array!41931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755578 (= res!510734 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755579 () Bool)

(declare-fun res!510735 () Bool)

(assert (=> b!755579 (=> (not res!510735) (not e!421345))))

(assert (=> b!755579 (= res!510735 e!421340)))

(declare-fun c!82804 () Bool)

(assert (=> b!755579 (= c!82804 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755580 () Bool)

(declare-fun res!510723 () Bool)

(assert (=> b!755580 (=> (not res!510723) (not e!421348))))

(assert (=> b!755580 (= res!510723 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20500 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20500 a!3186))))))

(declare-fun b!755581 () Bool)

(assert (=> b!755581 (= e!421341 e!421339)))

(declare-fun res!510721 () Bool)

(assert (=> b!755581 (=> res!510721 e!421339)))

(assert (=> b!755581 (= res!510721 (= lt!336334 lt!336332))))

(assert (=> b!755581 (= lt!336334 (select (store (arr!20079 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755582 () Bool)

(declare-fun res!510730 () Bool)

(assert (=> b!755582 (=> (not res!510730) (not e!421343))))

(assert (=> b!755582 (= res!510730 (validKeyInArray!0 k!2102))))

(declare-fun b!755583 () Bool)

(assert (=> b!755583 (= e!421348 e!421345)))

(declare-fun res!510737 () Bool)

(assert (=> b!755583 (=> (not res!510737) (not e!421345))))

(assert (=> b!755583 (= res!510737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20079 a!3186) j!159) mask!3328) (select (arr!20079 a!3186) j!159) a!3186 mask!3328) lt!336335))))

(assert (=> b!755583 (= lt!336335 (Intermediate!7679 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755584 () Bool)

(declare-fun res!510727 () Bool)

(assert (=> b!755584 (=> (not res!510727) (not e!421348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41931 (_ BitVec 32)) Bool)

(assert (=> b!755584 (= res!510727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755585 () Bool)

(assert (=> b!755585 (= e!421344 (not e!421342))))

(declare-fun res!510720 () Bool)

(assert (=> b!755585 (=> res!510720 e!421342)))

(assert (=> b!755585 (= res!510720 (or (not (is-Intermediate!7679 lt!336340)) (bvslt x!1131 (x!63989 lt!336340)) (not (= x!1131 (x!63989 lt!336340))) (not (= index!1321 (index!33086 lt!336340)))))))

(assert (=> b!755585 e!421349))

(declare-fun res!510725 () Bool)

(assert (=> b!755585 (=> (not res!510725) (not e!421349))))

(assert (=> b!755585 (= res!510725 (= lt!336330 lt!336333))))

(assert (=> b!755585 (= lt!336333 (Found!7679 j!159))))

(assert (=> b!755585 (= lt!336330 (seekEntryOrOpen!0 (select (arr!20079 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755585 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336341 () Unit!26096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26096)

(assert (=> b!755585 (= lt!336341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755586 () Bool)

(declare-fun res!510719 () Bool)

(assert (=> b!755586 (=> (not res!510719) (not e!421343))))

(assert (=> b!755586 (= res!510719 (and (= (size!20500 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20500 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20500 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65758 res!510729) b!755586))

(assert (= (and b!755586 res!510719) b!755567))

(assert (= (and b!755567 res!510736) b!755582))

(assert (= (and b!755582 res!510730) b!755578))

(assert (= (and b!755578 res!510734) b!755569))

(assert (= (and b!755569 res!510726) b!755584))

(assert (= (and b!755584 res!510727) b!755570))

(assert (= (and b!755570 res!510722) b!755580))

(assert (= (and b!755580 res!510723) b!755583))

(assert (= (and b!755583 res!510737) b!755573))

(assert (= (and b!755573 res!510731) b!755579))

(assert (= (and b!755579 c!82804) b!755574))

(assert (= (and b!755579 (not c!82804)) b!755564))

(assert (= (and b!755579 res!510735) b!755568))

(assert (= (and b!755568 res!510728) b!755585))

(assert (= (and b!755585 res!510725) b!755571))

(assert (= (and b!755585 (not res!510720)) b!755566))

(assert (= (and b!755566 (not res!510732)) b!755581))

(assert (= (and b!755581 (not res!510721)) b!755576))

(assert (= (and b!755576 c!82803) b!755575))

(assert (= (and b!755576 (not c!82803)) b!755572))

(assert (= (and b!755576 res!510733) b!755577))

(assert (= (and b!755577 res!510724) b!755565))

(declare-fun m!703735 () Bool)

(assert (=> b!755574 m!703735))

(assert (=> b!755574 m!703735))

(declare-fun m!703737 () Bool)

(assert (=> b!755574 m!703737))

(assert (=> b!755583 m!703735))

(assert (=> b!755583 m!703735))

(declare-fun m!703739 () Bool)

(assert (=> b!755583 m!703739))

(assert (=> b!755583 m!703739))

(assert (=> b!755583 m!703735))

(declare-fun m!703741 () Bool)

(assert (=> b!755583 m!703741))

(assert (=> b!755571 m!703735))

(assert (=> b!755571 m!703735))

(declare-fun m!703743 () Bool)

(assert (=> b!755571 m!703743))

(assert (=> b!755566 m!703735))

(assert (=> b!755566 m!703735))

(declare-fun m!703745 () Bool)

(assert (=> b!755566 m!703745))

(assert (=> b!755567 m!703735))

(assert (=> b!755567 m!703735))

(declare-fun m!703747 () Bool)

(assert (=> b!755567 m!703747))

(assert (=> b!755564 m!703735))

(assert (=> b!755564 m!703735))

(assert (=> b!755564 m!703745))

(declare-fun m!703749 () Bool)

(assert (=> b!755569 m!703749))

(declare-fun m!703751 () Bool)

(assert (=> b!755578 m!703751))

(declare-fun m!703753 () Bool)

(assert (=> start!65758 m!703753))

(declare-fun m!703755 () Bool)

(assert (=> start!65758 m!703755))

(declare-fun m!703757 () Bool)

(assert (=> b!755582 m!703757))

(declare-fun m!703759 () Bool)

(assert (=> b!755573 m!703759))

(assert (=> b!755585 m!703735))

(assert (=> b!755585 m!703735))

(declare-fun m!703761 () Bool)

(assert (=> b!755585 m!703761))

(declare-fun m!703763 () Bool)

(assert (=> b!755585 m!703763))

(declare-fun m!703765 () Bool)

(assert (=> b!755585 m!703765))

(declare-fun m!703767 () Bool)

(assert (=> b!755584 m!703767))

(declare-fun m!703769 () Bool)

(assert (=> b!755568 m!703769))

(declare-fun m!703771 () Bool)

(assert (=> b!755568 m!703771))

(declare-fun m!703773 () Bool)

(assert (=> b!755568 m!703773))

(declare-fun m!703775 () Bool)

(assert (=> b!755568 m!703775))

(assert (=> b!755568 m!703769))

(declare-fun m!703777 () Bool)

(assert (=> b!755568 m!703777))

(declare-fun m!703779 () Bool)

(assert (=> b!755577 m!703779))

(declare-fun m!703781 () Bool)

(assert (=> b!755577 m!703781))

(declare-fun m!703783 () Bool)

(assert (=> b!755570 m!703783))

(assert (=> b!755581 m!703773))

(declare-fun m!703785 () Bool)

(assert (=> b!755581 m!703785))

(push 1)

