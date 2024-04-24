; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67810 () Bool)

(assert start!67810)

(declare-fun b!785231 () Bool)

(declare-fun res!531245 () Bool)

(declare-fun e!436635 () Bool)

(assert (=> b!785231 (=> (not res!531245) (not e!436635))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42730 0))(
  ( (array!42731 (arr!20449 (Array (_ BitVec 32) (_ BitVec 64))) (size!20869 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42730)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785231 (= res!531245 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20869 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20869 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!785232 () Bool)

(declare-datatypes ((SeekEntryResult!8005 0))(
  ( (MissingZero!8005 (index!34388 (_ BitVec 32))) (Found!8005 (index!34389 (_ BitVec 32))) (Intermediate!8005 (undefined!8817 Bool) (index!34390 (_ BitVec 32)) (x!65500 (_ BitVec 32))) (Undefined!8005) (MissingVacant!8005 (index!34391 (_ BitVec 32))) )
))
(declare-fun lt!350042 () SeekEntryResult!8005)

(declare-fun e!436636 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42730 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!785232 (= e!436636 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20449 a!3186) j!159) a!3186 mask!3328) lt!350042))))

(declare-fun b!785233 () Bool)

(declare-fun e!436628 () Bool)

(declare-fun e!436630 () Bool)

(assert (=> b!785233 (= e!436628 e!436630)))

(declare-fun res!531234 () Bool)

(assert (=> b!785233 (=> res!531234 e!436630)))

(declare-fun lt!350043 () SeekEntryResult!8005)

(assert (=> b!785233 (= res!531234 (not (= lt!350043 lt!350042)))))

