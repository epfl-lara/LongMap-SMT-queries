; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65964 () Bool)

(assert start!65964)

(declare-fun b!758998 () Bool)

(declare-fun res!513252 () Bool)

(declare-fun e!423222 () Bool)

(assert (=> b!758998 (=> (not res!513252) (not e!423222))))

(declare-datatypes ((array!42007 0))(
  ( (array!42008 (arr!20113 (Array (_ BitVec 32) (_ BitVec 64))) (size!20533 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42007)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!758998 (= res!513252 (and (= (size!20533 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20533 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20533 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758999 () Bool)

(declare-fun res!513246 () Bool)

(declare-fun e!423220 () Bool)

(assert (=> b!758999 (=> (not res!513246) (not e!423220))))

(declare-fun e!423228 () Bool)

(assert (=> b!758999 (= res!513246 e!423228)))

(declare-fun c!83261 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758999 (= c!83261 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759000 () Bool)

(declare-fun res!513262 () Bool)

(assert (=> b!759000 (=> (not res!513262) (not e!423220))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!759000 (= res!513262 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20113 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759001 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7669 0))(
  ( (MissingZero!7669 (index!33044 (_ BitVec 32))) (Found!7669 (index!33045 (_ BitVec 32))) (Intermediate!7669 (undefined!8481 Bool) (index!33046 (_ BitVec 32)) (x!64095 (_ BitVec 32))) (Undefined!7669) (MissingVacant!7669 (index!33047 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42007 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!759001 (= e!423228 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20113 a!3186) j!159) a!3186 mask!3328) (Found!7669 j!159)))))

(declare-fun b!759002 () Bool)

(declare-fun e!423226 () Bool)

(assert (=> b!759002 (= e!423222 e!423226)))

(declare-fun res!513253 () Bool)

(assert (=> b!759002 (=> (not res!513253) (not e!423226))))

(declare-fun lt!338065 () SeekEntryResult!7669)

(assert (=> b!759002 (= res!513253 (or (= lt!338065 (MissingZero!7669 i!1173)) (= lt!338065 (MissingVacant!7669 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42007 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!759002 (= lt!338065 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759003 () Bool)

(declare-fun res!513250 () Bool)

(assert (=> b!759003 (=> (not res!513250) (not e!423222))))

(declare-fun arrayContainsKey!0 (array!42007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759003 (= res!513250 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759004 () Bool)

(declare-fun res!513257 () Bool)

(assert (=> b!759004 (=> (not res!513257) (not e!423226))))

(declare-datatypes ((List!14022 0))(
  ( (Nil!14019) (Cons!14018 (h!15096 (_ BitVec 64)) (t!20329 List!14022)) )
))
(declare-fun arrayNoDuplicates!0 (array!42007 (_ BitVec 32) List!14022) Bool)

(assert (=> b!759004 (= res!513257 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14019))))

(declare-fun res!513245 () Bool)

(assert (=> start!65964 (=> (not res!513245) (not e!423222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65964 (= res!513245 (validMask!0 mask!3328))))

(assert (=> start!65964 e!423222))

(assert (=> start!65964 true))

(declare-fun array_inv!15972 (array!42007) Bool)

(assert (=> start!65964 (array_inv!15972 a!3186)))

(declare-fun lt!338056 () SeekEntryResult!7669)

(declare-fun b!759005 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42007 (_ BitVec 32)) SeekEntryResult!7669)

(assert (=> b!759005 (= e!423228 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20113 a!3186) j!159) a!3186 mask!3328) lt!338056))))

(declare-fun b!759006 () Bool)

(declare-fun e!423223 () Bool)

(declare-fun e!423227 () Bool)

(assert (=> b!759006 (= e!423223 e!423227)))

(declare-fun res!513255 () Bool)

(assert (=> b!759006 (=> res!513255 e!423227)))

(declare-fun lt!338067 () SeekEntryResult!7669)

(declare-fun lt!338066 () SeekEntryResult!7669)

(assert (=> b!759006 (= res!513255 (not (= lt!338067 lt!338066)))))

(assert (=> b!759006 (= lt!338067 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20113 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!759007 () Bool)

(assert (=> b!759007 (= e!423226 e!423220)))

(declare-fun res!513260 () Bool)

(assert (=> b!759007 (=> (not res!513260) (not e!423220))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759007 (= res!513260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20113 a!3186) j!159) mask!3328) (select (arr!20113 a!3186) j!159) a!3186 mask!3328) lt!338056))))

(assert (=> b!759007 (= lt!338056 (Intermediate!7669 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759008 () Bool)

(declare-fun e!423231 () Bool)

(assert (=> b!759008 (= e!423231 true)))

(declare-fun lt!338063 () SeekEntryResult!7669)

(assert (=> b!759008 (= lt!338063 lt!338067)))

(declare-datatypes ((Unit!26233 0))(
  ( (Unit!26234) )
))
(declare-fun lt!338054 () Unit!26233)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42007 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26233)

(assert (=> b!759008 (= lt!338054 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!759009 () Bool)

(declare-fun res!513256 () Bool)

(assert (=> b!759009 (=> (not res!513256) (not e!423226))))

(assert (=> b!759009 (= res!513256 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20533 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20533 a!3186))))))

(declare-fun b!759010 () Bool)

(declare-fun e!423230 () Bool)

(assert (=> b!759010 (= e!423220 e!423230)))

(declare-fun res!513258 () Bool)

(assert (=> b!759010 (=> (not res!513258) (not e!423230))))

(declare-fun lt!338057 () SeekEntryResult!7669)

(declare-fun lt!338058 () SeekEntryResult!7669)

(assert (=> b!759010 (= res!513258 (= lt!338057 lt!338058))))

(declare-fun lt!338053 () array!42007)

(declare-fun lt!338062 () (_ BitVec 64))

(assert (=> b!759010 (= lt!338058 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338062 lt!338053 mask!3328))))

(assert (=> b!759010 (= lt!338057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338062 mask!3328) lt!338062 lt!338053 mask!3328))))

(assert (=> b!759010 (= lt!338062 (select (store (arr!20113 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759010 (= lt!338053 (array!42008 (store (arr!20113 a!3186) i!1173 k0!2102) (size!20533 a!3186)))))

(declare-fun b!759011 () Bool)

(declare-fun e!423221 () Unit!26233)

(declare-fun Unit!26235 () Unit!26233)

(assert (=> b!759011 (= e!423221 Unit!26235)))

(declare-fun b!759012 () Bool)

(declare-fun res!513261 () Bool)

(assert (=> b!759012 (=> (not res!513261) (not e!423222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759012 (= res!513261 (validKeyInArray!0 k0!2102))))

(declare-fun b!759013 () Bool)

(declare-fun e!423229 () Bool)

(assert (=> b!759013 (= e!423229 e!423231)))

(declare-fun res!513247 () Bool)

(assert (=> b!759013 (=> res!513247 e!423231)))

(assert (=> b!759013 (= res!513247 (or (not (= (select (arr!20113 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338059 () SeekEntryResult!7669)

(declare-fun lt!338064 () SeekEntryResult!7669)

(assert (=> b!759013 (and (= lt!338064 lt!338063) (= lt!338059 lt!338067))))

(assert (=> b!759013 (= lt!338063 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338062 lt!338053 mask!3328))))

(assert (=> b!759013 (= lt!338064 (seekEntryOrOpen!0 lt!338062 lt!338053 mask!3328))))

(declare-fun lt!338060 () (_ BitVec 64))

(assert (=> b!759013 (= lt!338060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338055 () Unit!26233)

(assert (=> b!759013 (= lt!338055 e!423221)))

(declare-fun c!83260 () Bool)

(assert (=> b!759013 (= c!83260 (= lt!338060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!759014 () Bool)

(assert (=> b!759014 (= e!423227 e!423229)))

(declare-fun res!513248 () Bool)

(assert (=> b!759014 (=> res!513248 e!423229)))

(assert (=> b!759014 (= res!513248 (= lt!338060 lt!338062))))

(assert (=> b!759014 (= lt!338060 (select (store (arr!20113 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!759015 () Bool)

(declare-fun Unit!26236 () Unit!26233)

(assert (=> b!759015 (= e!423221 Unit!26236)))

(assert (=> b!759015 false))

(declare-fun e!423224 () Bool)

(declare-fun b!759016 () Bool)

(assert (=> b!759016 (= e!423224 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20113 a!3186) j!159) a!3186 mask!3328) lt!338066))))

(declare-fun b!759017 () Bool)

(assert (=> b!759017 (= e!423230 (not e!423223))))

(declare-fun res!513259 () Bool)

(assert (=> b!759017 (=> res!513259 e!423223)))

(get-info :version)

(assert (=> b!759017 (= res!513259 (or (not ((_ is Intermediate!7669) lt!338058)) (bvslt x!1131 (x!64095 lt!338058)) (not (= x!1131 (x!64095 lt!338058))) (not (= index!1321 (index!33046 lt!338058)))))))

(assert (=> b!759017 e!423224))

(declare-fun res!513251 () Bool)

(assert (=> b!759017 (=> (not res!513251) (not e!423224))))

(assert (=> b!759017 (= res!513251 (= lt!338059 lt!338066))))

(assert (=> b!759017 (= lt!338066 (Found!7669 j!159))))

(assert (=> b!759017 (= lt!338059 (seekEntryOrOpen!0 (select (arr!20113 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42007 (_ BitVec 32)) Bool)

(assert (=> b!759017 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338061 () Unit!26233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26233)

(assert (=> b!759017 (= lt!338061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759018 () Bool)

(declare-fun res!513249 () Bool)

(assert (=> b!759018 (=> (not res!513249) (not e!423222))))

(assert (=> b!759018 (= res!513249 (validKeyInArray!0 (select (arr!20113 a!3186) j!159)))))

(declare-fun b!759019 () Bool)

(declare-fun res!513254 () Bool)

(assert (=> b!759019 (=> (not res!513254) (not e!423226))))

(assert (=> b!759019 (= res!513254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65964 res!513245) b!758998))

(assert (= (and b!758998 res!513252) b!759018))

(assert (= (and b!759018 res!513249) b!759012))

(assert (= (and b!759012 res!513261) b!759003))

(assert (= (and b!759003 res!513250) b!759002))

(assert (= (and b!759002 res!513253) b!759019))

(assert (= (and b!759019 res!513254) b!759004))

(assert (= (and b!759004 res!513257) b!759009))

(assert (= (and b!759009 res!513256) b!759007))

(assert (= (and b!759007 res!513260) b!759000))

(assert (= (and b!759000 res!513262) b!758999))

(assert (= (and b!758999 c!83261) b!759005))

(assert (= (and b!758999 (not c!83261)) b!759001))

(assert (= (and b!758999 res!513246) b!759010))

(assert (= (and b!759010 res!513258) b!759017))

(assert (= (and b!759017 res!513251) b!759016))

(assert (= (and b!759017 (not res!513259)) b!759006))

(assert (= (and b!759006 (not res!513255)) b!759014))

(assert (= (and b!759014 (not res!513248)) b!759013))

(assert (= (and b!759013 c!83260) b!759015))

(assert (= (and b!759013 (not c!83260)) b!759011))

(assert (= (and b!759013 (not res!513247)) b!759008))

(declare-fun m!706923 () Bool)

(assert (=> b!759018 m!706923))

(assert (=> b!759018 m!706923))

(declare-fun m!706925 () Bool)

(assert (=> b!759018 m!706925))

(declare-fun m!706927 () Bool)

(assert (=> b!759019 m!706927))

(assert (=> b!759007 m!706923))

(assert (=> b!759007 m!706923))

(declare-fun m!706929 () Bool)

(assert (=> b!759007 m!706929))

(assert (=> b!759007 m!706929))

(assert (=> b!759007 m!706923))

(declare-fun m!706931 () Bool)

(assert (=> b!759007 m!706931))

(declare-fun m!706933 () Bool)

(assert (=> b!759014 m!706933))

(declare-fun m!706935 () Bool)

(assert (=> b!759014 m!706935))

(declare-fun m!706937 () Bool)

(assert (=> b!759008 m!706937))

(declare-fun m!706939 () Bool)

(assert (=> b!759000 m!706939))

(declare-fun m!706941 () Bool)

(assert (=> start!65964 m!706941))

(declare-fun m!706943 () Bool)

(assert (=> start!65964 m!706943))

(declare-fun m!706945 () Bool)

(assert (=> b!759010 m!706945))

(declare-fun m!706947 () Bool)

(assert (=> b!759010 m!706947))

(assert (=> b!759010 m!706933))

(declare-fun m!706949 () Bool)

(assert (=> b!759010 m!706949))

(assert (=> b!759010 m!706947))

(declare-fun m!706951 () Bool)

(assert (=> b!759010 m!706951))

(assert (=> b!759016 m!706923))

(assert (=> b!759016 m!706923))

(declare-fun m!706953 () Bool)

(assert (=> b!759016 m!706953))

(declare-fun m!706955 () Bool)

(assert (=> b!759004 m!706955))

(declare-fun m!706957 () Bool)

(assert (=> b!759012 m!706957))

(assert (=> b!759005 m!706923))

(assert (=> b!759005 m!706923))

(declare-fun m!706959 () Bool)

(assert (=> b!759005 m!706959))

(assert (=> b!759001 m!706923))

(assert (=> b!759001 m!706923))

(declare-fun m!706961 () Bool)

(assert (=> b!759001 m!706961))

(declare-fun m!706963 () Bool)

(assert (=> b!759002 m!706963))

(assert (=> b!759006 m!706923))

(assert (=> b!759006 m!706923))

(assert (=> b!759006 m!706961))

(assert (=> b!759017 m!706923))

(assert (=> b!759017 m!706923))

(declare-fun m!706965 () Bool)

(assert (=> b!759017 m!706965))

(declare-fun m!706967 () Bool)

(assert (=> b!759017 m!706967))

(declare-fun m!706969 () Bool)

(assert (=> b!759017 m!706969))

(declare-fun m!706971 () Bool)

(assert (=> b!759013 m!706971))

(declare-fun m!706973 () Bool)

(assert (=> b!759013 m!706973))

(declare-fun m!706975 () Bool)

(assert (=> b!759013 m!706975))

(declare-fun m!706977 () Bool)

(assert (=> b!759003 m!706977))

(check-sat (not b!759016) (not b!759002) (not b!759010) (not b!759003) (not b!759001) (not b!759013) (not b!759017) (not b!759012) (not b!759004) (not b!759007) (not b!759006) (not b!759005) (not start!65964) (not b!759019) (not b!759008) (not b!759018))
(check-sat)
