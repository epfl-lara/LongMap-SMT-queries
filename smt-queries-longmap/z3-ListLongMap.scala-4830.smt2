; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66388 () Bool)

(assert start!66388)

(declare-fun b!765137 () Bool)

(declare-fun res!517663 () Bool)

(declare-fun e!426122 () Bool)

(assert (=> b!765137 (=> (not res!517663) (not e!426122))))

(declare-datatypes ((array!42230 0))(
  ( (array!42231 (arr!20221 (Array (_ BitVec 32) (_ BitVec 64))) (size!20642 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42230)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765137 (= res!517663 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!765138 () Bool)

(declare-fun e!426119 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7821 0))(
  ( (MissingZero!7821 (index!33652 (_ BitVec 32))) (Found!7821 (index!33653 (_ BitVec 32))) (Intermediate!7821 (undefined!8633 Bool) (index!33654 (_ BitVec 32)) (x!64554 (_ BitVec 32))) (Undefined!7821) (MissingVacant!7821 (index!33655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42230 (_ BitVec 32)) SeekEntryResult!7821)

(assert (=> b!765138 (= e!426119 (= (seekEntryOrOpen!0 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) (Found!7821 j!159)))))

(declare-fun b!765139 () Bool)

(declare-fun res!517667 () Bool)

(declare-fun e!426123 () Bool)

(assert (=> b!765139 (=> (not res!517667) (not e!426123))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765139 (= res!517667 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20221 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!340414 () SeekEntryResult!7821)

(declare-fun e!426117 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!765140 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42230 (_ BitVec 32)) SeekEntryResult!7821)

(assert (=> b!765140 (= e!426117 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340414))))

(declare-fun b!765141 () Bool)

(declare-fun res!517659 () Bool)

(declare-fun e!426120 () Bool)

(assert (=> b!765141 (=> (not res!517659) (not e!426120))))

(declare-datatypes ((List!14223 0))(
  ( (Nil!14220) (Cons!14219 (h!15306 (_ BitVec 64)) (t!20538 List!14223)) )
))
(declare-fun arrayNoDuplicates!0 (array!42230 (_ BitVec 32) List!14223) Bool)

(assert (=> b!765141 (= res!517659 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14220))))

(declare-fun b!765142 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42230 (_ BitVec 32)) SeekEntryResult!7821)

(assert (=> b!765142 (= e!426117 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) (Found!7821 j!159)))))

(declare-fun b!765143 () Bool)

(declare-fun res!517670 () Bool)

(assert (=> b!765143 (=> (not res!517670) (not e!426120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42230 (_ BitVec 32)) Bool)

(assert (=> b!765143 (= res!517670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765144 () Bool)

(declare-fun res!517666 () Bool)

(assert (=> b!765144 (=> (not res!517666) (not e!426122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765144 (= res!517666 (validKeyInArray!0 k0!2102))))

(declare-fun b!765146 () Bool)

(declare-fun e!426121 () Bool)

(assert (=> b!765146 (= e!426123 e!426121)))

(declare-fun res!517660 () Bool)

(assert (=> b!765146 (=> (not res!517660) (not e!426121))))

(declare-fun lt!340413 () array!42230)

(declare-fun lt!340412 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765146 (= res!517660 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340412 mask!3328) lt!340412 lt!340413 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340412 lt!340413 mask!3328)))))

(assert (=> b!765146 (= lt!340412 (select (store (arr!20221 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765146 (= lt!340413 (array!42231 (store (arr!20221 a!3186) i!1173 k0!2102) (size!20642 a!3186)))))

(declare-fun b!765147 () Bool)

(assert (=> b!765147 (= e!426120 e!426123)))

(declare-fun res!517661 () Bool)

(assert (=> b!765147 (=> (not res!517661) (not e!426123))))

(assert (=> b!765147 (= res!517661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340414))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765147 (= lt!340414 (Intermediate!7821 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765148 () Bool)

(declare-fun res!517668 () Bool)

(assert (=> b!765148 (=> (not res!517668) (not e!426123))))

(assert (=> b!765148 (= res!517668 e!426117)))

(declare-fun c!84127 () Bool)

(assert (=> b!765148 (= c!84127 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765149 () Bool)

(declare-fun res!517665 () Bool)

(assert (=> b!765149 (=> (not res!517665) (not e!426122))))

(assert (=> b!765149 (= res!517665 (and (= (size!20642 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20642 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20642 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765150 () Bool)

(declare-fun res!517671 () Bool)

(assert (=> b!765150 (=> (not res!517671) (not e!426120))))

(assert (=> b!765150 (= res!517671 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20642 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20642 a!3186))))))

(declare-fun b!765151 () Bool)

(assert (=> b!765151 (= e!426122 e!426120)))

(declare-fun res!517662 () Bool)

(assert (=> b!765151 (=> (not res!517662) (not e!426120))))

(declare-fun lt!340411 () SeekEntryResult!7821)

(assert (=> b!765151 (= res!517662 (or (= lt!340411 (MissingZero!7821 i!1173)) (= lt!340411 (MissingVacant!7821 i!1173))))))

(assert (=> b!765151 (= lt!340411 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765152 () Bool)

(assert (=> b!765152 (= e!426121 (not (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) (Found!7821 j!159))))))

(assert (=> b!765152 e!426119))

(declare-fun res!517672 () Bool)

(assert (=> b!765152 (=> (not res!517672) (not e!426119))))

(assert (=> b!765152 (= res!517672 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26368 0))(
  ( (Unit!26369) )
))
(declare-fun lt!340415 () Unit!26368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26368)

(assert (=> b!765152 (= lt!340415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765145 () Bool)

(declare-fun res!517664 () Bool)

(assert (=> b!765145 (=> (not res!517664) (not e!426122))))

(assert (=> b!765145 (= res!517664 (validKeyInArray!0 (select (arr!20221 a!3186) j!159)))))

(declare-fun res!517669 () Bool)

(assert (=> start!66388 (=> (not res!517669) (not e!426122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66388 (= res!517669 (validMask!0 mask!3328))))

(assert (=> start!66388 e!426122))

(assert (=> start!66388 true))

(declare-fun array_inv!16017 (array!42230) Bool)

(assert (=> start!66388 (array_inv!16017 a!3186)))

(assert (= (and start!66388 res!517669) b!765149))

(assert (= (and b!765149 res!517665) b!765145))

(assert (= (and b!765145 res!517664) b!765144))

(assert (= (and b!765144 res!517666) b!765137))

(assert (= (and b!765137 res!517663) b!765151))

(assert (= (and b!765151 res!517662) b!765143))

(assert (= (and b!765143 res!517670) b!765141))

(assert (= (and b!765141 res!517659) b!765150))

(assert (= (and b!765150 res!517671) b!765147))

(assert (= (and b!765147 res!517661) b!765139))

(assert (= (and b!765139 res!517667) b!765148))

(assert (= (and b!765148 c!84127) b!765140))

(assert (= (and b!765148 (not c!84127)) b!765142))

(assert (= (and b!765148 res!517668) b!765146))

(assert (= (and b!765146 res!517660) b!765152))

(assert (= (and b!765152 res!517672) b!765138))

(declare-fun m!711349 () Bool)

(assert (=> b!765140 m!711349))

(assert (=> b!765140 m!711349))

(declare-fun m!711351 () Bool)

(assert (=> b!765140 m!711351))

(declare-fun m!711353 () Bool)

(assert (=> b!765137 m!711353))

(declare-fun m!711355 () Bool)

(assert (=> start!66388 m!711355))

(declare-fun m!711357 () Bool)

(assert (=> start!66388 m!711357))

(declare-fun m!711359 () Bool)

(assert (=> b!765139 m!711359))

(declare-fun m!711361 () Bool)

(assert (=> b!765151 m!711361))

(declare-fun m!711363 () Bool)

(assert (=> b!765141 m!711363))

(declare-fun m!711365 () Bool)

(assert (=> b!765143 m!711365))

(assert (=> b!765152 m!711349))

(assert (=> b!765152 m!711349))

(declare-fun m!711367 () Bool)

(assert (=> b!765152 m!711367))

(declare-fun m!711369 () Bool)

(assert (=> b!765152 m!711369))

(declare-fun m!711371 () Bool)

(assert (=> b!765152 m!711371))

(declare-fun m!711373 () Bool)

(assert (=> b!765146 m!711373))

(declare-fun m!711375 () Bool)

(assert (=> b!765146 m!711375))

(assert (=> b!765146 m!711373))

(declare-fun m!711377 () Bool)

(assert (=> b!765146 m!711377))

(declare-fun m!711379 () Bool)

(assert (=> b!765146 m!711379))

(declare-fun m!711381 () Bool)

(assert (=> b!765146 m!711381))

(assert (=> b!765145 m!711349))

(assert (=> b!765145 m!711349))

(declare-fun m!711383 () Bool)

(assert (=> b!765145 m!711383))

(assert (=> b!765142 m!711349))

(assert (=> b!765142 m!711349))

(declare-fun m!711385 () Bool)

(assert (=> b!765142 m!711385))

(declare-fun m!711387 () Bool)

(assert (=> b!765144 m!711387))

(assert (=> b!765147 m!711349))

(assert (=> b!765147 m!711349))

(declare-fun m!711389 () Bool)

(assert (=> b!765147 m!711389))

(assert (=> b!765147 m!711389))

(assert (=> b!765147 m!711349))

(declare-fun m!711391 () Bool)

(assert (=> b!765147 m!711391))

(assert (=> b!765138 m!711349))

(assert (=> b!765138 m!711349))

(declare-fun m!711393 () Bool)

(assert (=> b!765138 m!711393))

(check-sat (not start!66388) (not b!765147) (not b!765144) (not b!765138) (not b!765141) (not b!765143) (not b!765145) (not b!765137) (not b!765140) (not b!765146) (not b!765152) (not b!765151) (not b!765142))
(check-sat)
(get-model)

(declare-fun b!765219 () Bool)

(declare-fun e!426157 () SeekEntryResult!7821)

(assert (=> b!765219 (= e!426157 (Intermediate!7821 true (toIndex!0 lt!340412 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101091 () Bool)

(declare-fun e!426156 () Bool)

(assert (=> d!101091 e!426156))

(declare-fun c!84139 () Bool)

(declare-fun lt!340435 () SeekEntryResult!7821)

(get-info :version)

(assert (=> d!101091 (= c!84139 (and ((_ is Intermediate!7821) lt!340435) (undefined!8633 lt!340435)))))

(assert (=> d!101091 (= lt!340435 e!426157)))

(declare-fun c!84137 () Bool)

(assert (=> d!101091 (= c!84137 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!340436 () (_ BitVec 64))

(assert (=> d!101091 (= lt!340436 (select (arr!20221 lt!340413) (toIndex!0 lt!340412 mask!3328)))))

(assert (=> d!101091 (validMask!0 mask!3328)))

(assert (=> d!101091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340412 mask!3328) lt!340412 lt!340413 mask!3328) lt!340435)))

(declare-fun b!765220 () Bool)

(assert (=> b!765220 (and (bvsge (index!33654 lt!340435) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340435) (size!20642 lt!340413)))))

(declare-fun res!517722 () Bool)

(assert (=> b!765220 (= res!517722 (= (select (arr!20221 lt!340413) (index!33654 lt!340435)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426155 () Bool)

(assert (=> b!765220 (=> res!517722 e!426155)))

(declare-fun e!426158 () SeekEntryResult!7821)

(declare-fun b!765221 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765221 (= e!426158 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340412 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340412 lt!340413 mask!3328))))

(declare-fun b!765222 () Bool)

(assert (=> b!765222 (= e!426158 (Intermediate!7821 false (toIndex!0 lt!340412 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!765223 () Bool)

(assert (=> b!765223 (= e!426157 e!426158)))

(declare-fun c!84138 () Bool)

(assert (=> b!765223 (= c!84138 (or (= lt!340436 lt!340412) (= (bvadd lt!340436 lt!340436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765224 () Bool)

(assert (=> b!765224 (and (bvsge (index!33654 lt!340435) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340435) (size!20642 lt!340413)))))

(assert (=> b!765224 (= e!426155 (= (select (arr!20221 lt!340413) (index!33654 lt!340435)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765225 () Bool)

(assert (=> b!765225 (and (bvsge (index!33654 lt!340435) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340435) (size!20642 lt!340413)))))

(declare-fun res!517721 () Bool)

(assert (=> b!765225 (= res!517721 (= (select (arr!20221 lt!340413) (index!33654 lt!340435)) lt!340412))))

(assert (=> b!765225 (=> res!517721 e!426155)))

(declare-fun e!426159 () Bool)

(assert (=> b!765225 (= e!426159 e!426155)))

(declare-fun b!765226 () Bool)

(assert (=> b!765226 (= e!426156 (bvsge (x!64554 lt!340435) #b01111111111111111111111111111110))))

(declare-fun b!765227 () Bool)

(assert (=> b!765227 (= e!426156 e!426159)))

(declare-fun res!517723 () Bool)

(assert (=> b!765227 (= res!517723 (and ((_ is Intermediate!7821) lt!340435) (not (undefined!8633 lt!340435)) (bvslt (x!64554 lt!340435) #b01111111111111111111111111111110) (bvsge (x!64554 lt!340435) #b00000000000000000000000000000000) (bvsge (x!64554 lt!340435) #b00000000000000000000000000000000)))))

(assert (=> b!765227 (=> (not res!517723) (not e!426159))))

(assert (= (and d!101091 c!84137) b!765219))

(assert (= (and d!101091 (not c!84137)) b!765223))

(assert (= (and b!765223 c!84138) b!765222))

(assert (= (and b!765223 (not c!84138)) b!765221))

(assert (= (and d!101091 c!84139) b!765226))

(assert (= (and d!101091 (not c!84139)) b!765227))

(assert (= (and b!765227 res!517723) b!765225))

(assert (= (and b!765225 (not res!517721)) b!765220))

(assert (= (and b!765220 (not res!517722)) b!765224))

(declare-fun m!711441 () Bool)

(assert (=> b!765224 m!711441))

(assert (=> b!765225 m!711441))

(assert (=> b!765221 m!711373))

(declare-fun m!711443 () Bool)

(assert (=> b!765221 m!711443))

(assert (=> b!765221 m!711443))

(declare-fun m!711445 () Bool)

(assert (=> b!765221 m!711445))

(assert (=> d!101091 m!711373))

(declare-fun m!711447 () Bool)

(assert (=> d!101091 m!711447))

(assert (=> d!101091 m!711355))

(assert (=> b!765220 m!711441))

(assert (=> b!765146 d!101091))

(declare-fun d!101093 () Bool)

(declare-fun lt!340442 () (_ BitVec 32))

(declare-fun lt!340441 () (_ BitVec 32))

(assert (=> d!101093 (= lt!340442 (bvmul (bvxor lt!340441 (bvlshr lt!340441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101093 (= lt!340441 ((_ extract 31 0) (bvand (bvxor lt!340412 (bvlshr lt!340412 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101093 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517724 (let ((h!15308 ((_ extract 31 0) (bvand (bvxor lt!340412 (bvlshr lt!340412 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64557 (bvmul (bvxor h!15308 (bvlshr h!15308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64557 (bvlshr x!64557 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517724 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517724 #b00000000000000000000000000000000))))))

(assert (=> d!101093 (= (toIndex!0 lt!340412 mask!3328) (bvand (bvxor lt!340442 (bvlshr lt!340442 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765146 d!101093))

(declare-fun b!765228 () Bool)

(declare-fun e!426162 () SeekEntryResult!7821)

(assert (=> b!765228 (= e!426162 (Intermediate!7821 true index!1321 x!1131))))

(declare-fun d!101095 () Bool)

(declare-fun e!426161 () Bool)

(assert (=> d!101095 e!426161))

(declare-fun c!84142 () Bool)

(declare-fun lt!340443 () SeekEntryResult!7821)

(assert (=> d!101095 (= c!84142 (and ((_ is Intermediate!7821) lt!340443) (undefined!8633 lt!340443)))))

(assert (=> d!101095 (= lt!340443 e!426162)))

(declare-fun c!84140 () Bool)

(assert (=> d!101095 (= c!84140 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340444 () (_ BitVec 64))

(assert (=> d!101095 (= lt!340444 (select (arr!20221 lt!340413) index!1321))))

(assert (=> d!101095 (validMask!0 mask!3328)))

(assert (=> d!101095 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340412 lt!340413 mask!3328) lt!340443)))

(declare-fun b!765229 () Bool)

(assert (=> b!765229 (and (bvsge (index!33654 lt!340443) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340443) (size!20642 lt!340413)))))

(declare-fun res!517726 () Bool)

(assert (=> b!765229 (= res!517726 (= (select (arr!20221 lt!340413) (index!33654 lt!340443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426160 () Bool)

(assert (=> b!765229 (=> res!517726 e!426160)))

(declare-fun b!765230 () Bool)

(declare-fun e!426163 () SeekEntryResult!7821)

(assert (=> b!765230 (= e!426163 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340412 lt!340413 mask!3328))))

(declare-fun b!765231 () Bool)

(assert (=> b!765231 (= e!426163 (Intermediate!7821 false index!1321 x!1131))))

(declare-fun b!765232 () Bool)

(assert (=> b!765232 (= e!426162 e!426163)))

(declare-fun c!84141 () Bool)

(assert (=> b!765232 (= c!84141 (or (= lt!340444 lt!340412) (= (bvadd lt!340444 lt!340444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765233 () Bool)

(assert (=> b!765233 (and (bvsge (index!33654 lt!340443) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340443) (size!20642 lt!340413)))))

(assert (=> b!765233 (= e!426160 (= (select (arr!20221 lt!340413) (index!33654 lt!340443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765234 () Bool)

(assert (=> b!765234 (and (bvsge (index!33654 lt!340443) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340443) (size!20642 lt!340413)))))

(declare-fun res!517725 () Bool)

(assert (=> b!765234 (= res!517725 (= (select (arr!20221 lt!340413) (index!33654 lt!340443)) lt!340412))))

(assert (=> b!765234 (=> res!517725 e!426160)))

(declare-fun e!426164 () Bool)

(assert (=> b!765234 (= e!426164 e!426160)))

(declare-fun b!765235 () Bool)

(assert (=> b!765235 (= e!426161 (bvsge (x!64554 lt!340443) #b01111111111111111111111111111110))))

(declare-fun b!765236 () Bool)

(assert (=> b!765236 (= e!426161 e!426164)))

(declare-fun res!517727 () Bool)

(assert (=> b!765236 (= res!517727 (and ((_ is Intermediate!7821) lt!340443) (not (undefined!8633 lt!340443)) (bvslt (x!64554 lt!340443) #b01111111111111111111111111111110) (bvsge (x!64554 lt!340443) #b00000000000000000000000000000000) (bvsge (x!64554 lt!340443) x!1131)))))

(assert (=> b!765236 (=> (not res!517727) (not e!426164))))

(assert (= (and d!101095 c!84140) b!765228))

(assert (= (and d!101095 (not c!84140)) b!765232))

(assert (= (and b!765232 c!84141) b!765231))

(assert (= (and b!765232 (not c!84141)) b!765230))

(assert (= (and d!101095 c!84142) b!765235))

(assert (= (and d!101095 (not c!84142)) b!765236))

(assert (= (and b!765236 res!517727) b!765234))

(assert (= (and b!765234 (not res!517725)) b!765229))

(assert (= (and b!765229 (not res!517726)) b!765233))

(declare-fun m!711449 () Bool)

(assert (=> b!765233 m!711449))

(assert (=> b!765234 m!711449))

(declare-fun m!711451 () Bool)

(assert (=> b!765230 m!711451))

(assert (=> b!765230 m!711451))

(declare-fun m!711453 () Bool)

(assert (=> b!765230 m!711453))

(declare-fun m!711455 () Bool)

(assert (=> d!101095 m!711455))

(assert (=> d!101095 m!711355))

(assert (=> b!765229 m!711449))

(assert (=> b!765146 d!101095))

(declare-fun e!426167 () SeekEntryResult!7821)

(declare-fun b!765237 () Bool)

(assert (=> b!765237 (= e!426167 (Intermediate!7821 true (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101097 () Bool)

(declare-fun e!426166 () Bool)

(assert (=> d!101097 e!426166))

(declare-fun c!84145 () Bool)

(declare-fun lt!340445 () SeekEntryResult!7821)

(assert (=> d!101097 (= c!84145 (and ((_ is Intermediate!7821) lt!340445) (undefined!8633 lt!340445)))))

(assert (=> d!101097 (= lt!340445 e!426167)))

(declare-fun c!84143 () Bool)

(assert (=> d!101097 (= c!84143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!340446 () (_ BitVec 64))

(assert (=> d!101097 (= lt!340446 (select (arr!20221 a!3186) (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328)))))

(assert (=> d!101097 (validMask!0 mask!3328)))

(assert (=> d!101097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340445)))

(declare-fun b!765238 () Bool)

(assert (=> b!765238 (and (bvsge (index!33654 lt!340445) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340445) (size!20642 a!3186)))))

(declare-fun res!517729 () Bool)

(assert (=> b!765238 (= res!517729 (= (select (arr!20221 a!3186) (index!33654 lt!340445)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426165 () Bool)

(assert (=> b!765238 (=> res!517729 e!426165)))

(declare-fun b!765239 () Bool)

(declare-fun e!426168 () SeekEntryResult!7821)

(assert (=> b!765239 (= e!426168 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20221 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765240 () Bool)

(assert (=> b!765240 (= e!426168 (Intermediate!7821 false (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!765241 () Bool)

(assert (=> b!765241 (= e!426167 e!426168)))

(declare-fun c!84144 () Bool)

(assert (=> b!765241 (= c!84144 (or (= lt!340446 (select (arr!20221 a!3186) j!159)) (= (bvadd lt!340446 lt!340446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765242 () Bool)

(assert (=> b!765242 (and (bvsge (index!33654 lt!340445) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340445) (size!20642 a!3186)))))

(assert (=> b!765242 (= e!426165 (= (select (arr!20221 a!3186) (index!33654 lt!340445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765243 () Bool)

(assert (=> b!765243 (and (bvsge (index!33654 lt!340445) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340445) (size!20642 a!3186)))))

(declare-fun res!517728 () Bool)

(assert (=> b!765243 (= res!517728 (= (select (arr!20221 a!3186) (index!33654 lt!340445)) (select (arr!20221 a!3186) j!159)))))

(assert (=> b!765243 (=> res!517728 e!426165)))

(declare-fun e!426169 () Bool)

(assert (=> b!765243 (= e!426169 e!426165)))

(declare-fun b!765244 () Bool)

(assert (=> b!765244 (= e!426166 (bvsge (x!64554 lt!340445) #b01111111111111111111111111111110))))

(declare-fun b!765245 () Bool)

(assert (=> b!765245 (= e!426166 e!426169)))

(declare-fun res!517730 () Bool)

(assert (=> b!765245 (= res!517730 (and ((_ is Intermediate!7821) lt!340445) (not (undefined!8633 lt!340445)) (bvslt (x!64554 lt!340445) #b01111111111111111111111111111110) (bvsge (x!64554 lt!340445) #b00000000000000000000000000000000) (bvsge (x!64554 lt!340445) #b00000000000000000000000000000000)))))

(assert (=> b!765245 (=> (not res!517730) (not e!426169))))

(assert (= (and d!101097 c!84143) b!765237))

(assert (= (and d!101097 (not c!84143)) b!765241))

(assert (= (and b!765241 c!84144) b!765240))

(assert (= (and b!765241 (not c!84144)) b!765239))

(assert (= (and d!101097 c!84145) b!765244))

(assert (= (and d!101097 (not c!84145)) b!765245))

(assert (= (and b!765245 res!517730) b!765243))

(assert (= (and b!765243 (not res!517728)) b!765238))

(assert (= (and b!765238 (not res!517729)) b!765242))

(declare-fun m!711457 () Bool)

(assert (=> b!765242 m!711457))

(assert (=> b!765243 m!711457))

(assert (=> b!765239 m!711389))

(declare-fun m!711459 () Bool)

(assert (=> b!765239 m!711459))

(assert (=> b!765239 m!711459))

(assert (=> b!765239 m!711349))

(declare-fun m!711461 () Bool)

(assert (=> b!765239 m!711461))

(assert (=> d!101097 m!711389))

(declare-fun m!711463 () Bool)

(assert (=> d!101097 m!711463))

(assert (=> d!101097 m!711355))

(assert (=> b!765238 m!711457))

(assert (=> b!765147 d!101097))

(declare-fun d!101099 () Bool)

(declare-fun lt!340448 () (_ BitVec 32))

(declare-fun lt!340447 () (_ BitVec 32))

(assert (=> d!101099 (= lt!340448 (bvmul (bvxor lt!340447 (bvlshr lt!340447 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101099 (= lt!340447 ((_ extract 31 0) (bvand (bvxor (select (arr!20221 a!3186) j!159) (bvlshr (select (arr!20221 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101099 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517724 (let ((h!15308 ((_ extract 31 0) (bvand (bvxor (select (arr!20221 a!3186) j!159) (bvlshr (select (arr!20221 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64557 (bvmul (bvxor h!15308 (bvlshr h!15308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64557 (bvlshr x!64557 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517724 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517724 #b00000000000000000000000000000000))))))

(assert (=> d!101099 (= (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) (bvand (bvxor lt!340448 (bvlshr lt!340448 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765147 d!101099))

(declare-fun d!101101 () Bool)

(declare-fun res!517735 () Bool)

(declare-fun e!426174 () Bool)

(assert (=> d!101101 (=> res!517735 e!426174)))

(assert (=> d!101101 (= res!517735 (= (select (arr!20221 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101101 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!426174)))

(declare-fun b!765250 () Bool)

(declare-fun e!426175 () Bool)

(assert (=> b!765250 (= e!426174 e!426175)))

(declare-fun res!517736 () Bool)

(assert (=> b!765250 (=> (not res!517736) (not e!426175))))

(assert (=> b!765250 (= res!517736 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20642 a!3186)))))

(declare-fun b!765251 () Bool)

(assert (=> b!765251 (= e!426175 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101101 (not res!517735)) b!765250))

(assert (= (and b!765250 res!517736) b!765251))

(declare-fun m!711465 () Bool)

(assert (=> d!101101 m!711465))

(declare-fun m!711467 () Bool)

(assert (=> b!765251 m!711467))

(assert (=> b!765137 d!101101))

(declare-fun b!765270 () Bool)

(declare-fun e!426189 () SeekEntryResult!7821)

(assert (=> b!765270 (= e!426189 Undefined!7821)))

(declare-fun b!765271 () Bool)

(declare-fun e!426188 () SeekEntryResult!7821)

(declare-fun lt!340455 () SeekEntryResult!7821)

(assert (=> b!765271 (= e!426188 (MissingZero!7821 (index!33654 lt!340455)))))

(declare-fun b!765272 () Bool)

(assert (=> b!765272 (= e!426188 (seekKeyOrZeroReturnVacant!0 (x!64554 lt!340455) (index!33654 lt!340455) (index!33654 lt!340455) (select (arr!20221 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765273 () Bool)

(declare-fun c!84152 () Bool)

(declare-fun lt!340456 () (_ BitVec 64))

(assert (=> b!765273 (= c!84152 (= lt!340456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426190 () SeekEntryResult!7821)

(assert (=> b!765273 (= e!426190 e!426188)))

(declare-fun b!765274 () Bool)

(assert (=> b!765274 (= e!426189 e!426190)))

(assert (=> b!765274 (= lt!340456 (select (arr!20221 a!3186) (index!33654 lt!340455)))))

(declare-fun c!84154 () Bool)

(assert (=> b!765274 (= c!84154 (= lt!340456 (select (arr!20221 a!3186) j!159)))))

(declare-fun b!765275 () Bool)

(assert (=> b!765275 (= e!426190 (Found!7821 (index!33654 lt!340455)))))

(declare-fun d!101103 () Bool)

(declare-fun lt!340457 () SeekEntryResult!7821)

(assert (=> d!101103 (and (or ((_ is Undefined!7821) lt!340457) (not ((_ is Found!7821) lt!340457)) (and (bvsge (index!33653 lt!340457) #b00000000000000000000000000000000) (bvslt (index!33653 lt!340457) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340457) ((_ is Found!7821) lt!340457) (not ((_ is MissingZero!7821) lt!340457)) (and (bvsge (index!33652 lt!340457) #b00000000000000000000000000000000) (bvslt (index!33652 lt!340457) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340457) ((_ is Found!7821) lt!340457) ((_ is MissingZero!7821) lt!340457) (not ((_ is MissingVacant!7821) lt!340457)) (and (bvsge (index!33655 lt!340457) #b00000000000000000000000000000000) (bvslt (index!33655 lt!340457) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340457) (ite ((_ is Found!7821) lt!340457) (= (select (arr!20221 a!3186) (index!33653 lt!340457)) (select (arr!20221 a!3186) j!159)) (ite ((_ is MissingZero!7821) lt!340457) (= (select (arr!20221 a!3186) (index!33652 lt!340457)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7821) lt!340457) (= (select (arr!20221 a!3186) (index!33655 lt!340457)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101103 (= lt!340457 e!426189)))

(declare-fun c!84153 () Bool)

(assert (=> d!101103 (= c!84153 (and ((_ is Intermediate!7821) lt!340455) (undefined!8633 lt!340455)))))

(assert (=> d!101103 (= lt!340455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) (select (arr!20221 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101103 (validMask!0 mask!3328)))

(assert (=> d!101103 (= (seekEntryOrOpen!0 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340457)))

(assert (= (and d!101103 c!84153) b!765270))

(assert (= (and d!101103 (not c!84153)) b!765274))

(assert (= (and b!765274 c!84154) b!765275))

(assert (= (and b!765274 (not c!84154)) b!765273))

(assert (= (and b!765273 c!84152) b!765271))

(assert (= (and b!765273 (not c!84152)) b!765272))

(assert (=> b!765272 m!711349))

(declare-fun m!711473 () Bool)

(assert (=> b!765272 m!711473))

(declare-fun m!711475 () Bool)

(assert (=> b!765274 m!711475))

(declare-fun m!711477 () Bool)

(assert (=> d!101103 m!711477))

(declare-fun m!711479 () Bool)

(assert (=> d!101103 m!711479))

(assert (=> d!101103 m!711349))

(assert (=> d!101103 m!711389))

(assert (=> d!101103 m!711355))

(assert (=> d!101103 m!711389))

(assert (=> d!101103 m!711349))

(assert (=> d!101103 m!711391))

(declare-fun m!711481 () Bool)

(assert (=> d!101103 m!711481))

(assert (=> b!765138 d!101103))

(declare-fun d!101111 () Bool)

(assert (=> d!101111 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66388 d!101111))

(declare-fun d!101119 () Bool)

(assert (=> d!101119 (= (array_inv!16017 a!3186) (bvsge (size!20642 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66388 d!101119))

(declare-fun b!765312 () Bool)

(declare-fun e!426211 () SeekEntryResult!7821)

(assert (=> b!765312 (= e!426211 (Intermediate!7821 true index!1321 x!1131))))

(declare-fun d!101121 () Bool)

(declare-fun e!426210 () Bool)

(assert (=> d!101121 e!426210))

(declare-fun c!84175 () Bool)

(declare-fun lt!340473 () SeekEntryResult!7821)

(assert (=> d!101121 (= c!84175 (and ((_ is Intermediate!7821) lt!340473) (undefined!8633 lt!340473)))))

(assert (=> d!101121 (= lt!340473 e!426211)))

(declare-fun c!84173 () Bool)

(assert (=> d!101121 (= c!84173 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340474 () (_ BitVec 64))

(assert (=> d!101121 (= lt!340474 (select (arr!20221 a!3186) index!1321))))

(assert (=> d!101121 (validMask!0 mask!3328)))

(assert (=> d!101121 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340473)))

(declare-fun b!765313 () Bool)

(assert (=> b!765313 (and (bvsge (index!33654 lt!340473) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340473) (size!20642 a!3186)))))

(declare-fun res!517744 () Bool)

(assert (=> b!765313 (= res!517744 (= (select (arr!20221 a!3186) (index!33654 lt!340473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426209 () Bool)

(assert (=> b!765313 (=> res!517744 e!426209)))

(declare-fun e!426212 () SeekEntryResult!7821)

(declare-fun b!765314 () Bool)

(assert (=> b!765314 (= e!426212 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20221 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765315 () Bool)

(assert (=> b!765315 (= e!426212 (Intermediate!7821 false index!1321 x!1131))))

(declare-fun b!765316 () Bool)

(assert (=> b!765316 (= e!426211 e!426212)))

(declare-fun c!84174 () Bool)

(assert (=> b!765316 (= c!84174 (or (= lt!340474 (select (arr!20221 a!3186) j!159)) (= (bvadd lt!340474 lt!340474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765317 () Bool)

(assert (=> b!765317 (and (bvsge (index!33654 lt!340473) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340473) (size!20642 a!3186)))))

(assert (=> b!765317 (= e!426209 (= (select (arr!20221 a!3186) (index!33654 lt!340473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765318 () Bool)

(assert (=> b!765318 (and (bvsge (index!33654 lt!340473) #b00000000000000000000000000000000) (bvslt (index!33654 lt!340473) (size!20642 a!3186)))))

(declare-fun res!517743 () Bool)

(assert (=> b!765318 (= res!517743 (= (select (arr!20221 a!3186) (index!33654 lt!340473)) (select (arr!20221 a!3186) j!159)))))

(assert (=> b!765318 (=> res!517743 e!426209)))

(declare-fun e!426213 () Bool)

(assert (=> b!765318 (= e!426213 e!426209)))

(declare-fun b!765319 () Bool)

(assert (=> b!765319 (= e!426210 (bvsge (x!64554 lt!340473) #b01111111111111111111111111111110))))

(declare-fun b!765320 () Bool)

(assert (=> b!765320 (= e!426210 e!426213)))

(declare-fun res!517745 () Bool)

(assert (=> b!765320 (= res!517745 (and ((_ is Intermediate!7821) lt!340473) (not (undefined!8633 lt!340473)) (bvslt (x!64554 lt!340473) #b01111111111111111111111111111110) (bvsge (x!64554 lt!340473) #b00000000000000000000000000000000) (bvsge (x!64554 lt!340473) x!1131)))))

(assert (=> b!765320 (=> (not res!517745) (not e!426213))))

(assert (= (and d!101121 c!84173) b!765312))

(assert (= (and d!101121 (not c!84173)) b!765316))

(assert (= (and b!765316 c!84174) b!765315))

(assert (= (and b!765316 (not c!84174)) b!765314))

(assert (= (and d!101121 c!84175) b!765319))

(assert (= (and d!101121 (not c!84175)) b!765320))

(assert (= (and b!765320 res!517745) b!765318))

(assert (= (and b!765318 (not res!517743)) b!765313))

(assert (= (and b!765313 (not res!517744)) b!765317))

(declare-fun m!711503 () Bool)

(assert (=> b!765317 m!711503))

(assert (=> b!765318 m!711503))

(assert (=> b!765314 m!711451))

(assert (=> b!765314 m!711451))

(assert (=> b!765314 m!711349))

(declare-fun m!711505 () Bool)

(assert (=> b!765314 m!711505))

(declare-fun m!711507 () Bool)

(assert (=> d!101121 m!711507))

(assert (=> d!101121 m!711355))

(assert (=> b!765313 m!711503))

(assert (=> b!765140 d!101121))

(declare-fun b!765321 () Bool)

(declare-fun e!426215 () SeekEntryResult!7821)

(assert (=> b!765321 (= e!426215 Undefined!7821)))

(declare-fun b!765322 () Bool)

(declare-fun e!426214 () SeekEntryResult!7821)

(declare-fun lt!340475 () SeekEntryResult!7821)

(assert (=> b!765322 (= e!426214 (MissingZero!7821 (index!33654 lt!340475)))))

(declare-fun b!765323 () Bool)

(assert (=> b!765323 (= e!426214 (seekKeyOrZeroReturnVacant!0 (x!64554 lt!340475) (index!33654 lt!340475) (index!33654 lt!340475) k0!2102 a!3186 mask!3328))))

(declare-fun b!765324 () Bool)

(declare-fun c!84176 () Bool)

(declare-fun lt!340476 () (_ BitVec 64))

(assert (=> b!765324 (= c!84176 (= lt!340476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426216 () SeekEntryResult!7821)

(assert (=> b!765324 (= e!426216 e!426214)))

(declare-fun b!765325 () Bool)

(assert (=> b!765325 (= e!426215 e!426216)))

(assert (=> b!765325 (= lt!340476 (select (arr!20221 a!3186) (index!33654 lt!340475)))))

(declare-fun c!84178 () Bool)

(assert (=> b!765325 (= c!84178 (= lt!340476 k0!2102))))

(declare-fun b!765326 () Bool)

(assert (=> b!765326 (= e!426216 (Found!7821 (index!33654 lt!340475)))))

(declare-fun d!101123 () Bool)

(declare-fun lt!340477 () SeekEntryResult!7821)

(assert (=> d!101123 (and (or ((_ is Undefined!7821) lt!340477) (not ((_ is Found!7821) lt!340477)) (and (bvsge (index!33653 lt!340477) #b00000000000000000000000000000000) (bvslt (index!33653 lt!340477) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340477) ((_ is Found!7821) lt!340477) (not ((_ is MissingZero!7821) lt!340477)) (and (bvsge (index!33652 lt!340477) #b00000000000000000000000000000000) (bvslt (index!33652 lt!340477) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340477) ((_ is Found!7821) lt!340477) ((_ is MissingZero!7821) lt!340477) (not ((_ is MissingVacant!7821) lt!340477)) (and (bvsge (index!33655 lt!340477) #b00000000000000000000000000000000) (bvslt (index!33655 lt!340477) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340477) (ite ((_ is Found!7821) lt!340477) (= (select (arr!20221 a!3186) (index!33653 lt!340477)) k0!2102) (ite ((_ is MissingZero!7821) lt!340477) (= (select (arr!20221 a!3186) (index!33652 lt!340477)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7821) lt!340477) (= (select (arr!20221 a!3186) (index!33655 lt!340477)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101123 (= lt!340477 e!426215)))

(declare-fun c!84177 () Bool)

(assert (=> d!101123 (= c!84177 (and ((_ is Intermediate!7821) lt!340475) (undefined!8633 lt!340475)))))

(assert (=> d!101123 (= lt!340475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101123 (validMask!0 mask!3328)))

(assert (=> d!101123 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!340477)))

(assert (= (and d!101123 c!84177) b!765321))

(assert (= (and d!101123 (not c!84177)) b!765325))

(assert (= (and b!765325 c!84178) b!765326))

(assert (= (and b!765325 (not c!84178)) b!765324))

(assert (= (and b!765324 c!84176) b!765322))

(assert (= (and b!765324 (not c!84176)) b!765323))

(declare-fun m!711509 () Bool)

(assert (=> b!765323 m!711509))

(declare-fun m!711511 () Bool)

(assert (=> b!765325 m!711511))

(declare-fun m!711513 () Bool)

(assert (=> d!101123 m!711513))

(declare-fun m!711515 () Bool)

(assert (=> d!101123 m!711515))

(declare-fun m!711517 () Bool)

(assert (=> d!101123 m!711517))

(assert (=> d!101123 m!711355))

(assert (=> d!101123 m!711517))

(declare-fun m!711519 () Bool)

(assert (=> d!101123 m!711519))

(declare-fun m!711521 () Bool)

(assert (=> d!101123 m!711521))

(assert (=> b!765151 d!101123))

(declare-fun b!765349 () Bool)

(declare-fun e!426232 () Bool)

(declare-fun call!35025 () Bool)

(assert (=> b!765349 (= e!426232 call!35025)))

(declare-fun b!765350 () Bool)

(declare-fun e!426231 () Bool)

(declare-fun e!426233 () Bool)

(assert (=> b!765350 (= e!426231 e!426233)))

(declare-fun res!517754 () Bool)

(assert (=> b!765350 (=> (not res!517754) (not e!426233))))

(declare-fun e!426234 () Bool)

(assert (=> b!765350 (= res!517754 (not e!426234))))

(declare-fun res!517752 () Bool)

(assert (=> b!765350 (=> (not res!517752) (not e!426234))))

(assert (=> b!765350 (= res!517752 (validKeyInArray!0 (select (arr!20221 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101125 () Bool)

(declare-fun res!517753 () Bool)

(assert (=> d!101125 (=> res!517753 e!426231)))

(assert (=> d!101125 (= res!517753 (bvsge #b00000000000000000000000000000000 (size!20642 a!3186)))))

(assert (=> d!101125 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14220) e!426231)))

(declare-fun b!765351 () Bool)

(assert (=> b!765351 (= e!426233 e!426232)))

(declare-fun c!84187 () Bool)

(assert (=> b!765351 (= c!84187 (validKeyInArray!0 (select (arr!20221 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35022 () Bool)

(assert (=> bm!35022 (= call!35025 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84187 (Cons!14219 (select (arr!20221 a!3186) #b00000000000000000000000000000000) Nil!14220) Nil!14220)))))

(declare-fun b!765352 () Bool)

(assert (=> b!765352 (= e!426232 call!35025)))

(declare-fun b!765353 () Bool)

(declare-fun contains!4077 (List!14223 (_ BitVec 64)) Bool)

(assert (=> b!765353 (= e!426234 (contains!4077 Nil!14220 (select (arr!20221 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101125 (not res!517753)) b!765350))

(assert (= (and b!765350 res!517752) b!765353))

(assert (= (and b!765350 res!517754) b!765351))

(assert (= (and b!765351 c!84187) b!765352))

(assert (= (and b!765351 (not c!84187)) b!765349))

(assert (= (or b!765352 b!765349) bm!35022))

(assert (=> b!765350 m!711465))

(assert (=> b!765350 m!711465))

(declare-fun m!711523 () Bool)

(assert (=> b!765350 m!711523))

(assert (=> b!765351 m!711465))

(assert (=> b!765351 m!711465))

(assert (=> b!765351 m!711523))

(assert (=> bm!35022 m!711465))

(declare-fun m!711525 () Bool)

(assert (=> bm!35022 m!711525))

(assert (=> b!765353 m!711465))

(assert (=> b!765353 m!711465))

(declare-fun m!711527 () Bool)

(assert (=> b!765353 m!711527))

(assert (=> b!765141 d!101125))

(declare-fun b!765416 () Bool)

(declare-fun c!84216 () Bool)

(declare-fun lt!340514 () (_ BitVec 64))

(assert (=> b!765416 (= c!84216 (= lt!340514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426273 () SeekEntryResult!7821)

(declare-fun e!426271 () SeekEntryResult!7821)

(assert (=> b!765416 (= e!426273 e!426271)))

(declare-fun b!765417 () Bool)

(assert (=> b!765417 (= e!426271 (MissingVacant!7821 resIntermediateIndex!5))))

(declare-fun b!765418 () Bool)

(assert (=> b!765418 (= e!426271 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765419 () Bool)

(assert (=> b!765419 (= e!426273 (Found!7821 resIntermediateIndex!5))))

(declare-fun d!101127 () Bool)

(declare-fun lt!340515 () SeekEntryResult!7821)

(assert (=> d!101127 (and (or ((_ is Undefined!7821) lt!340515) (not ((_ is Found!7821) lt!340515)) (and (bvsge (index!33653 lt!340515) #b00000000000000000000000000000000) (bvslt (index!33653 lt!340515) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340515) ((_ is Found!7821) lt!340515) (not ((_ is MissingVacant!7821) lt!340515)) (not (= (index!33655 lt!340515) resIntermediateIndex!5)) (and (bvsge (index!33655 lt!340515) #b00000000000000000000000000000000) (bvslt (index!33655 lt!340515) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340515) (ite ((_ is Found!7821) lt!340515) (= (select (arr!20221 a!3186) (index!33653 lt!340515)) (select (arr!20221 a!3186) j!159)) (and ((_ is MissingVacant!7821) lt!340515) (= (index!33655 lt!340515) resIntermediateIndex!5) (= (select (arr!20221 a!3186) (index!33655 lt!340515)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!426272 () SeekEntryResult!7821)

(assert (=> d!101127 (= lt!340515 e!426272)))

(declare-fun c!84215 () Bool)

(assert (=> d!101127 (= c!84215 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101127 (= lt!340514 (select (arr!20221 a!3186) resIntermediateIndex!5))))

(assert (=> d!101127 (validMask!0 mask!3328)))

(assert (=> d!101127 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340515)))

(declare-fun b!765420 () Bool)

(assert (=> b!765420 (= e!426272 Undefined!7821)))

(declare-fun b!765421 () Bool)

(assert (=> b!765421 (= e!426272 e!426273)))

(declare-fun c!84214 () Bool)

(assert (=> b!765421 (= c!84214 (= lt!340514 (select (arr!20221 a!3186) j!159)))))

(assert (= (and d!101127 c!84215) b!765420))

(assert (= (and d!101127 (not c!84215)) b!765421))

(assert (= (and b!765421 c!84214) b!765419))

(assert (= (and b!765421 (not c!84214)) b!765416))

(assert (= (and b!765416 c!84216) b!765417))

(assert (= (and b!765416 (not c!84216)) b!765418))

(declare-fun m!711565 () Bool)

(assert (=> b!765418 m!711565))

(assert (=> b!765418 m!711565))

(assert (=> b!765418 m!711349))

(declare-fun m!711567 () Bool)

(assert (=> b!765418 m!711567))

(declare-fun m!711569 () Bool)

(assert (=> d!101127 m!711569))

(declare-fun m!711571 () Bool)

(assert (=> d!101127 m!711571))

(assert (=> d!101127 m!711359))

(assert (=> d!101127 m!711355))

(assert (=> b!765152 d!101127))

(declare-fun b!765434 () Bool)

(declare-fun e!426284 () Bool)

(declare-fun e!426285 () Bool)

(assert (=> b!765434 (= e!426284 e!426285)))

(declare-fun lt!340531 () (_ BitVec 64))

(assert (=> b!765434 (= lt!340531 (select (arr!20221 a!3186) j!159))))

(declare-fun lt!340532 () Unit!26368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42230 (_ BitVec 64) (_ BitVec 32)) Unit!26368)

(assert (=> b!765434 (= lt!340532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340531 j!159))))

(assert (=> b!765434 (arrayContainsKey!0 a!3186 lt!340531 #b00000000000000000000000000000000)))

(declare-fun lt!340533 () Unit!26368)

(assert (=> b!765434 (= lt!340533 lt!340532)))

(declare-fun res!517771 () Bool)

(assert (=> b!765434 (= res!517771 (= (seekEntryOrOpen!0 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) (Found!7821 j!159)))))

(assert (=> b!765434 (=> (not res!517771) (not e!426285))))

(declare-fun b!765435 () Bool)

(declare-fun e!426283 () Bool)

(assert (=> b!765435 (= e!426283 e!426284)))

(declare-fun c!84220 () Bool)

(assert (=> b!765435 (= c!84220 (validKeyInArray!0 (select (arr!20221 a!3186) j!159)))))

(declare-fun call!35034 () Bool)

(declare-fun bm!35031 () Bool)

(assert (=> bm!35031 (= call!35034 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101137 () Bool)

(declare-fun res!517772 () Bool)

(assert (=> d!101137 (=> res!517772 e!426283)))

(assert (=> d!101137 (= res!517772 (bvsge j!159 (size!20642 a!3186)))))

(assert (=> d!101137 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!426283)))

(declare-fun b!765436 () Bool)

(assert (=> b!765436 (= e!426285 call!35034)))

(declare-fun b!765437 () Bool)

(assert (=> b!765437 (= e!426284 call!35034)))

(assert (= (and d!101137 (not res!517772)) b!765435))

(assert (= (and b!765435 c!84220) b!765434))

(assert (= (and b!765435 (not c!84220)) b!765437))

(assert (= (and b!765434 res!517771) b!765436))

(assert (= (or b!765436 b!765437) bm!35031))

(assert (=> b!765434 m!711349))

(declare-fun m!711583 () Bool)

(assert (=> b!765434 m!711583))

(declare-fun m!711585 () Bool)

(assert (=> b!765434 m!711585))

(assert (=> b!765434 m!711349))

(assert (=> b!765434 m!711393))

(assert (=> b!765435 m!711349))

(assert (=> b!765435 m!711349))

(assert (=> b!765435 m!711383))

(declare-fun m!711587 () Bool)

(assert (=> bm!35031 m!711587))

(assert (=> b!765152 d!101137))

(declare-fun d!101147 () Bool)

(assert (=> d!101147 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340536 () Unit!26368)

(declare-fun choose!38 (array!42230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26368)

(assert (=> d!101147 (= lt!340536 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101147 (validMask!0 mask!3328)))

(assert (=> d!101147 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340536)))

(declare-fun bs!21488 () Bool)

(assert (= bs!21488 d!101147))

(assert (=> bs!21488 m!711369))

(declare-fun m!711589 () Bool)

(assert (=> bs!21488 m!711589))

(assert (=> bs!21488 m!711355))

(assert (=> b!765152 d!101147))

(declare-fun b!765448 () Bool)

(declare-fun c!84225 () Bool)

(declare-fun lt!340537 () (_ BitVec 64))

(assert (=> b!765448 (= c!84225 (= lt!340537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426296 () SeekEntryResult!7821)

(declare-fun e!426294 () SeekEntryResult!7821)

(assert (=> b!765448 (= e!426296 e!426294)))

(declare-fun b!765449 () Bool)

(assert (=> b!765449 (= e!426294 (MissingVacant!7821 resIntermediateIndex!5))))

(declare-fun b!765450 () Bool)

(assert (=> b!765450 (= e!426294 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765451 () Bool)

(assert (=> b!765451 (= e!426296 (Found!7821 index!1321))))

(declare-fun lt!340538 () SeekEntryResult!7821)

(declare-fun d!101149 () Bool)

(assert (=> d!101149 (and (or ((_ is Undefined!7821) lt!340538) (not ((_ is Found!7821) lt!340538)) (and (bvsge (index!33653 lt!340538) #b00000000000000000000000000000000) (bvslt (index!33653 lt!340538) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340538) ((_ is Found!7821) lt!340538) (not ((_ is MissingVacant!7821) lt!340538)) (not (= (index!33655 lt!340538) resIntermediateIndex!5)) (and (bvsge (index!33655 lt!340538) #b00000000000000000000000000000000) (bvslt (index!33655 lt!340538) (size!20642 a!3186)))) (or ((_ is Undefined!7821) lt!340538) (ite ((_ is Found!7821) lt!340538) (= (select (arr!20221 a!3186) (index!33653 lt!340538)) (select (arr!20221 a!3186) j!159)) (and ((_ is MissingVacant!7821) lt!340538) (= (index!33655 lt!340538) resIntermediateIndex!5) (= (select (arr!20221 a!3186) (index!33655 lt!340538)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!426295 () SeekEntryResult!7821)

(assert (=> d!101149 (= lt!340538 e!426295)))

(declare-fun c!84224 () Bool)

(assert (=> d!101149 (= c!84224 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101149 (= lt!340537 (select (arr!20221 a!3186) index!1321))))

(assert (=> d!101149 (validMask!0 mask!3328)))

(assert (=> d!101149 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340538)))

(declare-fun b!765452 () Bool)

(assert (=> b!765452 (= e!426295 Undefined!7821)))

(declare-fun b!765453 () Bool)

(assert (=> b!765453 (= e!426295 e!426296)))

(declare-fun c!84223 () Bool)

(assert (=> b!765453 (= c!84223 (= lt!340537 (select (arr!20221 a!3186) j!159)))))

(assert (= (and d!101149 c!84224) b!765452))

(assert (= (and d!101149 (not c!84224)) b!765453))

(assert (= (and b!765453 c!84223) b!765451))

(assert (= (and b!765453 (not c!84223)) b!765448))

(assert (= (and b!765448 c!84225) b!765449))

(assert (= (and b!765448 (not c!84225)) b!765450))

(assert (=> b!765450 m!711451))

(assert (=> b!765450 m!711451))

(assert (=> b!765450 m!711349))

(declare-fun m!711591 () Bool)

(assert (=> b!765450 m!711591))

(declare-fun m!711593 () Bool)

(assert (=> d!101149 m!711593))

(declare-fun m!711595 () Bool)

(assert (=> d!101149 m!711595))

(assert (=> d!101149 m!711507))

(assert (=> d!101149 m!711355))

(assert (=> b!765142 d!101149))

(declare-fun b!765461 () Bool)

(declare-fun e!426302 () Bool)

(declare-fun e!426303 () Bool)

(assert (=> b!765461 (= e!426302 e!426303)))

(declare-fun lt!340543 () (_ BitVec 64))

(assert (=> b!765461 (= lt!340543 (select (arr!20221 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!340544 () Unit!26368)

(assert (=> b!765461 (= lt!340544 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340543 #b00000000000000000000000000000000))))

(assert (=> b!765461 (arrayContainsKey!0 a!3186 lt!340543 #b00000000000000000000000000000000)))

(declare-fun lt!340545 () Unit!26368)

(assert (=> b!765461 (= lt!340545 lt!340544)))

(declare-fun res!517782 () Bool)

(assert (=> b!765461 (= res!517782 (= (seekEntryOrOpen!0 (select (arr!20221 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7821 #b00000000000000000000000000000000)))))

(assert (=> b!765461 (=> (not res!517782) (not e!426303))))

(declare-fun b!765462 () Bool)

(declare-fun e!426301 () Bool)

(assert (=> b!765462 (= e!426301 e!426302)))

(declare-fun c!84227 () Bool)

(assert (=> b!765462 (= c!84227 (validKeyInArray!0 (select (arr!20221 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35035 () Bool)

(declare-fun call!35038 () Bool)

(assert (=> bm!35035 (= call!35038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101151 () Bool)

(declare-fun res!517783 () Bool)

(assert (=> d!101151 (=> res!517783 e!426301)))

(assert (=> d!101151 (= res!517783 (bvsge #b00000000000000000000000000000000 (size!20642 a!3186)))))

(assert (=> d!101151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!426301)))

(declare-fun b!765463 () Bool)

(assert (=> b!765463 (= e!426303 call!35038)))

(declare-fun b!765464 () Bool)

(assert (=> b!765464 (= e!426302 call!35038)))

(assert (= (and d!101151 (not res!517783)) b!765462))

(assert (= (and b!765462 c!84227) b!765461))

(assert (= (and b!765462 (not c!84227)) b!765464))

(assert (= (and b!765461 res!517782) b!765463))

(assert (= (or b!765463 b!765464) bm!35035))

(assert (=> b!765461 m!711465))

(declare-fun m!711603 () Bool)

(assert (=> b!765461 m!711603))

(declare-fun m!711605 () Bool)

(assert (=> b!765461 m!711605))

(assert (=> b!765461 m!711465))

(declare-fun m!711607 () Bool)

(assert (=> b!765461 m!711607))

(assert (=> b!765462 m!711465))

(assert (=> b!765462 m!711465))

(assert (=> b!765462 m!711523))

(declare-fun m!711609 () Bool)

(assert (=> bm!35035 m!711609))

(assert (=> b!765143 d!101151))

(declare-fun d!101157 () Bool)

(assert (=> d!101157 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765144 d!101157))

(declare-fun d!101159 () Bool)

(assert (=> d!101159 (= (validKeyInArray!0 (select (arr!20221 a!3186) j!159)) (and (not (= (select (arr!20221 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20221 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765145 d!101159))

(check-sat (not d!101097) (not b!765221) (not b!765418) (not b!765230) (not bm!35031) (not b!765351) (not b!765462) (not b!765435) (not b!765323) (not b!765353) (not b!765251) (not b!765461) (not b!765350) (not d!101123) (not b!765272) (not d!101091) (not b!765434) (not d!101147) (not d!101149) (not b!765450) (not bm!35035) (not b!765239) (not bm!35022) (not b!765314) (not d!101127) (not d!101103) (not d!101121) (not d!101095))
(check-sat)
