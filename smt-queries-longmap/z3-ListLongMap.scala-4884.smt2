; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67352 () Bool)

(assert start!67352)

(declare-fun b!778906 () Bool)

(declare-fun e!433343 () Bool)

(declare-fun e!433342 () Bool)

(assert (=> b!778906 (= e!433343 e!433342)))

(declare-fun res!526936 () Bool)

(assert (=> b!778906 (=> (not res!526936) (not e!433342))))

(declare-datatypes ((SeekEntryResult!7983 0))(
  ( (MissingZero!7983 (index!34300 (_ BitVec 32))) (Found!7983 (index!34301 (_ BitVec 32))) (Intermediate!7983 (undefined!8795 Bool) (index!34302 (_ BitVec 32)) (x!65248 (_ BitVec 32))) (Undefined!7983) (MissingVacant!7983 (index!34303 (_ BitVec 32))) )
))
(declare-fun lt!347029 () SeekEntryResult!7983)

(declare-fun lt!347024 () SeekEntryResult!7983)

(assert (=> b!778906 (= res!526936 (= lt!347029 lt!347024))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347023 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42581 0))(
  ( (array!42582 (arr!20383 (Array (_ BitVec 32) (_ BitVec 64))) (size!20804 (_ BitVec 32))) )
))
(declare-fun lt!347026 () array!42581)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42581 (_ BitVec 32)) SeekEntryResult!7983)

(assert (=> b!778906 (= lt!347024 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347023 lt!347026 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778906 (= lt!347029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347023 mask!3328) lt!347023 lt!347026 mask!3328))))

