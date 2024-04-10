; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65350 () Bool)

(assert start!65350)

(declare-fun b!742760 () Bool)

(declare-fun e!415078 () Bool)

(declare-fun lt!329970 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742760 (= e!415078 (validKeyInArray!0 lt!329970))))

(declare-fun b!742761 () Bool)

(declare-fun res!499917 () Bool)

(declare-fun e!415081 () Bool)

(assert (=> b!742761 (=> (not res!499917) (not e!415081))))

(declare-fun e!415079 () Bool)

(assert (=> b!742761 (= res!499917 e!415079)))

(declare-fun c!81802 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742761 (= c!81802 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742762 () Bool)

(declare-fun e!415080 () Bool)

(declare-fun e!415082 () Bool)

(assert (=> b!742762 (= e!415080 e!415082)))

(declare-fun res!499933 () Bool)

(assert (=> b!742762 (=> (not res!499933) (not e!415082))))

(declare-datatypes ((SeekEntryResult!7475 0))(
  ( (MissingZero!7475 (index!32268 (_ BitVec 32))) (Found!7475 (index!32269 (_ BitVec 32))) (Intermediate!7475 (undefined!8287 Bool) (index!32270 (_ BitVec 32)) (x!63241 (_ BitVec 32))) (Undefined!7475) (MissingVacant!7475 (index!32271 (_ BitVec 32))) )
))
(declare-fun lt!329973 () SeekEntryResult!7475)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742762 (= res!499933 (or (= lt!329973 (MissingZero!7475 i!1173)) (= lt!329973 (MissingVacant!7475 i!1173))))))

(declare-datatypes ((array!41523 0))(
  ( (array!41524 (arr!19875 (Array (_ BitVec 32) (_ BitVec 64))) (size!20296 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41523)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41523 (_ BitVec 32)) SeekEntryResult!7475)

(assert (=> b!742762 (= lt!329973 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742763 () Bool)

(declare-fun res!499920 () Bool)

(assert (=> b!742763 (=> res!499920 e!415078)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41523 (_ BitVec 32)) SeekEntryResult!7475)

(assert (=> b!742763 (= res!499920 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19875 a!3186) j!159) a!3186 mask!3328) (Found!7475 j!159))))))

(declare-fun b!742764 () Bool)

(declare-fun e!415083 () Bool)

(assert (=> b!742764 (= e!415081 e!415083)))

(declare-fun res!499918 () Bool)

(assert (=> b!742764 (=> (not res!499918) (not e!415083))))

(declare-fun lt!329972 () SeekEntryResult!7475)

(declare-fun lt!329975 () SeekEntryResult!7475)

(assert (=> b!742764 (= res!499918 (= lt!329972 lt!329975))))

(declare-fun lt!329969 () array!41523)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41523 (_ BitVec 32)) SeekEntryResult!7475)

(assert (=> b!742764 (= lt!329975 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329970 lt!329969 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742764 (= lt!329972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329970 mask!3328) lt!329970 lt!329969 mask!3328))))

(assert (=> b!742764 (= lt!329970 (select (store (arr!19875 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742764 (= lt!329969 (array!41524 (store (arr!19875 a!3186) i!1173 k!2102) (size!20296 a!3186)))))

(declare-fun lt!329968 () SeekEntryResult!7475)

(declare-fun e!415084 () Bool)

(declare-fun b!742765 () Bool)

(assert (=> b!742765 (= e!415084 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19875 a!3186) j!159) a!3186 mask!3328) lt!329968))))

(declare-fun b!742766 () Bool)

(declare-fun res!499922 () Bool)

(assert (=> b!742766 (=> res!499922 e!415078)))

(assert (=> b!742766 (= res!499922 (or (not (= (select (store (arr!19875 a!3186) i!1173 k!2102) index!1321) lt!329970)) (undefined!8287 lt!329975) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742767 () Bool)

(declare-fun res!499928 () Bool)

(assert (=> b!742767 (=> (not res!499928) (not e!415082))))

(assert (=> b!742767 (= res!499928 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20296 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20296 a!3186))))))

(declare-fun b!742768 () Bool)

(declare-fun res!499932 () Bool)

(assert (=> b!742768 (=> (not res!499932) (not e!415080))))

