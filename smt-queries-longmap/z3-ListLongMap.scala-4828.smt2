; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66310 () Bool)

(assert start!66310)

(declare-fun b!764454 () Bool)

(declare-fun res!517291 () Bool)

(declare-fun e!425757 () Bool)

(assert (=> b!764454 (=> (not res!517291) (not e!425757))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42215 0))(
  ( (array!42216 (arr!20215 (Array (_ BitVec 32) (_ BitVec 64))) (size!20636 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42215)

(assert (=> b!764454 (= res!517291 (and (= (size!20636 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20636 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20636 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764455 () Bool)

(declare-fun e!425752 () Bool)

(assert (=> b!764455 (= e!425757 e!425752)))

(declare-fun res!517285 () Bool)

(assert (=> b!764455 (=> (not res!517285) (not e!425752))))

(declare-datatypes ((SeekEntryResult!7815 0))(
  ( (MissingZero!7815 (index!33628 (_ BitVec 32))) (Found!7815 (index!33629 (_ BitVec 32))) (Intermediate!7815 (undefined!8627 Bool) (index!33630 (_ BitVec 32)) (x!64523 (_ BitVec 32))) (Undefined!7815) (MissingVacant!7815 (index!33631 (_ BitVec 32))) )
))
(declare-fun lt!340163 () SeekEntryResult!7815)

(assert (=> b!764455 (= res!517285 (or (= lt!340163 (MissingZero!7815 i!1173)) (= lt!340163 (MissingVacant!7815 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42215 (_ BitVec 32)) SeekEntryResult!7815)

(assert (=> b!764455 (= lt!340163 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764456 () Bool)

(declare-fun res!517289 () Bool)

(declare-fun e!425755 () Bool)

(assert (=> b!764456 (=> (not res!517289) (not e!425755))))

(declare-fun e!425754 () Bool)

(assert (=> b!764456 (= res!517289 e!425754)))

(declare-fun c!83971 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764456 (= c!83971 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764457 () Bool)

(declare-fun res!517293 () Bool)

(assert (=> b!764457 (=> (not res!517293) (not e!425755))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!764457 (= res!517293 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20215 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764458 () Bool)

(declare-fun res!517290 () Bool)

(assert (=> b!764458 (=> (not res!517290) (not e!425752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42215 (_ BitVec 32)) Bool)

(assert (=> b!764458 (= res!517290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!764459 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42215 (_ BitVec 32)) SeekEntryResult!7815)

(assert (=> b!764459 (= e!425754 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) (Found!7815 j!159)))))

(declare-fun b!764460 () Bool)

(declare-fun res!517295 () Bool)

(assert (=> b!764460 (=> (not res!517295) (not e!425752))))

(assert (=> b!764460 (= res!517295 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20636 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20636 a!3186))))))

(declare-fun b!764461 () Bool)

(assert (=> b!764461 (= e!425752 e!425755)))

(declare-fun res!517296 () Bool)

(assert (=> b!764461 (=> (not res!517296) (not e!425755))))

(declare-fun lt!340164 () SeekEntryResult!7815)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42215 (_ BitVec 32)) SeekEntryResult!7815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764461 (= res!517296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) (select (arr!20215 a!3186) j!159) a!3186 mask!3328) lt!340164))))

(assert (=> b!764461 (= lt!340164 (Intermediate!7815 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764462 () Bool)

(declare-fun res!517286 () Bool)

(assert (=> b!764462 (=> (not res!517286) (not e!425752))))

(declare-datatypes ((List!14217 0))(
  ( (Nil!14214) (Cons!14213 (h!15297 (_ BitVec 64)) (t!20532 List!14217)) )
))
(declare-fun arrayNoDuplicates!0 (array!42215 (_ BitVec 32) List!14217) Bool)

(assert (=> b!764462 (= res!517286 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14214))))

(declare-fun b!764464 () Bool)

(assert (=> b!764464 (= e!425754 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) lt!340164))))

(declare-fun b!764465 () Bool)

(declare-fun res!517288 () Bool)

(assert (=> b!764465 (=> (not res!517288) (not e!425757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764465 (= res!517288 (validKeyInArray!0 (select (arr!20215 a!3186) j!159)))))

(declare-fun e!425756 () Bool)

(declare-fun b!764466 () Bool)

(assert (=> b!764466 (= e!425756 (not (= (seekEntryOrOpen!0 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) (Found!7815 j!159))))))

(assert (=> b!764466 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26356 0))(
  ( (Unit!26357) )
))
(declare-fun lt!340162 () Unit!26356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26356)

(assert (=> b!764466 (= lt!340162 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764467 () Bool)

(declare-fun res!517297 () Bool)

(assert (=> b!764467 (=> (not res!517297) (not e!425757))))

(declare-fun arrayContainsKey!0 (array!42215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764467 (= res!517297 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764468 () Bool)

(assert (=> b!764468 (= e!425755 e!425756)))

(declare-fun res!517294 () Bool)

(assert (=> b!764468 (=> (not res!517294) (not e!425756))))

(declare-fun lt!340165 () (_ BitVec 64))

(declare-fun lt!340166 () array!42215)

(assert (=> b!764468 (= res!517294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340165 mask!3328) lt!340165 lt!340166 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340165 lt!340166 mask!3328)))))

(assert (=> b!764468 (= lt!340165 (select (store (arr!20215 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764468 (= lt!340166 (array!42216 (store (arr!20215 a!3186) i!1173 k0!2102) (size!20636 a!3186)))))

(declare-fun res!517287 () Bool)

(assert (=> start!66310 (=> (not res!517287) (not e!425757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66310 (= res!517287 (validMask!0 mask!3328))))

(assert (=> start!66310 e!425757))

(assert (=> start!66310 true))

(declare-fun array_inv!16011 (array!42215) Bool)

(assert (=> start!66310 (array_inv!16011 a!3186)))

(declare-fun b!764463 () Bool)

(declare-fun res!517292 () Bool)

(assert (=> b!764463 (=> (not res!517292) (not e!425757))))

(assert (=> b!764463 (= res!517292 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66310 res!517287) b!764454))

(assert (= (and b!764454 res!517291) b!764465))

(assert (= (and b!764465 res!517288) b!764463))

(assert (= (and b!764463 res!517292) b!764467))

(assert (= (and b!764467 res!517297) b!764455))

(assert (= (and b!764455 res!517285) b!764458))

(assert (= (and b!764458 res!517290) b!764462))

(assert (= (and b!764462 res!517286) b!764460))

(assert (= (and b!764460 res!517295) b!764461))

(assert (= (and b!764461 res!517296) b!764457))

(assert (= (and b!764457 res!517293) b!764456))

(assert (= (and b!764456 c!83971) b!764464))

(assert (= (and b!764456 (not c!83971)) b!764459))

(assert (= (and b!764456 res!517289) b!764468))

(assert (= (and b!764468 res!517294) b!764466))

(declare-fun m!710825 () Bool)

(assert (=> b!764462 m!710825))

(declare-fun m!710827 () Bool)

(assert (=> b!764467 m!710827))

(declare-fun m!710829 () Bool)

(assert (=> b!764461 m!710829))

(assert (=> b!764461 m!710829))

(declare-fun m!710831 () Bool)

(assert (=> b!764461 m!710831))

(assert (=> b!764461 m!710831))

(assert (=> b!764461 m!710829))

(declare-fun m!710833 () Bool)

(assert (=> b!764461 m!710833))

(declare-fun m!710835 () Bool)

(assert (=> b!764468 m!710835))

(declare-fun m!710837 () Bool)

(assert (=> b!764468 m!710837))

(declare-fun m!710839 () Bool)

(assert (=> b!764468 m!710839))

(declare-fun m!710841 () Bool)

(assert (=> b!764468 m!710841))

(declare-fun m!710843 () Bool)

(assert (=> b!764468 m!710843))

(assert (=> b!764468 m!710841))

(declare-fun m!710845 () Bool)

(assert (=> start!66310 m!710845))

(declare-fun m!710847 () Bool)

(assert (=> start!66310 m!710847))

(assert (=> b!764464 m!710829))

(assert (=> b!764464 m!710829))

(declare-fun m!710849 () Bool)

(assert (=> b!764464 m!710849))

(declare-fun m!710851 () Bool)

(assert (=> b!764463 m!710851))

(assert (=> b!764465 m!710829))

(assert (=> b!764465 m!710829))

(declare-fun m!710853 () Bool)

(assert (=> b!764465 m!710853))

(declare-fun m!710855 () Bool)

(assert (=> b!764457 m!710855))

(assert (=> b!764459 m!710829))

(assert (=> b!764459 m!710829))

(declare-fun m!710857 () Bool)

(assert (=> b!764459 m!710857))

(assert (=> b!764466 m!710829))

(assert (=> b!764466 m!710829))

(declare-fun m!710859 () Bool)

(assert (=> b!764466 m!710859))

(declare-fun m!710861 () Bool)

(assert (=> b!764466 m!710861))

(declare-fun m!710863 () Bool)

(assert (=> b!764466 m!710863))

(declare-fun m!710865 () Bool)

(assert (=> b!764458 m!710865))

(declare-fun m!710867 () Bool)

(assert (=> b!764455 m!710867))

(check-sat (not b!764461) (not b!764462) (not b!764463) (not b!764459) (not b!764458) (not b!764464) (not b!764466) (not b!764455) (not b!764467) (not b!764468) (not b!764465) (not start!66310))
(check-sat)
(get-model)

(declare-fun b!764532 () Bool)

(declare-fun lt!340186 () SeekEntryResult!7815)

(assert (=> b!764532 (and (bvsge (index!33630 lt!340186) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340186) (size!20636 a!3186)))))

(declare-fun res!517344 () Bool)

(assert (=> b!764532 (= res!517344 (= (select (arr!20215 a!3186) (index!33630 lt!340186)) (select (arr!20215 a!3186) j!159)))))

(declare-fun e!425790 () Bool)

(assert (=> b!764532 (=> res!517344 e!425790)))

(declare-fun e!425789 () Bool)

(assert (=> b!764532 (= e!425789 e!425790)))

(declare-fun b!764533 () Bool)

(declare-fun e!425788 () SeekEntryResult!7815)

(declare-fun e!425787 () SeekEntryResult!7815)

(assert (=> b!764533 (= e!425788 e!425787)))

(declare-fun c!83982 () Bool)

(declare-fun lt!340187 () (_ BitVec 64))

(assert (=> b!764533 (= c!83982 (or (= lt!340187 (select (arr!20215 a!3186) j!159)) (= (bvadd lt!340187 lt!340187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764534 () Bool)

(declare-fun e!425786 () Bool)

(assert (=> b!764534 (= e!425786 (bvsge (x!64523 lt!340186) #b01111111111111111111111111111110))))

(declare-fun b!764535 () Bool)

(assert (=> b!764535 (= e!425786 e!425789)))

(declare-fun res!517343 () Bool)

(get-info :version)

(assert (=> b!764535 (= res!517343 (and ((_ is Intermediate!7815) lt!340186) (not (undefined!8627 lt!340186)) (bvslt (x!64523 lt!340186) #b01111111111111111111111111111110) (bvsge (x!64523 lt!340186) #b00000000000000000000000000000000) (bvsge (x!64523 lt!340186) x!1131)))))

(assert (=> b!764535 (=> (not res!517343) (not e!425789))))

(declare-fun b!764537 () Bool)

(assert (=> b!764537 (and (bvsge (index!33630 lt!340186) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340186) (size!20636 a!3186)))))

(declare-fun res!517345 () Bool)

(assert (=> b!764537 (= res!517345 (= (select (arr!20215 a!3186) (index!33630 lt!340186)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764537 (=> res!517345 e!425790)))

(declare-fun b!764538 () Bool)

(assert (=> b!764538 (and (bvsge (index!33630 lt!340186) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340186) (size!20636 a!3186)))))

(assert (=> b!764538 (= e!425790 (= (select (arr!20215 a!3186) (index!33630 lt!340186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764539 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764539 (= e!425787 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20215 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764540 () Bool)

(assert (=> b!764540 (= e!425787 (Intermediate!7815 false index!1321 x!1131))))

(declare-fun b!764536 () Bool)

(assert (=> b!764536 (= e!425788 (Intermediate!7815 true index!1321 x!1131))))

(declare-fun d!100979 () Bool)

(assert (=> d!100979 e!425786))

(declare-fun c!83981 () Bool)

(assert (=> d!100979 (= c!83981 (and ((_ is Intermediate!7815) lt!340186) (undefined!8627 lt!340186)))))

(assert (=> d!100979 (= lt!340186 e!425788)))

(declare-fun c!83983 () Bool)

(assert (=> d!100979 (= c!83983 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100979 (= lt!340187 (select (arr!20215 a!3186) index!1321))))

(assert (=> d!100979 (validMask!0 mask!3328)))

(assert (=> d!100979 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) lt!340186)))

(assert (= (and d!100979 c!83983) b!764536))

(assert (= (and d!100979 (not c!83983)) b!764533))

(assert (= (and b!764533 c!83982) b!764540))

(assert (= (and b!764533 (not c!83982)) b!764539))

(assert (= (and d!100979 c!83981) b!764534))

(assert (= (and d!100979 (not c!83981)) b!764535))

(assert (= (and b!764535 res!517343) b!764532))

(assert (= (and b!764532 (not res!517344)) b!764537))

(assert (= (and b!764537 (not res!517345)) b!764538))

(declare-fun m!710913 () Bool)

(assert (=> b!764532 m!710913))

(assert (=> b!764537 m!710913))

(declare-fun m!710915 () Bool)

(assert (=> b!764539 m!710915))

(assert (=> b!764539 m!710915))

(assert (=> b!764539 m!710829))

(declare-fun m!710917 () Bool)

(assert (=> b!764539 m!710917))

(declare-fun m!710919 () Bool)

(assert (=> d!100979 m!710919))

(assert (=> d!100979 m!710845))

(assert (=> b!764538 m!710913))

(assert (=> b!764464 d!100979))

(declare-fun d!100981 () Bool)

(assert (=> d!100981 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!764463 d!100981))

(declare-fun d!100983 () Bool)

(assert (=> d!100983 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66310 d!100983))

(declare-fun d!100985 () Bool)

(assert (=> d!100985 (= (array_inv!16011 a!3186) (bvsge (size!20636 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66310 d!100985))

(declare-fun d!100987 () Bool)

(assert (=> d!100987 (= (validKeyInArray!0 (select (arr!20215 a!3186) j!159)) (and (not (= (select (arr!20215 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20215 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!764465 d!100987))

(declare-fun b!764580 () Bool)

(declare-fun e!425813 () SeekEntryResult!7815)

(declare-fun lt!340201 () SeekEntryResult!7815)

(assert (=> b!764580 (= e!425813 (MissingZero!7815 (index!33630 lt!340201)))))

(declare-fun b!764581 () Bool)

(declare-fun e!425814 () SeekEntryResult!7815)

(assert (=> b!764581 (= e!425814 (Found!7815 (index!33630 lt!340201)))))

(declare-fun b!764582 () Bool)

(declare-fun e!425812 () SeekEntryResult!7815)

(assert (=> b!764582 (= e!425812 Undefined!7815)))

(declare-fun b!764583 () Bool)

(assert (=> b!764583 (= e!425812 e!425814)))

(declare-fun lt!340200 () (_ BitVec 64))

(assert (=> b!764583 (= lt!340200 (select (arr!20215 a!3186) (index!33630 lt!340201)))))

(declare-fun c!84001 () Bool)

(assert (=> b!764583 (= c!84001 (= lt!340200 (select (arr!20215 a!3186) j!159)))))

(declare-fun b!764584 () Bool)

(declare-fun c!84000 () Bool)

(assert (=> b!764584 (= c!84000 (= lt!340200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764584 (= e!425814 e!425813)))

(declare-fun d!100989 () Bool)

(declare-fun lt!340202 () SeekEntryResult!7815)

(assert (=> d!100989 (and (or ((_ is Undefined!7815) lt!340202) (not ((_ is Found!7815) lt!340202)) (and (bvsge (index!33629 lt!340202) #b00000000000000000000000000000000) (bvslt (index!33629 lt!340202) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340202) ((_ is Found!7815) lt!340202) (not ((_ is MissingZero!7815) lt!340202)) (and (bvsge (index!33628 lt!340202) #b00000000000000000000000000000000) (bvslt (index!33628 lt!340202) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340202) ((_ is Found!7815) lt!340202) ((_ is MissingZero!7815) lt!340202) (not ((_ is MissingVacant!7815) lt!340202)) (and (bvsge (index!33631 lt!340202) #b00000000000000000000000000000000) (bvslt (index!33631 lt!340202) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340202) (ite ((_ is Found!7815) lt!340202) (= (select (arr!20215 a!3186) (index!33629 lt!340202)) (select (arr!20215 a!3186) j!159)) (ite ((_ is MissingZero!7815) lt!340202) (= (select (arr!20215 a!3186) (index!33628 lt!340202)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7815) lt!340202) (= (select (arr!20215 a!3186) (index!33631 lt!340202)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100989 (= lt!340202 e!425812)))

(declare-fun c!83999 () Bool)

(assert (=> d!100989 (= c!83999 (and ((_ is Intermediate!7815) lt!340201) (undefined!8627 lt!340201)))))

(assert (=> d!100989 (= lt!340201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) (select (arr!20215 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100989 (validMask!0 mask!3328)))

(assert (=> d!100989 (= (seekEntryOrOpen!0 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) lt!340202)))

(declare-fun b!764585 () Bool)

(assert (=> b!764585 (= e!425813 (seekKeyOrZeroReturnVacant!0 (x!64523 lt!340201) (index!33630 lt!340201) (index!33630 lt!340201) (select (arr!20215 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100989 c!83999) b!764582))

(assert (= (and d!100989 (not c!83999)) b!764583))

(assert (= (and b!764583 c!84001) b!764581))

(assert (= (and b!764583 (not c!84001)) b!764584))

(assert (= (and b!764584 c!84000) b!764580))

(assert (= (and b!764584 (not c!84000)) b!764585))

(declare-fun m!710929 () Bool)

(assert (=> b!764583 m!710929))

(assert (=> d!100989 m!710831))

(assert (=> d!100989 m!710829))

(assert (=> d!100989 m!710833))

(assert (=> d!100989 m!710845))

(assert (=> d!100989 m!710829))

(assert (=> d!100989 m!710831))

(declare-fun m!710931 () Bool)

(assert (=> d!100989 m!710931))

(declare-fun m!710933 () Bool)

(assert (=> d!100989 m!710933))

(declare-fun m!710935 () Bool)

(assert (=> d!100989 m!710935))

(assert (=> b!764585 m!710829))

(declare-fun m!710937 () Bool)

(assert (=> b!764585 m!710937))

(assert (=> b!764466 d!100989))

(declare-fun d!100997 () Bool)

(declare-fun res!517373 () Bool)

(declare-fun e!425849 () Bool)

(assert (=> d!100997 (=> res!517373 e!425849)))

(assert (=> d!100997 (= res!517373 (bvsge j!159 (size!20636 a!3186)))))

(assert (=> d!100997 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!425849)))

(declare-fun bm!35003 () Bool)

(declare-fun call!35006 () Bool)

(assert (=> bm!35003 (= call!35006 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!764635 () Bool)

(declare-fun e!425848 () Bool)

(declare-fun e!425847 () Bool)

(assert (=> b!764635 (= e!425848 e!425847)))

(declare-fun lt!340234 () (_ BitVec 64))

(assert (=> b!764635 (= lt!340234 (select (arr!20215 a!3186) j!159))))

(declare-fun lt!340232 () Unit!26356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42215 (_ BitVec 64) (_ BitVec 32)) Unit!26356)

(assert (=> b!764635 (= lt!340232 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340234 j!159))))

(assert (=> b!764635 (arrayContainsKey!0 a!3186 lt!340234 #b00000000000000000000000000000000)))

(declare-fun lt!340233 () Unit!26356)

(assert (=> b!764635 (= lt!340233 lt!340232)))

(declare-fun res!517374 () Bool)

(assert (=> b!764635 (= res!517374 (= (seekEntryOrOpen!0 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) (Found!7815 j!159)))))

(assert (=> b!764635 (=> (not res!517374) (not e!425847))))

(declare-fun b!764636 () Bool)

(assert (=> b!764636 (= e!425847 call!35006)))

(declare-fun b!764637 () Bool)

(assert (=> b!764637 (= e!425849 e!425848)))

(declare-fun c!84018 () Bool)

(assert (=> b!764637 (= c!84018 (validKeyInArray!0 (select (arr!20215 a!3186) j!159)))))

(declare-fun b!764638 () Bool)

(assert (=> b!764638 (= e!425848 call!35006)))

(assert (= (and d!100997 (not res!517373)) b!764637))

(assert (= (and b!764637 c!84018) b!764635))

(assert (= (and b!764637 (not c!84018)) b!764638))

(assert (= (and b!764635 res!517374) b!764636))

(assert (= (or b!764636 b!764638) bm!35003))

(declare-fun m!710965 () Bool)

(assert (=> bm!35003 m!710965))

(assert (=> b!764635 m!710829))

(declare-fun m!710967 () Bool)

(assert (=> b!764635 m!710967))

(declare-fun m!710969 () Bool)

(assert (=> b!764635 m!710969))

(assert (=> b!764635 m!710829))

(assert (=> b!764635 m!710859))

(assert (=> b!764637 m!710829))

(assert (=> b!764637 m!710829))

(assert (=> b!764637 m!710853))

(assert (=> b!764466 d!100997))

(declare-fun d!101009 () Bool)

(assert (=> d!101009 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340240 () Unit!26356)

(declare-fun choose!38 (array!42215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26356)

(assert (=> d!101009 (= lt!340240 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101009 (validMask!0 mask!3328)))

(assert (=> d!101009 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340240)))

(declare-fun bs!21477 () Bool)

(assert (= bs!21477 d!101009))

(assert (=> bs!21477 m!710861))

(declare-fun m!710981 () Bool)

(assert (=> bs!21477 m!710981))

(assert (=> bs!21477 m!710845))

(assert (=> b!764466 d!101009))

(declare-fun b!764643 () Bool)

(declare-fun e!425854 () SeekEntryResult!7815)

(declare-fun lt!340242 () SeekEntryResult!7815)

(assert (=> b!764643 (= e!425854 (MissingZero!7815 (index!33630 lt!340242)))))

(declare-fun b!764644 () Bool)

(declare-fun e!425855 () SeekEntryResult!7815)

(assert (=> b!764644 (= e!425855 (Found!7815 (index!33630 lt!340242)))))

(declare-fun b!764645 () Bool)

(declare-fun e!425853 () SeekEntryResult!7815)

(assert (=> b!764645 (= e!425853 Undefined!7815)))

(declare-fun b!764646 () Bool)

(assert (=> b!764646 (= e!425853 e!425855)))

(declare-fun lt!340241 () (_ BitVec 64))

(assert (=> b!764646 (= lt!340241 (select (arr!20215 a!3186) (index!33630 lt!340242)))))

(declare-fun c!84022 () Bool)

(assert (=> b!764646 (= c!84022 (= lt!340241 k0!2102))))

(declare-fun b!764647 () Bool)

(declare-fun c!84021 () Bool)

(assert (=> b!764647 (= c!84021 (= lt!340241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764647 (= e!425855 e!425854)))

(declare-fun d!101013 () Bool)

(declare-fun lt!340243 () SeekEntryResult!7815)

(assert (=> d!101013 (and (or ((_ is Undefined!7815) lt!340243) (not ((_ is Found!7815) lt!340243)) (and (bvsge (index!33629 lt!340243) #b00000000000000000000000000000000) (bvslt (index!33629 lt!340243) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340243) ((_ is Found!7815) lt!340243) (not ((_ is MissingZero!7815) lt!340243)) (and (bvsge (index!33628 lt!340243) #b00000000000000000000000000000000) (bvslt (index!33628 lt!340243) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340243) ((_ is Found!7815) lt!340243) ((_ is MissingZero!7815) lt!340243) (not ((_ is MissingVacant!7815) lt!340243)) (and (bvsge (index!33631 lt!340243) #b00000000000000000000000000000000) (bvslt (index!33631 lt!340243) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340243) (ite ((_ is Found!7815) lt!340243) (= (select (arr!20215 a!3186) (index!33629 lt!340243)) k0!2102) (ite ((_ is MissingZero!7815) lt!340243) (= (select (arr!20215 a!3186) (index!33628 lt!340243)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7815) lt!340243) (= (select (arr!20215 a!3186) (index!33631 lt!340243)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101013 (= lt!340243 e!425853)))

(declare-fun c!84020 () Bool)

(assert (=> d!101013 (= c!84020 (and ((_ is Intermediate!7815) lt!340242) (undefined!8627 lt!340242)))))

(assert (=> d!101013 (= lt!340242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101013 (validMask!0 mask!3328)))

(assert (=> d!101013 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!340243)))

(declare-fun b!764648 () Bool)

(assert (=> b!764648 (= e!425854 (seekKeyOrZeroReturnVacant!0 (x!64523 lt!340242) (index!33630 lt!340242) (index!33630 lt!340242) k0!2102 a!3186 mask!3328))))

(assert (= (and d!101013 c!84020) b!764645))

(assert (= (and d!101013 (not c!84020)) b!764646))

(assert (= (and b!764646 c!84022) b!764644))

(assert (= (and b!764646 (not c!84022)) b!764647))

(assert (= (and b!764647 c!84021) b!764643))

(assert (= (and b!764647 (not c!84021)) b!764648))

(declare-fun m!710983 () Bool)

(assert (=> b!764646 m!710983))

(declare-fun m!710985 () Bool)

(assert (=> d!101013 m!710985))

(declare-fun m!710987 () Bool)

(assert (=> d!101013 m!710987))

(assert (=> d!101013 m!710845))

(assert (=> d!101013 m!710985))

(declare-fun m!710989 () Bool)

(assert (=> d!101013 m!710989))

(declare-fun m!710991 () Bool)

(assert (=> d!101013 m!710991))

(declare-fun m!710993 () Bool)

(assert (=> d!101013 m!710993))

(declare-fun m!710995 () Bool)

(assert (=> b!764648 m!710995))

(assert (=> b!764455 d!101013))

(declare-fun b!764649 () Bool)

(declare-fun lt!340244 () SeekEntryResult!7815)

(assert (=> b!764649 (and (bvsge (index!33630 lt!340244) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340244) (size!20636 lt!340166)))))

(declare-fun res!517378 () Bool)

(assert (=> b!764649 (= res!517378 (= (select (arr!20215 lt!340166) (index!33630 lt!340244)) lt!340165))))

(declare-fun e!425860 () Bool)

(assert (=> b!764649 (=> res!517378 e!425860)))

(declare-fun e!425859 () Bool)

(assert (=> b!764649 (= e!425859 e!425860)))

(declare-fun b!764650 () Bool)

(declare-fun e!425858 () SeekEntryResult!7815)

(declare-fun e!425857 () SeekEntryResult!7815)

(assert (=> b!764650 (= e!425858 e!425857)))

(declare-fun c!84024 () Bool)

(declare-fun lt!340245 () (_ BitVec 64))

(assert (=> b!764650 (= c!84024 (or (= lt!340245 lt!340165) (= (bvadd lt!340245 lt!340245) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764651 () Bool)

(declare-fun e!425856 () Bool)

(assert (=> b!764651 (= e!425856 (bvsge (x!64523 lt!340244) #b01111111111111111111111111111110))))

(declare-fun b!764652 () Bool)

(assert (=> b!764652 (= e!425856 e!425859)))

(declare-fun res!517377 () Bool)

(assert (=> b!764652 (= res!517377 (and ((_ is Intermediate!7815) lt!340244) (not (undefined!8627 lt!340244)) (bvslt (x!64523 lt!340244) #b01111111111111111111111111111110) (bvsge (x!64523 lt!340244) #b00000000000000000000000000000000) (bvsge (x!64523 lt!340244) #b00000000000000000000000000000000)))))

(assert (=> b!764652 (=> (not res!517377) (not e!425859))))

(declare-fun b!764654 () Bool)

(assert (=> b!764654 (and (bvsge (index!33630 lt!340244) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340244) (size!20636 lt!340166)))))

(declare-fun res!517379 () Bool)

(assert (=> b!764654 (= res!517379 (= (select (arr!20215 lt!340166) (index!33630 lt!340244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764654 (=> res!517379 e!425860)))

(declare-fun b!764655 () Bool)

(assert (=> b!764655 (and (bvsge (index!33630 lt!340244) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340244) (size!20636 lt!340166)))))

(assert (=> b!764655 (= e!425860 (= (select (arr!20215 lt!340166) (index!33630 lt!340244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764656 () Bool)

(assert (=> b!764656 (= e!425857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340165 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340165 lt!340166 mask!3328))))

(declare-fun b!764657 () Bool)

(assert (=> b!764657 (= e!425857 (Intermediate!7815 false (toIndex!0 lt!340165 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764653 () Bool)

(assert (=> b!764653 (= e!425858 (Intermediate!7815 true (toIndex!0 lt!340165 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101015 () Bool)

(assert (=> d!101015 e!425856))

(declare-fun c!84023 () Bool)

(assert (=> d!101015 (= c!84023 (and ((_ is Intermediate!7815) lt!340244) (undefined!8627 lt!340244)))))

(assert (=> d!101015 (= lt!340244 e!425858)))

(declare-fun c!84025 () Bool)

(assert (=> d!101015 (= c!84025 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101015 (= lt!340245 (select (arr!20215 lt!340166) (toIndex!0 lt!340165 mask!3328)))))

(assert (=> d!101015 (validMask!0 mask!3328)))

(assert (=> d!101015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340165 mask!3328) lt!340165 lt!340166 mask!3328) lt!340244)))

(assert (= (and d!101015 c!84025) b!764653))

(assert (= (and d!101015 (not c!84025)) b!764650))

(assert (= (and b!764650 c!84024) b!764657))

(assert (= (and b!764650 (not c!84024)) b!764656))

(assert (= (and d!101015 c!84023) b!764651))

(assert (= (and d!101015 (not c!84023)) b!764652))

(assert (= (and b!764652 res!517377) b!764649))

(assert (= (and b!764649 (not res!517378)) b!764654))

(assert (= (and b!764654 (not res!517379)) b!764655))

(declare-fun m!710997 () Bool)

(assert (=> b!764649 m!710997))

(assert (=> b!764654 m!710997))

(assert (=> b!764656 m!710841))

(declare-fun m!710999 () Bool)

(assert (=> b!764656 m!710999))

(assert (=> b!764656 m!710999))

(declare-fun m!711001 () Bool)

(assert (=> b!764656 m!711001))

(assert (=> d!101015 m!710841))

(declare-fun m!711003 () Bool)

(assert (=> d!101015 m!711003))

(assert (=> d!101015 m!710845))

(assert (=> b!764655 m!710997))

(assert (=> b!764468 d!101015))

(declare-fun d!101017 () Bool)

(declare-fun lt!340261 () (_ BitVec 32))

(declare-fun lt!340260 () (_ BitVec 32))

(assert (=> d!101017 (= lt!340261 (bvmul (bvxor lt!340260 (bvlshr lt!340260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101017 (= lt!340260 ((_ extract 31 0) (bvand (bvxor lt!340165 (bvlshr lt!340165 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101017 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517380 (let ((h!15300 ((_ extract 31 0) (bvand (bvxor lt!340165 (bvlshr lt!340165 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64528 (bvmul (bvxor h!15300 (bvlshr h!15300 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64528 (bvlshr x!64528 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517380 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517380 #b00000000000000000000000000000000))))))

(assert (=> d!101017 (= (toIndex!0 lt!340165 mask!3328) (bvand (bvxor lt!340261 (bvlshr lt!340261 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764468 d!101017))

(declare-fun b!764678 () Bool)

(declare-fun lt!340262 () SeekEntryResult!7815)

(assert (=> b!764678 (and (bvsge (index!33630 lt!340262) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340262) (size!20636 lt!340166)))))

(declare-fun res!517382 () Bool)

(assert (=> b!764678 (= res!517382 (= (select (arr!20215 lt!340166) (index!33630 lt!340262)) lt!340165))))

(declare-fun e!425875 () Bool)

(assert (=> b!764678 (=> res!517382 e!425875)))

(declare-fun e!425874 () Bool)

(assert (=> b!764678 (= e!425874 e!425875)))

(declare-fun b!764679 () Bool)

(declare-fun e!425873 () SeekEntryResult!7815)

(declare-fun e!425872 () SeekEntryResult!7815)

(assert (=> b!764679 (= e!425873 e!425872)))

(declare-fun c!84037 () Bool)

(declare-fun lt!340263 () (_ BitVec 64))

(assert (=> b!764679 (= c!84037 (or (= lt!340263 lt!340165) (= (bvadd lt!340263 lt!340263) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764680 () Bool)

(declare-fun e!425871 () Bool)

(assert (=> b!764680 (= e!425871 (bvsge (x!64523 lt!340262) #b01111111111111111111111111111110))))

(declare-fun b!764681 () Bool)

(assert (=> b!764681 (= e!425871 e!425874)))

(declare-fun res!517381 () Bool)

(assert (=> b!764681 (= res!517381 (and ((_ is Intermediate!7815) lt!340262) (not (undefined!8627 lt!340262)) (bvslt (x!64523 lt!340262) #b01111111111111111111111111111110) (bvsge (x!64523 lt!340262) #b00000000000000000000000000000000) (bvsge (x!64523 lt!340262) x!1131)))))

(assert (=> b!764681 (=> (not res!517381) (not e!425874))))

(declare-fun b!764683 () Bool)

(assert (=> b!764683 (and (bvsge (index!33630 lt!340262) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340262) (size!20636 lt!340166)))))

(declare-fun res!517383 () Bool)

(assert (=> b!764683 (= res!517383 (= (select (arr!20215 lt!340166) (index!33630 lt!340262)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764683 (=> res!517383 e!425875)))

(declare-fun b!764684 () Bool)

(assert (=> b!764684 (and (bvsge (index!33630 lt!340262) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340262) (size!20636 lt!340166)))))

(assert (=> b!764684 (= e!425875 (= (select (arr!20215 lt!340166) (index!33630 lt!340262)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764685 () Bool)

(assert (=> b!764685 (= e!425872 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340165 lt!340166 mask!3328))))

(declare-fun b!764686 () Bool)

(assert (=> b!764686 (= e!425872 (Intermediate!7815 false index!1321 x!1131))))

(declare-fun b!764682 () Bool)

(assert (=> b!764682 (= e!425873 (Intermediate!7815 true index!1321 x!1131))))

(declare-fun d!101019 () Bool)

(assert (=> d!101019 e!425871))

(declare-fun c!84036 () Bool)

(assert (=> d!101019 (= c!84036 (and ((_ is Intermediate!7815) lt!340262) (undefined!8627 lt!340262)))))

(assert (=> d!101019 (= lt!340262 e!425873)))

(declare-fun c!84038 () Bool)

(assert (=> d!101019 (= c!84038 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101019 (= lt!340263 (select (arr!20215 lt!340166) index!1321))))

(assert (=> d!101019 (validMask!0 mask!3328)))

(assert (=> d!101019 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340165 lt!340166 mask!3328) lt!340262)))

(assert (= (and d!101019 c!84038) b!764682))

(assert (= (and d!101019 (not c!84038)) b!764679))

(assert (= (and b!764679 c!84037) b!764686))

(assert (= (and b!764679 (not c!84037)) b!764685))

(assert (= (and d!101019 c!84036) b!764680))

(assert (= (and d!101019 (not c!84036)) b!764681))

(assert (= (and b!764681 res!517381) b!764678))

(assert (= (and b!764678 (not res!517382)) b!764683))

(assert (= (and b!764683 (not res!517383)) b!764684))

(declare-fun m!711005 () Bool)

(assert (=> b!764678 m!711005))

(assert (=> b!764683 m!711005))

(assert (=> b!764685 m!710915))

(assert (=> b!764685 m!710915))

(declare-fun m!711007 () Bool)

(assert (=> b!764685 m!711007))

(declare-fun m!711009 () Bool)

(assert (=> d!101019 m!711009))

(assert (=> d!101019 m!710845))

(assert (=> b!764684 m!711005))

(assert (=> b!764468 d!101019))

(declare-fun d!101021 () Bool)

(declare-fun res!517394 () Bool)

(declare-fun e!425889 () Bool)

(assert (=> d!101021 (=> res!517394 e!425889)))

(assert (=> d!101021 (= res!517394 (= (select (arr!20215 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101021 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!425889)))

(declare-fun b!764707 () Bool)

(declare-fun e!425890 () Bool)

(assert (=> b!764707 (= e!425889 e!425890)))

(declare-fun res!517395 () Bool)

(assert (=> b!764707 (=> (not res!517395) (not e!425890))))

(assert (=> b!764707 (= res!517395 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20636 a!3186)))))

(declare-fun b!764708 () Bool)

(assert (=> b!764708 (= e!425890 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101021 (not res!517394)) b!764707))

(assert (= (and b!764707 res!517395) b!764708))

(declare-fun m!711025 () Bool)

(assert (=> d!101021 m!711025))

(declare-fun m!711027 () Bool)

(assert (=> b!764708 m!711027))

(assert (=> b!764467 d!101021))

(declare-fun d!101025 () Bool)

(declare-fun res!517396 () Bool)

(declare-fun e!425893 () Bool)

(assert (=> d!101025 (=> res!517396 e!425893)))

(assert (=> d!101025 (= res!517396 (bvsge #b00000000000000000000000000000000 (size!20636 a!3186)))))

(assert (=> d!101025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!425893)))

(declare-fun bm!35005 () Bool)

(declare-fun call!35008 () Bool)

(assert (=> bm!35005 (= call!35008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!764709 () Bool)

(declare-fun e!425892 () Bool)

(declare-fun e!425891 () Bool)

(assert (=> b!764709 (= e!425892 e!425891)))

(declare-fun lt!340269 () (_ BitVec 64))

(assert (=> b!764709 (= lt!340269 (select (arr!20215 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!340267 () Unit!26356)

(assert (=> b!764709 (= lt!340267 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340269 #b00000000000000000000000000000000))))

(assert (=> b!764709 (arrayContainsKey!0 a!3186 lt!340269 #b00000000000000000000000000000000)))

(declare-fun lt!340268 () Unit!26356)

(assert (=> b!764709 (= lt!340268 lt!340267)))

(declare-fun res!517397 () Bool)

(assert (=> b!764709 (= res!517397 (= (seekEntryOrOpen!0 (select (arr!20215 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7815 #b00000000000000000000000000000000)))))

(assert (=> b!764709 (=> (not res!517397) (not e!425891))))

(declare-fun b!764710 () Bool)

(assert (=> b!764710 (= e!425891 call!35008)))

(declare-fun b!764711 () Bool)

(assert (=> b!764711 (= e!425893 e!425892)))

(declare-fun c!84044 () Bool)

(assert (=> b!764711 (= c!84044 (validKeyInArray!0 (select (arr!20215 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!764712 () Bool)

(assert (=> b!764712 (= e!425892 call!35008)))

(assert (= (and d!101025 (not res!517396)) b!764711))

(assert (= (and b!764711 c!84044) b!764709))

(assert (= (and b!764711 (not c!84044)) b!764712))

(assert (= (and b!764709 res!517397) b!764710))

(assert (= (or b!764710 b!764712) bm!35005))

(declare-fun m!711029 () Bool)

(assert (=> bm!35005 m!711029))

(assert (=> b!764709 m!711025))

(declare-fun m!711031 () Bool)

(assert (=> b!764709 m!711031))

(declare-fun m!711033 () Bool)

(assert (=> b!764709 m!711033))

(assert (=> b!764709 m!711025))

(declare-fun m!711035 () Bool)

(assert (=> b!764709 m!711035))

(assert (=> b!764711 m!711025))

(assert (=> b!764711 m!711025))

(declare-fun m!711037 () Bool)

(assert (=> b!764711 m!711037))

(assert (=> b!764458 d!101025))

(declare-fun b!764765 () Bool)

(declare-fun c!84069 () Bool)

(declare-fun lt!340297 () (_ BitVec 64))

(assert (=> b!764765 (= c!84069 (= lt!340297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425922 () SeekEntryResult!7815)

(declare-fun e!425923 () SeekEntryResult!7815)

(assert (=> b!764765 (= e!425922 e!425923)))

(declare-fun b!764766 () Bool)

(assert (=> b!764766 (= e!425922 (Found!7815 index!1321))))

(declare-fun b!764767 () Bool)

(assert (=> b!764767 (= e!425923 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20215 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!340298 () SeekEntryResult!7815)

(declare-fun d!101027 () Bool)

(assert (=> d!101027 (and (or ((_ is Undefined!7815) lt!340298) (not ((_ is Found!7815) lt!340298)) (and (bvsge (index!33629 lt!340298) #b00000000000000000000000000000000) (bvslt (index!33629 lt!340298) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340298) ((_ is Found!7815) lt!340298) (not ((_ is MissingVacant!7815) lt!340298)) (not (= (index!33631 lt!340298) resIntermediateIndex!5)) (and (bvsge (index!33631 lt!340298) #b00000000000000000000000000000000) (bvslt (index!33631 lt!340298) (size!20636 a!3186)))) (or ((_ is Undefined!7815) lt!340298) (ite ((_ is Found!7815) lt!340298) (= (select (arr!20215 a!3186) (index!33629 lt!340298)) (select (arr!20215 a!3186) j!159)) (and ((_ is MissingVacant!7815) lt!340298) (= (index!33631 lt!340298) resIntermediateIndex!5) (= (select (arr!20215 a!3186) (index!33631 lt!340298)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!425924 () SeekEntryResult!7815)

(assert (=> d!101027 (= lt!340298 e!425924)))

(declare-fun c!84068 () Bool)

(assert (=> d!101027 (= c!84068 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101027 (= lt!340297 (select (arr!20215 a!3186) index!1321))))

(assert (=> d!101027 (validMask!0 mask!3328)))

(assert (=> d!101027 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20215 a!3186) j!159) a!3186 mask!3328) lt!340298)))

(declare-fun b!764768 () Bool)

(assert (=> b!764768 (= e!425924 Undefined!7815)))

(declare-fun b!764769 () Bool)

(assert (=> b!764769 (= e!425923 (MissingVacant!7815 resIntermediateIndex!5))))

(declare-fun b!764770 () Bool)

(assert (=> b!764770 (= e!425924 e!425922)))

(declare-fun c!84067 () Bool)

(assert (=> b!764770 (= c!84067 (= lt!340297 (select (arr!20215 a!3186) j!159)))))

(assert (= (and d!101027 c!84068) b!764768))

(assert (= (and d!101027 (not c!84068)) b!764770))

(assert (= (and b!764770 c!84067) b!764766))

(assert (= (and b!764770 (not c!84067)) b!764765))

(assert (= (and b!764765 c!84069) b!764769))

(assert (= (and b!764765 (not c!84069)) b!764767))

(assert (=> b!764767 m!710915))

(assert (=> b!764767 m!710915))

(assert (=> b!764767 m!710829))

(declare-fun m!711073 () Bool)

(assert (=> b!764767 m!711073))

(declare-fun m!711075 () Bool)

(assert (=> d!101027 m!711075))

(declare-fun m!711077 () Bool)

(assert (=> d!101027 m!711077))

(assert (=> d!101027 m!710919))

(assert (=> d!101027 m!710845))

(assert (=> b!764459 d!101027))

(declare-fun b!764771 () Bool)

(declare-fun lt!340299 () SeekEntryResult!7815)

(assert (=> b!764771 (and (bvsge (index!33630 lt!340299) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340299) (size!20636 a!3186)))))

(declare-fun res!517408 () Bool)

(assert (=> b!764771 (= res!517408 (= (select (arr!20215 a!3186) (index!33630 lt!340299)) (select (arr!20215 a!3186) j!159)))))

(declare-fun e!425929 () Bool)

(assert (=> b!764771 (=> res!517408 e!425929)))

(declare-fun e!425928 () Bool)

(assert (=> b!764771 (= e!425928 e!425929)))

(declare-fun b!764772 () Bool)

(declare-fun e!425927 () SeekEntryResult!7815)

(declare-fun e!425926 () SeekEntryResult!7815)

(assert (=> b!764772 (= e!425927 e!425926)))

(declare-fun c!84071 () Bool)

(declare-fun lt!340300 () (_ BitVec 64))

(assert (=> b!764772 (= c!84071 (or (= lt!340300 (select (arr!20215 a!3186) j!159)) (= (bvadd lt!340300 lt!340300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764773 () Bool)

(declare-fun e!425925 () Bool)

(assert (=> b!764773 (= e!425925 (bvsge (x!64523 lt!340299) #b01111111111111111111111111111110))))

(declare-fun b!764774 () Bool)

(assert (=> b!764774 (= e!425925 e!425928)))

(declare-fun res!517407 () Bool)

(assert (=> b!764774 (= res!517407 (and ((_ is Intermediate!7815) lt!340299) (not (undefined!8627 lt!340299)) (bvslt (x!64523 lt!340299) #b01111111111111111111111111111110) (bvsge (x!64523 lt!340299) #b00000000000000000000000000000000) (bvsge (x!64523 lt!340299) #b00000000000000000000000000000000)))))

(assert (=> b!764774 (=> (not res!517407) (not e!425928))))

(declare-fun b!764776 () Bool)

(assert (=> b!764776 (and (bvsge (index!33630 lt!340299) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340299) (size!20636 a!3186)))))

(declare-fun res!517409 () Bool)

(assert (=> b!764776 (= res!517409 (= (select (arr!20215 a!3186) (index!33630 lt!340299)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764776 (=> res!517409 e!425929)))

(declare-fun b!764777 () Bool)

(assert (=> b!764777 (and (bvsge (index!33630 lt!340299) #b00000000000000000000000000000000) (bvslt (index!33630 lt!340299) (size!20636 a!3186)))))

(assert (=> b!764777 (= e!425929 (= (select (arr!20215 a!3186) (index!33630 lt!340299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!764778 () Bool)

(assert (=> b!764778 (= e!425926 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20215 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764779 () Bool)

(assert (=> b!764779 (= e!425926 (Intermediate!7815 false (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764775 () Bool)

(assert (=> b!764775 (= e!425927 (Intermediate!7815 true (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101047 () Bool)

(assert (=> d!101047 e!425925))

(declare-fun c!84070 () Bool)

(assert (=> d!101047 (= c!84070 (and ((_ is Intermediate!7815) lt!340299) (undefined!8627 lt!340299)))))

(assert (=> d!101047 (= lt!340299 e!425927)))

(declare-fun c!84072 () Bool)

(assert (=> d!101047 (= c!84072 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101047 (= lt!340300 (select (arr!20215 a!3186) (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328)))))

(assert (=> d!101047 (validMask!0 mask!3328)))

(assert (=> d!101047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) (select (arr!20215 a!3186) j!159) a!3186 mask!3328) lt!340299)))

(assert (= (and d!101047 c!84072) b!764775))

(assert (= (and d!101047 (not c!84072)) b!764772))

(assert (= (and b!764772 c!84071) b!764779))

(assert (= (and b!764772 (not c!84071)) b!764778))

(assert (= (and d!101047 c!84070) b!764773))

(assert (= (and d!101047 (not c!84070)) b!764774))

(assert (= (and b!764774 res!517407) b!764771))

(assert (= (and b!764771 (not res!517408)) b!764776))

(assert (= (and b!764776 (not res!517409)) b!764777))

(declare-fun m!711079 () Bool)

(assert (=> b!764771 m!711079))

(assert (=> b!764776 m!711079))

(assert (=> b!764778 m!710831))

(declare-fun m!711085 () Bool)

(assert (=> b!764778 m!711085))

(assert (=> b!764778 m!711085))

(assert (=> b!764778 m!710829))

(declare-fun m!711089 () Bool)

(assert (=> b!764778 m!711089))

(assert (=> d!101047 m!710831))

(declare-fun m!711091 () Bool)

(assert (=> d!101047 m!711091))

(assert (=> d!101047 m!710845))

(assert (=> b!764777 m!711079))

(assert (=> b!764461 d!101047))

(declare-fun d!101051 () Bool)

(declare-fun lt!340306 () (_ BitVec 32))

(declare-fun lt!340305 () (_ BitVec 32))

(assert (=> d!101051 (= lt!340306 (bvmul (bvxor lt!340305 (bvlshr lt!340305 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101051 (= lt!340305 ((_ extract 31 0) (bvand (bvxor (select (arr!20215 a!3186) j!159) (bvlshr (select (arr!20215 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101051 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517380 (let ((h!15300 ((_ extract 31 0) (bvand (bvxor (select (arr!20215 a!3186) j!159) (bvlshr (select (arr!20215 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64528 (bvmul (bvxor h!15300 (bvlshr h!15300 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64528 (bvlshr x!64528 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517380 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517380 #b00000000000000000000000000000000))))))

(assert (=> d!101051 (= (toIndex!0 (select (arr!20215 a!3186) j!159) mask!3328) (bvand (bvxor lt!340306 (bvlshr lt!340306 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764461 d!101051))

(declare-fun b!764847 () Bool)

(declare-fun e!425975 () Bool)

(declare-fun e!425973 () Bool)

(assert (=> b!764847 (= e!425975 e!425973)))

(declare-fun c!84093 () Bool)

(assert (=> b!764847 (= c!84093 (validKeyInArray!0 (select (arr!20215 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35012 () Bool)

(declare-fun call!35015 () Bool)

(assert (=> bm!35012 (= call!35015 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84093 (Cons!14213 (select (arr!20215 a!3186) #b00000000000000000000000000000000) Nil!14214) Nil!14214)))))

(declare-fun b!764848 () Bool)

(assert (=> b!764848 (= e!425973 call!35015)))

(declare-fun d!101053 () Bool)

(declare-fun res!517437 () Bool)

(declare-fun e!425976 () Bool)

(assert (=> d!101053 (=> res!517437 e!425976)))

(assert (=> d!101053 (= res!517437 (bvsge #b00000000000000000000000000000000 (size!20636 a!3186)))))

(assert (=> d!101053 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14214) e!425976)))

(declare-fun b!764849 () Bool)

(assert (=> b!764849 (= e!425973 call!35015)))

(declare-fun b!764850 () Bool)

(declare-fun e!425974 () Bool)

(declare-fun contains!4076 (List!14217 (_ BitVec 64)) Bool)

(assert (=> b!764850 (= e!425974 (contains!4076 Nil!14214 (select (arr!20215 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!764851 () Bool)

(assert (=> b!764851 (= e!425976 e!425975)))

(declare-fun res!517439 () Bool)

(assert (=> b!764851 (=> (not res!517439) (not e!425975))))

(assert (=> b!764851 (= res!517439 (not e!425974))))

(declare-fun res!517438 () Bool)

(assert (=> b!764851 (=> (not res!517438) (not e!425974))))

(assert (=> b!764851 (= res!517438 (validKeyInArray!0 (select (arr!20215 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101053 (not res!517437)) b!764851))

(assert (= (and b!764851 res!517438) b!764850))

(assert (= (and b!764851 res!517439) b!764847))

(assert (= (and b!764847 c!84093) b!764849))

(assert (= (and b!764847 (not c!84093)) b!764848))

(assert (= (or b!764849 b!764848) bm!35012))

(assert (=> b!764847 m!711025))

(assert (=> b!764847 m!711025))

(assert (=> b!764847 m!711037))

(assert (=> bm!35012 m!711025))

(declare-fun m!711125 () Bool)

(assert (=> bm!35012 m!711125))

(assert (=> b!764850 m!711025))

(assert (=> b!764850 m!711025))

(declare-fun m!711127 () Bool)

(assert (=> b!764850 m!711127))

(assert (=> b!764851 m!711025))

(assert (=> b!764851 m!711025))

(assert (=> b!764851 m!711037))

(assert (=> b!764462 d!101053))

(check-sat (not b!764635) (not b!764847) (not b!764851) (not b!764648) (not b!764709) (not b!764778) (not b!764585) (not b!764711) (not b!764708) (not d!101009) (not b!764767) (not d!101047) (not b!764685) (not b!764850) (not d!101015) (not bm!35012) (not bm!35005) (not d!101027) (not d!100979) (not bm!35003) (not b!764656) (not d!101019) (not b!764539) (not d!101013) (not d!100989) (not b!764637))
