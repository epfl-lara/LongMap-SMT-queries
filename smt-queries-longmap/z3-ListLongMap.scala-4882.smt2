; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67274 () Bool)

(assert start!67274)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42566 0))(
  ( (array!42567 (arr!20377 (Array (_ BitVec 32) (_ BitVec 64))) (size!20798 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42566)

(declare-fun e!432925 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!778139 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7977 0))(
  ( (MissingZero!7977 (index!34276 (_ BitVec 32))) (Found!7977 (index!34277 (_ BitVec 32))) (Intermediate!7977 (undefined!8789 Bool) (index!34278 (_ BitVec 32)) (x!65217 (_ BitVec 32))) (Undefined!7977) (MissingVacant!7977 (index!34279 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42566 (_ BitVec 32)) SeekEntryResult!7977)

(assert (=> b!778139 (= e!432925 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) (Found!7977 j!159)))))

(declare-fun b!778140 () Bool)

(declare-fun res!526506 () Bool)

(declare-fun e!432924 () Bool)

(assert (=> b!778140 (=> (not res!526506) (not e!432924))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778140 (= res!526506 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20377 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778142 () Bool)

(declare-fun res!526509 () Bool)

(declare-fun e!432918 () Bool)

(assert (=> b!778142 (=> (not res!526509) (not e!432918))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778142 (= res!526509 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778143 () Bool)

(declare-fun res!526516 () Bool)

(assert (=> b!778143 (=> (not res!526516) (not e!432924))))

(assert (=> b!778143 (= res!526516 e!432925)))

(declare-fun c!86221 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778143 (= c!86221 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778144 () Bool)

(declare-fun e!432919 () Bool)

(declare-fun e!432923 () Bool)

(assert (=> b!778144 (= e!432919 (not e!432923))))

(declare-fun res!526505 () Bool)

(assert (=> b!778144 (=> res!526505 e!432923)))

(declare-fun lt!346686 () SeekEntryResult!7977)

(get-info :version)

(assert (=> b!778144 (= res!526505 (or (not ((_ is Intermediate!7977) lt!346686)) (bvslt x!1131 (x!65217 lt!346686)) (not (= x!1131 (x!65217 lt!346686))) (not (= index!1321 (index!34278 lt!346686)))))))

(declare-fun lt!346689 () SeekEntryResult!7977)

(assert (=> b!778144 (= lt!346689 (Found!7977 j!159))))

(declare-fun e!432921 () Bool)

(assert (=> b!778144 e!432921))

(declare-fun res!526507 () Bool)

(assert (=> b!778144 (=> (not res!526507) (not e!432921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42566 (_ BitVec 32)) Bool)

(assert (=> b!778144 (= res!526507 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26848 0))(
  ( (Unit!26849) )
))
(declare-fun lt!346688 () Unit!26848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26848)

(assert (=> b!778144 (= lt!346688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778145 () Bool)

(declare-fun res!526503 () Bool)

(assert (=> b!778145 (=> res!526503 e!432923)))

(declare-fun lt!346690 () (_ BitVec 64))

(assert (=> b!778145 (= res!526503 (or (not (= (select (store (arr!20377 a!3186) i!1173 k0!2102) index!1321) lt!346690)) (undefined!8789 lt!346686)))))

(declare-fun lt!346683 () SeekEntryResult!7977)

(declare-fun b!778146 () Bool)

(declare-fun e!432920 () Bool)

(assert (=> b!778146 (= e!432920 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346683))))

(declare-fun b!778147 () Bool)

(declare-fun res!526517 () Bool)

(declare-fun e!432922 () Bool)

(assert (=> b!778147 (=> (not res!526517) (not e!432922))))

(declare-datatypes ((List!14379 0))(
  ( (Nil!14376) (Cons!14375 (h!15486 (_ BitVec 64)) (t!20694 List!14379)) )
))
(declare-fun arrayNoDuplicates!0 (array!42566 (_ BitVec 32) List!14379) Bool)

(assert (=> b!778147 (= res!526517 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14376))))

(declare-fun b!778148 () Bool)

(assert (=> b!778148 (= e!432924 e!432919)))

(declare-fun res!526513 () Bool)

(assert (=> b!778148 (=> (not res!526513) (not e!432919))))

(declare-fun lt!346682 () SeekEntryResult!7977)

(assert (=> b!778148 (= res!526513 (= lt!346682 lt!346686))))

(declare-fun lt!346687 () array!42566)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42566 (_ BitVec 32)) SeekEntryResult!7977)

(assert (=> b!778148 (= lt!346686 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346690 lt!346687 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778148 (= lt!346682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346690 mask!3328) lt!346690 lt!346687 mask!3328))))

(assert (=> b!778148 (= lt!346690 (select (store (arr!20377 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778148 (= lt!346687 (array!42567 (store (arr!20377 a!3186) i!1173 k0!2102) (size!20798 a!3186)))))

(declare-fun b!778149 () Bool)

(declare-fun lt!346691 () SeekEntryResult!7977)

(assert (=> b!778149 (= e!432925 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346691))))

(declare-fun b!778150 () Bool)

(declare-fun res!526504 () Bool)

(assert (=> b!778150 (=> res!526504 e!432923)))

(assert (=> b!778150 (= res!526504 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346689)))))

(declare-fun b!778151 () Bool)

(declare-fun res!526512 () Bool)

(assert (=> b!778151 (=> (not res!526512) (not e!432918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778151 (= res!526512 (validKeyInArray!0 k0!2102))))

(declare-fun b!778152 () Bool)

(assert (=> b!778152 (= e!432921 e!432920)))

(declare-fun res!526514 () Bool)

(assert (=> b!778152 (=> (not res!526514) (not e!432920))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42566 (_ BitVec 32)) SeekEntryResult!7977)

(assert (=> b!778152 (= res!526514 (= (seekEntryOrOpen!0 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346683))))

(assert (=> b!778152 (= lt!346683 (Found!7977 j!159))))

(declare-fun res!526501 () Bool)

(assert (=> start!67274 (=> (not res!526501) (not e!432918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67274 (= res!526501 (validMask!0 mask!3328))))

(assert (=> start!67274 e!432918))

(assert (=> start!67274 true))

(declare-fun array_inv!16173 (array!42566) Bool)

(assert (=> start!67274 (array_inv!16173 a!3186)))

(declare-fun b!778141 () Bool)

(declare-fun lt!346685 () SeekEntryResult!7977)

(assert (=> b!778141 (= e!432923 (or (not (= lt!346685 (Found!7977 index!1321))) (= lt!346685 lt!346689)))))

(assert (=> b!778141 (= lt!346685 (seekEntryOrOpen!0 lt!346690 lt!346687 mask!3328))))

(declare-fun b!778153 () Bool)

(assert (=> b!778153 (= e!432922 e!432924)))

(declare-fun res!526511 () Bool)

(assert (=> b!778153 (=> (not res!526511) (not e!432924))))

(assert (=> b!778153 (= res!526511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346691))))

(assert (=> b!778153 (= lt!346691 (Intermediate!7977 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778154 () Bool)

(assert (=> b!778154 (= e!432918 e!432922)))

(declare-fun res!526515 () Bool)

(assert (=> b!778154 (=> (not res!526515) (not e!432922))))

(declare-fun lt!346684 () SeekEntryResult!7977)

(assert (=> b!778154 (= res!526515 (or (= lt!346684 (MissingZero!7977 i!1173)) (= lt!346684 (MissingVacant!7977 i!1173))))))

(assert (=> b!778154 (= lt!346684 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778155 () Bool)

(declare-fun res!526500 () Bool)

(assert (=> b!778155 (=> (not res!526500) (not e!432922))))

(assert (=> b!778155 (= res!526500 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20798 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20798 a!3186))))))

(declare-fun b!778156 () Bool)

(declare-fun res!526510 () Bool)

(assert (=> b!778156 (=> (not res!526510) (not e!432918))))

(assert (=> b!778156 (= res!526510 (validKeyInArray!0 (select (arr!20377 a!3186) j!159)))))

(declare-fun b!778157 () Bool)

(declare-fun res!526502 () Bool)

(assert (=> b!778157 (=> (not res!526502) (not e!432918))))

(assert (=> b!778157 (= res!526502 (and (= (size!20798 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20798 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20798 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778158 () Bool)

(declare-fun res!526508 () Bool)

(assert (=> b!778158 (=> (not res!526508) (not e!432922))))

(assert (=> b!778158 (= res!526508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67274 res!526501) b!778157))

(assert (= (and b!778157 res!526502) b!778156))

(assert (= (and b!778156 res!526510) b!778151))

(assert (= (and b!778151 res!526512) b!778142))

(assert (= (and b!778142 res!526509) b!778154))

(assert (= (and b!778154 res!526515) b!778158))

(assert (= (and b!778158 res!526508) b!778147))

(assert (= (and b!778147 res!526517) b!778155))

(assert (= (and b!778155 res!526500) b!778153))

(assert (= (and b!778153 res!526511) b!778140))

(assert (= (and b!778140 res!526506) b!778143))

(assert (= (and b!778143 c!86221) b!778149))

(assert (= (and b!778143 (not c!86221)) b!778139))

(assert (= (and b!778143 res!526516) b!778148))

(assert (= (and b!778148 res!526513) b!778144))

(assert (= (and b!778144 res!526507) b!778152))

(assert (= (and b!778152 res!526514) b!778146))

(assert (= (and b!778144 (not res!526505)) b!778150))

(assert (= (and b!778150 (not res!526504)) b!778145))

(assert (= (and b!778145 (not res!526503)) b!778141))

(declare-fun m!721891 () Bool)

(assert (=> start!67274 m!721891))

(declare-fun m!721893 () Bool)

(assert (=> start!67274 m!721893))

(declare-fun m!721895 () Bool)

(assert (=> b!778152 m!721895))

(assert (=> b!778152 m!721895))

(declare-fun m!721897 () Bool)

(assert (=> b!778152 m!721897))

(assert (=> b!778139 m!721895))

(assert (=> b!778139 m!721895))

(declare-fun m!721899 () Bool)

(assert (=> b!778139 m!721899))

(assert (=> b!778146 m!721895))

(assert (=> b!778146 m!721895))

(declare-fun m!721901 () Bool)

(assert (=> b!778146 m!721901))

(assert (=> b!778156 m!721895))

(assert (=> b!778156 m!721895))

(declare-fun m!721903 () Bool)

(assert (=> b!778156 m!721903))

(declare-fun m!721905 () Bool)

(assert (=> b!778142 m!721905))

(assert (=> b!778149 m!721895))

(assert (=> b!778149 m!721895))

(declare-fun m!721907 () Bool)

(assert (=> b!778149 m!721907))

(declare-fun m!721909 () Bool)

(assert (=> b!778141 m!721909))

(assert (=> b!778153 m!721895))

(assert (=> b!778153 m!721895))

(declare-fun m!721911 () Bool)

(assert (=> b!778153 m!721911))

(assert (=> b!778153 m!721911))

(assert (=> b!778153 m!721895))

(declare-fun m!721913 () Bool)

(assert (=> b!778153 m!721913))

(assert (=> b!778150 m!721895))

(assert (=> b!778150 m!721895))

(assert (=> b!778150 m!721899))

(declare-fun m!721915 () Bool)

(assert (=> b!778140 m!721915))

(declare-fun m!721917 () Bool)

(assert (=> b!778151 m!721917))

(declare-fun m!721919 () Bool)

(assert (=> b!778147 m!721919))

(declare-fun m!721921 () Bool)

(assert (=> b!778145 m!721921))

(declare-fun m!721923 () Bool)

(assert (=> b!778145 m!721923))

(declare-fun m!721925 () Bool)

(assert (=> b!778154 m!721925))

(declare-fun m!721927 () Bool)

(assert (=> b!778148 m!721927))

(assert (=> b!778148 m!721921))

(declare-fun m!721929 () Bool)

(assert (=> b!778148 m!721929))

(declare-fun m!721931 () Bool)

(assert (=> b!778148 m!721931))

(assert (=> b!778148 m!721927))

(declare-fun m!721933 () Bool)

(assert (=> b!778148 m!721933))

(declare-fun m!721935 () Bool)

(assert (=> b!778158 m!721935))

(declare-fun m!721937 () Bool)

(assert (=> b!778144 m!721937))

(declare-fun m!721939 () Bool)

(assert (=> b!778144 m!721939))

(check-sat (not b!778141) (not b!778149) (not start!67274) (not b!778139) (not b!778148) (not b!778158) (not b!778146) (not b!778151) (not b!778156) (not b!778150) (not b!778142) (not b!778154) (not b!778147) (not b!778152) (not b!778144) (not b!778153))
(check-sat)
(get-model)

(declare-fun d!102267 () Bool)

(assert (=> d!102267 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778151 d!102267))

(declare-fun b!778237 () Bool)

(declare-fun e!432965 () Bool)

(declare-fun e!432966 () Bool)

(assert (=> b!778237 (= e!432965 e!432966)))

(declare-fun res!526579 () Bool)

(declare-fun lt!346726 () SeekEntryResult!7977)

(assert (=> b!778237 (= res!526579 (and ((_ is Intermediate!7977) lt!346726) (not (undefined!8789 lt!346726)) (bvslt (x!65217 lt!346726) #b01111111111111111111111111111110) (bvsge (x!65217 lt!346726) #b00000000000000000000000000000000) (bvsge (x!65217 lt!346726) x!1131)))))

(assert (=> b!778237 (=> (not res!526579) (not e!432966))))

(declare-fun e!432964 () SeekEntryResult!7977)

(declare-fun b!778238 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778238 (= e!432964 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778239 () Bool)

(declare-fun e!432968 () SeekEntryResult!7977)

(assert (=> b!778239 (= e!432968 (Intermediate!7977 true index!1321 x!1131))))

(declare-fun d!102269 () Bool)

(assert (=> d!102269 e!432965))

(declare-fun c!86233 () Bool)

(assert (=> d!102269 (= c!86233 (and ((_ is Intermediate!7977) lt!346726) (undefined!8789 lt!346726)))))

(assert (=> d!102269 (= lt!346726 e!432968)))

(declare-fun c!86232 () Bool)

(assert (=> d!102269 (= c!86232 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346727 () (_ BitVec 64))

(assert (=> d!102269 (= lt!346727 (select (arr!20377 a!3186) index!1321))))

(assert (=> d!102269 (validMask!0 mask!3328)))

(assert (=> d!102269 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346726)))

(declare-fun b!778240 () Bool)

(assert (=> b!778240 (and (bvsge (index!34278 lt!346726) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346726) (size!20798 a!3186)))))

(declare-fun res!526578 () Bool)

(assert (=> b!778240 (= res!526578 (= (select (arr!20377 a!3186) (index!34278 lt!346726)) (select (arr!20377 a!3186) j!159)))))

(declare-fun e!432967 () Bool)

(assert (=> b!778240 (=> res!526578 e!432967)))

(assert (=> b!778240 (= e!432966 e!432967)))

(declare-fun b!778241 () Bool)

(assert (=> b!778241 (and (bvsge (index!34278 lt!346726) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346726) (size!20798 a!3186)))))

(declare-fun res!526580 () Bool)

(assert (=> b!778241 (= res!526580 (= (select (arr!20377 a!3186) (index!34278 lt!346726)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778241 (=> res!526580 e!432967)))

(declare-fun b!778242 () Bool)

(assert (=> b!778242 (= e!432965 (bvsge (x!65217 lt!346726) #b01111111111111111111111111111110))))

(declare-fun b!778243 () Bool)

(assert (=> b!778243 (= e!432968 e!432964)))

(declare-fun c!86231 () Bool)

(assert (=> b!778243 (= c!86231 (or (= lt!346727 (select (arr!20377 a!3186) j!159)) (= (bvadd lt!346727 lt!346727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778244 () Bool)

(assert (=> b!778244 (= e!432964 (Intermediate!7977 false index!1321 x!1131))))

(declare-fun b!778245 () Bool)

(assert (=> b!778245 (and (bvsge (index!34278 lt!346726) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346726) (size!20798 a!3186)))))

(assert (=> b!778245 (= e!432967 (= (select (arr!20377 a!3186) (index!34278 lt!346726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102269 c!86232) b!778239))

(assert (= (and d!102269 (not c!86232)) b!778243))

(assert (= (and b!778243 c!86231) b!778244))

(assert (= (and b!778243 (not c!86231)) b!778238))

(assert (= (and d!102269 c!86233) b!778242))

(assert (= (and d!102269 (not c!86233)) b!778237))

(assert (= (and b!778237 res!526579) b!778240))

(assert (= (and b!778240 (not res!526578)) b!778241))

(assert (= (and b!778241 (not res!526580)) b!778245))

(declare-fun m!721991 () Bool)

(assert (=> b!778240 m!721991))

(declare-fun m!721993 () Bool)

(assert (=> b!778238 m!721993))

(assert (=> b!778238 m!721993))

(assert (=> b!778238 m!721895))

(declare-fun m!721995 () Bool)

(assert (=> b!778238 m!721995))

(declare-fun m!721997 () Bool)

(assert (=> d!102269 m!721997))

(assert (=> d!102269 m!721891))

(assert (=> b!778245 m!721991))

(assert (=> b!778241 m!721991))

(assert (=> b!778149 d!102269))

(declare-fun b!778266 () Bool)

(declare-fun e!432981 () SeekEntryResult!7977)

(assert (=> b!778266 (= e!432981 (Found!7977 index!1321))))

(declare-fun b!778267 () Bool)

(declare-fun e!432983 () SeekEntryResult!7977)

(assert (=> b!778267 (= e!432983 Undefined!7977)))

(declare-fun b!778268 () Bool)

(assert (=> b!778268 (= e!432983 e!432981)))

(declare-fun lt!346739 () (_ BitVec 64))

(declare-fun c!86244 () Bool)

(assert (=> b!778268 (= c!86244 (= lt!346739 (select (arr!20377 a!3186) j!159)))))

(declare-fun b!778269 () Bool)

(declare-fun c!86243 () Bool)

(assert (=> b!778269 (= c!86243 (= lt!346739 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432982 () SeekEntryResult!7977)

(assert (=> b!778269 (= e!432981 e!432982)))

(declare-fun d!102271 () Bool)

(declare-fun lt!346738 () SeekEntryResult!7977)

(assert (=> d!102271 (and (or ((_ is Undefined!7977) lt!346738) (not ((_ is Found!7977) lt!346738)) (and (bvsge (index!34277 lt!346738) #b00000000000000000000000000000000) (bvslt (index!34277 lt!346738) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346738) ((_ is Found!7977) lt!346738) (not ((_ is MissingVacant!7977) lt!346738)) (not (= (index!34279 lt!346738) resIntermediateIndex!5)) (and (bvsge (index!34279 lt!346738) #b00000000000000000000000000000000) (bvslt (index!34279 lt!346738) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346738) (ite ((_ is Found!7977) lt!346738) (= (select (arr!20377 a!3186) (index!34277 lt!346738)) (select (arr!20377 a!3186) j!159)) (and ((_ is MissingVacant!7977) lt!346738) (= (index!34279 lt!346738) resIntermediateIndex!5) (= (select (arr!20377 a!3186) (index!34279 lt!346738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102271 (= lt!346738 e!432983)))

(declare-fun c!86242 () Bool)

(assert (=> d!102271 (= c!86242 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102271 (= lt!346739 (select (arr!20377 a!3186) index!1321))))

(assert (=> d!102271 (validMask!0 mask!3328)))

(assert (=> d!102271 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346738)))

(declare-fun b!778270 () Bool)

(assert (=> b!778270 (= e!432982 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778271 () Bool)

(assert (=> b!778271 (= e!432982 (MissingVacant!7977 resIntermediateIndex!5))))

(assert (= (and d!102271 c!86242) b!778267))

(assert (= (and d!102271 (not c!86242)) b!778268))

(assert (= (and b!778268 c!86244) b!778266))

(assert (= (and b!778268 (not c!86244)) b!778269))

(assert (= (and b!778269 c!86243) b!778271))

(assert (= (and b!778269 (not c!86243)) b!778270))

(declare-fun m!721999 () Bool)

(assert (=> d!102271 m!721999))

(declare-fun m!722001 () Bool)

(assert (=> d!102271 m!722001))

(assert (=> d!102271 m!721997))

(assert (=> d!102271 m!721891))

(assert (=> b!778270 m!721993))

(assert (=> b!778270 m!721993))

(assert (=> b!778270 m!721895))

(declare-fun m!722009 () Bool)

(assert (=> b!778270 m!722009))

(assert (=> b!778150 d!102271))

(assert (=> b!778139 d!102271))

(declare-fun b!778276 () Bool)

(declare-fun e!432988 () Bool)

(declare-fun e!432989 () Bool)

(assert (=> b!778276 (= e!432988 e!432989)))

(declare-fun res!526588 () Bool)

(declare-fun lt!346743 () SeekEntryResult!7977)

(assert (=> b!778276 (= res!526588 (and ((_ is Intermediate!7977) lt!346743) (not (undefined!8789 lt!346743)) (bvslt (x!65217 lt!346743) #b01111111111111111111111111111110) (bvsge (x!65217 lt!346743) #b00000000000000000000000000000000) (bvsge (x!65217 lt!346743) #b00000000000000000000000000000000)))))

(assert (=> b!778276 (=> (not res!526588) (not e!432989))))

(declare-fun e!432987 () SeekEntryResult!7977)

(declare-fun b!778277 () Bool)

(assert (=> b!778277 (= e!432987 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!432991 () SeekEntryResult!7977)

(declare-fun b!778278 () Bool)

(assert (=> b!778278 (= e!432991 (Intermediate!7977 true (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102275 () Bool)

(assert (=> d!102275 e!432988))

(declare-fun c!86248 () Bool)

(assert (=> d!102275 (= c!86248 (and ((_ is Intermediate!7977) lt!346743) (undefined!8789 lt!346743)))))

(assert (=> d!102275 (= lt!346743 e!432991)))

(declare-fun c!86247 () Bool)

(assert (=> d!102275 (= c!86247 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346744 () (_ BitVec 64))

(assert (=> d!102275 (= lt!346744 (select (arr!20377 a!3186) (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328)))))

(assert (=> d!102275 (validMask!0 mask!3328)))

(assert (=> d!102275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346743)))

(declare-fun b!778279 () Bool)

(assert (=> b!778279 (and (bvsge (index!34278 lt!346743) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346743) (size!20798 a!3186)))))

(declare-fun res!526587 () Bool)

(assert (=> b!778279 (= res!526587 (= (select (arr!20377 a!3186) (index!34278 lt!346743)) (select (arr!20377 a!3186) j!159)))))

(declare-fun e!432990 () Bool)

(assert (=> b!778279 (=> res!526587 e!432990)))

(assert (=> b!778279 (= e!432989 e!432990)))

(declare-fun b!778280 () Bool)

(assert (=> b!778280 (and (bvsge (index!34278 lt!346743) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346743) (size!20798 a!3186)))))

(declare-fun res!526589 () Bool)

(assert (=> b!778280 (= res!526589 (= (select (arr!20377 a!3186) (index!34278 lt!346743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778280 (=> res!526589 e!432990)))

(declare-fun b!778281 () Bool)

(assert (=> b!778281 (= e!432988 (bvsge (x!65217 lt!346743) #b01111111111111111111111111111110))))

(declare-fun b!778282 () Bool)

(assert (=> b!778282 (= e!432991 e!432987)))

(declare-fun c!86246 () Bool)

(assert (=> b!778282 (= c!86246 (or (= lt!346744 (select (arr!20377 a!3186) j!159)) (= (bvadd lt!346744 lt!346744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778283 () Bool)

(assert (=> b!778283 (= e!432987 (Intermediate!7977 false (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778284 () Bool)

(assert (=> b!778284 (and (bvsge (index!34278 lt!346743) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346743) (size!20798 a!3186)))))

(assert (=> b!778284 (= e!432990 (= (select (arr!20377 a!3186) (index!34278 lt!346743)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102275 c!86247) b!778278))

(assert (= (and d!102275 (not c!86247)) b!778282))

(assert (= (and b!778282 c!86246) b!778283))

(assert (= (and b!778282 (not c!86246)) b!778277))

(assert (= (and d!102275 c!86248) b!778281))

(assert (= (and d!102275 (not c!86248)) b!778276))

(assert (= (and b!778276 res!526588) b!778279))

(assert (= (and b!778279 (not res!526587)) b!778280))

(assert (= (and b!778280 (not res!526589)) b!778284))

(declare-fun m!722017 () Bool)

(assert (=> b!778279 m!722017))

(assert (=> b!778277 m!721911))

(declare-fun m!722019 () Bool)

(assert (=> b!778277 m!722019))

(assert (=> b!778277 m!722019))

(assert (=> b!778277 m!721895))

(declare-fun m!722021 () Bool)

(assert (=> b!778277 m!722021))

(assert (=> d!102275 m!721911))

(declare-fun m!722023 () Bool)

(assert (=> d!102275 m!722023))

(assert (=> d!102275 m!721891))

(assert (=> b!778284 m!722017))

(assert (=> b!778280 m!722017))

(assert (=> b!778153 d!102275))

(declare-fun d!102281 () Bool)

(declare-fun lt!346750 () (_ BitVec 32))

(declare-fun lt!346749 () (_ BitVec 32))

(assert (=> d!102281 (= lt!346750 (bvmul (bvxor lt!346749 (bvlshr lt!346749 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102281 (= lt!346749 ((_ extract 31 0) (bvand (bvxor (select (arr!20377 a!3186) j!159) (bvlshr (select (arr!20377 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102281 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526590 (let ((h!15488 ((_ extract 31 0) (bvand (bvxor (select (arr!20377 a!3186) j!159) (bvlshr (select (arr!20377 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65221 (bvmul (bvxor h!15488 (bvlshr h!15488 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65221 (bvlshr x!65221 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526590 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526590 #b00000000000000000000000000000000))))))

(assert (=> d!102281 (= (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) (bvand (bvxor lt!346750 (bvlshr lt!346750 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778153 d!102281))

(declare-fun b!778333 () Bool)

(declare-fun e!433018 () SeekEntryResult!7977)

(declare-fun lt!346769 () SeekEntryResult!7977)

(assert (=> b!778333 (= e!433018 (MissingZero!7977 (index!34278 lt!346769)))))

(declare-fun b!778334 () Bool)

(declare-fun e!433019 () SeekEntryResult!7977)

(assert (=> b!778334 (= e!433019 Undefined!7977)))

(declare-fun d!102283 () Bool)

(declare-fun lt!346767 () SeekEntryResult!7977)

(assert (=> d!102283 (and (or ((_ is Undefined!7977) lt!346767) (not ((_ is Found!7977) lt!346767)) (and (bvsge (index!34277 lt!346767) #b00000000000000000000000000000000) (bvslt (index!34277 lt!346767) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346767) ((_ is Found!7977) lt!346767) (not ((_ is MissingZero!7977) lt!346767)) (and (bvsge (index!34276 lt!346767) #b00000000000000000000000000000000) (bvslt (index!34276 lt!346767) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346767) ((_ is Found!7977) lt!346767) ((_ is MissingZero!7977) lt!346767) (not ((_ is MissingVacant!7977) lt!346767)) (and (bvsge (index!34279 lt!346767) #b00000000000000000000000000000000) (bvslt (index!34279 lt!346767) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346767) (ite ((_ is Found!7977) lt!346767) (= (select (arr!20377 a!3186) (index!34277 lt!346767)) k0!2102) (ite ((_ is MissingZero!7977) lt!346767) (= (select (arr!20377 a!3186) (index!34276 lt!346767)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7977) lt!346767) (= (select (arr!20377 a!3186) (index!34279 lt!346767)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102283 (= lt!346767 e!433019)))

(declare-fun c!86271 () Bool)

(assert (=> d!102283 (= c!86271 (and ((_ is Intermediate!7977) lt!346769) (undefined!8789 lt!346769)))))

(assert (=> d!102283 (= lt!346769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102283 (validMask!0 mask!3328)))

(assert (=> d!102283 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!346767)))

(declare-fun b!778335 () Bool)

(declare-fun e!433017 () SeekEntryResult!7977)

(assert (=> b!778335 (= e!433019 e!433017)))

(declare-fun lt!346768 () (_ BitVec 64))

(assert (=> b!778335 (= lt!346768 (select (arr!20377 a!3186) (index!34278 lt!346769)))))

(declare-fun c!86270 () Bool)

(assert (=> b!778335 (= c!86270 (= lt!346768 k0!2102))))

(declare-fun b!778336 () Bool)

(assert (=> b!778336 (= e!433018 (seekKeyOrZeroReturnVacant!0 (x!65217 lt!346769) (index!34278 lt!346769) (index!34278 lt!346769) k0!2102 a!3186 mask!3328))))

(declare-fun b!778337 () Bool)

(assert (=> b!778337 (= e!433017 (Found!7977 (index!34278 lt!346769)))))

(declare-fun b!778338 () Bool)

(declare-fun c!86272 () Bool)

(assert (=> b!778338 (= c!86272 (= lt!346768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778338 (= e!433017 e!433018)))

(assert (= (and d!102283 c!86271) b!778334))

(assert (= (and d!102283 (not c!86271)) b!778335))

(assert (= (and b!778335 c!86270) b!778337))

(assert (= (and b!778335 (not c!86270)) b!778338))

(assert (= (and b!778338 c!86272) b!778333))

(assert (= (and b!778338 (not c!86272)) b!778336))

(declare-fun m!722035 () Bool)

(assert (=> d!102283 m!722035))

(declare-fun m!722037 () Bool)

(assert (=> d!102283 m!722037))

(assert (=> d!102283 m!722037))

(declare-fun m!722039 () Bool)

(assert (=> d!102283 m!722039))

(declare-fun m!722041 () Bool)

(assert (=> d!102283 m!722041))

(declare-fun m!722043 () Bool)

(assert (=> d!102283 m!722043))

(assert (=> d!102283 m!721891))

(declare-fun m!722045 () Bool)

(assert (=> b!778335 m!722045))

(declare-fun m!722047 () Bool)

(assert (=> b!778336 m!722047))

(assert (=> b!778154 d!102283))

(declare-fun d!102291 () Bool)

(assert (=> d!102291 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67274 d!102291))

(declare-fun d!102295 () Bool)

(assert (=> d!102295 (= (array_inv!16173 a!3186) (bvsge (size!20798 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67274 d!102295))

(declare-fun b!778375 () Bool)

(declare-fun e!433041 () SeekEntryResult!7977)

(declare-fun lt!346780 () SeekEntryResult!7977)

(assert (=> b!778375 (= e!433041 (MissingZero!7977 (index!34278 lt!346780)))))

(declare-fun b!778376 () Bool)

(declare-fun e!433042 () SeekEntryResult!7977)

(assert (=> b!778376 (= e!433042 Undefined!7977)))

(declare-fun d!102297 () Bool)

(declare-fun lt!346778 () SeekEntryResult!7977)

(assert (=> d!102297 (and (or ((_ is Undefined!7977) lt!346778) (not ((_ is Found!7977) lt!346778)) (and (bvsge (index!34277 lt!346778) #b00000000000000000000000000000000) (bvslt (index!34277 lt!346778) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346778) ((_ is Found!7977) lt!346778) (not ((_ is MissingZero!7977) lt!346778)) (and (bvsge (index!34276 lt!346778) #b00000000000000000000000000000000) (bvslt (index!34276 lt!346778) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346778) ((_ is Found!7977) lt!346778) ((_ is MissingZero!7977) lt!346778) (not ((_ is MissingVacant!7977) lt!346778)) (and (bvsge (index!34279 lt!346778) #b00000000000000000000000000000000) (bvslt (index!34279 lt!346778) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346778) (ite ((_ is Found!7977) lt!346778) (= (select (arr!20377 a!3186) (index!34277 lt!346778)) (select (arr!20377 a!3186) j!159)) (ite ((_ is MissingZero!7977) lt!346778) (= (select (arr!20377 a!3186) (index!34276 lt!346778)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7977) lt!346778) (= (select (arr!20377 a!3186) (index!34279 lt!346778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102297 (= lt!346778 e!433042)))

(declare-fun c!86286 () Bool)

(assert (=> d!102297 (= c!86286 (and ((_ is Intermediate!7977) lt!346780) (undefined!8789 lt!346780)))))

(assert (=> d!102297 (= lt!346780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20377 a!3186) j!159) mask!3328) (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102297 (validMask!0 mask!3328)))

(assert (=> d!102297 (= (seekEntryOrOpen!0 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346778)))

(declare-fun b!778377 () Bool)

(declare-fun e!433040 () SeekEntryResult!7977)

(assert (=> b!778377 (= e!433042 e!433040)))

(declare-fun lt!346779 () (_ BitVec 64))

(assert (=> b!778377 (= lt!346779 (select (arr!20377 a!3186) (index!34278 lt!346780)))))

(declare-fun c!86285 () Bool)

(assert (=> b!778377 (= c!86285 (= lt!346779 (select (arr!20377 a!3186) j!159)))))

(declare-fun b!778378 () Bool)

(assert (=> b!778378 (= e!433041 (seekKeyOrZeroReturnVacant!0 (x!65217 lt!346780) (index!34278 lt!346780) (index!34278 lt!346780) (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778379 () Bool)

(assert (=> b!778379 (= e!433040 (Found!7977 (index!34278 lt!346780)))))

(declare-fun b!778380 () Bool)

(declare-fun c!86287 () Bool)

(assert (=> b!778380 (= c!86287 (= lt!346779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778380 (= e!433040 e!433041)))

(assert (= (and d!102297 c!86286) b!778376))

(assert (= (and d!102297 (not c!86286)) b!778377))

(assert (= (and b!778377 c!86285) b!778379))

(assert (= (and b!778377 (not c!86285)) b!778380))

(assert (= (and b!778380 c!86287) b!778375))

(assert (= (and b!778380 (not c!86287)) b!778378))

(declare-fun m!722061 () Bool)

(assert (=> d!102297 m!722061))

(assert (=> d!102297 m!721895))

(assert (=> d!102297 m!721911))

(assert (=> d!102297 m!721911))

(assert (=> d!102297 m!721895))

(assert (=> d!102297 m!721913))

(declare-fun m!722065 () Bool)

(assert (=> d!102297 m!722065))

(declare-fun m!722067 () Bool)

(assert (=> d!102297 m!722067))

(assert (=> d!102297 m!721891))

(declare-fun m!722069 () Bool)

(assert (=> b!778377 m!722069))

(assert (=> b!778378 m!721895))

(declare-fun m!722071 () Bool)

(assert (=> b!778378 m!722071))

(assert (=> b!778152 d!102297))

(declare-fun b!778390 () Bool)

(declare-fun e!433049 () SeekEntryResult!7977)

(declare-fun lt!346785 () SeekEntryResult!7977)

(assert (=> b!778390 (= e!433049 (MissingZero!7977 (index!34278 lt!346785)))))

(declare-fun b!778391 () Bool)

(declare-fun e!433050 () SeekEntryResult!7977)

(assert (=> b!778391 (= e!433050 Undefined!7977)))

(declare-fun d!102301 () Bool)

(declare-fun lt!346783 () SeekEntryResult!7977)

(assert (=> d!102301 (and (or ((_ is Undefined!7977) lt!346783) (not ((_ is Found!7977) lt!346783)) (and (bvsge (index!34277 lt!346783) #b00000000000000000000000000000000) (bvslt (index!34277 lt!346783) (size!20798 lt!346687)))) (or ((_ is Undefined!7977) lt!346783) ((_ is Found!7977) lt!346783) (not ((_ is MissingZero!7977) lt!346783)) (and (bvsge (index!34276 lt!346783) #b00000000000000000000000000000000) (bvslt (index!34276 lt!346783) (size!20798 lt!346687)))) (or ((_ is Undefined!7977) lt!346783) ((_ is Found!7977) lt!346783) ((_ is MissingZero!7977) lt!346783) (not ((_ is MissingVacant!7977) lt!346783)) (and (bvsge (index!34279 lt!346783) #b00000000000000000000000000000000) (bvslt (index!34279 lt!346783) (size!20798 lt!346687)))) (or ((_ is Undefined!7977) lt!346783) (ite ((_ is Found!7977) lt!346783) (= (select (arr!20377 lt!346687) (index!34277 lt!346783)) lt!346690) (ite ((_ is MissingZero!7977) lt!346783) (= (select (arr!20377 lt!346687) (index!34276 lt!346783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7977) lt!346783) (= (select (arr!20377 lt!346687) (index!34279 lt!346783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102301 (= lt!346783 e!433050)))

(declare-fun c!86292 () Bool)

(assert (=> d!102301 (= c!86292 (and ((_ is Intermediate!7977) lt!346785) (undefined!8789 lt!346785)))))

(assert (=> d!102301 (= lt!346785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346690 mask!3328) lt!346690 lt!346687 mask!3328))))

(assert (=> d!102301 (validMask!0 mask!3328)))

(assert (=> d!102301 (= (seekEntryOrOpen!0 lt!346690 lt!346687 mask!3328) lt!346783)))

(declare-fun b!778392 () Bool)

(declare-fun e!433048 () SeekEntryResult!7977)

(assert (=> b!778392 (= e!433050 e!433048)))

(declare-fun lt!346784 () (_ BitVec 64))

(assert (=> b!778392 (= lt!346784 (select (arr!20377 lt!346687) (index!34278 lt!346785)))))

(declare-fun c!86291 () Bool)

(assert (=> b!778392 (= c!86291 (= lt!346784 lt!346690))))

(declare-fun b!778393 () Bool)

(assert (=> b!778393 (= e!433049 (seekKeyOrZeroReturnVacant!0 (x!65217 lt!346785) (index!34278 lt!346785) (index!34278 lt!346785) lt!346690 lt!346687 mask!3328))))

(declare-fun b!778394 () Bool)

(assert (=> b!778394 (= e!433048 (Found!7977 (index!34278 lt!346785)))))

(declare-fun b!778395 () Bool)

(declare-fun c!86293 () Bool)

(assert (=> b!778395 (= c!86293 (= lt!346784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778395 (= e!433048 e!433049)))

(assert (= (and d!102301 c!86292) b!778391))

(assert (= (and d!102301 (not c!86292)) b!778392))

(assert (= (and b!778392 c!86291) b!778394))

(assert (= (and b!778392 (not c!86291)) b!778395))

(assert (= (and b!778395 c!86293) b!778390))

(assert (= (and b!778395 (not c!86293)) b!778393))

(declare-fun m!722077 () Bool)

(assert (=> d!102301 m!722077))

(assert (=> d!102301 m!721927))

(assert (=> d!102301 m!721927))

(assert (=> d!102301 m!721933))

(declare-fun m!722081 () Bool)

(assert (=> d!102301 m!722081))

(declare-fun m!722083 () Bool)

(assert (=> d!102301 m!722083))

(assert (=> d!102301 m!721891))

(declare-fun m!722087 () Bool)

(assert (=> b!778392 m!722087))

(declare-fun m!722089 () Bool)

(assert (=> b!778393 m!722089))

(assert (=> b!778141 d!102301))

(declare-fun d!102305 () Bool)

(declare-fun res!526617 () Bool)

(declare-fun e!433055 () Bool)

(assert (=> d!102305 (=> res!526617 e!433055)))

(assert (=> d!102305 (= res!526617 (= (select (arr!20377 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102305 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!433055)))

(declare-fun b!778400 () Bool)

(declare-fun e!433056 () Bool)

(assert (=> b!778400 (= e!433055 e!433056)))

(declare-fun res!526618 () Bool)

(assert (=> b!778400 (=> (not res!526618) (not e!433056))))

(assert (=> b!778400 (= res!526618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20798 a!3186)))))

(declare-fun b!778401 () Bool)

(assert (=> b!778401 (= e!433056 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102305 (not res!526617)) b!778400))

(assert (= (and b!778400 res!526618) b!778401))

(declare-fun m!722091 () Bool)

(assert (=> d!102305 m!722091))

(declare-fun m!722093 () Bool)

(assert (=> b!778401 m!722093))

(assert (=> b!778142 d!102305))

(declare-fun d!102307 () Bool)

(assert (=> d!102307 (= (validKeyInArray!0 (select (arr!20377 a!3186) j!159)) (and (not (= (select (arr!20377 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20377 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778156 d!102307))

(declare-fun b!778402 () Bool)

(declare-fun e!433057 () SeekEntryResult!7977)

(assert (=> b!778402 (= e!433057 (Found!7977 resIntermediateIndex!5))))

(declare-fun b!778403 () Bool)

(declare-fun e!433059 () SeekEntryResult!7977)

(assert (=> b!778403 (= e!433059 Undefined!7977)))

(declare-fun b!778404 () Bool)

(assert (=> b!778404 (= e!433059 e!433057)))

(declare-fun c!86296 () Bool)

(declare-fun lt!346787 () (_ BitVec 64))

(assert (=> b!778404 (= c!86296 (= lt!346787 (select (arr!20377 a!3186) j!159)))))

(declare-fun b!778405 () Bool)

(declare-fun c!86295 () Bool)

(assert (=> b!778405 (= c!86295 (= lt!346787 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433058 () SeekEntryResult!7977)

(assert (=> b!778405 (= e!433057 e!433058)))

(declare-fun d!102309 () Bool)

(declare-fun lt!346786 () SeekEntryResult!7977)

(assert (=> d!102309 (and (or ((_ is Undefined!7977) lt!346786) (not ((_ is Found!7977) lt!346786)) (and (bvsge (index!34277 lt!346786) #b00000000000000000000000000000000) (bvslt (index!34277 lt!346786) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346786) ((_ is Found!7977) lt!346786) (not ((_ is MissingVacant!7977) lt!346786)) (not (= (index!34279 lt!346786) resIntermediateIndex!5)) (and (bvsge (index!34279 lt!346786) #b00000000000000000000000000000000) (bvslt (index!34279 lt!346786) (size!20798 a!3186)))) (or ((_ is Undefined!7977) lt!346786) (ite ((_ is Found!7977) lt!346786) (= (select (arr!20377 a!3186) (index!34277 lt!346786)) (select (arr!20377 a!3186) j!159)) (and ((_ is MissingVacant!7977) lt!346786) (= (index!34279 lt!346786) resIntermediateIndex!5) (= (select (arr!20377 a!3186) (index!34279 lt!346786)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102309 (= lt!346786 e!433059)))

(declare-fun c!86294 () Bool)

(assert (=> d!102309 (= c!86294 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102309 (= lt!346787 (select (arr!20377 a!3186) resIntermediateIndex!5))))

(assert (=> d!102309 (validMask!0 mask!3328)))

(assert (=> d!102309 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) lt!346786)))

(declare-fun b!778406 () Bool)

(assert (=> b!778406 (= e!433058 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20377 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778407 () Bool)

(assert (=> b!778407 (= e!433058 (MissingVacant!7977 resIntermediateIndex!5))))

(assert (= (and d!102309 c!86294) b!778403))

(assert (= (and d!102309 (not c!86294)) b!778404))

(assert (= (and b!778404 c!86296) b!778402))

(assert (= (and b!778404 (not c!86296)) b!778405))

(assert (= (and b!778405 c!86295) b!778407))

(assert (= (and b!778405 (not c!86295)) b!778406))

(declare-fun m!722095 () Bool)

(assert (=> d!102309 m!722095))

(declare-fun m!722097 () Bool)

(assert (=> d!102309 m!722097))

(assert (=> d!102309 m!721915))

(assert (=> d!102309 m!721891))

(declare-fun m!722099 () Bool)

(assert (=> b!778406 m!722099))

(assert (=> b!778406 m!722099))

(assert (=> b!778406 m!721895))

(declare-fun m!722101 () Bool)

(assert (=> b!778406 m!722101))

(assert (=> b!778146 d!102309))

(declare-fun b!778434 () Bool)

(declare-fun e!433077 () Bool)

(declare-fun e!433075 () Bool)

(assert (=> b!778434 (= e!433077 e!433075)))

(declare-fun lt!346811 () (_ BitVec 64))

(assert (=> b!778434 (= lt!346811 (select (arr!20377 a!3186) j!159))))

(declare-fun lt!346810 () Unit!26848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42566 (_ BitVec 64) (_ BitVec 32)) Unit!26848)

(assert (=> b!778434 (= lt!346810 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346811 j!159))))

(assert (=> b!778434 (arrayContainsKey!0 a!3186 lt!346811 #b00000000000000000000000000000000)))

(declare-fun lt!346809 () Unit!26848)

(assert (=> b!778434 (= lt!346809 lt!346810)))

(declare-fun res!526623 () Bool)

(assert (=> b!778434 (= res!526623 (= (seekEntryOrOpen!0 (select (arr!20377 a!3186) j!159) a!3186 mask!3328) (Found!7977 j!159)))))

(assert (=> b!778434 (=> (not res!526623) (not e!433075))))

(declare-fun b!778435 () Bool)

(declare-fun call!35199 () Bool)

(assert (=> b!778435 (= e!433077 call!35199)))

(declare-fun d!102311 () Bool)

(declare-fun res!526624 () Bool)

(declare-fun e!433076 () Bool)

(assert (=> d!102311 (=> res!526624 e!433076)))

(assert (=> d!102311 (= res!526624 (bvsge j!159 (size!20798 a!3186)))))

(assert (=> d!102311 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!433076)))

(declare-fun b!778436 () Bool)

(assert (=> b!778436 (= e!433076 e!433077)))

(declare-fun c!86308 () Bool)

(assert (=> b!778436 (= c!86308 (validKeyInArray!0 (select (arr!20377 a!3186) j!159)))))

(declare-fun bm!35196 () Bool)

(assert (=> bm!35196 (= call!35199 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!778437 () Bool)

(assert (=> b!778437 (= e!433075 call!35199)))

(assert (= (and d!102311 (not res!526624)) b!778436))

(assert (= (and b!778436 c!86308) b!778434))

(assert (= (and b!778436 (not c!86308)) b!778435))

(assert (= (and b!778434 res!526623) b!778437))

(assert (= (or b!778437 b!778435) bm!35196))

(assert (=> b!778434 m!721895))

(declare-fun m!722117 () Bool)

(assert (=> b!778434 m!722117))

(declare-fun m!722119 () Bool)

(assert (=> b!778434 m!722119))

(assert (=> b!778434 m!721895))

(assert (=> b!778434 m!721897))

(assert (=> b!778436 m!721895))

(assert (=> b!778436 m!721895))

(assert (=> b!778436 m!721903))

(declare-fun m!722121 () Bool)

(assert (=> bm!35196 m!722121))

(assert (=> b!778144 d!102311))

(declare-fun d!102317 () Bool)

(assert (=> d!102317 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346820 () Unit!26848)

(declare-fun choose!38 (array!42566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26848)

(assert (=> d!102317 (= lt!346820 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102317 (validMask!0 mask!3328)))

(assert (=> d!102317 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346820)))

(declare-fun bs!21691 () Bool)

(assert (= bs!21691 d!102317))

(assert (=> bs!21691 m!721937))

(declare-fun m!722123 () Bool)

(assert (=> bs!21691 m!722123))

(assert (=> bs!21691 m!721891))

(assert (=> b!778144 d!102317))

(declare-fun b!778446 () Bool)

(declare-fun e!433085 () Bool)

(declare-fun e!433086 () Bool)

(assert (=> b!778446 (= e!433085 e!433086)))

(declare-fun res!526630 () Bool)

(declare-fun lt!346821 () SeekEntryResult!7977)

(assert (=> b!778446 (= res!526630 (and ((_ is Intermediate!7977) lt!346821) (not (undefined!8789 lt!346821)) (bvslt (x!65217 lt!346821) #b01111111111111111111111111111110) (bvsge (x!65217 lt!346821) #b00000000000000000000000000000000) (bvsge (x!65217 lt!346821) x!1131)))))

(assert (=> b!778446 (=> (not res!526630) (not e!433086))))

(declare-fun b!778447 () Bool)

(declare-fun e!433084 () SeekEntryResult!7977)

(assert (=> b!778447 (= e!433084 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346690 lt!346687 mask!3328))))

(declare-fun b!778448 () Bool)

(declare-fun e!433088 () SeekEntryResult!7977)

(assert (=> b!778448 (= e!433088 (Intermediate!7977 true index!1321 x!1131))))

(declare-fun d!102319 () Bool)

(assert (=> d!102319 e!433085))

(declare-fun c!86313 () Bool)

(assert (=> d!102319 (= c!86313 (and ((_ is Intermediate!7977) lt!346821) (undefined!8789 lt!346821)))))

(assert (=> d!102319 (= lt!346821 e!433088)))

(declare-fun c!86312 () Bool)

(assert (=> d!102319 (= c!86312 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346822 () (_ BitVec 64))

(assert (=> d!102319 (= lt!346822 (select (arr!20377 lt!346687) index!1321))))

(assert (=> d!102319 (validMask!0 mask!3328)))

(assert (=> d!102319 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346690 lt!346687 mask!3328) lt!346821)))

(declare-fun b!778449 () Bool)

(assert (=> b!778449 (and (bvsge (index!34278 lt!346821) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346821) (size!20798 lt!346687)))))

(declare-fun res!526629 () Bool)

(assert (=> b!778449 (= res!526629 (= (select (arr!20377 lt!346687) (index!34278 lt!346821)) lt!346690))))

(declare-fun e!433087 () Bool)

(assert (=> b!778449 (=> res!526629 e!433087)))

(assert (=> b!778449 (= e!433086 e!433087)))

(declare-fun b!778450 () Bool)

(assert (=> b!778450 (and (bvsge (index!34278 lt!346821) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346821) (size!20798 lt!346687)))))

(declare-fun res!526631 () Bool)

(assert (=> b!778450 (= res!526631 (= (select (arr!20377 lt!346687) (index!34278 lt!346821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778450 (=> res!526631 e!433087)))

(declare-fun b!778451 () Bool)

(assert (=> b!778451 (= e!433085 (bvsge (x!65217 lt!346821) #b01111111111111111111111111111110))))

(declare-fun b!778452 () Bool)

(assert (=> b!778452 (= e!433088 e!433084)))

(declare-fun c!86311 () Bool)

(assert (=> b!778452 (= c!86311 (or (= lt!346822 lt!346690) (= (bvadd lt!346822 lt!346822) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778453 () Bool)

(assert (=> b!778453 (= e!433084 (Intermediate!7977 false index!1321 x!1131))))

(declare-fun b!778454 () Bool)

(assert (=> b!778454 (and (bvsge (index!34278 lt!346821) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346821) (size!20798 lt!346687)))))

(assert (=> b!778454 (= e!433087 (= (select (arr!20377 lt!346687) (index!34278 lt!346821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102319 c!86312) b!778448))

(assert (= (and d!102319 (not c!86312)) b!778452))

(assert (= (and b!778452 c!86311) b!778453))

(assert (= (and b!778452 (not c!86311)) b!778447))

(assert (= (and d!102319 c!86313) b!778451))

(assert (= (and d!102319 (not c!86313)) b!778446))

(assert (= (and b!778446 res!526630) b!778449))

(assert (= (and b!778449 (not res!526629)) b!778450))

(assert (= (and b!778450 (not res!526631)) b!778454))

(declare-fun m!722125 () Bool)

(assert (=> b!778449 m!722125))

(assert (=> b!778447 m!721993))

(assert (=> b!778447 m!721993))

(declare-fun m!722127 () Bool)

(assert (=> b!778447 m!722127))

(declare-fun m!722129 () Bool)

(assert (=> d!102319 m!722129))

(assert (=> d!102319 m!721891))

(assert (=> b!778454 m!722125))

(assert (=> b!778450 m!722125))

(assert (=> b!778148 d!102319))

(declare-fun b!778455 () Bool)

(declare-fun e!433090 () Bool)

(declare-fun e!433091 () Bool)

(assert (=> b!778455 (= e!433090 e!433091)))

(declare-fun res!526633 () Bool)

(declare-fun lt!346823 () SeekEntryResult!7977)

(assert (=> b!778455 (= res!526633 (and ((_ is Intermediate!7977) lt!346823) (not (undefined!8789 lt!346823)) (bvslt (x!65217 lt!346823) #b01111111111111111111111111111110) (bvsge (x!65217 lt!346823) #b00000000000000000000000000000000) (bvsge (x!65217 lt!346823) #b00000000000000000000000000000000)))))

(assert (=> b!778455 (=> (not res!526633) (not e!433091))))

(declare-fun b!778456 () Bool)

(declare-fun e!433089 () SeekEntryResult!7977)

(assert (=> b!778456 (= e!433089 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346690 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346690 lt!346687 mask!3328))))

(declare-fun b!778457 () Bool)

(declare-fun e!433093 () SeekEntryResult!7977)

(assert (=> b!778457 (= e!433093 (Intermediate!7977 true (toIndex!0 lt!346690 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102321 () Bool)

(assert (=> d!102321 e!433090))

(declare-fun c!86316 () Bool)

(assert (=> d!102321 (= c!86316 (and ((_ is Intermediate!7977) lt!346823) (undefined!8789 lt!346823)))))

(assert (=> d!102321 (= lt!346823 e!433093)))

(declare-fun c!86315 () Bool)

(assert (=> d!102321 (= c!86315 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346824 () (_ BitVec 64))

(assert (=> d!102321 (= lt!346824 (select (arr!20377 lt!346687) (toIndex!0 lt!346690 mask!3328)))))

(assert (=> d!102321 (validMask!0 mask!3328)))

(assert (=> d!102321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346690 mask!3328) lt!346690 lt!346687 mask!3328) lt!346823)))

(declare-fun b!778458 () Bool)

(assert (=> b!778458 (and (bvsge (index!34278 lt!346823) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346823) (size!20798 lt!346687)))))

(declare-fun res!526632 () Bool)

(assert (=> b!778458 (= res!526632 (= (select (arr!20377 lt!346687) (index!34278 lt!346823)) lt!346690))))

(declare-fun e!433092 () Bool)

(assert (=> b!778458 (=> res!526632 e!433092)))

(assert (=> b!778458 (= e!433091 e!433092)))

(declare-fun b!778459 () Bool)

(assert (=> b!778459 (and (bvsge (index!34278 lt!346823) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346823) (size!20798 lt!346687)))))

(declare-fun res!526634 () Bool)

(assert (=> b!778459 (= res!526634 (= (select (arr!20377 lt!346687) (index!34278 lt!346823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778459 (=> res!526634 e!433092)))

(declare-fun b!778460 () Bool)

(assert (=> b!778460 (= e!433090 (bvsge (x!65217 lt!346823) #b01111111111111111111111111111110))))

(declare-fun b!778461 () Bool)

(assert (=> b!778461 (= e!433093 e!433089)))

(declare-fun c!86314 () Bool)

(assert (=> b!778461 (= c!86314 (or (= lt!346824 lt!346690) (= (bvadd lt!346824 lt!346824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778462 () Bool)

(assert (=> b!778462 (= e!433089 (Intermediate!7977 false (toIndex!0 lt!346690 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778463 () Bool)

(assert (=> b!778463 (and (bvsge (index!34278 lt!346823) #b00000000000000000000000000000000) (bvslt (index!34278 lt!346823) (size!20798 lt!346687)))))

(assert (=> b!778463 (= e!433092 (= (select (arr!20377 lt!346687) (index!34278 lt!346823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102321 c!86315) b!778457))

(assert (= (and d!102321 (not c!86315)) b!778461))

(assert (= (and b!778461 c!86314) b!778462))

(assert (= (and b!778461 (not c!86314)) b!778456))

(assert (= (and d!102321 c!86316) b!778460))

(assert (= (and d!102321 (not c!86316)) b!778455))

(assert (= (and b!778455 res!526633) b!778458))

(assert (= (and b!778458 (not res!526632)) b!778459))

(assert (= (and b!778459 (not res!526634)) b!778463))

(declare-fun m!722131 () Bool)

(assert (=> b!778458 m!722131))

(assert (=> b!778456 m!721927))

(declare-fun m!722133 () Bool)

(assert (=> b!778456 m!722133))

(assert (=> b!778456 m!722133))

(declare-fun m!722135 () Bool)

(assert (=> b!778456 m!722135))

(assert (=> d!102321 m!721927))

(declare-fun m!722137 () Bool)

(assert (=> d!102321 m!722137))

(assert (=> d!102321 m!721891))

(assert (=> b!778463 m!722131))

(assert (=> b!778459 m!722131))

(assert (=> b!778148 d!102321))

(declare-fun d!102323 () Bool)

(declare-fun lt!346832 () (_ BitVec 32))

(declare-fun lt!346831 () (_ BitVec 32))

(assert (=> d!102323 (= lt!346832 (bvmul (bvxor lt!346831 (bvlshr lt!346831 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102323 (= lt!346831 ((_ extract 31 0) (bvand (bvxor lt!346690 (bvlshr lt!346690 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102323 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526590 (let ((h!15488 ((_ extract 31 0) (bvand (bvxor lt!346690 (bvlshr lt!346690 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65221 (bvmul (bvxor h!15488 (bvlshr h!15488 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65221 (bvlshr x!65221 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526590 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526590 #b00000000000000000000000000000000))))))

(assert (=> d!102323 (= (toIndex!0 lt!346690 mask!3328) (bvand (bvxor lt!346832 (bvlshr lt!346832 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778148 d!102323))

(declare-fun b!778480 () Bool)

(declare-fun e!433105 () Bool)

(declare-fun e!433103 () Bool)

(assert (=> b!778480 (= e!433105 e!433103)))

(declare-fun lt!346838 () (_ BitVec 64))

(assert (=> b!778480 (= lt!346838 (select (arr!20377 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346837 () Unit!26848)

(assert (=> b!778480 (= lt!346837 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346838 #b00000000000000000000000000000000))))

(assert (=> b!778480 (arrayContainsKey!0 a!3186 lt!346838 #b00000000000000000000000000000000)))

(declare-fun lt!346836 () Unit!26848)

(assert (=> b!778480 (= lt!346836 lt!346837)))

(declare-fun res!526637 () Bool)

(assert (=> b!778480 (= res!526637 (= (seekEntryOrOpen!0 (select (arr!20377 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7977 #b00000000000000000000000000000000)))))

(assert (=> b!778480 (=> (not res!526637) (not e!433103))))

(declare-fun b!778481 () Bool)

(declare-fun call!35203 () Bool)

(assert (=> b!778481 (= e!433105 call!35203)))

(declare-fun d!102325 () Bool)

(declare-fun res!526638 () Bool)

(declare-fun e!433104 () Bool)

(assert (=> d!102325 (=> res!526638 e!433104)))

(assert (=> d!102325 (= res!526638 (bvsge #b00000000000000000000000000000000 (size!20798 a!3186)))))

(assert (=> d!102325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!433104)))

(declare-fun b!778482 () Bool)

(assert (=> b!778482 (= e!433104 e!433105)))

(declare-fun c!86324 () Bool)

(assert (=> b!778482 (= c!86324 (validKeyInArray!0 (select (arr!20377 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35200 () Bool)

(assert (=> bm!35200 (= call!35203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!778483 () Bool)

(assert (=> b!778483 (= e!433103 call!35203)))

(assert (= (and d!102325 (not res!526638)) b!778482))

(assert (= (and b!778482 c!86324) b!778480))

(assert (= (and b!778482 (not c!86324)) b!778481))

(assert (= (and b!778480 res!526637) b!778483))

(assert (= (or b!778483 b!778481) bm!35200))

(assert (=> b!778480 m!722091))

(declare-fun m!722151 () Bool)

(assert (=> b!778480 m!722151))

(declare-fun m!722153 () Bool)

(assert (=> b!778480 m!722153))

(assert (=> b!778480 m!722091))

(declare-fun m!722155 () Bool)

(assert (=> b!778480 m!722155))

(assert (=> b!778482 m!722091))

(assert (=> b!778482 m!722091))

(declare-fun m!722157 () Bool)

(assert (=> b!778482 m!722157))

(declare-fun m!722159 () Bool)

(assert (=> bm!35200 m!722159))

(assert (=> b!778158 d!102325))

(declare-fun b!778524 () Bool)

(declare-fun e!433133 () Bool)

(declare-fun e!433131 () Bool)

(assert (=> b!778524 (= e!433133 e!433131)))

(declare-fun c!86339 () Bool)

(assert (=> b!778524 (= c!86339 (validKeyInArray!0 (select (arr!20377 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778525 () Bool)

(declare-fun call!35206 () Bool)

(assert (=> b!778525 (= e!433131 call!35206)))

(declare-fun d!102329 () Bool)

(declare-fun res!526652 () Bool)

(declare-fun e!433130 () Bool)

(assert (=> d!102329 (=> res!526652 e!433130)))

(assert (=> d!102329 (= res!526652 (bvsge #b00000000000000000000000000000000 (size!20798 a!3186)))))

(assert (=> d!102329 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14376) e!433130)))

(declare-fun b!778526 () Bool)

(assert (=> b!778526 (= e!433130 e!433133)))

(declare-fun res!526653 () Bool)

(assert (=> b!778526 (=> (not res!526653) (not e!433133))))

(declare-fun e!433132 () Bool)

(assert (=> b!778526 (= res!526653 (not e!433132))))

(declare-fun res!526654 () Bool)

(assert (=> b!778526 (=> (not res!526654) (not e!433132))))

(assert (=> b!778526 (= res!526654 (validKeyInArray!0 (select (arr!20377 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35203 () Bool)

(assert (=> bm!35203 (= call!35206 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86339 (Cons!14375 (select (arr!20377 a!3186) #b00000000000000000000000000000000) Nil!14376) Nil!14376)))))

(declare-fun b!778527 () Bool)

(assert (=> b!778527 (= e!433131 call!35206)))

(declare-fun b!778528 () Bool)

(declare-fun contains!4100 (List!14379 (_ BitVec 64)) Bool)

(assert (=> b!778528 (= e!433132 (contains!4100 Nil!14376 (select (arr!20377 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102329 (not res!526652)) b!778526))

(assert (= (and b!778526 res!526654) b!778528))

(assert (= (and b!778526 res!526653) b!778524))

(assert (= (and b!778524 c!86339) b!778525))

(assert (= (and b!778524 (not c!86339)) b!778527))

(assert (= (or b!778525 b!778527) bm!35203))

(assert (=> b!778524 m!722091))

(assert (=> b!778524 m!722091))

(assert (=> b!778524 m!722157))

(assert (=> b!778526 m!722091))

(assert (=> b!778526 m!722091))

(assert (=> b!778526 m!722157))

(assert (=> bm!35203 m!722091))

(declare-fun m!722197 () Bool)

(assert (=> bm!35203 m!722197))

(assert (=> b!778528 m!722091))

(assert (=> b!778528 m!722091))

(declare-fun m!722199 () Bool)

(assert (=> b!778528 m!722199))

(assert (=> b!778147 d!102329))

(check-sat (not d!102321) (not b!778447) (not d!102271) (not b!778277) (not b!778378) (not d!102309) (not b!778401) (not b!778528) (not d!102269) (not b!778480) (not b!778434) (not d!102317) (not b!778482) (not d!102275) (not b!778456) (not b!778393) (not b!778270) (not bm!35196) (not b!778406) (not b!778336) (not d!102301) (not bm!35203) (not b!778238) (not bm!35200) (not d!102297) (not d!102283) (not d!102319) (not b!778436) (not b!778524) (not b!778526))
(check-sat)
