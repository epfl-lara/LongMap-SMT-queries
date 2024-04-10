; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67152 () Bool)

(assert start!67152)

(declare-fun b!776110 () Bool)

(declare-fun e!431905 () Bool)

(declare-fun e!431909 () Bool)

(assert (=> b!776110 (= e!431905 e!431909)))

(declare-fun res!524960 () Bool)

(assert (=> b!776110 (=> (not res!524960) (not e!431909))))

(declare-datatypes ((SeekEntryResult!7949 0))(
  ( (MissingZero!7949 (index!34164 (_ BitVec 32))) (Found!7949 (index!34165 (_ BitVec 32))) (Intermediate!7949 (undefined!8761 Bool) (index!34166 (_ BitVec 32)) (x!65108 (_ BitVec 32))) (Undefined!7949) (MissingVacant!7949 (index!34167 (_ BitVec 32))) )
))
(declare-fun lt!345764 () SeekEntryResult!7949)

(declare-fun lt!345760 () SeekEntryResult!7949)

(assert (=> b!776110 (= res!524960 (= lt!345764 lt!345760))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345763 () (_ BitVec 64))

(declare-datatypes ((array!42507 0))(
  ( (array!42508 (arr!20349 (Array (_ BitVec 32) (_ BitVec 64))) (size!20770 (_ BitVec 32))) )
))
(declare-fun lt!345762 () array!42507)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42507 (_ BitVec 32)) SeekEntryResult!7949)

(assert (=> b!776110 (= lt!345760 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345763 lt!345762 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776110 (= lt!345764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345763 mask!3328) lt!345763 lt!345762 mask!3328))))

