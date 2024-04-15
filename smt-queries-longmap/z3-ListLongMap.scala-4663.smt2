; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64730 () Bool)

(assert start!64730)

(declare-datatypes ((array!41196 0))(
  ( (array!41197 (arr!19718 (Array (_ BitVec 32) (_ BitVec 64))) (size!20139 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41196)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!408919 () Bool)

(declare-datatypes ((SeekEntryResult!7315 0))(
  ( (MissingZero!7315 (index!31628 (_ BitVec 32))) (Found!7315 (index!31629 (_ BitVec 32))) (Intermediate!7315 (undefined!8127 Bool) (index!31630 (_ BitVec 32)) (x!62612 (_ BitVec 32))) (Undefined!7315) (MissingVacant!7315 (index!31631 (_ BitVec 32))) )
))
(declare-fun lt!323726 () SeekEntryResult!7315)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!730787 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41196 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!730787 (= e!408919 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323726))))

(declare-fun b!730788 () Bool)

(declare-fun e!408917 () Bool)

(declare-fun e!408914 () Bool)

(assert (=> b!730788 (= e!408917 e!408914)))

(declare-fun res!491162 () Bool)

(assert (=> b!730788 (=> (not res!491162) (not e!408914))))

(declare-fun lt!323724 () SeekEntryResult!7315)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41196 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!730788 (= res!491162 (= (seekEntryOrOpen!0 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323724))))

(assert (=> b!730788 (= lt!323724 (Found!7315 j!159))))

(declare-fun b!730789 () Bool)

(declare-fun e!408913 () Bool)

(declare-fun e!408922 () Bool)

(assert (=> b!730789 (= e!408913 e!408922)))

(declare-fun res!491171 () Bool)

(assert (=> b!730789 (=> (not res!491171) (not e!408922))))

(declare-fun lt!323717 () SeekEntryResult!7315)

(declare-fun lt!323725 () SeekEntryResult!7315)

(assert (=> b!730789 (= res!491171 (= lt!323717 lt!323725))))

(declare-fun lt!323721 () array!41196)

(declare-fun lt!323723 () (_ BitVec 64))

