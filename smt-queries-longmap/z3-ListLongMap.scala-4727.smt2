; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65402 () Bool)

(assert start!65402)

(declare-fun b!744587 () Bool)

(declare-fun res!501671 () Bool)

(declare-fun e!415895 () Bool)

(assert (=> b!744587 (=> (not res!501671) (not e!415895))))

(declare-datatypes ((array!41592 0))(
  ( (array!41593 (arr!19910 (Array (_ BitVec 32) (_ BitVec 64))) (size!20331 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41592)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41592 (_ BitVec 32)) Bool)

(assert (=> b!744587 (= res!501671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!744588 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!415898 () Bool)

(declare-datatypes ((SeekEntryResult!7507 0))(
  ( (MissingZero!7507 (index!32396 (_ BitVec 32))) (Found!7507 (index!32397 (_ BitVec 32))) (Intermediate!7507 (undefined!8319 Bool) (index!32398 (_ BitVec 32)) (x!63364 (_ BitVec 32))) (Undefined!7507) (MissingVacant!7507 (index!32399 (_ BitVec 32))) )
))
(declare-fun lt!330662 () SeekEntryResult!7507)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41592 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!744588 (= e!415898 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330662))))

(declare-fun e!415896 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!744589 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744589 (= e!415896 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) (Found!7507 j!159)))))

(declare-fun res!501678 () Bool)

(declare-fun e!415901 () Bool)

