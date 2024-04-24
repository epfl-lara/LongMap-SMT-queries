; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66698 () Bool)

(assert start!66698)

(declare-fun b!768034 () Bool)

(declare-fun res!519437 () Bool)

(declare-fun e!427747 () Bool)

(assert (=> b!768034 (=> res!519437 e!427747)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42286 0))(
  ( (array!42287 (arr!20242 (Array (_ BitVec 32) (_ BitVec 64))) (size!20662 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42286)

(declare-datatypes ((SeekEntryResult!7798 0))(
  ( (MissingZero!7798 (index!33560 (_ BitVec 32))) (Found!7798 (index!33561 (_ BitVec 32))) (Intermediate!7798 (undefined!8610 Bool) (index!33562 (_ BitVec 32)) (x!64635 (_ BitVec 32))) (Undefined!7798) (MissingVacant!7798 (index!33563 (_ BitVec 32))) )
))
(declare-fun lt!341651 () SeekEntryResult!7798)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42286 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!768034 (= res!519437 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341651)))))

(declare-fun b!768035 () Bool)

(declare-fun res!519440 () Bool)

(declare-fun e!427741 () Bool)

(assert (=> b!768035 (=> (not res!519440) (not e!427741))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768035 (= res!519440 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20242 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768036 () Bool)

(declare-fun e!427744 () Bool)

(assert (=> b!768036 (= e!427744 e!427741)))

(declare-fun res!519429 () Bool)

(assert (=> b!768036 (=> (not res!519429) (not e!427741))))

(declare-fun lt!341649 () SeekEntryResult!7798)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42286 (_ BitVec 32)) SeekEntryResult!7798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768036 (= res!519429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341649))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768036 (= lt!341649 (Intermediate!7798 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768037 () Bool)

(declare-fun res!519435 () Bool)

(assert (=> b!768037 (=> (not res!519435) (not e!427744))))

(declare-datatypes ((List!14151 0))(
  ( (Nil!14148) (Cons!14147 (h!15246 (_ BitVec 64)) (t!20458 List!14151)) )
))
(declare-fun arrayNoDuplicates!0 (array!42286 (_ BitVec 32) List!14151) Bool)

(assert (=> b!768037 (= res!519435 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14148))))

(declare-fun lt!341652 () SeekEntryResult!7798)

(declare-fun e!427742 () Bool)

(declare-fun b!768038 () Bool)

(assert (=> b!768038 (= e!427742 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341652))))

(declare-fun b!768039 () Bool)

(declare-fun e!427746 () Bool)

(declare-fun e!427740 () Bool)

(assert (=> b!768039 (= e!427746 (not e!427740))))

(declare-fun res!519432 () Bool)

(assert (=> b!768039 (=> res!519432 e!427740)))

(declare-fun lt!341650 () SeekEntryResult!7798)

(get-info :version)

(assert (=> b!768039 (= res!519432 (or (not ((_ is Intermediate!7798) lt!341650)) (bvsge x!1131 (x!64635 lt!341650))))))

(assert (=> b!768039 (= lt!341651 (Found!7798 j!159))))

(declare-fun e!427739 () Bool)

(assert (=> b!768039 e!427739))

(declare-fun res!519426 () Bool)