(assert (=> b!730789 (= lt!323725 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323723 lt!323721 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730789 (= lt!323717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323723 mask!3328) lt!323723 lt!323721 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730789 (= lt!323723 (select (store (arr!19718 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730789 (= lt!323721 (array!41197 (store (arr!19718 a!3186) i!1173 k0!2102) (size!20139 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!730790 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41196 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!730790 (= e!408919 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) (Found!7315 j!159)))))

(declare-fun b!730791 () Bool)

(declare-fun res!491164 () Bool)

(declare-fun e!408920 () Bool)

(assert (=> b!730791 (=> (not res!491164) (not e!408920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41196 (_ BitVec 32)) Bool)

(assert (=> b!730791 (= res!491164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730792 () Bool)

(declare-fun res!491165 () Bool)

(assert (=> b!730792 (=> (not res!491165) (not e!408913))))

(assert (=> b!730792 (= res!491165 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19718 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730794 () Bool)

(declare-fun res!491157 () Bool)

(assert (=> b!730794 (=> (not res!491157) (not e!408920))))

(declare-datatypes ((List!13759 0))(
  ( (Nil!13756) (Cons!13755 (h!14815 (_ BitVec 64)) (t!20065 List!13759)) )
))
(declare-fun arrayNoDuplicates!0 (array!41196 (_ BitVec 32) List!13759) Bool)

(assert (=> b!730794 (= res!491157 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13756))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!730795 () Bool)

(assert (=> b!730795 (= e!408914 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323724))))

(declare-fun b!730796 () Bool)

(assert (=> b!730796 (= e!408920 e!408913)))

(declare-fun res!491160 () Bool)

(assert (=> b!730796 (=> (not res!491160) (not e!408913))))

(assert (=> b!730796 (= res!491160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19718 a!3186) j!159) mask!3328) (select (arr!19718 a!3186) j!159) a!3186 mask!3328) lt!323726))))

(assert (=> b!730796 (= lt!323726 (Intermediate!7315 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730797 () Bool)

(declare-fun res!491163 () Bool)

(declare-fun e!408915 () Bool)

(assert (=> b!730797 (=> (not res!491163) (not e!408915))))

(assert (=> b!730797 (= res!491163 (and (= (size!20139 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20139 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20139 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730798 () Bool)

(declare-fun res!491159 () Bool)

(assert (=> b!730798 (=> (not res!491159) (not e!408915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730798 (= res!491159 (validKeyInArray!0 k0!2102))))

(declare-fun b!730799 () Bool)

(declare-fun res!491158 () Bool)

(assert (=> b!730799 (=> (not res!491158) (not e!408915))))

(assert (=> b!730799 (= res!491158 (validKeyInArray!0 (select (arr!19718 a!3186) j!159)))))

(declare-fun b!730800 () Bool)

(declare-fun res!491169 () Bool)

(assert (=> b!730800 (=> (not res!491169) (not e!408915))))

(declare-fun arrayContainsKey!0 (array!41196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730800 (= res!491169 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730801 () Bool)

(declare-fun e!408921 () Bool)

(declare-fun e!408916 () Bool)

(assert (=> b!730801 (= e!408921 e!408916)))

(declare-fun res!491172 () Bool)

(assert (=> b!730801 (=> res!491172 e!408916)))

(assert (=> b!730801 (= res!491172 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323722 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730801 (= lt!323722 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730802 () Bool)

(assert (=> b!730802 (= e!408922 (not e!408921))))

(declare-fun res!491166 () Bool)

(assert (=> b!730802 (=> res!491166 e!408921)))

(get-info :version)

(assert (=> b!730802 (= res!491166 (or (not ((_ is Intermediate!7315) lt!323725)) (bvsge x!1131 (x!62612 lt!323725))))))

(assert (=> b!730802 e!408917))

(declare-fun res!491168 () Bool)

(assert (=> b!730802 (=> (not res!491168) (not e!408917))))

(assert (=> b!730802 (= res!491168 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24920 0))(
  ( (Unit!24921) )
))
(declare-fun lt!323719 () Unit!24920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24920)

(assert (=> b!730802 (= lt!323719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!491170 () Bool)

(assert (=> start!64730 (=> (not res!491170) (not e!408915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64730 (= res!491170 (validMask!0 mask!3328))))

(assert (=> start!64730 e!408915))

(assert (=> start!64730 true))

(declare-fun array_inv!15601 (array!41196) Bool)

(assert (=> start!64730 (array_inv!15601 a!3186)))

(declare-fun b!730793 () Bool)

(assert (=> b!730793 (= e!408916 true)))

(declare-fun lt!323718 () SeekEntryResult!7315)

(assert (=> b!730793 (= lt!323718 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19718 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!730803 () Bool)

(declare-fun res!491156 () Bool)

(assert (=> b!730803 (=> (not res!491156) (not e!408920))))

(assert (=> b!730803 (= res!491156 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20139 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20139 a!3186))))))

(declare-fun b!730804 () Bool)

(assert (=> b!730804 (= e!408915 e!408920)))

(declare-fun res!491167 () Bool)

(assert (=> b!730804 (=> (not res!491167) (not e!408920))))

(declare-fun lt!323720 () SeekEntryResult!7315)

(assert (=> b!730804 (= res!491167 (or (= lt!323720 (MissingZero!7315 i!1173)) (= lt!323720 (MissingVacant!7315 i!1173))))))

(assert (=> b!730804 (= lt!323720 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730805 () Bool)

(declare-fun res!491161 () Bool)

(assert (=> b!730805 (=> (not res!491161) (not e!408913))))

(assert (=> b!730805 (= res!491161 e!408919)))

(declare-fun c!80190 () Bool)

(assert (=> b!730805 (= c!80190 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64730 res!491170) b!730797))

(assert (= (and b!730797 res!491163) b!730799))

(assert (= (and b!730799 res!491158) b!730798))

(assert (= (and b!730798 res!491159) b!730800))

(assert (= (and b!730800 res!491169) b!730804))

(assert (= (and b!730804 res!491167) b!730791))

(assert (= (and b!730791 res!491164) b!730794))

(assert (= (and b!730794 res!491157) b!730803))

(assert (= (and b!730803 res!491156) b!730796))

(assert (= (and b!730796 res!491160) b!730792))

(assert (= (and b!730792 res!491165) b!730805))

(assert (= (and b!730805 c!80190) b!730787))

(assert (= (and b!730805 (not c!80190)) b!730790))

(assert (= (and b!730805 res!491161) b!730789))

(assert (= (and b!730789 res!491171) b!730802))

(assert (= (and b!730802 res!491168) b!730788))

(assert (= (and b!730788 res!491162) b!730795))

(assert (= (and b!730802 (not res!491166)) b!730801))

(assert (= (and b!730801 (not res!491172)) b!730793))

(declare-fun m!683717 () Bool)

(assert (=> b!730790 m!683717))

(assert (=> b!730790 m!683717))

(declare-fun m!683719 () Bool)

(assert (=> b!730790 m!683719))

(declare-fun m!683721 () Bool)

(assert (=> b!730800 m!683721))

(declare-fun m!683723 () Bool)

(assert (=> b!730791 m!683723))

(declare-fun m!683725 () Bool)

(assert (=> b!730789 m!683725))

(declare-fun m!683727 () Bool)

(assert (=> b!730789 m!683727))

(declare-fun m!683729 () Bool)

(assert (=> b!730789 m!683729))

(assert (=> b!730789 m!683725))

(declare-fun m!683731 () Bool)

(assert (=> b!730789 m!683731))

(declare-fun m!683733 () Bool)

(assert (=> b!730789 m!683733))

(assert (=> b!730788 m!683717))

(assert (=> b!730788 m!683717))

(declare-fun m!683735 () Bool)

(assert (=> b!730788 m!683735))

(declare-fun m!683737 () Bool)

(assert (=> b!730798 m!683737))

(declare-fun m!683739 () Bool)

(assert (=> b!730804 m!683739))

(declare-fun m!683741 () Bool)

(assert (=> b!730792 m!683741))

(declare-fun m!683743 () Bool)

(assert (=> start!64730 m!683743))

(declare-fun m!683745 () Bool)

(assert (=> start!64730 m!683745))

(assert (=> b!730799 m!683717))

(assert (=> b!730799 m!683717))

(declare-fun m!683747 () Bool)

(assert (=> b!730799 m!683747))

(assert (=> b!730795 m!683717))

(assert (=> b!730795 m!683717))

(declare-fun m!683749 () Bool)

(assert (=> b!730795 m!683749))

(declare-fun m!683751 () Bool)

(assert (=> b!730801 m!683751))

(assert (=> b!730793 m!683717))

(assert (=> b!730793 m!683717))

(assert (=> b!730793 m!683719))

(assert (=> b!730796 m!683717))

(assert (=> b!730796 m!683717))

(declare-fun m!683753 () Bool)

(assert (=> b!730796 m!683753))

(assert (=> b!730796 m!683753))

(assert (=> b!730796 m!683717))

(declare-fun m!683755 () Bool)

(assert (=> b!730796 m!683755))

(declare-fun m!683757 () Bool)

(assert (=> b!730794 m!683757))

(assert (=> b!730787 m!683717))

(assert (=> b!730787 m!683717))

(declare-fun m!683759 () Bool)

(assert (=> b!730787 m!683759))

(declare-fun m!683761 () Bool)

(assert (=> b!730802 m!683761))

(declare-fun m!683763 () Bool)

(assert (=> b!730802 m!683763))

(check-sat (not b!730800) (not b!730801) (not b!730804) (not b!730795) (not b!730794) (not b!730790) (not start!64730) (not b!730791) (not b!730788) (not b!730787) (not b!730802) (not b!730789) (not b!730796) (not b!730793) (not b!730799) (not b!730798))
(check-sat)
