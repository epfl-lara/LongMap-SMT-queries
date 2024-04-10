; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67384 () Bool)

(assert start!67384)

(declare-fun b!779761 () Bool)

(declare-fun e!433766 () Bool)

(declare-datatypes ((SeekEntryResult!7999 0))(
  ( (MissingZero!7999 (index!34364 (_ BitVec 32))) (Found!7999 (index!34365 (_ BitVec 32))) (Intermediate!7999 (undefined!8811 Bool) (index!34366 (_ BitVec 32)) (x!65304 (_ BitVec 32))) (Undefined!7999) (MissingVacant!7999 (index!34367 (_ BitVec 32))) )
))
(declare-fun lt!347480 () SeekEntryResult!7999)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!779761 (= e!433766 (= lt!347480 (MissingVacant!7999 resIntermediateIndex!5)))))

(declare-fun lt!347482 () SeekEntryResult!7999)

(assert (=> b!779761 (= lt!347482 lt!347480)))

(declare-fun b!779762 () Bool)

(declare-fun e!433765 () Bool)

(declare-fun e!433764 () Bool)

(assert (=> b!779762 (= e!433765 (not e!433764))))

(declare-fun res!527692 () Bool)

(assert (=> b!779762 (=> res!527692 e!433764)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347483 () SeekEntryResult!7999)

(assert (=> b!779762 (= res!527692 (or (not (is-Intermediate!7999 lt!347483)) (bvslt x!1131 (x!65304 lt!347483)) (not (= x!1131 (x!65304 lt!347483))) (not (= index!1321 (index!34366 lt!347483)))))))

(declare-fun e!433770 () Bool)

(assert (=> b!779762 e!433770))

(declare-fun res!527689 () Bool)

(assert (=> b!779762 (=> (not res!527689) (not e!433770))))

(declare-fun lt!347484 () SeekEntryResult!7999)

(assert (=> b!779762 (= res!527689 (= lt!347482 lt!347484))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!779762 (= lt!347484 (Found!7999 j!159))))

(declare-datatypes ((array!42613 0))(
  ( (array!42614 (arr!20399 (Array (_ BitVec 32) (_ BitVec 64))) (size!20820 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42613)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42613 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!779762 (= lt!347482 (seekEntryOrOpen!0 (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42613 (_ BitVec 32)) Bool)

(assert (=> b!779762 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26892 0))(
  ( (Unit!26893) )
))
(declare-fun lt!347485 () Unit!26892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26892)

(assert (=> b!779762 (= lt!347485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779763 () Bool)

(declare-fun e!433771 () Bool)

(assert (=> b!779763 (= e!433771 e!433765)))

(declare-fun res!527691 () Bool)

(assert (=> b!779763 (=> (not res!527691) (not e!433765))))

(declare-fun lt!347481 () SeekEntryResult!7999)

(assert (=> b!779763 (= res!527691 (= lt!347481 lt!347483))))

(declare-fun lt!347486 () (_ BitVec 64))

(declare-fun lt!347488 () array!42613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42613 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!779763 (= lt!347483 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347486 lt!347488 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779763 (= lt!347481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347486 mask!3328) lt!347486 lt!347488 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!779763 (= lt!347486 (select (store (arr!20399 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779763 (= lt!347488 (array!42614 (store (arr!20399 a!3186) i!1173 k!2102) (size!20820 a!3186)))))

(declare-fun b!779764 () Bool)

(assert (=> b!779764 (= e!433764 e!433766)))

(declare-fun res!527686 () Bool)

(assert (=> b!779764 (=> res!527686 e!433766)))

(assert (=> b!779764 (= res!527686 (or (not (= lt!347480 lt!347484)) (= (select (store (arr!20399 a!3186) i!1173 k!2102) index!1321) lt!347486) (not (= (select (store (arr!20399 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42613 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!779764 (= lt!347480 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779765 () Bool)

(declare-fun res!527684 () Bool)

(declare-fun e!433768 () Bool)

(assert (=> b!779765 (=> (not res!527684) (not e!433768))))

(declare-datatypes ((List!14401 0))(
  ( (Nil!14398) (Cons!14397 (h!15511 (_ BitVec 64)) (t!20716 List!14401)) )
))
(declare-fun arrayNoDuplicates!0 (array!42613 (_ BitVec 32) List!14401) Bool)

(assert (=> b!779765 (= res!527684 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14398))))

(declare-fun e!433772 () Bool)

(declare-fun b!779766 () Bool)

(declare-fun lt!347487 () SeekEntryResult!7999)

(assert (=> b!779766 (= e!433772 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347487))))

(declare-fun b!779767 () Bool)

(declare-fun res!527694 () Bool)

(assert (=> b!779767 (=> (not res!527694) (not e!433768))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779767 (= res!527694 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20820 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20820 a!3186))))))

(declare-fun b!779768 () Bool)

(assert (=> b!779768 (= e!433772 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) (Found!7999 j!159)))))

(declare-fun b!779769 () Bool)

(declare-fun res!527683 () Bool)

(declare-fun e!433769 () Bool)

(assert (=> b!779769 (=> (not res!527683) (not e!433769))))

(assert (=> b!779769 (= res!527683 (and (= (size!20820 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20820 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20820 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779770 () Bool)

(declare-fun res!527693 () Bool)

(assert (=> b!779770 (=> (not res!527693) (not e!433769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779770 (= res!527693 (validKeyInArray!0 k!2102))))

(declare-fun b!779771 () Bool)

(assert (=> b!779771 (= e!433770 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347484))))

(declare-fun b!779772 () Bool)

(assert (=> b!779772 (= e!433769 e!433768)))

(declare-fun res!527695 () Bool)

(assert (=> b!779772 (=> (not res!527695) (not e!433768))))

(declare-fun lt!347489 () SeekEntryResult!7999)

(assert (=> b!779772 (= res!527695 (or (= lt!347489 (MissingZero!7999 i!1173)) (= lt!347489 (MissingVacant!7999 i!1173))))))

(assert (=> b!779772 (= lt!347489 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779773 () Bool)

(declare-fun res!527687 () Bool)

(assert (=> b!779773 (=> (not res!527687) (not e!433771))))

(assert (=> b!779773 (= res!527687 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20399 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779774 () Bool)

(declare-fun res!527681 () Bool)

(assert (=> b!779774 (=> (not res!527681) (not e!433769))))

(declare-fun arrayContainsKey!0 (array!42613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779774 (= res!527681 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779775 () Bool)

(declare-fun res!527682 () Bool)

(assert (=> b!779775 (=> (not res!527682) (not e!433769))))

(assert (=> b!779775 (= res!527682 (validKeyInArray!0 (select (arr!20399 a!3186) j!159)))))

(declare-fun b!779776 () Bool)

(declare-fun res!527685 () Bool)

(assert (=> b!779776 (=> (not res!527685) (not e!433771))))

(assert (=> b!779776 (= res!527685 e!433772)))

(declare-fun c!86443 () Bool)

(assert (=> b!779776 (= c!86443 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!527690 () Bool)

(assert (=> start!67384 (=> (not res!527690) (not e!433769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67384 (= res!527690 (validMask!0 mask!3328))))

(assert (=> start!67384 e!433769))

(assert (=> start!67384 true))

(declare-fun array_inv!16195 (array!42613) Bool)

(assert (=> start!67384 (array_inv!16195 a!3186)))

(declare-fun b!779777 () Bool)

(declare-fun res!527696 () Bool)

(assert (=> b!779777 (=> (not res!527696) (not e!433768))))

(assert (=> b!779777 (= res!527696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779778 () Bool)

(assert (=> b!779778 (= e!433768 e!433771)))

(declare-fun res!527688 () Bool)

(assert (=> b!779778 (=> (not res!527688) (not e!433771))))

(assert (=> b!779778 (= res!527688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20399 a!3186) j!159) mask!3328) (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347487))))

(assert (=> b!779778 (= lt!347487 (Intermediate!7999 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67384 res!527690) b!779769))

(assert (= (and b!779769 res!527683) b!779775))

(assert (= (and b!779775 res!527682) b!779770))

(assert (= (and b!779770 res!527693) b!779774))

(assert (= (and b!779774 res!527681) b!779772))

(assert (= (and b!779772 res!527695) b!779777))

(assert (= (and b!779777 res!527696) b!779765))

(assert (= (and b!779765 res!527684) b!779767))

(assert (= (and b!779767 res!527694) b!779778))

(assert (= (and b!779778 res!527688) b!779773))

(assert (= (and b!779773 res!527687) b!779776))

(assert (= (and b!779776 c!86443) b!779766))

(assert (= (and b!779776 (not c!86443)) b!779768))

(assert (= (and b!779776 res!527685) b!779763))

(assert (= (and b!779763 res!527691) b!779762))

(assert (= (and b!779762 res!527689) b!779771))

(assert (= (and b!779762 (not res!527692)) b!779764))

(assert (= (and b!779764 (not res!527686)) b!779761))

(declare-fun m!723239 () Bool)

(assert (=> b!779775 m!723239))

(assert (=> b!779775 m!723239))

(declare-fun m!723241 () Bool)

(assert (=> b!779775 m!723241))

(declare-fun m!723243 () Bool)

(assert (=> start!67384 m!723243))

(declare-fun m!723245 () Bool)

(assert (=> start!67384 m!723245))

(assert (=> b!779778 m!723239))

(assert (=> b!779778 m!723239))

(declare-fun m!723247 () Bool)

(assert (=> b!779778 m!723247))

(assert (=> b!779778 m!723247))

(assert (=> b!779778 m!723239))

(declare-fun m!723249 () Bool)

(assert (=> b!779778 m!723249))

(declare-fun m!723251 () Bool)

(assert (=> b!779764 m!723251))

(declare-fun m!723253 () Bool)

(assert (=> b!779764 m!723253))

(assert (=> b!779764 m!723239))

(assert (=> b!779764 m!723239))

(declare-fun m!723255 () Bool)

(assert (=> b!779764 m!723255))

(assert (=> b!779771 m!723239))

(assert (=> b!779771 m!723239))

(declare-fun m!723257 () Bool)

(assert (=> b!779771 m!723257))

(declare-fun m!723259 () Bool)

(assert (=> b!779772 m!723259))

(assert (=> b!779762 m!723239))

(assert (=> b!779762 m!723239))

(declare-fun m!723261 () Bool)

(assert (=> b!779762 m!723261))

(declare-fun m!723263 () Bool)

(assert (=> b!779762 m!723263))

(declare-fun m!723265 () Bool)

(assert (=> b!779762 m!723265))

(assert (=> b!779766 m!723239))

(assert (=> b!779766 m!723239))

(declare-fun m!723267 () Bool)

(assert (=> b!779766 m!723267))

(assert (=> b!779768 m!723239))

(assert (=> b!779768 m!723239))

(assert (=> b!779768 m!723255))

(declare-fun m!723269 () Bool)

(assert (=> b!779773 m!723269))

(declare-fun m!723271 () Bool)

(assert (=> b!779774 m!723271))

(declare-fun m!723273 () Bool)

(assert (=> b!779763 m!723273))

(declare-fun m!723275 () Bool)

(assert (=> b!779763 m!723275))

(assert (=> b!779763 m!723251))

(declare-fun m!723277 () Bool)

(assert (=> b!779763 m!723277))

(declare-fun m!723279 () Bool)

(assert (=> b!779763 m!723279))

(assert (=> b!779763 m!723273))

(declare-fun m!723281 () Bool)

(assert (=> b!779770 m!723281))

(declare-fun m!723283 () Bool)

(assert (=> b!779777 m!723283))

(declare-fun m!723285 () Bool)

(assert (=> b!779765 m!723285))

(push 1)

(assert (not b!779764))

(assert (not b!779777))

(assert (not b!779763))

(assert (not b!779770))

(assert (not b!779772))

(assert (not b!779771))

(assert (not b!779765))

(assert (not b!779766))

(assert (not b!779778))

(assert (not b!779775))

(assert (not b!779768))

(assert (not start!67384))

(assert (not b!779762))

(assert (not b!779774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102409 () Bool)

(declare-fun e!433829 () Bool)

(assert (=> d!102409 e!433829))

(declare-fun c!86474 () Bool)

(declare-fun lt!347517 () SeekEntryResult!7999)

(assert (=> d!102409 (= c!86474 (and (is-Intermediate!7999 lt!347517) (undefined!8811 lt!347517)))))

(declare-fun e!433830 () SeekEntryResult!7999)

(assert (=> d!102409 (= lt!347517 e!433830)))

(declare-fun c!86476 () Bool)

(assert (=> d!102409 (= c!86476 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347516 () (_ BitVec 64))

(assert (=> d!102409 (= lt!347516 (select (arr!20399 a!3186) index!1321))))

(assert (=> d!102409 (validMask!0 mask!3328)))

(assert (=> d!102409 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347517)))

(declare-fun b!779875 () Bool)

(assert (=> b!779875 (and (bvsge (index!34366 lt!347517) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347517) (size!20820 a!3186)))))

(declare-fun e!433831 () Bool)

(assert (=> b!779875 (= e!433831 (= (select (arr!20399 a!3186) (index!34366 lt!347517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433832 () SeekEntryResult!7999)

(declare-fun b!779876 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779876 (= e!433832 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779877 () Bool)

(assert (=> b!779877 (= e!433829 (bvsge (x!65304 lt!347517) #b01111111111111111111111111111110))))

(declare-fun b!779878 () Bool)

(assert (=> b!779878 (= e!433830 (Intermediate!7999 true index!1321 x!1131))))

(declare-fun b!779879 () Bool)

(assert (=> b!779879 (= e!433830 e!433832)))

(declare-fun c!86475 () Bool)

(assert (=> b!779879 (= c!86475 (or (= lt!347516 (select (arr!20399 a!3186) j!159)) (= (bvadd lt!347516 lt!347516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779880 () Bool)

(declare-fun e!433833 () Bool)

(assert (=> b!779880 (= e!433829 e!433833)))

(declare-fun res!527734 () Bool)

(assert (=> b!779880 (= res!527734 (and (is-Intermediate!7999 lt!347517) (not (undefined!8811 lt!347517)) (bvslt (x!65304 lt!347517) #b01111111111111111111111111111110) (bvsge (x!65304 lt!347517) #b00000000000000000000000000000000) (bvsge (x!65304 lt!347517) x!1131)))))

(assert (=> b!779880 (=> (not res!527734) (not e!433833))))

(declare-fun b!779881 () Bool)

(assert (=> b!779881 (and (bvsge (index!34366 lt!347517) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347517) (size!20820 a!3186)))))

(declare-fun res!527736 () Bool)

(assert (=> b!779881 (= res!527736 (= (select (arr!20399 a!3186) (index!34366 lt!347517)) (select (arr!20399 a!3186) j!159)))))

(assert (=> b!779881 (=> res!527736 e!433831)))

(assert (=> b!779881 (= e!433833 e!433831)))

(declare-fun b!779882 () Bool)

(assert (=> b!779882 (= e!433832 (Intermediate!7999 false index!1321 x!1131))))

(declare-fun b!779883 () Bool)

(assert (=> b!779883 (and (bvsge (index!34366 lt!347517) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347517) (size!20820 a!3186)))))

(declare-fun res!527735 () Bool)

(assert (=> b!779883 (= res!527735 (= (select (arr!20399 a!3186) (index!34366 lt!347517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779883 (=> res!527735 e!433831)))

(assert (= (and d!102409 c!86476) b!779878))

(assert (= (and d!102409 (not c!86476)) b!779879))

(assert (= (and b!779879 c!86475) b!779882))

(assert (= (and b!779879 (not c!86475)) b!779876))

(assert (= (and d!102409 c!86474) b!779877))

(assert (= (and d!102409 (not c!86474)) b!779880))

(assert (= (and b!779880 res!527734) b!779881))

(assert (= (and b!779881 (not res!527736)) b!779883))

(assert (= (and b!779883 (not res!527735)) b!779875))

(declare-fun m!723321 () Bool)

(assert (=> d!102409 m!723321))

(assert (=> d!102409 m!723243))

(declare-fun m!723323 () Bool)

(assert (=> b!779883 m!723323))

(assert (=> b!779881 m!723323))

(assert (=> b!779875 m!723323))

(declare-fun m!723325 () Bool)

(assert (=> b!779876 m!723325))

(assert (=> b!779876 m!723325))

(assert (=> b!779876 m!723239))

(declare-fun m!723327 () Bool)

(assert (=> b!779876 m!723327))

(assert (=> b!779766 d!102409))

(declare-fun d!102425 () Bool)

(declare-fun res!527741 () Bool)

(declare-fun e!433852 () Bool)

(assert (=> d!102425 (=> res!527741 e!433852)))

(assert (=> d!102425 (= res!527741 (bvsge #b00000000000000000000000000000000 (size!20820 a!3186)))))

(assert (=> d!102425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!433852)))

(declare-fun b!779916 () Bool)

(declare-fun e!433854 () Bool)

(assert (=> b!779916 (= e!433852 e!433854)))

(declare-fun c!86491 () Bool)

(assert (=> b!779916 (= c!86491 (validKeyInArray!0 (select (arr!20399 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35214 () Bool)

(declare-fun call!35217 () Bool)

(assert (=> bm!35214 (= call!35217 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!779917 () Bool)

(declare-fun e!433853 () Bool)

(assert (=> b!779917 (= e!433854 e!433853)))

(declare-fun lt!347533 () (_ BitVec 64))

(assert (=> b!779917 (= lt!347533 (select (arr!20399 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!347532 () Unit!26892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42613 (_ BitVec 64) (_ BitVec 32)) Unit!26892)

(assert (=> b!779917 (= lt!347532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347533 #b00000000000000000000000000000000))))

(assert (=> b!779917 (arrayContainsKey!0 a!3186 lt!347533 #b00000000000000000000000000000000)))

(declare-fun lt!347534 () Unit!26892)

(assert (=> b!779917 (= lt!347534 lt!347532)))

(declare-fun res!527742 () Bool)

(assert (=> b!779917 (= res!527742 (= (seekEntryOrOpen!0 (select (arr!20399 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7999 #b00000000000000000000000000000000)))))

(assert (=> b!779917 (=> (not res!527742) (not e!433853))))

(declare-fun b!779918 () Bool)

(assert (=> b!779918 (= e!433853 call!35217)))

(declare-fun b!779919 () Bool)

(assert (=> b!779919 (= e!433854 call!35217)))

(assert (= (and d!102425 (not res!527741)) b!779916))

(assert (= (and b!779916 c!86491) b!779917))

(assert (= (and b!779916 (not c!86491)) b!779919))

(assert (= (and b!779917 res!527742) b!779918))

(assert (= (or b!779918 b!779919) bm!35214))

(declare-fun m!723329 () Bool)

(assert (=> b!779916 m!723329))

(assert (=> b!779916 m!723329))

(declare-fun m!723331 () Bool)

(assert (=> b!779916 m!723331))

(declare-fun m!723333 () Bool)

(assert (=> bm!35214 m!723333))

(assert (=> b!779917 m!723329))

(declare-fun m!723335 () Bool)

(assert (=> b!779917 m!723335))

(declare-fun m!723337 () Bool)

(assert (=> b!779917 m!723337))

(assert (=> b!779917 m!723329))

(declare-fun m!723339 () Bool)

(assert (=> b!779917 m!723339))

(assert (=> b!779777 d!102425))

(declare-fun d!102427 () Bool)

(assert (=> d!102427 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67384 d!102427))

(declare-fun d!102435 () Bool)

(assert (=> d!102435 (= (array_inv!16195 a!3186) (bvsge (size!20820 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67384 d!102435))

(declare-fun b!779960 () Bool)

(declare-fun e!433880 () Bool)

(declare-fun call!35220 () Bool)

(assert (=> b!779960 (= e!433880 call!35220)))

(declare-fun bm!35217 () Bool)

(declare-fun c!86509 () Bool)

(assert (=> bm!35217 (= call!35220 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86509 (Cons!14397 (select (arr!20399 a!3186) #b00000000000000000000000000000000) Nil!14398) Nil!14398)))))

(declare-fun b!779961 () Bool)

(declare-fun e!433881 () Bool)

(declare-fun contains!4102 (List!14401 (_ BitVec 64)) Bool)

(assert (=> b!779961 (= e!433881 (contains!4102 Nil!14398 (select (arr!20399 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!779962 () Bool)

(assert (=> b!779962 (= e!433880 call!35220)))

(declare-fun b!779963 () Bool)

(declare-fun e!433878 () Bool)

(declare-fun e!433879 () Bool)

(assert (=> b!779963 (= e!433878 e!433879)))

(declare-fun res!527750 () Bool)

(assert (=> b!779963 (=> (not res!527750) (not e!433879))))

(assert (=> b!779963 (= res!527750 (not e!433881))))

(declare-fun res!527751 () Bool)

(assert (=> b!779963 (=> (not res!527751) (not e!433881))))

(assert (=> b!779963 (= res!527751 (validKeyInArray!0 (select (arr!20399 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!779964 () Bool)

(assert (=> b!779964 (= e!433879 e!433880)))

(assert (=> b!779964 (= c!86509 (validKeyInArray!0 (select (arr!20399 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102437 () Bool)

(declare-fun res!527749 () Bool)

(assert (=> d!102437 (=> res!527749 e!433878)))

(assert (=> d!102437 (= res!527749 (bvsge #b00000000000000000000000000000000 (size!20820 a!3186)))))

(assert (=> d!102437 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14398) e!433878)))

(assert (= (and d!102437 (not res!527749)) b!779963))

(assert (= (and b!779963 res!527751) b!779961))

(assert (= (and b!779963 res!527750) b!779964))

(assert (= (and b!779964 c!86509) b!779960))

(assert (= (and b!779964 (not c!86509)) b!779962))

(assert (= (or b!779960 b!779962) bm!35217))

(assert (=> bm!35217 m!723329))

(declare-fun m!723363 () Bool)

(assert (=> bm!35217 m!723363))

(assert (=> b!779961 m!723329))

(assert (=> b!779961 m!723329))

(declare-fun m!723365 () Bool)

(assert (=> b!779961 m!723365))

(assert (=> b!779963 m!723329))

(assert (=> b!779963 m!723329))

(assert (=> b!779963 m!723331))

(assert (=> b!779964 m!723329))

(assert (=> b!779964 m!723329))

(assert (=> b!779964 m!723331))

(assert (=> b!779765 d!102437))

(declare-fun b!780027 () Bool)

(declare-fun e!433919 () SeekEntryResult!7999)

(assert (=> b!780027 (= e!433919 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780029 () Bool)

(declare-fun e!433918 () SeekEntryResult!7999)

(declare-fun e!433920 () SeekEntryResult!7999)

(assert (=> b!780029 (= e!433918 e!433920)))

(declare-fun lt!347582 () (_ BitVec 64))

(declare-fun c!86538 () Bool)

(assert (=> b!780029 (= c!86538 (= lt!347582 (select (arr!20399 a!3186) j!159)))))

(declare-fun b!780030 () Bool)

(assert (=> b!780030 (= e!433919 (MissingVacant!7999 resIntermediateIndex!5))))

(declare-fun lt!347581 () SeekEntryResult!7999)

(declare-fun d!102439 () Bool)

(assert (=> d!102439 (and (or (is-Undefined!7999 lt!347581) (not (is-Found!7999 lt!347581)) (and (bvsge (index!34365 lt!347581) #b00000000000000000000000000000000) (bvslt (index!34365 lt!347581) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347581) (is-Found!7999 lt!347581) (not (is-MissingVacant!7999 lt!347581)) (not (= (index!34367 lt!347581) resIntermediateIndex!5)) (and (bvsge (index!34367 lt!347581) #b00000000000000000000000000000000) (bvslt (index!34367 lt!347581) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347581) (ite (is-Found!7999 lt!347581) (= (select (arr!20399 a!3186) (index!34365 lt!347581)) (select (arr!20399 a!3186) j!159)) (and (is-MissingVacant!7999 lt!347581) (= (index!34367 lt!347581) resIntermediateIndex!5) (= (select (arr!20399 a!3186) (index!34367 lt!347581)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102439 (= lt!347581 e!433918)))

(declare-fun c!86537 () Bool)

(assert (=> d!102439 (= c!86537 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102439 (= lt!347582 (select (arr!20399 a!3186) index!1321))))

(assert (=> d!102439 (validMask!0 mask!3328)))

(assert (=> d!102439 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347581)))

(declare-fun b!780028 () Bool)

(declare-fun c!86536 () Bool)

(assert (=> b!780028 (= c!86536 (= lt!347582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780028 (= e!433920 e!433919)))

(declare-fun b!780031 () Bool)

(assert (=> b!780031 (= e!433920 (Found!7999 index!1321))))

(declare-fun b!780032 () Bool)

(assert (=> b!780032 (= e!433918 Undefined!7999)))

(assert (= (and d!102439 c!86537) b!780032))

(assert (= (and d!102439 (not c!86537)) b!780029))

(assert (= (and b!780029 c!86538) b!780031))

(assert (= (and b!780029 (not c!86538)) b!780028))

(assert (= (and b!780028 c!86536) b!780030))

(assert (= (and b!780028 (not c!86536)) b!780027))

(assert (=> b!780027 m!723325))

(assert (=> b!780027 m!723325))

(assert (=> b!780027 m!723239))

(declare-fun m!723407 () Bool)

(assert (=> b!780027 m!723407))

(declare-fun m!723409 () Bool)

(assert (=> d!102439 m!723409))

(declare-fun m!723411 () Bool)

(assert (=> d!102439 m!723411))

(assert (=> d!102439 m!723321))

(assert (=> d!102439 m!723243))

(assert (=> b!779764 d!102439))

(declare-fun d!102449 () Bool)

(assert (=> d!102449 (= (validKeyInArray!0 (select (arr!20399 a!3186) j!159)) (and (not (= (select (arr!20399 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20399 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779775 d!102449))

(declare-fun d!102453 () Bool)

(declare-fun res!527770 () Bool)

(declare-fun e!433934 () Bool)

(assert (=> d!102453 (=> res!527770 e!433934)))

(assert (=> d!102453 (= res!527770 (= (select (arr!20399 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102453 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!433934)))

(declare-fun b!780051 () Bool)

(declare-fun e!433935 () Bool)

(assert (=> b!780051 (= e!433934 e!433935)))

(declare-fun res!527771 () Bool)

(assert (=> b!780051 (=> (not res!527771) (not e!433935))))

(assert (=> b!780051 (= res!527771 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20820 a!3186)))))

(declare-fun b!780052 () Bool)

(assert (=> b!780052 (= e!433935 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102453 (not res!527770)) b!780051))

(assert (= (and b!780051 res!527771) b!780052))

(assert (=> d!102453 m!723329))

(declare-fun m!723447 () Bool)

(assert (=> b!780052 m!723447))

(assert (=> b!779774 d!102453))

(declare-fun d!102461 () Bool)

(declare-fun e!433936 () Bool)

(assert (=> d!102461 e!433936))

(declare-fun c!86544 () Bool)

(declare-fun lt!347596 () SeekEntryResult!7999)

(assert (=> d!102461 (= c!86544 (and (is-Intermediate!7999 lt!347596) (undefined!8811 lt!347596)))))

(declare-fun e!433937 () SeekEntryResult!7999)

(assert (=> d!102461 (= lt!347596 e!433937)))

(declare-fun c!86546 () Bool)

(assert (=> d!102461 (= c!86546 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347595 () (_ BitVec 64))

(assert (=> d!102461 (= lt!347595 (select (arr!20399 lt!347488) index!1321))))

(assert (=> d!102461 (validMask!0 mask!3328)))

(assert (=> d!102461 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347486 lt!347488 mask!3328) lt!347596)))

(declare-fun b!780053 () Bool)

(assert (=> b!780053 (and (bvsge (index!34366 lt!347596) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347596) (size!20820 lt!347488)))))

(declare-fun e!433938 () Bool)

(assert (=> b!780053 (= e!433938 (= (select (arr!20399 lt!347488) (index!34366 lt!347596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780054 () Bool)

(declare-fun e!433939 () SeekEntryResult!7999)

(assert (=> b!780054 (= e!433939 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!347486 lt!347488 mask!3328))))

(declare-fun b!780055 () Bool)

(assert (=> b!780055 (= e!433936 (bvsge (x!65304 lt!347596) #b01111111111111111111111111111110))))

(declare-fun b!780056 () Bool)

(assert (=> b!780056 (= e!433937 (Intermediate!7999 true index!1321 x!1131))))

(declare-fun b!780057 () Bool)

(assert (=> b!780057 (= e!433937 e!433939)))

(declare-fun c!86545 () Bool)

(assert (=> b!780057 (= c!86545 (or (= lt!347595 lt!347486) (= (bvadd lt!347595 lt!347595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780058 () Bool)

(declare-fun e!433940 () Bool)

(assert (=> b!780058 (= e!433936 e!433940)))

(declare-fun res!527772 () Bool)

(assert (=> b!780058 (= res!527772 (and (is-Intermediate!7999 lt!347596) (not (undefined!8811 lt!347596)) (bvslt (x!65304 lt!347596) #b01111111111111111111111111111110) (bvsge (x!65304 lt!347596) #b00000000000000000000000000000000) (bvsge (x!65304 lt!347596) x!1131)))))

(assert (=> b!780058 (=> (not res!527772) (not e!433940))))

(declare-fun b!780059 () Bool)

(assert (=> b!780059 (and (bvsge (index!34366 lt!347596) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347596) (size!20820 lt!347488)))))

(declare-fun res!527774 () Bool)

(assert (=> b!780059 (= res!527774 (= (select (arr!20399 lt!347488) (index!34366 lt!347596)) lt!347486))))

(assert (=> b!780059 (=> res!527774 e!433938)))

(assert (=> b!780059 (= e!433940 e!433938)))

(declare-fun b!780060 () Bool)

(assert (=> b!780060 (= e!433939 (Intermediate!7999 false index!1321 x!1131))))

(declare-fun b!780061 () Bool)

(assert (=> b!780061 (and (bvsge (index!34366 lt!347596) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347596) (size!20820 lt!347488)))))

(declare-fun res!527773 () Bool)

(assert (=> b!780061 (= res!527773 (= (select (arr!20399 lt!347488) (index!34366 lt!347596)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780061 (=> res!527773 e!433938)))

(assert (= (and d!102461 c!86546) b!780056))

(assert (= (and d!102461 (not c!86546)) b!780057))

(assert (= (and b!780057 c!86545) b!780060))

(assert (= (and b!780057 (not c!86545)) b!780054))

(assert (= (and d!102461 c!86544) b!780055))

(assert (= (and d!102461 (not c!86544)) b!780058))

(assert (= (and b!780058 res!527772) b!780059))

(assert (= (and b!780059 (not res!527774)) b!780061))

(assert (= (and b!780061 (not res!527773)) b!780053))

(declare-fun m!723449 () Bool)

(assert (=> d!102461 m!723449))

(assert (=> d!102461 m!723243))

(declare-fun m!723451 () Bool)

(assert (=> b!780061 m!723451))

(assert (=> b!780059 m!723451))

(assert (=> b!780053 m!723451))

(assert (=> b!780054 m!723325))

(assert (=> b!780054 m!723325))

(declare-fun m!723453 () Bool)

(assert (=> b!780054 m!723453))

(assert (=> b!779763 d!102461))

(declare-fun d!102463 () Bool)

(declare-fun e!433941 () Bool)

(assert (=> d!102463 e!433941))

(declare-fun c!86547 () Bool)

(declare-fun lt!347598 () SeekEntryResult!7999)

(assert (=> d!102463 (= c!86547 (and (is-Intermediate!7999 lt!347598) (undefined!8811 lt!347598)))))

(declare-fun e!433942 () SeekEntryResult!7999)

(assert (=> d!102463 (= lt!347598 e!433942)))

(declare-fun c!86549 () Bool)

(assert (=> d!102463 (= c!86549 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347597 () (_ BitVec 64))

(assert (=> d!102463 (= lt!347597 (select (arr!20399 lt!347488) (toIndex!0 lt!347486 mask!3328)))))

(assert (=> d!102463 (validMask!0 mask!3328)))

(assert (=> d!102463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347486 mask!3328) lt!347486 lt!347488 mask!3328) lt!347598)))

(declare-fun b!780062 () Bool)

(assert (=> b!780062 (and (bvsge (index!34366 lt!347598) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347598) (size!20820 lt!347488)))))

(declare-fun e!433943 () Bool)

(assert (=> b!780062 (= e!433943 (= (select (arr!20399 lt!347488) (index!34366 lt!347598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780063 () Bool)

(declare-fun e!433944 () SeekEntryResult!7999)

(assert (=> b!780063 (= e!433944 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!347486 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!347486 lt!347488 mask!3328))))

(declare-fun b!780064 () Bool)

(assert (=> b!780064 (= e!433941 (bvsge (x!65304 lt!347598) #b01111111111111111111111111111110))))

(declare-fun b!780065 () Bool)

(assert (=> b!780065 (= e!433942 (Intermediate!7999 true (toIndex!0 lt!347486 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780066 () Bool)

(assert (=> b!780066 (= e!433942 e!433944)))

(declare-fun c!86548 () Bool)

(assert (=> b!780066 (= c!86548 (or (= lt!347597 lt!347486) (= (bvadd lt!347597 lt!347597) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780067 () Bool)

(declare-fun e!433945 () Bool)

(assert (=> b!780067 (= e!433941 e!433945)))

(declare-fun res!527775 () Bool)

(assert (=> b!780067 (= res!527775 (and (is-Intermediate!7999 lt!347598) (not (undefined!8811 lt!347598)) (bvslt (x!65304 lt!347598) #b01111111111111111111111111111110) (bvsge (x!65304 lt!347598) #b00000000000000000000000000000000) (bvsge (x!65304 lt!347598) #b00000000000000000000000000000000)))))

(assert (=> b!780067 (=> (not res!527775) (not e!433945))))

(declare-fun b!780068 () Bool)

(assert (=> b!780068 (and (bvsge (index!34366 lt!347598) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347598) (size!20820 lt!347488)))))

(declare-fun res!527777 () Bool)

(assert (=> b!780068 (= res!527777 (= (select (arr!20399 lt!347488) (index!34366 lt!347598)) lt!347486))))

(assert (=> b!780068 (=> res!527777 e!433943)))

(assert (=> b!780068 (= e!433945 e!433943)))

(declare-fun b!780069 () Bool)

(assert (=> b!780069 (= e!433944 (Intermediate!7999 false (toIndex!0 lt!347486 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780070 () Bool)

(assert (=> b!780070 (and (bvsge (index!34366 lt!347598) #b00000000000000000000000000000000) (bvslt (index!34366 lt!347598) (size!20820 lt!347488)))))

(declare-fun res!527776 () Bool)

(assert (=> b!780070 (= res!527776 (= (select (arr!20399 lt!347488) (index!34366 lt!347598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780070 (=> res!527776 e!433943)))

(assert (= (and d!102463 c!86549) b!780065))

(assert (= (and d!102463 (not c!86549)) b!780066))

(assert (= (and b!780066 c!86548) b!780069))

(assert (= (and b!780066 (not c!86548)) b!780063))

(assert (= (and d!102463 c!86547) b!780064))

(assert (= (and d!102463 (not c!86547)) b!780067))

(assert (= (and b!780067 res!527775) b!780068))

(assert (= (and b!780068 (not res!527777)) b!780070))

(assert (= (and b!780070 (not res!527776)) b!780062))

(assert (=> d!102463 m!723273))

(declare-fun m!723455 () Bool)

(assert (=> d!102463 m!723455))

(assert (=> d!102463 m!723243))

(declare-fun m!723457 () Bool)

(assert (=> b!780070 m!723457))

(assert (=> b!780068 m!723457))

(assert (=> b!780062 m!723457))

(assert (=> b!780063 m!723273))

(declare-fun m!723461 () Bool)

(assert (=> b!780063 m!723461))

(assert (=> b!780063 m!723461))

(declare-fun m!723463 () Bool)

(assert (=> b!780063 m!723463))

(assert (=> b!779763 d!102463))

(declare-fun d!102467 () Bool)

(declare-fun lt!347607 () (_ BitVec 32))

(declare-fun lt!347606 () (_ BitVec 32))

(assert (=> d!102467 (= lt!347607 (bvmul (bvxor lt!347606 (bvlshr lt!347606 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102467 (= lt!347606 ((_ extract 31 0) (bvand (bvxor lt!347486 (bvlshr lt!347486 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102467 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527784 (let ((h!15513 ((_ extract 31 0) (bvand (bvxor lt!347486 (bvlshr lt!347486 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65312 (bvmul (bvxor h!15513 (bvlshr h!15513 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65312 (bvlshr x!65312 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527784 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527784 #b00000000000000000000000000000000))))))

(assert (=> d!102467 (= (toIndex!0 lt!347486 mask!3328) (bvand (bvxor lt!347607 (bvlshr lt!347607 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!779763 d!102467))

(declare-fun b!780139 () Bool)

(declare-fun e!433993 () SeekEntryResult!7999)

(declare-fun lt!347629 () SeekEntryResult!7999)

(assert (=> b!780139 (= e!433993 (MissingZero!7999 (index!34366 lt!347629)))))

(declare-fun d!102475 () Bool)

(declare-fun lt!347631 () SeekEntryResult!7999)

(assert (=> d!102475 (and (or (is-Undefined!7999 lt!347631) (not (is-Found!7999 lt!347631)) (and (bvsge (index!34365 lt!347631) #b00000000000000000000000000000000) (bvslt (index!34365 lt!347631) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347631) (is-Found!7999 lt!347631) (not (is-MissingZero!7999 lt!347631)) (and (bvsge (index!34364 lt!347631) #b00000000000000000000000000000000) (bvslt (index!34364 lt!347631) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347631) (is-Found!7999 lt!347631) (is-MissingZero!7999 lt!347631) (not (is-MissingVacant!7999 lt!347631)) (and (bvsge (index!34367 lt!347631) #b00000000000000000000000000000000) (bvslt (index!34367 lt!347631) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347631) (ite (is-Found!7999 lt!347631) (= (select (arr!20399 a!3186) (index!34365 lt!347631)) (select (arr!20399 a!3186) j!159)) (ite (is-MissingZero!7999 lt!347631) (= (select (arr!20399 a!3186) (index!34364 lt!347631)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7999 lt!347631) (= (select (arr!20399 a!3186) (index!34367 lt!347631)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!433995 () SeekEntryResult!7999)

(assert (=> d!102475 (= lt!347631 e!433995)))

(declare-fun c!86571 () Bool)

(assert (=> d!102475 (= c!86571 (and (is-Intermediate!7999 lt!347629) (undefined!8811 lt!347629)))))

(assert (=> d!102475 (= lt!347629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20399 a!3186) j!159) mask!3328) (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102475 (validMask!0 mask!3328)))

(assert (=> d!102475 (= (seekEntryOrOpen!0 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347631)))

(declare-fun b!780140 () Bool)

(declare-fun e!433994 () SeekEntryResult!7999)

(assert (=> b!780140 (= e!433995 e!433994)))

(declare-fun lt!347630 () (_ BitVec 64))

(assert (=> b!780140 (= lt!347630 (select (arr!20399 a!3186) (index!34366 lt!347629)))))

(declare-fun c!86570 () Bool)

(assert (=> b!780140 (= c!86570 (= lt!347630 (select (arr!20399 a!3186) j!159)))))

(declare-fun b!780141 () Bool)

(assert (=> b!780141 (= e!433994 (Found!7999 (index!34366 lt!347629)))))

(declare-fun b!780142 () Bool)

(declare-fun c!86569 () Bool)

(assert (=> b!780142 (= c!86569 (= lt!347630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780142 (= e!433994 e!433993)))

(declare-fun b!780143 () Bool)

(assert (=> b!780143 (= e!433993 (seekKeyOrZeroReturnVacant!0 (x!65304 lt!347629) (index!34366 lt!347629) (index!34366 lt!347629) (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780144 () Bool)

(assert (=> b!780144 (= e!433995 Undefined!7999)))

(assert (= (and d!102475 c!86571) b!780144))

(assert (= (and d!102475 (not c!86571)) b!780140))

(assert (= (and b!780140 c!86570) b!780141))

(assert (= (and b!780140 (not c!86570)) b!780142))

(assert (= (and b!780142 c!86569) b!780139))

(assert (= (and b!780142 (not c!86569)) b!780143))

(assert (=> d!102475 m!723243))

(assert (=> d!102475 m!723239))

(assert (=> d!102475 m!723247))

(declare-fun m!723499 () Bool)

(assert (=> d!102475 m!723499))

(declare-fun m!723501 () Bool)

(assert (=> d!102475 m!723501))

(assert (=> d!102475 m!723247))

(assert (=> d!102475 m!723239))

(assert (=> d!102475 m!723249))

(declare-fun m!723503 () Bool)

(assert (=> d!102475 m!723503))

(declare-fun m!723507 () Bool)

(assert (=> b!780140 m!723507))

(assert (=> b!780143 m!723239))

(declare-fun m!723509 () Bool)

(assert (=> b!780143 m!723509))

(assert (=> b!779762 d!102475))

(declare-fun d!102495 () Bool)

(declare-fun res!527815 () Bool)

(declare-fun e!434003 () Bool)

(assert (=> d!102495 (=> res!527815 e!434003)))

(assert (=> d!102495 (= res!527815 (bvsge j!159 (size!20820 a!3186)))))

(assert (=> d!102495 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!434003)))

(declare-fun b!780156 () Bool)

(declare-fun e!434005 () Bool)

(assert (=> b!780156 (= e!434003 e!434005)))

(declare-fun c!86575 () Bool)

(assert (=> b!780156 (= c!86575 (validKeyInArray!0 (select (arr!20399 a!3186) j!159)))))

(declare-fun call!35235 () Bool)

(declare-fun bm!35232 () Bool)

(assert (=> bm!35232 (= call!35235 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780157 () Bool)

(declare-fun e!434004 () Bool)

(assert (=> b!780157 (= e!434005 e!434004)))

(declare-fun lt!347635 () (_ BitVec 64))

(assert (=> b!780157 (= lt!347635 (select (arr!20399 a!3186) j!159))))

(declare-fun lt!347634 () Unit!26892)

(assert (=> b!780157 (= lt!347634 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347635 j!159))))

(assert (=> b!780157 (arrayContainsKey!0 a!3186 lt!347635 #b00000000000000000000000000000000)))

(declare-fun lt!347636 () Unit!26892)

(assert (=> b!780157 (= lt!347636 lt!347634)))

(declare-fun res!527816 () Bool)

(assert (=> b!780157 (= res!527816 (= (seekEntryOrOpen!0 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) (Found!7999 j!159)))))

(assert (=> b!780157 (=> (not res!527816) (not e!434004))))

(declare-fun b!780158 () Bool)

(assert (=> b!780158 (= e!434004 call!35235)))

(declare-fun b!780159 () Bool)

(assert (=> b!780159 (= e!434005 call!35235)))

(assert (= (and d!102495 (not res!527815)) b!780156))

(assert (= (and b!780156 c!86575) b!780157))

(assert (= (and b!780156 (not c!86575)) b!780159))

(assert (= (and b!780157 res!527816) b!780158))

(assert (= (or b!780158 b!780159) bm!35232))

(assert (=> b!780156 m!723239))

(assert (=> b!780156 m!723239))

(assert (=> b!780156 m!723241))

(declare-fun m!723511 () Bool)

(assert (=> bm!35232 m!723511))

(assert (=> b!780157 m!723239))

(declare-fun m!723513 () Bool)

(assert (=> b!780157 m!723513))

(declare-fun m!723515 () Bool)

(assert (=> b!780157 m!723515))

(assert (=> b!780157 m!723239))

(assert (=> b!780157 m!723261))

(assert (=> b!779762 d!102495))

(declare-fun d!102497 () Bool)

(assert (=> d!102497 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347645 () Unit!26892)

(declare-fun choose!38 (array!42613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26892)

(assert (=> d!102497 (= lt!347645 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102497 (validMask!0 mask!3328)))

(assert (=> d!102497 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!347645)))

(declare-fun bs!21717 () Bool)

(assert (= bs!21717 d!102497))

(assert (=> bs!21717 m!723263))

(declare-fun m!723537 () Bool)

(assert (=> bs!21717 m!723537))

(assert (=> bs!21717 m!723243))

(assert (=> b!779762 d!102497))

(declare-fun b!780175 () Bool)

(declare-fun e!434014 () SeekEntryResult!7999)

(declare-fun lt!347646 () SeekEntryResult!7999)

(assert (=> b!780175 (= e!434014 (MissingZero!7999 (index!34366 lt!347646)))))

(declare-fun d!102505 () Bool)

(declare-fun lt!347648 () SeekEntryResult!7999)

(assert (=> d!102505 (and (or (is-Undefined!7999 lt!347648) (not (is-Found!7999 lt!347648)) (and (bvsge (index!34365 lt!347648) #b00000000000000000000000000000000) (bvslt (index!34365 lt!347648) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347648) (is-Found!7999 lt!347648) (not (is-MissingZero!7999 lt!347648)) (and (bvsge (index!34364 lt!347648) #b00000000000000000000000000000000) (bvslt (index!34364 lt!347648) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347648) (is-Found!7999 lt!347648) (is-MissingZero!7999 lt!347648) (not (is-MissingVacant!7999 lt!347648)) (and (bvsge (index!34367 lt!347648) #b00000000000000000000000000000000) (bvslt (index!34367 lt!347648) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347648) (ite (is-Found!7999 lt!347648) (= (select (arr!20399 a!3186) (index!34365 lt!347648)) k!2102) (ite (is-MissingZero!7999 lt!347648) (= (select (arr!20399 a!3186) (index!34364 lt!347648)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7999 lt!347648) (= (select (arr!20399 a!3186) (index!34367 lt!347648)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!434016 () SeekEntryResult!7999)

(assert (=> d!102505 (= lt!347648 e!434016)))

(declare-fun c!86584 () Bool)

(assert (=> d!102505 (= c!86584 (and (is-Intermediate!7999 lt!347646) (undefined!8811 lt!347646)))))

(assert (=> d!102505 (= lt!347646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102505 (validMask!0 mask!3328)))

(assert (=> d!102505 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!347648)))

(declare-fun b!780176 () Bool)

(declare-fun e!434015 () SeekEntryResult!7999)

(assert (=> b!780176 (= e!434016 e!434015)))

(declare-fun lt!347647 () (_ BitVec 64))

(assert (=> b!780176 (= lt!347647 (select (arr!20399 a!3186) (index!34366 lt!347646)))))

(declare-fun c!86583 () Bool)

(assert (=> b!780176 (= c!86583 (= lt!347647 k!2102))))

(declare-fun b!780177 () Bool)

(assert (=> b!780177 (= e!434015 (Found!7999 (index!34366 lt!347646)))))

(declare-fun b!780178 () Bool)

(declare-fun c!86582 () Bool)

(assert (=> b!780178 (= c!86582 (= lt!347647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780178 (= e!434015 e!434014)))

(declare-fun b!780179 () Bool)

(assert (=> b!780179 (= e!434014 (seekKeyOrZeroReturnVacant!0 (x!65304 lt!347646) (index!34366 lt!347646) (index!34366 lt!347646) k!2102 a!3186 mask!3328))))

(declare-fun b!780180 () Bool)

(assert (=> b!780180 (= e!434016 Undefined!7999)))

(assert (= (and d!102505 c!86584) b!780180))

(assert (= (and d!102505 (not c!86584)) b!780176))

(assert (= (and b!780176 c!86583) b!780177))

(assert (= (and b!780176 (not c!86583)) b!780178))

(assert (= (and b!780178 c!86582) b!780175))

(assert (= (and b!780178 (not c!86582)) b!780179))

(assert (=> d!102505 m!723243))

(declare-fun m!723539 () Bool)

(assert (=> d!102505 m!723539))

(declare-fun m!723541 () Bool)

(assert (=> d!102505 m!723541))

(declare-fun m!723543 () Bool)

(assert (=> d!102505 m!723543))

(assert (=> d!102505 m!723539))

(declare-fun m!723545 () Bool)

(assert (=> d!102505 m!723545))

(declare-fun m!723547 () Bool)

(assert (=> d!102505 m!723547))

(declare-fun m!723549 () Bool)

(assert (=> b!780176 m!723549))

(declare-fun m!723551 () Bool)

(assert (=> b!780179 m!723551))

(assert (=> b!779772 d!102505))

(declare-fun e!434018 () SeekEntryResult!7999)

(declare-fun b!780181 () Bool)

(assert (=> b!780181 (= e!434018 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780183 () Bool)

(declare-fun e!434017 () SeekEntryResult!7999)

(declare-fun e!434019 () SeekEntryResult!7999)

(assert (=> b!780183 (= e!434017 e!434019)))

(declare-fun c!86587 () Bool)

(declare-fun lt!347650 () (_ BitVec 64))

(assert (=> b!780183 (= c!86587 (= lt!347650 (select (arr!20399 a!3186) j!159)))))

(declare-fun b!780184 () Bool)

(assert (=> b!780184 (= e!434018 (MissingVacant!7999 resIntermediateIndex!5))))

(declare-fun lt!347649 () SeekEntryResult!7999)

(declare-fun d!102507 () Bool)

(assert (=> d!102507 (and (or (is-Undefined!7999 lt!347649) (not (is-Found!7999 lt!347649)) (and (bvsge (index!34365 lt!347649) #b00000000000000000000000000000000) (bvslt (index!34365 lt!347649) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347649) (is-Found!7999 lt!347649) (not (is-MissingVacant!7999 lt!347649)) (not (= (index!34367 lt!347649) resIntermediateIndex!5)) (and (bvsge (index!34367 lt!347649) #b00000000000000000000000000000000) (bvslt (index!34367 lt!347649) (size!20820 a!3186)))) (or (is-Undefined!7999 lt!347649) (ite (is-Found!7999 lt!347649) (= (select (arr!20399 a!3186) (index!34365 lt!347649)) (select (arr!20399 a!3186) j!159)) (and (is-MissingVacant!7999 lt!347649) (= (index!34367 lt!347649) resIntermediateIndex!5) (= (select (arr!20399 a!3186) (index!34367 lt!347649)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102507 (= lt!347649 e!434017)))

(declare-fun c!86586 () Bool)

(assert (=> d!102507 (= c!86586 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102507 (= lt!347650 (select (arr!20399 a!3186) resIntermediateIndex!5))))

(assert (=> d!102507 (validMask!0 mask!3328)))

(assert (=> d!102507 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347649)))

(declare-fun b!780182 () Bool)

(declare-fun c!86585 () Bool)

(assert (=> b!780182 (= c!86585 (= lt!347650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780182 (= e!434019 e!434018)))

(declare-fun b!780185 () Bool)

(assert (=> b!780185 (= e!434019 (Found!7999 resIntermediateIndex!5))))

(declare-fun b!780186 () Bool)

(assert (=> b!780186 (= e!434017 Undefined!7999)))

(assert (= (and d!102507 c!86586) b!780186))

(assert (= (and d!102507 (not c!86586)) b!780183))

(assert (= (and b!780183 c!86587) b!780185))

(assert (= (and b!780183 (not c!86587)) b!780182))

(assert (= (and b!780182 c!86585) b!780184))

(assert (= (and b!780182 (not c!86585)) b!780181))

(declare-fun m!723553 () Bool)

(assert (=> b!780181 m!723553))

(assert (=> b!780181 m!723553))

(assert (=> b!780181 m!723239))

(declare-fun m!723555 () Bool)

(assert (=> b!780181 m!723555))

(declare-fun m!723557 () Bool)

(assert (=> d!102507 m!723557))

(declare-fun m!723559 () Bool)

(assert (=> d!102507 m!723559))

(assert (=> d!102507 m!723269))

(assert (=> d!102507 m!723243))

(assert (=> b!779771 d!102507))

(declare-fun d!102509 () Bool)

(assert (=> d!102509 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779770 d!102509))

(assert (=> b!779768 d!102439))

(declare-fun d!102511 () Bool)

(declare-fun e!434020 () Bool)

(assert (=> d!102511 e!434020))

(declare-fun c!86588 () Bool)

(declare-fun lt!347652 () SeekEntryResult!7999)

(assert (=> d!102511 (= c!86588 (and (is-Intermediate!7999 lt!347652) (undefined!8811 lt!347652)))))

(declare-fun e!434021 () SeekEntryResult!7999)

(assert (=> d!102511 (= lt!347652 e!434021)))

(declare-fun c!86590 () Bool)

(assert (=> d!102511 (= c!86590 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347651 () (_ BitVec 64))

(assert (=> d!102511 (= lt!347651 (select (arr!20399 a!3186) (toIndex!0 (select (arr!20399 a!3186) j!159) mask!3328)))))

(assert (=> d!102511 (validMask!0 mask!3328)))

(assert (=> d!102511 (= (seekKeyOrZeroOrLongMinValue!0 