(assert (=> b!742768 (= res!499932 (validKeyInArray!0 (select (arr!19875 a!3186) j!159)))))

(declare-fun b!742769 () Bool)

(assert (=> b!742769 (= e!415083 (not e!415078))))

(declare-fun res!499927 () Bool)

(assert (=> b!742769 (=> res!499927 e!415078)))

(assert (=> b!742769 (= res!499927 (or (not (is-Intermediate!7475 lt!329975)) (bvslt x!1131 (x!63241 lt!329975)) (not (= x!1131 (x!63241 lt!329975))) (not (= index!1321 (index!32270 lt!329975)))))))

(declare-fun e!415077 () Bool)

(assert (=> b!742769 e!415077))

(declare-fun res!499925 () Bool)

(assert (=> b!742769 (=> (not res!499925) (not e!415077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41523 (_ BitVec 32)) Bool)

(assert (=> b!742769 (= res!499925 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25430 0))(
  ( (Unit!25431) )
))
(declare-fun lt!329974 () Unit!25430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25430)

(assert (=> b!742769 (= lt!329974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742770 () Bool)

(declare-fun res!499919 () Bool)

(assert (=> b!742770 (=> (not res!499919) (not e!415082))))

(assert (=> b!742770 (= res!499919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742771 () Bool)

(assert (=> b!742771 (= e!415082 e!415081)))

(declare-fun res!499931 () Bool)

(assert (=> b!742771 (=> (not res!499931) (not e!415081))))

(declare-fun lt!329971 () SeekEntryResult!7475)

(assert (=> b!742771 (= res!499931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19875 a!3186) j!159) mask!3328) (select (arr!19875 a!3186) j!159) a!3186 mask!3328) lt!329971))))

(assert (=> b!742771 (= lt!329971 (Intermediate!7475 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742773 () Bool)

(declare-fun res!499923 () Bool)

(assert (=> b!742773 (=> (not res!499923) (not e!415080))))

(assert (=> b!742773 (= res!499923 (and (= (size!20296 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20296 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20296 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742774 () Bool)

(assert (=> b!742774 (= e!415077 e!415084)))

(declare-fun res!499930 () Bool)

(assert (=> b!742774 (=> (not res!499930) (not e!415084))))

(assert (=> b!742774 (= res!499930 (= (seekEntryOrOpen!0 (select (arr!19875 a!3186) j!159) a!3186 mask!3328) lt!329968))))

(assert (=> b!742774 (= lt!329968 (Found!7475 j!159))))

(declare-fun b!742775 () Bool)

(assert (=> b!742775 (= e!415079 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19875 a!3186) j!159) a!3186 mask!3328) lt!329971))))

(declare-fun b!742776 () Bool)

(declare-fun res!499924 () Bool)

(assert (=> b!742776 (=> (not res!499924) (not e!415080))))

(declare-fun arrayContainsKey!0 (array!41523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742776 (= res!499924 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742777 () Bool)

(assert (=> b!742777 (= e!415079 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19875 a!3186) j!159) a!3186 mask!3328) (Found!7475 j!159)))))

(declare-fun b!742772 () Bool)

(declare-fun res!499934 () Bool)

(assert (=> b!742772 (=> (not res!499934) (not e!415080))))

(assert (=> b!742772 (= res!499934 (validKeyInArray!0 k!2102))))

(declare-fun res!499929 () Bool)

(assert (=> start!65350 (=> (not res!499929) (not e!415080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65350 (= res!499929 (validMask!0 mask!3328))))

(assert (=> start!65350 e!415080))

(assert (=> start!65350 true))

(declare-fun array_inv!15671 (array!41523) Bool)

(assert (=> start!65350 (array_inv!15671 a!3186)))

(declare-fun b!742778 () Bool)

(declare-fun res!499926 () Bool)

(assert (=> b!742778 (=> (not res!499926) (not e!415081))))

(assert (=> b!742778 (= res!499926 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19875 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742779 () Bool)

(declare-fun res!499921 () Bool)

(assert (=> b!742779 (=> (not res!499921) (not e!415082))))

(declare-datatypes ((List!13877 0))(
  ( (Nil!13874) (Cons!13873 (h!14945 (_ BitVec 64)) (t!20192 List!13877)) )
))
(declare-fun arrayNoDuplicates!0 (array!41523 (_ BitVec 32) List!13877) Bool)

(assert (=> b!742779 (= res!499921 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13874))))

(assert (= (and start!65350 res!499929) b!742773))

(assert (= (and b!742773 res!499923) b!742768))

(assert (= (and b!742768 res!499932) b!742772))

(assert (= (and b!742772 res!499934) b!742776))

(assert (= (and b!742776 res!499924) b!742762))

(assert (= (and b!742762 res!499933) b!742770))

(assert (= (and b!742770 res!499919) b!742779))

(assert (= (and b!742779 res!499921) b!742767))

(assert (= (and b!742767 res!499928) b!742771))

(assert (= (and b!742771 res!499931) b!742778))

(assert (= (and b!742778 res!499926) b!742761))

(assert (= (and b!742761 c!81802) b!742775))

(assert (= (and b!742761 (not c!81802)) b!742777))

(assert (= (and b!742761 res!499917) b!742764))

(assert (= (and b!742764 res!499918) b!742769))

(assert (= (and b!742769 res!499925) b!742774))

(assert (= (and b!742774 res!499930) b!742765))

(assert (= (and b!742769 (not res!499927)) b!742763))

(assert (= (and b!742763 (not res!499920)) b!742766))

(assert (= (and b!742766 (not res!499922)) b!742760))

(declare-fun m!693571 () Bool)

(assert (=> b!742775 m!693571))

(assert (=> b!742775 m!693571))

(declare-fun m!693573 () Bool)

(assert (=> b!742775 m!693573))

(assert (=> b!742763 m!693571))

(assert (=> b!742763 m!693571))

(declare-fun m!693575 () Bool)

(assert (=> b!742763 m!693575))

(assert (=> b!742765 m!693571))

(assert (=> b!742765 m!693571))

(declare-fun m!693577 () Bool)

(assert (=> b!742765 m!693577))

(declare-fun m!693579 () Bool)

(assert (=> b!742766 m!693579))

(declare-fun m!693581 () Bool)

(assert (=> b!742766 m!693581))

(declare-fun m!693583 () Bool)

(assert (=> b!742769 m!693583))

(declare-fun m!693585 () Bool)

(assert (=> b!742769 m!693585))

(assert (=> b!742768 m!693571))

(assert (=> b!742768 m!693571))

(declare-fun m!693587 () Bool)

(assert (=> b!742768 m!693587))

(declare-fun m!693589 () Bool)

(assert (=> b!742779 m!693589))

(declare-fun m!693591 () Bool)

(assert (=> b!742778 m!693591))

(assert (=> b!742771 m!693571))

(assert (=> b!742771 m!693571))

(declare-fun m!693593 () Bool)

(assert (=> b!742771 m!693593))

(assert (=> b!742771 m!693593))

(assert (=> b!742771 m!693571))

(declare-fun m!693595 () Bool)

(assert (=> b!742771 m!693595))

(declare-fun m!693597 () Bool)

(assert (=> b!742772 m!693597))

(declare-fun m!693599 () Bool)

(assert (=> b!742762 m!693599))

(assert (=> b!742777 m!693571))

(assert (=> b!742777 m!693571))

(assert (=> b!742777 m!693575))

(declare-fun m!693601 () Bool)

(assert (=> b!742760 m!693601))

(declare-fun m!693603 () Bool)

(assert (=> b!742764 m!693603))

(assert (=> b!742764 m!693603))

(declare-fun m!693605 () Bool)

(assert (=> b!742764 m!693605))

(assert (=> b!742764 m!693579))

(declare-fun m!693607 () Bool)

(assert (=> b!742764 m!693607))

(declare-fun m!693609 () Bool)

(assert (=> b!742764 m!693609))

(declare-fun m!693611 () Bool)

(assert (=> b!742776 m!693611))

(declare-fun m!693613 () Bool)

(assert (=> start!65350 m!693613))

(declare-fun m!693615 () Bool)

(assert (=> start!65350 m!693615))

(assert (=> b!742774 m!693571))

(assert (=> b!742774 m!693571))

(declare-fun m!693617 () Bool)

(assert (=> b!742774 m!693617))

(declare-fun m!693619 () Bool)

(assert (=> b!742770 m!693619))

(push 1)

