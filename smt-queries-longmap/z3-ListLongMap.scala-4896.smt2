; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67556 () Bool)

(assert start!67556)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42659 0))(
  ( (array!42660 (arr!20419 (Array (_ BitVec 32) (_ BitVec 64))) (size!20840 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42659)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!434814 () Bool)

(declare-fun b!781825 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8019 0))(
  ( (MissingZero!8019 (index!34444 (_ BitVec 32))) (Found!8019 (index!34445 (_ BitVec 32))) (Intermediate!8019 (undefined!8831 Bool) (index!34446 (_ BitVec 32)) (x!65398 (_ BitVec 32))) (Undefined!8019) (MissingVacant!8019 (index!34447 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42659 (_ BitVec 32)) SeekEntryResult!8019)

(assert (=> b!781825 (= e!434814 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) (Found!8019 j!159)))))

(declare-fun b!781826 () Bool)

(declare-fun e!434813 () Bool)

(declare-fun e!434809 () Bool)

(assert (=> b!781826 (= e!434813 (not e!434809))))

(declare-fun res!528956 () Bool)

(assert (=> b!781826 (=> res!528956 e!434809)))

(declare-fun lt!348414 () SeekEntryResult!8019)

(get-info :version)

(assert (=> b!781826 (= res!528956 (or (not ((_ is Intermediate!8019) lt!348414)) (bvslt x!1131 (x!65398 lt!348414)) (not (= x!1131 (x!65398 lt!348414))) (not (= index!1321 (index!34446 lt!348414)))))))

(declare-fun e!434812 () Bool)

(assert (=> b!781826 e!434812))

(declare-fun res!528943 () Bool)

(assert (=> b!781826 (=> (not res!528943) (not e!434812))))

(declare-fun lt!348411 () SeekEntryResult!8019)

(declare-fun lt!348419 () SeekEntryResult!8019)

(assert (=> b!781826 (= res!528943 (= lt!348411 lt!348419))))

(assert (=> b!781826 (= lt!348419 (Found!8019 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42659 (_ BitVec 32)) SeekEntryResult!8019)

(assert (=> b!781826 (= lt!348411 (seekEntryOrOpen!0 (select (arr!20419 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42659 (_ BitVec 32)) Bool)

(assert (=> b!781826 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26964 0))(
  ( (Unit!26965) )
))
(declare-fun lt!348416 () Unit!26964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26964)

(assert (=> b!781826 (= lt!348416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781827 () Bool)

(declare-fun res!528948 () Bool)

(declare-fun e!434808 () Bool)

(assert (=> b!781827 (=> (not res!528948) (not e!434808))))

(declare-datatypes ((List!14421 0))(
  ( (Nil!14418) (Cons!14417 (h!15537 (_ BitVec 64)) (t!20736 List!14421)) )
))
(declare-fun arrayNoDuplicates!0 (array!42659 (_ BitVec 32) List!14421) Bool)

(assert (=> b!781827 (= res!528948 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14418))))

(declare-fun b!781828 () Bool)

(declare-fun e!434815 () Unit!26964)

(declare-fun Unit!26966 () Unit!26964)

(assert (=> b!781828 (= e!434815 Unit!26966)))

(declare-fun b!781829 () Bool)

(declare-fun res!528958 () Bool)

(assert (=> b!781829 (=> (not res!528958) (not e!434808))))

(assert (=> b!781829 (= res!528958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781830 () Bool)

(declare-fun res!528957 () Bool)

(assert (=> b!781830 (=> res!528957 e!434809)))

(assert (=> b!781830 (= res!528957 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348419)))))

(declare-fun b!781831 () Bool)

(declare-fun Unit!26967 () Unit!26964)

(assert (=> b!781831 (= e!434815 Unit!26967)))

(assert (=> b!781831 false))

(declare-fun b!781832 () Bool)

(declare-fun res!528955 () Bool)

(declare-fun e!434816 () Bool)

(assert (=> b!781832 (=> (not res!528955) (not e!434816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781832 (= res!528955 (validKeyInArray!0 (select (arr!20419 a!3186) j!159)))))

(declare-fun b!781834 () Bool)

(declare-fun res!528954 () Bool)

(declare-fun e!434810 () Bool)

(assert (=> b!781834 (=> (not res!528954) (not e!434810))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781834 (= res!528954 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20419 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781835 () Bool)

(declare-fun res!528951 () Bool)

(assert (=> b!781835 (=> (not res!528951) (not e!434816))))

(assert (=> b!781835 (= res!528951 (and (= (size!20840 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20840 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20840 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781836 () Bool)

(declare-fun res!528946 () Bool)

(assert (=> b!781836 (=> (not res!528946) (not e!434816))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781836 (= res!528946 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781837 () Bool)

(declare-fun res!528945 () Bool)

(assert (=> b!781837 (=> (not res!528945) (not e!434810))))

(assert (=> b!781837 (= res!528945 e!434814)))

(declare-fun c!86847 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781837 (= c!86847 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781838 () Bool)

(assert (=> b!781838 (= e!434816 e!434808)))

(declare-fun res!528947 () Bool)

(assert (=> b!781838 (=> (not res!528947) (not e!434808))))

(declare-fun lt!348412 () SeekEntryResult!8019)

(assert (=> b!781838 (= res!528947 (or (= lt!348412 (MissingZero!8019 i!1173)) (= lt!348412 (MissingVacant!8019 i!1173))))))

(assert (=> b!781838 (= lt!348412 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781839 () Bool)

(assert (=> b!781839 (= e!434812 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348419))))

(declare-fun b!781840 () Bool)

(assert (=> b!781840 (= e!434810 e!434813)))

(declare-fun res!528950 () Bool)

(assert (=> b!781840 (=> (not res!528950) (not e!434813))))

(declare-fun lt!348417 () SeekEntryResult!8019)

(assert (=> b!781840 (= res!528950 (= lt!348417 lt!348414))))

(declare-fun lt!348410 () (_ BitVec 64))

(declare-fun lt!348415 () array!42659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42659 (_ BitVec 32)) SeekEntryResult!8019)

(assert (=> b!781840 (= lt!348414 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348410 lt!348415 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781840 (= lt!348417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348410 mask!3328) lt!348410 lt!348415 mask!3328))))

(assert (=> b!781840 (= lt!348410 (select (store (arr!20419 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781840 (= lt!348415 (array!42660 (store (arr!20419 a!3186) i!1173 k0!2102) (size!20840 a!3186)))))

(declare-fun b!781841 () Bool)

(declare-fun res!528944 () Bool)

(assert (=> b!781841 (=> res!528944 e!434809)))

(assert (=> b!781841 (= res!528944 (= (select (store (arr!20419 a!3186) i!1173 k0!2102) index!1321) lt!348410))))

(declare-fun b!781842 () Bool)

(declare-fun res!528952 () Bool)

(assert (=> b!781842 (=> (not res!528952) (not e!434816))))

(assert (=> b!781842 (= res!528952 (validKeyInArray!0 k0!2102))))

(declare-fun lt!348413 () SeekEntryResult!8019)

(declare-fun b!781843 () Bool)

(assert (=> b!781843 (= e!434814 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348413))))

(declare-fun b!781833 () Bool)

(assert (=> b!781833 (= e!434808 e!434810)))

(declare-fun res!528949 () Bool)

(assert (=> b!781833 (=> (not res!528949) (not e!434810))))

(assert (=> b!781833 (= res!528949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20419 a!3186) j!159) mask!3328) (select (arr!20419 a!3186) j!159) a!3186 mask!3328) lt!348413))))

(assert (=> b!781833 (= lt!348413 (Intermediate!8019 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!528959 () Bool)

(assert (=> start!67556 (=> (not res!528959) (not e!434816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67556 (= res!528959 (validMask!0 mask!3328))))

(assert (=> start!67556 e!434816))

(assert (=> start!67556 true))

(declare-fun array_inv!16215 (array!42659) Bool)

(assert (=> start!67556 (array_inv!16215 a!3186)))

(declare-fun b!781844 () Bool)

(declare-fun res!528953 () Bool)

(assert (=> b!781844 (=> (not res!528953) (not e!434808))))

(assert (=> b!781844 (= res!528953 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20840 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20840 a!3186))))))

(declare-fun b!781845 () Bool)

(assert (=> b!781845 (= e!434809 true)))

(assert (=> b!781845 (= (select (store (arr!20419 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348418 () Unit!26964)

(assert (=> b!781845 (= lt!348418 e!434815)))

(declare-fun c!86848 () Bool)

(assert (=> b!781845 (= c!86848 (= (select (store (arr!20419 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67556 res!528959) b!781835))

(assert (= (and b!781835 res!528951) b!781832))

(assert (= (and b!781832 res!528955) b!781842))

(assert (= (and b!781842 res!528952) b!781836))

(assert (= (and b!781836 res!528946) b!781838))

(assert (= (and b!781838 res!528947) b!781829))

(assert (= (and b!781829 res!528958) b!781827))

(assert (= (and b!781827 res!528948) b!781844))

(assert (= (and b!781844 res!528953) b!781833))

(assert (= (and b!781833 res!528949) b!781834))

(assert (= (and b!781834 res!528954) b!781837))

(assert (= (and b!781837 c!86847) b!781843))

(assert (= (and b!781837 (not c!86847)) b!781825))

(assert (= (and b!781837 res!528945) b!781840))

(assert (= (and b!781840 res!528950) b!781826))

(assert (= (and b!781826 res!528943) b!781839))

(assert (= (and b!781826 (not res!528956)) b!781830))

(assert (= (and b!781830 (not res!528957)) b!781841))

(assert (= (and b!781841 (not res!528944)) b!781845))

(assert (= (and b!781845 c!86848) b!781831))

(assert (= (and b!781845 (not c!86848)) b!781828))

(declare-fun m!724763 () Bool)

(assert (=> b!781825 m!724763))

(assert (=> b!781825 m!724763))

(declare-fun m!724765 () Bool)

(assert (=> b!781825 m!724765))

(declare-fun m!724767 () Bool)

(assert (=> b!781841 m!724767))

(declare-fun m!724769 () Bool)

(assert (=> b!781841 m!724769))

(declare-fun m!724771 () Bool)

(assert (=> b!781840 m!724771))

(assert (=> b!781840 m!724767))

(declare-fun m!724773 () Bool)

(assert (=> b!781840 m!724773))

(declare-fun m!724775 () Bool)

(assert (=> b!781840 m!724775))

(assert (=> b!781840 m!724771))

(declare-fun m!724777 () Bool)

(assert (=> b!781840 m!724777))

(assert (=> b!781839 m!724763))

(assert (=> b!781839 m!724763))

(declare-fun m!724779 () Bool)

(assert (=> b!781839 m!724779))

(declare-fun m!724781 () Bool)

(assert (=> b!781827 m!724781))

(assert (=> b!781830 m!724763))

(assert (=> b!781830 m!724763))

(assert (=> b!781830 m!724765))

(assert (=> b!781826 m!724763))

(assert (=> b!781826 m!724763))

(declare-fun m!724783 () Bool)

(assert (=> b!781826 m!724783))

(declare-fun m!724785 () Bool)

(assert (=> b!781826 m!724785))

(declare-fun m!724787 () Bool)

(assert (=> b!781826 m!724787))

(declare-fun m!724789 () Bool)

(assert (=> b!781838 m!724789))

(declare-fun m!724791 () Bool)

(assert (=> b!781829 m!724791))

(declare-fun m!724793 () Bool)

(assert (=> b!781834 m!724793))

(declare-fun m!724795 () Bool)

(assert (=> b!781842 m!724795))

(declare-fun m!724797 () Bool)

(assert (=> start!67556 m!724797))

(declare-fun m!724799 () Bool)

(assert (=> start!67556 m!724799))

(declare-fun m!724801 () Bool)

(assert (=> b!781836 m!724801))

(assert (=> b!781843 m!724763))

(assert (=> b!781843 m!724763))

(declare-fun m!724803 () Bool)

(assert (=> b!781843 m!724803))

(assert (=> b!781833 m!724763))

(assert (=> b!781833 m!724763))

(declare-fun m!724805 () Bool)

(assert (=> b!781833 m!724805))

(assert (=> b!781833 m!724805))

(assert (=> b!781833 m!724763))

(declare-fun m!724807 () Bool)

(assert (=> b!781833 m!724807))

(assert (=> b!781845 m!724767))

(assert (=> b!781845 m!724769))

(assert (=> b!781832 m!724763))

(assert (=> b!781832 m!724763))

(declare-fun m!724809 () Bool)

(assert (=> b!781832 m!724809))

(check-sat (not b!781830) (not b!781843) (not b!781829) (not b!781836) (not b!781838) (not start!67556) (not b!781833) (not b!781825) (not b!781839) (not b!781842) (not b!781832) (not b!781827) (not b!781826) (not b!781840))
(check-sat)
