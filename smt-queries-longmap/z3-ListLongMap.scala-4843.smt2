; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66734 () Bool)

(assert start!66734)

(declare-fun b!768827 () Bool)

(declare-fun e!428116 () Bool)

(declare-fun e!428117 () Bool)

(assert (=> b!768827 (= e!428116 (not e!428117))))

(declare-fun res!519962 () Bool)

(assert (=> b!768827 (=> res!519962 e!428117)))

(declare-datatypes ((SeekEntryResult!7855 0))(
  ( (MissingZero!7855 (index!33788 (_ BitVec 32))) (Found!7855 (index!33789 (_ BitVec 32))) (Intermediate!7855 (undefined!8667 Bool) (index!33790 (_ BitVec 32)) (x!64733 (_ BitVec 32))) (Undefined!7855) (MissingVacant!7855 (index!33791 (_ BitVec 32))) )
))
(declare-fun lt!341911 () SeekEntryResult!7855)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!768827 (= res!519962 (or (not ((_ is Intermediate!7855) lt!341911)) (bvsge x!1131 (x!64733 lt!341911))))))

(declare-fun e!428120 () Bool)

(assert (=> b!768827 e!428120))

(declare-fun res!519955 () Bool)

(assert (=> b!768827 (=> (not res!519955) (not e!428120))))