(assert (=> b!785233 (= lt!350043 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20449 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785234 () Bool)

(declare-fun res!531228 () Bool)

(declare-fun e!436634 () Bool)

(assert (=> b!785234 (=> (not res!531228) (not e!436634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785234 (= res!531228 (validKeyInArray!0 (select (arr!20449 a!3186) j!159)))))

(declare-fun b!785235 () Bool)

(declare-fun e!436631 () Bool)

(assert (=> b!785235 (= e!436630 e!436631)))

(declare-fun res!531240 () Bool)

(assert (=> b!785235 (=> res!531240 e!436631)))

(declare-fun lt!350044 () (_ BitVec 64))

(declare-fun lt!350040 () (_ BitVec 64))

(assert (=> b!785235 (= res!531240 (= lt!350044 lt!350040))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785235 (= lt!350044 (select (store (arr!20449 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun e!436626 () Bool)

(declare-fun b!785236 () Bool)

(declare-fun lt!350033 () SeekEntryResult!8005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42730 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!785236 (= e!436626 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20449 a!3186) j!159) a!3186 mask!3328) lt!350033))))

(declare-fun b!785237 () Bool)

(declare-fun res!531235 () Bool)

(assert (=> b!785237 (=> (not res!531235) (not e!436634))))

(assert (=> b!785237 (= res!531235 (and (= (size!20869 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20869 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20869 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785238 () Bool)

(declare-fun res!531232 () Bool)

(declare-fun e!436633 () Bool)

(assert (=> b!785238 (=> (not res!531232) (not e!436633))))

(assert (=> b!785238 (= res!531232 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20449 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785239 () Bool)

(assert (=> b!785239 (= e!436626 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20449 a!3186) j!159) a!3186 mask!3328) (Found!8005 j!159)))))

(declare-fun b!785240 () Bool)

(assert (=> b!785240 (= e!436634 e!436635)))

(declare-fun res!531246 () Bool)

(assert (=> b!785240 (=> (not res!531246) (not e!436635))))

(declare-fun lt!350038 () SeekEntryResult!8005)

(assert (=> b!785240 (= res!531246 (or (= lt!350038 (MissingZero!8005 i!1173)) (= lt!350038 (MissingVacant!8005 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42730 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!785240 (= lt!350038 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!531241 () Bool)

(assert (=> start!67810 (=> (not res!531241) (not e!436634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67810 (= res!531241 (validMask!0 mask!3328))))

(assert (=> start!67810 e!436634))

(assert (=> start!67810 true))

(declare-fun array_inv!16308 (array!42730) Bool)

(assert (=> start!67810 (array_inv!16308 a!3186)))

(declare-fun b!785241 () Bool)

(assert (=> b!785241 (= e!436631 true)))

(declare-fun e!436625 () Bool)

(assert (=> b!785241 e!436625))

(declare-fun res!531233 () Bool)

(assert (=> b!785241 (=> (not res!531233) (not e!436625))))

(assert (=> b!785241 (= res!531233 (= lt!350044 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27085 0))(
  ( (Unit!27086) )
))
(declare-fun lt!350034 () Unit!27085)

(declare-fun e!436627 () Unit!27085)

(assert (=> b!785241 (= lt!350034 e!436627)))

(declare-fun c!87412 () Bool)

(assert (=> b!785241 (= c!87412 (= lt!350044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785242 () Bool)

(declare-fun res!531243 () Bool)

(assert (=> b!785242 (=> (not res!531243) (not e!436634))))

(assert (=> b!785242 (= res!531243 (validKeyInArray!0 k0!2102))))

(declare-fun b!785243 () Bool)

(declare-fun res!531239 () Bool)

(assert (=> b!785243 (=> (not res!531239) (not e!436625))))

(declare-fun lt!350035 () array!42730)

(assert (=> b!785243 (= res!531239 (= (seekEntryOrOpen!0 lt!350040 lt!350035 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350040 lt!350035 mask!3328)))))

(declare-fun b!785244 () Bool)

(declare-fun lt!350037 () SeekEntryResult!8005)

(assert (=> b!785244 (= e!436625 (= lt!350037 lt!350043))))

(declare-fun b!785245 () Bool)

(declare-fun e!436629 () Bool)

(assert (=> b!785245 (= e!436633 e!436629)))

(declare-fun res!531236 () Bool)

(assert (=> b!785245 (=> (not res!531236) (not e!436629))))

(declare-fun lt!350036 () SeekEntryResult!8005)

(declare-fun lt!350039 () SeekEntryResult!8005)

(assert (=> b!785245 (= res!531236 (= lt!350036 lt!350039))))

(assert (=> b!785245 (= lt!350039 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350040 lt!350035 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785245 (= lt!350036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350040 mask!3328) lt!350040 lt!350035 mask!3328))))

(assert (=> b!785245 (= lt!350040 (select (store (arr!20449 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785245 (= lt!350035 (array!42731 (store (arr!20449 a!3186) i!1173 k0!2102) (size!20869 a!3186)))))

(declare-fun b!785246 () Bool)

(declare-fun res!531237 () Bool)

(assert (=> b!785246 (=> (not res!531237) (not e!436633))))

(assert (=> b!785246 (= res!531237 e!436626)))

(declare-fun c!87413 () Bool)

(assert (=> b!785246 (= c!87413 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785247 () Bool)

(assert (=> b!785247 (= e!436629 (not e!436628))))

(declare-fun res!531230 () Bool)

(assert (=> b!785247 (=> res!531230 e!436628)))

(get-info :version)

(assert (=> b!785247 (= res!531230 (or (not ((_ is Intermediate!8005) lt!350039)) (bvslt x!1131 (x!65500 lt!350039)) (not (= x!1131 (x!65500 lt!350039))) (not (= index!1321 (index!34390 lt!350039)))))))

(assert (=> b!785247 e!436636))

(declare-fun res!531231 () Bool)

(assert (=> b!785247 (=> (not res!531231) (not e!436636))))

(assert (=> b!785247 (= res!531231 (= lt!350037 lt!350042))))

(assert (=> b!785247 (= lt!350042 (Found!8005 j!159))))

(assert (=> b!785247 (= lt!350037 (seekEntryOrOpen!0 (select (arr!20449 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42730 (_ BitVec 32)) Bool)

(assert (=> b!785247 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350041 () Unit!27085)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27085)

(assert (=> b!785247 (= lt!350041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785248 () Bool)

(declare-fun res!531244 () Bool)

(assert (=> b!785248 (=> (not res!531244) (not e!436635))))

(declare-datatypes ((List!14358 0))(
  ( (Nil!14355) (Cons!14354 (h!15483 (_ BitVec 64)) (t!20665 List!14358)) )
))
(declare-fun arrayNoDuplicates!0 (array!42730 (_ BitVec 32) List!14358) Bool)

(assert (=> b!785248 (= res!531244 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14355))))

(declare-fun b!785249 () Bool)

(declare-fun res!531238 () Bool)

(assert (=> b!785249 (=> (not res!531238) (not e!436635))))

(assert (=> b!785249 (= res!531238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785250 () Bool)

(declare-fun Unit!27087 () Unit!27085)

(assert (=> b!785250 (= e!436627 Unit!27087)))

(declare-fun b!785251 () Bool)

(assert (=> b!785251 (= e!436635 e!436633)))

(declare-fun res!531229 () Bool)

(assert (=> b!785251 (=> (not res!531229) (not e!436633))))

(assert (=> b!785251 (= res!531229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20449 a!3186) j!159) mask!3328) (select (arr!20449 a!3186) j!159) a!3186 mask!3328) lt!350033))))

(assert (=> b!785251 (= lt!350033 (Intermediate!8005 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785252 () Bool)

(declare-fun Unit!27088 () Unit!27085)

(assert (=> b!785252 (= e!436627 Unit!27088)))

(assert (=> b!785252 false))

(declare-fun b!785253 () Bool)

(declare-fun res!531242 () Bool)

(assert (=> b!785253 (=> (not res!531242) (not e!436634))))

(declare-fun arrayContainsKey!0 (array!42730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785253 (= res!531242 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67810 res!531241) b!785237))

(assert (= (and b!785237 res!531235) b!785234))

(assert (= (and b!785234 res!531228) b!785242))

(assert (= (and b!785242 res!531243) b!785253))

(assert (= (and b!785253 res!531242) b!785240))

(assert (= (and b!785240 res!531246) b!785249))

(assert (= (and b!785249 res!531238) b!785248))

(assert (= (and b!785248 res!531244) b!785231))

(assert (= (and b!785231 res!531245) b!785251))

(assert (= (and b!785251 res!531229) b!785238))

(assert (= (and b!785238 res!531232) b!785246))

(assert (= (and b!785246 c!87413) b!785236))

(assert (= (and b!785246 (not c!87413)) b!785239))

(assert (= (and b!785246 res!531237) b!785245))

(assert (= (and b!785245 res!531236) b!785247))

(assert (= (and b!785247 res!531231) b!785232))

(assert (= (and b!785247 (not res!531230)) b!785233))

(assert (= (and b!785233 (not res!531234)) b!785235))

(assert (= (and b!785235 (not res!531240)) b!785241))

(assert (= (and b!785241 c!87412) b!785252))

(assert (= (and b!785241 (not c!87412)) b!785250))

(assert (= (and b!785241 res!531233) b!785243))

(assert (= (and b!785243 res!531239) b!785244))

(declare-fun m!727931 () Bool)

(assert (=> b!785239 m!727931))

(assert (=> b!785239 m!727931))

(declare-fun m!727933 () Bool)

(assert (=> b!785239 m!727933))

(declare-fun m!727935 () Bool)

(assert (=> b!785248 m!727935))

(declare-fun m!727937 () Bool)

(assert (=> b!785238 m!727937))

(assert (=> b!785251 m!727931))

(assert (=> b!785251 m!727931))

(declare-fun m!727939 () Bool)

(assert (=> b!785251 m!727939))

(assert (=> b!785251 m!727939))

(assert (=> b!785251 m!727931))

(declare-fun m!727941 () Bool)

(assert (=> b!785251 m!727941))

(declare-fun m!727943 () Bool)

(assert (=> b!785235 m!727943))

(declare-fun m!727945 () Bool)

(assert (=> b!785235 m!727945))

(declare-fun m!727947 () Bool)

(assert (=> b!785249 m!727947))

(declare-fun m!727949 () Bool)

(assert (=> start!67810 m!727949))

(declare-fun m!727951 () Bool)

(assert (=> start!67810 m!727951))

(assert (=> b!785236 m!727931))

(assert (=> b!785236 m!727931))

(declare-fun m!727953 () Bool)

(assert (=> b!785236 m!727953))

(declare-fun m!727955 () Bool)

(assert (=> b!785243 m!727955))

(declare-fun m!727957 () Bool)

(assert (=> b!785243 m!727957))

(assert (=> b!785247 m!727931))

(assert (=> b!785247 m!727931))

(declare-fun m!727959 () Bool)

(assert (=> b!785247 m!727959))

(declare-fun m!727961 () Bool)

(assert (=> b!785247 m!727961))

(declare-fun m!727963 () Bool)

(assert (=> b!785247 m!727963))

(declare-fun m!727965 () Bool)

(assert (=> b!785242 m!727965))

(declare-fun m!727967 () Bool)

(assert (=> b!785253 m!727967))

(assert (=> b!785245 m!727943))

(declare-fun m!727969 () Bool)

(assert (=> b!785245 m!727969))

(declare-fun m!727971 () Bool)

(assert (=> b!785245 m!727971))

(declare-fun m!727973 () Bool)

(assert (=> b!785245 m!727973))

(assert (=> b!785245 m!727969))

(declare-fun m!727975 () Bool)

(assert (=> b!785245 m!727975))

(assert (=> b!785233 m!727931))

(assert (=> b!785233 m!727931))

(assert (=> b!785233 m!727933))

(assert (=> b!785232 m!727931))

(assert (=> b!785232 m!727931))

(declare-fun m!727977 () Bool)

(assert (=> b!785232 m!727977))

(assert (=> b!785234 m!727931))

(assert (=> b!785234 m!727931))

(declare-fun m!727979 () Bool)

(assert (=> b!785234 m!727979))

(declare-fun m!727981 () Bool)

(assert (=> b!785240 m!727981))

(check-sat (not b!785240) (not b!785243) (not b!785236) (not b!785242) (not b!785233) (not b!785249) (not b!785247) (not b!785253) (not start!67810) (not b!785248) (not b!785234) (not b!785232) (not b!785239) (not b!785251) (not b!785245))
(check-sat)
