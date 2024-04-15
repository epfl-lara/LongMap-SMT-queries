; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65456 () Bool)

(assert start!65456)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41646 0))(
  ( (array!41647 (arr!19937 (Array (_ BitVec 32) (_ BitVec 64))) (size!20358 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41646)

(declare-fun b!746062 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!416624 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7534 0))(
  ( (MissingZero!7534 (index!32504 (_ BitVec 32))) (Found!7534 (index!32505 (_ BitVec 32))) (Intermediate!7534 (undefined!8346 Bool) (index!32506 (_ BitVec 32)) (x!63463 (_ BitVec 32))) (Undefined!7534) (MissingVacant!7534 (index!32507 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41646 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!746062 (= e!416624 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19937 a!3186) j!159) a!3186 mask!3328) (Found!7534 j!159)))))

(declare-fun b!746063 () Bool)

(declare-fun res!502987 () Bool)

(declare-fun e!416626 () Bool)

(assert (=> b!746063 (=> (not res!502987) (not e!416626))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746063 (= res!502987 (and (= (size!20358 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20358 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20358 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746064 () Bool)

(declare-fun e!416631 () Bool)

(declare-fun e!416627 () Bool)

(assert (=> b!746064 (= e!416631 (not e!416627))))

(declare-fun res!502992 () Bool)

(assert (=> b!746064 (=> res!502992 e!416627)))

(declare-fun lt!331409 () SeekEntryResult!7534)

(get-info :version)

(assert (=> b!746064 (= res!502992 (or (not ((_ is Intermediate!7534) lt!331409)) (bvslt x!1131 (x!63463 lt!331409)) (not (= x!1131 (x!63463 lt!331409))) (not (= index!1321 (index!32506 lt!331409)))))))

(declare-fun e!416628 () Bool)

(assert (=> b!746064 e!416628))

(declare-fun res!502990 () Bool)

(assert (=> b!746064 (=> (not res!502990) (not e!416628))))

(declare-fun lt!331408 () SeekEntryResult!7534)

(declare-fun lt!331411 () SeekEntryResult!7534)

(assert (=> b!746064 (= res!502990 (= lt!331408 lt!331411))))

(assert (=> b!746064 (= lt!331411 (Found!7534 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41646 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!746064 (= lt!331408 (seekEntryOrOpen!0 (select (arr!19937 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41646 (_ BitVec 32)) Bool)

(assert (=> b!746064 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25520 0))(
  ( (Unit!25521) )
))
(declare-fun lt!331410 () Unit!25520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25520)

(assert (=> b!746064 (= lt!331410 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746065 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746065 (= e!416628 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19937 a!3186) j!159) a!3186 mask!3328) lt!331411))))

(declare-fun b!746066 () Bool)

(declare-fun e!416632 () Bool)

(assert (=> b!746066 (= e!416632 true)))

(declare-fun lt!331413 () SeekEntryResult!7534)

(assert (=> b!746066 (= lt!331408 lt!331413)))

(declare-fun b!746067 () Bool)

(assert (=> b!746067 (= e!416627 e!416632)))

(declare-fun res!502993 () Bool)

(assert (=> b!746067 (=> res!502993 e!416632)))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!331414 () (_ BitVec 64))

(assert (=> b!746067 (= res!502993 (or (not (= lt!331413 lt!331411)) (= (select (store (arr!19937 a!3186) i!1173 k0!2102) index!1321) lt!331414) (not (= (select (store (arr!19937 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746067 (= lt!331413 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19937 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746068 () Bool)

(declare-fun res!502984 () Bool)

(assert (=> b!746068 (=> (not res!502984) (not e!416626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746068 (= res!502984 (validKeyInArray!0 (select (arr!19937 a!3186) j!159)))))

(declare-fun b!746069 () Bool)

(declare-fun res!502985 () Bool)

(declare-fun e!416625 () Bool)

(assert (=> b!746069 (=> (not res!502985) (not e!416625))))

(declare-datatypes ((List!13978 0))(
  ( (Nil!13975) (Cons!13974 (h!15046 (_ BitVec 64)) (t!20284 List!13978)) )
))
(declare-fun arrayNoDuplicates!0 (array!41646 (_ BitVec 32) List!13978) Bool)

(assert (=> b!746069 (= res!502985 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13975))))

(declare-fun b!746070 () Bool)

(declare-fun e!416629 () Bool)

(assert (=> b!746070 (= e!416629 e!416631)))

(declare-fun res!502994 () Bool)

(assert (=> b!746070 (=> (not res!502994) (not e!416631))))

(declare-fun lt!331412 () SeekEntryResult!7534)

(assert (=> b!746070 (= res!502994 (= lt!331412 lt!331409))))

(declare-fun lt!331406 () array!41646)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41646 (_ BitVec 32)) SeekEntryResult!7534)

(assert (=> b!746070 (= lt!331409 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331414 lt!331406 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746070 (= lt!331412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331414 mask!3328) lt!331414 lt!331406 mask!3328))))

(assert (=> b!746070 (= lt!331414 (select (store (arr!19937 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746070 (= lt!331406 (array!41647 (store (arr!19937 a!3186) i!1173 k0!2102) (size!20358 a!3186)))))

(declare-fun b!746071 () Bool)

(declare-fun res!502980 () Bool)

(assert (=> b!746071 (=> (not res!502980) (not e!416625))))

(assert (=> b!746071 (= res!502980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746072 () Bool)

(assert (=> b!746072 (= e!416625 e!416629)))

(declare-fun res!502991 () Bool)

(assert (=> b!746072 (=> (not res!502991) (not e!416629))))

(declare-fun lt!331415 () SeekEntryResult!7534)

(assert (=> b!746072 (= res!502991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19937 a!3186) j!159) mask!3328) (select (arr!19937 a!3186) j!159) a!3186 mask!3328) lt!331415))))

(assert (=> b!746072 (= lt!331415 (Intermediate!7534 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746073 () Bool)

(declare-fun res!502981 () Bool)

(assert (=> b!746073 (=> (not res!502981) (not e!416625))))

(assert (=> b!746073 (= res!502981 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20358 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20358 a!3186))))))

(declare-fun b!746074 () Bool)

(declare-fun res!502988 () Bool)

(assert (=> b!746074 (=> (not res!502988) (not e!416626))))

(declare-fun arrayContainsKey!0 (array!41646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746074 (= res!502988 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!502982 () Bool)

(assert (=> start!65456 (=> (not res!502982) (not e!416626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65456 (= res!502982 (validMask!0 mask!3328))))

(assert (=> start!65456 e!416626))

(assert (=> start!65456 true))

(declare-fun array_inv!15820 (array!41646) Bool)

(assert (=> start!65456 (array_inv!15820 a!3186)))

(declare-fun b!746061 () Bool)

(declare-fun res!502995 () Bool)

(assert (=> b!746061 (=> (not res!502995) (not e!416626))))

(assert (=> b!746061 (= res!502995 (validKeyInArray!0 k0!2102))))

(declare-fun b!746075 () Bool)

(assert (=> b!746075 (= e!416626 e!416625)))

(declare-fun res!502986 () Bool)

(assert (=> b!746075 (=> (not res!502986) (not e!416625))))

(declare-fun lt!331407 () SeekEntryResult!7534)

(assert (=> b!746075 (= res!502986 (or (= lt!331407 (MissingZero!7534 i!1173)) (= lt!331407 (MissingVacant!7534 i!1173))))))

(assert (=> b!746075 (= lt!331407 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746076 () Bool)

(declare-fun res!502983 () Bool)

(assert (=> b!746076 (=> (not res!502983) (not e!416629))))

(assert (=> b!746076 (= res!502983 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19937 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746077 () Bool)

(declare-fun res!502989 () Bool)

(assert (=> b!746077 (=> (not res!502989) (not e!416629))))

(assert (=> b!746077 (= res!502989 e!416624)))

(declare-fun c!81921 () Bool)

(assert (=> b!746077 (= c!81921 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746078 () Bool)

(assert (=> b!746078 (= e!416624 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19937 a!3186) j!159) a!3186 mask!3328) lt!331415))))

(assert (= (and start!65456 res!502982) b!746063))

(assert (= (and b!746063 res!502987) b!746068))

(assert (= (and b!746068 res!502984) b!746061))

(assert (= (and b!746061 res!502995) b!746074))

(assert (= (and b!746074 res!502988) b!746075))

(assert (= (and b!746075 res!502986) b!746071))

(assert (= (and b!746071 res!502980) b!746069))

(assert (= (and b!746069 res!502985) b!746073))

(assert (= (and b!746073 res!502981) b!746072))

(assert (= (and b!746072 res!502991) b!746076))

(assert (= (and b!746076 res!502983) b!746077))

(assert (= (and b!746077 c!81921) b!746078))

(assert (= (and b!746077 (not c!81921)) b!746062))

(assert (= (and b!746077 res!502989) b!746070))

(assert (= (and b!746070 res!502994) b!746064))

(assert (= (and b!746064 res!502990) b!746065))

(assert (= (and b!746064 (not res!502992)) b!746067))

(assert (= (and b!746067 (not res!502993)) b!746066))

(declare-fun m!695825 () Bool)

(assert (=> b!746067 m!695825))

(declare-fun m!695827 () Bool)

(assert (=> b!746067 m!695827))

(declare-fun m!695829 () Bool)

(assert (=> b!746067 m!695829))

(assert (=> b!746067 m!695829))

(declare-fun m!695831 () Bool)

(assert (=> b!746067 m!695831))

(declare-fun m!695833 () Bool)

(assert (=> b!746070 m!695833))

(declare-fun m!695835 () Bool)

(assert (=> b!746070 m!695835))

(declare-fun m!695837 () Bool)

(assert (=> b!746070 m!695837))

(assert (=> b!746070 m!695825))

(declare-fun m!695839 () Bool)

(assert (=> b!746070 m!695839))

(assert (=> b!746070 m!695835))

(declare-fun m!695841 () Bool)

(assert (=> b!746076 m!695841))

(assert (=> b!746065 m!695829))

(assert (=> b!746065 m!695829))

(declare-fun m!695843 () Bool)

(assert (=> b!746065 m!695843))

(declare-fun m!695845 () Bool)

(assert (=> b!746061 m!695845))

(assert (=> b!746064 m!695829))

(assert (=> b!746064 m!695829))

(declare-fun m!695847 () Bool)

(assert (=> b!746064 m!695847))

(declare-fun m!695849 () Bool)

(assert (=> b!746064 m!695849))

(declare-fun m!695851 () Bool)

(assert (=> b!746064 m!695851))

(assert (=> b!746072 m!695829))

(assert (=> b!746072 m!695829))

(declare-fun m!695853 () Bool)

(assert (=> b!746072 m!695853))

(assert (=> b!746072 m!695853))

(assert (=> b!746072 m!695829))

(declare-fun m!695855 () Bool)

(assert (=> b!746072 m!695855))

(assert (=> b!746068 m!695829))

(assert (=> b!746068 m!695829))

(declare-fun m!695857 () Bool)

(assert (=> b!746068 m!695857))

(declare-fun m!695859 () Bool)

(assert (=> b!746075 m!695859))

(declare-fun m!695861 () Bool)

(assert (=> start!65456 m!695861))

(declare-fun m!695863 () Bool)

(assert (=> start!65456 m!695863))

(declare-fun m!695865 () Bool)

(assert (=> b!746069 m!695865))

(declare-fun m!695867 () Bool)

(assert (=> b!746074 m!695867))

(assert (=> b!746062 m!695829))

(assert (=> b!746062 m!695829))

(assert (=> b!746062 m!695831))

(declare-fun m!695869 () Bool)

(assert (=> b!746071 m!695869))

(assert (=> b!746078 m!695829))

(assert (=> b!746078 m!695829))

(declare-fun m!695871 () Bool)

(assert (=> b!746078 m!695871))

(check-sat (not b!746078) (not b!746069) (not b!746067) (not b!746070) (not start!65456) (not b!746061) (not b!746068) (not b!746072) (not b!746075) (not b!746074) (not b!746065) (not b!746071) (not b!746062) (not b!746064))
(check-sat)