(declare-datatypes ((array!42315 0))(
  ( (array!42316 (arr!20258 (Array (_ BitVec 32) (_ BitVec 64))) (size!20679 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42315)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42315 (_ BitVec 32)) Bool)

(assert (=> b!768827 (= res!519955 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26414 0))(
  ( (Unit!26415) )
))
(declare-fun lt!341909 () Unit!26414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26414)

(assert (=> b!768827 (= lt!341909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768828 () Bool)

(declare-fun res!519964 () Bool)

(declare-fun e!428118 () Bool)

(assert (=> b!768828 (=> (not res!519964) (not e!428118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768828 (= res!519964 (validKeyInArray!0 (select (arr!20258 a!3186) j!159)))))

(declare-fun b!768829 () Bool)

(declare-fun res!519953 () Bool)

(assert (=> b!768829 (=> (not res!519953) (not e!428118))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768829 (= res!519953 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768830 () Bool)

(assert (=> b!768830 (= e!428117 true)))

(declare-fun lt!341912 () Unit!26414)

(declare-fun e!428122 () Unit!26414)

(assert (=> b!768830 (= lt!341912 e!428122)))

(declare-fun c!84834 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768830 (= c!84834 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341905 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768830 (= lt!341905 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768831 () Bool)

(declare-fun res!519957 () Bool)

(declare-fun e!428121 () Bool)

(assert (=> b!768831 (=> (not res!519957) (not e!428121))))

(assert (=> b!768831 (= res!519957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768832 () Bool)

(declare-fun res!519959 () Bool)

(assert (=> b!768832 (=> (not res!519959) (not e!428118))))

(assert (=> b!768832 (= res!519959 (validKeyInArray!0 k0!2102))))

(declare-fun b!768833 () Bool)

(declare-fun res!519965 () Bool)

(assert (=> b!768833 (=> (not res!519965) (not e!428118))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768833 (= res!519965 (and (= (size!20679 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20679 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20679 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!428125 () Bool)

(declare-fun b!768834 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42315 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!768834 (= e!428125 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159)))))

(declare-fun b!768835 () Bool)

(declare-fun res!519958 () Bool)

(declare-fun e!428123 () Bool)

(assert (=> b!768835 (=> (not res!519958) (not e!428123))))

(assert (=> b!768835 (= res!519958 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20258 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768836 () Bool)

(assert (=> b!768836 (= e!428123 e!428116)))

(declare-fun res!519954 () Bool)

(assert (=> b!768836 (=> (not res!519954) (not e!428116))))

(declare-fun lt!341907 () SeekEntryResult!7855)

(assert (=> b!768836 (= res!519954 (= lt!341907 lt!341911))))

(declare-fun lt!341915 () (_ BitVec 64))

(declare-fun lt!341906 () array!42315)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42315 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!768836 (= lt!341911 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341915 lt!341906 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768836 (= lt!341907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341915 mask!3328) lt!341915 lt!341906 mask!3328))))

(assert (=> b!768836 (= lt!341915 (select (store (arr!20258 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768836 (= lt!341906 (array!42316 (store (arr!20258 a!3186) i!1173 k0!2102) (size!20679 a!3186)))))

(declare-fun b!768837 () Bool)

(declare-fun res!519951 () Bool)

(assert (=> b!768837 (=> (not res!519951) (not e!428123))))

(assert (=> b!768837 (= res!519951 e!428125)))

(declare-fun c!84833 () Bool)

(assert (=> b!768837 (= c!84833 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768838 () Bool)

(assert (=> b!768838 (= e!428118 e!428121)))

(declare-fun res!519961 () Bool)

(assert (=> b!768838 (=> (not res!519961) (not e!428121))))

(declare-fun lt!341914 () SeekEntryResult!7855)

(assert (=> b!768838 (= res!519961 (or (= lt!341914 (MissingZero!7855 i!1173)) (= lt!341914 (MissingVacant!7855 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42315 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!768838 (= lt!341914 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!519963 () Bool)

(assert (=> start!66734 (=> (not res!519963) (not e!428118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66734 (= res!519963 (validMask!0 mask!3328))))

(assert (=> start!66734 e!428118))

(assert (=> start!66734 true))

(declare-fun array_inv!16141 (array!42315) Bool)

(assert (=> start!66734 (array_inv!16141 a!3186)))

(declare-fun b!768826 () Bool)

(declare-fun res!519960 () Bool)

(assert (=> b!768826 (=> (not res!519960) (not e!428121))))

(declare-datatypes ((List!14299 0))(
  ( (Nil!14296) (Cons!14295 (h!15394 (_ BitVec 64)) (t!20605 List!14299)) )
))
(declare-fun arrayNoDuplicates!0 (array!42315 (_ BitVec 32) List!14299) Bool)

(assert (=> b!768826 (= res!519960 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14296))))

(declare-fun b!768839 () Bool)

(declare-fun e!428119 () Bool)

(assert (=> b!768839 (= e!428120 e!428119)))

(declare-fun res!519952 () Bool)

(assert (=> b!768839 (=> (not res!519952) (not e!428119))))

(declare-fun lt!341913 () SeekEntryResult!7855)

(assert (=> b!768839 (= res!519952 (= (seekEntryOrOpen!0 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!341913))))

(assert (=> b!768839 (= lt!341913 (Found!7855 j!159))))

(declare-fun lt!341910 () SeekEntryResult!7855)

(declare-fun b!768840 () Bool)

(assert (=> b!768840 (= e!428125 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!341910))))

(declare-fun b!768841 () Bool)

(declare-fun Unit!26416 () Unit!26414)

(assert (=> b!768841 (= e!428122 Unit!26416)))

(declare-fun lt!341908 () SeekEntryResult!7855)

(assert (=> b!768841 (= lt!341908 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!768841 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341905 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159))))

(declare-fun b!768842 () Bool)

(assert (=> b!768842 (= e!428121 e!428123)))

(declare-fun res!519966 () Bool)

(assert (=> b!768842 (=> (not res!519966) (not e!428123))))

(assert (=> b!768842 (= res!519966 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20258 a!3186) j!159) mask!3328) (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!341910))))

(assert (=> b!768842 (= lt!341910 (Intermediate!7855 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768843 () Bool)

(assert (=> b!768843 (= e!428119 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!341913))))

(declare-fun b!768844 () Bool)

(declare-fun res!519956 () Bool)

(assert (=> b!768844 (=> (not res!519956) (not e!428121))))

(assert (=> b!768844 (= res!519956 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20679 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20679 a!3186))))))

(declare-fun b!768845 () Bool)

(declare-fun Unit!26417 () Unit!26414)

(assert (=> b!768845 (= e!428122 Unit!26417)))

(assert (=> b!768845 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341905 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!341910)))

(assert (= (and start!66734 res!519963) b!768833))

(assert (= (and b!768833 res!519965) b!768828))

(assert (= (and b!768828 res!519964) b!768832))

(assert (= (and b!768832 res!519959) b!768829))

(assert (= (and b!768829 res!519953) b!768838))

(assert (= (and b!768838 res!519961) b!768831))

(assert (= (and b!768831 res!519957) b!768826))

(assert (= (and b!768826 res!519960) b!768844))

(assert (= (and b!768844 res!519956) b!768842))

(assert (= (and b!768842 res!519966) b!768835))

(assert (= (and b!768835 res!519958) b!768837))

(assert (= (and b!768837 c!84833) b!768840))

(assert (= (and b!768837 (not c!84833)) b!768834))

(assert (= (and b!768837 res!519951) b!768836))

(assert (= (and b!768836 res!519954) b!768827))

(assert (= (and b!768827 res!519955) b!768839))

(assert (= (and b!768839 res!519952) b!768843))

(assert (= (and b!768827 (not res!519962)) b!768830))

(assert (= (and b!768830 c!84834) b!768845))

(assert (= (and b!768830 (not c!84834)) b!768841))

(declare-fun m!713781 () Bool)

(assert (=> b!768832 m!713781))

(declare-fun m!713783 () Bool)

(assert (=> b!768838 m!713783))

(declare-fun m!713785 () Bool)

(assert (=> b!768834 m!713785))

(assert (=> b!768834 m!713785))

(declare-fun m!713787 () Bool)

(assert (=> b!768834 m!713787))

(assert (=> b!768828 m!713785))

(assert (=> b!768828 m!713785))

(declare-fun m!713789 () Bool)

(assert (=> b!768828 m!713789))

(declare-fun m!713791 () Bool)

(assert (=> b!768830 m!713791))

(declare-fun m!713793 () Bool)

(assert (=> b!768835 m!713793))

(declare-fun m!713795 () Bool)

(assert (=> b!768831 m!713795))

(declare-fun m!713797 () Bool)

(assert (=> b!768829 m!713797))

(assert (=> b!768839 m!713785))

(assert (=> b!768839 m!713785))

(declare-fun m!713799 () Bool)

(assert (=> b!768839 m!713799))

(declare-fun m!713801 () Bool)

(assert (=> start!66734 m!713801))

(declare-fun m!713803 () Bool)

(assert (=> start!66734 m!713803))

(assert (=> b!768840 m!713785))

(assert (=> b!768840 m!713785))

(declare-fun m!713805 () Bool)

(assert (=> b!768840 m!713805))

(declare-fun m!713807 () Bool)

(assert (=> b!768836 m!713807))

(declare-fun m!713809 () Bool)

(assert (=> b!768836 m!713809))

(assert (=> b!768836 m!713807))

(declare-fun m!713811 () Bool)

(assert (=> b!768836 m!713811))

(declare-fun m!713813 () Bool)

(assert (=> b!768836 m!713813))

(declare-fun m!713815 () Bool)

(assert (=> b!768836 m!713815))

(assert (=> b!768842 m!713785))

(assert (=> b!768842 m!713785))

(declare-fun m!713817 () Bool)

(assert (=> b!768842 m!713817))

(assert (=> b!768842 m!713817))

(assert (=> b!768842 m!713785))

(declare-fun m!713819 () Bool)

(assert (=> b!768842 m!713819))

(assert (=> b!768845 m!713785))

(assert (=> b!768845 m!713785))

(declare-fun m!713821 () Bool)

(assert (=> b!768845 m!713821))

(declare-fun m!713823 () Bool)

(assert (=> b!768827 m!713823))

(declare-fun m!713825 () Bool)

(assert (=> b!768827 m!713825))

(assert (=> b!768843 m!713785))

(assert (=> b!768843 m!713785))

(declare-fun m!713827 () Bool)

(assert (=> b!768843 m!713827))

(declare-fun m!713829 () Bool)

(assert (=> b!768826 m!713829))

(assert (=> b!768841 m!713785))

(assert (=> b!768841 m!713785))

(assert (=> b!768841 m!713787))

(assert (=> b!768841 m!713785))

(declare-fun m!713831 () Bool)

(assert (=> b!768841 m!713831))

(check-sat (not b!768834) (not b!768843) (not start!66734) (not b!768836) (not b!768828) (not b!768829) (not b!768826) (not b!768830) (not b!768841) (not b!768838) (not b!768845) (not b!768840) (not b!768831) (not b!768839) (not b!768832) (not b!768827) (not b!768842))
(check-sat)
