; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67896 () Bool)

(assert start!67896)

(declare-fun b!789789 () Bool)

(declare-fun res!535017 () Bool)

(declare-fun e!438968 () Bool)

(assert (=> b!789789 (=> (not res!535017) (not e!438968))))

(declare-datatypes ((array!42873 0))(
  ( (array!42874 (arr!20523 (Array (_ BitVec 32) (_ BitVec 64))) (size!20944 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42873)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789789 (= res!535017 (validKeyInArray!0 (select (arr!20523 a!3186) j!159)))))

(declare-fun b!789790 () Bool)

(declare-datatypes ((Unit!27380 0))(
  ( (Unit!27381) )
))
(declare-fun e!438970 () Unit!27380)

(declare-fun Unit!27382 () Unit!27380)

(assert (=> b!789790 (= e!438970 Unit!27382)))

(declare-fun b!789791 () Bool)

(declare-fun res!535018 () Bool)

(declare-fun e!438969 () Bool)

(assert (=> b!789791 (=> (not res!535018) (not e!438969))))

(declare-fun e!438971 () Bool)

(assert (=> b!789791 (= res!535018 e!438971)))

(declare-fun c!87802 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789791 (= c!87802 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789792 () Bool)

(declare-fun res!535022 () Bool)

(assert (=> b!789792 (=> (not res!535022) (not e!438969))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789792 (= res!535022 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20523 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789793 () Bool)

(declare-fun e!438972 () Bool)

(assert (=> b!789793 (= e!438972 e!438969)))

(declare-fun res!535010 () Bool)

(assert (=> b!789793 (=> (not res!535010) (not e!438969))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8123 0))(
  ( (MissingZero!8123 (index!34860 (_ BitVec 32))) (Found!8123 (index!34861 (_ BitVec 32))) (Intermediate!8123 (undefined!8935 Bool) (index!34862 (_ BitVec 32)) (x!65800 (_ BitVec 32))) (Undefined!8123) (MissingVacant!8123 (index!34863 (_ BitVec 32))) )
))
(declare-fun lt!352470 () SeekEntryResult!8123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42873 (_ BitVec 32)) SeekEntryResult!8123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789793 (= res!535010 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20523 a!3186) j!159) mask!3328) (select (arr!20523 a!3186) j!159) a!3186 mask!3328) lt!352470))))

(assert (=> b!789793 (= lt!352470 (Intermediate!8123 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789794 () Bool)

(declare-fun Unit!27383 () Unit!27380)

(assert (=> b!789794 (= e!438970 Unit!27383)))

(assert (=> b!789794 false))

(declare-fun b!789795 () Bool)

(declare-fun res!535019 () Bool)

(assert (=> b!789795 (=> (not res!535019) (not e!438972))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!789795 (= res!535019 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20944 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20944 a!3186))))))

(declare-fun b!789796 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42873 (_ BitVec 32)) SeekEntryResult!8123)

(assert (=> b!789796 (= e!438971 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20523 a!3186) j!159) a!3186 mask!3328) (Found!8123 j!159)))))

(declare-fun b!789797 () Bool)

(declare-fun e!438966 () Bool)

(declare-fun e!438973 () Bool)

(assert (=> b!789797 (= e!438966 e!438973)))

(declare-fun res!535014 () Bool)

(assert (=> b!789797 (=> res!535014 e!438973)))

