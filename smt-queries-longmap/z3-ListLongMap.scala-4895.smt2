; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67550 () Bool)

(assert start!67550)

(declare-fun b!781636 () Bool)

(declare-fun res!528791 () Bool)

(declare-fun e!434731 () Bool)

(assert (=> b!781636 (=> (not res!528791) (not e!434731))))

(declare-datatypes ((array!42653 0))(
  ( (array!42654 (arr!20416 (Array (_ BitVec 32) (_ BitVec 64))) (size!20837 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42653)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42653 (_ BitVec 32)) Bool)

(assert (=> b!781636 (= res!528791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781637 () Bool)

(declare-fun res!528803 () Bool)

(assert (=> b!781637 (=> (not res!528803) (not e!434731))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781637 (= res!528803 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20837 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20837 a!3186))))))

(declare-fun b!781638 () Bool)

(declare-datatypes ((Unit!26952 0))(
  ( (Unit!26953) )
))
(declare-fun e!434733 () Unit!26952)

(declare-fun Unit!26954 () Unit!26952)

(assert (=> b!781638 (= e!434733 Unit!26954)))

(assert (=> b!781638 false))

(declare-fun b!781639 () Bool)

(declare-fun e!434728 () Bool)

(declare-fun e!434732 () Bool)

(assert (=> b!781639 (= e!434728 (not e!434732))))

(declare-fun res!528794 () Bool)

(assert (=> b!781639 (=> res!528794 e!434732)))

(declare-datatypes ((SeekEntryResult!8016 0))(
  ( (MissingZero!8016 (index!34432 (_ BitVec 32))) (Found!8016 (index!34433 (_ BitVec 32))) (Intermediate!8016 (undefined!8828 Bool) (index!34434 (_ BitVec 32)) (x!65387 (_ BitVec 32))) (Undefined!8016) (MissingVacant!8016 (index!34435 (_ BitVec 32))) )
))
(declare-fun lt!348324 () SeekEntryResult!8016)

(get-info :version)

(assert (=> b!781639 (= res!528794 (or (not ((_ is Intermediate!8016) lt!348324)) (bvslt x!1131 (x!65387 lt!348324)) (not (= x!1131 (x!65387 lt!348324))) (not (= index!1321 (index!34434 lt!348324)))))))

(declare-fun e!434735 () Bool)

(assert (=> b!781639 e!434735))

(declare-fun res!528796 () Bool)

(assert (=> b!781639 (=> (not res!528796) (not e!434735))))

(declare-fun lt!348326 () SeekEntryResult!8016)

(declare-fun lt!348321 () SeekEntryResult!8016)

(assert (=> b!781639 (= res!528796 (= lt!348326 lt!348321))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!781639 (= lt!348321 (Found!8016 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42653 (_ BitVec 32)) SeekEntryResult!8016)

(assert (=> b!781639 (= lt!348326 (seekEntryOrOpen!0 (select (arr!20416 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781639 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348320 () Unit!26952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26952)

(assert (=> b!781639 (= lt!348320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781640 () Bool)

(declare-fun res!528797 () Bool)

(declare-fun e!434730 () Bool)

(assert (=> b!781640 (=> (not res!528797) (not e!434730))))

(declare-fun e!434729 () Bool)

(assert (=> b!781640 (= res!528797 e!434729)))

(declare-fun c!86830 () Bool)

(assert (=> b!781640 (= c!86830 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!348325 () SeekEntryResult!8016)

(declare-fun b!781641 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42653 (_ BitVec 32)) SeekEntryResult!8016)

(assert (=> b!781641 (= e!434729 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348325))))

(declare-fun res!528806 () Bool)

(declare-fun e!434727 () Bool)

(assert (=> start!67550 (=> (not res!528806) (not e!434727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67550 (= res!528806 (validMask!0 mask!3328))))

(assert (=> start!67550 e!434727))

(assert (=> start!67550 true))

(declare-fun array_inv!16212 (array!42653) Bool)

(assert (=> start!67550 (array_inv!16212 a!3186)))

(declare-fun b!781642 () Bool)

(declare-fun res!528792 () Bool)

(assert (=> b!781642 (=> (not res!528792) (not e!434727))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781642 (= res!528792 (validKeyInArray!0 k0!2102))))

(declare-fun b!781643 () Bool)

(declare-fun res!528795 () Bool)

(assert (=> b!781643 (=> res!528795 e!434732)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42653 (_ BitVec 32)) SeekEntryResult!8016)

(assert (=> b!781643 (= res!528795 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348321)))))

(declare-fun b!781644 () Bool)

(declare-fun res!528790 () Bool)

(assert (=> b!781644 (=> (not res!528790) (not e!434731))))

(declare-datatypes ((List!14418 0))(
  ( (Nil!14415) (Cons!14414 (h!15534 (_ BitVec 64)) (t!20733 List!14418)) )
))
(declare-fun arrayNoDuplicates!0 (array!42653 (_ BitVec 32) List!14418) Bool)

(assert (=> b!781644 (= res!528790 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14415))))

(declare-fun b!781645 () Bool)

(declare-fun res!528802 () Bool)

(assert (=> b!781645 (=> (not res!528802) (not e!434727))))

(declare-fun arrayContainsKey!0 (array!42653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781645 (= res!528802 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781646 () Bool)

(declare-fun Unit!26955 () Unit!26952)

(assert (=> b!781646 (= e!434733 Unit!26955)))

(declare-fun b!781647 () Bool)

(declare-fun res!528798 () Bool)

(assert (=> b!781647 (=> (not res!528798) (not e!434727))))

(assert (=> b!781647 (= res!528798 (validKeyInArray!0 (select (arr!20416 a!3186) j!159)))))

(declare-fun b!781648 () Bool)

(assert (=> b!781648 (= e!434729 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) (Found!8016 j!159)))))

(declare-fun b!781649 () Bool)

(assert (=> b!781649 (= e!434731 e!434730)))

(declare-fun res!528805 () Bool)

(assert (=> b!781649 (=> (not res!528805) (not e!434730))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781649 (= res!528805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20416 a!3186) j!159) mask!3328) (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348325))))

(assert (=> b!781649 (= lt!348325 (Intermediate!8016 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781650 () Bool)

(assert (=> b!781650 (= e!434735 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20416 a!3186) j!159) a!3186 mask!3328) lt!348321))))

(declare-fun b!781651 () Bool)

(assert (=> b!781651 (= e!434732 true)))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781651 (= (select (store (arr!20416 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348323 () Unit!26952)

(assert (=> b!781651 (= lt!348323 e!434733)))

(declare-fun c!86829 () Bool)

(assert (=> b!781651 (= c!86829 (= (select (store (arr!20416 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781652 () Bool)

(assert (=> b!781652 (= e!434730 e!434728)))

(declare-fun res!528804 () Bool)

(assert (=> b!781652 (=> (not res!528804) (not e!434728))))

(declare-fun lt!348329 () SeekEntryResult!8016)

(assert (=> b!781652 (= res!528804 (= lt!348329 lt!348324))))

(declare-fun lt!348328 () array!42653)

(declare-fun lt!348327 () (_ BitVec 64))

(assert (=> b!781652 (= lt!348324 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348327 lt!348328 mask!3328))))

(assert (=> b!781652 (= lt!348329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348327 mask!3328) lt!348327 lt!348328 mask!3328))))

(assert (=> b!781652 (= lt!348327 (select (store (arr!20416 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781652 (= lt!348328 (array!42654 (store (arr!20416 a!3186) i!1173 k0!2102) (size!20837 a!3186)))))

(declare-fun b!781653 () Bool)

(declare-fun res!528799 () Bool)

(assert (=> b!781653 (=> res!528799 e!434732)))

(assert (=> b!781653 (= res!528799 (= (select (store (arr!20416 a!3186) i!1173 k0!2102) index!1321) lt!348327))))

(declare-fun b!781654 () Bool)

(assert (=> b!781654 (= e!434727 e!434731)))

(declare-fun res!528800 () Bool)

(assert (=> b!781654 (=> (not res!528800) (not e!434731))))

(declare-fun lt!348322 () SeekEntryResult!8016)

(assert (=> b!781654 (= res!528800 (or (= lt!348322 (MissingZero!8016 i!1173)) (= lt!348322 (MissingVacant!8016 i!1173))))))

(assert (=> b!781654 (= lt!348322 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781655 () Bool)

(declare-fun res!528801 () Bool)

(assert (=> b!781655 (=> (not res!528801) (not e!434727))))

(assert (=> b!781655 (= res!528801 (and (= (size!20837 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20837 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20837 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781656 () Bool)

(declare-fun res!528793 () Bool)

(assert (=> b!781656 (=> (not res!528793) (not e!434730))))

(assert (=> b!781656 (= res!528793 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20416 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67550 res!528806) b!781655))

(assert (= (and b!781655 res!528801) b!781647))

(assert (= (and b!781647 res!528798) b!781642))

(assert (= (and b!781642 res!528792) b!781645))

(assert (= (and b!781645 res!528802) b!781654))

(assert (= (and b!781654 res!528800) b!781636))

(assert (= (and b!781636 res!528791) b!781644))

(assert (= (and b!781644 res!528790) b!781637))

(assert (= (and b!781637 res!528803) b!781649))

(assert (= (and b!781649 res!528805) b!781656))

(assert (= (and b!781656 res!528793) b!781640))

(assert (= (and b!781640 c!86830) b!781641))

(assert (= (and b!781640 (not c!86830)) b!781648))

(assert (= (and b!781640 res!528797) b!781652))

(assert (= (and b!781652 res!528804) b!781639))

(assert (= (and b!781639 res!528796) b!781650))

(assert (= (and b!781639 (not res!528794)) b!781643))

(assert (= (and b!781643 (not res!528795)) b!781653))

(assert (= (and b!781653 (not res!528799)) b!781651))

(assert (= (and b!781651 c!86829) b!781638))

(assert (= (and b!781651 (not c!86829)) b!781646))

(declare-fun m!724619 () Bool)

(assert (=> b!781641 m!724619))

(assert (=> b!781641 m!724619))

(declare-fun m!724621 () Bool)

(assert (=> b!781641 m!724621))

(declare-fun m!724623 () Bool)

(assert (=> b!781644 m!724623))

(declare-fun m!724625 () Bool)

(assert (=> b!781653 m!724625))

(declare-fun m!724627 () Bool)

(assert (=> b!781653 m!724627))

(assert (=> b!781649 m!724619))

(assert (=> b!781649 m!724619))

(declare-fun m!724629 () Bool)

(assert (=> b!781649 m!724629))

(assert (=> b!781649 m!724629))

(assert (=> b!781649 m!724619))

(declare-fun m!724631 () Bool)

(assert (=> b!781649 m!724631))

(declare-fun m!724633 () Bool)

(assert (=> b!781656 m!724633))

(assert (=> b!781651 m!724625))

(assert (=> b!781651 m!724627))

(declare-fun m!724635 () Bool)

(assert (=> b!781636 m!724635))

(declare-fun m!724637 () Bool)

(assert (=> b!781645 m!724637))

(declare-fun m!724639 () Bool)

(assert (=> b!781654 m!724639))

(assert (=> b!781650 m!724619))

(assert (=> b!781650 m!724619))

(declare-fun m!724641 () Bool)

(assert (=> b!781650 m!724641))

(declare-fun m!724643 () Bool)

(assert (=> b!781652 m!724643))

(assert (=> b!781652 m!724643))

(declare-fun m!724645 () Bool)

(assert (=> b!781652 m!724645))

(declare-fun m!724647 () Bool)

(assert (=> b!781652 m!724647))

(assert (=> b!781652 m!724625))

(declare-fun m!724649 () Bool)

(assert (=> b!781652 m!724649))

(assert (=> b!781647 m!724619))

(assert (=> b!781647 m!724619))

(declare-fun m!724651 () Bool)

(assert (=> b!781647 m!724651))

(assert (=> b!781643 m!724619))

(assert (=> b!781643 m!724619))

(declare-fun m!724653 () Bool)

(assert (=> b!781643 m!724653))

(declare-fun m!724655 () Bool)

(assert (=> start!67550 m!724655))

(declare-fun m!724657 () Bool)

(assert (=> start!67550 m!724657))

(assert (=> b!781639 m!724619))

(assert (=> b!781639 m!724619))

(declare-fun m!724659 () Bool)

(assert (=> b!781639 m!724659))

(declare-fun m!724661 () Bool)

(assert (=> b!781639 m!724661))

(declare-fun m!724663 () Bool)

(assert (=> b!781639 m!724663))

(declare-fun m!724665 () Bool)

(assert (=> b!781642 m!724665))

(assert (=> b!781648 m!724619))

(assert (=> b!781648 m!724619))

(assert (=> b!781648 m!724653))

(check-sat (not b!781642) (not b!781641) (not b!781639) (not b!781636) (not b!781652) (not b!781650) (not b!781647) (not b!781643) (not b!781645) (not b!781648) (not b!781654) (not start!67550) (not b!781644) (not b!781649))
(check-sat)
