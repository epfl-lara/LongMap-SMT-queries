; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65800 () Bool)

(assert start!65800)

(declare-fun b!757013 () Bool)

(declare-fun e!422099 () Bool)

(assert (=> b!757013 (= e!422099 true)))

(declare-fun e!422101 () Bool)

(assert (=> b!757013 e!422101))

(declare-fun res!511934 () Bool)

(assert (=> b!757013 (=> (not res!511934) (not e!422101))))

(declare-fun lt!337090 () (_ BitVec 64))

(assert (=> b!757013 (= res!511934 (= lt!337090 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26180 0))(
  ( (Unit!26181) )
))
(declare-fun lt!337092 () Unit!26180)

(declare-fun e!422100 () Unit!26180)

(assert (=> b!757013 (= lt!337092 e!422100)))

(declare-fun c!82929 () Bool)

(assert (=> b!757013 (= c!82929 (= lt!337090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757015 () Bool)

(declare-fun e!422102 () Bool)

(declare-fun e!422097 () Bool)

(assert (=> b!757015 (= e!422102 e!422097)))

(declare-fun res!511932 () Bool)

(assert (=> b!757015 (=> (not res!511932) (not e!422097))))

(declare-datatypes ((array!41973 0))(
  ( (array!41974 (arr!20100 (Array (_ BitVec 32) (_ BitVec 64))) (size!20521 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41973)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7700 0))(
  ( (MissingZero!7700 (index!33168 (_ BitVec 32))) (Found!7700 (index!33169 (_ BitVec 32))) (Intermediate!7700 (undefined!8512 Bool) (index!33170 (_ BitVec 32)) (x!64066 (_ BitVec 32))) (Undefined!7700) (MissingVacant!7700 (index!33171 (_ BitVec 32))) )
))
(declare-fun lt!337095 () SeekEntryResult!7700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41973 (_ BitVec 32)) SeekEntryResult!7700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757015 (= res!511932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20100 a!3186) j!159) mask!3328) (select (arr!20100 a!3186) j!159) a!3186 mask!3328) lt!337095))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757015 (= lt!337095 (Intermediate!7700 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757016 () Bool)

(declare-fun Unit!26182 () Unit!26180)

(assert (=> b!757016 (= e!422100 Unit!26182)))

(assert (=> b!757016 false))

(declare-fun lt!337096 () SeekEntryResult!7700)

(declare-fun e!422096 () Bool)

(declare-fun b!757017 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41973 (_ BitVec 32)) SeekEntryResult!7700)

(assert (=> b!757017 (= e!422096 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20100 a!3186) j!159) a!3186 mask!3328) lt!337096))))

(declare-fun b!757018 () Bool)

(declare-fun res!511930 () Bool)

(declare-fun e!422103 () Bool)

(assert (=> b!757018 (=> (not res!511930) (not e!422103))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757018 (= res!511930 (validKeyInArray!0 k!2102))))

(declare-fun b!757019 () Bool)

(assert (=> b!757019 (= e!422103 e!422102)))

(declare-fun res!511926 () Bool)

(assert (=> b!757019 (=> (not res!511926) (not e!422102))))

(declare-fun lt!337094 () SeekEntryResult!7700)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757019 (= res!511926 (or (= lt!337094 (MissingZero!7700 i!1173)) (= lt!337094 (MissingVacant!7700 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41973 (_ BitVec 32)) SeekEntryResult!7700)

(assert (=> b!757019 (= lt!337094 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757020 () Bool)

(declare-fun res!511919 () Bool)

(assert (=> b!757020 (=> (not res!511919) (not e!422103))))

(assert (=> b!757020 (= res!511919 (and (= (size!20521 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20521 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20521 a!3186)) (not (= i!1173 j!159))))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!422094 () Bool)

(declare-fun b!757021 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!757021 (= e!422094 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20100 a!3186) j!159) a!3186 mask!3328) (Found!7700 j!159)))))

(declare-fun b!757022 () Bool)

(declare-fun e!422105 () Bool)

(declare-fun e!422098 () Bool)

(assert (=> b!757022 (= e!422105 (not e!422098))))

(declare-fun res!511927 () Bool)

(assert (=> b!757022 (=> res!511927 e!422098)))

(declare-fun lt!337097 () SeekEntryResult!7700)

(assert (=> b!757022 (= res!511927 (or (not (is-Intermediate!7700 lt!337097)) (bvslt x!1131 (x!64066 lt!337097)) (not (= x!1131 (x!64066 lt!337097))) (not (= index!1321 (index!33170 lt!337097)))))))

(assert (=> b!757022 e!422096))

(declare-fun res!511928 () Bool)

(assert (=> b!757022 (=> (not res!511928) (not e!422096))))

(declare-fun lt!337089 () SeekEntryResult!7700)

