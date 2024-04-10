; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65764 () Bool)

(assert start!65764)

(declare-fun e!421454 () Bool)

(declare-datatypes ((array!41937 0))(
  ( (array!41938 (arr!20082 (Array (_ BitVec 32) (_ BitVec 64))) (size!20503 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41937)

(declare-datatypes ((SeekEntryResult!7682 0))(
  ( (MissingZero!7682 (index!33096 (_ BitVec 32))) (Found!7682 (index!33097 (_ BitVec 32))) (Intermediate!7682 (undefined!8494 Bool) (index!33098 (_ BitVec 32)) (x!64000 (_ BitVec 32))) (Undefined!7682) (MissingVacant!7682 (index!33099 (_ BitVec 32))) )
))
(declare-fun lt!336444 () SeekEntryResult!7682)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!755771 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41937 (_ BitVec 32)) SeekEntryResult!7682)

(assert (=> b!755771 (= e!421454 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20082 a!3186) j!159) a!3186 mask!3328) lt!336444))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!755772 () Bool)

(declare-fun e!421453 () Bool)

(declare-fun lt!336441 () SeekEntryResult!7682)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41937 (_ BitVec 32)) SeekEntryResult!7682)

(assert (=> b!755772 (= e!421453 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20082 a!3186) j!159) a!3186 mask!3328) lt!336441))))

(declare-fun res!510908 () Bool)

(declare-fun e!421455 () Bool)