(assert (=> start!65402 (=> (not res!501678) (not e!415901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65402 (= res!501678 (validMask!0 mask!3328))))

(assert (=> start!65402 e!415901))

(assert (=> start!65402 true))

(declare-fun array_inv!15793 (array!41592) Bool)

(assert (=> start!65402 (array_inv!15793 a!3186)))

(declare-fun b!744590 () Bool)

(declare-fun res!501675 () Bool)

(assert (=> b!744590 (=> (not res!501675) (not e!415901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744590 (= res!501675 (validKeyInArray!0 (select (arr!19910 a!3186) j!159)))))

(declare-fun b!744591 () Bool)

(declare-fun res!501674 () Bool)

(assert (=> b!744591 (=> (not res!501674) (not e!415901))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744591 (= res!501674 (validKeyInArray!0 k0!2102))))

(declare-fun b!744592 () Bool)

(declare-fun e!415897 () Bool)

(declare-fun e!415902 () Bool)

(assert (=> b!744592 (= e!415897 e!415902)))

(declare-fun res!501676 () Bool)

(assert (=> b!744592 (=> (not res!501676) (not e!415902))))

(declare-fun lt!330658 () SeekEntryResult!7507)

(declare-fun lt!330656 () SeekEntryResult!7507)

(assert (=> b!744592 (= res!501676 (= lt!330658 lt!330656))))

(declare-fun lt!330660 () array!41592)

(declare-fun lt!330655 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41592 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!744592 (= lt!330656 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330655 lt!330660 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744592 (= lt!330658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330655 mask!3328) lt!330655 lt!330660 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744592 (= lt!330655 (select (store (arr!19910 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744592 (= lt!330660 (array!41593 (store (arr!19910 a!3186) i!1173 k0!2102) (size!20331 a!3186)))))

(declare-fun b!744593 () Bool)

(declare-fun e!415899 () Bool)

(assert (=> b!744593 (= e!415899 e!415898)))

(declare-fun res!501683 () Bool)

(assert (=> b!744593 (=> (not res!501683) (not e!415898))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41592 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!744593 (= res!501683 (= (seekEntryOrOpen!0 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330662))))

(assert (=> b!744593 (= lt!330662 (Found!7507 j!159))))

(declare-fun b!744594 () Bool)

(declare-fun res!501670 () Bool)

(assert (=> b!744594 (=> (not res!501670) (not e!415901))))

(declare-fun arrayContainsKey!0 (array!41592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744594 (= res!501670 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744595 () Bool)

(declare-fun res!501668 () Bool)

(assert (=> b!744595 (=> (not res!501668) (not e!415901))))

(assert (=> b!744595 (= res!501668 (and (= (size!20331 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20331 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20331 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744596 () Bool)

(declare-fun res!501681 () Bool)

(assert (=> b!744596 (=> (not res!501681) (not e!415897))))

(assert (=> b!744596 (= res!501681 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19910 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744597 () Bool)

(declare-fun e!415900 () Bool)

(assert (=> b!744597 (= e!415902 (not e!415900))))

(declare-fun res!501682 () Bool)

(assert (=> b!744597 (=> res!501682 e!415900)))

(get-info :version)

(assert (=> b!744597 (= res!501682 (or (not ((_ is Intermediate!7507) lt!330656)) (bvslt x!1131 (x!63364 lt!330656)) (not (= x!1131 (x!63364 lt!330656))) (not (= index!1321 (index!32398 lt!330656)))))))

(assert (=> b!744597 e!415899))

(declare-fun res!501672 () Bool)

(assert (=> b!744597 (=> (not res!501672) (not e!415899))))

(assert (=> b!744597 (= res!501672 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25466 0))(
  ( (Unit!25467) )
))
(declare-fun lt!330659 () Unit!25466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25466)

(assert (=> b!744597 (= lt!330659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744598 () Bool)

(declare-fun res!501669 () Bool)

(assert (=> b!744598 (=> (not res!501669) (not e!415895))))

(declare-datatypes ((List!13951 0))(
  ( (Nil!13948) (Cons!13947 (h!15019 (_ BitVec 64)) (t!20257 List!13951)) )
))
(declare-fun arrayNoDuplicates!0 (array!41592 (_ BitVec 32) List!13951) Bool)

(assert (=> b!744598 (= res!501669 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13948))))

(declare-fun lt!330657 () SeekEntryResult!7507)

(declare-fun b!744599 () Bool)

(assert (=> b!744599 (= e!415896 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330657))))

(declare-fun b!744600 () Bool)

(declare-fun res!501684 () Bool)

(assert (=> b!744600 (=> res!501684 e!415900)))

(assert (=> b!744600 (= res!501684 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19910 a!3186) j!159) a!3186 mask!3328) (Found!7507 j!159))))))

(declare-fun b!744601 () Bool)

(declare-fun res!501677 () Bool)

(assert (=> b!744601 (=> (not res!501677) (not e!415895))))

(assert (=> b!744601 (= res!501677 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20331 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20331 a!3186))))))

(declare-fun b!744602 () Bool)

(assert (=> b!744602 (= e!415901 e!415895)))

(declare-fun res!501680 () Bool)

(assert (=> b!744602 (=> (not res!501680) (not e!415895))))

(declare-fun lt!330661 () SeekEntryResult!7507)

(assert (=> b!744602 (= res!501680 (or (= lt!330661 (MissingZero!7507 i!1173)) (= lt!330661 (MissingVacant!7507 i!1173))))))

(assert (=> b!744602 (= lt!330661 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744603 () Bool)

(assert (=> b!744603 (= e!415900 (or (= (select (store (arr!19910 a!3186) i!1173 k0!2102) index!1321) lt!330655) (not (= (select (store (arr!19910 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!744604 () Bool)

(declare-fun res!501679 () Bool)

(assert (=> b!744604 (=> (not res!501679) (not e!415897))))

(assert (=> b!744604 (= res!501679 e!415896)))

(declare-fun c!81840 () Bool)

(assert (=> b!744604 (= c!81840 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744605 () Bool)

(assert (=> b!744605 (= e!415895 e!415897)))

(declare-fun res!501673 () Bool)

(assert (=> b!744605 (=> (not res!501673) (not e!415897))))

(assert (=> b!744605 (= res!501673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19910 a!3186) j!159) mask!3328) (select (arr!19910 a!3186) j!159) a!3186 mask!3328) lt!330657))))

(assert (=> b!744605 (= lt!330657 (Intermediate!7507 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65402 res!501678) b!744595))

(assert (= (and b!744595 res!501668) b!744590))

(assert (= (and b!744590 res!501675) b!744591))

(assert (= (and b!744591 res!501674) b!744594))

(assert (= (and b!744594 res!501670) b!744602))

(assert (= (and b!744602 res!501680) b!744587))

(assert (= (and b!744587 res!501671) b!744598))

(assert (= (and b!744598 res!501669) b!744601))

(assert (= (and b!744601 res!501677) b!744605))

(assert (= (and b!744605 res!501673) b!744596))

(assert (= (and b!744596 res!501681) b!744604))

(assert (= (and b!744604 c!81840) b!744599))

(assert (= (and b!744604 (not c!81840)) b!744589))

(assert (= (and b!744604 res!501679) b!744592))

(assert (= (and b!744592 res!501676) b!744597))

(assert (= (and b!744597 res!501672) b!744593))

(assert (= (and b!744593 res!501683) b!744588))

(assert (= (and b!744597 (not res!501682)) b!744600))

(assert (= (and b!744600 (not res!501684)) b!744603))

(declare-fun m!694547 () Bool)

(assert (=> start!65402 m!694547))

(declare-fun m!694549 () Bool)

(assert (=> start!65402 m!694549))

(declare-fun m!694551 () Bool)

(assert (=> b!744594 m!694551))

(declare-fun m!694553 () Bool)

(assert (=> b!744603 m!694553))

(declare-fun m!694555 () Bool)

(assert (=> b!744603 m!694555))

(declare-fun m!694557 () Bool)

(assert (=> b!744590 m!694557))

(assert (=> b!744590 m!694557))

(declare-fun m!694559 () Bool)

(assert (=> b!744590 m!694559))

(declare-fun m!694561 () Bool)

(assert (=> b!744598 m!694561))

(assert (=> b!744588 m!694557))

(assert (=> b!744588 m!694557))

(declare-fun m!694563 () Bool)

(assert (=> b!744588 m!694563))

(declare-fun m!694565 () Bool)

(assert (=> b!744597 m!694565))

(declare-fun m!694567 () Bool)

(assert (=> b!744597 m!694567))

(assert (=> b!744599 m!694557))

(assert (=> b!744599 m!694557))

(declare-fun m!694569 () Bool)

(assert (=> b!744599 m!694569))

(declare-fun m!694571 () Bool)

(assert (=> b!744591 m!694571))

(assert (=> b!744589 m!694557))

(assert (=> b!744589 m!694557))

(declare-fun m!694573 () Bool)

(assert (=> b!744589 m!694573))

(assert (=> b!744600 m!694557))

(assert (=> b!744600 m!694557))

(assert (=> b!744600 m!694573))

(declare-fun m!694575 () Bool)

(assert (=> b!744596 m!694575))

(declare-fun m!694577 () Bool)

(assert (=> b!744587 m!694577))

(declare-fun m!694579 () Bool)

(assert (=> b!744592 m!694579))

(assert (=> b!744592 m!694553))

(declare-fun m!694581 () Bool)

(assert (=> b!744592 m!694581))

(declare-fun m!694583 () Bool)

(assert (=> b!744592 m!694583))

(assert (=> b!744592 m!694583))

(declare-fun m!694585 () Bool)

(assert (=> b!744592 m!694585))

(assert (=> b!744593 m!694557))

(assert (=> b!744593 m!694557))

(declare-fun m!694587 () Bool)

(assert (=> b!744593 m!694587))

(declare-fun m!694589 () Bool)

(assert (=> b!744602 m!694589))

(assert (=> b!744605 m!694557))

(assert (=> b!744605 m!694557))

(declare-fun m!694591 () Bool)

(assert (=> b!744605 m!694591))

(assert (=> b!744605 m!694591))

(assert (=> b!744605 m!694557))

(declare-fun m!694593 () Bool)

(assert (=> b!744605 m!694593))

(check-sat (not b!744587) (not b!744589) (not b!744593) (not b!744599) (not b!744591) (not b!744605) (not b!744597) (not b!744600) (not b!744590) (not b!744602) (not start!65402) (not b!744594) (not b!744598) (not b!744592) (not b!744588))
(check-sat)
