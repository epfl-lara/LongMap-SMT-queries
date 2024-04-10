; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65592 () Bool)

(assert start!65592)

(declare-fun b!749913 () Bool)

(declare-datatypes ((Unit!25764 0))(
  ( (Unit!25765) )
))
(declare-fun e!418431 () Unit!25764)

(declare-fun Unit!25766 () Unit!25764)

(assert (=> b!749913 (= e!418431 Unit!25766)))

(declare-fun b!749914 () Bool)

(declare-fun e!418429 () Bool)

(declare-fun e!418432 () Bool)

(assert (=> b!749914 (= e!418429 e!418432)))

(declare-fun res!506067 () Bool)

(assert (=> b!749914 (=> res!506067 e!418432)))

(declare-fun lt!333428 () (_ BitVec 64))

(declare-fun lt!333422 () (_ BitVec 64))

(assert (=> b!749914 (= res!506067 (= lt!333428 lt!333422))))

(declare-datatypes ((array!41765 0))(
  ( (array!41766 (arr!19996 (Array (_ BitVec 32) (_ BitVec 64))) (size!20417 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41765)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749914 (= lt!333428 (select (store (arr!19996 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749915 () Bool)

(declare-fun res!506081 () Bool)

(declare-fun e!418426 () Bool)

(assert (=> b!749915 (=> (not res!506081) (not e!418426))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749915 (= res!506081 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20417 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20417 a!3186))))))

(declare-fun b!749916 () Bool)

(declare-fun e!418436 () Bool)

(assert (=> b!749916 (= e!418436 e!418426)))

(declare-fun res!506065 () Bool)

(assert (=> b!749916 (=> (not res!506065) (not e!418426))))

(declare-datatypes ((SeekEntryResult!7596 0))(
  ( (MissingZero!7596 (index!32752 (_ BitVec 32))) (Found!7596 (index!32753 (_ BitVec 32))) (Intermediate!7596 (undefined!8408 Bool) (index!32754 (_ BitVec 32)) (x!63682 (_ BitVec 32))) (Undefined!7596) (MissingVacant!7596 (index!32755 (_ BitVec 32))) )
))
(declare-fun lt!333426 () SeekEntryResult!7596)

(assert (=> b!749916 (= res!506065 (or (= lt!333426 (MissingZero!7596 i!1173)) (= lt!333426 (MissingVacant!7596 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41765 (_ BitVec 32)) SeekEntryResult!7596)

(assert (=> b!749916 (= lt!333426 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!749917 () Bool)

(declare-fun lt!333425 () SeekEntryResult!7596)

(declare-fun e!418434 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41765 (_ BitVec 32)) SeekEntryResult!7596)

(assert (=> b!749917 (= e!418434 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333425))))

(declare-fun b!749918 () Bool)

(declare-fun e!418433 () Bool)

(assert (=> b!749918 (= e!418433 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) (Found!7596 j!159)))))

(declare-fun res!506075 () Bool)

(assert (=> start!65592 (=> (not res!506075) (not e!418436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65592 (= res!506075 (validMask!0 mask!3328))))

(assert (=> start!65592 e!418436))

(assert (=> start!65592 true))

(declare-fun array_inv!15792 (array!41765) Bool)

(assert (=> start!65592 (array_inv!15792 a!3186)))

(declare-fun b!749919 () Bool)

(declare-fun res!506078 () Bool)

(assert (=> b!749919 (=> (not res!506078) (not e!418436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749919 (= res!506078 (validKeyInArray!0 k0!2102))))

(declare-fun b!749920 () Bool)

(assert (=> b!749920 (= e!418432 true)))

(declare-fun e!418428 () Bool)

(assert (=> b!749920 e!418428))

(declare-fun res!506080 () Bool)

(assert (=> b!749920 (=> (not res!506080) (not e!418428))))

(assert (=> b!749920 (= res!506080 (= lt!333428 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333423 () Unit!25764)

(assert (=> b!749920 (= lt!333423 e!418431)))

(declare-fun c!82305 () Bool)

(assert (=> b!749920 (= c!82305 (= lt!333428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749921 () Bool)

(declare-fun lt!333420 () SeekEntryResult!7596)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41765 (_ BitVec 32)) SeekEntryResult!7596)

(assert (=> b!749921 (= e!418433 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333420))))

(declare-fun b!749922 () Bool)

(declare-fun res!506064 () Bool)

(assert (=> b!749922 (=> res!506064 e!418429)))

(assert (=> b!749922 (= res!506064 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333425)))))

(declare-fun b!749923 () Bool)

(declare-fun e!418427 () Bool)

(assert (=> b!749923 (= e!418426 e!418427)))

(declare-fun res!506069 () Bool)

(assert (=> b!749923 (=> (not res!506069) (not e!418427))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749923 (= res!506069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19996 a!3186) j!159) mask!3328) (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333420))))

(assert (=> b!749923 (= lt!333420 (Intermediate!7596 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749924 () Bool)

(declare-fun e!418430 () Bool)

(assert (=> b!749924 (= e!418430 (not e!418429))))

(declare-fun res!506066 () Bool)

(assert (=> b!749924 (=> res!506066 e!418429)))

(declare-fun lt!333424 () SeekEntryResult!7596)

(get-info :version)

(assert (=> b!749924 (= res!506066 (or (not ((_ is Intermediate!7596) lt!333424)) (bvslt x!1131 (x!63682 lt!333424)) (not (= x!1131 (x!63682 lt!333424))) (not (= index!1321 (index!32754 lt!333424)))))))

(assert (=> b!749924 e!418434))

(declare-fun res!506072 () Bool)

(assert (=> b!749924 (=> (not res!506072) (not e!418434))))

(declare-fun lt!333419 () SeekEntryResult!7596)

(assert (=> b!749924 (= res!506072 (= lt!333419 lt!333425))))

(assert (=> b!749924 (= lt!333425 (Found!7596 j!159))))

(assert (=> b!749924 (= lt!333419 (seekEntryOrOpen!0 (select (arr!19996 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41765 (_ BitVec 32)) Bool)

(assert (=> b!749924 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333418 () Unit!25764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25764)

(assert (=> b!749924 (= lt!333418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749925 () Bool)

(declare-fun res!506073 () Bool)

(assert (=> b!749925 (=> (not res!506073) (not e!418436))))

(assert (=> b!749925 (= res!506073 (and (= (size!20417 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20417 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20417 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749926 () Bool)

(declare-fun res!506077 () Bool)

(assert (=> b!749926 (=> (not res!506077) (not e!418436))))

(assert (=> b!749926 (= res!506077 (validKeyInArray!0 (select (arr!19996 a!3186) j!159)))))

(declare-fun b!749927 () Bool)

(declare-fun lt!333427 () array!41765)

(assert (=> b!749927 (= e!418428 (= (seekEntryOrOpen!0 lt!333422 lt!333427 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333422 lt!333427 mask!3328)))))

(declare-fun b!749928 () Bool)

(declare-fun res!506071 () Bool)

(assert (=> b!749928 (=> (not res!506071) (not e!418426))))

(assert (=> b!749928 (= res!506071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749929 () Bool)

(declare-fun res!506074 () Bool)

(assert (=> b!749929 (=> (not res!506074) (not e!418426))))

(declare-datatypes ((List!13998 0))(
  ( (Nil!13995) (Cons!13994 (h!15066 (_ BitVec 64)) (t!20313 List!13998)) )
))
(declare-fun arrayNoDuplicates!0 (array!41765 (_ BitVec 32) List!13998) Bool)

(assert (=> b!749929 (= res!506074 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13995))))

(declare-fun b!749930 () Bool)

(assert (=> b!749930 (= e!418427 e!418430)))

(declare-fun res!506079 () Bool)

(assert (=> b!749930 (=> (not res!506079) (not e!418430))))

(declare-fun lt!333421 () SeekEntryResult!7596)

(assert (=> b!749930 (= res!506079 (= lt!333421 lt!333424))))

(assert (=> b!749930 (= lt!333424 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333422 lt!333427 mask!3328))))

(assert (=> b!749930 (= lt!333421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333422 mask!3328) lt!333422 lt!333427 mask!3328))))

(assert (=> b!749930 (= lt!333422 (select (store (arr!19996 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749930 (= lt!333427 (array!41766 (store (arr!19996 a!3186) i!1173 k0!2102) (size!20417 a!3186)))))

(declare-fun b!749931 () Bool)

(declare-fun Unit!25767 () Unit!25764)

(assert (=> b!749931 (= e!418431 Unit!25767)))

(assert (=> b!749931 false))

(declare-fun b!749932 () Bool)

(declare-fun res!506068 () Bool)

(assert (=> b!749932 (=> (not res!506068) (not e!418427))))

(assert (=> b!749932 (= res!506068 e!418433)))

(declare-fun c!82306 () Bool)

(assert (=> b!749932 (= c!82306 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749933 () Bool)

(declare-fun res!506070 () Bool)

(assert (=> b!749933 (=> (not res!506070) (not e!418427))))

(assert (=> b!749933 (= res!506070 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19996 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749934 () Bool)

(declare-fun res!506076 () Bool)

(assert (=> b!749934 (=> (not res!506076) (not e!418436))))

(declare-fun arrayContainsKey!0 (array!41765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749934 (= res!506076 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65592 res!506075) b!749925))

(assert (= (and b!749925 res!506073) b!749926))

(assert (= (and b!749926 res!506077) b!749919))

(assert (= (and b!749919 res!506078) b!749934))

(assert (= (and b!749934 res!506076) b!749916))

(assert (= (and b!749916 res!506065) b!749928))

(assert (= (and b!749928 res!506071) b!749929))

(assert (= (and b!749929 res!506074) b!749915))

(assert (= (and b!749915 res!506081) b!749923))

(assert (= (and b!749923 res!506069) b!749933))

(assert (= (and b!749933 res!506070) b!749932))

(assert (= (and b!749932 c!82306) b!749921))

(assert (= (and b!749932 (not c!82306)) b!749918))

(assert (= (and b!749932 res!506068) b!749930))

(assert (= (and b!749930 res!506079) b!749924))

(assert (= (and b!749924 res!506072) b!749917))

(assert (= (and b!749924 (not res!506066)) b!749922))

(assert (= (and b!749922 (not res!506064)) b!749914))

(assert (= (and b!749914 (not res!506067)) b!749920))

(assert (= (and b!749920 c!82305) b!749931))

(assert (= (and b!749920 (not c!82305)) b!749913))

(assert (= (and b!749920 res!506080) b!749927))

(declare-fun m!699419 () Bool)

(assert (=> b!749919 m!699419))

(declare-fun m!699421 () Bool)

(assert (=> b!749928 m!699421))

(declare-fun m!699423 () Bool)

(assert (=> b!749929 m!699423))

(declare-fun m!699425 () Bool)

(assert (=> b!749917 m!699425))

(assert (=> b!749917 m!699425))

(declare-fun m!699427 () Bool)

(assert (=> b!749917 m!699427))

(assert (=> b!749918 m!699425))

(assert (=> b!749918 m!699425))

(declare-fun m!699429 () Bool)

(assert (=> b!749918 m!699429))

(assert (=> b!749923 m!699425))

(assert (=> b!749923 m!699425))

(declare-fun m!699431 () Bool)

(assert (=> b!749923 m!699431))

(assert (=> b!749923 m!699431))

(assert (=> b!749923 m!699425))

(declare-fun m!699433 () Bool)

(assert (=> b!749923 m!699433))

(assert (=> b!749924 m!699425))

(assert (=> b!749924 m!699425))

(declare-fun m!699435 () Bool)

(assert (=> b!749924 m!699435))

(declare-fun m!699437 () Bool)

(assert (=> b!749924 m!699437))

(declare-fun m!699439 () Bool)

(assert (=> b!749924 m!699439))

(declare-fun m!699441 () Bool)

(assert (=> b!749914 m!699441))

(declare-fun m!699443 () Bool)

(assert (=> b!749914 m!699443))

(assert (=> b!749921 m!699425))

(assert (=> b!749921 m!699425))

(declare-fun m!699445 () Bool)

(assert (=> b!749921 m!699445))

(assert (=> b!749926 m!699425))

(assert (=> b!749926 m!699425))

(declare-fun m!699447 () Bool)

(assert (=> b!749926 m!699447))

(assert (=> b!749922 m!699425))

(assert (=> b!749922 m!699425))

(assert (=> b!749922 m!699429))

(declare-fun m!699449 () Bool)

(assert (=> b!749934 m!699449))

(declare-fun m!699451 () Bool)

(assert (=> start!65592 m!699451))

(declare-fun m!699453 () Bool)

(assert (=> start!65592 m!699453))

(declare-fun m!699455 () Bool)

(assert (=> b!749927 m!699455))

(declare-fun m!699457 () Bool)

(assert (=> b!749927 m!699457))

(declare-fun m!699459 () Bool)

(assert (=> b!749933 m!699459))

(declare-fun m!699461 () Bool)

(assert (=> b!749916 m!699461))

(declare-fun m!699463 () Bool)

(assert (=> b!749930 m!699463))

(assert (=> b!749930 m!699441))

(declare-fun m!699465 () Bool)

(assert (=> b!749930 m!699465))

(declare-fun m!699467 () Bool)

(assert (=> b!749930 m!699467))

(declare-fun m!699469 () Bool)

(assert (=> b!749930 m!699469))

(assert (=> b!749930 m!699467))

(check-sat (not b!749928) (not start!65592) (not b!749922) (not b!749926) (not b!749930) (not b!749929) (not b!749924) (not b!749927) (not b!749934) (not b!749917) (not b!749919) (not b!749921) (not b!749923) (not b!749916) (not b!749918))
(check-sat)
