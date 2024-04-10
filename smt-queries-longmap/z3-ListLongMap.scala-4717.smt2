; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65364 () Bool)

(assert start!65364)

(declare-fun b!743185 () Bool)

(declare-fun res!500307 () Bool)

(declare-fun e!415272 () Bool)

(assert (=> b!743185 (=> res!500307 e!415272)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41537 0))(
  ( (array!41538 (arr!19882 (Array (_ BitVec 32) (_ BitVec 64))) (size!20303 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41537)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7482 0))(
  ( (MissingZero!7482 (index!32296 (_ BitVec 32))) (Found!7482 (index!32297 (_ BitVec 32))) (Intermediate!7482 (undefined!8294 Bool) (index!32298 (_ BitVec 32)) (x!63264 (_ BitVec 32))) (Undefined!7482) (MissingVacant!7482 (index!32299 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41537 (_ BitVec 32)) SeekEntryResult!7482)

(assert (=> b!743185 (= res!500307 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) (Found!7482 j!159))))))

(declare-fun b!743187 () Bool)

(declare-fun res!500302 () Bool)

(declare-fun e!415271 () Bool)

(assert (=> b!743187 (=> (not res!500302) (not e!415271))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743187 (= res!500302 (validKeyInArray!0 k0!2102))))

(declare-fun b!743188 () Bool)

(declare-fun e!415269 () Bool)

(declare-fun e!415270 () Bool)

(assert (=> b!743188 (= e!415269 e!415270)))

(declare-fun res!500312 () Bool)

(assert (=> b!743188 (=> (not res!500312) (not e!415270))))

(declare-fun lt!330149 () SeekEntryResult!7482)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41537 (_ BitVec 32)) SeekEntryResult!7482)

