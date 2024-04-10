; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67730 () Bool)

(assert start!67730)

(declare-fun b!785897 () Bool)

(declare-fun e!436898 () Bool)

(declare-fun e!436902 () Bool)

(assert (=> b!785897 (= e!436898 e!436902)))

(declare-fun res!532046 () Bool)

(assert (=> b!785897 (=> (not res!532046) (not e!436902))))

(declare-datatypes ((SeekEntryResult!8073 0))(
  ( (MissingZero!8073 (index!34660 (_ BitVec 32))) (Found!8073 (index!34661 (_ BitVec 32))) (Intermediate!8073 (undefined!8885 Bool) (index!34662 (_ BitVec 32)) (x!65605 (_ BitVec 32))) (Undefined!8073) (MissingVacant!8073 (index!34663 (_ BitVec 32))) )
))
(declare-fun lt!350449 () SeekEntryResult!8073)

(declare-fun lt!350450 () SeekEntryResult!8073)

(assert (=> b!785897 (= res!532046 (= lt!350449 lt!350450))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350456 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42770 0))(
  ( (array!42771 (arr!20473 (Array (_ BitVec 32) (_ BitVec 64))) (size!20894 (_ BitVec 32))) )
))
(declare-fun lt!350451 () array!42770)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42770 (_ BitVec 32)) SeekEntryResult!8073)

(assert (=> b!785897 (= lt!350450 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350456 lt!350451 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785897 (= lt!350449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350456 mask!3328) lt!350456 lt!350451 mask!3328))))

