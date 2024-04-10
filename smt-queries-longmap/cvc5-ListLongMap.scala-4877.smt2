; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67176 () Bool)

(assert start!67176)

(declare-fun b!776758 () Bool)

(declare-fun res!525534 () Bool)

(declare-fun e!432227 () Bool)

(assert (=> b!776758 (=> (not res!525534) (not e!432227))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776758 (= res!525534 (validKeyInArray!0 k!2102))))

(declare-fun b!776759 () Bool)

(declare-fun res!525531 () Bool)

(declare-fun e!432225 () Bool)

(assert (=> b!776759 (=> (not res!525531) (not e!432225))))

(declare-datatypes ((array!42531 0))(
  ( (array!42532 (arr!20361 (Array (_ BitVec 32) (_ BitVec 64))) (size!20782 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42531)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!776759 (= res!525531 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20782 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20782 a!3186))))))

(declare-fun b!776760 () Bool)

(declare-fun res!525536 () Bool)

(declare-fun e!432231 () Bool)

(assert (=> b!776760 (=> (not res!525536) (not e!432231))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776760 (= res!525536 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20361 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776761 () Bool)

(declare-fun res!525524 () Bool)

(assert (=> b!776761 (=> (not res!525524) (not e!432227))))

(declare-fun arrayContainsKey!0 (array!42531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776761 (= res!525524 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776762 () Bool)

(declare-fun res!525532 () Bool)

(assert (=> b!776762 (=> (not res!525532) (not e!432225))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42531 (_ BitVec 32)) Bool)

(assert (=> b!776762 (= res!525532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776764 () Bool)

(declare-fun res!525526 () Bool)

(assert (=> b!776764 (=> (not res!525526) (not e!432231))))

(declare-fun e!432233 () Bool)

(assert (=> b!776764 (= res!525526 e!432233)))

(declare-fun c!86017 () Bool)

(assert (=> b!776764 (= c!86017 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776765 () Bool)

(assert (=> b!776765 (= e!432227 e!432225)))

(declare-fun res!525528 () Bool)

(assert (=> b!776765 (=> (not res!525528) (not e!432225))))

(declare-datatypes ((SeekEntryResult!7961 0))(
  ( (MissingZero!7961 (index!34212 (_ BitVec 32))) (Found!7961 (index!34213 (_ BitVec 32))) (Intermediate!7961 (undefined!8773 Bool) (index!34214 (_ BitVec 32)) (x!65152 (_ BitVec 32))) (Undefined!7961) (MissingVacant!7961 (index!34215 (_ BitVec 32))) )
))
(declare-fun lt!346084 () SeekEntryResult!7961)

(assert (=> b!776765 (= res!525528 (or (= lt!346084 (MissingZero!7961 i!1173)) (= lt!346084 (MissingVacant!7961 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42531 (_ BitVec 32)) SeekEntryResult!7961)

(assert (=> b!776765 (= lt!346084 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776766 () Bool)

(declare-fun res!525525 () Bool)

(assert (=> b!776766 (=> (not res!525525) (not e!432225))))

(declare-datatypes ((List!14363 0))(
  ( (Nil!14360) (Cons!14359 (h!15467 (_ BitVec 64)) (t!20678 List!14363)) )
))
(declare-fun arrayNoDuplicates!0 (array!42531 (_ BitVec 32) List!14363) Bool)

(assert (=> b!776766 (= res!525525 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14360))))

(declare-fun b!776767 () Bool)

(declare-fun e!432232 () Bool)

(assert (=> b!776767 (= e!432232 true)))

(declare-fun lt!346085 () SeekEntryResult!7961)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42531 (_ BitVec 32)) SeekEntryResult!7961)

(assert (=> b!776767 (= lt!346085 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20361 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776768 () Bool)

(assert (=> b!776768 (= e!432233 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20361 a!3186) j!159) a!3186 mask!3328) (Found!7961 j!159)))))

(declare-fun b!776769 () Bool)

(declare-fun e!432226 () Bool)

(assert (=> b!776769 (= e!432231 e!432226)))

(declare-fun res!525538 () Bool)

(assert (=> b!776769 (=> (not res!525538) (not e!432226))))

(declare-fun lt!346088 () SeekEntryResult!7961)

(declare-fun lt!346087 () SeekEntryResult!7961)

(assert (=> b!776769 (= res!525538 (= lt!346088 lt!346087))))

(declare-fun lt!346083 () array!42531)

(declare-fun lt!346081 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42531 (_ BitVec 32)) SeekEntryResult!7961)

(assert (=> b!776769 (= lt!346087 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346081 lt!346083 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776769 (= lt!346088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346081 mask!3328) lt!346081 lt!346083 mask!3328))))

(assert (=> b!776769 (= lt!346081 (select (store (arr!20361 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776769 (= lt!346083 (array!42532 (store (arr!20361 a!3186) i!1173 k!2102) (size!20782 a!3186)))))

(declare-fun b!776770 () Bool)

(declare-fun res!525527 () Bool)

(assert (=> b!776770 (=> (not res!525527) (not e!432227))))

(assert (=> b!776770 (= res!525527 (and (= (size!20782 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20782 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20782 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776771 () Bool)

(declare-fun e!432229 () Bool)

(declare-fun e!432230 () Bool)

(assert (=> b!776771 (= e!432229 e!432230)))

(declare-fun res!525533 () Bool)

(assert (=> b!776771 (=> (not res!525533) (not e!432230))))

(declare-fun lt!346086 () SeekEntryResult!7961)

(assert (=> b!776771 (= res!525533 (= (seekEntryOrOpen!0 (select (arr!20361 a!3186) j!159) a!3186 mask!3328) lt!346086))))

(assert (=> b!776771 (= lt!346086 (Found!7961 j!159))))

(declare-fun b!776772 () Bool)

(assert (=> b!776772 (= e!432230 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20361 a!3186) j!159) a!3186 mask!3328) lt!346086))))

(declare-fun b!776773 () Bool)

(assert (=> b!776773 (= e!432225 e!432231)))

(declare-fun res!525535 () Bool)

(assert (=> b!776773 (=> (not res!525535) (not e!432231))))

(declare-fun lt!346082 () SeekEntryResult!7961)

(assert (=> b!776773 (= res!525535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20361 a!3186) j!159) mask!3328) (select (arr!20361 a!3186) j!159) a!3186 mask!3328) lt!346082))))

(assert (=> b!776773 (= lt!346082 (Intermediate!7961 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776774 () Bool)

(declare-fun res!525529 () Bool)

(assert (=> b!776774 (=> (not res!525529) (not e!432227))))

(assert (=> b!776774 (= res!525529 (validKeyInArray!0 (select (arr!20361 a!3186) j!159)))))

(declare-fun b!776775 () Bool)

(assert (=> b!776775 (= e!432233 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20361 a!3186) j!159) a!3186 mask!3328) lt!346082))))

(declare-fun b!776763 () Bool)

(assert (=> b!776763 (= e!432226 (not e!432232))))

(declare-fun res!525530 () Bool)

(assert (=> b!776763 (=> res!525530 e!432232)))

(assert (=> b!776763 (= res!525530 (or (not (is-Intermediate!7961 lt!346087)) (bvslt x!1131 (x!65152 lt!346087)) (not (= x!1131 (x!65152 lt!346087))) (not (= index!1321 (index!34214 lt!346087)))))))

(assert (=> b!776763 e!432229))

(declare-fun res!525539 () Bool)

(assert (=> b!776763 (=> (not res!525539) (not e!432229))))

(assert (=> b!776763 (= res!525539 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26816 0))(
  ( (Unit!26817) )
))
(declare-fun lt!346080 () Unit!26816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26816)

(assert (=> b!776763 (= lt!346080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!525537 () Bool)

(assert (=> start!67176 (=> (not res!525537) (not e!432227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67176 (= res!525537 (validMask!0 mask!3328))))

(assert (=> start!67176 e!432227))

(assert (=> start!67176 true))

(declare-fun array_inv!16157 (array!42531) Bool)

(assert (=> start!67176 (array_inv!16157 a!3186)))

(assert (= (and start!67176 res!525537) b!776770))

(assert (= (and b!776770 res!525527) b!776774))

(assert (= (and b!776774 res!525529) b!776758))

(assert (= (and b!776758 res!525534) b!776761))

(assert (= (and b!776761 res!525524) b!776765))

(assert (= (and b!776765 res!525528) b!776762))

(assert (= (and b!776762 res!525532) b!776766))

(assert (= (and b!776766 res!525525) b!776759))

(assert (= (and b!776759 res!525531) b!776773))

(assert (= (and b!776773 res!525535) b!776760))

(assert (= (and b!776760 res!525536) b!776764))

(assert (= (and b!776764 c!86017) b!776775))

(assert (= (and b!776764 (not c!86017)) b!776768))

(assert (= (and b!776764 res!525526) b!776769))

(assert (= (and b!776769 res!525538) b!776763))

(assert (= (and b!776763 res!525539) b!776771))

(assert (= (and b!776771 res!525533) b!776772))

(assert (= (and b!776763 (not res!525530)) b!776767))

(declare-fun m!720791 () Bool)

(assert (=> b!776769 m!720791))

(declare-fun m!720793 () Bool)

(assert (=> b!776769 m!720793))

(declare-fun m!720795 () Bool)

(assert (=> b!776769 m!720795))

(declare-fun m!720797 () Bool)

(assert (=> b!776769 m!720797))

(declare-fun m!720799 () Bool)

(assert (=> b!776769 m!720799))

(assert (=> b!776769 m!720791))

(declare-fun m!720801 () Bool)

(assert (=> b!776774 m!720801))

(assert (=> b!776774 m!720801))

(declare-fun m!720803 () Bool)

(assert (=> b!776774 m!720803))

(declare-fun m!720805 () Bool)

(assert (=> start!67176 m!720805))

(declare-fun m!720807 () Bool)

(assert (=> start!67176 m!720807))

(declare-fun m!720809 () Bool)

(assert (=> b!776760 m!720809))

(assert (=> b!776775 m!720801))

(assert (=> b!776775 m!720801))

(declare-fun m!720811 () Bool)

(assert (=> b!776775 m!720811))

(declare-fun m!720813 () Bool)

(assert (=> b!776758 m!720813))

(declare-fun m!720815 () Bool)

(assert (=> b!776766 m!720815))

(declare-fun m!720817 () Bool)

(assert (=> b!776763 m!720817))

(declare-fun m!720819 () Bool)

(assert (=> b!776763 m!720819))

(declare-fun m!720821 () Bool)

(assert (=> b!776762 m!720821))

(assert (=> b!776772 m!720801))

(assert (=> b!776772 m!720801))

(declare-fun m!720823 () Bool)

(assert (=> b!776772 m!720823))

(assert (=> b!776773 m!720801))

(assert (=> b!776773 m!720801))

(declare-fun m!720825 () Bool)

(assert (=> b!776773 m!720825))

(assert (=> b!776773 m!720825))

(assert (=> b!776773 m!720801))

(declare-fun m!720827 () Bool)

(assert (=> b!776773 m!720827))

(assert (=> b!776768 m!720801))

(assert (=> b!776768 m!720801))

(declare-fun m!720829 () Bool)

(assert (=> b!776768 m!720829))

(assert (=> b!776767 m!720801))

(assert (=> b!776767 m!720801))

(assert (=> b!776767 m!720829))

(declare-fun m!720831 () Bool)

(assert (=> b!776761 m!720831))

(assert (=> b!776771 m!720801))

(assert (=> b!776771 m!720801))

(declare-fun m!720833 () Bool)

(assert (=> b!776771 m!720833))

(declare-fun m!720835 () Bool)

(assert (=> b!776765 m!720835))

(push 1)

