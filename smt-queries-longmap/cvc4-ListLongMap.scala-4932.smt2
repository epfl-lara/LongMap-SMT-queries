; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67906 () Bool)

(assert start!67906)

(declare-fun b!790119 () Bool)

(declare-fun res!535280 () Bool)

(declare-fun e!439143 () Bool)

(assert (=> b!790119 (=> (not res!535280) (not e!439143))))

(declare-datatypes ((array!42883 0))(
  ( (array!42884 (arr!20528 (Array (_ BitVec 32) (_ BitVec 64))) (size!20949 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42883)

(declare-datatypes ((List!14530 0))(
  ( (Nil!14527) (Cons!14526 (h!15652 (_ BitVec 64)) (t!20845 List!14530)) )
))
(declare-fun arrayNoDuplicates!0 (array!42883 (_ BitVec 32) List!14530) Bool)

(assert (=> b!790119 (= res!535280 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14527))))

(declare-fun b!790121 () Bool)

(declare-fun e!439149 () Bool)

(assert (=> b!790121 (= e!439149 true)))

(declare-datatypes ((SeekEntryResult!8128 0))(
  ( (MissingZero!8128 (index!34880 (_ BitVec 32))) (Found!8128 (index!34881 (_ BitVec 32))) (Intermediate!8128 (undefined!8940 Bool) (index!34882 (_ BitVec 32)) (x!65813 (_ BitVec 32))) (Undefined!8128) (MissingVacant!8128 (index!34883 (_ BitVec 32))) )
))
(declare-fun lt!352683 () SeekEntryResult!8128)

(declare-fun lt!352685 () SeekEntryResult!8128)

(assert (=> b!790121 (= lt!352683 lt!352685)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-datatypes ((Unit!27400 0))(
  ( (Unit!27401) )
))
(declare-fun lt!352693 () Unit!27400)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27400)

(assert (=> b!790121 (= lt!352693 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790122 () Bool)

(declare-fun e!439145 () Unit!27400)

(declare-fun Unit!27402 () Unit!27400)

(assert (=> b!790122 (= e!439145 Unit!27402)))

(assert (=> b!790122 false))

(declare-fun b!790123 () Bool)

(declare-fun e!439146 () Bool)

(assert (=> b!790123 (= e!439146 e!439149)))

(declare-fun res!535292 () Bool)

(assert (=> b!790123 (=> res!535292 e!439149)))

(assert (=> b!790123 (= res!535292 (or (not (= (select (arr!20528 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352684 () SeekEntryResult!8128)

(declare-fun lt!352696 () SeekEntryResult!8128)

(assert (=> b!790123 (and (= lt!352684 lt!352683) (= lt!352696 lt!352685))))

(declare-fun lt!352697 () array!42883)

(declare-fun lt!352695 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42883 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!790123 (= lt!352683 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352695 lt!352697 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42883 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!790123 (= lt!352684 (seekEntryOrOpen!0 lt!352695 lt!352697 mask!3328))))

(declare-fun lt!352686 () (_ BitVec 64))

(assert (=> b!790123 (= lt!352686 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352691 () Unit!27400)

(assert (=> b!790123 (= lt!352691 e!439145)))

(declare-fun c!87832 () Bool)

(assert (=> b!790123 (= c!87832 (= lt!352686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790124 () Bool)

(declare-fun res!535278 () Bool)

(declare-fun e!439147 () Bool)

(assert (=> b!790124 (=> (not res!535278) (not e!439147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790124 (= res!535278 (validKeyInArray!0 (select (arr!20528 a!3186) j!159)))))

(declare-fun b!790125 () Bool)

(declare-fun res!535275 () Bool)

(assert (=> b!790125 (=> (not res!535275) (not e!439147))))

(assert (=> b!790125 (= res!535275 (and (= (size!20949 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20949 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20949 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790126 () Bool)

(declare-fun res!535287 () Bool)

(declare-fun e!439144 () Bool)

(assert (=> b!790126 (=> (not res!535287) (not e!439144))))

(declare-fun e!439151 () Bool)

(assert (=> b!790126 (= res!535287 e!439151)))

(declare-fun c!87831 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790126 (= c!87831 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790127 () Bool)

(declare-fun e!439148 () Bool)

(declare-fun lt!352687 () SeekEntryResult!8128)

(assert (=> b!790127 (= e!439148 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20528 a!3186) j!159) a!3186 mask!3328) lt!352687))))

(declare-fun b!790128 () Bool)

(declare-fun res!535284 () Bool)

(assert (=> b!790128 (=> (not res!535284) (not e!439147))))

(assert (=> b!790128 (= res!535284 (validKeyInArray!0 k!2102))))

(declare-fun b!790129 () Bool)

(declare-fun Unit!27403 () Unit!27400)

(assert (=> b!790129 (= e!439145 Unit!27403)))

(declare-fun lt!352692 () SeekEntryResult!8128)

(declare-fun b!790130 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42883 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!790130 (= e!439151 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20528 a!3186) j!159) a!3186 mask!3328) lt!352692))))

(declare-fun res!535286 () Bool)

(assert (=> start!67906 (=> (not res!535286) (not e!439147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67906 (= res!535286 (validMask!0 mask!3328))))

(assert (=> start!67906 e!439147))

(assert (=> start!67906 true))

(declare-fun array_inv!16324 (array!42883) Bool)

(assert (=> start!67906 (array_inv!16324 a!3186)))

(declare-fun b!790120 () Bool)

(assert (=> b!790120 (= e!439143 e!439144)))

(declare-fun res!535285 () Bool)

(assert (=> b!790120 (=> (not res!535285) (not e!439144))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790120 (= res!535285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20528 a!3186) j!159) mask!3328) (select (arr!20528 a!3186) j!159) a!3186 mask!3328) lt!352692))))

(assert (=> b!790120 (= lt!352692 (Intermediate!8128 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790131 () Bool)

(assert (=> b!790131 (= e!439151 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20528 a!3186) j!159) a!3186 mask!3328) (Found!8128 j!159)))))

(declare-fun b!790132 () Bool)

(declare-fun e!439154 () Bool)

(assert (=> b!790132 (= e!439154 e!439146)))

(declare-fun res!535282 () Bool)

(assert (=> b!790132 (=> res!535282 e!439146)))

(assert (=> b!790132 (= res!535282 (= lt!352686 lt!352695))))

(assert (=> b!790132 (= lt!352686 (select (store (arr!20528 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!790133 () Bool)

(declare-fun e!439152 () Bool)

(declare-fun e!439150 () Bool)

(assert (=> b!790133 (= e!439152 (not e!439150))))

(declare-fun res!535281 () Bool)

(assert (=> b!790133 (=> res!535281 e!439150)))

(declare-fun lt!352689 () SeekEntryResult!8128)

(assert (=> b!790133 (= res!535281 (or (not (is-Intermediate!8128 lt!352689)) (bvslt x!1131 (x!65813 lt!352689)) (not (= x!1131 (x!65813 lt!352689))) (not (= index!1321 (index!34882 lt!352689)))))))

(assert (=> b!790133 e!439148))

(declare-fun res!535289 () Bool)

(assert (=> b!790133 (=> (not res!535289) (not e!439148))))

(assert (=> b!790133 (= res!535289 (= lt!352696 lt!352687))))

(assert (=> b!790133 (= lt!352687 (Found!8128 j!159))))

(assert (=> b!790133 (= lt!352696 (seekEntryOrOpen!0 (select (arr!20528 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42883 (_ BitVec 32)) Bool)

(assert (=> b!790133 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352694 () Unit!27400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27400)

(assert (=> b!790133 (= lt!352694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790134 () Bool)

(assert (=> b!790134 (= e!439144 e!439152)))

(declare-fun res!535290 () Bool)

(assert (=> b!790134 (=> (not res!535290) (not e!439152))))

(declare-fun lt!352690 () SeekEntryResult!8128)

(assert (=> b!790134 (= res!535290 (= lt!352690 lt!352689))))

(assert (=> b!790134 (= lt!352689 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352695 lt!352697 mask!3328))))

(assert (=> b!790134 (= lt!352690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352695 mask!3328) lt!352695 lt!352697 mask!3328))))

(assert (=> b!790134 (= lt!352695 (select (store (arr!20528 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!790134 (= lt!352697 (array!42884 (store (arr!20528 a!3186) i!1173 k!2102) (size!20949 a!3186)))))

(declare-fun b!790135 () Bool)

(declare-fun res!535288 () Bool)

(assert (=> b!790135 (=> (not res!535288) (not e!439144))))

(assert (=> b!790135 (= res!535288 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20528 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790136 () Bool)

(declare-fun res!535279 () Bool)

(assert (=> b!790136 (=> (not res!535279) (not e!439147))))

(declare-fun arrayContainsKey!0 (array!42883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790136 (= res!535279 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790137 () Bool)

(declare-fun res!535276 () Bool)

(assert (=> b!790137 (=> (not res!535276) (not e!439143))))

(assert (=> b!790137 (= res!535276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790138 () Bool)

(assert (=> b!790138 (= e!439150 e!439154)))

(declare-fun res!535291 () Bool)

(assert (=> b!790138 (=> res!535291 e!439154)))

(assert (=> b!790138 (= res!535291 (not (= lt!352685 lt!352687)))))

(assert (=> b!790138 (= lt!352685 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20528 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790139 () Bool)

(assert (=> b!790139 (= e!439147 e!439143)))

(declare-fun res!535283 () Bool)

(assert (=> b!790139 (=> (not res!535283) (not e!439143))))

(declare-fun lt!352688 () SeekEntryResult!8128)

(assert (=> b!790139 (= res!535283 (or (= lt!352688 (MissingZero!8128 i!1173)) (= lt!352688 (MissingVacant!8128 i!1173))))))

(assert (=> b!790139 (= lt!352688 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!790140 () Bool)

(declare-fun res!535277 () Bool)

(assert (=> b!790140 (=> (not res!535277) (not e!439143))))

(assert (=> b!790140 (= res!535277 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20949 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20949 a!3186))))))

(assert (= (and start!67906 res!535286) b!790125))

(assert (= (and b!790125 res!535275) b!790124))

(assert (= (and b!790124 res!535278) b!790128))

(assert (= (and b!790128 res!535284) b!790136))

(assert (= (and b!790136 res!535279) b!790139))

(assert (= (and b!790139 res!535283) b!790137))

(assert (= (and b!790137 res!535276) b!790119))

(assert (= (and b!790119 res!535280) b!790140))

(assert (= (and b!790140 res!535277) b!790120))

(assert (= (and b!790120 res!535285) b!790135))

(assert (= (and b!790135 res!535288) b!790126))

(assert (= (and b!790126 c!87831) b!790130))

(assert (= (and b!790126 (not c!87831)) b!790131))

(assert (= (and b!790126 res!535287) b!790134))

(assert (= (and b!790134 res!535290) b!790133))

(assert (= (and b!790133 res!535289) b!790127))

(assert (= (and b!790133 (not res!535281)) b!790138))

(assert (= (and b!790138 (not res!535291)) b!790132))

(assert (= (and b!790132 (not res!535282)) b!790123))

(assert (= (and b!790123 c!87832) b!790122))

(assert (= (and b!790123 (not c!87832)) b!790129))

(assert (= (and b!790123 (not res!535292)) b!790121))

(declare-fun m!731085 () Bool)

(assert (=> b!790134 m!731085))

(declare-fun m!731087 () Bool)

(assert (=> b!790134 m!731087))

(declare-fun m!731089 () Bool)

(assert (=> b!790134 m!731089))

(declare-fun m!731091 () Bool)

(assert (=> b!790134 m!731091))

(declare-fun m!731093 () Bool)

(assert (=> b!790134 m!731093))

(assert (=> b!790134 m!731091))

(declare-fun m!731095 () Bool)

(assert (=> b!790136 m!731095))

(declare-fun m!731097 () Bool)

(assert (=> b!790137 m!731097))

(declare-fun m!731099 () Bool)

(assert (=> b!790127 m!731099))

(assert (=> b!790127 m!731099))

(declare-fun m!731101 () Bool)

(assert (=> b!790127 m!731101))

(assert (=> b!790120 m!731099))

(assert (=> b!790120 m!731099))

(declare-fun m!731103 () Bool)

(assert (=> b!790120 m!731103))

(assert (=> b!790120 m!731103))

(assert (=> b!790120 m!731099))

(declare-fun m!731105 () Bool)

(assert (=> b!790120 m!731105))

(assert (=> b!790130 m!731099))

(assert (=> b!790130 m!731099))

(declare-fun m!731107 () Bool)

(assert (=> b!790130 m!731107))

(declare-fun m!731109 () Bool)

(assert (=> b!790139 m!731109))

(declare-fun m!731111 () Bool)

(assert (=> b!790123 m!731111))

(declare-fun m!731113 () Bool)

(assert (=> b!790123 m!731113))

(declare-fun m!731115 () Bool)

(assert (=> b!790123 m!731115))

(declare-fun m!731117 () Bool)

(assert (=> b!790128 m!731117))

(declare-fun m!731119 () Bool)

(assert (=> start!67906 m!731119))

(declare-fun m!731121 () Bool)

(assert (=> start!67906 m!731121))

(declare-fun m!731123 () Bool)

(assert (=> b!790121 m!731123))

(declare-fun m!731125 () Bool)

(assert (=> b!790135 m!731125))

(assert (=> b!790124 m!731099))

(assert (=> b!790124 m!731099))

(declare-fun m!731127 () Bool)

(assert (=> b!790124 m!731127))

(declare-fun m!731129 () Bool)

(assert (=> b!790119 m!731129))

(assert (=> b!790131 m!731099))

(assert (=> b!790131 m!731099))

(declare-fun m!731131 () Bool)

(assert (=> b!790131 m!731131))

(assert (=> b!790132 m!731087))

(declare-fun m!731133 () Bool)

(assert (=> b!790132 m!731133))

(assert (=> b!790138 m!731099))

(assert (=> b!790138 m!731099))

(assert (=> b!790138 m!731131))

(assert (=> b!790133 m!731099))

(assert (=> b!790133 m!731099))

(declare-fun m!731135 () Bool)

(assert (=> b!790133 m!731135))

(declare-fun m!731137 () Bool)

(assert (=> b!790133 m!731137))

(declare-fun m!731139 () Bool)

(assert (=> b!790133 m!731139))

(push 1)

(assert (not start!67906))

(assert (not b!790136))

(assert (not b!790127))

(assert (not b!790134))

(assert (not b!790121))

(assert (not b!790120))

(assert (not b!790133))

(assert (not b!790131))

(assert (not b!790130))

(assert (not b!790123))

(assert (not b!790119))

(assert (not b!790139))

(assert (not b!790128))

(assert (not b!790138))

(assert (not b!790137))

(assert (not b!790124))

(check-sat)

