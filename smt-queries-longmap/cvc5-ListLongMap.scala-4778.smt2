; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65728 () Bool)

(assert start!65728)

(declare-fun b!754529 () Bool)

(declare-datatypes ((Unit!26036 0))(
  ( (Unit!26037) )
))
(declare-fun e!420807 () Unit!26036)

(declare-fun Unit!26038 () Unit!26036)

(assert (=> b!754529 (= e!420807 Unit!26038)))

(declare-fun b!754530 () Bool)

(declare-fun res!509876 () Bool)

(declare-fun e!420800 () Bool)

(assert (=> b!754530 (=> (not res!509876) (not e!420800))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41901 0))(
  ( (array!41902 (arr!20064 (Array (_ BitVec 32) (_ BitVec 64))) (size!20485 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41901)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!754530 (= res!509876 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20485 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20485 a!3186))))))

(declare-fun b!754532 () Bool)

(declare-fun res!509873 () Bool)

(assert (=> b!754532 (=> (not res!509873) (not e!420800))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41901 (_ BitVec 32)) Bool)

(assert (=> b!754532 (= res!509873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754533 () Bool)

(declare-fun res!509869 () Bool)

(declare-fun e!420804 () Bool)

(assert (=> b!754533 (=> (not res!509869) (not e!420804))))

(declare-fun e!420806 () Bool)

(assert (=> b!754533 (= res!509869 e!420806)))

(declare-fun c!82713 () Bool)

(assert (=> b!754533 (= c!82713 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754534 () Bool)

(declare-fun res!509881 () Bool)

(declare-fun e!420808 () Bool)

(assert (=> b!754534 (=> (not res!509881) (not e!420808))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754534 (= res!509881 (validKeyInArray!0 (select (arr!20064 a!3186) j!159)))))

(declare-fun b!754535 () Bool)

(declare-fun e!420809 () Bool)

(declare-fun e!420798 () Bool)

(assert (=> b!754535 (= e!420809 (not e!420798))))

(declare-fun res!509864 () Bool)

(assert (=> b!754535 (=> res!509864 e!420798)))

(declare-datatypes ((SeekEntryResult!7664 0))(
  ( (MissingZero!7664 (index!33024 (_ BitVec 32))) (Found!7664 (index!33025 (_ BitVec 32))) (Intermediate!7664 (undefined!8476 Bool) (index!33026 (_ BitVec 32)) (x!63934 (_ BitVec 32))) (Undefined!7664) (MissingVacant!7664 (index!33027 (_ BitVec 32))) )
))
(declare-fun lt!335797 () SeekEntryResult!7664)

(assert (=> b!754535 (= res!509864 (or (not (is-Intermediate!7664 lt!335797)) (bvslt x!1131 (x!63934 lt!335797)) (not (= x!1131 (x!63934 lt!335797))) (not (= index!1321 (index!33026 lt!335797)))))))

(declare-fun e!420803 () Bool)

(assert (=> b!754535 e!420803))

(declare-fun res!509871 () Bool)

(assert (=> b!754535 (=> (not res!509871) (not e!420803))))

(declare-fun lt!335799 () SeekEntryResult!7664)

(declare-fun lt!335794 () SeekEntryResult!7664)

(assert (=> b!754535 (= res!509871 (= lt!335799 lt!335794))))

(assert (=> b!754535 (= lt!335794 (Found!7664 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41901 (_ BitVec 32)) SeekEntryResult!7664)

(assert (=> b!754535 (= lt!335799 (seekEntryOrOpen!0 (select (arr!20064 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754535 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335791 () Unit!26036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26036)

(assert (=> b!754535 (= lt!335791 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754536 () Bool)

(declare-fun lt!335801 () SeekEntryResult!7664)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41901 (_ BitVec 32)) SeekEntryResult!7664)

(assert (=> b!754536 (= e!420806 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20064 a!3186) j!159) a!3186 mask!3328) lt!335801))))

(declare-fun b!754537 () Bool)

(assert (=> b!754537 (= e!420800 e!420804)))

(declare-fun res!509865 () Bool)

(assert (=> b!754537 (=> (not res!509865) (not e!420804))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754537 (= res!509865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20064 a!3186) j!159) mask!3328) (select (arr!20064 a!3186) j!159) a!3186 mask!3328) lt!335801))))

(assert (=> b!754537 (= lt!335801 (Intermediate!7664 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754538 () Bool)

(declare-fun res!509875 () Bool)

(declare-fun e!420805 () Bool)

(assert (=> b!754538 (=> (not res!509875) (not e!420805))))

(declare-fun lt!335792 () (_ BitVec 64))

(declare-fun lt!335790 () array!41901)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41901 (_ BitVec 32)) SeekEntryResult!7664)

(assert (=> b!754538 (= res!509875 (= (seekEntryOrOpen!0 lt!335792 lt!335790 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335792 lt!335790 mask!3328)))))

(declare-fun b!754539 () Bool)

(declare-fun e!420802 () Bool)

(declare-fun e!420799 () Bool)

(assert (=> b!754539 (= e!420802 e!420799)))

(declare-fun res!509879 () Bool)

(assert (=> b!754539 (=> res!509879 e!420799)))

(declare-fun lt!335796 () (_ BitVec 64))

(assert (=> b!754539 (= res!509879 (= lt!335796 lt!335792))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!754539 (= lt!335796 (select (store (arr!20064 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754540 () Bool)

(declare-fun res!509880 () Bool)

(assert (=> b!754540 (=> (not res!509880) (not e!420808))))

(assert (=> b!754540 (= res!509880 (and (= (size!20485 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20485 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20485 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754541 () Bool)

(declare-fun res!509872 () Bool)

(assert (=> b!754541 (=> (not res!509872) (not e!420808))))

(declare-fun arrayContainsKey!0 (array!41901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754541 (= res!509872 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754542 () Bool)

(assert (=> b!754542 (= e!420804 e!420809)))

(declare-fun res!509874 () Bool)

(assert (=> b!754542 (=> (not res!509874) (not e!420809))))

(declare-fun lt!335795 () SeekEntryResult!7664)

(assert (=> b!754542 (= res!509874 (= lt!335795 lt!335797))))

(assert (=> b!754542 (= lt!335797 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335792 lt!335790 mask!3328))))

(assert (=> b!754542 (= lt!335795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335792 mask!3328) lt!335792 lt!335790 mask!3328))))

(assert (=> b!754542 (= lt!335792 (select (store (arr!20064 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754542 (= lt!335790 (array!41902 (store (arr!20064 a!3186) i!1173 k!2102) (size!20485 a!3186)))))

(declare-fun b!754543 () Bool)

(declare-fun lt!335800 () SeekEntryResult!7664)

(assert (=> b!754543 (= e!420805 (= lt!335799 lt!335800))))

(declare-fun b!754544 () Bool)

(assert (=> b!754544 (= e!420799 true)))

(assert (=> b!754544 e!420805))

(declare-fun res!509867 () Bool)

(assert (=> b!754544 (=> (not res!509867) (not e!420805))))

(assert (=> b!754544 (= res!509867 (= lt!335796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335798 () Unit!26036)

(assert (=> b!754544 (= lt!335798 e!420807)))

(declare-fun c!82714 () Bool)

(assert (=> b!754544 (= c!82714 (= lt!335796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!509877 () Bool)

(assert (=> start!65728 (=> (not res!509877) (not e!420808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65728 (= res!509877 (validMask!0 mask!3328))))

(assert (=> start!65728 e!420808))

(assert (=> start!65728 true))

(declare-fun array_inv!15860 (array!41901) Bool)

(assert (=> start!65728 (array_inv!15860 a!3186)))

(declare-fun b!754531 () Bool)

(declare-fun Unit!26039 () Unit!26036)

(assert (=> b!754531 (= e!420807 Unit!26039)))

(assert (=> b!754531 false))

(declare-fun b!754545 () Bool)

(assert (=> b!754545 (= e!420803 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20064 a!3186) j!159) a!3186 mask!3328) lt!335794))))

(declare-fun b!754546 () Bool)

(declare-fun res!509878 () Bool)

(assert (=> b!754546 (=> (not res!509878) (not e!420800))))

(declare-datatypes ((List!14066 0))(
  ( (Nil!14063) (Cons!14062 (h!15134 (_ BitVec 64)) (t!20381 List!14066)) )
))
(declare-fun arrayNoDuplicates!0 (array!41901 (_ BitVec 32) List!14066) Bool)

(assert (=> b!754546 (= res!509878 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14063))))

(declare-fun b!754547 () Bool)

(assert (=> b!754547 (= e!420806 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20064 a!3186) j!159) a!3186 mask!3328) (Found!7664 j!159)))))

(declare-fun b!754548 () Bool)

(declare-fun res!509866 () Bool)

(assert (=> b!754548 (=> (not res!509866) (not e!420808))))

(assert (=> b!754548 (= res!509866 (validKeyInArray!0 k!2102))))

(declare-fun b!754549 () Bool)

(declare-fun res!509868 () Bool)

(assert (=> b!754549 (=> (not res!509868) (not e!420804))))

(assert (=> b!754549 (= res!509868 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20064 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754550 () Bool)

(assert (=> b!754550 (= e!420798 e!420802)))

(declare-fun res!509882 () Bool)

(assert (=> b!754550 (=> res!509882 e!420802)))

(assert (=> b!754550 (= res!509882 (not (= lt!335800 lt!335794)))))

(assert (=> b!754550 (= lt!335800 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20064 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754551 () Bool)

(assert (=> b!754551 (= e!420808 e!420800)))

(declare-fun res!509870 () Bool)

(assert (=> b!754551 (=> (not res!509870) (not e!420800))))

(declare-fun lt!335793 () SeekEntryResult!7664)

(assert (=> b!754551 (= res!509870 (or (= lt!335793 (MissingZero!7664 i!1173)) (= lt!335793 (MissingVacant!7664 i!1173))))))

(assert (=> b!754551 (= lt!335793 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65728 res!509877) b!754540))

(assert (= (and b!754540 res!509880) b!754534))

(assert (= (and b!754534 res!509881) b!754548))

(assert (= (and b!754548 res!509866) b!754541))

(assert (= (and b!754541 res!509872) b!754551))

(assert (= (and b!754551 res!509870) b!754532))

(assert (= (and b!754532 res!509873) b!754546))

(assert (= (and b!754546 res!509878) b!754530))

(assert (= (and b!754530 res!509876) b!754537))

(assert (= (and b!754537 res!509865) b!754549))

(assert (= (and b!754549 res!509868) b!754533))

(assert (= (and b!754533 c!82713) b!754536))

(assert (= (and b!754533 (not c!82713)) b!754547))

(assert (= (and b!754533 res!509869) b!754542))

(assert (= (and b!754542 res!509874) b!754535))

(assert (= (and b!754535 res!509871) b!754545))

(assert (= (and b!754535 (not res!509864)) b!754550))

(assert (= (and b!754550 (not res!509882)) b!754539))

(assert (= (and b!754539 (not res!509879)) b!754544))

(assert (= (and b!754544 c!82714) b!754531))

(assert (= (and b!754544 (not c!82714)) b!754529))

(assert (= (and b!754544 res!509867) b!754538))

(assert (= (and b!754538 res!509875) b!754543))

(declare-fun m!702955 () Bool)

(assert (=> b!754537 m!702955))

(assert (=> b!754537 m!702955))

(declare-fun m!702957 () Bool)

(assert (=> b!754537 m!702957))

(assert (=> b!754537 m!702957))

(assert (=> b!754537 m!702955))

(declare-fun m!702959 () Bool)

(assert (=> b!754537 m!702959))

(declare-fun m!702961 () Bool)

(assert (=> b!754542 m!702961))

(declare-fun m!702963 () Bool)

(assert (=> b!754542 m!702963))

(declare-fun m!702965 () Bool)

(assert (=> b!754542 m!702965))

(declare-fun m!702967 () Bool)

(assert (=> b!754542 m!702967))

(assert (=> b!754542 m!702963))

(declare-fun m!702969 () Bool)

(assert (=> b!754542 m!702969))

(declare-fun m!702971 () Bool)

(assert (=> b!754549 m!702971))

(assert (=> b!754534 m!702955))

(assert (=> b!754534 m!702955))

(declare-fun m!702973 () Bool)

(assert (=> b!754534 m!702973))

(assert (=> b!754550 m!702955))

(assert (=> b!754550 m!702955))

(declare-fun m!702975 () Bool)

(assert (=> b!754550 m!702975))

(declare-fun m!702977 () Bool)

(assert (=> b!754551 m!702977))

(assert (=> b!754545 m!702955))

(assert (=> b!754545 m!702955))

(declare-fun m!702979 () Bool)

(assert (=> b!754545 m!702979))

(declare-fun m!702981 () Bool)

(assert (=> b!754541 m!702981))

(declare-fun m!702983 () Bool)

(assert (=> b!754548 m!702983))

(assert (=> b!754536 m!702955))

(assert (=> b!754536 m!702955))

(declare-fun m!702985 () Bool)

(assert (=> b!754536 m!702985))

(declare-fun m!702987 () Bool)

(assert (=> b!754532 m!702987))

(declare-fun m!702989 () Bool)

(assert (=> b!754538 m!702989))

(declare-fun m!702991 () Bool)

(assert (=> b!754538 m!702991))

(assert (=> b!754539 m!702965))

(declare-fun m!702993 () Bool)

(assert (=> b!754539 m!702993))

(declare-fun m!702995 () Bool)

(assert (=> start!65728 m!702995))

(declare-fun m!702997 () Bool)

(assert (=> start!65728 m!702997))

(assert (=> b!754535 m!702955))

(assert (=> b!754535 m!702955))

(declare-fun m!702999 () Bool)

(assert (=> b!754535 m!702999))

(declare-fun m!703001 () Bool)

(assert (=> b!754535 m!703001))

(declare-fun m!703003 () Bool)

(assert (=> b!754535 m!703003))

(assert (=> b!754547 m!702955))

(assert (=> b!754547 m!702955))

(assert (=> b!754547 m!702975))

(declare-fun m!703005 () Bool)

(assert (=> b!754546 m!703005))

(push 1)

