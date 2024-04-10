; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63954 () Bool)

(assert start!63954)

(declare-fun b!718492 () Bool)

(declare-fun res!480972 () Bool)

(declare-fun e!403337 () Bool)

(assert (=> b!718492 (=> (not res!480972) (not e!403337))))

(declare-datatypes ((array!40694 0))(
  ( (array!40695 (arr!19474 (Array (_ BitVec 32) (_ BitVec 64))) (size!19895 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40694)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718492 (= res!480972 (and (= (size!19895 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19895 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19895 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718494 () Bool)

(declare-fun e!403335 () Bool)

(assert (=> b!718494 (= e!403337 e!403335)))

(declare-fun res!480978 () Bool)

(assert (=> b!718494 (=> (not res!480978) (not e!403335))))

(declare-datatypes ((SeekEntryResult!7074 0))(
  ( (MissingZero!7074 (index!30664 (_ BitVec 32))) (Found!7074 (index!30665 (_ BitVec 32))) (Intermediate!7074 (undefined!7886 Bool) (index!30666 (_ BitVec 32)) (x!61678 (_ BitVec 32))) (Undefined!7074) (MissingVacant!7074 (index!30667 (_ BitVec 32))) )
))
(declare-fun lt!319375 () SeekEntryResult!7074)

(assert (=> b!718494 (= res!480978 (or (= lt!319375 (MissingZero!7074 i!1173)) (= lt!319375 (MissingVacant!7074 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40694 (_ BitVec 32)) SeekEntryResult!7074)

(assert (=> b!718494 (= lt!319375 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718495 () Bool)

(declare-fun res!480975 () Bool)

(assert (=> b!718495 (=> (not res!480975) (not e!403337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718495 (= res!480975 (validKeyInArray!0 (select (arr!19474 a!3186) j!159)))))

(declare-fun b!718496 () Bool)

(declare-fun lt!319376 () (_ BitVec 32))

(assert (=> b!718496 (= e!403335 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319376 #b00000000000000000000000000000000) (bvsge lt!319376 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718496 (= lt!319376 (toIndex!0 (select (arr!19474 a!3186) j!159) mask!3328))))

(declare-fun b!718497 () Bool)

(declare-fun res!480973 () Bool)

(assert (=> b!718497 (=> (not res!480973) (not e!403337))))

(assert (=> b!718497 (= res!480973 (validKeyInArray!0 k0!2102))))

(declare-fun b!718498 () Bool)

(declare-fun res!480980 () Bool)

(assert (=> b!718498 (=> (not res!480980) (not e!403337))))

(declare-fun arrayContainsKey!0 (array!40694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718498 (= res!480980 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718499 () Bool)

(declare-fun res!480976 () Bool)

(assert (=> b!718499 (=> (not res!480976) (not e!403335))))

(declare-datatypes ((List!13476 0))(
  ( (Nil!13473) (Cons!13472 (h!14517 (_ BitVec 64)) (t!19791 List!13476)) )
))
(declare-fun arrayNoDuplicates!0 (array!40694 (_ BitVec 32) List!13476) Bool)

(assert (=> b!718499 (= res!480976 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13473))))

(declare-fun b!718500 () Bool)

(declare-fun res!480974 () Bool)

(assert (=> b!718500 (=> (not res!480974) (not e!403335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40694 (_ BitVec 32)) Bool)

(assert (=> b!718500 (= res!480974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480979 () Bool)

(assert (=> start!63954 (=> (not res!480979) (not e!403337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63954 (= res!480979 (validMask!0 mask!3328))))

(assert (=> start!63954 e!403337))

(assert (=> start!63954 true))

(declare-fun array_inv!15270 (array!40694) Bool)

(assert (=> start!63954 (array_inv!15270 a!3186)))

(declare-fun b!718493 () Bool)

(declare-fun res!480977 () Bool)

(assert (=> b!718493 (=> (not res!480977) (not e!403335))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718493 (= res!480977 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19895 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19895 a!3186))))))

(assert (= (and start!63954 res!480979) b!718492))

(assert (= (and b!718492 res!480972) b!718495))

(assert (= (and b!718495 res!480975) b!718497))

(assert (= (and b!718497 res!480973) b!718498))

(assert (= (and b!718498 res!480980) b!718494))

(assert (= (and b!718494 res!480978) b!718500))

(assert (= (and b!718500 res!480974) b!718499))

(assert (= (and b!718499 res!480976) b!718493))

(assert (= (and b!718493 res!480977) b!718496))

(declare-fun m!674121 () Bool)

(assert (=> b!718499 m!674121))

(declare-fun m!674123 () Bool)

(assert (=> b!718494 m!674123))

(declare-fun m!674125 () Bool)

(assert (=> b!718500 m!674125))

(declare-fun m!674127 () Bool)

(assert (=> b!718498 m!674127))

(declare-fun m!674129 () Bool)

(assert (=> start!63954 m!674129))

(declare-fun m!674131 () Bool)

(assert (=> start!63954 m!674131))

(declare-fun m!674133 () Bool)

(assert (=> b!718495 m!674133))

(assert (=> b!718495 m!674133))

(declare-fun m!674135 () Bool)

(assert (=> b!718495 m!674135))

(declare-fun m!674137 () Bool)

(assert (=> b!718497 m!674137))

(assert (=> b!718496 m!674133))

(assert (=> b!718496 m!674133))

(declare-fun m!674139 () Bool)

(assert (=> b!718496 m!674139))

(check-sat (not b!718500) (not b!718499) (not b!718495) (not b!718496) (not start!63954) (not b!718498) (not b!718497) (not b!718494))
(check-sat)
(get-model)

(declare-fun b!718536 () Bool)

(declare-fun e!403354 () Bool)

(declare-fun e!403353 () Bool)

(assert (=> b!718536 (= e!403354 e!403353)))

(declare-fun lt!319389 () (_ BitVec 64))

(assert (=> b!718536 (= lt!319389 (select (arr!19474 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24666 0))(
  ( (Unit!24667) )
))
(declare-fun lt!319390 () Unit!24666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40694 (_ BitVec 64) (_ BitVec 32)) Unit!24666)

(assert (=> b!718536 (= lt!319390 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319389 #b00000000000000000000000000000000))))

(assert (=> b!718536 (arrayContainsKey!0 a!3186 lt!319389 #b00000000000000000000000000000000)))

(declare-fun lt!319391 () Unit!24666)

(assert (=> b!718536 (= lt!319391 lt!319390)))

(declare-fun res!481013 () Bool)

(assert (=> b!718536 (= res!481013 (= (seekEntryOrOpen!0 (select (arr!19474 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7074 #b00000000000000000000000000000000)))))

(assert (=> b!718536 (=> (not res!481013) (not e!403353))))

(declare-fun b!718537 () Bool)

(declare-fun e!403355 () Bool)

(assert (=> b!718537 (= e!403355 e!403354)))

(declare-fun c!79129 () Bool)

(assert (=> b!718537 (= c!79129 (validKeyInArray!0 (select (arr!19474 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34731 () Bool)

(declare-fun call!34734 () Bool)

(assert (=> bm!34731 (= call!34734 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!718538 () Bool)

(assert (=> b!718538 (= e!403354 call!34734)))

(declare-fun d!99013 () Bool)

(declare-fun res!481012 () Bool)

(assert (=> d!99013 (=> res!481012 e!403355)))

(assert (=> d!99013 (= res!481012 (bvsge #b00000000000000000000000000000000 (size!19895 a!3186)))))

(assert (=> d!99013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403355)))

(declare-fun b!718539 () Bool)

(assert (=> b!718539 (= e!403353 call!34734)))

(assert (= (and d!99013 (not res!481012)) b!718537))

(assert (= (and b!718537 c!79129) b!718536))

(assert (= (and b!718537 (not c!79129)) b!718538))

(assert (= (and b!718536 res!481013) b!718539))

(assert (= (or b!718539 b!718538) bm!34731))

(declare-fun m!674161 () Bool)

(assert (=> b!718536 m!674161))

(declare-fun m!674163 () Bool)

(assert (=> b!718536 m!674163))

(declare-fun m!674165 () Bool)

(assert (=> b!718536 m!674165))

(assert (=> b!718536 m!674161))

(declare-fun m!674167 () Bool)

(assert (=> b!718536 m!674167))

(assert (=> b!718537 m!674161))

(assert (=> b!718537 m!674161))

(declare-fun m!674169 () Bool)

(assert (=> b!718537 m!674169))

(declare-fun m!674171 () Bool)

(assert (=> bm!34731 m!674171))

(assert (=> b!718500 d!99013))

(declare-fun b!718550 () Bool)

(declare-fun e!403365 () Bool)

(declare-fun call!34737 () Bool)

(assert (=> b!718550 (= e!403365 call!34737)))

(declare-fun b!718551 () Bool)

(declare-fun e!403364 () Bool)

(declare-fun e!403366 () Bool)

(assert (=> b!718551 (= e!403364 e!403366)))

(declare-fun res!481022 () Bool)

(assert (=> b!718551 (=> (not res!481022) (not e!403366))))

(declare-fun e!403367 () Bool)

(assert (=> b!718551 (= res!481022 (not e!403367))))

(declare-fun res!481020 () Bool)

(assert (=> b!718551 (=> (not res!481020) (not e!403367))))

(assert (=> b!718551 (= res!481020 (validKeyInArray!0 (select (arr!19474 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99015 () Bool)

(declare-fun res!481021 () Bool)

(assert (=> d!99015 (=> res!481021 e!403364)))

(assert (=> d!99015 (= res!481021 (bvsge #b00000000000000000000000000000000 (size!19895 a!3186)))))

(assert (=> d!99015 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13473) e!403364)))

(declare-fun b!718552 () Bool)

(declare-fun contains!4037 (List!13476 (_ BitVec 64)) Bool)

(assert (=> b!718552 (= e!403367 (contains!4037 Nil!13473 (select (arr!19474 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34734 () Bool)

(declare-fun c!79132 () Bool)

(assert (=> bm!34734 (= call!34737 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79132 (Cons!13472 (select (arr!19474 a!3186) #b00000000000000000000000000000000) Nil!13473) Nil!13473)))))

(declare-fun b!718553 () Bool)

(assert (=> b!718553 (= e!403366 e!403365)))

(assert (=> b!718553 (= c!79132 (validKeyInArray!0 (select (arr!19474 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718554 () Bool)

(assert (=> b!718554 (= e!403365 call!34737)))

(assert (= (and d!99015 (not res!481021)) b!718551))

(assert (= (and b!718551 res!481020) b!718552))

(assert (= (and b!718551 res!481022) b!718553))

(assert (= (and b!718553 c!79132) b!718550))

(assert (= (and b!718553 (not c!79132)) b!718554))

(assert (= (or b!718550 b!718554) bm!34734))

(assert (=> b!718551 m!674161))

(assert (=> b!718551 m!674161))

(assert (=> b!718551 m!674169))

(assert (=> b!718552 m!674161))

(assert (=> b!718552 m!674161))

(declare-fun m!674173 () Bool)

(assert (=> b!718552 m!674173))

(assert (=> bm!34734 m!674161))

(declare-fun m!674175 () Bool)

(assert (=> bm!34734 m!674175))

(assert (=> b!718553 m!674161))

(assert (=> b!718553 m!674161))

(assert (=> b!718553 m!674169))

(assert (=> b!718499 d!99015))

(declare-fun b!718597 () Bool)

(declare-fun e!403392 () SeekEntryResult!7074)

(declare-fun lt!319416 () SeekEntryResult!7074)

(assert (=> b!718597 (= e!403392 (Found!7074 (index!30666 lt!319416)))))

(declare-fun e!403393 () SeekEntryResult!7074)

(declare-fun b!718598 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40694 (_ BitVec 32)) SeekEntryResult!7074)

(assert (=> b!718598 (= e!403393 (seekKeyOrZeroReturnVacant!0 (x!61678 lt!319416) (index!30666 lt!319416) (index!30666 lt!319416) k0!2102 a!3186 mask!3328))))

(declare-fun d!99019 () Bool)

(declare-fun lt!319417 () SeekEntryResult!7074)

(get-info :version)

(assert (=> d!99019 (and (or ((_ is Undefined!7074) lt!319417) (not ((_ is Found!7074) lt!319417)) (and (bvsge (index!30665 lt!319417) #b00000000000000000000000000000000) (bvslt (index!30665 lt!319417) (size!19895 a!3186)))) (or ((_ is Undefined!7074) lt!319417) ((_ is Found!7074) lt!319417) (not ((_ is MissingZero!7074) lt!319417)) (and (bvsge (index!30664 lt!319417) #b00000000000000000000000000000000) (bvslt (index!30664 lt!319417) (size!19895 a!3186)))) (or ((_ is Undefined!7074) lt!319417) ((_ is Found!7074) lt!319417) ((_ is MissingZero!7074) lt!319417) (not ((_ is MissingVacant!7074) lt!319417)) (and (bvsge (index!30667 lt!319417) #b00000000000000000000000000000000) (bvslt (index!30667 lt!319417) (size!19895 a!3186)))) (or ((_ is Undefined!7074) lt!319417) (ite ((_ is Found!7074) lt!319417) (= (select (arr!19474 a!3186) (index!30665 lt!319417)) k0!2102) (ite ((_ is MissingZero!7074) lt!319417) (= (select (arr!19474 a!3186) (index!30664 lt!319417)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7074) lt!319417) (= (select (arr!19474 a!3186) (index!30667 lt!319417)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!403394 () SeekEntryResult!7074)

(assert (=> d!99019 (= lt!319417 e!403394)))

(declare-fun c!79151 () Bool)

(assert (=> d!99019 (= c!79151 (and ((_ is Intermediate!7074) lt!319416) (undefined!7886 lt!319416)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40694 (_ BitVec 32)) SeekEntryResult!7074)

(assert (=> d!99019 (= lt!319416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99019 (validMask!0 mask!3328)))

(assert (=> d!99019 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319417)))

(declare-fun b!718599 () Bool)

(declare-fun c!79152 () Bool)

(declare-fun lt!319418 () (_ BitVec 64))

(assert (=> b!718599 (= c!79152 (= lt!319418 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!718599 (= e!403392 e!403393)))

(declare-fun b!718600 () Bool)

(assert (=> b!718600 (= e!403393 (MissingZero!7074 (index!30666 lt!319416)))))

(declare-fun b!718601 () Bool)

(assert (=> b!718601 (= e!403394 e!403392)))

(assert (=> b!718601 (= lt!319418 (select (arr!19474 a!3186) (index!30666 lt!319416)))))

(declare-fun c!79153 () Bool)

(assert (=> b!718601 (= c!79153 (= lt!319418 k0!2102))))

(declare-fun b!718602 () Bool)

(assert (=> b!718602 (= e!403394 Undefined!7074)))

(assert (= (and d!99019 c!79151) b!718602))

(assert (= (and d!99019 (not c!79151)) b!718601))

(assert (= (and b!718601 c!79153) b!718597))

(assert (= (and b!718601 (not c!79153)) b!718599))

(assert (= (and b!718599 c!79152) b!718600))

(assert (= (and b!718599 (not c!79152)) b!718598))

(declare-fun m!674203 () Bool)

(assert (=> b!718598 m!674203))

(declare-fun m!674205 () Bool)

(assert (=> d!99019 m!674205))

(assert (=> d!99019 m!674129))

(declare-fun m!674207 () Bool)

(assert (=> d!99019 m!674207))

(declare-fun m!674209 () Bool)

(assert (=> d!99019 m!674209))

(declare-fun m!674211 () Bool)

(assert (=> d!99019 m!674211))

(assert (=> d!99019 m!674209))

(declare-fun m!674213 () Bool)

(assert (=> d!99019 m!674213))

(declare-fun m!674215 () Bool)

(assert (=> b!718601 m!674215))

(assert (=> b!718494 d!99019))

(declare-fun d!99029 () Bool)

(declare-fun res!481033 () Bool)

(declare-fun e!403399 () Bool)

(assert (=> d!99029 (=> res!481033 e!403399)))

(assert (=> d!99029 (= res!481033 (= (select (arr!19474 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99029 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403399)))

(declare-fun b!718607 () Bool)

(declare-fun e!403400 () Bool)

(assert (=> b!718607 (= e!403399 e!403400)))

(declare-fun res!481034 () Bool)

(assert (=> b!718607 (=> (not res!481034) (not e!403400))))

(assert (=> b!718607 (= res!481034 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19895 a!3186)))))

(declare-fun b!718608 () Bool)

(assert (=> b!718608 (= e!403400 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99029 (not res!481033)) b!718607))

(assert (= (and b!718607 res!481034) b!718608))

(assert (=> d!99029 m!674161))

(declare-fun m!674217 () Bool)

(assert (=> b!718608 m!674217))

(assert (=> b!718498 d!99029))

(declare-fun d!99031 () Bool)

(assert (=> d!99031 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718497 d!99031))

(declare-fun d!99033 () Bool)

(declare-fun lt!319430 () (_ BitVec 32))

(declare-fun lt!319429 () (_ BitVec 32))

(assert (=> d!99033 (= lt!319430 (bvmul (bvxor lt!319429 (bvlshr lt!319429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99033 (= lt!319429 ((_ extract 31 0) (bvand (bvxor (select (arr!19474 a!3186) j!159) (bvlshr (select (arr!19474 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99033 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!481035 (let ((h!14519 ((_ extract 31 0) (bvand (bvxor (select (arr!19474 a!3186) j!159) (bvlshr (select (arr!19474 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61680 (bvmul (bvxor h!14519 (bvlshr h!14519 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61680 (bvlshr x!61680 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!481035 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!481035 #b00000000000000000000000000000000))))))

(assert (=> d!99033 (= (toIndex!0 (select (arr!19474 a!3186) j!159) mask!3328) (bvand (bvxor lt!319430 (bvlshr lt!319430 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!718496 d!99033))

(declare-fun d!99039 () Bool)

(assert (=> d!99039 (= (validKeyInArray!0 (select (arr!19474 a!3186) j!159)) (and (not (= (select (arr!19474 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19474 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718495 d!99039))

(declare-fun d!99041 () Bool)

(assert (=> d!99041 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63954 d!99041))

(declare-fun d!99049 () Bool)

(assert (=> d!99049 (= (array_inv!15270 a!3186) (bvsge (size!19895 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63954 d!99049))

(check-sat (not bm!34731) (not b!718608) (not b!718551) (not bm!34734) (not b!718598) (not d!99019) (not b!718553) (not b!718552) (not b!718537) (not b!718536))
(check-sat)
