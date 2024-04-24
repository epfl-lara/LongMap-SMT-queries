; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67480 () Bool)

(assert start!67480)

(declare-fun b!779821 () Bool)

(declare-fun e!433896 () Bool)

(declare-fun e!433894 () Bool)

(assert (=> b!779821 (= e!433896 e!433894)))

(declare-fun res!527441 () Bool)

(assert (=> b!779821 (=> (not res!527441) (not e!433894))))

(declare-datatypes ((SeekEntryResult!7939 0))(
  ( (MissingZero!7939 (index!34124 (_ BitVec 32))) (Found!7939 (index!34125 (_ BitVec 32))) (Intermediate!7939 (undefined!8751 Bool) (index!34126 (_ BitVec 32)) (x!65231 (_ BitVec 32))) (Undefined!7939) (MissingVacant!7939 (index!34127 (_ BitVec 32))) )
))
(declare-fun lt!347436 () SeekEntryResult!7939)

(declare-fun lt!347434 () SeekEntryResult!7939)

(assert (=> b!779821 (= res!527441 (= lt!347436 lt!347434))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42589 0))(
  ( (array!42590 (arr!20383 (Array (_ BitVec 32) (_ BitVec 64))) (size!20803 (_ BitVec 32))) )
))
(declare-fun lt!347435 () array!42589)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347429 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42589 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!779821 (= lt!347434 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347429 lt!347435 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779821 (= lt!347436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347429 mask!3328) lt!347429 lt!347435 mask!3328))))