(assert (=> start!65764 (=> (not res!510908) (not e!421455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65764 (= res!510908 (validMask!0 mask!3328))))

(assert (=> start!65764 e!421455))

(assert (=> start!65764 true))

(declare-fun array_inv!15878 (array!41937) Bool)

(assert (=> start!65764 (array_inv!15878 a!3186)))

(declare-fun b!755773 () Bool)

(declare-fun e!421449 () Bool)

(assert (=> b!755773 (= e!421449 true)))

(declare-fun e!421451 () Bool)

(assert (=> b!755773 e!421451))

(declare-fun res!510906 () Bool)

(assert (=> b!755773 (=> (not res!510906) (not e!421451))))

(declare-fun lt!336439 () (_ BitVec 64))

(assert (=> b!755773 (= res!510906 (= lt!336439 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26108 0))(
  ( (Unit!26109) )
))
(declare-fun lt!336445 () Unit!26108)

(declare-fun e!421457 () Unit!26108)

(assert (=> b!755773 (= lt!336445 e!421457)))

(declare-fun c!82822 () Bool)

(assert (=> b!755773 (= c!82822 (= lt!336439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755774 () Bool)

(declare-fun e!421456 () Bool)

(declare-fun e!421448 () Bool)

(assert (=> b!755774 (= e!421456 e!421448)))

(declare-fun res!510900 () Bool)

(assert (=> b!755774 (=> (not res!510900) (not e!421448))))

(declare-fun lt!336443 () SeekEntryResult!7682)

(declare-fun lt!336440 () SeekEntryResult!7682)

(assert (=> b!755774 (= res!510900 (= lt!336443 lt!336440))))

(declare-fun lt!336438 () array!41937)

(declare-fun lt!336442 () (_ BitVec 64))

(assert (=> b!755774 (= lt!336440 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336442 lt!336438 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755774 (= lt!336443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336442 mask!3328) lt!336442 lt!336438 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!755774 (= lt!336442 (select (store (arr!20082 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755774 (= lt!336438 (array!41938 (store (arr!20082 a!3186) i!1173 k!2102) (size!20503 a!3186)))))

(declare-fun b!755775 () Bool)

(declare-fun lt!336449 () SeekEntryResult!7682)

(declare-fun lt!336446 () SeekEntryResult!7682)

(assert (=> b!755775 (= e!421451 (= lt!336449 lt!336446))))

(declare-fun b!755776 () Bool)

(declare-fun res!510895 () Bool)

(assert (=> b!755776 (=> (not res!510895) (not e!421451))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41937 (_ BitVec 32)) SeekEntryResult!7682)

(assert (=> b!755776 (= res!510895 (= (seekEntryOrOpen!0 lt!336442 lt!336438 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336442 lt!336438 mask!3328)))))

(declare-fun b!755777 () Bool)

(declare-fun e!421447 () Bool)

(assert (=> b!755777 (= e!421448 (not e!421447))))

(declare-fun res!510904 () Bool)

(assert (=> b!755777 (=> res!510904 e!421447)))

(assert (=> b!755777 (= res!510904 (or (not (is-Intermediate!7682 lt!336440)) (bvslt x!1131 (x!64000 lt!336440)) (not (= x!1131 (x!64000 lt!336440))) (not (= index!1321 (index!33098 lt!336440)))))))

(assert (=> b!755777 e!421453))

(declare-fun res!510896 () Bool)

(assert (=> b!755777 (=> (not res!510896) (not e!421453))))

(assert (=> b!755777 (= res!510896 (= lt!336449 lt!336441))))

(assert (=> b!755777 (= lt!336441 (Found!7682 j!159))))

(assert (=> b!755777 (= lt!336449 (seekEntryOrOpen!0 (select (arr!20082 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41937 (_ BitVec 32)) Bool)

(assert (=> b!755777 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336447 () Unit!26108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26108)

(assert (=> b!755777 (= lt!336447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755778 () Bool)

(declare-fun e!421450 () Bool)

(assert (=> b!755778 (= e!421450 e!421449)))

(declare-fun res!510907 () Bool)

(assert (=> b!755778 (=> res!510907 e!421449)))

(assert (=> b!755778 (= res!510907 (= lt!336439 lt!336442))))

(assert (=> b!755778 (= lt!336439 (select (store (arr!20082 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755779 () Bool)

(declare-fun res!510899 () Bool)

(assert (=> b!755779 (=> (not res!510899) (not e!421456))))

(assert (=> b!755779 (= res!510899 e!421454)))

(declare-fun c!82821 () Bool)

(assert (=> b!755779 (= c!82821 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755780 () Bool)

(assert (=> b!755780 (= e!421447 e!421450)))

(declare-fun res!510891 () Bool)

(assert (=> b!755780 (=> res!510891 e!421450)))

(assert (=> b!755780 (= res!510891 (not (= lt!336446 lt!336441)))))

(assert (=> b!755780 (= lt!336446 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20082 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755781 () Bool)

(declare-fun res!510902 () Bool)

(assert (=> b!755781 (=> (not res!510902) (not e!421455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755781 (= res!510902 (validKeyInArray!0 k!2102))))

(declare-fun b!755782 () Bool)

(declare-fun res!510893 () Bool)

(declare-fun e!421452 () Bool)

(assert (=> b!755782 (=> (not res!510893) (not e!421452))))

(declare-datatypes ((List!14084 0))(
  ( (Nil!14081) (Cons!14080 (h!15152 (_ BitVec 64)) (t!20399 List!14084)) )
))
(declare-fun arrayNoDuplicates!0 (array!41937 (_ BitVec 32) List!14084) Bool)

(assert (=> b!755782 (= res!510893 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14081))))

(declare-fun b!755783 () Bool)

(assert (=> b!755783 (= e!421455 e!421452)))

(declare-fun res!510905 () Bool)

(assert (=> b!755783 (=> (not res!510905) (not e!421452))))

(declare-fun lt!336448 () SeekEntryResult!7682)

(assert (=> b!755783 (= res!510905 (or (= lt!336448 (MissingZero!7682 i!1173)) (= lt!336448 (MissingVacant!7682 i!1173))))))

(assert (=> b!755783 (= lt!336448 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755784 () Bool)

(declare-fun Unit!26110 () Unit!26108)

(assert (=> b!755784 (= e!421457 Unit!26110)))

(assert (=> b!755784 false))

(declare-fun b!755785 () Bool)

(declare-fun res!510898 () Bool)

(assert (=> b!755785 (=> (not res!510898) (not e!421455))))

(assert (=> b!755785 (= res!510898 (validKeyInArray!0 (select (arr!20082 a!3186) j!159)))))

(declare-fun b!755786 () Bool)

(declare-fun res!510903 () Bool)

(assert (=> b!755786 (=> (not res!510903) (not e!421456))))

(assert (=> b!755786 (= res!510903 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20082 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755787 () Bool)

(declare-fun res!510894 () Bool)

(assert (=> b!755787 (=> (not res!510894) (not e!421455))))

(assert (=> b!755787 (= res!510894 (and (= (size!20503 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20503 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20503 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755788 () Bool)

(declare-fun res!510901 () Bool)

(assert (=> b!755788 (=> (not res!510901) (not e!421452))))

(assert (=> b!755788 (= res!510901 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20503 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20503 a!3186))))))

(declare-fun b!755789 () Bool)

(declare-fun Unit!26111 () Unit!26108)

(assert (=> b!755789 (= e!421457 Unit!26111)))

(declare-fun b!755790 () Bool)

(declare-fun res!510890 () Bool)

(assert (=> b!755790 (=> (not res!510890) (not e!421452))))

(assert (=> b!755790 (= res!510890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755791 () Bool)

(declare-fun res!510897 () Bool)

(assert (=> b!755791 (=> (not res!510897) (not e!421455))))

(declare-fun arrayContainsKey!0 (array!41937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755791 (= res!510897 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755792 () Bool)

(assert (=> b!755792 (= e!421452 e!421456)))

(declare-fun res!510892 () Bool)

(assert (=> b!755792 (=> (not res!510892) (not e!421456))))

(assert (=> b!755792 (= res!510892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20082 a!3186) j!159) mask!3328) (select (arr!20082 a!3186) j!159) a!3186 mask!3328) lt!336444))))

(assert (=> b!755792 (= lt!336444 (Intermediate!7682 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755793 () Bool)

(assert (=> b!755793 (= e!421454 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20082 a!3186) j!159) a!3186 mask!3328) (Found!7682 j!159)))))

(assert (= (and start!65764 res!510908) b!755787))

(assert (= (and b!755787 res!510894) b!755785))

(assert (= (and b!755785 res!510898) b!755781))

(assert (= (and b!755781 res!510902) b!755791))

(assert (= (and b!755791 res!510897) b!755783))

(assert (= (and b!755783 res!510905) b!755790))

(assert (= (and b!755790 res!510890) b!755782))

(assert (= (and b!755782 res!510893) b!755788))

(assert (= (and b!755788 res!510901) b!755792))

(assert (= (and b!755792 res!510892) b!755786))

(assert (= (and b!755786 res!510903) b!755779))

(assert (= (and b!755779 c!82821) b!755771))

(assert (= (and b!755779 (not c!82821)) b!755793))

(assert (= (and b!755779 res!510899) b!755774))

(assert (= (and b!755774 res!510900) b!755777))

(assert (= (and b!755777 res!510896) b!755772))

(assert (= (and b!755777 (not res!510904)) b!755780))

(assert (= (and b!755780 (not res!510891)) b!755778))

(assert (= (and b!755778 (not res!510907)) b!755773))

(assert (= (and b!755773 c!82822) b!755784))

(assert (= (and b!755773 (not c!82822)) b!755789))

(assert (= (and b!755773 res!510906) b!755776))

(assert (= (and b!755776 res!510895) b!755775))

(declare-fun m!703891 () Bool)

(assert (=> b!755778 m!703891))

(declare-fun m!703893 () Bool)

(assert (=> b!755778 m!703893))

(declare-fun m!703895 () Bool)

(assert (=> b!755781 m!703895))

(declare-fun m!703897 () Bool)

(assert (=> b!755774 m!703897))

(declare-fun m!703899 () Bool)

(assert (=> b!755774 m!703899))

(assert (=> b!755774 m!703891))

(declare-fun m!703901 () Bool)

(assert (=> b!755774 m!703901))

(assert (=> b!755774 m!703899))

(declare-fun m!703903 () Bool)

(assert (=> b!755774 m!703903))

(declare-fun m!703905 () Bool)

(assert (=> b!755782 m!703905))

(declare-fun m!703907 () Bool)

(assert (=> b!755792 m!703907))

(assert (=> b!755792 m!703907))

(declare-fun m!703909 () Bool)

(assert (=> b!755792 m!703909))

(assert (=> b!755792 m!703909))

(assert (=> b!755792 m!703907))

(declare-fun m!703911 () Bool)

(assert (=> b!755792 m!703911))

(assert (=> b!755772 m!703907))

(assert (=> b!755772 m!703907))

(declare-fun m!703913 () Bool)

(assert (=> b!755772 m!703913))

(declare-fun m!703915 () Bool)

(assert (=> b!755776 m!703915))

(declare-fun m!703917 () Bool)

(assert (=> b!755776 m!703917))

(declare-fun m!703919 () Bool)

(assert (=> b!755786 m!703919))

(declare-fun m!703921 () Bool)

(assert (=> b!755791 m!703921))

(declare-fun m!703923 () Bool)

(assert (=> start!65764 m!703923))

(declare-fun m!703925 () Bool)

(assert (=> start!65764 m!703925))

(assert (=> b!755777 m!703907))

(assert (=> b!755777 m!703907))

(declare-fun m!703927 () Bool)

(assert (=> b!755777 m!703927))

(declare-fun m!703929 () Bool)

(assert (=> b!755777 m!703929))

(declare-fun m!703931 () Bool)

(assert (=> b!755777 m!703931))

(declare-fun m!703933 () Bool)

(assert (=> b!755790 m!703933))

(assert (=> b!755785 m!703907))

(assert (=> b!755785 m!703907))

(declare-fun m!703935 () Bool)

(assert (=> b!755785 m!703935))

(assert (=> b!755793 m!703907))

(assert (=> b!755793 m!703907))

(declare-fun m!703937 () Bool)

(assert (=> b!755793 m!703937))

(assert (=> b!755771 m!703907))

(assert (=> b!755771 m!703907))

(declare-fun m!703939 () Bool)

(assert (=> b!755771 m!703939))

(assert (=> b!755780 m!703907))

(assert (=> b!755780 m!703907))

(assert (=> b!755780 m!703937))

(declare-fun m!703941 () Bool)

(assert (=> b!755783 m!703941))

(push 1)

