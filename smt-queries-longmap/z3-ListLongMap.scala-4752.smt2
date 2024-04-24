; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65700 () Bool)

(assert start!65700)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41743 0))(
  ( (array!41744 (arr!19981 (Array (_ BitVec 32) (_ BitVec 64))) (size!20401 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41743)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7537 0))(
  ( (MissingZero!7537 (index!32516 (_ BitVec 32))) (Found!7537 (index!32517 (_ BitVec 32))) (Intermediate!7537 (undefined!8349 Bool) (index!32518 (_ BitVec 32)) (x!63611 (_ BitVec 32))) (Undefined!7537) (MissingVacant!7537 (index!32519 (_ BitVec 32))) )
))
(declare-fun lt!333406 () SeekEntryResult!7537)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!749998 () Bool)

(declare-fun e!418576 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41743 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!749998 (= e!418576 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!333406))))

(declare-fun res!505834 () Bool)

(declare-fun e!418582 () Bool)

(assert (=> start!65700 (=> (not res!505834) (not e!418582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65700 (= res!505834 (validMask!0 mask!3328))))

(assert (=> start!65700 e!418582))

(assert (=> start!65700 true))

(declare-fun array_inv!15840 (array!41743) Bool)

(assert (=> start!65700 (array_inv!15840 a!3186)))

(declare-fun b!749999 () Bool)

(declare-fun res!505829 () Bool)

(assert (=> b!749999 (=> (not res!505829) (not e!418582))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749999 (= res!505829 (validKeyInArray!0 k0!2102))))

(declare-fun b!750000 () Bool)

(declare-datatypes ((Unit!25705 0))(
  ( (Unit!25706) )
))
(declare-fun e!418580 () Unit!25705)

(declare-fun Unit!25707 () Unit!25705)

(assert (=> b!750000 (= e!418580 Unit!25707)))

(assert (=> b!750000 false))

(declare-fun b!750001 () Bool)

(declare-fun res!505836 () Bool)

(declare-fun e!418579 () Bool)

(assert (=> b!750001 (=> (not res!505836) (not e!418579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41743 (_ BitVec 32)) Bool)

(assert (=> b!750001 (= res!505836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!418578 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!750002 () Bool)

(declare-fun lt!333405 () SeekEntryResult!7537)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41743 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!750002 (= e!418578 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!333405))))

(declare-fun b!750003 () Bool)

(declare-fun e!418575 () Bool)

(declare-fun e!418581 () Bool)

(assert (=> b!750003 (= e!418575 e!418581)))

(declare-fun res!505837 () Bool)

(assert (=> b!750003 (=> res!505837 e!418581)))

(declare-fun lt!333401 () (_ BitVec 64))

(declare-fun lt!333403 () (_ BitVec 64))

(assert (=> b!750003 (= res!505837 (= lt!333401 lt!333403))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750003 (= lt!333401 (select (store (arr!19981 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750004 () Bool)

(declare-fun res!505835 () Bool)

(assert (=> b!750004 (=> (not res!505835) (not e!418579))))

(assert (=> b!750004 (= res!505835 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20401 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20401 a!3186))))))

(declare-fun b!750005 () Bool)

(assert (=> b!750005 (= e!418581 true)))

(declare-fun e!418574 () Bool)

(assert (=> b!750005 e!418574))

(declare-fun res!505839 () Bool)

(assert (=> b!750005 (=> (not res!505839) (not e!418574))))

(assert (=> b!750005 (= res!505839 (= lt!333401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333402 () Unit!25705)

(assert (=> b!750005 (= lt!333402 e!418580)))

(declare-fun c!82468 () Bool)

(assert (=> b!750005 (= c!82468 (= lt!333401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750006 () Bool)

(declare-fun res!505830 () Bool)

(assert (=> b!750006 (=> (not res!505830) (not e!418582))))

(assert (=> b!750006 (= res!505830 (validKeyInArray!0 (select (arr!19981 a!3186) j!159)))))

(declare-fun b!750007 () Bool)

(declare-fun res!505838 () Bool)

(assert (=> b!750007 (=> (not res!505838) (not e!418582))))

(assert (=> b!750007 (= res!505838 (and (= (size!20401 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20401 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20401 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750008 () Bool)

(declare-fun e!418577 () Bool)

(assert (=> b!750008 (= e!418579 e!418577)))

(declare-fun res!505840 () Bool)

(assert (=> b!750008 (=> (not res!505840) (not e!418577))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750008 (= res!505840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19981 a!3186) j!159) mask!3328) (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!333405))))

(assert (=> b!750008 (= lt!333405 (Intermediate!7537 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750009 () Bool)

(declare-fun e!418584 () Bool)

(assert (=> b!750009 (= e!418584 (not e!418575))))

(declare-fun res!505845 () Bool)

(assert (=> b!750009 (=> res!505845 e!418575)))

(declare-fun lt!333410 () SeekEntryResult!7537)

(get-info :version)

(assert (=> b!750009 (= res!505845 (or (not ((_ is Intermediate!7537) lt!333410)) (bvslt x!1131 (x!63611 lt!333410)) (not (= x!1131 (x!63611 lt!333410))) (not (= index!1321 (index!32518 lt!333410)))))))

(assert (=> b!750009 e!418576))

(declare-fun res!505833 () Bool)

(assert (=> b!750009 (=> (not res!505833) (not e!418576))))

(declare-fun lt!333404 () SeekEntryResult!7537)

(assert (=> b!750009 (= res!505833 (= lt!333404 lt!333406))))

(assert (=> b!750009 (= lt!333406 (Found!7537 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41743 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!750009 (= lt!333404 (seekEntryOrOpen!0 (select (arr!19981 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750009 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333408 () Unit!25705)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25705)

(assert (=> b!750009 (= lt!333408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750010 () Bool)

(assert (=> b!750010 (= e!418582 e!418579)))

(declare-fun res!505844 () Bool)

(assert (=> b!750010 (=> (not res!505844) (not e!418579))))

(declare-fun lt!333411 () SeekEntryResult!7537)

(assert (=> b!750010 (= res!505844 (or (= lt!333411 (MissingZero!7537 i!1173)) (= lt!333411 (MissingVacant!7537 i!1173))))))

(assert (=> b!750010 (= lt!333411 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750011 () Bool)

(declare-fun res!505832 () Bool)

(assert (=> b!750011 (=> (not res!505832) (not e!418579))))

(declare-datatypes ((List!13890 0))(
  ( (Nil!13887) (Cons!13886 (h!14964 (_ BitVec 64)) (t!20197 List!13890)) )
))
(declare-fun arrayNoDuplicates!0 (array!41743 (_ BitVec 32) List!13890) Bool)

(assert (=> b!750011 (= res!505832 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13887))))

(declare-fun lt!333409 () array!41743)

(declare-fun b!750012 () Bool)

(assert (=> b!750012 (= e!418574 (= (seekEntryOrOpen!0 lt!333403 lt!333409 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333403 lt!333409 mask!3328)))))

(declare-fun b!750013 () Bool)

(declare-fun res!505831 () Bool)

(assert (=> b!750013 (=> (not res!505831) (not e!418577))))

(assert (=> b!750013 (= res!505831 e!418578)))

(declare-fun c!82469 () Bool)

(assert (=> b!750013 (= c!82469 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750014 () Bool)

(declare-fun res!505843 () Bool)

(assert (=> b!750014 (=> (not res!505843) (not e!418582))))

(declare-fun arrayContainsKey!0 (array!41743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750014 (= res!505843 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750015 () Bool)

(assert (=> b!750015 (= e!418578 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) (Found!7537 j!159)))))

(declare-fun b!750016 () Bool)

(declare-fun res!505846 () Bool)

(assert (=> b!750016 (=> (not res!505846) (not e!418577))))

(assert (=> b!750016 (= res!505846 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19981 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750017 () Bool)

(declare-fun Unit!25708 () Unit!25705)

(assert (=> b!750017 (= e!418580 Unit!25708)))

(declare-fun b!750018 () Bool)

(assert (=> b!750018 (= e!418577 e!418584)))

(declare-fun res!505841 () Bool)

(assert (=> b!750018 (=> (not res!505841) (not e!418584))))

(declare-fun lt!333407 () SeekEntryResult!7537)

(assert (=> b!750018 (= res!505841 (= lt!333407 lt!333410))))

(assert (=> b!750018 (= lt!333410 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333403 lt!333409 mask!3328))))

(assert (=> b!750018 (= lt!333407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333403 mask!3328) lt!333403 lt!333409 mask!3328))))

(assert (=> b!750018 (= lt!333403 (select (store (arr!19981 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750018 (= lt!333409 (array!41744 (store (arr!19981 a!3186) i!1173 k0!2102) (size!20401 a!3186)))))

(declare-fun b!750019 () Bool)

(declare-fun res!505842 () Bool)

(assert (=> b!750019 (=> res!505842 e!418575)))

(assert (=> b!750019 (= res!505842 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!333406)))))

(assert (= (and start!65700 res!505834) b!750007))

(assert (= (and b!750007 res!505838) b!750006))

(assert (= (and b!750006 res!505830) b!749999))

(assert (= (and b!749999 res!505829) b!750014))

(assert (= (and b!750014 res!505843) b!750010))

(assert (= (and b!750010 res!505844) b!750001))

(assert (= (and b!750001 res!505836) b!750011))

(assert (= (and b!750011 res!505832) b!750004))

(assert (= (and b!750004 res!505835) b!750008))

(assert (= (and b!750008 res!505840) b!750016))

(assert (= (and b!750016 res!505846) b!750013))

(assert (= (and b!750013 c!82469) b!750002))

(assert (= (and b!750013 (not c!82469)) b!750015))

(assert (= (and b!750013 res!505831) b!750018))

(assert (= (and b!750018 res!505841) b!750009))

(assert (= (and b!750009 res!505833) b!749998))

(assert (= (and b!750009 (not res!505845)) b!750019))

(assert (= (and b!750019 (not res!505842)) b!750003))

(assert (= (and b!750003 (not res!505837)) b!750005))

(assert (= (and b!750005 c!82468) b!750000))

(assert (= (and b!750005 (not c!82468)) b!750017))

(assert (= (and b!750005 res!505839) b!750012))

(declare-fun m!700059 () Bool)

(assert (=> b!750014 m!700059))

(declare-fun m!700061 () Bool)

(assert (=> b!750001 m!700061))

(declare-fun m!700063 () Bool)

(assert (=> b!750008 m!700063))

(assert (=> b!750008 m!700063))

(declare-fun m!700065 () Bool)

(assert (=> b!750008 m!700065))

(assert (=> b!750008 m!700065))

(assert (=> b!750008 m!700063))

(declare-fun m!700067 () Bool)

(assert (=> b!750008 m!700067))

(declare-fun m!700069 () Bool)

(assert (=> b!750018 m!700069))

(declare-fun m!700071 () Bool)

(assert (=> b!750018 m!700071))

(declare-fun m!700073 () Bool)

(assert (=> b!750018 m!700073))

(declare-fun m!700075 () Bool)

(assert (=> b!750018 m!700075))

(declare-fun m!700077 () Bool)

(assert (=> b!750018 m!700077))

(assert (=> b!750018 m!700073))

(assert (=> b!750006 m!700063))

(assert (=> b!750006 m!700063))

(declare-fun m!700079 () Bool)

(assert (=> b!750006 m!700079))

(assert (=> b!750009 m!700063))

(assert (=> b!750009 m!700063))

(declare-fun m!700081 () Bool)

(assert (=> b!750009 m!700081))

(declare-fun m!700083 () Bool)

(assert (=> b!750009 m!700083))

(declare-fun m!700085 () Bool)

(assert (=> b!750009 m!700085))

(declare-fun m!700087 () Bool)

(assert (=> b!750010 m!700087))

(assert (=> b!750003 m!700071))

(declare-fun m!700089 () Bool)

(assert (=> b!750003 m!700089))

(declare-fun m!700091 () Bool)

(assert (=> start!65700 m!700091))

(declare-fun m!700093 () Bool)

(assert (=> start!65700 m!700093))

(declare-fun m!700095 () Bool)

(assert (=> b!750012 m!700095))

(declare-fun m!700097 () Bool)

(assert (=> b!750012 m!700097))

(declare-fun m!700099 () Bool)

(assert (=> b!749999 m!700099))

(declare-fun m!700101 () Bool)

(assert (=> b!750011 m!700101))

(assert (=> b!750019 m!700063))

(assert (=> b!750019 m!700063))

(declare-fun m!700103 () Bool)

(assert (=> b!750019 m!700103))

(assert (=> b!750002 m!700063))

(assert (=> b!750002 m!700063))

(declare-fun m!700105 () Bool)

(assert (=> b!750002 m!700105))

(assert (=> b!749998 m!700063))

(assert (=> b!749998 m!700063))

(declare-fun m!700107 () Bool)

(assert (=> b!749998 m!700107))

(declare-fun m!700109 () Bool)

(assert (=> b!750016 m!700109))

(assert (=> b!750015 m!700063))

(assert (=> b!750015 m!700063))

(assert (=> b!750015 m!700103))

(check-sat (not b!750015) (not b!750001) (not b!750002) (not b!750019) (not b!750010) (not b!749998) (not b!749999) (not b!750006) (not b!750008) (not start!65700) (not b!750014) (not b!750009) (not b!750012) (not b!750018) (not b!750011))
(check-sat)