(declare-fun a!3186 () array!42589)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!779821 (= lt!347429 (select (store (arr!20383 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779821 (= lt!347435 (array!42590 (store (arr!20383 a!3186) i!1173 k0!2102) (size!20803 a!3186)))))

(declare-fun b!779822 () Bool)

(declare-fun e!433898 () Bool)

(declare-fun e!433900 () Bool)

(assert (=> b!779822 (= e!433898 e!433900)))

(declare-fun res!527445 () Bool)

(assert (=> b!779822 (=> (not res!527445) (not e!433900))))

(declare-fun lt!347431 () SeekEntryResult!7939)

(assert (=> b!779822 (= res!527445 (or (= lt!347431 (MissingZero!7939 i!1173)) (= lt!347431 (MissingVacant!7939 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42589 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!779822 (= lt!347431 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!527448 () Bool)

(assert (=> start!67480 (=> (not res!527448) (not e!433898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67480 (= res!527448 (validMask!0 mask!3328))))

(assert (=> start!67480 e!433898))

(assert (=> start!67480 true))

(declare-fun array_inv!16242 (array!42589) Bool)

(assert (=> start!67480 (array_inv!16242 a!3186)))

(declare-fun b!779823 () Bool)

(declare-fun res!527436 () Bool)

(assert (=> b!779823 (=> (not res!527436) (not e!433896))))

(declare-fun e!433893 () Bool)

(assert (=> b!779823 (= res!527436 e!433893)))

(declare-fun c!86600 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779823 (= c!86600 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779824 () Bool)

(declare-fun res!527437 () Bool)

(assert (=> b!779824 (=> (not res!527437) (not e!433898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779824 (= res!527437 (validKeyInArray!0 k0!2102))))

(declare-fun b!779825 () Bool)

(declare-fun res!527435 () Bool)

(assert (=> b!779825 (=> (not res!527435) (not e!433898))))

(assert (=> b!779825 (= res!527435 (validKeyInArray!0 (select (arr!20383 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!779826 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42589 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!779826 (= e!433893 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) (Found!7939 j!159)))))

(declare-fun b!779827 () Bool)

(declare-fun res!527439 () Bool)

(assert (=> b!779827 (=> (not res!527439) (not e!433900))))

(assert (=> b!779827 (= res!527439 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20803 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20803 a!3186))))))

(declare-fun b!779828 () Bool)

(assert (=> b!779828 (= e!433900 e!433896)))

(declare-fun res!527438 () Bool)

(assert (=> b!779828 (=> (not res!527438) (not e!433896))))

(declare-fun lt!347437 () SeekEntryResult!7939)

(assert (=> b!779828 (= res!527438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20383 a!3186) j!159) mask!3328) (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347437))))

(assert (=> b!779828 (= lt!347437 (Intermediate!7939 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779829 () Bool)

(declare-fun e!433899 () Bool)

(assert (=> b!779829 (= e!433899 true)))

(declare-fun lt!347430 () SeekEntryResult!7939)

(assert (=> b!779829 (= lt!347430 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20383 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779830 () Bool)

(assert (=> b!779830 (= e!433894 (not e!433899))))

(declare-fun res!527440 () Bool)

(assert (=> b!779830 (=> res!527440 e!433899)))

(get-info :version)

(assert (=> b!779830 (= res!527440 (or (not ((_ is Intermediate!7939) lt!347434)) (bvslt x!1131 (x!65231 lt!347434)) (not (= x!1131 (x!65231 lt!347434))) (not (= index!1321 (index!34126 lt!347434)))))))

(declare-fun e!433892 () Bool)

(assert (=> b!779830 e!433892))

(declare-fun res!527447 () Bool)

(assert (=> b!779830 (=> (not res!527447) (not e!433892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42589 (_ BitVec 32)) Bool)

(assert (=> b!779830 (= res!527447 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26851 0))(
  ( (Unit!26852) )
))
(declare-fun lt!347433 () Unit!26851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26851)

(assert (=> b!779830 (= lt!347433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!347432 () SeekEntryResult!7939)

(declare-fun e!433897 () Bool)

(declare-fun b!779831 () Bool)

(assert (=> b!779831 (= e!433897 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347432))))

(declare-fun b!779832 () Bool)

(declare-fun res!527444 () Bool)

(assert (=> b!779832 (=> (not res!527444) (not e!433898))))

(declare-fun arrayContainsKey!0 (array!42589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779832 (= res!527444 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779833 () Bool)

(assert (=> b!779833 (= e!433893 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347437))))

(declare-fun b!779834 () Bool)

(declare-fun res!527434 () Bool)

(assert (=> b!779834 (=> (not res!527434) (not e!433900))))

(assert (=> b!779834 (= res!527434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779835 () Bool)

(declare-fun res!527443 () Bool)

(assert (=> b!779835 (=> (not res!527443) (not e!433898))))

(assert (=> b!779835 (= res!527443 (and (= (size!20803 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20803 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20803 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779836 () Bool)

(declare-fun res!527433 () Bool)

(assert (=> b!779836 (=> (not res!527433) (not e!433896))))

(assert (=> b!779836 (= res!527433 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20383 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779837 () Bool)

(declare-fun res!527442 () Bool)

(assert (=> b!779837 (=> (not res!527442) (not e!433900))))

(declare-datatypes ((List!14292 0))(
  ( (Nil!14289) (Cons!14288 (h!15408 (_ BitVec 64)) (t!20599 List!14292)) )
))
(declare-fun arrayNoDuplicates!0 (array!42589 (_ BitVec 32) List!14292) Bool)

(assert (=> b!779837 (= res!527442 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14289))))

(declare-fun b!779838 () Bool)

(assert (=> b!779838 (= e!433892 e!433897)))

(declare-fun res!527446 () Bool)

(assert (=> b!779838 (=> (not res!527446) (not e!433897))))

(assert (=> b!779838 (= res!527446 (= (seekEntryOrOpen!0 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347432))))

(assert (=> b!779838 (= lt!347432 (Found!7939 j!159))))

(assert (= (and start!67480 res!527448) b!779835))

(assert (= (and b!779835 res!527443) b!779825))

(assert (= (and b!779825 res!527435) b!779824))

(assert (= (and b!779824 res!527437) b!779832))

(assert (= (and b!779832 res!527444) b!779822))

(assert (= (and b!779822 res!527445) b!779834))

(assert (= (and b!779834 res!527434) b!779837))

(assert (= (and b!779837 res!527442) b!779827))

(assert (= (and b!779827 res!527439) b!779828))

(assert (= (and b!779828 res!527438) b!779836))

(assert (= (and b!779836 res!527433) b!779823))

(assert (= (and b!779823 c!86600) b!779833))

(assert (= (and b!779823 (not c!86600)) b!779826))

(assert (= (and b!779823 res!527436) b!779821))

(assert (= (and b!779821 res!527441) b!779830))

(assert (= (and b!779830 res!527447) b!779838))

(assert (= (and b!779838 res!527446) b!779831))

(assert (= (and b!779830 (not res!527440)) b!779829))

(declare-fun m!723779 () Bool)

(assert (=> b!779826 m!723779))

(assert (=> b!779826 m!723779))

(declare-fun m!723781 () Bool)

(assert (=> b!779826 m!723781))

(assert (=> b!779828 m!723779))

(assert (=> b!779828 m!723779))

(declare-fun m!723783 () Bool)

(assert (=> b!779828 m!723783))

(assert (=> b!779828 m!723783))

(assert (=> b!779828 m!723779))

(declare-fun m!723785 () Bool)

(assert (=> b!779828 m!723785))

(declare-fun m!723787 () Bool)

(assert (=> b!779832 m!723787))

(declare-fun m!723789 () Bool)

(assert (=> start!67480 m!723789))

(declare-fun m!723791 () Bool)

(assert (=> start!67480 m!723791))

(declare-fun m!723793 () Bool)

(assert (=> b!779824 m!723793))

(declare-fun m!723795 () Bool)

(assert (=> b!779836 m!723795))

(assert (=> b!779831 m!723779))

(assert (=> b!779831 m!723779))

(declare-fun m!723797 () Bool)

(assert (=> b!779831 m!723797))

(assert (=> b!779829 m!723779))

(assert (=> b!779829 m!723779))

(assert (=> b!779829 m!723781))

(assert (=> b!779833 m!723779))

(assert (=> b!779833 m!723779))

(declare-fun m!723799 () Bool)

(assert (=> b!779833 m!723799))

(assert (=> b!779838 m!723779))

(assert (=> b!779838 m!723779))

(declare-fun m!723801 () Bool)

(assert (=> b!779838 m!723801))

(declare-fun m!723803 () Bool)

(assert (=> b!779830 m!723803))

(declare-fun m!723805 () Bool)

(assert (=> b!779830 m!723805))

(declare-fun m!723807 () Bool)

(assert (=> b!779822 m!723807))

(assert (=> b!779825 m!723779))

(assert (=> b!779825 m!723779))

(declare-fun m!723809 () Bool)

(assert (=> b!779825 m!723809))

(declare-fun m!723811 () Bool)

(assert (=> b!779821 m!723811))

(assert (=> b!779821 m!723811))

(declare-fun m!723813 () Bool)

(assert (=> b!779821 m!723813))

(declare-fun m!723815 () Bool)

(assert (=> b!779821 m!723815))

(declare-fun m!723817 () Bool)

(assert (=> b!779821 m!723817))

(declare-fun m!723819 () Bool)

(assert (=> b!779821 m!723819))

(declare-fun m!723821 () Bool)

(assert (=> b!779837 m!723821))

(declare-fun m!723823 () Bool)

(assert (=> b!779834 m!723823))

(check-sat (not b!779833) (not b!779830) (not b!779831) (not b!779826) (not b!779824) (not b!779832) (not b!779834) (not b!779825) (not b!779821) (not b!779822) (not b!779837) (not b!779828) (not start!67480) (not b!779838) (not b!779829))
(check-sat)
