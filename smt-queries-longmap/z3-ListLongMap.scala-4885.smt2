; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67334 () Bool)

(assert start!67334)

(declare-fun b!778764 () Bool)

(declare-fun res!526911 () Bool)

(declare-fun e!433242 () Bool)

(assert (=> b!778764 (=> (not res!526911) (not e!433242))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42582 0))(
  ( (array!42583 (arr!20384 (Array (_ BitVec 32) (_ BitVec 64))) (size!20805 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42582)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778764 (= res!526911 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20805 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20805 a!3186))))))

(declare-fun b!778765 () Bool)

(declare-fun res!526917 () Bool)

(declare-fun e!433246 () Bool)

(assert (=> b!778765 (=> (not res!526917) (not e!433246))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778765 (= res!526917 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!433244 () Bool)

(declare-datatypes ((SeekEntryResult!7981 0))(
  ( (MissingZero!7981 (index!34292 (_ BitVec 32))) (Found!7981 (index!34293 (_ BitVec 32))) (Intermediate!7981 (undefined!8793 Bool) (index!34294 (_ BitVec 32)) (x!65249 (_ BitVec 32))) (Undefined!7981) (MissingVacant!7981 (index!34295 (_ BitVec 32))) )
))
(declare-fun lt!346840 () SeekEntryResult!7981)

(declare-fun b!778766 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42582 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!778766 (= e!433244 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!346840))))

(declare-fun b!778767 () Bool)

(declare-fun e!433243 () Bool)

(declare-fun e!433248 () Bool)

(assert (=> b!778767 (= e!433243 e!433248)))

(declare-fun res!526922 () Bool)

(assert (=> b!778767 (=> (not res!526922) (not e!433248))))

(declare-fun lt!346838 () SeekEntryResult!7981)

(declare-fun lt!346844 () SeekEntryResult!7981)

(assert (=> b!778767 (= res!526922 (= lt!346838 lt!346844))))

(declare-fun lt!346843 () array!42582)

(declare-fun lt!346842 () (_ BitVec 64))

