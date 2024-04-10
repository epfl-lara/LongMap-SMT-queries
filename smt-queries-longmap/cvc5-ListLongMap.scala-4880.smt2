; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67260 () Bool)

(assert start!67260)

(declare-fun b!777719 () Bool)

(declare-fun res!526133 () Bool)

(declare-fun e!432731 () Bool)

(assert (=> b!777719 (=> (not res!526133) (not e!432731))))

(declare-fun e!432736 () Bool)

(assert (=> b!777719 (= res!526133 e!432736)))

(declare-fun c!86200 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777719 (= c!86200 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!526129 () Bool)

(declare-fun e!432729 () Bool)

(assert (=> start!67260 (=> (not res!526129) (not e!432729))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67260 (= res!526129 (validMask!0 mask!3328))))

(assert (=> start!67260 e!432729))

(assert (=> start!67260 true))

(declare-datatypes ((array!42552 0))(
  ( (array!42553 (arr!20370 (Array (_ BitVec 32) (_ BitVec 64))) (size!20791 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42552)

(declare-fun array_inv!16166 (array!42552) Bool)

(assert (=> start!67260 (array_inv!16166 a!3186)))

(declare-fun b!777720 () Bool)

(declare-fun e!432735 () Bool)

(declare-fun e!432737 () Bool)

(assert (=> b!777720 (= e!432735 (not e!432737))))

(declare-fun res!526135 () Bool)

(assert (=> b!777720 (=> res!526135 e!432737)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7970 0))(
  ( (MissingZero!7970 (index!34248 (_ BitVec 32))) (Found!7970 (index!34249 (_ BitVec 32))) (Intermediate!7970 (undefined!8782 Bool) (index!34250 (_ BitVec 32)) (x!65194 (_ BitVec 32))) (Undefined!7970) (MissingVacant!7970 (index!34251 (_ BitVec 32))) )
))
(declare-fun lt!346489 () SeekEntryResult!7970)

(assert (=> b!777720 (= res!526135 (or (not (is-Intermediate!7970 lt!346489)) (bvslt x!1131 (x!65194 lt!346489)) (not (= x!1131 (x!65194 lt!346489))) (not (= index!1321 (index!34250 lt!346489)))))))

(declare-fun e!432733 () Bool)

(assert (=> b!777720 e!432733))

(declare-fun res!526131 () Bool)

(assert (=> b!777720 (=> (not res!526131) (not e!432733))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42552 (_ BitVec 32)) Bool)

(assert (=> b!777720 (= res!526131 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26834 0))(
  ( (Unit!26835) )
))
(declare-fun lt!346490 () Unit!26834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26834)

(assert (=> b!777720 (= lt!346490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777721 () Bool)

(declare-fun e!432732 () Bool)

(assert (=> b!777721 (= e!432733 e!432732)))

(declare-fun res!526124 () Bool)

(assert (=> b!777721 (=> (not res!526124) (not e!432732))))

(declare-fun lt!346496 () SeekEntryResult!7970)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42552 (_ BitVec 32)) SeekEntryResult!7970)

(assert (=> b!777721 (= res!526124 (= (seekEntryOrOpen!0 (select (arr!20370 a!3186) j!159) a!3186 mask!3328) lt!346496))))

(assert (=> b!777721 (= lt!346496 (Found!7970 j!159))))

(declare-fun b!777722 () Bool)

(declare-fun res!526130 () Bool)

(assert (=> b!777722 (=> (not res!526130) (not e!432731))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777722 (= res!526130 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20370 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!346494 () SeekEntryResult!7970)

(declare-fun b!777723 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42552 (_ BitVec 32)) SeekEntryResult!7970)

(assert (=> b!777723 (= e!432736 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20370 a!3186) j!159) a!3186 mask!3328) lt!346494))))

(declare-fun b!777724 () Bool)

(declare-fun res!526137 () Bool)

(assert (=> b!777724 (=> (not res!526137) (not e!432729))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777724 (= res!526137 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777725 () Bool)

(declare-fun res!526128 () Bool)

(assert (=> b!777725 (=> res!526128 e!432737)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42552 (_ BitVec 32)) SeekEntryResult!7970)

(assert (=> b!777725 (= res!526128 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20370 a!3186) j!159) a!3186 mask!3328) (Found!7970 j!159))))))

(declare-fun b!777726 () Bool)

