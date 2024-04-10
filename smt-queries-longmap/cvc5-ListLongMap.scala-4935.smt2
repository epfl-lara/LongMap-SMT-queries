; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67986 () Bool)

(assert start!67986)

(declare-fun b!790943 () Bool)

(declare-fun res!535751 () Bool)

(declare-fun e!439604 () Bool)

(assert (=> b!790943 (=> (not res!535751) (not e!439604))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42900 0))(
  ( (array!42901 (arr!20535 (Array (_ BitVec 32) (_ BitVec 64))) (size!20956 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42900)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790943 (= res!535751 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20956 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20956 a!3186))))))

(declare-fun b!790944 () Bool)

(declare-fun res!535760 () Bool)

(assert (=> b!790944 (=> (not res!535760) (not e!439604))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42900 (_ BitVec 32)) Bool)

(assert (=> b!790944 (= res!535760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790945 () Bool)

(declare-fun res!535747 () Bool)

(declare-fun e!439607 () Bool)

(assert (=> b!790945 (=> (not res!535747) (not e!439607))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790945 (= res!535747 (validKeyInArray!0 k!2102))))

(declare-fun b!790946 () Bool)

(assert (=> b!790946 (= e!439607 e!439604)))

(declare-fun res!535748 () Bool)

(assert (=> b!790946 (=> (not res!535748) (not e!439604))))

(declare-datatypes ((SeekEntryResult!8135 0))(
  ( (MissingZero!8135 (index!34908 (_ BitVec 32))) (Found!8135 (index!34909 (_ BitVec 32))) (Intermediate!8135 (undefined!8947 Bool) (index!34910 (_ BitVec 32)) (x!65853 (_ BitVec 32))) (Undefined!8135) (MissingVacant!8135 (index!34911 (_ BitVec 32))) )
))
(declare-fun lt!353083 () SeekEntryResult!8135)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790946 (= res!535748 (or (= lt!353083 (MissingZero!8135 i!1173)) (= lt!353083 (MissingVacant!8135 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42900 (_ BitVec 32)) SeekEntryResult!8135)

(assert (=> b!790946 (= lt!353083 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!790947 () Bool)

(declare-fun e!439603 () Bool)

(declare-fun e!439605 () Bool)

(assert (=> b!790947 (= e!439603 e!439605)))

(declare-fun res!535758 () Bool)

(assert (=> b!790947 (=> (not res!535758) (not e!439605))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!353087 () SeekEntryResult!8135)

(assert (=> b!790947 (= res!535758 (= (seekEntryOrOpen!0 (select (arr!20535 a!3186) j!159) a!3186 mask!3328) lt!353087))))

(assert (=> b!790947 (= lt!353087 (Found!8135 j!159))))

(declare-fun b!790948 () Bool)

(declare-fun res!535749 () Bool)

(declare-fun e!439610 () Bool)

(assert (=> b!790948 (=> (not res!535749) (not e!439610))))

(assert (=> b!790948 (= res!535749 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20535 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790949 () Bool)

(declare-fun res!535753 () Bool)

(assert (=> b!790949 (=> (not res!535753) (not e!439610))))

(declare-fun e!439608 () Bool)

(assert (=> b!790949 (= res!535753 e!439608)))

(declare-fun c!88009 () Bool)

(assert (=> b!790949 (= c!88009 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!535752 () Bool)

(assert (=> start!67986 (=> (not res!535752) (not e!439607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67986 (= res!535752 (validMask!0 mask!3328))))

(assert (=> start!67986 e!439607))

(assert (=> start!67986 true))

(declare-fun array_inv!16331 (array!42900) Bool)

(assert (=> start!67986 (array_inv!16331 a!3186)))

(declare-fun b!790950 () Bool)

(declare-fun lt!353085 () SeekEntryResult!8135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42900 (_ BitVec 32)) SeekEntryResult!8135)

(assert (=> b!790950 (= e!439608 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20535 a!3186) j!159) a!3186 mask!3328) lt!353085))))

(declare-fun b!790951 () Bool)

(declare-fun res!535759 () Bool)

(assert (=> b!790951 (=> (not res!535759) (not e!439607))))

(assert (=> b!790951 (= res!535759 (and (= (size!20956 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20956 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20956 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790952 () Bool)

(declare-fun res!535750 () Bool)

(assert (=> b!790952 (=> (not res!535750) (not e!439604))))

(declare-datatypes ((List!14537 0))(
  ( (Nil!14534) (Cons!14533 (h!15662 (_ BitVec 64)) (t!20852 List!14537)) )
))
(declare-fun arrayNoDuplicates!0 (array!42900 (_ BitVec 32) List!14537) Bool)

(assert (=> b!790952 (= res!535750 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14534))))

(declare-fun b!790953 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42900 (_ BitVec 32)) SeekEntryResult!8135)

(assert (=> b!790953 (= e!439605 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20535 a!3186) j!159) a!3186 mask!3328) lt!353087))))

(declare-fun b!790954 () Bool)

(declare-fun res!535746 () Bool)

(assert (=> b!790954 (=> (not res!535746) (not e!439607))))

(declare-fun arrayContainsKey!0 (array!42900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790954 (= res!535746 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790955 () Bool)

(assert (=> b!790955 (= e!439604 e!439610)))

(declare-fun res!535755 () Bool)

(assert (=> b!790955 (=> (not res!535755) (not e!439610))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790955 (= res!535755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20535 a!3186) j!159) mask!3328) (select (arr!20535 a!3186) j!159) a!3186 mask!3328) lt!353085))))

(assert (=> b!790955 (= lt!353085 (Intermediate!8135 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790956 () Bool)

(declare-fun e!439606 () Bool)

(assert (=> b!790956 (= e!439610 e!439606)))

(declare-fun res!535757 () Bool)

(assert (=> b!790956 (=> (not res!535757) (not e!439606))))

(declare-fun lt!353084 () (_ BitVec 64))

(declare-fun lt!353086 () array!42900)

(assert (=> b!790956 (= res!535757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353084 mask!3328) lt!353084 lt!353086 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353084 lt!353086 mask!3328)))))

(assert (=> b!790956 (= lt!353084 (select (store (arr!20535 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!790956 (= lt!353086 (array!42901 (store (arr!20535 a!3186) i!1173 k!2102) (size!20956 a!3186)))))

(declare-fun b!790957 () Bool)

(assert (=> b!790957 (= e!439608 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20535 a!3186) j!159) a!3186 mask!3328) (Found!8135 j!159)))))

(declare-fun b!790958 () Bool)

(assert (=> b!790958 (= e!439606 (not true))))

(assert (=> b!790958 e!439603))

(declare-fun res!535754 () Bool)

(assert (=> b!790958 (=> (not res!535754) (not e!439603))))

(assert (=> b!790958 (= res!535754 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27422 0))(
  ( (Unit!27423) )
))
(declare-fun lt!353082 () Unit!27422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27422)

(assert (=> b!790958 (= lt!353082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790959 () Bool)

(declare-fun res!535756 () Bool)

(assert (=> b!790959 (=> (not res!535756) (not e!439607))))

(assert (=> b!790959 (= res!535756 (validKeyInArray!0 (select (arr!20535 a!3186) j!159)))))

(assert (= (and start!67986 res!535752) b!790951))

(assert (= (and b!790951 res!535759) b!790959))

(assert (= (and b!790959 res!535756) b!790945))

(assert (= (and b!790945 res!535747) b!790954))

(assert (= (and b!790954 res!535746) b!790946))

(assert (= (and b!790946 res!535748) b!790944))

(assert (= (and b!790944 res!535760) b!790952))

(assert (= (and b!790952 res!535750) b!790943))

(assert (= (and b!790943 res!535751) b!790955))

(assert (= (and b!790955 res!535755) b!790948))

(assert (= (and b!790948 res!535749) b!790949))

(assert (= (and b!790949 c!88009) b!790950))

(assert (= (and b!790949 (not c!88009)) b!790957))

(assert (= (and b!790949 res!535753) b!790956))

(assert (= (and b!790956 res!535757) b!790958))

(assert (= (and b!790958 res!535754) b!790947))

(assert (= (and b!790947 res!535758) b!790953))

(declare-fun m!731729 () Bool)

(assert (=> b!790959 m!731729))

(assert (=> b!790959 m!731729))

(declare-fun m!731731 () Bool)

(assert (=> b!790959 m!731731))

(declare-fun m!731733 () Bool)

(assert (=> b!790944 m!731733))

(assert (=> b!790950 m!731729))

(assert (=> b!790950 m!731729))

(declare-fun m!731735 () Bool)

(assert (=> b!790950 m!731735))

(declare-fun m!731737 () Bool)

(assert (=> start!67986 m!731737))

(declare-fun m!731739 () Bool)

(assert (=> start!67986 m!731739))

(declare-fun m!731741 () Bool)

(assert (=> b!790945 m!731741))

(declare-fun m!731743 () Bool)

(assert (=> b!790958 m!731743))

(declare-fun m!731745 () Bool)

(assert (=> b!790958 m!731745))

(declare-fun m!731747 () Bool)

(assert (=> b!790948 m!731747))

(declare-fun m!731749 () Bool)

(assert (=> b!790956 m!731749))

(declare-fun m!731751 () Bool)

(assert (=> b!790956 m!731751))

(declare-fun m!731753 () Bool)

(assert (=> b!790956 m!731753))

(assert (=> b!790956 m!731751))

(declare-fun m!731755 () Bool)

(assert (=> b!790956 m!731755))

(declare-fun m!731757 () Bool)

(assert (=> b!790956 m!731757))

(declare-fun m!731759 () Bool)

(assert (=> b!790946 m!731759))

(assert (=> b!790957 m!731729))

(assert (=> b!790957 m!731729))

(declare-fun m!731761 () Bool)

(assert (=> b!790957 m!731761))

(assert (=> b!790955 m!731729))

(assert (=> b!790955 m!731729))

(declare-fun m!731763 () Bool)

(assert (=> b!790955 m!731763))

(assert (=> b!790955 m!731763))

(assert (=> b!790955 m!731729))

(declare-fun m!731765 () Bool)

(assert (=> b!790955 m!731765))

(assert (=> b!790947 m!731729))

(assert (=> b!790947 m!731729))

(declare-fun m!731767 () Bool)

(assert (=> b!790947 m!731767))

(declare-fun m!731769 () Bool)

(assert (=> b!790952 m!731769))

(assert (=> b!790953 m!731729))

(assert (=> b!790953 m!731729))

(declare-fun m!731771 () Bool)

(assert (=> b!790953 m!731771))

(declare-fun m!731773 () Bool)

(assert (=> b!790954 m!731773))

(push 1)