(declare-fun a!3186 () array!42507)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!776110 (= lt!345763 (select (store (arr!20349 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776110 (= lt!345762 (array!42508 (store (arr!20349 a!3186) i!1173 k!2102) (size!20770 a!3186)))))

(declare-fun b!776111 () Bool)

(declare-fun e!431907 () Bool)

(assert (=> b!776111 (= e!431909 (not e!431907))))

(declare-fun res!524950 () Bool)

(assert (=> b!776111 (=> res!524950 e!431907)))

(assert (=> b!776111 (= res!524950 (or (not (is-Intermediate!7949 lt!345760)) (bvslt x!1131 (x!65108 lt!345760)) (not (= x!1131 (x!65108 lt!345760))) (not (= index!1321 (index!34166 lt!345760)))))))

(declare-fun e!431908 () Bool)

(assert (=> b!776111 e!431908))

(declare-fun res!524952 () Bool)

(assert (=> b!776111 (=> (not res!524952) (not e!431908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42507 (_ BitVec 32)) Bool)

(assert (=> b!776111 (= res!524952 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26792 0))(
  ( (Unit!26793) )
))
(declare-fun lt!345759 () Unit!26792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26792)

(assert (=> b!776111 (= lt!345759 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776112 () Bool)

(declare-fun e!431904 () Bool)

(assert (=> b!776112 (= e!431908 e!431904)))

(declare-fun res!524959 () Bool)

(assert (=> b!776112 (=> (not res!524959) (not e!431904))))

(declare-fun lt!345758 () SeekEntryResult!7949)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42507 (_ BitVec 32)) SeekEntryResult!7949)

(assert (=> b!776112 (= res!524959 (= (seekEntryOrOpen!0 (select (arr!20349 a!3186) j!159) a!3186 mask!3328) lt!345758))))

(assert (=> b!776112 (= lt!345758 (Found!7949 j!159))))

(declare-fun res!524962 () Bool)

(declare-fun e!431903 () Bool)

(assert (=> start!67152 (=> (not res!524962) (not e!431903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67152 (= res!524962 (validMask!0 mask!3328))))

(assert (=> start!67152 e!431903))

(assert (=> start!67152 true))

(declare-fun array_inv!16145 (array!42507) Bool)

(assert (=> start!67152 (array_inv!16145 a!3186)))

(declare-fun b!776113 () Bool)

(declare-fun e!431906 () Bool)

(assert (=> b!776113 (= e!431906 e!431905)))

(declare-fun res!524961 () Bool)

(assert (=> b!776113 (=> (not res!524961) (not e!431905))))

(declare-fun lt!345757 () SeekEntryResult!7949)

(assert (=> b!776113 (= res!524961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20349 a!3186) j!159) mask!3328) (select (arr!20349 a!3186) j!159) a!3186 mask!3328) lt!345757))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776113 (= lt!345757 (Intermediate!7949 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776114 () Bool)

(assert (=> b!776114 (= e!431907 true)))

(declare-fun lt!345756 () SeekEntryResult!7949)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42507 (_ BitVec 32)) SeekEntryResult!7949)

(assert (=> b!776114 (= lt!345756 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20349 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776115 () Bool)

(declare-fun res!524949 () Bool)

(assert (=> b!776115 (=> (not res!524949) (not e!431905))))

(assert (=> b!776115 (= res!524949 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20349 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776116 () Bool)

(assert (=> b!776116 (= e!431903 e!431906)))

(declare-fun res!524955 () Bool)

(assert (=> b!776116 (=> (not res!524955) (not e!431906))))

(declare-fun lt!345761 () SeekEntryResult!7949)

(assert (=> b!776116 (= res!524955 (or (= lt!345761 (MissingZero!7949 i!1173)) (= lt!345761 (MissingVacant!7949 i!1173))))))

(assert (=> b!776116 (= lt!345761 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776117 () Bool)

(assert (=> b!776117 (= e!431904 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20349 a!3186) j!159) a!3186 mask!3328) lt!345758))))

(declare-fun b!776118 () Bool)

(declare-fun res!524954 () Bool)

(assert (=> b!776118 (=> (not res!524954) (not e!431906))))

(assert (=> b!776118 (= res!524954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776119 () Bool)

(declare-fun res!524956 () Bool)

(assert (=> b!776119 (=> (not res!524956) (not e!431905))))

(declare-fun e!431902 () Bool)

(assert (=> b!776119 (= res!524956 e!431902)))

(declare-fun c!85981 () Bool)

(assert (=> b!776119 (= c!85981 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776120 () Bool)

(declare-fun res!524963 () Bool)

(assert (=> b!776120 (=> (not res!524963) (not e!431906))))

(declare-datatypes ((List!14351 0))(
  ( (Nil!14348) (Cons!14347 (h!15455 (_ BitVec 64)) (t!20666 List!14351)) )
))
(declare-fun arrayNoDuplicates!0 (array!42507 (_ BitVec 32) List!14351) Bool)

(assert (=> b!776120 (= res!524963 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14348))))

(declare-fun b!776121 () Bool)

(declare-fun res!524951 () Bool)

(assert (=> b!776121 (=> (not res!524951) (not e!431903))))

(assert (=> b!776121 (= res!524951 (and (= (size!20770 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20770 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20770 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776122 () Bool)

(declare-fun res!524948 () Bool)

(assert (=> b!776122 (=> (not res!524948) (not e!431906))))

(assert (=> b!776122 (= res!524948 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20770 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20770 a!3186))))))

(declare-fun b!776123 () Bool)

(declare-fun res!524958 () Bool)

(assert (=> b!776123 (=> (not res!524958) (not e!431903))))

(declare-fun arrayContainsKey!0 (array!42507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776123 (= res!524958 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776124 () Bool)

(assert (=> b!776124 (= e!431902 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20349 a!3186) j!159) a!3186 mask!3328) lt!345757))))

(declare-fun b!776125 () Bool)

(assert (=> b!776125 (= e!431902 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20349 a!3186) j!159) a!3186 mask!3328) (Found!7949 j!159)))))

(declare-fun b!776126 () Bool)

(declare-fun res!524957 () Bool)

(assert (=> b!776126 (=> (not res!524957) (not e!431903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776126 (= res!524957 (validKeyInArray!0 k!2102))))

(declare-fun b!776127 () Bool)

(declare-fun res!524953 () Bool)

(assert (=> b!776127 (=> (not res!524953) (not e!431903))))

(assert (=> b!776127 (= res!524953 (validKeyInArray!0 (select (arr!20349 a!3186) j!159)))))

(assert (= (and start!67152 res!524962) b!776121))

(assert (= (and b!776121 res!524951) b!776127))

(assert (= (and b!776127 res!524953) b!776126))

(assert (= (and b!776126 res!524957) b!776123))

(assert (= (and b!776123 res!524958) b!776116))

(assert (= (and b!776116 res!524955) b!776118))

(assert (= (and b!776118 res!524954) b!776120))

(assert (= (and b!776120 res!524963) b!776122))

(assert (= (and b!776122 res!524948) b!776113))

(assert (= (and b!776113 res!524961) b!776115))

(assert (= (and b!776115 res!524949) b!776119))

(assert (= (and b!776119 c!85981) b!776124))

(assert (= (and b!776119 (not c!85981)) b!776125))

(assert (= (and b!776119 res!524956) b!776110))

(assert (= (and b!776110 res!524960) b!776111))

(assert (= (and b!776111 res!524952) b!776112))

(assert (= (and b!776112 res!524959) b!776117))

(assert (= (and b!776111 (not res!524950)) b!776114))

(declare-fun m!720239 () Bool)

(assert (=> b!776124 m!720239))

(assert (=> b!776124 m!720239))

(declare-fun m!720241 () Bool)

(assert (=> b!776124 m!720241))

(declare-fun m!720243 () Bool)

(assert (=> b!776118 m!720243))

(declare-fun m!720245 () Bool)

(assert (=> b!776126 m!720245))

(assert (=> b!776113 m!720239))

(assert (=> b!776113 m!720239))

(declare-fun m!720247 () Bool)

(assert (=> b!776113 m!720247))

(assert (=> b!776113 m!720247))

(assert (=> b!776113 m!720239))

(declare-fun m!720249 () Bool)

(assert (=> b!776113 m!720249))

(declare-fun m!720251 () Bool)

(assert (=> b!776115 m!720251))

(declare-fun m!720253 () Bool)

(assert (=> start!67152 m!720253))

(declare-fun m!720255 () Bool)

(assert (=> start!67152 m!720255))

(assert (=> b!776117 m!720239))

(assert (=> b!776117 m!720239))

(declare-fun m!720257 () Bool)

(assert (=> b!776117 m!720257))

(declare-fun m!720259 () Bool)

(assert (=> b!776120 m!720259))

(assert (=> b!776125 m!720239))

(assert (=> b!776125 m!720239))

(declare-fun m!720261 () Bool)

(assert (=> b!776125 m!720261))

(declare-fun m!720263 () Bool)

(assert (=> b!776116 m!720263))

(declare-fun m!720265 () Bool)

(assert (=> b!776123 m!720265))

(assert (=> b!776112 m!720239))

(assert (=> b!776112 m!720239))

(declare-fun m!720267 () Bool)

(assert (=> b!776112 m!720267))

(declare-fun m!720269 () Bool)

(assert (=> b!776111 m!720269))

(declare-fun m!720271 () Bool)

(assert (=> b!776111 m!720271))

(assert (=> b!776114 m!720239))

(assert (=> b!776114 m!720239))

(assert (=> b!776114 m!720261))

(assert (=> b!776127 m!720239))

(assert (=> b!776127 m!720239))

(declare-fun m!720273 () Bool)

(assert (=> b!776127 m!720273))

(declare-fun m!720275 () Bool)

(assert (=> b!776110 m!720275))

(declare-fun m!720277 () Bool)

(assert (=> b!776110 m!720277))

(declare-fun m!720279 () Bool)

(assert (=> b!776110 m!720279))

(declare-fun m!720281 () Bool)

(assert (=> b!776110 m!720281))

(assert (=> b!776110 m!720275))

(declare-fun m!720283 () Bool)

(assert (=> b!776110 m!720283))

(push 1)