(assert (=> b!757022 (= res!511928 (= lt!337089 lt!337096))))

(assert (=> b!757022 (= lt!337096 (Found!7700 j!159))))

(assert (=> b!757022 (= lt!337089 (seekEntryOrOpen!0 (select (arr!20100 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41973 (_ BitVec 32)) Bool)

(assert (=> b!757022 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337093 () Unit!26180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26180)

(assert (=> b!757022 (= lt!337093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757023 () Bool)

(declare-fun res!511921 () Bool)

(assert (=> b!757023 (=> (not res!511921) (not e!422097))))

(assert (=> b!757023 (= res!511921 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20100 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757024 () Bool)

(declare-fun res!511917 () Bool)

(assert (=> b!757024 (=> (not res!511917) (not e!422103))))

(assert (=> b!757024 (= res!511917 (validKeyInArray!0 (select (arr!20100 a!3186) j!159)))))

(declare-fun b!757025 () Bool)

(declare-fun e!422104 () Bool)

(assert (=> b!757025 (= e!422098 e!422104)))

(declare-fun res!511933 () Bool)

(assert (=> b!757025 (=> res!511933 e!422104)))

(declare-fun lt!337087 () SeekEntryResult!7700)

(assert (=> b!757025 (= res!511933 (not (= lt!337087 lt!337096)))))

(assert (=> b!757025 (= lt!337087 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20100 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757026 () Bool)

(assert (=> b!757026 (= e!422101 (= lt!337089 lt!337087))))

(declare-fun b!757027 () Bool)

(assert (=> b!757027 (= e!422094 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20100 a!3186) j!159) a!3186 mask!3328) lt!337095))))

(declare-fun b!757028 () Bool)

(declare-fun res!511918 () Bool)

(assert (=> b!757028 (=> (not res!511918) (not e!422102))))

(declare-datatypes ((List!14102 0))(
  ( (Nil!14099) (Cons!14098 (h!15170 (_ BitVec 64)) (t!20417 List!14102)) )
))
(declare-fun arrayNoDuplicates!0 (array!41973 (_ BitVec 32) List!14102) Bool)

(assert (=> b!757028 (= res!511918 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14099))))

(declare-fun b!757029 () Bool)

(declare-fun res!511924 () Bool)

(assert (=> b!757029 (=> (not res!511924) (not e!422101))))

(declare-fun lt!337091 () array!41973)

(declare-fun lt!337088 () (_ BitVec 64))

(assert (=> b!757029 (= res!511924 (= (seekEntryOrOpen!0 lt!337088 lt!337091 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337088 lt!337091 mask!3328)))))

(declare-fun b!757030 () Bool)

(assert (=> b!757030 (= e!422097 e!422105)))

(declare-fun res!511925 () Bool)

(assert (=> b!757030 (=> (not res!511925) (not e!422105))))

(declare-fun lt!337086 () SeekEntryResult!7700)

(assert (=> b!757030 (= res!511925 (= lt!337086 lt!337097))))

(assert (=> b!757030 (= lt!337097 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337088 lt!337091 mask!3328))))

(assert (=> b!757030 (= lt!337086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337088 mask!3328) lt!337088 lt!337091 mask!3328))))

(assert (=> b!757030 (= lt!337088 (select (store (arr!20100 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757030 (= lt!337091 (array!41974 (store (arr!20100 a!3186) i!1173 k!2102) (size!20521 a!3186)))))

(declare-fun b!757031 () Bool)

(declare-fun res!511923 () Bool)

(assert (=> b!757031 (=> (not res!511923) (not e!422097))))

(assert (=> b!757031 (= res!511923 e!422094)))

(declare-fun c!82930 () Bool)

(assert (=> b!757031 (= c!82930 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757032 () Bool)

(declare-fun res!511916 () Bool)

(assert (=> b!757032 (=> (not res!511916) (not e!422103))))

(declare-fun arrayContainsKey!0 (array!41973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757032 (= res!511916 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757033 () Bool)

(declare-fun res!511920 () Bool)

(assert (=> b!757033 (=> (not res!511920) (not e!422102))))

(assert (=> b!757033 (= res!511920 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20521 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20521 a!3186))))))

(declare-fun res!511929 () Bool)

(assert (=> start!65800 (=> (not res!511929) (not e!422103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65800 (= res!511929 (validMask!0 mask!3328))))

(assert (=> start!65800 e!422103))

(assert (=> start!65800 true))

(declare-fun array_inv!15896 (array!41973) Bool)

(assert (=> start!65800 (array_inv!15896 a!3186)))

(declare-fun b!757014 () Bool)

(declare-fun res!511922 () Bool)

(assert (=> b!757014 (=> (not res!511922) (not e!422102))))

(assert (=> b!757014 (= res!511922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757034 () Bool)

(assert (=> b!757034 (= e!422104 e!422099)))

(declare-fun res!511931 () Bool)

(assert (=> b!757034 (=> res!511931 e!422099)))

(assert (=> b!757034 (= res!511931 (= lt!337090 lt!337088))))

(assert (=> b!757034 (= lt!337090 (select (store (arr!20100 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757035 () Bool)

(declare-fun Unit!26183 () Unit!26180)

(assert (=> b!757035 (= e!422100 Unit!26183)))

(assert (= (and start!65800 res!511929) b!757020))

(assert (= (and b!757020 res!511919) b!757024))

(assert (= (and b!757024 res!511917) b!757018))

(assert (= (and b!757018 res!511930) b!757032))

(assert (= (and b!757032 res!511916) b!757019))

(assert (= (and b!757019 res!511926) b!757014))

(assert (= (and b!757014 res!511922) b!757028))

(assert (= (and b!757028 res!511918) b!757033))

(assert (= (and b!757033 res!511920) b!757015))

(assert (= (and b!757015 res!511932) b!757023))

(assert (= (and b!757023 res!511921) b!757031))

(assert (= (and b!757031 c!82930) b!757027))

(assert (= (and b!757031 (not c!82930)) b!757021))

(assert (= (and b!757031 res!511923) b!757030))

(assert (= (and b!757030 res!511925) b!757022))

(assert (= (and b!757022 res!511928) b!757017))

(assert (= (and b!757022 (not res!511927)) b!757025))

(assert (= (and b!757025 (not res!511933)) b!757034))

(assert (= (and b!757034 (not res!511931)) b!757013))

(assert (= (and b!757013 c!82929) b!757016))

(assert (= (and b!757013 (not c!82929)) b!757035))

(assert (= (and b!757013 res!511934) b!757029))

(assert (= (and b!757029 res!511924) b!757026))

(declare-fun m!704827 () Bool)

(assert (=> b!757034 m!704827))

(declare-fun m!704829 () Bool)

(assert (=> b!757034 m!704829))

(declare-fun m!704831 () Bool)

(assert (=> b!757025 m!704831))

(assert (=> b!757025 m!704831))

(declare-fun m!704833 () Bool)

(assert (=> b!757025 m!704833))

(declare-fun m!704835 () Bool)

(assert (=> b!757029 m!704835))

(declare-fun m!704837 () Bool)

(assert (=> b!757029 m!704837))

(assert (=> b!757027 m!704831))

(assert (=> b!757027 m!704831))

(declare-fun m!704839 () Bool)

(assert (=> b!757027 m!704839))

(assert (=> b!757022 m!704831))

(assert (=> b!757022 m!704831))

(declare-fun m!704841 () Bool)

(assert (=> b!757022 m!704841))

(declare-fun m!704843 () Bool)

(assert (=> b!757022 m!704843))

(declare-fun m!704845 () Bool)

(assert (=> b!757022 m!704845))

(declare-fun m!704847 () Bool)

(assert (=> b!757014 m!704847))

(declare-fun m!704849 () Bool)

(assert (=> start!65800 m!704849))

(declare-fun m!704851 () Bool)

(assert (=> start!65800 m!704851))

(assert (=> b!757021 m!704831))

(assert (=> b!757021 m!704831))

(assert (=> b!757021 m!704833))

(declare-fun m!704853 () Bool)

(assert (=> b!757028 m!704853))

(declare-fun m!704855 () Bool)

(assert (=> b!757032 m!704855))

(assert (=> b!757024 m!704831))

(assert (=> b!757024 m!704831))

(declare-fun m!704857 () Bool)

(assert (=> b!757024 m!704857))

(declare-fun m!704859 () Bool)

(assert (=> b!757019 m!704859))

(declare-fun m!704861 () Bool)

(assert (=> b!757018 m!704861))

(declare-fun m!704863 () Bool)

(assert (=> b!757023 m!704863))

(declare-fun m!704865 () Bool)

(assert (=> b!757030 m!704865))

(assert (=> b!757030 m!704827))

(declare-fun m!704867 () Bool)

(assert (=> b!757030 m!704867))

(declare-fun m!704869 () Bool)

(assert (=> b!757030 m!704869))

(declare-fun m!704871 () Bool)

(assert (=> b!757030 m!704871))

(assert (=> b!757030 m!704869))

(assert (=> b!757015 m!704831))

(assert (=> b!757015 m!704831))

(declare-fun m!704873 () Bool)

(assert (=> b!757015 m!704873))

(assert (=> b!757015 m!704873))

(assert (=> b!757015 m!704831))

(declare-fun m!704875 () Bool)

(assert (=> b!757015 m!704875))

(assert (=> b!757017 m!704831))

(assert (=> b!757017 m!704831))

(declare-fun m!704877 () Bool)

(assert (=> b!757017 m!704877))

(push 1)

