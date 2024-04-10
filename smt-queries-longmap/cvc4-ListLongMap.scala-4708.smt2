; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65312 () Bool)

(assert start!65312)

(declare-datatypes ((array!41485 0))(
  ( (array!41486 (arr!19856 (Array (_ BitVec 32) (_ BitVec 64))) (size!20277 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41485)

(declare-fun e!414597 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!741749 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7456 0))(
  ( (MissingZero!7456 (index!32192 (_ BitVec 32))) (Found!7456 (index!32193 (_ BitVec 32))) (Intermediate!7456 (undefined!8268 Bool) (index!32194 (_ BitVec 32)) (x!63166 (_ BitVec 32))) (Undefined!7456) (MissingVacant!7456 (index!32195 (_ BitVec 32))) )
))
(declare-fun lt!329532 () SeekEntryResult!7456)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41485 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!741749 (= e!414597 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329532))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!741750 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41485 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!741750 (= e!414597 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) (Found!7456 j!159)))))

(declare-fun b!741751 () Bool)

(declare-fun res!499029 () Bool)

(declare-fun e!414595 () Bool)

(assert (=> b!741751 (=> (not res!499029) (not e!414595))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741751 (= res!499029 (and (= (size!20277 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20277 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20277 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741752 () Bool)

(declare-fun res!499022 () Bool)

(declare-fun e!414596 () Bool)

(assert (=> b!741752 (=> (not res!499022) (not e!414596))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741752 (= res!499022 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20277 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20277 a!3186))))))

(declare-fun b!741753 () Bool)

(declare-fun res!499028 () Bool)

(assert (=> b!741753 (=> (not res!499028) (not e!414596))))

(declare-datatypes ((List!13858 0))(
  ( (Nil!13855) (Cons!13854 (h!14926 (_ BitVec 64)) (t!20173 List!13858)) )
))
(declare-fun arrayNoDuplicates!0 (array!41485 (_ BitVec 32) List!13858) Bool)

(assert (=> b!741753 (= res!499028 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13855))))

(declare-fun b!741754 () Bool)

(declare-fun res!499020 () Bool)

(assert (=> b!741754 (=> (not res!499020) (not e!414595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741754 (= res!499020 (validKeyInArray!0 (select (arr!19856 a!3186) j!159)))))

(declare-fun b!741755 () Bool)

(declare-fun res!499023 () Bool)

(assert (=> b!741755 (=> (not res!499023) (not e!414595))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741755 (= res!499023 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741756 () Bool)

(declare-fun e!414599 () Bool)

(declare-fun e!414593 () Bool)

(assert (=> b!741756 (= e!414599 e!414593)))

(declare-fun res!499027 () Bool)

(assert (=> b!741756 (=> (not res!499027) (not e!414593))))

(declare-fun lt!329533 () array!41485)

(declare-fun lt!329534 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741756 (= res!499027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329534 mask!3328) lt!329534 lt!329533 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329534 lt!329533 mask!3328)))))

(assert (=> b!741756 (= lt!329534 (select (store (arr!19856 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741756 (= lt!329533 (array!41486 (store (arr!19856 a!3186) i!1173 k!2102) (size!20277 a!3186)))))

(declare-fun b!741757 () Bool)

(declare-fun res!499024 () Bool)

(assert (=> b!741757 (=> (not res!499024) (not e!414599))))

(assert (=> b!741757 (= res!499024 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19856 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!499031 () Bool)

(assert (=> start!65312 (=> (not res!499031) (not e!414595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65312 (= res!499031 (validMask!0 mask!3328))))

(assert (=> start!65312 e!414595))

(assert (=> start!65312 true))

(declare-fun array_inv!15652 (array!41485) Bool)

(assert (=> start!65312 (array_inv!15652 a!3186)))

(declare-fun b!741758 () Bool)

(declare-fun res!499025 () Bool)

(assert (=> b!741758 (=> (not res!499025) (not e!414596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41485 (_ BitVec 32)) Bool)

(assert (=> b!741758 (= res!499025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741759 () Bool)

(declare-fun e!414592 () Bool)

(declare-fun lt!329535 () SeekEntryResult!7456)

(assert (=> b!741759 (= e!414592 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329535))))

(declare-fun b!741760 () Bool)

(assert (=> b!741760 (= e!414595 e!414596)))

(declare-fun res!499032 () Bool)

(assert (=> b!741760 (=> (not res!499032) (not e!414596))))

(declare-fun lt!329537 () SeekEntryResult!7456)

(assert (=> b!741760 (= res!499032 (or (= lt!329537 (MissingZero!7456 i!1173)) (= lt!329537 (MissingVacant!7456 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41485 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!741760 (= lt!329537 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741761 () Bool)

(declare-fun res!499030 () Bool)

(assert (=> b!741761 (=> (not res!499030) (not e!414595))))

(assert (=> b!741761 (= res!499030 (validKeyInArray!0 k!2102))))

(declare-fun b!741762 () Bool)

(assert (=> b!741762 (= e!414593 (not true))))

(declare-fun e!414598 () Bool)

(assert (=> b!741762 e!414598))

(declare-fun res!499021 () Bool)

(assert (=> b!741762 (=> (not res!499021) (not e!414598))))

(assert (=> b!741762 (= res!499021 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25392 0))(
  ( (Unit!25393) )
))
(declare-fun lt!329536 () Unit!25392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25392)

(assert (=> b!741762 (= lt!329536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741763 () Bool)

(declare-fun res!499034 () Bool)

(assert (=> b!741763 (=> (not res!499034) (not e!414599))))

(assert (=> b!741763 (= res!499034 e!414597)))

(declare-fun c!81745 () Bool)

(assert (=> b!741763 (= c!81745 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741764 () Bool)

(assert (=> b!741764 (= e!414598 e!414592)))

(declare-fun res!499026 () Bool)

(assert (=> b!741764 (=> (not res!499026) (not e!414592))))

(assert (=> b!741764 (= res!499026 (= (seekEntryOrOpen!0 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329535))))

(assert (=> b!741764 (= lt!329535 (Found!7456 j!159))))

(declare-fun b!741765 () Bool)

(assert (=> b!741765 (= e!414596 e!414599)))

(declare-fun res!499033 () Bool)

(assert (=> b!741765 (=> (not res!499033) (not e!414599))))

(assert (=> b!741765 (= res!499033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19856 a!3186) j!159) mask!3328) (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329532))))

(assert (=> b!741765 (= lt!329532 (Intermediate!7456 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65312 res!499031) b!741751))

(assert (= (and b!741751 res!499029) b!741754))

(assert (= (and b!741754 res!499020) b!741761))

(assert (= (and b!741761 res!499030) b!741755))

(assert (= (and b!741755 res!499023) b!741760))

(assert (= (and b!741760 res!499032) b!741758))

(assert (= (and b!741758 res!499025) b!741753))

(assert (= (and b!741753 res!499028) b!741752))

(assert (= (and b!741752 res!499022) b!741765))

(assert (= (and b!741765 res!499033) b!741757))

(assert (= (and b!741757 res!499024) b!741763))

(assert (= (and b!741763 c!81745) b!741749))

(assert (= (and b!741763 (not c!81745)) b!741750))

(assert (= (and b!741763 res!499034) b!741756))

(assert (= (and b!741756 res!499027) b!741762))

(assert (= (and b!741762 res!499021) b!741764))

(assert (= (and b!741764 res!499026) b!741759))

(declare-fun m!692691 () Bool)

(assert (=> b!741755 m!692691))

(declare-fun m!692693 () Bool)

(assert (=> b!741754 m!692693))

(assert (=> b!741754 m!692693))

(declare-fun m!692695 () Bool)

(assert (=> b!741754 m!692695))

(declare-fun m!692697 () Bool)

(assert (=> b!741753 m!692697))

(declare-fun m!692699 () Bool)

(assert (=> b!741757 m!692699))

(declare-fun m!692701 () Bool)

(assert (=> b!741760 m!692701))

(assert (=> b!741764 m!692693))

(assert (=> b!741764 m!692693))

(declare-fun m!692703 () Bool)

(assert (=> b!741764 m!692703))

(assert (=> b!741750 m!692693))

(assert (=> b!741750 m!692693))

(declare-fun m!692705 () Bool)

(assert (=> b!741750 m!692705))

(declare-fun m!692707 () Bool)

(assert (=> b!741761 m!692707))

(declare-fun m!692709 () Bool)

(assert (=> b!741756 m!692709))

(declare-fun m!692711 () Bool)

(assert (=> b!741756 m!692711))

(declare-fun m!692713 () Bool)

(assert (=> b!741756 m!692713))

(declare-fun m!692715 () Bool)

(assert (=> b!741756 m!692715))

(assert (=> b!741756 m!692709))

(declare-fun m!692717 () Bool)

(assert (=> b!741756 m!692717))

(declare-fun m!692719 () Bool)

(assert (=> start!65312 m!692719))

(declare-fun m!692721 () Bool)

(assert (=> start!65312 m!692721))

(declare-fun m!692723 () Bool)

(assert (=> b!741758 m!692723))

(assert (=> b!741749 m!692693))

(assert (=> b!741749 m!692693))

(declare-fun m!692725 () Bool)

(assert (=> b!741749 m!692725))

(assert (=> b!741765 m!692693))

(assert (=> b!741765 m!692693))

(declare-fun m!692727 () Bool)

(assert (=> b!741765 m!692727))

(assert (=> b!741765 m!692727))

(assert (=> b!741765 m!692693))

(declare-fun m!692729 () Bool)

(assert (=> b!741765 m!692729))

(assert (=> b!741759 m!692693))

(assert (=> b!741759 m!692693))

(declare-fun m!692731 () Bool)

(assert (=> b!741759 m!692731))

(declare-fun m!692733 () Bool)

(assert (=> b!741762 m!692733))

(declare-fun m!692735 () Bool)

(assert (=> b!741762 m!692735))

(push 1)

