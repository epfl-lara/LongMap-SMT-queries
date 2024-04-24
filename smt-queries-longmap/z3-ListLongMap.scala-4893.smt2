; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67588 () Bool)

(assert start!67588)

(declare-fun b!781423 () Bool)

(declare-datatypes ((Unit!26905 0))(
  ( (Unit!26906) )
))
(declare-fun e!434702 () Unit!26905)

(declare-fun Unit!26907 () Unit!26905)

(assert (=> b!781423 (= e!434702 Unit!26907)))

(declare-fun b!781425 () Bool)

(declare-fun res!528594 () Bool)

(declare-fun e!434707 () Bool)

(assert (=> b!781425 (=> (not res!528594) (not e!434707))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42634 0))(
  ( (array!42635 (arr!20404 (Array (_ BitVec 32) (_ BitVec 64))) (size!20824 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42634)

(assert (=> b!781425 (= res!528594 (and (= (size!20824 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20824 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20824 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781426 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun e!434704 () Bool)

(assert (=> b!781426 (= e!434704 (= (select (store (arr!20404 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!348223 () Unit!26905)

(assert (=> b!781426 (= lt!348223 e!434702)))

(declare-fun c!86830 () Bool)

(assert (=> b!781426 (= c!86830 (= (select (store (arr!20404 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781427 () Bool)

(declare-fun e!434703 () Bool)

(declare-fun e!434706 () Bool)

(assert (=> b!781427 (= e!434703 e!434706)))

(declare-fun res!528579 () Bool)

(assert (=> b!781427 (=> (not res!528579) (not e!434706))))

(declare-datatypes ((SeekEntryResult!7960 0))(
  ( (MissingZero!7960 (index!34208 (_ BitVec 32))) (Found!7960 (index!34209 (_ BitVec 32))) (Intermediate!7960 (undefined!8772 Bool) (index!34210 (_ BitVec 32)) (x!65317 (_ BitVec 32))) (Undefined!7960) (MissingVacant!7960 (index!34211 (_ BitVec 32))) )
))
(declare-fun lt!348218 () SeekEntryResult!7960)

(declare-fun lt!348225 () SeekEntryResult!7960)

(assert (=> b!781427 (= res!528579 (= lt!348218 lt!348225))))

(declare-fun lt!348226 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!348221 () array!42634)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42634 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!781427 (= lt!348225 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348226 lt!348221 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781427 (= lt!348218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348226 mask!3328) lt!348226 lt!348221 mask!3328))))

(assert (=> b!781427 (= lt!348226 (select (store (arr!20404 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781427 (= lt!348221 (array!42635 (store (arr!20404 a!3186) i!1173 k0!2102) (size!20824 a!3186)))))

(declare-fun b!781428 () Bool)

(declare-fun e!434708 () Bool)

(assert (=> b!781428 (= e!434707 e!434708)))

(declare-fun res!528589 () Bool)

(assert (=> b!781428 (=> (not res!528589) (not e!434708))))

(declare-fun lt!348219 () SeekEntryResult!7960)

(assert (=> b!781428 (= res!528589 (or (= lt!348219 (MissingZero!7960 i!1173)) (= lt!348219 (MissingVacant!7960 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42634 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!781428 (= lt!348219 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!348224 () SeekEntryResult!7960)

(declare-fun e!434709 () Bool)

(declare-fun b!781429 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42634 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!781429 (= e!434709 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348224))))

(declare-fun b!781430 () Bool)

(assert (=> b!781430 (= e!434708 e!434703)))

(declare-fun res!528581 () Bool)

(assert (=> b!781430 (=> (not res!528581) (not e!434703))))

(declare-fun lt!348222 () SeekEntryResult!7960)

(assert (=> b!781430 (= res!528581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348222))))

(assert (=> b!781430 (= lt!348222 (Intermediate!7960 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!434705 () Bool)

(declare-fun b!781431 () Bool)

(assert (=> b!781431 (= e!434705 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) (Found!7960 j!159)))))

(declare-fun b!781432 () Bool)

(declare-fun res!528590 () Bool)

(assert (=> b!781432 (=> (not res!528590) (not e!434703))))

(assert (=> b!781432 (= res!528590 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20404 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781433 () Bool)

(declare-fun res!528587 () Bool)

(assert (=> b!781433 (=> (not res!528587) (not e!434708))))

(assert (=> b!781433 (= res!528587 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20824 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20824 a!3186))))))

(declare-fun b!781434 () Bool)

(declare-fun res!528592 () Bool)

(assert (=> b!781434 (=> (not res!528592) (not e!434707))))

(declare-fun arrayContainsKey!0 (array!42634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781434 (= res!528592 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781424 () Bool)

(declare-fun res!528584 () Bool)

(assert (=> b!781424 (=> res!528584 e!434704)))

(assert (=> b!781424 (= res!528584 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348224)))))

(declare-fun res!528580 () Bool)

(assert (=> start!67588 (=> (not res!528580) (not e!434707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67588 (= res!528580 (validMask!0 mask!3328))))

(assert (=> start!67588 e!434707))

(assert (=> start!67588 true))

(declare-fun array_inv!16263 (array!42634) Bool)

(assert (=> start!67588 (array_inv!16263 a!3186)))

(declare-fun b!781435 () Bool)

(declare-fun res!528582 () Bool)

(assert (=> b!781435 (=> (not res!528582) (not e!434703))))

(assert (=> b!781435 (= res!528582 e!434705)))

(declare-fun c!86831 () Bool)

(assert (=> b!781435 (= c!86831 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781436 () Bool)

(declare-fun res!528591 () Bool)

(assert (=> b!781436 (=> (not res!528591) (not e!434708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42634 (_ BitVec 32)) Bool)

(assert (=> b!781436 (= res!528591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781437 () Bool)

(assert (=> b!781437 (= e!434706 (not e!434704))))

(declare-fun res!528585 () Bool)

(assert (=> b!781437 (=> res!528585 e!434704)))

(get-info :version)

(assert (=> b!781437 (= res!528585 (or (not ((_ is Intermediate!7960) lt!348225)) (bvslt x!1131 (x!65317 lt!348225)) (not (= x!1131 (x!65317 lt!348225))) (not (= index!1321 (index!34210 lt!348225)))))))

(assert (=> b!781437 e!434709))

(declare-fun res!528578 () Bool)

(assert (=> b!781437 (=> (not res!528578) (not e!434709))))

(declare-fun lt!348217 () SeekEntryResult!7960)

(assert (=> b!781437 (= res!528578 (= lt!348217 lt!348224))))

(assert (=> b!781437 (= lt!348224 (Found!7960 j!159))))

(assert (=> b!781437 (= lt!348217 (seekEntryOrOpen!0 (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781437 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348220 () Unit!26905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26905)

(assert (=> b!781437 (= lt!348220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781438 () Bool)

(declare-fun res!528586 () Bool)

(assert (=> b!781438 (=> (not res!528586) (not e!434708))))

(declare-datatypes ((List!14313 0))(
  ( (Nil!14310) (Cons!14309 (h!15432 (_ BitVec 64)) (t!20620 List!14313)) )
))
(declare-fun arrayNoDuplicates!0 (array!42634 (_ BitVec 32) List!14313) Bool)

(assert (=> b!781438 (= res!528586 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14310))))

(declare-fun b!781439 () Bool)

(declare-fun res!528588 () Bool)

(assert (=> b!781439 (=> res!528588 e!434704)))

(assert (=> b!781439 (= res!528588 (= (select (store (arr!20404 a!3186) i!1173 k0!2102) index!1321) lt!348226))))

(declare-fun b!781440 () Bool)

(declare-fun res!528583 () Bool)

(assert (=> b!781440 (=> (not res!528583) (not e!434707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781440 (= res!528583 (validKeyInArray!0 k0!2102))))

(declare-fun b!781441 () Bool)

(assert (=> b!781441 (= e!434705 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348222))))

(declare-fun b!781442 () Bool)

(declare-fun Unit!26908 () Unit!26905)

(assert (=> b!781442 (= e!434702 Unit!26908)))

(assert (=> b!781442 false))

(declare-fun b!781443 () Bool)

(declare-fun res!528593 () Bool)

(assert (=> b!781443 (=> (not res!528593) (not e!434707))))

(assert (=> b!781443 (= res!528593 (validKeyInArray!0 (select (arr!20404 a!3186) j!159)))))

(assert (= (and start!67588 res!528580) b!781425))

(assert (= (and b!781425 res!528594) b!781443))

(assert (= (and b!781443 res!528593) b!781440))

(assert (= (and b!781440 res!528583) b!781434))

(assert (= (and b!781434 res!528592) b!781428))

(assert (= (and b!781428 res!528589) b!781436))

(assert (= (and b!781436 res!528591) b!781438))

(assert (= (and b!781438 res!528586) b!781433))

(assert (= (and b!781433 res!528587) b!781430))

(assert (= (and b!781430 res!528581) b!781432))

(assert (= (and b!781432 res!528590) b!781435))

(assert (= (and b!781435 c!86831) b!781441))

(assert (= (and b!781435 (not c!86831)) b!781431))

(assert (= (and b!781435 res!528582) b!781427))

(assert (= (and b!781427 res!528579) b!781437))

(assert (= (and b!781437 res!528578) b!781429))

(assert (= (and b!781437 (not res!528585)) b!781424))

(assert (= (and b!781424 (not res!528584)) b!781439))

(assert (= (and b!781439 (not res!528588)) b!781426))

(assert (= (and b!781426 c!86830) b!781442))

(assert (= (and b!781426 (not c!86830)) b!781423))

(declare-fun m!725063 () Bool)

(assert (=> b!781434 m!725063))

(declare-fun m!725065 () Bool)

(assert (=> b!781431 m!725065))

(assert (=> b!781431 m!725065))

(declare-fun m!725067 () Bool)

(assert (=> b!781431 m!725067))

(assert (=> b!781429 m!725065))

(assert (=> b!781429 m!725065))

(declare-fun m!725069 () Bool)

(assert (=> b!781429 m!725069))

(declare-fun m!725071 () Bool)

(assert (=> b!781438 m!725071))

(declare-fun m!725073 () Bool)

(assert (=> b!781426 m!725073))

(declare-fun m!725075 () Bool)

(assert (=> b!781426 m!725075))

(declare-fun m!725077 () Bool)

(assert (=> b!781428 m!725077))

(assert (=> b!781439 m!725073))

(assert (=> b!781439 m!725075))

(declare-fun m!725079 () Bool)

(assert (=> b!781432 m!725079))

(declare-fun m!725081 () Bool)

(assert (=> b!781427 m!725081))

(assert (=> b!781427 m!725073))

(declare-fun m!725083 () Bool)

(assert (=> b!781427 m!725083))

(declare-fun m!725085 () Bool)

(assert (=> b!781427 m!725085))

(declare-fun m!725087 () Bool)

(assert (=> b!781427 m!725087))

(assert (=> b!781427 m!725085))

(declare-fun m!725089 () Bool)

(assert (=> b!781436 m!725089))

(assert (=> b!781443 m!725065))

(assert (=> b!781443 m!725065))

(declare-fun m!725091 () Bool)

(assert (=> b!781443 m!725091))

(assert (=> b!781430 m!725065))

(assert (=> b!781430 m!725065))

(declare-fun m!725093 () Bool)

(assert (=> b!781430 m!725093))

(assert (=> b!781430 m!725093))

(assert (=> b!781430 m!725065))

(declare-fun m!725095 () Bool)

(assert (=> b!781430 m!725095))

(declare-fun m!725097 () Bool)

(assert (=> b!781440 m!725097))

(declare-fun m!725099 () Bool)

(assert (=> start!67588 m!725099))

(declare-fun m!725101 () Bool)

(assert (=> start!67588 m!725101))

(assert (=> b!781424 m!725065))

(assert (=> b!781424 m!725065))

(assert (=> b!781424 m!725067))

(assert (=> b!781437 m!725065))

(assert (=> b!781437 m!725065))

(declare-fun m!725103 () Bool)

(assert (=> b!781437 m!725103))

(declare-fun m!725105 () Bool)

(assert (=> b!781437 m!725105))

(declare-fun m!725107 () Bool)

(assert (=> b!781437 m!725107))

(assert (=> b!781441 m!725065))

(assert (=> b!781441 m!725065))

(declare-fun m!725109 () Bool)

(assert (=> b!781441 m!725109))

(check-sat (not b!781437) (not b!781443) (not b!781431) (not b!781438) (not start!67588) (not b!781428) (not b!781424) (not b!781430) (not b!781434) (not b!781440) (not b!781429) (not b!781436) (not b!781427) (not b!781441))
(check-sat)
(get-model)

(declare-fun b!781582 () Bool)

(declare-fun e!434773 () SeekEntryResult!7960)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781582 (= e!434773 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781583 () Bool)

(declare-fun e!434771 () SeekEntryResult!7960)

(assert (=> b!781583 (= e!434771 Undefined!7960)))

(declare-fun b!781584 () Bool)

(declare-fun e!434772 () SeekEntryResult!7960)

(assert (=> b!781584 (= e!434772 (Found!7960 index!1321))))

(declare-fun b!781585 () Bool)

(assert (=> b!781585 (= e!434773 (MissingVacant!7960 resIntermediateIndex!5))))

(declare-fun d!102777 () Bool)

(declare-fun lt!348291 () SeekEntryResult!7960)

(assert (=> d!102777 (and (or ((_ is Undefined!7960) lt!348291) (not ((_ is Found!7960) lt!348291)) (and (bvsge (index!34209 lt!348291) #b00000000000000000000000000000000) (bvslt (index!34209 lt!348291) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348291) ((_ is Found!7960) lt!348291) (not ((_ is MissingVacant!7960) lt!348291)) (not (= (index!34211 lt!348291) resIntermediateIndex!5)) (and (bvsge (index!34211 lt!348291) #b00000000000000000000000000000000) (bvslt (index!34211 lt!348291) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348291) (ite ((_ is Found!7960) lt!348291) (= (select (arr!20404 a!3186) (index!34209 lt!348291)) (select (arr!20404 a!3186) j!159)) (and ((_ is MissingVacant!7960) lt!348291) (= (index!34211 lt!348291) resIntermediateIndex!5) (= (select (arr!20404 a!3186) (index!34211 lt!348291)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102777 (= lt!348291 e!434771)))

(declare-fun c!86851 () Bool)

(assert (=> d!102777 (= c!86851 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!348292 () (_ BitVec 64))

(assert (=> d!102777 (= lt!348292 (select (arr!20404 a!3186) index!1321))))

(assert (=> d!102777 (validMask!0 mask!3328)))

(assert (=> d!102777 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348291)))

(declare-fun b!781586 () Bool)

(declare-fun c!86852 () Bool)

(assert (=> b!781586 (= c!86852 (= lt!348292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781586 (= e!434772 e!434773)))

(declare-fun b!781587 () Bool)

(assert (=> b!781587 (= e!434771 e!434772)))

(declare-fun c!86850 () Bool)

(assert (=> b!781587 (= c!86850 (= lt!348292 (select (arr!20404 a!3186) j!159)))))

(assert (= (and d!102777 c!86851) b!781583))

(assert (= (and d!102777 (not c!86851)) b!781587))

(assert (= (and b!781587 c!86850) b!781584))

(assert (= (and b!781587 (not c!86850)) b!781586))

(assert (= (and b!781586 c!86852) b!781585))

(assert (= (and b!781586 (not c!86852)) b!781582))

(declare-fun m!725207 () Bool)

(assert (=> b!781582 m!725207))

(assert (=> b!781582 m!725207))

(assert (=> b!781582 m!725065))

(declare-fun m!725209 () Bool)

(assert (=> b!781582 m!725209))

(declare-fun m!725211 () Bool)

(assert (=> d!102777 m!725211))

(declare-fun m!725213 () Bool)

(assert (=> d!102777 m!725213))

(declare-fun m!725215 () Bool)

(assert (=> d!102777 m!725215))

(assert (=> d!102777 m!725099))

(assert (=> b!781424 d!102777))

(declare-fun bm!35262 () Bool)

(declare-fun call!35265 () Bool)

(assert (=> bm!35262 (= call!35265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102781 () Bool)

(declare-fun res!528701 () Bool)

(declare-fun e!434781 () Bool)

(assert (=> d!102781 (=> res!528701 e!434781)))

(assert (=> d!102781 (= res!528701 (bvsge #b00000000000000000000000000000000 (size!20824 a!3186)))))

(assert (=> d!102781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!434781)))

(declare-fun b!781596 () Bool)

(declare-fun e!434780 () Bool)

(declare-fun e!434782 () Bool)

(assert (=> b!781596 (= e!434780 e!434782)))

(declare-fun lt!348303 () (_ BitVec 64))

(assert (=> b!781596 (= lt!348303 (select (arr!20404 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!348304 () Unit!26905)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42634 (_ BitVec 64) (_ BitVec 32)) Unit!26905)

(assert (=> b!781596 (= lt!348304 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348303 #b00000000000000000000000000000000))))

(assert (=> b!781596 (arrayContainsKey!0 a!3186 lt!348303 #b00000000000000000000000000000000)))

(declare-fun lt!348305 () Unit!26905)

(assert (=> b!781596 (= lt!348305 lt!348304)))

(declare-fun res!528702 () Bool)

(assert (=> b!781596 (= res!528702 (= (seekEntryOrOpen!0 (select (arr!20404 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7960 #b00000000000000000000000000000000)))))

(assert (=> b!781596 (=> (not res!528702) (not e!434782))))

(declare-fun b!781597 () Bool)

(assert (=> b!781597 (= e!434780 call!35265)))

(declare-fun b!781598 () Bool)

(assert (=> b!781598 (= e!434781 e!434780)))

(declare-fun c!86855 () Bool)

(assert (=> b!781598 (= c!86855 (validKeyInArray!0 (select (arr!20404 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781599 () Bool)

(assert (=> b!781599 (= e!434782 call!35265)))

(assert (= (and d!102781 (not res!528701)) b!781598))

(assert (= (and b!781598 c!86855) b!781596))

(assert (= (and b!781598 (not c!86855)) b!781597))

(assert (= (and b!781596 res!528702) b!781599))

(assert (= (or b!781599 b!781597) bm!35262))

(declare-fun m!725217 () Bool)

(assert (=> bm!35262 m!725217))

(declare-fun m!725219 () Bool)

(assert (=> b!781596 m!725219))

(declare-fun m!725221 () Bool)

(assert (=> b!781596 m!725221))

(declare-fun m!725223 () Bool)

(assert (=> b!781596 m!725223))

(assert (=> b!781596 m!725219))

(declare-fun m!725225 () Bool)

(assert (=> b!781596 m!725225))

(assert (=> b!781598 m!725219))

(assert (=> b!781598 m!725219))

(declare-fun m!725227 () Bool)

(assert (=> b!781598 m!725227))

(assert (=> b!781436 d!102781))

(declare-fun d!102783 () Bool)

(assert (=> d!102783 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67588 d!102783))

(declare-fun d!102787 () Bool)

(assert (=> d!102787 (= (array_inv!16263 a!3186) (bvsge (size!20824 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67588 d!102787))

(declare-fun d!102789 () Bool)

(assert (=> d!102789 (= (validKeyInArray!0 (select (arr!20404 a!3186) j!159)) (and (not (= (select (arr!20404 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20404 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!781443 d!102789))

(declare-fun d!102791 () Bool)

(declare-fun res!528707 () Bool)

(declare-fun e!434796 () Bool)

(assert (=> d!102791 (=> res!528707 e!434796)))

(assert (=> d!102791 (= res!528707 (= (select (arr!20404 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102791 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!434796)))

(declare-fun b!781622 () Bool)

(declare-fun e!434797 () Bool)

(assert (=> b!781622 (= e!434796 e!434797)))

(declare-fun res!528708 () Bool)

(assert (=> b!781622 (=> (not res!528708) (not e!434797))))

(assert (=> b!781622 (= res!528708 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20824 a!3186)))))

(declare-fun b!781623 () Bool)

(assert (=> b!781623 (= e!434797 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102791 (not res!528707)) b!781622))

(assert (= (and b!781622 res!528708) b!781623))

(assert (=> d!102791 m!725219))

(declare-fun m!725243 () Bool)

(assert (=> b!781623 m!725243))

(assert (=> b!781434 d!102791))

(declare-fun e!434800 () SeekEntryResult!7960)

(declare-fun b!781624 () Bool)

(assert (=> b!781624 (= e!434800 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781625 () Bool)

(declare-fun e!434798 () SeekEntryResult!7960)

(assert (=> b!781625 (= e!434798 Undefined!7960)))

(declare-fun b!781626 () Bool)

(declare-fun e!434799 () SeekEntryResult!7960)

(assert (=> b!781626 (= e!434799 (Found!7960 resIntermediateIndex!5))))

(declare-fun b!781627 () Bool)

(assert (=> b!781627 (= e!434800 (MissingVacant!7960 resIntermediateIndex!5))))

(declare-fun d!102795 () Bool)

(declare-fun lt!348311 () SeekEntryResult!7960)

(assert (=> d!102795 (and (or ((_ is Undefined!7960) lt!348311) (not ((_ is Found!7960) lt!348311)) (and (bvsge (index!34209 lt!348311) #b00000000000000000000000000000000) (bvslt (index!34209 lt!348311) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348311) ((_ is Found!7960) lt!348311) (not ((_ is MissingVacant!7960) lt!348311)) (not (= (index!34211 lt!348311) resIntermediateIndex!5)) (and (bvsge (index!34211 lt!348311) #b00000000000000000000000000000000) (bvslt (index!34211 lt!348311) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348311) (ite ((_ is Found!7960) lt!348311) (= (select (arr!20404 a!3186) (index!34209 lt!348311)) (select (arr!20404 a!3186) j!159)) (and ((_ is MissingVacant!7960) lt!348311) (= (index!34211 lt!348311) resIntermediateIndex!5) (= (select (arr!20404 a!3186) (index!34211 lt!348311)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102795 (= lt!348311 e!434798)))

(declare-fun c!86866 () Bool)

(assert (=> d!102795 (= c!86866 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!348312 () (_ BitVec 64))

(assert (=> d!102795 (= lt!348312 (select (arr!20404 a!3186) resIntermediateIndex!5))))

(assert (=> d!102795 (validMask!0 mask!3328)))

(assert (=> d!102795 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348311)))

(declare-fun b!781628 () Bool)

(declare-fun c!86867 () Bool)

(assert (=> b!781628 (= c!86867 (= lt!348312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781628 (= e!434799 e!434800)))

(declare-fun b!781629 () Bool)

(assert (=> b!781629 (= e!434798 e!434799)))

(declare-fun c!86865 () Bool)

(assert (=> b!781629 (= c!86865 (= lt!348312 (select (arr!20404 a!3186) j!159)))))

(assert (= (and d!102795 c!86866) b!781625))

(assert (= (and d!102795 (not c!86866)) b!781629))

(assert (= (and b!781629 c!86865) b!781626))

(assert (= (and b!781629 (not c!86865)) b!781628))

(assert (= (and b!781628 c!86867) b!781627))

(assert (= (and b!781628 (not c!86867)) b!781624))

(declare-fun m!725245 () Bool)

(assert (=> b!781624 m!725245))

(assert (=> b!781624 m!725245))

(assert (=> b!781624 m!725065))

(declare-fun m!725247 () Bool)

(assert (=> b!781624 m!725247))

(declare-fun m!725249 () Bool)

(assert (=> d!102795 m!725249))

(declare-fun m!725251 () Bool)

(assert (=> d!102795 m!725251))

(assert (=> d!102795 m!725079))

(assert (=> d!102795 m!725099))

(assert (=> b!781429 d!102795))

(declare-fun d!102797 () Bool)

(assert (=> d!102797 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!781440 d!102797))

(declare-fun b!781681 () Bool)

(declare-fun e!434835 () SeekEntryResult!7960)

(declare-fun e!434832 () SeekEntryResult!7960)

(assert (=> b!781681 (= e!434835 e!434832)))

(declare-fun lt!348323 () (_ BitVec 64))

(declare-fun c!86887 () Bool)

(assert (=> b!781681 (= c!86887 (or (= lt!348323 (select (arr!20404 a!3186) j!159)) (= (bvadd lt!348323 lt!348323) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781682 () Bool)

(declare-fun lt!348324 () SeekEntryResult!7960)

(assert (=> b!781682 (and (bvsge (index!34210 lt!348324) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348324) (size!20824 a!3186)))))

(declare-fun res!528724 () Bool)

(assert (=> b!781682 (= res!528724 (= (select (arr!20404 a!3186) (index!34210 lt!348324)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434836 () Bool)

(assert (=> b!781682 (=> res!528724 e!434836)))

(declare-fun b!781683 () Bool)

(assert (=> b!781683 (= e!434832 (Intermediate!7960 false (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781684 () Bool)

(assert (=> b!781684 (= e!434832 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781685 () Bool)

(declare-fun e!434833 () Bool)

(declare-fun e!434834 () Bool)

(assert (=> b!781685 (= e!434833 e!434834)))

(declare-fun res!528725 () Bool)

(assert (=> b!781685 (= res!528725 (and ((_ is Intermediate!7960) lt!348324) (not (undefined!8772 lt!348324)) (bvslt (x!65317 lt!348324) #b01111111111111111111111111111110) (bvsge (x!65317 lt!348324) #b00000000000000000000000000000000) (bvsge (x!65317 lt!348324) #b00000000000000000000000000000000)))))

(assert (=> b!781685 (=> (not res!528725) (not e!434834))))

(declare-fun d!102799 () Bool)

(assert (=> d!102799 e!434833))

(declare-fun c!86888 () Bool)

(assert (=> d!102799 (= c!86888 (and ((_ is Intermediate!7960) lt!348324) (undefined!8772 lt!348324)))))

(assert (=> d!102799 (= lt!348324 e!434835)))

(declare-fun c!86886 () Bool)

(assert (=> d!102799 (= c!86886 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102799 (= lt!348323 (select (arr!20404 a!3186) (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328)))))

(assert (=> d!102799 (validMask!0 mask!3328)))

(assert (=> d!102799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348324)))

(declare-fun b!781686 () Bool)

(assert (=> b!781686 (= e!434833 (bvsge (x!65317 lt!348324) #b01111111111111111111111111111110))))

(declare-fun b!781687 () Bool)

(assert (=> b!781687 (and (bvsge (index!34210 lt!348324) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348324) (size!20824 a!3186)))))

(declare-fun res!528726 () Bool)

(assert (=> b!781687 (= res!528726 (= (select (arr!20404 a!3186) (index!34210 lt!348324)) (select (arr!20404 a!3186) j!159)))))

(assert (=> b!781687 (=> res!528726 e!434836)))

(assert (=> b!781687 (= e!434834 e!434836)))

(declare-fun b!781688 () Bool)

(assert (=> b!781688 (and (bvsge (index!34210 lt!348324) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348324) (size!20824 a!3186)))))

(assert (=> b!781688 (= e!434836 (= (select (arr!20404 a!3186) (index!34210 lt!348324)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781689 () Bool)

(assert (=> b!781689 (= e!434835 (Intermediate!7960 true (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102799 c!86886) b!781689))

(assert (= (and d!102799 (not c!86886)) b!781681))

(assert (= (and b!781681 c!86887) b!781683))

(assert (= (and b!781681 (not c!86887)) b!781684))

(assert (= (and d!102799 c!86888) b!781686))

(assert (= (and d!102799 (not c!86888)) b!781685))

(assert (= (and b!781685 res!528725) b!781687))

(assert (= (and b!781687 (not res!528726)) b!781682))

(assert (= (and b!781682 (not res!528724)) b!781688))

(declare-fun m!725271 () Bool)

(assert (=> b!781687 m!725271))

(assert (=> b!781688 m!725271))

(assert (=> b!781684 m!725093))

(declare-fun m!725273 () Bool)

(assert (=> b!781684 m!725273))

(assert (=> b!781684 m!725273))

(assert (=> b!781684 m!725065))

(declare-fun m!725275 () Bool)

(assert (=> b!781684 m!725275))

(assert (=> b!781682 m!725271))

(assert (=> d!102799 m!725093))

(declare-fun m!725277 () Bool)

(assert (=> d!102799 m!725277))

(assert (=> d!102799 m!725099))

(assert (=> b!781430 d!102799))

(declare-fun d!102809 () Bool)

(declare-fun lt!348334 () (_ BitVec 32))

(declare-fun lt!348333 () (_ BitVec 32))

(assert (=> d!102809 (= lt!348334 (bvmul (bvxor lt!348333 (bvlshr lt!348333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102809 (= lt!348333 ((_ extract 31 0) (bvand (bvxor (select (arr!20404 a!3186) j!159) (bvlshr (select (arr!20404 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102809 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528727 (let ((h!15435 ((_ extract 31 0) (bvand (bvxor (select (arr!20404 a!3186) j!159) (bvlshr (select (arr!20404 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65324 (bvmul (bvxor h!15435 (bvlshr h!15435 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65324 (bvlshr x!65324 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528727 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528727 #b00000000000000000000000000000000))))))

(assert (=> d!102809 (= (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) (bvand (bvxor lt!348334 (bvlshr lt!348334 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!781430 d!102809))

(declare-fun b!781708 () Bool)

(declare-fun e!434850 () SeekEntryResult!7960)

(declare-fun e!434847 () SeekEntryResult!7960)

(assert (=> b!781708 (= e!434850 e!434847)))

(declare-fun c!86896 () Bool)

(declare-fun lt!348335 () (_ BitVec 64))

(assert (=> b!781708 (= c!86896 (or (= lt!348335 (select (arr!20404 a!3186) j!159)) (= (bvadd lt!348335 lt!348335) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781709 () Bool)

(declare-fun lt!348336 () SeekEntryResult!7960)

(assert (=> b!781709 (and (bvsge (index!34210 lt!348336) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348336) (size!20824 a!3186)))))

(declare-fun res!528734 () Bool)

(assert (=> b!781709 (= res!528734 (= (select (arr!20404 a!3186) (index!34210 lt!348336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434851 () Bool)

(assert (=> b!781709 (=> res!528734 e!434851)))

(declare-fun b!781710 () Bool)

(assert (=> b!781710 (= e!434847 (Intermediate!7960 false index!1321 x!1131))))

(declare-fun b!781711 () Bool)

(assert (=> b!781711 (= e!434847 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781712 () Bool)

(declare-fun e!434848 () Bool)

(declare-fun e!434849 () Bool)

(assert (=> b!781712 (= e!434848 e!434849)))

(declare-fun res!528735 () Bool)

(assert (=> b!781712 (= res!528735 (and ((_ is Intermediate!7960) lt!348336) (not (undefined!8772 lt!348336)) (bvslt (x!65317 lt!348336) #b01111111111111111111111111111110) (bvsge (x!65317 lt!348336) #b00000000000000000000000000000000) (bvsge (x!65317 lt!348336) x!1131)))))

(assert (=> b!781712 (=> (not res!528735) (not e!434849))))

(declare-fun d!102811 () Bool)

(assert (=> d!102811 e!434848))

(declare-fun c!86897 () Bool)

(assert (=> d!102811 (= c!86897 (and ((_ is Intermediate!7960) lt!348336) (undefined!8772 lt!348336)))))

(assert (=> d!102811 (= lt!348336 e!434850)))

(declare-fun c!86895 () Bool)

(assert (=> d!102811 (= c!86895 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102811 (= lt!348335 (select (arr!20404 a!3186) index!1321))))

(assert (=> d!102811 (validMask!0 mask!3328)))

(assert (=> d!102811 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348336)))

(declare-fun b!781713 () Bool)

(assert (=> b!781713 (= e!434848 (bvsge (x!65317 lt!348336) #b01111111111111111111111111111110))))

(declare-fun b!781714 () Bool)

(assert (=> b!781714 (and (bvsge (index!34210 lt!348336) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348336) (size!20824 a!3186)))))

(declare-fun res!528736 () Bool)

(assert (=> b!781714 (= res!528736 (= (select (arr!20404 a!3186) (index!34210 lt!348336)) (select (arr!20404 a!3186) j!159)))))

(assert (=> b!781714 (=> res!528736 e!434851)))

(assert (=> b!781714 (= e!434849 e!434851)))

(declare-fun b!781715 () Bool)

(assert (=> b!781715 (and (bvsge (index!34210 lt!348336) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348336) (size!20824 a!3186)))))

(assert (=> b!781715 (= e!434851 (= (select (arr!20404 a!3186) (index!34210 lt!348336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781716 () Bool)

(assert (=> b!781716 (= e!434850 (Intermediate!7960 true index!1321 x!1131))))

(assert (= (and d!102811 c!86895) b!781716))

(assert (= (and d!102811 (not c!86895)) b!781708))

(assert (= (and b!781708 c!86896) b!781710))

(assert (= (and b!781708 (not c!86896)) b!781711))

(assert (= (and d!102811 c!86897) b!781713))

(assert (= (and d!102811 (not c!86897)) b!781712))

(assert (= (and b!781712 res!528735) b!781714))

(assert (= (and b!781714 (not res!528736)) b!781709))

(assert (= (and b!781709 (not res!528734)) b!781715))

(declare-fun m!725279 () Bool)

(assert (=> b!781714 m!725279))

(assert (=> b!781715 m!725279))

(assert (=> b!781711 m!725207))

(assert (=> b!781711 m!725207))

(assert (=> b!781711 m!725065))

(declare-fun m!725281 () Bool)

(assert (=> b!781711 m!725281))

(assert (=> b!781709 m!725279))

(assert (=> d!102811 m!725215))

(assert (=> d!102811 m!725099))

(assert (=> b!781441 d!102811))

(assert (=> b!781431 d!102777))

(declare-fun b!781804 () Bool)

(declare-fun c!86933 () Bool)

(declare-fun lt!348369 () (_ BitVec 64))

(assert (=> b!781804 (= c!86933 (= lt!348369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434904 () SeekEntryResult!7960)

(declare-fun e!434903 () SeekEntryResult!7960)

(assert (=> b!781804 (= e!434904 e!434903)))

(declare-fun b!781805 () Bool)

(declare-fun lt!348367 () SeekEntryResult!7960)

(assert (=> b!781805 (= e!434903 (MissingZero!7960 (index!34210 lt!348367)))))

(declare-fun b!781806 () Bool)

(declare-fun e!434902 () SeekEntryResult!7960)

(assert (=> b!781806 (= e!434902 e!434904)))

(assert (=> b!781806 (= lt!348369 (select (arr!20404 a!3186) (index!34210 lt!348367)))))

(declare-fun c!86932 () Bool)

(assert (=> b!781806 (= c!86932 (= lt!348369 (select (arr!20404 a!3186) j!159)))))

(declare-fun b!781807 () Bool)

(assert (=> b!781807 (= e!434902 Undefined!7960)))

(declare-fun b!781809 () Bool)

(assert (=> b!781809 (= e!434904 (Found!7960 (index!34210 lt!348367)))))

(declare-fun d!102813 () Bool)

(declare-fun lt!348368 () SeekEntryResult!7960)

(assert (=> d!102813 (and (or ((_ is Undefined!7960) lt!348368) (not ((_ is Found!7960) lt!348368)) (and (bvsge (index!34209 lt!348368) #b00000000000000000000000000000000) (bvslt (index!34209 lt!348368) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348368) ((_ is Found!7960) lt!348368) (not ((_ is MissingZero!7960) lt!348368)) (and (bvsge (index!34208 lt!348368) #b00000000000000000000000000000000) (bvslt (index!34208 lt!348368) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348368) ((_ is Found!7960) lt!348368) ((_ is MissingZero!7960) lt!348368) (not ((_ is MissingVacant!7960) lt!348368)) (and (bvsge (index!34211 lt!348368) #b00000000000000000000000000000000) (bvslt (index!34211 lt!348368) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348368) (ite ((_ is Found!7960) lt!348368) (= (select (arr!20404 a!3186) (index!34209 lt!348368)) (select (arr!20404 a!3186) j!159)) (ite ((_ is MissingZero!7960) lt!348368) (= (select (arr!20404 a!3186) (index!34208 lt!348368)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7960) lt!348368) (= (select (arr!20404 a!3186) (index!34211 lt!348368)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102813 (= lt!348368 e!434902)))

(declare-fun c!86931 () Bool)

(assert (=> d!102813 (= c!86931 (and ((_ is Intermediate!7960) lt!348367) (undefined!8772 lt!348367)))))

(assert (=> d!102813 (= lt!348367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102813 (validMask!0 mask!3328)))

(assert (=> d!102813 (= (seekEntryOrOpen!0 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!348368)))

(declare-fun b!781808 () Bool)

(assert (=> b!781808 (= e!434903 (seekKeyOrZeroReturnVacant!0 (x!65317 lt!348367) (index!34210 lt!348367) (index!34210 lt!348367) (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102813 c!86931) b!781807))

(assert (= (and d!102813 (not c!86931)) b!781806))

(assert (= (and b!781806 c!86932) b!781809))

(assert (= (and b!781806 (not c!86932)) b!781804))

(assert (= (and b!781804 c!86933) b!781805))

(assert (= (and b!781804 (not c!86933)) b!781808))

(declare-fun m!725335 () Bool)

(assert (=> b!781806 m!725335))

(assert (=> d!102813 m!725099))

(declare-fun m!725337 () Bool)

(assert (=> d!102813 m!725337))

(declare-fun m!725339 () Bool)

(assert (=> d!102813 m!725339))

(assert (=> d!102813 m!725065))

(assert (=> d!102813 m!725093))

(declare-fun m!725341 () Bool)

(assert (=> d!102813 m!725341))

(assert (=> d!102813 m!725093))

(assert (=> d!102813 m!725065))

(assert (=> d!102813 m!725095))

(assert (=> b!781808 m!725065))

(declare-fun m!725343 () Bool)

(assert (=> b!781808 m!725343))

(assert (=> b!781437 d!102813))

(declare-fun bm!35269 () Bool)

(declare-fun call!35272 () Bool)

(assert (=> bm!35269 (= call!35272 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102833 () Bool)

(declare-fun res!528759 () Bool)

(declare-fun e!434910 () Bool)

(assert (=> d!102833 (=> res!528759 e!434910)))

(assert (=> d!102833 (= res!528759 (bvsge j!159 (size!20824 a!3186)))))

(assert (=> d!102833 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!434910)))

(declare-fun b!781818 () Bool)

(declare-fun e!434909 () Bool)

(declare-fun e!434911 () Bool)

(assert (=> b!781818 (= e!434909 e!434911)))

(declare-fun lt!348374 () (_ BitVec 64))

(assert (=> b!781818 (= lt!348374 (select (arr!20404 a!3186) j!159))))

(declare-fun lt!348375 () Unit!26905)

(assert (=> b!781818 (= lt!348375 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348374 j!159))))

(assert (=> b!781818 (arrayContainsKey!0 a!3186 lt!348374 #b00000000000000000000000000000000)))

(declare-fun lt!348376 () Unit!26905)

(assert (=> b!781818 (= lt!348376 lt!348375)))

(declare-fun res!528760 () Bool)

(assert (=> b!781818 (= res!528760 (= (seekEntryOrOpen!0 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) (Found!7960 j!159)))))

(assert (=> b!781818 (=> (not res!528760) (not e!434911))))

(declare-fun b!781819 () Bool)

(assert (=> b!781819 (= e!434909 call!35272)))

(declare-fun b!781820 () Bool)

(assert (=> b!781820 (= e!434910 e!434909)))

(declare-fun c!86938 () Bool)

(assert (=> b!781820 (= c!86938 (validKeyInArray!0 (select (arr!20404 a!3186) j!159)))))

(declare-fun b!781821 () Bool)

(assert (=> b!781821 (= e!434911 call!35272)))

(assert (= (and d!102833 (not res!528759)) b!781820))

(assert (= (and b!781820 c!86938) b!781818))

(assert (= (and b!781820 (not c!86938)) b!781819))

(assert (= (and b!781818 res!528760) b!781821))

(assert (= (or b!781821 b!781819) bm!35269))

(declare-fun m!725345 () Bool)

(assert (=> bm!35269 m!725345))

(assert (=> b!781818 m!725065))

(declare-fun m!725347 () Bool)

(assert (=> b!781818 m!725347))

(declare-fun m!725349 () Bool)

(assert (=> b!781818 m!725349))

(assert (=> b!781818 m!725065))

(assert (=> b!781818 m!725103))

(assert (=> b!781820 m!725065))

(assert (=> b!781820 m!725065))

(assert (=> b!781820 m!725091))

(assert (=> b!781437 d!102833))

(declare-fun d!102835 () Bool)

(assert (=> d!102835 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348388 () Unit!26905)

(declare-fun choose!38 (array!42634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26905)

(assert (=> d!102835 (= lt!348388 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102835 (validMask!0 mask!3328)))

(assert (=> d!102835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!348388)))

(declare-fun bs!21746 () Bool)

(assert (= bs!21746 d!102835))

(assert (=> bs!21746 m!725105))

(declare-fun m!725355 () Bool)

(assert (=> bs!21746 m!725355))

(assert (=> bs!21746 m!725099))

(assert (=> b!781437 d!102835))

(declare-fun b!781853 () Bool)

(declare-fun e!434935 () SeekEntryResult!7960)

(declare-fun e!434932 () SeekEntryResult!7960)

(assert (=> b!781853 (= e!434935 e!434932)))

(declare-fun c!86948 () Bool)

(declare-fun lt!348391 () (_ BitVec 64))

(assert (=> b!781853 (= c!86948 (or (= lt!348391 lt!348226) (= (bvadd lt!348391 lt!348391) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781854 () Bool)

(declare-fun lt!348392 () SeekEntryResult!7960)

(assert (=> b!781854 (and (bvsge (index!34210 lt!348392) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348392) (size!20824 lt!348221)))))

(declare-fun res!528776 () Bool)

(assert (=> b!781854 (= res!528776 (= (select (arr!20404 lt!348221) (index!34210 lt!348392)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434936 () Bool)

(assert (=> b!781854 (=> res!528776 e!434936)))

(declare-fun b!781855 () Bool)

(assert (=> b!781855 (= e!434932 (Intermediate!7960 false index!1321 x!1131))))

(declare-fun b!781856 () Bool)

(assert (=> b!781856 (= e!434932 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!348226 lt!348221 mask!3328))))

(declare-fun b!781857 () Bool)

(declare-fun e!434933 () Bool)

(declare-fun e!434934 () Bool)

(assert (=> b!781857 (= e!434933 e!434934)))

(declare-fun res!528777 () Bool)

(assert (=> b!781857 (= res!528777 (and ((_ is Intermediate!7960) lt!348392) (not (undefined!8772 lt!348392)) (bvslt (x!65317 lt!348392) #b01111111111111111111111111111110) (bvsge (x!65317 lt!348392) #b00000000000000000000000000000000) (bvsge (x!65317 lt!348392) x!1131)))))

(assert (=> b!781857 (=> (not res!528777) (not e!434934))))

(declare-fun d!102837 () Bool)

(assert (=> d!102837 e!434933))

(declare-fun c!86949 () Bool)

(assert (=> d!102837 (= c!86949 (and ((_ is Intermediate!7960) lt!348392) (undefined!8772 lt!348392)))))

(assert (=> d!102837 (= lt!348392 e!434935)))

(declare-fun c!86947 () Bool)

(assert (=> d!102837 (= c!86947 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102837 (= lt!348391 (select (arr!20404 lt!348221) index!1321))))

(assert (=> d!102837 (validMask!0 mask!3328)))

(assert (=> d!102837 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348226 lt!348221 mask!3328) lt!348392)))

(declare-fun b!781858 () Bool)

(assert (=> b!781858 (= e!434933 (bvsge (x!65317 lt!348392) #b01111111111111111111111111111110))))

(declare-fun b!781859 () Bool)

(assert (=> b!781859 (and (bvsge (index!34210 lt!348392) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348392) (size!20824 lt!348221)))))

(declare-fun res!528778 () Bool)

(assert (=> b!781859 (= res!528778 (= (select (arr!20404 lt!348221) (index!34210 lt!348392)) lt!348226))))

(assert (=> b!781859 (=> res!528778 e!434936)))

(assert (=> b!781859 (= e!434934 e!434936)))

(declare-fun b!781860 () Bool)

(assert (=> b!781860 (and (bvsge (index!34210 lt!348392) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348392) (size!20824 lt!348221)))))

(assert (=> b!781860 (= e!434936 (= (select (arr!20404 lt!348221) (index!34210 lt!348392)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781861 () Bool)

(assert (=> b!781861 (= e!434935 (Intermediate!7960 true index!1321 x!1131))))

(assert (= (and d!102837 c!86947) b!781861))

(assert (= (and d!102837 (not c!86947)) b!781853))

(assert (= (and b!781853 c!86948) b!781855))

(assert (= (and b!781853 (not c!86948)) b!781856))

(assert (= (and d!102837 c!86949) b!781858))

(assert (= (and d!102837 (not c!86949)) b!781857))

(assert (= (and b!781857 res!528777) b!781859))

(assert (= (and b!781859 (not res!528778)) b!781854))

(assert (= (and b!781854 (not res!528776)) b!781860))

(declare-fun m!725365 () Bool)

(assert (=> b!781859 m!725365))

(assert (=> b!781860 m!725365))

(assert (=> b!781856 m!725207))

(assert (=> b!781856 m!725207))

(declare-fun m!725369 () Bool)

(assert (=> b!781856 m!725369))

(assert (=> b!781854 m!725365))

(declare-fun m!725371 () Bool)

(assert (=> d!102837 m!725371))

(assert (=> d!102837 m!725099))

(assert (=> b!781427 d!102837))

(declare-fun b!781871 () Bool)

(declare-fun e!434945 () SeekEntryResult!7960)

(declare-fun e!434942 () SeekEntryResult!7960)

(assert (=> b!781871 (= e!434945 e!434942)))

(declare-fun c!86954 () Bool)

(declare-fun lt!348395 () (_ BitVec 64))

(assert (=> b!781871 (= c!86954 (or (= lt!348395 lt!348226) (= (bvadd lt!348395 lt!348395) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781872 () Bool)

(declare-fun lt!348396 () SeekEntryResult!7960)

(assert (=> b!781872 (and (bvsge (index!34210 lt!348396) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348396) (size!20824 lt!348221)))))

(declare-fun res!528782 () Bool)

(assert (=> b!781872 (= res!528782 (= (select (arr!20404 lt!348221) (index!34210 lt!348396)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434946 () Bool)

(assert (=> b!781872 (=> res!528782 e!434946)))

(declare-fun b!781873 () Bool)

(assert (=> b!781873 (= e!434942 (Intermediate!7960 false (toIndex!0 lt!348226 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781874 () Bool)

(assert (=> b!781874 (= e!434942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!348226 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!348226 lt!348221 mask!3328))))

(declare-fun b!781875 () Bool)

(declare-fun e!434943 () Bool)

(declare-fun e!434944 () Bool)

(assert (=> b!781875 (= e!434943 e!434944)))

(declare-fun res!528783 () Bool)

(assert (=> b!781875 (= res!528783 (and ((_ is Intermediate!7960) lt!348396) (not (undefined!8772 lt!348396)) (bvslt (x!65317 lt!348396) #b01111111111111111111111111111110) (bvsge (x!65317 lt!348396) #b00000000000000000000000000000000) (bvsge (x!65317 lt!348396) #b00000000000000000000000000000000)))))

(assert (=> b!781875 (=> (not res!528783) (not e!434944))))

(declare-fun d!102843 () Bool)

(assert (=> d!102843 e!434943))

(declare-fun c!86955 () Bool)

(assert (=> d!102843 (= c!86955 (and ((_ is Intermediate!7960) lt!348396) (undefined!8772 lt!348396)))))

(assert (=> d!102843 (= lt!348396 e!434945)))

(declare-fun c!86953 () Bool)

(assert (=> d!102843 (= c!86953 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102843 (= lt!348395 (select (arr!20404 lt!348221) (toIndex!0 lt!348226 mask!3328)))))

(assert (=> d!102843 (validMask!0 mask!3328)))

(assert (=> d!102843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348226 mask!3328) lt!348226 lt!348221 mask!3328) lt!348396)))

(declare-fun b!781876 () Bool)

(assert (=> b!781876 (= e!434943 (bvsge (x!65317 lt!348396) #b01111111111111111111111111111110))))

(declare-fun b!781877 () Bool)

(assert (=> b!781877 (and (bvsge (index!34210 lt!348396) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348396) (size!20824 lt!348221)))))

(declare-fun res!528784 () Bool)

(assert (=> b!781877 (= res!528784 (= (select (arr!20404 lt!348221) (index!34210 lt!348396)) lt!348226))))

(assert (=> b!781877 (=> res!528784 e!434946)))

(assert (=> b!781877 (= e!434944 e!434946)))

(declare-fun b!781878 () Bool)

(assert (=> b!781878 (and (bvsge (index!34210 lt!348396) #b00000000000000000000000000000000) (bvslt (index!34210 lt!348396) (size!20824 lt!348221)))))

(assert (=> b!781878 (= e!434946 (= (select (arr!20404 lt!348221) (index!34210 lt!348396)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781879 () Bool)

(assert (=> b!781879 (= e!434945 (Intermediate!7960 true (toIndex!0 lt!348226 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102843 c!86953) b!781879))

(assert (= (and d!102843 (not c!86953)) b!781871))

(assert (= (and b!781871 c!86954) b!781873))

(assert (= (and b!781871 (not c!86954)) b!781874))

(assert (= (and d!102843 c!86955) b!781876))

(assert (= (and d!102843 (not c!86955)) b!781875))

(assert (= (and b!781875 res!528783) b!781877))

(assert (= (and b!781877 (not res!528784)) b!781872))

(assert (= (and b!781872 (not res!528782)) b!781878))

(declare-fun m!725379 () Bool)

(assert (=> b!781877 m!725379))

(assert (=> b!781878 m!725379))

(assert (=> b!781874 m!725085))

(declare-fun m!725383 () Bool)

(assert (=> b!781874 m!725383))

(assert (=> b!781874 m!725383))

(declare-fun m!725385 () Bool)

(assert (=> b!781874 m!725385))

(assert (=> b!781872 m!725379))

(assert (=> d!102843 m!725085))

(declare-fun m!725387 () Bool)

(assert (=> d!102843 m!725387))

(assert (=> d!102843 m!725099))

(assert (=> b!781427 d!102843))

(declare-fun d!102847 () Bool)

(declare-fun lt!348398 () (_ BitVec 32))

(declare-fun lt!348397 () (_ BitVec 32))

(assert (=> d!102847 (= lt!348398 (bvmul (bvxor lt!348397 (bvlshr lt!348397 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102847 (= lt!348397 ((_ extract 31 0) (bvand (bvxor lt!348226 (bvlshr lt!348226 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102847 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528727 (let ((h!15435 ((_ extract 31 0) (bvand (bvxor lt!348226 (bvlshr lt!348226 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65324 (bvmul (bvxor h!15435 (bvlshr h!15435 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65324 (bvlshr x!65324 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528727 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528727 #b00000000000000000000000000000000))))))

(assert (=> d!102847 (= (toIndex!0 lt!348226 mask!3328) (bvand (bvxor lt!348398 (bvlshr lt!348398 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!781427 d!102847))

(declare-fun b!781896 () Bool)

(declare-fun e!434963 () Bool)

(declare-fun e!434961 () Bool)

(assert (=> b!781896 (= e!434963 e!434961)))

(declare-fun res!528799 () Bool)

(assert (=> b!781896 (=> (not res!528799) (not e!434961))))

(declare-fun e!434964 () Bool)

(assert (=> b!781896 (= res!528799 (not e!434964))))

(declare-fun res!528798 () Bool)

(assert (=> b!781896 (=> (not res!528798) (not e!434964))))

(assert (=> b!781896 (= res!528798 (validKeyInArray!0 (select (arr!20404 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781897 () Bool)

(declare-fun e!434962 () Bool)

(assert (=> b!781897 (= e!434961 e!434962)))

(declare-fun c!86958 () Bool)

(assert (=> b!781897 (= c!86958 (validKeyInArray!0 (select (arr!20404 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781898 () Bool)

(declare-fun call!35278 () Bool)

(assert (=> b!781898 (= e!434962 call!35278)))

(declare-fun d!102849 () Bool)

(declare-fun res!528800 () Bool)

(assert (=> d!102849 (=> res!528800 e!434963)))

(assert (=> d!102849 (= res!528800 (bvsge #b00000000000000000000000000000000 (size!20824 a!3186)))))

(assert (=> d!102849 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14310) e!434963)))

(declare-fun b!781899 () Bool)

(declare-fun contains!4084 (List!14313 (_ BitVec 64)) Bool)

(assert (=> b!781899 (= e!434964 (contains!4084 Nil!14310 (select (arr!20404 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35275 () Bool)

(assert (=> bm!35275 (= call!35278 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86958 (Cons!14309 (select (arr!20404 a!3186) #b00000000000000000000000000000000) Nil!14310) Nil!14310)))))

(declare-fun b!781900 () Bool)

(assert (=> b!781900 (= e!434962 call!35278)))

(assert (= (and d!102849 (not res!528800)) b!781896))

(assert (= (and b!781896 res!528798) b!781899))

(assert (= (and b!781896 res!528799) b!781897))

(assert (= (and b!781897 c!86958) b!781900))

(assert (= (and b!781897 (not c!86958)) b!781898))

(assert (= (or b!781900 b!781898) bm!35275))

(assert (=> b!781896 m!725219))

(assert (=> b!781896 m!725219))

(assert (=> b!781896 m!725227))

(assert (=> b!781897 m!725219))

(assert (=> b!781897 m!725219))

(assert (=> b!781897 m!725227))

(assert (=> b!781899 m!725219))

(assert (=> b!781899 m!725219))

(declare-fun m!725391 () Bool)

(assert (=> b!781899 m!725391))

(assert (=> bm!35275 m!725219))

(declare-fun m!725393 () Bool)

(assert (=> bm!35275 m!725393))

(assert (=> b!781438 d!102849))

(declare-fun b!781901 () Bool)

(declare-fun c!86961 () Bool)

(declare-fun lt!348407 () (_ BitVec 64))

(assert (=> b!781901 (= c!86961 (= lt!348407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434967 () SeekEntryResult!7960)

(declare-fun e!434966 () SeekEntryResult!7960)

(assert (=> b!781901 (= e!434967 e!434966)))

(declare-fun b!781902 () Bool)

(declare-fun lt!348405 () SeekEntryResult!7960)

(assert (=> b!781902 (= e!434966 (MissingZero!7960 (index!34210 lt!348405)))))

(declare-fun b!781903 () Bool)

(declare-fun e!434965 () SeekEntryResult!7960)

(assert (=> b!781903 (= e!434965 e!434967)))

(assert (=> b!781903 (= lt!348407 (select (arr!20404 a!3186) (index!34210 lt!348405)))))

(declare-fun c!86960 () Bool)

(assert (=> b!781903 (= c!86960 (= lt!348407 k0!2102))))

(declare-fun b!781904 () Bool)

(assert (=> b!781904 (= e!434965 Undefined!7960)))

(declare-fun b!781906 () Bool)

(assert (=> b!781906 (= e!434967 (Found!7960 (index!34210 lt!348405)))))

(declare-fun d!102857 () Bool)

(declare-fun lt!348406 () SeekEntryResult!7960)

(assert (=> d!102857 (and (or ((_ is Undefined!7960) lt!348406) (not ((_ is Found!7960) lt!348406)) (and (bvsge (index!34209 lt!348406) #b00000000000000000000000000000000) (bvslt (index!34209 lt!348406) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348406) ((_ is Found!7960) lt!348406) (not ((_ is MissingZero!7960) lt!348406)) (and (bvsge (index!34208 lt!348406) #b00000000000000000000000000000000) (bvslt (index!34208 lt!348406) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348406) ((_ is Found!7960) lt!348406) ((_ is MissingZero!7960) lt!348406) (not ((_ is MissingVacant!7960) lt!348406)) (and (bvsge (index!34211 lt!348406) #b00000000000000000000000000000000) (bvslt (index!34211 lt!348406) (size!20824 a!3186)))) (or ((_ is Undefined!7960) lt!348406) (ite ((_ is Found!7960) lt!348406) (= (select (arr!20404 a!3186) (index!34209 lt!348406)) k0!2102) (ite ((_ is MissingZero!7960) lt!348406) (= (select (arr!20404 a!3186) (index!34208 lt!348406)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7960) lt!348406) (= (select (arr!20404 a!3186) (index!34211 lt!348406)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102857 (= lt!348406 e!434965)))

(declare-fun c!86959 () Bool)

(assert (=> d!102857 (= c!86959 (and ((_ is Intermediate!7960) lt!348405) (undefined!8772 lt!348405)))))

(assert (=> d!102857 (= lt!348405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102857 (validMask!0 mask!3328)))

(assert (=> d!102857 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!348406)))

(declare-fun b!781905 () Bool)

(assert (=> b!781905 (= e!434966 (seekKeyOrZeroReturnVacant!0 (x!65317 lt!348405) (index!34210 lt!348405) (index!34210 lt!348405) k0!2102 a!3186 mask!3328))))

(assert (= (and d!102857 c!86959) b!781904))

(assert (= (and d!102857 (not c!86959)) b!781903))

(assert (= (and b!781903 c!86960) b!781906))

(assert (= (and b!781903 (not c!86960)) b!781901))

(assert (= (and b!781901 c!86961) b!781902))

(assert (= (and b!781901 (not c!86961)) b!781905))

(declare-fun m!725395 () Bool)

(assert (=> b!781903 m!725395))

(assert (=> d!102857 m!725099))

(declare-fun m!725397 () Bool)

(assert (=> d!102857 m!725397))

(declare-fun m!725399 () Bool)

(assert (=> d!102857 m!725399))

(declare-fun m!725401 () Bool)

(assert (=> d!102857 m!725401))

(declare-fun m!725403 () Bool)

(assert (=> d!102857 m!725403))

(assert (=> d!102857 m!725401))

(declare-fun m!725405 () Bool)

(assert (=> d!102857 m!725405))

(declare-fun m!725407 () Bool)

(assert (=> b!781905 m!725407))

(assert (=> b!781428 d!102857))

(check-sat (not b!781820) (not b!781874) (not b!781896) (not b!781684) (not bm!35275) (not d!102843) (not b!781711) (not d!102795) (not d!102857) (not b!781899) (not d!102835) (not b!781818) (not b!781808) (not d!102811) (not b!781623) (not bm!35262) (not d!102799) (not b!781905) (not b!781856) (not d!102813) (not b!781624) (not b!781897) (not b!781598) (not b!781582) (not b!781596) (not d!102777) (not bm!35269) (not d!102837))
(check-sat)
