; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64848 () Bool)

(assert start!64848)

(declare-fun b!730943 () Bool)

(declare-fun res!490826 () Bool)

(declare-fun e!409124 () Bool)

(assert (=> b!730943 (=> (not res!490826) (not e!409124))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41167 0))(
  ( (array!41168 (arr!19699 (Array (_ BitVec 32) (_ BitVec 64))) (size!20119 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41167)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730943 (= res!490826 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19699 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730944 () Bool)

(declare-fun res!490823 () Bool)

(declare-fun e!409126 () Bool)

(assert (=> b!730944 (=> (not res!490823) (not e!409126))))

(declare-datatypes ((List!13608 0))(
  ( (Nil!13605) (Cons!13604 (h!14670 (_ BitVec 64)) (t!19915 List!13608)) )
))
(declare-fun arrayNoDuplicates!0 (array!41167 (_ BitVec 32) List!13608) Bool)

(assert (=> b!730944 (= res!490823 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13605))))

(declare-fun b!730945 () Bool)

(declare-fun e!409123 () Bool)

(assert (=> b!730945 (= e!409124 e!409123)))

(declare-fun res!490837 () Bool)

(assert (=> b!730945 (=> (not res!490837) (not e!409123))))

(declare-datatypes ((SeekEntryResult!7255 0))(
  ( (MissingZero!7255 (index!31388 (_ BitVec 32))) (Found!7255 (index!31389 (_ BitVec 32))) (Intermediate!7255 (undefined!8067 Bool) (index!31390 (_ BitVec 32)) (x!62529 (_ BitVec 32))) (Undefined!7255) (MissingVacant!7255 (index!31391 (_ BitVec 32))) )
))
(declare-fun lt!323858 () SeekEntryResult!7255)

(declare-fun lt!323854 () SeekEntryResult!7255)

(assert (=> b!730945 (= res!490837 (= lt!323858 lt!323854))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323856 () (_ BitVec 64))

(declare-fun lt!323862 () array!41167)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41167 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!730945 (= lt!323854 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323856 lt!323862 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730945 (= lt!323858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323856 mask!3328) lt!323856 lt!323862 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730945 (= lt!323856 (select (store (arr!19699 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730945 (= lt!323862 (array!41168 (store (arr!19699 a!3186) i!1173 k0!2102) (size!20119 a!3186)))))

(declare-fun e!409127 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!323860 () SeekEntryResult!7255)

(declare-fun b!730946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41167 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!730946 (= e!409127 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323860))))

(declare-fun b!730947 () Bool)

(declare-fun res!490829 () Bool)

(declare-fun e!409125 () Bool)

(assert (=> b!730947 (=> (not res!490829) (not e!409125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730947 (= res!490829 (validKeyInArray!0 (select (arr!19699 a!3186) j!159)))))

(declare-fun b!730948 () Bool)

(declare-fun e!409122 () Bool)

(assert (=> b!730948 (= e!409122 e!409127)))

(declare-fun res!490834 () Bool)

(assert (=> b!730948 (=> (not res!490834) (not e!409127))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41167 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!730948 (= res!490834 (= (seekEntryOrOpen!0 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323860))))

(assert (=> b!730948 (= lt!323860 (Found!7255 j!159))))

(declare-fun b!730950 () Bool)

(declare-fun e!409121 () Bool)

(assert (=> b!730950 (= e!409121 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) (Found!7255 j!159)))))

(declare-fun b!730951 () Bool)

(assert (=> b!730951 (= e!409125 e!409126)))

(declare-fun res!490831 () Bool)

(assert (=> b!730951 (=> (not res!490831) (not e!409126))))

(declare-fun lt!323861 () SeekEntryResult!7255)

(assert (=> b!730951 (= res!490831 (or (= lt!323861 (MissingZero!7255 i!1173)) (= lt!323861 (MissingVacant!7255 i!1173))))))

(assert (=> b!730951 (= lt!323861 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730952 () Bool)

(declare-fun res!490835 () Bool)

(assert (=> b!730952 (=> (not res!490835) (not e!409125))))

(assert (=> b!730952 (= res!490835 (and (= (size!20119 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20119 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20119 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730953 () Bool)

(declare-fun e!409128 () Bool)

(assert (=> b!730953 (= e!409123 (not e!409128))))

(declare-fun res!490836 () Bool)

(assert (=> b!730953 (=> res!490836 e!409128)))

(get-info :version)

(assert (=> b!730953 (= res!490836 (or (not ((_ is Intermediate!7255) lt!323854)) (bvsge x!1131 (x!62529 lt!323854))))))

(assert (=> b!730953 e!409122))

(declare-fun res!490827 () Bool)

(assert (=> b!730953 (=> (not res!490827) (not e!409122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41167 (_ BitVec 32)) Bool)

(assert (=> b!730953 (= res!490827 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24907 0))(
  ( (Unit!24908) )
))
(declare-fun lt!323857 () Unit!24907)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24907)

(assert (=> b!730953 (= lt!323857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730954 () Bool)

(declare-fun res!490828 () Bool)

(assert (=> b!730954 (=> (not res!490828) (not e!409126))))

(assert (=> b!730954 (= res!490828 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20119 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20119 a!3186))))))

(declare-fun lt!323859 () SeekEntryResult!7255)

(declare-fun b!730955 () Bool)

(assert (=> b!730955 (= e!409121 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323859))))

(declare-fun b!730956 () Bool)

(declare-fun res!490833 () Bool)

(assert (=> b!730956 (=> (not res!490833) (not e!409125))))

(assert (=> b!730956 (= res!490833 (validKeyInArray!0 k0!2102))))

(declare-fun b!730957 () Bool)

(declare-fun res!490824 () Bool)

(assert (=> b!730957 (=> (not res!490824) (not e!409125))))

(declare-fun arrayContainsKey!0 (array!41167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730957 (= res!490824 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730958 () Bool)

(declare-fun res!490830 () Bool)

(assert (=> b!730958 (=> (not res!490830) (not e!409126))))

(assert (=> b!730958 (= res!490830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!490825 () Bool)

(assert (=> start!64848 (=> (not res!490825) (not e!409125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64848 (= res!490825 (validMask!0 mask!3328))))

(assert (=> start!64848 e!409125))

(assert (=> start!64848 true))

(declare-fun array_inv!15558 (array!41167) Bool)

(assert (=> start!64848 (array_inv!15558 a!3186)))

(declare-fun b!730949 () Bool)

(assert (=> b!730949 (= e!409128 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323855 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730949 (= lt!323855 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!730959 () Bool)

(declare-fun res!490832 () Bool)

(assert (=> b!730959 (=> (not res!490832) (not e!409124))))

(assert (=> b!730959 (= res!490832 e!409121)))

(declare-fun c!80438 () Bool)

(assert (=> b!730959 (= c!80438 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730960 () Bool)

(assert (=> b!730960 (= e!409126 e!409124)))

(declare-fun res!490822 () Bool)

(assert (=> b!730960 (=> (not res!490822) (not e!409124))))

(assert (=> b!730960 (= res!490822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19699 a!3186) j!159) mask!3328) (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323859))))

(assert (=> b!730960 (= lt!323859 (Intermediate!7255 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64848 res!490825) b!730952))

(assert (= (and b!730952 res!490835) b!730947))

(assert (= (and b!730947 res!490829) b!730956))

(assert (= (and b!730956 res!490833) b!730957))

(assert (= (and b!730957 res!490824) b!730951))

(assert (= (and b!730951 res!490831) b!730958))

(assert (= (and b!730958 res!490830) b!730944))

(assert (= (and b!730944 res!490823) b!730954))

(assert (= (and b!730954 res!490828) b!730960))

(assert (= (and b!730960 res!490822) b!730943))

(assert (= (and b!730943 res!490826) b!730959))

(assert (= (and b!730959 c!80438) b!730955))

(assert (= (and b!730959 (not c!80438)) b!730950))

(assert (= (and b!730959 res!490832) b!730945))

(assert (= (and b!730945 res!490837) b!730953))

(assert (= (and b!730953 res!490827) b!730948))

(assert (= (and b!730948 res!490834) b!730946))

(assert (= (and b!730953 (not res!490836)) b!730949))

(declare-fun m!684891 () Bool)

(assert (=> b!730956 m!684891))

(declare-fun m!684893 () Bool)

(assert (=> b!730946 m!684893))

(assert (=> b!730946 m!684893))

(declare-fun m!684895 () Bool)

(assert (=> b!730946 m!684895))

(declare-fun m!684897 () Bool)

(assert (=> b!730951 m!684897))

(declare-fun m!684899 () Bool)

(assert (=> b!730943 m!684899))

(assert (=> b!730948 m!684893))

(assert (=> b!730948 m!684893))

(declare-fun m!684901 () Bool)

(assert (=> b!730948 m!684901))

(declare-fun m!684903 () Bool)

(assert (=> b!730957 m!684903))

(declare-fun m!684905 () Bool)

(assert (=> start!64848 m!684905))

(declare-fun m!684907 () Bool)

(assert (=> start!64848 m!684907))

(declare-fun m!684909 () Bool)

(assert (=> b!730958 m!684909))

(assert (=> b!730960 m!684893))

(assert (=> b!730960 m!684893))

(declare-fun m!684911 () Bool)

(assert (=> b!730960 m!684911))

(assert (=> b!730960 m!684911))

(assert (=> b!730960 m!684893))

(declare-fun m!684913 () Bool)

(assert (=> b!730960 m!684913))

(declare-fun m!684915 () Bool)

(assert (=> b!730953 m!684915))

(declare-fun m!684917 () Bool)

(assert (=> b!730953 m!684917))

(declare-fun m!684919 () Bool)

(assert (=> b!730945 m!684919))

(declare-fun m!684921 () Bool)

(assert (=> b!730945 m!684921))

(declare-fun m!684923 () Bool)

(assert (=> b!730945 m!684923))

(assert (=> b!730945 m!684919))

(declare-fun m!684925 () Bool)

(assert (=> b!730945 m!684925))

(declare-fun m!684927 () Bool)

(assert (=> b!730945 m!684927))

(declare-fun m!684929 () Bool)

(assert (=> b!730949 m!684929))

(assert (=> b!730955 m!684893))

(assert (=> b!730955 m!684893))

(declare-fun m!684931 () Bool)

(assert (=> b!730955 m!684931))

(assert (=> b!730947 m!684893))

(assert (=> b!730947 m!684893))

(declare-fun m!684933 () Bool)

(assert (=> b!730947 m!684933))

(declare-fun m!684935 () Bool)

(assert (=> b!730944 m!684935))

(assert (=> b!730950 m!684893))

(assert (=> b!730950 m!684893))

(declare-fun m!684937 () Bool)

(assert (=> b!730950 m!684937))

(check-sat (not b!730944) (not b!730945) (not b!730953) (not b!730946) (not b!730947) (not b!730949) (not b!730950) (not start!64848) (not b!730956) (not b!730955) (not b!730960) (not b!730948) (not b!730951) (not b!730957) (not b!730958))
(check-sat)