(declare-fun a!3186 () array!42581)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!778906 (= lt!347023 (select (store (arr!20383 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778906 (= lt!347026 (array!42582 (store (arr!20383 a!3186) i!1173 k0!2102) (size!20804 a!3186)))))

(declare-fun e!433347 () Bool)

(declare-fun lt!347030 () SeekEntryResult!7983)

(declare-fun b!778907 () Bool)

(assert (=> b!778907 (= e!433347 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347030))))

(declare-fun b!778908 () Bool)

(declare-fun res!526934 () Bool)

(declare-fun e!433346 () Bool)

(assert (=> b!778908 (=> (not res!526934) (not e!433346))))

(assert (=> b!778908 (= res!526934 (and (= (size!20804 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20804 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20804 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!526927 () Bool)

(assert (=> start!67352 (=> (not res!526927) (not e!433346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67352 (= res!526927 (validMask!0 mask!3328))))

(assert (=> start!67352 e!433346))

(assert (=> start!67352 true))

(declare-fun array_inv!16179 (array!42581) Bool)

(assert (=> start!67352 (array_inv!16179 a!3186)))

(declare-fun b!778909 () Bool)

(declare-fun e!433348 () Bool)

(assert (=> b!778909 (= e!433348 e!433343)))

(declare-fun res!526937 () Bool)

(assert (=> b!778909 (=> (not res!526937) (not e!433343))))

(assert (=> b!778909 (= res!526937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20383 a!3186) j!159) mask!3328) (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347030))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778909 (= lt!347030 (Intermediate!7983 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778910 () Bool)

(declare-fun res!526926 () Bool)

(assert (=> b!778910 (=> (not res!526926) (not e!433348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42581 (_ BitVec 32)) Bool)

(assert (=> b!778910 (= res!526926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778911 () Bool)

(declare-fun e!433344 () Bool)

(declare-fun lt!347027 () SeekEntryResult!7983)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42581 (_ BitVec 32)) SeekEntryResult!7983)

(assert (=> b!778911 (= e!433344 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347027))))

(declare-fun b!778912 () Bool)

(declare-fun res!526923 () Bool)

(assert (=> b!778912 (=> (not res!526923) (not e!433343))))

(assert (=> b!778912 (= res!526923 e!433347)))

(declare-fun c!86395 () Bool)

(assert (=> b!778912 (= c!86395 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778913 () Bool)

(declare-fun res!526931 () Bool)

(assert (=> b!778913 (=> (not res!526931) (not e!433346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778913 (= res!526931 (validKeyInArray!0 k0!2102))))

(declare-fun b!778914 () Bool)

(assert (=> b!778914 (= e!433346 e!433348)))

(declare-fun res!526924 () Bool)

(assert (=> b!778914 (=> (not res!526924) (not e!433348))))

(declare-fun lt!347028 () SeekEntryResult!7983)

(assert (=> b!778914 (= res!526924 (or (= lt!347028 (MissingZero!7983 i!1173)) (= lt!347028 (MissingVacant!7983 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42581 (_ BitVec 32)) SeekEntryResult!7983)

(assert (=> b!778914 (= lt!347028 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778915 () Bool)

(declare-fun res!526935 () Bool)

(assert (=> b!778915 (=> (not res!526935) (not e!433348))))

(assert (=> b!778915 (= res!526935 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20804 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20804 a!3186))))))

(declare-fun b!778916 () Bool)

(declare-fun res!526925 () Bool)

(assert (=> b!778916 (=> (not res!526925) (not e!433348))))

(declare-datatypes ((List!14385 0))(
  ( (Nil!14382) (Cons!14381 (h!15495 (_ BitVec 64)) (t!20700 List!14385)) )
))
(declare-fun arrayNoDuplicates!0 (array!42581 (_ BitVec 32) List!14385) Bool)

(assert (=> b!778916 (= res!526925 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14382))))

(declare-fun b!778917 () Bool)

(declare-fun e!433345 () Bool)

(assert (=> b!778917 (= e!433342 (not e!433345))))

(declare-fun res!526932 () Bool)

(assert (=> b!778917 (=> res!526932 e!433345)))

(get-info :version)

(assert (=> b!778917 (= res!526932 (or (not ((_ is Intermediate!7983) lt!347024)) (bvslt x!1131 (x!65248 lt!347024)) (not (= x!1131 (x!65248 lt!347024))) (not (= index!1321 (index!34302 lt!347024)))))))

(declare-fun e!433349 () Bool)

(assert (=> b!778917 e!433349))

(declare-fun res!526929 () Bool)

(assert (=> b!778917 (=> (not res!526929) (not e!433349))))

(assert (=> b!778917 (= res!526929 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26860 0))(
  ( (Unit!26861) )
))
(declare-fun lt!347025 () Unit!26860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26860)

(assert (=> b!778917 (= lt!347025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778918 () Bool)

(assert (=> b!778918 (= e!433347 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) (Found!7983 j!159)))))

(declare-fun b!778919 () Bool)

(declare-fun res!526928 () Bool)

(assert (=> b!778919 (=> (not res!526928) (not e!433346))))

(assert (=> b!778919 (= res!526928 (validKeyInArray!0 (select (arr!20383 a!3186) j!159)))))

(declare-fun b!778920 () Bool)

(assert (=> b!778920 (= e!433349 e!433344)))

(declare-fun res!526930 () Bool)

(assert (=> b!778920 (=> (not res!526930) (not e!433344))))

(assert (=> b!778920 (= res!526930 (= (seekEntryOrOpen!0 (select (arr!20383 a!3186) j!159) a!3186 mask!3328) lt!347027))))

(assert (=> b!778920 (= lt!347027 (Found!7983 j!159))))

(declare-fun b!778921 () Bool)

(declare-fun res!526922 () Bool)

(assert (=> b!778921 (=> (not res!526922) (not e!433343))))

(assert (=> b!778921 (= res!526922 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20383 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778922 () Bool)

(declare-fun res!526933 () Bool)

(assert (=> b!778922 (=> (not res!526933) (not e!433346))))

(declare-fun arrayContainsKey!0 (array!42581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778922 (= res!526933 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778923 () Bool)

(assert (=> b!778923 (= e!433345 true)))

(declare-fun lt!347022 () SeekEntryResult!7983)

(assert (=> b!778923 (= lt!347022 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20383 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67352 res!526927) b!778908))

(assert (= (and b!778908 res!526934) b!778919))

(assert (= (and b!778919 res!526928) b!778913))

(assert (= (and b!778913 res!526931) b!778922))

(assert (= (and b!778922 res!526933) b!778914))

(assert (= (and b!778914 res!526924) b!778910))

(assert (= (and b!778910 res!526926) b!778916))

(assert (= (and b!778916 res!526925) b!778915))

(assert (= (and b!778915 res!526935) b!778909))

(assert (= (and b!778909 res!526937) b!778921))

(assert (= (and b!778921 res!526922) b!778912))

(assert (= (and b!778912 c!86395) b!778907))

(assert (= (and b!778912 (not c!86395)) b!778918))

(assert (= (and b!778912 res!526923) b!778906))

(assert (= (and b!778906 res!526936) b!778917))

(assert (= (and b!778917 res!526929) b!778920))

(assert (= (and b!778920 res!526930) b!778911))

(assert (= (and b!778917 (not res!526932)) b!778923))

(declare-fun m!722487 () Bool)

(assert (=> b!778911 m!722487))

(assert (=> b!778911 m!722487))

(declare-fun m!722489 () Bool)

(assert (=> b!778911 m!722489))

(declare-fun m!722491 () Bool)

(assert (=> b!778906 m!722491))

(declare-fun m!722493 () Bool)

(assert (=> b!778906 m!722493))

(declare-fun m!722495 () Bool)

(assert (=> b!778906 m!722495))

(declare-fun m!722497 () Bool)

(assert (=> b!778906 m!722497))

(assert (=> b!778906 m!722491))

(declare-fun m!722499 () Bool)

(assert (=> b!778906 m!722499))

(declare-fun m!722501 () Bool)

(assert (=> b!778914 m!722501))

(assert (=> b!778919 m!722487))

(assert (=> b!778919 m!722487))

(declare-fun m!722503 () Bool)

(assert (=> b!778919 m!722503))

(assert (=> b!778918 m!722487))

(assert (=> b!778918 m!722487))

(declare-fun m!722505 () Bool)

(assert (=> b!778918 m!722505))

(declare-fun m!722507 () Bool)

(assert (=> b!778913 m!722507))

(assert (=> b!778920 m!722487))

(assert (=> b!778920 m!722487))

(declare-fun m!722509 () Bool)

(assert (=> b!778920 m!722509))

(declare-fun m!722511 () Bool)

(assert (=> b!778921 m!722511))

(declare-fun m!722513 () Bool)

(assert (=> b!778922 m!722513))

(declare-fun m!722515 () Bool)

(assert (=> start!67352 m!722515))

(declare-fun m!722517 () Bool)

(assert (=> start!67352 m!722517))

(assert (=> b!778907 m!722487))

(assert (=> b!778907 m!722487))

(declare-fun m!722519 () Bool)

(assert (=> b!778907 m!722519))

(assert (=> b!778909 m!722487))

(assert (=> b!778909 m!722487))

(declare-fun m!722521 () Bool)

(assert (=> b!778909 m!722521))

(assert (=> b!778909 m!722521))

(assert (=> b!778909 m!722487))

(declare-fun m!722523 () Bool)

(assert (=> b!778909 m!722523))

(declare-fun m!722525 () Bool)

(assert (=> b!778917 m!722525))

(declare-fun m!722527 () Bool)

(assert (=> b!778917 m!722527))

(declare-fun m!722529 () Bool)

(assert (=> b!778916 m!722529))

(declare-fun m!722531 () Bool)

(assert (=> b!778910 m!722531))

(assert (=> b!778923 m!722487))

(assert (=> b!778923 m!722487))

(assert (=> b!778923 m!722505))

(check-sat (not b!778920) (not b!778918) (not b!778916) (not b!778909) (not b!778917) (not b!778911) (not b!778922) (not b!778907) (not b!778910) (not b!778906) (not b!778913) (not start!67352) (not b!778914) (not b!778923) (not b!778919))
(check-sat)
