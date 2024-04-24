; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68020 () Bool)

(assert start!68020)

(declare-fun b!790632 () Bool)

(declare-fun res!535454 () Bool)

(declare-fun e!439489 () Bool)

(assert (=> b!790632 (=> (not res!535454) (not e!439489))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790632 (= res!535454 (validKeyInArray!0 k0!2102))))

(declare-fun b!790633 () Bool)

(declare-fun e!439497 () Bool)

(declare-fun e!439494 () Bool)

(assert (=> b!790633 (= e!439497 e!439494)))

(declare-fun res!535438 () Bool)

(assert (=> b!790633 (=> (not res!535438) (not e!439494))))

(declare-datatypes ((array!42877 0))(
  ( (array!42878 (arr!20521 (Array (_ BitVec 32) (_ BitVec 64))) (size!20941 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42877)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8077 0))(
  ( (MissingZero!8077 (index!34676 (_ BitVec 32))) (Found!8077 (index!34677 (_ BitVec 32))) (Intermediate!8077 (undefined!8889 Bool) (index!34678 (_ BitVec 32)) (x!65773 (_ BitVec 32))) (Undefined!8077) (MissingVacant!8077 (index!34679 (_ BitVec 32))) )
))
(declare-fun lt!352874 () SeekEntryResult!8077)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42877 (_ BitVec 32)) SeekEntryResult!8077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790633 (= res!535438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20521 a!3186) j!159) mask!3328) (select (arr!20521 a!3186) j!159) a!3186 mask!3328) lt!352874))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790633 (= lt!352874 (Intermediate!8077 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790634 () Bool)

(declare-fun res!535455 () Bool)

(assert (=> b!790634 (=> (not res!535455) (not e!439489))))

(assert (=> b!790634 (= res!535455 (validKeyInArray!0 (select (arr!20521 a!3186) j!159)))))

(declare-fun b!790636 () Bool)

(declare-fun res!535453 () Bool)

(assert (=> b!790636 (=> (not res!535453) (not e!439489))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790636 (= res!535453 (and (= (size!20941 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20941 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20941 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790637 () Bool)

(declare-datatypes ((Unit!27373 0))(
  ( (Unit!27374) )
))
(declare-fun e!439493 () Unit!27373)

(declare-fun Unit!27375 () Unit!27373)

(assert (=> b!790637 (= e!439493 Unit!27375)))

(assert (=> b!790637 false))

(declare-fun b!790638 () Bool)

(declare-fun e!439492 () Bool)

(assert (=> b!790638 (= e!439492 true)))

(declare-fun lt!352868 () SeekEntryResult!8077)

(declare-fun lt!352872 () SeekEntryResult!8077)

(assert (=> b!790638 (= lt!352868 lt!352872)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!352879 () Unit!27373)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27373)

(assert (=> b!790638 (= lt!352879 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun e!439495 () Bool)

(declare-fun b!790639 () Bool)

(assert (=> b!790639 (= e!439495 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20521 a!3186) j!159) a!3186 mask!3328) lt!352874))))

(declare-fun b!790640 () Bool)

(declare-fun e!439487 () Bool)

(assert (=> b!790640 (= e!439487 e!439492)))

(declare-fun res!535444 () Bool)

(assert (=> b!790640 (=> res!535444 e!439492)))

(assert (=> b!790640 (= res!535444 (or (not (= (select (arr!20521 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352865 () SeekEntryResult!8077)

(declare-fun lt!352876 () SeekEntryResult!8077)

(assert (=> b!790640 (and (= lt!352865 lt!352868) (= lt!352876 lt!352872))))

(declare-fun lt!352873 () (_ BitVec 64))

(declare-fun lt!352871 () array!42877)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42877 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!790640 (= lt!352868 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352873 lt!352871 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42877 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!790640 (= lt!352865 (seekEntryOrOpen!0 lt!352873 lt!352871 mask!3328))))

(declare-fun lt!352867 () (_ BitVec 64))

(assert (=> b!790640 (= lt!352867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352875 () Unit!27373)

(assert (=> b!790640 (= lt!352875 e!439493)))

(declare-fun c!88009 () Bool)

(assert (=> b!790640 (= c!88009 (= lt!352867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790641 () Bool)

(declare-fun res!535448 () Bool)

(assert (=> b!790641 (=> (not res!535448) (not e!439497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42877 (_ BitVec 32)) Bool)

(assert (=> b!790641 (= res!535448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790642 () Bool)

(assert (=> b!790642 (= e!439495 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20521 a!3186) j!159) a!3186 mask!3328) (Found!8077 j!159)))))

(declare-fun b!790643 () Bool)

(declare-fun Unit!27376 () Unit!27373)

(assert (=> b!790643 (= e!439493 Unit!27376)))

(declare-fun b!790644 () Bool)

(declare-fun res!535449 () Bool)

(assert (=> b!790644 (=> (not res!535449) (not e!439489))))

(declare-fun arrayContainsKey!0 (array!42877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790644 (= res!535449 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790645 () Bool)

(declare-fun res!535447 () Bool)

(assert (=> b!790645 (=> (not res!535447) (not e!439494))))

(assert (=> b!790645 (= res!535447 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20521 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790646 () Bool)

(declare-fun e!439490 () Bool)

(assert (=> b!790646 (= e!439490 e!439487)))

(declare-fun res!535443 () Bool)

(assert (=> b!790646 (=> res!535443 e!439487)))

(assert (=> b!790646 (= res!535443 (= lt!352867 lt!352873))))

(assert (=> b!790646 (= lt!352867 (select (store (arr!20521 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!535452 () Bool)

(assert (=> start!68020 (=> (not res!535452) (not e!439489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68020 (= res!535452 (validMask!0 mask!3328))))

(assert (=> start!68020 e!439489))

(assert (=> start!68020 true))

(declare-fun array_inv!16380 (array!42877) Bool)

(assert (=> start!68020 (array_inv!16380 a!3186)))

(declare-fun b!790635 () Bool)

(declare-fun res!535440 () Bool)

(assert (=> b!790635 (=> (not res!535440) (not e!439497))))

(assert (=> b!790635 (= res!535440 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20941 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20941 a!3186))))))

(declare-fun e!439498 () Bool)

(declare-fun lt!352870 () SeekEntryResult!8077)

(declare-fun b!790647 () Bool)

(assert (=> b!790647 (= e!439498 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20521 a!3186) j!159) a!3186 mask!3328) lt!352870))))

(declare-fun b!790648 () Bool)

(declare-fun res!535445 () Bool)

(assert (=> b!790648 (=> (not res!535445) (not e!439497))))

(declare-datatypes ((List!14430 0))(
  ( (Nil!14427) (Cons!14426 (h!15558 (_ BitVec 64)) (t!20737 List!14430)) )
))
(declare-fun arrayNoDuplicates!0 (array!42877 (_ BitVec 32) List!14430) Bool)

(assert (=> b!790648 (= res!535445 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14427))))

(declare-fun b!790649 () Bool)

(assert (=> b!790649 (= e!439489 e!439497)))

(declare-fun res!535451 () Bool)

(assert (=> b!790649 (=> (not res!535451) (not e!439497))))

(declare-fun lt!352877 () SeekEntryResult!8077)

(assert (=> b!790649 (= res!535451 (or (= lt!352877 (MissingZero!8077 i!1173)) (= lt!352877 (MissingVacant!8077 i!1173))))))

(assert (=> b!790649 (= lt!352877 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790650 () Bool)

(declare-fun e!439491 () Bool)

(assert (=> b!790650 (= e!439494 e!439491)))

(declare-fun res!535441 () Bool)

(assert (=> b!790650 (=> (not res!535441) (not e!439491))))

(declare-fun lt!352866 () SeekEntryResult!8077)

(declare-fun lt!352869 () SeekEntryResult!8077)

(assert (=> b!790650 (= res!535441 (= lt!352866 lt!352869))))

(assert (=> b!790650 (= lt!352869 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352873 lt!352871 mask!3328))))

(assert (=> b!790650 (= lt!352866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352873 mask!3328) lt!352873 lt!352871 mask!3328))))

(assert (=> b!790650 (= lt!352873 (select (store (arr!20521 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790650 (= lt!352871 (array!42878 (store (arr!20521 a!3186) i!1173 k0!2102) (size!20941 a!3186)))))

(declare-fun b!790651 () Bool)

(declare-fun e!439496 () Bool)

(assert (=> b!790651 (= e!439491 (not e!439496))))

(declare-fun res!535439 () Bool)

(assert (=> b!790651 (=> res!535439 e!439496)))

(get-info :version)

(assert (=> b!790651 (= res!535439 (or (not ((_ is Intermediate!8077) lt!352869)) (bvslt x!1131 (x!65773 lt!352869)) (not (= x!1131 (x!65773 lt!352869))) (not (= index!1321 (index!34678 lt!352869)))))))

(assert (=> b!790651 e!439498))

(declare-fun res!535446 () Bool)

(assert (=> b!790651 (=> (not res!535446) (not e!439498))))

(assert (=> b!790651 (= res!535446 (= lt!352876 lt!352870))))

(assert (=> b!790651 (= lt!352870 (Found!8077 j!159))))

(assert (=> b!790651 (= lt!352876 (seekEntryOrOpen!0 (select (arr!20521 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!790651 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352878 () Unit!27373)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27373)

(assert (=> b!790651 (= lt!352878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790652 () Bool)

(declare-fun res!535450 () Bool)

(assert (=> b!790652 (=> (not res!535450) (not e!439494))))

(assert (=> b!790652 (= res!535450 e!439495)))

(declare-fun c!88010 () Bool)

(assert (=> b!790652 (= c!88010 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790653 () Bool)

(assert (=> b!790653 (= e!439496 e!439490)))

(declare-fun res!535442 () Bool)

(assert (=> b!790653 (=> res!535442 e!439490)))

(assert (=> b!790653 (= res!535442 (not (= lt!352872 lt!352870)))))

(assert (=> b!790653 (= lt!352872 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20521 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!68020 res!535452) b!790636))

(assert (= (and b!790636 res!535453) b!790634))

(assert (= (and b!790634 res!535455) b!790632))

(assert (= (and b!790632 res!535454) b!790644))

(assert (= (and b!790644 res!535449) b!790649))

(assert (= (and b!790649 res!535451) b!790641))

(assert (= (and b!790641 res!535448) b!790648))

(assert (= (and b!790648 res!535445) b!790635))

(assert (= (and b!790635 res!535440) b!790633))

(assert (= (and b!790633 res!535438) b!790645))

(assert (= (and b!790645 res!535447) b!790652))

(assert (= (and b!790652 c!88010) b!790639))

(assert (= (and b!790652 (not c!88010)) b!790642))

(assert (= (and b!790652 res!535450) b!790650))

(assert (= (and b!790650 res!535441) b!790651))

(assert (= (and b!790651 res!535446) b!790647))

(assert (= (and b!790651 (not res!535439)) b!790653))

(assert (= (and b!790653 (not res!535442)) b!790646))

(assert (= (and b!790646 (not res!535443)) b!790640))

(assert (= (and b!790640 c!88009) b!790637))

(assert (= (and b!790640 (not c!88009)) b!790643))

(assert (= (and b!790640 (not res!535444)) b!790638))

(declare-fun m!732035 () Bool)

(assert (=> start!68020 m!732035))

(declare-fun m!732037 () Bool)

(assert (=> start!68020 m!732037))

(declare-fun m!732039 () Bool)

(assert (=> b!790633 m!732039))

(assert (=> b!790633 m!732039))

(declare-fun m!732041 () Bool)

(assert (=> b!790633 m!732041))

(assert (=> b!790633 m!732041))

(assert (=> b!790633 m!732039))

(declare-fun m!732043 () Bool)

(assert (=> b!790633 m!732043))

(declare-fun m!732045 () Bool)

(assert (=> b!790648 m!732045))

(assert (=> b!790634 m!732039))

(assert (=> b!790634 m!732039))

(declare-fun m!732047 () Bool)

(assert (=> b!790634 m!732047))

(declare-fun m!732049 () Bool)

(assert (=> b!790645 m!732049))

(assert (=> b!790651 m!732039))

(assert (=> b!790651 m!732039))

(declare-fun m!732051 () Bool)

(assert (=> b!790651 m!732051))

(declare-fun m!732053 () Bool)

(assert (=> b!790651 m!732053))

(declare-fun m!732055 () Bool)

(assert (=> b!790651 m!732055))

(declare-fun m!732057 () Bool)

(assert (=> b!790632 m!732057))

(declare-fun m!732059 () Bool)

(assert (=> b!790641 m!732059))

(declare-fun m!732061 () Bool)

(assert (=> b!790638 m!732061))

(declare-fun m!732063 () Bool)

(assert (=> b!790644 m!732063))

(assert (=> b!790642 m!732039))

(assert (=> b!790642 m!732039))

(declare-fun m!732065 () Bool)

(assert (=> b!790642 m!732065))

(declare-fun m!732067 () Bool)

(assert (=> b!790649 m!732067))

(declare-fun m!732069 () Bool)

(assert (=> b!790650 m!732069))

(declare-fun m!732071 () Bool)

(assert (=> b!790650 m!732071))

(declare-fun m!732073 () Bool)

(assert (=> b!790650 m!732073))

(declare-fun m!732075 () Bool)

(assert (=> b!790650 m!732075))

(assert (=> b!790650 m!732075))

(declare-fun m!732077 () Bool)

(assert (=> b!790650 m!732077))

(assert (=> b!790639 m!732039))

(assert (=> b!790639 m!732039))

(declare-fun m!732079 () Bool)

(assert (=> b!790639 m!732079))

(assert (=> b!790653 m!732039))

(assert (=> b!790653 m!732039))

(assert (=> b!790653 m!732065))

(assert (=> b!790646 m!732071))

(declare-fun m!732081 () Bool)

(assert (=> b!790646 m!732081))

(declare-fun m!732083 () Bool)

(assert (=> b!790640 m!732083))

(declare-fun m!732085 () Bool)

(assert (=> b!790640 m!732085))

(declare-fun m!732087 () Bool)

(assert (=> b!790640 m!732087))

(assert (=> b!790647 m!732039))

(assert (=> b!790647 m!732039))

(declare-fun m!732089 () Bool)

(assert (=> b!790647 m!732089))

(check-sat (not b!790649) (not b!790647) (not b!790633) (not b!790640) (not b!790651) (not b!790644) (not b!790650) (not b!790632) (not b!790642) (not b!790639) (not b!790638) (not start!68020) (not b!790634) (not b!790653) (not b!790641) (not b!790648))
(check-sat)
