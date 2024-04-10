; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67890 () Bool)

(assert start!67890)

(declare-fun b!789591 () Bool)

(declare-fun e!438862 () Bool)

(assert (=> b!789591 (= e!438862 true)))

(declare-datatypes ((SeekEntryResult!8120 0))(
  ( (MissingZero!8120 (index!34848 (_ BitVec 32))) (Found!8120 (index!34849 (_ BitVec 32))) (Intermediate!8120 (undefined!8932 Bool) (index!34850 (_ BitVec 32)) (x!65789 (_ BitVec 32))) (Undefined!8120) (MissingVacant!8120 (index!34851 (_ BitVec 32))) )
))
(declare-fun lt!352337 () SeekEntryResult!8120)

(declare-fun lt!352336 () SeekEntryResult!8120)

(assert (=> b!789591 (= lt!352337 lt!352336)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42867 0))(
  ( (array!42868 (arr!20520 (Array (_ BitVec 32) (_ BitVec 64))) (size!20941 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42867)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-datatypes ((Unit!27368 0))(
  ( (Unit!27369) )
))
(declare-fun lt!352331 () Unit!27368)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27368)

(assert (=> b!789591 (= lt!352331 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789592 () Bool)

(declare-fun res!534852 () Bool)

(declare-fun e!438858 () Bool)

(assert (=> b!789592 (=> (not res!534852) (not e!438858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42867 (_ BitVec 32)) Bool)

(assert (=> b!789592 (= res!534852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789593 () Bool)

(declare-fun e!438865 () Bool)

(assert (=> b!789593 (= e!438865 e!438858)))

(declare-fun res!534856 () Bool)

(assert (=> b!789593 (=> (not res!534856) (not e!438858))))

(declare-fun lt!352330 () SeekEntryResult!8120)

(assert (=> b!789593 (= res!534856 (or (= lt!352330 (MissingZero!8120 i!1173)) (= lt!352330 (MissingVacant!8120 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42867 (_ BitVec 32)) SeekEntryResult!8120)

(assert (=> b!789593 (= lt!352330 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!534860 () Bool)

(assert (=> start!67890 (=> (not res!534860) (not e!438865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67890 (= res!534860 (validMask!0 mask!3328))))

(assert (=> start!67890 e!438865))

(assert (=> start!67890 true))

(declare-fun array_inv!16316 (array!42867) Bool)

(assert (=> start!67890 (array_inv!16316 a!3186)))

(declare-fun b!789594 () Bool)

(declare-fun e!438857 () Bool)

(assert (=> b!789594 (= e!438857 e!438862)))

(declare-fun res!534858 () Bool)

(assert (=> b!789594 (=> res!534858 e!438862)))

(assert (=> b!789594 (= res!534858 (or (not (= (select (arr!20520 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352334 () SeekEntryResult!8120)

(declare-fun lt!352326 () SeekEntryResult!8120)

(assert (=> b!789594 (and (= lt!352326 lt!352337) (= lt!352334 lt!352336))))

(declare-fun lt!352328 () array!42867)

(declare-fun lt!352335 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42867 (_ BitVec 32)) SeekEntryResult!8120)

(assert (=> b!789594 (= lt!352337 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352335 lt!352328 mask!3328))))

(assert (=> b!789594 (= lt!352326 (seekEntryOrOpen!0 lt!352335 lt!352328 mask!3328))))

(declare-fun lt!352323 () (_ BitVec 64))

(assert (=> b!789594 (= lt!352323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352325 () Unit!27368)

(declare-fun e!438859 () Unit!27368)

(assert (=> b!789594 (= lt!352325 e!438859)))

(declare-fun c!87783 () Bool)

(assert (=> b!789594 (= c!87783 (= lt!352323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789595 () Bool)

(declare-fun res!534851 () Bool)

(assert (=> b!789595 (=> (not res!534851) (not e!438858))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789595 (= res!534851 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20941 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20941 a!3186))))))

(declare-fun b!789596 () Bool)

(declare-fun res!534848 () Bool)

(assert (=> b!789596 (=> (not res!534848) (not e!438865))))

(declare-fun arrayContainsKey!0 (array!42867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789596 (= res!534848 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789597 () Bool)

(declare-fun res!534845 () Bool)

(assert (=> b!789597 (=> (not res!534845) (not e!438865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789597 (= res!534845 (validKeyInArray!0 k!2102))))

(declare-fun b!789598 () Bool)

(declare-fun Unit!27370 () Unit!27368)

(assert (=> b!789598 (= e!438859 Unit!27370)))

(declare-fun b!789599 () Bool)

(declare-fun e!438861 () Bool)

(declare-fun e!438866 () Bool)

(assert (=> b!789599 (= e!438861 e!438866)))

(declare-fun res!534843 () Bool)

(assert (=> b!789599 (=> (not res!534843) (not e!438866))))

(declare-fun lt!352332 () SeekEntryResult!8120)

(declare-fun lt!352324 () SeekEntryResult!8120)

(assert (=> b!789599 (= res!534843 (= lt!352332 lt!352324))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42867 (_ BitVec 32)) SeekEntryResult!8120)

(assert (=> b!789599 (= lt!352324 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352335 lt!352328 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789599 (= lt!352332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352335 mask!3328) lt!352335 lt!352328 mask!3328))))

(assert (=> b!789599 (= lt!352335 (select (store (arr!20520 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789599 (= lt!352328 (array!42868 (store (arr!20520 a!3186) i!1173 k!2102) (size!20941 a!3186)))))

(declare-fun b!789600 () Bool)

(declare-fun e!438864 () Bool)

(declare-fun e!438855 () Bool)

(assert (=> b!789600 (= e!438864 e!438855)))

(declare-fun res!534857 () Bool)

(assert (=> b!789600 (=> res!534857 e!438855)))

(declare-fun lt!352333 () SeekEntryResult!8120)

(assert (=> b!789600 (= res!534857 (not (= lt!352336 lt!352333)))))

(assert (=> b!789600 (= lt!352336 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20520 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789601 () Bool)

(assert (=> b!789601 (= e!438855 e!438857)))

(declare-fun res!534844 () Bool)

(assert (=> b!789601 (=> res!534844 e!438857)))

(assert (=> b!789601 (= res!534844 (= lt!352323 lt!352335))))

(assert (=> b!789601 (= lt!352323 (select (store (arr!20520 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789602 () Bool)

(assert (=> b!789602 (= e!438858 e!438861)))

(declare-fun res!534855 () Bool)

(assert (=> b!789602 (=> (not res!534855) (not e!438861))))

(declare-fun lt!352327 () SeekEntryResult!8120)

(assert (=> b!789602 (= res!534855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20520 a!3186) j!159) mask!3328) (select (arr!20520 a!3186) j!159) a!3186 mask!3328) lt!352327))))

(assert (=> b!789602 (= lt!352327 (Intermediate!8120 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789603 () Bool)

(declare-fun Unit!27371 () Unit!27368)

(assert (=> b!789603 (= e!438859 Unit!27371)))

(assert (=> b!789603 false))

(declare-fun b!789604 () Bool)

(declare-fun res!534854 () Bool)

(assert (=> b!789604 (=> (not res!534854) (not e!438865))))

(assert (=> b!789604 (= res!534854 (and (= (size!20941 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20941 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20941 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789605 () Bool)

(declare-fun res!534847 () Bool)

(assert (=> b!789605 (=> (not res!534847) (not e!438865))))

(assert (=> b!789605 (= res!534847 (validKeyInArray!0 (select (arr!20520 a!3186) j!159)))))

(declare-fun b!789606 () Bool)

(declare-fun e!438856 () Bool)

(assert (=> b!789606 (= e!438856 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20520 a!3186) j!159) a!3186 mask!3328) (Found!8120 j!159)))))

(declare-fun b!789607 () Bool)

(assert (=> b!789607 (= e!438866 (not e!438864))))

(declare-fun res!534849 () Bool)

(assert (=> b!789607 (=> res!534849 e!438864)))

(assert (=> b!789607 (= res!534849 (or (not (is-Intermediate!8120 lt!352324)) (bvslt x!1131 (x!65789 lt!352324)) (not (= x!1131 (x!65789 lt!352324))) (not (= index!1321 (index!34850 lt!352324)))))))

(declare-fun e!438860 () Bool)

(assert (=> b!789607 e!438860))

(declare-fun res!534853 () Bool)

(assert (=> b!789607 (=> (not res!534853) (not e!438860))))

(assert (=> b!789607 (= res!534853 (= lt!352334 lt!352333))))

(assert (=> b!789607 (= lt!352333 (Found!8120 j!159))))

(assert (=> b!789607 (= lt!352334 (seekEntryOrOpen!0 (select (arr!20520 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789607 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352329 () Unit!27368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27368)

(assert (=> b!789607 (= lt!352329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789608 () Bool)

(declare-fun res!534850 () Bool)

(assert (=> b!789608 (=> (not res!534850) (not e!438861))))

(assert (=> b!789608 (= res!534850 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20520 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789609 () Bool)

(assert (=> b!789609 (= e!438856 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20520 a!3186) j!159) a!3186 mask!3328) lt!352327))))

(declare-fun b!789610 () Bool)

(declare-fun res!534846 () Bool)

(assert (=> b!789610 (=> (not res!534846) (not e!438861))))

(assert (=> b!789610 (= res!534846 e!438856)))

(declare-fun c!87784 () Bool)

(assert (=> b!789610 (= c!87784 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789611 () Bool)

(assert (=> b!789611 (= e!438860 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20520 a!3186) j!159) a!3186 mask!3328) lt!352333))))

(declare-fun b!789612 () Bool)

(declare-fun res!534859 () Bool)

(assert (=> b!789612 (=> (not res!534859) (not e!438858))))

(declare-datatypes ((List!14522 0))(
  ( (Nil!14519) (Cons!14518 (h!15644 (_ BitVec 64)) (t!20837 List!14522)) )
))
(declare-fun arrayNoDuplicates!0 (array!42867 (_ BitVec 32) List!14522) Bool)

(assert (=> b!789612 (= res!534859 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14519))))

(assert (= (and start!67890 res!534860) b!789604))

(assert (= (and b!789604 res!534854) b!789605))

(assert (= (and b!789605 res!534847) b!789597))

(assert (= (and b!789597 res!534845) b!789596))

(assert (= (and b!789596 res!534848) b!789593))

(assert (= (and b!789593 res!534856) b!789592))

(assert (= (and b!789592 res!534852) b!789612))

(assert (= (and b!789612 res!534859) b!789595))

(assert (= (and b!789595 res!534851) b!789602))

(assert (= (and b!789602 res!534855) b!789608))

(assert (= (and b!789608 res!534850) b!789610))

(assert (= (and b!789610 c!87784) b!789609))

(assert (= (and b!789610 (not c!87784)) b!789606))

(assert (= (and b!789610 res!534846) b!789599))

(assert (= (and b!789599 res!534843) b!789607))

(assert (= (and b!789607 res!534853) b!789611))

(assert (= (and b!789607 (not res!534849)) b!789600))

(assert (= (and b!789600 (not res!534857)) b!789601))

(assert (= (and b!789601 (not res!534844)) b!789594))

(assert (= (and b!789594 c!87783) b!789603))

(assert (= (and b!789594 (not c!87783)) b!789598))

(assert (= (and b!789594 (not res!534858)) b!789591))

(declare-fun m!730637 () Bool)

(assert (=> b!789597 m!730637))

(declare-fun m!730639 () Bool)

(assert (=> b!789608 m!730639))

(declare-fun m!730641 () Bool)

(assert (=> b!789607 m!730641))

(assert (=> b!789607 m!730641))

(declare-fun m!730643 () Bool)

(assert (=> b!789607 m!730643))

(declare-fun m!730645 () Bool)

(assert (=> b!789607 m!730645))

(declare-fun m!730647 () Bool)

(assert (=> b!789607 m!730647))

(declare-fun m!730649 () Bool)

(assert (=> b!789591 m!730649))

(assert (=> b!789611 m!730641))

(assert (=> b!789611 m!730641))

(declare-fun m!730651 () Bool)

(assert (=> b!789611 m!730651))

(declare-fun m!730653 () Bool)

(assert (=> b!789594 m!730653))

(declare-fun m!730655 () Bool)

(assert (=> b!789594 m!730655))

(declare-fun m!730657 () Bool)

(assert (=> b!789594 m!730657))

(assert (=> b!789606 m!730641))

(assert (=> b!789606 m!730641))

(declare-fun m!730659 () Bool)

(assert (=> b!789606 m!730659))

(declare-fun m!730661 () Bool)

(assert (=> b!789599 m!730661))

(declare-fun m!730663 () Bool)

(assert (=> b!789599 m!730663))

(declare-fun m!730665 () Bool)

(assert (=> b!789599 m!730665))

(assert (=> b!789599 m!730661))

(declare-fun m!730667 () Bool)

(assert (=> b!789599 m!730667))

(declare-fun m!730669 () Bool)

(assert (=> b!789599 m!730669))

(declare-fun m!730671 () Bool)

(assert (=> b!789592 m!730671))

(declare-fun m!730673 () Bool)

(assert (=> b!789593 m!730673))

(assert (=> b!789609 m!730641))

(assert (=> b!789609 m!730641))

(declare-fun m!730675 () Bool)

(assert (=> b!789609 m!730675))

(declare-fun m!730677 () Bool)

(assert (=> b!789596 m!730677))

(assert (=> b!789601 m!730665))

(declare-fun m!730679 () Bool)

(assert (=> b!789601 m!730679))

(declare-fun m!730681 () Bool)

(assert (=> start!67890 m!730681))

(declare-fun m!730683 () Bool)

(assert (=> start!67890 m!730683))

(assert (=> b!789600 m!730641))

(assert (=> b!789600 m!730641))

(assert (=> b!789600 m!730659))

(assert (=> b!789602 m!730641))

(assert (=> b!789602 m!730641))

(declare-fun m!730685 () Bool)

(assert (=> b!789602 m!730685))

(assert (=> b!789602 m!730685))

(assert (=> b!789602 m!730641))

(declare-fun m!730687 () Bool)

(assert (=> b!789602 m!730687))

(declare-fun m!730689 () Bool)

(assert (=> b!789612 m!730689))

(assert (=> b!789605 m!730641))

(assert (=> b!789605 m!730641))

(declare-fun m!730691 () Bool)

(assert (=> b!789605 m!730691))

(push 1)