(declare-fun e!432730 () Bool)

(assert (=> b!777726 (= e!432730 e!432731)))

(declare-fun res!526125 () Bool)

(assert (=> b!777726 (=> (not res!526125) (not e!432731))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777726 (= res!526125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20370 a!3186) j!159) mask!3328) (select (arr!20370 a!3186) j!159) a!3186 mask!3328) lt!346494))))

(assert (=> b!777726 (= lt!346494 (Intermediate!7970 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777727 () Bool)

(assert (=> b!777727 (= e!432729 e!432730)))

(declare-fun res!526134 () Bool)

(assert (=> b!777727 (=> (not res!526134) (not e!432730))))

(declare-fun lt!346491 () SeekEntryResult!7970)

(assert (=> b!777727 (= res!526134 (or (= lt!346491 (MissingZero!7970 i!1173)) (= lt!346491 (MissingVacant!7970 i!1173))))))

(assert (=> b!777727 (= lt!346491 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!777728 () Bool)

(assert (=> b!777728 (= e!432732 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20370 a!3186) j!159) a!3186 mask!3328) lt!346496))))

(declare-fun b!777729 () Bool)

(declare-fun res!526123 () Bool)

(assert (=> b!777729 (=> (not res!526123) (not e!432729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777729 (= res!526123 (validKeyInArray!0 k!2102))))

(declare-fun b!777730 () Bool)

(declare-fun res!526139 () Bool)

(assert (=> b!777730 (=> (not res!526139) (not e!432730))))

(declare-datatypes ((List!14372 0))(
  ( (Nil!14369) (Cons!14368 (h!15479 (_ BitVec 64)) (t!20687 List!14372)) )
))
(declare-fun arrayNoDuplicates!0 (array!42552 (_ BitVec 32) List!14372) Bool)

(assert (=> b!777730 (= res!526139 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14369))))

(declare-fun b!777731 () Bool)

(assert (=> b!777731 (= e!432736 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20370 a!3186) j!159) a!3186 mask!3328) (Found!7970 j!159)))))

(declare-fun b!777732 () Bool)

(declare-fun res!526126 () Bool)

(assert (=> b!777732 (=> (not res!526126) (not e!432730))))

(assert (=> b!777732 (= res!526126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777733 () Bool)

(assert (=> b!777733 (= e!432731 e!432735)))

(declare-fun res!526132 () Bool)

(assert (=> b!777733 (=> (not res!526132) (not e!432735))))

(declare-fun lt!346493 () SeekEntryResult!7970)

(assert (=> b!777733 (= res!526132 (= lt!346493 lt!346489))))

(declare-fun lt!346488 () (_ BitVec 64))

(declare-fun lt!346495 () array!42552)

(assert (=> b!777733 (= lt!346489 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346488 lt!346495 mask!3328))))

(assert (=> b!777733 (= lt!346493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346488 mask!3328) lt!346488 lt!346495 mask!3328))))

