; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66276 () Bool)

(assert start!66276)

(declare-fun b!763896 () Bool)

(declare-fun res!516920 () Bool)

(declare-fun e!425480 () Bool)

(assert (=> b!763896 (=> (not res!516920) (not e!425480))))

(declare-datatypes ((array!42198 0))(
  ( (array!42199 (arr!20207 (Array (_ BitVec 32) (_ BitVec 64))) (size!20628 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42198)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763896 (= res!516920 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763897 () Bool)

(declare-fun e!425479 () Bool)

(assert (=> b!763897 (= e!425479 false)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!339813 () array!42198)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7804 0))(
  ( (MissingZero!7804 (index!33584 (_ BitVec 32))) (Found!7804 (index!33585 (_ BitVec 32))) (Intermediate!7804 (undefined!8616 Bool) (index!33586 (_ BitVec 32)) (x!64491 (_ BitVec 32))) (Undefined!7804) (MissingVacant!7804 (index!33587 (_ BitVec 32))) )
))
(declare-fun lt!339811 () SeekEntryResult!7804)

(declare-fun lt!339815 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42198 (_ BitVec 32)) SeekEntryResult!7804)

(assert (=> b!763897 (= lt!339811 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339815 lt!339813 mask!3328))))

(declare-fun lt!339814 () SeekEntryResult!7804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763897 (= lt!339814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339815 mask!3328) lt!339815 lt!339813 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763897 (= lt!339815 (select (store (arr!20207 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763897 (= lt!339813 (array!42199 (store (arr!20207 a!3186) i!1173 k0!2102) (size!20628 a!3186)))))

(declare-fun b!763898 () Bool)

(declare-fun res!516918 () Bool)

(assert (=> b!763898 (=> (not res!516918) (not e!425479))))

(declare-fun e!425482 () Bool)

(assert (=> b!763898 (= res!516918 e!425482)))

(declare-fun c!83880 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763898 (= c!83880 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!763899 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42198 (_ BitVec 32)) SeekEntryResult!7804)

(assert (=> b!763899 (= e!425482 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20207 a!3186) j!159) a!3186 mask!3328) (Found!7804 j!159)))))

(declare-fun b!763900 () Bool)

(declare-fun e!425481 () Bool)

(assert (=> b!763900 (= e!425480 e!425481)))

(declare-fun res!516910 () Bool)

(assert (=> b!763900 (=> (not res!516910) (not e!425481))))

(declare-fun lt!339812 () SeekEntryResult!7804)

