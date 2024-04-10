; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66308 () Bool)

(assert start!66308)

(declare-fun b!764409 () Bool)

(declare-fun res!517253 () Bool)

(declare-fun e!425734 () Bool)

(assert (=> b!764409 (=> (not res!517253) (not e!425734))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764409 (= res!517253 (validKeyInArray!0 k!2102))))

(declare-fun b!764410 () Bool)

(declare-fun e!425735 () Bool)

(assert (=> b!764410 (= e!425734 e!425735)))

(declare-fun res!517257 () Bool)

(assert (=> b!764410 (=> (not res!517257) (not e!425735))))

(declare-datatypes ((SeekEntryResult!7814 0))(
  ( (MissingZero!7814 (index!33624 (_ BitVec 32))) (Found!7814 (index!33625 (_ BitVec 32))) (Intermediate!7814 (undefined!8626 Bool) (index!33626 (_ BitVec 32)) (x!64522 (_ BitVec 32))) (Undefined!7814) (MissingVacant!7814 (index!33627 (_ BitVec 32))) )
))
(declare-fun lt!340149 () SeekEntryResult!7814)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764410 (= res!517257 (or (= lt!340149 (MissingZero!7814 i!1173)) (= lt!340149 (MissingVacant!7814 i!1173))))))

(declare-datatypes ((array!42213 0))(
  ( (array!42214 (arr!20214 (Array (_ BitVec 32) (_ BitVec 64))) (size!20635 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42213)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42213 (_ BitVec 32)) SeekEntryResult!7814)

(assert (=> b!764410 (= lt!340149 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764411 () Bool)

(declare-fun res!517247 () Bool)

(assert (=> b!764411 (=> (not res!517247) (not e!425735))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764411 (= res!517247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20635 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20635 a!3186))))))

(declare-fun b!764412 () Bool)

(declare-fun e!425738 () Bool)

(declare-fun e!425737 () Bool)

(assert (=> b!764412 (= e!425738 e!425737)))

(declare-fun res!517249 () Bool)

(assert (=> b!764412 (=> (not res!517249) (not e!425737))))

(declare-fun lt!340148 () array!42213)

(declare-fun lt!340151 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42213 (_ BitVec 32)) SeekEntryResult!7814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764412 (= res!517249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340151 mask!3328) lt!340151 lt!340148 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340151 lt!340148 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!764412 (= lt!340151 (select (store (arr!20214 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764412 (= lt!340148 (array!42214 (store (arr!20214 a!3186) i!1173 k!2102) (size!20635 a!3186)))))

(declare-fun b!764413 () Bool)

(declare-fun res!517252 () Bool)

(assert (=> b!764413 (=> (not res!517252) (not e!425738))))

(declare-fun e!425739 () Bool)

(assert (=> b!764413 (= res!517252 e!425739)))

(declare-fun c!83968 () Bool)

(assert (=> b!764413 (= c!83968 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764414 () Bool)

(declare-fun res!517246 () Bool)

(assert (=> b!764414 (=> (not res!517246) (not e!425738))))

(assert (=> b!764414 (= res!517246 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20214 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764415 () Bool)

(declare-fun res!517255 () Bool)

(assert (=> b!764415 (=> (not res!517255) (not e!425735))))

(declare-datatypes ((List!14216 0))(
  ( (Nil!14213) (Cons!14212 (h!15296 (_ BitVec 64)) (t!20531 List!14216)) )
))
(declare-fun arrayNoDuplicates!0 (array!42213 (_ BitVec 32) List!14216) Bool)

(assert (=> b!764415 (= res!517255 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14213))))

(declare-fun b!764416 () Bool)

(declare-fun res!517251 () Bool)

(assert (=> b!764416 (=> (not res!517251) (not e!425734))))

(declare-fun arrayContainsKey!0 (array!42213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764416 (= res!517251 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764417 () Bool)

(assert (=> b!764417 (= e!425735 e!425738)))

(declare-fun res!517254 () Bool)

(assert (=> b!764417 (=> (not res!517254) (not e!425738))))

(declare-fun lt!340147 () SeekEntryResult!7814)

(assert (=> b!764417 (= res!517254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) (select (arr!20214 a!3186) j!159) a!3186 mask!3328) lt!340147))))

(assert (=> b!764417 (= lt!340147 (Intermediate!7814 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764418 () Bool)

(assert (=> b!764418 (= e!425739 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) lt!340147))))

(declare-fun b!764419 () Bool)

(declare-fun res!517248 () Bool)

(assert (=> b!764419 (=> (not res!517248) (not e!425735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42213 (_ BitVec 32)) Bool)

(assert (=> b!764419 (= res!517248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!517256 () Bool)

(assert (=> start!66308 (=> (not res!517256) (not e!425734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66308 (= res!517256 (validMask!0 mask!3328))))

(assert (=> start!66308 e!425734))

(assert (=> start!66308 true))

(declare-fun array_inv!16010 (array!42213) Bool)

(assert (=> start!66308 (array_inv!16010 a!3186)))

(declare-fun b!764420 () Bool)

(declare-fun res!517258 () Bool)

(assert (=> b!764420 (=> (not res!517258) (not e!425734))))

(assert (=> b!764420 (= res!517258 (validKeyInArray!0 (select (arr!20214 a!3186) j!159)))))

(declare-fun b!764421 () Bool)

(declare-fun res!517250 () Bool)

(assert (=> b!764421 (=> (not res!517250) (not e!425734))))

(assert (=> b!764421 (= res!517250 (and (= (size!20635 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20635 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20635 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764422 () Bool)

(assert (=> b!764422 (= e!425737 (not (= (seekEntryOrOpen!0 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) (Found!7814 j!159))))))

(assert (=> b!764422 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26354 0))(
  ( (Unit!26355) )
))
(declare-fun lt!340150 () Unit!26354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26354)

(assert (=> b!764422 (= lt!340150 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764423 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42213 (_ BitVec 32)) SeekEntryResult!7814)

(assert (=> b!764423 (= e!425739 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) (Found!7814 j!159)))))

(assert (= (and start!66308 res!517256) b!764421))

(assert (= (and b!764421 res!517250) b!764420))

(assert (= (and b!764420 res!517258) b!764409))

(assert (= (and b!764409 res!517253) b!764416))

(assert (= (and b!764416 res!517251) b!764410))

(assert (= (and b!764410 res!517257) b!764419))

(assert (= (and b!764419 res!517248) b!764415))

(assert (= (and b!764415 res!517255) b!764411))

(assert (= (and b!764411 res!517247) b!764417))

(assert (= (and b!764417 res!517254) b!764414))

(assert (= (and b!764414 res!517246) b!764413))

(assert (= (and b!764413 c!83968) b!764418))

(assert (= (and b!764413 (not c!83968)) b!764423))

(assert (= (and b!764413 res!517252) b!764412))

(assert (= (and b!764412 res!517249) b!764422))

(declare-fun m!710781 () Bool)

(assert (=> b!764417 m!710781))

(assert (=> b!764417 m!710781))

(declare-fun m!710783 () Bool)

(assert (=> b!764417 m!710783))

(assert (=> b!764417 m!710783))

(assert (=> b!764417 m!710781))

(declare-fun m!710785 () Bool)

(assert (=> b!764417 m!710785))

(declare-fun m!710787 () Bool)

(assert (=> b!764409 m!710787))

(declare-fun m!710789 () Bool)

(assert (=> b!764414 m!710789))

(declare-fun m!710791 () Bool)

(assert (=> b!764419 m!710791))

(assert (=> b!764423 m!710781))

(assert (=> b!764423 m!710781))

(declare-fun m!710793 () Bool)

(assert (=> b!764423 m!710793))

(assert (=> b!764418 m!710781))

(assert (=> b!764418 m!710781))

(declare-fun m!710795 () Bool)

(assert (=> b!764418 m!710795))

(declare-fun m!710797 () Bool)

(assert (=> b!764412 m!710797))

(declare-fun m!710799 () Bool)

(assert (=> b!764412 m!710799))

(declare-fun m!710801 () Bool)

(assert (=> b!764412 m!710801))

(assert (=> b!764412 m!710797))

(declare-fun m!710803 () Bool)

(assert (=> b!764412 m!710803))

(declare-fun m!710805 () Bool)

(assert (=> b!764412 m!710805))

(declare-fun m!710807 () Bool)

(assert (=> b!764410 m!710807))

(assert (=> b!764422 m!710781))

(assert (=> b!764422 m!710781))

(declare-fun m!710809 () Bool)

(assert (=> b!764422 m!710809))

(declare-fun m!710811 () Bool)

(assert (=> b!764422 m!710811))

(declare-fun m!710813 () Bool)

(assert (=> b!764422 m!710813))

(declare-fun m!710815 () Bool)

(assert (=> start!66308 m!710815))

(declare-fun m!710817 () Bool)

(assert (=> start!66308 m!710817))

(declare-fun m!710819 () Bool)

(assert (=> b!764416 m!710819))

(declare-fun m!710821 () Bool)

(assert (=> b!764415 m!710821))

(assert (=> b!764420 m!710781))

(assert (=> b!764420 m!710781))

(declare-fun m!710823 () Bool)

(assert (=> b!764420 m!710823))

(push 1)

(assert (not b!764420))

(assert (not b!764419))

(assert (not b!764423))

(assert (not b!764422))

(assert (not b!764410))

(assert (not b!764409))

(assert (not b!764417))

(assert (not b!764412))

(assert (not b!764416))

(assert (not start!66308))

(assert (not b!764418))

(assert (not b!764415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!425807 () SeekEntryResult!7814)

(declare-fun b!764571 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764571 (= e!425807 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20214 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764573 () Bool)

(declare-fun lt!340198 () SeekEntryResult!7814)

(assert (=> b!764573 (and (bvsge (index!33626 lt!340198) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340198) (size!20635 a!3186)))))

(declare-fun e!425809 () Bool)

(assert (=> b!764573 (= e!425809 (= (select (arr!20214 a!3186) (index!33626 lt!340198)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764574 () Bool)

(assert (=> b!764574 (and (bvsge (index!33626 lt!340198) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340198) (size!20635 a!3186)))))

(declare-fun res!517352 () Bool)

(assert (=> b!764574 (= res!517352 (= (select (arr!20214 a!3186) (index!33626 lt!340198)) (select (arr!20214 a!3186) j!159)))))

(assert (=> b!764574 (=> res!517352 e!425809)))

(declare-fun e!425808 () Bool)

(assert (=> b!764574 (= e!425808 e!425809)))

(declare-fun b!764575 () Bool)

(declare-fun e!425811 () Bool)

(assert (=> b!764575 (= e!425811 (bvsge (x!64522 lt!340198) #b01111111111111111111111111111110))))

(declare-fun b!764572 () Bool)

(declare-fun e!425810 () SeekEntryResult!7814)

(assert (=> b!764572 (= e!425810 e!425807)))

(declare-fun c!83998 () Bool)

(declare-fun lt!340199 () (_ BitVec 64))

(assert (=> b!764572 (= c!83998 (or (= lt!340199 (select (arr!20214 a!3186) j!159)) (= (bvadd lt!340199 lt!340199) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100991 () Bool)

(assert (=> d!100991 e!425811))

(declare-fun c!83996 () Bool)

(assert (=> d!100991 (= c!83996 (and (is-Intermediate!7814 lt!340198) (undefined!8626 lt!340198)))))

(assert (=> d!100991 (= lt!340198 e!425810)))

(declare-fun c!83997 () Bool)

(assert (=> d!100991 (= c!83997 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100991 (= lt!340199 (select (arr!20214 a!3186) (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328)))))

(assert (=> d!100991 (validMask!0 mask!3328)))

(assert (=> d!100991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) (select (arr!20214 a!3186) j!159) a!3186 mask!3328) lt!340198)))

(declare-fun b!764576 () Bool)

(assert (=> b!764576 (= e!425810 (Intermediate!7814 true (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764577 () Bool)

(assert (=> b!764577 (= e!425811 e!425808)))

(declare-fun res!517353 () Bool)

(assert (=> b!764577 (= res!517353 (and (is-Intermediate!7814 lt!340198) (not (undefined!8626 lt!340198)) (bvslt (x!64522 lt!340198) #b01111111111111111111111111111110) (bvsge (x!64522 lt!340198) #b00000000000000000000000000000000) (bvsge (x!64522 lt!340198) #b00000000000000000000000000000000)))))

(assert (=> b!764577 (=> (not res!517353) (not e!425808))))

(declare-fun b!764578 () Bool)

(assert (=> b!764578 (and (bvsge (index!33626 lt!340198) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340198) (size!20635 a!3186)))))

(declare-fun res!517354 () Bool)

(assert (=> b!764578 (= res!517354 (= (select (arr!20214 a!3186) (index!33626 lt!340198)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764578 (=> res!517354 e!425809)))

(declare-fun b!764579 () Bool)

(assert (=> b!764579 (= e!425807 (Intermediate!7814 false (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!100991 c!83997) b!764576))

(assert (= (and d!100991 (not c!83997)) b!764572))

(assert (= (and b!764572 c!83998) b!764579))

(assert (= (and b!764572 (not c!83998)) b!764571))

(assert (= (and d!100991 c!83996) b!764575))

(assert (= (and d!100991 (not c!83996)) b!764577))

(assert (= (and b!764577 res!517353) b!764574))

(assert (= (and b!764574 (not res!517352)) b!764578))

(assert (= (and b!764578 (not res!517354)) b!764573))

(declare-fun m!710921 () Bool)

(assert (=> b!764578 m!710921))

(assert (=> b!764574 m!710921))

(assert (=> b!764571 m!710783))

(declare-fun m!710923 () Bool)

(assert (=> b!764571 m!710923))

(assert (=> b!764571 m!710923))

(assert (=> b!764571 m!710781))

(declare-fun m!710925 () Bool)

(assert (=> b!764571 m!710925))

(assert (=> b!764573 m!710921))

(assert (=> d!100991 m!710783))

(declare-fun m!710927 () Bool)

(assert (=> d!100991 m!710927))

(assert (=> d!100991 m!710815))

(assert (=> b!764417 d!100991))

(declare-fun d!100995 () Bool)

(declare-fun lt!340214 () (_ BitVec 32))

(declare-fun lt!340213 () (_ BitVec 32))

(assert (=> d!100995 (= lt!340214 (bvmul (bvxor lt!340213 (bvlshr lt!340213 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100995 (= lt!340213 ((_ extract 31 0) (bvand (bvxor (select (arr!20214 a!3186) j!159) (bvlshr (select (arr!20214 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100995 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517355 (let ((h!15299 ((_ extract 31 0) (bvand (bvxor (select (arr!20214 a!3186) j!159) (bvlshr (select (arr!20214 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64527 (bvmul (bvxor h!15299 (bvlshr h!15299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64527 (bvlshr x!64527 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517355 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517355 #b00000000000000000000000000000000))))))

(assert (=> d!100995 (= (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) (bvand (bvxor lt!340214 (bvlshr lt!340214 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764417 d!100995))

(declare-fun d!100999 () Bool)

(declare-fun res!517360 () Bool)

(declare-fun e!425825 () Bool)

(assert (=> d!100999 (=> res!517360 e!425825)))

(assert (=> d!100999 (= res!517360 (= (select (arr!20214 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100999 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!425825)))

(declare-fun b!764602 () Bool)

(declare-fun e!425826 () Bool)

(assert (=> b!764602 (= e!425825 e!425826)))

(declare-fun res!517361 () Bool)

(assert (=> b!764602 (=> (not res!517361) (not e!425826))))

(assert (=> b!764602 (= res!517361 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20635 a!3186)))))

(declare-fun b!764603 () Bool)

(assert (=> b!764603 (= e!425826 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100999 (not res!517360)) b!764602))

(assert (= (and b!764602 res!517361) b!764603))

(declare-fun m!710939 () Bool)

(assert (=> d!100999 m!710939))

(declare-fun m!710941 () Bool)

(assert (=> b!764603 m!710941))

(assert (=> b!764416 d!100999))

(declare-fun e!425827 () SeekEntryResult!7814)

(declare-fun b!764604 () Bool)

(assert (=> b!764604 (= e!425827 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20214 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764606 () Bool)

(declare-fun lt!340215 () SeekEntryResult!7814)

(assert (=> b!764606 (and (bvsge (index!33626 lt!340215) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340215) (size!20635 a!3186)))))

(declare-fun e!425829 () Bool)

(assert (=> b!764606 (= e!425829 (= (select (arr!20214 a!3186) (index!33626 lt!340215)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764607 () Bool)

(assert (=> b!764607 (and (bvsge (index!33626 lt!340215) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340215) (size!20635 a!3186)))))

(declare-fun res!517362 () Bool)

(assert (=> b!764607 (= res!517362 (= (select (arr!20214 a!3186) (index!33626 lt!340215)) (select (arr!20214 a!3186) j!159)))))

(assert (=> b!764607 (=> res!517362 e!425829)))

(declare-fun e!425828 () Bool)

(assert (=> b!764607 (= e!425828 e!425829)))

(declare-fun b!764608 () Bool)

(declare-fun e!425831 () Bool)

(assert (=> b!764608 (= e!425831 (bvsge (x!64522 lt!340215) #b01111111111111111111111111111110))))

(declare-fun b!764605 () Bool)

(declare-fun e!425830 () SeekEntryResult!7814)

(assert (=> b!764605 (= e!425830 e!425827)))

(declare-fun c!84010 () Bool)

(declare-fun lt!340216 () (_ BitVec 64))

(assert (=> b!764605 (= c!84010 (or (= lt!340216 (select (arr!20214 a!3186) j!159)) (= (bvadd lt!340216 lt!340216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101001 () Bool)

(assert (=> d!101001 e!425831))

(declare-fun c!84008 () Bool)

(assert (=> d!101001 (= c!84008 (and (is-Intermediate!7814 lt!340215) (undefined!8626 lt!340215)))))

(assert (=> d!101001 (= lt!340215 e!425830)))

(declare-fun c!84009 () Bool)

(assert (=> d!101001 (= c!84009 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101001 (= lt!340216 (select (arr!20214 a!3186) index!1321))))

(assert (=> d!101001 (validMask!0 mask!3328)))

(assert (=> d!101001 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) lt!340215)))

(declare-fun b!764609 () Bool)

(assert (=> b!764609 (= e!425830 (Intermediate!7814 true index!1321 x!1131))))

(declare-fun b!764610 () Bool)

(assert (=> b!764610 (= e!425831 e!425828)))

(declare-fun res!517363 () Bool)

(assert (=> b!764610 (= res!517363 (and (is-Intermediate!7814 lt!340215) (not (undefined!8626 lt!340215)) (bvslt (x!64522 lt!340215) #b01111111111111111111111111111110) (bvsge (x!64522 lt!340215) #b00000000000000000000000000000000) (bvsge (x!64522 lt!340215) x!1131)))))

(assert (=> b!764610 (=> (not res!517363) (not e!425828))))

(declare-fun b!764611 () Bool)

(assert (=> b!764611 (and (bvsge (index!33626 lt!340215) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340215) (size!20635 a!3186)))))

(declare-fun res!517364 () Bool)

(assert (=> b!764611 (= res!517364 (= (select (arr!20214 a!3186) (index!33626 lt!340215)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764611 (=> res!517364 e!425829)))

(declare-fun b!764612 () Bool)

(assert (=> b!764612 (= e!425827 (Intermediate!7814 false index!1321 x!1131))))

(assert (= (and d!101001 c!84009) b!764609))

(assert (= (and d!101001 (not c!84009)) b!764605))

(assert (= (and b!764605 c!84010) b!764612))

(assert (= (and b!764605 (not c!84010)) b!764604))

(assert (= (and d!101001 c!84008) b!764608))

(assert (= (and d!101001 (not c!84008)) b!764610))

(assert (= (and b!764610 res!517363) b!764607))

(assert (= (and b!764607 (not res!517362)) b!764611))

(assert (= (and b!764611 (not res!517364)) b!764606))

(declare-fun m!710943 () Bool)

(assert (=> b!764611 m!710943))

(assert (=> b!764607 m!710943))

(declare-fun m!710945 () Bool)

(assert (=> b!764604 m!710945))

(assert (=> b!764604 m!710945))

(assert (=> b!764604 m!710781))

(declare-fun m!710947 () Bool)

(assert (=> b!764604 m!710947))

(assert (=> b!764606 m!710943))

(declare-fun m!710949 () Bool)

(assert (=> d!101001 m!710949))

(assert (=> d!101001 m!710815))

(assert (=> b!764418 d!101001))

(declare-fun d!101003 () Bool)

(assert (=> d!101003 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!764409 d!101003))

(declare-fun b!764639 () Bool)

(declare-fun e!425852 () Bool)

(declare-fun call!35007 () Bool)

(assert (=> b!764639 (= e!425852 call!35007)))

(declare-fun b!764640 () Bool)

(declare-fun e!425850 () Bool)

(assert (=> b!764640 (= e!425850 call!35007)))

(declare-fun bm!35004 () Bool)

(assert (=> bm!35004 (= call!35007 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!764641 () Bool)

(assert (=> b!764641 (= e!425852 e!425850)))

(declare-fun lt!340236 () (_ BitVec 64))

(assert (=> b!764641 (= lt!340236 (select (arr!20214 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!340237 () Unit!26354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42213 (_ BitVec 64) (_ BitVec 32)) Unit!26354)

(assert (=> b!764641 (= lt!340237 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340236 #b00000000000000000000000000000000))))

(assert (=> b!764641 (arrayContainsKey!0 a!3186 lt!340236 #b00000000000000000000000000000000)))

(declare-fun lt!340235 () Unit!26354)

(assert (=> b!764641 (= lt!340235 lt!340237)))

(declare-fun res!517375 () Bool)

(assert (=> b!764641 (= res!517375 (= (seekEntryOrOpen!0 (select (arr!20214 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7814 #b00000000000000000000000000000000)))))

(assert (=> b!764641 (=> (not res!517375) (not e!425850))))

(declare-fun b!764642 () Bool)

(declare-fun e!425851 () Bool)

(assert (=> b!764642 (= e!425851 e!425852)))

(declare-fun c!84019 () Bool)

(assert (=> b!764642 (= c!84019 (validKeyInArray!0 (select (arr!20214 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101005 () Bool)

(declare-fun res!517376 () Bool)

(assert (=> d!101005 (=> res!517376 e!425851)))

(assert (=> d!101005 (= res!517376 (bvsge #b00000000000000000000000000000000 (size!20635 a!3186)))))

(assert (=> d!101005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!425851)))

(assert (= (and d!101005 (not res!517376)) b!764642))

(assert (= (and b!764642 c!84019) b!764641))

(assert (= (and b!764642 (not c!84019)) b!764639))

(assert (= (and b!764641 res!517375) b!764640))

(assert (= (or b!764640 b!764639) bm!35004))

(declare-fun m!710971 () Bool)

(assert (=> bm!35004 m!710971))

(assert (=> b!764641 m!710939))

(declare-fun m!710973 () Bool)

(assert (=> b!764641 m!710973))

(declare-fun m!710975 () Bool)

(assert (=> b!764641 m!710975))

(assert (=> b!764641 m!710939))

(declare-fun m!710977 () Bool)

(assert (=> b!764641 m!710977))

(assert (=> b!764642 m!710939))

(assert (=> b!764642 m!710939))

(declare-fun m!710979 () Bool)

(assert (=> b!764642 m!710979))

(assert (=> b!764419 d!101005))

(declare-fun b!764691 () Bool)

(declare-fun e!425882 () SeekEntryResult!7814)

(declare-fun e!425881 () SeekEntryResult!7814)

(assert (=> b!764691 (= e!425882 e!425881)))

(declare-fun lt!340266 () (_ BitVec 64))

(declare-fun lt!340264 () SeekEntryResult!7814)

(assert (=> b!764691 (= lt!340266 (select (arr!20214 a!3186) (index!33626 lt!340264)))))

(declare-fun c!84042 () Bool)

(assert (=> b!764691 (= c!84042 (= lt!340266 k!2102))))

(declare-fun b!764692 () Bool)

(declare-fun e!425880 () SeekEntryResult!7814)

(assert (=> b!764692 (= e!425880 (MissingZero!7814 (index!33626 lt!340264)))))

(declare-fun b!764693 () Bool)

(assert (=> b!764693 (= e!425882 Undefined!7814)))

(declare-fun b!764694 () Bool)

(declare-fun c!84041 () Bool)

(assert (=> b!764694 (= c!84041 (= lt!340266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764694 (= e!425881 e!425880)))

(declare-fun d!101011 () Bool)

(declare-fun lt!340265 () SeekEntryResult!7814)

(assert (=> d!101011 (and (or (is-Undefined!7814 lt!340265) (not (is-Found!7814 lt!340265)) (and (bvsge (index!33625 lt!340265) #b00000000000000000000000000000000) (bvslt (index!33625 lt!340265) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340265) (is-Found!7814 lt!340265) (not (is-MissingZero!7814 lt!340265)) (and (bvsge (index!33624 lt!340265) #b00000000000000000000000000000000) (bvslt (index!33624 lt!340265) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340265) (is-Found!7814 lt!340265) (is-MissingZero!7814 lt!340265) (not (is-MissingVacant!7814 lt!340265)) (and (bvsge (index!33627 lt!340265) #b00000000000000000000000000000000) (bvslt (index!33627 lt!340265) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340265) (ite (is-Found!7814 lt!340265) (= (select (arr!20214 a!3186) (index!33625 lt!340265)) k!2102) (ite (is-MissingZero!7814 lt!340265) (= (select (arr!20214 a!3186) (index!33624 lt!340265)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7814 lt!340265) (= (select (arr!20214 a!3186) (index!33627 lt!340265)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101011 (= lt!340265 e!425882)))

(declare-fun c!84043 () Bool)

(assert (=> d!101011 (= c!84043 (and (is-Intermediate!7814 lt!340264) (undefined!8626 lt!340264)))))

(assert (=> d!101011 (= lt!340264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101011 (validMask!0 mask!3328)))

(assert (=> d!101011 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!340265)))

(declare-fun b!764695 () Bool)

(assert (=> b!764695 (= e!425881 (Found!7814 (index!33626 lt!340264)))))

(declare-fun b!764696 () Bool)

(assert (=> b!764696 (= e!425880 (seekKeyOrZeroReturnVacant!0 (x!64522 lt!340264) (index!33626 lt!340264) (index!33626 lt!340264) k!2102 a!3186 mask!3328))))

(assert (= (and d!101011 c!84043) b!764693))

(assert (= (and d!101011 (not c!84043)) b!764691))

(assert (= (and b!764691 c!84042) b!764695))

(assert (= (and b!764691 (not c!84042)) b!764694))

(assert (= (and b!764694 c!84041) b!764692))

(assert (= (and b!764694 (not c!84041)) b!764696))

(declare-fun m!711011 () Bool)

(assert (=> b!764691 m!711011))

(declare-fun m!711013 () Bool)

(assert (=> d!101011 m!711013))

(declare-fun m!711015 () Bool)

(assert (=> d!101011 m!711015))

(declare-fun m!711017 () Bool)

(assert (=> d!101011 m!711017))

(assert (=> d!101011 m!710815))

(declare-fun m!711019 () Bool)

(assert (=> d!101011 m!711019))

(assert (=> d!101011 m!711013))

(declare-fun m!711021 () Bool)

(assert (=> d!101011 m!711021))

(declare-fun m!711023 () Bool)

(assert (=> b!764696 m!711023))

(assert (=> b!764410 d!101011))

(declare-fun d!101023 () Bool)

(assert (=> d!101023 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66308 d!101023))

(declare-fun d!101031 () Bool)

(assert (=> d!101031 (= (array_inv!16010 a!3186) (bvsge (size!20635 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66308 d!101031))

(declare-fun d!101033 () Bool)

(assert (=> d!101033 (= (validKeyInArray!0 (select (arr!20214 a!3186) j!159)) (and (not (= (select (arr!20214 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20214 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!764420 d!101033))

(declare-fun b!764722 () Bool)

(declare-fun e!425901 () SeekEntryResult!7814)

(declare-fun e!425900 () SeekEntryResult!7814)

(assert (=> b!764722 (= e!425901 e!425900)))

(declare-fun lt!340274 () (_ BitVec 64))

(declare-fun lt!340272 () SeekEntryResult!7814)

(assert (=> b!764722 (= lt!340274 (select (arr!20214 a!3186) (index!33626 lt!340272)))))

(declare-fun c!84049 () Bool)

(assert (=> b!764722 (= c!84049 (= lt!340274 (select (arr!20214 a!3186) j!159)))))

(declare-fun b!764723 () Bool)

(declare-fun e!425899 () SeekEntryResult!7814)

(assert (=> b!764723 (= e!425899 (MissingZero!7814 (index!33626 lt!340272)))))

(declare-fun b!764724 () Bool)

(assert (=> b!764724 (= e!425901 Undefined!7814)))

(declare-fun b!764725 () Bool)

(declare-fun c!84048 () Bool)

(assert (=> b!764725 (= c!84048 (= lt!340274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764725 (= e!425900 e!425899)))

(declare-fun d!101035 () Bool)

(declare-fun lt!340273 () SeekEntryResult!7814)

(assert (=> d!101035 (and (or (is-Undefined!7814 lt!340273) (not (is-Found!7814 lt!340273)) (and (bvsge (index!33625 lt!340273) #b00000000000000000000000000000000) (bvslt (index!33625 lt!340273) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340273) (is-Found!7814 lt!340273) (not (is-MissingZero!7814 lt!340273)) (and (bvsge (index!33624 lt!340273) #b00000000000000000000000000000000) (bvslt (index!33624 lt!340273) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340273) (is-Found!7814 lt!340273) (is-MissingZero!7814 lt!340273) (not (is-MissingVacant!7814 lt!340273)) (and (bvsge (index!33627 lt!340273) #b00000000000000000000000000000000) (bvslt (index!33627 lt!340273) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340273) (ite (is-Found!7814 lt!340273) (= (select (arr!20214 a!3186) (index!33625 lt!340273)) (select (arr!20214 a!3186) j!159)) (ite (is-MissingZero!7814 lt!340273) (= (select (arr!20214 a!3186) (index!33624 lt!340273)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7814 lt!340273) (= (select (arr!20214 a!3186) (index!33627 lt!340273)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101035 (= lt!340273 e!425901)))

(declare-fun c!84050 () Bool)

(assert (=> d!101035 (= c!84050 (and (is-Intermediate!7814 lt!340272) (undefined!8626 lt!340272)))))

(assert (=> d!101035 (= lt!340272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20214 a!3186) j!159) mask!3328) (select (arr!20214 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101035 (validMask!0 mask!3328)))

(assert (=> d!101035 (= (seekEntryOrOpen!0 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) lt!340273)))

(declare-fun b!764726 () Bool)

(assert (=> b!764726 (= e!425900 (Found!7814 (index!33626 lt!340272)))))

(declare-fun b!764727 () Bool)

(assert (=> b!764727 (= e!425899 (seekKeyOrZeroReturnVacant!0 (x!64522 lt!340272) (index!33626 lt!340272) (index!33626 lt!340272) (select (arr!20214 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101035 c!84050) b!764724))

(assert (= (and d!101035 (not c!84050)) b!764722))

(assert (= (and b!764722 c!84049) b!764726))

(assert (= (and b!764722 (not c!84049)) b!764725))

(assert (= (and b!764725 c!84048) b!764723))

(assert (= (and b!764725 (not c!84048)) b!764727))

(declare-fun m!711047 () Bool)

(assert (=> b!764722 m!711047))

(assert (=> d!101035 m!710783))

(assert (=> d!101035 m!710781))

(assert (=> d!101035 m!710785))

(declare-fun m!711049 () Bool)

(assert (=> d!101035 m!711049))

(assert (=> d!101035 m!710815))

(declare-fun m!711051 () Bool)

(assert (=> d!101035 m!711051))

(assert (=> d!101035 m!710781))

(assert (=> d!101035 m!710783))

(declare-fun m!711053 () Bool)

(assert (=> d!101035 m!711053))

(assert (=> b!764727 m!710781))

(declare-fun m!711055 () Bool)

(assert (=> b!764727 m!711055))

(assert (=> b!764422 d!101035))

(declare-fun b!764728 () Bool)

(declare-fun e!425904 () Bool)

(declare-fun call!35009 () Bool)

(assert (=> b!764728 (= e!425904 call!35009)))

(declare-fun b!764729 () Bool)

(declare-fun e!425902 () Bool)

(assert (=> b!764729 (= e!425902 call!35009)))

(declare-fun bm!35006 () Bool)

(assert (=> bm!35006 (= call!35009 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!764730 () Bool)

(assert (=> b!764730 (= e!425904 e!425902)))

(declare-fun lt!340276 () (_ BitVec 64))

(assert (=> b!764730 (= lt!340276 (select (arr!20214 a!3186) j!159))))

(declare-fun lt!340277 () Unit!26354)

(assert (=> b!764730 (= lt!340277 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340276 j!159))))

(assert (=> b!764730 (arrayContainsKey!0 a!3186 lt!340276 #b00000000000000000000000000000000)))

(declare-fun lt!340275 () Unit!26354)

(assert (=> b!764730 (= lt!340275 lt!340277)))

(declare-fun res!517402 () Bool)

(assert (=> b!764730 (= res!517402 (= (seekEntryOrOpen!0 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) (Found!7814 j!159)))))

(assert (=> b!764730 (=> (not res!517402) (not e!425902))))

(declare-fun b!764731 () Bool)

(declare-fun e!425903 () Bool)

(assert (=> b!764731 (= e!425903 e!425904)))

(declare-fun c!84051 () Bool)

(assert (=> b!764731 (= c!84051 (validKeyInArray!0 (select (arr!20214 a!3186) j!159)))))

(declare-fun d!101037 () Bool)

(declare-fun res!517403 () Bool)

(assert (=> d!101037 (=> res!517403 e!425903)))

(assert (=> d!101037 (= res!517403 (bvsge j!159 (size!20635 a!3186)))))

(assert (=> d!101037 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!425903)))

(assert (= (and d!101037 (not res!517403)) b!764731))

(assert (= (and b!764731 c!84051) b!764730))

(assert (= (and b!764731 (not c!84051)) b!764728))

(assert (= (and b!764730 res!517402) b!764729))

(assert (= (or b!764729 b!764728) bm!35006))

(declare-fun m!711057 () Bool)

(assert (=> bm!35006 m!711057))

(assert (=> b!764730 m!710781))

(declare-fun m!711059 () Bool)

(assert (=> b!764730 m!711059))

(declare-fun m!711061 () Bool)

(assert (=> b!764730 m!711061))

(assert (=> b!764730 m!710781))

(assert (=> b!764730 m!710809))

(assert (=> b!764731 m!710781))

(assert (=> b!764731 m!710781))

(assert (=> b!764731 m!710823))

(assert (=> b!764422 d!101037))

(declare-fun d!101039 () Bool)

(assert (=> d!101039 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340288 () Unit!26354)

(declare-fun choose!38 (array!42213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26354)

(assert (=> d!101039 (= lt!340288 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101039 (validMask!0 mask!3328)))

(assert (=> d!101039 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340288)))

(declare-fun bs!21478 () Bool)

(assert (= bs!21478 d!101039))

(assert (=> bs!21478 m!710811))

(declare-fun m!711065 () Bool)

(assert (=> bs!21478 m!711065))

(assert (=> bs!21478 m!710815))

(assert (=> b!764422 d!101039))

(declare-fun b!764780 () Bool)

(declare-fun e!425930 () SeekEntryResult!7814)

(assert (=> b!764780 (= e!425930 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20214 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764781 () Bool)

(declare-fun e!425931 () SeekEntryResult!7814)

(declare-fun e!425932 () SeekEntryResult!7814)

(assert (=> b!764781 (= e!425931 e!425932)))

(declare-fun c!84073 () Bool)

(declare-fun lt!340302 () (_ BitVec 64))

(assert (=> b!764781 (= c!84073 (= lt!340302 (select (arr!20214 a!3186) j!159)))))

(declare-fun b!764782 () Bool)

(declare-fun c!84075 () Bool)

(assert (=> b!764782 (= c!84075 (= lt!340302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764782 (= e!425932 e!425930)))

(declare-fun lt!340301 () SeekEntryResult!7814)

(declare-fun d!101043 () Bool)

(assert (=> d!101043 (and (or (is-Undefined!7814 lt!340301) (not (is-Found!7814 lt!340301)) (and (bvsge (index!33625 lt!340301) #b00000000000000000000000000000000) (bvslt (index!33625 lt!340301) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340301) (is-Found!7814 lt!340301) (not (is-MissingVacant!7814 lt!340301)) (not (= (index!33627 lt!340301) resIntermediateIndex!5)) (and (bvsge (index!33627 lt!340301) #b00000000000000000000000000000000) (bvslt (index!33627 lt!340301) (size!20635 a!3186)))) (or (is-Undefined!7814 lt!340301) (ite (is-Found!7814 lt!340301) (= (select (arr!20214 a!3186) (index!33625 lt!340301)) (select (arr!20214 a!3186) j!159)) (and (is-MissingVacant!7814 lt!340301) (= (index!33627 lt!340301) resIntermediateIndex!5) (= (select (arr!20214 a!3186) (index!33627 lt!340301)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101043 (= lt!340301 e!425931)))

(declare-fun c!84074 () Bool)

(assert (=> d!101043 (= c!84074 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101043 (= lt!340302 (select (arr!20214 a!3186) index!1321))))

(assert (=> d!101043 (validMask!0 mask!3328)))

(assert (=> d!101043 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20214 a!3186) j!159) a!3186 mask!3328) lt!340301)))

(declare-fun b!764783 () Bool)

(assert (=> b!764783 (= e!425931 Undefined!7814)))

(declare-fun b!764784 () Bool)

(assert (=> b!764784 (= e!425932 (Found!7814 index!1321))))

(declare-fun b!764785 () Bool)

(assert (=> b!764785 (= e!425930 (MissingVacant!7814 resIntermediateIndex!5))))

(assert (= (and d!101043 c!84074) b!764783))

(assert (= (and d!101043 (not c!84074)) b!764781))

(assert (= (and b!764781 c!84073) b!764784))

(assert (= (and b!764781 (not c!84073)) b!764782))

(assert (= (and b!764782 c!84075) b!764785))

(assert (= (and b!764782 (not c!84075)) b!764780))

(assert (=> b!764780 m!710945))

(assert (=> b!764780 m!710945))

(assert (=> b!764780 m!710781))

(declare-fun m!711081 () Bool)

(assert (=> b!764780 m!711081))

(declare-fun m!711083 () Bool)

(assert (=> d!101043 m!711083))

(declare-fun m!711087 () Bool)

(assert (=> d!101043 m!711087))

(assert (=> d!101043 m!710949))

(assert (=> d!101043 m!710815))

(assert (=> b!764423 d!101043))

(declare-fun e!425933 () SeekEntryResult!7814)

(declare-fun b!764786 () Bool)

(assert (=> b!764786 (= e!425933 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340151 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340151 lt!340148 mask!3328))))

(declare-fun b!764788 () Bool)

(declare-fun lt!340303 () SeekEntryResult!7814)

(assert (=> b!764788 (and (bvsge (index!33626 lt!340303) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340303) (size!20635 lt!340148)))))

(declare-fun e!425935 () Bool)

(assert (=> b!764788 (= e!425935 (= (select (arr!20214 lt!340148) (index!33626 lt!340303)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764789 () Bool)

(assert (=> b!764789 (and (bvsge (index!33626 lt!340303) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340303) (size!20635 lt!340148)))))

(declare-fun res!517410 () Bool)

(assert (=> b!764789 (= res!517410 (= (select (arr!20214 lt!340148) (index!33626 lt!340303)) lt!340151))))

(assert (=> b!764789 (=> res!517410 e!425935)))

(declare-fun e!425934 () Bool)

(assert (=> b!764789 (= e!425934 e!425935)))

(declare-fun b!764790 () Bool)

(declare-fun e!425937 () Bool)

(assert (=> b!764790 (= e!425937 (bvsge (x!64522 lt!340303) #b01111111111111111111111111111110))))

(declare-fun b!764787 () Bool)

(declare-fun e!425936 () SeekEntryResult!7814)

(assert (=> b!764787 (= e!425936 e!425933)))

(declare-fun c!84078 () Bool)

(declare-fun lt!340304 () (_ BitVec 64))

(assert (=> b!764787 (= c!84078 (or (= lt!340304 lt!340151) (= (bvadd lt!340304 lt!340304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101049 () Bool)

(assert (=> d!101049 e!425937))

(declare-fun c!84076 () Bool)

(assert (=> d!101049 (= c!84076 (and (is-Intermediate!7814 lt!340303) (undefined!8626 lt!340303)))))

(assert (=> d!101049 (= lt!340303 e!425936)))

(declare-fun c!84077 () Bool)

(assert (=> d!101049 (= c!84077 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101049 (= lt!340304 (select (arr!20214 lt!340148) (toIndex!0 lt!340151 mask!3328)))))

(assert (=> d!101049 (validMask!0 mask!3328)))

(assert (=> d!101049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340151 mask!3328) lt!340151 lt!340148 mask!3328) lt!340303)))

(declare-fun b!764791 () Bool)

(assert (=> b!764791 (= e!425936 (Intermediate!7814 true (toIndex!0 lt!340151 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764792 () Bool)

(assert (=> b!764792 (= e!425937 e!425934)))

(declare-fun res!517411 () Bool)

(assert (=> b!764792 (= res!517411 (and (is-Intermediate!7814 lt!340303) (not (undefined!8626 lt!340303)) (bvslt (x!64522 lt!340303) #b01111111111111111111111111111110) (bvsge (x!64522 lt!340303) #b00000000000000000000000000000000) (bvsge (x!64522 lt!340303) #b00000000000000000000000000000000)))))

(assert (=> b!764792 (=> (not res!517411) (not e!425934))))

(declare-fun b!764793 () Bool)

(assert (=> b!764793 (and (bvsge (index!33626 lt!340303) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340303) (size!20635 lt!340148)))))

(declare-fun res!517412 () Bool)

(assert (=> b!764793 (= res!517412 (= (select (arr!20214 lt!340148) (index!33626 lt!340303)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764793 (=> res!517412 e!425935)))

(declare-fun b!764794 () Bool)

(assert (=> b!764794 (= e!425933 (Intermediate!7814 false (toIndex!0 lt!340151 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101049 c!84077) b!764791))

(assert (= (and d!101049 (not c!84077)) b!764787))

(assert (= (and b!764787 c!84078) b!764794))

(assert (= (and b!764787 (not c!84078)) b!764786))

(assert (= (and d!101049 c!84076) b!764790))

(assert (= (and d!101049 (not c!84076)) b!764792))

(assert (= (and b!764792 res!517411) b!764789))

(assert (= (and b!764789 (not res!517410)) b!764793))

(assert (= (and b!764793 (not res!517412)) b!764788))

(declare-fun m!711093 () Bool)

(assert (=> b!764793 m!711093))

(assert (=> b!764789 m!711093))

(assert (=> b!764786 m!710797))

(declare-fun m!711095 () Bool)

(assert (=> b!764786 m!711095))

(assert (=> b!764786 m!711095))

(declare-fun m!711097 () Bool)

(assert (=> b!764786 m!711097))

(assert (=> b!764788 m!711093))

(assert (=> d!101049 m!710797))

(declare-fun m!711099 () Bool)

(assert (=> d!101049 m!711099))

(assert (=> d!101049 m!710815))

(assert (=> b!764412 d!101049))

(declare-fun d!101057 () Bool)

(declare-fun lt!340308 () (_ BitVec 32))

(declare-fun lt!340307 () (_ BitVec 32))

(assert (=> d!101057 (= lt!340308 (bvmul (bvxor lt!340307 (bvlshr lt!340307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101057 (= lt!340307 ((_ extract 31 0) (bvand (bvxor lt!340151 (bvlshr lt!340151 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101057 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517355 (let ((h!15299 ((_ extract 31 0) (bvand (bvxor lt!340151 (bvlshr lt!340151 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64527 (bvmul (bvxor h!15299 (bvlshr h!15299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64527 (bvlshr x!64527 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517355 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517355 #b00000000000000000000000000000000))))))

(assert (=> d!101057 (= (toIndex!0 lt!340151 mask!3328) (bvand (bvxor lt!340308 (bvlshr lt!340308 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764412 d!101057))

(declare-fun b!764795 () Bool)

(declare-fun e!425938 () SeekEntryResult!7814)

(assert (=> b!764795 (= e!425938 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340151 lt!340148 mask!3328))))

(declare-fun b!764797 () Bool)

(declare-fun lt!340309 () SeekEntryResult!7814)

(assert (=> b!764797 (and (bvsge (index!33626 lt!340309) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340309) (size!20635 lt!340148)))))

(declare-fun e!425940 () Bool)

(assert (=> b!764797 (= e!425940 (= (select (arr!20214 lt!340148) (index!33626 lt!340309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764798 () Bool)

(assert (=> b!764798 (and (bvsge (index!33626 lt!340309) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340309) (size!20635 lt!340148)))))

(declare-fun res!517413 () Bool)

(assert (=> b!764798 (= res!517413 (= (select (arr!20214 lt!340148) (index!33626 lt!340309)) lt!340151))))

(assert (=> b!764798 (=> res!517413 e!425940)))

(declare-fun e!425939 () Bool)

(assert (=> b!764798 (= e!425939 e!425940)))

(declare-fun b!764799 () Bool)

(declare-fun e!425942 () Bool)

(assert (=> b!764799 (= e!425942 (bvsge (x!64522 lt!340309) #b01111111111111111111111111111110))))

(declare-fun b!764796 () Bool)

(declare-fun e!425941 () SeekEntryResult!7814)

(assert (=> b!764796 (= e!425941 e!425938)))

(declare-fun c!84081 () Bool)

(declare-fun lt!340310 () (_ BitVec 64))

(assert (=> b!764796 (= c!84081 (or (= lt!340310 lt!340151) (= (bvadd lt!340310 lt!340310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101059 () Bool)

(assert (=> d!101059 e!425942))

(declare-fun c!84079 () Bool)

(assert (=> d!101059 (= c!84079 (and (is-Intermediate!7814 lt!340309) (undefined!8626 lt!340309)))))

(assert (=> d!101059 (= lt!340309 e!425941)))

(declare-fun c!84080 () Bool)

(assert (=> d!101059 (= c!84080 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101059 (= lt!340310 (select (arr!20214 lt!340148) index!1321))))

(assert (=> d!101059 (validMask!0 mask!3328)))

(assert (=> d!101059 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340151 lt!340148 mask!3328) lt!340309)))

(declare-fun b!764800 () Bool)

(assert (=> b!764800 (= e!425941 (Intermediate!7814 true index!1321 x!1131))))

(declare-fun b!764801 () Bool)

(assert (=> b!764801 (= e!425942 e!425939)))

(declare-fun res!517414 () Bool)

(assert (=> b!764801 (= res!517414 (and (is-Intermediate!7814 lt!340309) (not (undefined!8626 lt!340309)) (bvslt (x!64522 lt!340309) #b01111111111111111111111111111110) (bvsge (x!64522 lt!340309) #b00000000000000000000000000000000) (bvsge (x!64522 lt!340309) x!1131)))))

(assert (=> b!764801 (=> (not res!517414) (not e!425939))))

(declare-fun b!764802 () Bool)

(assert (=> b!764802 (and (bvsge (index!33626 lt!340309) #b00000000000000000000000000000000) (bvslt (index!33626 lt!340309) (size!20635 lt!340148)))))

(declare-fun res!517415 () Bool)

(assert (=> b!764802 (= res!517415 (= (select (arr!20214 lt!340148) (index!33626 lt!340309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764802 (=> res!517415 e!425940)))

(declare-fun b!764803 () Bool)

(assert (=> b!764803 (= e!425938 (Intermediate!7814 false index!1321 x!1131))))

(assert (= (and d!101059 c!84080) b!764800))

(assert (= (and d!101059 (not c!84080)) b!764796))

(assert (= (and b!764796 c!84081) b!764803))

(assert (= (and b!764796 (not c!84081)) b!764795))

(assert (= (and d!101059 c!84079) b!764799))

(assert (= (and d!101059 (not c!84079)) b!764801))

(assert (= (and b!764801 res!517414) b!764798))

(assert (= (and b!764798 (not res!517413)) b!764802))

(assert (= (and b!764802 (not res!517415)) b!764797))

(declare-fun m!711101 () Bool)

(assert (=> b!764802 m!711101))

(assert (=> b!764798 m!711101))

(assert (=> b!764795 m!710945))

(assert (=> b!764795 m!710945))

(declare-fun m!711103 () Bool)

(assert (=> b!764795 m!711103))

(assert (=> b!764797 m!711101))

(declare-fun m!711105 () Bool)

(assert (=> d!101059 m!711105))

(assert (=> d!101059 m!710815))

(assert (=> b!764412 d!101059))

(declare-fun d!101063 () Bool)

(declare-fun res!517435 () Bool)

(declare-fun e!425971 () Bool)

(assert (=> d!101063 (=> res!517435 e!425971)))

(assert (=> d!101063 (= res!517435 (bvsge #b00000000000000000000000000000000 (size!20635 a!3186)))))

(assert (=> d!101063 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14213) e!425971)))

(declare-fun b!764842 () Bool)

(declare-fun e!425972 () Bool)

(declare-fun contains!4075 (List!14216 (_ BitVec 64)) Bool)

(assert (=> b!764842 (= e!425972 (contains!4075 Nil!14213 (select (arr!20214 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!764843 () Bool)

(declare-fun e!425969 () Bool)

(declare-fun e!425970 () Bool)

(assert (=> b!764843 (= e!425969 e!425970)))

(declare-fun c!84092 () Bool)

(assert (=> b!764843 (= c!84092 (validKeyInArray!0 (select (arr!20214 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!764844 () Bool)

(assert (=> b!764844 (= e!425971 e!425969)))

(declare-fun res!517434 () Bool)

(assert (=> b!764844 (=> (not res!517434) (not e!425969))))

(assert (=> b!764844 (= res!517434 (not e!425972))))

(declare-fun res!517436 () Bool)

(assert (=> b!764844 (=> (not res!517436) (not e!425972))))

(assert (=> b!764844 (= res!517436 (validKeyInArray!0 (select (arr!20214 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!764845 () Bool)

(declare-fun call!35014 () Bool)

(assert (=> b!764845 (= e!425970 call!35014)))

(declare-fun b!764846 () Bool)

(assert (=> b!764846 (= e!425970 call!35014)))

(declare-fun bm!35011 () Bool)

(assert (=> bm!35011 (= call!35014 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84092 (Cons!14212 (select (arr!20214 a!3186) #b00000000000000000000000000000000) Nil!14213) Nil!14213)))))

(assert (= (and d!101063 (not res!517435)) b!764844))

(assert (= (and b!764844 res!517436) b!764842))

(assert (= (and b!764844 res!517434) b!764843))

(assert (= (and b!764843 c!84092) b!764845))

(assert (= (and b!764843 (not c!84092)) b!764846))

(assert (= (or b!764845 b!764846) bm!35011))

(assert (=> b!764842 m!710939))

(assert (=> b!764842 m!710939))

(declare-fun m!711121 () Bool)

(assert (=> b!764842 m!711121))

(assert (=> b!764843 m!710939))

(assert (=> b!764843 m!710939))

(assert (=> b!764843 m!710979))

(assert (=> b!764844 m!710939))

(assert (=> b!764844 m!710939))

(assert (=> b!764844 m!710979))

(assert (=> bm!35011 m!710939))

(declare-fun m!711123 () Bool)

(assert (=> bm!35011 m!711123))

(assert (=> b!764415 d!101063))

(push 1)

(assert (not b!764795))

(assert (not b!764843))

(assert (not b!764730))

(assert (not d!100991))

(assert (not b!764571))

(assert (not d!101039))

(assert (not b!764731))

(assert (not b!764727))

(assert (not bm!35006))

(assert (not bm!35011))

(assert (not d!101059))

(assert (not b!764641))

(assert (not d!101011))

(assert (not b!764603))

(assert (not d!101035))

(assert (not b!764844))

(assert (not b!764842))

(assert (not bm!35004))

(assert (not b!764604))

(assert (not b!764786))

(assert (not b!764780))

(assert (not d!101049))

(assert (not d!101001))

(assert (not b!764642))

(assert (not d!101043))

(assert (not b!764696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

