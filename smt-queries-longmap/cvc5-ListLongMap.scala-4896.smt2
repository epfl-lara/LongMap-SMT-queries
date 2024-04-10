; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67554 () Bool)

(assert start!67554)

(declare-fun res!528894 () Bool)

(declare-fun e!434785 () Bool)

(assert (=> start!67554 (=> (not res!528894) (not e!434785))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67554 (= res!528894 (validMask!0 mask!3328))))

(assert (=> start!67554 e!434785))

(assert (=> start!67554 true))

(declare-datatypes ((array!42657 0))(
  ( (array!42658 (arr!20418 (Array (_ BitVec 32) (_ BitVec 64))) (size!20839 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42657)

(declare-fun array_inv!16214 (array!42657) Bool)

(assert (=> start!67554 (array_inv!16214 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!434788 () Bool)

(declare-fun b!781762 () Bool)

(declare-datatypes ((SeekEntryResult!8018 0))(
  ( (MissingZero!8018 (index!34440 (_ BitVec 32))) (Found!8018 (index!34441 (_ BitVec 32))) (Intermediate!8018 (undefined!8830 Bool) (index!34442 (_ BitVec 32)) (x!65397 (_ BitVec 32))) (Undefined!8018) (MissingVacant!8018 (index!34443 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42657 (_ BitVec 32)) SeekEntryResult!8018)

(assert (=> b!781762 (= e!434788 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20418 a!3186) j!159) a!3186 mask!3328) (Found!8018 j!159)))))

(declare-fun b!781763 () Bool)

(declare-fun res!528902 () Bool)

(assert (=> b!781763 (=> (not res!528902) (not e!434785))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781763 (= res!528902 (and (= (size!20839 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20839 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20839 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781764 () Bool)

(declare-fun res!528903 () Bool)

(assert (=> b!781764 (=> (not res!528903) (not e!434785))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781764 (= res!528903 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781765 () Bool)

(declare-fun res!528898 () Bool)

(declare-fun e!434783 () Bool)

(assert (=> b!781765 (=> (not res!528898) (not e!434783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42657 (_ BitVec 32)) Bool)

(assert (=> b!781765 (= res!528898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781766 () Bool)

(declare-fun res!528895 () Bool)

(assert (=> b!781766 (=> (not res!528895) (not e!434783))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781766 (= res!528895 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20839 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20839 a!3186))))))

(declare-fun b!781767 () Bool)

(declare-fun e!434781 () Bool)

(assert (=> b!781767 (= e!434783 e!434781)))

(declare-fun res!528907 () Bool)

(assert (=> b!781767 (=> (not res!528907) (not e!434781))))

(declare-fun lt!348385 () SeekEntryResult!8018)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42657 (_ BitVec 32)) SeekEntryResult!8018)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781767 (= res!528907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20418 a!3186) j!159) mask!3328) (select (arr!20418 a!3186) j!159) a!3186 mask!3328) lt!348385))))

(assert (=> b!781767 (= lt!348385 (Intermediate!8018 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781768 () Bool)

(declare-fun res!528899 () Bool)

(assert (=> b!781768 (=> (not res!528899) (not e!434785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781768 (= res!528899 (validKeyInArray!0 (select (arr!20418 a!3186) j!159)))))

(declare-fun b!781769 () Bool)

(declare-datatypes ((Unit!26960 0))(
  ( (Unit!26961) )
))
(declare-fun e!434786 () Unit!26960)

(declare-fun Unit!26962 () Unit!26960)

(assert (=> b!781769 (= e!434786 Unit!26962)))

(declare-fun b!781770 () Bool)

(assert (=> b!781770 (= e!434785 e!434783)))

(declare-fun res!528904 () Bool)

(assert (=> b!781770 (=> (not res!528904) (not e!434783))))

(declare-fun lt!348389 () SeekEntryResult!8018)

(assert (=> b!781770 (= res!528904 (or (= lt!348389 (MissingZero!8018 i!1173)) (= lt!348389 (MissingVacant!8018 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42657 (_ BitVec 32)) SeekEntryResult!8018)

(assert (=> b!781770 (= lt!348389 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781771 () Bool)

(declare-fun res!528901 () Bool)

(assert (=> b!781771 (=> (not res!528901) (not e!434781))))

(assert (=> b!781771 (= res!528901 e!434788)))

(declare-fun c!86842 () Bool)

(assert (=> b!781771 (= c!86842 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781772 () Bool)

(declare-fun e!434784 () Bool)

(declare-fun e!434782 () Bool)

(assert (=> b!781772 (= e!434784 (not e!434782))))

(declare-fun res!528906 () Bool)

(assert (=> b!781772 (=> res!528906 e!434782)))

(declare-fun lt!348380 () SeekEntryResult!8018)

(assert (=> b!781772 (= res!528906 (or (not (is-Intermediate!8018 lt!348380)) (bvslt x!1131 (x!65397 lt!348380)) (not (= x!1131 (x!65397 lt!348380))) (not (= index!1321 (index!34442 lt!348380)))))))

(declare-fun e!434789 () Bool)

(assert (=> b!781772 e!434789))

(declare-fun res!528892 () Bool)

(assert (=> b!781772 (=> (not res!528892) (not e!434789))))

(declare-fun lt!348384 () SeekEntryResult!8018)

(declare-fun lt!348383 () SeekEntryResult!8018)

(assert (=> b!781772 (= res!528892 (= lt!348384 lt!348383))))

(assert (=> b!781772 (= lt!348383 (Found!8018 j!159))))

(assert (=> b!781772 (= lt!348384 (seekEntryOrOpen!0 (select (arr!20418 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781772 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348381 () Unit!26960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26960)

(assert (=> b!781772 (= lt!348381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781773 () Bool)

(declare-fun res!528896 () Bool)

(assert (=> b!781773 (=> res!528896 e!434782)))

(assert (=> b!781773 (= res!528896 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20418 a!3186) j!159) a!3186 mask!3328) lt!348383)))))

(declare-fun b!781774 () Bool)

(assert (=> b!781774 (= e!434789 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20418 a!3186) j!159) a!3186 mask!3328) lt!348383))))

(declare-fun b!781775 () Bool)

(declare-fun res!528897 () Bool)

(assert (=> b!781775 (=> (not res!528897) (not e!434785))))

(assert (=> b!781775 (= res!528897 (validKeyInArray!0 k!2102))))

(declare-fun b!781776 () Bool)

(declare-fun res!528900 () Bool)

(assert (=> b!781776 (=> res!528900 e!434782)))

(declare-fun lt!348387 () (_ BitVec 64))

(assert (=> b!781776 (= res!528900 (= (select (store (arr!20418 a!3186) i!1173 k!2102) index!1321) lt!348387))))

(declare-fun b!781777 () Bool)

(assert (=> b!781777 (= e!434782 true)))

(assert (=> b!781777 (= (select (store (arr!20418 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348386 () Unit!26960)

(assert (=> b!781777 (= lt!348386 e!434786)))

(declare-fun c!86841 () Bool)

(assert (=> b!781777 (= c!86841 (= (select (store (arr!20418 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781778 () Bool)

(declare-fun res!528908 () Bool)

(assert (=> b!781778 (=> (not res!528908) (not e!434783))))

(declare-datatypes ((List!14420 0))(
  ( (Nil!14417) (Cons!14416 (h!15536 (_ BitVec 64)) (t!20735 List!14420)) )
))
(declare-fun arrayNoDuplicates!0 (array!42657 (_ BitVec 32) List!14420) Bool)

(assert (=> b!781778 (= res!528908 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14417))))

(declare-fun b!781779 () Bool)

(declare-fun res!528893 () Bool)

(assert (=> b!781779 (=> (not res!528893) (not e!434781))))

(assert (=> b!781779 (= res!528893 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20418 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781780 () Bool)

(declare-fun Unit!26963 () Unit!26960)

(assert (=> b!781780 (= e!434786 Unit!26963)))

(assert (=> b!781780 false))

(declare-fun b!781781 () Bool)

(assert (=> b!781781 (= e!434781 e!434784)))

(declare-fun res!528905 () Bool)

(assert (=> b!781781 (=> (not res!528905) (not e!434784))))

(declare-fun lt!348382 () SeekEntryResult!8018)

(assert (=> b!781781 (= res!528905 (= lt!348382 lt!348380))))

(declare-fun lt!348388 () array!42657)

(assert (=> b!781781 (= lt!348380 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348387 lt!348388 mask!3328))))

(assert (=> b!781781 (= lt!348382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348387 mask!3328) lt!348387 lt!348388 mask!3328))))

(assert (=> b!781781 (= lt!348387 (select (store (arr!20418 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781781 (= lt!348388 (array!42658 (store (arr!20418 a!3186) i!1173 k!2102) (size!20839 a!3186)))))

(declare-fun b!781782 () Bool)

(assert (=> b!781782 (= e!434788 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20418 a!3186) j!159) a!3186 mask!3328) lt!348385))))

(assert (= (and start!67554 res!528894) b!781763))

(assert (= (and b!781763 res!528902) b!781768))

(assert (= (and b!781768 res!528899) b!781775))

(assert (= (and b!781775 res!528897) b!781764))

(assert (= (and b!781764 res!528903) b!781770))

(assert (= (and b!781770 res!528904) b!781765))

(assert (= (and b!781765 res!528898) b!781778))

(assert (= (and b!781778 res!528908) b!781766))

(assert (= (and b!781766 res!528895) b!781767))

(assert (= (and b!781767 res!528907) b!781779))

(assert (= (and b!781779 res!528893) b!781771))

(assert (= (and b!781771 c!86842) b!781782))

(assert (= (and b!781771 (not c!86842)) b!781762))

(assert (= (and b!781771 res!528901) b!781781))

(assert (= (and b!781781 res!528905) b!781772))

(assert (= (and b!781772 res!528892) b!781774))

(assert (= (and b!781772 (not res!528906)) b!781773))

(assert (= (and b!781773 (not res!528896)) b!781776))

(assert (= (and b!781776 (not res!528900)) b!781777))

(assert (= (and b!781777 c!86841) b!781780))

(assert (= (and b!781777 (not c!86841)) b!781769))

(declare-fun m!724715 () Bool)

(assert (=> b!781770 m!724715))

(declare-fun m!724717 () Bool)

(assert (=> start!67554 m!724717))

(declare-fun m!724719 () Bool)

(assert (=> start!67554 m!724719))

(declare-fun m!724721 () Bool)

(assert (=> b!781767 m!724721))

(assert (=> b!781767 m!724721))

(declare-fun m!724723 () Bool)

(assert (=> b!781767 m!724723))

(assert (=> b!781767 m!724723))

(assert (=> b!781767 m!724721))

(declare-fun m!724725 () Bool)

(assert (=> b!781767 m!724725))

(declare-fun m!724727 () Bool)

(assert (=> b!781776 m!724727))

(declare-fun m!724729 () Bool)

(assert (=> b!781776 m!724729))

(assert (=> b!781762 m!724721))

(assert (=> b!781762 m!724721))

(declare-fun m!724731 () Bool)

(assert (=> b!781762 m!724731))

(assert (=> b!781768 m!724721))

(assert (=> b!781768 m!724721))

(declare-fun m!724733 () Bool)

(assert (=> b!781768 m!724733))

(declare-fun m!724735 () Bool)

(assert (=> b!781765 m!724735))

(assert (=> b!781777 m!724727))

(assert (=> b!781777 m!724729))

(declare-fun m!724737 () Bool)

(assert (=> b!781779 m!724737))

(declare-fun m!724739 () Bool)

(assert (=> b!781778 m!724739))

(assert (=> b!781773 m!724721))

(assert (=> b!781773 m!724721))

(assert (=> b!781773 m!724731))

(assert (=> b!781781 m!724727))

(declare-fun m!724741 () Bool)

(assert (=> b!781781 m!724741))

(declare-fun m!724743 () Bool)

(assert (=> b!781781 m!724743))

(assert (=> b!781781 m!724743))

(declare-fun m!724745 () Bool)

(assert (=> b!781781 m!724745))

(declare-fun m!724747 () Bool)

(assert (=> b!781781 m!724747))

(assert (=> b!781772 m!724721))

(assert (=> b!781772 m!724721))

(declare-fun m!724749 () Bool)

(assert (=> b!781772 m!724749))

(declare-fun m!724751 () Bool)

(assert (=> b!781772 m!724751))

(declare-fun m!724753 () Bool)

(assert (=> b!781772 m!724753))

(declare-fun m!724755 () Bool)

(assert (=> b!781775 m!724755))

(assert (=> b!781774 m!724721))

(assert (=> b!781774 m!724721))

(declare-fun m!724757 () Bool)

(assert (=> b!781774 m!724757))

(assert (=> b!781782 m!724721))

(assert (=> b!781782 m!724721))

(declare-fun m!724759 () Bool)

(assert (=> b!781782 m!724759))

(declare-fun m!724761 () Bool)

(assert (=> b!781764 m!724761))

(push 1)