(assert (=> b!789797 (= res!535014 (or (not (= (select (arr!20523 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352472 () SeekEntryResult!8123)

(declare-fun lt!352463 () SeekEntryResult!8123)

(declare-fun lt!352459 () SeekEntryResult!8123)

(declare-fun lt!352462 () SeekEntryResult!8123)

(assert (=> b!789797 (and (= lt!352459 lt!352462) (= lt!352463 lt!352472))))

(declare-fun lt!352468 () array!42873)

(declare-fun lt!352460 () (_ BitVec 64))

(assert (=> b!789797 (= lt!352462 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352460 lt!352468 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42873 (_ BitVec 32)) SeekEntryResult!8123)

(assert (=> b!789797 (= lt!352459 (seekEntryOrOpen!0 lt!352460 lt!352468 mask!3328))))

(declare-fun lt!352471 () (_ BitVec 64))

(assert (=> b!789797 (= lt!352471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352467 () Unit!27380)

(assert (=> b!789797 (= lt!352467 e!438970)))

(declare-fun c!87801 () Bool)

(assert (=> b!789797 (= c!87801 (= lt!352471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789798 () Bool)

(declare-fun res!535005 () Bool)

(assert (=> b!789798 (=> (not res!535005) (not e!438972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42873 (_ BitVec 32)) Bool)

(assert (=> b!789798 (= res!535005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789799 () Bool)

(declare-fun res!535013 () Bool)

(assert (=> b!789799 (=> (not res!535013) (not e!438968))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!789799 (= res!535013 (validKeyInArray!0 k!2102))))

(declare-fun b!789800 () Bool)

(declare-fun e!438965 () Bool)

(declare-fun e!438967 () Bool)

(assert (=> b!789800 (= e!438965 (not e!438967))))

(declare-fun res!535021 () Bool)

(assert (=> b!789800 (=> res!535021 e!438967)))

(declare-fun lt!352461 () SeekEntryResult!8123)

(assert (=> b!789800 (= res!535021 (or (not (is-Intermediate!8123 lt!352461)) (bvslt x!1131 (x!65800 lt!352461)) (not (= x!1131 (x!65800 lt!352461))) (not (= index!1321 (index!34862 lt!352461)))))))

(declare-fun e!438974 () Bool)

(assert (=> b!789800 e!438974))

(declare-fun res!535006 () Bool)

(assert (=> b!789800 (=> (not res!535006) (not e!438974))))

(declare-fun lt!352469 () SeekEntryResult!8123)

(assert (=> b!789800 (= res!535006 (= lt!352463 lt!352469))))

(assert (=> b!789800 (= lt!352469 (Found!8123 j!159))))

(assert (=> b!789800 (= lt!352463 (seekEntryOrOpen!0 (select (arr!20523 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789800 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352464 () Unit!27380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27380)

(assert (=> b!789800 (= lt!352464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789801 () Bool)

(declare-fun e!438963 () Bool)

(assert (=> b!789801 (= e!438967 e!438963)))

(declare-fun res!535015 () Bool)

(assert (=> b!789801 (=> res!535015 e!438963)))

(assert (=> b!789801 (= res!535015 (not (= lt!352472 lt!352469)))))

(assert (=> b!789801 (= lt!352472 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20523 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!535012 () Bool)

(assert (=> start!67896 (=> (not res!535012) (not e!438968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67896 (= res!535012 (validMask!0 mask!3328))))

(assert (=> start!67896 e!438968))

(assert (=> start!67896 true))

(declare-fun array_inv!16319 (array!42873) Bool)

(assert (=> start!67896 (array_inv!16319 a!3186)))

(declare-fun b!789802 () Bool)

(assert (=> b!789802 (= e!438969 e!438965)))

(declare-fun res!535007 () Bool)

(assert (=> b!789802 (=> (not res!535007) (not e!438965))))

(declare-fun lt!352465 () SeekEntryResult!8123)

(assert (=> b!789802 (= res!535007 (= lt!352465 lt!352461))))

(assert (=> b!789802 (= lt!352461 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352460 lt!352468 mask!3328))))

(assert (=> b!789802 (= lt!352465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352460 mask!3328) lt!352460 lt!352468 mask!3328))))

(assert (=> b!789802 (= lt!352460 (select (store (arr!20523 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789802 (= lt!352468 (array!42874 (store (arr!20523 a!3186) i!1173 k!2102) (size!20944 a!3186)))))

(declare-fun b!789803 () Bool)

(declare-fun res!535020 () Bool)

(assert (=> b!789803 (=> (not res!535020) (not e!438968))))

(assert (=> b!789803 (= res!535020 (and (= (size!20944 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20944 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20944 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789804 () Bool)

(assert (=> b!789804 (= e!438974 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20523 a!3186) j!159) a!3186 mask!3328) lt!352469))))

(declare-fun b!789805 () Bool)

(assert (=> b!789805 (= e!438973 true)))

(assert (=> b!789805 (= lt!352462 lt!352472)))

(declare-fun lt!352466 () Unit!27380)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27380)

(assert (=> b!789805 (= lt!352466 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789806 () Bool)

(assert (=> b!789806 (= e!438968 e!438972)))

(declare-fun res!535011 () Bool)

(assert (=> b!789806 (=> (not res!535011) (not e!438972))))

(declare-fun lt!352458 () SeekEntryResult!8123)

(assert (=> b!789806 (= res!535011 (or (= lt!352458 (MissingZero!8123 i!1173)) (= lt!352458 (MissingVacant!8123 i!1173))))))

(assert (=> b!789806 (= lt!352458 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!789807 () Bool)

(assert (=> b!789807 (= e!438963 e!438966)))

(declare-fun res!535009 () Bool)

(assert (=> b!789807 (=> res!535009 e!438966)))

(assert (=> b!789807 (= res!535009 (= lt!352471 lt!352460))))

(assert (=> b!789807 (= lt!352471 (select (store (arr!20523 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789808 () Bool)

(declare-fun res!535008 () Bool)

(assert (=> b!789808 (=> (not res!535008) (not e!438968))))

(declare-fun arrayContainsKey!0 (array!42873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789808 (= res!535008 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789809 () Bool)

(assert (=> b!789809 (= e!438971 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20523 a!3186) j!159) a!3186 mask!3328) lt!352470))))

(declare-fun b!789810 () Bool)

(declare-fun res!535016 () Bool)

(assert (=> b!789810 (=> (not res!535016) (not e!438972))))

(declare-datatypes ((List!14525 0))(
  ( (Nil!14522) (Cons!14521 (h!15647 (_ BitVec 64)) (t!20840 List!14525)) )
))
(declare-fun arrayNoDuplicates!0 (array!42873 (_ BitVec 32) List!14525) Bool)

(assert (=> b!789810 (= res!535016 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14522))))

(assert (= (and start!67896 res!535012) b!789803))

(assert (= (and b!789803 res!535020) b!789789))

(assert (= (and b!789789 res!535017) b!789799))

(assert (= (and b!789799 res!535013) b!789808))

(assert (= (and b!789808 res!535008) b!789806))

(assert (= (and b!789806 res!535011) b!789798))

(assert (= (and b!789798 res!535005) b!789810))

(assert (= (and b!789810 res!535016) b!789795))

(assert (= (and b!789795 res!535019) b!789793))

(assert (= (and b!789793 res!535010) b!789792))

(assert (= (and b!789792 res!535022) b!789791))

(assert (= (and b!789791 c!87802) b!789809))

(assert (= (and b!789791 (not c!87802)) b!789796))

(assert (= (and b!789791 res!535018) b!789802))

(assert (= (and b!789802 res!535007) b!789800))

(assert (= (and b!789800 res!535006) b!789804))

(assert (= (and b!789800 (not res!535021)) b!789801))

(assert (= (and b!789801 (not res!535015)) b!789807))

(assert (= (and b!789807 (not res!535009)) b!789797))

(assert (= (and b!789797 c!87801) b!789794))

(assert (= (and b!789797 (not c!87801)) b!789790))

(assert (= (and b!789797 (not res!535014)) b!789805))

(declare-fun m!730805 () Bool)

(assert (=> b!789809 m!730805))

(assert (=> b!789809 m!730805))

(declare-fun m!730807 () Bool)

(assert (=> b!789809 m!730807))

(declare-fun m!730809 () Bool)

(assert (=> b!789802 m!730809))

(declare-fun m!730811 () Bool)

(assert (=> b!789802 m!730811))

(assert (=> b!789802 m!730809))

(declare-fun m!730813 () Bool)

(assert (=> b!789802 m!730813))

(declare-fun m!730815 () Bool)

(assert (=> b!789802 m!730815))

(declare-fun m!730817 () Bool)

(assert (=> b!789802 m!730817))

(assert (=> b!789793 m!730805))

(assert (=> b!789793 m!730805))

(declare-fun m!730819 () Bool)

(assert (=> b!789793 m!730819))

(assert (=> b!789793 m!730819))

(assert (=> b!789793 m!730805))

(declare-fun m!730821 () Bool)

(assert (=> b!789793 m!730821))

(assert (=> b!789789 m!730805))

(assert (=> b!789789 m!730805))

(declare-fun m!730823 () Bool)

(assert (=> b!789789 m!730823))

(assert (=> b!789804 m!730805))

(assert (=> b!789804 m!730805))

(declare-fun m!730825 () Bool)

(assert (=> b!789804 m!730825))

(assert (=> b!789796 m!730805))

(assert (=> b!789796 m!730805))

(declare-fun m!730827 () Bool)

(assert (=> b!789796 m!730827))

(declare-fun m!730829 () Bool)

(assert (=> b!789806 m!730829))

(declare-fun m!730831 () Bool)

(assert (=> b!789792 m!730831))

(declare-fun m!730833 () Bool)

(assert (=> b!789810 m!730833))

(assert (=> b!789801 m!730805))

(assert (=> b!789801 m!730805))

(assert (=> b!789801 m!730827))

(assert (=> b!789807 m!730813))

(declare-fun m!730835 () Bool)

(assert (=> b!789807 m!730835))

(declare-fun m!730837 () Bool)

(assert (=> b!789797 m!730837))

(declare-fun m!730839 () Bool)

(assert (=> b!789797 m!730839))

(declare-fun m!730841 () Bool)

(assert (=> b!789797 m!730841))

(declare-fun m!730843 () Bool)

(assert (=> start!67896 m!730843))

(declare-fun m!730845 () Bool)

(assert (=> start!67896 m!730845))

(assert (=> b!789800 m!730805))

(assert (=> b!789800 m!730805))

(declare-fun m!730847 () Bool)

(assert (=> b!789800 m!730847))

(declare-fun m!730849 () Bool)

(assert (=> b!789800 m!730849))

(declare-fun m!730851 () Bool)

(assert (=> b!789800 m!730851))

(declare-fun m!730853 () Bool)

(assert (=> b!789808 m!730853))

(declare-fun m!730855 () Bool)

(assert (=> b!789799 m!730855))

(declare-fun m!730857 () Bool)

(assert (=> b!789798 m!730857))

(declare-fun m!730859 () Bool)

(assert (=> b!789805 m!730859))

(push 1)

