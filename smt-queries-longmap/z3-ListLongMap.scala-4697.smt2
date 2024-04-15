; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65222 () Bool)

(assert start!65222)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41412 0))(
  ( (array!41413 (arr!19820 (Array (_ BitVec 32) (_ BitVec 64))) (size!20241 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41412)

(declare-fun b!739242 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!413352 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7417 0))(
  ( (MissingZero!7417 (index!32036 (_ BitVec 32))) (Found!7417 (index!32037 (_ BitVec 32))) (Intermediate!7417 (undefined!8229 Bool) (index!32038 (_ BitVec 32)) (x!63034 (_ BitVec 32))) (Undefined!7417) (MissingVacant!7417 (index!32039 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41412 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!739242 (= e!413352 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) (Found!7417 j!159)))))

(declare-fun b!739243 () Bool)

(declare-fun e!413355 () Bool)

(declare-fun e!413351 () Bool)

(assert (=> b!739243 (= e!413355 e!413351)))

(declare-fun res!497112 () Bool)

(assert (=> b!739243 (=> res!497112 e!413351)))

(declare-fun lt!328150 () (_ BitVec 32))

(assert (=> b!739243 (= res!497112 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328150 #b00000000000000000000000000000000) (bvsge lt!328150 (size!20241 a!3186))))))

(declare-datatypes ((Unit!25244 0))(
  ( (Unit!25245) )
))
(declare-fun lt!328139 () Unit!25244)

(declare-fun e!413353 () Unit!25244)

(assert (=> b!739243 (= lt!328139 e!413353)))

(declare-fun c!81450 () Bool)

(declare-fun lt!328144 () Bool)

(assert (=> b!739243 (= c!81450 lt!328144)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739243 (= lt!328144 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739243 (= lt!328150 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739244 () Bool)

(declare-fun e!413345 () Bool)

(declare-fun e!413349 () Bool)

(assert (=> b!739244 (= e!413345 e!413349)))

(declare-fun res!497124 () Bool)

(assert (=> b!739244 (=> (not res!497124) (not e!413349))))

(declare-fun lt!328151 () SeekEntryResult!7417)

(declare-fun lt!328142 () SeekEntryResult!7417)

(assert (=> b!739244 (= res!497124 (= lt!328151 lt!328142))))

(declare-fun lt!328138 () array!41412)

(declare-fun lt!328148 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41412 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!739244 (= lt!328142 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328148 lt!328138 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739244 (= lt!328151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328148 mask!3328) lt!328148 lt!328138 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739244 (= lt!328148 (select (store (arr!19820 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739244 (= lt!328138 (array!41413 (store (arr!19820 a!3186) i!1173 k0!2102) (size!20241 a!3186)))))

(declare-fun b!739245 () Bool)

(declare-fun res!497123 () Bool)

(declare-fun e!413348 () Bool)

(assert (=> b!739245 (=> (not res!497123) (not e!413348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739245 (= res!497123 (validKeyInArray!0 (select (arr!19820 a!3186) j!159)))))

(declare-fun b!739246 () Bool)

(declare-fun Unit!25246 () Unit!25244)

(assert (=> b!739246 (= e!413353 Unit!25246)))

(declare-fun lt!328143 () SeekEntryResult!7417)

(assert (=> b!739246 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328150 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328143)))

(declare-fun b!739247 () Bool)

(declare-fun e!413354 () Bool)

(assert (=> b!739247 (= e!413354 e!413345)))

(declare-fun res!497117 () Bool)

(assert (=> b!739247 (=> (not res!497117) (not e!413345))))

(assert (=> b!739247 (= res!497117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19820 a!3186) j!159) mask!3328) (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328143))))

(assert (=> b!739247 (= lt!328143 (Intermediate!7417 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739248 () Bool)

(declare-fun e!413347 () Bool)

(declare-fun e!413346 () Bool)

(assert (=> b!739248 (= e!413347 e!413346)))

(declare-fun res!497119 () Bool)

(assert (=> b!739248 (=> (not res!497119) (not e!413346))))

(declare-fun lt!328145 () SeekEntryResult!7417)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41412 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!739248 (= res!497119 (= (seekEntryOrOpen!0 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328145))))

(assert (=> b!739248 (= lt!328145 (Found!7417 j!159))))

(declare-fun b!739249 () Bool)

(declare-fun res!497121 () Bool)

(assert (=> b!739249 (=> (not res!497121) (not e!413345))))

(assert (=> b!739249 (= res!497121 e!413352)))

(declare-fun c!81449 () Bool)

(assert (=> b!739249 (= c!81449 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739250 () Bool)

(assert (=> b!739250 (= e!413351 true)))

(declare-fun lt!328149 () SeekEntryResult!7417)

(assert (=> b!739250 (= lt!328149 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328150 lt!328148 lt!328138 mask!3328))))

(declare-fun b!739251 () Bool)

(declare-fun lt!328146 () SeekEntryResult!7417)

(declare-fun e!413356 () Bool)

(assert (=> b!739251 (= e!413356 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328150 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328146)))))

(declare-fun b!739252 () Bool)

(declare-fun res!497113 () Bool)

(assert (=> b!739252 (=> (not res!497113) (not e!413354))))

(assert (=> b!739252 (= res!497113 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20241 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20241 a!3186))))))

(declare-fun b!739253 () Bool)

(declare-fun res!497120 () Bool)

(assert (=> b!739253 (=> (not res!497120) (not e!413348))))

(declare-fun arrayContainsKey!0 (array!41412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739253 (= res!497120 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739254 () Bool)

(declare-fun res!497111 () Bool)

(assert (=> b!739254 (=> (not res!497111) (not e!413354))))

(declare-datatypes ((List!13861 0))(
  ( (Nil!13858) (Cons!13857 (h!14929 (_ BitVec 64)) (t!20167 List!13861)) )
))
(declare-fun arrayNoDuplicates!0 (array!41412 (_ BitVec 32) List!13861) Bool)

(assert (=> b!739254 (= res!497111 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13858))))

(declare-fun b!739255 () Bool)

(assert (=> b!739255 (= e!413356 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328150 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328143)))))

(declare-fun res!497108 () Bool)

(assert (=> start!65222 (=> (not res!497108) (not e!413348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65222 (= res!497108 (validMask!0 mask!3328))))

(assert (=> start!65222 e!413348))

(assert (=> start!65222 true))

(declare-fun array_inv!15703 (array!41412) Bool)

(assert (=> start!65222 (array_inv!15703 a!3186)))

(declare-fun b!739256 () Bool)

(declare-fun res!497115 () Bool)

(assert (=> b!739256 (=> (not res!497115) (not e!413348))))

(assert (=> b!739256 (= res!497115 (and (= (size!20241 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20241 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20241 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739257 () Bool)

(declare-fun res!497114 () Bool)

(assert (=> b!739257 (=> res!497114 e!413351)))

(assert (=> b!739257 (= res!497114 e!413356)))

(declare-fun c!81448 () Bool)

(assert (=> b!739257 (= c!81448 lt!328144)))

(declare-fun b!739258 () Bool)

(assert (=> b!739258 (= e!413348 e!413354)))

(declare-fun res!497118 () Bool)

(assert (=> b!739258 (=> (not res!497118) (not e!413354))))

(declare-fun lt!328141 () SeekEntryResult!7417)

(assert (=> b!739258 (= res!497118 (or (= lt!328141 (MissingZero!7417 i!1173)) (= lt!328141 (MissingVacant!7417 i!1173))))))

(assert (=> b!739258 (= lt!328141 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739259 () Bool)

(assert (=> b!739259 (= e!413349 (not e!413355))))

(declare-fun res!497122 () Bool)

(assert (=> b!739259 (=> res!497122 e!413355)))

(get-info :version)

(assert (=> b!739259 (= res!497122 (or (not ((_ is Intermediate!7417) lt!328142)) (bvsge x!1131 (x!63034 lt!328142))))))

(assert (=> b!739259 (= lt!328146 (Found!7417 j!159))))

(assert (=> b!739259 e!413347))

(declare-fun res!497116 () Bool)

(assert (=> b!739259 (=> (not res!497116) (not e!413347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41412 (_ BitVec 32)) Bool)

(assert (=> b!739259 (= res!497116 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328147 () Unit!25244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25244)

(assert (=> b!739259 (= lt!328147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739260 () Bool)

(assert (=> b!739260 (= e!413346 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328145))))

(declare-fun b!739261 () Bool)

(declare-fun Unit!25247 () Unit!25244)

(assert (=> b!739261 (= e!413353 Unit!25247)))

(declare-fun lt!328140 () SeekEntryResult!7417)

(assert (=> b!739261 (= lt!328140 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739261 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328150 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328146)))

(declare-fun b!739262 () Bool)

(declare-fun res!497109 () Bool)

(assert (=> b!739262 (=> (not res!497109) (not e!413348))))

(assert (=> b!739262 (= res!497109 (validKeyInArray!0 k0!2102))))

(declare-fun b!739263 () Bool)

(assert (=> b!739263 (= e!413352 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328143))))

(declare-fun b!739264 () Bool)

(declare-fun res!497107 () Bool)

(assert (=> b!739264 (=> (not res!497107) (not e!413354))))

(assert (=> b!739264 (= res!497107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739265 () Bool)

(declare-fun res!497110 () Bool)

(assert (=> b!739265 (=> (not res!497110) (not e!413345))))

(assert (=> b!739265 (= res!497110 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19820 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65222 res!497108) b!739256))

(assert (= (and b!739256 res!497115) b!739245))

(assert (= (and b!739245 res!497123) b!739262))

(assert (= (and b!739262 res!497109) b!739253))

(assert (= (and b!739253 res!497120) b!739258))

(assert (= (and b!739258 res!497118) b!739264))

(assert (= (and b!739264 res!497107) b!739254))

(assert (= (and b!739254 res!497111) b!739252))

(assert (= (and b!739252 res!497113) b!739247))

(assert (= (and b!739247 res!497117) b!739265))

(assert (= (and b!739265 res!497110) b!739249))

(assert (= (and b!739249 c!81449) b!739263))

(assert (= (and b!739249 (not c!81449)) b!739242))

(assert (= (and b!739249 res!497121) b!739244))

(assert (= (and b!739244 res!497124) b!739259))

(assert (= (and b!739259 res!497116) b!739248))

(assert (= (and b!739248 res!497119) b!739260))

(assert (= (and b!739259 (not res!497122)) b!739243))

(assert (= (and b!739243 c!81450) b!739246))

(assert (= (and b!739243 (not c!81450)) b!739261))

(assert (= (and b!739243 (not res!497112)) b!739257))

(assert (= (and b!739257 c!81448) b!739255))

(assert (= (and b!739257 (not c!81448)) b!739251))

(assert (= (and b!739257 (not res!497114)) b!739250))

(declare-fun m!690101 () Bool)

(assert (=> b!739247 m!690101))

(assert (=> b!739247 m!690101))

(declare-fun m!690103 () Bool)

(assert (=> b!739247 m!690103))

(assert (=> b!739247 m!690103))

(assert (=> b!739247 m!690101))

(declare-fun m!690105 () Bool)

(assert (=> b!739247 m!690105))

(assert (=> b!739251 m!690101))

(assert (=> b!739251 m!690101))

(declare-fun m!690107 () Bool)

(assert (=> b!739251 m!690107))

(declare-fun m!690109 () Bool)

(assert (=> b!739265 m!690109))

(declare-fun m!690111 () Bool)

(assert (=> b!739243 m!690111))

(assert (=> b!739246 m!690101))

(assert (=> b!739246 m!690101))

(declare-fun m!690113 () Bool)

(assert (=> b!739246 m!690113))

(assert (=> b!739260 m!690101))

(assert (=> b!739260 m!690101))

(declare-fun m!690115 () Bool)

(assert (=> b!739260 m!690115))

(assert (=> b!739255 m!690101))

(assert (=> b!739255 m!690101))

(assert (=> b!739255 m!690113))

(assert (=> b!739248 m!690101))

(assert (=> b!739248 m!690101))

(declare-fun m!690117 () Bool)

(assert (=> b!739248 m!690117))

(assert (=> b!739242 m!690101))

(assert (=> b!739242 m!690101))

(declare-fun m!690119 () Bool)

(assert (=> b!739242 m!690119))

(declare-fun m!690121 () Bool)

(assert (=> b!739244 m!690121))

(declare-fun m!690123 () Bool)

(assert (=> b!739244 m!690123))

(declare-fun m!690125 () Bool)

(assert (=> b!739244 m!690125))

(assert (=> b!739244 m!690121))

(declare-fun m!690127 () Bool)

(assert (=> b!739244 m!690127))

(declare-fun m!690129 () Bool)

(assert (=> b!739244 m!690129))

(declare-fun m!690131 () Bool)

(assert (=> b!739250 m!690131))

(declare-fun m!690133 () Bool)

(assert (=> b!739258 m!690133))

(declare-fun m!690135 () Bool)

(assert (=> b!739259 m!690135))

(declare-fun m!690137 () Bool)

(assert (=> b!739259 m!690137))

(declare-fun m!690139 () Bool)

(assert (=> b!739253 m!690139))

(declare-fun m!690141 () Bool)

(assert (=> b!739264 m!690141))

(declare-fun m!690143 () Bool)

(assert (=> start!65222 m!690143))

(declare-fun m!690145 () Bool)

(assert (=> start!65222 m!690145))

(assert (=> b!739261 m!690101))

(assert (=> b!739261 m!690101))

(assert (=> b!739261 m!690119))

(assert (=> b!739261 m!690101))

(assert (=> b!739261 m!690107))

(assert (=> b!739245 m!690101))

(assert (=> b!739245 m!690101))

(declare-fun m!690147 () Bool)

(assert (=> b!739245 m!690147))

(declare-fun m!690149 () Bool)

(assert (=> b!739254 m!690149))

(declare-fun m!690151 () Bool)

(assert (=> b!739262 m!690151))

(assert (=> b!739263 m!690101))

(assert (=> b!739263 m!690101))

(declare-fun m!690153 () Bool)

(assert (=> b!739263 m!690153))

(check-sat (not b!739242) (not b!739248) (not b!739258) (not b!739250) (not b!739254) (not b!739251) (not b!739247) (not b!739261) (not b!739253) (not b!739255) (not b!739243) (not b!739245) (not b!739263) (not b!739259) (not b!739260) (not b!739262) (not b!739264) (not start!65222) (not b!739246) (not b!739244))
(check-sat)