(assert (=> b!743188 (= res!500312 (= (seekEntryOrOpen!0 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330149))))

(assert (=> b!743188 (= lt!330149 (Found!7482 j!159))))

(declare-fun b!743189 () Bool)

(declare-fun res!500314 () Bool)

(declare-fun e!415267 () Bool)

(assert (=> b!743189 (=> (not res!500314) (not e!415267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41537 (_ BitVec 32)) Bool)

(assert (=> b!743189 (= res!500314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743190 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743190 (= e!415270 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330149))))

(declare-fun b!743191 () Bool)

(assert (=> b!743191 (= e!415271 e!415267)))

(declare-fun res!500313 () Bool)

(assert (=> b!743191 (=> (not res!500313) (not e!415267))))

(declare-fun lt!330146 () SeekEntryResult!7482)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743191 (= res!500313 (or (= lt!330146 (MissingZero!7482 i!1173)) (= lt!330146 (MissingVacant!7482 i!1173))))))

(assert (=> b!743191 (= lt!330146 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743192 () Bool)

(declare-fun res!500309 () Bool)

(assert (=> b!743192 (=> (not res!500309) (not e!415271))))

(assert (=> b!743192 (= res!500309 (and (= (size!20303 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20303 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20303 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743193 () Bool)

(declare-fun res!500300 () Bool)

(assert (=> b!743193 (=> (not res!500300) (not e!415271))))

(declare-fun arrayContainsKey!0 (array!41537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743193 (= res!500300 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!415268 () Bool)

(declare-fun lt!330150 () SeekEntryResult!7482)

(declare-fun b!743194 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41537 (_ BitVec 32)) SeekEntryResult!7482)

(assert (=> b!743194 (= e!415268 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330150))))

(declare-fun b!743195 () Bool)

(declare-fun res!500304 () Bool)

(assert (=> b!743195 (=> (not res!500304) (not e!415271))))

(assert (=> b!743195 (= res!500304 (validKeyInArray!0 (select (arr!19882 a!3186) j!159)))))

(declare-fun b!743186 () Bool)

(declare-fun res!500306 () Bool)

(declare-fun e!415273 () Bool)

(assert (=> b!743186 (=> (not res!500306) (not e!415273))))

(assert (=> b!743186 (= res!500306 e!415268)))

(declare-fun c!81823 () Bool)

(assert (=> b!743186 (= c!81823 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!500305 () Bool)

(assert (=> start!65364 (=> (not res!500305) (not e!415271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65364 (= res!500305 (validMask!0 mask!3328))))

(assert (=> start!65364 e!415271))

(assert (=> start!65364 true))

(declare-fun array_inv!15678 (array!41537) Bool)

(assert (=> start!65364 (array_inv!15678 a!3186)))

(declare-fun b!743196 () Bool)

(declare-fun res!500308 () Bool)

(assert (=> b!743196 (=> (not res!500308) (not e!415267))))

(declare-datatypes ((List!13884 0))(
  ( (Nil!13881) (Cons!13880 (h!14952 (_ BitVec 64)) (t!20199 List!13884)) )
))
(declare-fun arrayNoDuplicates!0 (array!41537 (_ BitVec 32) List!13884) Bool)

(assert (=> b!743196 (= res!500308 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13881))))

(declare-fun b!743197 () Bool)

(declare-fun res!500318 () Bool)

(assert (=> b!743197 (=> (not res!500318) (not e!415267))))

(assert (=> b!743197 (= res!500318 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20303 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20303 a!3186))))))

(declare-fun b!743198 () Bool)

(declare-fun e!415274 () Bool)

(assert (=> b!743198 (= e!415273 e!415274)))

(declare-fun res!500316 () Bool)

(assert (=> b!743198 (=> (not res!500316) (not e!415274))))

(declare-fun lt!330151 () SeekEntryResult!7482)

(declare-fun lt!330147 () SeekEntryResult!7482)

(assert (=> b!743198 (= res!500316 (= lt!330151 lt!330147))))

(declare-fun lt!330148 () array!41537)

(declare-fun lt!330145 () (_ BitVec 64))

(assert (=> b!743198 (= lt!330147 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330145 lt!330148 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743198 (= lt!330151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330145 mask!3328) lt!330145 lt!330148 mask!3328))))

(assert (=> b!743198 (= lt!330145 (select (store (arr!19882 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743198 (= lt!330148 (array!41538 (store (arr!19882 a!3186) i!1173 k0!2102) (size!20303 a!3186)))))

(declare-fun b!743199 () Bool)

(declare-fun res!500315 () Bool)

(assert (=> b!743199 (=> (not res!500315) (not e!415273))))

(assert (=> b!743199 (= res!500315 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19882 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743200 () Bool)

(declare-fun res!500301 () Bool)

(assert (=> b!743200 (=> res!500301 e!415272)))

(assert (=> b!743200 (= res!500301 (or (not (= (select (store (arr!19882 a!3186) i!1173 k0!2102) index!1321) lt!330145)) (undefined!8294 lt!330147)))))

(declare-fun b!743201 () Bool)

(assert (=> b!743201 (= e!415268 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) (Found!7482 j!159)))))

(declare-fun b!743202 () Bool)

(declare-fun res!500317 () Bool)

(assert (=> b!743202 (=> res!500317 e!415272)))

(assert (=> b!743202 (= res!500317 (not (= (seekEntryOrOpen!0 lt!330145 lt!330148 mask!3328) (Found!7482 index!1321))))))

(declare-fun b!743203 () Bool)

(assert (=> b!743203 (= e!415267 e!415273)))

(declare-fun res!500310 () Bool)

(assert (=> b!743203 (=> (not res!500310) (not e!415273))))

(assert (=> b!743203 (= res!500310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19882 a!3186) j!159) mask!3328) (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330150))))

(assert (=> b!743203 (= lt!330150 (Intermediate!7482 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743204 () Bool)

(assert (=> b!743204 (= e!415272 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743205 () Bool)

(assert (=> b!743205 (= e!415274 (not e!415272))))

(declare-fun res!500303 () Bool)

(assert (=> b!743205 (=> res!500303 e!415272)))

(get-info :version)

(assert (=> b!743205 (= res!500303 (or (not ((_ is Intermediate!7482) lt!330147)) (bvslt x!1131 (x!63264 lt!330147)) (not (= x!1131 (x!63264 lt!330147))) (not (= index!1321 (index!32298 lt!330147)))))))

(assert (=> b!743205 e!415269))

(declare-fun res!500311 () Bool)

(assert (=> b!743205 (=> (not res!500311) (not e!415269))))

(assert (=> b!743205 (= res!500311 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25444 0))(
  ( (Unit!25445) )
))
(declare-fun lt!330152 () Unit!25444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25444)

(assert (=> b!743205 (= lt!330152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65364 res!500305) b!743192))

(assert (= (and b!743192 res!500309) b!743195))

(assert (= (and b!743195 res!500304) b!743187))

(assert (= (and b!743187 res!500302) b!743193))

(assert (= (and b!743193 res!500300) b!743191))

(assert (= (and b!743191 res!500313) b!743189))

(assert (= (and b!743189 res!500314) b!743196))

(assert (= (and b!743196 res!500308) b!743197))

(assert (= (and b!743197 res!500318) b!743203))

(assert (= (and b!743203 res!500310) b!743199))

(assert (= (and b!743199 res!500315) b!743186))

(assert (= (and b!743186 c!81823) b!743194))

(assert (= (and b!743186 (not c!81823)) b!743201))

(assert (= (and b!743186 res!500306) b!743198))

(assert (= (and b!743198 res!500316) b!743205))

(assert (= (and b!743205 res!500311) b!743188))

(assert (= (and b!743188 res!500312) b!743190))

(assert (= (and b!743205 (not res!500303)) b!743185))

(assert (= (and b!743185 (not res!500307)) b!743200))

(assert (= (and b!743200 (not res!500301)) b!743202))

(assert (= (and b!743202 (not res!500317)) b!743204))

(declare-fun m!693921 () Bool)

(assert (=> b!743195 m!693921))

(assert (=> b!743195 m!693921))

(declare-fun m!693923 () Bool)

(assert (=> b!743195 m!693923))

(declare-fun m!693925 () Bool)

(assert (=> b!743202 m!693925))

(declare-fun m!693927 () Bool)

(assert (=> b!743198 m!693927))

(declare-fun m!693929 () Bool)

(assert (=> b!743198 m!693929))

(declare-fun m!693931 () Bool)

(assert (=> b!743198 m!693931))

(declare-fun m!693933 () Bool)

(assert (=> b!743198 m!693933))

(assert (=> b!743198 m!693931))

(declare-fun m!693935 () Bool)

(assert (=> b!743198 m!693935))

(declare-fun m!693937 () Bool)

(assert (=> start!65364 m!693937))

(declare-fun m!693939 () Bool)

(assert (=> start!65364 m!693939))

(declare-fun m!693941 () Bool)

(assert (=> b!743199 m!693941))

(assert (=> b!743201 m!693921))

(assert (=> b!743201 m!693921))

(declare-fun m!693943 () Bool)

(assert (=> b!743201 m!693943))

(assert (=> b!743190 m!693921))

(assert (=> b!743190 m!693921))

(declare-fun m!693945 () Bool)

(assert (=> b!743190 m!693945))

(assert (=> b!743194 m!693921))

(assert (=> b!743194 m!693921))

(declare-fun m!693947 () Bool)

(assert (=> b!743194 m!693947))

(declare-fun m!693949 () Bool)

(assert (=> b!743196 m!693949))

(declare-fun m!693951 () Bool)

(assert (=> b!743189 m!693951))

(declare-fun m!693953 () Bool)

(assert (=> b!743193 m!693953))

(declare-fun m!693955 () Bool)

(assert (=> b!743187 m!693955))

(assert (=> b!743200 m!693935))

(declare-fun m!693957 () Bool)

(assert (=> b!743200 m!693957))

(assert (=> b!743203 m!693921))

(assert (=> b!743203 m!693921))

(declare-fun m!693959 () Bool)

(assert (=> b!743203 m!693959))

(assert (=> b!743203 m!693959))

(assert (=> b!743203 m!693921))

(declare-fun m!693961 () Bool)

(assert (=> b!743203 m!693961))

(declare-fun m!693963 () Bool)

(assert (=> b!743205 m!693963))

(declare-fun m!693965 () Bool)

(assert (=> b!743205 m!693965))

(assert (=> b!743185 m!693921))

(assert (=> b!743185 m!693921))

(assert (=> b!743185 m!693943))

(assert (=> b!743188 m!693921))

(assert (=> b!743188 m!693921))

(declare-fun m!693967 () Bool)

(assert (=> b!743188 m!693967))

(declare-fun m!693969 () Bool)

(assert (=> b!743191 m!693969))

(check-sat (not b!743187) (not b!743195) (not b!743185) (not b!743198) (not b!743194) (not b!743190) (not b!743205) (not b!743201) (not start!65364) (not b!743202) (not b!743188) (not b!743189) (not b!743196) (not b!743203) (not b!743191) (not b!743193))
(check-sat)
