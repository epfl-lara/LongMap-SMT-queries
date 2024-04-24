; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66374 () Bool)

(assert start!66374)

(declare-datatypes ((array!42157 0))(
  ( (array!42158 (arr!20182 (Array (_ BitVec 32) (_ BitVec 64))) (size!20602 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42157)

(declare-fun b!763907 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425719 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7738 0))(
  ( (MissingZero!7738 (index!33320 (_ BitVec 32))) (Found!7738 (index!33321 (_ BitVec 32))) (Intermediate!7738 (undefined!8550 Bool) (index!33322 (_ BitVec 32)) (x!64385 (_ BitVec 32))) (Undefined!7738) (MissingVacant!7738 (index!33323 (_ BitVec 32))) )
))
(declare-fun lt!340028 () SeekEntryResult!7738)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42157 (_ BitVec 32)) SeekEntryResult!7738)

(assert (=> b!763907 (= e!425719 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20182 a!3186) j!159) a!3186 mask!3328) lt!340028)))))

(declare-fun b!763908 () Bool)

(declare-fun res!516540 () Bool)

(declare-fun e!425720 () Bool)

(assert (=> b!763908 (=> (not res!516540) (not e!425720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763908 (= res!516540 (validKeyInArray!0 (select (arr!20182 a!3186) j!159)))))

(declare-fun b!763909 () Bool)

(declare-fun e!425718 () Bool)

(assert (=> b!763909 (= e!425718 false)))

(declare-fun lt!340029 () Bool)

(assert (=> b!763909 (= lt!340029 e!425719)))

(declare-fun c!84077 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763909 (= c!84077 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763910 () Bool)

(declare-fun e!425716 () Bool)

(assert (=> b!763910 (= e!425716 e!425718)))

(declare-fun res!516542 () Bool)

(assert (=> b!763910 (=> (not res!516542) (not e!425718))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763910 (= res!516542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20182 a!3186) j!159) mask!3328) (select (arr!20182 a!3186) j!159) a!3186 mask!3328) lt!340028))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!763910 (= lt!340028 (Intermediate!7738 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763911 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42157 (_ BitVec 32)) SeekEntryResult!7738)

(assert (=> b!763911 (= e!425719 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20182 a!3186) j!159) a!3186 mask!3328) (Found!7738 j!159))))))

(declare-fun res!516532 () Bool)

(assert (=> start!66374 (=> (not res!516532) (not e!425720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66374 (= res!516532 (validMask!0 mask!3328))))

(assert (=> start!66374 e!425720))

(assert (=> start!66374 true))

(declare-fun array_inv!16041 (array!42157) Bool)

(assert (=> start!66374 (array_inv!16041 a!3186)))

(declare-fun b!763912 () Bool)

(declare-fun res!516534 () Bool)

(assert (=> b!763912 (=> (not res!516534) (not e!425720))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763912 (= res!516534 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763913 () Bool)

(declare-fun res!516537 () Bool)

(assert (=> b!763913 (=> (not res!516537) (not e!425718))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763913 (= res!516537 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20182 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763914 () Bool)

(assert (=> b!763914 (= e!425720 e!425716)))

(declare-fun res!516536 () Bool)

(assert (=> b!763914 (=> (not res!516536) (not e!425716))))

(declare-fun lt!340027 () SeekEntryResult!7738)

(assert (=> b!763914 (= res!516536 (or (= lt!340027 (MissingZero!7738 i!1173)) (= lt!340027 (MissingVacant!7738 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42157 (_ BitVec 32)) SeekEntryResult!7738)

(assert (=> b!763914 (= lt!340027 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763915 () Bool)

(declare-fun res!516535 () Bool)

(assert (=> b!763915 (=> (not res!516535) (not e!425716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42157 (_ BitVec 32)) Bool)

(assert (=> b!763915 (= res!516535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763916 () Bool)

(declare-fun res!516539 () Bool)

(assert (=> b!763916 (=> (not res!516539) (not e!425720))))

(assert (=> b!763916 (= res!516539 (and (= (size!20602 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20602 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20602 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763917 () Bool)

(declare-fun res!516533 () Bool)

(assert (=> b!763917 (=> (not res!516533) (not e!425716))))

(assert (=> b!763917 (= res!516533 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20602 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20602 a!3186))))))

(declare-fun b!763918 () Bool)

(declare-fun res!516541 () Bool)

(assert (=> b!763918 (=> (not res!516541) (not e!425720))))

(assert (=> b!763918 (= res!516541 (validKeyInArray!0 k0!2102))))

(declare-fun b!763919 () Bool)

(declare-fun res!516538 () Bool)

(assert (=> b!763919 (=> (not res!516538) (not e!425716))))

(declare-datatypes ((List!14091 0))(
  ( (Nil!14088) (Cons!14087 (h!15177 (_ BitVec 64)) (t!20398 List!14091)) )
))
(declare-fun arrayNoDuplicates!0 (array!42157 (_ BitVec 32) List!14091) Bool)

(assert (=> b!763919 (= res!516538 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14088))))

(assert (= (and start!66374 res!516532) b!763916))

(assert (= (and b!763916 res!516539) b!763908))

(assert (= (and b!763908 res!516540) b!763918))

(assert (= (and b!763918 res!516541) b!763912))

(assert (= (and b!763912 res!516534) b!763914))

(assert (= (and b!763914 res!516536) b!763915))

(assert (= (and b!763915 res!516535) b!763919))

(assert (= (and b!763919 res!516538) b!763917))

(assert (= (and b!763917 res!516533) b!763910))

(assert (= (and b!763910 res!516542) b!763913))

(assert (= (and b!763913 res!516537) b!763909))

(assert (= (and b!763909 c!84077) b!763907))

(assert (= (and b!763909 (not c!84077)) b!763911))

(declare-fun m!710827 () Bool)

(assert (=> b!763908 m!710827))

(assert (=> b!763908 m!710827))

(declare-fun m!710829 () Bool)

(assert (=> b!763908 m!710829))

(declare-fun m!710831 () Bool)

(assert (=> b!763915 m!710831))

(declare-fun m!710833 () Bool)

(assert (=> b!763912 m!710833))

(declare-fun m!710835 () Bool)

(assert (=> b!763914 m!710835))

(declare-fun m!710837 () Bool)

(assert (=> b!763913 m!710837))

(declare-fun m!710839 () Bool)

(assert (=> b!763918 m!710839))

(assert (=> b!763910 m!710827))

(assert (=> b!763910 m!710827))

(declare-fun m!710841 () Bool)

(assert (=> b!763910 m!710841))

(assert (=> b!763910 m!710841))

(assert (=> b!763910 m!710827))

(declare-fun m!710843 () Bool)

(assert (=> b!763910 m!710843))

(declare-fun m!710845 () Bool)

(assert (=> b!763919 m!710845))

(assert (=> b!763907 m!710827))

(assert (=> b!763907 m!710827))

(declare-fun m!710847 () Bool)

(assert (=> b!763907 m!710847))

(assert (=> b!763911 m!710827))

(assert (=> b!763911 m!710827))

(declare-fun m!710849 () Bool)

(assert (=> b!763911 m!710849))

(declare-fun m!710851 () Bool)

(assert (=> start!66374 m!710851))

(declare-fun m!710853 () Bool)

(assert (=> start!66374 m!710853))

(check-sat (not b!763914) (not b!763908) (not b!763910) (not b!763915) (not start!66374) (not b!763918) (not b!763919) (not b!763907) (not b!763912) (not b!763911))
(check-sat)