(assert (=> b!777733 (= lt!346488 (select (store (arr!20370 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!777733 (= lt!346495 (array!42553 (store (arr!20370 a!3186) i!1173 k!2102) (size!20791 a!3186)))))

(declare-fun b!777734 () Bool)

(declare-fun res!526138 () Bool)

(assert (=> b!777734 (=> (not res!526138) (not e!432729))))

(assert (=> b!777734 (= res!526138 (validKeyInArray!0 (select (arr!20370 a!3186) j!159)))))

(declare-fun b!777735 () Bool)

(declare-fun res!526127 () Bool)

(assert (=> b!777735 (=> res!526127 e!432737)))

(assert (=> b!777735 (= res!526127 (or (not (= (select (store (arr!20370 a!3186) i!1173 k!2102) index!1321) lt!346488)) (undefined!8782 lt!346489)))))

(declare-fun b!777736 () Bool)

(declare-fun res!526136 () Bool)

(assert (=> b!777736 (=> (not res!526136) (not e!432730))))

(assert (=> b!777736 (= res!526136 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20791 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20791 a!3186))))))

(declare-fun b!777737 () Bool)

(assert (=> b!777737 (= e!432737 true)))

(declare-fun lt!346492 () SeekEntryResult!7970)

(assert (=> b!777737 (= lt!346492 (seekEntryOrOpen!0 lt!346488 lt!346495 mask!3328))))

(declare-fun b!777738 () Bool)

(declare-fun res!526122 () Bool)

(assert (=> b!777738 (=> (not res!526122) (not e!432729))))

(assert (=> b!777738 (= res!526122 (and (= (size!20791 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20791 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20791 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67260 res!526129) b!777738))

(assert (= (and b!777738 res!526122) b!777734))

(assert (= (and b!777734 res!526138) b!777729))

(assert (= (and b!777729 res!526123) b!777724))

(assert (= (and b!777724 res!526137) b!777727))

(assert (= (and b!777727 res!526134) b!777732))

(assert (= (and b!777732 res!526126) b!777730))

(assert (= (and b!777730 res!526139) b!777736))

(assert (= (and b!777736 res!526136) b!777726))

(assert (= (and b!777726 res!526125) b!777722))

(assert (= (and b!777722 res!526130) b!777719))

(assert (= (and b!777719 c!86200) b!777723))

(assert (= (and b!777719 (not c!86200)) b!777731))

(assert (= (and b!777719 res!526133) b!777733))

(assert (= (and b!777733 res!526132) b!777720))

(assert (= (and b!777720 res!526131) b!777721))

(assert (= (and b!777721 res!526124) b!777728))

(assert (= (and b!777720 (not res!526135)) b!777725))

(assert (= (and b!777725 (not res!526128)) b!777735))

(assert (= (and b!777735 (not res!526127)) b!777737))

(declare-fun m!721541 () Bool)

(assert (=> b!777723 m!721541))

(assert (=> b!777723 m!721541))

(declare-fun m!721543 () Bool)

(assert (=> b!777723 m!721543))

(assert (=> b!777721 m!721541))

(assert (=> b!777721 m!721541))

(declare-fun m!721545 () Bool)

(assert (=> b!777721 m!721545))

(assert (=> b!777726 m!721541))

(assert (=> b!777726 m!721541))

(declare-fun m!721547 () Bool)

(assert (=> b!777726 m!721547))

(assert (=> b!777726 m!721547))

(assert (=> b!777726 m!721541))

(declare-fun m!721549 () Bool)

(assert (=> b!777726 m!721549))

(assert (=> b!777734 m!721541))

(assert (=> b!777734 m!721541))

(declare-fun m!721551 () Bool)

(assert (=> b!777734 m!721551))

(declare-fun m!721553 () Bool)

(assert (=> b!777735 m!721553))

(declare-fun m!721555 () Bool)

(assert (=> b!777735 m!721555))

(declare-fun m!721557 () Bool)

(assert (=> b!777729 m!721557))

(declare-fun m!721559 () Bool)

(assert (=> start!67260 m!721559))

(declare-fun m!721561 () Bool)

(assert (=> start!67260 m!721561))

(declare-fun m!721563 () Bool)

(assert (=> b!777732 m!721563))

(assert (=> b!777728 m!721541))

(assert (=> b!777728 m!721541))

(declare-fun m!721565 () Bool)

(assert (=> b!777728 m!721565))

(declare-fun m!721567 () Bool)

(assert (=> b!777730 m!721567))

(declare-fun m!721569 () Bool)

(assert (=> b!777722 m!721569))

(declare-fun m!721571 () Bool)

(assert (=> b!777727 m!721571))

(declare-fun m!721573 () Bool)

(assert (=> b!777724 m!721573))

(assert (=> b!777725 m!721541))

(assert (=> b!777725 m!721541))

(declare-fun m!721575 () Bool)

(assert (=> b!777725 m!721575))

(declare-fun m!721577 () Bool)

(assert (=> b!777737 m!721577))

(declare-fun m!721579 () Bool)

(assert (=> b!777733 m!721579))

(declare-fun m!721581 () Bool)

(assert (=> b!777733 m!721581))

(assert (=> b!777733 m!721553))

(declare-fun m!721583 () Bool)

(assert (=> b!777733 m!721583))

(assert (=> b!777733 m!721579))

(declare-fun m!721585 () Bool)

(assert (=> b!777733 m!721585))

(declare-fun m!721587 () Bool)

(assert (=> b!777720 m!721587))

(declare-fun m!721589 () Bool)

(assert (=> b!777720 m!721589))

(assert (=> b!777731 m!721541))

(assert (=> b!777731 m!721541))

(assert (=> b!777731 m!721575))

(push 1)