(assert (=> b!768039 (=> (not res!519426) (not e!427739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42286 (_ BitVec 32)) Bool)

(assert (=> b!768039 (= res!519426 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26401 0))(
  ( (Unit!26402) )
))
(declare-fun lt!341643 () Unit!26401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26401)

(assert (=> b!768039 (= lt!341643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!341647 () (_ BitVec 32))

(declare-fun b!768040 () Bool)

(assert (=> b!768040 (= e!427747 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341647 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341651))))

(declare-fun b!768041 () Bool)

(assert (=> b!768041 (= e!427739 e!427742)))

(declare-fun res!519439 () Bool)

(assert (=> b!768041 (=> (not res!519439) (not e!427742))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42286 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!768041 (= res!519439 (= (seekEntryOrOpen!0 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341652))))

(assert (=> b!768041 (= lt!341652 (Found!7798 j!159))))

(declare-fun b!768042 () Bool)

(declare-fun res!519431 () Bool)

(assert (=> b!768042 (=> (not res!519431) (not e!427741))))

(declare-fun e!427748 () Bool)

(assert (=> b!768042 (= res!519431 e!427748)))

(declare-fun c!84698 () Bool)

(assert (=> b!768042 (= c!84698 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768043 () Bool)

(assert (=> b!768043 (= e!427741 e!427746)))

(declare-fun res!519428 () Bool)

(assert (=> b!768043 (=> (not res!519428) (not e!427746))))

(declare-fun lt!341646 () SeekEntryResult!7798)

(assert (=> b!768043 (= res!519428 (= lt!341646 lt!341650))))

(declare-fun lt!341645 () (_ BitVec 64))

(declare-fun lt!341644 () array!42286)

(assert (=> b!768043 (= lt!341650 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341645 lt!341644 mask!3328))))

(assert (=> b!768043 (= lt!341646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341645 mask!3328) lt!341645 lt!341644 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!768043 (= lt!341645 (select (store (arr!20242 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768043 (= lt!341644 (array!42287 (store (arr!20242 a!3186) i!1173 k0!2102) (size!20662 a!3186)))))

(declare-fun b!768044 () Bool)

(declare-fun res!519436 () Bool)

(declare-fun e!427743 () Bool)

(assert (=> b!768044 (=> (not res!519436) (not e!427743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768044 (= res!519436 (validKeyInArray!0 k0!2102))))

(declare-fun b!768045 () Bool)

(assert (=> b!768045 (= e!427740 e!427747)))

(declare-fun res!519442 () Bool)

(assert (=> b!768045 (=> res!519442 e!427747)))

(assert (=> b!768045 (= res!519442 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768045 (= lt!341647 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!768046 () Bool)

(declare-fun res!519427 () Bool)

(assert (=> b!768046 (=> (not res!519427) (not e!427743))))

(assert (=> b!768046 (= res!519427 (and (= (size!20662 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20662 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20662 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768047 () Bool)

(assert (=> b!768047 (= e!427743 e!427744)))

(declare-fun res!519441 () Bool)

(assert (=> b!768047 (=> (not res!519441) (not e!427744))))

(declare-fun lt!341648 () SeekEntryResult!7798)

(assert (=> b!768047 (= res!519441 (or (= lt!341648 (MissingZero!7798 i!1173)) (= lt!341648 (MissingVacant!7798 i!1173))))))

(assert (=> b!768047 (= lt!341648 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!768048 () Bool)

(assert (=> b!768048 (= e!427748 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) (Found!7798 j!159)))))

(declare-fun b!768049 () Bool)

(declare-fun res!519430 () Bool)

(assert (=> b!768049 (=> (not res!519430) (not e!427744))))

(assert (=> b!768049 (= res!519430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!519433 () Bool)

(assert (=> start!66698 (=> (not res!519433) (not e!427743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66698 (= res!519433 (validMask!0 mask!3328))))

(assert (=> start!66698 e!427743))

(assert (=> start!66698 true))

(declare-fun array_inv!16101 (array!42286) Bool)

(assert (=> start!66698 (array_inv!16101 a!3186)))

(declare-fun b!768050 () Bool)

(declare-fun res!519438 () Bool)

(assert (=> b!768050 (=> (not res!519438) (not e!427743))))

(assert (=> b!768050 (= res!519438 (validKeyInArray!0 (select (arr!20242 a!3186) j!159)))))

(declare-fun b!768051 () Bool)

(assert (=> b!768051 (= e!427748 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341649))))

(declare-fun b!768052 () Bool)

(declare-fun res!519443 () Bool)

(assert (=> b!768052 (=> (not res!519443) (not e!427744))))

(assert (=> b!768052 (= res!519443 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20662 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20662 a!3186))))))

(declare-fun b!768053 () Bool)

(declare-fun res!519434 () Bool)

(assert (=> b!768053 (=> (not res!519434) (not e!427743))))

(declare-fun arrayContainsKey!0 (array!42286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768053 (= res!519434 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66698 res!519433) b!768046))

(assert (= (and b!768046 res!519427) b!768050))

(assert (= (and b!768050 res!519438) b!768044))

(assert (= (and b!768044 res!519436) b!768053))

(assert (= (and b!768053 res!519434) b!768047))

(assert (= (and b!768047 res!519441) b!768049))

(assert (= (and b!768049 res!519430) b!768037))

(assert (= (and b!768037 res!519435) b!768052))

(assert (= (and b!768052 res!519443) b!768036))

(assert (= (and b!768036 res!519429) b!768035))

(assert (= (and b!768035 res!519440) b!768042))

(assert (= (and b!768042 c!84698) b!768051))

(assert (= (and b!768042 (not c!84698)) b!768048))

(assert (= (and b!768042 res!519431) b!768043))

(assert (= (and b!768043 res!519428) b!768039))

(assert (= (and b!768039 res!519426) b!768041))

(assert (= (and b!768041 res!519439) b!768038))

(assert (= (and b!768039 (not res!519432)) b!768045))

(assert (= (and b!768045 (not res!519442)) b!768034))

(assert (= (and b!768034 (not res!519437)) b!768040))

(declare-fun m!714199 () Bool)

(assert (=> b!768034 m!714199))

(assert (=> b!768034 m!714199))

(declare-fun m!714201 () Bool)

(assert (=> b!768034 m!714201))

(assert (=> b!768040 m!714199))

(assert (=> b!768040 m!714199))

(declare-fun m!714203 () Bool)

(assert (=> b!768040 m!714203))

(declare-fun m!714205 () Bool)

(assert (=> b!768043 m!714205))

(assert (=> b!768043 m!714205))

(declare-fun m!714207 () Bool)

(assert (=> b!768043 m!714207))

(declare-fun m!714209 () Bool)

(assert (=> b!768043 m!714209))

(declare-fun m!714211 () Bool)

(assert (=> b!768043 m!714211))

(declare-fun m!714213 () Bool)

(assert (=> b!768043 m!714213))

(declare-fun m!714215 () Bool)

(assert (=> start!66698 m!714215))

(declare-fun m!714217 () Bool)

(assert (=> start!66698 m!714217))

(assert (=> b!768050 m!714199))

(assert (=> b!768050 m!714199))

(declare-fun m!714219 () Bool)

(assert (=> b!768050 m!714219))

(declare-fun m!714221 () Bool)

(assert (=> b!768044 m!714221))

(declare-fun m!714223 () Bool)

(assert (=> b!768049 m!714223))

(declare-fun m!714225 () Bool)

(assert (=> b!768045 m!714225))

(assert (=> b!768048 m!714199))

(assert (=> b!768048 m!714199))

(assert (=> b!768048 m!714201))

(declare-fun m!714227 () Bool)

(assert (=> b!768035 m!714227))

(declare-fun m!714229 () Bool)

(assert (=> b!768053 m!714229))

(declare-fun m!714231 () Bool)

(assert (=> b!768047 m!714231))

(declare-fun m!714233 () Bool)

(assert (=> b!768037 m!714233))

(assert (=> b!768051 m!714199))

(assert (=> b!768051 m!714199))

(declare-fun m!714235 () Bool)

(assert (=> b!768051 m!714235))

(assert (=> b!768038 m!714199))

(assert (=> b!768038 m!714199))

(declare-fun m!714237 () Bool)

(assert (=> b!768038 m!714237))

(declare-fun m!714239 () Bool)

(assert (=> b!768039 m!714239))

(declare-fun m!714241 () Bool)

(assert (=> b!768039 m!714241))

(assert (=> b!768036 m!714199))

(assert (=> b!768036 m!714199))

(declare-fun m!714243 () Bool)

(assert (=> b!768036 m!714243))

(assert (=> b!768036 m!714243))

(assert (=> b!768036 m!714199))

(declare-fun m!714245 () Bool)

(assert (=> b!768036 m!714245))

(assert (=> b!768041 m!714199))

(assert (=> b!768041 m!714199))

(declare-fun m!714247 () Bool)

(assert (=> b!768041 m!714247))

(check-sat (not b!768051) (not b!768049) (not b!768037) (not b!768040) (not b!768038) (not start!66698) (not b!768044) (not b!768050) (not b!768041) (not b!768045) (not b!768053) (not b!768034) (not b!768036) (not b!768047) (not b!768048) (not b!768039) (not b!768043))
(check-sat)
(get-model)

(declare-fun e!427815 () SeekEntryResult!7798)

(declare-fun b!768186 () Bool)

(assert (=> b!768186 (= e!427815 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768187 () Bool)

(assert (=> b!768187 (= e!427815 (MissingVacant!7798 resIntermediateIndex!5))))

(declare-fun b!768188 () Bool)

(declare-fun e!427816 () SeekEntryResult!7798)

(declare-fun e!427817 () SeekEntryResult!7798)

(assert (=> b!768188 (= e!427816 e!427817)))

(declare-fun c!84711 () Bool)

(declare-fun lt!341718 () (_ BitVec 64))

(assert (=> b!768188 (= c!84711 (= lt!341718 (select (arr!20242 a!3186) j!159)))))

(declare-fun lt!341717 () SeekEntryResult!7798)

(declare-fun d!101603 () Bool)

(assert (=> d!101603 (and (or ((_ is Undefined!7798) lt!341717) (not ((_ is Found!7798) lt!341717)) (and (bvsge (index!33561 lt!341717) #b00000000000000000000000000000000) (bvslt (index!33561 lt!341717) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341717) ((_ is Found!7798) lt!341717) (not ((_ is MissingVacant!7798) lt!341717)) (not (= (index!33563 lt!341717) resIntermediateIndex!5)) (and (bvsge (index!33563 lt!341717) #b00000000000000000000000000000000) (bvslt (index!33563 lt!341717) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341717) (ite ((_ is Found!7798) lt!341717) (= (select (arr!20242 a!3186) (index!33561 lt!341717)) (select (arr!20242 a!3186) j!159)) (and ((_ is MissingVacant!7798) lt!341717) (= (index!33563 lt!341717) resIntermediateIndex!5) (= (select (arr!20242 a!3186) (index!33563 lt!341717)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101603 (= lt!341717 e!427816)))

(declare-fun c!84712 () Bool)

(assert (=> d!101603 (= c!84712 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101603 (= lt!341718 (select (arr!20242 a!3186) index!1321))))

(assert (=> d!101603 (validMask!0 mask!3328)))

(assert (=> d!101603 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341717)))

(declare-fun b!768189 () Bool)

(declare-fun c!84713 () Bool)

(assert (=> b!768189 (= c!84713 (= lt!341718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768189 (= e!427817 e!427815)))

(declare-fun b!768190 () Bool)

(assert (=> b!768190 (= e!427816 Undefined!7798)))

(declare-fun b!768191 () Bool)

(assert (=> b!768191 (= e!427817 (Found!7798 index!1321))))

(assert (= (and d!101603 c!84712) b!768190))

(assert (= (and d!101603 (not c!84712)) b!768188))

(assert (= (and b!768188 c!84711) b!768191))

(assert (= (and b!768188 (not c!84711)) b!768189))

(assert (= (and b!768189 c!84713) b!768187))

(assert (= (and b!768189 (not c!84713)) b!768186))

(declare-fun m!714349 () Bool)

(assert (=> b!768186 m!714349))

(assert (=> b!768186 m!714349))

(assert (=> b!768186 m!714199))

(declare-fun m!714351 () Bool)

(assert (=> b!768186 m!714351))

(declare-fun m!714353 () Bool)

(assert (=> d!101603 m!714353))

(declare-fun m!714355 () Bool)

(assert (=> d!101603 m!714355))

(declare-fun m!714357 () Bool)

(assert (=> d!101603 m!714357))

(assert (=> d!101603 m!714215))

(assert (=> b!768034 d!101603))

(declare-fun d!101605 () Bool)

(declare-fun lt!341721 () (_ BitVec 32))

(assert (=> d!101605 (and (bvsge lt!341721 #b00000000000000000000000000000000) (bvslt lt!341721 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101605 (= lt!341721 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!101605 (validMask!0 mask!3328)))

(assert (=> d!101605 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!341721)))

(declare-fun bs!21537 () Bool)

(assert (= bs!21537 d!101605))

(declare-fun m!714359 () Bool)

(assert (=> bs!21537 m!714359))

(assert (=> bs!21537 m!714215))

(assert (=> b!768045 d!101605))

(declare-fun d!101607 () Bool)

(assert (=> d!101607 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66698 d!101607))

(declare-fun d!101609 () Bool)

(assert (=> d!101609 (= (array_inv!16101 a!3186) (bvsge (size!20662 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66698 d!101609))

(declare-fun d!101611 () Bool)

(assert (=> d!101611 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768044 d!101611))

(declare-fun b!768202 () Bool)

(declare-fun e!427828 () Bool)

(declare-fun e!427826 () Bool)

(assert (=> b!768202 (= e!427828 e!427826)))

(declare-fun c!84716 () Bool)

(assert (=> b!768202 (= c!84716 (validKeyInArray!0 (select (arr!20242 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101613 () Bool)

(declare-fun res!519560 () Bool)

(declare-fun e!427829 () Bool)

(assert (=> d!101613 (=> res!519560 e!427829)))

(assert (=> d!101613 (= res!519560 (bvsge #b00000000000000000000000000000000 (size!20662 a!3186)))))

(assert (=> d!101613 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14148) e!427829)))

(declare-fun bm!35091 () Bool)

(declare-fun call!35094 () Bool)

(assert (=> bm!35091 (= call!35094 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84716 (Cons!14147 (select (arr!20242 a!3186) #b00000000000000000000000000000000) Nil!14148) Nil!14148)))))

(declare-fun b!768203 () Bool)

(assert (=> b!768203 (= e!427826 call!35094)))

(declare-fun b!768204 () Bool)

(assert (=> b!768204 (= e!427829 e!427828)))

(declare-fun res!519559 () Bool)

(assert (=> b!768204 (=> (not res!519559) (not e!427828))))

(declare-fun e!427827 () Bool)

(assert (=> b!768204 (= res!519559 (not e!427827))))

(declare-fun res!519558 () Bool)

(assert (=> b!768204 (=> (not res!519558) (not e!427827))))

(assert (=> b!768204 (= res!519558 (validKeyInArray!0 (select (arr!20242 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768205 () Bool)

(declare-fun contains!4063 (List!14151 (_ BitVec 64)) Bool)

(assert (=> b!768205 (= e!427827 (contains!4063 Nil!14148 (select (arr!20242 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768206 () Bool)

(assert (=> b!768206 (= e!427826 call!35094)))

(assert (= (and d!101613 (not res!519560)) b!768204))

(assert (= (and b!768204 res!519558) b!768205))

(assert (= (and b!768204 res!519559) b!768202))

(assert (= (and b!768202 c!84716) b!768206))

(assert (= (and b!768202 (not c!84716)) b!768203))

(assert (= (or b!768206 b!768203) bm!35091))

(declare-fun m!714361 () Bool)

(assert (=> b!768202 m!714361))

(assert (=> b!768202 m!714361))

(declare-fun m!714363 () Bool)

(assert (=> b!768202 m!714363))

(assert (=> bm!35091 m!714361))

(declare-fun m!714365 () Bool)

(assert (=> bm!35091 m!714365))

(assert (=> b!768204 m!714361))

(assert (=> b!768204 m!714361))

(assert (=> b!768204 m!714363))

(assert (=> b!768205 m!714361))

(assert (=> b!768205 m!714361))

(declare-fun m!714367 () Bool)

(assert (=> b!768205 m!714367))

(assert (=> b!768037 d!101613))

(assert (=> b!768048 d!101603))

(declare-fun b!768249 () Bool)

(declare-fun lt!341740 () SeekEntryResult!7798)

(assert (=> b!768249 (and (bvsge (index!33562 lt!341740) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341740) (size!20662 a!3186)))))

(declare-fun res!519575 () Bool)

(assert (=> b!768249 (= res!519575 (= (select (arr!20242 a!3186) (index!33562 lt!341740)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427858 () Bool)

(assert (=> b!768249 (=> res!519575 e!427858)))

(declare-fun b!768250 () Bool)

(assert (=> b!768250 (and (bvsge (index!33562 lt!341740) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341740) (size!20662 a!3186)))))

(declare-fun res!519574 () Bool)

(assert (=> b!768250 (= res!519574 (= (select (arr!20242 a!3186) (index!33562 lt!341740)) (select (arr!20242 a!3186) j!159)))))

(assert (=> b!768250 (=> res!519574 e!427858)))

(declare-fun e!427856 () Bool)

(assert (=> b!768250 (= e!427856 e!427858)))

(declare-fun e!427854 () SeekEntryResult!7798)

(declare-fun b!768251 () Bool)

(assert (=> b!768251 (= e!427854 (Intermediate!7798 true (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768252 () Bool)

(declare-fun e!427853 () Bool)

(assert (=> b!768252 (= e!427853 e!427856)))

(declare-fun res!519573 () Bool)

(assert (=> b!768252 (= res!519573 (and ((_ is Intermediate!7798) lt!341740) (not (undefined!8610 lt!341740)) (bvslt (x!64635 lt!341740) #b01111111111111111111111111111110) (bvsge (x!64635 lt!341740) #b00000000000000000000000000000000) (bvsge (x!64635 lt!341740) #b00000000000000000000000000000000)))))

(assert (=> b!768252 (=> (not res!519573) (not e!427856))))

(declare-fun b!768253 () Bool)

(declare-fun e!427855 () SeekEntryResult!7798)

(assert (=> b!768253 (= e!427854 e!427855)))

(declare-fun c!84731 () Bool)

(declare-fun lt!341739 () (_ BitVec 64))

(assert (=> b!768253 (= c!84731 (or (= lt!341739 (select (arr!20242 a!3186) j!159)) (= (bvadd lt!341739 lt!341739) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768255 () Bool)

(assert (=> b!768255 (= e!427855 (Intermediate!7798 false (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768256 () Bool)

(assert (=> b!768256 (= e!427855 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768257 () Bool)

(assert (=> b!768257 (= e!427853 (bvsge (x!64635 lt!341740) #b01111111111111111111111111111110))))

(declare-fun b!768254 () Bool)

(assert (=> b!768254 (and (bvsge (index!33562 lt!341740) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341740) (size!20662 a!3186)))))

(assert (=> b!768254 (= e!427858 (= (select (arr!20242 a!3186) (index!33562 lt!341740)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101617 () Bool)

(assert (=> d!101617 e!427853))

(declare-fun c!84732 () Bool)

(assert (=> d!101617 (= c!84732 (and ((_ is Intermediate!7798) lt!341740) (undefined!8610 lt!341740)))))

(assert (=> d!101617 (= lt!341740 e!427854)))

(declare-fun c!84730 () Bool)

(assert (=> d!101617 (= c!84730 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101617 (= lt!341739 (select (arr!20242 a!3186) (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328)))))

(assert (=> d!101617 (validMask!0 mask!3328)))

(assert (=> d!101617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341740)))

(assert (= (and d!101617 c!84730) b!768251))

(assert (= (and d!101617 (not c!84730)) b!768253))

(assert (= (and b!768253 c!84731) b!768255))

(assert (= (and b!768253 (not c!84731)) b!768256))

(assert (= (and d!101617 c!84732) b!768257))

(assert (= (and d!101617 (not c!84732)) b!768252))

(assert (= (and b!768252 res!519573) b!768250))

(assert (= (and b!768250 (not res!519574)) b!768249))

(assert (= (and b!768249 (not res!519575)) b!768254))

(declare-fun m!714381 () Bool)

(assert (=> b!768254 m!714381))

(assert (=> b!768250 m!714381))

(assert (=> b!768249 m!714381))

(assert (=> b!768256 m!714243))

(declare-fun m!714383 () Bool)

(assert (=> b!768256 m!714383))

(assert (=> b!768256 m!714383))

(assert (=> b!768256 m!714199))

(declare-fun m!714385 () Bool)

(assert (=> b!768256 m!714385))

(assert (=> d!101617 m!714243))

(declare-fun m!714387 () Bool)

(assert (=> d!101617 m!714387))

(assert (=> d!101617 m!714215))

(assert (=> b!768036 d!101617))

(declare-fun d!101623 () Bool)

(declare-fun lt!341757 () (_ BitVec 32))

(declare-fun lt!341756 () (_ BitVec 32))

(assert (=> d!101623 (= lt!341757 (bvmul (bvxor lt!341756 (bvlshr lt!341756 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101623 (= lt!341756 ((_ extract 31 0) (bvand (bvxor (select (arr!20242 a!3186) j!159) (bvlshr (select (arr!20242 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101623 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519576 (let ((h!15249 ((_ extract 31 0) (bvand (bvxor (select (arr!20242 a!3186) j!159) (bvlshr (select (arr!20242 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64642 (bvmul (bvxor h!15249 (bvlshr h!15249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64642 (bvlshr x!64642 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519576 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519576 #b00000000000000000000000000000000))))))

(assert (=> d!101623 (= (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) (bvand (bvxor lt!341757 (bvlshr lt!341757 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768036 d!101623))

(declare-fun b!768339 () Bool)

(declare-fun c!84768 () Bool)

(declare-fun lt!341774 () (_ BitVec 64))

(assert (=> b!768339 (= c!84768 (= lt!341774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427903 () SeekEntryResult!7798)

(declare-fun e!427904 () SeekEntryResult!7798)

(assert (=> b!768339 (= e!427903 e!427904)))

(declare-fun b!768340 () Bool)

(declare-fun lt!341776 () SeekEntryResult!7798)

(assert (=> b!768340 (= e!427904 (seekKeyOrZeroReturnVacant!0 (x!64635 lt!341776) (index!33562 lt!341776) (index!33562 lt!341776) k0!2102 a!3186 mask!3328))))

(declare-fun b!768341 () Bool)

(assert (=> b!768341 (= e!427903 (Found!7798 (index!33562 lt!341776)))))

(declare-fun b!768342 () Bool)

(declare-fun e!427905 () SeekEntryResult!7798)

(assert (=> b!768342 (= e!427905 e!427903)))

(assert (=> b!768342 (= lt!341774 (select (arr!20242 a!3186) (index!33562 lt!341776)))))

(declare-fun c!84769 () Bool)

(assert (=> b!768342 (= c!84769 (= lt!341774 k0!2102))))

(declare-fun b!768343 () Bool)

(assert (=> b!768343 (= e!427905 Undefined!7798)))

(declare-fun d!101627 () Bool)

(declare-fun lt!341775 () SeekEntryResult!7798)

(assert (=> d!101627 (and (or ((_ is Undefined!7798) lt!341775) (not ((_ is Found!7798) lt!341775)) (and (bvsge (index!33561 lt!341775) #b00000000000000000000000000000000) (bvslt (index!33561 lt!341775) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341775) ((_ is Found!7798) lt!341775) (not ((_ is MissingZero!7798) lt!341775)) (and (bvsge (index!33560 lt!341775) #b00000000000000000000000000000000) (bvslt (index!33560 lt!341775) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341775) ((_ is Found!7798) lt!341775) ((_ is MissingZero!7798) lt!341775) (not ((_ is MissingVacant!7798) lt!341775)) (and (bvsge (index!33563 lt!341775) #b00000000000000000000000000000000) (bvslt (index!33563 lt!341775) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341775) (ite ((_ is Found!7798) lt!341775) (= (select (arr!20242 a!3186) (index!33561 lt!341775)) k0!2102) (ite ((_ is MissingZero!7798) lt!341775) (= (select (arr!20242 a!3186) (index!33560 lt!341775)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7798) lt!341775) (= (select (arr!20242 a!3186) (index!33563 lt!341775)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101627 (= lt!341775 e!427905)))

(declare-fun c!84770 () Bool)

(assert (=> d!101627 (= c!84770 (and ((_ is Intermediate!7798) lt!341776) (undefined!8610 lt!341776)))))

(assert (=> d!101627 (= lt!341776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101627 (validMask!0 mask!3328)))

(assert (=> d!101627 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341775)))

(declare-fun b!768344 () Bool)

(assert (=> b!768344 (= e!427904 (MissingZero!7798 (index!33562 lt!341776)))))

(assert (= (and d!101627 c!84770) b!768343))

(assert (= (and d!101627 (not c!84770)) b!768342))

(assert (= (and b!768342 c!84769) b!768341))

(assert (= (and b!768342 (not c!84769)) b!768339))

(assert (= (and b!768339 c!84768) b!768344))

(assert (= (and b!768339 (not c!84768)) b!768340))

(declare-fun m!714421 () Bool)

(assert (=> b!768340 m!714421))

(declare-fun m!714423 () Bool)

(assert (=> b!768342 m!714423))

(declare-fun m!714425 () Bool)

(assert (=> d!101627 m!714425))

(declare-fun m!714427 () Bool)

(assert (=> d!101627 m!714427))

(declare-fun m!714429 () Bool)

(assert (=> d!101627 m!714429))

(assert (=> d!101627 m!714215))

(assert (=> d!101627 m!714425))

(declare-fun m!714431 () Bool)

(assert (=> d!101627 m!714431))

(declare-fun m!714433 () Bool)

(assert (=> d!101627 m!714433))

(assert (=> b!768047 d!101627))

(declare-fun d!101633 () Bool)

(assert (=> d!101633 (= (validKeyInArray!0 (select (arr!20242 a!3186) j!159)) (and (not (= (select (arr!20242 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20242 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768050 d!101633))

(declare-fun b!768354 () Bool)

(declare-fun e!427911 () SeekEntryResult!7798)

(assert (=> b!768354 (= e!427911 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341647 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768355 () Bool)

(assert (=> b!768355 (= e!427911 (MissingVacant!7798 resIntermediateIndex!5))))

(declare-fun b!768356 () Bool)

(declare-fun e!427912 () SeekEntryResult!7798)

(declare-fun e!427913 () SeekEntryResult!7798)

(assert (=> b!768356 (= e!427912 e!427913)))

(declare-fun c!84774 () Bool)

(declare-fun lt!341780 () (_ BitVec 64))

(assert (=> b!768356 (= c!84774 (= lt!341780 (select (arr!20242 a!3186) j!159)))))

(declare-fun lt!341779 () SeekEntryResult!7798)

(declare-fun d!101635 () Bool)

(assert (=> d!101635 (and (or ((_ is Undefined!7798) lt!341779) (not ((_ is Found!7798) lt!341779)) (and (bvsge (index!33561 lt!341779) #b00000000000000000000000000000000) (bvslt (index!33561 lt!341779) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341779) ((_ is Found!7798) lt!341779) (not ((_ is MissingVacant!7798) lt!341779)) (not (= (index!33563 lt!341779) resIntermediateIndex!5)) (and (bvsge (index!33563 lt!341779) #b00000000000000000000000000000000) (bvslt (index!33563 lt!341779) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341779) (ite ((_ is Found!7798) lt!341779) (= (select (arr!20242 a!3186) (index!33561 lt!341779)) (select (arr!20242 a!3186) j!159)) (and ((_ is MissingVacant!7798) lt!341779) (= (index!33563 lt!341779) resIntermediateIndex!5) (= (select (arr!20242 a!3186) (index!33563 lt!341779)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101635 (= lt!341779 e!427912)))

(declare-fun c!84775 () Bool)

(assert (=> d!101635 (= c!84775 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101635 (= lt!341780 (select (arr!20242 a!3186) lt!341647))))

(assert (=> d!101635 (validMask!0 mask!3328)))

(assert (=> d!101635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341647 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341779)))

(declare-fun b!768357 () Bool)

(declare-fun c!84776 () Bool)

(assert (=> b!768357 (= c!84776 (= lt!341780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768357 (= e!427913 e!427911)))

(declare-fun b!768358 () Bool)

(assert (=> b!768358 (= e!427912 Undefined!7798)))

(declare-fun b!768359 () Bool)

(assert (=> b!768359 (= e!427913 (Found!7798 lt!341647))))

(assert (= (and d!101635 c!84775) b!768358))

(assert (= (and d!101635 (not c!84775)) b!768356))

(assert (= (and b!768356 c!84774) b!768359))

(assert (= (and b!768356 (not c!84774)) b!768357))

(assert (= (and b!768357 c!84776) b!768355))

(assert (= (and b!768357 (not c!84776)) b!768354))

(declare-fun m!714443 () Bool)

(assert (=> b!768354 m!714443))

(assert (=> b!768354 m!714443))

(assert (=> b!768354 m!714199))

(declare-fun m!714445 () Bool)

(assert (=> b!768354 m!714445))

(declare-fun m!714447 () Bool)

(assert (=> d!101635 m!714447))

(declare-fun m!714449 () Bool)

(assert (=> d!101635 m!714449))

(declare-fun m!714451 () Bool)

(assert (=> d!101635 m!714451))

(assert (=> d!101635 m!714215))

(assert (=> b!768040 d!101635))

(declare-fun b!768369 () Bool)

(declare-fun lt!341784 () SeekEntryResult!7798)

(assert (=> b!768369 (and (bvsge (index!33562 lt!341784) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341784) (size!20662 a!3186)))))

(declare-fun res!519601 () Bool)

(assert (=> b!768369 (= res!519601 (= (select (arr!20242 a!3186) (index!33562 lt!341784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427923 () Bool)

(assert (=> b!768369 (=> res!519601 e!427923)))

(declare-fun b!768370 () Bool)

(assert (=> b!768370 (and (bvsge (index!33562 lt!341784) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341784) (size!20662 a!3186)))))

(declare-fun res!519600 () Bool)

(assert (=> b!768370 (= res!519600 (= (select (arr!20242 a!3186) (index!33562 lt!341784)) (select (arr!20242 a!3186) j!159)))))

(assert (=> b!768370 (=> res!519600 e!427923)))

(declare-fun e!427922 () Bool)

(assert (=> b!768370 (= e!427922 e!427923)))

(declare-fun b!768371 () Bool)

(declare-fun e!427920 () SeekEntryResult!7798)

(assert (=> b!768371 (= e!427920 (Intermediate!7798 true index!1321 x!1131))))

(declare-fun b!768372 () Bool)

(declare-fun e!427919 () Bool)

(assert (=> b!768372 (= e!427919 e!427922)))

(declare-fun res!519599 () Bool)

(assert (=> b!768372 (= res!519599 (and ((_ is Intermediate!7798) lt!341784) (not (undefined!8610 lt!341784)) (bvslt (x!64635 lt!341784) #b01111111111111111111111111111110) (bvsge (x!64635 lt!341784) #b00000000000000000000000000000000) (bvsge (x!64635 lt!341784) x!1131)))))

(assert (=> b!768372 (=> (not res!519599) (not e!427922))))

(declare-fun b!768373 () Bool)

(declare-fun e!427921 () SeekEntryResult!7798)

(assert (=> b!768373 (= e!427920 e!427921)))

(declare-fun lt!341783 () (_ BitVec 64))

(declare-fun c!84781 () Bool)

(assert (=> b!768373 (= c!84781 (or (= lt!341783 (select (arr!20242 a!3186) j!159)) (= (bvadd lt!341783 lt!341783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768375 () Bool)

(assert (=> b!768375 (= e!427921 (Intermediate!7798 false index!1321 x!1131))))

(declare-fun b!768376 () Bool)

(assert (=> b!768376 (= e!427921 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768377 () Bool)

(assert (=> b!768377 (= e!427919 (bvsge (x!64635 lt!341784) #b01111111111111111111111111111110))))

(declare-fun b!768374 () Bool)

(assert (=> b!768374 (and (bvsge (index!33562 lt!341784) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341784) (size!20662 a!3186)))))

(assert (=> b!768374 (= e!427923 (= (select (arr!20242 a!3186) (index!33562 lt!341784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101639 () Bool)

(assert (=> d!101639 e!427919))

(declare-fun c!84782 () Bool)

(assert (=> d!101639 (= c!84782 (and ((_ is Intermediate!7798) lt!341784) (undefined!8610 lt!341784)))))

(assert (=> d!101639 (= lt!341784 e!427920)))

(declare-fun c!84780 () Bool)

(assert (=> d!101639 (= c!84780 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101639 (= lt!341783 (select (arr!20242 a!3186) index!1321))))

(assert (=> d!101639 (validMask!0 mask!3328)))

(assert (=> d!101639 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341784)))

(assert (= (and d!101639 c!84780) b!768371))

(assert (= (and d!101639 (not c!84780)) b!768373))

(assert (= (and b!768373 c!84781) b!768375))

(assert (= (and b!768373 (not c!84781)) b!768376))

(assert (= (and d!101639 c!84782) b!768377))

(assert (= (and d!101639 (not c!84782)) b!768372))

(assert (= (and b!768372 res!519599) b!768370))

(assert (= (and b!768370 (not res!519600)) b!768369))

(assert (= (and b!768369 (not res!519601)) b!768374))

(declare-fun m!714461 () Bool)

(assert (=> b!768374 m!714461))

(assert (=> b!768370 m!714461))

(assert (=> b!768369 m!714461))

(assert (=> b!768376 m!714349))

(assert (=> b!768376 m!714349))

(assert (=> b!768376 m!714199))

(declare-fun m!714463 () Bool)

(assert (=> b!768376 m!714463))

(assert (=> d!101639 m!714357))

(assert (=> d!101639 m!714215))

(assert (=> b!768051 d!101639))

(declare-fun b!768378 () Bool)

(declare-fun e!427924 () SeekEntryResult!7798)

(assert (=> b!768378 (= e!427924 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768379 () Bool)

(assert (=> b!768379 (= e!427924 (MissingVacant!7798 resIntermediateIndex!5))))

(declare-fun b!768380 () Bool)

(declare-fun e!427925 () SeekEntryResult!7798)

(declare-fun e!427926 () SeekEntryResult!7798)

(assert (=> b!768380 (= e!427925 e!427926)))

(declare-fun lt!341786 () (_ BitVec 64))

(declare-fun c!84783 () Bool)

(assert (=> b!768380 (= c!84783 (= lt!341786 (select (arr!20242 a!3186) j!159)))))

(declare-fun d!101643 () Bool)

(declare-fun lt!341785 () SeekEntryResult!7798)

(assert (=> d!101643 (and (or ((_ is Undefined!7798) lt!341785) (not ((_ is Found!7798) lt!341785)) (and (bvsge (index!33561 lt!341785) #b00000000000000000000000000000000) (bvslt (index!33561 lt!341785) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341785) ((_ is Found!7798) lt!341785) (not ((_ is MissingVacant!7798) lt!341785)) (not (= (index!33563 lt!341785) resIntermediateIndex!5)) (and (bvsge (index!33563 lt!341785) #b00000000000000000000000000000000) (bvslt (index!33563 lt!341785) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341785) (ite ((_ is Found!7798) lt!341785) (= (select (arr!20242 a!3186) (index!33561 lt!341785)) (select (arr!20242 a!3186) j!159)) (and ((_ is MissingVacant!7798) lt!341785) (= (index!33563 lt!341785) resIntermediateIndex!5) (= (select (arr!20242 a!3186) (index!33563 lt!341785)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101643 (= lt!341785 e!427925)))

(declare-fun c!84784 () Bool)

(assert (=> d!101643 (= c!84784 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101643 (= lt!341786 (select (arr!20242 a!3186) resIntermediateIndex!5))))

(assert (=> d!101643 (validMask!0 mask!3328)))

(assert (=> d!101643 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341785)))

(declare-fun b!768381 () Bool)

(declare-fun c!84785 () Bool)

(assert (=> b!768381 (= c!84785 (= lt!341786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768381 (= e!427926 e!427924)))

(declare-fun b!768382 () Bool)

(assert (=> b!768382 (= e!427925 Undefined!7798)))

(declare-fun b!768383 () Bool)

(assert (=> b!768383 (= e!427926 (Found!7798 resIntermediateIndex!5))))

(assert (= (and d!101643 c!84784) b!768382))

(assert (= (and d!101643 (not c!84784)) b!768380))

(assert (= (and b!768380 c!84783) b!768383))

(assert (= (and b!768380 (not c!84783)) b!768381))

(assert (= (and b!768381 c!84785) b!768379))

(assert (= (and b!768381 (not c!84785)) b!768378))

(declare-fun m!714465 () Bool)

(assert (=> b!768378 m!714465))

(assert (=> b!768378 m!714465))

(assert (=> b!768378 m!714199))

(declare-fun m!714467 () Bool)

(assert (=> b!768378 m!714467))

(declare-fun m!714469 () Bool)

(assert (=> d!101643 m!714469))

(declare-fun m!714471 () Bool)

(assert (=> d!101643 m!714471))

(assert (=> d!101643 m!714227))

(assert (=> d!101643 m!714215))

(assert (=> b!768038 d!101643))

(declare-fun b!768401 () Bool)

(declare-fun e!427939 () Bool)

(declare-fun call!35100 () Bool)

(assert (=> b!768401 (= e!427939 call!35100)))

(declare-fun b!768402 () Bool)

(declare-fun e!427940 () Bool)

(assert (=> b!768402 (= e!427940 e!427939)))

(declare-fun c!84791 () Bool)

(assert (=> b!768402 (= c!84791 (validKeyInArray!0 (select (arr!20242 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768403 () Bool)

(declare-fun e!427938 () Bool)

(assert (=> b!768403 (= e!427938 call!35100)))

(declare-fun d!101645 () Bool)

(declare-fun res!519610 () Bool)

(assert (=> d!101645 (=> res!519610 e!427940)))

(assert (=> d!101645 (= res!519610 (bvsge #b00000000000000000000000000000000 (size!20662 a!3186)))))

(assert (=> d!101645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427940)))

(declare-fun bm!35097 () Bool)

(assert (=> bm!35097 (= call!35100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768404 () Bool)

(assert (=> b!768404 (= e!427939 e!427938)))

(declare-fun lt!341811 () (_ BitVec 64))

(assert (=> b!768404 (= lt!341811 (select (arr!20242 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341809 () Unit!26401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42286 (_ BitVec 64) (_ BitVec 32)) Unit!26401)

(assert (=> b!768404 (= lt!341809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341811 #b00000000000000000000000000000000))))

(assert (=> b!768404 (arrayContainsKey!0 a!3186 lt!341811 #b00000000000000000000000000000000)))

(declare-fun lt!341810 () Unit!26401)

(assert (=> b!768404 (= lt!341810 lt!341809)))

(declare-fun res!519611 () Bool)

(assert (=> b!768404 (= res!519611 (= (seekEntryOrOpen!0 (select (arr!20242 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7798 #b00000000000000000000000000000000)))))

(assert (=> b!768404 (=> (not res!519611) (not e!427938))))

(assert (= (and d!101645 (not res!519610)) b!768402))

(assert (= (and b!768402 c!84791) b!768404))

(assert (= (and b!768402 (not c!84791)) b!768401))

(assert (= (and b!768404 res!519611) b!768403))

(assert (= (or b!768403 b!768401) bm!35097))

(assert (=> b!768402 m!714361))

(assert (=> b!768402 m!714361))

(assert (=> b!768402 m!714363))

(declare-fun m!714481 () Bool)

(assert (=> bm!35097 m!714481))

(assert (=> b!768404 m!714361))

(declare-fun m!714483 () Bool)

(assert (=> b!768404 m!714483))

(declare-fun m!714485 () Bool)

(assert (=> b!768404 m!714485))

(assert (=> b!768404 m!714361))

(declare-fun m!714487 () Bool)

(assert (=> b!768404 m!714487))

(assert (=> b!768049 d!101645))

(declare-fun b!768405 () Bool)

(declare-fun e!427942 () Bool)

(declare-fun call!35101 () Bool)

(assert (=> b!768405 (= e!427942 call!35101)))

(declare-fun b!768406 () Bool)

(declare-fun e!427943 () Bool)

(assert (=> b!768406 (= e!427943 e!427942)))

(declare-fun c!84792 () Bool)

(assert (=> b!768406 (= c!84792 (validKeyInArray!0 (select (arr!20242 a!3186) j!159)))))

(declare-fun b!768407 () Bool)

(declare-fun e!427941 () Bool)

(assert (=> b!768407 (= e!427941 call!35101)))

(declare-fun d!101657 () Bool)

(declare-fun res!519612 () Bool)

(assert (=> d!101657 (=> res!519612 e!427943)))

(assert (=> d!101657 (= res!519612 (bvsge j!159 (size!20662 a!3186)))))

(assert (=> d!101657 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427943)))

(declare-fun bm!35098 () Bool)

(assert (=> bm!35098 (= call!35101 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768408 () Bool)

(assert (=> b!768408 (= e!427942 e!427941)))

(declare-fun lt!341814 () (_ BitVec 64))

(assert (=> b!768408 (= lt!341814 (select (arr!20242 a!3186) j!159))))

(declare-fun lt!341812 () Unit!26401)

(assert (=> b!768408 (= lt!341812 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341814 j!159))))

(assert (=> b!768408 (arrayContainsKey!0 a!3186 lt!341814 #b00000000000000000000000000000000)))

(declare-fun lt!341813 () Unit!26401)

(assert (=> b!768408 (= lt!341813 lt!341812)))

(declare-fun res!519613 () Bool)

(assert (=> b!768408 (= res!519613 (= (seekEntryOrOpen!0 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) (Found!7798 j!159)))))

(assert (=> b!768408 (=> (not res!519613) (not e!427941))))

(assert (= (and d!101657 (not res!519612)) b!768406))

(assert (= (and b!768406 c!84792) b!768408))

(assert (= (and b!768406 (not c!84792)) b!768405))

(assert (= (and b!768408 res!519613) b!768407))

(assert (= (or b!768407 b!768405) bm!35098))

(assert (=> b!768406 m!714199))

(assert (=> b!768406 m!714199))

(assert (=> b!768406 m!714219))

(declare-fun m!714489 () Bool)

(assert (=> bm!35098 m!714489))

(assert (=> b!768408 m!714199))

(declare-fun m!714491 () Bool)

(assert (=> b!768408 m!714491))

(declare-fun m!714493 () Bool)

(assert (=> b!768408 m!714493))

(assert (=> b!768408 m!714199))

(assert (=> b!768408 m!714247))

(assert (=> b!768039 d!101657))

(declare-fun d!101659 () Bool)

(assert (=> d!101659 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341817 () Unit!26401)

(declare-fun choose!38 (array!42286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26401)

(assert (=> d!101659 (= lt!341817 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101659 (validMask!0 mask!3328)))

(assert (=> d!101659 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341817)))

(declare-fun bs!21538 () Bool)

(assert (= bs!21538 d!101659))

(assert (=> bs!21538 m!714239))

(declare-fun m!714495 () Bool)

(assert (=> bs!21538 m!714495))

(assert (=> bs!21538 m!714215))

(assert (=> b!768039 d!101659))

(declare-fun d!101661 () Bool)

(declare-fun res!519618 () Bool)

(declare-fun e!427954 () Bool)

(assert (=> d!101661 (=> res!519618 e!427954)))

(assert (=> d!101661 (= res!519618 (= (select (arr!20242 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101661 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!427954)))

(declare-fun b!768425 () Bool)

(declare-fun e!427955 () Bool)

(assert (=> b!768425 (= e!427954 e!427955)))

(declare-fun res!519619 () Bool)

(assert (=> b!768425 (=> (not res!519619) (not e!427955))))

(assert (=> b!768425 (= res!519619 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20662 a!3186)))))

(declare-fun b!768426 () Bool)

(assert (=> b!768426 (= e!427955 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101661 (not res!519618)) b!768425))

(assert (= (and b!768425 res!519619) b!768426))

(assert (=> d!101661 m!714361))

(declare-fun m!714497 () Bool)

(assert (=> b!768426 m!714497))

(assert (=> b!768053 d!101661))

(declare-fun b!768427 () Bool)

(declare-fun lt!341825 () SeekEntryResult!7798)

(assert (=> b!768427 (and (bvsge (index!33562 lt!341825) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341825) (size!20662 lt!341644)))))

(declare-fun res!519622 () Bool)

(assert (=> b!768427 (= res!519622 (= (select (arr!20242 lt!341644) (index!33562 lt!341825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427960 () Bool)

(assert (=> b!768427 (=> res!519622 e!427960)))

(declare-fun b!768428 () Bool)

(assert (=> b!768428 (and (bvsge (index!33562 lt!341825) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341825) (size!20662 lt!341644)))))

(declare-fun res!519621 () Bool)

(assert (=> b!768428 (= res!519621 (= (select (arr!20242 lt!341644) (index!33562 lt!341825)) lt!341645))))

(assert (=> b!768428 (=> res!519621 e!427960)))

(declare-fun e!427959 () Bool)

(assert (=> b!768428 (= e!427959 e!427960)))

(declare-fun b!768429 () Bool)

(declare-fun e!427957 () SeekEntryResult!7798)

(assert (=> b!768429 (= e!427957 (Intermediate!7798 true index!1321 x!1131))))

(declare-fun b!768430 () Bool)

(declare-fun e!427956 () Bool)

(assert (=> b!768430 (= e!427956 e!427959)))

(declare-fun res!519620 () Bool)

(assert (=> b!768430 (= res!519620 (and ((_ is Intermediate!7798) lt!341825) (not (undefined!8610 lt!341825)) (bvslt (x!64635 lt!341825) #b01111111111111111111111111111110) (bvsge (x!64635 lt!341825) #b00000000000000000000000000000000) (bvsge (x!64635 lt!341825) x!1131)))))

(assert (=> b!768430 (=> (not res!519620) (not e!427959))))

(declare-fun b!768431 () Bool)

(declare-fun e!427958 () SeekEntryResult!7798)

(assert (=> b!768431 (= e!427957 e!427958)))

(declare-fun c!84800 () Bool)

(declare-fun lt!341824 () (_ BitVec 64))

(assert (=> b!768431 (= c!84800 (or (= lt!341824 lt!341645) (= (bvadd lt!341824 lt!341824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768433 () Bool)

(assert (=> b!768433 (= e!427958 (Intermediate!7798 false index!1321 x!1131))))

(declare-fun b!768434 () Bool)

(assert (=> b!768434 (= e!427958 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!341645 lt!341644 mask!3328))))

(declare-fun b!768435 () Bool)

(assert (=> b!768435 (= e!427956 (bvsge (x!64635 lt!341825) #b01111111111111111111111111111110))))

(declare-fun b!768432 () Bool)

(assert (=> b!768432 (and (bvsge (index!33562 lt!341825) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341825) (size!20662 lt!341644)))))

(assert (=> b!768432 (= e!427960 (= (select (arr!20242 lt!341644) (index!33562 lt!341825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101667 () Bool)

(assert (=> d!101667 e!427956))

(declare-fun c!84801 () Bool)

(assert (=> d!101667 (= c!84801 (and ((_ is Intermediate!7798) lt!341825) (undefined!8610 lt!341825)))))

(assert (=> d!101667 (= lt!341825 e!427957)))

(declare-fun c!84799 () Bool)

(assert (=> d!101667 (= c!84799 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101667 (= lt!341824 (select (arr!20242 lt!341644) index!1321))))

(assert (=> d!101667 (validMask!0 mask!3328)))

(assert (=> d!101667 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341645 lt!341644 mask!3328) lt!341825)))

(assert (= (and d!101667 c!84799) b!768429))

(assert (= (and d!101667 (not c!84799)) b!768431))

(assert (= (and b!768431 c!84800) b!768433))

(assert (= (and b!768431 (not c!84800)) b!768434))

(assert (= (and d!101667 c!84801) b!768435))

(assert (= (and d!101667 (not c!84801)) b!768430))

(assert (= (and b!768430 res!519620) b!768428))

(assert (= (and b!768428 (not res!519621)) b!768427))

(assert (= (and b!768427 (not res!519622)) b!768432))

(declare-fun m!714499 () Bool)

(assert (=> b!768432 m!714499))

(assert (=> b!768428 m!714499))

(assert (=> b!768427 m!714499))

(assert (=> b!768434 m!714349))

(assert (=> b!768434 m!714349))

(declare-fun m!714501 () Bool)

(assert (=> b!768434 m!714501))

(declare-fun m!714503 () Bool)

(assert (=> d!101667 m!714503))

(assert (=> d!101667 m!714215))

(assert (=> b!768043 d!101667))

(declare-fun b!768436 () Bool)

(declare-fun lt!341827 () SeekEntryResult!7798)

(assert (=> b!768436 (and (bvsge (index!33562 lt!341827) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341827) (size!20662 lt!341644)))))

(declare-fun res!519625 () Bool)

(assert (=> b!768436 (= res!519625 (= (select (arr!20242 lt!341644) (index!33562 lt!341827)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427965 () Bool)

(assert (=> b!768436 (=> res!519625 e!427965)))

(declare-fun b!768437 () Bool)

(assert (=> b!768437 (and (bvsge (index!33562 lt!341827) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341827) (size!20662 lt!341644)))))

(declare-fun res!519624 () Bool)

(assert (=> b!768437 (= res!519624 (= (select (arr!20242 lt!341644) (index!33562 lt!341827)) lt!341645))))

(assert (=> b!768437 (=> res!519624 e!427965)))

(declare-fun e!427964 () Bool)

(assert (=> b!768437 (= e!427964 e!427965)))

(declare-fun b!768438 () Bool)

(declare-fun e!427962 () SeekEntryResult!7798)

(assert (=> b!768438 (= e!427962 (Intermediate!7798 true (toIndex!0 lt!341645 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768439 () Bool)

(declare-fun e!427961 () Bool)

(assert (=> b!768439 (= e!427961 e!427964)))

(declare-fun res!519623 () Bool)

(assert (=> b!768439 (= res!519623 (and ((_ is Intermediate!7798) lt!341827) (not (undefined!8610 lt!341827)) (bvslt (x!64635 lt!341827) #b01111111111111111111111111111110) (bvsge (x!64635 lt!341827) #b00000000000000000000000000000000) (bvsge (x!64635 lt!341827) #b00000000000000000000000000000000)))))

(assert (=> b!768439 (=> (not res!519623) (not e!427964))))

(declare-fun b!768440 () Bool)

(declare-fun e!427963 () SeekEntryResult!7798)

(assert (=> b!768440 (= e!427962 e!427963)))

(declare-fun c!84803 () Bool)

(declare-fun lt!341826 () (_ BitVec 64))

(assert (=> b!768440 (= c!84803 (or (= lt!341826 lt!341645) (= (bvadd lt!341826 lt!341826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768442 () Bool)

(assert (=> b!768442 (= e!427963 (Intermediate!7798 false (toIndex!0 lt!341645 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768443 () Bool)

(assert (=> b!768443 (= e!427963 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341645 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!341645 lt!341644 mask!3328))))

(declare-fun b!768444 () Bool)

(assert (=> b!768444 (= e!427961 (bvsge (x!64635 lt!341827) #b01111111111111111111111111111110))))

(declare-fun b!768441 () Bool)

(assert (=> b!768441 (and (bvsge (index!33562 lt!341827) #b00000000000000000000000000000000) (bvslt (index!33562 lt!341827) (size!20662 lt!341644)))))

(assert (=> b!768441 (= e!427965 (= (select (arr!20242 lt!341644) (index!33562 lt!341827)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101669 () Bool)

(assert (=> d!101669 e!427961))

(declare-fun c!84804 () Bool)

(assert (=> d!101669 (= c!84804 (and ((_ is Intermediate!7798) lt!341827) (undefined!8610 lt!341827)))))

(assert (=> d!101669 (= lt!341827 e!427962)))

(declare-fun c!84802 () Bool)

(assert (=> d!101669 (= c!84802 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101669 (= lt!341826 (select (arr!20242 lt!341644) (toIndex!0 lt!341645 mask!3328)))))

(assert (=> d!101669 (validMask!0 mask!3328)))

(assert (=> d!101669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341645 mask!3328) lt!341645 lt!341644 mask!3328) lt!341827)))

(assert (= (and d!101669 c!84802) b!768438))

(assert (= (and d!101669 (not c!84802)) b!768440))

(assert (= (and b!768440 c!84803) b!768442))

(assert (= (and b!768440 (not c!84803)) b!768443))

(assert (= (and d!101669 c!84804) b!768444))

(assert (= (and d!101669 (not c!84804)) b!768439))

(assert (= (and b!768439 res!519623) b!768437))

(assert (= (and b!768437 (not res!519624)) b!768436))

(assert (= (and b!768436 (not res!519625)) b!768441))

(declare-fun m!714505 () Bool)

(assert (=> b!768441 m!714505))

(assert (=> b!768437 m!714505))

(assert (=> b!768436 m!714505))

(assert (=> b!768443 m!714205))

(declare-fun m!714507 () Bool)

(assert (=> b!768443 m!714507))

(assert (=> b!768443 m!714507))

(declare-fun m!714509 () Bool)

(assert (=> b!768443 m!714509))

(assert (=> d!101669 m!714205))

(declare-fun m!714511 () Bool)

(assert (=> d!101669 m!714511))

(assert (=> d!101669 m!714215))

(assert (=> b!768043 d!101669))

(declare-fun d!101671 () Bool)

(declare-fun lt!341829 () (_ BitVec 32))

(declare-fun lt!341828 () (_ BitVec 32))

(assert (=> d!101671 (= lt!341829 (bvmul (bvxor lt!341828 (bvlshr lt!341828 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101671 (= lt!341828 ((_ extract 31 0) (bvand (bvxor lt!341645 (bvlshr lt!341645 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101671 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519576 (let ((h!15249 ((_ extract 31 0) (bvand (bvxor lt!341645 (bvlshr lt!341645 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64642 (bvmul (bvxor h!15249 (bvlshr h!15249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64642 (bvlshr x!64642 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519576 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519576 #b00000000000000000000000000000000))))))

(assert (=> d!101671 (= (toIndex!0 lt!341645 mask!3328) (bvand (bvxor lt!341829 (bvlshr lt!341829 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768043 d!101671))

(declare-fun b!768445 () Bool)

(declare-fun c!84805 () Bool)

(declare-fun lt!341830 () (_ BitVec 64))

(assert (=> b!768445 (= c!84805 (= lt!341830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427966 () SeekEntryResult!7798)

(declare-fun e!427967 () SeekEntryResult!7798)

(assert (=> b!768445 (= e!427966 e!427967)))

(declare-fun b!768446 () Bool)

(declare-fun lt!341832 () SeekEntryResult!7798)

(assert (=> b!768446 (= e!427967 (seekKeyOrZeroReturnVacant!0 (x!64635 lt!341832) (index!33562 lt!341832) (index!33562 lt!341832) (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768447 () Bool)

(assert (=> b!768447 (= e!427966 (Found!7798 (index!33562 lt!341832)))))

(declare-fun b!768448 () Bool)

(declare-fun e!427968 () SeekEntryResult!7798)

(assert (=> b!768448 (= e!427968 e!427966)))

(assert (=> b!768448 (= lt!341830 (select (arr!20242 a!3186) (index!33562 lt!341832)))))

(declare-fun c!84806 () Bool)

(assert (=> b!768448 (= c!84806 (= lt!341830 (select (arr!20242 a!3186) j!159)))))

(declare-fun b!768449 () Bool)

(assert (=> b!768449 (= e!427968 Undefined!7798)))

(declare-fun d!101673 () Bool)

(declare-fun lt!341831 () SeekEntryResult!7798)

(assert (=> d!101673 (and (or ((_ is Undefined!7798) lt!341831) (not ((_ is Found!7798) lt!341831)) (and (bvsge (index!33561 lt!341831) #b00000000000000000000000000000000) (bvslt (index!33561 lt!341831) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341831) ((_ is Found!7798) lt!341831) (not ((_ is MissingZero!7798) lt!341831)) (and (bvsge (index!33560 lt!341831) #b00000000000000000000000000000000) (bvslt (index!33560 lt!341831) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341831) ((_ is Found!7798) lt!341831) ((_ is MissingZero!7798) lt!341831) (not ((_ is MissingVacant!7798) lt!341831)) (and (bvsge (index!33563 lt!341831) #b00000000000000000000000000000000) (bvslt (index!33563 lt!341831) (size!20662 a!3186)))) (or ((_ is Undefined!7798) lt!341831) (ite ((_ is Found!7798) lt!341831) (= (select (arr!20242 a!3186) (index!33561 lt!341831)) (select (arr!20242 a!3186) j!159)) (ite ((_ is MissingZero!7798) lt!341831) (= (select (arr!20242 a!3186) (index!33560 lt!341831)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7798) lt!341831) (= (select (arr!20242 a!3186) (index!33563 lt!341831)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101673 (= lt!341831 e!427968)))

(declare-fun c!84807 () Bool)

(assert (=> d!101673 (= c!84807 (and ((_ is Intermediate!7798) lt!341832) (undefined!8610 lt!341832)))))

(assert (=> d!101673 (= lt!341832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) (select (arr!20242 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101673 (validMask!0 mask!3328)))

(assert (=> d!101673 (= (seekEntryOrOpen!0 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341831)))

(declare-fun b!768450 () Bool)

(assert (=> b!768450 (= e!427967 (MissingZero!7798 (index!33562 lt!341832)))))

(assert (= (and d!101673 c!84807) b!768449))

(assert (= (and d!101673 (not c!84807)) b!768448))

(assert (= (and b!768448 c!84806) b!768447))

(assert (= (and b!768448 (not c!84806)) b!768445))

(assert (= (and b!768445 c!84805) b!768450))

(assert (= (and b!768445 (not c!84805)) b!768446))

(assert (=> b!768446 m!714199))

(declare-fun m!714513 () Bool)

(assert (=> b!768446 m!714513))

(declare-fun m!714515 () Bool)

(assert (=> b!768448 m!714515))

(assert (=> d!101673 m!714199))

(assert (=> d!101673 m!714243))

(declare-fun m!714517 () Bool)

(assert (=> d!101673 m!714517))

(declare-fun m!714519 () Bool)

(assert (=> d!101673 m!714519))

(assert (=> d!101673 m!714215))

(assert (=> d!101673 m!714243))

(assert (=> d!101673 m!714199))

(assert (=> d!101673 m!714245))

(declare-fun m!714521 () Bool)

(assert (=> d!101673 m!714521))

(assert (=> b!768041 d!101673))

(check-sat (not d!101617) (not d!101603) (not d!101667) (not b!768426) (not b!768406) (not d!101605) (not b!768408) (not b!768378) (not b!768256) (not d!101643) (not b!768354) (not b!768446) (not d!101639) (not d!101659) (not bm!35097) (not b!768205) (not b!768376) (not d!101669) (not b!768443) (not bm!35091) (not b!768186) (not d!101635) (not d!101627) (not b!768402) (not bm!35098) (not b!768404) (not b!768204) (not b!768202) (not b!768434) (not d!101673) (not b!768340))
(check-sat)