(assert (=> b!763900 (= res!516910 (or (= lt!339812 (MissingZero!7804 i!1173)) (= lt!339812 (MissingVacant!7804 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42198 (_ BitVec 32)) SeekEntryResult!7804)

(assert (=> b!763900 (= lt!339812 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!516917 () Bool)

(assert (=> start!66276 (=> (not res!516917) (not e!425480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66276 (= res!516917 (validMask!0 mask!3328))))

(assert (=> start!66276 e!425480))

(assert (=> start!66276 true))

(declare-fun array_inv!16090 (array!42198) Bool)

(assert (=> start!66276 (array_inv!16090 a!3186)))

(declare-fun b!763901 () Bool)

(assert (=> b!763901 (= e!425481 e!425479)))

(declare-fun res!516914 () Bool)

(assert (=> b!763901 (=> (not res!516914) (not e!425479))))

(declare-fun lt!339810 () SeekEntryResult!7804)

(assert (=> b!763901 (= res!516914 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20207 a!3186) j!159) mask!3328) (select (arr!20207 a!3186) j!159) a!3186 mask!3328) lt!339810))))

(assert (=> b!763901 (= lt!339810 (Intermediate!7804 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763902 () Bool)

(declare-fun res!516916 () Bool)

(assert (=> b!763902 (=> (not res!516916) (not e!425480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763902 (= res!516916 (validKeyInArray!0 k0!2102))))

(declare-fun b!763903 () Bool)

(declare-fun res!516912 () Bool)

(assert (=> b!763903 (=> (not res!516912) (not e!425481))))

(assert (=> b!763903 (= res!516912 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20628 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20628 a!3186))))))

(declare-fun b!763904 () Bool)

(declare-fun res!516911 () Bool)

(assert (=> b!763904 (=> (not res!516911) (not e!425479))))

(assert (=> b!763904 (= res!516911 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20207 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763905 () Bool)

(assert (=> b!763905 (= e!425482 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20207 a!3186) j!159) a!3186 mask!3328) lt!339810))))

(declare-fun b!763906 () Bool)

(declare-fun res!516909 () Bool)

(assert (=> b!763906 (=> (not res!516909) (not e!425480))))

(assert (=> b!763906 (= res!516909 (validKeyInArray!0 (select (arr!20207 a!3186) j!159)))))

(declare-fun b!763907 () Bool)

(declare-fun res!516915 () Bool)

(assert (=> b!763907 (=> (not res!516915) (not e!425481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42198 (_ BitVec 32)) Bool)

(assert (=> b!763907 (= res!516915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763908 () Bool)

(declare-fun res!516919 () Bool)

(assert (=> b!763908 (=> (not res!516919) (not e!425481))))

(declare-datatypes ((List!14248 0))(
  ( (Nil!14245) (Cons!14244 (h!15328 (_ BitVec 64)) (t!20554 List!14248)) )
))
(declare-fun arrayNoDuplicates!0 (array!42198 (_ BitVec 32) List!14248) Bool)

(assert (=> b!763908 (= res!516919 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14245))))

(declare-fun b!763909 () Bool)

(declare-fun res!516913 () Bool)

(assert (=> b!763909 (=> (not res!516913) (not e!425480))))

(assert (=> b!763909 (= res!516913 (and (= (size!20628 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20628 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20628 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66276 res!516917) b!763909))

(assert (= (and b!763909 res!516913) b!763906))

(assert (= (and b!763906 res!516909) b!763902))

(assert (= (and b!763902 res!516916) b!763896))

(assert (= (and b!763896 res!516920) b!763900))

(assert (= (and b!763900 res!516910) b!763907))

(assert (= (and b!763907 res!516915) b!763908))

(assert (= (and b!763908 res!516919) b!763903))

(assert (= (and b!763903 res!516912) b!763901))

(assert (= (and b!763901 res!516914) b!763904))

(assert (= (and b!763904 res!516911) b!763898))

(assert (= (and b!763898 c!83880) b!763905))

(assert (= (and b!763898 (not c!83880)) b!763899))

(assert (= (and b!763898 res!516918) b!763897))

(declare-fun m!709783 () Bool)

(assert (=> b!763896 m!709783))

(declare-fun m!709785 () Bool)

(assert (=> b!763904 m!709785))

(declare-fun m!709787 () Bool)

(assert (=> b!763906 m!709787))

(assert (=> b!763906 m!709787))

(declare-fun m!709789 () Bool)

(assert (=> b!763906 m!709789))

(declare-fun m!709791 () Bool)

(assert (=> b!763897 m!709791))

(assert (=> b!763897 m!709791))

(declare-fun m!709793 () Bool)

(assert (=> b!763897 m!709793))

(declare-fun m!709795 () Bool)

(assert (=> b!763897 m!709795))

(declare-fun m!709797 () Bool)

(assert (=> b!763897 m!709797))

(declare-fun m!709799 () Bool)

(assert (=> b!763897 m!709799))

(declare-fun m!709801 () Bool)

(assert (=> b!763900 m!709801))

(assert (=> b!763899 m!709787))

(assert (=> b!763899 m!709787))

(declare-fun m!709803 () Bool)

(assert (=> b!763899 m!709803))

(declare-fun m!709805 () Bool)

(assert (=> start!66276 m!709805))

(declare-fun m!709807 () Bool)

(assert (=> start!66276 m!709807))

(declare-fun m!709809 () Bool)

(assert (=> b!763908 m!709809))

(declare-fun m!709811 () Bool)

(assert (=> b!763902 m!709811))

(declare-fun m!709813 () Bool)

(assert (=> b!763907 m!709813))

(assert (=> b!763901 m!709787))

(assert (=> b!763901 m!709787))

(declare-fun m!709815 () Bool)

(assert (=> b!763901 m!709815))

(assert (=> b!763901 m!709815))

(assert (=> b!763901 m!709787))

(declare-fun m!709817 () Bool)

(assert (=> b!763901 m!709817))

(assert (=> b!763905 m!709787))

(assert (=> b!763905 m!709787))

(declare-fun m!709819 () Bool)

(assert (=> b!763905 m!709819))

(check-sat (not b!763896) (not b!763897) (not b!763906) (not b!763908) (not b!763902) (not b!763905) (not b!763899) (not b!763900) (not b!763901) (not start!66276) (not b!763907))
(check-sat)