(declare-fun a!3186 () array!42770)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785897 (= lt!350456 (select (store (arr!20473 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785897 (= lt!350451 (array!42771 (store (arr!20473 a!3186) i!1173 k0!2102) (size!20894 a!3186)))))

(declare-fun b!785898 () Bool)

(declare-fun res!532041 () Bool)

(declare-fun e!436894 () Bool)

(assert (=> b!785898 (=> (not res!532041) (not e!436894))))

(declare-datatypes ((List!14475 0))(
  ( (Nil!14472) (Cons!14471 (h!15594 (_ BitVec 64)) (t!20790 List!14475)) )
))
(declare-fun arrayNoDuplicates!0 (array!42770 (_ BitVec 32) List!14475) Bool)

(assert (=> b!785898 (= res!532041 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14472))))

(declare-fun b!785899 () Bool)

(declare-fun e!436896 () Bool)

(assert (=> b!785899 (= e!436896 true)))

(declare-fun e!436900 () Bool)

(assert (=> b!785899 e!436900))

(declare-fun res!532048 () Bool)

(assert (=> b!785899 (=> (not res!532048) (not e!436900))))

(declare-fun lt!350446 () (_ BitVec 64))

(assert (=> b!785899 (= res!532048 (= lt!350446 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27180 0))(
  ( (Unit!27181) )
))
(declare-fun lt!350448 () Unit!27180)

(declare-fun e!436904 () Unit!27180)

(assert (=> b!785899 (= lt!350448 e!436904)))

(declare-fun c!87336 () Bool)

(assert (=> b!785899 (= c!87336 (= lt!350446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785900 () Bool)

(declare-fun e!436903 () Bool)

(assert (=> b!785900 (= e!436903 e!436894)))

(declare-fun res!532056 () Bool)

(assert (=> b!785900 (=> (not res!532056) (not e!436894))))

(declare-fun lt!350453 () SeekEntryResult!8073)

(assert (=> b!785900 (= res!532056 (or (= lt!350453 (MissingZero!8073 i!1173)) (= lt!350453 (MissingVacant!8073 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42770 (_ BitVec 32)) SeekEntryResult!8073)

(assert (=> b!785900 (= lt!350453 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785901 () Bool)

(declare-fun res!532045 () Bool)

(assert (=> b!785901 (=> (not res!532045) (not e!436894))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785901 (= res!532045 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20894 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20894 a!3186))))))

(declare-fun b!785902 () Bool)

(declare-fun res!532042 () Bool)

(assert (=> b!785902 (=> (not res!532042) (not e!436900))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42770 (_ BitVec 32)) SeekEntryResult!8073)

(assert (=> b!785902 (= res!532042 (= (seekEntryOrOpen!0 lt!350456 lt!350451 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350456 lt!350451 mask!3328)))))

(declare-fun b!785903 () Bool)

(declare-fun res!532054 () Bool)

(assert (=> b!785903 (=> (not res!532054) (not e!436903))))

(assert (=> b!785903 (= res!532054 (and (= (size!20894 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20894 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20894 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785904 () Bool)

(assert (=> b!785904 (= e!436894 e!436898)))

(declare-fun res!532051 () Bool)

(assert (=> b!785904 (=> (not res!532051) (not e!436898))))

(declare-fun lt!350447 () SeekEntryResult!8073)

(assert (=> b!785904 (= res!532051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20473 a!3186) j!159) mask!3328) (select (arr!20473 a!3186) j!159) a!3186 mask!3328) lt!350447))))

(assert (=> b!785904 (= lt!350447 (Intermediate!8073 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785905 () Bool)

(declare-fun lt!350455 () SeekEntryResult!8073)

(declare-fun lt!350454 () SeekEntryResult!8073)

(assert (=> b!785905 (= e!436900 (= lt!350455 lt!350454))))

(declare-fun b!785906 () Bool)

(declare-fun e!436895 () Bool)

(assert (=> b!785906 (= e!436895 e!436896)))

(declare-fun res!532058 () Bool)

(assert (=> b!785906 (=> res!532058 e!436896)))

(assert (=> b!785906 (= res!532058 (= lt!350446 lt!350456))))

(assert (=> b!785906 (= lt!350446 (select (store (arr!20473 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785907 () Bool)

(declare-fun Unit!27182 () Unit!27180)

(assert (=> b!785907 (= e!436904 Unit!27182)))

(declare-fun b!785908 () Bool)

(declare-fun e!436901 () Bool)

(assert (=> b!785908 (= e!436902 (not e!436901))))

(declare-fun res!532043 () Bool)

(assert (=> b!785908 (=> res!532043 e!436901)))

(get-info :version)

(assert (=> b!785908 (= res!532043 (or (not ((_ is Intermediate!8073) lt!350450)) (bvslt x!1131 (x!65605 lt!350450)) (not (= x!1131 (x!65605 lt!350450))) (not (= index!1321 (index!34662 lt!350450)))))))

(declare-fun e!436899 () Bool)

(assert (=> b!785908 e!436899))

(declare-fun res!532044 () Bool)

(assert (=> b!785908 (=> (not res!532044) (not e!436899))))

(declare-fun lt!350445 () SeekEntryResult!8073)

(assert (=> b!785908 (= res!532044 (= lt!350455 lt!350445))))

(assert (=> b!785908 (= lt!350445 (Found!8073 j!159))))

(assert (=> b!785908 (= lt!350455 (seekEntryOrOpen!0 (select (arr!20473 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42770 (_ BitVec 32)) Bool)

(assert (=> b!785908 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350452 () Unit!27180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27180)

(assert (=> b!785908 (= lt!350452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785909 () Bool)

(assert (=> b!785909 (= e!436899 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20473 a!3186) j!159) a!3186 mask!3328) lt!350445))))

(declare-fun b!785910 () Bool)

(declare-fun e!436893 () Bool)

(assert (=> b!785910 (= e!436893 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20473 a!3186) j!159) a!3186 mask!3328) lt!350447))))

(declare-fun b!785911 () Bool)

(declare-fun res!532053 () Bool)

(assert (=> b!785911 (=> (not res!532053) (not e!436894))))

(assert (=> b!785911 (= res!532053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785912 () Bool)

(declare-fun res!532040 () Bool)

(assert (=> b!785912 (=> (not res!532040) (not e!436903))))

(declare-fun arrayContainsKey!0 (array!42770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785912 (= res!532040 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785913 () Bool)

(declare-fun res!532047 () Bool)

(assert (=> b!785913 (=> (not res!532047) (not e!436903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785913 (= res!532047 (validKeyInArray!0 (select (arr!20473 a!3186) j!159)))))

(declare-fun b!785914 () Bool)

(assert (=> b!785914 (= e!436893 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20473 a!3186) j!159) a!3186 mask!3328) (Found!8073 j!159)))))

(declare-fun b!785915 () Bool)

(assert (=> b!785915 (= e!436901 e!436895)))

(declare-fun res!532052 () Bool)

(assert (=> b!785915 (=> res!532052 e!436895)))

(assert (=> b!785915 (= res!532052 (not (= lt!350454 lt!350445)))))

(assert (=> b!785915 (= lt!350454 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20473 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785916 () Bool)

(declare-fun res!532049 () Bool)

(assert (=> b!785916 (=> (not res!532049) (not e!436898))))

(assert (=> b!785916 (= res!532049 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20473 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785917 () Bool)

(declare-fun res!532057 () Bool)

(assert (=> b!785917 (=> (not res!532057) (not e!436903))))

(assert (=> b!785917 (= res!532057 (validKeyInArray!0 k0!2102))))

(declare-fun res!532055 () Bool)

(assert (=> start!67730 (=> (not res!532055) (not e!436903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67730 (= res!532055 (validMask!0 mask!3328))))

(assert (=> start!67730 e!436903))

(assert (=> start!67730 true))

(declare-fun array_inv!16269 (array!42770) Bool)

(assert (=> start!67730 (array_inv!16269 a!3186)))

(declare-fun b!785918 () Bool)

(declare-fun Unit!27183 () Unit!27180)

(assert (=> b!785918 (= e!436904 Unit!27183)))

(assert (=> b!785918 false))

(declare-fun b!785919 () Bool)

(declare-fun res!532050 () Bool)

(assert (=> b!785919 (=> (not res!532050) (not e!436898))))

(assert (=> b!785919 (= res!532050 e!436893)))

(declare-fun c!87337 () Bool)

(assert (=> b!785919 (= c!87337 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67730 res!532055) b!785903))

(assert (= (and b!785903 res!532054) b!785913))

(assert (= (and b!785913 res!532047) b!785917))

(assert (= (and b!785917 res!532057) b!785912))

(assert (= (and b!785912 res!532040) b!785900))

(assert (= (and b!785900 res!532056) b!785911))

(assert (= (and b!785911 res!532053) b!785898))

(assert (= (and b!785898 res!532041) b!785901))

(assert (= (and b!785901 res!532045) b!785904))

(assert (= (and b!785904 res!532051) b!785916))

(assert (= (and b!785916 res!532049) b!785919))

(assert (= (and b!785919 c!87337) b!785910))

(assert (= (and b!785919 (not c!87337)) b!785914))

(assert (= (and b!785919 res!532050) b!785897))

(assert (= (and b!785897 res!532046) b!785908))

(assert (= (and b!785908 res!532044) b!785909))

(assert (= (and b!785908 (not res!532043)) b!785915))

(assert (= (and b!785915 (not res!532052)) b!785906))

(assert (= (and b!785906 (not res!532058)) b!785899))

(assert (= (and b!785899 c!87336) b!785918))

(assert (= (and b!785899 (not c!87336)) b!785907))

(assert (= (and b!785899 res!532048) b!785902))

(assert (= (and b!785902 res!532042) b!785905))

(declare-fun m!727857 () Bool)

(assert (=> b!785909 m!727857))

(assert (=> b!785909 m!727857))

(declare-fun m!727859 () Bool)

(assert (=> b!785909 m!727859))

(assert (=> b!785904 m!727857))

(assert (=> b!785904 m!727857))

(declare-fun m!727861 () Bool)

(assert (=> b!785904 m!727861))

(assert (=> b!785904 m!727861))

(assert (=> b!785904 m!727857))

(declare-fun m!727863 () Bool)

(assert (=> b!785904 m!727863))

(assert (=> b!785915 m!727857))

(assert (=> b!785915 m!727857))

(declare-fun m!727865 () Bool)

(assert (=> b!785915 m!727865))

(assert (=> b!785908 m!727857))

(assert (=> b!785908 m!727857))

(declare-fun m!727867 () Bool)

(assert (=> b!785908 m!727867))

(declare-fun m!727869 () Bool)

(assert (=> b!785908 m!727869))

(declare-fun m!727871 () Bool)

(assert (=> b!785908 m!727871))

(assert (=> b!785910 m!727857))

(assert (=> b!785910 m!727857))

(declare-fun m!727873 () Bool)

(assert (=> b!785910 m!727873))

(assert (=> b!785913 m!727857))

(assert (=> b!785913 m!727857))

(declare-fun m!727875 () Bool)

(assert (=> b!785913 m!727875))

(declare-fun m!727877 () Bool)

(assert (=> b!785911 m!727877))

(declare-fun m!727879 () Bool)

(assert (=> b!785897 m!727879))

(assert (=> b!785897 m!727879))

(declare-fun m!727881 () Bool)

(assert (=> b!785897 m!727881))

(declare-fun m!727883 () Bool)

(assert (=> b!785897 m!727883))

(declare-fun m!727885 () Bool)

(assert (=> b!785897 m!727885))

(declare-fun m!727887 () Bool)

(assert (=> b!785897 m!727887))

(declare-fun m!727889 () Bool)

(assert (=> b!785902 m!727889))

(declare-fun m!727891 () Bool)

(assert (=> b!785902 m!727891))

(declare-fun m!727893 () Bool)

(assert (=> start!67730 m!727893))

(declare-fun m!727895 () Bool)

(assert (=> start!67730 m!727895))

(assert (=> b!785914 m!727857))

(assert (=> b!785914 m!727857))

(assert (=> b!785914 m!727865))

(declare-fun m!727897 () Bool)

(assert (=> b!785916 m!727897))

(declare-fun m!727899 () Bool)

(assert (=> b!785912 m!727899))

(declare-fun m!727901 () Bool)

(assert (=> b!785898 m!727901))

(assert (=> b!785906 m!727883))

(declare-fun m!727903 () Bool)

(assert (=> b!785906 m!727903))

(declare-fun m!727905 () Bool)

(assert (=> b!785900 m!727905))

(declare-fun m!727907 () Bool)

(assert (=> b!785917 m!727907))

(check-sat (not b!785904) (not b!785911) (not b!785917) (not b!785910) (not b!785898) (not b!785908) (not b!785912) (not b!785913) (not b!785915) (not b!785902) (not b!785897) (not b!785909) (not b!785900) (not start!67730) (not b!785914))
(check-sat)