(assert (=> b!778767 (= lt!346844 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346842 lt!346843 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778767 (= lt!346838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346842 mask!3328) lt!346842 lt!346843 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778767 (= lt!346842 (select (store (arr!20384 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778767 (= lt!346843 (array!42583 (store (arr!20384 a!3186) i!1173 k0!2102) (size!20805 a!3186)))))

(declare-fun b!778768 () Bool)

(assert (=> b!778768 (= e!433246 e!433242)))

(declare-fun res!526918 () Bool)

(assert (=> b!778768 (=> (not res!526918) (not e!433242))))

(declare-fun lt!346837 () SeekEntryResult!7981)

(assert (=> b!778768 (= res!526918 (or (= lt!346837 (MissingZero!7981 i!1173)) (= lt!346837 (MissingVacant!7981 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42582 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!778768 (= lt!346837 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778769 () Bool)

(assert (=> b!778769 (= e!433242 e!433243)))

(declare-fun res!526919 () Bool)

(assert (=> b!778769 (=> (not res!526919) (not e!433243))))

(assert (=> b!778769 (= res!526919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20384 a!3186) j!159) mask!3328) (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!346840))))

(assert (=> b!778769 (= lt!346840 (Intermediate!7981 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778770 () Bool)

(declare-fun e!433249 () Bool)

(declare-fun e!433241 () Bool)

(assert (=> b!778770 (= e!433249 e!433241)))

(declare-fun res!526916 () Bool)

(assert (=> b!778770 (=> (not res!526916) (not e!433241))))

(declare-fun lt!346839 () SeekEntryResult!7981)

(assert (=> b!778770 (= res!526916 (= (seekEntryOrOpen!0 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!346839))))

(assert (=> b!778770 (= lt!346839 (Found!7981 j!159))))

(declare-fun b!778771 () Bool)

(declare-fun res!526915 () Bool)

(assert (=> b!778771 (=> (not res!526915) (not e!433243))))

(assert (=> b!778771 (= res!526915 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20384 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!526912 () Bool)

(assert (=> start!67334 (=> (not res!526912) (not e!433246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67334 (= res!526912 (validMask!0 mask!3328))))

(assert (=> start!67334 e!433246))

(assert (=> start!67334 true))

(declare-fun array_inv!16267 (array!42582) Bool)

(assert (=> start!67334 (array_inv!16267 a!3186)))

(declare-fun b!778772 () Bool)

(declare-fun e!433247 () Bool)

(assert (=> b!778772 (= e!433247 true)))

(declare-fun lt!346841 () SeekEntryResult!7981)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42582 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!778772 (= lt!346841 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20384 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778773 () Bool)

(assert (=> b!778773 (= e!433244 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) (Found!7981 j!159)))))

(declare-fun b!778774 () Bool)

(declare-fun res!526921 () Bool)

(assert (=> b!778774 (=> (not res!526921) (not e!433246))))

(assert (=> b!778774 (= res!526921 (and (= (size!20805 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20805 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20805 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778775 () Bool)

(assert (=> b!778775 (= e!433241 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!346839))))

(declare-fun b!778776 () Bool)

(declare-fun res!526910 () Bool)

(assert (=> b!778776 (=> (not res!526910) (not e!433246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778776 (= res!526910 (validKeyInArray!0 k0!2102))))

(declare-fun b!778777 () Bool)

(declare-fun res!526913 () Bool)

(assert (=> b!778777 (=> (not res!526913) (not e!433242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42582 (_ BitVec 32)) Bool)

(assert (=> b!778777 (= res!526913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778778 () Bool)

(declare-fun res!526914 () Bool)

(assert (=> b!778778 (=> (not res!526914) (not e!433242))))

(declare-datatypes ((List!14425 0))(
  ( (Nil!14422) (Cons!14421 (h!15535 (_ BitVec 64)) (t!20731 List!14425)) )
))
(declare-fun arrayNoDuplicates!0 (array!42582 (_ BitVec 32) List!14425) Bool)

(assert (=> b!778778 (= res!526914 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14422))))

(declare-fun b!778779 () Bool)

(declare-fun res!526920 () Bool)

(assert (=> b!778779 (=> (not res!526920) (not e!433243))))

(assert (=> b!778779 (= res!526920 e!433244)))

(declare-fun c!86331 () Bool)

(assert (=> b!778779 (= c!86331 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778780 () Bool)

(assert (=> b!778780 (= e!433248 (not e!433247))))

(declare-fun res!526909 () Bool)

(assert (=> b!778780 (=> res!526909 e!433247)))

(get-info :version)

(assert (=> b!778780 (= res!526909 (or (not ((_ is Intermediate!7981) lt!346844)) (bvslt x!1131 (x!65249 lt!346844)) (not (= x!1131 (x!65249 lt!346844))) (not (= index!1321 (index!34294 lt!346844)))))))

(assert (=> b!778780 e!433249))

(declare-fun res!526923 () Bool)

(assert (=> b!778780 (=> (not res!526923) (not e!433249))))

(assert (=> b!778780 (= res!526923 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26828 0))(
  ( (Unit!26829) )
))
(declare-fun lt!346836 () Unit!26828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26828)

(assert (=> b!778780 (= lt!346836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778781 () Bool)

(declare-fun res!526908 () Bool)

(assert (=> b!778781 (=> (not res!526908) (not e!433246))))

(assert (=> b!778781 (= res!526908 (validKeyInArray!0 (select (arr!20384 a!3186) j!159)))))

(assert (= (and start!67334 res!526912) b!778774))

(assert (= (and b!778774 res!526921) b!778781))

(assert (= (and b!778781 res!526908) b!778776))

(assert (= (and b!778776 res!526910) b!778765))

(assert (= (and b!778765 res!526917) b!778768))

(assert (= (and b!778768 res!526918) b!778777))

(assert (= (and b!778777 res!526913) b!778778))

(assert (= (and b!778778 res!526914) b!778764))

(assert (= (and b!778764 res!526911) b!778769))

(assert (= (and b!778769 res!526919) b!778771))

(assert (= (and b!778771 res!526915) b!778779))

(assert (= (and b!778779 c!86331) b!778766))

(assert (= (and b!778779 (not c!86331)) b!778773))

(assert (= (and b!778779 res!526920) b!778767))

(assert (= (and b!778767 res!526922) b!778780))

(assert (= (and b!778780 res!526923) b!778770))

(assert (= (and b!778770 res!526916) b!778775))

(assert (= (and b!778780 (not res!526909)) b!778772))

(declare-fun m!721821 () Bool)

(assert (=> b!778776 m!721821))

(declare-fun m!721823 () Bool)

(assert (=> b!778777 m!721823))

(declare-fun m!721825 () Bool)

(assert (=> b!778765 m!721825))

(declare-fun m!721827 () Bool)

(assert (=> b!778780 m!721827))

(declare-fun m!721829 () Bool)

(assert (=> b!778780 m!721829))

(declare-fun m!721831 () Bool)

(assert (=> b!778781 m!721831))

(assert (=> b!778781 m!721831))

(declare-fun m!721833 () Bool)

(assert (=> b!778781 m!721833))

(declare-fun m!721835 () Bool)

(assert (=> b!778767 m!721835))

(declare-fun m!721837 () Bool)

(assert (=> b!778767 m!721837))

(declare-fun m!721839 () Bool)

(assert (=> b!778767 m!721839))

(declare-fun m!721841 () Bool)

(assert (=> b!778767 m!721841))

(declare-fun m!721843 () Bool)

(assert (=> b!778767 m!721843))

(assert (=> b!778767 m!721835))

(assert (=> b!778773 m!721831))

(assert (=> b!778773 m!721831))

(declare-fun m!721845 () Bool)

(assert (=> b!778773 m!721845))

(assert (=> b!778766 m!721831))

(assert (=> b!778766 m!721831))

(declare-fun m!721847 () Bool)

(assert (=> b!778766 m!721847))

(assert (=> b!778769 m!721831))

(assert (=> b!778769 m!721831))

(declare-fun m!721849 () Bool)

(assert (=> b!778769 m!721849))

(assert (=> b!778769 m!721849))

(assert (=> b!778769 m!721831))

(declare-fun m!721851 () Bool)

(assert (=> b!778769 m!721851))

(declare-fun m!721853 () Bool)

(assert (=> start!67334 m!721853))

(declare-fun m!721855 () Bool)

(assert (=> start!67334 m!721855))

(declare-fun m!721857 () Bool)

(assert (=> b!778778 m!721857))

(declare-fun m!721859 () Bool)

(assert (=> b!778771 m!721859))

(assert (=> b!778775 m!721831))

(assert (=> b!778775 m!721831))

(declare-fun m!721861 () Bool)

(assert (=> b!778775 m!721861))

(assert (=> b!778772 m!721831))

(assert (=> b!778772 m!721831))

(assert (=> b!778772 m!721845))

(assert (=> b!778770 m!721831))

(assert (=> b!778770 m!721831))

(declare-fun m!721863 () Bool)

(assert (=> b!778770 m!721863))

(declare-fun m!721865 () Bool)

(assert (=> b!778768 m!721865))

(check-sat (not b!778778) (not b!778769) (not b!778781) (not start!67334) (not b!778772) (not b!778770) (not b!778768) (not b!778767) (not b!778775) (not b!778766) (not b!778777) (not b!778765) (not b!778773) (not b!778780) (not b!778776))
(check-sat)
